#ifndef EVERNOTEOAUTHSERVICE_H
#define EVERNOTEOAUTHSERVICE_H

#include <QObject>
#include <QQmlApplicationEngine>

#include "constants.h"

namespace EverDo {

class EvernoteOauthService : public QObject
{
    Q_OBJECT
public:

    explicit EvernoteOauthService(QQmlApplicationEngine& engine, const EverDo::Config& config, QObject *parent = nullptr);

    Q_INVOKABLE void authenticate();
    Q_INVOKABLE void fetchToken(QString temporaryToken, QString authVerifier);

signals:

    void temporaryTokenFetched(QString temporaryToken);
    void oauthTokenFetched(QString token);

public slots:

private:
    const EverDo::Config& config;
};
};
#endif // EVERNOTEOAUTHSERVICE_H
