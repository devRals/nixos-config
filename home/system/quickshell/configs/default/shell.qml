import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

ShellRoot {
    id: shellRoot
    readonly property var theme: themeLoader.colors

    ThemeLoader {
        id: themeLoader
    }

    Bar {}
}
