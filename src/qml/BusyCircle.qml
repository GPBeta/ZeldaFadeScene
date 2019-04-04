import QtQuick 2.12
import QtQuick.Shapes 1.12

//Shape {
//    id: shape

//    property real radius: 20
//    property alias color: path.fillColor

//    implicitWidth: radius * 2
//    implicitHeight: implicitWidth

//    ShapePath {
//        id: path
//        strokeWidth: -1

//        PathAngleArc {
//            centerX: shape.width * 0.5
//            centerY: shape.height * 0.5
//            radiusX: shape.radius
//            radiusY: shape.radius
//            startAngle: 0
//            sweepAngle: 360
//        }
//    }
//}
Rectangle {
    id: shape

    implicitWidth: radius * 2
    implicitHeight: implicitWidth
}
