import QtQuick 2.3
import QtQuick.Window 2.2
import QuickFlux 1.1

import "./views"
import "./stores"
import "./actions"
import "./middlewares"
import "./views/common/theme.js" as Theme

Window {
    width: 1024
    height: 640
    visible: true

    property int leftPanelSize: 200

    color: Theme.evernotePrimaryGreen

    CoreApp {
        anchors.fill: parent
        anchors.margins: Theme.basicElementSpacing

        visible: MainStore.authStore.authenticated
    }

    LoginView {
        anchors.fill: parent
        visible: !MainStore.authStore.authenticated
    }
}

