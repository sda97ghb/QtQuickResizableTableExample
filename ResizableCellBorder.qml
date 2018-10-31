import QtQuick 2.12
import QtQuick.Shapes 1.12

Shape {
    property double resizeZoneSize: Qt.platform.os == "android" ? 24 : 6;

    property alias borderWidth: thePath.strokeWidth
    property alias borderColor: thePath.strokeColor

    ShapePath {
        id: thePath

        strokeWidth: 1
        strokeColor: "#f0f0f0"
        fillColor: "transparent"

        PathMove {
            x: 0
            y: height - resizeZoneSize / 2
        }

        PathLine {
            x: width
            y: height - resizeZoneSize / 2
        }

        PathMove {
            x: width - resizeZoneSize / 2
            y: 0
        }

        PathLine {
            x: width - resizeZoneSize / 2
            y: height
        }
    }
}
