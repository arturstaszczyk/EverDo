import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../common"
import "../common/theme.js" as Theme


SpaceCointainer {

    property var filters: MainStore.filtersStore.model

    noBorder: true

    RowLayout {
        anchors.fill: parent

        Repeater {
            model: filters

            Rectangle {
                Layout.fillWidth: true
                height: parent.height
                color: Theme.primaryLightColor

                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    anchors.fill: parent

                    text: model.name
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }

    }
}

