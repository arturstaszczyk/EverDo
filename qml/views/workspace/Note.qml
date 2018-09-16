import QtQuick 2.9
import "../common"

Rectangle {

    property alias title: noteTitle.text

    id: note

    width: parent.width
    height: 30

    PrimaryText {
        id: noteTitle
        text: modelData.title

        anchors.fill: parent
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignLeft
    }
}
