import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3
import "../../actions/panel"

Item {

    property int headerGuid

    property alias headerHeight: header.height

    property alias headerText: header.text

    property bool selected: false

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

            MouseArea {
                anchors.fill: parent
                onClicked: ProjectsPanelActions.unfoldProjectType(headerGuid)
            }
        }

        ListView {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            height: selected ? contentHeight : 0

            clip: true
            boundsBehavior: Flickable.StopAtBounds


            model: SliderDropDownDelegateModel {
                id: contentModel
                itemHeight: headerHeight
                headerGuid: sliderDropDownDef.headerGuid
            }
        }
    }
}
