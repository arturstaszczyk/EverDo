#include "projectsservice.h"

#include <QCryptographicHash>
#include <QDataStream>

#include "everdo/DataObjects/project.h"

using namespace EverDo;
using namespace std;
using namespace evernote::edam;

ProjectsService::ProjectsService(QFAppDispatcher* appDispatcher, QObject *parent)
    : QObject(parent)
    , appDispatcher(appDispatcher)
{

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
    appDispatcher->dispatch("projectsUpdated", QVariantMap({
                                                               make_pair("projects", projectList),
                                                               make_pair("parents", parentsList)
                                                           }));
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
