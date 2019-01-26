#include "projectsservice.h"

#include <QCryptographicHash>
#include <QDataStream>
#include <QQmlContext>

using namespace std;
using namespace evernote::edam;
using namespace EverDo;

ProjectsService::ProjectsService(QQmlApplicationEngine& engine, QObject *parent)
    : QObject(parent)
{
    engine.rootContext()->setContextProperty("projectsService", this);
}

void ProjectsService::onTagsFetched(const std::vector<Tag>& tags) {
    QVariantList projectList, parentsList;
    QMap<string, QVariant> parentsMap;
    map<string, const Tag&> tagsByGuid;

    for(const auto& tag: tags){
        tagsByGuid.emplace(tag.guid, tag);
    }

    for(const auto& tag: tags){
        if(0 == tag.name.find("*")){
            projectList.push_back(makeProjectObject(tag));

            const auto& parentTag = tagsByGuid.at(tag.parentGuid);
            parentsMap.insert(parentTag.guid, makeParentObject(parentTag));
        }
    }

    const QList<QVariant>& parents = parentsMap.values();
    parentsList.append(parents);

    emit setFetchedCategories(parentsList);
    emit setFetchedProjects(projectList);
}

QVariantMap ProjectsService::makeProjectObject(const Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name.substr(1)));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));
    returnValue.insert("type", QVariant(static_cast<int>(hash<Guid>{}(tag.parentGuid))));

    return returnValue;
}

QVariantMap ProjectsService::makeParentObject(const Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));

    return returnValue;
}
