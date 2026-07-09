//
//  HCICommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/13/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// HCI Command.
public protocol HCICommand: RawRepresentable, Hashable, CustomStringConvertible {

    /// The command group opcode.
    static var opcodeGroupField: HCIOpcodeGroupField { get }

    init?(rawValue: HCIOpcodeCommandField)

    var rawValue: HCIOpcodeCommandField { get }

    /// Human readable name of the HCI command.
    var name: String { get }
}

public extension HCICommand {

    var description: String {
        return name
    }
}

public extension HCICommand {

    /// The packed HCI command opcode.
    var opcode: UInt16 {

        let commandField = self.rawValue
        let groupField = Self.opcodeGroupField.rawValue
        return (commandField & 0x03ff) | (groupField << 10)
    }
}

public typealias HCIOpcodeCommandField = UInt16

/// HCI Command Parameter.
public protocol HCICommandParameter {

    associatedtype Command: HCICommand

    static var command: Command { get }

    /// Append the command parameter bytes into the buffer.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension DataContainer {

    /// Initialize data with contents of command parameter.
    init<T: HCICommandParameter>(_ value: T) {
        self.init()
        value.append(to: &self)
    }
}

/// The return value (not event) returned by an HCI command.
public protocol HCICommandReturnParameter {

    associatedtype Command: HCICommand

    static var command: Command { get }

    /// Length of the command return parameter when encoded to data.
    static var length: Int { get }

    // Attempt to initialize command return parameter from data.
    init?<Data: DataContainer>(data: Data)
}
