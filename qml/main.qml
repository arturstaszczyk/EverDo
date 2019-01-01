import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QuickFlux 1.1
import "./views"
import "./middlewares"
import "./actions"
import "./stores"

Item {

    MiddlewareList {
        applyTarget: AppActions

        SystemMiddleware {
            mainWindow: mainWindow
        }

        AuthMiddleware {

        }
    }

    MainWindow {
        id: mainWindow
        visible: true
    }

    property QtObject mainStore: MainStore
}

