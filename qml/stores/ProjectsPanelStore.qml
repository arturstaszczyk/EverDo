import QtQuick 2.9
import QuickFlux 1.1
import "../actions/panel"

Store {

    property alias projects: projects
    property alias projectTypes: projectTypes

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
        type: ProjectsPanelActionTypes.unfoldProjectType
        onDispatched: {
            console.log(message.guid.toString())
        }
    }
}
