import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../common"
import "../common/theme.js" as Theme

Item {
    id: panel

    property var projectTypes: MainStore.projectsPanelStore.projectTypes

    property int selectedProjectTypeGuid: MainStore.projectsPanelStore.selectedProjectType

    SpaceCointainer {
        anchors.fill: parent
        color: Theme.evernoteWhite
        noBorder: true

        Column {
            anchors.fill: parent

            Repeater {

                model: projectTypes

                SliderDropDown {
                    headerGuid: modelData.guid
                    headerText: modelData.name
                    headerHeight: 36

                    width: parent.width
                    selected: modelData.guid === selectedProjectTypeGuid
                }
            }
        }

    }
}
