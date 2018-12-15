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

INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/lib -lthrift -lyaml-cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml

# If you install QuickFlux by qpm.pri, change it to include(vendor/vendor.pri)
include($$PWD/quickflux/quickflux.pri)

APP_CONFIG_FILES.files = config.yaml
APP_CONFIG_FILES.path = Contents/Resources
QMAKE_BUNDLE_DATA += APP_CONFIG_FILES

DISTFILES += \
    README.md \
    config.yaml

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
    evernote_sdk/UserStore.h \
    constants.h
