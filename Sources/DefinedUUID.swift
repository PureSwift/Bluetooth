//
//  DefinedUUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/5/18.
//

public extension BluetoothUUID {
    
    /// Bluetooth UUID Definition name.
    ///
    /// The Bluetooth SIG allocates a 16-bit Universally Unique Identifier (UUID) for use with
    /// a custom GATT-based service defined by the member, as well as a 16-bit Universally Unique Identifier (UUID)
    /// assignment for Standards Development Organizations (SDOs).
    ///
    /// [16-bit UUID Assigned Numbers](https://www.bluetooth.com/specifications/assigned-numbers/16-bit-uuids-for-members)
    /// [16 Bit UUIDs For SDOs](https://www.bluetooth.com/specifications/assigned-numbers/16-bit-uuids-for-sdos)
    public var name: String? {
        
        switch self {
        case let .bit16(value): return definedUUIDs[value]
        case .bit32, .bit128: return nil
        }
    }
}

internal let definedUUIDs: [UInt16: String] = [
    
    0x0001: "SDP",
    0x0003: "RFCOMM",
    0x0005: "TCS-BIN",
    0x0007: "ATT",
    0x0008: "OBEX",
    0x000f: "BNEP",
    0x0010: "UPNP",
    0x0011: "HIDP",
    0x0012: "Hardcopy Control Channel",
    0x0014: "Hardcopy Data Channel",
    0x0016: "Hardcopy Notification",
    0x0017: "AVCTP",
    0x0019: "AVDTP",
    0x001b: "CMTP",
    0x001e: "MCAP Control Channel",
    0x001f: "MCAP Data Channel",
    0x0100: "L2CAP",
    /* 0x0101 to 0x0fff undefined */
    0x1000: "Service Discovery Server Service Class",
    0x1001: "Browse Group Descriptor Service Class",
    0x1002: "Public Browse Root",
    /* 0x1003 to 0x1100 undefined */
    0x1101: "Serial Port",
    0x1102: "LAN Access Using PPP",
    0x1103: "Dialup Networking",
    0x1104: "IrMC Sync",
    0x1105: "OBEX Object Push",
    0x1106: "OBEX File Transfer",
    0x1107: "IrMC Sync Command",
    0x1108: "Headset",
    0x1109: "Cordless Telephony",
    0x110a: "Audio Source",
    0x110b: "Audio Sink",
    0x110c: "A/V Remote Control Target",
    0x110d: "Advanced Audio Distribution",
    0x110e: "A/V Remote Control",
    0x110f: "A/V Remote Control Controller",
    0x1110: "Intercom",
    0x1111: "Fax",
    0x1112: "Headset AG",
    0x1113: "WAP",
    0x1114: "WAP Client",
    0x1115: "PANU",
    0x1116: "NAP",
    0x1117: "GN",
    0x1118: "Direct Printing",
    0x1119: "Reference Printing",
    0x111a: "Basic Imaging Profile",
    0x111b: "Imaging Responder",
    0x111c: "Imaging Automatic Archive",
    0x111d: "Imaging Referenced Objects",
    0x111e: "Handsfree",
    0x111f: "Handsfree Audio Gateway",
    0x1120: "Direct Printing Refrence Objects Service",
    0x1121: "Reflected UI",
    0x1122: "Basic Printing",
    0x1123: "Printing Status",
    0x1124: "Human Interface Device Service",
    0x1125: "Hardcopy Cable Replacement",
    0x1126: "HCR Print",
    0x1127: "HCR Scan",
    0x1128: "Common ISDN Access",
    /* 0x1129 and 0x112a undefined */
    0x112d: "SIM Access",
    0x112e: "Phonebook Access Client",
    0x112f: "Phonebook Access Server",
    0x1130: "Phonebook Access",
    0x1131: "Headset HS",
    0x1132: "Message Access Server",
    0x1133: "Message Notification Server",
    0x1134: "Message Access Profile",
    0x1135: "GNSS",
    0x1136: "GNSS Server",
    0x1137: "3D Display",
    0x1138: "3D Glasses",
    0x1139: "3D Synchronization",
    0x113a: "MPS Profile",
    0x113b: "MPS Service",
    /* 0x113c to 0x11ff undefined */
    0x1200: "PnP Information",
    0x1201: "Generic Networking",
    0x1202: "Generic File Transfer",
    0x1203: "Generic Audio",
    0x1204: "Generic Telephony",
    0x1205: "UPNP Service",
    0x1206: "UPNP IP Service",
    0x1300: "UPNP IP PAN",
    0x1301: "UPNP IP LAP",
    0x1302: "UPNP IP L2CAP",
    0x1303: "Video Source",
    0x1304: "Video Sink",
    0x1305: "Video Distribution",
    /* 0x1306 to 0x13ff undefined */
    0x1400: "HDP",
    0x1401: "HDP Source",
    0x1402: "HDP Sink",
    /* 0x1403 to 0x17ff undefined */
    0x1800: "Generic Access Profile",
    0x1801: "Generic Attribute Profile",
    0x1802: "Immediate Alert",
    0x1803: "Link Loss",
    0x1804: "Tx Power",
    0x1805: "Current Time Service",
    0x1806: "Reference Time Update Service",
    0x1807: "Next DST Change Service",
    0x1808: "Glucose",
    0x1809: "Health Thermometer",
    0x180a: "Device Information",
    /* 0x180b and 0x180c undefined */
    0x180d: "Heart Rate",
    0x180e: "Phone Alert Status Service",
    0x180f: "Battery Service",
    0x1810: "Blood Pressure",
    0x1811: "Alert Notification Service",
    0x1812: "Human Interface Device",
    0x1813: "Scan Parameters",
    0x1814: "Running Speed and Cadence",
    0x1815: "Automation IO",
    0x1816: "Cycling Speed and Cadence",
    /* 0x1817 undefined */
    0x1818: "Cycling Power",
    0x1819: "Location and Navigation",
    0x181a: "Environmental Sensing",
    0x181b: "Body Composition",
    0x181c: "User Data",
    0x181d: "Weight Scale",
    0x181e: "Bond Management",
    0x181f: "Continuous Glucose Monitoring",
    0x1820: "Internet Protocol Support",
    0x1821: "Indoor Positioning",
    0x1822: "Pulse Oximeter",
    0x1823: "HTTP Proxy",
    0x1824: "Transport Discovery",
    0x1825: "Object Transfer",
    /* 0x1824 to 0x27ff undefined */
    0x2800: "Primary Service",
    0x2801: "Secondary Service",
    0x2802: "Include",
    0x2803: "Characteristic",
    /* 0x2804 to 0x28ff undefined */
    0x2900: "Characteristic Extended Properties",
    0x2901: "Characteristic User Description",
    0x2902: "Client Characteristic Configuration",
    0x2903: "Server Characteristic Configuration",
    0x2904: "Characteristic Format",
    0x2905: "Characteristic Aggregate Formate",
    0x2906: "Valid Range",
    0x2907: "External Report Reference",
    0x2908: "Report Reference",
    0x2909: "Number of Digitals",
    0x290a: "Value Trigger Setting",
    0x290b: "Environmental Sensing Configuration",
    0x290c: "Environmental Sensing Measurement",
    0x290d: "Environmental Sensing Trigger Setting",
    0x290e: "Time Trigger Setting",
    /* 0x290f to 0x29ff undefined */
    0x2a00: "Device Name",
    0x2a01: "Appearance",
    0x2a02: "Peripheral Privacy Flag",
    0x2a03: "Reconnection Address",
    0x2a04: "Peripheral Preferred Connection Parameters",
    0x2a05: "Service Changed",
    0x2a06: "Alert Level",
    0x2a07: "Tx Power Level",
    0x2a08: "Date Time",
    0x2a09: "Day of Week",
    0x2a0a: "Day Date Time",
    /* 0x2a0b undefined */
    0x2a0c: "Exact Time 256",
    0x2a0d: "DST Offset",
    0x2a0e: "Time Zone",
    0x2a0f: "Local Time Information",
    /* 0x2a10 undefined */
    0x2a11: "Time with DST",
    0x2a12: "Time Accuracy",
    0x2a13: "Time Source",
    0x2a14: "Reference Time Information",
    /* 0x2a15 undefined */
    0x2a16: "Time Update Control Point",
    0x2a17: "Time Update State",
    0x2a18: "Glucose Measurement",
    0x2a19: "Battery Level",
    /* 0x2a1a and 0x2a1b undefined */
    0x2a1c: "Temperature Measurement",
    0x2a1d: "Temperature Type",
    0x2a1e: "Intermediate Temperature",
    /* 0x2a1f and 0x2a20 undefined */
    0x2a21: "Measurement Interval",
    0x2a22: "Boot Keyboard Input Report",
    0x2a23: "System ID",
    0x2a24: "Model Number String",
    0x2a25: "Serial Number String",
    0x2a26: "Firmware Revision String",
    0x2a27: "Hardware Revision String",
    0x2a28: "Software Revision String",
    0x2a29: "Manufacturer Name String",
    0x2a2a: "IEEE 11073-20601 Regulatory Cert. Data List",
    0x2a2b: "Current Time",
    0x2a2c: "Magnetic Declination",
    /* 0x2a2d to 0x2a30 undefined */
    0x2a31: "Scan Refresh",
    0x2a32: "Boot Keyboard Output Report",
    0x2a33: "Boot Mouse Input Report",
    0x2a34: "Glucose Measurement Context",
    0x2a35: "Blood Pressure Measurement",
    0x2a36: "Intermediate Cuff Pressure",
    0x2a37: "Heart Rate Measurement",
    0x2a38: "Body Sensor Location",
    0x2a39: "Heart Rate Control Point",
    /* 0x2a3a to 0x2a3e undefined */
    0x2a3f: "Alert Status",
    0x2a40: "Ringer Control Point",
    0x2a41: "Ringer Setting",
    0x2a42: "Alert Category ID Bit Mask",
    0x2a43: "Alert Category ID",
    0x2a44: "Alert Notification Control Point",
    0x2a45: "Unread Alert Status",
    0x2a46: "New Alert",
    0x2a47: "Supported New Alert Category",
    0x2a48: "Supported Unread Alert Category",
    0x2a49: "Blood Pressure Feature",
    0x2a4a: "HID Information",
    0x2a4b: "Report Map",
    0x2a4c: "HID Control Point",
    0x2a4d: "Report",
    0x2a4e: "Protocol Mode",
    0x2a4f: "Scan Interval Window",
    0x2a50: "PnP ID",
    0x2a51: "Glucose Feature",
    0x2a52: "Record Access Control Point",
    0x2a53: "RSC Measurement",
    0x2a54: "RSC Feature",
    0x2a55: "SC Control Point",
    0x2a56: "Digital",
    /* 0x2a57 undefined */
    0x2a58: "Analog",
    /* 0x2a59 undefined */
    0x2a5a: "Aggregate",
    0x2a5b: "CSC Measurement",
    0x2a5c: "CSC Feature",
    0x2a5d: "Sensor Location",
    /* 0x2a5e to 0x2a62 undefined */
    0x2a63: "Cycling Power Measurement",
    0x2a64: "Cycling Power Vector",
    0x2a65: "Cycling Power Feature",
    0x2a66: "Cycling Power Control Point",
    0x2a67: "Location and Speed",
    0x2a68: "Navigation",
    0x2a69: "Position Quality",
    0x2a6a: "LN Feature",
    0x2a6b: "LN Control Point",
    0x2a6c: "Elevation",
    0x2a6d: "Pressure",
    0x2a6e: "Temperature",
    0x2a6f: "Humidity",
    0x2a70: "True Wind Speed",
    0x2a71: "True Wind Direction",
    0x2a72: "Apparent Wind Speed",
    0x2a73: "Apparent Wind Direction",
    0x2a74: "Gust Factor",
    0x2a75: "Pollen Concentration",
    0x2a76: "UV Index",
    0x2a77: "Irradiance",
    0x2a78: "Rainfall",
    0x2a79: "Wind Chill",
    0x2a7a: "Heat Index",
    0x2a7b: "Dew Point",
    0x2a7c: "Trend",
    0x2a7d: "Descriptor Value Changed",
    0x2a7e: "Aerobic Heart Rate Lower Limit",
    0x2a7f: "Aerobic Threshold",
    0x2a80: "Age",
    0x2a81: "Anaerobic Heart Rate Lower Limit",
    0x2a82: "Anaerobic Heart Rate Upper Limit",
    0x2a83: "Anaerobic Threshold",
    0x2a84: "Aerobic Heart Rate Upper Limit",
    0x2a85: "Date of Birth",
    0x2a86: "Date of Threshold Assessment",
    0x2a87: "Email Address",
    0x2a88: "Fat Burn Heart Rate Lower Limit",
    0x2a89: "Fat Burn Heart Rate Upper Limit",
    0x2a8a: "First Name",
    0x2a8b: "Five Zone Heart Rate Limits",
    0x2a8c: "Gender",
    0x2a8d: "Heart Rate Max",
    0x2a8e: "Height",
    0x2a8f: "Hip Circumference",
    0x2a90: "Last Name",
    0x2a91: "Maximum Recommended Heart Rate",
    0x2a92: "Resting Heart Rate",
    0x2a93: "Sport Type for Aerobic/Anaerobic Thresholds",
    0x2a94: "Three Zone Heart Rate Limits",
    0x2a95: "Two Zone Heart Rate Limit",
    0x2a96: "VO2 Max",
    0x2a97: "Waist Circumference",
    0x2a98: "Weight",
    0x2a99: "Database Change Increment",
    0x2a9a: "User Index",
    0x2a9b: "Body Composition Feature",
    0x2a9c: "Body Composition Measurement",
    0x2a9d: "Weight Measurement",
    0x2a9e: "Weight Scale Feature",
    0x2a9f: "User Control Point",
    0x2aa0: "Magnetic Flux Density - 2D",
    0x2aa1: "Magnetic Flux Density - 3D",
    0x2aa2: "Language",
    0x2aa3: "Barometric Pressure Trend",
    0x2aa4: "Bond Management Control Point",
    0x2aa5: "Bond Management Feature",
    0x2aa6: "Central Address Resolution",
    0x2aa7: "CGM Measurement",
    0x2aa8: "CGM Feature",
    0x2aa9: "CGM Status",
    0x2aaa: "CGM Session Start Time",
    0x2aab: "CGM Session Run Time",
    0x2aac: "CGM Specific Ops Control Point",
    0x2aad: "Indoor Positioning Configuration",
    0x2aae: "Latitude",
    0x2aaf: "Longitude",
    0x2ab0: "Local North Coordinate",
    0x2ab1: "Local East Coordinate",
    0x2ab2: "Floor Number",
    0x2ab3: "Altitude",
    0x2ab4: "Uncertainty",
    0x2ab5: "Location Name",
    0x2ab6: "URI",
    0x2ab7: "HTTP Headers",
    0x2ab8: "HTTP Status Code",
    0x2ab9: "HTTP Entity Body",
    0x2aba: "HTTP Control Point",
    0x2abb: "HTTPS Security",
    0x2abc: "TDS Control Point",
    0x2abd: "OTS Feature",
    0x2abe: "Object Name",
    0x2abf: "Object Type",
    0x2ac0: "Object Size",
    0x2ac1: "Object First-Created",
    0x2ac2: "Object Last-Modified",
    0x2ac3: "Object ID",
    0x2ac4: "Object Properties",
    0x2ac5: "Object Action Control Point",
    0x2ac6: "Object List Control Point",
    0x2ac7: "Object List Filter",
    0x2ac8: "Object Changed",
    /* vendor defined */
    0xfeff: "GN Netcom",
    0xfefe: "GN ReSound A/S",
    0xfefd: "Gimbal, Inc.",
    0xfefc: "Gimbal, Inc.",
    0xfefb: "Stollmann E+V GmbH",
    0xfefa: "PayPal, Inc.",
    0xfef9: "PayPal, Inc.",
    0xfef8: "Aplix Corporation",
    0xfef7: "Aplix Corporation",
    0xfef6: "Wicentric, Inc.",
    0xfef5: "Dialog Semiconductor GmbH",
    0xfef4: "Google",
    0xfef3: "Google",
    0xfef2: "CSR",
    0xfef1: "CSR",
    0xfef0: "Intel",
    0xfeef: "Polar Electro Oy",
    0xfeee: "Polar Electro Oy",
    0xfeed: "Tile, Inc.",
    0xfeec: "Tile, Inc.",
    0xfeeb: "Swirl Networks, Inc.",
    0xfeea: "Swirl Networks, Inc.",
    0xfee9: "Quintic Corp.",
    0xfee8: "Quintic Corp.",
    0xfee7: "Tencent Holdings Limited",
    0xfee6: "Seed Labs, Inc.",
    0xfee5: "Nordic Semiconductor ASA",
    0xfee4: "Nordic Semiconductor ASA",
    0xfee3: "Anki, Inc.",
    0xfee2: "Anki, Inc.",
    0xfee1: "Anhui Huami Information Technology Co.",
    0xfee0: "Anhui Huami Information Technology Co.",
    0xfedf: "Design SHIFT",
    0xfede: "Coin, Inc.",
    0xfedd: "Jawbone",
    0xfedc: "Jawbone",
    0xfedb: "Perka, Inc.",
    0xfeda: "ISSC Technologies Corporation",
    0xfed9: "Pebble Technology Corporation",
    0xfed8: "Google",
    0xfed7: "Broadcom Corporation",
    0xfed6: "Broadcom Corporation",
    0xfed5: "Plantronics Inc.",
    0xfed4: "Apple, Inc.",
    0xfed3: "Apple, Inc.",
    0xfed2: "Apple, Inc.",
    0xfed1: "Apple, Inc.",
    0xfed0: "Apple, Inc.",
    0xfecf: "Apple, Inc.",
    0xfece: "Apple, Inc.",
    0xfecd: "Apple, Inc.",
    0xfecc: "Apple, Inc.",
    0xfecb: "Apple, Inc.",
    0xfeca: "Apple, Inc.",
    0xfec9: "Apple, Inc.",
    0xfec8: "Apple, Inc.",
    0xfec7: "Apple, Inc.",
    0xfec6: "Kocomojo, LLC",
    0xfec5: "Realtek Semiconductor Corp.",
    0xfec4: "PLUS Location Systems",
    0xfec3: "360fly, Inc.",
    0xfec2: "Blue Spark Technologies, Inc.",
    0xfec1: "KDDI Corporation",
    0xfec0: "KDDI Corporation",
    0xfebf: "Nod, Inc.",
    0xfebe: "Bose Corporation",
    0xfebd: "Clover Network, Inc.",
    0xfebc: "Dexcom, Inc.",
    0xfebb: "adafruit industries",
    0xfeba: "Tencent Holdings Limited",
    0xfeb9: "LG Electronics",
    0xfeb8: "Facebook, Inc.",
    0xfeb7: "Facebook, Inc.",
    0xfeb6: "Vencer Co, Ltd",
    0xfeb5: "WiSilica Inc.",
    0xfeb4: "WiSilica Inc.",
    0xfeb3: "Taobao",
    0xfeb2: "Microsoft Corporation",
    0xfeb1: "Electronics Tomorrow Limited",
    0xfeb0: "Nest Labs Inc.",
    0xfeaf: "Nest Labs Inc.",
    0xfeae: "Nokia Corporation",
    0xfead: "Nokia Corporation",
    0xfeac: "Nokia Corporation",
    0xfeab: "Nokia Corporation",
    0xfeaa: "Google",
    0xfea9: "Savant Systems LLC",
    0xfea8: "Savant Systems LLC",
    0xfea7: "UTC Fire and Security",
    0xfea6: "GoPro, Inc.",
    0xfea5: "GoPro, Inc.",
    0xfea4: "Paxton Access Ltd",
    0xfea3: "ITT Industries",
    0xfea2: "Intrepid Control Systems, Inc.",
    0xfea1: "Intrepid Control Systems, Inc.",
    0xfea0: "Google",
    0xfe9f: "Google",
    0xfe9e: "Dialog Semiconductor B.V.",
    0xfe9d: "Mobiquity Networks Inc",
    0xfe9c: "GSI Laboratories, Inc.",
    0xfe9b: "Samsara Networks, Inc",
    0xfe9a: "Estimote",
    0xfe99: "Currant, Inc.",
    0xfe98: "Currant, Inc.",
    0xfe97: "Tesla Motor Inc.",
    0xfe96: "Tesla Motor Inc.",
    0xfe95: "Xiaomi Inc.",
    0xfe94: "OttoQ Inc.",
    0xfe93: "OttoQ Inc.",
    0xfe92: "Jarden Safety & Security",
    0xfe91: "Shanghai Imilab Technology Co.,Ltd",
    0xfe90: "JUMA",
    0xfe8f: "CSR",
    0xfe8e: "ARM Ltd",
    0xfe8d: "Interaxon Inc.",
    0xfe8c: "TRON Forum",
    0xfe8b: "Apple, Inc.",
    0xfe8a: "Apple, Inc.",
    0xfe89: "B&O Play A/S",
    0xfe88: "SALTO SYSTEMS S.L.",
    0xfe87: "Qingdao Yeelink Information Technology Co., Ltd. ( 青岛亿联客信息技术有限公司 )",
    0xfe86: "HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 )",
    0xfe85: "RF Digital Corp",
    0xfe84: "RF Digital Corp",
    0xfe83: "Blue Bite",
    0xfe82: "Medtronic Inc.",
    0xfe81: "Medtronic Inc.",
    0xfe80: "Doppler Lab",
    0xfe7f: "Doppler Lab",
    0xfe7e: "Awear Solutions Ltd",
    0xfe7d: "Aterica Health Inc.",
    0xfe7c: "Stollmann E+V GmbH",
    0xfe7b: "Orion Labs, Inc.",
    0xfe7a: "Bragi GmbH",
    0xfe79: "Zebra Technologies",
    0xfe78: "Hewlett-Packard Company",
    0xfe77: "Hewlett-Packard Company",
    0xfe76: "TangoMe",
    0xfe75: "TangoMe",
    0xfe74: "unwire",
    0xfe73: "St. Jude Medical, Inc.",
    0xfe72: "St. Jude Medical, Inc.",
    0xfe71: "Plume Design Inc",
    0xfe70: "Beijing Jingdong Century Trading Co., Ltd.",
    0xfe6f: "LINE Corporation",
    0xfe6e: "The University of Tokyo",
    0xfe6d: "The University of Tokyo",
    0xfe6c: "TASER International, Inc.",
    0xfe6b: "TASER International, Inc.",
    0xfe6a: "Kontakt Micro-Location Sp. z o.o.",
    0xfe69: "Qualcomm Life Inc",
    0xfe68: "Qualcomm Life Inc",
    0xfe67: "Lab Sensor Solutions",
    0xfe66: "Intel Corporation",
    /* SDO defined */
    0xfffe: "Alliance for Wireless Power (A4WP)",
    0xfffd: "Fast IDentity Online Alliance (FIDO)"
]

