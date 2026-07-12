import QtQuick
import Quickshell

import "../ui"

Badge {
    horizontalPadding: 5
    Text {
        text: String.fromCodePoint(0xf313)
        color: "#" + theme.base04

        font {
            pixelSize: 20
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            // TODO: Handle app launcher ipc call

        }
    }
}
