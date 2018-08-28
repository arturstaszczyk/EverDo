import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../"


SpaceCointainer {

    property var filters: MainStore.filtersStore.model

    RowLayout {
        spacing: 10
        anchors.fill: parent

        Repeater {
            model: filters

            Rectangle {
                Layout.fillWidth: true
                height: parent.height / 2
                color: "red"

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

