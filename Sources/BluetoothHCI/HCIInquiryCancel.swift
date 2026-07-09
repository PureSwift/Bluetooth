//
//  HCIInquiryCancel.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// Inquiry Cancel Command
    ///
    /// This command is used to start a test where the DUT receives test reference packets at a fixed interval.
    /// The tester generates the test reference packets.
    func inquiryCancel(timeout: HCICommandTimeout = .default) async throws {

        try await deviceRequest(LinkControlCommand.inquiryCancel, timeout: timeout)
    }
}
