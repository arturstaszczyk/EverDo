#include "storeaccessor.h"

#include <memory>
#include <QDebug>

using namespace EverDo;

static std::unique_ptr<StoreAccessor> gInstance;

StoreAccessor::StoreAccessor(QQmlApplicationEngine &engine, QObject *parent)
    : QObject(parent)
    , qmlEngine(engine)
{

}

StoreAccessor& StoreAccessor::instance() {
    if(!gInstance)
        throw std::runtime_error("StoreAccessor not initialized");

    return *gInstance;
}

StoreAccessor& StoreAccessor::instance(QQmlApplicationEngine& engine) {
    gInstance.reset(new StoreAccessor(engine));
    return *gInstance;
}

