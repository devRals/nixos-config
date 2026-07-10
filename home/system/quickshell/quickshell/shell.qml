import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "./components/elements"

ShellRoot {
    id: shellRoot

    ThemeLoader {
        id: theme
    }

    PanelWindow {
        id: barRoot
        anchors.left: true
        anchors.right: true
        anchors.top: true
        margins.left: 5
        margins.top: 5
        margins.right: 5
        margins.bottom: 0
        implicitHeight: 30
        color: "transparent"

        RowLayout {

            RowLayout {
                Clock {
                    bgColor: theme.special.background
                    fgColor: theme.colors.color3
                }

                Workspaces {
                    fgColor: theme.colors.color3
                    bgColor: theme.special.background
                    colors: theme.colors
                }
            }
        }
    }
}
