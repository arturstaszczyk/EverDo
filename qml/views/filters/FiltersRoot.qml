import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../../actions"
import "../common"
import "../common/theme.js" as Theme


SpaceCointainer {

    property var filters: MainStore.filtersStore.model

    noBorder: true

    HorizontalToggles {
        id: horizontalToggles

        anchors.fill: parent

        selectedToggles: MainStore.filtersStore.selectedFilters

        onChanged: {
            FiltersActions.updateFilters(selectedToggles)
        }
    }

    Component.onCompleted: {
        horizontalToggles.model = Qt.binding(function() {
            return filters
        })
    }
}

