#include "filtersservice.h"

using namespace std;
using namespace evernote::edam;
using namespace EverDo;

FiltersService::FiltersService(QFAppDispatcher& appDispatcher, QObject *parent)
    : QObject(parent)
    , appDispatcher(appDispatcher)
{

}

void FiltersService::onTagsFetched(const std::vector<Tag>& tags) {
    QVariantList filtersList;

    for(const auto& tag: tags){
        if(0 == tag.name.find("#")){
            filtersList.push_back(makeFilterObject(tag));
        }
    }

    appDispatcher.dispatch("setFiltersDefinitions", QVariantMap({
                                                               make_pair("filters", filtersList)
                                                           }));
}

QVariantMap FiltersService::makeFilterObject(const evernote::edam::Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name.substr(1)));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));

    return returnValue;
}
