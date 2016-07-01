import PackageDescription

let package = Package(
    name: "Bluetooth",
    dependencies: [
        .Package(url: "https://github.com/PureSwift/git", majorVersion: 1),
    ]
)
