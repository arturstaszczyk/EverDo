import QtQuick 2.0
import QtQml.Models 2.3

Rectangle {

    property alias text: itemText.text

    property int typeGuid

    property int parentG

    id: item

    color: "yellow"

    Text {
        id: itemText

        anchors.fill: parent
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }

    Component.onCompleted: {
        item.DelegateModel.inRightType = Qt.binding(function() { return model.type === parentG })
        console.log(model.type + " " + parentG)
    }
}
