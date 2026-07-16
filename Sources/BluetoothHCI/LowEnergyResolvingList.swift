//
//  LowEnergyResolvingList.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Clear Resolving List Command
    ///
    /// The command is used to remove all devices from the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyClearResolvingList(timeout: HCICommandTimeout = .default) async throws {
        try await deviceRequest(HCILowEnergyCommand.clearResolvedList, timeout: timeout)
    }
}
#endif
