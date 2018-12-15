#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>
#include <memory>
#include <QDebug>
#include <qcoreapplication.h>
#include "constants.h"

#include "evernote_sdk/UserStore.h"
#include "evernote_sdk/NoteStore.h"
#include "thrift/protocol/TBinaryProtocol.h"
#include "thrift/transport/THttpClient.h"
#include "thrift/transport/TSSLSocket.h"
#include <yaml-cpp/yaml.h>

using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;
using namespace evernote::edam;

class FastListener: public QObject {

public slots:
    void onDispatched(QString type, QJSValue message){
        (void)message;
        qDebug() << "Received: " << type;
    }
};


int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    std::unique_ptr<FastListener> listener(new FastListener());

    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    QObject::connect(dispatcher, &QFAppDispatcher::dispatched,
                     listener.get(), &FastListener::onDispatched);

    dispatcher->dispatch("startApp");

    qDebug() << "Hello world";

    auto path = QCoreApplication::applicationDirPath().toStdString() + "/../Resources/config.yaml";
    qDebug() << path.c_str();
    YAML::Node config = YAML::LoadFile(path);
    EverDo::config::devToken = config["devToken"].as<std::string>();

    //https://discussion.evernote.com/topic/23931-could-not-refill-buffer/
    //https://github.com/facebook/fbthrift/blob/master/thrift/lib/cpp/transport/THttpClient.cpp
    std::shared_ptr<TSSLSocketFactory> sslSocketFactory(new TSSLSocketFactory());

    auto sslSocketNoteStore = sslSocketFactory->createSocket("sandbox.evernote.com", 443);
    std::shared_ptr<TTransport> bufferedTransport(new TBufferedTransport(sslSocketNoteStore));

    auto noteStorePath = "/edam/user";
    auto noteStoreHttpClient = std::shared_ptr<TTransport>(new THttpClient(bufferedTransport, "sandbox.evernote.com", noteStorePath));

    noteStoreHttpClient->open();
    std::shared_ptr<TProtocol> noteStoreProtocol(new TBinaryProtocol(noteStoreHttpClient));

    evernote::edam::UserStoreClient client(noteStoreProtocol);

    User user;
    client.getUser(user, EverDo::config::devToken);

    qDebug() << "User: " << user.username.c_str();
    return app.exec();
}
