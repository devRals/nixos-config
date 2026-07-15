import QtQuick
import QtQuick.Layouts
import Quickshell

import "../Components" as Components

PanelWindow {
    id: bar
    aboveWindows: false
    anchors {
        top: true
        left: true
        right: true
    }
    margins {
        left: 10
        right: 10
        bottom: 0
        top: 5
    }
    implicitHeight: 30
    color: "transparent"

    RowLayout {
        id: barLeftItems
        spacing: 8
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        Components.AppLauncherIcon {}
        Components.Clock {}
        Components.Workspaces {}
        Components.WindowTitle {}
    }

    RowLayout {
        id: barCenterItems
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            bottom: parent.bottom
        }
    }

    RowLayout {
        id: barRightItems
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        Components.NetworkPill {}
        Components.AudioPill {}
        Components.SessionIcon {}
    }
}
