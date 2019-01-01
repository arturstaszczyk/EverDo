#include "storeaccessor.h"

#include <mutex>
#include <memory>
#include <QDebug>

using namespace EverDo;

static std::mutex gAccessMutex;
static std::unique_ptr<StoreAccessor> gInstance;

StoreAccessor::StoreAccessor(QQmlApplicationEngine &engine, QObject *parent)
    : QObject(parent)
    , qmlEngine(engine)
{

}

StoreAccessor& StoreAccessor::instance() {
    std::lock_guard<std::mutex> guard(gAccessMutex);

    if(!gInstance)
        throw std::runtime_error("StoreAccessor not initialized");

    return *gInstance;
}

StoreAccessor& StoreAccessor::instance(QQmlApplicationEngine& engine) {
    std::lock_guard<std::mutex> guard(gAccessMutex);
    gInstance.reset(new StoreAccessor(engine));
    return *gInstance;
}

