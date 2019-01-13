import QtQuick 2.9
import QuickFlux 1.1

import '../actions/auth'
import '../actions'

Store {
    property string temporaryToken: ""
    property string authVerifier: ""
    property string authToken: ""
    property bool authenticated: false

    Filter {
        type: AuthActionTypes.setTemporaryToken
        onDispatched: {
            console.log("Temp token: " + message.temporaryToken)
            temporaryToken = message.temporaryToken
        }
    }

    Filter {
        type: AuthActionTypes.setToken
        onDispatched: {
            console.log("Token: " + message.token)
            authToken = message.token
            if(authToken) {
                authenticated = true

                AppActions.fetchUser();
                AppActions.fetchEvernoteTags();
            }
        }
    }

    Filter {
        type: AuthActionTypes.setAuthVerifier
        onDispatched: {
            console.log("Verifier: " + message.oauthVerifier)
            authVerifier = message.oauthVerifier
        }
    }
}
