//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

@_exported import Bluetooth

// MARK: - Generic Access Profile Data

/// Generic Access Profile
///
/// - SeeAlso:
/// [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
public protocol GAPData: DataConvertible {

    /// Generic Access Profile data type.
    static var dataType: GAPDataType { get }
}
