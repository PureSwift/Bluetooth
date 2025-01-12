// swift-tools-version:6.0
import PackageDescription
import CompilerPluginSupport
import class Foundation.ProcessInfo

// get environment variables
let environment = ProcessInfo.processInfo.environment
let dynamicLibrary = environment["SWIFT_BUILD_DYNAMIC_LIBRARY"] == "1"
let generateCode = environment["SWIFTPM_ENABLE_PLUGINS"] != "0"
let enableMacros = environment["SWIFTPM_ENABLE_MACROS"] != "0"
let buildDocs = environment["BUILDING_FOR_DOCUMENTATION_GENERATION"] == "1"

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
            name: "BluetoothMetadata",
            type: libraryType,
            targets: ["BluetoothMetadata"]
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
            name: "BluetoothMetadata",
            resources: [
                .copy("Resources")
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
            ]
        )
    ]
)

// SwiftPM plugins

if buildDocs {
    package.dependencies += [
        .package(
            url: "https://github.com/apple/swift-docc-plugin",
            from: "1.0.0"
        )
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
            dependencies: [
                "BluetoothMetadata"
            ]
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

if enableMacros {
    package.targets[0].swiftSettings = [
        .define("SWIFTPM_ENABLE_MACROS")
    ]
    package.dependencies += [
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            from: "600.0.1"
        )
    ]
    package.targets += [
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
        )
    ]
    package.targets[0].dependencies += [
        "BluetoothMacros"
    ]
}
