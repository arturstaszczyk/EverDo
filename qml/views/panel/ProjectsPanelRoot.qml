import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../common"
import "../common/theme.js" as Theme

Item {
    id: panel

    property var projectTypes: MainStore.projectsPanelStore.projectTypes
    property var projects: MainStore.projectsPanelStore.projects

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

                    content: projects.filter(function(project) {
                        return project.type === modelData.guid
                    })

                    width: parent.width
                    headerHeight: 36
                }
            }
        }

    }
}
