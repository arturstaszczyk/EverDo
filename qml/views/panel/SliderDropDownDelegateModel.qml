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

        text: model.name
        guid: model.guid

        Component.onCompleted: {
            item.DelegateModel.inRightType = model.type === delegateModelDef.headerGuid
        }
    }
}
