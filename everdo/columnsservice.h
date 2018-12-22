#ifndef COLUMNSSERVICE_H
#define COLUMNSSERVICE_H

#include <QObject>
#include <QFAppDispatcher>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class ColumnsService : public QObject
{
    Q_OBJECT
public:
    explicit ColumnsService(QFAppDispatcher& appDispatcher, QObject *parent = nullptr);

signals:

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeColumnObject(const evernote::edam::Tag& tag);

private:
    QFAppDispatcher& appDispatcher;
};

}

#endif // COLUMNSSERVICE_H
