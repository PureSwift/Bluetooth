//
//  LowEnergyScan.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/27/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// Scan LE devices for the specified time period.
    func lowEnergyScan(duration: TimeInterval = 10,
                       filterDuplicates: Bool = true,
                       parameters: HCILESetScanParameters = .init(),
                       timeout: HCICommandTimeout = .default) throws -> [HCILEAdvertisingReport.Report] {
        
        let startDate = Date()
        let endDate = startDate + duration
        
        var foundDevices = [HCILEAdvertisingReport.Report]()
        
        try lowEnergyScan(filterDuplicates: filterDuplicates,
                          parameters: parameters,
                          timeout: timeout,
                          shouldContinue: { Date() < endDate },
                          foundDevice: { foundDevices.append($0) })
        
        return foundDevices
    }
    
    /// LE Read Buffer Size Command
    ///
    /// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
    func readBufferSize(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.HCILEReadBufferSizeReturn {
        
        let bufferSizeReturnParameter = try deviceRequest(HCILowEnergyCommand.HCILEReadBufferSizeReturn.self, timeout: timeout)
        
        return bufferSizeReturnParameter
    }
}
