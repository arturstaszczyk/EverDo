#ifndef PROJECTSSERVICE_H
#define PROJECTSSERVICE_H

#include <QObject>
#include <QQmlApplicationEngine>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class ProjectsService : public QObject
{
    Q_OBJECT
public:
    explicit ProjectsService(QQmlApplicationEngine& engine, QObject *parent = nullptr);

signals:
    void setFetchedCategories(QVariantList categories);
    void setFetchedProjects(QVariantList projects);

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeProjectObject(const evernote::edam::Tag& tag);
    QVariantMap makeParentObject(const evernote::edam::Tag& tag);

};

}

#endif // PROJECTSSERVICE_H
