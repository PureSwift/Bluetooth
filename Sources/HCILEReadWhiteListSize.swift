//
//  HCILEReadWhiteListSizeReturn.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read White List Size Command
    ///
    /// Used to read the total number of white list entries that can be stored in the Controller.
    func lowEnergyReadWhiteListSize(timeout: HCICommandTimeout = .default) throws -> Int {
        
        let sizeReturnParameter = try deviceRequest(HCILEReadWhiteListSize.self, timeout: timeout)
        
        return Int(sizeReturnParameter.size)
    }
}

// MARK: - Return parameter

/// LE Read White List Size
///
/// The command is used to read the total number of white list entries that can be stored in the Controller.
public struct HCILEReadWhiteListSize: HCICommandReturnParameter { // HCI_LE_Read_White_List_Size
    
    public static let command = HCILowEnergyCommand.readWhiteListSize //0x000F
    public static let length = 1
    
    /// The white list size.
    public let size: UInt8 // White_List_Size
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.size = data[0]
    }
}
