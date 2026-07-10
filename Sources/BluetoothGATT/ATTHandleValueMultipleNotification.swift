//
//  ATTHandleValueMultipleNotification.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Multiple Handle Value Notification
///
/// A server can send a notification of the values of multiple attributes at any time.
@frozen
public struct ATTHandleValueMultipleNotification<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .handleValueMultipleNotification }

    /// The attribute handles and values being notified.
    public let notifications: [Notification]

    public init?(notifications: [Notification]) {
        guard notifications.isEmpty == false
        else { return nil }
        self.notifications = notifications
    }
}

public extension ATTHandleValueMultipleNotification {

    /// An attribute handle and value pair.
    struct Notification: Equatable, Hashable, Sendable {

        /// The handle of the attribute.
        public var handle: UInt16

        /// The value of the attribute.
        public var value: Value

        public init(handle: UInt16, value: Value) {
            self.handle = handle
            self.value = value
        }
    }
}

// MARK: - DataConvertible

extension ATTHandleValueMultipleNotification: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= 5,
            Self.validateOpcode(data)
        else { return nil }

        var notifications = [Notification]()

        var offset = 1
        while offset < data.count {

            // Attribute Handle + Value Length
            guard data.count >= offset + 4
            else { return nil }

            let handle = UInt16(littleEndian: UInt16(bytes: (data[offset], data[offset + 1])))
            let length = Int(UInt16(littleEndian: UInt16(bytes: (data[offset + 2], data[offset + 3]))))
            offset += 4

            // Attribute Value
            guard data.count >= offset + length
            else { return nil }

            let value: Value
            if length > 0 {
                value = Value(data.subdata(in: offset..<offset + length))
            } else {
                value = Value()
            }
            offset += length

            notifications.append(Notification(handle: handle, value: value))
        }

        self.init(notifications: notifications)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += Self.attributeOpcode.rawValue
        for notification in notifications {
            data += notification.handle.littleEndian
            data += UInt16(notification.value.count).littleEndian
            data += notification.value
        }
    }

    public var dataLength: Int {
        1 + notifications.reduce(0) { $0 + 4 + $1.value.count }
    }
}
