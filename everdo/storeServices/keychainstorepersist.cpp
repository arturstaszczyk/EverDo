#include "keychainstorepersist.h"

#include <QDebug>
#include <QEventLoop>

#include "qtkeychain/keychain.h"

using namespace EverDo;

KeychainStorePersist::KeychainStorePersist()
{

}

void KeychainStorePersist::saveStore(QString data, QString storage, QString key) const {
    QKeychain::WritePasswordJob writeJob(storage);
    writeJob.setAutoDelete(false);
    writeJob.setKey(key);
    writeJob.setTextData(data);

    QEventLoop loop;
    QObject::connect( &writeJob, SIGNAL(finished(QKeychain::Job*)), &loop, SLOT(quit()) );
    writeJob.start();
    loop.exec();

    if ( writeJob.error() ) {
        qDebug() << "Storing store failed: "
                  << qPrintable(writeJob.errorString());
    }
    qDebug() << "Store stored successfully";
}

QString KeychainStorePersist::loadStore(QString storage, QString key) const {
    QKeychain::ReadPasswordJob readJob(storage);
    readJob.setAutoDelete( false );
    readJob.setKey(key);

    QEventLoop loop;
    QObject::connect( &readJob, SIGNAL(finished(QKeychain::Job*)), &loop, SLOT(quit()) );
    readJob.start();
    loop.exec();

    const QString data = readJob.textData();
    if ( readJob.error() ) {
        qDebug() << "Restoring store failed: " << readJob.errorString();
    }
    qDebug() << "Restoring store successful;";

    return data;
}
