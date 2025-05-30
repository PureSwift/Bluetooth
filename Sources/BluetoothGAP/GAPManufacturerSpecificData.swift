//
//  GAPManufacturerSpecificData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

@_exported import Bluetooth

/// The Manufacturer Specific data type is used for manufacturer specific data.
/// The first two data octets shall contain a company identifier code from the Assigned Numbers - Company Identifiers document.
/// The interpretation of any other octets within the data shall be defined by the manufacturer specified by the company identifier.
///
/// Size: 2 or more octets
/// The first 2 octets contain the Company Identifier Code followed by additional manufacturer specific data
@frozen
public struct GAPManufacturerSpecificData<AdditionalData: DataContainer>: GAPData, Equatable, Hashable {

    /// GAP Data Type
    public static var dataType: GAPDataType { return .manufacturerSpecificData }

    /// Company Identifier
    public var companyIdentifier: CompanyIdentifier

    /// Additional Data.
    public var additionalData: AdditionalData

    /// Initialize with company identifier and additional data.
    public init(
        companyIdentifier: CompanyIdentifier,
        additionalData: AdditionalData = AdditionalData()
    ) {

        self.companyIdentifier = companyIdentifier
        self.additionalData = additionalData
    }

    public init?<Data>(data: Data) where Data: Bluetooth.DataContainer {

        guard data.count >= 2
        else { return nil }

        self.companyIdentifier = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        if data.count > 2 {
            self.additionalData = AdditionalData(data[2..<data.count])
        } else {
            self.additionalData = AdditionalData()
        }
    }

    public func append<Data>(to data: inout Data) where Data: Bluetooth.DataContainer {
        data += self.companyIdentifier.rawValue.littleEndian
        data += self.additionalData
    }

    public var dataLength: Int {
        return 2 + additionalData.count
    }
}

// MARK: - CustomStringConvertible

extension GAPManufacturerSpecificData: CustomStringConvertible {

    public var description: String {
        return "(\(companyIdentifier)) \(additionalData.toHexadecimal())"
    }
}

// MARK: - DataConvertible

extension GAPManufacturerSpecificData: DataConvertible {

    static func += <T: DataContainer>(data: inout T, value: GAPManufacturerSpecificData) {
        value.append(to: &data)
    }
}
