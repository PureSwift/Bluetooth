//
//  HCILESetScanEnable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Scan LE devices for the specified time period.
    func lowEnergyScan(duration: TimeInterval,
                       filterDuplicates: Bool = true,
                       parameters: HCILESetScanParameters = .init(),
                       timeout: HCICommandTimeout = .default) async throws -> [HCILEAdvertisingReport.Report] {
        
        let startDate = Date()
        let endDate = startDate + duration
        
        var foundDevices: [HCILEAdvertisingReport.Report] = []
        foundDevices.reserveCapacity(1)
        
        try await lowEnergyScan(
            filterDuplicates: filterDuplicates,
            parameters: parameters,
            timeout: timeout,
            shouldContinue: { Date() < endDate },
            foundDevice: { foundDevices.append($0) }
        )
        
        return foundDevices
    }
    
    /// Scan LE devices.
    func lowEnergyScan(filterDuplicates: Bool = true,
                       parameters: HCILESetScanParameters = .init(),
                       timeout: HCICommandTimeout = .default,
                       shouldContinue: () -> (Bool),
                       foundDevice: (HCILEAdvertisingReport.Report) -> ()) async throws {
        
        // macro for enabling / disabling scan
        func enableScan(_ isEnabled: Bool = true) async throws {
            
            let scanEnableCommand = HCILESetScanEnable(isEnabled: isEnabled,
                                                       filterDuplicates: filterDuplicates)
            
            do { try await deviceRequest(scanEnableCommand, timeout: timeout) }
            catch HCIError.commandDisallowed { /* ignore, means already turned on or off */ }
        }
        
        // disable scanning first
        try await enableScan(false)
        
        // set parameters
        try await deviceRequest(parameters, timeout: timeout)
        
        // enable scanning
        try await enableScan()
        
        // poll for scanned devices
        do {
            try await pollEvent(HCILowEnergyMetaEvent.self, shouldContinue: shouldContinue) { (metaEvent) in
                
                // only want advertising report
                guard metaEvent.subevent == .advertisingReport
                    else { return }
                
                // parse LE advertising report
                guard let advertisingReport = HCILEAdvertisingReport(data: metaEvent.eventData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.eventData)) }
                
                // call closure on each device found
                advertisingReport.reports.forEach { foundDevice($0) }
            }
        } catch {
            // disable scanning
            do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
            throw error
        }
        do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
    }
}

// MARK: - Command

/// LE Set Scan Enable Command
///
/// The `LE Set Scan Enable Command` command is used to start scanning.
/// Scanning is used to discover advertising devices nearby.
@frozen
public struct HCILESetScanEnable: HCICommandParameter { // HCI_LE_Set_Scan_Enable
    
    public static let command = HCILowEnergyCommand.setScanEnable // 0x000C
    public static let length = 2
    
    /// Whether scanning is enabled or disabled.
    public var isEnabled: Bool // LE_Scan_Enable
    
    /// Controls whether the Link Layer shall filter duplicate advertising reports to the Host,
    /// or if it shall generate advertising reports for each packet received.
    public var filterDuplicates: Bool // Filter_Duplicates
    
    /// Initialize a `LE Set Scan Enable Command` HCI command parameter.
    ///
    /// The `LE Set Scan Enable Command` command is used to start scanning.
    /// Scanning is used to discover advertising devices nearby.
    ///
    /// - Parameter enabled: Whether scanning is enabled or disabled.
    ///
    /// - Parameter filterDuplicates: Controls whether the Link Layer shall filter duplicate advertising
    /// reports to the Host, or if it shall generate advertising reports for each packet received.
    public init(isEnabled: Bool = false,
                filterDuplicates: Bool = false) {
        
        self.isEnabled = isEnabled
        self.filterDuplicates = filterDuplicates
    }
    
    public var data: Data {
        
        return Data([isEnabled.byteValue, filterDuplicates.byteValue])
    }
}
