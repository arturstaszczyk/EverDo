pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1
import "./"

ActionCreator {

    signal login()

    signal setAuthVerifier(string oauthVerifier)

    signal setTemporaryToken(string temporaryToken)

    signal setToken(string token)

}
