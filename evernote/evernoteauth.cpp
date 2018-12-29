#include "evernoteauth.h"
#include "../EverDo/storeaccessor.h"

#include <QtNetwork>

static void setSslConfig(QNetworkRequest& request, QString url) {
    QSslConfiguration sslConfig = QSslConfiguration::defaultConfiguration();
    sslConfig.setProtocol(QSsl::TlsV1_2);
    request.setSslConfiguration(sslConfig);
    request.setUrl(QUrl(url));
}

using namespace EverDo;

EvernoteAuth::EvernoteAuth(const EverDo::Config& config,QObject *parent)
    : QObject(parent)
    , config(config)
{

}

void EvernoteAuth::authenticate() {
    auto credentialsUrlBase = config.urlBase() +
                "/oauth?oauth_consumer_key=" + config.consumerKey +
                "&oauth_signature=" + config.consumerSecret +
                "&oauth_signature_method=PLAINTEXT";
    auto temporaryCredUrl = credentialsUrlBase + "&oauth_callback=nnoauth";

    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QNetworkRequest request;
    setSslConfig(request, QString::fromStdString(temporaryCredUrl));

    QObject::connect(manager, &QNetworkAccessManager::finished, [=](QNetworkReply* reply) {
        qDebug() << reply->header(QNetworkRequest::KnownHeaders::ContentTypeHeader);
        qDebug() << reply->error();

        auto response = QUrl::fromPercentEncoding(reply->readAll());
        auto query = QUrlQuery(response);

        qDebug() << query.toString();

        auto tempToken = query.queryItemValue("oauth_token");
        emit temporaryTokenFetched(tempToken);
    });

    manager->get(request);
}

void EvernoteAuth::fetchToken(QString authVerifier) {
    auto tempStoreToken = StoreAccessor::instance().getPropertyFromStore<QString>("authStore", "temporaryToken");
    auto credentialsUrlBase = config.urlBase() +
                "/oauth?oauth_consumer_key=" + config.consumerKey +
                "&oauth_signature=" + config.consumerSecret +
                "&oauth_signature_method=PLAINTEXT";
    auto permanentCredUrl = credentialsUrlBase +
            "&oauth_token=" + tempStoreToken.toStdString() +
            "&oauth_verifier=" + authVerifier.toStdString();

    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QNetworkRequest request;
    setSslConfig(request, QString::fromStdString(permanentCredUrl));

    QObject::connect(manager, &QNetworkAccessManager::finished, [=](QNetworkReply* reply) {
        qDebug() << reply->header(QNetworkRequest::KnownHeaders::ContentTypeHeader);
        qDebug() << reply->error();

        auto response = QUrl::fromPercentEncoding(reply->readAll());
        auto query = QUrlQuery(response);
        qDebug() << query.toString();

        auto token = query.queryItemValue("oauth_token");
        emit tokenFetched(token);
    });

    manager->get(request);
}
