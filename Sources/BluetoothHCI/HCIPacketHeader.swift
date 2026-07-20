//
//  HCIPacketHeader.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
#elseif canImport(FoundationEmbedded)
import FoundationEmbedded
#endif

// MARK: - HCI Packet structures

public protocol HCIPacketHeader {

    static var length: Int { get }

    init?<Data: DataContainer>(data: Data)

    /// Append the header bytes into the buffer.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension DataContainer {

    /// Initialize data with contents of packet header.
    init<T: HCIPacketHeader>(_ value: T) {
        self.init()
        self.reserveCapacity(T.length)
        value.append(to: &self)
    }
}

// MARK: - Command Header

/// HCI Command Packet Header
@frozen
public struct HCICommandHeader: HCIPacketHeader {  // hci_command_hdr (packed)

    public static let length = 3

    /// OCF & OGF
    public var opcode: UInt16

    public var parameterLength: UInt8

    public init(
        opcode: UInt16 = 0,
        parameterLength: UInt8 = 0
    ) {

        self.opcode = opcode
        self.parameterLength = parameterLength
    }

    public init<T: HCICommand>(command: T, parameterLength: UInt8 = 0) {

        self.opcode = command.opcode
        self.parameterLength = parameterLength
    }

    #if canImport(Foundation) || canImport(FoundationEmbedded)
    public static func from<T: HCICommandParameter>(_ commandParameter: T) -> (HCICommandHeader, Data) {

        let command = type(of: commandParameter).command
        let parameterData = Data(commandParameter)

        let header = HCICommandHeader(
            command: command,
            parameterLength: UInt8(parameterData.count))

        return (header, parameterData)
    }
    #endif

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.opcode = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.parameterLength = data[2]
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let opcodeBytes = opcode.littleEndian.bytes

        data += [opcodeBytes.0, opcodeBytes.1, parameterLength]
    }
}

// MARK: - Event Header

/// HCI Event Packet Header
@frozen
public struct HCIEventHeader: HCIPacketHeader {

    public static let length = 2

    public var event: HCIGeneralEvent

    public var parameterLength: UInt8

    public init(event: HCIGeneralEvent, parameterLength: UInt8) {

        self.event = event
        self.parameterLength = parameterLength
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        let eventByte = data[0]

        guard let event = HCIGeneralEvent(rawValue: eventByte)
        else { return nil }

        self.event = event
        self.parameterLength = data[1]
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += [event.rawValue, parameterLength]
    }
}
