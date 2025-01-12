//
//  UnitIdentifier.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/5/24.
//

import Foundation
import BluetoothMetadata

extension GenerateTool {
    
    static func parseUnitIdentifiersFile(
    ) throws -> [UInt16: (id: String, name: String)] {
        let file = try BluetoothMetadata.BluetoothUUID.File.load(.unit)
        var output = [UInt16: (id: String, name: String)]()
        output.reserveCapacity(file.uuids.count)
        for element in file.uuids {
            guard let namespace = element.type else {
                throw CocoaError(.coderValueNotFound)
            }
            output[element.uuid] = (namespace, element.name)
        }
        return output
    }
    
    static func unitIdentifiers(
        from data: [UInt16: (id: String, name: String)]
    ) -> [(id: UInt16, name: String, type: String, member: String)] {
        let blacklist: [UInt16] = [
            .max // remove internal use identifier
        ]
        let units = data
            .sorted(by: { $0.key < $1.key })
            .filter { blacklist.contains($0.key) == false }
        var memberNames = [UInt16: String]()
        memberNames.reserveCapacity(units.count)
        for (id, metadata) in units {
            let memberName = Self.unitMethodNames[id]
                ?? metadata.name
                .sanitizeName(prefix: "unit")
                .llamaCase()
            memberNames[id] = memberName
        }
        return units.map { ($0, $1.name, $1.id, memberNames[$0]!) }
    }
    
    static func generateUnitIdentifiers(output: URL) throws {
        let data = try parseUnitIdentifiersFile()
        try generateUnitIdentifierExtensions(data, output: output)
    }
    
    static func generateUnitIdentifierExtensions(_ data: [UInt16: (id: String, name: String)], output: URL) throws {
        
        var generatedCode = ""
        let units = unitIdentifiers(from: data)
        
        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }
                
        🖨("//")
        🖨("//  UnitIdentifiers.swift")
        🖨("//  Bluetooth")
        🖨("//")
        🖨("")
        🖨("public extension UnitIdentifier {")
        🖨("")
        
        for (id, name, _, memberName) in units {
            
            let hexLiteral = "0x" + id.toHexadecimal()
            🖨("    /// " + name + " " + "(`\(hexLiteral)`)")
            🖨("    @_alwaysEmitIntoClient")
            🖨("    static var " + memberName + ": UnitIdentifier {")
            🖨("        return UnitIdentifier(rawValue: \(hexLiteral))")
            🖨("    }")
            🖨("")
        }
        
        🖨("}")
        
        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
    
    static func generateUnitIdentifierTests(output: URL) throws {
        
        let data = try parseUnitIdentifiersFile()
        
        var generatedCode = ""
        let units = unitIdentifiers(from: data)
        
        func 🖨(_ text: String) {
            generatedCode += text + "\n"
        }
        
        // generate unit test for extensions
        generatedCode = """
        //
        //  UnitIdentifierTests.swift
        //  Bluetooth
        //
        
        import Foundation
        import Testing
        @testable import Bluetooth
        
        // swiftlint:disable type_body_length
        @Suite
        struct UnitIdentifierTests {
        
            @Test func units() {
        
        
        """
        
        // generate test methods
        
        for (id, name, type, memberName) in units {
            let hexLiteral = "0x" + id.toHexadecimal()
            let description = hexLiteral + " " + "(" + name + ")"
            🖨("""
                    // \(name)
                    #expect(UnitIdentifier.\(memberName).rawValue == \(hexLiteral))
                    #expect(UnitIdentifier.\(memberName).type == #\"\(type)\"#)
                    #expect(UnitIdentifier.\(memberName).name == #\"\(name)\"#)
                    #expect(UnitIdentifier.\(memberName).description == #\"\(description)\"#)
                
            """)
        }
        
        🖨("""
                }
            
            }
            // swiftlint:enable type_body_length
            """)
        
        try generatedCode.write(toFile: output.path, atomically: true, encoding: .utf8)
        print("Generated \(output.path)")
    }
}

private extension GenerateTool {
    
