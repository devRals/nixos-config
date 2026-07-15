pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    readonly property BluetoothAdapter bluetoothAdapter: Bluetooth.defaultAdapter
    readonly property list<BluetoothAdapter> adapters: Bluetooth.adapters.values

    function pairDevice(address: string) {
        Bluetooth.devices.values.find(d => d.address.toLowerCase() === address.toLowerCase()).pair();
    }
}
