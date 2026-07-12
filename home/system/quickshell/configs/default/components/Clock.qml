import QtQuick
import Quickshell

import "../ui"

Badge {
    verticalPadding: 3

    SystemClock {
        id: clock
        precision: SystemClock.minutes
    }

    Label {
        text: Qt.formatDateTime(clock.date, "hh:mm")
        font.weight: 700
        font.bold: true
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            // TODO: Handle calendar ipc call

        }
    }
}
