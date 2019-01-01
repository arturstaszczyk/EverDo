import QtQuick 2.9
import QuickFlux 1.1
import QtQuick.Dialogs 1.2
import "../actions"
import "../stores"

Middleware {

    property RootStore store: MainStore

    property var mainWindow: null

    function dispatch(type, message) {
        console.log("MIDDLEWARE: " + type)
        if (type === ActionTypes.startApp) {
            mainWindow.visible = true;

            var dataStr = evernote.loadStore();
            var data = JSON.parse(dataStr)
            Hydrate.rehydrate(store, data)

            return;
        }
        next(type, message);
    }

    Connections {
        target: mainWindow
        onClosing: {
            // You may inject a hook to forbid closing or save data if necessary
            console.log("closing");
            var data = Hydrate.dehydrate(store)
            evernote.saveStore(JSON.stringify(data));
        }
    }

}
