import QtQuick 2.0

Text {
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: "<b>Analog Channel " + row + "</b><br/>" +
          "ацп = " + (row % 2 + 1) * (row % 13) * (row % 7) * 100 + "<br/>" +
          "A = " + (row % 2 + 1) * (row % 13) * (row % 7) * 10000
}
