#include "temporarytokenservice.h"

#include <QDebug>

using namespace EverDo;

TemporaryTokenService::TemporaryTokenService(QFAppDispatcher& appDispatcher, QObject *parent)
    : QObject(parent)
    , appDispatcher(appDispatcher)
{

}

void TemporaryTokenService::onTemporaryTokenFetched(QString tempToken) {
    auto param = QVariantMap({std::make_pair("temporaryToken", tempToken)});
    qDebug() << param;

    appDispatcher.dispatch("setTemporaryToken", param);
}