// MARK: - Static values

public extension BluetoothUUID {
    
    /// SDP
    static var sdp: BluetoothUUID { return .bit16(0x0001) }
    
    /// RFCOMM
    static var rfcomm: BluetoothUUID { return .bit16(0x0003) }
    
    /// TCS-BIN
    static var tcsBin: BluetoothUUID { return .bit16(0x0005) }
    
    /// ATT
    static var att: BluetoothUUID { return .bit16(0x0007) }
    
    /// OBEX
    static var obex: BluetoothUUID { return .bit16(0x0008) }
    
    /// BNEP
    static var bnep: BluetoothUUID { return .bit16(0x000F) }
    
    /// UPNP
    static var upnp: BluetoothUUID { return .bit16(0x0010) }
    
    /// HIDP
    static var hidp: BluetoothUUID { return .bit16(0x0011) }
    
    /// Hardcopy Control Channel
    static var hardcopyControlChannel: BluetoothUUID { return .bit16(0x0012) }
    
    /// Hardcopy Data Channel
    static var hardcopyDataChannel: BluetoothUUID { return .bit16(0x0014) }
    
    /// Hardcopy Notification
    static var hardcopyNotification: BluetoothUUID { return .bit16(0x0016) }
    
    /// AVCTP
    static var avctp: BluetoothUUID { return .bit16(0x0017) }
    
