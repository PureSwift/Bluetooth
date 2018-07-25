//
//  HCIInquiryCancel.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Receiver Test Command
    ///
    /// This command is used to start a test where the DUT receives test reference packets at a fixed interval.
    /// The tester generates the test reference packets.
    func inquiryCancel(timeout: HCICommandTimeout = .default) throws {
        
        let inquiryCancel = HCIInquiryCancel()
        
        try deviceRequest(inquiryCancel, timeout: timeout)
    }
}

// MARK: - Command

/// Inquiry Cancel Command
///
/// This command shall cause the BR/EDR Controller to stop the current Inquiry if the BR/EDR Controller is in Inquiry Mode.
/// This command allows the Host to interrupt the BR/EDR Controller and request the BR/EDR Controller to perform a different task.
/// The command should only be issued after the Inquiry com- mand has been issued, a Command Status event has been received for the Inquiry command, and before the Inquiry Complete event occurs.
public struct HCIInquiryCancel: HCICommandParameter {
    
    public static let command = LinkControlCommand.inquiryCancel
    
    public init() {}
    
    public var data: Data {
        
        return Data()
    }
}
