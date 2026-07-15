import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import "../UI"

Badge {
    id: root
    clickable: false
    verticalPadding: 8

    readonly property var focused: Hyprland.focusedWorkspace

    RowLayout {
        spacing: 5
        anchors.centerIn: parent

        Repeater {
            model: 9

            WorkspaceButton {
                required property int index
                readonly property var ws: Hyprland.workspaces.values.find(ws => ws.id === index + 1)

                workspaceId: ws?.id ?? index + 1
                isActive: root.focused?.id === index + 1
                hasWindows: ws?.toplevels.values.length > 0
            }
        }
    }
}
