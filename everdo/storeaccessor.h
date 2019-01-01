#ifndef STOREACCESSOR_H
#define STOREACCESSOR_H

#include <QObject>
#include <QVariant>
#include <QQmlApplicationEngine>

namespace EverDo {

class StoreAccessor : public QObject
{
    Q_OBJECT
public:
    static StoreAccessor& instance();
    static StoreAccessor& instance(QQmlApplicationEngine& engine);

    template
    <typename T>
    T getPropertyFromStore(QString store, QString property);

signals:

public slots:

private:
    explicit StoreAccessor(QQmlApplicationEngine& engine, QObject *parent = nullptr);

    QQmlApplicationEngine& qmlEngine;
};

template
<typename T>
T StoreAccessor::getPropertyFromStore(QString store, QString property) {
    QVariant retValue;
    auto rootStoreObj = qmlEngine.rootObjects().first()->property("mainStore").value<QObject*>();
    if(rootStoreObj) {
        auto storeObj = rootStoreObj->property(store.toStdString().c_str()).value<QObject*>();
        if(storeObj) {
            retValue = storeObj->property(property.toStdString().c_str());
        }
    }

    if(!retValue.isValid()){
        throw std::runtime_error("Failed to fetch store singleton from QML");
    }

    return retValue.value<T>();
}

}
#endif // STOREACCESSOR_H
