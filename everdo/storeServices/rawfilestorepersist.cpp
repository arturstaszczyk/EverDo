#include "rawfilestorepersist.h"

#include <QFile>
#include <QDir>
#include <QDebug>

using namespace EverDo;

RawFileStorePersist::RawFileStorePersist()
{

}

void RawFileStorePersist::saveStore(QString data, QString storage, QString key) const {
    QFile file(QDir::current().filePath(storage + key + ".tmp"));
    qDebug() << "Writing to local file " << file.fileName();
    if(file.open(QFile::ReadWrite)) {
        file.write(data.toUtf8());
    }
}

QString RawFileStorePersist::loadStore(QString storage, QString key) const {
    QFile file(QDir::current().filePath(storage + key + ".tmp"));
    QString loadedStore = "";

    if(file.open(QFile::ReadOnly)) {
        auto data = file.readAll();
        qDebug() << data;
        loadedStore = QString::fromUtf8(data);
    }

    return loadedStore;
}
