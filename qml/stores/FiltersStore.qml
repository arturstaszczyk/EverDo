import QtQuick 2.9
import QuickFlux 1.1
import "../actions/filters"

Store {

    property var selectedFilters: []

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

    Filter {
        type: FiltersActionTypes.updateFilters
        onDispatched: {
            selectedFilters = message.newFilters
            console.log(message.newFilters)
        }
    }
}
