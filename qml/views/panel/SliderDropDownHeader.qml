import QtQuick 2.9
import "../common"
import "../common/theme.js" as Theme

SpaceCointainer {

    property alias text: headerLabel.text

    property bool highlighted

    noBorder: true

    Rectangle {
        color: highlighted ? Theme.evernoteButtonHighlight : Theme.evernoteButton
        border.width: 0
        border.color: highlighted ? Theme.evernoteButton : Theme.evernoteButtonHighlight
        anchors.fill: parent

        PrimaryText {
            id: headerLabel
            anchors.fill: parent

            color: highlighted ? Theme.evernoteButton : Theme.evernoteButtonHighlight
        }
    }
}