    /// AVDTP
    static var avdtp: BluetoothUUID { return .bit16(0x0019) }
    
    /// CMTP
    static var cmtp: BluetoothUUID { return .bit16(0x001B) }
    
    /// MCAP Control Channel
    static var mcapControlChannel: BluetoothUUID { return .bit16(0x001E) }
    
    /// MCAP Data Channel
    static var mcapDataChannel: BluetoothUUID { return .bit16(0x001F) }
    
    /// L2CAP
    static var l2Cap: BluetoothUUID { return .bit16(0x0100) }
    
    /// Service Discovery Server Service Class
    static var serviceDiscoveryServerServiceClass: BluetoothUUID { return .bit16(0x1000) }
    
    /// Browse Group Descriptor Service Class
    static var browseGroupDescriptorServiceClass: BluetoothUUID { return .bit16(0x1001) }
    
    /// Public Browse Root
    static var publicBrowseRoot: BluetoothUUID { return .bit16(0x1002) }
    
    /// Serial Port
    static var serialPort: BluetoothUUID { return .bit16(0x1101) }
    
    /// LAN Access Using PPP
    static var lanAccessUsingPpp: BluetoothUUID { return .bit16(0x1102) }
    
    /// Dialup Networking
    static var dialupNetworking: BluetoothUUID { return .bit16(0x1103) }
    
    /// IrMC Sync
    static var irmcSync: BluetoothUUID { return .bit16(0x1104) }
    
    /// OBEX Object Push
    static var obexObjectPush: BluetoothUUID { return .bit16(0x1105) }
    
    /// OBEX File Transfer
    static var obexFileTransfer: BluetoothUUID { return .bit16(0x1106) }
    
    /// IrMC Sync Command
    static var irmcSyncCommand: BluetoothUUID { return .bit16(0x1107) }
    
    /// Headset
    static var headset: BluetoothUUID { return .bit16(0x1108) }
    
    /// Cordless Telephony
    static var cordlessTelephony: BluetoothUUID { return .bit16(0x1109) }
    
    /// Audio Source
    static var audioSource: BluetoothUUID { return .bit16(0x110A) }
    
    /// Audio Sink
    static var audioSink: BluetoothUUID { return .bit16(0x110B) }
    
    /// A/V Remote Control Target
    static var avRemoteControlTarget: BluetoothUUID { return .bit16(0x110C) }
    
    /// Advanced Audio Distribution
    static var advancedAudioDistribution: BluetoothUUID { return .bit16(0x110D) }
    
    /// A/V Remote Control
    static var avRemoteControl: BluetoothUUID { return .bit16(0x110E) }
    
    /// A/V Remote Control Controller
    static var avRemoteControlController: BluetoothUUID { return .bit16(0x110F) }
    
    /// Intercom
    static var intercom: BluetoothUUID { return .bit16(0x1110) }
    
    /// Fax
    static var fax: BluetoothUUID { return .bit16(0x1111) }
    
    /// Headset AG
    static var headsetAg: BluetoothUUID { return .bit16(0x1112) }
    
    /// WAP
    static var wap: BluetoothUUID { return .bit16(0x1113) }
    
    /// WAP Client
    static var wapClient: BluetoothUUID { return .bit16(0x1114) }
    
    /// PANU
    static var panu: BluetoothUUID { return .bit16(0x1115) }
    
    /// NAP
    static var nap: BluetoothUUID { return .bit16(0x1116) }
    
    /// GN
    static var gn: BluetoothUUID { return .bit16(0x1117) }
    
    /// Direct Printing
    static var directPrinting: BluetoothUUID { return .bit16(0x1118) }
    
    /// Reference Printing
    static var referencePrinting: BluetoothUUID { return .bit16(0x1119) }
    
    /// Basic Imaging Profile
    static var basicImagingProfile: BluetoothUUID { return .bit16(0x111A) }
    
    /// Imaging Responder
    static var imagingResponder: BluetoothUUID { return .bit16(0x111B) }
    
    /// Imaging Automatic Archive
    static var imagingAutomaticArchive: BluetoothUUID { return .bit16(0x111C) }
    
    /// Imaging Referenced Objects
    static var imagingReferencedObjects: BluetoothUUID { return .bit16(0x111D) }
    
    /// Handsfree
    static var handsfree: BluetoothUUID { return .bit16(0x111E) }
    
    /// Handsfree Audio Gateway
    static var handsfreeAudioGateway: BluetoothUUID { return .bit16(0x111F) }
    
    /// Direct Printing Refrence Objects Service
    static var directPrintingRefrenceObjectsService: BluetoothUUID { return .bit16(0x1120) }
    
    /// Reflected UI
    static var reflectedUi: BluetoothUUID { return .bit16(0x1121) }
    
    /// Basic Printing
    static var basicPrinting: BluetoothUUID { return .bit16(0x1122) }
    
    /// Printing Status
    static var printingStatus: BluetoothUUID { return .bit16(0x1123) }
    
    /// Human Interface Device Service
    static var humanInterfaceDeviceService: BluetoothUUID { return .bit16(0x1124) }
    
    /// Hardcopy Cable Replacement
    static var hardcopyCableReplacement: BluetoothUUID { return .bit16(0x1125) }
    
    /// HCR Print
    static var hcrPrint: BluetoothUUID { return .bit16(0x1126) }
    
    /// HCR Scan
    static var hcrScan: BluetoothUUID { return .bit16(0x1127) }
    
    /// Common ISDN Access
    static var commonIsdnAccess: BluetoothUUID { return .bit16(0x1128) }
    
