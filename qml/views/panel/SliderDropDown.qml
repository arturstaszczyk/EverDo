import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3
import "../../stores"

Item {

    id: sliderDropDown
    width: parent.width
    height: headerHeight + 100

    property string headerText: 'N/A'
    property int headerHeight: 35

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: headerRect
            color: "red"

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: 40

            Text {
                anchors.fill: parent
                text: headerText
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter

            }

            MouseArea {
                anchors.fill: parent
                onClicked: console.log('Ha')
            }
        }

        ListView {
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            model: DelegateModel {

                model: MainStore.projectsPanelStore.projects



                Rectangle {
                    color: "yellow"
                    width: parent.width
                    height: headerHeight + 10

                    Text {
                        anchors.fill: parent
                        text: model.name
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                    }

                }
            }
        }



    }
}