    static var unitMethodNames: [UInt16: String] {
        [
            0x2700: "unitless",
            0x2701: "metre",
            0x2702: "kilogram",
            0x2703: "second",
            0x2704: "ampere",
            0x2705: "kelvin",
            0x2706: "mole",
            0x2707: "candela",
            0x2710: "area",
            0x2711: "volume",
            0x2712: "velocity",
            0x2713: "acceleration",
            0x2714: "wavenumber",
            0x2715: "density",
            0x2716: "surfaceDensity",
            0x2717: "specificVolume",
            0x2718: "currentDensity",
            0x2719: "magneticFieldStrengh",
            0x271A: "amountConcentration",
            0x271B: "massConcentration",
            0x271C: "luminance",
            0x271D: "refractiveIndex",
            0x271E: "relativePermeability",
            0x2720: "planeAngle",
            0x2721: "solidAngle",
            0x2722: "frequency",
            0x2723: "force",
            0x2724: "pascalPressure",
            0x2725: "energy",
            0x2726: "power",
            0x2727: "coulomb",
            0x2728: "electricPotential",
            0x2729: "capitance",
            0x272A: "electricResistance",
            0x272B: "electricConductance",
            0x272C: "magneticFlux",
            0x272D: "magneticFluxDensity",
            0x272E: "inductance",
            0x272F: "celsius",
            0x2730: "luminousFlux",
            0x2731: "illuminance",
            0x2732: "becquerel",
            0x2733: "absorbedDose",
            0x2734: "sievert",
            0x2735: "katal",
            0x2740: "pascalSecond",
            0x2741: "newtonMetre",
            0x2742: "surfaceTension",
            0x2743: "angularVelocity",
            0x2744: "angularAcceleration",
            0x2745: "heatFluxDensity",
            0x2746: "heatCapacity",
            0x2747: "specificHeatCapacity",
            0x2748: "specificEnergy",
            0x2749: "thermalConductivity",
            0x274A: "energyDensity",
            0x274B: "electricFieldStrength",
            0x274C: "electricChargeDensity",
            0x274D: "surfaceChargeDensity",
            0x274E: "electricFluxDensity",
            0x274F: "permittivity",
            0x2750: "permeability",
            0x2751: "molarEnergy",
            0x2752: "molarEntropy",
            0x2753: "exposure",
            0x2754: "absorbedDoseRate",
            0x2755: "radradiantIntensityiance",
            0x2756: "radiance",
            0x2757: "catalyticActivity",
            0x2760: "minute",
            0x2761: "hour",
            0x2762: "day",
            0x2763: "degree",
            0x2764: "planeAngleMinute",
            0x2765: "planeAngleSecond",
            0x2766: "hectare",
            0x2767: "litre",
            0x2768: "tonne",
            0x2780: "bar",
            0x2781: "millimetreOfMercury",
            0x2782: "ngstrm",
            0x2783: "nauticalMile",
            0x2784: "barn",
            0x2785: "velocityKnot",
            0x2786: "neper",
            0x2787: "bel",
            0x27A0: "yard",
            0x27A1: "parsec",
            0x27A2: "inch",
            0x27A3: "foot",
            0x27A4: "mile",
            0x27A5: "pressurePoundForce",
            0x27A6: "kilometrePerHour",
            0x27A7: "milePerHour",
            0x27A8: "revolutionPerMinute",
            0x27A9: "gramCalorie",
            0x27AA: "kilogramCalorie",
            0x27AB: "kilowattHour",
            0x27AC: "degreeFahrenheit",
            0x27AD: "percentage",
            0x27AE: "perMille",
            0x27AF: "beatsPerMinute",
            0x27B0: "ampereHours",
            0x27B1: "milligramPerDecilitre",
            0x27B2: "millimolePerLitre",
            0x27B3: "year",
            0x27B4: "month",
            0x27B5: "concentration",
            0x27B6: "irrandiance",
            0x27B7: "millilitre",
            0x27B8: "pound",
            0x27B9: "metabolicEquivalent",
            0x27BA: "step",
            0x27BC: "stroke",
            0x27BD: "pace",
            0x27BE: "luminousEfficacy",
            0x27BF: "luminousEnergy",
            0x27C0: "luminousExposure",
            0x27C1: "massFlow",
            0x27C2: "volumeFlow",
            0x27C3: "soundPressure",
            0x27C4: "partsPerMillion",
            0x27C5: "partsPerBillion",
            0x27C6: "massDensityRate",
            0x27C7: "kilovoltAmpereHour",
            0x27C8: "voltAmpere"
        ]
    }
}
