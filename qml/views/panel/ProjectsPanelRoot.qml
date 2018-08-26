import QtQuick 2.8
import QtQuick.Layouts 1.3


Item {
    width: 100

    Rectangle {
        anchors.fill: parent

        color: "blue"

        ColumnLayout {
            anchors.fill: parent
            SliderDropDown {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
            }
        }

    }
}
