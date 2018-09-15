import QtQuick 2.9
import QtQuick.Layouts 1.3

import "../common"
import "../../stores"

Item {
    SpaceCointainer {
        anchors.fill: parent
        noBorder: true

        RowLayout {
            anchors.fill: parent

                Repeater {
                    model: MainStore.columnsStore.model

                    delegate: WorkspaceColumn {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        name: modelData.name
                        selectedProject: MainStore.projectsPanelStore.selectedProject
                        //appliedFilters: MainStore.filtersStore
                    }
            }
        }
    }
}
