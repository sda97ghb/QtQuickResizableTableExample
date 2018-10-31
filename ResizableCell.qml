import QtQuick 2.0

Item {
    id: root

    property alias content: theContent
    property alias cellSizes: cellResizeBehavior.cellSizes

    property double resizeZoneSize: Qt.platform.os == "android" ? 24 : 6;

    property alias borderColor: theBorder.borderColor
    property alias borderWidth: theBorder.borderWidth

    implicitHeight: 100
    implicitWidth: 100

    Item {
        id: theContent
        anchors.fill: parent
        anchors.rightMargin: root.resizeZoneSize
        anchors.bottomMargin: root.resizeZoneSize
    }

    ResizableCellBehavior {
        id: cellResizeBehavior
        anchors.fill: parent
        resizeZoneSize: root.resizeZoneSize
    }

    ResizableCellBorder {
        id: theBorder
        anchors.fill: parent
        resizeZoneSize: root.resizeZoneSize
    }
}
