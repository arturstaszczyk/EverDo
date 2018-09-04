import QtQuick 2.9
import QtQuick.Layouts 1.3

import "../common"
import "../common/theme.js" as Theme
import "../../stores"

Item {
    SpaceCointainer {
        anchors.fill: parent
        noBorder: true

        ColumnLayout {
            anchors.fill: parent

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    model: MainStore.columnsStore.model

                    SpaceCointainer {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: Theme.secondaryLightColor

                        SpaceCointainer {
                            width: parent.width
                            height: Theme.basicElementHeight

                            color: "white"

                            PrimaryText {
                                anchors.fill: parent
                                text: model.name
                            }
                        }

                    }
                }
            }
        }
    }
}
