#include "columnsservice.h"

#include <QQmlContext>

using namespace std;
using namespace evernote::edam;
using namespace EverDo;

ColumnsService::ColumnsService(QQmlApplicationEngine &engine, QObject *parent)
    : QObject(parent)
{
    engine.rootContext()->setContextProperty("columnsService", this);
}

void ColumnsService::onTagsFetched(const std::vector<evernote::edam::Tag>& tags) {
    QVariantList columnsList;

    for(const auto& tag: tags){
        if(0 == tag.name.find("@")){
            columnsList.push_back(makeColumnObject(tag));
        }
    }

    emit setFetchedColumns(columnsList);
}

QVariantMap ColumnsService::makeColumnObject(const Tag& tag) {
    QVariantMap returnValue;
    returnValue.insert("name", QString::fromStdString(tag.name.substr(1)));
    returnValue.insert("guid", QVariant(static_cast<int>(hash<Guid>{}(tag.guid))));

    return returnValue;
}
