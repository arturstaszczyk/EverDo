import QtQuick 2.9
import QuickFlux 1.1
import "../actions/panel"

Store {
    property int selectedProjectType
    property int selectedProject

    property alias projects: projects

    ListModel {
        id: projects

        ListElement {
            name: "ProjectA"
            guid: 0x10
            type: 0x1
        }

        ListElement {
            name: "ProjectB"
            guid: 0x11
            type: 0x1
        }

        ListElement {
            name: "ProjectC"
            guid: 0x12
            type: 0x2
        }
    }

    property alias projectTypes: projectTypes

    ListModel {
        id: projectTypes

        ListElement {
            name: "In Progress"
            guid: 0x1
        }

        ListElement {
            name: "Someday/Maybe"
            guid: 0x2
        }

        ListElement {
            name: "Waiting"
            guid: 0x3
        }
    }

    Filter {
        type: ProjectsPanelActionTypes.selectProjectType
        onDispatched: {
            if(selectedProjectType === message.guid) {
                selectedProjectType = ""
            } else {
                selectedProjectType = message.guid
            }

            console.log("selectProjectType: " + message.guid)
        }
    }

    Filter {
        type: ProjectsPanelActionTypes.selectProject
        onDispatched: {
            selectedProject = message.guid

            console.log("selectProject" + message.guid)
        }
    }
}
