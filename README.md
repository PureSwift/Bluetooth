![Bluetooth](https://github.com/PureSwift/Bluetooth/raw/master/Assets/PureSwiftBluetooth.png)

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![Release][release-badge]][release-url]
[![License][mit-badge]][mit-url]

Pure Swift Bluetooth Definitions.


## Usage

```swift
import Bluetooth

let uuid128bit = BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")
let uuid16bit = BluetoothUUID(rawValue: "FEA9")
let address = BluetoothAddress(rawValue: "00:1A:7D:DA:71:13")
```

## Installation

### Swift Package Manager

```swift
import PackageDescription

let package = Package(
    name: "hcitool",
    products: [
        .executable(name: "hcitool", targets: ["hcitool"])
    ],
    dependencies: [
        .package(url: "https://github.com/PureSwift/Bluetooth.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "hcitool",
            dependencies: [
                "Bluetooth"
            ]
        )
    ]
)
```

## Documentation

Read the documentation [here](http://pureswift.github.io/Bluetooth/documentation/bluetooth/).
Documentation can be generated with [DocC](https://github.com/apple/swift-docc).

## Platforms

| Platform | Roles | Backend | Library |
| ---- | -------- | --- | ----------- | 
| macOS, iOS, watchOS, tvOS, visionOS | Central, Peripheral | [CoreBluetooth](https://developer.apple.com/documentation/corebluetooth) | [DarwinGATT](https://github.com/PureSwift/GATT) |
| Linux | Central, Peripheral | [BlueZ](https://www.bluez.org) | [BluetoothLinux](https://github.com/PureSwift/BluetoothLinux), [GATT](https://github.com/PureSwift/GATT)
| Android | Central | [Java Native Interface](https://developer.android.com/training/articles/perf-jni) | [AndroidBluetooth](https://github.com/PureSwift/AndroidBluetooth)
| WebAssembly | Central | [Bluetooth Web API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Bluetooth_API) | [BluetoothWeb](https://github.com/PureSwift/BluetoothWeb)
| Pi Pico W | Peripheral | [BTStack](https://bluekitchen-gmbh.com/btstack/#quick_start/index.html) | [BTStack](https://github.com/MillerTechnologyPeru/BTStack)
| ESP32 | Peripheral | [Apache NimBLE](https://mynewt.apache.org/latest/network/index.html) | [NimBLE](https://github.com/MillerTechnologyPeru/NimBLE)
| nRF52840 | Peripheral | [Zephyr SDK](https://zephyrproject.org) | [Zephyr](https://github.com/MillerTechnologyPeru/Zephyr-Swift)

License
-------

**Bluetooth** is released under the MIT license. See LICENSE for details.

[swift-badge]: https://img.shields.io/badge/swift-6.0-F05138.svg "Swift 6.0"
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux%20%7C%20Android-lightgrey.svg
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[build-status-badge]: https://github.com/PureSwift/Bluetooth/workflows/Swift/badge.svg
[build-status-url]: https://github.com/PureSwift/Bluetooth/actions
[release-badge]: https://img.shields.io/github/release/PureSwift/Bluetooth.svg
[release-url]: https://github.com/PureSwift/Bluetooth/releases
[docs-url]: http://pureswift.github.io/Bluetooth/documentation/bluetooth/
