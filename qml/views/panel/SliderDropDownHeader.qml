import QtQuick 2.9

Item {

    property alias text: headerLabel.text

    Rectangle {
        color: "red"
        anchors.fill: parent

        Text {
            id: headerLabel

            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter

            text: headerText
        }

        MouseArea {
            anchors.fill: parent
            onClicked: console.log('Ha')
        }
    }
}
