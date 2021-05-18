//
//  BluetoothHostController.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth HCI controller.
public protocol BluetoothHostControllerInterface: AnyObject {
    
    /// All controllers on the host.
    static var controllers: [Self] { get }
    
    /// Send an HCI command to the controller.
    func deviceCommand <C: HCICommand> (_ command: C) throws
    
    /// Send an HCI command with parameters to the controller.
    func deviceCommand <CP: HCICommandParameter> (_ commandParameter: CP) throws
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<C: HCICommand>(_ command: C, timeout: HCICommandTimeout) throws
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<C: HCICommand, EP: HCIEventParameter>(_ command: C, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) throws -> EP
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: HCICommandTimeout) throws
    
    /// Sends a command to the device and waits for a response.
    func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (_ commandParameter: CP, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) throws -> EP
    
    /// Sends a command to the device and waits for a response with return parameter values.
    func deviceRequest <Return: HCICommandReturnParameter> (_ commandReturnType: Return.Type, timeout: HCICommandTimeout) throws -> Return
    
    /// Sends a command to the device and waits for a response with return parameter values.
    func deviceRequest <CP: HCICommandParameter, Return: HCICommandReturnParameter> (_ commandParameter: CP, _ commandReturnType: Return.Type, timeout: HCICommandTimeout) throws -> Return
    
    /// Polls and waits for events.
    func pollEvent <EP: HCIEventParameter> (_ eventParameterType: EP.Type,
                                            shouldContinue: () -> (Bool),
                                            event: (EP) throws -> ()) throws
}

/// Bluetooth HCI errors
@frozen
public enum BluetoothHostControllerError: Error {
    
    /// The specified adapter could not be found.
    case adapterNotFound
    
    /// A method that changed the adapter's filter had an internal error,
    /// and unsuccessfully tried to restore the previous filter.
    ///
    /// First error is the method's error.
    /// The second error is the error while trying to restore the filter.
    case couldNotRestoreFilter(Error, Error)
    
    /// The recieved data could not be parsed correctly.
    case garbageResponse(Data)
}

public extension BluetoothHostControllerInterface {
    
    static var `default`: Self? {
        
        return controllers.first
    }
}

public extension BluetoothHostControllerInterface {
    
    @available(*, deprecated, message: "Use readDeviceAddress() instead")
    var address: BluetoothAddress {
        
        guard let address = try? self.readDeviceAddress()
            else { return .zero }
        
        return address
    }
}
