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

    Component.onCompleted: {
        theCellSizes.setColumnWidth(0, 200);
        theCellSizes.setColumnWidth(1, 50);
        theCellSizes.setColumnWidth(2, width - 350);
        theCellSizes.setColumnWidth(3, 100);
    }

    TableView {
        id: theTableView
        anchors.fill: parent
        model: theModel
        rowHeightProvider: theCellSizes.rowHeight
        columnWidthProvider: theCellSizes.columnWidth
        delegate: Component {
            Loader {
                source: (function delegateForColumn(column) {
                    return ["ChannelParameters.qml",
                            "ChannelToolbar.qml",
                            "ChannelPlot.qml",
                            "ChannelExtra.qml"][column];
                })(column)
                onLoaded: {
                    item.cellSizes = theCellSizes;
                }
            }
        }

        onWidthChanged: {
            theCellSizes.setColumnWidth(2, width - (theCellSizes.columnWidth(0) +
                                                    theCellSizes.columnWidth(1) +
                                                    theCellSizes.columnWidth(3)));
            theTableView.forceLayout();
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