    /// SIM Access
    static var simAccess: BluetoothUUID { return .bit16(0x112D) }
    
    /// Phonebook Access Client
    static var phonebookAccessClient: BluetoothUUID { return .bit16(0x112E) }
    
    /// Phonebook Access Server
    static var phonebookAccessServer: BluetoothUUID { return .bit16(0x112F) }
    
    /// Phonebook Access
    static var phonebookAccess: BluetoothUUID { return .bit16(0x1130) }
    
    /// Headset HS
    static var headsetHs: BluetoothUUID { return .bit16(0x1131) }
    
    /// Message Access Server
    static var messageAccessServer: BluetoothUUID { return .bit16(0x1132) }
    
    /// Message Notification Server
    static var messageNotificationServer: BluetoothUUID { return .bit16(0x1133) }
    
    /// Message Access Profile
    static var messageAccessProfile: BluetoothUUID { return .bit16(0x1134) }
    
    /// GNSS
    static var gnss: BluetoothUUID { return .bit16(0x1135) }
    
    /// GNSS Server
    static var gnssServer: BluetoothUUID { return .bit16(0x1136) }
    
    /// 3D Display
    static var uuid3Ddisplay: BluetoothUUID { return .bit16(0x1137) }
    
    /// 3D Glasses
    static var uuid3Dglasses: BluetoothUUID { return .bit16(0x1138) }
    
    /// 3D Synchronization
    static var uuid3Dsynchronization: BluetoothUUID { return .bit16(0x1139) }
    
    /// MPS Profile
    static var mpsProfile: BluetoothUUID { return .bit16(0x113A) }
    
    /// MPS Service
    static var mpsService: BluetoothUUID { return .bit16(0x113B) }
    
    /// PnP Information
    static var pnpInformation: BluetoothUUID { return .bit16(0x1200) }
    
    /// Generic Networking
    static var genericNetworking: BluetoothUUID { return .bit16(0x1201) }
    
    /// Generic File Transfer
    static var genericFileTransfer: BluetoothUUID { return .bit16(0x1202) }
    
    /// Generic Audio
    static var genericAudio: BluetoothUUID { return .bit16(0x1203) }
    
    /// Generic Telephony
    static var genericTelephony: BluetoothUUID { return .bit16(0x1204) }
    
    /// UPNP Service
    static var upnpService: BluetoothUUID { return .bit16(0x1205) }
    
    /// UPNP IP Service
    static var upnpIpService: BluetoothUUID { return .bit16(0x1206) }
    
    /// UPNP IP PAN
    static var upnpIpPan: BluetoothUUID { return .bit16(0x1300) }
    
    /// UPNP IP LAP
    static var upnpIpLap: BluetoothUUID { return .bit16(0x1301) }
    
    /// UPNP IP L2CAP
    static var upnpIpL2Cap: BluetoothUUID { return .bit16(0x1302) }
    
    /// Video Source
    static var videoSource: BluetoothUUID { return .bit16(0x1303) }
    
    /// Video Sink
    static var videoSink: BluetoothUUID { return .bit16(0x1304) }
    
    /// Video Distribution
    static var videoDistribution: BluetoothUUID { return .bit16(0x1305) }
    
    /// HDP
    static var hdp: BluetoothUUID { return .bit16(0x1400) }
    
    /// HDP Source
    static var hdpSource: BluetoothUUID { return .bit16(0x1401) }
    
    /// HDP Sink
    static var hdpSink: BluetoothUUID { return .bit16(0x1402) }
    
    /// Generic Access Profile
    static var genericAccessProfile: BluetoothUUID { return .bit16(0x1800) }
    
    /// Generic Attribute Profile
    static var genericAttributeProfile: BluetoothUUID { return .bit16(0x1801) }
    
    /// Immediate Alert
    static var immediateAlert: BluetoothUUID { return .bit16(0x1802) }
    
    /// Link Loss
    static var linkLoss: BluetoothUUID { return .bit16(0x1803) }
    
    /// Tx Power
    static var txPower: BluetoothUUID { return .bit16(0x1804) }
    
    /// Current Time Service
    static var currentTimeService: BluetoothUUID { return .bit16(0x1805) }
    
    /// Reference Time Update Service
    static var referenceTimeUpdateService: BluetoothUUID { return .bit16(0x1806) }
    
    /// Next DST Change Service
    static var nextDstChangeService: BluetoothUUID { return .bit16(0x1807) }
    
    /// Glucose
    static var glucose: BluetoothUUID { return .bit16(0x1808) }
    
    /// Health Thermometer
    static var healthThermometer: BluetoothUUID { return .bit16(0x1809) }
    
    /// Device Information
    static var deviceInformation: BluetoothUUID { return .bit16(0x180A) }
    
    /// Heart Rate
    static var heartRate: BluetoothUUID { return .bit16(0x180D) }
    
    /// Phone Alert Status Service
    static var phoneAlertStatusService: BluetoothUUID { return .bit16(0x180E) }
    
    /// Battery Service
    static var batteryService: BluetoothUUID { return .bit16(0x180F) }
    
    /// Blood Pressure
    static var bloodPressure: BluetoothUUID { return .bit16(0x1810) }
    
    /// Alert Notification Service
    static var alertNotificationService: BluetoothUUID { return .bit16(0x1811) }
    
    /// Human Interface Device
    static var humanInterfaceDevice: BluetoothUUID { return .bit16(0x1812) }
    
    /// Scan Parameters
    static var scanParameters: BluetoothUUID { return .bit16(0x1813) }
    
    /// Running Speed and Cadence
    static var runningSpeedAndCadence: BluetoothUUID { return .bit16(0x1814) }
    
    /// Automation IO
    static var automationIo: BluetoothUUID { return .bit16(0x1815) }
    
    /// Cycling Speed and Cadence
    static var cyclingSpeedAndCadence: BluetoothUUID { return .bit16(0x1816) }
    
    /// Cycling Power
    static var cyclingPower: BluetoothUUID { return .bit16(0x1818) }
    
    /// Location and Navigation
    static var locationAndNavigation: BluetoothUUID { return .bit16(0x1819) }
    
    /// Environmental Sensing
    static var environmentalSensing: BluetoothUUID { return .bit16(0x181A) }
    
    /// Body Composition
    static var bodyComposition: BluetoothUUID { return .bit16(0x181B) }
    
    /// User Data
    static var userData: BluetoothUUID { return .bit16(0x181C) }
    
    /// Weight Scale
    static var weightScale: BluetoothUUID { return .bit16(0x181D) }
    
    /// Bond Management
    static var bondManagement: BluetoothUUID { return .bit16(0x181E) }
    
    /// Continuous Glucose Monitoring
    static var continuousGlucoseMonitoring: BluetoothUUID { return .bit16(0x181F) }
    
    /// Internet Protocol Support
    static var internetProtocolSupport: BluetoothUUID { return .bit16(0x1820) }
    
    /// Indoor Positioning
    static var indoorPositioning: BluetoothUUID { return .bit16(0x1821) }
    
    /// Pulse Oximeter
    static var pulseOximeter: BluetoothUUID { return .bit16(0x1822) }
    
    /// HTTP Proxy
    static var httpProxy: BluetoothUUID { return .bit16(0x1823) }
    
    /// Transport Discovery
    static var transportDiscovery: BluetoothUUID { return .bit16(0x1824) }
    
    /// Object Transfer
    static var objectTransfer: BluetoothUUID { return .bit16(0x1825) }
    
    /// Primary Service
    static var primaryService: BluetoothUUID { return .bit16(0x2800) }
    
    /// Secondary Service
    static var secondaryService: BluetoothUUID { return .bit16(0x2801) }
    
    /// Include
    static var include: BluetoothUUID { return .bit16(0x2802) }
    
    /// Characteristic
    static var characteristic: BluetoothUUID { return .bit16(0x2803) }
    
    /// Characteristic Extended Properties
    static var characteristicExtendedProperties: BluetoothUUID { return .bit16(0x2900) }
    
    /// Characteristic User Description
    static var characteristicUserDescription: BluetoothUUID { return .bit16(0x2901) }
    
    /// Client Characteristic Configuration
    static var clientCharacteristicConfiguration: BluetoothUUID { return .bit16(0x2902) }
    
    /// Server Characteristic Configuration
    static var serverCharacteristicConfiguration: BluetoothUUID { return .bit16(0x2903) }
    
    /// Characteristic Format
    static var characteristicFormat: BluetoothUUID { return .bit16(0x2904) }
    
    /// Characteristic Aggregate Formate
    static var characteristicAggregateFormate: BluetoothUUID { return .bit16(0x2905) }
    
    /// Valid Range
    static var validRange: BluetoothUUID { return .bit16(0x2906) }
    
    /// External Report Reference
    static var externalReportReference: BluetoothUUID { return .bit16(0x2907) }
    
    /// Report Reference
    static var reportReference: BluetoothUUID { return .bit16(0x2908) }
    
    /// Number of Digitals
    static var numberOfDigitals: BluetoothUUID { return .bit16(0x2909) }
    
    /// Value Trigger Setting
    static var valueTriggerSetting: BluetoothUUID { return .bit16(0x290A) }
    
    /// Environmental Sensing Configuration
    static var environmentalSensingConfiguration: BluetoothUUID { return .bit16(0x290B) }
    
    /// Environmental Sensing Measurement
    static var environmentalSensingMeasurement: BluetoothUUID { return .bit16(0x290C) }
    
    /// Environmental Sensing Trigger Setting
    static var environmentalSensingTriggerSetting: BluetoothUUID { return .bit16(0x290D) }
    
    /// Time Trigger Setting
    static var timeTriggerSetting: BluetoothUUID { return .bit16(0x290E) }
    
    /// Device Name
    static var deviceName: BluetoothUUID { return .bit16(0x2A00) }
    
    /// Appearance
    static var appearance: BluetoothUUID { return .bit16(0x2A01) }
    
    /// Peripheral Privacy Flag
    static var peripheralPrivacyFlag: BluetoothUUID { return .bit16(0x2A02) }
    
