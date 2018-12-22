#include "columnsservice.h"

using namespace std;
using namespace evernote::edam;
using namespace EverDo;

ColumnsService::ColumnsService(QFAppDispatcher& appDispatcher, QObject *parent)
    : QObject(parent)
    , appDispatcher(appDispatcher) {

}

void ColumnsService::onTagsFetched(const std::vector<evernote::edam::Tag>& tags) {
    QVariantList columnsList;

    for(const auto& tag: tags){
        if(0 == tag.name.find("@")){
            columnsList.push_back(makeColumnObject(tag));
        }
    }

    appDispatcher.dispatch("columnsUpdated", QVariantMap({
                                                               make_pair("columns", columnsList)
                                                           }));
}

QVariantMap ColumnsService::makeColumnObject(const Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name.substr(1)));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));

    return returnValue;
}
