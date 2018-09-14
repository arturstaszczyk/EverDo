import QtQuick 2.9
import QtQuick.Layouts 1.3
import QuickFlux 1.1

Item {
    id: horizontalToggles

    property alias model: toggleRepeater.model
    property var selectedToggles: []

    signal clicked(var selectedToggles)

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
                        return element === toggleName
                    })) {
                        selectedToggles = selectedToggles.filter(function(value) {
                            return value !== toggleName
                        })
                    } else {
                        selectedToggles.push(toggleName)
                    }

                    console.log("Selected filters: " + selectedToggles)
                }
            }
        }
    }
}
