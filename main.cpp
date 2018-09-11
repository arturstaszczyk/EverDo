#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    char* a[0];
    int b = 0;
    QGuiApplication app(b, a);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");

    return app.exec();
}
