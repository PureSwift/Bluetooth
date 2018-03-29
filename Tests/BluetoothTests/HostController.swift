//
//  HostController.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 3/29/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Test Bluetooth Host Controller
internal struct TestHostController: BluetoothHostControllerInterface {
    
    /// All controllers on the host.
    static let controllers: [TestHostController] = [TestHostController()]
    
    /// The default controller on the host.
    static var `default`: TestHostController? { return controllers.first }
    
    init(address: Address = .any) {
        
        self.address = address
        self.log = { print("TestHostController: ", $0) }
    }
    
    /// The Bluetooth Address of the controller.
    let address: Address
    
    /// Send an HCI command to the controller.
    mutating func deviceCommand <T: HCICommand> (_ command: T) throws {
        
        try hciCommand(command)
    }
    
    /// Send an HCI command with parameters to the controller.
    mutating func deviceCommand <T: HCICommandParameter> (_ commandParameter: T) throws {
        
        try hciCommand(T.command, parameterData: commandParameter.byteValue)
    }
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<C: HCICommand>(_ command: C, timeout: Int) throws {
        
        
    }
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: Int) throws {
        
        
    }
    
    /// Sends a command to the device and waits for a response.
    mutating func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (commandParameter: CP,
                                                                                  eventParameterType: EP.Type,
                                                                                  timeout: Int) throws -> EP {
        
        
    }
    
    /// Sends a command to the device and waits for a response with return parameter values.
    mutating func deviceRequest <Return: HCICommandReturnParameter> (_ commandReturnType : Return.Type, timeout: Int) throws -> Return {
        
        
    }
    
    /// Polls and waits for events.
    mutating func pollEvent <T: HCIEventParameter> (_ eventParameterType: T.Type,
                                           shouldContinue: () -> (Bool),
                                           event: (T) throws -> ()) throws {
        
        
    }
    
    // MARK: - Properties
    
    var log: (String) -> ()
    
    // MARK: - Private
    
    private mutating func hciCommand<T: HCICommand>(_ command: T,
                                                    parameterData: [UInt8] = []) throws {
        
        log("\(#function) \(command) \(parameterData.count) bytes")
        
        // parse
        
    }
}

internal extension TestHostController {
    
    struct Command {
        
        var commandOpcode: UInt16
        
        var parameter: [UInt8]
        
        var 
    }
}
