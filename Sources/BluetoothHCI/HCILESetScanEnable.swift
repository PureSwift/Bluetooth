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
    
    /// Scan LE devices.
    func lowEnergyScan(
        filterDuplicates: Bool = true,
        parameters: HCILESetScanParameters = .init(),
        bufferSize: Int = 100,
        timeout: HCICommandTimeout = .default
    ) async throws -> AsyncLowEnergyScanStream {
        assert(bufferSize >= 1)
        
        // macro for enabling / disabling scan
        func enableScan(_ isEnabled: Bool = true) async throws {
            do { try await self.enableLowEnergyScan(isEnabled, filterDuplicates: filterDuplicates, timeout: timeout) }
            catch HCIError.commandDisallowed { /* ignore, means already turned on or off */ }
        }
        
        // disable scanning first
        try await enableScan(false)
        
        // set parameters
        try await self.deviceRequest(parameters, timeout: timeout)
        
        // enable scanning
        try await enableScan()
        
        return AsyncLowEnergyScanStream { [weak self] continuation in
            guard let self = self else { return }
            do {
                
                // poll for scanned devices
                while Task.isCancelled == false {
                    
                    let metaEvent = try await self.recieve(HCILowEnergyMetaEvent.self)
                    
                    // only want advertising report
                    guard metaEvent.subevent == .advertisingReport
                        else { continue }
                    
                    // parse LE advertising report
                    guard let advertisingReport = HCILEAdvertisingReport(data: metaEvent.eventData)
                        else { throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.eventData)) }
                    
                    // call closure on each device found
                    for report in advertisingReport.reports {
                        continuation(report)
                    }
                }
                
                do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
            }
            catch {
                // disable scanning
                do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
                throw error
            }
        }
    }
    
    private func enableLowEnergyScan(
        _ isEnabled: Bool = true,
        filterDuplicates: Bool = true,
        timeout: HCICommandTimeout = .default
    ) async throws {
        
        let scanEnableCommand = HCILESetScanEnable(
            isEnabled: isEnabled,
            filterDuplicates: filterDuplicates
        )
        
        try await self.deviceRequest(scanEnableCommand, timeout: timeout)
    }
}

/// Bluetooth LE Scan Stream
public final class AsyncLowEnergyScanStream: AsyncSequence {
        
    public typealias Element = HCILEAdvertisingReport.Report
    
    public typealias AsyncIterator = AsyncIndefiniteStream<Element>.AsyncIterator
    
    let stream: AsyncIndefiniteStream<Element>
    
    internal init(bufferSize: Int = 100, _ build: @escaping ((Element) -> ()) async throws -> ()) {
        self.stream = .init(bufferSize: bufferSize, build)
    }
    
    public func makeAsyncIterator() -> AsyncIndefiniteStream<Element>.AsyncIterator {
        stream.makeAsyncIterator()
    }
    
    public var isScanning: Bool {
        stream.isExecuting
    }
    
    public func stop() {
        stream.stop()
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
