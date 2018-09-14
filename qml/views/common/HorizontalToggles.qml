import QtQuick 2.9
import QtQuick.Layouts 1.3
import QuickFlux 1.1

Item {
    id: horizontalToggles

    property alias model: toggleRepeater.model
    property var selectedToggles: []

    signal changed(var selectedToggles)

    RowLayout {
        anchors.fill: parent

        Repeater {
            id: toggleRepeater

            Toggle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                title: modelData.name
                guid: modelData.guid

                onClicked: {
                    if(selectedToggles.find(function(element){
                        return element === toggleGuid
                    })) {
                        selectedToggles = selectedToggles.filter(function(value) {
                            return value !== toggleGuid
                        })
                    } else {
                        selectedToggles.push(toggleGuid)
                    }

                    changed(selectedToggles)
                }
            }
        }
    }
}
