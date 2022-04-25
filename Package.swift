// swift-tools-version:5.5
import PackageDescription

let libraryType: PackageDescription.Product.Library.LibraryType = .static

let package = Package(
    name: "Bluetooth",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
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
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0")
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
