import QtQuick
import Quickshell
import Quickshell.Io

FileView {
    id: walWatcher
    watchChanges: true
    path: Quickshell.env("HOME") + "/.cache/wal/colors.json"

    property var special: walColors.special
    property var colors: walColors.colors

    onFileChanged: walWatcher.reload()

    JsonAdapter {
        id: walColors

        property var special: ({
                background: "#0D0B19",
                foreground: "#C2C2C5"
            })
        property var colors: ({
                color0: "#0A0A0C",
                color1: "#110F12",
                color2: "#2D2A36",
                color3: "#514D63",
                color4: "#8E8AA0",
                color5: "#C2BED6",
                color6: "#D8D5EA",
                color7: "#EAE7F7",
                color8: "#E07080",
                color9: "#D49070",
                color10: "#C4B060",
                color11: "#80B880",
                color12: "#70B8C0",
                color13: "#9E97F8",
                color14: "#C090E8",
                color15: "#D080A0"
            })

        readonly property string background: special.background
        readonly property string foreground: special.foreground
    }
}
