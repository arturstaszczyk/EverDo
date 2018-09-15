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

        model: filters
        selectedToggles: MainStore.filtersStore.selectedFilters

        onChanged: {
            FiltersActions.updateFilters(selectedToggles)
        }
    }

//    Component.onCompleted: {
//        horizontalToggles.model = Qt.binding(function() {
//            return filters.reduce(function(element) {
//                return
//            })
//            var newModel = [];
//            for(var i = 0; i <
//                newModel.push(model)
//                console.log(filters[0].name)
//            }
//            return newModel
//        })
//    }
}

