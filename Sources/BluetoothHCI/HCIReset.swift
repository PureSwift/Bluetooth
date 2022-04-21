//
//  HCIReset.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Reset Command
    ///
    /// The Reset command will reset the Controller and the Link Manager on the BR/ EDR Controller, the PAL on an AMP Controller, or the Link Layer on an LE Controller. If the Controller supports both BR/EDR and LE then the Reset command shall reset the Link Manager, Baseband and Link Layer. The Reset command shall not affect the used HCI transport layer since the HCI transport layers may have reset mechanisms of their own. After the reset is completed, the current operational state will be lost, the Controller will enter standby mode and the Controller will automatically revert to the default values for the parameters for which default values are defined in the specification.
    /// - Note: The Reset command will not necessarily perform a hardware reset. This is implementation defined. On an AMP Controller, the Reset command shall reset the service provided at the logical HCI to its initial state , but beyond this the exact effect on the Controller device is implementation defined and should not interrupt the service provided to other protocol stacks.
    /// The Host shall not send additional HCI commands before the Command Com- plete event related to the Reset command has been received.
    func reset(timeout: HCICommandTimeout = .default) async throws {
        
        return try await deviceRequest(HostControllerBasebandCommand.reset, timeout: timeout)
    }
}
