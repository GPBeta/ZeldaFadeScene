import QtQuick 2.12

Row {

    Item { // Medou
        width: 120
        height: 110

        Image {
            id: medou
            source: "/images/medou.png"
        }
    }

    Item { // Naborisu
        width: 120
        height: 110

        Image {
            id: naborisu
            source: "/images/naborisu.png"
        }
    }

    Item { // Ruudania
        width: 120
        height: 110

        Image {
            id: ruudania
            y: 40
            source: "/images/ruudania.png"
        }
    }

    Item { // Rutta
        width: 120
        height: 110

        Image {
            id: rutta
            source: "/images/rutta.png"
        }
    }

    ParallelAnimation {
        running: true
        loops: Animation.Infinite
        // Rutta
        XAnimator { target: rutta; duration: 400; from: 20; to: 0 }
        SequentialAnimation {
            YAnimator { target: rutta; duration: 200; from: 36; to: 26; easing.type: Easing.OutQuad }
            YAnimator { target: rutta; duration: 200; from: 26; to: 36; easing.type: Easing.InQuad }
            PauseAnimation { duration: 1000 }
            XAnimator { target: rutta; duration: 1500; from: 0; to: 20; easing.type: Easing.OutQuad }
            PauseAnimation { duration: 500 }
        }
        // Ruudania
        XAnimator { target: ruudania; duration: 800; from: 20; to: 0; easing.type: Easing.OutQuad }
        SequentialAnimation {
            RotationAnimator { target: ruudania; duration: 200; from: 0; to: 15; easing.type: Easing.OutQuad }
            RotationAnimator { target: ruudania; duration: 200; from: 15; to: 0; easing.type: Easing.OutQuad }
            RotationAnimator { target: ruudania; duration: 200; from: 0; to: 8; easing.type: Easing.OutQuad }
            RotationAnimator { target: ruudania; duration: 200; from: 8; to: 0; easing.type: Easing.OutQuad }
            XAnimator { target: ruudania; duration: 2600; from: 0; to: 20; easing.type: Easing.OutQuad }
        }
        // Naborisu
        ParallelAnimation {
            loops: 2
            XAnimator { target: naborisu; duration: 400; from: 20; to: 10 }
            SequentialAnimation {
                YAnimator { target: naborisu; duration: 200; from: 36; to: 30; easing.type: Easing.OutQuad }
                YAnimator { target: naborisu; duration: 200; from: 30; to: 36; easing.type: Easing.OutQuad }
                YAnimator { target: naborisu; duration: 50;  from: 36; to: 38; easing.type: Easing.OutSine }
                YAnimator { target: naborisu; duration: 50;  from: 38; to: 36; easing.type: Easing.OutSine }
                YAnimator { target: naborisu; duration: 50;  from: 36; to: 37; easing.type: Easing.OutSine }
                YAnimator { target: naborisu; duration: 50;  from: 37; to: 36; easing.type: Easing.OutSine }
                PauseAnimation { duration: 600 }
                XAnimator { target: naborisu; duration: 500; from: 10; to: 20; easing.type: Easing.OutQuad }
            }
        }
        // Medou
        SequentialAnimation {
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 0; to: 3; easing.type: Easing.InSine }
                YAnimator { target: medou; duration: 425; from: 10; to: 8; easing.type: Easing.OutSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 3; to: 6; easing.type: Easing.OutSine }
                YAnimator { target: medou; duration: 425; from: 8; to: 10; easing.type: Easing.InSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 6; to: 9; easing.type: Easing.InSine }
                YAnimator { target: medou; duration: 425; from: 10; to: 12; easing.type: Easing.OutSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 9; to: 12; easing.type: Easing.OutSine }
                YAnimator { target: medou; duration: 425; from: 12; to: 10; easing.type: Easing.InSine }
            }

            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 12; to: 9; easing.type: Easing.InSine }
                YAnimator { target: medou; duration: 425; from: 10; to: 8; easing.type: Easing.OutSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 9; to: 6; easing.type: Easing.OutSine }
                YAnimator { target: medou; duration: 425; from: 8; to: 10; easing.type: Easing.InSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 6; to: 3; easing.type: Easing.InSine }
                YAnimator { target: medou; duration: 425; from: 10; to: 12; easing.type: Easing.OutSine }
            }
            ParallelAnimation {
                XAnimator { target: medou; duration: 425; from: 3; to: 0; easing.type: Easing.OutSine }
                YAnimator { target: medou; duration: 425; from: 12; to: 10; easing.type: Easing.InSine }
            }

        }

    }
}
