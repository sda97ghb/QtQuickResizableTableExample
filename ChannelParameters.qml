import QtQuick 2.0

ResizableCell {
    id: root

    shouldResizeColumns: [{column: 0, mul: 1}, {column: 2, mul: -1}]

    Text {
        anchors.fill: root.content
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "<b>Analog Channel " + row + "</b><br/>" +
              "ацп = " + (row % 2 + 1) * (row % 13) * (row % 7) * 100 + "<br/>" +
              "A = " + (row % 2 + 1) * (row % 13) * (row % 7) * 10000
    }
}
