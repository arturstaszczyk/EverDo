import QtQuick 2.9

Item {

    property alias text: headerLabel.text

    property bool selected

    Rectangle {
        color: selected ? "#c5e1a5" : "#2195f2"
        anchors.fill: parent

        Text {
            id: headerLabel

            color: "black"
            opacity: 0.75

            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
        }
    }
}
