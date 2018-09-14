import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../common"
import "../common/theme.js" as Theme

SpaceCointainer {
    property alias name: columnHeader.text

    property string selectedProject

    color: Theme.secondaryLightColor

    SpaceCointainer {
        width: parent.width
        height: Theme.basicElementHeight

        color: "white"

        PrimaryText {
            id: columnHeader
            anchors.fill: parent
        }
    }
}
