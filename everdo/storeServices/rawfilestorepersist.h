#ifndef RAWFILESTOREPERSIST_H
#define RAWFILESTOREPERSIST_H

#include <QObject>

#include "storepersist.h"

namespace EverDo {

class RawFileStorePersist : public StorePersist
{
public:
    RawFileStorePersist();

    virtual void saveStore(QString data, QString storage, QString key) const override;
    virtual QString loadStore(QString storage, QString key) const override;

};

}

#endif // RAWFILESTOREPERSIST_H
