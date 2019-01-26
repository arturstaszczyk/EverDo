#include "evernoteapiservice.h"

#include <QQmlContext>

using namespace EverDo;

EvernoteApiService::EvernoteApiService(QQmlApplicationEngine &engine, Evernote &evernote, QObject* parent)
    : QObject(parent)
    , evernote(evernote)
{
    engine.rootContext()->setContextProperty("evernoteApiService", this);
}

void EvernoteApiService::fetchUserMetadata() const {
    evernote.fetchUser();
}

void EvernoteApiService::fetchUserContent() const
{
    evernote.fetchTags();
}
