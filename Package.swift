import PackageDescription

let package = Package(
    name: "Bluetooth",
    targets: [
        Target(
            name: "Bluetooth")
    ],
    dependencies: [
        .Package(url: "https://github.com/PureSwift/SwiftFoundation", majorVersion: 2)
    ]
)
