import QtQuick
import QtQuick.Layouts
import Quickshell.Networking
import Quickshell.Bluetooth

import "../UI"
import "../Modules"
import qs.Services

Badge {
    id: root
    horizontalPadding: 15
    verticalPadding: 3

    onClicked: {
        if (RightSidePanelState.expanded)
            if (RightSidePanelState.page === RightSidePanelState.Page.Network)
                RightSidePanelState.close();
            else
                RightSidePanelState.page = RightSidePanelState.Page.Network;
        else
            RightSidePanelState.open(RightSidePanelState.Page.Network);
    }

    property var networkDevices: NetworkService.networkDevices
    property NetworkDevice wiredDevice: NetworkService.wiredDevice
    property NetworkDevice wifiDevice: NetworkService.wifiDevice
    property int connectivity: Networking.connectivity

    property string networkIcon: {
        if (root.wiredDevice && root.wiredDevice.connected)
            return String.fromCodePoint(0xf0200);

        if (!root.wifiDevice || !Networking.wifiEnabled)
            return String.fromCodePoint(0xf092b);

        if (!root.wifiDevice.connected)
            return String.fromCodePoint(0xf092e);

        const connectedNetwork = root.wifiDevice.networks.values.find(n => n.connected);
        const strength = connectedNetwork.signalStrength;
        const tier = strength >= 0.75 ? 4 : strength >= 0.5 ? 3 : strength >= 0.25 ? 2 : 1;
        return String.fromCodePoint(0xf091f + (tier - 1) * 3);
    }

    property var bluetoothAdapter: Bluetooth.defaultAdapter
    property string bluetoothIcon: {
        if (!bluetoothAdapter || !bluetoothAdapter.enabled)
            return String.fromCodePoint(0xf00b2);

        const connected = bluetoothAdapter.devices.values.some(d => d.connected);

        return connected ? String.fromCodePoint(0xf00b1) : String.fromCodePoint(0xf00af);
    }

    RowLayout {
        spacing: 15
        anchors.centerIn: parent

        Label {
            text: root.networkIcon
            font.pixelSize: 18
            font.bold: true
            font.weight: 700
        }
        Label {
            text: root.bluetoothIcon

            font.pixelSize: 18
            font.bold: true
            font.weight: 700
        }
    }
}
