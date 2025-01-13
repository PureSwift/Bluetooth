//
//  GAPCompleteLocalName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// GAP Complete Local Name
///
/// The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
@frozen
public struct GAPCompleteLocalName: GAPData, Equatable, Hashable {

    public static var dataType: GAPDataType { .completeLocalName }

    public var name: String

    public init(name: String) {
        self.name = name
    }
}

public extension GAPCompleteLocalName {

    init?<Data: DataContainer>(data: Data) {

        guard let rawValue = String(utf8: data)
        else { return nil }

        self.init(name: rawValue)
    }

    func append<Data: DataContainer>(to data: inout Data) {
        data += name.utf8
    }

    var dataLength: Int {
        return name.utf8.count
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteLocalName: CustomStringConvertible {

    public var description: String {
        return name
    }
}

// MARK: - ExpressibleByStringLiteral

extension GAPCompleteLocalName: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(name: value)
    }
}
