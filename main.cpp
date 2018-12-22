#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>
#include <QDebug>
#include "constants.h"

#include "evernote/evernote.h"
#include "everdo/projectsservice.h"
#include "everdo/columnsservice.h"

using namespace EverDo;

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");


    EverDo::Evernote evernote;
    EverDo::ProjectsService projectsService(*dispatcher);
    EverDo::ColumnsService columnsService(*dispatcher);
    QObject::connect(&evernote, &Evernote::tagsFetched, &columnsService, &ColumnsService::onTagsFetched);
    QObject::connect(&evernote, &Evernote::tagsFetched, &projectsService, &ProjectsService::onTagsFetched);

    evernote.fetchTags();

    return app.exec();
}
