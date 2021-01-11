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
@frozen
public struct GAPSecurityManagerTKValue: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .securityManagerTKValue
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
}

public extension GAPSecurityManagerTKValue {
    
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

extension GAPSecurityManagerTKValue: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}
