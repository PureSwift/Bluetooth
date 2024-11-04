//
//  Units.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

/// Type that represents a unit of measurement defined by Bluetooth.
public protocol BluetoothUnit: RawRepresentable {
    
    /// The unit of measurement type.
    static var unitType: UnitIdentifier { get }
}
