import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../common"
import "../common/theme.js" as Theme
import "../../stores"

SpaceCointainer {
    property var columnData

    color: Theme.secondaryLightColor

    ColumnLayout {
        anchors.fill: parent
        spacing: Theme.basicElementSpacing

        WorkspaceColumnHeader {
            Layout.fillWidth: true
            height: Theme.basicElementHeight
            text: columnData.name
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: Theme.basicElementSpacing

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            model: NoteDelegateModel {
                currentColumn: columnData.guid
            }
        }

    }

}
