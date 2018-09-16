import QtQuick 2.9
import QtQuick.Layouts 1.3

import "../common"
import "../../stores"

Item {
    property var columns: MainStore.columnsStore.model

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
                    }
            }
        }
    }
}
