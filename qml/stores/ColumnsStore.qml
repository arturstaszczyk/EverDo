import QtQuick 2.9
import QuickFlux 1.1

Store {

    property alias model: model

    ListModel {
        id: model

        ListElement {
            guid: 0x41
            name: "Do"
        }

        ListElement {
            guid: 0x42
            name: "Waiting"
        }

        ListElement {
            guid: 0x43
            name: "delegated"
        }

        ListElement {
            guid: 0x43
            name: "scheduled"
        }
    }
}
