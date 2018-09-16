import QtQuick 2.9
import QtQml.Models 2.3
import "../common"
import "../../stores"

DelegateModel {

    property int currentColumn

    groups: [
        DelegateModelGroup {
            name: "rightNote"
        }
    ]

    model: MainStore.notesStore.model

    Component.onCompleted: {
        for(var i = 0; i < items.count; ++i) {
            var item = items.get(i)
            var modelData = items.get(i).model.modelData

            item.inRightNote = modelData.columnGuid === currentColumn
        }

        filterOnGroup = "rightNote"
    }

    delegate: Rectangle {
        id: note
        width: parent.width
        height: 30

        PrimaryText {
            id: noteTitle
            text: modelData.title

            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignLeft
        }

//        Component.onCompleted: {
//            note.DelegateModel.inRightNote = modelData.columnGuid === currentColumn
//            console.log(modelData.columnGuid === currentColumn)
//        }
    }
}
