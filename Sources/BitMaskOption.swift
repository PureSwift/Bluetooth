//
//  BitMaskOption.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

#if swift(>=4.0)
    
    /// Enum represents a bit mask flag / option.
    public protocol BitMaskOption: RawRepresentable, Hashable where RawValue: FixedWidthInteger {
    
    /// All the cases of the enum.
    static var all: Set<Self> { get }
    
    }
    
#elseif swift(>=3.0.2)
    
    public protocol BitMaskOption: RawRepresentable, Hashable {
        
        associatedtype RawValue: Integer
        
        /// All the cases of the enum.
        static var all: Set<Self> { get }
    }
    
#endif

#if swift(>=4.0)
    
    public extension Collection where Element: BitMaskOption {
    
        /// Convert Swift enums for option flags into their raw values OR'd.
        var flags: Element.RawValue {
    
            @inline(__always)
            get { return reduce(0, { $0 | $1.rawValue }) }
        }
    }
    
#elseif swift(>=3.0.2)
    
    public extension Collection where Iterator.Element: BitMaskOption {
        
        /// Convert Swift enums for option flags into their raw values OR'd.
        var flags: Iterator.Element.RawValue {
            
            @inline(__always)
            get { return reduce(0, { $0 | $1.rawValue }) }
        }
    }
    
#endif

public extension BitMaskOption {
    
    /// Whether the enum case is present in the raw value.
    @inline(__always)
    func isContained(in rawValue: RawValue) -> Bool {
        
        return (self.rawValue & rawValue) != 0
    }
    
    @inline(__always)
    static func from(flags: RawValue) -> Set<Self> {
        
        #if swift(>=4.0)
            return Self.all.filter({ $0.isContained(in: flags) })
        #elseif swift(>=3.0.2)
            return Set(Array(Self.all).filter({ $0.isContained(in: flags) }))
        #endif
    }
}
