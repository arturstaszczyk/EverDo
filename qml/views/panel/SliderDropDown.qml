import QtQuick 2.9

Item {
    height: 50

    Rectangle {
        anchors.fill: parent
        color: "red"

        Text {
            anchors.fill: parent
            text: "Click me"
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
        }

        MouseArea {
            anchors.fill: parent

            onClicked: console.log("hhah")
        }
    }
}
