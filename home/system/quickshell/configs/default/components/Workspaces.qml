import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import "../ui"

Badge {
    verticalPadding: 5

    RowLayout {
        spacing: 5

        Repeater {
            model: Hyprland.focusedWorkspace?.id > 5 ? Hyprland.focusedWorkspace.id : 5

            delegate: WorkspaceButton {

                workspaceIndex: index + 1
                isActive: index + 1 === Hyprland.focusedWorkspace?.id
            }
        }
    }
}
