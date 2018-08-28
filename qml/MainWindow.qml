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
import "./views/common/theme.js" as Theme

Window {
    width: 480
    height: 640
    visible: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Theme.basicElementSpacing

        FiltersRoot {
            Layout.fillWidth: true
            Layout.fillHeight: false
            height: Theme.basicElementHeight
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ProjectsPanelRoot {
                Layout.fillHeight: true
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

