TEMPLATE = app

QT += qml quick concurrent network webengine
CONFIG += c++17
CONFIG += sdk_no_version_check

RESOURCES += qml.qrc

INCLUDEPATH += /usr/local/include
LIBS += -L/usr/local/lib -lthrift -lyaml-cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml

# If you install QuickFlux by qpm.pri, change it to include(vendor/vendor.pri)
include($$PWD/quickflux/quickflux.pri)
include($$PWD/asyncfuture/asyncfuture.pri)
include($$PWD/evernote-sdk/evernote-sdk.pri)
include($$PWD/qtkeychain/qt5keychain.pri)

APP_CONFIG_FILES.files += config.yaml
APP_CONFIG_FILES.files += config-priv.yaml
APP_CONFIG_FILES.path = Contents/Resources
QMAKE_BUNDLE_DATA += APP_CONFIG_FILES

DISTFILES += \
    README.md \
    config.yaml \
    config-priv.yaml \
    build-thrift-binaries.sh
    build-evernote-thrift.sh \

HEADERS += \
    constants.h \
    evernote/evernote.h \
    everdo/projectsservice.h \
    everdo/columnsservice.h \
    everdo/filtersservice.h \
    everdo/storeaccessor.h \
    everdo/storeServices/storepersist.h \
    everdo/storeServices/keychainstorepersist.h \
    everdo/networkServices/evernoteoauthservice.h \
    evernote/evernoteapi.h \
    everdo/storeServices/rawfilestorepersist.h \
    everdo/storeServices/storeservice.h

SOURCES += main.cpp \
    evernote/evernote.cpp \
    everdo/projectsservice.cpp \
    everdo/columnsservice.cpp \
    everdo/filtersservice.cpp \
    everdo/storeaccessor.cpp \
    everdo/storeServices/keychainstorepersist.cpp \
    everdo/networkServices/evernoteoauthservice.cpp \
    everdo/storeServices/rawfilestorepersist.cpp \
    everdo/storeServices/storepersist.cpp \
    everdo/storeServices/storeservice.cpp
