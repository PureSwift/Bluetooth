// swift-tools-version:6.0
import PackageDescription
import CompilerPluginSupport
import class Foundation.ProcessInfo

// get environment variables
let environment = ProcessInfo.processInfo.environment
let dynamicLibrary = environment["SWIFT_BUILD_DYNAMIC_LIBRARY"] == "1"
let buildMetadata = environment["SWIFTPM_BLUETOOTH_METADATA"] != "0"
let generateCode = environment["SWIFTPM_ENABLE_PLUGINS"] != "0"
let enableMacros = environment["SWIFTPM_ENABLE_MACROS"] != "0"
let buildDocs = environment["BUILDING_FOR_DOCUMENTATION_GENERATION"] == "1"
#if canImport(Darwin)
let buildCLib = environment["SWIFT_BLUETOOTH_C_SHIMS"] != "0"
#else
let buildCLib = environment["SWIFT_BLUETOOTH_C_SHIMS"] == "1"
#endif

// force building as dynamic library
let libraryType: PackageDescription.Product.Library.LibraryType? = dynamicLibrary ? .dynamic : nil

var package = Package(
    name: "Bluetooth",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "Bluetooth",
            type: libraryType,
            targets: [
                "Bluetooth"
            ]
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
                .copy("Resources/CompanyIdentifier.json"),
                .copy("Resources/CharacteristicUUID.json"),
                .copy("Resources/DeclarationUUID.json"),
                .copy("Resources/DescriptorUUID.json"),
                .copy("Resources/ServiceUUID.json"),
                .copy("Resources/MemberUUID.json"),
                .copy("Resources/UnitIdentifier.json")
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
                "Bluetooth"
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
                    name: "BluetoothMetadata",
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows])
                ),
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

// Optional dependencies
if buildMetadata {
    package.targets[0].dependencies += [
        "BluetoothMetadata"
    ]
}

// SwiftPM plugins
if buildDocs {
    package.dependencies += [
        .package(
            url: "https://github.com/swiftlang/swift-docc-plugin.git",
            from: "1.0.0"
        )
    ]
}

if generateCode {
    for index in package.targets.indices {
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

if buildCLib {
    package.products[0] = .library(
        name: "Bluetooth",
        type: libraryType,
        targets: [
            "Bluetooth",
            "CBluetooth",
            "CBluetoothShim"
        ]
    )
    package.targets[5] = .testTarget(
            name: "BluetoothTests",
            dependencies: [
                "Bluetooth",
                .target(
                    name: "BluetoothMetadata",
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows])
                ),
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
    package.targets += [
        .target(
            name: "CBluetooth",
            dependencies: ["Bluetooth"] // actual implementation
        ),
        .target(
            name: "CBluetoothShim", // C implementation
            dependencies: [
                "CBluetooth",
                "Bluetooth"
            ]
        ),
    ]
}
