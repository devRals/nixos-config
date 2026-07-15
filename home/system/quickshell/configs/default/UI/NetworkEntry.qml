import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Networking
import "../UI" as UI

Rectangle {
    id: root
    Layout.fillWidth: true
    implicitHeight: mainLayout.height + 20
    radius: 10
    // Color changes on hover or if password field is active
    color: hoverArea.containsMouse || (showingPassword && passwordField.activeFocus) ? "#" + theme.base02 : "#" + theme.base01

    property var network: null // For Wi-Fi networks
    property var device: null  // For wired devices

    readonly property bool isWired: !!device
    readonly property bool isConnected: isWired ? device.connected : (network ? network.connected : false)
    readonly property string name: isWired ? "Wired Connection" : (network ? network.name : "Unknown Network")

    readonly property bool isSecured: !isWired && network && network.security !== WifiSecurityType.Open
    property bool showingPassword: false // Controls visibility of password field

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            if (isConnected) {
                // If already connected, do nothing on click.
                // Future: could implement disconnect or show connection details.
                return;
            }

            if (isSecured) {
                // If secured and not connected, toggle password field visibility
                showingPassword = !showingPassword;
                if (showingPassword) {
                    passwordField.forceActiveFocus(); // Focus password field when shown
                }
            } else {
                // If not secured (open network or wired) and not connected, attempt to connect
                if (isWired) {
                    // Wired connections usually auto-connect. If not, this would be the place to trigger it.
                    // For now, assuming system handles wired auto-connection.
                } else if (network) {
                    // Attempt to connect to an open Wi-Fi network
                    network.connect();
                }
            }
        }
    }

    // Helper function to get Wi-Fi signal strength icon
    function getWifiIcon(strength) {
        const tier = strength >= 0.75 ? 4 : strength >= 0.5 ? 3 : strength >= 0.25 ? 2 : 1;
        // Icons are based on font code points, adjusted for strength tiers
        return String.fromCodePoint(0xf091f + (tier - 1) * 3);
    }

    ColumnLayout {
        id: mainLayout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 12
        spacing: 8

        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            // Network Icon (Wired or Wi-Fi strength)
            UI.Label {
                text: isWired ? String.fromCodePoint(0xf0200) : (network ? getWifiIcon(network.signalStrength) : String.fromCodePoint(0xf092e))
                size: 18
                textColor: isConnected ? "#" + theme.base0B : "#" + theme.base05
            }

            // Column for Network Name and Status
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 2

                // Row for Network Name and Signal Strength Indicator
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 4 // Space between name and signal strength icon

                    UI.Label {
                        id: networkNameLabel
                        text: root.name
                        size: 13
                        font.bold: isConnected
                        Layout.fillWidth: true // Allow it to take up available space
                        elide: Text.ElideRight // Ensure text is elided if too long
                    }
                    // Lock icon for secured networks (visible when not connected)
                    UI.Label {
                        visible: isSecured && !isConnected
                        text: String.fromCodePoint(0xf033e) // nf-md-lock
                        size: 14
                        textColor: "#" + theme.base03
                    }
                }

                // Status/Security Label (e.g., "Connected", "Secured", "Open")
                UI.Label {
                    text: isConnected ? "Connected" : (isSecured ? "Secured" : "Open")
                    size: 10
                    textColor: "#" + theme.base04
                }
            }
        }

        // Password Input Section (only shown when connecting to a secured network)
        RowLayout {
            id: passwordSection
            Layout.fillWidth: true
            visible: showingPassword && !isConnected
            spacing: 8

            TextField {
                id: passwordField
                Layout.fillWidth: true
                placeholderText: "Password..."
                echoMode: TextField.Password
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 12

                // Styling for the text field background
                background: Rectangle {
                    color: "#" + theme.base00
                    radius: 4
                    border.color: passwordField.activeFocus ? "#" + theme.base0D : "#" + theme.base03
                    border.width: 1
                }

                color: "#" + theme.base05
                placeholderTextColor: "#" + theme.base03

                // Action when Enter key is pressed in password field
                onAccepted: {
                    if (network) {
                        // Use connectWithPsk for secured networks
                        network.connectWithPsk(passwordField.text);
                        root.showingPassword = false; // Hide password field
                        passwordField.text = ""; // Clear password
                    }
                }
            }

            // Connect button for entering password
            Rectangle {
                width: 32
                height: 32
                radius: 4
                // Color changes on hover
                color: connectHover.containsMouse ? "#" + theme.base0D : "#" + theme.base02

                UI.Label {
                    anchors.centerIn: parent
                    text: String.fromCodePoint(0xf012c) // nf-md-check (checkmark icon)
                    textColor: connectHover.containsMouse ? "#" + theme.base00 : "#" + theme.base0B
                }

                MouseArea {
                    id: connectHover
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (network) {
                            // Use connectWithPsk for secured networks
                            network.connectWithPsk(passwordField.text);
                            root.showingPassword = false; // Hide password field
                            passwordField.text = ""; // Clear password
                        }
                    }
                }
            }
        }
    }
}
