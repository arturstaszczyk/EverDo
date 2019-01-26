#ifndef EVERNOTEAPISERVICE_H
#define EVERNOTEAPISERVICE_H

#include <QObject>
#include <QQmlApplicationEngine>

#include "evernote/evernote.h"

namespace EverDo {

class EvernoteApiService: public QObject
{
    Q_OBJECT
public:
    EvernoteApiService(QQmlApplicationEngine& engine, Evernote& evernote, QObject* parent = nullptr);

    Q_INVOKABLE void fetchUserMetadata() const;
    Q_INVOKABLE void fetchUserContent() const;

private:
    Evernote& evernote;
};

}

#endif // EVERNOTEAPISERVICE_H
