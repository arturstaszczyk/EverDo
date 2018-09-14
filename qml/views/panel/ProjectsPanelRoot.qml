import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../common"

Item {
    width: 150

    id: panel

    property var projectTypes: MainStore.projectsPanelStore.projectTypes

    property int selectedProjectTypeGuid: MainStore.projectsPanelStore.selectedProjectType

    SpaceCointainer {
        anchors.fill: parent

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
