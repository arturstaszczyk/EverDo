import QtQuick 2.9
import QtQml.Models 2.3
import "../../stores"

DelegateModel {

    property int itemHeight

    model: MainStore.projectsPanelStore.projects

    Rectangle {
        id: item

        width: parent.width
        height: itemHeight

        color: "yellow"

        Text {
            id: itemText

            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter

            text: model.name
        }

    }
}
