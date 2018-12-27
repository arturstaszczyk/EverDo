import QtQuick 2.0
import "theme.js" as Theme

Rectangle {
    id: mainButton

    property string title

    signal clicked()

    color: mouseArea.pressed ? Theme.evernoteButtonHighlight : Theme.evernoteButton
    radius: 4

    border.width: 2
    border.color: mouseArea.pressed ? Theme.evernoteButton : Theme.evernoteButtonHighlight

    PrimaryText {
        anchors.fill: parent
        text: title

        color: mouseArea.pressed ? Theme.evernoteButton : Theme.evernoteButtonHighlight
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            mainButton.clicked()
        }
    }
}
