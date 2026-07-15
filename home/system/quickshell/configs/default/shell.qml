import Quickshell

import qs.Modules
import qs.Services

ShellRoot {
    id: shellRoot
    readonly property var theme: themeLoader.colors

    ThemeLoader {
        id: themeLoader
    }

    Bar {}
    RightSidePanel {}
}
