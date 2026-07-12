import QtQuick

import QtQuick

Text {
    property color textColor: "#" + theme.base05
    property int size: 13
    property int weight: Font.Medium

    color: textColor

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: size
    font.weight: weight

    renderType: Text.NativeRendering

    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
}
