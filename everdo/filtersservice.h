#ifndef FILTERSSERVICE_H
#define FILTERSSERVICE_H

#include <QObject>
#include <QQmlApplicationEngine>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class FiltersService : public QObject
{
    Q_OBJECT
public:
    explicit FiltersService(QQmlApplicationEngine& engine, QObject *parent = nullptr);

signals:
    void setFetchedFilters(QVariantList filters);

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeFilterObject(const evernote::edam::Tag& tag);

};

}
#endif // FILTERSSERVICE_H
