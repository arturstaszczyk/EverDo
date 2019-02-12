import QtQuick 2.9
import QtQuick.Layouts 1.3

ListView {
    property var items: []
    property int itemHeight

    property bool expanded: false

    height: expanded ? dropDownColumn.implicitHeight : 0

    id: dropDownListView
    clip: true
    boundsBehavior: Flickable.StopAtBounds

    Column {
        id: dropDownColumn

        anchors.fill: parent

        Repeater {

            model: items

            delegate: SliderDropDownItem {
                width: parent.width
                height: itemHeight

                text: modelData.name
                guid: modelData.guid
            }
        }
    }
}
