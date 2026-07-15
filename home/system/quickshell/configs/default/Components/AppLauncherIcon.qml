import QtQuick
import Quickshell

import qs.UI

Badge {
    id: root
    horizontalPadding: 5
    Text {
        anchors.centerIn: parent
        text: String.fromCodePoint(0xf313)
        color: "#" + theme.base07

        font {
            pixelSize: 20
        }
    }

    onClicked: {}
}
