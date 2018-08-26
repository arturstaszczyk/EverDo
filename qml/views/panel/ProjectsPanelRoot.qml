import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"

Item {
    width: 150

    Rectangle {
        anchors.fill: parent

        color: "blue"

        Column {
            anchors.fill: parent

            Repeater {

                model: MainStore.projectsPanelStore.projectTypes

                SliderDropDown {
                    headerText: model.name

                    headerHeight: 22
                    width: parent.width
                }
            }
        }

    }
}
