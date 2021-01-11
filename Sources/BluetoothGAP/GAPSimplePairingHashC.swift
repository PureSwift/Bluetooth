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
@frozen
public struct GAPSimplePairingHashC: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .simplePairingHashC
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        self.uuid = uuid
    }
}

public extension GAPSimplePairingHashC {
    
    init?(data: Data) {
        
        guard data.count == UInt128.length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[0],
                                                              data[1],
                                                              data[2],
                                                              data[3],
                                                              data[4],
                                                              data[5],
                                                              data[6],
                                                              data[7],
                                                              data[8],
                                                              data[9],
                                                              data[10],
                                                              data[11],
                                                              data[12],
                                                              data[13],
                                                              data[14],
                                                              data[15]))))
        
        self.init(uuid: uuid)
    }
    
    func append(to data: inout Data) {
        data += UInt128(uuid: uuid).littleEndian
    }
    
    var dataLength: Int {
        return UInt128.length
    }
}

// MARK: - CustomStringConvertible

extension GAPSimplePairingHashC: CustomStringConvertible {
    
    public var description: String {
        return uuid.description
    }
}
