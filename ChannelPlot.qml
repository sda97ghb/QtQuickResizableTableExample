import QtQuick 2.0

ResizableCell {
    id: root

    shouldResizeColumns: [{column: 2, mul: 1}, {column: 3, mul: -1}]

    Item {
        anchors.fill: parent.content

        Rectangle {
            anchors.fill: parent
            color: "#3a4055"
        }
    }
}
