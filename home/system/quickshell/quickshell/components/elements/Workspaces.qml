import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    id: workspaceTuple

    // 1. Same required properties style as your clock
    required property string fgColor
    required property string bgColor
    required property var colors // Passing the whole theme object for extra accent colors

    // Visual container styling
    radius: 99
    Layout.preferredWidth: rowLayout.implicitWidth + 20 // Padding inside the tuple
    Layout.fillHeight: true
    color: bgColor

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 8

        // 2. Repeater for your workspaces (e.g., workspaces 1 through 5)
        Repeater {
            model: 5 // Adjust this number based on how many you want, or bind to a compositor list

            delegate: Rectangle {
                id: dot

                // Mocking states for preview.
                // In production, replace these with actual window manager bindings:
                // e.g., active: index + 1 === Hyprland.activeWorkspace.id
                readonly property bool isActive: index === 0
                readonly property bool hasWindows: index < 3

                radius: 99
                height: 10

                // 3. Dynamic color based on window presence & active state
                color: {
                    if (isActive)
                        return fgColor; // Filled if active
                    if (hasWindows)
                        return colors?.color4 ?? "#8E8AA0"; // Different color if it has a window
                    return "transparent"; // Empty circle if completely vacant
                }

                border.color: fgColor
                border.width: isActive || hasWindows ? 0 : 1.5

                // 4. Smooth pill animation when changing active workspace
                implicitWidth: isActive ? 28 : 10

                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 150
                    }
                }
            }
        }
    }
}
