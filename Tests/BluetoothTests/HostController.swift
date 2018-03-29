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
        
        let data = try hciRequest(command, eventParameterLength: 1)
        
        guard let statusByte = data.first
            else { fatalError("Missing status byte!") }
        
        guard statusByte == 0x00
            else { throw HCIError(rawValue: statusByte)! }
    }
    
    /// Send a command to the controller and wait for response.
    mutating func deviceRequest<CP: HCICommandParameter>(_ commandParameter: CP, timeout: Int) throws {
        
        let data = try hciRequest(CP.command,
                                  commandParameterData: commandParameter.byteValue,
                                  eventParameterLength: 1)
        
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
    
    /// Sends a command to the device and waits for a response with return parameter values.
    mutating func deviceRequest <CP: HCICommandParameter, Return: HCICommandReturnParameter> (commandParameter: CP, commandReturnType : Return.Type, timeout: Int) throws -> Return {
        
        assert(CP.command.opcode == Return.command.opcode)
        
        let data = try hciRequest(commandReturnType.command,
                                  commandParameterData: commandParameter.byteValue,
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
        
        assert(T.event is HCIGeneralEvent, "Can only parse \(HCIGeneralEvent.self)")
        
        let eventCode = T.event
        
        while shouldContinue() {
            
            guard let message = queue.popFirst()
                else { return } // should be continue but we dont want to wait for tests
            
            switch message {
                
            case let .event(eventBuffer):
                
                let actualBytesRead = eventBuffer.count
                let eventData = Array(eventBuffer[(1 + HCIEventHeader.length) ..< actualBytesRead])
                
                // filter other events
                guard let eventDataCodeByte = eventData.first,
                    eventDataCodeByte == eventCode.rawValue
                    else { continue }
                
                guard let eventParameter = T.init(byteValue: eventData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(eventData)) }
                
                try event(eventParameter)
                
            case .command:
                
                // filter commands
                continue
            }
        }
    }
    
    // MARK: - Properties
    
    var log: (String) -> ()
    
    var queue = [HCIMessage]()
    
    // MARK: - Private
    
    private mutating func hciRequest<T: HCICommand>(_ command: T,
                                                    commandParameterData: [UInt8] = [],
                                                    event: UInt8 = 0,
                                                    eventParameterLength: Int = 0) throws -> [UInt8] {
        
        log("\(#function) \(command) \(commandParameterData.count) bytes")
        
        let commandHeader = HCICommandHeader(command: command, parameterLength: UInt8(commandParameterData.count))
        let opcode = commandHeader.opcode
        let commandData = commandHeader.byteValue + commandParameterData
        
        // get message in queue
        guard let firstMessage = queue.popFirst(),
            case let .command(testCommand) = firstMessage
            else { throw Error.invalidCommand }
        
        // validate command
        guard testCommand.0 == opcode,
            testCommand.1 == commandData
            else { throw Error.invalidCommand }
        
        while queue.isEmpty == false {
            
            guard let message = queue.popFirst()
                else { break } // should be continue but we dont want to wait for tests
            
            switch message {
                
            case let .event(eventBuffer):
                
                let actualBytesRead = eventBuffer.count
                let headerData = Array(eventBuffer[0 ..< 0 + HCIEventHeader.length])
                let eventData = Array(eventBuffer[(0 + HCIEventHeader.length) ..< actualBytesRead])
                
                guard let eventHeader = HCIEventHeader(bytes: headerData)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: headerData)) }
                
                log("Event: \(eventHeader.event)")
                
                switch eventHeader.event {
                    
                case .commandStatus:
                    
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
                    
                case .commandComplete:
                    
                    let parameterData = Array(eventData.prefix(min(eventData.count, HCIGeneralEvent.CommandCompleteParameter.length)))
                    
                    guard let parameter = HCIGeneralEvent.CommandCompleteParameter(byteValue: parameterData)
                        else { throw BluetoothHostControllerError.garbageResponse(Data(bytes: parameterData)) }
                    
                    guard parameter.opcode == opcode else { continue }
                    
                    // success!
                    //try done()
                    
                    let commandCompleteParameterLength = HCIGeneralEvent.CommandCompleteParameter.length
                    let data = eventData.suffix(eventParameterLength)
                    
                    let dataLength = max(data.count, commandCompleteParameterLength)
                    return Array(data.suffix(dataLength))
                    
                case .remoteNameRequestComplete:
                    
                    guard eventHeader.event.rawValue == event else { break }
                    
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
                    
                case .lowEnergyMeta:
                    
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
                    
                    guard eventHeader.event.rawValue == event else { break }
                    
                    //try done()
                    let dataLength = min(eventData.count, eventParameterLength)
                    return Array(eventData.suffix(dataLength))
                }
                
            case .command:
                
                continue
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
    
    enum HCIMessage {
        
        case command(UInt16, [UInt8])
        case event([UInt8])
    }
}

extension Array {
    
    mutating func popFirst() -> Element? {
        
        guard let first = self.first else { return nil }
        
        self.removeFirst()
        
        return first
    }
}
