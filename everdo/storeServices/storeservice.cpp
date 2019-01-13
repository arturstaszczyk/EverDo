#include "storeservice.h"

#include <QQmlContext>

using namespace EverDo;

StoreService::StoreService(QQmlApplicationEngine& engine, const Config& config,
                           StorePersist::StoreType type, QObject *parent)
    : QObject(parent)
    , store(StorePersist::createStore(type))
    , config(config)
{
    engine.rootContext()->setContextProperty("storeService", this);
}

void StoreService::saveStore(QString data) const {
    store->saveStore(data, QString::fromStdString(config.storageKey), QString::fromStdString(config.passwordKey));
}

QString StoreService::loadStore() const {
    return store->loadStore(QString::fromStdString(config.storageKey), QString::fromStdString(config.passwordKey));
}
