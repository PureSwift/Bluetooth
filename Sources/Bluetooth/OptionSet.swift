//
//  OptionSet.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/20/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// Conveniences for `OptionSet` types whose individual options are enumerated via `CaseIterable`.
///
/// Each defined option is a single-bit value of the set's own type, so `allCases` lists the flags
/// and these helpers derive whole-set values from them.
public extension OptionSet where Self: CaseIterable, Element == Self, AllCases == [Self] {

    /// A set containing every defined option.
    static var all: Self {
        allCases.reduce(into: Self()) { $0.formUnion($1) }
    }

    /// The defined options contained in this set, in declaration order.
    var elements: [Self] {
        Self.allCases.filter { contains($0) }
    }

    /// The number of defined options contained in this set.
    var count: Int {
        Self.allCases.reduce(into: 0) { $0 += contains($1) ? 1 : 0 }
    }
}
