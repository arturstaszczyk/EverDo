import QtQuick 2.9
import QuickFlux 1.1
import "../actions/filters"

Store {

    property var selectedFilters: []

    property var model: [
//        {
//            "guid": 0x20,
//            "name": "Home"
//        },
//        {
//            "guid": 0x21,
//            "name": "Work"
//        },
//        {
//            "guid": 0x22,
//            "name": "City"
//        },
    ]

    Filter {
        type: FiltersActionTypes.updateFilters
        onDispatched: {
            selectedFilters = message.newFilters
            console.log(message.newFilters)
        }
    }

    Filter {
        type: FiltersActionTypes.setFiltersDefinitions
        onDispatched: {
            model = message.filters
            selectedFilters = []
            console.log("Filters definition: " + JSON.stringify(model))
        }
    }
}
