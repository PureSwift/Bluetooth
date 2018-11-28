//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Generic Access Profile
 
 - SeeAlso:
 [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
 */
public enum GAP {
    
    /// Generic Access Profile Data
    public typealias DataType = GAPDataType
}

// MARK: - Generic Access Profile Data

/// Generic Access Profile Data
public protocol GAPData {
    
    /// Generic Access Profile data type.
    static var dataType: GAPDataType { get }
    
    /// Initialize from bytes.
    init?(data: Data)
    
    /// Append data representation into buffer.
    func append(to data: inout Data)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}

// MARK: - Deprecated API

public extension GAPData {
    
    @available(*, deprecated, message: "Use GAPDataEncoder instead")
    var data: Data {
        
        var data = Data(capacity: dataLength)
        append(to: &data)
        return data
    }
}
