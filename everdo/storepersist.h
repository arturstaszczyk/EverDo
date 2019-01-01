#ifndef STOREPERSIST_H
#define STOREPERSIST_H

#include <QString>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wweak-vtables"

namespace EverDo {

class StorePersist {
public:
    virtual ~StorePersist() {}

    virtual void saveStore(QString data, QString storage, QString key) const = 0;
    virtual QString loadStore(QString storage, QString key) const = 0;
};

}

#pragma clang diagnostic pop

#endif // STOREPERSIST_H
