import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Networking

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
                    text: String.fromCodePoint(0xf092b) // nf-md-wifi
                    size: 18
                    textColor: "#" + theme.base0D
                    font.bold: true
                }

                UI.Label {
                    text: "Network Settings"
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

            // Wired Section
            ColumnLayout {
                property var wiredDevice: Services.NetworkService.wiredDevice
                Layout.fillWidth: true
                spacing: 8
                visible: wiredDevice && wiredDevice.connected

                UI.Label {
                    text: "WIRED"
                    size: 10
                    textColor: "#" + theme.base04
                    font.bold: true
                    Layout.bottomMargin: 2
                }

                UI.NetworkEntry {
                    device: parent.wiredDevice
                }
            }

            // Wireless Section
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8
                visible: !!Services.NetworkService.wifiDevice

                RowLayout {
                    Layout.fillWidth: true

                    UI.Label {
                        text: "WIRELESS"
                        size: 10
                        textColor: "#" + theme.base04
                        font.bold: true
                        Layout.bottomMargin: 2
                        Layout.topMargin: 8
                        Layout.fillWidth: true
                    }

                    // This looks like a placeholder for a refresh button, but it's not functional.
                    // The actual rescan functionality is now triggered by the dedicated button above.
                    Rectangle {
                        id: rescanIcon
                        property bool hovered: false
                        width: 20
                        height: 20
                        radius: height / 2
                        color: hovered ? "#" + theme.base03 : "transparent"

                        UI.Label {
                            anchors.centerIn: parent
                            text: String.fromCodePoint(0xf021)
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            onEntered: parent.hovered = true
                            onExited: parent.hovered = false
                            onClicked: {
                                Services.NetworkService.scan();
                            }
                        }
                        RotationAnimation {
                            target: rescanIcon
                            property: "rotation"

                            from: 0
                            to: 360
                            duration: 1000
                            loops: Animation.Infinite
                            running: Services.NetworkService.scanning
                        }
                    }
                }

                Repeater {
                    model: {
                        if (!Services.NetworkService.wifiDevice)
                            return [];
                        const networks = Services.NetworkService.wifiDevice.networks.values;
                        // Sort: connected first, then by signal strength
                        return networks.slice().sort((a, b) => {
                            if (a.connected)
                                return -1;
                            if (b.connected)
                                return 1;
                            return b.signalStrength - a.signalStrength;
                        });
                    }
                    delegate: UI.NetworkEntry {
                        network: modelData
                    }
                }
            }
        }
    }
}
