# ``Bluetooth``

Pure Swift Bluetooth Definitions.

## Usage

```swift
import Bluetooth

let uuid128bit = BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")
let uuid16bit = BluetoothUUID(rawValue: "FEA9")
let address = BluetoothAddress(rawValue: "00:1A:7D:DA:71:13")
```

## Topics

### Bluetooth Types

- ``BluetoothAddress``
- ``BluetoothUUID``
- ``LowEnergyAdvertisingData``
- ``AppleBeacon``

### Identifiers

- ``CompanyIdentifier``
- ``UnitIdentifier``
- ``ClassOfDevice``

### Socket

- ``L2CAPSocket``
- ``L2CAPSocketEvent``
- ``L2CAPSocketEventStream``

### Integer Types

- ``UInt24``
- ``UInt40``
- ``UInt48``
- ``UInt128``
- ``UInt256``
- ``UInt512``
- ``SFloat``

### Range of Values

- ``LowEnergyScanTimeInterval``
- ``RSSI``
