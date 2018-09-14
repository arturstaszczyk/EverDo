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

        onClicked: {
            console.log("Filter " + button + " clicked")
        }
    }

    Component.onCompleted: {
        horizontalToggles.model = Qt.binding(function() {
            var newModel = []
            for(var i = 0; i < filters.count; ++i) {
                newModel.push(filters.get(i))
            }
            return newModel
        })
    }
}

