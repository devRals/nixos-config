import QtQuick
import QtQuick.Layouts
import "../Services" as Services
import "../UI" as UI

Rectangle {
    id: card
    Layout.fillWidth: true
    implicitHeight: visible ? 80 : 0
    visible: !!node && node.audio !== null
    radius: 10
    color: "#" + (hoverArea.containsMouse ? theme.base02 : theme.base01)
    border.color: isDefault ? "#" + theme.base0D : "transparent"
    border.width: 1

    property var node
    readonly property bool isApp: node?.isStream ?? false
    readonly property bool isDefault: {
        if (!node) return false;
        if (isApp) return false;
        if (node.isSink) {
            return node === Services.AudioService.sink;
        } else {
            return node === Services.AudioService.source;
        }
    }

    readonly property bool isMuted: node?.audio?.muted ?? false
    readonly property real volumeVal: node?.audio?.volume ?? 0.0

    Behavior on color {
        ColorAnimation { duration: 100 }
    }

    // Entire card hover detection
    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    // Click detection only on the top portion of the card (preventing collision with slider)
    MouseArea {
        id: clickArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: sliderRow.top
        enabled: !isApp
        onClicked: {
            if (!node) return;
            if (node.isSink) {
                Services.AudioService.setAudioSink(node);
            } else {
                Services.AudioService.setAudioSource(node);
            }
        }
    }

    // Left highlight stripe for active/default device
    Rectangle {
        width: 4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 1
        color: "#" + theme.base0D
        visible: card.isDefault
        topLeftRadius: card.radius - 1
        bottomLeftRadius: card.radius - 1
    }

    function getIcon(node) {
        if (!node) return String.fromCodePoint(0xf0581); // Mute icon
        
        if (node.isStream) {
            let appName = "";
            if (node.properties) {
                appName = (node.properties["application.name"] || node.properties["node.name"] || "").toLowerCase();
            }
            if (!appName) appName = (node.name || "").toLowerCase();
            
            if (appName.includes("spotify")) return String.fromCodePoint(0xf04c7); // nf-md-spotify
            if (appName.includes("firefox")) return String.fromCodePoint(0xf0239); // nf-md-firefox
            if (appName.includes("chrome") || appName.includes("chromium")) return String.fromCodePoint(0xf02af); // nf-md-google_chrome
            if (appName.includes("discord")) return String.fromCodePoint(0xf066f); // nf-md-discord
            if (appName.includes("steam")) return String.fromCodePoint(0xf04d3); // nf-md-steam
            if (appName.includes("telegram")) return String.fromCodePoint(0xf0361); // nf-md-telegram
            if (appName.includes("vlc") || appName.includes("mpv")) return String.fromCodePoint(0xf057c); // nf-md-vlc
            return String.fromCodePoint(0xf0c7d); // nf-md-application
        } else {
            let name = (node.name || "").toLowerCase();
            let desc = (node.description || "").toLowerCase();
            
            if (desc.includes("headphone") || desc.includes("headset") || name.includes("headphone") || name.includes("headset")) {
                return String.fromCodePoint(0xf02cb); // nf-md-headphones
            }
            if (desc.includes("bluetooth") || name.includes("bluez") || name.includes("bluetooth")) {
                return String.fromCodePoint(0xf00af); // nf-md-bluetooth
            }
            if (desc.includes("hdmi") || desc.includes("tv") || desc.includes("monitor") || name.includes("hdmi")) {
                return String.fromCodePoint(0xf0841); // nf-md-monitor
            }
            if (node.isSink) {
                return String.fromCodePoint(0xf04c3); // nf-md-speaker
            } else {
                return String.fromCodePoint(0xf036c); // nf-md-microphone
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 4

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            UI.Label {
                text: getIcon(node)
                size: 16
                textColor: card.isMuted ? "#" + theme.base08 : (card.isApp ? "#" + theme.base0B : (card.isDefault ? "#" + theme.base0D : "#" + theme.base05))
                font.bold: true
            }

            UI.Label {
                text: {
                    if (!node) return "Unknown";
                    if (card.isApp) {
                        let appName = "";
                        if (node.properties) {
                            appName = node.properties["application.name"] || node.properties["node.name"];
                        }
                        return appName ?? node.description ?? node.name ?? "Application";
                    } else {
                        return node.description ?? node.name ?? "Hardware Device";
                    }
                }
                Layout.fillWidth: true
                size: 11
                font.bold: card.isDefault || card.isApp
                elide: Text.ElideRight
            }

            Rectangle {
                id: muteBtn
                width: 24
                height: 24
                radius: 12
                color: muteBtnHover.containsMouse ? "#" + theme.base03 : "transparent"

                UI.Label {
                    anchors.centerIn: parent
                    text: {
                        if (node.isSink) {
                            return card.isMuted ? String.fromCodePoint(0xf0581) : String.fromCodePoint(0xf057e);
                        } else {
                            return card.isMuted ? String.fromCodePoint(0xf036d) : String.fromCodePoint(0xec1c);
                        }
                    }
                    size: 12
                    textColor: card.isMuted ? "#" + theme.base08 : "#" + theme.base04
                }

                MouseArea {
                    id: muteBtnHover
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if (node.audio) {
                            node.audio.muted = !node.audio.muted;
                        }
                    }
                }
            }
        }

        RowLayout {
            id: sliderRow
            Layout.fillWidth: true
            spacing: 6

            UI.Slider {
                Layout.fillWidth: true
                Layout.preferredHeight: 32
                value: card.volumeVal
                activeColor: card.isMuted ? "#" + theme.base03 : (card.isApp ? "#" + theme.base0B : (card.isDefault ? "#" + theme.base0D : "#" + theme.base05))
                handleColor: card.isMuted ? "#" + theme.base03 : (card.isApp ? "#" + theme.base0B : (card.isDefault ? "#" + theme.base0D : "#" + theme.base05))
                inactiveColor: "#" + theme.base03

                onMoved: {
                    if (node.audio) {
                        node.audio.muted = false;
                        node.audio.volume = value;
                    }
                }

                onWheelUp: {
                    if (node.audio) {
                        node.audio.muted = false;
                        node.audio.volume = Math.min(1.0, node.audio.volume + 0.05);
                    }
                }

                onWheelDown: {
                    if (node.audio) {
                        node.audio.muted = false;
                        node.audio.volume = Math.max(0.0, node.audio.volume - 0.05);
                    }
                }
            }

            UI.Label {
                text: Math.round(card.volumeVal * 100) + "%"
                size: 10
                textColor: card.isMuted ? "#" + theme.base03 : "#" + theme.base04
                horizontalAlignment: Text.AlignRight
                width: 28
            }
        }
    }
}
