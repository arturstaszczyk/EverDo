import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../../actions"
import "../common"
import "../common/theme.js" as Theme


SpaceCointainer {

    property var filters: MainStore.filtersStore.model

    noBorder: true

    HorizontalButtons {
        id: horizontalButtons
        anchors.fill: parent
    }

    Component.onCompleted: {
        horizontalButtons.model = Qt.binding(function() {
            var newModel = []
            for(var i = 0; i < filters.count; ++i) {
                newModel.push(filters.get(i).name)
            }

            return newModel
        })
    }
}

