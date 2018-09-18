import QtQuick 2.9
import QtQuick.Layouts 1.3

import "../common"
import "../../stores"

Item {
    property var columns: MainStore.columnsStore.model
    property var notes: {
        return MainStore.notesStore.model.filter(function(element){
            return element.projectGuid === selectedProject
        })
    }

    property int selectedProject: MainStore.projectsPanelStore.selectedProject
    property var appliedFilters: MainStore.filtersStore.selectedFilters

    SpaceCointainer {
        anchors.fill: parent
        noBorder: true

        RowLayout {
            anchors.fill: parent

                Repeater {
                    model: columns

                    delegate: WorkspaceColumn {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        columnData: modelData
                        notesData: notes
                    }
            }
        }
    }
}
