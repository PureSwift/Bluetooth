//
//  HCILEReadResolvingListSize.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Resolving List Size Command
    ///
    /// This command is used to read the total number of address translation
    /// entries in the resolving list that can be stored in the Controller.
    func lowEnergyReadResolvingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILEReadResolvingListSize.self,
                                      timeout: timeout)
        
        return value.resolvingListSize
    }
}

// MARK: - Return parameter

/// LE Read Resolving List Size Command
///
/// The command is used to read the total number of address translation entries
/// in the resolving list that can be stored in the Controller.
/// Note: The number of entries that can be stored is not fixed and
/// the Controller can change it at any time (e.g. because the memory
/// used to store the list can also be used for other purposes).
public struct HCILEReadResolvingListSize: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readResolvedListSize //0x002A
    
    public static let length: Int = 1
    
    public let resolvingListSize: UInt8 //Resolving_List_Size
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.resolvingListSize = data[0]
    }
}
