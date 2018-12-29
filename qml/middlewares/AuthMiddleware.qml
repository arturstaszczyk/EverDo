import QtQuick 2.9
import QuickFlux 1.1
import '../actions/auth'

Middleware {
    function dispatch(type, message) {

        if (type === AuthActionTypes.login) {
            evernote.authenticate()
        }

        if(type === AuthActionTypes.setAuthVerifier) {
            evernote.fetchToken(message.tempToken, message.oauthVerifier)
        }

        next(type, message);
    }

}
