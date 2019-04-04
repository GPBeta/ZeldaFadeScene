import QtQuick 2.12

Row {

    spacing: 4

    property alias source: image.source
    property alias text: label.text

    Text {
        id: label
        anchors.verticalCenter: parent.verticalCenter

        font.family: "Arial"
        font.pixelSize: 28
        font.letterSpacing: 1
        font.italic: true
        font.weight: Font.Thin
    }

    Image {
        id: image
        anchors.verticalCenter: parent.verticalCenter
    }
}
