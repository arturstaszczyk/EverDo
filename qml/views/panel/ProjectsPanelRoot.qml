import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"

Item {
    width: 150

    id: panel

    property var projectTypes: MainStore.projectsPanelStore.projectTypes

    property int selectedProjectTypeGuid: MainStore.projectsPanelStore.selectedProject

    Rectangle {
        anchors.fill: parent

        color: "transparent"

        border.width: 1
        border.color: "#e5e5e5"

        Column {
            anchors.fill: parent

            Repeater {

                model: projectTypes

                SliderDropDown {
                    headerGuid: model.guid
                    headerText: model.name
                    headerHeight: 22

                    width: parent.width
                    selected: model.guid === selectedProjectTypeGuid
                }
            }
        }

    }
}
