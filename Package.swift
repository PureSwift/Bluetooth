// swift-tools-version:6.0
import PackageDescription
import CompilerPluginSupport
import class Foundation.ProcessInfo

// get environment variables
let environment = ProcessInfo.processInfo.environment
let dynamicLibrary = environment["SWIFT_BUILD_DYNAMIC_LIBRARY"] != nil
let generateCode = environment["SWIFTPM_ENABLE_PLUGINS"] != nil
let buildDocs = environment["BUILDING_FOR_DOCUMENTATION_GENERATION"] != nil

// force building as dynamic library
let libraryType: PackageDescription.Product.Library.LibraryType? = dynamicLibrary ? .dynamic : nil

var package = Package(
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
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            from: "600.0.1"
        )
    ],
    targets: [
        .target(
            name: "Bluetooth",
            dependencies: [
                "BluetoothMacros"
            ]
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
        .macro(
            name: "BluetoothMacros",
            dependencies: [
              .product(
                name: "SwiftSyntaxMacros",
                package: "swift-syntax"
              ),
              .product(
                name: "SwiftCompilerPlugin",
                package: "swift-syntax"
              )
            ]
        ),
        .testTarget(
            name: "BluetoothTests",
            dependencies: [
                "Bluetooth",
                .target(
                    name: "BluetoothGAP", 
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows])
                ),
                .target(
                    name: "BluetoothGATT", 
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows])
                ),
                .target(
                    name: "BluetoothHCI", 
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows])
                )
            ],
            swiftSettings: [.swiftLanguageMode(.v5)]
        )
    ]
)

// SwiftPM command plugins are only supported by Swift version 5.6 and later.
if buildDocs {
    package.dependencies += [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ]
}
if generateCode {
    for (index, _) in package.targets.enumerated() {
        package.targets[index].swiftSettings = [
            .define("SWIFTPM_ENABLE_PLUGINS")
        ]
    }
    package.targets += [
        .executableTarget(
            name: "GenerateBluetooth",
            dependencies: []
        ),
        .plugin(
            name: "GenerateBluetoothDefinitions",
            capability: .buildTool(),
            dependencies: [
                "GenerateBluetooth"
            ]
        )
    ]
    package.targets[0].plugins = [
        "GenerateBluetoothDefinitions"
    ]
    package.targets[4].plugins = [
        "GenerateBluetoothDefinitions"
    ]
}
