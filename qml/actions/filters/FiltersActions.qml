pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1
import "./"

ActionCreator {

    signal updateFilters(var newFilters)

    signal setFiltersDefinitions(var filters)

}
