//
//  BluetoothHostController.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth HCI controller.
public protocol BluetoothHostControllerInterface {
    
    /// All controllers on the host.
    static var controllers: [Self] { get }
    
    /// The default controller on the host.
    static var `default`: Self? { get }
    
    /// The Bluetooth Address of the controller.
    var address: Address { get }
    
    /// Send an HCI command to the controller.
    mutating func deviceCommand <T: HCICommand> (_ command: T) throws
    
    /// Send an HCI command with parameters to the controller.
    mutating func deviceCommand <T: HCICommandParameter> (_ commandParameter: T) throws
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<C: HCICommand>(_ command: C, timeout: Int) throws
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: Int) throws
    
    /// Sends a command to the device and waits for a response.
    mutating func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (commandParameter: CP, eventParameterType: EP.Type, timeout: Int) throws -> EP
    
    /// Sends a command to the device and waits for a response with return parameter values.
    mutating func deviceRequest <Return: HCICommandReturnParameter> (_ commandReturnType : Return.Type, timeout: Int) throws -> Return
    
    /// Sends a command to the device and waits for a response with return parameter values.
    mutating func deviceRequest <CP: HCICommandParameter, Return: HCICommandReturnParameter> (_ commandParameter: CP,_ commandReturnType: Return.Type, timeout: Int) throws -> Return
    
    /// Polls and waits for events.
    mutating func pollEvent <T: HCIEventParameter> (_ eventParameterType: T.Type,
                                                    shouldContinue: () -> (Bool),
                                                    event: (T) throws -> ()) throws
}

/// Bluetooth HCI errors
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
