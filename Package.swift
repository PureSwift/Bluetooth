// swift-tools-version:6.2
import PackageDescription
import CompilerPluginSupport

// get environment variables
let dynamicLibrary = Context.environment["SWIFT_BUILD_DYNAMIC_LIBRARY"] == "1"
let buildMetadata = Context.environment["SWIFTPM_BLUETOOTH_METADATA"] != "0"
let generateCode = Context.environment["SWIFTPM_ENABLE_PLUGINS"] != "0"
let enableMacros = Context.environment["SWIFTPM_ENABLE_MACROS"] != "0"
let buildDocs = Context.environment["BUILDING_FOR_DOCUMENTATION_GENERATION"] == "1"
let embeddedFoundation = Context.environment["SWIFTPM_EMBEDDED_FOUNDATION"] == "1"

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
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows, .android])
                ),
                .target(
                    name: "BluetoothGATT",
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows, .android])
                ),
                .target(
                    name: "BluetoothHCI",
                    condition: .when(platforms: [.macOS, .linux, .macCatalyst, .windows, .android])
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

if embeddedFoundation {
    package.dependencies += [
        .package(
            url: "https://github.com/PureSwift/swift-embedded-foundation.git",
            from: "0.2.0"
        )
    ]
    let foundationEmbedded: PackageDescription.Target.Dependency = .product(
        name: "FoundationEmbedded",
        package: "swift-embedded-foundation"
    )
    for name in ["Bluetooth", "BluetoothGAP", "BluetoothGATT", "BluetoothHCI"] {
        guard let index = package.targets.firstIndex(where: { $0.name == name }) else {
            fatalError("Missing target \(name)")
        }
        package.targets[index].dependencies += [
            foundationEmbedded
        ]
    }
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
            "600.0.1"..<"604.0.0"
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
