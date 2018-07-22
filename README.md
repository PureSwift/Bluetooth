![Bluetooth](https://github.com/PureSwift/Bluetooth/raw/master/Assets/PureSwiftBluetooth.png)

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![Release][release-badge]][release-url]
[![License][mit-badge]][mit-url]

[![Build Status][build-status-badge]][build-status-url]
[![CodeBeat][codebeat-badge]][codebeat-url]
[![Docs][docs-badge]][docs-url]

[![SPM compatible][spm-badge]][spm-url]
[![Carthage compatible][carthage-badge]][carthage-url]

Pure Swift Bluetooth Definitions.


## Usage

```swift
import Bluetooth

let uuid128bit = BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")
let uuid16bit = BluetoothUUID(rawValue: "FEA9")
let address = Address(rawValue: "00:1A:7D:DA:71:13")
```

## Installation

### Swift Package Manager

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/PureSwift/Bluetooth.git", majorVersion: 2)
        ]
)
```

### Carthage

```
github "PureSwift/Bluetooth"
```

## Documentation

Read the documentation [here](http://pureswift.github.io/Bluetooth/docs/).
Documentation can be generated with [Jazzy](https://github.com/realm/jazzy).
For more information, see the [gh-pages](https://github.com/PureSwift/Bluetooth/tree/gh-pages) branch.

## See Also

- [BluetoothLinux](https://github.com/PureSwift/BluetoothLinux) - Pure Swift Linux Bluetooth Stack
- [BluetoothDarwin](https://github.com/PureSwift/BluetoothDarwin) - Low Level Swift Bluetooth library for the Darwin kernel
- [BluetoothAndroid](https://github.com/PureSwift/BluetoothAndroid) - Swift Bluetooth stack for Android
- [GATT](https://github.com/PureSwift/GATT) - Bluetooth Generic Attribute Profile (GATT) for Swift
- [SwiftFoundation](https://github.com/PureSwift/SwiftFoundation) - Cross-Platform, Protocol-Oriented Programming base library to complement the Swift Standard Library.
- [Cacao](https://github.com/PureSwift/Cacao) - Pure Swift Cross-platform UIKit
- [Silica](https://github.com/PureSwift/Silica) - Pure Swift CoreGraphics (Quartz2D) implementation
- [Predicate](https://github.com/PureSwift/Predicate) - Pure Swift Predicate implementation 

License
-------

**Bluetooth** is released under the MIT license. See LICENSE for details.

[swift-badge]: https://img.shields.io/badge/swift-3.2-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/platform-osx%20%7C%20ios%20%7C%20watchos%20%7C%20tvos%20%7C%20linux-lightgrey.svg
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[build-status-badge]: https://travis-ci.org/PureSwift/Bluetooth.svg?branch=master
[build-status-url]: https://travis-ci.org/PureSwift/Bluetooth
[release-badge]: https://img.shields.io/github/release/PureSwift/Bluetooth.svg
[release-url]: https://github.com/PureSwift/Bluetooth/releases
[spm-badge]: https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat
[spm-url]: https://github.com/apple/swift-package-manager
[carthage-badge]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
[carthage-url]: https://github.com/Carthage/Carthage
[codebeat-badge]: https://codebeat.co/badges/3eaf4fc3-6514-4f2d-83d5-ffd879f319d2
[codebeat-url]: https://codebeat.co/projects/github-com-pureswift-bluetooth-master
[docs-badge]: http://pureswift.github.io/Bluetooth/docs/badge.svg
[docs-url]: http://pureswift.github.io/Bluetooth/docs/
[xcov-url]: http://pureswift.github.io/Bluetooth/xcov
