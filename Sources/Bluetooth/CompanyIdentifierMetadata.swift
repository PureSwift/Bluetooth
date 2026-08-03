//
//  CompanyIdentifierMetadata.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/12/25.
//

#if Metadata
public extension CompanyIdentifier {

    /// Bluetooth Company name.
    ///
    /// - SeeAlso: [Company Identifiers](https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers)
    var name: String? {
        Self.generatedName(for: rawValue)
    }
}
#endif