    /// Reconnection Address
    static var reconnectionAddress: BluetoothUUID { return .bit16(0x2A03) }
    
    /// Peripheral Preferred Connection Parameters
    static var peripheralPreferredConnectionParameters: BluetoothUUID { return .bit16(0x2A04) }
    
    /// Service Changed
    static var serviceChanged: BluetoothUUID { return .bit16(0x2A05) }
    
    /// Alert Level
    static var alertLevel: BluetoothUUID { return .bit16(0x2A06) }
    
    /// Tx Power Level
    static var txPowerLevel: BluetoothUUID { return .bit16(0x2A07) }
    
    /// Date Time
    static var dateTime: BluetoothUUID { return .bit16(0x2A08) }
    
    /// Day of Week
    static var dayOfWeek: BluetoothUUID { return .bit16(0x2A09) }
    
    /// Day Date Time
    static var dayDateTime: BluetoothUUID { return .bit16(0x2A0A) }
    
    /// Exact Time 256
    static var exactTime256: BluetoothUUID { return .bit16(0x2A0C) }
    
    /// DST Offset
    static var dstOffset: BluetoothUUID { return .bit16(0x2A0D) }
    
    /// Time Zone
    static var timeZone: BluetoothUUID { return .bit16(0x2A0E) }
    
    /// Local Time Information
    static var localTimeInformation: BluetoothUUID { return .bit16(0x2A0F) }
    
    /// Time with DST
    static var timeWithDst: BluetoothUUID { return .bit16(0x2A11) }
    
    /// Time Accuracy
    static var timeAccuracy: BluetoothUUID { return .bit16(0x2A12) }
    
    /// Time Source
    static var timeSource: BluetoothUUID { return .bit16(0x2A13) }
    
    /// Reference Time Information
    static var referenceTimeInformation: BluetoothUUID { return .bit16(0x2A14) }
    
    /// Time Update Control Point
    static var timeUpdateControlPoint: BluetoothUUID { return .bit16(0x2A16) }
    
    /// Time Update State
    static var timeUpdateState: BluetoothUUID { return .bit16(0x2A17) }
    
    /// Glucose Measurement
    static var glucoseMeasurement: BluetoothUUID { return .bit16(0x2A18) }
    
    /// Battery Level
    static var batteryLevel: BluetoothUUID { return .bit16(0x2A19) }
    
    /// Temperature Measurement
    static var temperatureMeasurement: BluetoothUUID { return .bit16(0x2A1C) }
    
    /// Temperature Type
    static var temperatureType: BluetoothUUID { return .bit16(0x2A1D) }
    
    /// Intermediate Temperature
    static var intermediateTemperature: BluetoothUUID { return .bit16(0x2A1E) }
    
    /// Measurement Interval
    static var measurementInterval: BluetoothUUID { return .bit16(0x2A21) }
    
    /// Boot Keyboard Input Report
    static var bootKeyboardInputReport: BluetoothUUID { return .bit16(0x2A22) }
    
    /// System ID
    static var systemId: BluetoothUUID { return .bit16(0x2A23) }
    
    /// Model Number String
    static var modelNumberString: BluetoothUUID { return .bit16(0x2A24) }
    
    /// Serial Number String
    static var serialNumberString: BluetoothUUID { return .bit16(0x2A25) }
    
    /// Firmware Revision String
    static var firmwareRevisionString: BluetoothUUID { return .bit16(0x2A26) }
    
    /// Hardware Revision String
    static var hardwareRevisionString: BluetoothUUID { return .bit16(0x2A27) }
    
    /// Software Revision String
    static var softwareRevisionString: BluetoothUUID { return .bit16(0x2A28) }
    
    /// Manufacturer Name String
    static var manufacturerNameString: BluetoothUUID { return .bit16(0x2A29) }
    
    /// IEEE 11073-20601 Regulatory Cert. Data List
    static var ieee1107320601RegulatoryCertDataList: BluetoothUUID { return .bit16(0x2A2A) }
    
    /// Current Time
    static var currentTime: BluetoothUUID { return .bit16(0x2A2B) }
    
    /// Magnetic Declination
    static var magneticDeclination: BluetoothUUID { return .bit16(0x2A2C) }
    
    /// Scan Refresh
    static var scanRefresh: BluetoothUUID { return .bit16(0x2A31) }
    
    /// Boot Keyboard Output Report
    static var bootKeyboardOutputReport: BluetoothUUID { return .bit16(0x2A32) }
    
    /// Boot Mouse Input Report
    static var bootMouseInputReport: BluetoothUUID { return .bit16(0x2A33) }
    
    /// Glucose Measurement Context
    static var glucoseMeasurementContext: BluetoothUUID { return .bit16(0x2A34) }
    
    /// Blood Pressure Measurement
    static var bloodPressureMeasurement: BluetoothUUID { return .bit16(0x2A35) }
    
    /// Intermediate Cuff Pressure
    static var intermediateCuffPressure: BluetoothUUID { return .bit16(0x2A36) }
    
    /// Heart Rate Measurement
    static var heartRateMeasurement: BluetoothUUID { return .bit16(0x2A37) }
    
    /// Body Sensor Location
    static var bodySensorLocation: BluetoothUUID { return .bit16(0x2A38) }
    
    /// Heart Rate Control Point
    static var heartRateControlPoint: BluetoothUUID { return .bit16(0x2A39) }
    
    /// Alert Status
    static var alertStatus: BluetoothUUID { return .bit16(0x2A3F) }
    
    /// Ringer Control Point
    static var ringerControlPoint: BluetoothUUID { return .bit16(0x2A40) }
    
    /// Ringer Setting
    static var ringerSetting: BluetoothUUID { return .bit16(0x2A41) }
    
    /// Alert Category ID Bit Mask
    static var alertCategoryIdBitMask: BluetoothUUID { return .bit16(0x2A42) }
    
    /// Alert Category ID
    static var alertCategoryId: BluetoothUUID { return .bit16(0x2A43) }
    
    /// Alert Notification Control Point
    static var alertNotificationControlPoint: BluetoothUUID { return .bit16(0x2A44) }
    
    /// Unread Alert Status
    static var unreadAlertStatus: BluetoothUUID { return .bit16(0x2A45) }
    
    /// New Alert
    static var newAlert: BluetoothUUID { return .bit16(0x2A46) }
    
    /// Supported New Alert Category
    static var supportedNewAlertCategory: BluetoothUUID { return .bit16(0x2A47) }
    
    /// Supported Unread Alert Category
    static var supportedUnreadAlertCategory: BluetoothUUID { return .bit16(0x2A48) }
    
    /// Blood Pressure Feature
    static var bloodPressureFeature: BluetoothUUID { return .bit16(0x2A49) }
    
    /// HID Information
    static var hidInformation: BluetoothUUID { return .bit16(0x2A4A) }
    
    /// Report Map
    static var reportMap: BluetoothUUID { return .bit16(0x2A4B) }
    
    /// HID Control Point
    static var hidControlPoint: BluetoothUUID { return .bit16(0x2A4C) }
    
    /// Report
    static var report: BluetoothUUID { return .bit16(0x2A4D) }
    
    /// Protocol Mode
    static var protocolMode: BluetoothUUID { return .bit16(0x2A4E) }
    
    /// Scan Interval Window
    static var scanIntervalWindow: BluetoothUUID { return .bit16(0x2A4F) }
    
    /// PnP ID
    static var pnpId: BluetoothUUID { return .bit16(0x2A50) }
    
    /// Glucose Feature
    static var glucoseFeature: BluetoothUUID { return .bit16(0x2A51) }
    
    /// Record Access Control Point
    static var recordAccessControlPoint: BluetoothUUID { return .bit16(0x2A52) }
    
    /// RSC Measurement
    static var rscMeasurement: BluetoothUUID { return .bit16(0x2A53) }
    
    /// RSC Feature
    static var rscFeature: BluetoothUUID { return .bit16(0x2A54) }
    
    /// SC Control Point
    static var scControlPoint: BluetoothUUID { return .bit16(0x2A55) }
    
    /// Digital
    static var digital: BluetoothUUID { return .bit16(0x2A56) }
    
    /// Analog
    static var analog: BluetoothUUID { return .bit16(0x2A58) }
    
    /// Aggregate
    static var aggregate: BluetoothUUID { return .bit16(0x2A5A) }
    
    /// CSC Measurement
    static var cscMeasurement: BluetoothUUID { return .bit16(0x2A5B) }
    
    /// CSC Feature
    static var cscFeature: BluetoothUUID { return .bit16(0x2A5C) }
    
    /// Sensor Location
    static var sensorLocation: BluetoothUUID { return .bit16(0x2A5D) }
    
    /// Cycling Power Measurement
    static var cyclingPowerMeasurement: BluetoothUUID { return .bit16(0x2A63) }
    
    /// Cycling Power Vector
    static var cyclingPowerVector: BluetoothUUID { return .bit16(0x2A64) }
    
    /// Cycling Power Feature
    static var cyclingPowerFeature: BluetoothUUID { return .bit16(0x2A65) }
    
    /// Cycling Power Control Point
    static var cyclingPowerControlPoint: BluetoothUUID { return .bit16(0x2A66) }
    
    /// Location and Speed
    static var locationAndSpeed: BluetoothUUID { return .bit16(0x2A67) }
    
    /// Navigation
    static var navigation: BluetoothUUID { return .bit16(0x2A68) }
    
    /// Position Quality
    static var positionQuality: BluetoothUUID { return .bit16(0x2A69) }
    
    /// LN Feature
    static var lnFeature: BluetoothUUID { return .bit16(0x2A6A) }
    
    /// LN Control Point
    static var lnControlPoint: BluetoothUUID { return .bit16(0x2A6B) }
    
    /// Elevation
    static var elevation: BluetoothUUID { return .bit16(0x2A6C) }
    
    /// Pressure
    static var pressure: BluetoothUUID { return .bit16(0x2A6D) }
    
