//
//  HCIReadLocalSupportedFeatures.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Local Supported Features Command
    ///
    /// This command requests the list of the supported LE features for the Controller.
    func readLocalSupportedFeatures(timeout: HCICommandTimeout = .default) async throws -> BitMaskOptionSet<LMPFeature> {
        
        let returValue = try await deviceRequest(HCIReadLocalSupportedFeaturesReturn.self, timeout: timeout)
        
        return returValue.features
    }
}

// MARK: - Return parameter

/// Read Local Supported Features Command
///
/// This command requests a list of the supported features for the local BR/EDR Controller. This command will return a list of the LMP features.
@frozen
public struct HCIReadLocalSupportedFeaturesReturn: HCICommandReturnParameter {
    
    public static let command = InformationalCommand.readLocalSupportedFeatures
    
    public static let length = 8
    
    public let features: BitMaskOptionSet<LMPFeature>
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let featuresValue = UInt64(littleEndian: UInt64(bytes: (data[0],
                                                                data[1],
                                                                data[2],
                                                                data[3],
                                                                data[4],
                                                                data[5],
                                                                data[6],
                                                                data[7])))
        
        self.features = BitMaskOptionSet<LMPFeature>(rawValue: featuresValue)
    }
}
