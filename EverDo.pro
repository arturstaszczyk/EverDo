TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

INCLUDEPATH += /usr/local/Cellar/python@2/2.7.14_3/Frameworks/Python.framework/Versions/2.7/include/python2.7 /usr/local/Cellar/python@2/2.7.14_3/Frameworks/Python.framework/Versions/2.7/include/python2.7
LIBS += -L/usr/local/opt/python@2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -lpython2.7 -ldl -framework CoreFoundation

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml

# If you install QuickFlux by qpm.pri, change it to include(vendor/vendor.pri)
include($$PWD/quickflux/quickflux.pri)

DISTFILES += \
    README.md
