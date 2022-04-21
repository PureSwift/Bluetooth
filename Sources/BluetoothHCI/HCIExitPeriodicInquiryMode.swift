//
//  HCIExitPeriodicInquiryMode.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Exit Periodic Inquiry Mode Command
    ///
    /// The Exit_Periodic_Inquiry_Mode command is used to end the Periodic Inquiry mode when the local device is in Periodic Inquiry Mode. If the BR/EDR Control- ler is currently in an Inquiry process, the Inquiry process shall be stopped directly and the BR/EDR Controller shall no longer perform periodic inquiries until the Periodic Inquiry Mode command is reissued.
    func exitPeriodicInquiry(timeout: HCICommandTimeout = .default) async throws {
        
        try await deviceRequest(LinkControlCommand.exitPeriodicInquiry, timeout: timeout)
    }
}
