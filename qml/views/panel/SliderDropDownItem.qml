import QtQuick 2.0
import QtQml.Models 2.3

import "../common"
import "../common/theme.js" as Theme
import "../../actions"

Rectangle {

    property alias text: itemText.text

    property int guid

    id: item

    color: Theme.evernoteSecondaryGreen

    PrimaryText {
        id: itemText
        anchors.fill: parent

        color: Theme.evernoteWhite
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            ProjectsPanelActions.selectProject(guid, text)
        }
    }
}
