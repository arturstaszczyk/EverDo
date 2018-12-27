#ifndef TEMPORARYTOKENSERVICE_H
#define TEMPORARYTOKENSERVICE_H

#include <QObject>
#include <QFAppDispatcher>

namespace EverDo {

class TemporaryTokenService : public QObject
{
    Q_OBJECT
public:
    explicit TemporaryTokenService(QFAppDispatcher& appDispatcher, QObject *parent = nullptr);

signals:

public slots:
    void onTemporaryTokenFetched(QString tempToken);

private:
    QFAppDispatcher& appDispatcher;
};

}

#endif // TEMPORARYTOKENSERVICE_H
