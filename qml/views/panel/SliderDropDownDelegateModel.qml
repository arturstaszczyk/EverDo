import QtQuick 2.9
import QtQml.Models 2.3
import "../../stores"

DelegateModel {

    id: delegateModelDef

    property int itemHeight

    property int headerGuid

    property int selectedProjectType: MainStore.projectsPanelStore.selectedProjectType

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
        id: item

        width: parent.width
        height: itemHeight

        text: modelData.name
        guid: modelData.guid

        Component.onCompleted: {
            item.DelegateModel.inRightType = modelData.type === delegateModelDef.headerGuid
        }
    }
}
