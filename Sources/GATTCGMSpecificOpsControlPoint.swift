//
//  GATTCGMSpecificOpsControlPoint.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/22/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 CGM Specific Ops Control Point
 
 The CGM Specific Ops Control Point encapsulates all functionality and mechanisms that are unique to a CGM-device.
 This control point is used with a service to provide CGM specific functionality and the ability to change CGM specific settings of the device.
 This includes functions like setting the CGM Communication Interval or the sending a calibration value to the device.
 The criterion in the Operand field is defined by the service that references this characteristic
 
 [CGM Specific Ops Control Point](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.cgm_specific_ops_control_point.xml)
 
 - Note:
 
     1. C1: Mandatory if device supports E2E-CRC (Bit 12 is set in CGM Feature) otherwise excluded
 
     2. Describes the Operand which is used for setting and getting the calibration value
 
     3.The fields in the above table are in the order of LSO to MSO. Where LSO = Least Significant Octet and MSO = Most Significant Octet
 */
//public struct GATTCGMSpecificOpsControl {
//    
//    public static var uuid: BluetoothUUID { return .cgmSpecificOpsControlPoint }
//    
//    internal static let length = MemoryLayout<UInt64>.size
//    
//    public var code: OpCode
//    
//    public init?(code: OpCode) {
//        
//        self.code = code
//    }
//    
//    public init?(data: Data) {
//        
//        guard data.count == type(of: self).length
//            else { return nil }
//        
//        guard let code = OpCode(rawValue: data[0])
//            else { return nil }
//        
//        self.init(code: code)
//    }
//    
//    public var data: Data {
//        
//        return Data([code.rawValue])
//    }
//}
//
//extension GATTCGMSpecificOpsControl {
//    
//    public enum OpCode: UInt8 {
//        
//        /// The response to this control point is Response Code (Op Code 0x0F)
//        case setCommunicationInterval = 1
//        
//        /// The normal response to this control point is Op Code 0x03. For error conditions, the response is defined in the Op Code - Response Codes field
//        case getCommunicationInterval = 2
//        
//        /// This is the normal response to Op Code 0x02
//        case communicationIntervalResponse = 3
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setGlucoseCalibrationValue = 4
//        
//        /// The normal response to this control point is Op Code 0x06. for error conditions, the response is defined in the Op Code - Response Codes field
//        case getGlucoseCalibrationValue = 5
//        
//        /// Glucose Calibration Value response
//        case glucoseCalibrationValueResponse = 6
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setPatientHighAlertLevel = 7
//        
//        /// The normal response to this control point is Op Code 0x09. For error conditions, the response is defined in the Op Code - Response Codes field
//        case getPatientHighAlertLevel = 8
//        
//        /// This is the normal response to Op Code 0x08
//        case patientHighAlertLevelResponse = 9
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setPatientLowAlertLevel = 10
//        
//        /// The normal response to this control point is Op Code 0x0C. the response is defined in the Op Code - Response Codes field
//        case getPatientLowAlertLevel = 11
//        
//        /// This is the normal response to Op Code 0x0B
//        case patientLowAlertLevelResponse = 12
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setHypoAlertLevel = 13
//        
//        /// The normal response to this control point is Op Code 0x0F. the response is defined in the Op Code - Response Codes field
//        case getHypoAlertLevel = 14
//        
//        /// This is the normal response to Op Code 0x0E
//        case hypoAlertLevelResponse = 15
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setHyperAlertLevel = 16
//        
//        /// The normal response to this control point is Op Code 0x12. The response is defined in the Op Code - Response Codes field
//        case getHyperAlertLevel = 17
//        
//        /// This is the normal response to Op Code 0x11
//        case hyperAlertLevelResponse = 18
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setRateOfDecreaseAlertLevel = 19
//        
//        /// The normal response to this control point is Op Code 0x15. For error conditions, the response is Response Code
//        case getRateOfDecreaseAlertLevel = 20
//        
//        /// This is the normal response to Op Code 0x14
//        case rateOfDecreaseAlertLevelResponse = 21
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case setRateOfIncreaseAlertLevel = 22
//        
//        /// The normal response to this control point is Op Code 0x18. For error conditions, the response is Response Code
//        case getRateOfIncreaseAlertLevel = 23
//        
//        /// This is the normal response to Op Code 0x17
//        case rateOfIncreaseAlertLevelResponse = 24
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case resetDeviceSpecificAlert = 25
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case startSession = 26
//        
//        /// The response to this control point is defined in Op Code - Response Codes field
//        case stopSession = 27
//        
//        /// see Op Code - Response Codes field
//        case responseCode = 28
//    }
//}
