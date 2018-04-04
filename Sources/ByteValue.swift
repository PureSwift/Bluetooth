//
//  ByteValueType.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/3/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

/// Stores a primitive value. 
///
/// Useful for Swift wrappers for primitive byte types. 
public protocol ByteValue: Equatable {
    
    associatedtype ByteValue
    
    /// Returns the the primitive byte type.
    var bytes: ByteValue { get }
    
    /// Initializes with the primitive the primitive byte type.
    init(bytes: ByteValue)
    
    /// The number of bits used for the underlying binary representation of values of this type.
    static var bitWidth: Int { get }
}
