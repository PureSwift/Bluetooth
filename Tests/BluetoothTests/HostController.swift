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
        
        let _ = try hciRequest(command)
    }
    
    /// Send an HCI command with parameters to the controller.
    mutating func deviceCommand <T: HCICommandParameter> (_ commandParameter: T) throws {
        
        let _ = try hciRequest(T.command, parameterData: commandParameter.byteValue)
    }
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<C: HCICommand>(_ command: C, timeout: Int) throws {
        
        let data = try hciRequest(command)
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
    }
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: Int) throws {
        
        let data = try hciRequest(CP.command, parameterData: commandParameter.byteValue)
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
    }
    
    /// Sends a command to the device and waits for a response.
    mutating func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (commandParameter: CP,
                                                                                  eventParameterType: EP.Type,
                                                                                  timeout: Int) throws -> EP {
        
        let data = try hciRequest(CP.command,
                                  parameterData: commandParameter.byteValue,
                                  eventParameterLength: 1)
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
    }
    
    /// Sends a command to the device and waits for a response with return parameter values.
    mutating func deviceRequest <Return: HCICommandReturnParameter> (_ commandReturnType : Return.Type, timeout: Int) throws -> Return {
        
        let data = try hciRequest(commandReturnType.command,
                                  eventParameterLength: commandReturnType.length + 1) // status code + parameters
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
        
        guard let response = Return(byteValue: Array(data.suffix(from: 1)))
            else { throw BluetoothHostControllerError.garbageResponse(Data(data)) }
        
        return response
    }
    
    /// Polls and waits for events.
    mutating func pollEvent <T: HCIEventParameter> (_ eventParameterType: T.Type,
                                           shouldContinue: () -> (Bool),
                                           event: (T) throws -> ()) throws {
        
        
    }
    
    // MARK: - Properties
    
    var log: (String) -> ()
    
    var commands = [UInt16: Command]()
    
    // MARK: - Private
    
    private mutating func hciRequest<T: HCICommand>(_ command: T,
                                                    parameterData: [UInt8] = [],
                                                    event: UInt8 = 0,
                                                    eventParameterLength: Int = 0) throws -> [UInt8] {
        
        log("\(#function) \(command) \(parameterData.count) bytes")
        
        let commandHeader = HCICommandHeader(command: command, parameterLength: UInt8(parameterData.count))
        let opcode = commandHeader.opcode
        let commandData = commandHeader.byteValue + parameterData
        
        guard let testCommand = commands[opcode]
            else { throw Error.invalidCommand }
        
        guard testCommand.command == commandData
            else { throw Error.invalidCommand }
        
        guard let firstEvent = testCommand.events.first
            else { return [] }
        
        let actualBytesRead = firstEvent.count
        let headerData = Array(eventBuffer[0 ..< HCIEventHeader.length])
        let eventData = Array(eventBuffer[(HCIEventHeader.length) ..< actualBytesRead])
        
        guard let eventHeader = HCIEventHeader(bytes: headerData)
            else { throw restoreFilter(BluetoothHostControllerError.garbageResponse(Data(bytes: headerData))) }
        
        log("Event header: \(eventHeader)")
        log("Event data: \(eventData)")
        
        
    }
}

internal extension TestHostController {
    
    enum Error: Swift.Error {
        
        case invalidCommand
    }
    
    struct Command {
        
        var command: [UInt8]
        
        var events: [[UInt8]]
    }
}
