//
//  GAPManufacturerSpecificData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The Manufacturer Specific data type is used for manufacturer specific data.
 The first two data octets shall contain a company identifier code from the Assigned Numbers - Company Identifiers document.
 The interpretation of any other octets within the data shall be defined by the manufacturer specified by the company identifier.
 
 Size: 2 or more octets
 The first 2 octets contain the Company Identifier Code followed by additional manufacturer specific data
 */
public struct GAPManufacturerSpecificData: GAPData {
    
    internal static let minimumLength = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .manufacturerSpecificData
    
    public var companyIdentifier: CompanyIdentifier
    
    public var additionalData: Data
    
    public init(companyIdentifier: CompanyIdentifier,
                additionalData: Data = Data()) {
        
        self.companyIdentifier = companyIdentifier
        self.additionalData = additionalData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        let companyIdentifier = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        var additionalData = Data()
        
        if data.count > type(of: self).minimumLength {
            
            additionalData = Data(data.suffix(from: 2))
            
        } else {
            
            additionalData = Data()
        }
        
        self.init(companyIdentifier: companyIdentifier, additionalData: additionalData)
    }
    
    public var data: Data {
        
        let identifierBytes = companyIdentifier.rawValue.littleEndian.bytes
        
        return Data([identifierBytes.0, identifierBytes.1]) + additionalData
    }
    
}

extension GAPManufacturerSpecificData: Equatable {
    
    public static func == (lhs: GAPManufacturerSpecificData, rhs: GAPManufacturerSpecificData) -> Bool {
        
        return lhs.companyIdentifier == rhs.companyIdentifier && lhs.additionalData == rhs.additionalData
    }
}

extension GAPManufacturerSpecificData: CustomStringConvertible {
    
    public var description: String {
        
        return companyIdentifier.description + additionalData.map { String($0) }.description
    }
}
