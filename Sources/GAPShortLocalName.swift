//
//  GAPShortLocalName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 GAP Shortened Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 
 A shortened name shall only contain contiguous characters from the beginning of the full name. For example, if the device name is ‘BT_Device_Name’ then the shortened name could be ‘BT_Device’ or ‘BT_Dev’.
 */
public struct GAPShortLocalName: GAPData {
    
    public static let dataType: GAPDataType = .shortLocalName
    
    public let name: String
    
    public init(name: String) {
        
        self.name = name
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(name: rawValue)
    }
    
    public var data: Data {
        
        return Data(name.utf8)
    }
}

extension GAPShortLocalName: Equatable {
    
    public static func == (lhs: GAPShortLocalName, rhs: GAPShortLocalName) -> Bool {
        
        return lhs.name == rhs.name
    }
}

extension GAPShortLocalName: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

extension GAPShortLocalName: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(name: value)
    }
}
