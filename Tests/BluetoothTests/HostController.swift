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
        
        let _ = try hciRequest(T.command, commandParameterData: commandParameter.byteValue)
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
        
        let data = try hciRequest(CP.command, commandParameterData: commandParameter.byteValue)
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
    }
    
    /// Sends a command to the device and waits for a response.
    mutating func deviceRequest <CP: HCICommandParameter, EP: HCIEventParameter> (commandParameter: CP,
                                                                                  eventParameterType: EP.Type,
                                                                                  timeout: Int) throws -> EP {
        
        let command = CP.command
        
        let parameterData = commandParameter.byteValue
        
        let data = try hciRequest(command,
                                  commandParameterData: parameterData,
                                  event: EP.event.rawValue,
                                  eventParameterLength: EP.length)
        
        guard let eventParameter = EP(byteValue: data)
            else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: data)) }
        
        return eventParameter
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
                                                    commandParameterData: [UInt8] = [],
                                                    event: UInt8 = 0,
                                                    eventParameterLength: Int = 0) throws -> [UInt8] {
        
        log("\(#function) \(command) \(commandParameterData.count) bytes")
        
        let commandHeader = HCICommandHeader(command: command, parameterLength: UInt8(commandParameterData.count))
        let opcode = commandHeader.opcode
        let commandData = commandHeader.byteValue + commandParameterData
        
        guard let testCommand = commands[opcode]
            else { throw Error.invalidCommand }
        
        guard testCommand.command == commandData
            else { throw Error.invalidCommand }
        
        for eventBuffer in testCommand.events {
            
            let actualBytesRead = eventBuffer.count
            let headerData = Array(eventBuffer[0 ..< HCIEventHeader.length])
            let eventData = Array(eventBuffer[(HCIEventHeader.length) ..< actualBytesRead])
            
            guard let eventHeader = HCIEventHeader(bytes: headerData)
                else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: headerData)) }
            
            log("Event header: \(eventHeader)")
            
            switch eventHeader.event {
                
            case HCIGeneralEvent.commandStatus.rawValue:
                
                let parameterData = Array(eventData.prefix(min(eventData.count, HCIGeneralEvent.CommandStatusParameter.length)))
                
                guard let parameter = HCIGeneralEvent.CommandStatusParameter(byteValue: parameterData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: parameterData)) }
                
                /// must be command status for sent command
                guard parameter.opcode == opcode
                    else { continue }
                
                ///
                guard event == HCIGeneralEvent.commandStatus.rawValue else {
                    
                    guard parameter.status == 0
                        else { throw HCIError(rawValue: parameter.status) ?? POSIXError(code: .EIO) }
                    
                    break
                }
                
                // success!
                //try done()
                let dataLength = min(eventData.count, eventParameterLength)
                return Array(eventData.suffix(dataLength))
                
            case HCIGeneralEvent.commandComplete.rawValue:
                
                let parameterData = Array(eventData.prefix(min(eventData.count, HCIGeneralEvent.CommandCompleteParameter.length)))
                
                guard let parameter = HCIGeneralEvent.CommandCompleteParameter(byteValue: parameterData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: parameterData)) }
                
                guard parameter.opcode == opcode else { continue }
                
                // success!
                //try done()
                
                let commandParameterLength = HCIGeneralEvent.CommandCompleteParameter.length
                let data = eventData.suffix(commandParameterLength)
                
                let dataLength = min(data.count, eventParameterLength)
                return Array(data.suffix(dataLength))
                
            case HCIGeneralEvent.remoteNameRequestComplete.rawValue:
                
                guard eventHeader.event == event else { break }
                
                let parameterData = Array(eventData.prefix(min(eventData.count, HCIGeneralEvent.RemoteNameRequestCompleteParameter.length)))
                
                guard let parameter = HCIGeneralEvent.RemoteNameRequestCompleteParameter(byteValue: parameterData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: parameterData)) }
                
                if commandParameterData.isEmpty == false {
                    
                    guard let commandParameter = LinkControlCommand.RemoteNameRequestParameter(byteValue: commandParameterData)
                        else { fatalError("HCI Command 'RemoteNameRequest' was sent, but the event parameter data does not correspond to 'RemoteNameRequestParameter'") }
                    
                    // must be different, for some reason
                    guard commandParameter.address != parameter.address else { continue }
                }
                
                // success!
                //try done()
                let dataLength = min(eventData.count - 1, eventParameterLength)
                return Array(eventData.suffix(dataLength))
                
            case HCIGeneralEvent.lowEnergyMeta.rawValue:
                
                let parameterData = eventData
                
                guard let metaParameter = HCIGeneralEvent.LowEnergyMetaParameter(byteValue: parameterData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: parameterData)) }
                
                // LE event should match
                guard metaParameter.subevent.rawValue == event
                    else { continue }
                
                // success!
                //try done()
                return metaParameter.data
                
            // all other events
            default:
                
                guard eventHeader.event == event else { break }
                
                //try done()
                let dataLength = min(eventData.count, eventParameterLength)
                return Array(eventData.suffix(dataLength))
            }
        }
        
        // throw timeout error
        throw POSIXError(code: .ETIMEDOUT)
    }
}

internal extension TestHostController {
    
    enum Error: Swift.Error {
        
        case invalidCommand
        case invalidEvent
    }
    
    struct Command {
        
        var command: [UInt8]
        
        var events: [[UInt8]]
    }
}
