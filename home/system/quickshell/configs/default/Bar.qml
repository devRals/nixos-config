import QtQuick
import QtQuick.Layouts
import Quickshell

import "./components"

PanelWindow {
    readonly property var theme: shellRoot.theme

    anchors {
        top: true
        left: true
        right: true
    }
    margins {
        left: 5
        right: 5
        bottom: 0
        top: 5
    }

    implicitHeight: 30
    color: "#" + theme.base00

    RowLayout {
        id: barItems
        spacing: 8
        anchors {
            top: parent.top
            bottom: parent.bottom
        }

        AppLauncherIcon {}
        Clock {}
        Workspaces {}
    }
}
