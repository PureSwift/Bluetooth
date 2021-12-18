//
//  HCIReadRemoteExtendedFeatures.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Remote Extended Features Command
    ///
    /// The Read_Remote_Extended_Features command returns the requested page of the extended LMP features for the remote device identified by the specified Connection_Handle. The Connection_Handle must be the Connection_Handle for an ACL connection. This command is only available if the extended features feature is implemented by the remote device. The Read Remote Extended Features Complete event will return the requested information.
    func readRemoteExtendedFeatures(handle: UInt16,
                                    pageNumber: UInt8,
                                    timeout: HCICommandTimeout = .default) async throws -> BitMaskOptionSet<LMPFeature> {
        
        let readRemoteExtendedFeatures = HCIReadRemoteExtendedFeatures(handle: handle, pageNumber: pageNumber)
        
        return try await deviceRequest(readRemoteExtendedFeatures,
                                 HCIReadRemoteExtendedFeaturesComplete.self,
                                 timeout: timeout).features
    }
}

// MARK: - Command

/// Read Remote Extended Features Command
///
/// The Read_Remote_Extended_Features command returns the requested page of the extended LMP features for the remote device identified by the specified Connection_Handle. The Connection_Handle must be the Connection_Handle for an ACL connection. This command is only available if the extended features feature is implemented by the remote device. The Read Remote Extended Features Complete event will return the requested information.
@frozen
public struct HCIReadRemoteExtendedFeatures: HCICommandParameter {
    
    public static let command = LinkControlCommand.readRemoteExtendedFeatures
    
    /// Specifies which Connection_Handle’s LMP-supported features list to get.
    public var handle: UInt16
    
    public var pageNumber: UInt8
    
    public init(handle: UInt16, pageNumber: UInt8) {
        
        self.handle = handle
        self.pageNumber = pageNumber
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1, pageNumber])
    }
}
