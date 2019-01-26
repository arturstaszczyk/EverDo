#ifndef STORESERVICE_H
#define STORESERVICE_H

#include <memory>
#include <QObject>
#include <QQmlApplicationEngine>

#include "config.h"
#include "storepersist.h"

namespace EverDo {

class StoreService : public QObject
{
    Q_OBJECT
public:
    explicit StoreService(QQmlApplicationEngine& engine, const Config& config,
                          StorePersist::StoreType storeType, QObject *parent = nullptr);

    Q_INVOKABLE virtual void saveStore(QString data) const;
    Q_INVOKABLE virtual QString loadStore() const;

private:
    std::unique_ptr<StorePersist> store;
    const Config& config;
};

}

#endif // STORESERVICE_H