    /// Temperature
    static var temperature: BluetoothUUID { return .bit16(0x2A6E) }
    
    /// Humidity
    static var humidity: BluetoothUUID { return .bit16(0x2A6F) }
    
    /// True Wind Speed
    static var trueWindSpeed: BluetoothUUID { return .bit16(0x2A70) }
    
    /// True Wind Direction
    static var trueWindDirection: BluetoothUUID { return .bit16(0x2A71) }
    
    /// Apparent Wind Speed
    static var apparentWindSpeed: BluetoothUUID { return .bit16(0x2A72) }
    
    /// Apparent Wind Direction
    static var apparentWindDirection: BluetoothUUID { return .bit16(0x2A73) }
    
    /// Gust Factor
    static var gustFactor: BluetoothUUID { return .bit16(0x2A74) }
    
    /// Pollen Concentration
    static var pollenConcentration: BluetoothUUID { return .bit16(0x2A75) }
    
    /// UV Index
    static var uvIndex: BluetoothUUID { return .bit16(0x2A76) }
    
    /// Irradiance
    static var irradiance: BluetoothUUID { return .bit16(0x2A77) }
    
    /// Rainfall
    static var rainfall: BluetoothUUID { return .bit16(0x2A78) }
    
    /// Wind Chill
    static var windChill: BluetoothUUID { return .bit16(0x2A79) }
    
    /// Heat Index
    static var heatIndex: BluetoothUUID { return .bit16(0x2A7A) }
    
    /// Dew Point
    static var dewPoint: BluetoothUUID { return .bit16(0x2A7B) }
    
    /// Trend
    static var trend: BluetoothUUID { return .bit16(0x2A7C) }
    
    /// Descriptor Value Changed
    static var descriptorValueChanged: BluetoothUUID { return .bit16(0x2A7D) }
    
    /// Aerobic Heart Rate Lower Limit
    static var aerobicHeartRateLowerLimit: BluetoothUUID { return .bit16(0x2A7E) }
    
    /// Aerobic Threshold
    static var aerobicThreshold: BluetoothUUID { return .bit16(0x2A7F) }
    
    /// Age
    static var age: BluetoothUUID { return .bit16(0x2A80) }
    
    /// Anaerobic Heart Rate Lower Limit
    static var anaerobicHeartRateLowerLimit: BluetoothUUID { return .bit16(0x2A81) }
    
    /// Anaerobic Heart Rate Upper Limit
    static var anaerobicHeartRateUpperLimit: BluetoothUUID { return .bit16(0x2A82) }
    
    /// Anaerobic Threshold
    static var anaerobicThreshold: BluetoothUUID { return .bit16(0x2A83) }
    
    /// Aerobic Heart Rate Upper Limit
    static var aerobicHeartRateUpperLimit: BluetoothUUID { return .bit16(0x2A84) }
    
    /// Date of Birth
    static var dateOfBirth: BluetoothUUID { return .bit16(0x2A85) }
    
    /// Date of Threshold Assessment
    static var dateOfThresholdAssessment: BluetoothUUID { return .bit16(0x2A86) }
    
    /// Email Address
    static var emailAddress: BluetoothUUID { return .bit16(0x2A87) }
    
    /// Fat Burn Heart Rate Lower Limit
    static var fatBurnHeartRateLowerLimit: BluetoothUUID { return .bit16(0x2A88) }
    
    /// Fat Burn Heart Rate Upper Limit
    static var fatBurnHeartRateUpperLimit: BluetoothUUID { return .bit16(0x2A89) }
    
    /// First Name
    static var firstName: BluetoothUUID { return .bit16(0x2A8A) }
    
    /// Five Zone Heart Rate Limits
    static var fiveZoneHeartRateLimits: BluetoothUUID { return .bit16(0x2A8B) }
    
    /// Gender
    static var gender: BluetoothUUID { return .bit16(0x2A8C) }
    
    /// Heart Rate Max
    static var heartRateMax: BluetoothUUID { return .bit16(0x2A8D) }
    
    /// Height
    static var height: BluetoothUUID { return .bit16(0x2A8E) }
    
    /// Hip Circumference
    static var hipCircumference: BluetoothUUID { return .bit16(0x2A8F) }
    
    /// Last Name
    static var lastName: BluetoothUUID { return .bit16(0x2A90) }
    
    /// Maximum Recommended Heart Rate
    static var maximumRecommendedHeartRate: BluetoothUUID { return .bit16(0x2A91) }
    
    /// Resting Heart Rate
    static var restingHeartRate: BluetoothUUID { return .bit16(0x2A92) }
    
    /// Sport Type for Aerobic/Anaerobic Thresholds
    static var sportTypeForAerobicAnaerobicThresholds: BluetoothUUID { return .bit16(0x2A93) }
    
    /// Three Zone Heart Rate Limits
    static var threeZoneHeartRateLimits: BluetoothUUID { return .bit16(0x2A94) }
    
    /// Two Zone Heart Rate Limit
    static var twoZoneHeartRateLimit: BluetoothUUID { return .bit16(0x2A95) }
    
    /// VO2 Max
    static var vo2Max: BluetoothUUID { return .bit16(0x2A96) }
    
    /// Waist Circumference
    static var waistCircumference: BluetoothUUID { return .bit16(0x2A97) }
    
    /// Weight
    static var weight: BluetoothUUID { return .bit16(0x2A98) }
    
    /// Database Change Increment
    static var databaseChangerement: BluetoothUUID { return .bit16(0x2A99) }
    
    /// User Index
    static var userIndex: BluetoothUUID { return .bit16(0x2A9A) }
    
    /// Body Composition Feature
    static var bodyCompositionFeature: BluetoothUUID { return .bit16(0x2A9B) }
    
    /// Body Composition Measurement
    static var bodyCompositionMeasurement: BluetoothUUID { return .bit16(0x2A9C) }
    
    /// Weight Measurement
    static var weightMeasurement: BluetoothUUID { return .bit16(0x2A9D) }
    
    /// Weight Scale Feature
    static var weightScaleFeature: BluetoothUUID { return .bit16(0x2A9E) }
    
    /// User Control Point
    static var userControlPoint: BluetoothUUID { return .bit16(0x2A9F) }
    
    /// Magnetic Flux Density - 2D
    static var magneticFluxDensity2D: BluetoothUUID { return .bit16(0x2AA0) }
    
    /// Magnetic Flux Density - 3D
    static var magneticFluxDensity3D: BluetoothUUID { return .bit16(0x2AA1) }
    
    /// Language
    static var language: BluetoothUUID { return .bit16(0x2AA2) }
    
    /// Barometric Pressure Trend
    static var barometricPressureTrend: BluetoothUUID { return .bit16(0x2AA3) }
    
    /// Bond Management Control Point
    static var bondManagementControlPoint: BluetoothUUID { return .bit16(0x2AA4) }
    
    /// Bond Management Feature
    static var bondManagementFeature: BluetoothUUID { return .bit16(0x2AA5) }
    
    /// Central Address Resolution
    static var centralAddressResolution: BluetoothUUID { return .bit16(0x2AA6) }
    
    /// CGM Measurement
    static var cgmMeasurement: BluetoothUUID { return .bit16(0x2AA7) }
    
    /// CGM Feature
    static var cgmFeature: BluetoothUUID { return .bit16(0x2AA8) }
    
    /// CGM Status
    static var cgmStatus: BluetoothUUID { return .bit16(0x2AA9) }
    
    /// CGM Session Start Time
    static var cgmSessionStartTime: BluetoothUUID { return .bit16(0x2AAA) }
    
    /// CGM Session Run Time
    static var cgmSessionRunTime: BluetoothUUID { return .bit16(0x2AAB) }
    
    /// CGM Specific Ops Control Point
    static var cgmSpecificOpsControlPoint: BluetoothUUID { return .bit16(0x2AAC) }
    
    /// Indoor Positioning Configuration
    static var indoorPositioningConfiguration: BluetoothUUID { return .bit16(0x2AAD) }
    
    /// Latitude
    static var latitude: BluetoothUUID { return .bit16(0x2AAE) }
    
    /// Longitude
    static var longitude: BluetoothUUID { return .bit16(0x2AAF) }
    
    /// Local North Coordinate
    static var localNorthCoordinate: BluetoothUUID { return .bit16(0x2AB0) }
    
    /// Local East Coordinate
    static var localEastCoordinate: BluetoothUUID { return .bit16(0x2AB1) }
    
    /// Floor Number
    static var floorNumber: BluetoothUUID { return .bit16(0x2AB2) }
    
    /// Altitude
    static var altitude: BluetoothUUID { return .bit16(0x2AB3) }
    
    /// Uncertainty
    static var uncertainty: BluetoothUUID { return .bit16(0x2AB4) }
    
    /// Location Name
    static var locationName: BluetoothUUID { return .bit16(0x2AB5) }
    
    /// URI
    static var uri: BluetoothUUID { return .bit16(0x2AB6) }
    
    /// HTTP Headers
    static var httpHeaders: BluetoothUUID { return .bit16(0x2AB7) }
    
    /// HTTP Status Code
    static var httpStatusCode: BluetoothUUID { return .bit16(0x2AB8) }
    
    /// HTTP Entity Body
    static var httpEntityBody: BluetoothUUID { return .bit16(0x2AB9) }
    
    /// HTTP Control Point
    static var httpControlPoint: BluetoothUUID { return .bit16(0x2ABA) }
    
    /// HTTPS Security
    static var httpsSecurity: BluetoothUUID { return .bit16(0x2ABB) }
    
    /// TDS Control Point
    static var tdsControlPoint: BluetoothUUID { return .bit16(0x2ABC) }
    
    /// OTS Feature
    static var otsFeature: BluetoothUUID { return .bit16(0x2ABD) }
    
    /// Object Name
    static var objectName: BluetoothUUID { return .bit16(0x2ABE) }
    
    /// Object Type
    static var objectType: BluetoothUUID { return .bit16(0x2ABF) }
    
    /// Object Size
    static var objectSize: BluetoothUUID { return .bit16(0x2AC0) }
    
