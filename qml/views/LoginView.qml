import QtQuick 2.9
import QtWebView 1.1

import '../actions/auth'
import "../stores"
import 'common'
import "common/theme.js" as Theme

Rectangle {
    color: "transparent"
    readonly property string oauthVerifierConst: 'oauth_verifier'

    MainButton {
        width: 150
        height: Theme.basicElementHeight
        anchors.centerIn: parent
        title: "Login"

        onClicked: {
            AuthActions.login()
        }
    }

    WebView {
        id: loginWevView

        anchors.fill: parent
        visible: MainStore.authStore.temporaryToken !== "" && MainStore.authStore.authVerifier === ""

        onVisibleChanged: {
            if(visible) {
                loginWevView.url = "https://sandbox.evernote.com/OAuth.action?oauth_token=" + MainStore.authStore.temporaryToken
            }
        }

        onUrlChanged: {
            var urlStr = url.toString()
            var oauthVerifier = ""

            if(urlStr.includes(oauthVerifierConst)) {
                console.log(urlStr)
                var params = urlStr.split('&');
                params.forEach(function(element) {
                    if(element.includes(oauthVerifierConst))
                        oauthVerifier = element.split('=')[1]
                })

                console.log(oauthVerifier)
                AuthActions.setAuthVerifier(oauthVerifier)
            }

        }
    }
}
