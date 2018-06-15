//
//  HCILESetExtendedScanParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Extended Scan Parameters Command
    ///
    /// Used to set the extended scan parameters to be used on the advertising channels.
    func setLowEnergyExtendedScanParameters(ownAddressType: LowEnergyAddressType,
                                            scanningFilterPolicy: HCILESetExtendedScanParameters.ScanningFilterPolicy,
                                            scanningPHY: HCILESetExtendedScanParameters.ScanningPHY,
                                            timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetExtendedScanParameters(ownAddressType: ownAddressType,
                                                                            scanningFilterPolicy: scanningFilterPolicy,
                                                                            scanningPHY: scanningPHY)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Extended Scan Parameters Command
///
/// Used to set the extended scan parameters to be used on the advertising channels.
public struct HCILESetExtendedScanParameters: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setExtendedScanParameters // 0x0041
    
    public var ownAddressType: LowEnergyAddressType
    public var scanningFilterPolicy: ScanningFilterPolicy
    public var scanningPHY: ScanningPHY
    
    public init(ownAddressType: LowEnergyAddressType,
                scanningFilterPolicy: ScanningFilterPolicy,
                scanningPHY: ScanningPHY) {
        self.ownAddressType = ownAddressType
        self.scanningFilterPolicy = scanningFilterPolicy
        self.scanningPHY = scanningPHY
    }
    
    public var data: Data {
        
        let length: Int
        
        switch scanningPHY {
            
        case .le1M:
            
            length = 3
            
        case .coded:
            
            length = 3 + 10
        }
        
        var data = Data()
        data.reserveCapacity(length) // improve buffer performance
        
        // Own_Address_Type
        data.append(ownAddressType.rawValue)
        
        // Scanning_Filter_Policy
        data.append(scanningFilterPolicy.rawValue)
        
        // Scanning_PHYs
        data.append(scanningPHY.type.rawValue)
        
        switch scanningPHY {
            
        case .le1M:
            break
            
        case let .coded(scanType, scanInterval, scanWindow):
            
            let scanIntervalBytes = (scanInterval.0.rawValue.littleEndian, scanInterval.1.rawValue.littleEndian)
            let scanWindowBytes = (scanWindow.0.rawValue.littleEndian, scanWindow.1.rawValue.littleEndian)
            
            data += [scanType.0.rawValue,
                     scanType.1.rawValue,
                     scanIntervalBytes.0.bytes.0,
                     scanIntervalBytes.0.bytes.1,
                     scanIntervalBytes.1.bytes.0,
                     scanIntervalBytes.1.bytes.1,
                     scanWindowBytes.0.bytes.0,
                     scanWindowBytes.0.bytes.1,
                     scanWindowBytes.1.bytes.0,
                     scanWindowBytes.1.bytes.1]
        }
        
        assert(data.count == length, "Invalid number of bytes")
        
        return data
    }
    
    public enum ScanningFilterPolicy: UInt8 {
        
        /// Accept all advertising packets except directed advertising packets not addressed to this device
        case all = 0x00
        
        /// Accept only advertising packets from devices where the advertiser’s address is in the White List.
        /// Directed advertising packets which are not addressed to this device shall be ignored.
        case fromWhiteList = 0x01
        
        /// Accept all advertising packets except directed advertising packets where the initiator’s identity address does not address this device.
        /// Note: directed advertising packets where the initiator’s address is a resolvable private address that cannot be resolved are also accepted.
        case allExceptDirectedAdvertisingPackets = 0x02
        
        /// Accept all advertising packets except:
        /// * advertising packets where the advertiser’s identity address is not in the White List; and
        /// * directed advertising packets where the initiator’s identity address does not address this device
        /// Note: directed advertising packets where the initiator’s address is a resolvable private address that cannot be resolved are also accepted.
        case allExceptPacketFromWhiteListAndDirectedAdvertising = 0x03
    }
    
    /// Scanning PHY
    public enum ScanningPHYType: UInt8 {
        
        /// Scan advertisements on the LE 1M PHY
        case le1M = 0b00
        
        /// Scan advertisements on the LE Coded PHY
        case coded = 0b10
    }
    
    /// Scanning PHY
    public enum ScanningPHY {
        
        /// Scan advertisements on the LE 1M PHY
        case le1M
        
        /// Scan advertisements on the LE Coded PHY
        case coded(scanType: (ScanType, ScanType),
            scanInterval: (LowEnergyScanInterval, LowEnergyScanInterval),
            scanWindow: (LowEnergyScanInterval, LowEnergyScanInterval))
        
        public var type: ScanningPHYType {
            
            switch self {
            case .le1M: return .le1M
            case .coded: return .coded
            }
        }
    }
    
    public enum ScanType: UInt8 {
        
        /// Passive Scanning. No scan request PDUs shall be sent.
        case passive = 0x00
        
        /// Active Scanning. Scan request PDUs may be sent.
        case active = 0x01
    }
}
