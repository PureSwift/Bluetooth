//
//  GAPURI.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// GAP URI
@frozen
public struct GAPURI: GAPData, Equatable, Hashable, Sendable {

    public static var dataType: GAPDataType { .uri }

    public var uri: String

    public init(uri: String) {
        self.uri = uri
    }
}

public extension GAPURI {

    init?<Data: DataContainer>(data: Data) {

        guard let string = String(utf8: data)
        else { return nil }

        self.uri = string
    }

    func append<Data: DataContainer>(to data: inout Data) {
        data += uri.utf8
    }

    var dataLength: Int {
        return uri.utf8.count
    }
}

// MARK: - CustomStringConvertible

extension GAPURI: CustomStringConvertible {

    public var description: String {
        return uri
    }
}
