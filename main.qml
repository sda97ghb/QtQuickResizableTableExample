import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Window 2.11
import MyTypes 0.1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TableModel {
        id: theModel
    }

    ResizableCellSizes {
        id: theCellSizes
        minCellHeight: 100
        minCellWidth: 40
        defaultCellHeight: 100
        defaultCellWidth: 200
    }

    TableView {
        id: theTableView
        anchors.fill: parent
        model: theModel
        rowHeightProvider: theCellSizes.rowHeight
        columnWidthProvider: theCellSizes.columnWidth
        delegate: ResizableCell {
            cellSizes: theCellSizes

            ChannelParameters {
                visible: column === 0
                anchors.fill: parent.content
            }

            Item {
                visible: column === 1
                anchors.fill: parent.content

                GridLayout {
                    anchors.centerIn: parent
                    width: 33
                    height: 50
                    columns: 2

                    Button { text: "-"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; }
                    Button { text: "+"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; }
                    Button { text: "v"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; }
                    Button { text: "^"; Layout.preferredWidth: 16; Layout.preferredHeight: 16; }
                    Button { text: "X"; Layout.fillWidth: true; Layout.preferredHeight: 16; Layout.columnSpan: 2 }
                }
            }

            Item {
                visible: column === 2
                anchors.fill: parent.content

                Rectangle {
                    anchors.fill: parent
                    color: "#3a4055"
                }
            }

            Text {
                visible: column === 3
                anchors.fill: parent.content
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: display + ",\nrow: " + row + ",\ncolumn: " + column
            }
        }

        ScrollBar.vertical: ScrollBar {
            active: true
            background: Rectangle {
                anchors.fill: parent
                color: "white"
                border.color: "silver"
                border.width: 1
            }

            contentItem: Rectangle {
                implicitWidth: 16
                implicitHeight: 100
                color: parent.pressed ? "darkgray" : "silver"
            }
        }
    }
}
