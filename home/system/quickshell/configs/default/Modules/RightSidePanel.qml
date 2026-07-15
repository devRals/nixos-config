import QtQuick
import Quickshell

import qs.Modules
import "../UI" as UI

PanelWindow {
    id: root

    aboveWindows: true
    anchors.top: true
    anchors.right: true
    margins.top: 9

    implicitWidth: RightSidePanelState.expanded ? 350 : 10
    implicitHeight: 600
    color: "transparent"

    Rectangle {
        id: container
        anchors.fill: parent
        opacity: RightSidePanelState.expanded ? 1 : 0
        border.color: "#" + theme.base01
        border.width: 1

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }

        color: "#" + theme.base00
        topLeftRadius: 20
        bottomLeftRadius: 20

        Loader {
            anchors.fill: parent
            anchors.margins: 20
            visible: RightSidePanelState.expanded
            sourceComponent: switch (RightSidePanelState.page) {
            case RightSidePanelState.Page.Network:
                return networkAndBluetooth;
            case RightSidePanelState.Page.Audio:
                return audioMixer;
            default:
                return notFound;
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            propagateComposedEvents: true

            onExited: {
                hoverInTimer.stop();
                hoverOutTimer.start();
            }
            onEntered: {
                hoverInTimer.start();
                hoverOutTimer.stop();
            }
        }

        Timer {
            id: hoverInTimer
            interval: 100
            onTriggered: {
                RightSidePanelState.expanded = true;
            }
        }

        Timer {
            id: hoverOutTimer
            interval: 300
            onTriggered: RightSidePanelState.close()
        }
    }

    Component {
        id: notFound
        UI.Label {
            text: "Not found :3"
        }
    }
    Component {
        id: networkAndBluetooth

        NetworksAndBluetooth {}
    }
    Component {
        id: audioMixer
        AudioMixer {}
    }
}
