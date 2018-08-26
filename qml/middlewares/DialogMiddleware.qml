import QtQuick 2.0
import QuickFlux 1.1
import QtQuick.Dialogs 1.2
import "../actions"
import "../stores"

Middleware {

    property RootStore store: MainStore

    signal openDialog();

    signal passMessage(string type, var message);

    onOpenDialog: {
        dialog.open();
    }

    onPassMessage: {
        /// Pass the action to next middleware / store
        next(type, message);
    }

    MessageDialog {
        id: dialog
        title: "Confirmation"
        text: "Are you sure want to show completed tasks?"
        standardButtons: StandardButton.Ok | StandardButton.Cancel

        onAccepted: {
            next(ActionTypes.setShowCompletedTasks, {value: true});
        }

        onRejected: {
            next(ActionTypes.setShowCompletedTasks, {value: false});
        }
    }

    function dispatch(type, message) {

        if (type === ActionTypes.setShowCompletedTasks &&
            message.value === true) {
            // If user want to show completed tasks, drop the action and show a dialog
            openDialog();
        } else {
            passMessage(type, message);
        }
    }

}
