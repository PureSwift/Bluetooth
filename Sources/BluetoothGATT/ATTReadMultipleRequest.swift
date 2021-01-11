//
//  ATTReadMultipleRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Multiple Request
///
/// The *Read Multiple Request* is used to request the server to read two or more values
/// of a set of attributes and return their values in a *Read Multiple Response*.
///
/// Only values that have a known fixed size can be read, with the exception of the last value that can have a variable length.
/// The knowledge of whether attributes have a known fixed size is defined in a higher layer specification.
@frozen
public struct ATTReadMultipleRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readMultipleRequest }
    
    /// The handles of the attributes to read.
    public var handles: [UInt16]
    
    public init?(handles: [UInt16]) {
        
        guard handles.count >= 2
            else { return nil }
        
        self.handles = handles
    }
}

public extension ATTReadMultipleRequest {
    
    init?(data: Data) {
        
        guard data.count >= 5,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        let handleCount = (data.count - 1) / 2
        
        guard (data.count - 1) % 2 == 0
            else { return nil }
        
        // preallocate handle buffer
        var handles = [UInt16]()
        handles.reserveCapacity(handleCount)
        
        for index in 0 ..< handleCount {
            
            let handleIndex = 1 + (index * 2)
            
            let handle = UInt16(littleEndian: UInt16(bytes: (data[handleIndex], data[handleIndex + 1])))
            
            handles.append(handle)
        }
        
        self.init(handles: handles)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadMultipleRequest: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + (2 * handles.count)
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadMultipleRequest) {
        
        data += attributeOpcode.rawValue
        value.handles.forEach { data += $0 }
    }
}
