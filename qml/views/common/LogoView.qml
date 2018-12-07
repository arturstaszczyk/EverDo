import QtQuick 2.9
import "./theme.js" as Theme

SpaceCointainer {
    noBorder: true

    PrimaryText {
        anchors.fill: parent
        text: "EverDo"

        font.pointSize: 28
        font.family: "Noteworthy"
        font.bold: true

        color: Theme.evernoteWhite

        horizontalAlignment: Qt.AlignLeft
    }
}
