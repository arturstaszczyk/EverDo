#ifndef EVERNOTE_H
#define EVERNOTE_H

#include <QObject>
#include <QFuture>
#include <QtConcurrent>
#include <QQmlApplicationEngine>

#include "evernote-sdk/Types_types.h"
#include "evernote-sdk/UserStore.h"
#include "evernote-sdk/NoteStore.h"

#include "thrift/transport/TSSLSocket.h"
#include "thrift/transport/THttpClient.h"

#include "constants.h"

namespace EverDo {

    class Evernote : public QObject
    {
        Q_OBJECT
    public:
        explicit Evernote(QObject *parent = nullptr);

        const EverDo::Config& getConfig() { return config; }

        void fetchUser();
        void fetchTags();

    signals:
        void userFetched(evernote::edam::User);
        void urlsFetched(evernote::edam::UserUrls);
        void tagsFetched(const std::vector<evernote::edam::Tag>&);

    private:
        void configureUserStore();
        void configureNoteStore();
        std::string getAuthToken();

    private:
        std::shared_ptr<apache::thrift::transport::TSSLSocketFactory> sslSocketFactory;
        std::shared_ptr<evernote::edam::UserStoreClient> userStoreClient;
        std::shared_ptr<apache::thrift::transport::THttpClient> userStoreHttpClient;
        std::shared_ptr<evernote::edam::NoteStoreClient> noteStoreClient;
        std::shared_ptr<apache::thrift::transport::THttpClient> noteStoreHttpClient;

        evernote::edam::User user;
        evernote::edam::UserUrls userUrls;

        QThreadPool* threadPool;
        EverDo::Config config;
    };

}

#endif // EVERNOTE_H
