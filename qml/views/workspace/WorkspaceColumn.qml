import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../common"
import "../common/theme.js" as Theme

SpaceCointainer {
    property alias name: columnHeader.text
    property string selectedProject
    property var appliedFilters: []

    color: Theme.secondaryLightColor

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
            model: 3

            NotePlaceholder {
                width: parent.width
                height: 32
            }
        }


    }

}
