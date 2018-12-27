import QtQuick 2.0
import QuickFlux 1.1

Store {

    property alias projectsPanelStore: projectsPanelStore

    ProjectsPanelStore {
        id: projectsPanelStore
    }

    property alias filtersStore: filtersStore

    FiltersStore {
        id: filtersStore
    }

    property alias columnsStore: columnsStore

    ColumnsStore {
        id: columnsStore
    }

    property alias notesStore: notesStore

    NotesStore {
        id: notesStore
    }

    property alias authStore: authStore

    AuthStore {
        id: authStore
    }

}
