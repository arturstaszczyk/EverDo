import QtQuick 2.9
import "../common"
import "../common/theme.js" as Theme

SpaceCointainer {

    property alias text: headerLabel.text

    property bool selected

    noBorder: true

    Rectangle {
        color: selected ? Theme.evernoteButtonHighlight : Theme.evernoteButton
        border.width: 0
        border.color: selected ? Theme.evernoteButton : Theme.evernoteButtonHighlight
        anchors.fill: parent

        PrimaryText {
            id: headerLabel
            anchors.fill: parent

            color: selected ? Theme.evernoteButton : Theme.evernoteButtonHighlight
        }
    }
}
