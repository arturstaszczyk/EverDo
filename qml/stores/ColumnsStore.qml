import QtQuick 2.9
import QuickFlux 1.1
import "../actions/columns"

Store {

    property var model: [
//        {
//            "guid": 0x40,
//            "name": "Do"
//        },
//        {
//            "guid": 0x41,
//            "name": "Waiting"
//        },
//        {
//            "guid": 0x42,
//            "name": "Delegated"
//        },
//        {
//            "guid": 0x43,
//            "name": "Scheduled"
//        }
    ]

    Filter {
        type: ColumnsActionTypes.setColumnsDefinition
        onDispatched: {
            console.log("Columns definitions", JSON.stringify(message))
            model = message.columns
        }
    }
}
