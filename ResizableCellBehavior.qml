import QtQuick 2.0
import MyTypes 0.1

MouseArea {
    property ResizableCellSizes cellSizes: null

    property double resizeZoneSize: Qt.platform.os == "android" ? 24 : 6;
    property point pressPoint: Qt.point(0, 0)
    property int resizingRow: 0
    property int resizingColumn: 0
    property double resizingRowStartHeight: cellSizes.defaultCellHeight
    property double resizingColumnStartWidth: cellSizes.defaultCellWidth

    function zoneAt(x, y) {
        var cornerSize = resizeZoneSize;
        var rightThreshold = width - cornerSize;
        var bottomThreshold = height - cornerSize;
        if (x > rightThreshold) {
            if (y > bottomThreshold) return Qt.point(1, 1);
            else                     return Qt.point(1, 0);
        }
        else {
            if (y > bottomThreshold) return Qt.point(0, 1);
            else                     return Qt.point(0, 0);
        }
    }

    function cursorAtZone(zone) {
        return [
                    [Qt.ArrowCursor,   Qt.SizeHorCursor],
                    [Qt.SizeVerCursor, Qt.SizeAllCursor]
                ][zone.y][zone.x];
    }

    function columnForZone(zone) {
        return [-1, column][zone.x];
    }

    function rowForZone(zone) {
        return [-1, row][zone.y];
    }

    function performResize(mouse, zone) {
        var currentPoint = Qt.point(parent.x + mouse.x, parent.y + mouse.y);

        var dx = currentPoint.x - pressPoint.x;
        var dy = currentPoint.y - pressPoint.y;

        if (resizingColumn >= 0) {
            cellSizes.setColumnWidth(resizingColumn, resizingColumnStartWidth + dx);
        }
        if (resizingRow >= 0) {
            cellSizes.setRowHeight(resizingRow, resizingRowStartHeight + dy);
        }

        theTableView.forceLayout();
    }

    function handleMouseMove(mouse) {
        var zone = zoneAt(mouse.x, mouse.y);
        cursorShape = cursorAtZone(zone);
        if (pressed)
            performResize(mouse, zone);
    }

    onPositionChanged: {
        var zone = zoneAt(mouse.x, mouse.y);
        cursorShape = cursorAtZone(zone);
        if (pressed)
            performResize(mouse, zone);
    }

    hoverEnabled: true

    onPressed: {
        var zone = zoneAt(mouse.x, mouse.y);
        resizingColumn = columnForZone(zone);
        resizingRow = rowForZone(zone);
        if (resizingColumn >= 0)
            resizingColumnStartWidth = cellSizes.columnWidth(resizingColumn);
        if (resizingRow >= 0)
            resizingRowStartHeight = cellSizes.rowHeight(resizingRow);

        pressPoint = Qt.point(parent.x + mouse.x, parent.y + mouse.y);

        if (zone.x > 0 || zone.y > 0)
            theTableView.interactive = false;
    }
    onReleased: theTableView.interactive = true
}
