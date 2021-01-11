//
//  GAPManufacturerSpecificData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
@_exported import Bluetooth

/**
 The Manufacturer Specific data type is used for manufacturer specific data.
 The first two data octets shall contain a company identifier code from the Assigned Numbers - Company Identifiers document.
 The interpretation of any other octets within the data shall be defined by the manufacturer specified by the company identifier.
 
 Size: 2 or more octets
 The first 2 octets contain the Company Identifier Code followed by additional manufacturer specific data
 */
@frozen
public struct GAPManufacturerSpecificData: GAPData, Equatable, Hashable {
    
    /// GAP Data Type
    public static var dataType: GAPDataType { return .manufacturerSpecificData }
    
    /// Company Identifier
    public var companyIdentifier: CompanyIdentifier
    
    /// Additional Data.
    public var additionalData: Data
    
    /// Initialize with company identifier and additional data.
    public init(companyIdentifier: CompanyIdentifier,
                additionalData: Data = Data()) {
        
        self.companyIdentifier = companyIdentifier
        self.additionalData = additionalData
    }
    
    public init?(data: Data) {
        self.init(data: data, copy: true)
    }
    
    internal init?(data: Data, copy: Bool) {
        
        guard data.count >= 2
            else { return nil }
        
        let companyIdentifier = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        let additionalData: Data
        if data.count > 2 {
            additionalData = copy ? Data(data.suffix(from: 2)) : data.suffixNoCopy(from: 2)
        } else {
            additionalData = Data()
        }
        self.init(companyIdentifier: companyIdentifier, additionalData: additionalData)
    }
        
    public var dataLength: Int {
        return 2 + additionalData.count
    }
    
    public func append(to data: inout Data) {
        data += self
    }
    
    public func append(to data: inout LowEnergyAdvertisingData) {
        data += self
    }
}

// MARK: - CustomStringConvertible

extension GAPManufacturerSpecificData: CustomStringConvertible {
    
    public var description: String {
        return "(\(companyIdentifier)) \(additionalData.toHexadecimal()))"
    }
}

// MARK: - DataConvertible

extension GAPManufacturerSpecificData: DataConvertible {
    
    static func += <T: DataContainer> (data: inout T, value: GAPManufacturerSpecificData) {
        data += value.companyIdentifier.rawValue.littleEndian
        data += value.additionalData
    }
}
