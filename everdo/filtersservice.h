#ifndef FILTERSSERVICE_H
#define FILTERSSERVICE_H

#include <QObject>
#include <QFAppDispatcher>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class FiltersService : public QObject
{
    Q_OBJECT
public:
    explicit FiltersService(QFAppDispatcher& appDispatcher, QObject *parent = nullptr);

signals:

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeFilterObject(const evernote::edam::Tag& tag);

private:
    QFAppDispatcher& appDispatcher;
};

}
#endif // FILTERSSERVICE_H
