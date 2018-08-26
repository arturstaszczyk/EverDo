import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3

Item {

    id: sliderDropDown
    width: parent.width
    height: headerHeight + content.contentHeight

    property int sizeOfTheContent: 0

    property alias headerText: header.text
    property int headerHeight: 35

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        SliderDropDownHeader {
            id: header

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: headerHeight
        }

        ListView {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            model: SliderDropDownDelegateModel {
                itemHeight: headerHeight
            }
        }
    }
}
