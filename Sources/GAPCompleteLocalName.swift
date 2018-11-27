//
//  GAPCompleteLocalName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 GAP Complete Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 */
public struct GAPCompleteLocalName: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .completeLocalName
    
    public let name: String
    
    public init(name: String) {
        
        self.name = name
    }
}

public extension GAPCompleteLocalName {
    
    /// Initialize from bytes.
    init? <T: DataContainer> (data: T) {
        
        guard let rawValue = String(bytes: data, encoding: .utf8)
            else { return nil }
        
        self.init(name: rawValue)
    }
    
    /// Append data representation into advertising data.
    static func += <T: DataContainer> (data: inout T, value: Self) {
        
        data += name.utf8
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteLocalName: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

// MARK: - ExpressibleByStringLiteral

extension GAPCompleteLocalName: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(name: value)
    }
}
