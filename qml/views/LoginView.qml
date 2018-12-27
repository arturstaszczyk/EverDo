import QtQuick 2.0
import '../actions/auth'
import 'common'
import "common/theme.js" as Theme

Rectangle {
    color: "transparent"

    MainButton {
        width: 150
        height: Theme.basicElementHeight
        anchors.centerIn: parent
        title: "Login"

        onClicked: {
            AuthActions.login()
        }
    }
}
