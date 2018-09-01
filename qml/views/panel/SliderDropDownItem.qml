import QtQuick 2.0
import QtQml.Models 2.3

import "../common"

Rectangle {

    property alias text: itemText.text

    property int guid

    property int headerGuid

    id: item

    color: "transparent"

    PrimaryText {
        id: itemText
        anchors.fill: parent
    }

    Component.onCompleted: {
        item.DelegateModel.inRightType = guid === headerGuid
    }
}
