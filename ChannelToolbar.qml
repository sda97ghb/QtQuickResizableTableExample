import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ResizableCell {
    id: root

    shouldResizeColumns: []

    Item {
        anchors.fill: root.content

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
}
