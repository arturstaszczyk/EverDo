import QtQuick 2.9
import QuickFlux 1.1
import '../actions/auth'

Middleware {
    function dispatch(type, message) {

        if (type === AuthActionTypes.login) {
            evernote.authenticate()
        }

        next(type, message);
    }

}
