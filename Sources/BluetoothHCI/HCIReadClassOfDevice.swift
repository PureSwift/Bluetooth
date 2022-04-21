//
//  HCIReadClassOfDevice.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Class of Device Command
    ///
    /// This command writes the value for the Class_of_Device parameter.
    func readClassOfDevice(timeout: HCICommandTimeout = .default) async throws -> ClassOfDevice {
        
        return try await deviceRequest(HCIReadClassOfDeviceReturn.self, timeout: timeout).classOfDevice
    }
}

// MARK: - Return Parameter

/// Read Class of Device Command
///
/// This command writes the value for the Class_of_Device parameter.
@frozen
public struct HCIReadClassOfDeviceReturn: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.readClassOfDevice
    
    public static let length: Int = MemoryLayout<UInt24>.size
    
    public var classOfDevice: ClassOfDevice
    
    public init?(data: Data) {
        
        guard data.count == HCIReadClassOfDeviceReturn.length
            else { return nil }
        
        guard let classOfDevice = ClassOfDevice(data: data)
            else { return nil }
        
        self.classOfDevice = classOfDevice
    }
}
