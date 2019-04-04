import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    property real value: 0

    Image {
        id: background
        anchors.fill: parent

        opacity: 0.1
        source: "/images/logo.png"
    }

    Image {
        id: indicator
        anchors.fill: parent

        visible: false
        source: "/images/logo.png"
    }

    Item {
        id: mask
        anchors.fill: indicator

        visible: false

        Rectangle {
            width:  parent.width * value
            height: parent.height
        }
    }

    OpacityMask {
        anchors.fill: indicator

        maskSource: mask
        source: indicator
    }
}
