import QtQuick
import Quickshell
import Quickshell.Io

FileView {
    path: Quickshell.env("HOME") + "/.config/stylix/palette.json"
    watchChanges: true
    onFileChanged: reload()

    readonly property var colors: data

    JsonAdapter {
        id: data

        property string base00
        property string base01
        property string base02
        property string base03
        property string base04
        property string base05
        property string base06
        property string base07
        property string base08
        property string base09
        property string base0A
        property string base0B
        property string base0C
        property string base0D
        property string base0E
        property string base0F

        property string scheme
    }
}
