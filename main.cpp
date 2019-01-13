#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QObject>
#include <QtWebEngine>
#include "constants.h"

#include <QuickFlux>
#include <QFAppDispatcher>
#include <qfstore.h>

#include "everdo/networkServices/evernoteoauthservice.h"
#include "evernote/evernote.h"
#include "everdo/columnsservice.h"
#include "everdo/filtersservice.h"
#include "everdo/projectsservice.h"
#include "everdo/storeaccessor.h"
#include "everdo/storeServices/storeservice.h"

using namespace EverDo;

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QtWebEngine::initialize();
    QQmlApplicationEngine engine;

    StoreAccessor::instance(engine);
    Evernote evernote(engine);
    EvernoteOauthService oauthService(engine, evernote.getConfig());
    StoreService storeService(engine, evernote.getConfig(), StorePersist::StoreType::RawFileStore);
    ProjectsService projectsService(engine);
    ColumnsService columnsService(engine);
    FiltersService filtersService(engine);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");

    QObject::connect(&evernote, &Evernote::tagsFetched, &columnsService, &ColumnsService::onTagsFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &projectsService, &ProjectsService::onTagsFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &filtersService, &FiltersService::onTagsFetched);

    return app.exec();
}
