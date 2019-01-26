#ifndef KEYCHAINSTOREPERSIST_H
#define KEYCHAINSTOREPERSIST_H

#include <QObject>
#include "storepersist.h"

namespace EverDo {

class KeychainStorePersist : public StorePersist
{
public:
    explicit KeychainStorePersist();

    virtual void saveStore(QString data, QString storage, QString key) const override;
    virtual QString loadStore(QString storage, QString key) const override;

};

}

#endif // KEYCHAINSTOREPERSIST_H
