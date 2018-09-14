import QtQuick 2.9
import QuickFlux 1.1

import "../actions"

Store {

    property int currentFilter

    ListModel {
        id: model

        ListElement {
            guid: 0x51
            title: 'Hello world'
            filters: [
                ListElement {
                    filterGuid: 0x21
                },
                ListElement {
                    filterGuid: 0x22
                }
            ]
            columnGuid: 0x41
            projectGuid: 0x11
        }
    }
}
