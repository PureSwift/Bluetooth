//
//  GAPPBADV.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 PB-ADV is a provisioning bearer used to provision a device using Generic Provisioning PDUs (see Section 5.3) over the advertising channels.
 The provisioning mechanism is session based. An unprovisioned device shall support only one session at a time.
 There is no such limitation for a Provisioner. A session is established using the Link Establishment procedure (see Section 5.3.2).
 The PB-ADV bearer is used for transmitting Generic Provisioning PDUs. The PB-ADV bearer MTU (Maximum Transmission Unit) size is 24 octets.
 When using PB-ADV, a Generic Provisioning PDU shall be sent using the PB-ADV AD Type identified by «PB-ADV», as defined in [4].
 A device supporting PB-ADV should perform passive scanning with a duty cycle as close to 100% as possible in order to avoid missing any incoming Generic Provisioning PDUs.
 
 Any advertisement using the PB-ADV AD Type shall be non-connectable and non-scannable undirected advertising events.
 If a node receives a PB-ADV AD Type in a connectable or scannable advertising event, the message shall be ignored.
 
 • Link ID: The identifier of a link. Size is 4 octets
 • Transaction Number: The number for identifying a transaction. Size is 1 octet
 • Generic Provisioning PDU: Generic Provisioning PDU being transferred. Size is 1-24 octets
 
 The Link ID is used to identify a link between two devices.
 The Transaction Number field contains a one-octet value used to identify each individual Generic Provisioning PDU sent by the device.
 When a Provisioning PDU that does not fit in a single PB-ADV PDU is segmented, all segments are sent using the same Transaction Number field value.
 When a Provisioning PDU is retransmitted, the Transaction Number field is not changed.
 */
public struct GAPPBADV: GAPData {
    
    internal static let provisioningMaxLength = 24
    
    internal static let provisioningMinLength = 1
    
    internal static let maxLength = MemoryLayout<UInt32>.size + MemoryLayout<UInt8>.size + provisioningMaxLength
    
    internal static let minLength = MemoryLayout<UInt32>.size + MemoryLayout<UInt8>.size + provisioningMinLength
    
    public static var dataType: GAPDataType = .pbAdv
    
    public let linkID: UInt32
    
    public let transactionNumber: UInt8
    
    public let genericProvisioningPDU: Data
    
    public init(linkID: UInt32, transactionNumber: UInt8, genericProvisioningPDU: Data) {
        
        self.linkID = linkID
        self.transactionNumber = transactionNumber
        self.genericProvisioningPDU = genericProvisioningPDU
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minLength, data.count <= type(of: self).maxLength
            else { return nil }
        
        let linkID = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
        let transactionNumber = data[4]
        var genericProvisioningPDU = Data()
        
        // FIXME: Use .suffix() instead
        data.enumerated().forEach { (index, element) in
            if index >= 5 {
                genericProvisioningPDU.append(element)
            }
        }
        
        self.init(linkID: linkID, transactionNumber: transactionNumber, genericProvisioningPDU: genericProvisioningPDU)
    }
    
    public var data: Data {
        
        let linkIDbytes = UInt32(littleEndian: linkID).bytes
        let data = Data([linkIDbytes.0, linkIDbytes.1, linkIDbytes.2, linkIDbytes.3, transactionNumber])
        
        return genericProvisioningPDU.reduce(data, { $0.0 + [$0.1] })
    }
    
}

extension GAPPBADV: Equatable {
    
    public static func == (lhs: GAPPBADV, rhs: GAPPBADV) -> Bool {
        
        return lhs.linkID == rhs.linkID &&
            lhs.transactionNumber == rhs.transactionNumber &&
            lhs.genericProvisioningPDU == rhs.genericProvisioningPDU
    }
}

extension GAPPBADV: CustomStringConvertible {
    
    public var description: String {
        
        return linkID.description + transactionNumber.description + genericProvisioningPDU.description
    }
}
