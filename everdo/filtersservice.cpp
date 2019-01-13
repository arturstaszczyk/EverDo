#include "filtersservice.h"

#include <QQmlContext>

using namespace std;
using namespace evernote::edam;
using namespace EverDo;

FiltersService::FiltersService(QQmlApplicationEngine &engine, QObject *parent)
    : QObject(parent)
{
    engine.rootContext()->setContextProperty("filtersService", this);
}

void FiltersService::onTagsFetched(const std::vector<Tag>& tags) {
    QVariantList filtersList;

    for(const auto& tag: tags){
        if(0 == tag.name.find("#")){
            filtersList.push_back(makeFilterObject(tag));
        }
    }

    emit setFetchedFilters(filtersList);
}

QVariantMap FiltersService::makeFilterObject(const evernote::edam::Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name.substr(1)));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));

    return returnValue;
}
