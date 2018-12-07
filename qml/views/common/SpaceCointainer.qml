import QtQuick 2.9
import "./theme.js" as Theme

Rectangle {

    property bool noBorder: false

    color: "transparent"

    radius: 4
    border.width: noBorder ? 0 : 2
    border.color: Theme.evernotePrimaryGreen

    clip: true
}
