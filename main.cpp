#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>
#include <QDebug>
#include <QObject>
#include <QtWebEngine>
#include "constants.h"

#include "evernote/evernote.h"
#include "everdo/columnsservice.h"
#include "everdo/filtersservice.h"
#include "everdo/projectsservice.h"
#include "everdo/temporarytokenservice.h"

using namespace EverDo;

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm
    QtWebEngine::initialize();
    QQmlApplicationEngine engine;
    EverDo::Evernote evernote;

    engine.rootContext()->setContextProperty("evernote", &evernote);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");


    EverDo::TemporaryTokenService temporaryTokenService(*dispatcher);
    EverDo::ProjectsService projectsService(*dispatcher);
    EverDo::ColumnsService columnsService(*dispatcher);
    EverDo::FiltersService filtersService(*dispatcher);

    QObject::connect(&evernote, &Evernote::temporaryTokenFetched,
                     &temporaryTokenService, &TemporaryTokenService::onTemporaryTokenFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &columnsService, &ColumnsService::onTagsFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &projectsService, &ProjectsService::onTagsFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &filtersService, &FiltersService::onTagsFetched);

    evernote.fetchTags();

    return app.exec();
}
