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
public struct GAPManufacturerSpecificData: GAPData, Equatable {
    
    public static var dataType: GAPDataType { return .manufacturerSpecificData }
    
    public var companyIdentifier: CompanyIdentifier
    
    public var additionalData: Data
    
    public init(companyIdentifier: CompanyIdentifier,
                additionalData: Data = Data()) {
        
        self.companyIdentifier = companyIdentifier
        self.additionalData = additionalData
    }
}

public extension GAPManufacturerSpecificData {
    
    public init?(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        self.companyIdentifier = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        self.additionalData = data.suffixCheckingBounds(from: 2)
    }
    
    public var data: Data {
        
       return Data(self)
    }
}

// MARK: - DataConvertible

extension GAPManufacturerSpecificData: DataConvertible {
    
    var dataLength: Int {
        
        return 2 + additionalData.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: GAPManufacturerSpecificData) {
        
        data += value.companyIdentifier.rawValue.littleEndian
        data += value.additionalData
    }
}
