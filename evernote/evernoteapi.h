#ifndef EVERNOTEAPI_H
#define EVERNOTEAPI_H

#include <QObject>

namespace EverDo {

class EvernoteApi {

public:
    virtual ~EvernoteApi() {}

signals:
    virtual void fetchTags() = 0;
    virtual void fetchUser() = 0;
};

}

Q_DECLARE_INTERFACE(EverDo::EvernoteApi, "EvernoteApi")

#endif // EVERNOTEAPI_H
