import QtQuick 2.9
import "./theme.js" as Theme

Rectangle {

    property bool noBorder: false

    color: "transparent"

    border.width: noBorder ? 0 : 1
    border.color: Theme.primaryColor
}
