import QtQuick 2.9
import QtQuick.Layouts 1.3

import "../common"
import "../common/theme.js" as Theme

Item {
    SpaceCointainer {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            SpaceCointainer {
                Layout.fillWidth: true
                height: Theme.basicElementHeight

                noBorder: true

            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    model: 3

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: Theme.secondaryLightColor
                    }
                }
            }
        }
    }
}
