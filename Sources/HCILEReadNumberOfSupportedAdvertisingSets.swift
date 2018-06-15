//
//  HCILEReadNumberOfSupportedAdvertisingSets.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    func readNumberOfSupportedAdvertisingSets(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILEReadNumberOfSupportedAdvertisingSets.self,
                                      timeout: timeout)
        
        return value.numSupportedAdvertisingSets
    }
}

// MARK: - Return parameter

/// LE Read Number of Supported Advertising Sets Command
///
/// The command is used to read the maximum number of advertising sets supported by
/// the advertising Controller at the same time. Note: The number of advertising sets that
/// can be supported is not fixed and the Controller can change it at any time because the memory
/// used to store advertising sets can also be used for other purposes.
public struct HCILEReadNumberOfSupportedAdvertisingSets: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readNumberOfSupportedAdvertisingSets //0x003B
    
    public static let length: Int = 1
    
    /// Number of advertising sets supported at the same time
    public let numSupportedAdvertisingSets: UInt8 //Num_Supported_Advertising_Sets
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        numSupportedAdvertisingSets = data[0]
    }
}
