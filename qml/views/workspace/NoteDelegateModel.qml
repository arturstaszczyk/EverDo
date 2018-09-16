import QtQuick 2.9
import QtQml.Models 2.3
import "../common"
import "../../stores"

DelegateModel {

    property int currentColumn

    property int selectedProject: MainStore.projectsPanelStore.selectedProject
    property var appliedFilters: MainStore.filtersStore.selectedFilters
    model: MainStore.notesStore.model

    groups: [
        DelegateModelGroup {
            name: "rightNote"
        }
    ]

    onSelectedProjectChanged: {
        recalculateGroups()
    }

    Component.onCompleted: {
        recalculateGroups()
    }

    function recalculateGroups() {
        for(var i = 0; i < items.count; ++i) {
            var item = items.get(i)
            var modelData = items.get(i).model.modelData

            item.inRightNote = modelData.columnGuid === currentColumn
            item.inRightNote = item.inRightNote && modelData.projectGuid === selectedProject
        }

        filterOnGroup = "rightNote"
    }

    delegate: Note {
        id: note

        width: parent.width
        height: 30

        title: modelData.title
    }
}
