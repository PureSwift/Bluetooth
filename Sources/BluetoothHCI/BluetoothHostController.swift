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
    static var controllers: [Self] { get async }
    
    /// Send an HCI command to the controller.
    func deviceCommand <C: HCICommand> (_ command: C) async throws
    
    /// Send an HCI command with parameters to the controller.
    func deviceCommand <CP: HCICommandParameter> (_ commandParameter: CP) async throws
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<C: HCICommand>(_ command: C, timeout: HCICommandTimeout) async throws
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<C: HCICommand, EP: HCIEventParameter>(_ command: C, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) async throws -> EP
    
    /// Send a command to the controller and wait for response.
    func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: HCICommandTimeout) async throws
    
    /// Sends a command to the device and waits for a response.
    func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (_ commandParameter: CP, _ eventParameterType: EP.Type, timeout: HCICommandTimeout) async throws -> EP
    
    /// Sends a command to the device and waits for a response with return parameter values.
    func deviceRequest <Return: HCICommandReturnParameter> (_ commandReturnType: Return.Type, timeout: HCICommandTimeout) async throws -> Return
    
    /// Sends a command to the device and waits for a response with return parameter values.
    func deviceRequest <CP: HCICommandParameter, Return: HCICommandReturnParameter> (_ commandParameter: CP, _ commandReturnType: Return.Type, timeout: HCICommandTimeout) async throws -> Return
        
    /// Polls and waits for events.
    func recieve<Event>(_ eventType: Event.Type) async throws -> Event where Event: HCIEventParameter, Event.HCIEventType == HCIGeneralEvent
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
        get async {
            return await controllers.first
        }
    }
}
