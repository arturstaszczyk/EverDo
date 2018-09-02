import QtQuick 2.9
import QuickFlux 1.1

Store {

    property alias model: filtersModel

    ListModel {
        id: filtersModel

        ListElement {
            guid: 0x20
            name: "Home"
        }

        ListElement {
            guid: 0x21
            name: "Work"
        }

        ListElement {
            guid: 0x22
            name: "City"
        }
    }
}
