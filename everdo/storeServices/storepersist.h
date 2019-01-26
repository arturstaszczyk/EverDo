#ifndef STOREPERSIST_H
#define STOREPERSIST_H

#include <QString>
#include <QObject>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wweak-vtables"

namespace EverDo {

class StorePersist {

public:
    enum StoreType {
        RawFileStore,
        KeychainStore,
    };

    virtual ~StorePersist() {}

    static StorePersist* createStore(StoreType type);

    virtual void saveStore(QString data, QString storage, QString key) const = 0;
    virtual QString loadStore(QString storage, QString key) const = 0;
};

}

#pragma clang diagnostic pop

#endif // STOREPERSIST_H
