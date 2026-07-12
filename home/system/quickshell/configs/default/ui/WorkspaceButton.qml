import QtQuick
import Quickshell
import Quickshell.Hyprland

Rectangle {
    property int workspaceIndex: 0
    property int size: 13
    property bool isActive: false
    property string buttonColor: "#" + theme.base05

    implicitWidth: isActive ? size + 25 : size
    height: size

    radius: height / 2

    color: isActive ? buttonColor : "transparent"

    border.width: 2
    border.color: buttonColor

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
        }
    }
    Behavior on color {
        ColorAnimation {
            duration: 200
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton

        onClicked: {
            Hyprland.dispatch(`hl.dsp.focus({ workspace = ${workspaceIndex} })`);
        }
    }
}
