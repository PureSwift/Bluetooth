//
//  HCIReadLocalName.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Local Name Command
    ///
    /// Provides the ability to modify the user- friendly name for the BR/EDR Controller.
    func readLocalName(timeout: HCICommandTimeout = .default) throws -> String {
        
        let value = try deviceRequest(HCIReadLocalName.self,
                                      timeout: timeout)
        
        return value.localName
    }
}

// MARK: - Command

/// Read Local Name Command
///
/// The Read Local Name command provides the ability to read the stored user-friendly name
/// for the BR/EDR Controller.
public struct HCIReadLocalName: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.readLocalName
    
    public static let length = HCI.maximumNameLength //248
    
    public let localName: String
    
    public init?(data: Data) {
        
        var data = unsafeBitCast([UInt8](data), to: [Int8].self)
        
        guard let localName = String(validatingUTF8: &data)
            else { return nil }
        
        self.localName = localName
    }
}
