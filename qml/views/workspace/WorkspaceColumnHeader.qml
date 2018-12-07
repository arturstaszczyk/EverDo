import QtQuick 2.9
import "../common"
import "../common/theme.js" as Theme

SpaceCointainer {
    property alias text: columnHeader.text

    color: Theme.evernoteWhite

    PrimaryText {
        id: columnHeader
        anchors.fill: parent

        text: columnData.name
    }
}
