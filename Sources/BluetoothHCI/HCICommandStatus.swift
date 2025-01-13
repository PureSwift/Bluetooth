//
//  HCICommandStatus.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Command Status Event
@frozen
public struct HCICommandStatus: HCIEventParameter {

    public static let event = HCIGeneralEvent.commandStatus
    public static let length = 4

    public var status: HCIStatus
    public var ncmd: UInt8
    public var opcode: UInt16

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        let statusByte = data[0]

        guard let status = HCIStatus(rawValue: statusByte)
        else { return nil }

        self.status = status
        self.ncmd = data[1]
        self.opcode = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
    }
}
