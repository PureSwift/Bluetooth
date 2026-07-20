//
//  LowEnergyRxPhys.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// The RX_PHYS parameter is a bit field that indicates the receiver PHYs that the Host prefers
/// the Controller to use. If the ALL_PHYS parameter specifies that the Host has no preference,
/// the RX_PHYS parameter is ignored; otherwise at least one bit shall be set to 1.
@frozen
public struct LowEnergyRxPhys: OptionSet, Hashable, Sendable, CaseIterable {

    public let rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }

    /// The Host prefers to use the LE 1M receiver PHY (possibly among others)
    public static let hostUseLe1MReceiverPhy = LowEnergyRxPhys(rawValue: 0b001)

    /// The Host prefers to use the LE 2M receiver PHY (possibly among others)
    public static let hostUseLe2MReceiverPhy = LowEnergyRxPhys(rawValue: 0b010)

    /// The Host prefers to use the LE Coded receiver PHY (possibly among others)
    public static let hostUseLeCodedReceiverPhy = LowEnergyRxPhys(rawValue: 0b100)

    public static let allCases: [LowEnergyRxPhys] = [
        .hostUseLe1MReceiverPhy,
        .hostUseLe2MReceiverPhy,
        .hostUseLeCodedReceiverPhy
    ]
}
