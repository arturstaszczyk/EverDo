import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../common"
import "../common/theme.js" as Theme
import "../../stores"

SpaceCointainer {
    property var columnData
    property var notesData

    color: Theme.evernoteWhite

    ColumnLayout {
        anchors.fill: parent
        spacing: Theme.basicElementSpacing

        WorkspaceColumnHeader {
            Layout.fillWidth: true
            height: Theme.basicElementHeight
            text: columnData.name
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: Theme.basicElementSpacing

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            model: {
                return notesData.filter(function(element){
                    return element.columnGuid === columnData.guid
                })
            }

            delegate: Note {
                id: note

                width: parent.width
                height: 30

                title: modelData.title
            }
        }
    }
}
