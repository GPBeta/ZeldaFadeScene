import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window

    visible: true
    width: Screen.width + 1 // prevent OpenGL fullscreen mode
    height: Screen.height
    flags: Qt.FramelessWindowHint
    color: "transparent"
    title: "SAO Utils - Startup Animation"

    FadeScene {
        id: scene
        anchors.centerIn: parent

        height: 1080
        width: window.width * height / window.height
        scale: window.height / height
    }

    MouseArea {
        anchors.fill: parent

        focus: true

        Keys.onEscapePressed: window.close()

        onClicked: scene.state = scene.state === "FadeIn" ? "FadeOut" : "FadeIn"
    }

    Component.onCompleted: scene.state = "FadeIn"
}
