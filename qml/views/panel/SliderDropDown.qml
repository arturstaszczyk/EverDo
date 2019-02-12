import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3
import "../../actions/panel"
import "../../stores"

Item {

    property alias headerHeight: header.height

    property int headerGuid
    property alias headerText: header.text

    property var content: []

    property bool selected: MainStore.projectsPanelStore.selectedProjectType === headerGuid

    id: sliderDropDownDef

    width: parent.width
    height: header.height + content.height

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        SliderDropDownHeader {
            id: header

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true

            highlighted: sliderDropDownDef.selected

            MouseArea {
                anchors.fill: parent
                onClicked: ProjectsPanelActions.selectProjectType(headerGuid)
            }
        }


        SliderDropDownList {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            expanded: sliderDropDownDef.selected

            items: sliderDropDownDef.content
            itemHeight: sliderDropDownDef.headerHeight
        }

//        ListView {
//            id: content

//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            Layout.alignment: Qt.AlignTop

//            height: header.selected ? c.implicitHeight : 0

//            clip: true
//            boundsBehavior: Flickable.StopAtBounds

//            Column {
//                id: c
//                anchors.fill: parent
//                Repeater {

//                    model: 5
//                    delegate: Rectangle {
//                        id: contentModel

//                        width: 10//parent.width
//                        height: 10// headerHeight
//                        color: 'red'
//    //                    text: modelData.name
//    //                    guid: modelData.guid
//                    }
//                }
//            }
//        }
    }
}
