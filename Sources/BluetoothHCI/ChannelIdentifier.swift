//
//  Channel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth Channel Identifier
@frozen
public struct ChannelIdentifier: RawRepresentable, Equatable, Hashable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
}

public extension ChannelIdentifier {
    
    static var att: ChannelIdentifier { return 4 }
}

// MARK: - ExpressibleByIntegerLiteral

extension ChannelIdentifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension ChannelIdentifier: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
