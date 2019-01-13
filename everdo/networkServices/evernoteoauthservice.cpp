#include "evernoteoauthservice.h"
#include <QtNetwork>
#include <QQmlContext>

static void setSslConfig(QNetworkRequest& request, QString url) {
    QSslConfiguration sslConfig = QSslConfiguration::defaultConfiguration();
    sslConfig.setProtocol(QSsl::TlsV1_2);
    request.setSslConfiguration(sslConfig);
    request.setUrl(QUrl(url));
}

using namespace EverDo;

 EvernoteOauthService::EvernoteOauthService(QQmlApplicationEngine &engine, const EverDo::Config& config, QObject *parent)
    : QObject(parent)
    , config(config)
{
    engine.rootContext()->setContextProperty("evernoteOauthService", this);
}

void EvernoteOauthService::authenticate() {
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

void EvernoteOauthService::fetchToken(QString temporaryToken, QString authVerifier) {
    auto credentialsUrlBase = config.urlBase() +
                "/oauth?oauth_consumer_key=" + config.consumerKey +
                "&oauth_signature=" + config.consumerSecret +
                "&oauth_signature_method=PLAINTEXT";
    auto permanentCredUrl = credentialsUrlBase +
            "&oauth_token=" + temporaryToken.toStdString() +
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
        emit oauthTokenFetched(token);
    });

    manager->get(request);
}
