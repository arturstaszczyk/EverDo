import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3
import "../../actions/panel"
import "../../stores"

Item {

    property string guid

    property alias headerText: header.text

    property int headerHeight: 35

    id: sliderDropDown
    width: parent.width
    height: headerHeight + content.height

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        SliderDropDownHeader {
            id: header

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: headerHeight

            MouseArea {
                anchors.fill: parent
                onClicked: ProjectsPanelActions.unfoldProjectType(guid)
            }
        }

        ListView {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            height: guid === MainStore.projectsPanelStore.selectedProject ? contentHeight : 0

            model: SliderDropDownDelegateModel {
                itemHeight: headerHeight
            }
        }
    }
}
