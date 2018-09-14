import QtQuick 2.0
import "theme.js" as Theme

Rectangle {
    id: toggle

    property bool selected: false
    property string title
    property string guid

    signal clicked(string toggleGuid)

    color: selected ? Theme.primaryDarkColor : Theme.primaryLightColor

    PrimaryText {
        anchors.fill: parent
        text: title
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            toggle.selected = !toggle.selected
            toggle.clicked(guid)
        }
    }
}