    /// Object First-Created
    static var objectFirstCreated: BluetoothUUID { return .bit16(0x2AC1) }
    
    /// Object Last-Modified
    static var objectLastModified: BluetoothUUID { return .bit16(0x2AC2) }
    
    /// Object ID
    static var objectId: BluetoothUUID { return .bit16(0x2AC3) }
    
    /// Object Properties
    static var objectProperties: BluetoothUUID { return .bit16(0x2AC4) }
    
    /// Object Action Control Point
    static var objectActionControlPoint: BluetoothUUID { return .bit16(0x2AC5) }
    
    /// Object List Control Point
    static var objectListControlPoint: BluetoothUUID { return .bit16(0x2AC6) }
    
    /// Object List Filter
    static var objectListFilter: BluetoothUUID { return .bit16(0x2AC7) }
    
    /// Object Changed
    static var objectChanged: BluetoothUUID { return .bit16(0x2AC8) }
    
    /// Intel Corporation
    static var intelCorporation: BluetoothUUID { return .bit16(0xFE66) }
    
    /// Lab Sensor Solutions
    static var labSensorSolutions: BluetoothUUID { return .bit16(0xFE67) }
    
    /// Qualcomm Life Inc
    static var qualcommLife: BluetoothUUID { return .bit16(0xFE68) }
    
    /// Qualcomm Life Inc
    static var qualcommLife2: BluetoothUUID { return .bit16(0xFE69) }
    
    /// Kontakt Micro-Location Sp. z o.o.
    static var kontaktMicroLocation: BluetoothUUID { return .bit16(0xFE6A) }
    
    /// TASER International, Inc.
    static var taserInternational: BluetoothUUID { return .bit16(0xFE6B) }
    
    /// TASER International, Inc.
    static var taserInternational2: BluetoothUUID { return .bit16(0xFE6C) }
    
    /// The University of Tokyo
    static var universityOfTokyo: BluetoothUUID { return .bit16(0xFE6D) }
    
    /// The University of Tokyo
    static var universityOfTokyo2: BluetoothUUID { return .bit16(0xFE6E) }
    
    /// LINE Corporation
    static var lineCorporation: BluetoothUUID { return .bit16(0xFE6F) }
    
    /// Beijing Jingdong Century Trading Co., Ltd.
    static var beijingJingdongCenturyTrading: BluetoothUUID { return .bit16(0xFE70) }
    
    /// Plume Design Inc
    static var plumeDesign: BluetoothUUID { return .bit16(0xFE71) }
    
    /// St. Jude Medical, Inc.
    static var stJudeMedical: BluetoothUUID { return .bit16(0xFE72) }
    
    /// St. Jude Medical, Inc.
    static var stJudeMedical2: BluetoothUUID { return .bit16(0xFE73) }
    
    /// unwire
    static var unwire: BluetoothUUID { return .bit16(0xFE74) }
    
    /// TangoMe
    static var tangome: BluetoothUUID { return .bit16(0xFE75) }
    
    /// TangoMe
    static var tangome2: BluetoothUUID { return .bit16(0xFE76) }
    
    /// Hewlett-Packard Company
    static var hewlettPackardCompany: BluetoothUUID { return .bit16(0xFE77) }
    
    /// Hewlett-Packard Company
    static var hewlettPackardCompany2: BluetoothUUID { return .bit16(0xFE78) }
    
    /// Zebra Technologies
    static var zebraTechnologies: BluetoothUUID { return .bit16(0xFE79) }
    
    /// Bragi GmbH
    static var bragiGmbh: BluetoothUUID { return .bit16(0xFE7A) }
    
    /// Orion Labs, Inc.
    static var orionLabs: BluetoothUUID { return .bit16(0xFE7B) }
    
    /// Stollmann E+V GmbH
    static var stollmannEVGmbh: BluetoothUUID { return .bit16(0xFE7C) }
    
    /// Aterica Health Inc.
    static var atericaHealth: BluetoothUUID { return .bit16(0xFE7D) }
    
    /// Awear Solutions Ltd
    static var awearSolutions: BluetoothUUID { return .bit16(0xFE7E) }
    
    /// Doppler Lab
    static var dopplerLab: BluetoothUUID { return .bit16(0xFE7F) }
    
    /// Doppler Lab
    static var dopplerLab2: BluetoothUUID { return .bit16(0xFE80) }
    
    /// Medtronic Inc.
    static var medtronic: BluetoothUUID { return .bit16(0xFE81) }
    
    /// Medtronic Inc.
    static var medtronic2: BluetoothUUID { return .bit16(0xFE82) }
    
    /// Blue Bite
    static var blueBite: BluetoothUUID { return .bit16(0xFE83) }
    
    /// RF Digital Corp
    static var rfDigitalCorp: BluetoothUUID { return .bit16(0xFE84) }
    
    /// RF Digital Corp
    static var rfDigitalCorp2: BluetoothUUID { return .bit16(0xFE85) }
    
    /// HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 )
    static var huaweiTechnologies华为技术有限公司: BluetoothUUID { return .bit16(0xFE86) }
    
    /// Qingdao Yeelink Information Technology Co., Ltd. ( 青岛亿联客信息技术有限公司 )
    static var qingdaoYeelinkInformationTechnology青岛亿联客信息技术有限公司: BluetoothUUID { return .bit16(0xFE87) }
    
    /// SALTO SYSTEMS S.L.
    static var saltoSystemsSL: BluetoothUUID { return .bit16(0xFE88) }
    
    /// B&O Play A/S
    static var bOPlayAS: BluetoothUUID { return .bit16(0xFE89) }
    
    /// Apple, Inc.
    static var apple: BluetoothUUID { return .bit16(0xFE8A) }
    
    /// Apple, Inc.
    static var apple2: BluetoothUUID { return .bit16(0xFE8B) }
    
    /// TRON Forum
    static var tronForum: BluetoothUUID { return .bit16(0xFE8C) }
    
    /// Interaxon Inc.
    static var interaxon: BluetoothUUID { return .bit16(0xFE8D) }
    
    /// ARM Ltd
    static var arm: BluetoothUUID { return .bit16(0xFE8E) }
    
    /// CSR
    static var csr: BluetoothUUID { return .bit16(0xFE8F) }
    
    /// JUMA
    static var juma: BluetoothUUID { return .bit16(0xFE90) }
    
    /// Shanghai Imilab Technology Co.,Ltd
    static var shanghaiImilabTechnology: BluetoothUUID { return .bit16(0xFE91) }
    
    /// Jarden Safety & Security
    static var jardenSafetySecurity: BluetoothUUID { return .bit16(0xFE92) }
    
    /// OttoQ Inc.
    static var ottoq: BluetoothUUID { return .bit16(0xFE93) }
    
    /// OttoQ Inc.
    static var ottoq2: BluetoothUUID { return .bit16(0xFE94) }
    
    /// Xiaomi Inc.
    static var xiaomi: BluetoothUUID { return .bit16(0xFE95) }
    
    /// Tesla Motor Inc.
    static var teslaMotor: BluetoothUUID { return .bit16(0xFE96) }
    
    /// Tesla Motor Inc.
    static var teslaMotor2: BluetoothUUID { return .bit16(0xFE97) }
    
    /// Currant, Inc.
    static var currant: BluetoothUUID { return .bit16(0xFE98) }
    
    /// Currant, Inc.
    static var currant2: BluetoothUUID { return .bit16(0xFE99) }
    
    /// Estimote
    static var estimote: BluetoothUUID { return .bit16(0xFE9A) }
    
    /// Samsara Networks, Inc
    static var samsaraNetworks: BluetoothUUID { return .bit16(0xFE9B) }
    
    /// GSI Laboratories, Inc.
    static var gsiLaboratories: BluetoothUUID { return .bit16(0xFE9C) }
    
    /// Mobiquity Networks Inc
    static var mobiquityNetworks: BluetoothUUID { return .bit16(0xFE9D) }
    
    /// Dialog Semiconductor B.V.
    static var dialogSemiconductorBV: BluetoothUUID { return .bit16(0xFE9E) }
    
    /// Google
    static var google: BluetoothUUID { return .bit16(0xFE9F) }
    
    /// Google
    static var google2: BluetoothUUID { return .bit16(0xFEA0) }
    
    /// Intrepid Control Systems, Inc.
    static var intrepidControlSystems: BluetoothUUID { return .bit16(0xFEA1) }
    
    /// Intrepid Control Systems, Inc.
    static var intrepidControlSystems2: BluetoothUUID { return .bit16(0xFEA2) }
    
    /// ITT Industries
    static var ittIndustries: BluetoothUUID { return .bit16(0xFEA3) }
    
    /// Paxton Access Ltd
    static var paxtonAccess: BluetoothUUID { return .bit16(0xFEA4) }
    
    /// GoPro, Inc.
    static var gopro: BluetoothUUID { return .bit16(0xFEA5) }
    
    /// GoPro, Inc.
    static var gopro2: BluetoothUUID { return .bit16(0xFEA6) }
    
    /// UTC Fire and Security
    static var utcFireAndSecurity: BluetoothUUID { return .bit16(0xFEA7) }
    
    /// Savant Systems LLC
    static var savantSystems: BluetoothUUID { return .bit16(0xFEA8) }
    
    /// Savant Systems LLC
    static var savantSystems2: BluetoothUUID { return .bit16(0xFEA9) }
    
    /// Google
    static var google3: BluetoothUUID { return .bit16(0xFEAA) }
    
    /// Nokia Corporation
    static var nokiaCorporation: BluetoothUUID { return .bit16(0xFEAB) }
    
    /// Nokia Corporation
    static var nokiaCorporation2: BluetoothUUID { return .bit16(0xFEAC) }
    
    /// Nokia Corporation
    static var nokiaCorporation3: BluetoothUUID { return .bit16(0xFEAD) }
    
    /// Nokia Corporation
    static var nokiaCorporation4: BluetoothUUID { return .bit16(0xFEAE) }
    
