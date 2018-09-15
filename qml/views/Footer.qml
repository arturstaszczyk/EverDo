import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "../stores"

Item {
    height: 56

    property int selectedProject: MainStore.projectsPanelStore.selectedProject
    property int selectedProjectType: MainStore.projectsPanelStore.selectedProjectType
    property var selectedFilters: MainStore.filtersStore.selectedFilters

    Text {
        id: footerText
        anchors.centerIn: parent

        text: selectedProject + "\n" + selectedFilters
        font.italic: true
        font.pixelSize: 18
        font.weight: Font.Thin

        Component.onCompleted: {
            footerText.text = Qt.binding(function(){
                var allTypes = MainStore.projectsPanelStore.projectTypes
                var allProjects = MainStore.projectsPanelStore.projects

                var projectType = allTypes.find(function(element){
                    return element.guid === selectedProjectType
                })

                var project = allProjects.find(function(element){
                    return element.guid === selectedProject
                })
                var verbatim = projectType ? "Project: " + projectType.name : ""
                verbatim += project ? " \\ " + project.name : ""

                return verbatim
            })
        }

    }
}

