//
//  Data.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

internal extension DataContainer {

    @usableFromInline
    func suffixCheckingBounds<Data: DataContainer>(from start: Int) -> Data {
        if count > start {
            return Data(suffix(from: start))
        } else {
            return Data()
        }
    }

    static func += (data: inout Self, bytes: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)) {
        let length = MemoryLayout<(UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)>.size
        withUnsafePointer(to: bytes) {
            $0.withMemoryRebound(to: UInt8.self, capacity: length) {
                data.append($0, count: length)
            }
        }
    }
}
