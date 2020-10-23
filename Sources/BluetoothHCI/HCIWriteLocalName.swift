//
//  HCIWriteLocalName.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Local Name Command
    ///
    /// Provides the ability to read the stored user-friendly name for the BR/EDR Controller.
    func writeLocalName(_ newValue: String, timeout: HCICommandTimeout = .default) throws {
        
        guard let command = HCIWriteLocalName(localName: newValue)
            else { fatalError("Invalid string length \(newValue)") }
        
        try deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/**
 The Write Local Name command provides the ability to modify the user-friendly name for the BR/EDR Controller.
 */
public struct HCIWriteLocalName: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writeLocalName
    
    public static let length = HCI.maximumNameLength
    
    public let localName: String
    
    public init?(localName: String) {
        
        guard localName.utf8.count <= type(of: self).length
            else { return nil }
        
        self.localName = localName
    }
    
    public var data: Data {
        
        let maxLength = type(of: self).length
        
        var data = Data(localName.utf8)
        
        assert(data.count <= maxLength)
        
        if data.count < maxLength {
            
            data += Data(repeating: 0x00, count: maxLength - data.count)
        }
        
        return data
    }
}
