//
//  CompanyIdentifierMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

#if canImport(Foundation) && !os(WASI) && !hasFeature(Embedded)
import Foundation
import BluetoothMetadata

public extension CompanyIdentifier {
    
    /// Bluetooth Company name.
    ///
    /// - SeeAlso: [Company Identifiers](https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers)
    var name: String? {
        companyIdentifiers[rawValue]
    }
}

internal let companyIdentifiers: [UInt16: String] = {
    do {
        let file = try BluetoothMetadata.CompanyIdentifier.File.load()
        var companyIdentifiers = [UInt16: String]()
        for element in file.companyIdentifiers {
            companyIdentifiers[element.id] = element.name
        }
        assert(companyIdentifiers.count == file.companyIdentifiers.count)
        return companyIdentifiers
    }
    catch {
        assertionFailure("Unable to load metadata: \(error)")
        return [:]
    }
}()
#endif
