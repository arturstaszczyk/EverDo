#ifndef EVERNOTE_H
#define EVERNOTE_H

#include <QObject>
#include <QFuture>
#include <QtConcurrent>

#include "evernote-sdk/Types_types.h"
#include "evernote-sdk/UserStore.h"
#include "evernote-sdk/NoteStore.h"

#include "thrift/transport/TSSLSocket.h"

#include "constants.h"
#include "evernoteauth.h"

namespace EverDo {

    class Evernote : public QObject
    {
        Q_OBJECT
    public:
        explicit Evernote(QObject *parent = nullptr);

    signals:
        void userFetched(evernote::edam::User);
        void urlsFetched(evernote::edam::UserUrls);
        void tagsFetched(const std::vector<evernote::edam::Tag>&);

        void temporaryTokenFetched(QString& tempToken);

    public slots:
        void authenticate();
        void fetchTags();
        void fetchFiltersList();
        void fetchColumnsList();
        void fetchNotesList();

    private:
        void configureUserStore();
        void configureNoteStore();
        void getUser();

    private:
        std::shared_ptr<apache::thrift::transport::TSSLSocketFactory> sslSocketFactory;
        std::shared_ptr<evernote::edam::UserStoreClient> userStoreClient;
        std::shared_ptr<evernote::edam::NoteStoreClient> noteStoreClient;

        evernote::edam::User user;
        evernote::edam::UserUrls userUrls;

        QThreadPool* threadPool;
        EverDo::EvernoteAuth *auth;
        EverDo::Config config;
    };

}

#endif // EVERNOTE_H
