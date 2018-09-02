import QtQuick 2.9
import QtQuick.Layouts 1.3
import QuickFlux 1.1
import "theme.js" as Theme

Item {
    property alias model: buttonsRepeater.model

    id: horizontalButtons

    signal clicked(string button)

    RowLayout {
        anchors.fill: parent

        Repeater {
            id: buttonsRepeater

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Theme.primaryLightColor

                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                PrimaryText {
                    anchors.fill: parent
                    text: modelData
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        horizontalButtons.clicked(modelData)
                    }
                }
            }
        }
    }
}
