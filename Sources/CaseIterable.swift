//
//  CaseIterable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if swift(>=4.2)
#else
/// A type that provides a collection of all of its values.
///
/// Types that conform to the `CaseIterable` protocol are typically
/// enumerations without associated values. When using a `CaseIterable` type,
/// you can access a collection of all of the type's cases by using the type's
/// `allCases` property.
public protocol CaseIterable {
    
    /// A type that can represent a collection of all values of this type.
    associatedtype AllCases: Collection where Self.AllCases.Element == Self
    
    /// A collection of all values of this type.
    static var allCases: Self.AllCases { get }
}
#endif
