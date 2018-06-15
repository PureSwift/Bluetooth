//
//  HCILEReadLocalSupportedFeaturesReturn.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Local Supported Features Command
    ///
    /// This command requests the list of the supported LE features for the Controller.
    func readLocalSupportedFeatures(timeout: HCICommandTimeout = .default) throws -> LowEnergyFeatureSet {
        
        let returValue = try deviceRequest(HCILEReadLocalSupportedFeatures.self, timeout: timeout)
        
        return returValue.features
    }
}

// MARK: - Return parameter

/// LE Read Local Supported Features Command
///
/// This command requests the list of the supported LE features for the Controller.
public struct HCILEReadLocalSupportedFeatures: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readLocalSupportedFeatures // 0x0003
    
    public static let length = 8
    
    public let features: LowEnergyFeatureSet
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let featuresRawValue = UInt64(littleEndian: UInt64(bytes: (data[0],
                                                                   data[1],
                                                                   data[2],
                                                                   data[3],
                                                                   data[4],
                                                                   data[5],
                                                                   data[6],
                                                                   data[7])))
        
        self.features = LowEnergyFeatureSet(rawValue: featuresRawValue)
    }
}
