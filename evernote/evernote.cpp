#include "evernote.h"

#include <QDebug>
#include <QThread>

#include "asyncfuture.h"
#include "everdo/storeaccessor.h"
#include "everdo/keychainstorepersist.h"

#include "evernote-sdk/NoteStore.h"
#include "thrift/protocol/TBinaryProtocol.h"
#include "thrift/transport/THttpClient.h"
#include "thrift/transport/TSSLSocket.h"


using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;
using namespace evernote::edam;
using namespace EverDo;
using namespace std;

Evernote::Evernote(QObject *parent)
    : QObject(parent)
    , sslSocketFactory(new TSSLSocketFactory())
    , userStoreClient(nullptr)
    , threadPool(new QThreadPool(this))
{
    // According to https://www.openssl.org/docs/faq.html#PROG1
    // all SSL calls within OpenSSL Library must be done from the same thread
    threadPool->setExpiryTimeout(-1);
    threadPool->setMaxThreadCount(1);

    config.loadConfig();
    auth = new EvernoteAuth(config, this);

    configureNoteStore();
    configureUserStore();
}

std::string Evernote::getAuthToken() {
    auto authenticated = StoreAccessor::instance().getPropertyFromStore<bool>("authStore", "authenticated");
    auto token = StoreAccessor::instance().getPropertyFromStore<QString>("authStore", "authToken");

    if(authenticated && !token.isEmpty()) {
        qDebug() << "Using REAL auth token";
        return token.toStdString();
    } else {
        qDebug() << "Using DEV auth token";
        return config.devToken;
    }
}


void Evernote::configureUserStore() {
    // In order to establish SSL socket this hack was used
    // https://discussion.evernote.com/topic/23931-could-not-refill-buffer/
    // https://webcache.googleusercontent.com/search?q=cache:sYd399Msd5sJ:https://discussion.evernote.com/topic/23931-could-not-refill-buffer/+&cd=1&hl=en&ct=clnk&gl=pl
    auto sslSocketUserStore = sslSocketFactory->createSocket("sandbox.evernote.com", 443);
    auto bufferedTransport = shared_ptr<TBufferedTransport>(new TBufferedTransport(sslSocketUserStore));
    auto userStoreHttpClient = shared_ptr<THttpClient>(new THttpClient(bufferedTransport, config.endpoint, config.userStorePath));
    userStoreHttpClient->open();

    auto userStoreProtocol = shared_ptr<TBinaryProtocol>(new TBinaryProtocol(userStoreHttpClient));
    userStoreClient.reset(new UserStoreClient(userStoreProtocol));
}

void Evernote::configureNoteStore() {
    auto sslSocketNoteStore = sslSocketFactory->createSocket("sandbox.evernote.com", 443);
    auto bufferedTransport = shared_ptr<TBufferedTransport>(new TBufferedTransport(sslSocketNoteStore));
    auto noteStoreHttpClient = shared_ptr<THttpClient>(new THttpClient(bufferedTransport, config.endpoint, config.noteStorePath));
    noteStoreHttpClient->open();

    auto noteStoreProtocol = shared_ptr<TBinaryProtocol>(new TBinaryProtocol(noteStoreHttpClient));
    noteStoreClient.reset(new NoteStoreClient(noteStoreProtocol));
}

void Evernote::authenticate() {
    QObject::connect(auth, &EvernoteAuth::temporaryTokenFetched, [&](QString tempToken){
        emit temporaryTokenFetched(tempToken);
    });

    auth->authenticate();
}

void Evernote::fetchToken(QString oauthVerifier) {
    QObject::connect(auth, &EvernoteAuth::tokenFetched, [&](QString token){
        emit tokenFetched(token);
    });

    auth->fetchToken(oauthVerifier);
}

void Evernote::saveStore(QString data) {
    KeychainStorePersist keychainPersist;
    keychainPersist.saveStore(data, QString::fromStdString(config.storageKey), QString::fromStdString(config.passwordKey));
}

QString Evernote::loadStore() {
    KeychainStorePersist keychainPersist;
    return keychainPersist.loadStore(QString::fromStdString(config.storageKey), QString::fromStdString(config.passwordKey));
}

void Evernote::fetchUser() {
    auto userFuture = QtConcurrent::run(threadPool, [=]() {
        qDebug() << "Fetching user on thread " << QThread::currentThreadId();
        userStoreClient->getUser(user, getAuthToken());
        qDebug() << "Evernote fetched user: " << user.username.c_str();
        return user;
    });

    auto urlFuture = QtConcurrent::run(threadPool, [=]() {
        userStoreClient->getUserUrls(userUrls, getAuthToken());
        qDebug() << "Evernote fetched urls: " << userUrls.noteStoreUrl.c_str();
        return userUrls;
    });

    AsyncFuture::observe(userFuture).subscribe([=](const User& user) {
        emit userFetched(user);
    });

    AsyncFuture::observe(urlFuture).subscribe([=](const UserUrls& url){
        emit urlsFetched(url);
    });
}

void Evernote::fetchTags() {
    auto future = QtConcurrent::run(threadPool, [=]() {
        qDebug() << "Fetching tags on thread " << QThread::currentThreadId();
        vector<evernote::edam::Tag> tags;
        noteStoreClient->listTags(tags, getAuthToken());
        return tags;
    });

    AsyncFuture::observe(future).subscribe([=](const vector<Tag>& tagsList) {
        emit tagsFetched(tagsList);
    });
}

void Evernote::fetchFiltersList(){

}

void Evernote::fetchColumnsList() {

}

void Evernote::fetchNotesList(){

}
