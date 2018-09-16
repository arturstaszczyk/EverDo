import QtQuick 2.9
import "../common"

SpaceCointainer {
    property alias text: columnHeader.text

    color: "white"

    PrimaryText {
        id: columnHeader
        anchors.fill: parent

        text: columnData.name
    }
}
