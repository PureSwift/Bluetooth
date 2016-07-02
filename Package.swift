import PackageDescription

let package = Package(
    name: "Bluetooth",
    dependencies: [
        .Package(url: "https://github.com/PureSwift/SwiftFoundation", majorVersion: 2)
    ]
)
