// swift-tools-version:5.0
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
        )
    ],
    targets: [
        .target(name: "Bluetooth", path: "./Sources"),
        .testTarget(name: "BluetoothTests", dependencies: ["Bluetooth"])
    ],
    swiftLanguageVersions: [.v5]
)
