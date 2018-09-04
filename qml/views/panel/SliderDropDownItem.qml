import QtQuick 2.0
import QtQml.Models 2.3

import "../common"
import "../../actions"

Rectangle {

    property alias text: itemText.text

    property int guid

    property int parentGuid

    property int headerGuid

    id: item

    color: "transparent"

    PrimaryText {
        id: itemText
        anchors.fill: parent
    }

    Component.onCompleted: {
        item.DelegateModel.inRightType = parentGuid === headerGuid
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            ProjectsPanelActions.selectProject(guid, text)
        }
    }
}
