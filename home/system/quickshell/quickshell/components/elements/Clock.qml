import QtQuick
import Quickshell

Rectangle {
    id: clock

    required property string fgColor
    required property string bgColor

    radius: 99
    width: 80
    height: barRoot.height
    color: bgColor

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(sysClock.date, "hh:mm")

        color: fgColor
        font {
            bold: true
            weight: 600
        }
    }

    SystemClock {
        id: sysClock
        precision: SystemClock.Minutes
    }
}
