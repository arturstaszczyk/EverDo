import QtQuick 2.0
import QuickFlux 1.1

Store {

    // It hold the todo list data model
    property alias todo: todo

    TodoStore {
        id: todo
    }

    // It hold user's perference. (e.g should it show completed tasks?)
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

}
