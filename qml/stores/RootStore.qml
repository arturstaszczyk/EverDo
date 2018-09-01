import QtQuick 2.0
import QuickFlux 1.1

Store {

    property alias todo: todo

    TodoStore {
        id: todo
    }

    property alias userPrefs: userPrefs

    UserPrefsStore {
        id: userPrefs
    }

    property alias projectsPanelStore: projectsPanelStore

    ProjectsPanelStore {
        id: projectsPanelStore
    }

    property alias filtersStore: filtersStore

    FiltersStore {
        id: filtersStore
    }

    property alias notesStore: notesStore

    NotesStore {
        id: notesStore
    }

}
