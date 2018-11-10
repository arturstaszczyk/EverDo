import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QuickFlux 1.1
import "./views"
import "./views/panel"
import "./views/workspace"
import "./views/filters"
import "./middlewares"
import "./actions"
import "./views/common"
import "./views/common/theme.js" as Theme

Window {
    width: 1024
    height: 640
    visible: true

    property int leftPanelSize: 200

    color: Theme.evernotePrimaryGreen

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Theme.basicElementSpacing

        RowLayout {
            Layout.fillWidth: true

            LogoView {
                Layout.fillWidth: false
                Layout.fillHeight: false

                width: leftPanelSize
                height: Theme.headerHeight
            }

            FiltersRoot {
                Layout.fillWidth: true
                Layout.fillHeight: false

                height: Theme.headerHeight
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ProjectsPanelRoot {
                Layout.fillHeight: true
                width: leftPanelSize
            }

            WorkspaceRoot {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

        }

        Footer {
            Layout.fillWidth: true
            Layout.fillHeight: false
        }
    }
}

