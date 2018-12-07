import QtQuick 2.0
import "theme.js" as Theme

Rectangle {
    id: toggle

    property bool selected: false
    property string title
    property int guid


    signal clicked(int toggleGuid)

    color: selected ? Theme.evernoteButtonHighlight : Theme.evernoteButton
    radius: 4

    border.width: 2
    border.color: selected ? Theme.evernoteButton : Theme.evernoteButtonHighlight

    PrimaryText {
        anchors.fill: parent
        text: title

        color: selected ? Theme.evernoteButton : Theme.evernoteButtonHighlight
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            toggle.selected = !toggle.selected
            toggle.clicked(guid)
        }
    }
}