    /// Nest Labs Inc.
    static var nestLabs: BluetoothUUID { return .bit16(0xFEAF) }
    
    /// Nest Labs Inc.
    static var nestLabs2: BluetoothUUID { return .bit16(0xFEB0) }
    
    /// Electronics Tomorrow Limited
    static var electronicsTomorrowLimited: BluetoothUUID { return .bit16(0xFEB1) }
    
    /// Microsoft Corporation
    static var microsoftCorporation: BluetoothUUID { return .bit16(0xFEB2) }
    
    /// Taobao
    static var taobao: BluetoothUUID { return .bit16(0xFEB3) }
    
    /// WiSilica Inc.
    static var wisilica: BluetoothUUID { return .bit16(0xFEB4) }
    
    /// WiSilica Inc.
    static var wisilica2: BluetoothUUID { return .bit16(0xFEB5) }
    
    /// Vencer Co, Ltd
    static var vencerCo: BluetoothUUID { return .bit16(0xFEB6) }
    
    /// Facebook, Inc.
    static var facebook: BluetoothUUID { return .bit16(0xFEB7) }
    
    /// Facebook, Inc.
    static var facebook2: BluetoothUUID { return .bit16(0xFEB8) }
    
    /// LG Electronics
    static var lgElectronics: BluetoothUUID { return .bit16(0xFEB9) }
    
    /// Tencent Holdings Limited
    static var tencentHoldingsLimited: BluetoothUUID { return .bit16(0xFEBA) }
    
    /// adafruit industries
    static var adafruitIndustries: BluetoothUUID { return .bit16(0xFEBB) }
    
    /// Dexcom, Inc.
    static var dexcom: BluetoothUUID { return .bit16(0xFEBC) }
    
    /// Clover Network, Inc.
    static var cloverNetwork: BluetoothUUID { return .bit16(0xFEBD) }
    
    /// Bose Corporation
    static var boseCorporation: BluetoothUUID { return .bit16(0xFEBE) }
    
    /// Nod, Inc.
    static var nod: BluetoothUUID { return .bit16(0xFEBF) }
    
    /// KDDI Corporation
    static var kddiCorporation: BluetoothUUID { return .bit16(0xFEC0) }
    
    /// KDDI Corporation
    static var kddiCorporation2: BluetoothUUID { return .bit16(0xFEC1) }
    
    /// Blue Spark Technologies, Inc.
    static var blueSparkTechnologies: BluetoothUUID { return .bit16(0xFEC2) }
    
    /// 360fly, Inc.
    static var uuid360Fly: BluetoothUUID { return .bit16(0xFEC3) }
    
    /// PLUS Location Systems
    static var plusLocationSystems: BluetoothUUID { return .bit16(0xFEC4) }
    
    /// Realtek Semiconductor Corp.
    static var realtekSemiconductorCorp: BluetoothUUID { return .bit16(0xFEC5) }
    
    /// Kocomojo, LLC
    static var kocomojo: BluetoothUUID { return .bit16(0xFEC6) }
    
    /// Apple, Inc.
    static var apple3: BluetoothUUID { return .bit16(0xFEC7) }
    
    /// Apple, Inc.
    static var apple4: BluetoothUUID { return .bit16(0xFEC8) }
    
    /// Apple, Inc.
    static var apple5: BluetoothUUID { return .bit16(0xFEC9) }
    
    /// Apple, Inc.
    static var apple6: BluetoothUUID { return .bit16(0xFECA) }
    
    /// Apple, Inc.
    static var apple7: BluetoothUUID { return .bit16(0xFECB) }
    
    /// Apple, Inc.
    static var apple8: BluetoothUUID { return .bit16(0xFECC) }
    
    /// Apple, Inc.
    static var apple9: BluetoothUUID { return .bit16(0xFECD) }
    
    /// Apple, Inc.
    static var apple10: BluetoothUUID { return .bit16(0xFECE) }
    
    /// Apple, Inc.
    static var apple11: BluetoothUUID { return .bit16(0xFECF) }
    
    /// Apple, Inc.
    static var apple12: BluetoothUUID { return .bit16(0xFED0) }
    
    /// Apple, Inc.
    static var apple13: BluetoothUUID { return .bit16(0xFED1) }
    
    /// Apple, Inc.
    static var apple14: BluetoothUUID { return .bit16(0xFED2) }
    
    /// Apple, Inc.
    static var apple15: BluetoothUUID { return .bit16(0xFED3) }
    
    /// Apple, Inc.
    static var apple16: BluetoothUUID { return .bit16(0xFED4) }
    
    /// Plantronics Inc.
    static var plantronics: BluetoothUUID { return .bit16(0xFED5) }
    
    /// Broadcom Corporation
    static var broadcomCorporation: BluetoothUUID { return .bit16(0xFED6) }
    
    /// Broadcom Corporation
    static var broadcomCorporation2: BluetoothUUID { return .bit16(0xFED7) }
    
    /// Google
    static var google4: BluetoothUUID { return .bit16(0xFED8) }
    
    /// Pebble Technology Corporation
    static var pebbleTechnologyCorporation: BluetoothUUID { return .bit16(0xFED9) }
    
    /// ISSC Technologies Corporation
    static var isscTechnologiesCorporation: BluetoothUUID { return .bit16(0xFEDA) }
    
    /// Perka, Inc.
    static var perka: BluetoothUUID { return .bit16(0xFEDB) }
    
    /// Jawbone
    static var jawbone: BluetoothUUID { return .bit16(0xFEDC) }
    
    /// Jawbone
    static var jawbone2: BluetoothUUID { return .bit16(0xFEDD) }
    
    /// Coin, Inc.
    static var coin: BluetoothUUID { return .bit16(0xFEDE) }
    
    /// Design SHIFT
    static var designShift: BluetoothUUID { return .bit16(0xFEDF) }
    
    /// Anhui Huami Information Technology Co.
    static var anhuiHuamiInformationTechnologyCo: BluetoothUUID { return .bit16(0xFEE0) }
    
    /// Anhui Huami Information Technology Co.
    static var anhuiHuamiInformationTechnologyCo2: BluetoothUUID { return .bit16(0xFEE1) }
    
    /// Anki, Inc.
    static var anki: BluetoothUUID { return .bit16(0xFEE2) }
    
    /// Anki, Inc.
    static var anki2: BluetoothUUID { return .bit16(0xFEE3) }
    
    /// Nordic Semiconductor ASA
    static var nordicSemiconductorAsa: BluetoothUUID { return .bit16(0xFEE4) }
    
    /// Nordic Semiconductor ASA
    static var nordicSemiconductorAsa2: BluetoothUUID { return .bit16(0xFEE5) }
    
    /// Seed Labs, Inc.
    static var seedLabs: BluetoothUUID { return .bit16(0xFEE6) }
    
    /// Tencent Holdings Limited
    static var tencentHoldingsLimited2: BluetoothUUID { return .bit16(0xFEE7) }
    
    /// Quintic Corp.
    static var quinticCorp: BluetoothUUID { return .bit16(0xFEE8) }
    
    /// Quintic Corp.
    static var quinticCorp2: BluetoothUUID { return .bit16(0xFEE9) }
    
    /// Swirl Networks, Inc.
    static var swirlNetworks: BluetoothUUID { return .bit16(0xFEEA) }
    
    /// Swirl Networks, Inc.
    static var swirlNetworks2: BluetoothUUID { return .bit16(0xFEEB) }
    
    /// Tile, Inc.
    static var tile: BluetoothUUID { return .bit16(0xFEEC) }
    
    /// Tile, Inc.
    static var tile2: BluetoothUUID { return .bit16(0xFEED) }
    
    /// Polar Electro Oy
    static var polarElectroOy: BluetoothUUID { return .bit16(0xFEEE) }
    
    /// Polar Electro Oy
    static var polarElectroOy2: BluetoothUUID { return .bit16(0xFEEF) }
    
    /// Intel
    static var intel: BluetoothUUID { return .bit16(0xFEF0) }
    
    /// CSR
    static var csr2: BluetoothUUID { return .bit16(0xFEF1) }
    
    /// CSR
    static var csr3: BluetoothUUID { return .bit16(0xFEF2) }
    
    /// Google
    static var google5: BluetoothUUID { return .bit16(0xFEF3) }
    
    /// Google
    static var google6: BluetoothUUID { return .bit16(0xFEF4) }
    
    /// Dialog Semiconductor GmbH
    static var dialogSemiconductorGmbh: BluetoothUUID { return .bit16(0xFEF5) }
    
    /// Wicentric, Inc.
    static var wicentric: BluetoothUUID { return .bit16(0xFEF6) }
    
    /// Aplix Corporation
    static var aplixCorporation: BluetoothUUID { return .bit16(0xFEF7) }
    
    /// Aplix Corporation
    static var aplixCorporation2: BluetoothUUID { return .bit16(0xFEF8) }
    
    /// PayPal, Inc.
    static var paypal: BluetoothUUID { return .bit16(0xFEF9) }
    
    /// PayPal, Inc.
    static var paypal2: BluetoothUUID { return .bit16(0xFEFA) }
    
    /// Stollmann E+V GmbH
    static var stollmannEVGmbh2: BluetoothUUID { return .bit16(0xFEFB) }
    
    /// Gimbal, Inc.
    static var gimbal: BluetoothUUID { return .bit16(0xFEFC) }
    
    /// Gimbal, Inc.
    static var gimbal2: BluetoothUUID { return .bit16(0xFEFD) }
    
    /// GN ReSound A/S
    static var gnResoundAS: BluetoothUUID { return .bit16(0xFEFE) }
    
    /// GN Netcom
    static var gnNetcom: BluetoothUUID { return .bit16(0xFEFF) }
    
    /// Fast IDentity Online Alliance (FIDO)
    static var fastIdentityOnlineAllianceFido: BluetoothUUID { return .bit16(0xFFFD) }
    
    /// Alliance for Wireless Power (A4WP)
    static var allianceForWirelessPowerA4Wp: BluetoothUUID { return .bit16(0xFFFE) }
    
}
