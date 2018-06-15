//
//  HCIEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

#if os(Linux)
    import Glibc
#elseif os(OSX) || os(iOS)
    import Darwin.C
#endif

/// HCI Event Opcode
public protocol HCIEvent: RawRepresentable, Hashable, CustomStringConvertible {
    
    init?(rawValue: UInt8)
    
    var rawValue: UInt8 { get }
    
    var name: String { get }
}

public extension HCIEvent {
    
    var description: String {
        
        return name
    }
}

public protocol HCIEventParameter {
    
    associatedtype HCIEventType: HCIEvent
    
    /// Event Opcode
    static var event: HCIEventType { get }
    
    /// Length of the event parameter when encoded to data.
    static var length: Int { get }
    
    /// Attempt to initialize event parameter from data. 
    init?(data: Data)
}
