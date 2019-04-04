import QtQuick 2.12

Item {
    id: indicator

    property real arrangeRadius: 10
    property real shapeRadius: 3

    property real offsetX: Math.sin(Math.PI / 3) * arrangeRadius
    property real offsetY: Math.cos(Math.PI / 3) * arrangeRadius

    implicitWidth: (arrangeRadius + shapeRadius) * 2
    implicitHeight: implicitWidth

    BusyCircle {
        id: circleT
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius
    }

    BusyCircle {
        id: circleB
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius
        y: indicator.arrangeRadius * 2
    }

    BusyCircle {
        id: circleTR
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius + indicator.offsetX
        y: indicator.arrangeRadius - indicator.offsetY
    }

    BusyCircle {
        id: circleBR
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius + indicator.offsetX
        y: indicator.arrangeRadius + indicator.offsetY
    }

    BusyCircle {
        id: circleTL
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius - indicator.offsetX
        y: indicator.arrangeRadius - indicator.offsetY
    }

    BusyCircle {
        id: circleBL
        radius: indicator.shapeRadius
        x: indicator.arrangeRadius - indicator.offsetX
        y: indicator.arrangeRadius + indicator.offsetY
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            ScaleAnimator { target: circleT;  from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleBL; from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleBR; from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }

            ScaleAnimator { target: circleB;  from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleTL; from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleTR; from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
        }
        ParallelAnimation {
            ScaleAnimator { target: circleB;  from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleTL; from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleTR; from: 0.5; to: 1; duration: 400; easing.type: Easing.InOutQuad }

            ScaleAnimator { target: circleT;  from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleBL; from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
            ScaleAnimator { target: circleBR; from: 1; to: 0.5; duration: 400; easing.type: Easing.InOutQuad }
        }
    }
}
