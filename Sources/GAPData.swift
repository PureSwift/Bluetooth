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
    init?(data: Slice<LowEnergyAdvertisingData>)
    
    /// Append data representation into advertising data.
    func append(to data: inout LowEnergyAdvertisingData)
}
