//
//  HCIQoSSetup.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//
// swiftlint:disable function_parameter_count

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// QoS Setup Command
    ///
    /// The QoS_Setup command is used to specify Quality of Service parameters for a Connection_Handle. The Connection_Handle must be a Connection_Handle for an ACL connection. These QoS parameter are the same parameters as L2CAP QoS.
    /// This allows the Link Manager to have all of the information about what the Host is requesting for each connection. The LM will determine if the QoS parameters can be met. BR/EDR Controllers that are both slaves and masters can use this command. When a device is a slave, this com- mand will trigger an LMP request to the master to provide the slave with the specified QoS as determined by the LM. When a device is a master, this com- mand is used to request a slave device to accept the specified QoS as deter- mined by the LM of the master. The Connection_Handle command parameter is used to identify for which connection the QoS request is requested.
    @discardableResult
    func qosSetup(connectionHandle: UInt16,
                  serviceType: HCIQoSSetup.ServiceType,
                  tokenRate: UInt32,
                  peakBandWidth: UInt32,
                  latency: UInt32,
                  delayVariation: UInt32,
                  timeout: HCICommandTimeout = .default) async throws -> HCIQoSSetupComplete {
        
        let command = HCIQoSSetup(connectionHandle: connectionHandle,
                                  serviceType: serviceType,
                                  tokenRate: tokenRate,
                                  peakBandWidth: peakBandWidth,
                                  latency: latency,
                                  delayVariation: delayVariation)
        
        return try await deviceRequest(command, HCIQoSSetupComplete.self, timeout: timeout)
    }
}

// MARK: - Command

/// QoS Setup Command
///
/// The QoS_Setup command is used to specify Quality of Service parameters for a Connection_Handle. The Connection_Handle must be a Connection_Handle for an ACL connection. These QoS parameter are the same parameters as L2CAP QoS.
/// This allows the Link Manager to have all of the information about what the Host is requesting for each connection. The LM will determine if the QoS parameters can be met. BR/EDR Controllers that are both slaves and masters can use this command. When a device is a slave, this com- mand will trigger an LMP request to the master to provide the slave with the specified QoS as determined by the LM. When a device is a master, this com- mand is used to request a slave device to accept the specified QoS as deter- mined by the LM of the master. The Connection_Handle command parameter is used to identify for which connection the QoS request is requested.
@frozen
public struct HCIQoSSetup: HCICommandParameter {
    
    public static let command = LinkPolicyCommand.qosSetup
    
    public static let length = 20
    
    public var connectionHandle: UInt16
    
    internal var flags: UInt8
    
    public var serviceType: ServiceType
    
    public var tokenRate: UInt32
    
    public var peakBandWidth: UInt32
    
    public var latency: UInt32
    
    public var delayVariation: UInt32
    
    public init(connectionHandle: UInt16,
                serviceType: ServiceType,
                tokenRate: UInt32,
                peakBandWidth: UInt32,
                latency: UInt32,
                delayVariation: UInt32) {
        
        self.connectionHandle = connectionHandle
        self.flags = 0x00
        self.serviceType = serviceType
        self.tokenRate = tokenRate
        self.peakBandWidth = peakBandWidth
        self.latency = latency
        self.delayVariation = delayVariation
    }
    
    public var data: Data {
        
        let handleBytes = connectionHandle.littleEndian.bytes
        
        let tokenRateBytes = tokenRate.littleEndian.bytes
        
        let peakBandWidthBytes = peakBandWidth.littleEndian.bytes
        
        let latencyBytes = latency.littleEndian.bytes
        
        let delayVariationBytes = delayVariation.littleEndian.bytes
        
        return Data([handleBytes.0,
                     handleBytes.1,
                     flags,
                     serviceType.rawValue,
                     tokenRateBytes.0,
                     tokenRateBytes.1,
                     tokenRateBytes.2,
                     tokenRateBytes.3,
                     peakBandWidthBytes.0,
                     peakBandWidthBytes.1,
                     peakBandWidthBytes.2,
                     peakBandWidthBytes.3,
                     latencyBytes.0,
                     latencyBytes.1,
                     latencyBytes.2,
                     latencyBytes.3,
                     delayVariationBytes.0,
                     delayVariationBytes.1,
                     delayVariationBytes.2,
                     delayVariationBytes.3])
    }
}

extension HCIQoSSetup {
    
    public enum ServiceType: UInt8 {
        
        // No Traffic.
        case noTraffic = 0x00
        
        /// Best effort
        case bestEffort = 0x01
        
        /// Guaranteed
        case guaranteed = 0x02
    }
}
