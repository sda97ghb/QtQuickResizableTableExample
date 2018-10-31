import QtQuick 2.0

ResizableCell {
    id: root

    shouldResizeColumns: []

    Text {
        anchors.fill: parent.content
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: display + ",\nrow: " + row + ",\ncolumn: " + column
    }
}
