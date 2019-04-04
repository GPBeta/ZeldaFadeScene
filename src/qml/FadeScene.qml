import QtQuick 2.12
import QtQuick.Shapes 1.12

Item {
    id: scene

    readonly property int padX: (72 * scene.width) / 1920
    readonly property int padY: 46

    readonly property real gradientAngle: 10 * Math.PI / 180
    readonly property real gradientExtend: width * 0.2

    transitions: [
        Transition {
            to: "FadeIn"

            PropertyAction { target: progress; property: "value"; value: 0 }
            OpacityAnimator { target: loading; duration: 500; from: 0; to: 1 }
            SequentialAnimation {
                OpacityAnimator { target: background; duration: 500; from: 0; to: 1 }
                OpacityAnimator { target: progress; duration: 500; from: 0; to: 1 }
                PauseAnimation { duration: 500 }
                ParallelAnimation {
                    XAnimator { target: cover; duration: 1000; from: scene.width; to: -gradientExtend; easing.type: Easing.OutCubic }
                    XAnimator { target: cover2; duration: 1000; from: scene.width; to: -gradientExtend; easing.type: Easing.OutCubic }
                    SequentialAnimation {
                        NumberAnimation { target: progress; duration: 500; property: "value"; from: 0; to: 0.2; easing.type: Easing.OutCubic }
                        ParallelAnimation {
                            XAnimator { target: caption; duration: 1000; from: padX / 2; to: padX; easing.type: Easing.OutQuart }
                            XAnimator { target: tips ; duration: 1000; from: padX / 2; to: padX; easing.type: Easing.OutQuart }
                            OpacityAnimator { target: caption; duration: 500; from: 0; to: 1 }
                            OpacityAnimator { target: tips; duration: 500; from: 0; to: 1 }
                        }
                    }
                }
                ParallelAnimation {
                    OpacityAnimator { target: statistic; duration: 500; from: 0; to: 1 }
                    OpacityAnimator { target: decoration; duration: 500; from: 0; to: 1 }
                }
                NumberAnimation { target: progress; duration: 4000; property: "value"; from: 0.2; to: 1.0; easing.type: Easing.OutCubic }
            }
        },
        Transition {
            to: "FadeOut"

            OpacityAnimator { target: progress; duration: 1000; from: 1; to: 0 }
            XAnimator { target: cover; duration: 500; from: -gradientExtend; to: -cover.width; easing.type: Easing.InQuad }
            XAnimator { target: cover2; duration: 500; from: -gradientExtend; to: -cover.width; easing.type: Easing.InQuad }
            XAnimator { target: caption; duration: 250; from: padX; to: padX / 2; easing.type: Easing.InQuad }
            XAnimator { target: tips; duration: 250; from: padX; to: padX / 2; easing.type: Easing.InQuad }
            OpacityAnimator { target: caption; duration: 250; from: 1; to: 0 }
            OpacityAnimator { target: tips; duration: 250; from: 1; to: 0 }
            OpacityAnimator { target: statistic; duration: 250; from: 1; to: 0 }
            OpacityAnimator { target: decoration; duration: 250; from: 1; to: 0 }
            OpacityAnimator { target: loading; duration: 500; from: 1; to: 0 }
            OpacityAnimator { target: background; duration: 500; from: 1; to: 0 }
        }
    ]

    Rectangle {
        id: background
        anchors.fill: scene
        anchors.margins: -1 // bleed
        color: "black"
        opacity: 0
    }

    Shape {
        id: cover

        x: scene.width
        height: scene.height * (1 - 0.618)
        width: scene.width + gradientExtend * 2

        ShapePath {
            PathLine { x: 0;           y: 0 }
            PathLine { x: cover.width; y: 0 }
            PathLine { x: cover.width; y: cover.height }
            PathLine { x: 0;           y: cover.height }

            strokeWidth: -1
            fillGradient: LinearGradient {
                x1: cover.height * Math.tan(gradientAngle)
                y1: 0
                x2: (cover.width - x1) * Math.cos(gradientAngle) * Math.cos(gradientAngle) + x1
                y2: (cover.width - x1) * Math.sin(gradientAngle) * Math.cos(gradientAngle)
                GradientStop { color: "transparent"; position: 0 }
                GradientStop { color: "white"; position: 0.1 }
                GradientStop { color: "white"; position: 0.9 }
                GradientStop { color: "transparent"; position: 1 }
            }
        }
    }

    ShaderEffectSource { // squred gradient effect
        id: cover2
        anchors.fill: cover
        sourceItem: cover
    }

    Text {
        id: caption
        anchors.bottom: cover.bottom
        anchors.bottomMargin: 4

        x: padX
        opacity: 0
        text: "\"Link\" Start!"
        font.family: "Arial"
        font.pixelSize: 40
        font.italic: true
    }

    Text {
        id: tips
        anchors.top: cover.bottom
        anchors.topMargin: 18

        x: padX
        opacity: 0
        text: "The SAO Utilities Project"
        color: "white"
        font.family: "Arial"
        font.pixelSize: 30
        font.italic: true
        font.weight: Font.Bold
    }

    Statistic {
        id: statistic
        anchors.top: scene.top
        anchors.topMargin: padY
        anchors.right: scene.right
        anchors.rightMargin: padX
        opacity: 0
    }

    Decoration {
        id: decoration
        anchors.bottom: cover.bottom
        anchors.right: scene.right
        anchors.rightMargin: padX
        opacity: 0
    }

    BusyIndicator {
        id: loading
        anchors.left: scene.left
        anchors.bottom: scene.bottom
        anchors.leftMargin: padX
        anchors.bottomMargin: padY
        opacity: 0
    }

    ProgressBar {
        id: progress
        anchors.right: scene.right
        anchors.bottom: scene.bottom
        anchors.rightMargin: padX
        anchors.bottomMargin: padY

        opacity: 0
    }
}
