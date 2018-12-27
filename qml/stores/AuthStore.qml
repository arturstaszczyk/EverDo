import QtQuick 2.9
import QuickFlux 1.1
import '../actions/auth'

Store {
    property string temporaryToken: ""
    property string authToken: ""
    property bool authenticated: false

    Filter {
        type: AuthActionTypes.setTemporaryToken
        onDispatched: {
           temporaryToken = message.temporaryToken
        }
    }
}
