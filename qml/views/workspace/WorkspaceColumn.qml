import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../common"
import "../common/theme.js" as Theme
import "../../stores"

SpaceCointainer {
    property alias name: columnHeader.text
    property int selectedProject: MainStore.projectsPanelStore.selectedProject
    property var appliedFilters: MainStore.filtersStore.selectedFilters
    property var notes

    color: Theme.secondaryLightColor

    Component.onCompleted: {
        notes = Qt.binding(function() {
            return MainStore.notesStore.model
        })


    }

    Column {
        anchors.fill: parent
        spacing: Theme.basicElementSpacing

        SpaceCointainer {
            width: parent.width
            height: Theme.basicElementHeight

            color: "white"

            PrimaryText {
                id: columnHeader
                anchors.fill: parent
            }
        }

        Repeater {
            model: notes

            NotePlaceholder {
                width: parent.width
                height: 32

                Note {
                    anchors.fill: parent
                    title: modelData.title
                }
            }
        }


    }

}
