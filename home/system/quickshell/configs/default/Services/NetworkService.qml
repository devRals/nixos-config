pragma Singleton

import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
    id: root

    readonly property var networkDevices: Networking.devices.values
    readonly property NetworkDevice wiredDevice: networkDevices.find(d => d.type === DeviceType.Wired)
    readonly property NetworkDevice wifiDevice: networkDevices.find(d => d.type === DeviceType.Wifi)
    property bool scanning: false

    Timer {
        id: scanTimer
        interval: 15000
        onTriggered: {
            wifiDevice.scannerEnabled = false;
            scanning = false;
        }
    }

    function scan() {
        if (wifiDevice) {
            wifiDevice.scannerEnabled = true;
            scanning = true;
            scanTimer.start();
        }
    }

    Component.onCompleted: scan()
}
