//
//  HCIReadPageTimeout.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Page Timeout Command
    ///
    /// This command reads the value for the Page_Timeout configuration parameter.
    func readPageTimeout(timeout: HCICommandTimeout = .default) async throws -> HCIReadPageTimeoutReturn {
        
        return try await deviceRequest(HCIReadPageTimeoutReturn.self, timeout: timeout)
    }
}

// MARK: - Command

/// Read Page Timeout Command
///
/// This command reads the value for the Page_Timeout configuration parameter.
@frozen
public struct HCIReadPageTimeoutReturn: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.readPageTimeout
    
    public static let length: Int = MemoryLayout<UInt16>.size
    
    public var pageTimeout: PageTimeout
    
    public init?(data: Data) {
        
        guard data.count == HCIReadPageTimeoutReturn.length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let pageTimeout = PageTimeout(rawValue: rawValue)
            else { return nil }
        
        self.pageTimeout = pageTimeout
    }
}

extension HCIReadPageTimeoutReturn {
    
    public struct PageTimeout: RawRepresentable {
        
        public var rawValue: UInt16
        
        public var duration: Double {
            
            return Double(rawValue) * 0.625 / 1000
        }
        
        public init?(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}
