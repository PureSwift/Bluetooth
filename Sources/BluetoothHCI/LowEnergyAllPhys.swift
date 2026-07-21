//
//  LowEnergyAllPhys.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// The ALL_PHYS parameter is a bit field that allows the Host to specify, for each direction,
/// whether it has no preference among the PHYs that the Controller supports in a given direction
/// or whether it has specified particular PHYs that it prefers in the TX_PHYS or RX_PHYS parameter.
@frozen
public struct LowEnergyAllPhys: OptionSet, Hashable, Sendable, CaseIterable {

    public let rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }

    /// The Host has no preference among the transmitter PHYs supported by the Controller
    public static let hostHasNoPreferenceAmongTheTransmitterPhy = LowEnergyAllPhys(rawValue: 0b01)

    /// The Host has no preference among the receiver PHYs supported by the Controller
    public static let hostHasNoPreferenceAmongTheReceiverPhy = LowEnergyAllPhys(rawValue: 0b10)

    public static let allCases: [LowEnergyAllPhys] = [
        .hostHasNoPreferenceAmongTheTransmitterPhy,
        .hostHasNoPreferenceAmongTheReceiverPhy
    ]
}
