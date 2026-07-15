import QtQuick
import Quickshell.Hyprland

import "../UI"

Badge {
    id: root
    verticalPadding: 3
    clickable: false
    cursorShape: Qt.ArrowCursor
    maxImplicitWidth: 300

    readonly property string desktopText: "Desktop"
    readonly property var activeTopLevelTitle: {
        const ws = Hyprland.focusedWorkspace;

        if (!ws)
            return desktopText;

        if (ws.toplevels.values.length === 0)
            return desktopText;

        return Hyprland.activeToplevel?.title ?? desktopText;
    }

    MarqueeLabel {
        id: marquee

        maxWidth: root.maxImplicitWidth
        anchors.centerIn: parent
        text: root.activeTopLevelTitle
        color: "#" + theme.base05
    }
}
