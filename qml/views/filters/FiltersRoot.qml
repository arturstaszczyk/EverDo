import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../stores"
import "../common"
import "../common/theme.js" as Theme


SpaceCointainer {

    property var filters: MainStore.filtersStore.model

    noBorder: true

    HorizontalButtons {
        anchors.fill: parent
        model: filters
    }
}

