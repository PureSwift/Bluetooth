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
        timeout: HCICommandTimeout = .default
    ) -> AsyncLowEnergyScanStream {
        return AsyncLowEnergyScanStream { [weak self] continuation in
            guard let self = self else { return }
            // macro for enabling / disabling scan
            func enableScan(_ isEnabled: Bool = true) async throws {
                
                let scanEnableCommand = HCILESetScanEnable(
                    isEnabled: isEnabled,
                    filterDuplicates: filterDuplicates
                )
                
                do { try await self.deviceRequest(scanEnableCommand, timeout: timeout) }
                catch HCIError.commandDisallowed { /* ignore, means already turned on or off */ }
            }
            
            do {
                
                // disable scanning first
                try await enableScan(false)
                
                // set parameters
                try await self.deviceRequest(parameters, timeout: timeout)
                
                // enable scanning
                try await enableScan()
                
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
                        continuation.yield(report)
                    }
                }
                
                do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
            }
            catch _ as CancellationError {
                // disable scanning
                do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
            }
            catch {
                // disable scanning
                do { try await enableScan(false) } catch { /* ignore all errors disabling scanning */ }
                continuation.finish(throwing: error)
            }
        }
    }
}

/// Bluetooth LE Scan Stream
public final class AsyncLowEnergyScanStream: AsyncSequence {
        
    public typealias Element = HCILEAdvertisingReport.Report
    
    public typealias AsyncIterator = AsyncThrowingStream<Element, Error>.Iterator
    
    internal typealias StreamContinuation = AsyncThrowingStream<Element, Error>.Continuation
    
    internal var stream: AsyncThrowingStream<Element, Error>!
    
    internal var continuation: StreamContinuation!
    
    private let lock = NSLock()
    
    private var _isScanning = true
    
    private var task: Task<(), Never>!
    
    internal init(_ build: @escaping (Continuation) async -> ()) {
        let stream = AsyncThrowingStream(Element.self, bufferingPolicy: .bufferingNewest(100)) { [weak self] (streamContinuation) in
            guard let self = self else { return }
            self.continuation = streamContinuation
            let continuation = Continuation(self)
            self.task = Task(priority: .userInitiated) {
                await build(continuation)
            }
        }
        self.stream = stream
    }
    
    public func makeAsyncIterator() -> AsyncThrowingStream<Element, Error>.Iterator {
        stream.makeAsyncIterator()
    }
        
    public var isScanning: Bool {
        lock.lock()
        defer { lock.unlock() }
        return _isScanning
    }
    
    public func stop() {
        lock.lock()
        assert(_isScanning)
        _isScanning = false
        lock.unlock()
        task?.cancel()
        continuation.finish()
    }
    
    internal func yield(_ value: Element) {
        continuation.yield(value)
    }
    
    internal func finish(throwing error: Error) {
        lock.lock()
        assert(_isScanning)
        _isScanning = false
        lock.unlock()
        continuation.finish(throwing: error)
    }
    
    internal struct Continuation {
        
        private unowned let stream: AsyncLowEnergyScanStream
        
        init(_ stream: AsyncLowEnergyScanStream) {
            self.stream = stream
        }
        
        func yield(_ value: Element) {
            stream.yield(value)
        }
        
        func finish(throwing error: Error) {
            stream.finish(throwing: error)
        }
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
