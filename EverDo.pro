TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    evernote_sdk/Errors_constants.cpp \
    evernote_sdk/Errors_types.cpp \
    evernote_sdk/Limits_constants.cpp \
    evernote_sdk/Limits_types.cpp \
    evernote_sdk/NoteStore_constants.cpp \
    evernote_sdk/NoteStore_types.cpp \
    evernote_sdk/NoteStore.cpp \
    evernote_sdk/Types_constants.cpp \
    evernote_sdk/Types_types.cpp \
    evernote_sdk/UserStore_constants.cpp \
    evernote_sdk/UserStore_types.cpp \
    evernote_sdk/UserStore.cpp

RESOURCES += qml.qrc

INCLUDEPATH += /usr/local/Cellar/python@2/2.7.14_3/Frameworks/Python.framework/Versions/2.7/include/python2.7 /usr/local/Cellar/python@2/2.7.14_3/Frameworks/Python.framework/Versions/2.7/include/python2.7
INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/opt/python@2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -lpython2.7 -ldl -framework CoreFoundation
LIBS += -L/usr/local/lib -lthrift

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml

# If you install QuickFlux by qpm.pri, change it to include(vendor/vendor.pri)
include($$PWD/quickflux/quickflux.pri)

DISTFILES += \
    README.md

HEADERS += \
    evernote_sdk/Errors_constants.h \
    evernote_sdk/Errors_types.h \
    evernote_sdk/Limits_constants.h \
    evernote_sdk/Limits_types.h \
    evernote_sdk/NoteStore_constants.h \
    evernote_sdk/NoteStore_types.h \
    evernote_sdk/NoteStore.h \
    evernote_sdk/Types_constants.h \
    evernote_sdk/Types_types.h \
    evernote_sdk/UserStore_constants.h \
    evernote_sdk/UserStore_types.h \
    evernote_sdk/UserStore.h
