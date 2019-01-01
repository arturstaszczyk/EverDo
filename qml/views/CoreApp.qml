import QtQuick 2.0
import QtQuick.Layouts 1.0

import "./panel"
import "./common"
import "./filters"
import "./workspace"
import "./common/theme.js" as Theme

ColumnLayout {

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
