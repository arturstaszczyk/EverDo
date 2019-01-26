import QtQuick 2.9
import QuickFlux 1.1
import '../actions/auth'
import '../stores'

Middleware {
    function dispatch(type, message) {

        if (type === AuthActionTypes.login) {
            //evernote.authenticate()
            evernoteOauthService.authenticate();
            console.log(MainStore.authStore.authenticated)
        }

        if(type === AuthActionTypes.setAuthVerifier) {
            evernoteOauthService.fetchToken(MainStore.authStore.temporaryToken, message.oauthVerifier)
        }

        next(type, message);
    }

    Connections {
        target: evernoteOauthService

        onTemporaryTokenFetched: {
            AuthActions.setTemporaryToken(temporaryToken)
        }

        onOauthTokenFetched: {
            AuthActions.setToken(token)
        }
    }

}
