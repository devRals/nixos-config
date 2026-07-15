import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Services" as Services
import "../UI" as UI

Item {
    id: root
    anchors.fill: parent

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true
        rightPadding: 8

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
            contentItem: Rectangle {
                implicitWidth: 4
                radius: 2
                color: parent.hovered || parent.active ? "#" + theme.base04 : "#" + theme.base02
            }
        }

        ColumnLayout {
            width: scrollView.width - scrollView.rightPadding
            spacing: 16

            // Header Section
            RowLayout {
                Layout.fillWidth: true
                spacing: 10
                
                UI.Label {
                    text: String.fromCodePoint(0xf057e) // nf-md-volume_high
                    size: 18
                    textColor: "#" + theme.base0D
                    font.bold: true
                }
                
                UI.Label {
                    text: "Audio Control"
                    size: 15
                    font.bold: true
                    Layout.fillWidth: true
                }
            }

            // Divider
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#" + theme.base01
            }

            // Output Devices
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                UI.Label {
                    text: "OUTPUT DEVICES"
                    size: 10
                    textColor: "#" + theme.base04
                    font.bold: true
                    Layout.bottomMargin: 2
                }

                Repeater {
                    model: Services.AudioService.sinks
                    delegate: UI.MixerEntry {
                        node: modelData
                    }
                }
            }

            // Input Devices
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                UI.Label {
                    text: "INPUT DEVICES"
                    size: 10
                    textColor: "#" + theme.base04
                    font.bold: true
                    Layout.bottomMargin: 2
                    Layout.topMargin: 8
                }

                Repeater {
                    model: Services.AudioService.sources
                    delegate: UI.MixerEntry {
                        node: modelData
                    }
                }
            }

            // Applications
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                UI.Label {
                    text: "APPLICATIONS"
                    size: 10
                    textColor: "#" + theme.base04
                    font.bold: true
                    Layout.bottomMargin: 2
                    Layout.topMargin: 8
                }

                Repeater {
                    model: Services.AudioService.playbackStreams
                    delegate: UI.MixerEntry {
                        node: modelData
                    }
                }

                UI.Label {
                    visible: Services.AudioService.playbackStreams.length === 0
                    text: "No applications playing audio"
                    textColor: "#" + theme.base03
                    size: 11
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 8
                    Layout.bottomMargin: 8
                }
            }
        }
    }
}
