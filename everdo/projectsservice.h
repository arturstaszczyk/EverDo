#ifndef PROJECTSSERVICE_H
#define PROJECTSSERVICE_H

#include <QObject>
#include <QFAppDispatcher>

#include <evernote-sdk/Types_types.h>

namespace EverDo {

class ProjectsService : public QObject
{
    Q_OBJECT
public:
    explicit ProjectsService(QFAppDispatcher* appDispatcher, QObject *parent = nullptr);

signals:

public slots:
    void onTagsFetched(const std::vector<evernote::edam::Tag>& tags);

private:
    QVariantMap makeProjectObject(const evernote::edam::Tag& tag);
    QVariantMap makeParentObject(const evernote::edam::Tag& tag);

private:
    QFAppDispatcher* appDispatcher;

};

}

#endif // PROJECTSSERVICE_H
