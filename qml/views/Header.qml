import QtQuick 2.0
import QtQuick.Controls 1.0
import "../actions"
import "../stores"

Item {
    height: 48

    Text {
        anchors.centerIn: parent

        text: "This is header"
        font.italic: true
        font.pixelSize: 18
        font.weight: Font.Thin

    }

//    CheckBox {
//        id: checkBox
//        checked: false
//        text: "Show Completed";
//        anchors.right: parent.right
//        anchors.verticalCenter: parent.verticalCenter

//        onClicked: {
//            AppActions.setShowCompletedTasks(checked);
//        }

//        Binding {
//            target: checkBox
//            property: "checked"
//            value: MainStore.userPrefs.showCompletedTasks
//        }
//    }

}

