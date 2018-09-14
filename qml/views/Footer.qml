import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "../stores"

Item {
    height: 56

    property string selectedProject: MainStore.projectsPanelStore.selectedProject
    property var selectedFilters: MainStore.filtersStore.selectedFilters

    Text {
        anchors.centerIn: parent

        text: selectedProject + "\n" + selectedFilters
        font.italic: true
        font.pixelSize: 18
        font.weight: Font.Thin

    }
}

