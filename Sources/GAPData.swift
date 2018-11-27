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
    init? <T: DataContainer> (data: T)
    
    /// Append data representation into buffer.
    func append <T: DataContainer> (to data: inout T)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}
