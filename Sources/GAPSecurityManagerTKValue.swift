//
//  GAPSecurityManagerTKValue.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Security Manager TK Value data type allows an out of band mechanism to be used by the Security Manager to communicate the TK value.
/// Size: 16 octets
/// Value as used in pairing over LE Physical channel. Format defined in [Vol. 3], Part H Section 2.3
public struct GAPSecurityManagerTKValue: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .securityManagerTKValue
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
}

public extension GAPSecurityManagerTKValue {
    
    init?(data: Slice<LowEnergyAdvertisingData>) {
        
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
    
    func append(to data: inout LowEnergyAdvertisingData) {
        
        data += UInt128(uuid: uuid).littleEndian
    }
}

// MARK: - CustomStringConvertible

extension GAPSecurityManagerTKValue: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}
