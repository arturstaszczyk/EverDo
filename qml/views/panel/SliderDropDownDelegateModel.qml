import QtQuick 2.9
import QtQml.Models 2.3
import "../../stores"

DelegateModel {

    property int itemHeight

    property int parentGuid

    property int selectedProjectType: MainStore.projectsPanelStore.selectedProject

    model: MainStore.projectsPanelStore.projects

    onSelectedProjectTypeChanged: {
        filterOnGroup = "rightType"
    }

    groups: [
        DelegateModelGroup {
            name: "rightType"
        }
    ]

    delegate: SliderDropDownItem {
        width: parent.width
        height: itemHeight

        text: model.name
        typeGuid: model.type
        parentG: parentGuid
    }
}
