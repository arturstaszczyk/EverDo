import QtQuick 2.9
import QuickFlux 1.1

import "../actions"

Store {

    property int currentFilter

    property var model: [
        {
            "guid": 0x51,
            "title": 'Hello world',
            "filters": [
                0x21,
                0x22
            ],
            "columnGuid": 0x41,
            "projectGuid": 0x11
        },
        {
            "guid": 0x52,
            "title": 'Awesome note',
            "filters": [
                0x21,
            ],
            "columnGuid": 0x42,
            "projectGuid": 0x12
        },
    ]

}
