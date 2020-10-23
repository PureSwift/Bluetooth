// swift-tools-version:5.1
import PackageDescription

#if os(Linux)
let libraryType: PackageDescription.Product.Library.LibraryType = .dynamic
#else
let libraryType: PackageDescription.Product.Library.LibraryType = .static
#endif

let package = Package(
    name: "Bluetooth",
    products: [
        .library(
            name: "Bluetooth",
            type: libraryType,
            targets: ["Bluetooth"]
        ),
        .library(
            name: "BluetoothGAP",
            type: libraryType,
            targets: ["BluetoothGAP"]
        ),
        .library(
            name: "BluetoothGATT",
            type: libraryType,
            targets: ["BluetoothGATT"]
        ),
        .library(
            name: "BluetoothHCI",
            type: libraryType,
            targets: ["BluetoothHCI"]
        )
    ],
    targets: [
        .target(
            name: "Bluetooth"
        ),
        .target(
            name: "BluetoothGAP",
            dependencies: [
                "Bluetooth"
            ]
        ),
        .target(
            name: "BluetoothGATT",
            dependencies: [
                "Bluetooth",
            ]
        ),
        .target(
            name: "BluetoothHCI",
            dependencies: [
                "Bluetooth",
                "BluetoothGAP"
            ]
        ),
        .testTarget(
            name: "BluetoothTests",
            dependencies: [
                "Bluetooth",
                "BluetoothGAP",
                "BluetoothGATT",
                "BluetoothHCI"
            ]
        )
    ]
)
