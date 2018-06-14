//
//  GAPURI.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 GAP Shortened Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 
 A shortened name shall only contain contiguous characters from the beginning of the full name. For example, if the device name is ‘BT_Device_Name’ then the shortened name could be ‘BT_Device’ or ‘BT_Dev’.
 */
public struct GAPURI: GAPData {
    
    public static let dataType: GAPDataType = .uri
    
    public let uri: URL
    
    public init(uri: URL) {
        
        self.uri = uri
    }
    
    public init?(data: Data) {
        
        guard let string = String(data: data, encoding: .utf8),
            let uri = URL(string: string)
            else { return nil }
        
        self.uri = uri
    }
    
    public var data: Data {
        
        guard let data = uri.absoluteString.data(using: .utf8)
            else { fatalError("Unable to encode string") }
        
        return data
    }
}

extension GAPURI: Equatable {
    
    public static func == (lhs: GAPURI, rhs: GAPURI) -> Bool {
        
        return lhs.uri == rhs.uri
    }
}

extension GAPURI: CustomStringConvertible {
    
    public var description: String {
        
        return uri.absoluteString
    }
}
