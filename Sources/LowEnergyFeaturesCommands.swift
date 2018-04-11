//
//  LowEnergyFeaturesCommands.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    func readRemoteUsedFeatures(connectionHandle: UInt16, timeout: HCICommandTimeout = .default) throws -> LowEnergyFeatureSet {
        
        let parameters = LowEnergyCommand.ReadRemoteUsedFeaturesParameter(connectionHandle: connectionHandle)
        
        let event =  try deviceRequest(parameters,
                                       LowEnergyEvent.ReadRemoteUsedFeaturesCompleteEventParameter.self,
                                       timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            assert(event.handle == connectionHandle, "Invalid connection handle \(event.handle)")
            
            return event.features
        }
    }
}
