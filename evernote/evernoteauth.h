#ifndef EVERNOTEAUTH_H
#define EVERNOTEAUTH_H

#include <QObject>
#include "constants.h"

namespace EverDo {

class EvernoteAuth : public QObject
{
    Q_OBJECT
public:
    explicit EvernoteAuth(const EverDo::Config& config, QObject *parent = nullptr);

    void authenticate();

signals:
    void temporaryTokenFetched(QString tempToken);

public slots:

private:
    const Config& config;
};

}

#endif // EVERNOTEAUTH_H
