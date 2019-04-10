// swift-tools-version:5.0
import PackageDescription

let package = Package(name: "Bluetooth",
                      products: [
                        .library(
                            name: "Bluetooth",
                            targets: ["Bluetooth"]
                        )
                      ],
                      targets: [
                        .target(name: "Bluetooth", path: "./Sources"),
                        .testTarget(name: "BluetoothTests", dependencies: ["Bluetooth"])
                      ],
                      swiftLanguageVersions: [.v4, .v4_2, .v5])
