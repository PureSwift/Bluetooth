//
//  GAPSimplePairingHashC.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Specifies the Simple Pairing Hash C
/// Size: 16 octets
/// Format defined in [Vol. 2], Part H Section 7.2.2
public struct GAPSimplePairingHashC: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .simplePairingHashC
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
}

public extension GAPSimplePairingHashC {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == UInt128.length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[data.startIndex + 0],
                                                              data[data.startIndex + 1],
                                                              data[data.startIndex + 2],
                                                              data[data.startIndex + 3],
                                                              data[data.startIndex + 4],
                                                              data[data.startIndex + 5],
                                                              data[data.startIndex + 6],
                                                              data[data.startIndex + 7],
                                                              data[data.startIndex + 8],
                                                              data[data.startIndex + 9],
                                                              data[data.startIndex + 10],
                                                              data[data.startIndex + 11],
                                                              data[data.startIndex + 12],
                                                              data[data.startIndex + 13],
                                                              data[data.startIndex + 14],
                                                              data[data.startIndex + 15]))))
        
        self.init(uuid: uuid)
    }
    
    static func += <T: DataContainer> (data: inout T, value: Self) {
        
        data += UInt128(uuid: uuid).littleEndian
    }
}

// MARK: - CustomStringConvertible

extension GAPSimplePairingHashC: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}
