import QtQuick 2.9
import QuickFlux 1.1
import QtQuick.Dialogs 1.2
import "../actions"
import "../actions/panel"
import "../actions/columns"
import "../stores"

Middleware {

    property RootStore store: MainStore

    property var mainWindow: null

    function loadStore() {
        var dataStr = storeService.loadStore()
        if(dataStr) {
            var data = JSON.parse(dataStr)
            Hydrate.rehydrate(store, data)
        }
    }

    function saveStore() {
        var data = Hydrate.dehydrate(store)
        storeService.saveStore(JSON.stringify(data))
    }

    function handleStartApp(type) {
        if (type === ActionTypes.startApp) {
            loadStore();
            mainWindow.visible = true;
            return true;
        }

        return false
    }

    function handleFetchEvernoteTags(type) {
        if(type === ActionTypes.fetchEvernoteTags) {
            evernoteApiService.fetchUserMetadata();
            evernoteApiService.fetchUserContent();
        }
    }

    function dispatch(type, message) {
        console.log("MIDDLEWARE: " + type)

        if(handleStartApp(type))
            return;
        if(handleFetchEvernoteTags(type))
            return;

        next(type, message);
    }

    Connections {
        target: mainWindow
        onClosing: {
            console.log("Closing the app");
            saveStore();
        }
    }

    Connections {
        target: projectsService
        onSetFetchedCategories: ProjectsPanelActions.setCategoriesDefinitions(categories)
        onSetFetchedProjects: ProjectsPanelActions.setProjectsDefinitions(projects)
    }

    Connections {
        target: columnsService
        onSetFetchedColumns: ColumnsActions.setColumnsDefinitions(columns)
    }

    Connections {
        target: filtersService
        onSetFetchedFilters: FiltersActions.setFiltersDefinitions(filters)
    }
}
