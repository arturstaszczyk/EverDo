import QtQuick 2.9

Item {

    property alias title: noteSummary.text

    Rectangle {
        anchors.fill: parent

        Text {
            id: noteSummary
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
        }
    }
}
