import "../UI"

Badge {
    verticalPadding: 5
    horizontalPadding: 9
    Label {
        anchors.centerIn: parent
        text: String.fromCodePoint(0x23fb)
        font.pixelSize: 14
        font.bold: true
        font.weight: 700
    }
}
