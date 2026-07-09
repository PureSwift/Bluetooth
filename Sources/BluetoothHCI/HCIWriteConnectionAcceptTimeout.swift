//
//  HCIWriteConnectionAcceptTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Write Connection Accept Timeout Command
///
/// This command writes the value for the Connection Accept Timeout configuration parameter.
@frozen
public struct HCIWriteConnectionAcceptTimeout: HCICommandParameter {

    public static let command = HostControllerBasebandCommand.writeConnectionAcceptTimeout

    public var timeout: ConnectionAcceptTimeout

    public init(timeout: ConnectionAcceptTimeout) {

        self.timeout = timeout
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let timeoutBytes = timeout.rawValue.littleEndian.bytes

        data += [timeoutBytes.0, timeoutBytes.1]
    }
}
