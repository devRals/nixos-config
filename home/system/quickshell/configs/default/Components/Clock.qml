import QtQuick
import Quickshell

import "../UI"

Badge {
    verticalPadding: 5
    horizontalPadding: 15

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Label {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "hh:mm")
        font.weight: 700
        font.bold: true
        font.pixelSize: 14
    }

    cursorShape: Qt.PointingHandCursor
    onClicked: {}
}
