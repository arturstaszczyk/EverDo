#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>
#include <QDebug>
#include "constants.h"

#include "evernote/evernote.h"
#include "everdo/projectsservice.h"

using namespace EverDo;

class FastListener: public QObject {

public slots:
    void onDispatched(QString type, QJSValue message){
        (void)message;
        qDebug() << "Received: " << type;
    }

    void onUser(evernote::edam::User user){
        qDebug() << "Evernote reported user " << user.username.c_str() << " logged in!";
    }
};


int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");

//    /std::unique_ptr<FastListener> listener(new FastListener());

    EverDo::Evernote evernote;
    EverDo::ProjectsService projectsService(dispatcher);
//    QObject::connect(evernote, &Evernote::userFetched, listener.get(), &FastListener::onUser);
    QObject::connect(&evernote, &Evernote::tagsFetched, &projectsService, &ProjectsService::onTagsFetched);

    evernote.fetchTags();

    return app.exec();
}
