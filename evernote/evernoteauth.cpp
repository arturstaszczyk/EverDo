#include "evernoteauth.h"

#include <QtNetwork>

using namespace EverDo;

EvernoteAuth::EvernoteAuth(const EverDo::Config& config,QObject *parent)
    : QObject(parent)
    , config(config)
{

}

void EvernoteAuth::authenticate() {
    auto accessUrlBase = config.urlBase() + "/OAuth.action?";
    auto credentialsUrlBase = config.urlBase() +
                "/oauth?oauth_consumer_key=" + config.consumerKey +
                "&oauth_signature=" + config.consumerSecret +
                "&oauth_signature_method=PLAINTEXT";
                //"&oauth_timestamp=" + QString::number(time) +
                //"&oauth_nonce=" + QString::number(millis);
    auto temporaryCredUrl = credentialsUrlBase + "&oauth_callback=nnoauth";
    auto permanentCredUrl = credentialsUrlBase + "&oauth_token=";

    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QNetworkRequest request;

    QSslConfiguration sslConfig = QSslConfiguration::defaultConfiguration();
    sslConfig.setProtocol(QSsl::TlsV1_2);
    request.setSslConfiguration(sslConfig);
    request.setUrl(QUrl(QString::fromStdString(temporaryCredUrl)));

    QObject::connect(manager, &QNetworkAccessManager::finished, [=](QNetworkReply* reply) {
        qDebug() << reply->header(QNetworkRequest::KnownHeaders::ContentTypeHeader);
        qDebug() << reply->error();
        auto tempToken = reply->readAll().split('&')[0].split('=')[1];
        emit temporaryTokenFetched(tempToken);
    });

    manager->get(request);
}
