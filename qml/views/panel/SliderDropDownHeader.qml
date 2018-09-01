import QtQuick 2.9
import "../common"
import "../common/theme.js" as Theme

Item {

    property alias text: headerLabel.text

    property bool selected

    Rectangle {
        color: selected ? Theme.primaryColor : Theme.primaryLightColor
        border.width: selected ? 1 : 0
        border.color: Theme.primaryColor
        anchors.fill: parent

        PrimaryText {
            id: headerLabel
            anchors.fill: parent
        }
    }
}
