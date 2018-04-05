//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/5/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import Foundation

public extension UUID {
    
    public static var length: Int { return 16 }
    public static var stringLength: Int { return 36 }
    public static var unformattedStringLength: Int { return 32 }
}

extension UUID: ByteValue {
    
    public static var bitWidth: Int { return 128 }
    
    @inline(__always)
    public init(bytes: uuid_t) {
        
        self.init(uuid: bytes)
    }
    
    public var bytes: uuid_t {
        
        @inline(__always)
        get { return uuid }
        
        @inline(__always)
        set { self = Foundation.UUID(uuid: newValue) }
    }
}

extension UUID: RawRepresentable {
    
    @inline(__always)
    public init?(rawValue uuidString: String) {
        
        self.init(uuidString: uuidString)
    }
    
    public var rawValue: String {
        
        return uuidString
    }
}

public extension UUID {
    
    public init?(data: Data) {
        
        guard data.count == UUID.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}
