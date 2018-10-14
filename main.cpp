#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFAppDispatcher>
#include <QuickFlux>

#include <Python.h>

int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");

    QGuiApplication app(argc, argv);

    registerQuickFluxQmlTypes(); // It is not necessary to call this function if the QuickFlux library is installed via qpm

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    QFAppDispatcher* dispatcher = QFAppDispatcher::instance(&engine);
    dispatcher->dispatch("startApp");

    Py_SetProgramName(argv[0]);  /* optional but recommended */
    Py_Initialize();
    PyRun_SimpleString("from time import time,ctime\n"
                         "print 'Today is',ctime(time())\n");
    Py_Finalize();

    return app.exec();
}
