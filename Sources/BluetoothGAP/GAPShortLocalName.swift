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
@frozen
public struct GAPShortLocalName: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .shortLocalName
    
    public let name: String
    
    public init(name: String) {
        
        self.name = name
    }
}

public extension GAPShortLocalName {
    
    init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(name: rawValue)
    }
    
    func append(to data: inout Data) {
        
        data += name.utf8
    }
    
    var dataLength: Int {
        
        return name.utf8.count
    }
}

// MARK: - CustomStringConvertible

extension GAPShortLocalName: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

// MARK: - ExpressibleByStringLiteral

extension GAPShortLocalName: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(name: value)
    }
}
