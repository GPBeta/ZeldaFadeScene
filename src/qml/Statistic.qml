import QtQuick 2.12

Column {
    Grid { // HP
        anchors.right: parent.right
        anchors.rightMargin: 7

        columns: 15
        columnSpacing: 4
        rowSpacing: 10
        layoutDirection: Qt.RightToLeft

        Repeater {
            id: hp
            delegate: Image {
                source: "/images/hp.png"
            }
        }
    }

    Item { width: 1; height: 8; visible: mp.model > 0 }

    Row { // MP
        anchors.right: parent.right
        anchors.rightMargin: 5

        spacing: 3

        Repeater {
            id: mp
            delegate: Image {
                source: "/images/mp.png"
            }
        }
    }

    Item { width: 1; height: 10 }

    IconText {  // Kokufuku no Akashi
        id: kokufuku
        anchors.right: parent.right
        source: "/images/kokufuku.png"
    }

    IconText {  // Shiren no Hokora
        id: shiren
        anchors.right: parent.right
        source: "/images/shiren.png"
    }

    IconText {  // Korogu no Mi
        id: korogu
        anchors.right: parent.right
        source: "/images/korogu.png"
    }

    IconText {  // Rupi
        id: rupi
        anchors.right: parent.right
        source: "/images/rupi.png"
    }

    Component.onCompleted: {
        var nShiren = Math.round(Math.random() * 120)
        var nUpgrade = Math.floor(nShiren / 4)
        var nHP = Math.round(Math.random() * nUpgrade)
        if (nHP > 24)
            nHP = 24
        var nMP = nUpgrade - nHP
        if (nMP > 10)
            nMP = 10

        hp.model = nHP + 3
        mp.model = nMP >= 5 ? 1 + Math.floor(nMP / 5) : 0
        kokufuku.text = nShiren - (nHP + nMP) * 4
        shiren.text = nShiren
        rupi.text = Math.round(Math.random() * 999999)
        korogu.text = Math.round(Math.random() * 900)
    }
}
