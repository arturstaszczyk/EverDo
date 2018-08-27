import QtQuick 2.0
import QtQml.Models 2.3

Rectangle {

    property alias text: itemText.text

    property int guid

    property int headerGuid

    id: item

    color: "yellow"

    Text {
        id: itemText

        anchors.fill: parent
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }

    Component.onCompleted: {
        item.DelegateModel.inRightType = guid === headerGuid
    }
}
