#ifndef COLUMNSSERVICE_H
#define COLUMNSSERVICE_H

#include <QObject>
#include <QFAppDispatcher>
#include <QQmlApplicationEngine>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class ColumnsService : public QObject
{
    Q_OBJECT
public:
    explicit ColumnsService(QQmlApplicationEngine& engine, QObject *parent = nullptr);

signals:
    void setFetchedColumns(QVariantList columns);

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeColumnObject(const evernote::edam::Tag& tag);
};

}

#endif // COLUMNSSERVICE_H
