//
//  CompanyIdentifierTests.swift
//  Bluetooth
//

import XCTest
import Foundation
@testable import Bluetooth

// swiftlint:disable type_body_length
#if swift(<5.6) || !SWIFTPM_ENABLE_PLUGINS
final class CompanyIdentifierTests: XCTestCase {

    func testCompanies() {

        // Ericsson Technology Licensing
        XCTAssertEqual(CompanyIdentifier.ericssonTechnologyLicensing.rawValue, 0)
        XCTAssertEqual(CompanyIdentifier.ericssonTechnologyLicensing.name, #"Ericsson Technology Licensing"#)
        XCTAssertEqual(CompanyIdentifier.ericssonTechnologyLicensing.description, #"Ericsson Technology Licensing"#)
    
        // Nokia Mobile Phones
        XCTAssertEqual(CompanyIdentifier.nokiaMobilePhones.rawValue, 1)
        XCTAssertEqual(CompanyIdentifier.nokiaMobilePhones.name, #"Nokia Mobile Phones"#)
        XCTAssertEqual(CompanyIdentifier.nokiaMobilePhones.description, #"Nokia Mobile Phones"#)
    
        // Intel Corp.
        XCTAssertEqual(CompanyIdentifier.intel.rawValue, 2)
        XCTAssertEqual(CompanyIdentifier.intel.name, #"Intel Corp."#)
        XCTAssertEqual(CompanyIdentifier.intel.description, #"Intel Corp."#)
    
        // IBM Corp.
        XCTAssertEqual(CompanyIdentifier.ibm.rawValue, 3)
        XCTAssertEqual(CompanyIdentifier.ibm.name, #"IBM Corp."#)
        XCTAssertEqual(CompanyIdentifier.ibm.description, #"IBM Corp."#)
    
        // Toshiba Corp.
        XCTAssertEqual(CompanyIdentifier.toshiba.rawValue, 4)
        XCTAssertEqual(CompanyIdentifier.toshiba.name, #"Toshiba Corp."#)
        XCTAssertEqual(CompanyIdentifier.toshiba.description, #"Toshiba Corp."#)
    
        // 3Com
        XCTAssertEqual(CompanyIdentifier.company3Com.rawValue, 5)
        XCTAssertEqual(CompanyIdentifier.company3Com.name, #"3Com"#)
        XCTAssertEqual(CompanyIdentifier.company3Com.description, #"3Com"#)
    
        // Microsoft
        XCTAssertEqual(CompanyIdentifier.microsoft.rawValue, 6)
        XCTAssertEqual(CompanyIdentifier.microsoft.name, #"Microsoft"#)
        XCTAssertEqual(CompanyIdentifier.microsoft.description, #"Microsoft"#)
    
        // Lucent
        XCTAssertEqual(CompanyIdentifier.lucent.rawValue, 7)
        XCTAssertEqual(CompanyIdentifier.lucent.name, #"Lucent"#)
        XCTAssertEqual(CompanyIdentifier.lucent.description, #"Lucent"#)
    
        // Motorola
        XCTAssertEqual(CompanyIdentifier.motorola.rawValue, 8)
        XCTAssertEqual(CompanyIdentifier.motorola.name, #"Motorola"#)
        XCTAssertEqual(CompanyIdentifier.motorola.description, #"Motorola"#)
    
        // Infineon Technologies AG
        XCTAssertEqual(CompanyIdentifier.infineonTechnologies.rawValue, 9)
        XCTAssertEqual(CompanyIdentifier.infineonTechnologies.name, #"Infineon Technologies AG"#)
        XCTAssertEqual(CompanyIdentifier.infineonTechnologies.description, #"Infineon Technologies AG"#)
    
        // Qualcomm Technologies International, Ltd. (QTIL)
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologiesInternational.rawValue, 10)
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologiesInternational.name, #"Qualcomm Technologies International, Ltd. (QTIL)"#)
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologiesInternational.description, #"Qualcomm Technologies International, Ltd. (QTIL)"#)
    
        // Silicon Wave
        XCTAssertEqual(CompanyIdentifier.siliconWave.rawValue, 11)
        XCTAssertEqual(CompanyIdentifier.siliconWave.name, #"Silicon Wave"#)
        XCTAssertEqual(CompanyIdentifier.siliconWave.description, #"Silicon Wave"#)
    
        // Digianswer A/S
        XCTAssertEqual(CompanyIdentifier.digianswer.rawValue, 12)
        XCTAssertEqual(CompanyIdentifier.digianswer.name, #"Digianswer A/S"#)
        XCTAssertEqual(CompanyIdentifier.digianswer.description, #"Digianswer A/S"#)
    
        // Texas Instruments Inc.
        XCTAssertEqual(CompanyIdentifier.texasInstruments.rawValue, 13)
        XCTAssertEqual(CompanyIdentifier.texasInstruments.name, #"Texas Instruments Inc."#)
        XCTAssertEqual(CompanyIdentifier.texasInstruments.description, #"Texas Instruments Inc."#)
    
        // Parthus Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.parthusTechnologies.rawValue, 14)
        XCTAssertEqual(CompanyIdentifier.parthusTechnologies.name, #"Parthus Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.parthusTechnologies.description, #"Parthus Technologies Inc."#)
    
        // Broadcom Corporation
        XCTAssertEqual(CompanyIdentifier.broadcom.rawValue, 15)
        XCTAssertEqual(CompanyIdentifier.broadcom.name, #"Broadcom Corporation"#)
        XCTAssertEqual(CompanyIdentifier.broadcom.description, #"Broadcom Corporation"#)
    
        // Mitel Semiconductor
        XCTAssertEqual(CompanyIdentifier.mitelSemiconductor.rawValue, 16)
        XCTAssertEqual(CompanyIdentifier.mitelSemiconductor.name, #"Mitel Semiconductor"#)
        XCTAssertEqual(CompanyIdentifier.mitelSemiconductor.description, #"Mitel Semiconductor"#)
    
        // Widcomm, Inc.
        XCTAssertEqual(CompanyIdentifier.widcomm.rawValue, 17)
        XCTAssertEqual(CompanyIdentifier.widcomm.name, #"Widcomm, Inc."#)
        XCTAssertEqual(CompanyIdentifier.widcomm.description, #"Widcomm, Inc."#)
    
        // Zeevo, Inc.
        XCTAssertEqual(CompanyIdentifier.zeevo.rawValue, 18)
        XCTAssertEqual(CompanyIdentifier.zeevo.name, #"Zeevo, Inc."#)
        XCTAssertEqual(CompanyIdentifier.zeevo.description, #"Zeevo, Inc."#)
    
        // Atmel Corporation
        XCTAssertEqual(CompanyIdentifier.atmel.rawValue, 19)
        XCTAssertEqual(CompanyIdentifier.atmel.name, #"Atmel Corporation"#)
        XCTAssertEqual(CompanyIdentifier.atmel.description, #"Atmel Corporation"#)
    
        // Mitsubishi Electric Corporation
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectric.rawValue, 20)
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectric.name, #"Mitsubishi Electric Corporation"#)
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectric.description, #"Mitsubishi Electric Corporation"#)
    
        // RTX Telecom A/S
        XCTAssertEqual(CompanyIdentifier.rtxTelecom.rawValue, 21)
        XCTAssertEqual(CompanyIdentifier.rtxTelecom.name, #"RTX Telecom A/S"#)
        XCTAssertEqual(CompanyIdentifier.rtxTelecom.description, #"RTX Telecom A/S"#)
    
        // KC Technology Inc.
        XCTAssertEqual(CompanyIdentifier.kcTechnology.rawValue, 22)
        XCTAssertEqual(CompanyIdentifier.kcTechnology.name, #"KC Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.kcTechnology.description, #"KC Technology Inc."#)
    
        // Newlogic
        XCTAssertEqual(CompanyIdentifier.newlogic.rawValue, 23)
        XCTAssertEqual(CompanyIdentifier.newlogic.name, #"Newlogic"#)
        XCTAssertEqual(CompanyIdentifier.newlogic.description, #"Newlogic"#)
    
        // Transilica, Inc.
        XCTAssertEqual(CompanyIdentifier.transilica.rawValue, 24)
        XCTAssertEqual(CompanyIdentifier.transilica.name, #"Transilica, Inc."#)
        XCTAssertEqual(CompanyIdentifier.transilica.description, #"Transilica, Inc."#)
    
        // Rohde & Schwarz GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.rohdeSchwarz.rawValue, 25)
        XCTAssertEqual(CompanyIdentifier.rohdeSchwarz.name, #"Rohde & Schwarz GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.rohdeSchwarz.description, #"Rohde & Schwarz GmbH & Co. KG"#)
    
        // TTPCom Limited
        XCTAssertEqual(CompanyIdentifier.ttpcom.rawValue, 26)
        XCTAssertEqual(CompanyIdentifier.ttpcom.name, #"TTPCom Limited"#)
        XCTAssertEqual(CompanyIdentifier.ttpcom.description, #"TTPCom Limited"#)
    
        // Signia Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.signiaTechnologies.rawValue, 27)
        XCTAssertEqual(CompanyIdentifier.signiaTechnologies.name, #"Signia Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.signiaTechnologies.description, #"Signia Technologies, Inc."#)
    
        // Conexant Systems Inc.
        XCTAssertEqual(CompanyIdentifier.conexantSystems.rawValue, 28)
        XCTAssertEqual(CompanyIdentifier.conexantSystems.name, #"Conexant Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.conexantSystems.description, #"Conexant Systems Inc."#)
    
        // Qualcomm
        XCTAssertEqual(CompanyIdentifier.qualcomm.rawValue, 29)
        XCTAssertEqual(CompanyIdentifier.qualcomm.name, #"Qualcomm"#)
        XCTAssertEqual(CompanyIdentifier.qualcomm.description, #"Qualcomm"#)
    
        // Inventel
        XCTAssertEqual(CompanyIdentifier.inventel.rawValue, 30)
        XCTAssertEqual(CompanyIdentifier.inventel.name, #"Inventel"#)
        XCTAssertEqual(CompanyIdentifier.inventel.description, #"Inventel"#)
    
        // AVM Berlin
        XCTAssertEqual(CompanyIdentifier.avmBerlin.rawValue, 31)
        XCTAssertEqual(CompanyIdentifier.avmBerlin.name, #"AVM Berlin"#)
        XCTAssertEqual(CompanyIdentifier.avmBerlin.description, #"AVM Berlin"#)
    
        // BandSpeed, Inc.
        XCTAssertEqual(CompanyIdentifier.bandspeed.rawValue, 32)
        XCTAssertEqual(CompanyIdentifier.bandspeed.name, #"BandSpeed, Inc."#)
        XCTAssertEqual(CompanyIdentifier.bandspeed.description, #"BandSpeed, Inc."#)
    
        // Mansella Ltd
        XCTAssertEqual(CompanyIdentifier.mansella.rawValue, 33)
        XCTAssertEqual(CompanyIdentifier.mansella.name, #"Mansella Ltd"#)
        XCTAssertEqual(CompanyIdentifier.mansella.description, #"Mansella Ltd"#)
    
        // NEC Corporation
        XCTAssertEqual(CompanyIdentifier.nec.rawValue, 34)
        XCTAssertEqual(CompanyIdentifier.nec.name, #"NEC Corporation"#)
        XCTAssertEqual(CompanyIdentifier.nec.description, #"NEC Corporation"#)
    
        // WavePlus Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.waveplusTechnology.rawValue, 35)
        XCTAssertEqual(CompanyIdentifier.waveplusTechnology.name, #"WavePlus Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.waveplusTechnology.description, #"WavePlus Technology Co., Ltd."#)
    
        // Alcatel
        XCTAssertEqual(CompanyIdentifier.alcatel.rawValue, 36)
        XCTAssertEqual(CompanyIdentifier.alcatel.name, #"Alcatel"#)
        XCTAssertEqual(CompanyIdentifier.alcatel.description, #"Alcatel"#)
    
        // NXP Semiconductors (formerly Philips Semiconductors)
        XCTAssertEqual(CompanyIdentifier.nxpSemiconductors.rawValue, 37)
        XCTAssertEqual(CompanyIdentifier.nxpSemiconductors.name, #"NXP Semiconductors (formerly Philips Semiconductors)"#)
        XCTAssertEqual(CompanyIdentifier.nxpSemiconductors.description, #"NXP Semiconductors (formerly Philips Semiconductors)"#)
    
        // C Technologies
        XCTAssertEqual(CompanyIdentifier.cTechnologies.rawValue, 38)
        XCTAssertEqual(CompanyIdentifier.cTechnologies.name, #"C Technologies"#)
        XCTAssertEqual(CompanyIdentifier.cTechnologies.description, #"C Technologies"#)
    
        // Open Interface
        XCTAssertEqual(CompanyIdentifier.openInterface.rawValue, 39)
        XCTAssertEqual(CompanyIdentifier.openInterface.name, #"Open Interface"#)
        XCTAssertEqual(CompanyIdentifier.openInterface.description, #"Open Interface"#)
    
        // R F Micro Devices
        XCTAssertEqual(CompanyIdentifier.rFMicroDevices.rawValue, 40)
        XCTAssertEqual(CompanyIdentifier.rFMicroDevices.name, #"R F Micro Devices"#)
        XCTAssertEqual(CompanyIdentifier.rFMicroDevices.description, #"R F Micro Devices"#)
    
        // Hitachi Ltd
        XCTAssertEqual(CompanyIdentifier.hitachi.rawValue, 41)
        XCTAssertEqual(CompanyIdentifier.hitachi.name, #"Hitachi Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hitachi.description, #"Hitachi Ltd"#)
    
        // Symbol Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.symbolTechnologies.rawValue, 42)
        XCTAssertEqual(CompanyIdentifier.symbolTechnologies.name, #"Symbol Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.symbolTechnologies.description, #"Symbol Technologies, Inc."#)
    
        // Tenovis
        XCTAssertEqual(CompanyIdentifier.tenovis.rawValue, 43)
        XCTAssertEqual(CompanyIdentifier.tenovis.name, #"Tenovis"#)
        XCTAssertEqual(CompanyIdentifier.tenovis.description, #"Tenovis"#)
    
        // Macronix International Co. Ltd.
        XCTAssertEqual(CompanyIdentifier.macronixInternational.rawValue, 44)
        XCTAssertEqual(CompanyIdentifier.macronixInternational.name, #"Macronix International Co. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.macronixInternational.description, #"Macronix International Co. Ltd."#)
    
        // GCT Semiconductor
        XCTAssertEqual(CompanyIdentifier.gctSemiconductor.rawValue, 45)
        XCTAssertEqual(CompanyIdentifier.gctSemiconductor.name, #"GCT Semiconductor"#)
        XCTAssertEqual(CompanyIdentifier.gctSemiconductor.description, #"GCT Semiconductor"#)
    
        // Norwood Systems
        XCTAssertEqual(CompanyIdentifier.norwoodSystems.rawValue, 46)
        XCTAssertEqual(CompanyIdentifier.norwoodSystems.name, #"Norwood Systems"#)
        XCTAssertEqual(CompanyIdentifier.norwoodSystems.description, #"Norwood Systems"#)
    
        // MewTel Technology Inc.
        XCTAssertEqual(CompanyIdentifier.mewtelTechnology.rawValue, 47)
        XCTAssertEqual(CompanyIdentifier.mewtelTechnology.name, #"MewTel Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.mewtelTechnology.description, #"MewTel Technology Inc."#)
    
        // ST Microelectronics
        XCTAssertEqual(CompanyIdentifier.stMicroelectronics.rawValue, 48)
        XCTAssertEqual(CompanyIdentifier.stMicroelectronics.name, #"ST Microelectronics"#)
        XCTAssertEqual(CompanyIdentifier.stMicroelectronics.description, #"ST Microelectronics"#)
    
        // Synopsys, Inc.
        XCTAssertEqual(CompanyIdentifier.synopsys.rawValue, 49)
        XCTAssertEqual(CompanyIdentifier.synopsys.name, #"Synopsys, Inc."#)
        XCTAssertEqual(CompanyIdentifier.synopsys.description, #"Synopsys, Inc."#)
    
        // Red-M (Communications) Ltd
        XCTAssertEqual(CompanyIdentifier.redMCommunications.rawValue, 50)
        XCTAssertEqual(CompanyIdentifier.redMCommunications.name, #"Red-M (Communications) Ltd"#)
        XCTAssertEqual(CompanyIdentifier.redMCommunications.description, #"Red-M (Communications) Ltd"#)
    
        // Commil Ltd
        XCTAssertEqual(CompanyIdentifier.commil.rawValue, 51)
        XCTAssertEqual(CompanyIdentifier.commil.name, #"Commil Ltd"#)
        XCTAssertEqual(CompanyIdentifier.commil.description, #"Commil Ltd"#)
    
        // Computer Access Technology Corporation (CATC)
        XCTAssertEqual(CompanyIdentifier.computerAccessTechnologyCatc.rawValue, 52)
        XCTAssertEqual(CompanyIdentifier.computerAccessTechnologyCatc.name, #"Computer Access Technology Corporation (CATC)"#)
        XCTAssertEqual(CompanyIdentifier.computerAccessTechnologyCatc.description, #"Computer Access Technology Corporation (CATC)"#)
    
        // Eclipse (HQ Espana) S.L.
        XCTAssertEqual(CompanyIdentifier.eclipseHqEspana.rawValue, 53)
        XCTAssertEqual(CompanyIdentifier.eclipseHqEspana.name, #"Eclipse (HQ Espana) S.L."#)
        XCTAssertEqual(CompanyIdentifier.eclipseHqEspana.description, #"Eclipse (HQ Espana) S.L."#)
    
        // Renesas Electronics Corporation
        XCTAssertEqual(CompanyIdentifier.renesasElectronics.rawValue, 54)
        XCTAssertEqual(CompanyIdentifier.renesasElectronics.name, #"Renesas Electronics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.renesasElectronics.description, #"Renesas Electronics Corporation"#)
    
        // Mobilian Corporation
        XCTAssertEqual(CompanyIdentifier.mobilian.rawValue, 55)
        XCTAssertEqual(CompanyIdentifier.mobilian.name, #"Mobilian Corporation"#)
        XCTAssertEqual(CompanyIdentifier.mobilian.description, #"Mobilian Corporation"#)
    
        // Syntronix Corporation
        XCTAssertEqual(CompanyIdentifier.syntronix.rawValue, 56)
        XCTAssertEqual(CompanyIdentifier.syntronix.name, #"Syntronix Corporation"#)
        XCTAssertEqual(CompanyIdentifier.syntronix.description, #"Syntronix Corporation"#)
    
        // Integrated System Solution Corp.
        XCTAssertEqual(CompanyIdentifier.integratedSystemSolution.rawValue, 57)
        XCTAssertEqual(CompanyIdentifier.integratedSystemSolution.name, #"Integrated System Solution Corp."#)
        XCTAssertEqual(CompanyIdentifier.integratedSystemSolution.description, #"Integrated System Solution Corp."#)
    
        // Panasonic Holdings Corporation
        XCTAssertEqual(CompanyIdentifier.panasonicHoldings.rawValue, 58)
        XCTAssertEqual(CompanyIdentifier.panasonicHoldings.name, #"Panasonic Holdings Corporation"#)
        XCTAssertEqual(CompanyIdentifier.panasonicHoldings.description, #"Panasonic Holdings Corporation"#)
    
        // Gennum Corporation
        XCTAssertEqual(CompanyIdentifier.gennum.rawValue, 59)
        XCTAssertEqual(CompanyIdentifier.gennum.name, #"Gennum Corporation"#)
        XCTAssertEqual(CompanyIdentifier.gennum.description, #"Gennum Corporation"#)
    
        // BlackBerry Limited  (formerly Research In Motion)
        XCTAssertEqual(CompanyIdentifier.blackberry.rawValue, 60)
        XCTAssertEqual(CompanyIdentifier.blackberry.name, #"BlackBerry Limited  (formerly Research In Motion)"#)
        XCTAssertEqual(CompanyIdentifier.blackberry.description, #"BlackBerry Limited  (formerly Research In Motion)"#)
    
        // IPextreme, Inc.
        XCTAssertEqual(CompanyIdentifier.ipextreme.rawValue, 61)
        XCTAssertEqual(CompanyIdentifier.ipextreme.name, #"IPextreme, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ipextreme.description, #"IPextreme, Inc."#)
    
        // Systems and Chips, Inc
        XCTAssertEqual(CompanyIdentifier.systemsAndChips.rawValue, 62)
        XCTAssertEqual(CompanyIdentifier.systemsAndChips.name, #"Systems and Chips, Inc"#)
        XCTAssertEqual(CompanyIdentifier.systemsAndChips.description, #"Systems and Chips, Inc"#)
    
        // Bluetooth SIG, Inc
        XCTAssertEqual(CompanyIdentifier.bluetoothSig.rawValue, 63)
        XCTAssertEqual(CompanyIdentifier.bluetoothSig.name, #"Bluetooth SIG, Inc"#)
        XCTAssertEqual(CompanyIdentifier.bluetoothSig.description, #"Bluetooth SIG, Inc"#)
    
        // Seiko Epson Corporation
        XCTAssertEqual(CompanyIdentifier.seikoEpson.rawValue, 64)
        XCTAssertEqual(CompanyIdentifier.seikoEpson.name, #"Seiko Epson Corporation"#)
        XCTAssertEqual(CompanyIdentifier.seikoEpson.description, #"Seiko Epson Corporation"#)
    
        // Integrated Silicon Solution Taiwan, Inc.
        XCTAssertEqual(CompanyIdentifier.integratedSiliconSolutionTaiwan.rawValue, 65)
        XCTAssertEqual(CompanyIdentifier.integratedSiliconSolutionTaiwan.name, #"Integrated Silicon Solution Taiwan, Inc."#)
        XCTAssertEqual(CompanyIdentifier.integratedSiliconSolutionTaiwan.description, #"Integrated Silicon Solution Taiwan, Inc."#)
    
        // CONWISE Technology Corporation Ltd
        XCTAssertEqual(CompanyIdentifier.conwiseTechnology.rawValue, 66)
        XCTAssertEqual(CompanyIdentifier.conwiseTechnology.name, #"CONWISE Technology Corporation Ltd"#)
        XCTAssertEqual(CompanyIdentifier.conwiseTechnology.description, #"CONWISE Technology Corporation Ltd"#)
    
        // PARROT AUTOMOTIVE SAS
        XCTAssertEqual(CompanyIdentifier.parrotAutomotives.rawValue, 67)
        XCTAssertEqual(CompanyIdentifier.parrotAutomotives.name, #"PARROT AUTOMOTIVE SAS"#)
        XCTAssertEqual(CompanyIdentifier.parrotAutomotives.description, #"PARROT AUTOMOTIVE SAS"#)
    
        // Socket Mobile
        XCTAssertEqual(CompanyIdentifier.socketMobile.rawValue, 68)
        XCTAssertEqual(CompanyIdentifier.socketMobile.name, #"Socket Mobile"#)
        XCTAssertEqual(CompanyIdentifier.socketMobile.description, #"Socket Mobile"#)
    
        // Atheros Communications, Inc.
        XCTAssertEqual(CompanyIdentifier.atherosCommunications.rawValue, 69)
        XCTAssertEqual(CompanyIdentifier.atherosCommunications.name, #"Atheros Communications, Inc."#)
        XCTAssertEqual(CompanyIdentifier.atherosCommunications.description, #"Atheros Communications, Inc."#)
    
        // MediaTek, Inc.
        XCTAssertEqual(CompanyIdentifier.mediatek.rawValue, 70)
        XCTAssertEqual(CompanyIdentifier.mediatek.name, #"MediaTek, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mediatek.description, #"MediaTek, Inc."#)
    
        // Bluegiga
        XCTAssertEqual(CompanyIdentifier.bluegiga.rawValue, 71)
        XCTAssertEqual(CompanyIdentifier.bluegiga.name, #"Bluegiga"#)
        XCTAssertEqual(CompanyIdentifier.bluegiga.description, #"Bluegiga"#)
    
        // Marvell Technology Group Ltd.
        XCTAssertEqual(CompanyIdentifier.marvellTechnologyGroup.rawValue, 72)
        XCTAssertEqual(CompanyIdentifier.marvellTechnologyGroup.name, #"Marvell Technology Group Ltd."#)
        XCTAssertEqual(CompanyIdentifier.marvellTechnologyGroup.description, #"Marvell Technology Group Ltd."#)
    
        // 3DSP Corporation
        XCTAssertEqual(CompanyIdentifier.company3Dsp.rawValue, 73)
        XCTAssertEqual(CompanyIdentifier.company3Dsp.name, #"3DSP Corporation"#)
        XCTAssertEqual(CompanyIdentifier.company3Dsp.description, #"3DSP Corporation"#)
    
        // Accel Semiconductor Ltd.
        XCTAssertEqual(CompanyIdentifier.accelSemiconductor.rawValue, 74)
        XCTAssertEqual(CompanyIdentifier.accelSemiconductor.name, #"Accel Semiconductor Ltd."#)
        XCTAssertEqual(CompanyIdentifier.accelSemiconductor.description, #"Accel Semiconductor Ltd."#)
    
        // Continental Automotive Systems
        XCTAssertEqual(CompanyIdentifier.continentalAutomotiveSystems.rawValue, 75)
        XCTAssertEqual(CompanyIdentifier.continentalAutomotiveSystems.name, #"Continental Automotive Systems"#)
        XCTAssertEqual(CompanyIdentifier.continentalAutomotiveSystems.description, #"Continental Automotive Systems"#)
    
        // Apple, Inc.
        XCTAssertEqual(CompanyIdentifier.apple.rawValue, 76)
        XCTAssertEqual(CompanyIdentifier.apple.name, #"Apple, Inc."#)
        XCTAssertEqual(CompanyIdentifier.apple.description, #"Apple, Inc."#)
    
        // Staccato Communications, Inc.
        XCTAssertEqual(CompanyIdentifier.staccatoCommunications.rawValue, 77)
        XCTAssertEqual(CompanyIdentifier.staccatoCommunications.name, #"Staccato Communications, Inc."#)
        XCTAssertEqual(CompanyIdentifier.staccatoCommunications.description, #"Staccato Communications, Inc."#)
    
        // Avago Technologies
        XCTAssertEqual(CompanyIdentifier.avagoTechnologies.rawValue, 78)
        XCTAssertEqual(CompanyIdentifier.avagoTechnologies.name, #"Avago Technologies"#)
        XCTAssertEqual(CompanyIdentifier.avagoTechnologies.description, #"Avago Technologies"#)
    
        // APT Ltd.
        XCTAssertEqual(CompanyIdentifier.apt.rawValue, 79)
        XCTAssertEqual(CompanyIdentifier.apt.name, #"APT Ltd."#)
        XCTAssertEqual(CompanyIdentifier.apt.description, #"APT Ltd."#)
    
        // SiRF Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.sirfTechnology.rawValue, 80)
        XCTAssertEqual(CompanyIdentifier.sirfTechnology.name, #"SiRF Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sirfTechnology.description, #"SiRF Technology, Inc."#)
    
        // Tzero Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.tzeroTechnologies.rawValue, 81)
        XCTAssertEqual(CompanyIdentifier.tzeroTechnologies.name, #"Tzero Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tzeroTechnologies.description, #"Tzero Technologies, Inc."#)
    
        // J&M Corporation
        XCTAssertEqual(CompanyIdentifier.jM.rawValue, 82)
        XCTAssertEqual(CompanyIdentifier.jM.name, #"J&M Corporation"#)
        XCTAssertEqual(CompanyIdentifier.jM.description, #"J&M Corporation"#)
    
        // Free2move AB
        XCTAssertEqual(CompanyIdentifier.free2Move.rawValue, 83)
        XCTAssertEqual(CompanyIdentifier.free2Move.name, #"Free2move AB"#)
        XCTAssertEqual(CompanyIdentifier.free2Move.description, #"Free2move AB"#)
    
        // 3DiJoy Corporation
        XCTAssertEqual(CompanyIdentifier.company3Dijoy.rawValue, 84)
        XCTAssertEqual(CompanyIdentifier.company3Dijoy.name, #"3DiJoy Corporation"#)
        XCTAssertEqual(CompanyIdentifier.company3Dijoy.description, #"3DiJoy Corporation"#)
    
        // Plantronics, Inc.
        XCTAssertEqual(CompanyIdentifier.plantronics.rawValue, 85)
        XCTAssertEqual(CompanyIdentifier.plantronics.name, #"Plantronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.plantronics.description, #"Plantronics, Inc."#)
    
        // Sony Ericsson Mobile Communications
        XCTAssertEqual(CompanyIdentifier.sonyEricssonMobileCommunications.rawValue, 86)
        XCTAssertEqual(CompanyIdentifier.sonyEricssonMobileCommunications.name, #"Sony Ericsson Mobile Communications"#)
        XCTAssertEqual(CompanyIdentifier.sonyEricssonMobileCommunications.description, #"Sony Ericsson Mobile Communications"#)
    
        // Harman International Industries, Inc.
        XCTAssertEqual(CompanyIdentifier.harmanInternationalIndustries.rawValue, 87)
        XCTAssertEqual(CompanyIdentifier.harmanInternationalIndustries.name, #"Harman International Industries, Inc."#)
        XCTAssertEqual(CompanyIdentifier.harmanInternationalIndustries.description, #"Harman International Industries, Inc."#)
    
        // Vizio, Inc.
        XCTAssertEqual(CompanyIdentifier.vizio.rawValue, 88)
        XCTAssertEqual(CompanyIdentifier.vizio.name, #"Vizio, Inc."#)
        XCTAssertEqual(CompanyIdentifier.vizio.description, #"Vizio, Inc."#)
    
        // Nordic Semiconductor ASA
        XCTAssertEqual(CompanyIdentifier.nordicSemiconductor.rawValue, 89)
        XCTAssertEqual(CompanyIdentifier.nordicSemiconductor.name, #"Nordic Semiconductor ASA"#)
        XCTAssertEqual(CompanyIdentifier.nordicSemiconductor.description, #"Nordic Semiconductor ASA"#)
    
        // EM Microelectronic-Marin SA
        XCTAssertEqual(CompanyIdentifier.emMicroelectronicMarin.rawValue, 90)
        XCTAssertEqual(CompanyIdentifier.emMicroelectronicMarin.name, #"EM Microelectronic-Marin SA"#)
        XCTAssertEqual(CompanyIdentifier.emMicroelectronicMarin.description, #"EM Microelectronic-Marin SA"#)
    
        // Ralink Technology Corporation
        XCTAssertEqual(CompanyIdentifier.ralinkTechnology.rawValue, 91)
        XCTAssertEqual(CompanyIdentifier.ralinkTechnology.name, #"Ralink Technology Corporation"#)
        XCTAssertEqual(CompanyIdentifier.ralinkTechnology.description, #"Ralink Technology Corporation"#)
    
        // Belkin International, Inc.
        XCTAssertEqual(CompanyIdentifier.belkinInternational.rawValue, 92)
        XCTAssertEqual(CompanyIdentifier.belkinInternational.name, #"Belkin International, Inc."#)
        XCTAssertEqual(CompanyIdentifier.belkinInternational.description, #"Belkin International, Inc."#)
    
        // Realtek Semiconductor Corporation
        XCTAssertEqual(CompanyIdentifier.realtekSemiconductor.rawValue, 93)
        XCTAssertEqual(CompanyIdentifier.realtekSemiconductor.name, #"Realtek Semiconductor Corporation"#)
        XCTAssertEqual(CompanyIdentifier.realtekSemiconductor.description, #"Realtek Semiconductor Corporation"#)
    
        // Stonestreet One, LLC
        XCTAssertEqual(CompanyIdentifier.stonestreetOne.rawValue, 94)
        XCTAssertEqual(CompanyIdentifier.stonestreetOne.name, #"Stonestreet One, LLC"#)
        XCTAssertEqual(CompanyIdentifier.stonestreetOne.description, #"Stonestreet One, LLC"#)
    
        // Wicentric, Inc.
        XCTAssertEqual(CompanyIdentifier.wicentric.rawValue, 95)
        XCTAssertEqual(CompanyIdentifier.wicentric.name, #"Wicentric, Inc."#)
        XCTAssertEqual(CompanyIdentifier.wicentric.description, #"Wicentric, Inc."#)
    
        // RivieraWaves S.A.S
        XCTAssertEqual(CompanyIdentifier.rivierawaves.rawValue, 96)
        XCTAssertEqual(CompanyIdentifier.rivierawaves.name, #"RivieraWaves S.A.S"#)
        XCTAssertEqual(CompanyIdentifier.rivierawaves.description, #"RivieraWaves S.A.S"#)
    
        // RDA Microelectronics
        XCTAssertEqual(CompanyIdentifier.rdaMicroelectronics.rawValue, 97)
        XCTAssertEqual(CompanyIdentifier.rdaMicroelectronics.name, #"RDA Microelectronics"#)
        XCTAssertEqual(CompanyIdentifier.rdaMicroelectronics.description, #"RDA Microelectronics"#)
    
        // Gibson Guitars
        XCTAssertEqual(CompanyIdentifier.gibsonGuitars.rawValue, 98)
        XCTAssertEqual(CompanyIdentifier.gibsonGuitars.name, #"Gibson Guitars"#)
        XCTAssertEqual(CompanyIdentifier.gibsonGuitars.description, #"Gibson Guitars"#)
    
        // MiCommand Inc.
        XCTAssertEqual(CompanyIdentifier.micommand.rawValue, 99)
        XCTAssertEqual(CompanyIdentifier.micommand.name, #"MiCommand Inc."#)
        XCTAssertEqual(CompanyIdentifier.micommand.description, #"MiCommand Inc."#)
    
        // Band XI International, LLC
        XCTAssertEqual(CompanyIdentifier.bandXiInternational.rawValue, 100)
        XCTAssertEqual(CompanyIdentifier.bandXiInternational.name, #"Band XI International, LLC"#)
        XCTAssertEqual(CompanyIdentifier.bandXiInternational.description, #"Band XI International, LLC"#)
    
        // HP, Inc.
        XCTAssertEqual(CompanyIdentifier.hp.rawValue, 101)
        XCTAssertEqual(CompanyIdentifier.hp.name, #"HP, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hp.description, #"HP, Inc."#)
    
        // 9Solutions Oy
        XCTAssertEqual(CompanyIdentifier.company9Solutions.rawValue, 102)
        XCTAssertEqual(CompanyIdentifier.company9Solutions.name, #"9Solutions Oy"#)
        XCTAssertEqual(CompanyIdentifier.company9Solutions.description, #"9Solutions Oy"#)
    
        // GN Netcom A/S
        XCTAssertEqual(CompanyIdentifier.gnNetcom.rawValue, 103)
        XCTAssertEqual(CompanyIdentifier.gnNetcom.name, #"GN Netcom A/S"#)
        XCTAssertEqual(CompanyIdentifier.gnNetcom.description, #"GN Netcom A/S"#)
    
        // General Motors
        XCTAssertEqual(CompanyIdentifier.generalMotors.rawValue, 104)
        XCTAssertEqual(CompanyIdentifier.generalMotors.name, #"General Motors"#)
        XCTAssertEqual(CompanyIdentifier.generalMotors.description, #"General Motors"#)
    
        // A&D Engineering, Inc.
        XCTAssertEqual(CompanyIdentifier.aDEngineering.rawValue, 105)
        XCTAssertEqual(CompanyIdentifier.aDEngineering.name, #"A&D Engineering, Inc."#)
        XCTAssertEqual(CompanyIdentifier.aDEngineering.description, #"A&D Engineering, Inc."#)
    
        // MindTree Ltd.
        XCTAssertEqual(CompanyIdentifier.mindtree.rawValue, 106)
        XCTAssertEqual(CompanyIdentifier.mindtree.name, #"MindTree Ltd."#)
        XCTAssertEqual(CompanyIdentifier.mindtree.description, #"MindTree Ltd."#)
    
        // Polar Electro OY
        XCTAssertEqual(CompanyIdentifier.polarElectro.rawValue, 107)
        XCTAssertEqual(CompanyIdentifier.polarElectro.name, #"Polar Electro OY"#)
        XCTAssertEqual(CompanyIdentifier.polarElectro.description, #"Polar Electro OY"#)
    
        // Beautiful Enterprise Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beautifulEnterprise.rawValue, 108)
        XCTAssertEqual(CompanyIdentifier.beautifulEnterprise.name, #"Beautiful Enterprise Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beautifulEnterprise.description, #"Beautiful Enterprise Co., Ltd."#)
    
        // BriarTek, Inc
        XCTAssertEqual(CompanyIdentifier.briartek.rawValue, 109)
        XCTAssertEqual(CompanyIdentifier.briartek.name, #"BriarTek, Inc"#)
        XCTAssertEqual(CompanyIdentifier.briartek.description, #"BriarTek, Inc"#)
    
        // Summit Data Communications, Inc.
        XCTAssertEqual(CompanyIdentifier.summitDataCommunications.rawValue, 110)
        XCTAssertEqual(CompanyIdentifier.summitDataCommunications.name, #"Summit Data Communications, Inc."#)
        XCTAssertEqual(CompanyIdentifier.summitDataCommunications.description, #"Summit Data Communications, Inc."#)
    
        // Sound ID
        XCTAssertEqual(CompanyIdentifier.soundId.rawValue, 111)
        XCTAssertEqual(CompanyIdentifier.soundId.name, #"Sound ID"#)
        XCTAssertEqual(CompanyIdentifier.soundId.description, #"Sound ID"#)
    
        // Monster, LLC
        XCTAssertEqual(CompanyIdentifier.monster.rawValue, 112)
        XCTAssertEqual(CompanyIdentifier.monster.name, #"Monster, LLC"#)
        XCTAssertEqual(CompanyIdentifier.monster.description, #"Monster, LLC"#)
    
        // connectBlue AB
        XCTAssertEqual(CompanyIdentifier.connectblue.rawValue, 113)
        XCTAssertEqual(CompanyIdentifier.connectblue.name, #"connectBlue AB"#)
        XCTAssertEqual(CompanyIdentifier.connectblue.description, #"connectBlue AB"#)
    
        // ShangHai Super Smart Electronics Co. Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiSuperSmartElectronics.rawValue, 114)
        XCTAssertEqual(CompanyIdentifier.shanghaiSuperSmartElectronics.name, #"ShangHai Super Smart Electronics Co. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiSuperSmartElectronics.description, #"ShangHai Super Smart Electronics Co. Ltd."#)
    
        // Group Sense Ltd.
        XCTAssertEqual(CompanyIdentifier.groupSense.rawValue, 115)
        XCTAssertEqual(CompanyIdentifier.groupSense.name, #"Group Sense Ltd."#)
        XCTAssertEqual(CompanyIdentifier.groupSense.description, #"Group Sense Ltd."#)
    
        // Zomm, LLC
        XCTAssertEqual(CompanyIdentifier.zomm.rawValue, 116)
        XCTAssertEqual(CompanyIdentifier.zomm.name, #"Zomm, LLC"#)
        XCTAssertEqual(CompanyIdentifier.zomm.description, #"Zomm, LLC"#)
    
        // Samsung Electronics Co. Ltd.
        XCTAssertEqual(CompanyIdentifier.samsungElectronics.rawValue, 117)
        XCTAssertEqual(CompanyIdentifier.samsungElectronics.name, #"Samsung Electronics Co. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.samsungElectronics.description, #"Samsung Electronics Co. Ltd."#)
    
        // Creative Technology Ltd.
        XCTAssertEqual(CompanyIdentifier.creativeTechnology.rawValue, 118)
        XCTAssertEqual(CompanyIdentifier.creativeTechnology.name, #"Creative Technology Ltd."#)
        XCTAssertEqual(CompanyIdentifier.creativeTechnology.description, #"Creative Technology Ltd."#)
    
        // Laird Technologies
        XCTAssertEqual(CompanyIdentifier.lairdTechnologies.rawValue, 119)
        XCTAssertEqual(CompanyIdentifier.lairdTechnologies.name, #"Laird Technologies"#)
        XCTAssertEqual(CompanyIdentifier.lairdTechnologies.description, #"Laird Technologies"#)
    
        // Nike, Inc.
        XCTAssertEqual(CompanyIdentifier.nike.rawValue, 120)
        XCTAssertEqual(CompanyIdentifier.nike.name, #"Nike, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nike.description, #"Nike, Inc."#)
    
        // lesswire AG
        XCTAssertEqual(CompanyIdentifier.lesswire.rawValue, 121)
        XCTAssertEqual(CompanyIdentifier.lesswire.name, #"lesswire AG"#)
        XCTAssertEqual(CompanyIdentifier.lesswire.description, #"lesswire AG"#)
    
        // MStar Semiconductor, Inc.
        XCTAssertEqual(CompanyIdentifier.mstarSemiconductor.rawValue, 122)
        XCTAssertEqual(CompanyIdentifier.mstarSemiconductor.name, #"MStar Semiconductor, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mstarSemiconductor.description, #"MStar Semiconductor, Inc."#)
    
        // Hanlynn Technologies
        XCTAssertEqual(CompanyIdentifier.hanlynnTechnologies.rawValue, 123)
        XCTAssertEqual(CompanyIdentifier.hanlynnTechnologies.name, #"Hanlynn Technologies"#)
        XCTAssertEqual(CompanyIdentifier.hanlynnTechnologies.description, #"Hanlynn Technologies"#)
    
        // A & R Cambridge
        XCTAssertEqual(CompanyIdentifier.aRCambridge.rawValue, 124)
        XCTAssertEqual(CompanyIdentifier.aRCambridge.name, #"A & R Cambridge"#)
        XCTAssertEqual(CompanyIdentifier.aRCambridge.description, #"A & R Cambridge"#)
    
        // Seers Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.seersTechnology.rawValue, 125)
        XCTAssertEqual(CompanyIdentifier.seersTechnology.name, #"Seers Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.seersTechnology.description, #"Seers Technology Co., Ltd."#)
    
        // Sports Tracking Technologies Ltd.
        XCTAssertEqual(CompanyIdentifier.sportsTrackingTechnologies.rawValue, 126)
        XCTAssertEqual(CompanyIdentifier.sportsTrackingTechnologies.name, #"Sports Tracking Technologies Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sportsTrackingTechnologies.description, #"Sports Tracking Technologies Ltd."#)
    
        // Autonet Mobile
        XCTAssertEqual(CompanyIdentifier.autonetMobile.rawValue, 127)
        XCTAssertEqual(CompanyIdentifier.autonetMobile.name, #"Autonet Mobile"#)
        XCTAssertEqual(CompanyIdentifier.autonetMobile.description, #"Autonet Mobile"#)
    
        // DeLorme Publishing Company, Inc.
        XCTAssertEqual(CompanyIdentifier.delormePublishingCompany.rawValue, 128)
        XCTAssertEqual(CompanyIdentifier.delormePublishingCompany.name, #"DeLorme Publishing Company, Inc."#)
        XCTAssertEqual(CompanyIdentifier.delormePublishingCompany.description, #"DeLorme Publishing Company, Inc."#)
    
        // WuXi Vimicro
        XCTAssertEqual(CompanyIdentifier.wuxiVimicro.rawValue, 129)
        XCTAssertEqual(CompanyIdentifier.wuxiVimicro.name, #"WuXi Vimicro"#)
        XCTAssertEqual(CompanyIdentifier.wuxiVimicro.description, #"WuXi Vimicro"#)
    
        // Sennheiser Communications A/S
        XCTAssertEqual(CompanyIdentifier.sennheiserCommunications.rawValue, 130)
        XCTAssertEqual(CompanyIdentifier.sennheiserCommunications.name, #"Sennheiser Communications A/S"#)
        XCTAssertEqual(CompanyIdentifier.sennheiserCommunications.description, #"Sennheiser Communications A/S"#)
    
        // TimeKeeping Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.timekeepingSystems.rawValue, 131)
        XCTAssertEqual(CompanyIdentifier.timekeepingSystems.name, #"TimeKeeping Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.timekeepingSystems.description, #"TimeKeeping Systems, Inc."#)
    
        // Ludus Helsinki Ltd.
        XCTAssertEqual(CompanyIdentifier.ludusHelsinki.rawValue, 132)
        XCTAssertEqual(CompanyIdentifier.ludusHelsinki.name, #"Ludus Helsinki Ltd."#)
        XCTAssertEqual(CompanyIdentifier.ludusHelsinki.description, #"Ludus Helsinki Ltd."#)
    
        // BlueRadios, Inc.
        XCTAssertEqual(CompanyIdentifier.blueradios.rawValue, 133)
        XCTAssertEqual(CompanyIdentifier.blueradios.name, #"BlueRadios, Inc."#)
        XCTAssertEqual(CompanyIdentifier.blueradios.description, #"BlueRadios, Inc."#)
    
        // Equinux AG
        XCTAssertEqual(CompanyIdentifier.equinux.rawValue, 134)
        XCTAssertEqual(CompanyIdentifier.equinux.name, #"Equinux AG"#)
        XCTAssertEqual(CompanyIdentifier.equinux.description, #"Equinux AG"#)
    
        // Garmin International, Inc.
        XCTAssertEqual(CompanyIdentifier.garminInternational.rawValue, 135)
        XCTAssertEqual(CompanyIdentifier.garminInternational.name, #"Garmin International, Inc."#)
        XCTAssertEqual(CompanyIdentifier.garminInternational.description, #"Garmin International, Inc."#)
    
        // Ecotest
        XCTAssertEqual(CompanyIdentifier.ecotest.rawValue, 136)
        XCTAssertEqual(CompanyIdentifier.ecotest.name, #"Ecotest"#)
        XCTAssertEqual(CompanyIdentifier.ecotest.description, #"Ecotest"#)
    
        // GN ReSound A/S
        XCTAssertEqual(CompanyIdentifier.gnResound.rawValue, 137)
        XCTAssertEqual(CompanyIdentifier.gnResound.name, #"GN ReSound A/S"#)
        XCTAssertEqual(CompanyIdentifier.gnResound.description, #"GN ReSound A/S"#)
    
        // Jawbone
        XCTAssertEqual(CompanyIdentifier.jawbone.rawValue, 138)
        XCTAssertEqual(CompanyIdentifier.jawbone.name, #"Jawbone"#)
        XCTAssertEqual(CompanyIdentifier.jawbone.description, #"Jawbone"#)
    
        // Topcon Positioning Systems, LLC
        XCTAssertEqual(CompanyIdentifier.topconPositioningSystems.rawValue, 139)
        XCTAssertEqual(CompanyIdentifier.topconPositioningSystems.name, #"Topcon Positioning Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.topconPositioningSystems.description, #"Topcon Positioning Systems, LLC"#)
    
        // Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)
        XCTAssertEqual(CompanyIdentifier.gimbal.rawValue, 140)
        XCTAssertEqual(CompanyIdentifier.gimbal.name, #"Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)"#)
        XCTAssertEqual(CompanyIdentifier.gimbal.description, #"Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)"#)
    
        // Zscan Software
        XCTAssertEqual(CompanyIdentifier.zscanSoftware.rawValue, 141)
        XCTAssertEqual(CompanyIdentifier.zscanSoftware.name, #"Zscan Software"#)
        XCTAssertEqual(CompanyIdentifier.zscanSoftware.description, #"Zscan Software"#)
    
        // Quintic Corp
        XCTAssertEqual(CompanyIdentifier.quintic.rawValue, 142)
        XCTAssertEqual(CompanyIdentifier.quintic.name, #"Quintic Corp"#)
        XCTAssertEqual(CompanyIdentifier.quintic.description, #"Quintic Corp"#)
    
        // Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)
        XCTAssertEqual(CompanyIdentifier.telitWirelessSolutions.rawValue, 143)
        XCTAssertEqual(CompanyIdentifier.telitWirelessSolutions.name, #"Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)"#)
        XCTAssertEqual(CompanyIdentifier.telitWirelessSolutions.description, #"Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)"#)
    
        // Funai Electric Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.funaiElectric.rawValue, 144)
        XCTAssertEqual(CompanyIdentifier.funaiElectric.name, #"Funai Electric Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.funaiElectric.description, #"Funai Electric Co., Ltd."#)
    
        // Advanced PANMOBIL systems GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.advancedPanmobilSystems.rawValue, 145)
        XCTAssertEqual(CompanyIdentifier.advancedPanmobilSystems.name, #"Advanced PANMOBIL systems GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.advancedPanmobilSystems.description, #"Advanced PANMOBIL systems GmbH & Co. KG"#)
    
        // ThinkOptics, Inc.
        XCTAssertEqual(CompanyIdentifier.thinkoptics.rawValue, 146)
        XCTAssertEqual(CompanyIdentifier.thinkoptics.name, #"ThinkOptics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.thinkoptics.description, #"ThinkOptics, Inc."#)
    
        // Universal Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.universalElectronics.rawValue, 147)
        XCTAssertEqual(CompanyIdentifier.universalElectronics.name, #"Universal Electronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.universalElectronics.description, #"Universal Electronics, Inc."#)
    
        // Airoha Technology Corp.
        XCTAssertEqual(CompanyIdentifier.airohaTechnology.rawValue, 148)
        XCTAssertEqual(CompanyIdentifier.airohaTechnology.name, #"Airoha Technology Corp."#)
        XCTAssertEqual(CompanyIdentifier.airohaTechnology.description, #"Airoha Technology Corp."#)
    
        // NEC Lighting, Ltd.
        XCTAssertEqual(CompanyIdentifier.necLighting.rawValue, 149)
        XCTAssertEqual(CompanyIdentifier.necLighting.name, #"NEC Lighting, Ltd."#)
        XCTAssertEqual(CompanyIdentifier.necLighting.description, #"NEC Lighting, Ltd."#)
    
        // ODM Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.odmTechnology.rawValue, 150)
        XCTAssertEqual(CompanyIdentifier.odmTechnology.name, #"ODM Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.odmTechnology.description, #"ODM Technology, Inc."#)
    
        // ConnecteDevice Ltd.
        XCTAssertEqual(CompanyIdentifier.connectedevice.rawValue, 151)
        XCTAssertEqual(CompanyIdentifier.connectedevice.name, #"ConnecteDevice Ltd."#)
        XCTAssertEqual(CompanyIdentifier.connectedevice.description, #"ConnecteDevice Ltd."#)
    
        // zero1.tv GmbH
        XCTAssertEqual(CompanyIdentifier.zero1Tv.rawValue, 152)
        XCTAssertEqual(CompanyIdentifier.zero1Tv.name, #"zero1.tv GmbH"#)
        XCTAssertEqual(CompanyIdentifier.zero1Tv.description, #"zero1.tv GmbH"#)
    
        // i.Tech Dynamic Global Distribution Ltd.
        XCTAssertEqual(CompanyIdentifier.iTechDynamicGlobalDistribution.rawValue, 153)
        XCTAssertEqual(CompanyIdentifier.iTechDynamicGlobalDistribution.name, #"i.Tech Dynamic Global Distribution Ltd."#)
        XCTAssertEqual(CompanyIdentifier.iTechDynamicGlobalDistribution.description, #"i.Tech Dynamic Global Distribution Ltd."#)
    
        // Alpwise
        XCTAssertEqual(CompanyIdentifier.alpwise.rawValue, 154)
        XCTAssertEqual(CompanyIdentifier.alpwise.name, #"Alpwise"#)
        XCTAssertEqual(CompanyIdentifier.alpwise.description, #"Alpwise"#)
    
        // Jiangsu Toppower Automotive Electronics Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.rawValue, 155)
        XCTAssertEqual(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.name, #"Jiangsu Toppower Automotive Electronics Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.description, #"Jiangsu Toppower Automotive Electronics Co., Ltd."#)
    
        // Colorfy, Inc.
        XCTAssertEqual(CompanyIdentifier.colorfy.rawValue, 156)
        XCTAssertEqual(CompanyIdentifier.colorfy.name, #"Colorfy, Inc."#)
        XCTAssertEqual(CompanyIdentifier.colorfy.description, #"Colorfy, Inc."#)
    
        // Geoforce Inc.
        XCTAssertEqual(CompanyIdentifier.geoforce.rawValue, 157)
        XCTAssertEqual(CompanyIdentifier.geoforce.name, #"Geoforce Inc."#)
        XCTAssertEqual(CompanyIdentifier.geoforce.description, #"Geoforce Inc."#)
    
        // Bose Corporation
        XCTAssertEqual(CompanyIdentifier.bose.rawValue, 158)
        XCTAssertEqual(CompanyIdentifier.bose.name, #"Bose Corporation"#)
        XCTAssertEqual(CompanyIdentifier.bose.description, #"Bose Corporation"#)
    
        // Suunto Oy
        XCTAssertEqual(CompanyIdentifier.suunto.rawValue, 159)
        XCTAssertEqual(CompanyIdentifier.suunto.name, #"Suunto Oy"#)
        XCTAssertEqual(CompanyIdentifier.suunto.description, #"Suunto Oy"#)
    
        // Kensington Computer Products Group
        XCTAssertEqual(CompanyIdentifier.kensingtonComputerProductsGroup.rawValue, 160)
        XCTAssertEqual(CompanyIdentifier.kensingtonComputerProductsGroup.name, #"Kensington Computer Products Group"#)
        XCTAssertEqual(CompanyIdentifier.kensingtonComputerProductsGroup.description, #"Kensington Computer Products Group"#)
    
        // SR-Medizinelektronik
        XCTAssertEqual(CompanyIdentifier.srMedizinelektronik.rawValue, 161)
        XCTAssertEqual(CompanyIdentifier.srMedizinelektronik.name, #"SR-Medizinelektronik"#)
        XCTAssertEqual(CompanyIdentifier.srMedizinelektronik.description, #"SR-Medizinelektronik"#)
    
        // Vertu Corporation Limited
        XCTAssertEqual(CompanyIdentifier.vertu.rawValue, 162)
        XCTAssertEqual(CompanyIdentifier.vertu.name, #"Vertu Corporation Limited"#)
        XCTAssertEqual(CompanyIdentifier.vertu.description, #"Vertu Corporation Limited"#)
    
        // Meta Watch Ltd.
        XCTAssertEqual(CompanyIdentifier.metaWatch.rawValue, 163)
        XCTAssertEqual(CompanyIdentifier.metaWatch.name, #"Meta Watch Ltd."#)
        XCTAssertEqual(CompanyIdentifier.metaWatch.description, #"Meta Watch Ltd."#)
    
        // LINAK A/S
        XCTAssertEqual(CompanyIdentifier.linak.rawValue, 164)
        XCTAssertEqual(CompanyIdentifier.linak.name, #"LINAK A/S"#)
        XCTAssertEqual(CompanyIdentifier.linak.description, #"LINAK A/S"#)
    
        // OTL Dynamics LLC
        XCTAssertEqual(CompanyIdentifier.otlDynamics.rawValue, 165)
        XCTAssertEqual(CompanyIdentifier.otlDynamics.name, #"OTL Dynamics LLC"#)
        XCTAssertEqual(CompanyIdentifier.otlDynamics.description, #"OTL Dynamics LLC"#)
    
        // Panda Ocean Inc.
        XCTAssertEqual(CompanyIdentifier.pandaOcean.rawValue, 166)
        XCTAssertEqual(CompanyIdentifier.pandaOcean.name, #"Panda Ocean Inc."#)
        XCTAssertEqual(CompanyIdentifier.pandaOcean.description, #"Panda Ocean Inc."#)
    
        // Visteon Corporation
        XCTAssertEqual(CompanyIdentifier.visteon.rawValue, 167)
        XCTAssertEqual(CompanyIdentifier.visteon.name, #"Visteon Corporation"#)
        XCTAssertEqual(CompanyIdentifier.visteon.description, #"Visteon Corporation"#)
    
        // ARP Devices Limited
        XCTAssertEqual(CompanyIdentifier.arpDevices.rawValue, 168)
        XCTAssertEqual(CompanyIdentifier.arpDevices.name, #"ARP Devices Limited"#)
        XCTAssertEqual(CompanyIdentifier.arpDevices.description, #"ARP Devices Limited"#)
    
        // MARELLI EUROPE S.P.A. (formerly Magneti Marelli S.p.A.)
        XCTAssertEqual(CompanyIdentifier.marelliEurope.rawValue, 169)
        XCTAssertEqual(CompanyIdentifier.marelliEurope.name, #"MARELLI EUROPE S.P.A. (formerly Magneti Marelli S.p.A.)"#)
        XCTAssertEqual(CompanyIdentifier.marelliEurope.description, #"MARELLI EUROPE S.P.A. (formerly Magneti Marelli S.p.A.)"#)
    
        // CAEN RFID srl
        XCTAssertEqual(CompanyIdentifier.caenRfid.rawValue, 170)
        XCTAssertEqual(CompanyIdentifier.caenRfid.name, #"CAEN RFID srl"#)
        XCTAssertEqual(CompanyIdentifier.caenRfid.description, #"CAEN RFID srl"#)
    
        // Ingenieur-Systemgruppe Zahn GmbH
        XCTAssertEqual(CompanyIdentifier.ingenieurSystemgruppeZahn.rawValue, 171)
        XCTAssertEqual(CompanyIdentifier.ingenieurSystemgruppeZahn.name, #"Ingenieur-Systemgruppe Zahn GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ingenieurSystemgruppeZahn.description, #"Ingenieur-Systemgruppe Zahn GmbH"#)
    
        // Green Throttle Games
        XCTAssertEqual(CompanyIdentifier.greenThrottleGames.rawValue, 172)
        XCTAssertEqual(CompanyIdentifier.greenThrottleGames.name, #"Green Throttle Games"#)
        XCTAssertEqual(CompanyIdentifier.greenThrottleGames.description, #"Green Throttle Games"#)
    
        // Peter Systemtechnik GmbH
        XCTAssertEqual(CompanyIdentifier.peterSystemtechnik.rawValue, 173)
        XCTAssertEqual(CompanyIdentifier.peterSystemtechnik.name, #"Peter Systemtechnik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.peterSystemtechnik.description, #"Peter Systemtechnik GmbH"#)
    
        // Omegawave Oy
        XCTAssertEqual(CompanyIdentifier.omegawave.rawValue, 174)
        XCTAssertEqual(CompanyIdentifier.omegawave.name, #"Omegawave Oy"#)
        XCTAssertEqual(CompanyIdentifier.omegawave.description, #"Omegawave Oy"#)
    
        // Cinetix
        XCTAssertEqual(CompanyIdentifier.cinetix.rawValue, 175)
        XCTAssertEqual(CompanyIdentifier.cinetix.name, #"Cinetix"#)
        XCTAssertEqual(CompanyIdentifier.cinetix.description, #"Cinetix"#)
    
        // Passif Semiconductor Corp
        XCTAssertEqual(CompanyIdentifier.passifSemiconductor.rawValue, 176)
        XCTAssertEqual(CompanyIdentifier.passifSemiconductor.name, #"Passif Semiconductor Corp"#)
        XCTAssertEqual(CompanyIdentifier.passifSemiconductor.description, #"Passif Semiconductor Corp"#)
    
        // Saris Cycling Group, Inc
        XCTAssertEqual(CompanyIdentifier.sarisCyclingGroup.rawValue, 177)
        XCTAssertEqual(CompanyIdentifier.sarisCyclingGroup.name, #"Saris Cycling Group, Inc"#)
        XCTAssertEqual(CompanyIdentifier.sarisCyclingGroup.description, #"Saris Cycling Group, Inc"#)
    
        // ​Bekey A/S
        XCTAssertEqual(CompanyIdentifier.bekey.rawValue, 178)
        XCTAssertEqual(CompanyIdentifier.bekey.name, #"​Bekey A/S"#)
        XCTAssertEqual(CompanyIdentifier.bekey.description, #"​Bekey A/S"#)
    
        // ​Clarinox Technologies Pty. Ltd.
        XCTAssertEqual(CompanyIdentifier.clarinoxTechnologiesPty.rawValue, 179)
        XCTAssertEqual(CompanyIdentifier.clarinoxTechnologiesPty.name, #"​Clarinox Technologies Pty. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.clarinoxTechnologiesPty.description, #"​Clarinox Technologies Pty. Ltd."#)
    
        // ​BDE Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.bdeTechnology.rawValue, 180)
        XCTAssertEqual(CompanyIdentifier.bdeTechnology.name, #"​BDE Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bdeTechnology.description, #"​BDE Technology Co., Ltd."#)
    
        // Swirl Networks
        XCTAssertEqual(CompanyIdentifier.swirlNetworks.rawValue, 181)
        XCTAssertEqual(CompanyIdentifier.swirlNetworks.name, #"Swirl Networks"#)
        XCTAssertEqual(CompanyIdentifier.swirlNetworks.description, #"Swirl Networks"#)
    
        // ​Meso international
        XCTAssertEqual(CompanyIdentifier.mesoInternational.rawValue, 182)
        XCTAssertEqual(CompanyIdentifier.mesoInternational.name, #"​Meso international"#)
        XCTAssertEqual(CompanyIdentifier.mesoInternational.description, #"​Meso international"#)
    
        // ​TreLab Ltd
        XCTAssertEqual(CompanyIdentifier.trelab.rawValue, 183)
        XCTAssertEqual(CompanyIdentifier.trelab.name, #"​TreLab Ltd"#)
        XCTAssertEqual(CompanyIdentifier.trelab.description, #"​TreLab Ltd"#)
    
        // ​Qualcomm Innovation Center, Inc. (QuIC)
        XCTAssertEqual(CompanyIdentifier.qualcommInnovationCenterQuic.rawValue, 184)
        XCTAssertEqual(CompanyIdentifier.qualcommInnovationCenterQuic.name, #"​Qualcomm Innovation Center, Inc. (QuIC)"#)
        XCTAssertEqual(CompanyIdentifier.qualcommInnovationCenterQuic.description, #"​Qualcomm Innovation Center, Inc. (QuIC)"#)
    
        // ​​Johnson Controls, Inc.
        XCTAssertEqual(CompanyIdentifier.johnsonControls.rawValue, 185)
        XCTAssertEqual(CompanyIdentifier.johnsonControls.name, #"​​Johnson Controls, Inc."#)
        XCTAssertEqual(CompanyIdentifier.johnsonControls.description, #"​​Johnson Controls, Inc."#)
    
        // ​Starkey Laboratories Inc.
        XCTAssertEqual(CompanyIdentifier.starkeyLaboratories.rawValue, 186)
        XCTAssertEqual(CompanyIdentifier.starkeyLaboratories.name, #"​Starkey Laboratories Inc."#)
        XCTAssertEqual(CompanyIdentifier.starkeyLaboratories.description, #"​Starkey Laboratories Inc."#)
    
        // ​​S-Power Electronics Limited
        XCTAssertEqual(CompanyIdentifier.sPowerElectronics.rawValue, 187)
        XCTAssertEqual(CompanyIdentifier.sPowerElectronics.name, #"​​S-Power Electronics Limited"#)
        XCTAssertEqual(CompanyIdentifier.sPowerElectronics.description, #"​​S-Power Electronics Limited"#)
    
        // ​​Ace Sensor Inc
        XCTAssertEqual(CompanyIdentifier.aceSensor.rawValue, 188)
        XCTAssertEqual(CompanyIdentifier.aceSensor.name, #"​​Ace Sensor Inc"#)
        XCTAssertEqual(CompanyIdentifier.aceSensor.description, #"​​Ace Sensor Inc"#)
    
        // ​​Aplix Corporation
        XCTAssertEqual(CompanyIdentifier.aplix.rawValue, 189)
        XCTAssertEqual(CompanyIdentifier.aplix.name, #"​​Aplix Corporation"#)
        XCTAssertEqual(CompanyIdentifier.aplix.description, #"​​Aplix Corporation"#)
    
        // ​​AAMP of America
        XCTAssertEqual(CompanyIdentifier.aampOfAmerica.rawValue, 190)
        XCTAssertEqual(CompanyIdentifier.aampOfAmerica.name, #"​​AAMP of America"#)
        XCTAssertEqual(CompanyIdentifier.aampOfAmerica.description, #"​​AAMP of America"#)
    
        // ​​Stalmart Technology Limited
        XCTAssertEqual(CompanyIdentifier.stalmartTechnology.rawValue, 191)
        XCTAssertEqual(CompanyIdentifier.stalmartTechnology.name, #"​​Stalmart Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.stalmartTechnology.description, #"​​Stalmart Technology Limited"#)
    
        // ​​AMICCOM Electronics Corporation
        XCTAssertEqual(CompanyIdentifier.amiccomElectronics.rawValue, 192)
        XCTAssertEqual(CompanyIdentifier.amiccomElectronics.name, #"​​AMICCOM Electronics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.amiccomElectronics.description, #"​​AMICCOM Electronics Corporation"#)
    
        // ​​Shenzhen Excelsecu Data Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenExcelsecuDataTechnology.rawValue, 193)
        XCTAssertEqual(CompanyIdentifier.shenzhenExcelsecuDataTechnology.name, #"​​Shenzhen Excelsecu Data Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenExcelsecuDataTechnology.description, #"​​Shenzhen Excelsecu Data Technology Co.,Ltd"#)
    
        // ​​Geneq Inc.
        XCTAssertEqual(CompanyIdentifier.geneq.rawValue, 194)
        XCTAssertEqual(CompanyIdentifier.geneq.name, #"​​Geneq Inc."#)
        XCTAssertEqual(CompanyIdentifier.geneq.description, #"​​Geneq Inc."#)
    
        // ​​adidas AG
        XCTAssertEqual(CompanyIdentifier.adidas.rawValue, 195)
        XCTAssertEqual(CompanyIdentifier.adidas.name, #"​​adidas AG"#)
        XCTAssertEqual(CompanyIdentifier.adidas.description, #"​​adidas AG"#)
    
        // ​​LG Electronics
        XCTAssertEqual(CompanyIdentifier.lgElectronics.rawValue, 196)
        XCTAssertEqual(CompanyIdentifier.lgElectronics.name, #"​​LG Electronics​"#)
        XCTAssertEqual(CompanyIdentifier.lgElectronics.description, #"​​LG Electronics​"#)
    
        // ​Onset Computer Corporation
        XCTAssertEqual(CompanyIdentifier.onsetComputer.rawValue, 197)
        XCTAssertEqual(CompanyIdentifier.onsetComputer.name, #"​Onset Computer Corporation"#)
        XCTAssertEqual(CompanyIdentifier.onsetComputer.description, #"​Onset Computer Corporation"#)
    
        // ​Selfly BV
        XCTAssertEqual(CompanyIdentifier.selfly.rawValue, 198)
        XCTAssertEqual(CompanyIdentifier.selfly.name, #"​Selfly BV"#)
        XCTAssertEqual(CompanyIdentifier.selfly.description, #"​Selfly BV"#)
    
        // ​Quuppa Oy.
        XCTAssertEqual(CompanyIdentifier.quuppa.rawValue, 199)
        XCTAssertEqual(CompanyIdentifier.quuppa.name, #"​Quuppa Oy."#)
        XCTAssertEqual(CompanyIdentifier.quuppa.description, #"​Quuppa Oy."#)
    
        // GeLo Inc
        XCTAssertEqual(CompanyIdentifier.gelo.rawValue, 200)
        XCTAssertEqual(CompanyIdentifier.gelo.name, #"GeLo Inc"#)
        XCTAssertEqual(CompanyIdentifier.gelo.description, #"GeLo Inc"#)
    
        // Evluma
        XCTAssertEqual(CompanyIdentifier.evluma.rawValue, 201)
        XCTAssertEqual(CompanyIdentifier.evluma.name, #"Evluma"#)
        XCTAssertEqual(CompanyIdentifier.evluma.description, #"Evluma"#)
    
        // MC10
        XCTAssertEqual(CompanyIdentifier.mc10.rawValue, 202)
        XCTAssertEqual(CompanyIdentifier.mc10.name, #"MC10"#)
        XCTAssertEqual(CompanyIdentifier.mc10.description, #"MC10"#)
    
        // Binauric SE
        XCTAssertEqual(CompanyIdentifier.binauricSe.rawValue, 203)
        XCTAssertEqual(CompanyIdentifier.binauricSe.name, #"Binauric SE"#)
        XCTAssertEqual(CompanyIdentifier.binauricSe.description, #"Binauric SE"#)
    
        // Beats Electronics
        XCTAssertEqual(CompanyIdentifier.beatsElectronics.rawValue, 204)
        XCTAssertEqual(CompanyIdentifier.beatsElectronics.name, #"Beats Electronics"#)
        XCTAssertEqual(CompanyIdentifier.beatsElectronics.description, #"Beats Electronics"#)
    
        // Microchip Technology Inc.
        XCTAssertEqual(CompanyIdentifier.microchipTechnology.rawValue, 205)
        XCTAssertEqual(CompanyIdentifier.microchipTechnology.name, #"Microchip Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.microchipTechnology.description, #"Microchip Technology Inc."#)
    
        // Elgato Systems GmbH
        XCTAssertEqual(CompanyIdentifier.elgatoSystems.rawValue, 206)
        XCTAssertEqual(CompanyIdentifier.elgatoSystems.name, #"Elgato Systems GmbH"#)
        XCTAssertEqual(CompanyIdentifier.elgatoSystems.description, #"Elgato Systems GmbH"#)
    
        // ARCHOS SA
        XCTAssertEqual(CompanyIdentifier.archos.rawValue, 207)
        XCTAssertEqual(CompanyIdentifier.archos.name, #"ARCHOS SA"#)
        XCTAssertEqual(CompanyIdentifier.archos.description, #"ARCHOS SA"#)
    
        // Dexcom, Inc.
        XCTAssertEqual(CompanyIdentifier.dexcom.rawValue, 208)
        XCTAssertEqual(CompanyIdentifier.dexcom.name, #"Dexcom, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dexcom.description, #"Dexcom, Inc."#)
    
        // Polar Electro Europe B.V.
        XCTAssertEqual(CompanyIdentifier.polarElectroEurope.rawValue, 209)
        XCTAssertEqual(CompanyIdentifier.polarElectroEurope.name, #"Polar Electro Europe B.V."#)
        XCTAssertEqual(CompanyIdentifier.polarElectroEurope.description, #"Polar Electro Europe B.V."#)
    
        // Dialog Semiconductor B.V.
        XCTAssertEqual(CompanyIdentifier.dialogSemiconductor.rawValue, 210)
        XCTAssertEqual(CompanyIdentifier.dialogSemiconductor.name, #"Dialog Semiconductor B.V."#)
        XCTAssertEqual(CompanyIdentifier.dialogSemiconductor.description, #"Dialog Semiconductor B.V."#)
    
        // Taixingbang Technology (HK) Co,. LTD.
        XCTAssertEqual(CompanyIdentifier.taixingbangTechnology.rawValue, 211)
        XCTAssertEqual(CompanyIdentifier.taixingbangTechnology.name, #"Taixingbang Technology (HK) Co,. LTD."#)
        XCTAssertEqual(CompanyIdentifier.taixingbangTechnology.description, #"Taixingbang Technology (HK) Co,. LTD."#)
    
        // Kawantech
        XCTAssertEqual(CompanyIdentifier.kawantech.rawValue, 212)
        XCTAssertEqual(CompanyIdentifier.kawantech.name, #"Kawantech"#)
        XCTAssertEqual(CompanyIdentifier.kawantech.description, #"Kawantech"#)
    
        // Austco Communication Systems
        XCTAssertEqual(CompanyIdentifier.austcoCommunicationSystems.rawValue, 213)
        XCTAssertEqual(CompanyIdentifier.austcoCommunicationSystems.name, #"Austco Communication Systems"#)
        XCTAssertEqual(CompanyIdentifier.austcoCommunicationSystems.description, #"Austco Communication Systems"#)
    
        // Timex Group USA, Inc.
        XCTAssertEqual(CompanyIdentifier.timexGroup.rawValue, 214)
        XCTAssertEqual(CompanyIdentifier.timexGroup.name, #"Timex Group USA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.timexGroup.description, #"Timex Group USA, Inc."#)
    
        // Qualcomm Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologies.rawValue, 215)
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologies.name, #"Qualcomm Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.qualcommTechnologies.description, #"Qualcomm Technologies, Inc."#)
    
        // Qualcomm Connected Experiences, Inc.
        XCTAssertEqual(CompanyIdentifier.qualcommConnectedExperiences.rawValue, 216)
        XCTAssertEqual(CompanyIdentifier.qualcommConnectedExperiences.name, #"Qualcomm Connected Experiences, Inc."#)
        XCTAssertEqual(CompanyIdentifier.qualcommConnectedExperiences.description, #"Qualcomm Connected Experiences, Inc."#)
    
        // Voyetra Turtle Beach
        XCTAssertEqual(CompanyIdentifier.voyetraTurtleBeach.rawValue, 217)
        XCTAssertEqual(CompanyIdentifier.voyetraTurtleBeach.name, #"Voyetra Turtle Beach"#)
        XCTAssertEqual(CompanyIdentifier.voyetraTurtleBeach.description, #"Voyetra Turtle Beach"#)
    
        // txtr GmbH
        XCTAssertEqual(CompanyIdentifier.txtr.rawValue, 218)
        XCTAssertEqual(CompanyIdentifier.txtr.name, #"txtr GmbH"#)
        XCTAssertEqual(CompanyIdentifier.txtr.description, #"txtr GmbH"#)
    
        // Biosentronics
        XCTAssertEqual(CompanyIdentifier.biosentronics.rawValue, 219)
        XCTAssertEqual(CompanyIdentifier.biosentronics.name, #"Biosentronics"#)
        XCTAssertEqual(CompanyIdentifier.biosentronics.description, #"Biosentronics"#)
    
        // Procter & Gamble
        XCTAssertEqual(CompanyIdentifier.procterGamble.rawValue, 220)
        XCTAssertEqual(CompanyIdentifier.procterGamble.name, #"Procter & Gamble"#)
        XCTAssertEqual(CompanyIdentifier.procterGamble.description, #"Procter & Gamble"#)
    
        // Hosiden Corporation
        XCTAssertEqual(CompanyIdentifier.hosiden.rawValue, 221)
        XCTAssertEqual(CompanyIdentifier.hosiden.name, #"Hosiden Corporation"#)
        XCTAssertEqual(CompanyIdentifier.hosiden.description, #"Hosiden Corporation"#)
    
        // Muzik LLC
        XCTAssertEqual(CompanyIdentifier.muzik.rawValue, 222)
        XCTAssertEqual(CompanyIdentifier.muzik.name, #"Muzik LLC"#)
        XCTAssertEqual(CompanyIdentifier.muzik.description, #"Muzik LLC"#)
    
        // Misfit Wearables Corp
        XCTAssertEqual(CompanyIdentifier.misfitWearables.rawValue, 223)
        XCTAssertEqual(CompanyIdentifier.misfitWearables.name, #"Misfit Wearables Corp"#)
        XCTAssertEqual(CompanyIdentifier.misfitWearables.description, #"Misfit Wearables Corp"#)
    
        // Google
        XCTAssertEqual(CompanyIdentifier.google.rawValue, 224)
        XCTAssertEqual(CompanyIdentifier.google.name, #"Google"#)
        XCTAssertEqual(CompanyIdentifier.google.description, #"Google"#)
    
        // Danlers Ltd
        XCTAssertEqual(CompanyIdentifier.danlers.rawValue, 225)
        XCTAssertEqual(CompanyIdentifier.danlers.name, #"Danlers Ltd"#)
        XCTAssertEqual(CompanyIdentifier.danlers.description, #"Danlers Ltd"#)
    
        // Semilink Inc
        XCTAssertEqual(CompanyIdentifier.semilink.rawValue, 226)
        XCTAssertEqual(CompanyIdentifier.semilink.name, #"Semilink Inc"#)
        XCTAssertEqual(CompanyIdentifier.semilink.description, #"Semilink Inc"#)
    
        // inMusic Brands, Inc
        XCTAssertEqual(CompanyIdentifier.inmusicBrands.rawValue, 227)
        XCTAssertEqual(CompanyIdentifier.inmusicBrands.name, #"inMusic Brands, Inc"#)
        XCTAssertEqual(CompanyIdentifier.inmusicBrands.description, #"inMusic Brands, Inc"#)
    
        // Laird Connectivity, Inc. formerly L.S. Research Inc.
        XCTAssertEqual(CompanyIdentifier.lairdConnectivityFormerlyLSResearch.rawValue, 228)
        XCTAssertEqual(CompanyIdentifier.lairdConnectivityFormerlyLSResearch.name, #"Laird Connectivity, Inc. formerly L.S. Research Inc."#)
        XCTAssertEqual(CompanyIdentifier.lairdConnectivityFormerlyLSResearch.description, #"Laird Connectivity, Inc. formerly L.S. Research Inc."#)
    
        // Eden Software Consultants Ltd.
        XCTAssertEqual(CompanyIdentifier.edenSoftwareConsultants.rawValue, 229)
        XCTAssertEqual(CompanyIdentifier.edenSoftwareConsultants.name, #"Eden Software Consultants Ltd."#)
        XCTAssertEqual(CompanyIdentifier.edenSoftwareConsultants.description, #"Eden Software Consultants Ltd."#)
    
        // Freshtemp
        XCTAssertEqual(CompanyIdentifier.freshtemp.rawValue, 230)
        XCTAssertEqual(CompanyIdentifier.freshtemp.name, #"Freshtemp"#)
        XCTAssertEqual(CompanyIdentifier.freshtemp.description, #"Freshtemp"#)
    
        // ​KS Technologies
        XCTAssertEqual(CompanyIdentifier.ksTechnologies.rawValue, 231)
        XCTAssertEqual(CompanyIdentifier.ksTechnologies.name, #"​KS Technologies"#)
        XCTAssertEqual(CompanyIdentifier.ksTechnologies.description, #"​KS Technologies"#)
    
        // ​ACTS Technologies
        XCTAssertEqual(CompanyIdentifier.actsTechnologies.rawValue, 232)
        XCTAssertEqual(CompanyIdentifier.actsTechnologies.name, #"​ACTS Technologies"#)
        XCTAssertEqual(CompanyIdentifier.actsTechnologies.description, #"​ACTS Technologies"#)
    
        // ​Vtrack Systems
        XCTAssertEqual(CompanyIdentifier.vtrackSystems.rawValue, 233)
        XCTAssertEqual(CompanyIdentifier.vtrackSystems.name, #"​Vtrack Systems"#)
        XCTAssertEqual(CompanyIdentifier.vtrackSystems.description, #"​Vtrack Systems"#)
    
        // ​Nielsen-Kellerman Company
        XCTAssertEqual(CompanyIdentifier.nielsenKellermanCompany.rawValue, 234)
        XCTAssertEqual(CompanyIdentifier.nielsenKellermanCompany.name, #"​Nielsen-Kellerman Company"#)
        XCTAssertEqual(CompanyIdentifier.nielsenKellermanCompany.description, #"​Nielsen-Kellerman Company"#)
    
        // Server Technology Inc.
        XCTAssertEqual(CompanyIdentifier.serverTechnology.rawValue, 235)
        XCTAssertEqual(CompanyIdentifier.serverTechnology.name, #"Server Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.serverTechnology.description, #"Server Technology Inc."#)
    
        // BioResearch Associates
        XCTAssertEqual(CompanyIdentifier.bioresearchAssociates.rawValue, 236)
        XCTAssertEqual(CompanyIdentifier.bioresearchAssociates.name, #"BioResearch Associates"#)
        XCTAssertEqual(CompanyIdentifier.bioresearchAssociates.description, #"BioResearch Associates"#)
    
        // Jolly Logic, LLC
        XCTAssertEqual(CompanyIdentifier.jollyLogic.rawValue, 237)
        XCTAssertEqual(CompanyIdentifier.jollyLogic.name, #"Jolly Logic, LLC"#)
        XCTAssertEqual(CompanyIdentifier.jollyLogic.description, #"Jolly Logic, LLC"#)
    
        // Above Average Outcomes, Inc.
        XCTAssertEqual(CompanyIdentifier.aboveAverageOutcomes.rawValue, 238)
        XCTAssertEqual(CompanyIdentifier.aboveAverageOutcomes.name, #"Above Average Outcomes, Inc."#)
        XCTAssertEqual(CompanyIdentifier.aboveAverageOutcomes.description, #"Above Average Outcomes, Inc."#)
    
        // Bitsplitters GmbH
        XCTAssertEqual(CompanyIdentifier.bitsplitters.rawValue, 239)
        XCTAssertEqual(CompanyIdentifier.bitsplitters.name, #"Bitsplitters GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bitsplitters.description, #"Bitsplitters GmbH"#)
    
        // PayPal, Inc.
        XCTAssertEqual(CompanyIdentifier.paypal.rawValue, 240)
        XCTAssertEqual(CompanyIdentifier.paypal.name, #"PayPal, Inc."#)
        XCTAssertEqual(CompanyIdentifier.paypal.description, #"PayPal, Inc."#)
    
        // Witron Technology Limited
        XCTAssertEqual(CompanyIdentifier.witronTechnology.rawValue, 241)
        XCTAssertEqual(CompanyIdentifier.witronTechnology.name, #"Witron Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.witronTechnology.description, #"Witron Technology Limited"#)
    
        // Morse Project Inc.
        XCTAssertEqual(CompanyIdentifier.morseProject.rawValue, 242)
        XCTAssertEqual(CompanyIdentifier.morseProject.name, #"Morse Project Inc."#)
        XCTAssertEqual(CompanyIdentifier.morseProject.description, #"Morse Project Inc."#)
    
        // Kent Displays Inc.
        XCTAssertEqual(CompanyIdentifier.kentDisplays.rawValue, 243)
        XCTAssertEqual(CompanyIdentifier.kentDisplays.name, #"Kent Displays Inc."#)
        XCTAssertEqual(CompanyIdentifier.kentDisplays.description, #"Kent Displays Inc."#)
    
        // Nautilus Inc.
        XCTAssertEqual(CompanyIdentifier.nautilus.rawValue, 244)
        XCTAssertEqual(CompanyIdentifier.nautilus.name, #"Nautilus Inc."#)
        XCTAssertEqual(CompanyIdentifier.nautilus.description, #"Nautilus Inc."#)
    
        // Smartifier Oy
        XCTAssertEqual(CompanyIdentifier.smartifier.rawValue, 245)
        XCTAssertEqual(CompanyIdentifier.smartifier.name, #"Smartifier Oy"#)
        XCTAssertEqual(CompanyIdentifier.smartifier.description, #"Smartifier Oy"#)
    
        // Elcometer Limited
        XCTAssertEqual(CompanyIdentifier.elcometer.rawValue, 246)
        XCTAssertEqual(CompanyIdentifier.elcometer.name, #"Elcometer Limited"#)
        XCTAssertEqual(CompanyIdentifier.elcometer.description, #"Elcometer Limited"#)
    
        // VSN Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.vsnTechnologies.rawValue, 247)
        XCTAssertEqual(CompanyIdentifier.vsnTechnologies.name, #"VSN Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.vsnTechnologies.description, #"VSN Technologies, Inc."#)
    
        // AceUni Corp., Ltd.
        XCTAssertEqual(CompanyIdentifier.aceuni.rawValue, 248)
        XCTAssertEqual(CompanyIdentifier.aceuni.name, #"AceUni Corp., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.aceuni.description, #"AceUni Corp., Ltd."#)
    
        // StickNFind
        XCTAssertEqual(CompanyIdentifier.sticknfind.rawValue, 249)
        XCTAssertEqual(CompanyIdentifier.sticknfind.name, #"StickNFind"#)
        XCTAssertEqual(CompanyIdentifier.sticknfind.description, #"StickNFind"#)
    
        // Crystal Code AB
        XCTAssertEqual(CompanyIdentifier.crystalCode.rawValue, 250)
        XCTAssertEqual(CompanyIdentifier.crystalCode.name, #"Crystal Code AB"#)
        XCTAssertEqual(CompanyIdentifier.crystalCode.description, #"Crystal Code AB"#)
    
        // KOUKAAM a.s.
        XCTAssertEqual(CompanyIdentifier.koukaam.rawValue, 251)
        XCTAssertEqual(CompanyIdentifier.koukaam.name, #"KOUKAAM a.s."#)
        XCTAssertEqual(CompanyIdentifier.koukaam.description, #"KOUKAAM a.s."#)
    
        // Delphi Corporation
        XCTAssertEqual(CompanyIdentifier.delphi.rawValue, 252)
        XCTAssertEqual(CompanyIdentifier.delphi.name, #"Delphi Corporation"#)
        XCTAssertEqual(CompanyIdentifier.delphi.description, #"Delphi Corporation"#)
    
        // ValenceTech Limited
        XCTAssertEqual(CompanyIdentifier.valencetech.rawValue, 253)
        XCTAssertEqual(CompanyIdentifier.valencetech.name, #"ValenceTech Limited"#)
        XCTAssertEqual(CompanyIdentifier.valencetech.description, #"ValenceTech Limited"#)
    
        // Stanley Black and Decker
        XCTAssertEqual(CompanyIdentifier.stanleyBlackAndDecker.rawValue, 254)
        XCTAssertEqual(CompanyIdentifier.stanleyBlackAndDecker.name, #"Stanley Black and Decker"#)
        XCTAssertEqual(CompanyIdentifier.stanleyBlackAndDecker.description, #"Stanley Black and Decker"#)
    
        // Typo Products, LLC
        XCTAssertEqual(CompanyIdentifier.typoProducts.rawValue, 255)
        XCTAssertEqual(CompanyIdentifier.typoProducts.name, #"Typo Products, LLC"#)
        XCTAssertEqual(CompanyIdentifier.typoProducts.description, #"Typo Products, LLC"#)
    
        // TomTom International BV
        XCTAssertEqual(CompanyIdentifier.tomtomInternational.rawValue, 256)
        XCTAssertEqual(CompanyIdentifier.tomtomInternational.name, #"TomTom International BV"#)
        XCTAssertEqual(CompanyIdentifier.tomtomInternational.description, #"TomTom International BV"#)
    
        // Fugoo, Inc.
        XCTAssertEqual(CompanyIdentifier.fugoo.rawValue, 257)
        XCTAssertEqual(CompanyIdentifier.fugoo.name, #"Fugoo, Inc."#)
        XCTAssertEqual(CompanyIdentifier.fugoo.description, #"Fugoo, Inc."#)
    
        // Keiser Corporation
        XCTAssertEqual(CompanyIdentifier.keiser.rawValue, 258)
        XCTAssertEqual(CompanyIdentifier.keiser.name, #"Keiser Corporation"#)
        XCTAssertEqual(CompanyIdentifier.keiser.description, #"Keiser Corporation"#)
    
        // Bang & Olufsen A/S
        XCTAssertEqual(CompanyIdentifier.bangOlufsen.rawValue, 259)
        XCTAssertEqual(CompanyIdentifier.bangOlufsen.name, #"Bang & Olufsen A/S"#)
        XCTAssertEqual(CompanyIdentifier.bangOlufsen.description, #"Bang & Olufsen A/S"#)
    
        // PLUS Location Systems Pty Ltd
        XCTAssertEqual(CompanyIdentifier.plusLocationSystemsPty.rawValue, 260)
        XCTAssertEqual(CompanyIdentifier.plusLocationSystemsPty.name, #"PLUS Location Systems Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.plusLocationSystemsPty.description, #"PLUS Location Systems Pty Ltd"#)
    
        // Ubiquitous Computing Technology Corporation
        XCTAssertEqual(CompanyIdentifier.ubiquitousComputingTechnology.rawValue, 261)
        XCTAssertEqual(CompanyIdentifier.ubiquitousComputingTechnology.name, #"Ubiquitous Computing Technology Corporation"#)
        XCTAssertEqual(CompanyIdentifier.ubiquitousComputingTechnology.description, #"Ubiquitous Computing Technology Corporation"#)
    
        // Innovative Yachtter Solutions
        XCTAssertEqual(CompanyIdentifier.innovativeYachtterSolutions.rawValue, 262)
        XCTAssertEqual(CompanyIdentifier.innovativeYachtterSolutions.name, #"Innovative Yachtter Solutions"#)
        XCTAssertEqual(CompanyIdentifier.innovativeYachtterSolutions.description, #"Innovative Yachtter Solutions"#)
    
        // William Demant Holding A/S
        XCTAssertEqual(CompanyIdentifier.williamDemantHolding.rawValue, 263)
        XCTAssertEqual(CompanyIdentifier.williamDemantHolding.name, #"William Demant Holding A/S"#)
        XCTAssertEqual(CompanyIdentifier.williamDemantHolding.description, #"William Demant Holding A/S"#)
    
        // Chicony Electronics Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.chiconyElectronics.rawValue, 264)
        XCTAssertEqual(CompanyIdentifier.chiconyElectronics.name, #"Chicony Electronics Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.chiconyElectronics.description, #"Chicony Electronics Co., Ltd."#)
    
        // Atus BV
        XCTAssertEqual(CompanyIdentifier.atus.rawValue, 265)
        XCTAssertEqual(CompanyIdentifier.atus.name, #"Atus BV"#)
        XCTAssertEqual(CompanyIdentifier.atus.description, #"Atus BV"#)
    
        // Codegate Ltd
        XCTAssertEqual(CompanyIdentifier.codegate.rawValue, 266)
        XCTAssertEqual(CompanyIdentifier.codegate.name, #"Codegate Ltd"#)
        XCTAssertEqual(CompanyIdentifier.codegate.description, #"Codegate Ltd"#)
    
        // ERi, Inc
        XCTAssertEqual(CompanyIdentifier.eri.rawValue, 267)
        XCTAssertEqual(CompanyIdentifier.eri.name, #"ERi, Inc"#)
        XCTAssertEqual(CompanyIdentifier.eri.description, #"ERi, Inc"#)
    
        // Transducers Direct, LLC
        XCTAssertEqual(CompanyIdentifier.transducersDirect.rawValue, 268)
        XCTAssertEqual(CompanyIdentifier.transducersDirect.name, #"Transducers Direct, LLC"#)
        XCTAssertEqual(CompanyIdentifier.transducersDirect.description, #"Transducers Direct, LLC"#)
    
        // DENSO TEN LIMITED (formerly Fujitsu Ten LImited)
        XCTAssertEqual(CompanyIdentifier.densoTen.rawValue, 269)
        XCTAssertEqual(CompanyIdentifier.densoTen.name, #"DENSO TEN LIMITED (formerly Fujitsu Ten LImited)"#)
        XCTAssertEqual(CompanyIdentifier.densoTen.description, #"DENSO TEN LIMITED (formerly Fujitsu Ten LImited)"#)
    
        // Audi AG
        XCTAssertEqual(CompanyIdentifier.audi.rawValue, 270)
        XCTAssertEqual(CompanyIdentifier.audi.name, #"Audi AG"#)
        XCTAssertEqual(CompanyIdentifier.audi.description, #"Audi AG"#)
    
        // HiSilicon Technologies CO., LIMITED
        XCTAssertEqual(CompanyIdentifier.hisiliconTechnologies.rawValue, 271)
        XCTAssertEqual(CompanyIdentifier.hisiliconTechnologies.name, #"HiSilicon Technologies CO., LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.hisiliconTechnologies.description, #"HiSilicon Technologies CO., LIMITED"#)
    
        // Nippon Seiki Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.nipponSeiki.rawValue, 272)
        XCTAssertEqual(CompanyIdentifier.nipponSeiki.name, #"Nippon Seiki Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nipponSeiki.description, #"Nippon Seiki Co., Ltd."#)
    
        // Steelseries ApS
        XCTAssertEqual(CompanyIdentifier.steelseries.rawValue, 273)
        XCTAssertEqual(CompanyIdentifier.steelseries.name, #"Steelseries ApS"#)
        XCTAssertEqual(CompanyIdentifier.steelseries.description, #"Steelseries ApS"#)
    
        // Visybl Inc.
        XCTAssertEqual(CompanyIdentifier.visybl.rawValue, 274)
        XCTAssertEqual(CompanyIdentifier.visybl.name, #"Visybl Inc."#)
        XCTAssertEqual(CompanyIdentifier.visybl.description, #"Visybl Inc."#)
    
        // Openbrain Technologies, Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.openbrainTechnologies.rawValue, 275)
        XCTAssertEqual(CompanyIdentifier.openbrainTechnologies.name, #"Openbrain Technologies, Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.openbrainTechnologies.description, #"Openbrain Technologies, Co., Ltd."#)
    
        // Xensr
        XCTAssertEqual(CompanyIdentifier.xensr.rawValue, 276)
        XCTAssertEqual(CompanyIdentifier.xensr.name, #"Xensr"#)
        XCTAssertEqual(CompanyIdentifier.xensr.description, #"Xensr"#)
    
        // e.solutions
        XCTAssertEqual(CompanyIdentifier.eSolutions.rawValue, 277)
        XCTAssertEqual(CompanyIdentifier.eSolutions.name, #"e.solutions"#)
        XCTAssertEqual(CompanyIdentifier.eSolutions.description, #"e.solutions"#)
    
        // 10AK Technologies
        XCTAssertEqual(CompanyIdentifier.company10AkTechnologies.rawValue, 278)
        XCTAssertEqual(CompanyIdentifier.company10AkTechnologies.name, #"10AK Technologies"#)
        XCTAssertEqual(CompanyIdentifier.company10AkTechnologies.description, #"10AK Technologies"#)
    
        // Wimoto Technologies Inc
        XCTAssertEqual(CompanyIdentifier.wimotoTechnologies.rawValue, 279)
        XCTAssertEqual(CompanyIdentifier.wimotoTechnologies.name, #"Wimoto Technologies Inc"#)
        XCTAssertEqual(CompanyIdentifier.wimotoTechnologies.description, #"Wimoto Technologies Inc"#)
    
        // Radius Networks, Inc.
        XCTAssertEqual(CompanyIdentifier.radiusNetworks.rawValue, 280)
        XCTAssertEqual(CompanyIdentifier.radiusNetworks.name, #"Radius Networks, Inc."#)
        XCTAssertEqual(CompanyIdentifier.radiusNetworks.description, #"Radius Networks, Inc."#)
    
        // Wize Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.wizeTechnology.rawValue, 281)
        XCTAssertEqual(CompanyIdentifier.wizeTechnology.name, #"Wize Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.wizeTechnology.description, #"Wize Technology Co., Ltd."#)
    
        // Qualcomm Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.qualcommLabs.rawValue, 282)
        XCTAssertEqual(CompanyIdentifier.qualcommLabs.name, #"Qualcomm Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.qualcommLabs.description, #"Qualcomm Labs, Inc."#)
    
        // Hewlett Packard Enterprise
        XCTAssertEqual(CompanyIdentifier.hewlettPackardEnterprise.rawValue, 283)
        XCTAssertEqual(CompanyIdentifier.hewlettPackardEnterprise.name, #"Hewlett Packard Enterprise"#)
        XCTAssertEqual(CompanyIdentifier.hewlettPackardEnterprise.description, #"Hewlett Packard Enterprise"#)
    
        // Baidu
        XCTAssertEqual(CompanyIdentifier.baidu.rawValue, 284)
        XCTAssertEqual(CompanyIdentifier.baidu.name, #"Baidu"#)
        XCTAssertEqual(CompanyIdentifier.baidu.description, #"Baidu"#)
    
        // Arendi AG
        XCTAssertEqual(CompanyIdentifier.arendi.rawValue, 285)
        XCTAssertEqual(CompanyIdentifier.arendi.name, #"Arendi AG"#)
        XCTAssertEqual(CompanyIdentifier.arendi.description, #"Arendi AG"#)
    
        // Skoda Auto a.s.
        XCTAssertEqual(CompanyIdentifier.skodaAuto.rawValue, 286)
        XCTAssertEqual(CompanyIdentifier.skodaAuto.name, #"Skoda Auto a.s."#)
        XCTAssertEqual(CompanyIdentifier.skodaAuto.description, #"Skoda Auto a.s."#)
    
        // Volkswagen AG
        XCTAssertEqual(CompanyIdentifier.volkswagen.rawValue, 287)
        XCTAssertEqual(CompanyIdentifier.volkswagen.name, #"Volkswagen AG"#)
        XCTAssertEqual(CompanyIdentifier.volkswagen.description, #"Volkswagen AG"#)
    
        // Porsche AG
        XCTAssertEqual(CompanyIdentifier.porsche.rawValue, 288)
        XCTAssertEqual(CompanyIdentifier.porsche.name, #"Porsche AG"#)
        XCTAssertEqual(CompanyIdentifier.porsche.description, #"Porsche AG"#)
    
        // Sino Wealth Electronic Ltd.
        XCTAssertEqual(CompanyIdentifier.sinoWealthElectronic.rawValue, 289)
        XCTAssertEqual(CompanyIdentifier.sinoWealthElectronic.name, #"Sino Wealth Electronic Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sinoWealthElectronic.description, #"Sino Wealth Electronic Ltd."#)
    
        // AirTurn, Inc.
        XCTAssertEqual(CompanyIdentifier.airturn.rawValue, 290)
        XCTAssertEqual(CompanyIdentifier.airturn.name, #"AirTurn, Inc."#)
        XCTAssertEqual(CompanyIdentifier.airturn.description, #"AirTurn, Inc."#)
    
        // Kinsa, Inc
        XCTAssertEqual(CompanyIdentifier.kinsa.rawValue, 291)
        XCTAssertEqual(CompanyIdentifier.kinsa.name, #"Kinsa, Inc"#)
        XCTAssertEqual(CompanyIdentifier.kinsa.description, #"Kinsa, Inc"#)
    
        // HID Global
        XCTAssertEqual(CompanyIdentifier.hidGlobal.rawValue, 292)
        XCTAssertEqual(CompanyIdentifier.hidGlobal.name, #"HID Global"#)
        XCTAssertEqual(CompanyIdentifier.hidGlobal.description, #"HID Global"#)
    
        // SEAT es
        XCTAssertEqual(CompanyIdentifier.seatEs.rawValue, 293)
        XCTAssertEqual(CompanyIdentifier.seatEs.name, #"SEAT es"#)
        XCTAssertEqual(CompanyIdentifier.seatEs.description, #"SEAT es"#)
    
        // Promethean Ltd.
        XCTAssertEqual(CompanyIdentifier.promethean.rawValue, 294)
        XCTAssertEqual(CompanyIdentifier.promethean.name, #"Promethean Ltd."#)
        XCTAssertEqual(CompanyIdentifier.promethean.description, #"Promethean Ltd."#)
    
        // Salutica Allied Solutions
        XCTAssertEqual(CompanyIdentifier.saluticaAlliedSolutions.rawValue, 295)
        XCTAssertEqual(CompanyIdentifier.saluticaAlliedSolutions.name, #"Salutica Allied Solutions"#)
        XCTAssertEqual(CompanyIdentifier.saluticaAlliedSolutions.description, #"Salutica Allied Solutions"#)
    
        // GPSI Group Pty Ltd
        XCTAssertEqual(CompanyIdentifier.gpsiGroupPty.rawValue, 296)
        XCTAssertEqual(CompanyIdentifier.gpsiGroupPty.name, #"GPSI Group Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.gpsiGroupPty.description, #"GPSI Group Pty Ltd"#)
    
        // Nimble Devices Oy
        XCTAssertEqual(CompanyIdentifier.nimbleDevices.rawValue, 297)
        XCTAssertEqual(CompanyIdentifier.nimbleDevices.name, #"Nimble Devices Oy"#)
        XCTAssertEqual(CompanyIdentifier.nimbleDevices.description, #"Nimble Devices Oy"#)
    
        // Changzhou Yongse Infotech  Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.changzhouYongseInfotech.rawValue, 298)
        XCTAssertEqual(CompanyIdentifier.changzhouYongseInfotech.name, #"Changzhou Yongse Infotech  Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.changzhouYongseInfotech.description, #"Changzhou Yongse Infotech  Co., Ltd."#)
    
        // SportIQ
        XCTAssertEqual(CompanyIdentifier.sportiq.rawValue, 299)
        XCTAssertEqual(CompanyIdentifier.sportiq.name, #"SportIQ"#)
        XCTAssertEqual(CompanyIdentifier.sportiq.description, #"SportIQ"#)
    
        // TEMEC Instruments B.V.
        XCTAssertEqual(CompanyIdentifier.temecInstruments.rawValue, 300)
        XCTAssertEqual(CompanyIdentifier.temecInstruments.name, #"TEMEC Instruments B.V."#)
        XCTAssertEqual(CompanyIdentifier.temecInstruments.description, #"TEMEC Instruments B.V."#)
    
        // Sony Corporation
        XCTAssertEqual(CompanyIdentifier.sony.rawValue, 301)
        XCTAssertEqual(CompanyIdentifier.sony.name, #"Sony Corporation"#)
        XCTAssertEqual(CompanyIdentifier.sony.description, #"Sony Corporation"#)
    
        // ASSA ABLOY
        XCTAssertEqual(CompanyIdentifier.assaAbloy.rawValue, 302)
        XCTAssertEqual(CompanyIdentifier.assaAbloy.name, #"ASSA ABLOY"#)
        XCTAssertEqual(CompanyIdentifier.assaAbloy.description, #"ASSA ABLOY"#)
    
        // Clarion Co. Inc.
        XCTAssertEqual(CompanyIdentifier.clarion.rawValue, 303)
        XCTAssertEqual(CompanyIdentifier.clarion.name, #"Clarion Co. Inc."#)
        XCTAssertEqual(CompanyIdentifier.clarion.description, #"Clarion Co. Inc."#)
    
        // Warehouse Innovations
        XCTAssertEqual(CompanyIdentifier.warehouseInnovations.rawValue, 304)
        XCTAssertEqual(CompanyIdentifier.warehouseInnovations.name, #"Warehouse Innovations"#)
        XCTAssertEqual(CompanyIdentifier.warehouseInnovations.description, #"Warehouse Innovations"#)
    
        // Cypress Semiconductor
        XCTAssertEqual(CompanyIdentifier.cypressSemiconductor.rawValue, 305)
        XCTAssertEqual(CompanyIdentifier.cypressSemiconductor.name, #"Cypress Semiconductor"#)
        XCTAssertEqual(CompanyIdentifier.cypressSemiconductor.description, #"Cypress Semiconductor"#)
    
        // MADS Inc
        XCTAssertEqual(CompanyIdentifier.mads.rawValue, 306)
        XCTAssertEqual(CompanyIdentifier.mads.name, #"MADS Inc"#)
        XCTAssertEqual(CompanyIdentifier.mads.description, #"MADS Inc"#)
    
        // Blue Maestro Limited
        XCTAssertEqual(CompanyIdentifier.blueMaestro.rawValue, 307)
        XCTAssertEqual(CompanyIdentifier.blueMaestro.name, #"Blue Maestro Limited"#)
        XCTAssertEqual(CompanyIdentifier.blueMaestro.description, #"Blue Maestro Limited"#)
    
        // Resolution Products, Ltd.
        XCTAssertEqual(CompanyIdentifier.resolutionProducts.rawValue, 308)
        XCTAssertEqual(CompanyIdentifier.resolutionProducts.name, #"Resolution Products, Ltd."#)
        XCTAssertEqual(CompanyIdentifier.resolutionProducts.description, #"Resolution Products, Ltd."#)
    
        // Aireware LLC
        XCTAssertEqual(CompanyIdentifier.aireware.rawValue, 309)
        XCTAssertEqual(CompanyIdentifier.aireware.name, #"Aireware LLC"#)
        XCTAssertEqual(CompanyIdentifier.aireware.description, #"Aireware LLC"#)
    
        // Silvair, Inc.
        XCTAssertEqual(CompanyIdentifier.silvair.rawValue, 310)
        XCTAssertEqual(CompanyIdentifier.silvair.name, #"Silvair, Inc."#)
        XCTAssertEqual(CompanyIdentifier.silvair.description, #"Silvair, Inc."#)
    
        // Prestigio Plaza Ltd.
        XCTAssertEqual(CompanyIdentifier.prestigioPlaza.rawValue, 311)
        XCTAssertEqual(CompanyIdentifier.prestigioPlaza.name, #"Prestigio Plaza Ltd."#)
        XCTAssertEqual(CompanyIdentifier.prestigioPlaza.description, #"Prestigio Plaza Ltd."#)
    
        // NTEO Inc.
        XCTAssertEqual(CompanyIdentifier.nteo.rawValue, 312)
        XCTAssertEqual(CompanyIdentifier.nteo.name, #"NTEO Inc."#)
        XCTAssertEqual(CompanyIdentifier.nteo.description, #"NTEO Inc."#)
    
        // Focus Systems Corporation
        XCTAssertEqual(CompanyIdentifier.focusSystems.rawValue, 313)
        XCTAssertEqual(CompanyIdentifier.focusSystems.name, #"Focus Systems Corporation"#)
        XCTAssertEqual(CompanyIdentifier.focusSystems.description, #"Focus Systems Corporation"#)
    
        // Tencent Holdings Ltd.
        XCTAssertEqual(CompanyIdentifier.tencentHoldings.rawValue, 314)
        XCTAssertEqual(CompanyIdentifier.tencentHoldings.name, #"Tencent Holdings Ltd."#)
        XCTAssertEqual(CompanyIdentifier.tencentHoldings.description, #"Tencent Holdings Ltd."#)
    
        // Allegion
        XCTAssertEqual(CompanyIdentifier.allegion.rawValue, 315)
        XCTAssertEqual(CompanyIdentifier.allegion.name, #"Allegion"#)
        XCTAssertEqual(CompanyIdentifier.allegion.description, #"Allegion"#)
    
        // Murata Manufacturing Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.murataManufacturing.rawValue, 316)
        XCTAssertEqual(CompanyIdentifier.murataManufacturing.name, #"Murata Manufacturing Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.murataManufacturing.description, #"Murata Manufacturing Co., Ltd."#)
    
        // WirelessWERX
        XCTAssertEqual(CompanyIdentifier.wirelesswerx.rawValue, 317)
        XCTAssertEqual(CompanyIdentifier.wirelesswerx.name, #"WirelessWERX"#)
        XCTAssertEqual(CompanyIdentifier.wirelesswerx.description, #"WirelessWERX"#)
    
        // Nod, Inc.
        XCTAssertEqual(CompanyIdentifier.nod.rawValue, 318)
        XCTAssertEqual(CompanyIdentifier.nod.name, #"Nod, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nod.description, #"Nod, Inc."#)
    
        // B&B Manufacturing Company
        XCTAssertEqual(CompanyIdentifier.bBManufacturingCompany.rawValue, 319)
        XCTAssertEqual(CompanyIdentifier.bBManufacturingCompany.name, #"B&B Manufacturing Company"#)
        XCTAssertEqual(CompanyIdentifier.bBManufacturingCompany.description, #"B&B Manufacturing Company"#)
    
        // Alpine Electronics (China) Co., Ltd
        XCTAssertEqual(CompanyIdentifier.alpineElectronicsChina.rawValue, 320)
        XCTAssertEqual(CompanyIdentifier.alpineElectronicsChina.name, #"Alpine Electronics (China) Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.alpineElectronicsChina.description, #"Alpine Electronics (China) Co., Ltd"#)
    
        // FedEx Services
        XCTAssertEqual(CompanyIdentifier.fedexServices.rawValue, 321)
        XCTAssertEqual(CompanyIdentifier.fedexServices.name, #"FedEx Services"#)
        XCTAssertEqual(CompanyIdentifier.fedexServices.description, #"FedEx Services"#)
    
        // Grape Systems Inc.
        XCTAssertEqual(CompanyIdentifier.grapeSystems.rawValue, 322)
        XCTAssertEqual(CompanyIdentifier.grapeSystems.name, #"Grape Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.grapeSystems.description, #"Grape Systems Inc."#)
    
        // Bkon Connect
        XCTAssertEqual(CompanyIdentifier.bkonConnect.rawValue, 323)
        XCTAssertEqual(CompanyIdentifier.bkonConnect.name, #"Bkon Connect"#)
        XCTAssertEqual(CompanyIdentifier.bkonConnect.description, #"Bkon Connect"#)
    
        // Lintech GmbH
        XCTAssertEqual(CompanyIdentifier.lintech.rawValue, 324)
        XCTAssertEqual(CompanyIdentifier.lintech.name, #"Lintech GmbH"#)
        XCTAssertEqual(CompanyIdentifier.lintech.description, #"Lintech GmbH"#)
    
        // Novatel Wireless
        XCTAssertEqual(CompanyIdentifier.novatelWireless.rawValue, 325)
        XCTAssertEqual(CompanyIdentifier.novatelWireless.name, #"Novatel Wireless"#)
        XCTAssertEqual(CompanyIdentifier.novatelWireless.description, #"Novatel Wireless"#)
    
        // Ciright
        XCTAssertEqual(CompanyIdentifier.ciright.rawValue, 326)
        XCTAssertEqual(CompanyIdentifier.ciright.name, #"Ciright"#)
        XCTAssertEqual(CompanyIdentifier.ciright.description, #"Ciright"#)
    
        // Mighty Cast, Inc.
        XCTAssertEqual(CompanyIdentifier.mightyCast.rawValue, 327)
        XCTAssertEqual(CompanyIdentifier.mightyCast.name, #"Mighty Cast, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mightyCast.description, #"Mighty Cast, Inc."#)
    
        // Ambimat Electronics
        XCTAssertEqual(CompanyIdentifier.ambimatElectronics.rawValue, 328)
        XCTAssertEqual(CompanyIdentifier.ambimatElectronics.name, #"Ambimat Electronics"#)
        XCTAssertEqual(CompanyIdentifier.ambimatElectronics.description, #"Ambimat Electronics"#)
    
        // Perytons Ltd.
        XCTAssertEqual(CompanyIdentifier.perytons.rawValue, 329)
        XCTAssertEqual(CompanyIdentifier.perytons.name, #"Perytons Ltd."#)
        XCTAssertEqual(CompanyIdentifier.perytons.description, #"Perytons Ltd."#)
    
        // Tivoli Audio, LLC
        XCTAssertEqual(CompanyIdentifier.tivoliAudio.rawValue, 330)
        XCTAssertEqual(CompanyIdentifier.tivoliAudio.name, #"Tivoli Audio, LLC"#)
        XCTAssertEqual(CompanyIdentifier.tivoliAudio.description, #"Tivoli Audio, LLC"#)
    
        // Master Lock
        XCTAssertEqual(CompanyIdentifier.masterLock.rawValue, 331)
        XCTAssertEqual(CompanyIdentifier.masterLock.name, #"Master Lock"#)
        XCTAssertEqual(CompanyIdentifier.masterLock.description, #"Master Lock"#)
    
        // Mesh-Net Ltd
        XCTAssertEqual(CompanyIdentifier.meshNet.rawValue, 332)
        XCTAssertEqual(CompanyIdentifier.meshNet.name, #"Mesh-Net Ltd"#)
        XCTAssertEqual(CompanyIdentifier.meshNet.description, #"Mesh-Net Ltd"#)
    
        // HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.
        XCTAssertEqual(CompanyIdentifier.huizhouDesaySvAutomotive.rawValue, 333)
        XCTAssertEqual(CompanyIdentifier.huizhouDesaySvAutomotive.name, #"HUIZHOU DESAY SV AUTOMOTIVE CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.huizhouDesaySvAutomotive.description, #"HUIZHOU DESAY SV AUTOMOTIVE CO., LTD."#)
    
        // Tangerine, Inc.
        XCTAssertEqual(CompanyIdentifier.tangerine.rawValue, 334)
        XCTAssertEqual(CompanyIdentifier.tangerine.name, #"Tangerine, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tangerine.description, #"Tangerine, Inc."#)
    
        // B&W Group Ltd.
        XCTAssertEqual(CompanyIdentifier.bWGroup.rawValue, 335)
        XCTAssertEqual(CompanyIdentifier.bWGroup.name, #"B&W Group Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bWGroup.description, #"B&W Group Ltd."#)
    
        // Pioneer Corporation
        XCTAssertEqual(CompanyIdentifier.pioneer.rawValue, 336)
        XCTAssertEqual(CompanyIdentifier.pioneer.name, #"Pioneer Corporation"#)
        XCTAssertEqual(CompanyIdentifier.pioneer.description, #"Pioneer Corporation"#)
    
        // OnBeep
        XCTAssertEqual(CompanyIdentifier.onbeep.rawValue, 337)
        XCTAssertEqual(CompanyIdentifier.onbeep.name, #"OnBeep"#)
        XCTAssertEqual(CompanyIdentifier.onbeep.description, #"OnBeep"#)
    
        // Vernier Software & Technology
        XCTAssertEqual(CompanyIdentifier.vernierSoftwareTechnology.rawValue, 338)
        XCTAssertEqual(CompanyIdentifier.vernierSoftwareTechnology.name, #"Vernier Software & Technology"#)
        XCTAssertEqual(CompanyIdentifier.vernierSoftwareTechnology.description, #"Vernier Software & Technology"#)
    
        // ROL Ergo
        XCTAssertEqual(CompanyIdentifier.rolErgo.rawValue, 339)
        XCTAssertEqual(CompanyIdentifier.rolErgo.name, #"ROL Ergo"#)
        XCTAssertEqual(CompanyIdentifier.rolErgo.description, #"ROL Ergo"#)
    
        // Pebble Technology
        XCTAssertEqual(CompanyIdentifier.pebbleTechnology.rawValue, 340)
        XCTAssertEqual(CompanyIdentifier.pebbleTechnology.name, #"Pebble Technology"#)
        XCTAssertEqual(CompanyIdentifier.pebbleTechnology.description, #"Pebble Technology"#)
    
        // NETATMO
        XCTAssertEqual(CompanyIdentifier.netatmo.rawValue, 341)
        XCTAssertEqual(CompanyIdentifier.netatmo.name, #"NETATMO"#)
        XCTAssertEqual(CompanyIdentifier.netatmo.description, #"NETATMO"#)
    
        // Accumulate AB
        XCTAssertEqual(CompanyIdentifier.accumulate.rawValue, 342)
        XCTAssertEqual(CompanyIdentifier.accumulate.name, #"Accumulate AB"#)
        XCTAssertEqual(CompanyIdentifier.accumulate.description, #"Accumulate AB"#)
    
        // Anhui Huami Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.anhuiHuamiInformationTechnology.rawValue, 343)
        XCTAssertEqual(CompanyIdentifier.anhuiHuamiInformationTechnology.name, #"Anhui Huami Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.anhuiHuamiInformationTechnology.description, #"Anhui Huami Information Technology Co., Ltd."#)
    
        // Inmite s.r.o.
        XCTAssertEqual(CompanyIdentifier.inmite.rawValue, 344)
        XCTAssertEqual(CompanyIdentifier.inmite.name, #"Inmite s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.inmite.description, #"Inmite s.r.o."#)
    
        // ChefSteps, Inc.
        XCTAssertEqual(CompanyIdentifier.chefsteps.rawValue, 345)
        XCTAssertEqual(CompanyIdentifier.chefsteps.name, #"ChefSteps, Inc."#)
        XCTAssertEqual(CompanyIdentifier.chefsteps.description, #"ChefSteps, Inc."#)
    
        // micas AG
        XCTAssertEqual(CompanyIdentifier.micas.rawValue, 346)
        XCTAssertEqual(CompanyIdentifier.micas.name, #"micas AG"#)
        XCTAssertEqual(CompanyIdentifier.micas.description, #"micas AG"#)
    
        // Biomedical Research Ltd.
        XCTAssertEqual(CompanyIdentifier.biomedicalResearch.rawValue, 347)
        XCTAssertEqual(CompanyIdentifier.biomedicalResearch.name, #"Biomedical Research Ltd."#)
        XCTAssertEqual(CompanyIdentifier.biomedicalResearch.description, #"Biomedical Research Ltd."#)
    
        // Pitius Tec S.L.
        XCTAssertEqual(CompanyIdentifier.pitiusTec.rawValue, 348)
        XCTAssertEqual(CompanyIdentifier.pitiusTec.name, #"Pitius Tec S.L."#)
        XCTAssertEqual(CompanyIdentifier.pitiusTec.description, #"Pitius Tec S.L."#)
    
        // Estimote, Inc.
        XCTAssertEqual(CompanyIdentifier.estimote.rawValue, 349)
        XCTAssertEqual(CompanyIdentifier.estimote.name, #"Estimote, Inc."#)
        XCTAssertEqual(CompanyIdentifier.estimote.description, #"Estimote, Inc."#)
    
        // Unikey Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.unikeyTechnologies.rawValue, 350)
        XCTAssertEqual(CompanyIdentifier.unikeyTechnologies.name, #"Unikey Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.unikeyTechnologies.description, #"Unikey Technologies, Inc."#)
    
        // Timer Cap Co.
        XCTAssertEqual(CompanyIdentifier.timerCap.rawValue, 351)
        XCTAssertEqual(CompanyIdentifier.timerCap.name, #"Timer Cap Co."#)
        XCTAssertEqual(CompanyIdentifier.timerCap.description, #"Timer Cap Co."#)
    
        // Awox formerly AwoX
        XCTAssertEqual(CompanyIdentifier.awoxFormerlyAwox.rawValue, 352)
        XCTAssertEqual(CompanyIdentifier.awoxFormerlyAwox.name, #"Awox formerly AwoX"#)
        XCTAssertEqual(CompanyIdentifier.awoxFormerlyAwox.description, #"Awox formerly AwoX"#)
    
        // yikes
        XCTAssertEqual(CompanyIdentifier.yikes.rawValue, 353)
        XCTAssertEqual(CompanyIdentifier.yikes.name, #"yikes"#)
        XCTAssertEqual(CompanyIdentifier.yikes.description, #"yikes"#)
    
        // MADSGlobalNZ Ltd.
        XCTAssertEqual(CompanyIdentifier.madsglobalnz.rawValue, 354)
        XCTAssertEqual(CompanyIdentifier.madsglobalnz.name, #"MADSGlobalNZ Ltd."#)
        XCTAssertEqual(CompanyIdentifier.madsglobalnz.description, #"MADSGlobalNZ Ltd."#)
    
        // PCH International
        XCTAssertEqual(CompanyIdentifier.pchInternational.rawValue, 355)
        XCTAssertEqual(CompanyIdentifier.pchInternational.name, #"PCH International"#)
        XCTAssertEqual(CompanyIdentifier.pchInternational.description, #"PCH International"#)
    
        // Qingdao Yeelink Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.qingdaoYeelinkInformationTechnology.rawValue, 356)
        XCTAssertEqual(CompanyIdentifier.qingdaoYeelinkInformationTechnology.name, #"Qingdao Yeelink Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.qingdaoYeelinkInformationTechnology.description, #"Qingdao Yeelink Information Technology Co., Ltd."#)
    
        // Milwaukee Tool (Formally Milwaukee Electric Tools)
        XCTAssertEqual(CompanyIdentifier.milwaukeeToolFormallyMilwaukeeElectricTools.rawValue, 357)
        XCTAssertEqual(CompanyIdentifier.milwaukeeToolFormallyMilwaukeeElectricTools.name, #"Milwaukee Tool (Formally Milwaukee Electric Tools)"#)
        XCTAssertEqual(CompanyIdentifier.milwaukeeToolFormallyMilwaukeeElectricTools.description, #"Milwaukee Tool (Formally Milwaukee Electric Tools)"#)
    
        // MISHIK Pte Ltd
        XCTAssertEqual(CompanyIdentifier.mishikPte.rawValue, 358)
        XCTAssertEqual(CompanyIdentifier.mishikPte.name, #"MISHIK Pte Ltd"#)
        XCTAssertEqual(CompanyIdentifier.mishikPte.description, #"MISHIK Pte Ltd"#)
    
        // Ascensia Diabetes Care US Inc.
        XCTAssertEqual(CompanyIdentifier.ascensiaDiabetesCareUs.rawValue, 359)
        XCTAssertEqual(CompanyIdentifier.ascensiaDiabetesCareUs.name, #"Ascensia Diabetes Care US Inc."#)
        XCTAssertEqual(CompanyIdentifier.ascensiaDiabetesCareUs.description, #"Ascensia Diabetes Care US Inc."#)
    
        // Spicebox LLC
        XCTAssertEqual(CompanyIdentifier.spicebox.rawValue, 360)
        XCTAssertEqual(CompanyIdentifier.spicebox.name, #"Spicebox LLC"#)
        XCTAssertEqual(CompanyIdentifier.spicebox.description, #"Spicebox LLC"#)
    
        // emberlight
        XCTAssertEqual(CompanyIdentifier.emberlight.rawValue, 361)
        XCTAssertEqual(CompanyIdentifier.emberlight.name, #"emberlight"#)
        XCTAssertEqual(CompanyIdentifier.emberlight.description, #"emberlight"#)
    
        // Emerson Digital Cold Chain, Inc.
        XCTAssertEqual(CompanyIdentifier.emersonDigitalColdChain.rawValue, 362)
        XCTAssertEqual(CompanyIdentifier.emersonDigitalColdChain.name, #"Emerson Digital Cold Chain, Inc."#)
        XCTAssertEqual(CompanyIdentifier.emersonDigitalColdChain.description, #"Emerson Digital Cold Chain, Inc."#)
    
        // Qblinks
        XCTAssertEqual(CompanyIdentifier.qblinks.rawValue, 363)
        XCTAssertEqual(CompanyIdentifier.qblinks.name, #"Qblinks"#)
        XCTAssertEqual(CompanyIdentifier.qblinks.description, #"Qblinks"#)
    
        // MYSPHERA
        XCTAssertEqual(CompanyIdentifier.mysphera.rawValue, 364)
        XCTAssertEqual(CompanyIdentifier.mysphera.name, #"MYSPHERA"#)
        XCTAssertEqual(CompanyIdentifier.mysphera.description, #"MYSPHERA"#)
    
        // LifeScan Inc
        XCTAssertEqual(CompanyIdentifier.lifescan.rawValue, 365)
        XCTAssertEqual(CompanyIdentifier.lifescan.name, #"LifeScan Inc"#)
        XCTAssertEqual(CompanyIdentifier.lifescan.description, #"LifeScan Inc"#)
    
        // Volantic AB
        XCTAssertEqual(CompanyIdentifier.volantic.rawValue, 366)
        XCTAssertEqual(CompanyIdentifier.volantic.name, #"Volantic AB"#)
        XCTAssertEqual(CompanyIdentifier.volantic.description, #"Volantic AB"#)
    
        // Podo Labs, Inc
        XCTAssertEqual(CompanyIdentifier.podoLabs.rawValue, 367)
        XCTAssertEqual(CompanyIdentifier.podoLabs.name, #"Podo Labs, Inc"#)
        XCTAssertEqual(CompanyIdentifier.podoLabs.description, #"Podo Labs, Inc"#)
    
        // Roche Diabetes Care AG
        XCTAssertEqual(CompanyIdentifier.rocheDiabetesCare.rawValue, 368)
        XCTAssertEqual(CompanyIdentifier.rocheDiabetesCare.name, #"Roche Diabetes Care AG"#)
        XCTAssertEqual(CompanyIdentifier.rocheDiabetesCare.description, #"Roche Diabetes Care AG"#)
    
        // Amazon.com Services LLC
        XCTAssertEqual(CompanyIdentifier.amazonComServices.rawValue, 369)
        XCTAssertEqual(CompanyIdentifier.amazonComServices.name, #"Amazon.com Services LLC"#)
        XCTAssertEqual(CompanyIdentifier.amazonComServices.description, #"Amazon.com Services LLC"#)
    
        // Connovate Technology Private Limited
        XCTAssertEqual(CompanyIdentifier.connovateTechnology.rawValue, 370)
        XCTAssertEqual(CompanyIdentifier.connovateTechnology.name, #"Connovate Technology Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.connovateTechnology.description, #"Connovate Technology Private Limited"#)
    
        // Kocomojo, LLC
        XCTAssertEqual(CompanyIdentifier.kocomojo.rawValue, 371)
        XCTAssertEqual(CompanyIdentifier.kocomojo.name, #"Kocomojo, LLC"#)
        XCTAssertEqual(CompanyIdentifier.kocomojo.description, #"Kocomojo, LLC"#)
    
        // Everykey Inc.
        XCTAssertEqual(CompanyIdentifier.everykey.rawValue, 372)
        XCTAssertEqual(CompanyIdentifier.everykey.name, #"Everykey Inc."#)
        XCTAssertEqual(CompanyIdentifier.everykey.description, #"Everykey Inc."#)
    
        // Dynamic Controls
        XCTAssertEqual(CompanyIdentifier.dynamicControls.rawValue, 373)
        XCTAssertEqual(CompanyIdentifier.dynamicControls.name, #"Dynamic Controls"#)
        XCTAssertEqual(CompanyIdentifier.dynamicControls.description, #"Dynamic Controls"#)
    
        // SentriLock
        XCTAssertEqual(CompanyIdentifier.sentrilock.rawValue, 374)
        XCTAssertEqual(CompanyIdentifier.sentrilock.name, #"SentriLock"#)
        XCTAssertEqual(CompanyIdentifier.sentrilock.description, #"SentriLock"#)
    
        // I-SYST inc.
        XCTAssertEqual(CompanyIdentifier.iSyst.rawValue, 375)
        XCTAssertEqual(CompanyIdentifier.iSyst.name, #"I-SYST inc."#)
        XCTAssertEqual(CompanyIdentifier.iSyst.description, #"I-SYST inc."#)
    
        // CASIO COMPUTER CO., LTD.
        XCTAssertEqual(CompanyIdentifier.casioComputer.rawValue, 376)
        XCTAssertEqual(CompanyIdentifier.casioComputer.name, #"CASIO COMPUTER CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.casioComputer.description, #"CASIO COMPUTER CO., LTD."#)
    
        // LAPIS Technology Co., Ltd. formerly LAPIS Semiconductor Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.lapisTechnologyFormerlyLapisSemiconductor.rawValue, 377)
        XCTAssertEqual(CompanyIdentifier.lapisTechnologyFormerlyLapisSemiconductor.name, #"LAPIS Technology Co., Ltd. formerly LAPIS Semiconductor Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.lapisTechnologyFormerlyLapisSemiconductor.description, #"LAPIS Technology Co., Ltd. formerly LAPIS Semiconductor Co., Ltd."#)
    
        // Telemonitor, Inc.
        XCTAssertEqual(CompanyIdentifier.telemonitor.rawValue, 378)
        XCTAssertEqual(CompanyIdentifier.telemonitor.name, #"Telemonitor, Inc."#)
        XCTAssertEqual(CompanyIdentifier.telemonitor.description, #"Telemonitor, Inc."#)
    
        // taskit GmbH
        XCTAssertEqual(CompanyIdentifier.taskit.rawValue, 379)
        XCTAssertEqual(CompanyIdentifier.taskit.name, #"taskit GmbH"#)
        XCTAssertEqual(CompanyIdentifier.taskit.description, #"taskit GmbH"#)
    
        // Mercedes-Benz Group AG
        XCTAssertEqual(CompanyIdentifier.mercedesBenzGroup.rawValue, 380)
        XCTAssertEqual(CompanyIdentifier.mercedesBenzGroup.name, #"Mercedes-Benz Group AG"#)
        XCTAssertEqual(CompanyIdentifier.mercedesBenzGroup.description, #"Mercedes-Benz Group AG"#)
    
        // BatAndCat
        XCTAssertEqual(CompanyIdentifier.batandcat.rawValue, 381)
        XCTAssertEqual(CompanyIdentifier.batandcat.name, #"BatAndCat"#)
        XCTAssertEqual(CompanyIdentifier.batandcat.description, #"BatAndCat"#)
    
        // BluDotz Ltd
        XCTAssertEqual(CompanyIdentifier.bludotz.rawValue, 382)
        XCTAssertEqual(CompanyIdentifier.bludotz.name, #"BluDotz Ltd"#)
        XCTAssertEqual(CompanyIdentifier.bludotz.description, #"BluDotz Ltd"#)
    
        // XTel Wireless ApS
        XCTAssertEqual(CompanyIdentifier.xtelWireless.rawValue, 383)
        XCTAssertEqual(CompanyIdentifier.xtelWireless.name, #"XTel Wireless ApS"#)
        XCTAssertEqual(CompanyIdentifier.xtelWireless.description, #"XTel Wireless ApS"#)
    
        // Gigaset Communications GmbH
        XCTAssertEqual(CompanyIdentifier.gigasetCommunications.rawValue, 384)
        XCTAssertEqual(CompanyIdentifier.gigasetCommunications.name, #"Gigaset Communications GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gigasetCommunications.description, #"Gigaset Communications GmbH"#)
    
        // Gecko Health Innovations, Inc.
        XCTAssertEqual(CompanyIdentifier.geckoHealthInnovations.rawValue, 385)
        XCTAssertEqual(CompanyIdentifier.geckoHealthInnovations.name, #"Gecko Health Innovations, Inc."#)
        XCTAssertEqual(CompanyIdentifier.geckoHealthInnovations.description, #"Gecko Health Innovations, Inc."#)
    
        // HOP Ubiquitous
        XCTAssertEqual(CompanyIdentifier.hopUbiquitous.rawValue, 386)
        XCTAssertEqual(CompanyIdentifier.hopUbiquitous.name, #"HOP Ubiquitous"#)
        XCTAssertEqual(CompanyIdentifier.hopUbiquitous.description, #"HOP Ubiquitous"#)
    
        // Walt Disney
        XCTAssertEqual(CompanyIdentifier.waltDisney.rawValue, 387)
        XCTAssertEqual(CompanyIdentifier.waltDisney.name, #"Walt Disney"#)
        XCTAssertEqual(CompanyIdentifier.waltDisney.description, #"Walt Disney"#)
    
        // Nectar
        XCTAssertEqual(CompanyIdentifier.nectar.rawValue, 388)
        XCTAssertEqual(CompanyIdentifier.nectar.name, #"Nectar"#)
        XCTAssertEqual(CompanyIdentifier.nectar.description, #"Nectar"#)
    
        // bel'apps LLC
        XCTAssertEqual(CompanyIdentifier.belApps.rawValue, 389)
        XCTAssertEqual(CompanyIdentifier.belApps.name, #"bel'apps LLC"#)
        XCTAssertEqual(CompanyIdentifier.belApps.description, #"bel'apps LLC"#)
    
        // CORE Lighting Ltd
        XCTAssertEqual(CompanyIdentifier.coreLighting.rawValue, 390)
        XCTAssertEqual(CompanyIdentifier.coreLighting.name, #"CORE Lighting Ltd"#)
        XCTAssertEqual(CompanyIdentifier.coreLighting.description, #"CORE Lighting Ltd"#)
    
        // Seraphim Sense Ltd
        XCTAssertEqual(CompanyIdentifier.seraphimSense.rawValue, 391)
        XCTAssertEqual(CompanyIdentifier.seraphimSense.name, #"Seraphim Sense Ltd"#)
        XCTAssertEqual(CompanyIdentifier.seraphimSense.description, #"Seraphim Sense Ltd"#)
    
        // Unico RBC
        XCTAssertEqual(CompanyIdentifier.unicoRbc.rawValue, 392)
        XCTAssertEqual(CompanyIdentifier.unicoRbc.name, #"Unico RBC"#)
        XCTAssertEqual(CompanyIdentifier.unicoRbc.description, #"Unico RBC"#)
    
        // Physical Enterprises Inc.
        XCTAssertEqual(CompanyIdentifier.physicalEnterprises.rawValue, 393)
        XCTAssertEqual(CompanyIdentifier.physicalEnterprises.name, #"Physical Enterprises Inc."#)
        XCTAssertEqual(CompanyIdentifier.physicalEnterprises.description, #"Physical Enterprises Inc."#)
    
        // Able Trend Technology Limited
        XCTAssertEqual(CompanyIdentifier.ableTrendTechnology.rawValue, 394)
        XCTAssertEqual(CompanyIdentifier.ableTrendTechnology.name, #"Able Trend Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.ableTrendTechnology.description, #"Able Trend Technology Limited"#)
    
        // Konica Minolta, Inc.
        XCTAssertEqual(CompanyIdentifier.konicaMinolta.rawValue, 395)
        XCTAssertEqual(CompanyIdentifier.konicaMinolta.name, #"Konica Minolta, Inc."#)
        XCTAssertEqual(CompanyIdentifier.konicaMinolta.description, #"Konica Minolta, Inc."#)
    
        // Wilo SE
        XCTAssertEqual(CompanyIdentifier.wiloSe.rawValue, 396)
        XCTAssertEqual(CompanyIdentifier.wiloSe.name, #"Wilo SE"#)
        XCTAssertEqual(CompanyIdentifier.wiloSe.description, #"Wilo SE"#)
    
        // Extron Design Services
        XCTAssertEqual(CompanyIdentifier.extronDesignServices.rawValue, 397)
        XCTAssertEqual(CompanyIdentifier.extronDesignServices.name, #"Extron Design Services"#)
        XCTAssertEqual(CompanyIdentifier.extronDesignServices.description, #"Extron Design Services"#)
    
        // Fitbit, Inc.
        XCTAssertEqual(CompanyIdentifier.fitbit.rawValue, 398)
        XCTAssertEqual(CompanyIdentifier.fitbit.name, #"Fitbit, Inc."#)
        XCTAssertEqual(CompanyIdentifier.fitbit.description, #"Fitbit, Inc."#)
    
        // Fireflies Systems
        XCTAssertEqual(CompanyIdentifier.firefliesSystems.rawValue, 399)
        XCTAssertEqual(CompanyIdentifier.firefliesSystems.name, #"Fireflies Systems"#)
        XCTAssertEqual(CompanyIdentifier.firefliesSystems.description, #"Fireflies Systems"#)
    
        // Intelletto Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.intellettoTechnologies.rawValue, 400)
        XCTAssertEqual(CompanyIdentifier.intellettoTechnologies.name, #"Intelletto Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.intellettoTechnologies.description, #"Intelletto Technologies Inc."#)
    
        // FDK CORPORATION
        XCTAssertEqual(CompanyIdentifier.fdk.rawValue, 401)
        XCTAssertEqual(CompanyIdentifier.fdk.name, #"FDK CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.fdk.description, #"FDK CORPORATION"#)
    
        // Cloudleaf, Inc
        XCTAssertEqual(CompanyIdentifier.cloudleaf.rawValue, 402)
        XCTAssertEqual(CompanyIdentifier.cloudleaf.name, #"Cloudleaf, Inc"#)
        XCTAssertEqual(CompanyIdentifier.cloudleaf.description, #"Cloudleaf, Inc"#)
    
        // Maveric Automation LLC
        XCTAssertEqual(CompanyIdentifier.mavericAutomation.rawValue, 403)
        XCTAssertEqual(CompanyIdentifier.mavericAutomation.name, #"Maveric Automation LLC"#)
        XCTAssertEqual(CompanyIdentifier.mavericAutomation.description, #"Maveric Automation LLC"#)
    
        // Acoustic Stream Corporation
        XCTAssertEqual(CompanyIdentifier.acousticStream.rawValue, 404)
        XCTAssertEqual(CompanyIdentifier.acousticStream.name, #"Acoustic Stream Corporation"#)
        XCTAssertEqual(CompanyIdentifier.acousticStream.description, #"Acoustic Stream Corporation"#)
    
        // Zuli
        XCTAssertEqual(CompanyIdentifier.zuli.rawValue, 405)
        XCTAssertEqual(CompanyIdentifier.zuli.name, #"Zuli"#)
        XCTAssertEqual(CompanyIdentifier.zuli.description, #"Zuli"#)
    
        // Paxton Access Ltd
        XCTAssertEqual(CompanyIdentifier.paxtonAccess.rawValue, 406)
        XCTAssertEqual(CompanyIdentifier.paxtonAccess.name, #"Paxton Access Ltd"#)
        XCTAssertEqual(CompanyIdentifier.paxtonAccess.description, #"Paxton Access Ltd"#)
    
        // WiSilica Inc.
        XCTAssertEqual(CompanyIdentifier.wisilica.rawValue, 407)
        XCTAssertEqual(CompanyIdentifier.wisilica.name, #"WiSilica Inc."#)
        XCTAssertEqual(CompanyIdentifier.wisilica.description, #"WiSilica Inc."#)
    
        // VENGIT Korlatolt Felelossegu Tarsasag
        XCTAssertEqual(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.rawValue, 408)
        XCTAssertEqual(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.name, #"VENGIT Korlatolt Felelossegu Tarsasag"#)
        XCTAssertEqual(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.description, #"VENGIT Korlatolt Felelossegu Tarsasag"#)
    
        // SALTO SYSTEMS S.L.
        XCTAssertEqual(CompanyIdentifier.saltoSystems.rawValue, 409)
        XCTAssertEqual(CompanyIdentifier.saltoSystems.name, #"SALTO SYSTEMS S.L."#)
        XCTAssertEqual(CompanyIdentifier.saltoSystems.description, #"SALTO SYSTEMS S.L."#)
    
        // TRON Forum (formerly T-Engine Forum)
        XCTAssertEqual(CompanyIdentifier.tronForum.rawValue, 410)
        XCTAssertEqual(CompanyIdentifier.tronForum.name, #"TRON Forum (formerly T-Engine Forum)"#)
        XCTAssertEqual(CompanyIdentifier.tronForum.description, #"TRON Forum (formerly T-Engine Forum)"#)
    
        // CUBETECH s.r.o.
        XCTAssertEqual(CompanyIdentifier.cubetech.rawValue, 411)
        XCTAssertEqual(CompanyIdentifier.cubetech.name, #"CUBETECH s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.cubetech.description, #"CUBETECH s.r.o."#)
    
        // Cokiya Incorporated
        XCTAssertEqual(CompanyIdentifier.cokiya.rawValue, 412)
        XCTAssertEqual(CompanyIdentifier.cokiya.name, #"Cokiya Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.cokiya.description, #"Cokiya Incorporated"#)
    
        // CVS Health
        XCTAssertEqual(CompanyIdentifier.cvsHealth.rawValue, 413)
        XCTAssertEqual(CompanyIdentifier.cvsHealth.name, #"CVS Health"#)
        XCTAssertEqual(CompanyIdentifier.cvsHealth.description, #"CVS Health"#)
    
        // Ceruus
        XCTAssertEqual(CompanyIdentifier.ceruus.rawValue, 414)
        XCTAssertEqual(CompanyIdentifier.ceruus.name, #"Ceruus"#)
        XCTAssertEqual(CompanyIdentifier.ceruus.description, #"Ceruus"#)
    
        // Strainstall Ltd
        XCTAssertEqual(CompanyIdentifier.strainstall.rawValue, 415)
        XCTAssertEqual(CompanyIdentifier.strainstall.name, #"Strainstall Ltd"#)
        XCTAssertEqual(CompanyIdentifier.strainstall.description, #"Strainstall Ltd"#)
    
        // Channel Enterprises (HK) Ltd.
        XCTAssertEqual(CompanyIdentifier.channelEnterprises.rawValue, 416)
        XCTAssertEqual(CompanyIdentifier.channelEnterprises.name, #"Channel Enterprises (HK) Ltd."#)
        XCTAssertEqual(CompanyIdentifier.channelEnterprises.description, #"Channel Enterprises (HK) Ltd."#)
    
        // FIAMM
        XCTAssertEqual(CompanyIdentifier.fiamm.rawValue, 417)
        XCTAssertEqual(CompanyIdentifier.fiamm.name, #"FIAMM"#)
        XCTAssertEqual(CompanyIdentifier.fiamm.description, #"FIAMM"#)
    
        // GIGALANE.CO.,LTD
        XCTAssertEqual(CompanyIdentifier.gigalane.rawValue, 418)
        XCTAssertEqual(CompanyIdentifier.gigalane.name, #"GIGALANE.CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.gigalane.description, #"GIGALANE.CO.,LTD"#)
    
        // EROAD
        XCTAssertEqual(CompanyIdentifier.eroad.rawValue, 419)
        XCTAssertEqual(CompanyIdentifier.eroad.name, #"EROAD"#)
        XCTAssertEqual(CompanyIdentifier.eroad.description, #"EROAD"#)
    
        // Mine Safety Appliances
        XCTAssertEqual(CompanyIdentifier.mineSafetyAppliances.rawValue, 420)
        XCTAssertEqual(CompanyIdentifier.mineSafetyAppliances.name, #"Mine Safety Appliances"#)
        XCTAssertEqual(CompanyIdentifier.mineSafetyAppliances.description, #"Mine Safety Appliances"#)
    
        // Icon Health and Fitness
        XCTAssertEqual(CompanyIdentifier.iconHealthAndFitness.rawValue, 421)
        XCTAssertEqual(CompanyIdentifier.iconHealthAndFitness.name, #"Icon Health and Fitness"#)
        XCTAssertEqual(CompanyIdentifier.iconHealthAndFitness.description, #"Icon Health and Fitness"#)
    
        // Wille Engineering (formely as Asandoo GmbH)
        XCTAssertEqual(CompanyIdentifier.willeEngineeringFormelyAsAsandoo.rawValue, 422)
        XCTAssertEqual(CompanyIdentifier.willeEngineeringFormelyAsAsandoo.name, #"Wille Engineering (formely as Asandoo GmbH)"#)
        XCTAssertEqual(CompanyIdentifier.willeEngineeringFormelyAsAsandoo.description, #"Wille Engineering (formely as Asandoo GmbH)"#)
    
        // ENERGOUS CORPORATION
        XCTAssertEqual(CompanyIdentifier.energous.rawValue, 423)
        XCTAssertEqual(CompanyIdentifier.energous.name, #"ENERGOUS CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.energous.description, #"ENERGOUS CORPORATION"#)
    
        // Taobao
        XCTAssertEqual(CompanyIdentifier.taobao.rawValue, 424)
        XCTAssertEqual(CompanyIdentifier.taobao.name, #"Taobao"#)
        XCTAssertEqual(CompanyIdentifier.taobao.description, #"Taobao"#)
    
        // Canon Inc.
        XCTAssertEqual(CompanyIdentifier.canon.rawValue, 425)
        XCTAssertEqual(CompanyIdentifier.canon.name, #"Canon Inc."#)
        XCTAssertEqual(CompanyIdentifier.canon.description, #"Canon Inc."#)
    
        // Geophysical Technology Inc.
        XCTAssertEqual(CompanyIdentifier.geophysicalTechnology.rawValue, 426)
        XCTAssertEqual(CompanyIdentifier.geophysicalTechnology.name, #"Geophysical Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.geophysicalTechnology.description, #"Geophysical Technology Inc."#)
    
        // Facebook, Inc.
        XCTAssertEqual(CompanyIdentifier.facebook.rawValue, 427)
        XCTAssertEqual(CompanyIdentifier.facebook.name, #"Facebook, Inc."#)
        XCTAssertEqual(CompanyIdentifier.facebook.description, #"Facebook, Inc."#)
    
        // Trividia Health, Inc.
        XCTAssertEqual(CompanyIdentifier.trividiaHealth.rawValue, 428)
        XCTAssertEqual(CompanyIdentifier.trividiaHealth.name, #"Trividia Health, Inc."#)
        XCTAssertEqual(CompanyIdentifier.trividiaHealth.description, #"Trividia Health, Inc."#)
    
        // FlightSafety International
        XCTAssertEqual(CompanyIdentifier.flightsafetyInternational.rawValue, 429)
        XCTAssertEqual(CompanyIdentifier.flightsafetyInternational.name, #"FlightSafety International"#)
        XCTAssertEqual(CompanyIdentifier.flightsafetyInternational.description, #"FlightSafety International"#)
    
        // Earlens Corporation
        XCTAssertEqual(CompanyIdentifier.earlens.rawValue, 430)
        XCTAssertEqual(CompanyIdentifier.earlens.name, #"Earlens Corporation"#)
        XCTAssertEqual(CompanyIdentifier.earlens.description, #"Earlens Corporation"#)
    
        // Sunrise Micro Devices, Inc.
        XCTAssertEqual(CompanyIdentifier.sunriseMicroDevices.rawValue, 431)
        XCTAssertEqual(CompanyIdentifier.sunriseMicroDevices.name, #"Sunrise Micro Devices, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sunriseMicroDevices.description, #"Sunrise Micro Devices, Inc."#)
    
        // Star Micronics Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.starMicronics.rawValue, 432)
        XCTAssertEqual(CompanyIdentifier.starMicronics.name, #"Star Micronics Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.starMicronics.description, #"Star Micronics Co., Ltd."#)
    
        // Netizens Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.netizens.rawValue, 433)
        XCTAssertEqual(CompanyIdentifier.netizens.name, #"Netizens Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.netizens.description, #"Netizens Sp. z o.o."#)
    
        // Nymi Inc.
        XCTAssertEqual(CompanyIdentifier.nymi.rawValue, 434)
        XCTAssertEqual(CompanyIdentifier.nymi.name, #"Nymi Inc."#)
        XCTAssertEqual(CompanyIdentifier.nymi.description, #"Nymi Inc."#)
    
        // Nytec, Inc.
        XCTAssertEqual(CompanyIdentifier.nytec.rawValue, 435)
        XCTAssertEqual(CompanyIdentifier.nytec.name, #"Nytec, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nytec.description, #"Nytec, Inc."#)
    
        // Trineo Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.trineo.rawValue, 436)
        XCTAssertEqual(CompanyIdentifier.trineo.name, #"Trineo Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.trineo.description, #"Trineo Sp. z o.o."#)
    
        // Nest Labs Inc.
        XCTAssertEqual(CompanyIdentifier.nestLabs.rawValue, 437)
        XCTAssertEqual(CompanyIdentifier.nestLabs.name, #"Nest Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.nestLabs.description, #"Nest Labs Inc."#)
    
        // LM Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.lmTechnologies.rawValue, 438)
        XCTAssertEqual(CompanyIdentifier.lmTechnologies.name, #"LM Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.lmTechnologies.description, #"LM Technologies Ltd"#)
    
        // General Electric Company
        XCTAssertEqual(CompanyIdentifier.generalElectricCompany.rawValue, 439)
        XCTAssertEqual(CompanyIdentifier.generalElectricCompany.name, #"General Electric Company"#)
        XCTAssertEqual(CompanyIdentifier.generalElectricCompany.description, #"General Electric Company"#)
    
        // i+D3 S.L.
        XCTAssertEqual(CompanyIdentifier.iD3.rawValue, 440)
        XCTAssertEqual(CompanyIdentifier.iD3.name, #"i+D3 S.L."#)
        XCTAssertEqual(CompanyIdentifier.iD3.description, #"i+D3 S.L."#)
    
        // HANA Micron
        XCTAssertEqual(CompanyIdentifier.hanaMicron.rawValue, 441)
        XCTAssertEqual(CompanyIdentifier.hanaMicron.name, #"HANA Micron"#)
        XCTAssertEqual(CompanyIdentifier.hanaMicron.description, #"HANA Micron"#)
    
        // Stages Cycling LLC
        XCTAssertEqual(CompanyIdentifier.stagesCycling.rawValue, 442)
        XCTAssertEqual(CompanyIdentifier.stagesCycling.name, #"Stages Cycling LLC"#)
        XCTAssertEqual(CompanyIdentifier.stagesCycling.description, #"Stages Cycling LLC"#)
    
        // Cochlear Bone Anchored Solutions AB
        XCTAssertEqual(CompanyIdentifier.cochlearBoneAnchoredSolutions.rawValue, 443)
        XCTAssertEqual(CompanyIdentifier.cochlearBoneAnchoredSolutions.name, #"Cochlear Bone Anchored Solutions AB"#)
        XCTAssertEqual(CompanyIdentifier.cochlearBoneAnchoredSolutions.description, #"Cochlear Bone Anchored Solutions AB"#)
    
        // SenionLab AB
        XCTAssertEqual(CompanyIdentifier.senionlab.rawValue, 444)
        XCTAssertEqual(CompanyIdentifier.senionlab.name, #"SenionLab AB"#)
        XCTAssertEqual(CompanyIdentifier.senionlab.description, #"SenionLab AB"#)
    
        // Syszone Co., Ltd
        XCTAssertEqual(CompanyIdentifier.syszone.rawValue, 445)
        XCTAssertEqual(CompanyIdentifier.syszone.name, #"Syszone Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.syszone.description, #"Syszone Co., Ltd"#)
    
        // Pulsate Mobile Ltd.
        XCTAssertEqual(CompanyIdentifier.pulsateMobile.rawValue, 446)
        XCTAssertEqual(CompanyIdentifier.pulsateMobile.name, #"Pulsate Mobile Ltd."#)
        XCTAssertEqual(CompanyIdentifier.pulsateMobile.description, #"Pulsate Mobile Ltd."#)
    
        // Hong Kong HunterSun Electronic Limited
        XCTAssertEqual(CompanyIdentifier.hongKongHuntersunElectronic.rawValue, 447)
        XCTAssertEqual(CompanyIdentifier.hongKongHuntersunElectronic.name, #"Hong Kong HunterSun Electronic Limited"#)
        XCTAssertEqual(CompanyIdentifier.hongKongHuntersunElectronic.description, #"Hong Kong HunterSun Electronic Limited"#)
    
        // pironex GmbH
        XCTAssertEqual(CompanyIdentifier.pironex.rawValue, 448)
        XCTAssertEqual(CompanyIdentifier.pironex.name, #"pironex GmbH"#)
        XCTAssertEqual(CompanyIdentifier.pironex.description, #"pironex GmbH"#)
    
        // BRADATECH Corp.
        XCTAssertEqual(CompanyIdentifier.bradatech.rawValue, 449)
        XCTAssertEqual(CompanyIdentifier.bradatech.name, #"BRADATECH Corp."#)
        XCTAssertEqual(CompanyIdentifier.bradatech.description, #"BRADATECH Corp."#)
    
        // Transenergooil AG
        XCTAssertEqual(CompanyIdentifier.transenergooil.rawValue, 450)
        XCTAssertEqual(CompanyIdentifier.transenergooil.name, #"Transenergooil AG"#)
        XCTAssertEqual(CompanyIdentifier.transenergooil.description, #"Transenergooil AG"#)
    
        // Bunch
        XCTAssertEqual(CompanyIdentifier.bunch.rawValue, 451)
        XCTAssertEqual(CompanyIdentifier.bunch.name, #"Bunch"#)
        XCTAssertEqual(CompanyIdentifier.bunch.description, #"Bunch"#)
    
        // DME Microelectronics
        XCTAssertEqual(CompanyIdentifier.dmeMicroelectronics.rawValue, 452)
        XCTAssertEqual(CompanyIdentifier.dmeMicroelectronics.name, #"DME Microelectronics"#)
        XCTAssertEqual(CompanyIdentifier.dmeMicroelectronics.description, #"DME Microelectronics"#)
    
        // Bitcraze AB
        XCTAssertEqual(CompanyIdentifier.bitcraze.rawValue, 453)
        XCTAssertEqual(CompanyIdentifier.bitcraze.name, #"Bitcraze AB"#)
        XCTAssertEqual(CompanyIdentifier.bitcraze.description, #"Bitcraze AB"#)
    
        // HASWARE Inc.
        XCTAssertEqual(CompanyIdentifier.hasware.rawValue, 454)
        XCTAssertEqual(CompanyIdentifier.hasware.name, #"HASWARE Inc."#)
        XCTAssertEqual(CompanyIdentifier.hasware.description, #"HASWARE Inc."#)
    
        // Abiogenix Inc.
        XCTAssertEqual(CompanyIdentifier.abiogenix.rawValue, 455)
        XCTAssertEqual(CompanyIdentifier.abiogenix.name, #"Abiogenix Inc."#)
        XCTAssertEqual(CompanyIdentifier.abiogenix.description, #"Abiogenix Inc."#)
    
        // Poly-Control ApS
        XCTAssertEqual(CompanyIdentifier.polyControl.rawValue, 456)
        XCTAssertEqual(CompanyIdentifier.polyControl.name, #"Poly-Control ApS"#)
        XCTAssertEqual(CompanyIdentifier.polyControl.description, #"Poly-Control ApS"#)
    
        // Avi-on
        XCTAssertEqual(CompanyIdentifier.aviOn.rawValue, 457)
        XCTAssertEqual(CompanyIdentifier.aviOn.name, #"Avi-on"#)
        XCTAssertEqual(CompanyIdentifier.aviOn.description, #"Avi-on"#)
    
        // Laerdal Medical AS
        XCTAssertEqual(CompanyIdentifier.laerdalMedical.rawValue, 458)
        XCTAssertEqual(CompanyIdentifier.laerdalMedical.name, #"Laerdal Medical AS"#)
        XCTAssertEqual(CompanyIdentifier.laerdalMedical.description, #"Laerdal Medical AS"#)
    
        // Fetch My Pet
        XCTAssertEqual(CompanyIdentifier.fetchMyPet.rawValue, 459)
        XCTAssertEqual(CompanyIdentifier.fetchMyPet.name, #"Fetch My Pet"#)
        XCTAssertEqual(CompanyIdentifier.fetchMyPet.description, #"Fetch My Pet"#)
    
        // Sam Labs Ltd.
        XCTAssertEqual(CompanyIdentifier.samLabs.rawValue, 460)
        XCTAssertEqual(CompanyIdentifier.samLabs.name, #"Sam Labs Ltd."#)
        XCTAssertEqual(CompanyIdentifier.samLabs.description, #"Sam Labs Ltd."#)
    
        // Chengdu Synwing Technology Ltd
        XCTAssertEqual(CompanyIdentifier.chengduSynwingTechnology.rawValue, 461)
        XCTAssertEqual(CompanyIdentifier.chengduSynwingTechnology.name, #"Chengdu Synwing Technology Ltd"#)
        XCTAssertEqual(CompanyIdentifier.chengduSynwingTechnology.description, #"Chengdu Synwing Technology Ltd"#)
    
        // HOUWA SYSTEM DESIGN, k.k.
        XCTAssertEqual(CompanyIdentifier.houwaSystemDesignKK.rawValue, 462)
        XCTAssertEqual(CompanyIdentifier.houwaSystemDesignKK.name, #"HOUWA SYSTEM DESIGN, k.k."#)
        XCTAssertEqual(CompanyIdentifier.houwaSystemDesignKK.description, #"HOUWA SYSTEM DESIGN, k.k."#)
    
        // BSH
        XCTAssertEqual(CompanyIdentifier.bsh.rawValue, 463)
        XCTAssertEqual(CompanyIdentifier.bsh.name, #"BSH"#)
        XCTAssertEqual(CompanyIdentifier.bsh.description, #"BSH"#)
    
        // Primus Inter Pares Ltd
        XCTAssertEqual(CompanyIdentifier.primusInterPares.rawValue, 464)
        XCTAssertEqual(CompanyIdentifier.primusInterPares.name, #"Primus Inter Pares Ltd"#)
        XCTAssertEqual(CompanyIdentifier.primusInterPares.description, #"Primus Inter Pares Ltd"#)
    
        // August Home, Inc
        XCTAssertEqual(CompanyIdentifier.augustHome.rawValue, 465)
        XCTAssertEqual(CompanyIdentifier.augustHome.name, #"August Home, Inc"#)
        XCTAssertEqual(CompanyIdentifier.augustHome.description, #"August Home, Inc"#)
    
        // Gill Electronics
        XCTAssertEqual(CompanyIdentifier.gillElectronics.rawValue, 466)
        XCTAssertEqual(CompanyIdentifier.gillElectronics.name, #"Gill Electronics"#)
        XCTAssertEqual(CompanyIdentifier.gillElectronics.description, #"Gill Electronics"#)
    
        // Sky Wave Design
        XCTAssertEqual(CompanyIdentifier.skyWaveDesign.rawValue, 467)
        XCTAssertEqual(CompanyIdentifier.skyWaveDesign.name, #"Sky Wave Design"#)
        XCTAssertEqual(CompanyIdentifier.skyWaveDesign.description, #"Sky Wave Design"#)
    
        // Newlab S.r.l.
        XCTAssertEqual(CompanyIdentifier.newlab.rawValue, 468)
        XCTAssertEqual(CompanyIdentifier.newlab.name, #"Newlab S.r.l."#)
        XCTAssertEqual(CompanyIdentifier.newlab.description, #"Newlab S.r.l."#)
    
        // ELAD srl
        XCTAssertEqual(CompanyIdentifier.elad.rawValue, 469)
        XCTAssertEqual(CompanyIdentifier.elad.name, #"ELAD srl"#)
        XCTAssertEqual(CompanyIdentifier.elad.description, #"ELAD srl"#)
    
        // G-wearables inc.
        XCTAssertEqual(CompanyIdentifier.gWearables.rawValue, 470)
        XCTAssertEqual(CompanyIdentifier.gWearables.name, #"G-wearables inc."#)
        XCTAssertEqual(CompanyIdentifier.gWearables.description, #"G-wearables inc."#)
    
        // Squadrone Systems Inc.
        XCTAssertEqual(CompanyIdentifier.squadroneSystems.rawValue, 471)
        XCTAssertEqual(CompanyIdentifier.squadroneSystems.name, #"Squadrone Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.squadroneSystems.description, #"Squadrone Systems Inc."#)
    
        // Code Corporation
        XCTAssertEqual(CompanyIdentifier.code.rawValue, 472)
        XCTAssertEqual(CompanyIdentifier.code.name, #"Code Corporation"#)
        XCTAssertEqual(CompanyIdentifier.code.description, #"Code Corporation"#)
    
        // Savant Systems LLC
        XCTAssertEqual(CompanyIdentifier.savantSystems.rawValue, 473)
        XCTAssertEqual(CompanyIdentifier.savantSystems.name, #"Savant Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.savantSystems.description, #"Savant Systems LLC"#)
    
        // Logitech International SA
        XCTAssertEqual(CompanyIdentifier.logitechInternational.rawValue, 474)
        XCTAssertEqual(CompanyIdentifier.logitechInternational.name, #"Logitech International SA"#)
        XCTAssertEqual(CompanyIdentifier.logitechInternational.description, #"Logitech International SA"#)
    
        // Innblue Consulting
        XCTAssertEqual(CompanyIdentifier.innblueConsulting.rawValue, 475)
        XCTAssertEqual(CompanyIdentifier.innblueConsulting.name, #"Innblue Consulting"#)
        XCTAssertEqual(CompanyIdentifier.innblueConsulting.description, #"Innblue Consulting"#)
    
        // iParking Ltd.
        XCTAssertEqual(CompanyIdentifier.iparking.rawValue, 476)
        XCTAssertEqual(CompanyIdentifier.iparking.name, #"iParking Ltd."#)
        XCTAssertEqual(CompanyIdentifier.iparking.description, #"iParking Ltd."#)
    
        // Koninklijke Philips Electronics N.V.
        XCTAssertEqual(CompanyIdentifier.koninklijkePhilipsElectronics.rawValue, 477)
        XCTAssertEqual(CompanyIdentifier.koninklijkePhilipsElectronics.name, #"Koninklijke Philips Electronics N.V."#)
        XCTAssertEqual(CompanyIdentifier.koninklijkePhilipsElectronics.description, #"Koninklijke Philips Electronics N.V."#)
    
        // Minelab Electronics Pty Limited
        XCTAssertEqual(CompanyIdentifier.minelabElectronicsPty.rawValue, 478)
        XCTAssertEqual(CompanyIdentifier.minelabElectronicsPty.name, #"Minelab Electronics Pty Limited"#)
        XCTAssertEqual(CompanyIdentifier.minelabElectronicsPty.description, #"Minelab Electronics Pty Limited"#)
    
        // Bison Group Ltd.
        XCTAssertEqual(CompanyIdentifier.bisonGroup.rawValue, 479)
        XCTAssertEqual(CompanyIdentifier.bisonGroup.name, #"Bison Group Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bisonGroup.description, #"Bison Group Ltd."#)
    
        // Widex A/S
        XCTAssertEqual(CompanyIdentifier.widex.rawValue, 480)
        XCTAssertEqual(CompanyIdentifier.widex.name, #"Widex A/S"#)
        XCTAssertEqual(CompanyIdentifier.widex.description, #"Widex A/S"#)
    
        // Jolla Ltd
        XCTAssertEqual(CompanyIdentifier.jolla.rawValue, 481)
        XCTAssertEqual(CompanyIdentifier.jolla.name, #"Jolla Ltd"#)
        XCTAssertEqual(CompanyIdentifier.jolla.description, #"Jolla Ltd"#)
    
        // Lectronix, Inc.
        XCTAssertEqual(CompanyIdentifier.lectronix.rawValue, 482)
        XCTAssertEqual(CompanyIdentifier.lectronix.name, #"Lectronix, Inc."#)
        XCTAssertEqual(CompanyIdentifier.lectronix.description, #"Lectronix, Inc."#)
    
        // Caterpillar Inc
        XCTAssertEqual(CompanyIdentifier.caterpillar.rawValue, 483)
        XCTAssertEqual(CompanyIdentifier.caterpillar.name, #"Caterpillar Inc"#)
        XCTAssertEqual(CompanyIdentifier.caterpillar.description, #"Caterpillar Inc"#)
    
        // Freedom Innovations
        XCTAssertEqual(CompanyIdentifier.freedomInnovations.rawValue, 484)
        XCTAssertEqual(CompanyIdentifier.freedomInnovations.name, #"Freedom Innovations"#)
        XCTAssertEqual(CompanyIdentifier.freedomInnovations.description, #"Freedom Innovations"#)
    
        // Dynamic Devices Ltd
        XCTAssertEqual(CompanyIdentifier.dynamicDevices.rawValue, 485)
        XCTAssertEqual(CompanyIdentifier.dynamicDevices.name, #"Dynamic Devices Ltd"#)
        XCTAssertEqual(CompanyIdentifier.dynamicDevices.description, #"Dynamic Devices Ltd"#)
    
        // Technology Solutions (UK) Ltd
        XCTAssertEqual(CompanyIdentifier.technologySolutionsUk.rawValue, 486)
        XCTAssertEqual(CompanyIdentifier.technologySolutionsUk.name, #"Technology Solutions (UK) Ltd"#)
        XCTAssertEqual(CompanyIdentifier.technologySolutionsUk.description, #"Technology Solutions (UK) Ltd"#)
    
        // IPS Group Inc.
        XCTAssertEqual(CompanyIdentifier.ipsGroup.rawValue, 487)
        XCTAssertEqual(CompanyIdentifier.ipsGroup.name, #"IPS Group Inc."#)
        XCTAssertEqual(CompanyIdentifier.ipsGroup.description, #"IPS Group Inc."#)
    
        // STIR
        XCTAssertEqual(CompanyIdentifier.stir.rawValue, 488)
        XCTAssertEqual(CompanyIdentifier.stir.name, #"STIR"#)
        XCTAssertEqual(CompanyIdentifier.stir.description, #"STIR"#)
    
        // Sano, Inc.
        XCTAssertEqual(CompanyIdentifier.sano.rawValue, 489)
        XCTAssertEqual(CompanyIdentifier.sano.name, #"Sano, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sano.description, #"Sano, Inc."#)
    
        // Advanced Application Design, Inc.
        XCTAssertEqual(CompanyIdentifier.advancedApplicationDesign.rawValue, 490)
        XCTAssertEqual(CompanyIdentifier.advancedApplicationDesign.name, #"Advanced Application Design, Inc."#)
        XCTAssertEqual(CompanyIdentifier.advancedApplicationDesign.description, #"Advanced Application Design, Inc."#)
    
        // AutoMap LLC
        XCTAssertEqual(CompanyIdentifier.automap.rawValue, 491)
        XCTAssertEqual(CompanyIdentifier.automap.name, #"AutoMap LLC"#)
        XCTAssertEqual(CompanyIdentifier.automap.description, #"AutoMap LLC"#)
    
        // Spreadtrum Communications Shanghai Ltd
        XCTAssertEqual(CompanyIdentifier.spreadtrumCommunicationsShanghai.rawValue, 492)
        XCTAssertEqual(CompanyIdentifier.spreadtrumCommunicationsShanghai.name, #"Spreadtrum Communications Shanghai Ltd"#)
        XCTAssertEqual(CompanyIdentifier.spreadtrumCommunicationsShanghai.description, #"Spreadtrum Communications Shanghai Ltd"#)
    
        // CuteCircuit LTD
        XCTAssertEqual(CompanyIdentifier.cutecircuit.rawValue, 493)
        XCTAssertEqual(CompanyIdentifier.cutecircuit.name, #"CuteCircuit LTD"#)
        XCTAssertEqual(CompanyIdentifier.cutecircuit.description, #"CuteCircuit LTD"#)
    
        // Valeo Service
        XCTAssertEqual(CompanyIdentifier.valeoService.rawValue, 494)
        XCTAssertEqual(CompanyIdentifier.valeoService.name, #"Valeo Service"#)
        XCTAssertEqual(CompanyIdentifier.valeoService.description, #"Valeo Service"#)
    
        // Fullpower Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.fullpowerTechnologies.rawValue, 495)
        XCTAssertEqual(CompanyIdentifier.fullpowerTechnologies.name, #"Fullpower Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.fullpowerTechnologies.description, #"Fullpower Technologies, Inc."#)
    
        // KloudNation
        XCTAssertEqual(CompanyIdentifier.kloudnation.rawValue, 496)
        XCTAssertEqual(CompanyIdentifier.kloudnation.name, #"KloudNation"#)
        XCTAssertEqual(CompanyIdentifier.kloudnation.description, #"KloudNation"#)
    
        // Zebra Technologies Corporation
        XCTAssertEqual(CompanyIdentifier.zebraTechnologies.rawValue, 497)
        XCTAssertEqual(CompanyIdentifier.zebraTechnologies.name, #"Zebra Technologies Corporation"#)
        XCTAssertEqual(CompanyIdentifier.zebraTechnologies.description, #"Zebra Technologies Corporation"#)
    
        // Itron, Inc.
        XCTAssertEqual(CompanyIdentifier.itron.rawValue, 498)
        XCTAssertEqual(CompanyIdentifier.itron.name, #"Itron, Inc."#)
        XCTAssertEqual(CompanyIdentifier.itron.description, #"Itron, Inc."#)
    
        // The University of Tokyo
        XCTAssertEqual(CompanyIdentifier.universityOfTokyo.rawValue, 499)
        XCTAssertEqual(CompanyIdentifier.universityOfTokyo.name, #"The University of Tokyo"#)
        XCTAssertEqual(CompanyIdentifier.universityOfTokyo.description, #"The University of Tokyo"#)
    
        // UTC Fire and Security
        XCTAssertEqual(CompanyIdentifier.utcFireAndSecurity.rawValue, 500)
        XCTAssertEqual(CompanyIdentifier.utcFireAndSecurity.name, #"UTC Fire and Security"#)
        XCTAssertEqual(CompanyIdentifier.utcFireAndSecurity.description, #"UTC Fire and Security"#)
    
        // Cool Webthings Limited
        XCTAssertEqual(CompanyIdentifier.coolWebthings.rawValue, 501)
        XCTAssertEqual(CompanyIdentifier.coolWebthings.name, #"Cool Webthings Limited"#)
        XCTAssertEqual(CompanyIdentifier.coolWebthings.description, #"Cool Webthings Limited"#)
    
        // DJO Global
        XCTAssertEqual(CompanyIdentifier.djoGlobal.rawValue, 502)
        XCTAssertEqual(CompanyIdentifier.djoGlobal.name, #"DJO Global"#)
        XCTAssertEqual(CompanyIdentifier.djoGlobal.description, #"DJO Global"#)
    
        // Gelliner Limited
        XCTAssertEqual(CompanyIdentifier.gelliner.rawValue, 503)
        XCTAssertEqual(CompanyIdentifier.gelliner.name, #"Gelliner Limited"#)
        XCTAssertEqual(CompanyIdentifier.gelliner.description, #"Gelliner Limited"#)
    
        // Anyka (Guangzhou) Microelectronics Technology Co, LTD
        XCTAssertEqual(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.rawValue, 504)
        XCTAssertEqual(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.name, #"Anyka (Guangzhou) Microelectronics Technology Co, LTD"#)
        XCTAssertEqual(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.description, #"Anyka (Guangzhou) Microelectronics Technology Co, LTD"#)
    
        // Medtronic Inc.
        XCTAssertEqual(CompanyIdentifier.medtronic.rawValue, 505)
        XCTAssertEqual(CompanyIdentifier.medtronic.name, #"Medtronic Inc."#)
        XCTAssertEqual(CompanyIdentifier.medtronic.description, #"Medtronic Inc."#)
    
        // Gozio Inc.
        XCTAssertEqual(CompanyIdentifier.gozio.rawValue, 506)
        XCTAssertEqual(CompanyIdentifier.gozio.name, #"Gozio Inc."#)
        XCTAssertEqual(CompanyIdentifier.gozio.description, #"Gozio Inc."#)
    
        // Form Lifting, LLC
        XCTAssertEqual(CompanyIdentifier.formLifting.rawValue, 507)
        XCTAssertEqual(CompanyIdentifier.formLifting.name, #"Form Lifting, LLC"#)
        XCTAssertEqual(CompanyIdentifier.formLifting.description, #"Form Lifting, LLC"#)
    
        // Wahoo Fitness, LLC
        XCTAssertEqual(CompanyIdentifier.wahooFitness.rawValue, 508)
        XCTAssertEqual(CompanyIdentifier.wahooFitness.name, #"Wahoo Fitness, LLC"#)
        XCTAssertEqual(CompanyIdentifier.wahooFitness.description, #"Wahoo Fitness, LLC"#)
    
        // Kontakt Micro-Location Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.kontaktMicroLocation.rawValue, 509)
        XCTAssertEqual(CompanyIdentifier.kontaktMicroLocation.name, #"Kontakt Micro-Location Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.kontaktMicroLocation.description, #"Kontakt Micro-Location Sp. z o.o."#)
    
        // Radio Systems Corporation
        XCTAssertEqual(CompanyIdentifier.radioSystems.rawValue, 510)
        XCTAssertEqual(CompanyIdentifier.radioSystems.name, #"Radio Systems Corporation"#)
        XCTAssertEqual(CompanyIdentifier.radioSystems.description, #"Radio Systems Corporation"#)
    
        // Freescale Semiconductor, Inc.
        XCTAssertEqual(CompanyIdentifier.freescaleSemiconductor.rawValue, 511)
        XCTAssertEqual(CompanyIdentifier.freescaleSemiconductor.name, #"Freescale Semiconductor, Inc."#)
        XCTAssertEqual(CompanyIdentifier.freescaleSemiconductor.description, #"Freescale Semiconductor, Inc."#)
    
        // Verifone Systems Pte Ltd. Taiwan Branch
        XCTAssertEqual(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.rawValue, 512)
        XCTAssertEqual(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.name, #"Verifone Systems Pte Ltd. Taiwan Branch"#)
        XCTAssertEqual(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.description, #"Verifone Systems Pte Ltd. Taiwan Branch"#)
    
        // AR Timing
        XCTAssertEqual(CompanyIdentifier.arTiming.rawValue, 513)
        XCTAssertEqual(CompanyIdentifier.arTiming.name, #"AR Timing"#)
        XCTAssertEqual(CompanyIdentifier.arTiming.description, #"AR Timing"#)
    
        // Rigado LLC
        XCTAssertEqual(CompanyIdentifier.rigado.rawValue, 514)
        XCTAssertEqual(CompanyIdentifier.rigado.name, #"Rigado LLC"#)
        XCTAssertEqual(CompanyIdentifier.rigado.description, #"Rigado LLC"#)
    
        // Kemppi Oy
        XCTAssertEqual(CompanyIdentifier.kemppi.rawValue, 515)
        XCTAssertEqual(CompanyIdentifier.kemppi.name, #"Kemppi Oy"#)
        XCTAssertEqual(CompanyIdentifier.kemppi.description, #"Kemppi Oy"#)
    
        // Tapcentive Inc.
        XCTAssertEqual(CompanyIdentifier.tapcentive.rawValue, 516)
        XCTAssertEqual(CompanyIdentifier.tapcentive.name, #"Tapcentive Inc."#)
        XCTAssertEqual(CompanyIdentifier.tapcentive.description, #"Tapcentive Inc."#)
    
        // Smartbotics Inc.
        XCTAssertEqual(CompanyIdentifier.smartbotics.rawValue, 517)
        XCTAssertEqual(CompanyIdentifier.smartbotics.name, #"Smartbotics Inc."#)
        XCTAssertEqual(CompanyIdentifier.smartbotics.description, #"Smartbotics Inc."#)
    
        // Otter Products, LLC
        XCTAssertEqual(CompanyIdentifier.otterProducts.rawValue, 518)
        XCTAssertEqual(CompanyIdentifier.otterProducts.name, #"Otter Products, LLC"#)
        XCTAssertEqual(CompanyIdentifier.otterProducts.description, #"Otter Products, LLC"#)
    
        // STEMP Inc.
        XCTAssertEqual(CompanyIdentifier.stemp.rawValue, 519)
        XCTAssertEqual(CompanyIdentifier.stemp.name, #"STEMP Inc."#)
        XCTAssertEqual(CompanyIdentifier.stemp.description, #"STEMP Inc."#)
    
        // LumiGeek LLC
        XCTAssertEqual(CompanyIdentifier.lumigeek.rawValue, 520)
        XCTAssertEqual(CompanyIdentifier.lumigeek.name, #"LumiGeek LLC"#)
        XCTAssertEqual(CompanyIdentifier.lumigeek.description, #"LumiGeek LLC"#)
    
        // InvisionHeart Inc.
        XCTAssertEqual(CompanyIdentifier.invisionheart.rawValue, 521)
        XCTAssertEqual(CompanyIdentifier.invisionheart.name, #"InvisionHeart Inc."#)
        XCTAssertEqual(CompanyIdentifier.invisionheart.description, #"InvisionHeart Inc."#)
    
        // Macnica Inc.
        XCTAssertEqual(CompanyIdentifier.macnica.rawValue, 522)
        XCTAssertEqual(CompanyIdentifier.macnica.name, #"Macnica Inc."#)
        XCTAssertEqual(CompanyIdentifier.macnica.description, #"Macnica Inc."#)
    
        // Jaguar Land Rover Limited
        XCTAssertEqual(CompanyIdentifier.jaguarLandRover.rawValue, 523)
        XCTAssertEqual(CompanyIdentifier.jaguarLandRover.name, #"Jaguar Land Rover Limited"#)
        XCTAssertEqual(CompanyIdentifier.jaguarLandRover.description, #"Jaguar Land Rover Limited"#)
    
        // CoroWare Technologies, Inc
        XCTAssertEqual(CompanyIdentifier.corowareTechnologies.rawValue, 524)
        XCTAssertEqual(CompanyIdentifier.corowareTechnologies.name, #"CoroWare Technologies, Inc"#)
        XCTAssertEqual(CompanyIdentifier.corowareTechnologies.description, #"CoroWare Technologies, Inc"#)
    
        // Simplo Technology Co., LTD
        XCTAssertEqual(CompanyIdentifier.simploTechnology.rawValue, 525)
        XCTAssertEqual(CompanyIdentifier.simploTechnology.name, #"Simplo Technology Co., LTD"#)
        XCTAssertEqual(CompanyIdentifier.simploTechnology.description, #"Simplo Technology Co., LTD"#)
    
        // Omron Healthcare Co., LTD
        XCTAssertEqual(CompanyIdentifier.omronHealthcare.rawValue, 526)
        XCTAssertEqual(CompanyIdentifier.omronHealthcare.name, #"Omron Healthcare Co., LTD"#)
        XCTAssertEqual(CompanyIdentifier.omronHealthcare.description, #"Omron Healthcare Co., LTD"#)
    
        // Comodule GMBH
        XCTAssertEqual(CompanyIdentifier.comodule.rawValue, 527)
        XCTAssertEqual(CompanyIdentifier.comodule.name, #"Comodule GMBH"#)
        XCTAssertEqual(CompanyIdentifier.comodule.description, #"Comodule GMBH"#)
    
        // ikeGPS
        XCTAssertEqual(CompanyIdentifier.ikegps.rawValue, 528)
        XCTAssertEqual(CompanyIdentifier.ikegps.name, #"ikeGPS"#)
        XCTAssertEqual(CompanyIdentifier.ikegps.description, #"ikeGPS"#)
    
        // Telink Semiconductor Co. Ltd
        XCTAssertEqual(CompanyIdentifier.telinkSemiconductor.rawValue, 529)
        XCTAssertEqual(CompanyIdentifier.telinkSemiconductor.name, #"Telink Semiconductor Co. Ltd"#)
        XCTAssertEqual(CompanyIdentifier.telinkSemiconductor.description, #"Telink Semiconductor Co. Ltd"#)
    
        // Interplan Co., Ltd
        XCTAssertEqual(CompanyIdentifier.interplan.rawValue, 530)
        XCTAssertEqual(CompanyIdentifier.interplan.name, #"Interplan Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.interplan.description, #"Interplan Co., Ltd"#)
    
        // Wyler AG
        XCTAssertEqual(CompanyIdentifier.wyler.rawValue, 531)
        XCTAssertEqual(CompanyIdentifier.wyler.name, #"Wyler AG"#)
        XCTAssertEqual(CompanyIdentifier.wyler.description, #"Wyler AG"#)
    
        // IK Multimedia Production srl
        XCTAssertEqual(CompanyIdentifier.ikMultimediaProduction.rawValue, 532)
        XCTAssertEqual(CompanyIdentifier.ikMultimediaProduction.name, #"IK Multimedia Production srl"#)
        XCTAssertEqual(CompanyIdentifier.ikMultimediaProduction.description, #"IK Multimedia Production srl"#)
    
        // Lukoton Experience Oy
        XCTAssertEqual(CompanyIdentifier.lukotonExperience.rawValue, 533)
        XCTAssertEqual(CompanyIdentifier.lukotonExperience.name, #"Lukoton Experience Oy"#)
        XCTAssertEqual(CompanyIdentifier.lukotonExperience.description, #"Lukoton Experience Oy"#)
    
        // MTI Ltd
        XCTAssertEqual(CompanyIdentifier.mti.rawValue, 534)
        XCTAssertEqual(CompanyIdentifier.mti.name, #"MTI Ltd"#)
        XCTAssertEqual(CompanyIdentifier.mti.description, #"MTI Ltd"#)
    
        // Tech4home, Lda
        XCTAssertEqual(CompanyIdentifier.tech4HomeLda.rawValue, 535)
        XCTAssertEqual(CompanyIdentifier.tech4HomeLda.name, #"Tech4home, Lda"#)
        XCTAssertEqual(CompanyIdentifier.tech4HomeLda.description, #"Tech4home, Lda"#)
    
        // Hiotech AB
        XCTAssertEqual(CompanyIdentifier.hiotech.rawValue, 536)
        XCTAssertEqual(CompanyIdentifier.hiotech.name, #"Hiotech AB"#)
        XCTAssertEqual(CompanyIdentifier.hiotech.description, #"Hiotech AB"#)
    
        // DOTT Limited
        XCTAssertEqual(CompanyIdentifier.dott.rawValue, 537)
        XCTAssertEqual(CompanyIdentifier.dott.name, #"DOTT Limited"#)
        XCTAssertEqual(CompanyIdentifier.dott.description, #"DOTT Limited"#)
    
        // Blue Speck Labs, LLC
        XCTAssertEqual(CompanyIdentifier.blueSpeckLabs.rawValue, 538)
        XCTAssertEqual(CompanyIdentifier.blueSpeckLabs.name, #"Blue Speck Labs, LLC"#)
        XCTAssertEqual(CompanyIdentifier.blueSpeckLabs.description, #"Blue Speck Labs, LLC"#)
    
        // Cisco Systems, Inc
        XCTAssertEqual(CompanyIdentifier.ciscoSystems.rawValue, 539)
        XCTAssertEqual(CompanyIdentifier.ciscoSystems.name, #"Cisco Systems, Inc"#)
        XCTAssertEqual(CompanyIdentifier.ciscoSystems.description, #"Cisco Systems, Inc"#)
    
        // Mobicomm Inc
        XCTAssertEqual(CompanyIdentifier.mobicomm.rawValue, 540)
        XCTAssertEqual(CompanyIdentifier.mobicomm.name, #"Mobicomm Inc"#)
        XCTAssertEqual(CompanyIdentifier.mobicomm.description, #"Mobicomm Inc"#)
    
        // Edamic
        XCTAssertEqual(CompanyIdentifier.edamic.rawValue, 541)
        XCTAssertEqual(CompanyIdentifier.edamic.name, #"Edamic"#)
        XCTAssertEqual(CompanyIdentifier.edamic.description, #"Edamic"#)
    
        // Goodnet, Ltd
        XCTAssertEqual(CompanyIdentifier.goodnet.rawValue, 542)
        XCTAssertEqual(CompanyIdentifier.goodnet.name, #"Goodnet, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.goodnet.description, #"Goodnet, Ltd"#)
    
        // Luster Leaf Products  Inc
        XCTAssertEqual(CompanyIdentifier.lusterLeafProducts.rawValue, 543)
        XCTAssertEqual(CompanyIdentifier.lusterLeafProducts.name, #"Luster Leaf Products  Inc"#)
        XCTAssertEqual(CompanyIdentifier.lusterLeafProducts.description, #"Luster Leaf Products  Inc"#)
    
        // Manus Machina BV
        XCTAssertEqual(CompanyIdentifier.manusMachina.rawValue, 544)
        XCTAssertEqual(CompanyIdentifier.manusMachina.name, #"Manus Machina BV"#)
        XCTAssertEqual(CompanyIdentifier.manusMachina.description, #"Manus Machina BV"#)
    
        // Mobiquity Networks Inc
        XCTAssertEqual(CompanyIdentifier.mobiquityNetworks.rawValue, 545)
        XCTAssertEqual(CompanyIdentifier.mobiquityNetworks.name, #"Mobiquity Networks Inc"#)
        XCTAssertEqual(CompanyIdentifier.mobiquityNetworks.description, #"Mobiquity Networks Inc"#)
    
        // Praxis Dynamics
        XCTAssertEqual(CompanyIdentifier.praxisDynamics.rawValue, 546)
        XCTAssertEqual(CompanyIdentifier.praxisDynamics.name, #"Praxis Dynamics"#)
        XCTAssertEqual(CompanyIdentifier.praxisDynamics.description, #"Praxis Dynamics"#)
    
        // Philip Morris Products S.A.
        XCTAssertEqual(CompanyIdentifier.philipMorrisProducts.rawValue, 547)
        XCTAssertEqual(CompanyIdentifier.philipMorrisProducts.name, #"Philip Morris Products S.A."#)
        XCTAssertEqual(CompanyIdentifier.philipMorrisProducts.description, #"Philip Morris Products S.A."#)
    
        // Comarch SA
        XCTAssertEqual(CompanyIdentifier.comarch.rawValue, 548)
        XCTAssertEqual(CompanyIdentifier.comarch.name, #"Comarch SA"#)
        XCTAssertEqual(CompanyIdentifier.comarch.description, #"Comarch SA"#)
    
        // Nestlé Nespresso S.A.
        XCTAssertEqual(CompanyIdentifier.nestleNespresso.rawValue, 549)
        XCTAssertEqual(CompanyIdentifier.nestleNespresso.name, #"Nestlé Nespresso S.A."#)
        XCTAssertEqual(CompanyIdentifier.nestleNespresso.description, #"Nestlé Nespresso S.A."#)
    
        // Merlinia A/S
        XCTAssertEqual(CompanyIdentifier.merlinia.rawValue, 550)
        XCTAssertEqual(CompanyIdentifier.merlinia.name, #"Merlinia A/S"#)
        XCTAssertEqual(CompanyIdentifier.merlinia.description, #"Merlinia A/S"#)
    
        // LifeBEAM Technologies
        XCTAssertEqual(CompanyIdentifier.lifebeamTechnologies.rawValue, 551)
        XCTAssertEqual(CompanyIdentifier.lifebeamTechnologies.name, #"LifeBEAM Technologies"#)
        XCTAssertEqual(CompanyIdentifier.lifebeamTechnologies.description, #"LifeBEAM Technologies"#)
    
        // Twocanoes Labs, LLC
        XCTAssertEqual(CompanyIdentifier.twocanoesLabs.rawValue, 552)
        XCTAssertEqual(CompanyIdentifier.twocanoesLabs.name, #"Twocanoes Labs, LLC"#)
        XCTAssertEqual(CompanyIdentifier.twocanoesLabs.description, #"Twocanoes Labs, LLC"#)
    
        // Muoverti Limited
        XCTAssertEqual(CompanyIdentifier.muoverti.rawValue, 553)
        XCTAssertEqual(CompanyIdentifier.muoverti.name, #"Muoverti Limited"#)
        XCTAssertEqual(CompanyIdentifier.muoverti.description, #"Muoverti Limited"#)
    
        // Stamer Musikanlagen GMBH
        XCTAssertEqual(CompanyIdentifier.stamerMusikanlagen.rawValue, 554)
        XCTAssertEqual(CompanyIdentifier.stamerMusikanlagen.name, #"Stamer Musikanlagen GMBH"#)
        XCTAssertEqual(CompanyIdentifier.stamerMusikanlagen.description, #"Stamer Musikanlagen GMBH"#)
    
        // Tesla Motors
        XCTAssertEqual(CompanyIdentifier.teslaMotors.rawValue, 555)
        XCTAssertEqual(CompanyIdentifier.teslaMotors.name, #"Tesla Motors"#)
        XCTAssertEqual(CompanyIdentifier.teslaMotors.description, #"Tesla Motors"#)
    
        // Pharynks Corporation
        XCTAssertEqual(CompanyIdentifier.pharynks.rawValue, 556)
        XCTAssertEqual(CompanyIdentifier.pharynks.name, #"Pharynks Corporation"#)
        XCTAssertEqual(CompanyIdentifier.pharynks.description, #"Pharynks Corporation"#)
    
        // Lupine
        XCTAssertEqual(CompanyIdentifier.lupine.rawValue, 557)
        XCTAssertEqual(CompanyIdentifier.lupine.name, #"Lupine"#)
        XCTAssertEqual(CompanyIdentifier.lupine.description, #"Lupine"#)
    
        // Siemens AG
        XCTAssertEqual(CompanyIdentifier.siemens.rawValue, 558)
        XCTAssertEqual(CompanyIdentifier.siemens.name, #"Siemens AG"#)
        XCTAssertEqual(CompanyIdentifier.siemens.description, #"Siemens AG"#)
    
        // Huami (Shanghai) Culture Communication CO., LTD
        XCTAssertEqual(CompanyIdentifier.huamiShanghaiCultureCommunication.rawValue, 559)
        XCTAssertEqual(CompanyIdentifier.huamiShanghaiCultureCommunication.name, #"Huami (Shanghai) Culture Communication CO., LTD"#)
        XCTAssertEqual(CompanyIdentifier.huamiShanghaiCultureCommunication.description, #"Huami (Shanghai) Culture Communication CO., LTD"#)
    
        // Foster Electric Company, Ltd
        XCTAssertEqual(CompanyIdentifier.fosterElectricCompany.rawValue, 560)
        XCTAssertEqual(CompanyIdentifier.fosterElectricCompany.name, #"Foster Electric Company, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.fosterElectricCompany.description, #"Foster Electric Company, Ltd"#)
    
        // ETA SA
        XCTAssertEqual(CompanyIdentifier.eta.rawValue, 561)
        XCTAssertEqual(CompanyIdentifier.eta.name, #"ETA SA"#)
        XCTAssertEqual(CompanyIdentifier.eta.description, #"ETA SA"#)
    
        // x-Senso Solutions Kft
        XCTAssertEqual(CompanyIdentifier.xSensoSolutionsKft.rawValue, 562)
        XCTAssertEqual(CompanyIdentifier.xSensoSolutionsKft.name, #"x-Senso Solutions Kft"#)
        XCTAssertEqual(CompanyIdentifier.xSensoSolutionsKft.description, #"x-Senso Solutions Kft"#)
    
        // Shenzhen SuLong Communication Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenSulongCommunication.rawValue, 563)
        XCTAssertEqual(CompanyIdentifier.shenzhenSulongCommunication.name, #"Shenzhen SuLong Communication Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenSulongCommunication.description, #"Shenzhen SuLong Communication Ltd"#)
    
        // FengFan (BeiJing) Technology Co, Ltd
        XCTAssertEqual(CompanyIdentifier.fengfanBeijingTechnology.rawValue, 564)
        XCTAssertEqual(CompanyIdentifier.fengfanBeijingTechnology.name, #"FengFan (BeiJing) Technology Co, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.fengfanBeijingTechnology.description, #"FengFan (BeiJing) Technology Co, Ltd"#)
    
        // Qrio Inc
        XCTAssertEqual(CompanyIdentifier.qrio.rawValue, 565)
        XCTAssertEqual(CompanyIdentifier.qrio.name, #"Qrio Inc"#)
        XCTAssertEqual(CompanyIdentifier.qrio.description, #"Qrio Inc"#)
    
        // Pitpatpet Ltd
        XCTAssertEqual(CompanyIdentifier.pitpatpet.rawValue, 566)
        XCTAssertEqual(CompanyIdentifier.pitpatpet.name, #"Pitpatpet Ltd"#)
        XCTAssertEqual(CompanyIdentifier.pitpatpet.description, #"Pitpatpet Ltd"#)
    
        // MSHeli s.r.l.
        XCTAssertEqual(CompanyIdentifier.msheli.rawValue, 567)
        XCTAssertEqual(CompanyIdentifier.msheli.name, #"MSHeli s.r.l."#)
        XCTAssertEqual(CompanyIdentifier.msheli.description, #"MSHeli s.r.l."#)
    
        // Trakm8 Ltd
        XCTAssertEqual(CompanyIdentifier.trakm8.rawValue, 568)
        XCTAssertEqual(CompanyIdentifier.trakm8.name, #"Trakm8 Ltd"#)
        XCTAssertEqual(CompanyIdentifier.trakm8.description, #"Trakm8 Ltd"#)
    
        // JIN CO, Ltd
        XCTAssertEqual(CompanyIdentifier.jin.rawValue, 569)
        XCTAssertEqual(CompanyIdentifier.jin.name, #"JIN CO, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.jin.description, #"JIN CO, Ltd"#)
    
        // Alatech Tehnology
        XCTAssertEqual(CompanyIdentifier.alatechTehnology.rawValue, 570)
        XCTAssertEqual(CompanyIdentifier.alatechTehnology.name, #"Alatech Tehnology"#)
        XCTAssertEqual(CompanyIdentifier.alatechTehnology.description, #"Alatech Tehnology"#)
    
        // Beijing CarePulse Electronic Technology Co, Ltd
        XCTAssertEqual(CompanyIdentifier.beijingCarepulseElectronicTechnology.rawValue, 571)
        XCTAssertEqual(CompanyIdentifier.beijingCarepulseElectronicTechnology.name, #"Beijing CarePulse Electronic Technology Co, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beijingCarepulseElectronicTechnology.description, #"Beijing CarePulse Electronic Technology Co, Ltd"#)
    
        // Awarepoint
        XCTAssertEqual(CompanyIdentifier.awarepoint.rawValue, 572)
        XCTAssertEqual(CompanyIdentifier.awarepoint.name, #"Awarepoint"#)
        XCTAssertEqual(CompanyIdentifier.awarepoint.description, #"Awarepoint"#)
    
        // ViCentra B.V.
        XCTAssertEqual(CompanyIdentifier.vicentra.rawValue, 573)
        XCTAssertEqual(CompanyIdentifier.vicentra.name, #"ViCentra B.V."#)
        XCTAssertEqual(CompanyIdentifier.vicentra.description, #"ViCentra B.V."#)
    
        // Raven Industries
        XCTAssertEqual(CompanyIdentifier.ravenIndustries.rawValue, 574)
        XCTAssertEqual(CompanyIdentifier.ravenIndustries.name, #"Raven Industries"#)
        XCTAssertEqual(CompanyIdentifier.ravenIndustries.description, #"Raven Industries"#)
    
        // WaveWare Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.wavewareTechnologies.rawValue, 575)
        XCTAssertEqual(CompanyIdentifier.wavewareTechnologies.name, #"WaveWare Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.wavewareTechnologies.description, #"WaveWare Technologies Inc."#)
    
        // Argenox Technologies
        XCTAssertEqual(CompanyIdentifier.argenoxTechnologies.rawValue, 576)
        XCTAssertEqual(CompanyIdentifier.argenoxTechnologies.name, #"Argenox Technologies"#)
        XCTAssertEqual(CompanyIdentifier.argenoxTechnologies.description, #"Argenox Technologies"#)
    
        // Bragi GmbH
        XCTAssertEqual(CompanyIdentifier.bragi.rawValue, 577)
        XCTAssertEqual(CompanyIdentifier.bragi.name, #"Bragi GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bragi.description, #"Bragi GmbH"#)
    
        // 16Lab Inc
        XCTAssertEqual(CompanyIdentifier.company16Lab.rawValue, 578)
        XCTAssertEqual(CompanyIdentifier.company16Lab.name, #"16Lab Inc"#)
        XCTAssertEqual(CompanyIdentifier.company16Lab.description, #"16Lab Inc"#)
    
        // Masimo Corp
        XCTAssertEqual(CompanyIdentifier.masimo.rawValue, 579)
        XCTAssertEqual(CompanyIdentifier.masimo.name, #"Masimo Corp"#)
        XCTAssertEqual(CompanyIdentifier.masimo.description, #"Masimo Corp"#)
    
        // Iotera Inc
        XCTAssertEqual(CompanyIdentifier.iotera.rawValue, 580)
        XCTAssertEqual(CompanyIdentifier.iotera.name, #"Iotera Inc"#)
        XCTAssertEqual(CompanyIdentifier.iotera.description, #"Iotera Inc"#)
    
        // Endress+Hauser
        XCTAssertEqual(CompanyIdentifier.endressHauser.rawValue, 581)
        XCTAssertEqual(CompanyIdentifier.endressHauser.name, #"Endress+Hauser "#)
        XCTAssertEqual(CompanyIdentifier.endressHauser.description, #"Endress+Hauser "#)
    
        // ACKme Networks, Inc.
        XCTAssertEqual(CompanyIdentifier.ackmeNetworks.rawValue, 582)
        XCTAssertEqual(CompanyIdentifier.ackmeNetworks.name, #"ACKme Networks, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ackmeNetworks.description, #"ACKme Networks, Inc."#)
    
        // FiftyThree Inc.
        XCTAssertEqual(CompanyIdentifier.fiftythree.rawValue, 583)
        XCTAssertEqual(CompanyIdentifier.fiftythree.name, #"FiftyThree Inc."#)
        XCTAssertEqual(CompanyIdentifier.fiftythree.description, #"FiftyThree Inc."#)
    
        // Parker Hannifin Corp
        XCTAssertEqual(CompanyIdentifier.parkerHannifin.rawValue, 584)
        XCTAssertEqual(CompanyIdentifier.parkerHannifin.name, #"Parker Hannifin Corp"#)
        XCTAssertEqual(CompanyIdentifier.parkerHannifin.description, #"Parker Hannifin Corp"#)
    
        // Transcranial Ltd
        XCTAssertEqual(CompanyIdentifier.transcranial.rawValue, 585)
        XCTAssertEqual(CompanyIdentifier.transcranial.name, #"Transcranial Ltd"#)
        XCTAssertEqual(CompanyIdentifier.transcranial.description, #"Transcranial Ltd"#)
    
        // Uwatec AG
        XCTAssertEqual(CompanyIdentifier.uwatec.rawValue, 586)
        XCTAssertEqual(CompanyIdentifier.uwatec.name, #"Uwatec AG"#)
        XCTAssertEqual(CompanyIdentifier.uwatec.description, #"Uwatec AG"#)
    
        // Orlan LLC
        XCTAssertEqual(CompanyIdentifier.orlan.rawValue, 587)
        XCTAssertEqual(CompanyIdentifier.orlan.name, #"Orlan LLC"#)
        XCTAssertEqual(CompanyIdentifier.orlan.description, #"Orlan LLC"#)
    
        // Blue Clover Devices
        XCTAssertEqual(CompanyIdentifier.blueCloverDevices.rawValue, 588)
        XCTAssertEqual(CompanyIdentifier.blueCloverDevices.name, #"Blue Clover Devices"#)
        XCTAssertEqual(CompanyIdentifier.blueCloverDevices.description, #"Blue Clover Devices"#)
    
        // M-Way Solutions GmbH
        XCTAssertEqual(CompanyIdentifier.mWaySolutions.rawValue, 589)
        XCTAssertEqual(CompanyIdentifier.mWaySolutions.name, #"M-Way Solutions GmbH"#)
        XCTAssertEqual(CompanyIdentifier.mWaySolutions.description, #"M-Way Solutions GmbH"#)
    
        // Microtronics Engineering GmbH
        XCTAssertEqual(CompanyIdentifier.microtronicsEngineering.rawValue, 590)
        XCTAssertEqual(CompanyIdentifier.microtronicsEngineering.name, #"Microtronics Engineering GmbH"#)
        XCTAssertEqual(CompanyIdentifier.microtronicsEngineering.description, #"Microtronics Engineering GmbH"#)
    
        // Schneider Schreibgeräte GmbH
        XCTAssertEqual(CompanyIdentifier.schneiderSchreibgerate.rawValue, 591)
        XCTAssertEqual(CompanyIdentifier.schneiderSchreibgerate.name, #"Schneider Schreibgeräte GmbH"#)
        XCTAssertEqual(CompanyIdentifier.schneiderSchreibgerate.description, #"Schneider Schreibgeräte GmbH"#)
    
        // Sapphire Circuits LLC
        XCTAssertEqual(CompanyIdentifier.sapphireCircuits.rawValue, 592)
        XCTAssertEqual(CompanyIdentifier.sapphireCircuits.name, #"Sapphire Circuits LLC"#)
        XCTAssertEqual(CompanyIdentifier.sapphireCircuits.description, #"Sapphire Circuits LLC"#)
    
        // Lumo Bodytech Inc.
        XCTAssertEqual(CompanyIdentifier.lumoBodytech.rawValue, 593)
        XCTAssertEqual(CompanyIdentifier.lumoBodytech.name, #"Lumo Bodytech Inc."#)
        XCTAssertEqual(CompanyIdentifier.lumoBodytech.description, #"Lumo Bodytech Inc."#)
    
        // UKC Technosolution
        XCTAssertEqual(CompanyIdentifier.ukcTechnosolution.rawValue, 594)
        XCTAssertEqual(CompanyIdentifier.ukcTechnosolution.name, #"UKC Technosolution"#)
        XCTAssertEqual(CompanyIdentifier.ukcTechnosolution.description, #"UKC Technosolution"#)
    
        // Xicato Inc.
        XCTAssertEqual(CompanyIdentifier.xicato.rawValue, 595)
        XCTAssertEqual(CompanyIdentifier.xicato.name, #"Xicato Inc."#)
        XCTAssertEqual(CompanyIdentifier.xicato.description, #"Xicato Inc."#)
    
        // Playbrush
        XCTAssertEqual(CompanyIdentifier.playbrush.rawValue, 596)
        XCTAssertEqual(CompanyIdentifier.playbrush.name, #"Playbrush"#)
        XCTAssertEqual(CompanyIdentifier.playbrush.description, #"Playbrush"#)
    
        // Dai Nippon Printing Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.daiNipponPrinting.rawValue, 597)
        XCTAssertEqual(CompanyIdentifier.daiNipponPrinting.name, #"Dai Nippon Printing Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.daiNipponPrinting.description, #"Dai Nippon Printing Co., Ltd."#)
    
        // G24 Power Limited
        XCTAssertEqual(CompanyIdentifier.g24Power.rawValue, 598)
        XCTAssertEqual(CompanyIdentifier.g24Power.name, #"G24 Power Limited"#)
        XCTAssertEqual(CompanyIdentifier.g24Power.description, #"G24 Power Limited"#)
    
        // AdBabble Local Commerce Inc.
        XCTAssertEqual(CompanyIdentifier.adbabbleLocalCommerce.rawValue, 599)
        XCTAssertEqual(CompanyIdentifier.adbabbleLocalCommerce.name, #"AdBabble Local Commerce Inc."#)
        XCTAssertEqual(CompanyIdentifier.adbabbleLocalCommerce.description, #"AdBabble Local Commerce Inc."#)
    
        // Devialet SA
        XCTAssertEqual(CompanyIdentifier.devialet.rawValue, 600)
        XCTAssertEqual(CompanyIdentifier.devialet.name, #"Devialet SA"#)
        XCTAssertEqual(CompanyIdentifier.devialet.description, #"Devialet SA"#)
    
        // ALTYOR
        XCTAssertEqual(CompanyIdentifier.altyor.rawValue, 601)
        XCTAssertEqual(CompanyIdentifier.altyor.name, #"ALTYOR"#)
        XCTAssertEqual(CompanyIdentifier.altyor.description, #"ALTYOR"#)
    
        // University of Applied Sciences Valais/Haute Ecole Valaisanne
        XCTAssertEqual(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.rawValue, 602)
        XCTAssertEqual(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.name, #"University of Applied Sciences Valais/Haute Ecole Valaisanne"#)
        XCTAssertEqual(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.description, #"University of Applied Sciences Valais/Haute Ecole Valaisanne"#)
    
        // Five Interactive, LLC dba Zendo
        XCTAssertEqual(CompanyIdentifier.fiveInteractiveDbaZendo.rawValue, 603)
        XCTAssertEqual(CompanyIdentifier.fiveInteractiveDbaZendo.name, #"Five Interactive, LLC dba Zendo"#)
        XCTAssertEqual(CompanyIdentifier.fiveInteractiveDbaZendo.description, #"Five Interactive, LLC dba Zendo"#)
    
        // NetEase（Hangzhou）Network co.Ltd.
        XCTAssertEqual(CompanyIdentifier.neteaseHangzhouNetwork.rawValue, 604)
        XCTAssertEqual(CompanyIdentifier.neteaseHangzhouNetwork.name, #"NetEase（Hangzhou）Network co.Ltd."#)
        XCTAssertEqual(CompanyIdentifier.neteaseHangzhouNetwork.description, #"NetEase（Hangzhou）Network co.Ltd."#)
    
        // Lexmark International Inc.
        XCTAssertEqual(CompanyIdentifier.lexmarkInternational.rawValue, 605)
        XCTAssertEqual(CompanyIdentifier.lexmarkInternational.name, #"Lexmark International Inc."#)
        XCTAssertEqual(CompanyIdentifier.lexmarkInternational.description, #"Lexmark International Inc."#)
    
        // Fluke Corporation
        XCTAssertEqual(CompanyIdentifier.fluke.rawValue, 606)
        XCTAssertEqual(CompanyIdentifier.fluke.name, #"Fluke Corporation"#)
        XCTAssertEqual(CompanyIdentifier.fluke.description, #"Fluke Corporation"#)
    
        // Yardarm Technologies
        XCTAssertEqual(CompanyIdentifier.yardarmTechnologies.rawValue, 607)
        XCTAssertEqual(CompanyIdentifier.yardarmTechnologies.name, #"Yardarm Technologies"#)
        XCTAssertEqual(CompanyIdentifier.yardarmTechnologies.description, #"Yardarm Technologies"#)
    
        // SensaRx
        XCTAssertEqual(CompanyIdentifier.sensarx.rawValue, 608)
        XCTAssertEqual(CompanyIdentifier.sensarx.name, #"SensaRx"#)
        XCTAssertEqual(CompanyIdentifier.sensarx.description, #"SensaRx"#)
    
        // SECVRE GmbH
        XCTAssertEqual(CompanyIdentifier.secvre.rawValue, 609)
        XCTAssertEqual(CompanyIdentifier.secvre.name, #"SECVRE GmbH"#)
        XCTAssertEqual(CompanyIdentifier.secvre.description, #"SECVRE GmbH"#)
    
        // Glacial Ridge Technologies
        XCTAssertEqual(CompanyIdentifier.glacialRidgeTechnologies.rawValue, 610)
        XCTAssertEqual(CompanyIdentifier.glacialRidgeTechnologies.name, #"Glacial Ridge Technologies"#)
        XCTAssertEqual(CompanyIdentifier.glacialRidgeTechnologies.description, #"Glacial Ridge Technologies"#)
    
        // Identiv, Inc.
        XCTAssertEqual(CompanyIdentifier.identiv.rawValue, 611)
        XCTAssertEqual(CompanyIdentifier.identiv.name, #"Identiv, Inc."#)
        XCTAssertEqual(CompanyIdentifier.identiv.description, #"Identiv, Inc."#)
    
        // DDS, Inc.
        XCTAssertEqual(CompanyIdentifier.dds.rawValue, 612)
        XCTAssertEqual(CompanyIdentifier.dds.name, #"DDS, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dds.description, #"DDS, Inc."#)
    
        // SMK Corporation
        XCTAssertEqual(CompanyIdentifier.smk.rawValue, 613)
        XCTAssertEqual(CompanyIdentifier.smk.name, #"SMK Corporation"#)
        XCTAssertEqual(CompanyIdentifier.smk.description, #"SMK Corporation"#)
    
        // Schawbel Technologies LLC
        XCTAssertEqual(CompanyIdentifier.schawbelTechnologies.rawValue, 614)
        XCTAssertEqual(CompanyIdentifier.schawbelTechnologies.name, #"Schawbel Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.schawbelTechnologies.description, #"Schawbel Technologies LLC"#)
    
        // XMI Systems SA
        XCTAssertEqual(CompanyIdentifier.xmiSystems.rawValue, 615)
        XCTAssertEqual(CompanyIdentifier.xmiSystems.name, #"XMI Systems SA"#)
        XCTAssertEqual(CompanyIdentifier.xmiSystems.description, #"XMI Systems SA"#)
    
        // Cerevo
        XCTAssertEqual(CompanyIdentifier.cerevo.rawValue, 616)
        XCTAssertEqual(CompanyIdentifier.cerevo.name, #"Cerevo"#)
        XCTAssertEqual(CompanyIdentifier.cerevo.description, #"Cerevo"#)
    
        // Torrox GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.torrox.rawValue, 617)
        XCTAssertEqual(CompanyIdentifier.torrox.name, #"Torrox GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.torrox.description, #"Torrox GmbH & Co KG"#)
    
        // Gemalto
        XCTAssertEqual(CompanyIdentifier.gemalto.rawValue, 618)
        XCTAssertEqual(CompanyIdentifier.gemalto.name, #"Gemalto"#)
        XCTAssertEqual(CompanyIdentifier.gemalto.description, #"Gemalto"#)
    
        // DEKA Research & Development Corp.
        XCTAssertEqual(CompanyIdentifier.dekaResearchDevelopment.rawValue, 619)
        XCTAssertEqual(CompanyIdentifier.dekaResearchDevelopment.name, #"DEKA Research & Development Corp."#)
        XCTAssertEqual(CompanyIdentifier.dekaResearchDevelopment.description, #"DEKA Research & Development Corp."#)
    
        // Domster Tadeusz Szydlowski
        XCTAssertEqual(CompanyIdentifier.domsterTadeuszSzydlowski.rawValue, 620)
        XCTAssertEqual(CompanyIdentifier.domsterTadeuszSzydlowski.name, #"Domster Tadeusz Szydlowski"#)
        XCTAssertEqual(CompanyIdentifier.domsterTadeuszSzydlowski.description, #"Domster Tadeusz Szydlowski"#)
    
        // Technogym SPA
        XCTAssertEqual(CompanyIdentifier.technogymSpa.rawValue, 621)
        XCTAssertEqual(CompanyIdentifier.technogymSpa.name, #"Technogym SPA"#)
        XCTAssertEqual(CompanyIdentifier.technogymSpa.description, #"Technogym SPA"#)
    
        // FLEURBAEY BVBA
        XCTAssertEqual(CompanyIdentifier.fleurbaeyba.rawValue, 622)
        XCTAssertEqual(CompanyIdentifier.fleurbaeyba.name, #"FLEURBAEY BVBA"#)
        XCTAssertEqual(CompanyIdentifier.fleurbaeyba.description, #"FLEURBAEY BVBA"#)
    
        // Aptcode Solutions
        XCTAssertEqual(CompanyIdentifier.aptcodeSolutions.rawValue, 623)
        XCTAssertEqual(CompanyIdentifier.aptcodeSolutions.name, #"Aptcode Solutions"#)
        XCTAssertEqual(CompanyIdentifier.aptcodeSolutions.description, #"Aptcode Solutions"#)
    
        // LSI ADL Technology
        XCTAssertEqual(CompanyIdentifier.lsiAdlTechnology.rawValue, 624)
        XCTAssertEqual(CompanyIdentifier.lsiAdlTechnology.name, #"LSI ADL Technology"#)
        XCTAssertEqual(CompanyIdentifier.lsiAdlTechnology.description, #"LSI ADL Technology"#)
    
        // Animas Corp
        XCTAssertEqual(CompanyIdentifier.animas.rawValue, 625)
        XCTAssertEqual(CompanyIdentifier.animas.name, #"Animas Corp"#)
        XCTAssertEqual(CompanyIdentifier.animas.description, #"Animas Corp"#)
    
        // Alps Alpine Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.alpsAlpine.rawValue, 626)
        XCTAssertEqual(CompanyIdentifier.alpsAlpine.name, #"Alps Alpine Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.alpsAlpine.description, #"Alps Alpine Co., Ltd."#)
    
        // OCEASOFT
        XCTAssertEqual(CompanyIdentifier.oceasoft.rawValue, 627)
        XCTAssertEqual(CompanyIdentifier.oceasoft.name, #"OCEASOFT"#)
        XCTAssertEqual(CompanyIdentifier.oceasoft.description, #"OCEASOFT"#)
    
        // Motsai Research
        XCTAssertEqual(CompanyIdentifier.motsaiResearch.rawValue, 628)
        XCTAssertEqual(CompanyIdentifier.motsaiResearch.name, #"Motsai Research"#)
        XCTAssertEqual(CompanyIdentifier.motsaiResearch.description, #"Motsai Research"#)
    
        // Geotab
        XCTAssertEqual(CompanyIdentifier.geotab.rawValue, 629)
        XCTAssertEqual(CompanyIdentifier.geotab.name, #"Geotab"#)
        XCTAssertEqual(CompanyIdentifier.geotab.description, #"Geotab"#)
    
        // E.G.O. Elektro-Geraetebau GmbH
        XCTAssertEqual(CompanyIdentifier.eGOElektroGeraetebau.rawValue, 630)
        XCTAssertEqual(CompanyIdentifier.eGOElektroGeraetebau.name, #"E.G.O. Elektro-Geraetebau GmbH"#)
        XCTAssertEqual(CompanyIdentifier.eGOElektroGeraetebau.description, #"E.G.O. Elektro-Geraetebau GmbH"#)
    
        // bewhere inc
        XCTAssertEqual(CompanyIdentifier.bewhere.rawValue, 631)
        XCTAssertEqual(CompanyIdentifier.bewhere.name, #"bewhere inc"#)
        XCTAssertEqual(CompanyIdentifier.bewhere.description, #"bewhere inc"#)
    
        // Johnson Outdoors Inc
        XCTAssertEqual(CompanyIdentifier.johnsonOutdoors.rawValue, 632)
        XCTAssertEqual(CompanyIdentifier.johnsonOutdoors.name, #"Johnson Outdoors Inc"#)
        XCTAssertEqual(CompanyIdentifier.johnsonOutdoors.description, #"Johnson Outdoors Inc"#)
    
        // steute Schaltgerate GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.steuteSchaltgerate.rawValue, 633)
        XCTAssertEqual(CompanyIdentifier.steuteSchaltgerate.name, #"steute Schaltgerate GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.steuteSchaltgerate.description, #"steute Schaltgerate GmbH & Co. KG"#)
    
        // Ekomini inc.
        XCTAssertEqual(CompanyIdentifier.ekomini.rawValue, 634)
        XCTAssertEqual(CompanyIdentifier.ekomini.name, #"Ekomini inc."#)
        XCTAssertEqual(CompanyIdentifier.ekomini.description, #"Ekomini inc."#)
    
        // DEFA AS
        XCTAssertEqual(CompanyIdentifier.defa.rawValue, 635)
        XCTAssertEqual(CompanyIdentifier.defa.name, #"DEFA AS"#)
        XCTAssertEqual(CompanyIdentifier.defa.description, #"DEFA AS"#)
    
        // Aseptika Ltd
        XCTAssertEqual(CompanyIdentifier.aseptika.rawValue, 636)
        XCTAssertEqual(CompanyIdentifier.aseptika.name, #"Aseptika Ltd"#)
        XCTAssertEqual(CompanyIdentifier.aseptika.description, #"Aseptika Ltd"#)
    
        // HUAWEI Technologies Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.huaweiTechnologies.rawValue, 637)
        XCTAssertEqual(CompanyIdentifier.huaweiTechnologies.name, #"HUAWEI Technologies Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.huaweiTechnologies.description, #"HUAWEI Technologies Co., Ltd."#)
    
        // HabitAware, LLC
        XCTAssertEqual(CompanyIdentifier.habitaware.rawValue, 638)
        XCTAssertEqual(CompanyIdentifier.habitaware.name, #"HabitAware, LLC"#)
        XCTAssertEqual(CompanyIdentifier.habitaware.description, #"HabitAware, LLC"#)
    
        // ruwido austria gmbh
        XCTAssertEqual(CompanyIdentifier.ruwidoAustria.rawValue, 639)
        XCTAssertEqual(CompanyIdentifier.ruwidoAustria.name, #"ruwido austria gmbh"#)
        XCTAssertEqual(CompanyIdentifier.ruwidoAustria.description, #"ruwido austria gmbh"#)
    
        // ITEC corporation
        XCTAssertEqual(CompanyIdentifier.itec.rawValue, 640)
        XCTAssertEqual(CompanyIdentifier.itec.name, #"ITEC corporation"#)
        XCTAssertEqual(CompanyIdentifier.itec.description, #"ITEC corporation"#)
    
        // StoneL
        XCTAssertEqual(CompanyIdentifier.stonel.rawValue, 641)
        XCTAssertEqual(CompanyIdentifier.stonel.name, #"StoneL"#)
        XCTAssertEqual(CompanyIdentifier.stonel.description, #"StoneL"#)
    
        // Sonova AG
        XCTAssertEqual(CompanyIdentifier.sonova.rawValue, 642)
        XCTAssertEqual(CompanyIdentifier.sonova.name, #"Sonova AG"#)
        XCTAssertEqual(CompanyIdentifier.sonova.description, #"Sonova AG"#)
    
        // Maven Machines, Inc.
        XCTAssertEqual(CompanyIdentifier.mavenMachines.rawValue, 643)
        XCTAssertEqual(CompanyIdentifier.mavenMachines.name, #"Maven Machines, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mavenMachines.description, #"Maven Machines, Inc."#)
    
        // Synapse Electronics
        XCTAssertEqual(CompanyIdentifier.synapseElectronics.rawValue, 644)
        XCTAssertEqual(CompanyIdentifier.synapseElectronics.name, #"Synapse Electronics"#)
        XCTAssertEqual(CompanyIdentifier.synapseElectronics.description, #"Synapse Electronics"#)
    
        // WOWTech Canada Ltd.
        XCTAssertEqual(CompanyIdentifier.wowtechCanada.rawValue, 645)
        XCTAssertEqual(CompanyIdentifier.wowtechCanada.name, #"WOWTech Canada Ltd."#)
        XCTAssertEqual(CompanyIdentifier.wowtechCanada.description, #"WOWTech Canada Ltd."#)
    
        // RF Code, Inc.
        XCTAssertEqual(CompanyIdentifier.rfCode.rawValue, 646)
        XCTAssertEqual(CompanyIdentifier.rfCode.name, #"RF Code, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rfCode.description, #"RF Code, Inc."#)
    
        // Wally Ventures S.L.
        XCTAssertEqual(CompanyIdentifier.wallyVentures.rawValue, 647)
        XCTAssertEqual(CompanyIdentifier.wallyVentures.name, #"Wally Ventures S.L."#)
        XCTAssertEqual(CompanyIdentifier.wallyVentures.description, #"Wally Ventures S.L."#)
    
        // Willowbank Electronics Ltd
        XCTAssertEqual(CompanyIdentifier.willowbankElectronics.rawValue, 648)
        XCTAssertEqual(CompanyIdentifier.willowbankElectronics.name, #"Willowbank Electronics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.willowbankElectronics.description, #"Willowbank Electronics Ltd"#)
    
        // SK Telecom
        XCTAssertEqual(CompanyIdentifier.skTelecom.rawValue, 649)
        XCTAssertEqual(CompanyIdentifier.skTelecom.name, #"SK Telecom"#)
        XCTAssertEqual(CompanyIdentifier.skTelecom.description, #"SK Telecom"#)
    
        // Jetro AS
        XCTAssertEqual(CompanyIdentifier.jetro.rawValue, 650)
        XCTAssertEqual(CompanyIdentifier.jetro.name, #"Jetro AS"#)
        XCTAssertEqual(CompanyIdentifier.jetro.description, #"Jetro AS"#)
    
        // Code Gears LTD
        XCTAssertEqual(CompanyIdentifier.codeGears.rawValue, 651)
        XCTAssertEqual(CompanyIdentifier.codeGears.name, #"Code Gears LTD"#)
        XCTAssertEqual(CompanyIdentifier.codeGears.description, #"Code Gears LTD"#)
    
        // NANOLINK APS
        XCTAssertEqual(CompanyIdentifier.nanolink.rawValue, 652)
        XCTAssertEqual(CompanyIdentifier.nanolink.name, #"NANOLINK APS"#)
        XCTAssertEqual(CompanyIdentifier.nanolink.description, #"NANOLINK APS"#)
    
        // IF, LLC
        XCTAssertEqual(CompanyIdentifier.ifllc.rawValue, 653)
        XCTAssertEqual(CompanyIdentifier.ifllc.name, #"IF, LLC"#)
        XCTAssertEqual(CompanyIdentifier.ifllc.description, #"IF, LLC"#)
    
        // RF Digital Corp
        XCTAssertEqual(CompanyIdentifier.rfDigital.rawValue, 654)
        XCTAssertEqual(CompanyIdentifier.rfDigital.name, #"RF Digital Corp"#)
        XCTAssertEqual(CompanyIdentifier.rfDigital.description, #"RF Digital Corp"#)
    
        // Church & Dwight Co., Inc
        XCTAssertEqual(CompanyIdentifier.churchDwight.rawValue, 655)
        XCTAssertEqual(CompanyIdentifier.churchDwight.name, #"Church & Dwight Co., Inc"#)
        XCTAssertEqual(CompanyIdentifier.churchDwight.description, #"Church & Dwight Co., Inc"#)
    
        // Multibit Oy
        XCTAssertEqual(CompanyIdentifier.multibit.rawValue, 656)
        XCTAssertEqual(CompanyIdentifier.multibit.name, #"Multibit Oy"#)
        XCTAssertEqual(CompanyIdentifier.multibit.description, #"Multibit Oy"#)
    
        // CliniCloud Inc
        XCTAssertEqual(CompanyIdentifier.clinicloud.rawValue, 657)
        XCTAssertEqual(CompanyIdentifier.clinicloud.name, #"CliniCloud Inc"#)
        XCTAssertEqual(CompanyIdentifier.clinicloud.description, #"CliniCloud Inc"#)
    
        // SwiftSensors
        XCTAssertEqual(CompanyIdentifier.swiftsensors.rawValue, 658)
        XCTAssertEqual(CompanyIdentifier.swiftsensors.name, #"SwiftSensors"#)
        XCTAssertEqual(CompanyIdentifier.swiftsensors.description, #"SwiftSensors"#)
    
        // Blue Bite
        XCTAssertEqual(CompanyIdentifier.blueBite.rawValue, 659)
        XCTAssertEqual(CompanyIdentifier.blueBite.name, #"Blue Bite"#)
        XCTAssertEqual(CompanyIdentifier.blueBite.description, #"Blue Bite"#)
    
        // ELIAS GmbH
        XCTAssertEqual(CompanyIdentifier.elias.rawValue, 660)
        XCTAssertEqual(CompanyIdentifier.elias.name, #"ELIAS GmbH"#)
        XCTAssertEqual(CompanyIdentifier.elias.description, #"ELIAS GmbH"#)
    
        // Sivantos GmbH
        XCTAssertEqual(CompanyIdentifier.sivantos.rawValue, 661)
        XCTAssertEqual(CompanyIdentifier.sivantos.name, #"Sivantos GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sivantos.description, #"Sivantos GmbH"#)
    
        // Petzl
        XCTAssertEqual(CompanyIdentifier.petzl.rawValue, 662)
        XCTAssertEqual(CompanyIdentifier.petzl.name, #"Petzl"#)
        XCTAssertEqual(CompanyIdentifier.petzl.description, #"Petzl"#)
    
        // storm power ltd
        XCTAssertEqual(CompanyIdentifier.stormPower.rawValue, 663)
        XCTAssertEqual(CompanyIdentifier.stormPower.name, #"storm power ltd"#)
        XCTAssertEqual(CompanyIdentifier.stormPower.description, #"storm power ltd"#)
    
        // EISST Ltd
        XCTAssertEqual(CompanyIdentifier.eisst.rawValue, 664)
        XCTAssertEqual(CompanyIdentifier.eisst.name, #"EISST Ltd"#)
        XCTAssertEqual(CompanyIdentifier.eisst.description, #"EISST Ltd"#)
    
        // Inexess Technology Simma KG
        XCTAssertEqual(CompanyIdentifier.inexessTechnologySimmaKg.rawValue, 665)
        XCTAssertEqual(CompanyIdentifier.inexessTechnologySimmaKg.name, #"Inexess Technology Simma KG"#)
        XCTAssertEqual(CompanyIdentifier.inexessTechnologySimmaKg.description, #"Inexess Technology Simma KG"#)
    
        // Currant, Inc.
        XCTAssertEqual(CompanyIdentifier.currant.rawValue, 666)
        XCTAssertEqual(CompanyIdentifier.currant.name, #"Currant, Inc."#)
        XCTAssertEqual(CompanyIdentifier.currant.description, #"Currant, Inc."#)
    
        // C2 Development, Inc.
        XCTAssertEqual(CompanyIdentifier.c2Development.rawValue, 667)
        XCTAssertEqual(CompanyIdentifier.c2Development.name, #"C2 Development, Inc."#)
        XCTAssertEqual(CompanyIdentifier.c2Development.description, #"C2 Development, Inc."#)
    
        // Blue Sky Scientific, LLC
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific.rawValue, 668)
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific.name, #"Blue Sky Scientific, LLC"#)
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific.description, #"Blue Sky Scientific, LLC"#)
    
        // ALOTTAZS LABS, LLC
        XCTAssertEqual(CompanyIdentifier.alottazsLabs.rawValue, 669)
        XCTAssertEqual(CompanyIdentifier.alottazsLabs.name, #"ALOTTAZS LABS, LLC"#)
        XCTAssertEqual(CompanyIdentifier.alottazsLabs.description, #"ALOTTAZS LABS, LLC"#)
    
        // Kupson spol. s r.o.
        XCTAssertEqual(CompanyIdentifier.kupsonSpolSRO.rawValue, 670)
        XCTAssertEqual(CompanyIdentifier.kupsonSpolSRO.name, #"Kupson spol. s r.o."#)
        XCTAssertEqual(CompanyIdentifier.kupsonSpolSRO.description, #"Kupson spol. s r.o."#)
    
        // Areus Engineering GmbH
        XCTAssertEqual(CompanyIdentifier.areusEngineering.rawValue, 671)
        XCTAssertEqual(CompanyIdentifier.areusEngineering.name, #"Areus Engineering GmbH"#)
        XCTAssertEqual(CompanyIdentifier.areusEngineering.description, #"Areus Engineering GmbH"#)
    
        // Impossible Camera GmbH
        XCTAssertEqual(CompanyIdentifier.impossibleCamera.rawValue, 672)
        XCTAssertEqual(CompanyIdentifier.impossibleCamera.name, #"Impossible Camera GmbH"#)
        XCTAssertEqual(CompanyIdentifier.impossibleCamera.description, #"Impossible Camera GmbH"#)
    
        // InventureTrack Systems
        XCTAssertEqual(CompanyIdentifier.inventuretrackSystems.rawValue, 673)
        XCTAssertEqual(CompanyIdentifier.inventuretrackSystems.name, #"InventureTrack Systems"#)
        XCTAssertEqual(CompanyIdentifier.inventuretrackSystems.description, #"InventureTrack Systems"#)
    
        // LockedUp
        XCTAssertEqual(CompanyIdentifier.lockedup.rawValue, 674)
        XCTAssertEqual(CompanyIdentifier.lockedup.name, #"LockedUp"#)
        XCTAssertEqual(CompanyIdentifier.lockedup.description, #"LockedUp"#)
    
        // Itude
        XCTAssertEqual(CompanyIdentifier.itude.rawValue, 675)
        XCTAssertEqual(CompanyIdentifier.itude.name, #"Itude"#)
        XCTAssertEqual(CompanyIdentifier.itude.description, #"Itude"#)
    
        // Pacific Lock Company
        XCTAssertEqual(CompanyIdentifier.pacificLockCompany.rawValue, 676)
        XCTAssertEqual(CompanyIdentifier.pacificLockCompany.name, #"Pacific Lock Company"#)
        XCTAssertEqual(CompanyIdentifier.pacificLockCompany.description, #"Pacific Lock Company"#)
    
        // Tendyron Corporation ( 天地融科技股份有限公司 )
        XCTAssertEqual(CompanyIdentifier.tendyron天地融科技股份有限公司.rawValue, 677)
        XCTAssertEqual(CompanyIdentifier.tendyron天地融科技股份有限公司.name, #"Tendyron Corporation ( 天地融科技股份有限公司 )"#)
        XCTAssertEqual(CompanyIdentifier.tendyron天地融科技股份有限公司.description, #"Tendyron Corporation ( 天地融科技股份有限公司 )"#)
    
        // Robert Bosch GmbH
        XCTAssertEqual(CompanyIdentifier.robertBosch.rawValue, 678)
        XCTAssertEqual(CompanyIdentifier.robertBosch.name, #"Robert Bosch GmbH"#)
        XCTAssertEqual(CompanyIdentifier.robertBosch.description, #"Robert Bosch GmbH"#)
    
        // Illuxtron international B.V.
        XCTAssertEqual(CompanyIdentifier.illuxtronInternational.rawValue, 679)
        XCTAssertEqual(CompanyIdentifier.illuxtronInternational.name, #"Illuxtron international B.V."#)
        XCTAssertEqual(CompanyIdentifier.illuxtronInternational.description, #"Illuxtron international B.V."#)
    
        // miSport Ltd.
        XCTAssertEqual(CompanyIdentifier.misport.rawValue, 680)
        XCTAssertEqual(CompanyIdentifier.misport.name, #"miSport Ltd."#)
        XCTAssertEqual(CompanyIdentifier.misport.description, #"miSport Ltd."#)
    
        // Chargelib
        XCTAssertEqual(CompanyIdentifier.chargelib.rawValue, 681)
        XCTAssertEqual(CompanyIdentifier.chargelib.name, #"Chargelib"#)
        XCTAssertEqual(CompanyIdentifier.chargelib.description, #"Chargelib"#)
    
        // Doppler Lab
        XCTAssertEqual(CompanyIdentifier.dopplerLab.rawValue, 682)
        XCTAssertEqual(CompanyIdentifier.dopplerLab.name, #"Doppler Lab"#)
        XCTAssertEqual(CompanyIdentifier.dopplerLab.description, #"Doppler Lab"#)
    
        // BBPOS Limited
        XCTAssertEqual(CompanyIdentifier.bbpos.rawValue, 683)
        XCTAssertEqual(CompanyIdentifier.bbpos.name, #"BBPOS Limited"#)
        XCTAssertEqual(CompanyIdentifier.bbpos.description, #"BBPOS Limited"#)
    
        // RTB Elektronik GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.rtbElektronik.rawValue, 684)
        XCTAssertEqual(CompanyIdentifier.rtbElektronik.name, #"RTB Elektronik GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.rtbElektronik.description, #"RTB Elektronik GmbH & Co. KG"#)
    
        // Rx Networks, Inc.
        XCTAssertEqual(CompanyIdentifier.rxNetworks.rawValue, 685)
        XCTAssertEqual(CompanyIdentifier.rxNetworks.name, #"Rx Networks, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rxNetworks.description, #"Rx Networks, Inc."#)
    
        // WeatherFlow, Inc.
        XCTAssertEqual(CompanyIdentifier.weatherflow.rawValue, 686)
        XCTAssertEqual(CompanyIdentifier.weatherflow.name, #"WeatherFlow, Inc."#)
        XCTAssertEqual(CompanyIdentifier.weatherflow.description, #"WeatherFlow, Inc."#)
    
        // Technicolor USA Inc.
        XCTAssertEqual(CompanyIdentifier.technicolor.rawValue, 687)
        XCTAssertEqual(CompanyIdentifier.technicolor.name, #"Technicolor USA Inc."#)
        XCTAssertEqual(CompanyIdentifier.technicolor.description, #"Technicolor USA Inc."#)
    
        // Bestechnic(Shanghai),Ltd
        XCTAssertEqual(CompanyIdentifier.bestechnicShanghaiLtd.rawValue, 688)
        XCTAssertEqual(CompanyIdentifier.bestechnicShanghaiLtd.name, #"Bestechnic(Shanghai),Ltd"#)
        XCTAssertEqual(CompanyIdentifier.bestechnicShanghaiLtd.description, #"Bestechnic(Shanghai),Ltd"#)
    
        // Raden Inc
        XCTAssertEqual(CompanyIdentifier.raden.rawValue, 689)
        XCTAssertEqual(CompanyIdentifier.raden.name, #"Raden Inc"#)
        XCTAssertEqual(CompanyIdentifier.raden.description, #"Raden Inc"#)
    
        // JouZen Oy
        XCTAssertEqual(CompanyIdentifier.jouzen.rawValue, 690)
        XCTAssertEqual(CompanyIdentifier.jouzen.name, #"JouZen Oy"#)
        XCTAssertEqual(CompanyIdentifier.jouzen.description, #"JouZen Oy"#)
    
        // CLABER S.P.A.
        XCTAssertEqual(CompanyIdentifier.claber.rawValue, 691)
        XCTAssertEqual(CompanyIdentifier.claber.name, #"CLABER S.P.A."#)
        XCTAssertEqual(CompanyIdentifier.claber.description, #"CLABER S.P.A."#)
    
        // Hyginex, Inc.
        XCTAssertEqual(CompanyIdentifier.hyginex.rawValue, 692)
        XCTAssertEqual(CompanyIdentifier.hyginex.name, #"Hyginex, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hyginex.description, #"Hyginex, Inc."#)
    
        // HANSHIN ELECTRIC RAILWAY CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.hanshinElectricRailway.rawValue, 693)
        XCTAssertEqual(CompanyIdentifier.hanshinElectricRailway.name, #"HANSHIN ELECTRIC RAILWAY CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.hanshinElectricRailway.description, #"HANSHIN ELECTRIC RAILWAY CO.,LTD."#)
    
        // Schneider Electric
        XCTAssertEqual(CompanyIdentifier.schneiderElectric.rawValue, 694)
        XCTAssertEqual(CompanyIdentifier.schneiderElectric.name, #"Schneider Electric"#)
        XCTAssertEqual(CompanyIdentifier.schneiderElectric.description, #"Schneider Electric"#)
    
        // Oort Technologies LLC
        XCTAssertEqual(CompanyIdentifier.oortTechnologies.rawValue, 695)
        XCTAssertEqual(CompanyIdentifier.oortTechnologies.name, #"Oort Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.oortTechnologies.description, #"Oort Technologies LLC"#)
    
        // Chrono Therapeutics
        XCTAssertEqual(CompanyIdentifier.chronoTherapeutics.rawValue, 696)
        XCTAssertEqual(CompanyIdentifier.chronoTherapeutics.name, #"Chrono Therapeutics"#)
        XCTAssertEqual(CompanyIdentifier.chronoTherapeutics.description, #"Chrono Therapeutics"#)
    
        // Rinnai Corporation
        XCTAssertEqual(CompanyIdentifier.rinnai.rawValue, 697)
        XCTAssertEqual(CompanyIdentifier.rinnai.name, #"Rinnai Corporation"#)
        XCTAssertEqual(CompanyIdentifier.rinnai.description, #"Rinnai Corporation"#)
    
        // Swissprime Technologies AG
        XCTAssertEqual(CompanyIdentifier.swissprimeTechnologies.rawValue, 698)
        XCTAssertEqual(CompanyIdentifier.swissprimeTechnologies.name, #"Swissprime Technologies AG"#)
        XCTAssertEqual(CompanyIdentifier.swissprimeTechnologies.description, #"Swissprime Technologies AG"#)
    
        // Koha.,Co.Ltd
        XCTAssertEqual(CompanyIdentifier.koha.rawValue, 699)
        XCTAssertEqual(CompanyIdentifier.koha.name, #"Koha.,Co.Ltd"#)
        XCTAssertEqual(CompanyIdentifier.koha.description, #"Koha.,Co.Ltd"#)
    
        // Genevac Ltd
        XCTAssertEqual(CompanyIdentifier.genevac.rawValue, 700)
        XCTAssertEqual(CompanyIdentifier.genevac.name, #"Genevac Ltd"#)
        XCTAssertEqual(CompanyIdentifier.genevac.description, #"Genevac Ltd"#)
    
        // Chemtronics
        XCTAssertEqual(CompanyIdentifier.chemtronics.rawValue, 701)
        XCTAssertEqual(CompanyIdentifier.chemtronics.name, #"Chemtronics"#)
        XCTAssertEqual(CompanyIdentifier.chemtronics.description, #"Chemtronics"#)
    
        // Seguro Technology Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.seguroTechnology.rawValue, 702)
        XCTAssertEqual(CompanyIdentifier.seguroTechnology.name, #"Seguro Technology Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.seguroTechnology.description, #"Seguro Technology Sp. z o.o."#)
    
        // Redbird Flight Simulations
        XCTAssertEqual(CompanyIdentifier.redbirdFlightSimulations.rawValue, 703)
        XCTAssertEqual(CompanyIdentifier.redbirdFlightSimulations.name, #"Redbird Flight Simulations"#)
        XCTAssertEqual(CompanyIdentifier.redbirdFlightSimulations.description, #"Redbird Flight Simulations"#)
    
        // Dash Robotics
        XCTAssertEqual(CompanyIdentifier.dashRobotics.rawValue, 704)
        XCTAssertEqual(CompanyIdentifier.dashRobotics.name, #"Dash Robotics"#)
        XCTAssertEqual(CompanyIdentifier.dashRobotics.description, #"Dash Robotics"#)
    
        // LINE Corporation
        XCTAssertEqual(CompanyIdentifier.line.rawValue, 705)
        XCTAssertEqual(CompanyIdentifier.line.name, #"LINE Corporation"#)
        XCTAssertEqual(CompanyIdentifier.line.description, #"LINE Corporation"#)
    
        // Guillemot Corporation
        XCTAssertEqual(CompanyIdentifier.guillemot.rawValue, 706)
        XCTAssertEqual(CompanyIdentifier.guillemot.name, #"Guillemot Corporation"#)
        XCTAssertEqual(CompanyIdentifier.guillemot.description, #"Guillemot Corporation"#)
    
        // Techtronic Power Tools Technology Limited
        XCTAssertEqual(CompanyIdentifier.techtronicPowerToolsTechnology.rawValue, 707)
        XCTAssertEqual(CompanyIdentifier.techtronicPowerToolsTechnology.name, #"Techtronic Power Tools Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.techtronicPowerToolsTechnology.description, #"Techtronic Power Tools Technology Limited"#)
    
        // Wilson Sporting Goods
        XCTAssertEqual(CompanyIdentifier.wilsonSportingGoods.rawValue, 708)
        XCTAssertEqual(CompanyIdentifier.wilsonSportingGoods.name, #"Wilson Sporting Goods"#)
        XCTAssertEqual(CompanyIdentifier.wilsonSportingGoods.description, #"Wilson Sporting Goods"#)
    
        // Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） )
        XCTAssertEqual(CompanyIdentifier.lenovoSingaporePte联想新加坡.rawValue, 709)
        XCTAssertEqual(CompanyIdentifier.lenovoSingaporePte联想新加坡.name, #"Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） )"#)
        XCTAssertEqual(CompanyIdentifier.lenovoSingaporePte联想新加坡.description, #"Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） )"#)
    
        // Ayatan Sensors
        XCTAssertEqual(CompanyIdentifier.ayatanSensors.rawValue, 710)
        XCTAssertEqual(CompanyIdentifier.ayatanSensors.name, #"Ayatan Sensors"#)
        XCTAssertEqual(CompanyIdentifier.ayatanSensors.description, #"Ayatan Sensors"#)
    
        // Electronics Tomorrow Limited
        XCTAssertEqual(CompanyIdentifier.electronicsTomorrow.rawValue, 711)
        XCTAssertEqual(CompanyIdentifier.electronicsTomorrow.name, #"Electronics Tomorrow Limited"#)
        XCTAssertEqual(CompanyIdentifier.electronicsTomorrow.description, #"Electronics Tomorrow Limited"#)
    
        // OneSpan
        XCTAssertEqual(CompanyIdentifier.onespan.rawValue, 712)
        XCTAssertEqual(CompanyIdentifier.onespan.name, #"OneSpan "#)
        XCTAssertEqual(CompanyIdentifier.onespan.description, #"OneSpan "#)
    
        // PayRange Inc.
        XCTAssertEqual(CompanyIdentifier.payrange.rawValue, 713)
        XCTAssertEqual(CompanyIdentifier.payrange.name, #"PayRange Inc."#)
        XCTAssertEqual(CompanyIdentifier.payrange.description, #"PayRange Inc."#)
    
        // ABOV Semiconductor
        XCTAssertEqual(CompanyIdentifier.abovSemiconductor.rawValue, 714)
        XCTAssertEqual(CompanyIdentifier.abovSemiconductor.name, #"ABOV Semiconductor"#)
        XCTAssertEqual(CompanyIdentifier.abovSemiconductor.description, #"ABOV Semiconductor"#)
    
        // AINA-Wireless Inc.
        XCTAssertEqual(CompanyIdentifier.ainaWireless.rawValue, 715)
        XCTAssertEqual(CompanyIdentifier.ainaWireless.name, #"AINA-Wireless Inc."#)
        XCTAssertEqual(CompanyIdentifier.ainaWireless.description, #"AINA-Wireless Inc."#)
    
        // Eijkelkamp Soil & Water
        XCTAssertEqual(CompanyIdentifier.eijkelkampSoilWater.rawValue, 716)
        XCTAssertEqual(CompanyIdentifier.eijkelkampSoilWater.name, #"Eijkelkamp Soil & Water"#)
        XCTAssertEqual(CompanyIdentifier.eijkelkampSoilWater.description, #"Eijkelkamp Soil & Water"#)
    
        // BMA ergonomics b.v.
        XCTAssertEqual(CompanyIdentifier.bmaErgonomics.rawValue, 717)
        XCTAssertEqual(CompanyIdentifier.bmaErgonomics.name, #"BMA ergonomics b.v."#)
        XCTAssertEqual(CompanyIdentifier.bmaErgonomics.description, #"BMA ergonomics b.v."#)
    
        // Teva Branded Pharmaceutical Products R&D, Inc.
        XCTAssertEqual(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.rawValue, 718)
        XCTAssertEqual(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.name, #"Teva Branded Pharmaceutical Products R&D, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.description, #"Teva Branded Pharmaceutical Products R&D, Inc."#)
    
        // Anima
        XCTAssertEqual(CompanyIdentifier.anima.rawValue, 719)
        XCTAssertEqual(CompanyIdentifier.anima.name, #"Anima"#)
        XCTAssertEqual(CompanyIdentifier.anima.description, #"Anima"#)
    
        // 3M
        XCTAssertEqual(CompanyIdentifier.company3M.rawValue, 720)
        XCTAssertEqual(CompanyIdentifier.company3M.name, #"3M"#)
        XCTAssertEqual(CompanyIdentifier.company3M.description, #"3M"#)
    
        // Empatica Srl
        XCTAssertEqual(CompanyIdentifier.empatica.rawValue, 721)
        XCTAssertEqual(CompanyIdentifier.empatica.name, #"Empatica Srl"#)
        XCTAssertEqual(CompanyIdentifier.empatica.description, #"Empatica Srl"#)
    
        // Afero, Inc.
        XCTAssertEqual(CompanyIdentifier.afero.rawValue, 722)
        XCTAssertEqual(CompanyIdentifier.afero.name, #"Afero, Inc."#)
        XCTAssertEqual(CompanyIdentifier.afero.description, #"Afero, Inc."#)
    
        // Powercast Corporation
        XCTAssertEqual(CompanyIdentifier.powercast.rawValue, 723)
        XCTAssertEqual(CompanyIdentifier.powercast.name, #"Powercast Corporation"#)
        XCTAssertEqual(CompanyIdentifier.powercast.description, #"Powercast Corporation"#)
    
        // Secuyou ApS
        XCTAssertEqual(CompanyIdentifier.secuyou.rawValue, 724)
        XCTAssertEqual(CompanyIdentifier.secuyou.name, #"Secuyou ApS"#)
        XCTAssertEqual(CompanyIdentifier.secuyou.description, #"Secuyou ApS"#)
    
        // OMRON Corporation
        XCTAssertEqual(CompanyIdentifier.omron.rawValue, 725)
        XCTAssertEqual(CompanyIdentifier.omron.name, #"OMRON Corporation"#)
        XCTAssertEqual(CompanyIdentifier.omron.description, #"OMRON Corporation"#)
    
        // Send Solutions
        XCTAssertEqual(CompanyIdentifier.sendSolutions.rawValue, 726)
        XCTAssertEqual(CompanyIdentifier.sendSolutions.name, #"Send Solutions"#)
        XCTAssertEqual(CompanyIdentifier.sendSolutions.description, #"Send Solutions"#)
    
        // NIPPON SYSTEMWARE CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.nipponSystemware.rawValue, 727)
        XCTAssertEqual(CompanyIdentifier.nipponSystemware.name, #"NIPPON SYSTEMWARE CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.nipponSystemware.description, #"NIPPON SYSTEMWARE CO.,LTD."#)
    
        // Neosfar
        XCTAssertEqual(CompanyIdentifier.neosfar.rawValue, 728)
        XCTAssertEqual(CompanyIdentifier.neosfar.name, #"Neosfar"#)
        XCTAssertEqual(CompanyIdentifier.neosfar.description, #"Neosfar"#)
    
        // Fliegl Agrartechnik GmbH
        XCTAssertEqual(CompanyIdentifier.flieglAgrartechnik.rawValue, 729)
        XCTAssertEqual(CompanyIdentifier.flieglAgrartechnik.name, #"Fliegl Agrartechnik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.flieglAgrartechnik.description, #"Fliegl Agrartechnik GmbH"#)
    
        // Gilvader
        XCTAssertEqual(CompanyIdentifier.gilvader.rawValue, 730)
        XCTAssertEqual(CompanyIdentifier.gilvader.name, #"Gilvader"#)
        XCTAssertEqual(CompanyIdentifier.gilvader.description, #"Gilvader"#)
    
        // Digi International Inc (R)
        XCTAssertEqual(CompanyIdentifier.digiInternationalR.rawValue, 731)
        XCTAssertEqual(CompanyIdentifier.digiInternationalR.name, #"Digi International Inc (R)"#)
        XCTAssertEqual(CompanyIdentifier.digiInternationalR.description, #"Digi International Inc (R)"#)
    
        // DeWalch Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.dewalchTechnologies.rawValue, 732)
        XCTAssertEqual(CompanyIdentifier.dewalchTechnologies.name, #"DeWalch Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dewalchTechnologies.description, #"DeWalch Technologies, Inc."#)
    
        // Flint Rehabilitation Devices, LLC
        XCTAssertEqual(CompanyIdentifier.flintRehabilitationDevices.rawValue, 733)
        XCTAssertEqual(CompanyIdentifier.flintRehabilitationDevices.name, #"Flint Rehabilitation Devices, LLC"#)
        XCTAssertEqual(CompanyIdentifier.flintRehabilitationDevices.description, #"Flint Rehabilitation Devices, LLC"#)
    
        // Samsung SDS Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.samsungSds.rawValue, 734)
        XCTAssertEqual(CompanyIdentifier.samsungSds.name, #"Samsung SDS Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.samsungSds.description, #"Samsung SDS Co., Ltd."#)
    
        // Blur Product Development
        XCTAssertEqual(CompanyIdentifier.blurProductDevelopment.rawValue, 735)
        XCTAssertEqual(CompanyIdentifier.blurProductDevelopment.name, #"Blur Product Development"#)
        XCTAssertEqual(CompanyIdentifier.blurProductDevelopment.description, #"Blur Product Development"#)
    
        // University of Michigan
        XCTAssertEqual(CompanyIdentifier.universityOfMichigan.rawValue, 736)
        XCTAssertEqual(CompanyIdentifier.universityOfMichigan.name, #"University of Michigan"#)
        XCTAssertEqual(CompanyIdentifier.universityOfMichigan.description, #"University of Michigan"#)
    
        // Victron Energy BV
        XCTAssertEqual(CompanyIdentifier.victronEnergy.rawValue, 737)
        XCTAssertEqual(CompanyIdentifier.victronEnergy.name, #"Victron Energy BV"#)
        XCTAssertEqual(CompanyIdentifier.victronEnergy.description, #"Victron Energy BV"#)
    
        // NTT docomo
        XCTAssertEqual(CompanyIdentifier.nttDocomo.rawValue, 738)
        XCTAssertEqual(CompanyIdentifier.nttDocomo.name, #"NTT docomo"#)
        XCTAssertEqual(CompanyIdentifier.nttDocomo.description, #"NTT docomo"#)
    
        // Carmanah Technologies Corp.
        XCTAssertEqual(CompanyIdentifier.carmanahTechnologies.rawValue, 739)
        XCTAssertEqual(CompanyIdentifier.carmanahTechnologies.name, #"Carmanah Technologies Corp."#)
        XCTAssertEqual(CompanyIdentifier.carmanahTechnologies.description, #"Carmanah Technologies Corp."#)
    
        // Bytestorm Ltd.
        XCTAssertEqual(CompanyIdentifier.bytestorm.rawValue, 740)
        XCTAssertEqual(CompanyIdentifier.bytestorm.name, #"Bytestorm Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bytestorm.description, #"Bytestorm Ltd."#)
    
        // Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 )
        XCTAssertEqual(CompanyIdentifier.espressif.rawValue, 741)
        XCTAssertEqual(CompanyIdentifier.espressif.name, #"Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 )"#)
        XCTAssertEqual(CompanyIdentifier.espressif.description, #"Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 )"#)
    
        // Unwire
        XCTAssertEqual(CompanyIdentifier.unwire.rawValue, 742)
        XCTAssertEqual(CompanyIdentifier.unwire.name, #"Unwire"#)
        XCTAssertEqual(CompanyIdentifier.unwire.description, #"Unwire"#)
    
        // Connected Yard, Inc.
        XCTAssertEqual(CompanyIdentifier.connectedYard.rawValue, 743)
        XCTAssertEqual(CompanyIdentifier.connectedYard.name, #"Connected Yard, Inc."#)
        XCTAssertEqual(CompanyIdentifier.connectedYard.description, #"Connected Yard, Inc."#)
    
        // American Music Environments
        XCTAssertEqual(CompanyIdentifier.americanMusicEnvironments.rawValue, 744)
        XCTAssertEqual(CompanyIdentifier.americanMusicEnvironments.name, #"American Music Environments"#)
        XCTAssertEqual(CompanyIdentifier.americanMusicEnvironments.description, #"American Music Environments"#)
    
        // Sensogram Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.sensogramTechnologies.rawValue, 745)
        XCTAssertEqual(CompanyIdentifier.sensogramTechnologies.name, #"Sensogram Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sensogramTechnologies.description, #"Sensogram Technologies, Inc."#)
    
        // Fujitsu Limited
        XCTAssertEqual(CompanyIdentifier.fujitsu.rawValue, 746)
        XCTAssertEqual(CompanyIdentifier.fujitsu.name, #"Fujitsu Limited"#)
        XCTAssertEqual(CompanyIdentifier.fujitsu.description, #"Fujitsu Limited"#)
    
        // Ardic Technology
        XCTAssertEqual(CompanyIdentifier.ardicTechnology.rawValue, 747)
        XCTAssertEqual(CompanyIdentifier.ardicTechnology.name, #"Ardic Technology"#)
        XCTAssertEqual(CompanyIdentifier.ardicTechnology.description, #"Ardic Technology"#)
    
        // Delta Systems, Inc
        XCTAssertEqual(CompanyIdentifier.deltaSystems.rawValue, 748)
        XCTAssertEqual(CompanyIdentifier.deltaSystems.name, #"Delta Systems, Inc"#)
        XCTAssertEqual(CompanyIdentifier.deltaSystems.description, #"Delta Systems, Inc"#)
    
        // HTC Corporation
        XCTAssertEqual(CompanyIdentifier.htc.rawValue, 749)
        XCTAssertEqual(CompanyIdentifier.htc.name, #"HTC Corporation "#)
        XCTAssertEqual(CompanyIdentifier.htc.description, #"HTC Corporation "#)
    
        // Citizen Holdings Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.citizenHoldings.rawValue, 750)
        XCTAssertEqual(CompanyIdentifier.citizenHoldings.name, #"Citizen Holdings Co., Ltd. "#)
        XCTAssertEqual(CompanyIdentifier.citizenHoldings.description, #"Citizen Holdings Co., Ltd. "#)
    
        // SMART-INNOVATION.inc
        XCTAssertEqual(CompanyIdentifier.smartInnovationInc.rawValue, 751)
        XCTAssertEqual(CompanyIdentifier.smartInnovationInc.name, #"SMART-INNOVATION.inc"#)
        XCTAssertEqual(CompanyIdentifier.smartInnovationInc.description, #"SMART-INNOVATION.inc"#)
    
        // Blackrat Software
        XCTAssertEqual(CompanyIdentifier.blackratSoftware.rawValue, 752)
        XCTAssertEqual(CompanyIdentifier.blackratSoftware.name, #"Blackrat Software "#)
        XCTAssertEqual(CompanyIdentifier.blackratSoftware.description, #"Blackrat Software "#)
    
        // The Idea Cave, LLC
        XCTAssertEqual(CompanyIdentifier.ideaCave.rawValue, 753)
        XCTAssertEqual(CompanyIdentifier.ideaCave.name, #"The Idea Cave, LLC"#)
        XCTAssertEqual(CompanyIdentifier.ideaCave.description, #"The Idea Cave, LLC"#)
    
        // GoPro, Inc.
        XCTAssertEqual(CompanyIdentifier.gopro.rawValue, 754)
        XCTAssertEqual(CompanyIdentifier.gopro.name, #"GoPro, Inc."#)
        XCTAssertEqual(CompanyIdentifier.gopro.description, #"GoPro, Inc."#)
    
        // AuthAir, Inc
        XCTAssertEqual(CompanyIdentifier.authair.rawValue, 755)
        XCTAssertEqual(CompanyIdentifier.authair.name, #"AuthAir, Inc"#)
        XCTAssertEqual(CompanyIdentifier.authair.description, #"AuthAir, Inc"#)
    
        // Vensi, Inc.
        XCTAssertEqual(CompanyIdentifier.vensi.rawValue, 756)
        XCTAssertEqual(CompanyIdentifier.vensi.name, #"Vensi, Inc."#)
        XCTAssertEqual(CompanyIdentifier.vensi.description, #"Vensi, Inc."#)
    
        // Indagem Tech LLC
        XCTAssertEqual(CompanyIdentifier.indagemTech.rawValue, 757)
        XCTAssertEqual(CompanyIdentifier.indagemTech.name, #"Indagem Tech LLC"#)
        XCTAssertEqual(CompanyIdentifier.indagemTech.description, #"Indagem Tech LLC"#)
    
        // Intemo Technologies
        XCTAssertEqual(CompanyIdentifier.intemoTechnologies.rawValue, 758)
        XCTAssertEqual(CompanyIdentifier.intemoTechnologies.name, #"Intemo Technologies"#)
        XCTAssertEqual(CompanyIdentifier.intemoTechnologies.description, #"Intemo Technologies"#)
    
        // DreamVisions co., Ltd.
        XCTAssertEqual(CompanyIdentifier.dreamvisions.rawValue, 759)
        XCTAssertEqual(CompanyIdentifier.dreamvisions.name, #"DreamVisions co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.dreamvisions.description, #"DreamVisions co., Ltd."#)
    
        // Runteq Oy Ltd
        XCTAssertEqual(CompanyIdentifier.runteq.rawValue, 760)
        XCTAssertEqual(CompanyIdentifier.runteq.name, #"Runteq Oy Ltd"#)
        XCTAssertEqual(CompanyIdentifier.runteq.description, #"Runteq Oy Ltd"#)
    
        // IMAGINATION TECHNOLOGIES LTD
        XCTAssertEqual(CompanyIdentifier.imaginationTechnologies.rawValue, 761)
        XCTAssertEqual(CompanyIdentifier.imaginationTechnologies.name, #"IMAGINATION TECHNOLOGIES LTD "#)
        XCTAssertEqual(CompanyIdentifier.imaginationTechnologies.description, #"IMAGINATION TECHNOLOGIES LTD "#)
    
        // CoSTAR TEchnologies
        XCTAssertEqual(CompanyIdentifier.costarTechnologies.rawValue, 762)
        XCTAssertEqual(CompanyIdentifier.costarTechnologies.name, #"CoSTAR TEchnologies"#)
        XCTAssertEqual(CompanyIdentifier.costarTechnologies.description, #"CoSTAR TEchnologies"#)
    
        // Clarius Mobile Health Corp.
        XCTAssertEqual(CompanyIdentifier.clariusMobileHealth.rawValue, 763)
        XCTAssertEqual(CompanyIdentifier.clariusMobileHealth.name, #"Clarius Mobile Health Corp."#)
        XCTAssertEqual(CompanyIdentifier.clariusMobileHealth.description, #"Clarius Mobile Health Corp."#)
    
        // Shanghai Frequen Microelectronics Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiFrequenMicroelectronics.rawValue, 764)
        XCTAssertEqual(CompanyIdentifier.shanghaiFrequenMicroelectronics.name, #"Shanghai Frequen Microelectronics Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiFrequenMicroelectronics.description, #"Shanghai Frequen Microelectronics Co., Ltd."#)
    
        // Uwanna, Inc.
        XCTAssertEqual(CompanyIdentifier.uwanna.rawValue, 765)
        XCTAssertEqual(CompanyIdentifier.uwanna.name, #"Uwanna, Inc."#)
        XCTAssertEqual(CompanyIdentifier.uwanna.description, #"Uwanna, Inc."#)
    
        // Lierda Science & Technology Group Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.lierdaScienceTechnologyGroup.rawValue, 766)
        XCTAssertEqual(CompanyIdentifier.lierdaScienceTechnologyGroup.name, #"Lierda Science & Technology Group Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.lierdaScienceTechnologyGroup.description, #"Lierda Science & Technology Group Co., Ltd."#)
    
        // Silicon Laboratories
        XCTAssertEqual(CompanyIdentifier.siliconLaboratories.rawValue, 767)
        XCTAssertEqual(CompanyIdentifier.siliconLaboratories.name, #"Silicon Laboratories"#)
        XCTAssertEqual(CompanyIdentifier.siliconLaboratories.description, #"Silicon Laboratories"#)
    
        // World Moto Inc.
        XCTAssertEqual(CompanyIdentifier.worldMoto.rawValue, 768)
        XCTAssertEqual(CompanyIdentifier.worldMoto.name, #"World Moto Inc."#)
        XCTAssertEqual(CompanyIdentifier.worldMoto.description, #"World Moto Inc."#)
    
        // Giatec Scientific Inc.
        XCTAssertEqual(CompanyIdentifier.giatecScientific.rawValue, 769)
        XCTAssertEqual(CompanyIdentifier.giatecScientific.name, #"Giatec Scientific Inc."#)
        XCTAssertEqual(CompanyIdentifier.giatecScientific.description, #"Giatec Scientific Inc."#)
    
        // Loop Devices, Inc
        XCTAssertEqual(CompanyIdentifier.loopDevices.rawValue, 770)
        XCTAssertEqual(CompanyIdentifier.loopDevices.name, #"Loop Devices, Inc"#)
        XCTAssertEqual(CompanyIdentifier.loopDevices.description, #"Loop Devices, Inc"#)
    
        // IACA electronique
        XCTAssertEqual(CompanyIdentifier.iacaElectronique.rawValue, 771)
        XCTAssertEqual(CompanyIdentifier.iacaElectronique.name, #"IACA electronique"#)
        XCTAssertEqual(CompanyIdentifier.iacaElectronique.description, #"IACA electronique"#)
    
        // Proxy Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.proxyTechnologies.rawValue, 772)
        XCTAssertEqual(CompanyIdentifier.proxyTechnologies.name, #"Proxy Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.proxyTechnologies.description, #"Proxy Technologies, Inc."#)
    
        // Swipp ApS
        XCTAssertEqual(CompanyIdentifier.swipp.rawValue, 773)
        XCTAssertEqual(CompanyIdentifier.swipp.name, #"Swipp ApS"#)
        XCTAssertEqual(CompanyIdentifier.swipp.description, #"Swipp ApS"#)
    
        // Life Laboratory Inc.
        XCTAssertEqual(CompanyIdentifier.lifeLaboratory.rawValue, 774)
        XCTAssertEqual(CompanyIdentifier.lifeLaboratory.name, #"Life Laboratory Inc. "#)
        XCTAssertEqual(CompanyIdentifier.lifeLaboratory.description, #"Life Laboratory Inc. "#)
    
        // FUJI INDUSTRIAL CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.fujiIndustrial.rawValue, 775)
        XCTAssertEqual(CompanyIdentifier.fujiIndustrial.name, #"FUJI INDUSTRIAL CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.fujiIndustrial.description, #"FUJI INDUSTRIAL CO.,LTD."#)
    
        // Surefire, LLC
        XCTAssertEqual(CompanyIdentifier.surefire.rawValue, 776)
        XCTAssertEqual(CompanyIdentifier.surefire.name, #"Surefire, LLC"#)
        XCTAssertEqual(CompanyIdentifier.surefire.description, #"Surefire, LLC"#)
    
        // Dolby Labs
        XCTAssertEqual(CompanyIdentifier.dolbyLabs.rawValue, 777)
        XCTAssertEqual(CompanyIdentifier.dolbyLabs.name, #"Dolby Labs"#)
        XCTAssertEqual(CompanyIdentifier.dolbyLabs.description, #"Dolby Labs"#)
    
        // Ellisys
        XCTAssertEqual(CompanyIdentifier.ellisys.rawValue, 778)
        XCTAssertEqual(CompanyIdentifier.ellisys.name, #"Ellisys"#)
        XCTAssertEqual(CompanyIdentifier.ellisys.description, #"Ellisys"#)
    
        // Magnitude Lighting Converters
        XCTAssertEqual(CompanyIdentifier.magnitudeLightingConverters.rawValue, 779)
        XCTAssertEqual(CompanyIdentifier.magnitudeLightingConverters.name, #"Magnitude Lighting Converters"#)
        XCTAssertEqual(CompanyIdentifier.magnitudeLightingConverters.description, #"Magnitude Lighting Converters"#)
    
        // Hilti AG
        XCTAssertEqual(CompanyIdentifier.hilti.rawValue, 780)
        XCTAssertEqual(CompanyIdentifier.hilti.name, #"Hilti AG"#)
        XCTAssertEqual(CompanyIdentifier.hilti.description, #"Hilti AG"#)
    
        // Devdata S.r.l.
        XCTAssertEqual(CompanyIdentifier.devdata.rawValue, 781)
        XCTAssertEqual(CompanyIdentifier.devdata.name, #"Devdata S.r.l."#)
        XCTAssertEqual(CompanyIdentifier.devdata.description, #"Devdata S.r.l."#)
    
        // Deviceworx
        XCTAssertEqual(CompanyIdentifier.deviceworx.rawValue, 782)
        XCTAssertEqual(CompanyIdentifier.deviceworx.name, #"Deviceworx"#)
        XCTAssertEqual(CompanyIdentifier.deviceworx.description, #"Deviceworx"#)
    
        // Shortcut Labs
        XCTAssertEqual(CompanyIdentifier.shortcutLabs.rawValue, 783)
        XCTAssertEqual(CompanyIdentifier.shortcutLabs.name, #"Shortcut Labs"#)
        XCTAssertEqual(CompanyIdentifier.shortcutLabs.description, #"Shortcut Labs"#)
    
        // SGL Italia S.r.l.
        XCTAssertEqual(CompanyIdentifier.sglItalia.rawValue, 784)
        XCTAssertEqual(CompanyIdentifier.sglItalia.name, #"SGL Italia S.r.l."#)
        XCTAssertEqual(CompanyIdentifier.sglItalia.description, #"SGL Italia S.r.l."#)
    
        // PEEQ DATA
        XCTAssertEqual(CompanyIdentifier.peeqData.rawValue, 785)
        XCTAssertEqual(CompanyIdentifier.peeqData.name, #"PEEQ DATA"#)
        XCTAssertEqual(CompanyIdentifier.peeqData.description, #"PEEQ DATA"#)
    
        // Ducere Technologies Pvt Ltd
        XCTAssertEqual(CompanyIdentifier.ducereTechnologiesPvt.rawValue, 786)
        XCTAssertEqual(CompanyIdentifier.ducereTechnologiesPvt.name, #"Ducere Technologies Pvt Ltd "#)
        XCTAssertEqual(CompanyIdentifier.ducereTechnologiesPvt.description, #"Ducere Technologies Pvt Ltd "#)
    
        // DiveNav, Inc.
        XCTAssertEqual(CompanyIdentifier.divenav.rawValue, 787)
        XCTAssertEqual(CompanyIdentifier.divenav.name, #"DiveNav, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.divenav.description, #"DiveNav, Inc. "#)
    
        // RIIG AI Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.riigAi.rawValue, 788)
        XCTAssertEqual(CompanyIdentifier.riigAi.name, #"RIIG AI Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.riigAi.description, #"RIIG AI Sp. z o.o."#)
    
        // Thermo Fisher Scientific
        XCTAssertEqual(CompanyIdentifier.thermoFisherScientific.rawValue, 789)
        XCTAssertEqual(CompanyIdentifier.thermoFisherScientific.name, #"Thermo Fisher Scientific "#)
        XCTAssertEqual(CompanyIdentifier.thermoFisherScientific.description, #"Thermo Fisher Scientific "#)
    
        // AG Measurematics Pvt. Ltd.
        XCTAssertEqual(CompanyIdentifier.agMeasurematics.rawValue, 790)
        XCTAssertEqual(CompanyIdentifier.agMeasurematics.name, #"AG Measurematics Pvt. Ltd. "#)
        XCTAssertEqual(CompanyIdentifier.agMeasurematics.description, #"AG Measurematics Pvt. Ltd. "#)
    
        // CHUO Electronics CO., LTD.
        XCTAssertEqual(CompanyIdentifier.chuoElectronics.rawValue, 791)
        XCTAssertEqual(CompanyIdentifier.chuoElectronics.name, #"CHUO Electronics CO., LTD. "#)
        XCTAssertEqual(CompanyIdentifier.chuoElectronics.description, #"CHUO Electronics CO., LTD. "#)
    
        // Aspenta International
        XCTAssertEqual(CompanyIdentifier.aspentaInternational.rawValue, 792)
        XCTAssertEqual(CompanyIdentifier.aspentaInternational.name, #"Aspenta International "#)
        XCTAssertEqual(CompanyIdentifier.aspentaInternational.description, #"Aspenta International "#)
    
        // Eugster Frismag AG
        XCTAssertEqual(CompanyIdentifier.eugsterFrismag.rawValue, 793)
        XCTAssertEqual(CompanyIdentifier.eugsterFrismag.name, #"Eugster Frismag AG "#)
        XCTAssertEqual(CompanyIdentifier.eugsterFrismag.description, #"Eugster Frismag AG "#)
    
        // Wurth Elektronik eiSos GmbH & Co. KG ( formerly Amber wireless GmbH)
        XCTAssertEqual(CompanyIdentifier.wurthElektronikEisosFormerlyAmberWireless.rawValue, 794)
        XCTAssertEqual(CompanyIdentifier.wurthElektronikEisosFormerlyAmberWireless.name, #"Wurth Elektronik eiSos GmbH & Co. KG ( formerly Amber wireless GmbH) "#)
        XCTAssertEqual(CompanyIdentifier.wurthElektronikEisosFormerlyAmberWireless.description, #"Wurth Elektronik eiSos GmbH & Co. KG ( formerly Amber wireless GmbH) "#)
    
        // HQ Inc
        XCTAssertEqual(CompanyIdentifier.hq.rawValue, 795)
        XCTAssertEqual(CompanyIdentifier.hq.name, #"HQ Inc "#)
        XCTAssertEqual(CompanyIdentifier.hq.description, #"HQ Inc "#)
    
        // Lab Sensor Solutions
        XCTAssertEqual(CompanyIdentifier.labSensorSolutions.rawValue, 796)
        XCTAssertEqual(CompanyIdentifier.labSensorSolutions.name, #"Lab Sensor Solutions "#)
        XCTAssertEqual(CompanyIdentifier.labSensorSolutions.description, #"Lab Sensor Solutions "#)
    
        // Enterlab ApS
        XCTAssertEqual(CompanyIdentifier.enterlab.rawValue, 797)
        XCTAssertEqual(CompanyIdentifier.enterlab.name, #"Enterlab ApS "#)
        XCTAssertEqual(CompanyIdentifier.enterlab.description, #"Enterlab ApS "#)
    
        // Eyefi, Inc.
        XCTAssertEqual(CompanyIdentifier.eyefi.rawValue, 798)
        XCTAssertEqual(CompanyIdentifier.eyefi.name, #"Eyefi, Inc."#)
        XCTAssertEqual(CompanyIdentifier.eyefi.description, #"Eyefi, Inc."#)
    
        // MetaSystem S.p.A.
        XCTAssertEqual(CompanyIdentifier.metasystem.rawValue, 799)
        XCTAssertEqual(CompanyIdentifier.metasystem.name, #"MetaSystem S.p.A. "#)
        XCTAssertEqual(CompanyIdentifier.metasystem.description, #"MetaSystem S.p.A. "#)
    
        // SONO ELECTRONICS. CO., LTD
        XCTAssertEqual(CompanyIdentifier.sonoElectronics.rawValue, 800)
        XCTAssertEqual(CompanyIdentifier.sonoElectronics.name, #"SONO ELECTRONICS. CO., LTD "#)
        XCTAssertEqual(CompanyIdentifier.sonoElectronics.description, #"SONO ELECTRONICS. CO., LTD "#)
    
        // Jewelbots
        XCTAssertEqual(CompanyIdentifier.jewelbots.rawValue, 801)
        XCTAssertEqual(CompanyIdentifier.jewelbots.name, #"Jewelbots "#)
        XCTAssertEqual(CompanyIdentifier.jewelbots.description, #"Jewelbots "#)
    
        // Compumedics Limited
        XCTAssertEqual(CompanyIdentifier.compumedics.rawValue, 802)
        XCTAssertEqual(CompanyIdentifier.compumedics.name, #"Compumedics Limited "#)
        XCTAssertEqual(CompanyIdentifier.compumedics.description, #"Compumedics Limited "#)
    
        // Rotor Bike Components
        XCTAssertEqual(CompanyIdentifier.rotorBikeComponents.rawValue, 803)
        XCTAssertEqual(CompanyIdentifier.rotorBikeComponents.name, #"Rotor Bike Components "#)
        XCTAssertEqual(CompanyIdentifier.rotorBikeComponents.description, #"Rotor Bike Components "#)
    
        // Astro, Inc.
        XCTAssertEqual(CompanyIdentifier.astro.rawValue, 804)
        XCTAssertEqual(CompanyIdentifier.astro.name, #"Astro, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.astro.description, #"Astro, Inc. "#)
    
        // Amotus Solutions
        XCTAssertEqual(CompanyIdentifier.amotusSolutions.rawValue, 805)
        XCTAssertEqual(CompanyIdentifier.amotusSolutions.name, #"Amotus Solutions "#)
        XCTAssertEqual(CompanyIdentifier.amotusSolutions.description, #"Amotus Solutions "#)
    
        // Healthwear Technologies (Changzhou)Ltd
        XCTAssertEqual(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.rawValue, 806)
        XCTAssertEqual(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.name, #"Healthwear Technologies (Changzhou)Ltd "#)
        XCTAssertEqual(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.description, #"Healthwear Technologies (Changzhou)Ltd "#)
    
        // Essex Electronics
        XCTAssertEqual(CompanyIdentifier.essexElectronics.rawValue, 807)
        XCTAssertEqual(CompanyIdentifier.essexElectronics.name, #"Essex Electronics "#)
        XCTAssertEqual(CompanyIdentifier.essexElectronics.description, #"Essex Electronics "#)
    
        // Grundfos A/S
        XCTAssertEqual(CompanyIdentifier.grundfos.rawValue, 808)
        XCTAssertEqual(CompanyIdentifier.grundfos.name, #"Grundfos A/S"#)
        XCTAssertEqual(CompanyIdentifier.grundfos.description, #"Grundfos A/S"#)
    
        // Eargo, Inc.
        XCTAssertEqual(CompanyIdentifier.eargo.rawValue, 809)
        XCTAssertEqual(CompanyIdentifier.eargo.name, #"Eargo, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.eargo.description, #"Eargo, Inc. "#)
    
        // Electronic Design Lab
        XCTAssertEqual(CompanyIdentifier.electronicDesignLab.rawValue, 810)
        XCTAssertEqual(CompanyIdentifier.electronicDesignLab.name, #"Electronic Design Lab "#)
        XCTAssertEqual(CompanyIdentifier.electronicDesignLab.description, #"Electronic Design Lab "#)
    
        // ESYLUX
        XCTAssertEqual(CompanyIdentifier.esylux.rawValue, 811)
        XCTAssertEqual(CompanyIdentifier.esylux.name, #"ESYLUX "#)
        XCTAssertEqual(CompanyIdentifier.esylux.description, #"ESYLUX "#)
    
        // NIPPON SMT.CO.,Ltd
        XCTAssertEqual(CompanyIdentifier.nipponSmt.rawValue, 812)
        XCTAssertEqual(CompanyIdentifier.nipponSmt.name, #"NIPPON SMT.CO.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.nipponSmt.description, #"NIPPON SMT.CO.,Ltd"#)
    
        // BM innovations GmbH
        XCTAssertEqual(CompanyIdentifier.bmInnovations.rawValue, 813)
        XCTAssertEqual(CompanyIdentifier.bmInnovations.name, #"BM innovations GmbH "#)
        XCTAssertEqual(CompanyIdentifier.bmInnovations.description, #"BM innovations GmbH "#)
    
        // indoormap
        XCTAssertEqual(CompanyIdentifier.indoormap.rawValue, 814)
        XCTAssertEqual(CompanyIdentifier.indoormap.name, #"indoormap"#)
        XCTAssertEqual(CompanyIdentifier.indoormap.description, #"indoormap"#)
    
        // OttoQ Inc
        XCTAssertEqual(CompanyIdentifier.ottoq.rawValue, 815)
        XCTAssertEqual(CompanyIdentifier.ottoq.name, #"OttoQ Inc "#)
        XCTAssertEqual(CompanyIdentifier.ottoq.description, #"OttoQ Inc "#)
    
        // North Pole Engineering
        XCTAssertEqual(CompanyIdentifier.northPoleEngineering.rawValue, 816)
        XCTAssertEqual(CompanyIdentifier.northPoleEngineering.name, #"North Pole Engineering "#)
        XCTAssertEqual(CompanyIdentifier.northPoleEngineering.description, #"North Pole Engineering "#)
    
        // 3flares Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.company3FlaresTechnologies.rawValue, 817)
        XCTAssertEqual(CompanyIdentifier.company3FlaresTechnologies.name, #"3flares Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.company3FlaresTechnologies.description, #"3flares Technologies Inc."#)
    
        // Electrocompaniet A.S.
        XCTAssertEqual(CompanyIdentifier.electrocompaniet.rawValue, 818)
        XCTAssertEqual(CompanyIdentifier.electrocompaniet.name, #"Electrocompaniet A.S. "#)
        XCTAssertEqual(CompanyIdentifier.electrocompaniet.description, #"Electrocompaniet A.S. "#)
    
        // Mul-T-Lock
        XCTAssertEqual(CompanyIdentifier.mulTLock.rawValue, 819)
        XCTAssertEqual(CompanyIdentifier.mulTLock.name, #"Mul-T-Lock"#)
        XCTAssertEqual(CompanyIdentifier.mulTLock.description, #"Mul-T-Lock"#)
    
        // Corentium AS
        XCTAssertEqual(CompanyIdentifier.corentium.rawValue, 820)
        XCTAssertEqual(CompanyIdentifier.corentium.name, #"Corentium AS "#)
        XCTAssertEqual(CompanyIdentifier.corentium.description, #"Corentium AS "#)
    
        // Enlighted Inc
        XCTAssertEqual(CompanyIdentifier.enlighted.rawValue, 821)
        XCTAssertEqual(CompanyIdentifier.enlighted.name, #"Enlighted Inc"#)
        XCTAssertEqual(CompanyIdentifier.enlighted.description, #"Enlighted Inc"#)
    
        // GISTIC
        XCTAssertEqual(CompanyIdentifier.gistic.rawValue, 822)
        XCTAssertEqual(CompanyIdentifier.gistic.name, #"GISTIC"#)
        XCTAssertEqual(CompanyIdentifier.gistic.description, #"GISTIC"#)
    
        // AJP2 Holdings, LLC
        XCTAssertEqual(CompanyIdentifier.ajp2Holdings.rawValue, 823)
        XCTAssertEqual(CompanyIdentifier.ajp2Holdings.name, #"AJP2 Holdings, LLC"#)
        XCTAssertEqual(CompanyIdentifier.ajp2Holdings.description, #"AJP2 Holdings, LLC"#)
    
        // COBI GmbH
        XCTAssertEqual(CompanyIdentifier.cobi.rawValue, 824)
        XCTAssertEqual(CompanyIdentifier.cobi.name, #"COBI GmbH "#)
        XCTAssertEqual(CompanyIdentifier.cobi.description, #"COBI GmbH "#)
    
        // Blue Sky Scientific, LLC
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific2.rawValue, 825)
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific2.name, #"Blue Sky Scientific, LLC "#)
        XCTAssertEqual(CompanyIdentifier.blueSkyScientific2.description, #"Blue Sky Scientific, LLC "#)
    
        // Appception, Inc.
        XCTAssertEqual(CompanyIdentifier.appception.rawValue, 826)
        XCTAssertEqual(CompanyIdentifier.appception.name, #"Appception, Inc."#)
        XCTAssertEqual(CompanyIdentifier.appception.description, #"Appception, Inc."#)
    
        // Courtney Thorne Limited
        XCTAssertEqual(CompanyIdentifier.courtneyThorne.rawValue, 827)
        XCTAssertEqual(CompanyIdentifier.courtneyThorne.name, #"Courtney Thorne Limited "#)
        XCTAssertEqual(CompanyIdentifier.courtneyThorne.description, #"Courtney Thorne Limited "#)
    
        // Virtuosys
        XCTAssertEqual(CompanyIdentifier.virtuosys.rawValue, 828)
        XCTAssertEqual(CompanyIdentifier.virtuosys.name, #"Virtuosys"#)
        XCTAssertEqual(CompanyIdentifier.virtuosys.description, #"Virtuosys"#)
    
        // TPV Technology Limited
        XCTAssertEqual(CompanyIdentifier.tpvTechnology.rawValue, 829)
        XCTAssertEqual(CompanyIdentifier.tpvTechnology.name, #"TPV Technology Limited "#)
        XCTAssertEqual(CompanyIdentifier.tpvTechnology.description, #"TPV Technology Limited "#)
    
        // Monitra SA
        XCTAssertEqual(CompanyIdentifier.monitra.rawValue, 830)
        XCTAssertEqual(CompanyIdentifier.monitra.name, #"Monitra SA"#)
        XCTAssertEqual(CompanyIdentifier.monitra.description, #"Monitra SA"#)
    
        // Automation Components, Inc.
        XCTAssertEqual(CompanyIdentifier.automationComponents.rawValue, 831)
        XCTAssertEqual(CompanyIdentifier.automationComponents.name, #"Automation Components, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.automationComponents.description, #"Automation Components, Inc. "#)
    
        // Letsense s.r.l.
        XCTAssertEqual(CompanyIdentifier.letsense.rawValue, 832)
        XCTAssertEqual(CompanyIdentifier.letsense.name, #"Letsense s.r.l. "#)
        XCTAssertEqual(CompanyIdentifier.letsense.description, #"Letsense s.r.l. "#)
    
        // Etesian Technologies LLC
        XCTAssertEqual(CompanyIdentifier.etesianTechnologies.rawValue, 833)
        XCTAssertEqual(CompanyIdentifier.etesianTechnologies.name, #"Etesian Technologies LLC "#)
        XCTAssertEqual(CompanyIdentifier.etesianTechnologies.description, #"Etesian Technologies LLC "#)
    
        // GERTEC BRASIL LTDA.
        XCTAssertEqual(CompanyIdentifier.gertecBrasila.rawValue, 834)
        XCTAssertEqual(CompanyIdentifier.gertecBrasila.name, #"GERTEC BRASIL LTDA. "#)
        XCTAssertEqual(CompanyIdentifier.gertecBrasila.description, #"GERTEC BRASIL LTDA. "#)
    
        // Drekker Development Pty. Ltd.
        XCTAssertEqual(CompanyIdentifier.drekkerDevelopmentPty.rawValue, 835)
        XCTAssertEqual(CompanyIdentifier.drekkerDevelopmentPty.name, #"Drekker Development Pty. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.drekkerDevelopmentPty.description, #"Drekker Development Pty. Ltd."#)
    
        // Whirl Inc
        XCTAssertEqual(CompanyIdentifier.whirl.rawValue, 836)
        XCTAssertEqual(CompanyIdentifier.whirl.name, #"Whirl Inc "#)
        XCTAssertEqual(CompanyIdentifier.whirl.description, #"Whirl Inc "#)
    
        // Locus Positioning
        XCTAssertEqual(CompanyIdentifier.locusPositioning.rawValue, 837)
        XCTAssertEqual(CompanyIdentifier.locusPositioning.name, #"Locus Positioning "#)
        XCTAssertEqual(CompanyIdentifier.locusPositioning.description, #"Locus Positioning "#)
    
        // Acuity Brands Lighting, Inc
        XCTAssertEqual(CompanyIdentifier.acuityBrandsLighting.rawValue, 838)
        XCTAssertEqual(CompanyIdentifier.acuityBrandsLighting.name, #"Acuity Brands Lighting, Inc "#)
        XCTAssertEqual(CompanyIdentifier.acuityBrandsLighting.description, #"Acuity Brands Lighting, Inc "#)
    
        // Prevent Biometrics
        XCTAssertEqual(CompanyIdentifier.preventBiometrics.rawValue, 839)
        XCTAssertEqual(CompanyIdentifier.preventBiometrics.name, #"Prevent Biometrics "#)
        XCTAssertEqual(CompanyIdentifier.preventBiometrics.description, #"Prevent Biometrics "#)
    
        // Arioneo
        XCTAssertEqual(CompanyIdentifier.arioneo.rawValue, 840)
        XCTAssertEqual(CompanyIdentifier.arioneo.name, #"Arioneo"#)
        XCTAssertEqual(CompanyIdentifier.arioneo.description, #"Arioneo"#)
    
        // VersaMe
        XCTAssertEqual(CompanyIdentifier.versame.rawValue, 841)
        XCTAssertEqual(CompanyIdentifier.versame.name, #"VersaMe "#)
        XCTAssertEqual(CompanyIdentifier.versame.description, #"VersaMe "#)
    
        // Vaddio
        XCTAssertEqual(CompanyIdentifier.vaddio.rawValue, 842)
        XCTAssertEqual(CompanyIdentifier.vaddio.name, #"Vaddio "#)
        XCTAssertEqual(CompanyIdentifier.vaddio.description, #"Vaddio "#)
    
        // Libratone A/S
        XCTAssertEqual(CompanyIdentifier.libratone.rawValue, 843)
        XCTAssertEqual(CompanyIdentifier.libratone.name, #"Libratone A/S "#)
        XCTAssertEqual(CompanyIdentifier.libratone.description, #"Libratone A/S "#)
    
        // HM Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.hmElectronics.rawValue, 844)
        XCTAssertEqual(CompanyIdentifier.hmElectronics.name, #"HM Electronics, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.hmElectronics.description, #"HM Electronics, Inc. "#)
    
        // TASER International, Inc.
        XCTAssertEqual(CompanyIdentifier.taserInternational.rawValue, 845)
        XCTAssertEqual(CompanyIdentifier.taserInternational.name, #"TASER International, Inc."#)
        XCTAssertEqual(CompanyIdentifier.taserInternational.description, #"TASER International, Inc."#)
    
        // SafeTrust Inc.
        XCTAssertEqual(CompanyIdentifier.safetrust.rawValue, 846)
        XCTAssertEqual(CompanyIdentifier.safetrust.name, #"SafeTrust Inc. "#)
        XCTAssertEqual(CompanyIdentifier.safetrust.description, #"SafeTrust Inc. "#)
    
        // Heartland Payment Systems
        XCTAssertEqual(CompanyIdentifier.heartlandPaymentSystems.rawValue, 847)
        XCTAssertEqual(CompanyIdentifier.heartlandPaymentSystems.name, #"Heartland Payment Systems "#)
        XCTAssertEqual(CompanyIdentifier.heartlandPaymentSystems.description, #"Heartland Payment Systems "#)
    
        // Bitstrata Systems Inc.
        XCTAssertEqual(CompanyIdentifier.bitstrataSystems.rawValue, 848)
        XCTAssertEqual(CompanyIdentifier.bitstrataSystems.name, #"Bitstrata Systems Inc. "#)
        XCTAssertEqual(CompanyIdentifier.bitstrataSystems.description, #"Bitstrata Systems Inc. "#)
    
        // Pieps GmbH
        XCTAssertEqual(CompanyIdentifier.pieps.rawValue, 849)
        XCTAssertEqual(CompanyIdentifier.pieps.name, #"Pieps GmbH "#)
        XCTAssertEqual(CompanyIdentifier.pieps.description, #"Pieps GmbH "#)
    
        // iRiding(Xiamen)Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.iridingXiamenTechnology.rawValue, 850)
        XCTAssertEqual(CompanyIdentifier.iridingXiamenTechnology.name, #"iRiding(Xiamen)Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.iridingXiamenTechnology.description, #"iRiding(Xiamen)Technology Co.,Ltd."#)
    
        // Alpha Audiotronics, Inc.
        XCTAssertEqual(CompanyIdentifier.alphaAudiotronics.rawValue, 851)
        XCTAssertEqual(CompanyIdentifier.alphaAudiotronics.name, #"Alpha Audiotronics, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.alphaAudiotronics.description, #"Alpha Audiotronics, Inc. "#)
    
        // TOPPAN FORMS CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.toppanForms.rawValue, 852)
        XCTAssertEqual(CompanyIdentifier.toppanForms.name, #"TOPPAN FORMS CO.,LTD. "#)
        XCTAssertEqual(CompanyIdentifier.toppanForms.description, #"TOPPAN FORMS CO.,LTD. "#)
    
        // Sigma Designs, Inc.
        XCTAssertEqual(CompanyIdentifier.sigmaDesigns.rawValue, 853)
        XCTAssertEqual(CompanyIdentifier.sigmaDesigns.name, #"Sigma Designs, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.sigmaDesigns.description, #"Sigma Designs, Inc. "#)
    
        // Spectrum Brands, Inc.
        XCTAssertEqual(CompanyIdentifier.spectrumBrands.rawValue, 854)
        XCTAssertEqual(CompanyIdentifier.spectrumBrands.name, #"Spectrum Brands, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.spectrumBrands.description, #"Spectrum Brands, Inc. "#)
    
        // Polymap Wireless
        XCTAssertEqual(CompanyIdentifier.polymapWireless.rawValue, 855)
        XCTAssertEqual(CompanyIdentifier.polymapWireless.name, #"Polymap Wireless "#)
        XCTAssertEqual(CompanyIdentifier.polymapWireless.description, #"Polymap Wireless "#)
    
        // MagniWare Ltd.
        XCTAssertEqual(CompanyIdentifier.magniware.rawValue, 856)
        XCTAssertEqual(CompanyIdentifier.magniware.name, #"MagniWare Ltd."#)
        XCTAssertEqual(CompanyIdentifier.magniware.description, #"MagniWare Ltd."#)
    
        // Novotec Medical GmbH
        XCTAssertEqual(CompanyIdentifier.novotecMedical.rawValue, 857)
        XCTAssertEqual(CompanyIdentifier.novotecMedical.name, #"Novotec Medical GmbH "#)
        XCTAssertEqual(CompanyIdentifier.novotecMedical.description, #"Novotec Medical GmbH "#)
    
        // Medicom Innovation Partner a/s
        XCTAssertEqual(CompanyIdentifier.medicomInnovationPartner.rawValue, 858)
        XCTAssertEqual(CompanyIdentifier.medicomInnovationPartner.name, #"Medicom Innovation Partner a/s "#)
        XCTAssertEqual(CompanyIdentifier.medicomInnovationPartner.description, #"Medicom Innovation Partner a/s "#)
    
        // Matrix Inc.
        XCTAssertEqual(CompanyIdentifier.matrix.rawValue, 859)
        XCTAssertEqual(CompanyIdentifier.matrix.name, #"Matrix Inc. "#)
        XCTAssertEqual(CompanyIdentifier.matrix.description, #"Matrix Inc. "#)
    
        // Eaton Corporation
        XCTAssertEqual(CompanyIdentifier.eaton.rawValue, 860)
        XCTAssertEqual(CompanyIdentifier.eaton.name, #"Eaton Corporation "#)
        XCTAssertEqual(CompanyIdentifier.eaton.description, #"Eaton Corporation "#)
    
        // KYS
        XCTAssertEqual(CompanyIdentifier.kys.rawValue, 861)
        XCTAssertEqual(CompanyIdentifier.kys.name, #"KYS"#)
        XCTAssertEqual(CompanyIdentifier.kys.description, #"KYS"#)
    
        // Naya Health, Inc.
        XCTAssertEqual(CompanyIdentifier.nayaHealth.rawValue, 862)
        XCTAssertEqual(CompanyIdentifier.nayaHealth.name, #"Naya Health, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.nayaHealth.description, #"Naya Health, Inc. "#)
    
        // Acromag
        XCTAssertEqual(CompanyIdentifier.acromag.rawValue, 863)
        XCTAssertEqual(CompanyIdentifier.acromag.name, #"Acromag "#)
        XCTAssertEqual(CompanyIdentifier.acromag.description, #"Acromag "#)
    
        // Insulet Corporation
        XCTAssertEqual(CompanyIdentifier.insulet.rawValue, 864)
        XCTAssertEqual(CompanyIdentifier.insulet.name, #"Insulet Corporation "#)
        XCTAssertEqual(CompanyIdentifier.insulet.description, #"Insulet Corporation "#)
    
        // Wellinks Inc.
        XCTAssertEqual(CompanyIdentifier.wellinks.rawValue, 865)
        XCTAssertEqual(CompanyIdentifier.wellinks.name, #"Wellinks Inc. "#)
        XCTAssertEqual(CompanyIdentifier.wellinks.description, #"Wellinks Inc. "#)
    
        // ON Semiconductor
        XCTAssertEqual(CompanyIdentifier.onSemiconductor.rawValue, 866)
        XCTAssertEqual(CompanyIdentifier.onSemiconductor.name, #"ON Semiconductor"#)
        XCTAssertEqual(CompanyIdentifier.onSemiconductor.description, #"ON Semiconductor"#)
    
        // FREELAP SA
        XCTAssertEqual(CompanyIdentifier.freelap.rawValue, 867)
        XCTAssertEqual(CompanyIdentifier.freelap.name, #"FREELAP SA "#)
        XCTAssertEqual(CompanyIdentifier.freelap.description, #"FREELAP SA "#)
    
        // Favero Electronics Srl
        XCTAssertEqual(CompanyIdentifier.faveroElectronics.rawValue, 868)
        XCTAssertEqual(CompanyIdentifier.faveroElectronics.name, #"Favero Electronics Srl "#)
        XCTAssertEqual(CompanyIdentifier.faveroElectronics.description, #"Favero Electronics Srl "#)
    
        // BioMech Sensor LLC
        XCTAssertEqual(CompanyIdentifier.biomechSensor.rawValue, 869)
        XCTAssertEqual(CompanyIdentifier.biomechSensor.name, #"BioMech Sensor LLC "#)
        XCTAssertEqual(CompanyIdentifier.biomechSensor.description, #"BioMech Sensor LLC "#)
    
        // BOLTT Sports technologies Private limited
        XCTAssertEqual(CompanyIdentifier.bolttSportsTechnologies.rawValue, 870)
        XCTAssertEqual(CompanyIdentifier.bolttSportsTechnologies.name, #"BOLTT Sports technologies Private limited"#)
        XCTAssertEqual(CompanyIdentifier.bolttSportsTechnologies.description, #"BOLTT Sports technologies Private limited"#)
    
        // Saphe International
        XCTAssertEqual(CompanyIdentifier.sapheInternational.rawValue, 871)
        XCTAssertEqual(CompanyIdentifier.sapheInternational.name, #"Saphe International "#)
        XCTAssertEqual(CompanyIdentifier.sapheInternational.description, #"Saphe International "#)
    
        // Metormote AB
        XCTAssertEqual(CompanyIdentifier.metormote.rawValue, 872)
        XCTAssertEqual(CompanyIdentifier.metormote.name, #"Metormote AB "#)
        XCTAssertEqual(CompanyIdentifier.metormote.description, #"Metormote AB "#)
    
        // littleBits
        XCTAssertEqual(CompanyIdentifier.littlebits.rawValue, 873)
        XCTAssertEqual(CompanyIdentifier.littlebits.name, #"littleBits "#)
        XCTAssertEqual(CompanyIdentifier.littlebits.description, #"littleBits "#)
    
        // SetPoint Medical
        XCTAssertEqual(CompanyIdentifier.setpointMedical.rawValue, 874)
        XCTAssertEqual(CompanyIdentifier.setpointMedical.name, #"SetPoint Medical "#)
        XCTAssertEqual(CompanyIdentifier.setpointMedical.description, #"SetPoint Medical "#)
    
        // BRControls Products BV
        XCTAssertEqual(CompanyIdentifier.brcontrolsProducts.rawValue, 875)
        XCTAssertEqual(CompanyIdentifier.brcontrolsProducts.name, #"BRControls Products BV "#)
        XCTAssertEqual(CompanyIdentifier.brcontrolsProducts.description, #"BRControls Products BV "#)
    
        // Zipcar
        XCTAssertEqual(CompanyIdentifier.zipcar.rawValue, 876)
        XCTAssertEqual(CompanyIdentifier.zipcar.name, #"Zipcar "#)
        XCTAssertEqual(CompanyIdentifier.zipcar.description, #"Zipcar "#)
    
        // AirBolt Pty Ltd
        XCTAssertEqual(CompanyIdentifier.airboltPty.rawValue, 877)
        XCTAssertEqual(CompanyIdentifier.airboltPty.name, #"AirBolt Pty Ltd "#)
        XCTAssertEqual(CompanyIdentifier.airboltPty.description, #"AirBolt Pty Ltd "#)
    
        // MOTIVE TECHNOLOGIES, INC.
        XCTAssertEqual(CompanyIdentifier.motiveTechnologies.rawValue, 878)
        XCTAssertEqual(CompanyIdentifier.motiveTechnologies.name, #"MOTIVE TECHNOLOGIES, INC."#)
        XCTAssertEqual(CompanyIdentifier.motiveTechnologies.description, #"MOTIVE TECHNOLOGIES, INC."#)
    
        // Motiv, Inc.
        XCTAssertEqual(CompanyIdentifier.motiv.rawValue, 879)
        XCTAssertEqual(CompanyIdentifier.motiv.name, #"Motiv, Inc. "#)
        XCTAssertEqual(CompanyIdentifier.motiv.description, #"Motiv, Inc. "#)
    
        // Wazombi Labs OÜ
        XCTAssertEqual(CompanyIdentifier.wazombiLabsOu.rawValue, 880)
        XCTAssertEqual(CompanyIdentifier.wazombiLabsOu.name, #"Wazombi Labs OÜ "#)
        XCTAssertEqual(CompanyIdentifier.wazombiLabsOu.description, #"Wazombi Labs OÜ "#)
    
        // ORBCOMM
        XCTAssertEqual(CompanyIdentifier.orbcomm.rawValue, 881)
        XCTAssertEqual(CompanyIdentifier.orbcomm.name, #"ORBCOMM"#)
        XCTAssertEqual(CompanyIdentifier.orbcomm.description, #"ORBCOMM"#)
    
        // Nixie Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.nixieLabs.rawValue, 882)
        XCTAssertEqual(CompanyIdentifier.nixieLabs.name, #"Nixie Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nixieLabs.description, #"Nixie Labs, Inc."#)
    
        // AppNearMe Ltd
        XCTAssertEqual(CompanyIdentifier.appnearme.rawValue, 883)
        XCTAssertEqual(CompanyIdentifier.appnearme.name, #"AppNearMe Ltd"#)
        XCTAssertEqual(CompanyIdentifier.appnearme.description, #"AppNearMe Ltd"#)
    
        // Holman Industries
        XCTAssertEqual(CompanyIdentifier.holmanIndustries.rawValue, 884)
        XCTAssertEqual(CompanyIdentifier.holmanIndustries.name, #"Holman Industries"#)
        XCTAssertEqual(CompanyIdentifier.holmanIndustries.description, #"Holman Industries"#)
    
        // Expain AS
        XCTAssertEqual(CompanyIdentifier.expain.rawValue, 885)
        XCTAssertEqual(CompanyIdentifier.expain.name, #"Expain AS"#)
        XCTAssertEqual(CompanyIdentifier.expain.description, #"Expain AS"#)
    
        // Electronic Temperature Instruments Ltd
        XCTAssertEqual(CompanyIdentifier.electronicTemperatureInstruments.rawValue, 886)
        XCTAssertEqual(CompanyIdentifier.electronicTemperatureInstruments.name, #"Electronic Temperature Instruments Ltd"#)
        XCTAssertEqual(CompanyIdentifier.electronicTemperatureInstruments.description, #"Electronic Temperature Instruments Ltd"#)
    
        // Plejd AB
        XCTAssertEqual(CompanyIdentifier.plejd.rawValue, 887)
        XCTAssertEqual(CompanyIdentifier.plejd.name, #"Plejd AB"#)
        XCTAssertEqual(CompanyIdentifier.plejd.description, #"Plejd AB"#)
    
        // Propeller Health
        XCTAssertEqual(CompanyIdentifier.propellerHealth.rawValue, 888)
        XCTAssertEqual(CompanyIdentifier.propellerHealth.name, #"Propeller Health"#)
        XCTAssertEqual(CompanyIdentifier.propellerHealth.description, #"Propeller Health"#)
    
        // Shenzhen iMCO Electronic Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenImcoElectronicTechnology.rawValue, 889)
        XCTAssertEqual(CompanyIdentifier.shenzhenImcoElectronicTechnology.name, #"Shenzhen iMCO Electronic Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenImcoElectronicTechnology.description, #"Shenzhen iMCO Electronic Technology Co.,Ltd"#)
    
        // Algoria
        XCTAssertEqual(CompanyIdentifier.algoria.rawValue, 890)
        XCTAssertEqual(CompanyIdentifier.algoria.name, #"Algoria"#)
        XCTAssertEqual(CompanyIdentifier.algoria.description, #"Algoria"#)
    
        // Apption Labs Inc.
        XCTAssertEqual(CompanyIdentifier.apptionLabs.rawValue, 891)
        XCTAssertEqual(CompanyIdentifier.apptionLabs.name, #"Apption Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.apptionLabs.description, #"Apption Labs Inc."#)
    
        // Cronologics Corporation
        XCTAssertEqual(CompanyIdentifier.cronologics.rawValue, 892)
        XCTAssertEqual(CompanyIdentifier.cronologics.name, #"Cronologics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.cronologics.description, #"Cronologics Corporation"#)
    
        // MICRODIA Ltd.
        XCTAssertEqual(CompanyIdentifier.microdia.rawValue, 893)
        XCTAssertEqual(CompanyIdentifier.microdia.name, #"MICRODIA Ltd."#)
        XCTAssertEqual(CompanyIdentifier.microdia.description, #"MICRODIA Ltd."#)
    
        // lulabytes S.L.
        XCTAssertEqual(CompanyIdentifier.lulabytes.rawValue, 894)
        XCTAssertEqual(CompanyIdentifier.lulabytes.name, #"lulabytes S.L."#)
        XCTAssertEqual(CompanyIdentifier.lulabytes.description, #"lulabytes S.L."#)
    
        // Société des Produits Nestlé S.A. (formerly Nestec S.A.)
        XCTAssertEqual(CompanyIdentifier.societeDesProduitsNestle.rawValue, 895)
        XCTAssertEqual(CompanyIdentifier.societeDesProduitsNestle.name, #"Société des Produits Nestlé S.A. (formerly Nestec S.A.)"#)
        XCTAssertEqual(CompanyIdentifier.societeDesProduitsNestle.description, #"Société des Produits Nestlé S.A. (formerly Nestec S.A.)"#)
    
        // LLC "MEGA-F service"
        XCTAssertEqual(CompanyIdentifier.megaFService.rawValue, 896)
        XCTAssertEqual(CompanyIdentifier.megaFService.name, #"LLC "MEGA-F service""#)
        XCTAssertEqual(CompanyIdentifier.megaFService.description, #"LLC "MEGA-F service""#)
    
        // Sharp Corporation
        XCTAssertEqual(CompanyIdentifier.sharp.rawValue, 897)
        XCTAssertEqual(CompanyIdentifier.sharp.name, #"Sharp Corporation"#)
        XCTAssertEqual(CompanyIdentifier.sharp.description, #"Sharp Corporation"#)
    
        // Precision Outcomes Ltd
        XCTAssertEqual(CompanyIdentifier.precisionOutcomes.rawValue, 898)
        XCTAssertEqual(CompanyIdentifier.precisionOutcomes.name, #"Precision Outcomes Ltd"#)
        XCTAssertEqual(CompanyIdentifier.precisionOutcomes.description, #"Precision Outcomes Ltd"#)
    
        // Kronos Incorporated
        XCTAssertEqual(CompanyIdentifier.kronos.rawValue, 899)
        XCTAssertEqual(CompanyIdentifier.kronos.name, #"Kronos Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.kronos.description, #"Kronos Incorporated"#)
    
        // OCOSMOS Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.ocosmos.rawValue, 900)
        XCTAssertEqual(CompanyIdentifier.ocosmos.name, #"OCOSMOS Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.ocosmos.description, #"OCOSMOS Co., Ltd."#)
    
        // Embedded Electronic Solutions Ltd. dba e2Solutions
        XCTAssertEqual(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.rawValue, 901)
        XCTAssertEqual(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.name, #"Embedded Electronic Solutions Ltd. dba e2Solutions"#)
        XCTAssertEqual(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.description, #"Embedded Electronic Solutions Ltd. dba e2Solutions"#)
    
        // Aterica Inc.
        XCTAssertEqual(CompanyIdentifier.aterica.rawValue, 902)
        XCTAssertEqual(CompanyIdentifier.aterica.name, #"Aterica Inc."#)
        XCTAssertEqual(CompanyIdentifier.aterica.description, #"Aterica Inc."#)
    
        // BluStor PMC, Inc.
        XCTAssertEqual(CompanyIdentifier.blustorPmc.rawValue, 903)
        XCTAssertEqual(CompanyIdentifier.blustorPmc.name, #"BluStor PMC, Inc."#)
        XCTAssertEqual(CompanyIdentifier.blustorPmc.description, #"BluStor PMC, Inc."#)
    
        // Kapsch TrafficCom AB
        XCTAssertEqual(CompanyIdentifier.kapschTrafficcom.rawValue, 904)
        XCTAssertEqual(CompanyIdentifier.kapschTrafficcom.name, #"Kapsch TrafficCom AB"#)
        XCTAssertEqual(CompanyIdentifier.kapschTrafficcom.description, #"Kapsch TrafficCom AB"#)
    
        // ActiveBlu Corporation
        XCTAssertEqual(CompanyIdentifier.activeblu.rawValue, 905)
        XCTAssertEqual(CompanyIdentifier.activeblu.name, #"ActiveBlu Corporation"#)
        XCTAssertEqual(CompanyIdentifier.activeblu.description, #"ActiveBlu Corporation"#)
    
        // Kohler Mira Limited
        XCTAssertEqual(CompanyIdentifier.kohlerMira.rawValue, 906)
        XCTAssertEqual(CompanyIdentifier.kohlerMira.name, #"Kohler Mira Limited"#)
        XCTAssertEqual(CompanyIdentifier.kohlerMira.description, #"Kohler Mira Limited"#)
    
        // Noke
        XCTAssertEqual(CompanyIdentifier.noke.rawValue, 907)
        XCTAssertEqual(CompanyIdentifier.noke.name, #"Noke"#)
        XCTAssertEqual(CompanyIdentifier.noke.description, #"Noke"#)
    
        // Appion Inc.
        XCTAssertEqual(CompanyIdentifier.appion.rawValue, 908)
        XCTAssertEqual(CompanyIdentifier.appion.name, #"Appion Inc."#)
        XCTAssertEqual(CompanyIdentifier.appion.description, #"Appion Inc."#)
    
        // Resmed Ltd
        XCTAssertEqual(CompanyIdentifier.resmed.rawValue, 909)
        XCTAssertEqual(CompanyIdentifier.resmed.name, #"Resmed Ltd"#)
        XCTAssertEqual(CompanyIdentifier.resmed.description, #"Resmed Ltd"#)
    
        // Crownstone B.V.
        XCTAssertEqual(CompanyIdentifier.crownstone.rawValue, 910)
        XCTAssertEqual(CompanyIdentifier.crownstone.name, #"Crownstone B.V."#)
        XCTAssertEqual(CompanyIdentifier.crownstone.description, #"Crownstone B.V."#)
    
        // Xiaomi Inc.
        XCTAssertEqual(CompanyIdentifier.xiaomi.rawValue, 911)
        XCTAssertEqual(CompanyIdentifier.xiaomi.name, #"Xiaomi Inc."#)
        XCTAssertEqual(CompanyIdentifier.xiaomi.description, #"Xiaomi Inc."#)
    
        // INFOTECH s.r.o.
        XCTAssertEqual(CompanyIdentifier.infotech.rawValue, 912)
        XCTAssertEqual(CompanyIdentifier.infotech.name, #"INFOTECH s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.infotech.description, #"INFOTECH s.r.o."#)
    
        // Thingsquare AB
        XCTAssertEqual(CompanyIdentifier.thingsquare.rawValue, 913)
        XCTAssertEqual(CompanyIdentifier.thingsquare.name, #"Thingsquare AB"#)
        XCTAssertEqual(CompanyIdentifier.thingsquare.description, #"Thingsquare AB"#)
    
        // T&D
        XCTAssertEqual(CompanyIdentifier.tD.rawValue, 914)
        XCTAssertEqual(CompanyIdentifier.tD.name, #"T&D"#)
        XCTAssertEqual(CompanyIdentifier.tD.description, #"T&D"#)
    
        // LAVAZZA S.p.A.
        XCTAssertEqual(CompanyIdentifier.lavazza.rawValue, 915)
        XCTAssertEqual(CompanyIdentifier.lavazza.name, #"LAVAZZA S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.lavazza.description, #"LAVAZZA S.p.A."#)
    
        // Netclearance Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.netclearanceSystems.rawValue, 916)
        XCTAssertEqual(CompanyIdentifier.netclearanceSystems.name, #"Netclearance Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.netclearanceSystems.description, #"Netclearance Systems, Inc."#)
    
        // SDATAWAY
        XCTAssertEqual(CompanyIdentifier.sdataway.rawValue, 917)
        XCTAssertEqual(CompanyIdentifier.sdataway.name, #"SDATAWAY"#)
        XCTAssertEqual(CompanyIdentifier.sdataway.description, #"SDATAWAY"#)
    
        // BLOKS GmbH
        XCTAssertEqual(CompanyIdentifier.bloks.rawValue, 918)
        XCTAssertEqual(CompanyIdentifier.bloks.name, #"BLOKS GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bloks.description, #"BLOKS GmbH"#)
    
        // LEGO System A/S
        XCTAssertEqual(CompanyIdentifier.legoSystem.rawValue, 919)
        XCTAssertEqual(CompanyIdentifier.legoSystem.name, #"LEGO System A/S"#)
        XCTAssertEqual(CompanyIdentifier.legoSystem.description, #"LEGO System A/S"#)
    
        // Thetatronics Ltd
        XCTAssertEqual(CompanyIdentifier.thetatronics.rawValue, 920)
        XCTAssertEqual(CompanyIdentifier.thetatronics.name, #"Thetatronics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.thetatronics.description, #"Thetatronics Ltd"#)
    
        // Nikon Corporation
        XCTAssertEqual(CompanyIdentifier.nikon.rawValue, 921)
        XCTAssertEqual(CompanyIdentifier.nikon.name, #"Nikon Corporation"#)
        XCTAssertEqual(CompanyIdentifier.nikon.description, #"Nikon Corporation"#)
    
        // NeST
        XCTAssertEqual(CompanyIdentifier.nest.rawValue, 922)
        XCTAssertEqual(CompanyIdentifier.nest.name, #"NeST"#)
        XCTAssertEqual(CompanyIdentifier.nest.description, #"NeST"#)
    
        // South Silicon Valley Microelectronics
        XCTAssertEqual(CompanyIdentifier.southSiliconValleyMicroelectronics.rawValue, 923)
        XCTAssertEqual(CompanyIdentifier.southSiliconValleyMicroelectronics.name, #"South Silicon Valley Microelectronics"#)
        XCTAssertEqual(CompanyIdentifier.southSiliconValleyMicroelectronics.description, #"South Silicon Valley Microelectronics"#)
    
        // ALE International
        XCTAssertEqual(CompanyIdentifier.aleInternational.rawValue, 924)
        XCTAssertEqual(CompanyIdentifier.aleInternational.name, #"ALE International"#)
        XCTAssertEqual(CompanyIdentifier.aleInternational.description, #"ALE International"#)
    
        // CareView Communications, Inc.
        XCTAssertEqual(CompanyIdentifier.careviewCommunications.rawValue, 925)
        XCTAssertEqual(CompanyIdentifier.careviewCommunications.name, #"CareView Communications, Inc."#)
        XCTAssertEqual(CompanyIdentifier.careviewCommunications.description, #"CareView Communications, Inc."#)
    
        // SchoolBoard Limited
        XCTAssertEqual(CompanyIdentifier.schoolboard.rawValue, 926)
        XCTAssertEqual(CompanyIdentifier.schoolboard.name, #"SchoolBoard Limited"#)
        XCTAssertEqual(CompanyIdentifier.schoolboard.description, #"SchoolBoard Limited"#)
    
        // Molex Corporation
        XCTAssertEqual(CompanyIdentifier.molex.rawValue, 927)
        XCTAssertEqual(CompanyIdentifier.molex.name, #"Molex Corporation"#)
        XCTAssertEqual(CompanyIdentifier.molex.description, #"Molex Corporation"#)
    
        // IVT Wireless Limited
        XCTAssertEqual(CompanyIdentifier.ivtWireless.rawValue, 928)
        XCTAssertEqual(CompanyIdentifier.ivtWireless.name, #"IVT Wireless Limited"#)
        XCTAssertEqual(CompanyIdentifier.ivtWireless.description, #"IVT Wireless Limited"#)
    
        // Alpine Labs LLC
        XCTAssertEqual(CompanyIdentifier.alpineLabs.rawValue, 929)
        XCTAssertEqual(CompanyIdentifier.alpineLabs.name, #"Alpine Labs LLC"#)
        XCTAssertEqual(CompanyIdentifier.alpineLabs.description, #"Alpine Labs LLC"#)
    
        // Candura Instruments
        XCTAssertEqual(CompanyIdentifier.canduraInstruments.rawValue, 930)
        XCTAssertEqual(CompanyIdentifier.canduraInstruments.name, #"Candura Instruments"#)
        XCTAssertEqual(CompanyIdentifier.canduraInstruments.description, #"Candura Instruments"#)
    
        // SmartMovt Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.smartmovtTechnology.rawValue, 931)
        XCTAssertEqual(CompanyIdentifier.smartmovtTechnology.name, #"SmartMovt Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.smartmovtTechnology.description, #"SmartMovt Technology Co., Ltd"#)
    
        // Token Zero Ltd
        XCTAssertEqual(CompanyIdentifier.tokenZero.rawValue, 932)
        XCTAssertEqual(CompanyIdentifier.tokenZero.name, #"Token Zero Ltd"#)
        XCTAssertEqual(CompanyIdentifier.tokenZero.description, #"Token Zero Ltd"#)
    
        // ACE CAD Enterprise Co., Ltd. (ACECAD)
        XCTAssertEqual(CompanyIdentifier.aceCadEnterpriseAcecad.rawValue, 933)
        XCTAssertEqual(CompanyIdentifier.aceCadEnterpriseAcecad.name, #"ACE CAD Enterprise Co., Ltd. (ACECAD)"#)
        XCTAssertEqual(CompanyIdentifier.aceCadEnterpriseAcecad.description, #"ACE CAD Enterprise Co., Ltd. (ACECAD)"#)
    
        // Medela, Inc
        XCTAssertEqual(CompanyIdentifier.medela.rawValue, 934)
        XCTAssertEqual(CompanyIdentifier.medela.name, #"Medela, Inc"#)
        XCTAssertEqual(CompanyIdentifier.medela.description, #"Medela, Inc"#)
    
        // AeroScout
        XCTAssertEqual(CompanyIdentifier.aeroscout.rawValue, 935)
        XCTAssertEqual(CompanyIdentifier.aeroscout.name, #"AeroScout"#)
        XCTAssertEqual(CompanyIdentifier.aeroscout.description, #"AeroScout"#)
    
        // Esrille Inc.
        XCTAssertEqual(CompanyIdentifier.esrille.rawValue, 936)
        XCTAssertEqual(CompanyIdentifier.esrille.name, #"Esrille Inc."#)
        XCTAssertEqual(CompanyIdentifier.esrille.description, #"Esrille Inc."#)
    
        // THINKERLY SRL
        XCTAssertEqual(CompanyIdentifier.thinkerly.rawValue, 937)
        XCTAssertEqual(CompanyIdentifier.thinkerly.name, #"THINKERLY SRL"#)
        XCTAssertEqual(CompanyIdentifier.thinkerly.description, #"THINKERLY SRL"#)
    
        // Exon Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.exon.rawValue, 938)
        XCTAssertEqual(CompanyIdentifier.exon.name, #"Exon Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.exon.description, #"Exon Sp. z o.o."#)
    
        // Meizu Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.meizuTechnology.rawValue, 939)
        XCTAssertEqual(CompanyIdentifier.meizuTechnology.name, #"Meizu Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.meizuTechnology.description, #"Meizu Technology Co., Ltd."#)
    
        // Smablo LTD
        XCTAssertEqual(CompanyIdentifier.smablo.rawValue, 940)
        XCTAssertEqual(CompanyIdentifier.smablo.name, #"Smablo LTD"#)
        XCTAssertEqual(CompanyIdentifier.smablo.description, #"Smablo LTD"#)
    
        // XiQ
        XCTAssertEqual(CompanyIdentifier.xiq.rawValue, 941)
        XCTAssertEqual(CompanyIdentifier.xiq.name, #"XiQ"#)
        XCTAssertEqual(CompanyIdentifier.xiq.description, #"XiQ"#)
    
        // Allswell Inc.
        XCTAssertEqual(CompanyIdentifier.allswell.rawValue, 942)
        XCTAssertEqual(CompanyIdentifier.allswell.name, #"Allswell Inc."#)
        XCTAssertEqual(CompanyIdentifier.allswell.description, #"Allswell Inc."#)
    
        // Comm-N-Sense Corp DBA Verigo
        XCTAssertEqual(CompanyIdentifier.commNSenseDbaVerigo.rawValue, 943)
        XCTAssertEqual(CompanyIdentifier.commNSenseDbaVerigo.name, #"Comm-N-Sense Corp DBA Verigo"#)
        XCTAssertEqual(CompanyIdentifier.commNSenseDbaVerigo.description, #"Comm-N-Sense Corp DBA Verigo"#)
    
        // VIBRADORM GmbH
        XCTAssertEqual(CompanyIdentifier.vibradorm.rawValue, 944)
        XCTAssertEqual(CompanyIdentifier.vibradorm.name, #"VIBRADORM GmbH"#)
        XCTAssertEqual(CompanyIdentifier.vibradorm.description, #"VIBRADORM GmbH"#)
    
        // Otodata Wireless Network Inc.
        XCTAssertEqual(CompanyIdentifier.otodataWirelessNetwork.rawValue, 945)
        XCTAssertEqual(CompanyIdentifier.otodataWirelessNetwork.name, #"Otodata Wireless Network Inc."#)
        XCTAssertEqual(CompanyIdentifier.otodataWirelessNetwork.description, #"Otodata Wireless Network Inc."#)
    
        // Propagation Systems Limited
        XCTAssertEqual(CompanyIdentifier.propagationSystems.rawValue, 946)
        XCTAssertEqual(CompanyIdentifier.propagationSystems.name, #"Propagation Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.propagationSystems.description, #"Propagation Systems Limited"#)
    
        // Midwest Instruments & Controls
        XCTAssertEqual(CompanyIdentifier.midwestInstrumentsControls.rawValue, 947)
        XCTAssertEqual(CompanyIdentifier.midwestInstrumentsControls.name, #"Midwest Instruments & Controls"#)
        XCTAssertEqual(CompanyIdentifier.midwestInstrumentsControls.description, #"Midwest Instruments & Controls"#)
    
        // Alpha Nodus, inc.
        XCTAssertEqual(CompanyIdentifier.alphaNodus.rawValue, 948)
        XCTAssertEqual(CompanyIdentifier.alphaNodus.name, #"Alpha Nodus, inc."#)
        XCTAssertEqual(CompanyIdentifier.alphaNodus.description, #"Alpha Nodus, inc."#)
    
        // petPOMM, Inc
        XCTAssertEqual(CompanyIdentifier.petpomm.rawValue, 949)
        XCTAssertEqual(CompanyIdentifier.petpomm.name, #"petPOMM, Inc"#)
        XCTAssertEqual(CompanyIdentifier.petpomm.description, #"petPOMM, Inc"#)
    
        // Mattel
        XCTAssertEqual(CompanyIdentifier.mattel.rawValue, 950)
        XCTAssertEqual(CompanyIdentifier.mattel.name, #"Mattel"#)
        XCTAssertEqual(CompanyIdentifier.mattel.description, #"Mattel"#)
    
        // Airbly Inc.
        XCTAssertEqual(CompanyIdentifier.airbly.rawValue, 951)
        XCTAssertEqual(CompanyIdentifier.airbly.name, #"Airbly Inc."#)
        XCTAssertEqual(CompanyIdentifier.airbly.description, #"Airbly Inc."#)
    
        // A-Safe Limited
        XCTAssertEqual(CompanyIdentifier.aSafe.rawValue, 952)
        XCTAssertEqual(CompanyIdentifier.aSafe.name, #"A-Safe Limited"#)
        XCTAssertEqual(CompanyIdentifier.aSafe.description, #"A-Safe Limited"#)
    
        // FREDERIQUE CONSTANT SA
        XCTAssertEqual(CompanyIdentifier.frederiqueConstant.rawValue, 953)
        XCTAssertEqual(CompanyIdentifier.frederiqueConstant.name, #"FREDERIQUE CONSTANT SA"#)
        XCTAssertEqual(CompanyIdentifier.frederiqueConstant.description, #"FREDERIQUE CONSTANT SA"#)
    
        // Maxscend Microelectronics Company Limited
        XCTAssertEqual(CompanyIdentifier.maxscendMicroelectronicsCompany.rawValue, 954)
        XCTAssertEqual(CompanyIdentifier.maxscendMicroelectronicsCompany.name, #"Maxscend Microelectronics Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.maxscendMicroelectronicsCompany.description, #"Maxscend Microelectronics Company Limited"#)
    
        // Abbott
        XCTAssertEqual(CompanyIdentifier.abbott.rawValue, 955)
        XCTAssertEqual(CompanyIdentifier.abbott.name, #"Abbott"#)
        XCTAssertEqual(CompanyIdentifier.abbott.description, #"Abbott"#)
    
        // ASB Bank Ltd
        XCTAssertEqual(CompanyIdentifier.asbBank.rawValue, 956)
        XCTAssertEqual(CompanyIdentifier.asbBank.name, #"ASB Bank Ltd"#)
        XCTAssertEqual(CompanyIdentifier.asbBank.description, #"ASB Bank Ltd"#)
    
        // amadas
        XCTAssertEqual(CompanyIdentifier.amadas.rawValue, 957)
        XCTAssertEqual(CompanyIdentifier.amadas.name, #"amadas"#)
        XCTAssertEqual(CompanyIdentifier.amadas.description, #"amadas"#)
    
        // Applied Science, Inc.
        XCTAssertEqual(CompanyIdentifier.appliedScience.rawValue, 958)
        XCTAssertEqual(CompanyIdentifier.appliedScience.name, #"Applied Science, Inc."#)
        XCTAssertEqual(CompanyIdentifier.appliedScience.description, #"Applied Science, Inc."#)
    
        // iLumi Solutions Inc.
        XCTAssertEqual(CompanyIdentifier.ilumiSolutions.rawValue, 959)
        XCTAssertEqual(CompanyIdentifier.ilumiSolutions.name, #"iLumi Solutions Inc."#)
        XCTAssertEqual(CompanyIdentifier.ilumiSolutions.description, #"iLumi Solutions Inc."#)
    
        // Arch Systems Inc.
        XCTAssertEqual(CompanyIdentifier.archSystems.rawValue, 960)
        XCTAssertEqual(CompanyIdentifier.archSystems.name, #"Arch Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.archSystems.description, #"Arch Systems Inc."#)
    
        // Ember Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.emberTechnologies.rawValue, 961)
        XCTAssertEqual(CompanyIdentifier.emberTechnologies.name, #"Ember Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.emberTechnologies.description, #"Ember Technologies, Inc."#)
    
        // Snapchat Inc
        XCTAssertEqual(CompanyIdentifier.snapchat.rawValue, 962)
        XCTAssertEqual(CompanyIdentifier.snapchat.name, #"Snapchat Inc"#)
        XCTAssertEqual(CompanyIdentifier.snapchat.description, #"Snapchat Inc"#)
    
        // Casambi Technologies Oy
        XCTAssertEqual(CompanyIdentifier.casambiTechnologies.rawValue, 963)
        XCTAssertEqual(CompanyIdentifier.casambiTechnologies.name, #"Casambi Technologies Oy"#)
        XCTAssertEqual(CompanyIdentifier.casambiTechnologies.description, #"Casambi Technologies Oy"#)
    
        // Pico Technology Inc.
        XCTAssertEqual(CompanyIdentifier.picoTechnology.rawValue, 964)
        XCTAssertEqual(CompanyIdentifier.picoTechnology.name, #"Pico Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.picoTechnology.description, #"Pico Technology Inc."#)
    
        // St. Jude Medical, Inc.
        XCTAssertEqual(CompanyIdentifier.stJudeMedical.rawValue, 965)
        XCTAssertEqual(CompanyIdentifier.stJudeMedical.name, #"St. Jude Medical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.stJudeMedical.description, #"St. Jude Medical, Inc."#)
    
        // Intricon
        XCTAssertEqual(CompanyIdentifier.intricon.rawValue, 966)
        XCTAssertEqual(CompanyIdentifier.intricon.name, #"Intricon"#)
        XCTAssertEqual(CompanyIdentifier.intricon.description, #"Intricon"#)
    
        // Structural Health Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.structuralHealthSystems.rawValue, 967)
        XCTAssertEqual(CompanyIdentifier.structuralHealthSystems.name, #"Structural Health Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.structuralHealthSystems.description, #"Structural Health Systems, Inc."#)
    
        // Avvel International
        XCTAssertEqual(CompanyIdentifier.avvelInternational.rawValue, 968)
        XCTAssertEqual(CompanyIdentifier.avvelInternational.name, #"Avvel International"#)
        XCTAssertEqual(CompanyIdentifier.avvelInternational.description, #"Avvel International"#)
    
        // Gallagher Group
        XCTAssertEqual(CompanyIdentifier.gallagherGroup.rawValue, 969)
        XCTAssertEqual(CompanyIdentifier.gallagherGroup.name, #"Gallagher Group"#)
        XCTAssertEqual(CompanyIdentifier.gallagherGroup.description, #"Gallagher Group"#)
    
        // In2things Automation Pvt. Ltd.
        XCTAssertEqual(CompanyIdentifier.in2ThingsAutomation.rawValue, 970)
        XCTAssertEqual(CompanyIdentifier.in2ThingsAutomation.name, #"In2things Automation Pvt. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.in2ThingsAutomation.description, #"In2things Automation Pvt. Ltd."#)
    
        // SYSDEV Srl
        XCTAssertEqual(CompanyIdentifier.sysdev.rawValue, 971)
        XCTAssertEqual(CompanyIdentifier.sysdev.name, #"SYSDEV Srl"#)
        XCTAssertEqual(CompanyIdentifier.sysdev.description, #"SYSDEV Srl"#)
    
        // Vonkil Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.vonkilTechnologies.rawValue, 972)
        XCTAssertEqual(CompanyIdentifier.vonkilTechnologies.name, #"Vonkil Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.vonkilTechnologies.description, #"Vonkil Technologies Ltd"#)
    
        // Wynd Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.wyndTechnologies.rawValue, 973)
        XCTAssertEqual(CompanyIdentifier.wyndTechnologies.name, #"Wynd Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.wyndTechnologies.description, #"Wynd Technologies, Inc."#)
    
        // CONTRINEX S.A.
        XCTAssertEqual(CompanyIdentifier.contrinex.rawValue, 974)
        XCTAssertEqual(CompanyIdentifier.contrinex.name, #"CONTRINEX S.A."#)
        XCTAssertEqual(CompanyIdentifier.contrinex.description, #"CONTRINEX S.A."#)
    
        // MIRA, Inc.
        XCTAssertEqual(CompanyIdentifier.mira.rawValue, 975)
        XCTAssertEqual(CompanyIdentifier.mira.name, #"MIRA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mira.description, #"MIRA, Inc."#)
    
        // Watteam Ltd
        XCTAssertEqual(CompanyIdentifier.watteam.rawValue, 976)
        XCTAssertEqual(CompanyIdentifier.watteam.name, #"Watteam Ltd"#)
        XCTAssertEqual(CompanyIdentifier.watteam.description, #"Watteam Ltd"#)
    
        // Density Inc.
        XCTAssertEqual(CompanyIdentifier.density.rawValue, 977)
        XCTAssertEqual(CompanyIdentifier.density.name, #"Density Inc."#)
        XCTAssertEqual(CompanyIdentifier.density.description, #"Density Inc."#)
    
        // IOT Pot India Private Limited
        XCTAssertEqual(CompanyIdentifier.iotPotIndia.rawValue, 978)
        XCTAssertEqual(CompanyIdentifier.iotPotIndia.name, #"IOT Pot India Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.iotPotIndia.description, #"IOT Pot India Private Limited"#)
    
        // Sigma Connectivity AB
        XCTAssertEqual(CompanyIdentifier.sigmaConnectivity.rawValue, 979)
        XCTAssertEqual(CompanyIdentifier.sigmaConnectivity.name, #"Sigma Connectivity AB"#)
        XCTAssertEqual(CompanyIdentifier.sigmaConnectivity.description, #"Sigma Connectivity AB"#)
    
        // PEG PEREGO SPA
        XCTAssertEqual(CompanyIdentifier.pegPeregoSpa.rawValue, 980)
        XCTAssertEqual(CompanyIdentifier.pegPeregoSpa.name, #"PEG PEREGO SPA"#)
        XCTAssertEqual(CompanyIdentifier.pegPeregoSpa.description, #"PEG PEREGO SPA"#)
    
        // Wyzelink Systems Inc.
        XCTAssertEqual(CompanyIdentifier.wyzelinkSystems.rawValue, 981)
        XCTAssertEqual(CompanyIdentifier.wyzelinkSystems.name, #"Wyzelink Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.wyzelinkSystems.description, #"Wyzelink Systems Inc."#)
    
        // Yota Devices LTD
        XCTAssertEqual(CompanyIdentifier.yotaDevices.rawValue, 982)
        XCTAssertEqual(CompanyIdentifier.yotaDevices.name, #"Yota Devices LTD"#)
        XCTAssertEqual(CompanyIdentifier.yotaDevices.description, #"Yota Devices LTD"#)
    
        // FINSECUR
        XCTAssertEqual(CompanyIdentifier.finsecur.rawValue, 983)
        XCTAssertEqual(CompanyIdentifier.finsecur.name, #"FINSECUR"#)
        XCTAssertEqual(CompanyIdentifier.finsecur.description, #"FINSECUR"#)
    
        // Zen-Me Labs Ltd
        XCTAssertEqual(CompanyIdentifier.zenMeLabs.rawValue, 984)
        XCTAssertEqual(CompanyIdentifier.zenMeLabs.name, #"Zen-Me Labs Ltd"#)
        XCTAssertEqual(CompanyIdentifier.zenMeLabs.description, #"Zen-Me Labs Ltd"#)
    
        // 3IWare Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.company3Iware.rawValue, 985)
        XCTAssertEqual(CompanyIdentifier.company3Iware.name, #"3IWare Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.company3Iware.description, #"3IWare Co., Ltd."#)
    
        // EnOcean GmbH
        XCTAssertEqual(CompanyIdentifier.enocean.rawValue, 986)
        XCTAssertEqual(CompanyIdentifier.enocean.name, #"EnOcean GmbH"#)
        XCTAssertEqual(CompanyIdentifier.enocean.description, #"EnOcean GmbH"#)
    
        // Instabeat, Inc
        XCTAssertEqual(CompanyIdentifier.instabeat.rawValue, 987)
        XCTAssertEqual(CompanyIdentifier.instabeat.name, #"Instabeat, Inc"#)
        XCTAssertEqual(CompanyIdentifier.instabeat.description, #"Instabeat, Inc"#)
    
        // Nima Labs
        XCTAssertEqual(CompanyIdentifier.nimaLabs.rawValue, 988)
        XCTAssertEqual(CompanyIdentifier.nimaLabs.name, #"Nima Labs"#)
        XCTAssertEqual(CompanyIdentifier.nimaLabs.description, #"Nima Labs"#)
    
        // Andreas Stihl AG & Co. KG
        XCTAssertEqual(CompanyIdentifier.andreasStihl.rawValue, 989)
        XCTAssertEqual(CompanyIdentifier.andreasStihl.name, #"Andreas Stihl AG & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.andreasStihl.description, #"Andreas Stihl AG & Co. KG"#)
    
        // Nathan Rhoades LLC
        XCTAssertEqual(CompanyIdentifier.nathanRhoades.rawValue, 990)
        XCTAssertEqual(CompanyIdentifier.nathanRhoades.name, #"Nathan Rhoades LLC"#)
        XCTAssertEqual(CompanyIdentifier.nathanRhoades.description, #"Nathan Rhoades LLC"#)
    
        // Grob Technologies, LLC
        XCTAssertEqual(CompanyIdentifier.grobTechnologies.rawValue, 991)
        XCTAssertEqual(CompanyIdentifier.grobTechnologies.name, #"Grob Technologies, LLC"#)
        XCTAssertEqual(CompanyIdentifier.grobTechnologies.description, #"Grob Technologies, LLC"#)
    
        // Actions (Zhuhai) Technology Co., Limited
        XCTAssertEqual(CompanyIdentifier.actionsZhuhaiTechnology.rawValue, 992)
        XCTAssertEqual(CompanyIdentifier.actionsZhuhaiTechnology.name, #"Actions (Zhuhai) Technology Co., Limited"#)
        XCTAssertEqual(CompanyIdentifier.actionsZhuhaiTechnology.description, #"Actions (Zhuhai) Technology Co., Limited"#)
    
        // SPD Development Company Ltd
        XCTAssertEqual(CompanyIdentifier.spdDevelopmentCompany.rawValue, 993)
        XCTAssertEqual(CompanyIdentifier.spdDevelopmentCompany.name, #"SPD Development Company Ltd"#)
        XCTAssertEqual(CompanyIdentifier.spdDevelopmentCompany.description, #"SPD Development Company Ltd"#)
    
        // Sensoan Oy
        XCTAssertEqual(CompanyIdentifier.sensoan.rawValue, 994)
        XCTAssertEqual(CompanyIdentifier.sensoan.name, #"Sensoan Oy"#)
        XCTAssertEqual(CompanyIdentifier.sensoan.description, #"Sensoan Oy"#)
    
        // Qualcomm Life Inc
        XCTAssertEqual(CompanyIdentifier.qualcommLife.rawValue, 995)
        XCTAssertEqual(CompanyIdentifier.qualcommLife.name, #"Qualcomm Life Inc"#)
        XCTAssertEqual(CompanyIdentifier.qualcommLife.description, #"Qualcomm Life Inc"#)
    
        // Chip-ing AG
        XCTAssertEqual(CompanyIdentifier.chipIng.rawValue, 996)
        XCTAssertEqual(CompanyIdentifier.chipIng.name, #"Chip-ing AG"#)
        XCTAssertEqual(CompanyIdentifier.chipIng.description, #"Chip-ing AG"#)
    
        // ffly4u
        XCTAssertEqual(CompanyIdentifier.ffly4U.rawValue, 997)
        XCTAssertEqual(CompanyIdentifier.ffly4U.name, #"ffly4u"#)
        XCTAssertEqual(CompanyIdentifier.ffly4U.description, #"ffly4u"#)
    
        // IoT Instruments Oy
        XCTAssertEqual(CompanyIdentifier.iotInstruments.rawValue, 998)
        XCTAssertEqual(CompanyIdentifier.iotInstruments.name, #"IoT Instruments Oy"#)
        XCTAssertEqual(CompanyIdentifier.iotInstruments.description, #"IoT Instruments Oy"#)
    
        // TRUE Fitness Technology
        XCTAssertEqual(CompanyIdentifier.trueFitnessTechnology.rawValue, 999)
        XCTAssertEqual(CompanyIdentifier.trueFitnessTechnology.name, #"TRUE Fitness Technology"#)
        XCTAssertEqual(CompanyIdentifier.trueFitnessTechnology.description, #"TRUE Fitness Technology"#)
    
        // Reiner Kartengeraete GmbH & Co. KG.
        XCTAssertEqual(CompanyIdentifier.reinerKartengeraete.rawValue, 1000)
        XCTAssertEqual(CompanyIdentifier.reinerKartengeraete.name, #"Reiner Kartengeraete GmbH & Co. KG."#)
        XCTAssertEqual(CompanyIdentifier.reinerKartengeraete.description, #"Reiner Kartengeraete GmbH & Co. KG."#)
    
        // SHENZHEN LEMONJOY TECHNOLOGY CO., LTD.
        XCTAssertEqual(CompanyIdentifier.shenzhenLemonjoyTechnology.rawValue, 1001)
        XCTAssertEqual(CompanyIdentifier.shenzhenLemonjoyTechnology.name, #"SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenLemonjoyTechnology.description, #"SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."#)
    
        // Hello Inc.
        XCTAssertEqual(CompanyIdentifier.hello.rawValue, 1002)
        XCTAssertEqual(CompanyIdentifier.hello.name, #"Hello Inc."#)
        XCTAssertEqual(CompanyIdentifier.hello.description, #"Hello Inc."#)
    
        // Ozo Edu, Inc.
        XCTAssertEqual(CompanyIdentifier.ozoEdu.rawValue, 1003)
        XCTAssertEqual(CompanyIdentifier.ozoEdu.name, #"Ozo Edu, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ozoEdu.description, #"Ozo Edu, Inc."#)
    
        // Jigowatts Inc.
        XCTAssertEqual(CompanyIdentifier.jigowatts.rawValue, 1004)
        XCTAssertEqual(CompanyIdentifier.jigowatts.name, #"Jigowatts Inc."#)
        XCTAssertEqual(CompanyIdentifier.jigowatts.description, #"Jigowatts Inc."#)
    
        // BASIC MICRO.COM,INC.
        XCTAssertEqual(CompanyIdentifier.basicMicroCom.rawValue, 1005)
        XCTAssertEqual(CompanyIdentifier.basicMicroCom.name, #"BASIC MICRO.COM,INC."#)
        XCTAssertEqual(CompanyIdentifier.basicMicroCom.description, #"BASIC MICRO.COM,INC."#)
    
        // CUBE TECHNOLOGIES
        XCTAssertEqual(CompanyIdentifier.cubeTechnologies.rawValue, 1006)
        XCTAssertEqual(CompanyIdentifier.cubeTechnologies.name, #"CUBE TECHNOLOGIES"#)
        XCTAssertEqual(CompanyIdentifier.cubeTechnologies.description, #"CUBE TECHNOLOGIES"#)
    
        // foolography GmbH
        XCTAssertEqual(CompanyIdentifier.foolography.rawValue, 1007)
        XCTAssertEqual(CompanyIdentifier.foolography.name, #"foolography GmbH"#)
        XCTAssertEqual(CompanyIdentifier.foolography.description, #"foolography GmbH"#)
    
        // CLINK
        XCTAssertEqual(CompanyIdentifier.clink.rawValue, 1008)
        XCTAssertEqual(CompanyIdentifier.clink.name, #"CLINK"#)
        XCTAssertEqual(CompanyIdentifier.clink.description, #"CLINK"#)
    
        // Hestan Smart Cooking Inc.
        XCTAssertEqual(CompanyIdentifier.hestanSmartCooking.rawValue, 1009)
        XCTAssertEqual(CompanyIdentifier.hestanSmartCooking.name, #"Hestan Smart Cooking Inc."#)
        XCTAssertEqual(CompanyIdentifier.hestanSmartCooking.description, #"Hestan Smart Cooking Inc."#)
    
        // WindowMaster A/S
        XCTAssertEqual(CompanyIdentifier.windowmaster.rawValue, 1010)
        XCTAssertEqual(CompanyIdentifier.windowmaster.name, #"WindowMaster A/S"#)
        XCTAssertEqual(CompanyIdentifier.windowmaster.description, #"WindowMaster A/S"#)
    
        // Flowscape AB
        XCTAssertEqual(CompanyIdentifier.flowscape.rawValue, 1011)
        XCTAssertEqual(CompanyIdentifier.flowscape.name, #"Flowscape AB"#)
        XCTAssertEqual(CompanyIdentifier.flowscape.description, #"Flowscape AB"#)
    
        // PAL Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.palTechnologies.rawValue, 1012)
        XCTAssertEqual(CompanyIdentifier.palTechnologies.name, #"PAL Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.palTechnologies.description, #"PAL Technologies Ltd"#)
    
        // WHERE, Inc.
        XCTAssertEqual(CompanyIdentifier.whereinc.rawValue, 1013)
        XCTAssertEqual(CompanyIdentifier.whereinc.name, #"WHERE, Inc."#)
        XCTAssertEqual(CompanyIdentifier.whereinc.description, #"WHERE, Inc."#)
    
        // Iton Technology Corp.
        XCTAssertEqual(CompanyIdentifier.itonTechnology.rawValue, 1014)
        XCTAssertEqual(CompanyIdentifier.itonTechnology.name, #"Iton Technology Corp."#)
        XCTAssertEqual(CompanyIdentifier.itonTechnology.description, #"Iton Technology Corp."#)
    
        // Owl Labs Inc.
        XCTAssertEqual(CompanyIdentifier.owlLabs.rawValue, 1015)
        XCTAssertEqual(CompanyIdentifier.owlLabs.name, #"Owl Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.owlLabs.description, #"Owl Labs Inc."#)
    
        // Rockford Corp.
        XCTAssertEqual(CompanyIdentifier.rockford.rawValue, 1016)
        XCTAssertEqual(CompanyIdentifier.rockford.name, #"Rockford Corp."#)
        XCTAssertEqual(CompanyIdentifier.rockford.description, #"Rockford Corp."#)
    
        // Becon Technologies Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.beconTechnologies.rawValue, 1017)
        XCTAssertEqual(CompanyIdentifier.beconTechnologies.name, #"Becon Technologies Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beconTechnologies.description, #"Becon Technologies Co.,Ltd."#)
    
        // Vyassoft Technologies Inc
        XCTAssertEqual(CompanyIdentifier.vyassoftTechnologies.rawValue, 1018)
        XCTAssertEqual(CompanyIdentifier.vyassoftTechnologies.name, #"Vyassoft Technologies Inc"#)
        XCTAssertEqual(CompanyIdentifier.vyassoftTechnologies.description, #"Vyassoft Technologies Inc"#)
    
        // Nox Medical
        XCTAssertEqual(CompanyIdentifier.noxMedical.rawValue, 1019)
        XCTAssertEqual(CompanyIdentifier.noxMedical.name, #"Nox Medical"#)
        XCTAssertEqual(CompanyIdentifier.noxMedical.description, #"Nox Medical"#)
    
        // Kimberly-Clark
        XCTAssertEqual(CompanyIdentifier.kimberlyClark.rawValue, 1020)
        XCTAssertEqual(CompanyIdentifier.kimberlyClark.name, #"Kimberly-Clark"#)
        XCTAssertEqual(CompanyIdentifier.kimberlyClark.description, #"Kimberly-Clark"#)
    
        // Trimble Navigation Ltd.
        XCTAssertEqual(CompanyIdentifier.trimbleNavigation.rawValue, 1021)
        XCTAssertEqual(CompanyIdentifier.trimbleNavigation.name, #"Trimble Navigation Ltd."#)
        XCTAssertEqual(CompanyIdentifier.trimbleNavigation.description, #"Trimble Navigation Ltd."#)
    
        // Littelfuse
        XCTAssertEqual(CompanyIdentifier.littelfuse.rawValue, 1022)
        XCTAssertEqual(CompanyIdentifier.littelfuse.name, #"Littelfuse"#)
        XCTAssertEqual(CompanyIdentifier.littelfuse.description, #"Littelfuse"#)
    
        // Withings
        XCTAssertEqual(CompanyIdentifier.withings.rawValue, 1023)
        XCTAssertEqual(CompanyIdentifier.withings.name, #"Withings"#)
        XCTAssertEqual(CompanyIdentifier.withings.description, #"Withings"#)
    
        // i-developer IT Beratung UG
        XCTAssertEqual(CompanyIdentifier.iDeveloperItBeratungUg.rawValue, 1024)
        XCTAssertEqual(CompanyIdentifier.iDeveloperItBeratungUg.name, #"i-developer IT Beratung UG"#)
        XCTAssertEqual(CompanyIdentifier.iDeveloperItBeratungUg.description, #"i-developer IT Beratung UG"#)
    
        // Relations Inc.
        XCTAssertEqual(CompanyIdentifier.relations.rawValue, 1025)
        XCTAssertEqual(CompanyIdentifier.relations.name, #"Relations Inc."#)
        XCTAssertEqual(CompanyIdentifier.relations.description, #"Relations Inc."#)
    
        // Sears Holdings Corporation
        XCTAssertEqual(CompanyIdentifier.searsHoldings.rawValue, 1026)
        XCTAssertEqual(CompanyIdentifier.searsHoldings.name, #"Sears Holdings Corporation"#)
        XCTAssertEqual(CompanyIdentifier.searsHoldings.description, #"Sears Holdings Corporation"#)
    
        // Gantner Electronic GmbH
        XCTAssertEqual(CompanyIdentifier.gantnerElectronic.rawValue, 1027)
        XCTAssertEqual(CompanyIdentifier.gantnerElectronic.name, #"Gantner Electronic GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gantnerElectronic.description, #"Gantner Electronic GmbH"#)
    
        // Authomate Inc
        XCTAssertEqual(CompanyIdentifier.authomate.rawValue, 1028)
        XCTAssertEqual(CompanyIdentifier.authomate.name, #"Authomate Inc"#)
        XCTAssertEqual(CompanyIdentifier.authomate.description, #"Authomate Inc"#)
    
        // Vertex International, Inc.
        XCTAssertEqual(CompanyIdentifier.vertexInternational.rawValue, 1029)
        XCTAssertEqual(CompanyIdentifier.vertexInternational.name, #"Vertex International, Inc."#)
        XCTAssertEqual(CompanyIdentifier.vertexInternational.description, #"Vertex International, Inc."#)
    
        // Airtago
        XCTAssertEqual(CompanyIdentifier.airtago.rawValue, 1030)
        XCTAssertEqual(CompanyIdentifier.airtago.name, #"Airtago"#)
        XCTAssertEqual(CompanyIdentifier.airtago.description, #"Airtago"#)
    
        // Swiss Audio SA
        XCTAssertEqual(CompanyIdentifier.swissAudio.rawValue, 1031)
        XCTAssertEqual(CompanyIdentifier.swissAudio.name, #"Swiss Audio SA"#)
        XCTAssertEqual(CompanyIdentifier.swissAudio.description, #"Swiss Audio SA"#)
    
        // ToGetHome Inc.
        XCTAssertEqual(CompanyIdentifier.togethome.rawValue, 1032)
        XCTAssertEqual(CompanyIdentifier.togethome.name, #"ToGetHome Inc."#)
        XCTAssertEqual(CompanyIdentifier.togethome.description, #"ToGetHome Inc."#)
    
        // AXIS
        XCTAssertEqual(CompanyIdentifier.axis.rawValue, 1033)
        XCTAssertEqual(CompanyIdentifier.axis.name, #"AXIS"#)
        XCTAssertEqual(CompanyIdentifier.axis.description, #"AXIS"#)
    
        // Openmatics
        XCTAssertEqual(CompanyIdentifier.openmatics.rawValue, 1034)
        XCTAssertEqual(CompanyIdentifier.openmatics.name, #"Openmatics"#)
        XCTAssertEqual(CompanyIdentifier.openmatics.description, #"Openmatics"#)
    
        // Jana Care Inc.
        XCTAssertEqual(CompanyIdentifier.janaCare.rawValue, 1035)
        XCTAssertEqual(CompanyIdentifier.janaCare.name, #"Jana Care Inc."#)
        XCTAssertEqual(CompanyIdentifier.janaCare.description, #"Jana Care Inc."#)
    
        // Senix Corporation
        XCTAssertEqual(CompanyIdentifier.senix.rawValue, 1036)
        XCTAssertEqual(CompanyIdentifier.senix.name, #"Senix Corporation"#)
        XCTAssertEqual(CompanyIdentifier.senix.description, #"Senix Corporation"#)
    
        // NorthStar Battery Company, LLC
        XCTAssertEqual(CompanyIdentifier.northstarBatteryCompany.rawValue, 1037)
        XCTAssertEqual(CompanyIdentifier.northstarBatteryCompany.name, #"NorthStar Battery Company, LLC"#)
        XCTAssertEqual(CompanyIdentifier.northstarBatteryCompany.description, #"NorthStar Battery Company, LLC"#)
    
        // SKF (U.K.) Limited
        XCTAssertEqual(CompanyIdentifier.skfUK.rawValue, 1038)
        XCTAssertEqual(CompanyIdentifier.skfUK.name, #"SKF (U.K.) Limited"#)
        XCTAssertEqual(CompanyIdentifier.skfUK.description, #"SKF (U.K.) Limited"#)
    
        // CO-AX Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.coAxTechnology.rawValue, 1039)
        XCTAssertEqual(CompanyIdentifier.coAxTechnology.name, #"CO-AX Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.coAxTechnology.description, #"CO-AX Technology, Inc."#)
    
        // Fender Musical Instruments
        XCTAssertEqual(CompanyIdentifier.fenderMusicalInstruments.rawValue, 1040)
        XCTAssertEqual(CompanyIdentifier.fenderMusicalInstruments.name, #"Fender Musical Instruments"#)
        XCTAssertEqual(CompanyIdentifier.fenderMusicalInstruments.description, #"Fender Musical Instruments"#)
    
        // Luidia Inc
        XCTAssertEqual(CompanyIdentifier.luidia.rawValue, 1041)
        XCTAssertEqual(CompanyIdentifier.luidia.name, #"Luidia Inc"#)
        XCTAssertEqual(CompanyIdentifier.luidia.description, #"Luidia Inc"#)
    
        // SEFAM
        XCTAssertEqual(CompanyIdentifier.sefam.rawValue, 1042)
        XCTAssertEqual(CompanyIdentifier.sefam.name, #"SEFAM"#)
        XCTAssertEqual(CompanyIdentifier.sefam.description, #"SEFAM"#)
    
        // Wireless Cables Inc
        XCTAssertEqual(CompanyIdentifier.wirelessCables.rawValue, 1043)
        XCTAssertEqual(CompanyIdentifier.wirelessCables.name, #"Wireless Cables Inc"#)
        XCTAssertEqual(CompanyIdentifier.wirelessCables.description, #"Wireless Cables Inc"#)
    
        // Lightning Protection International Pty Ltd
        XCTAssertEqual(CompanyIdentifier.lightningProtectionInternationalPty.rawValue, 1044)
        XCTAssertEqual(CompanyIdentifier.lightningProtectionInternationalPty.name, #"Lightning Protection International Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.lightningProtectionInternationalPty.description, #"Lightning Protection International Pty Ltd"#)
    
        // Uber Technologies Inc
        XCTAssertEqual(CompanyIdentifier.uberTechnologies.rawValue, 1045)
        XCTAssertEqual(CompanyIdentifier.uberTechnologies.name, #"Uber Technologies Inc"#)
        XCTAssertEqual(CompanyIdentifier.uberTechnologies.description, #"Uber Technologies Inc"#)
    
        // SODA GmbH
        XCTAssertEqual(CompanyIdentifier.soda.rawValue, 1046)
        XCTAssertEqual(CompanyIdentifier.soda.name, #"SODA GmbH"#)
        XCTAssertEqual(CompanyIdentifier.soda.description, #"SODA GmbH"#)
    
        // Fatigue Science
        XCTAssertEqual(CompanyIdentifier.fatigueScience.rawValue, 1047)
        XCTAssertEqual(CompanyIdentifier.fatigueScience.name, #"Fatigue Science"#)
        XCTAssertEqual(CompanyIdentifier.fatigueScience.description, #"Fatigue Science"#)
    
        // Reserved
        XCTAssertEqual(CompanyIdentifier.reserved.rawValue, 1048)
        XCTAssertEqual(CompanyIdentifier.reserved.name, #"Reserved"#)
        XCTAssertEqual(CompanyIdentifier.reserved.description, #"Reserved"#)
    
        // Novalogy LTD
        XCTAssertEqual(CompanyIdentifier.novalogy.rawValue, 1049)
        XCTAssertEqual(CompanyIdentifier.novalogy.name, #"Novalogy LTD"#)
        XCTAssertEqual(CompanyIdentifier.novalogy.description, #"Novalogy LTD"#)
    
        // Friday Labs Limited
        XCTAssertEqual(CompanyIdentifier.fridayLabs.rawValue, 1050)
        XCTAssertEqual(CompanyIdentifier.fridayLabs.name, #"Friday Labs Limited"#)
        XCTAssertEqual(CompanyIdentifier.fridayLabs.description, #"Friday Labs Limited"#)
    
        // OrthoAccel Technologies
        XCTAssertEqual(CompanyIdentifier.orthoaccelTechnologies.rawValue, 1051)
        XCTAssertEqual(CompanyIdentifier.orthoaccelTechnologies.name, #"OrthoAccel Technologies"#)
        XCTAssertEqual(CompanyIdentifier.orthoaccelTechnologies.description, #"OrthoAccel Technologies"#)
    
        // WaterGuru, Inc.
        XCTAssertEqual(CompanyIdentifier.waterguru.rawValue, 1052)
        XCTAssertEqual(CompanyIdentifier.waterguru.name, #"WaterGuru, Inc."#)
        XCTAssertEqual(CompanyIdentifier.waterguru.description, #"WaterGuru, Inc."#)
    
        // Benning Elektrotechnik und Elektronik GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.benningElektrotechnikUndElektronik.rawValue, 1053)
        XCTAssertEqual(CompanyIdentifier.benningElektrotechnikUndElektronik.name, #"Benning Elektrotechnik und Elektronik GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.benningElektrotechnikUndElektronik.description, #"Benning Elektrotechnik und Elektronik GmbH & Co. KG"#)
    
        // Dell Computer Corporation
        XCTAssertEqual(CompanyIdentifier.dellComputer.rawValue, 1054)
        XCTAssertEqual(CompanyIdentifier.dellComputer.name, #"Dell Computer Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dellComputer.description, #"Dell Computer Corporation"#)
    
        // Kopin Corporation
        XCTAssertEqual(CompanyIdentifier.kopin.rawValue, 1055)
        XCTAssertEqual(CompanyIdentifier.kopin.name, #"Kopin Corporation"#)
        XCTAssertEqual(CompanyIdentifier.kopin.description, #"Kopin Corporation"#)
    
        // TecBakery GmbH
        XCTAssertEqual(CompanyIdentifier.tecbakery.rawValue, 1056)
        XCTAssertEqual(CompanyIdentifier.tecbakery.name, #"TecBakery GmbH"#)
        XCTAssertEqual(CompanyIdentifier.tecbakery.description, #"TecBakery GmbH"#)
    
        // Backbone Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.backboneLabs.rawValue, 1057)
        XCTAssertEqual(CompanyIdentifier.backboneLabs.name, #"Backbone Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.backboneLabs.description, #"Backbone Labs, Inc."#)
    
        // DELSEY SA
        XCTAssertEqual(CompanyIdentifier.delsey.rawValue, 1058)
        XCTAssertEqual(CompanyIdentifier.delsey.name, #"DELSEY SA"#)
        XCTAssertEqual(CompanyIdentifier.delsey.description, #"DELSEY SA"#)
    
        // Chargifi Limited
        XCTAssertEqual(CompanyIdentifier.chargifi.rawValue, 1059)
        XCTAssertEqual(CompanyIdentifier.chargifi.name, #"Chargifi Limited"#)
        XCTAssertEqual(CompanyIdentifier.chargifi.description, #"Chargifi Limited"#)
    
        // Trainesense Ltd.
        XCTAssertEqual(CompanyIdentifier.trainesense.rawValue, 1060)
        XCTAssertEqual(CompanyIdentifier.trainesense.name, #"Trainesense Ltd."#)
        XCTAssertEqual(CompanyIdentifier.trainesense.description, #"Trainesense Ltd."#)
    
        // Unify Software and Solutions GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.unifySoftwareAndSolutions.rawValue, 1061)
        XCTAssertEqual(CompanyIdentifier.unifySoftwareAndSolutions.name, #"Unify Software and Solutions GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.unifySoftwareAndSolutions.description, #"Unify Software and Solutions GmbH & Co. KG"#)
    
        // Husqvarna AB
        XCTAssertEqual(CompanyIdentifier.husqvarna.rawValue, 1062)
        XCTAssertEqual(CompanyIdentifier.husqvarna.name, #"Husqvarna AB"#)
        XCTAssertEqual(CompanyIdentifier.husqvarna.description, #"Husqvarna AB"#)
    
        // Focus fleet and fuel management inc
        XCTAssertEqual(CompanyIdentifier.focusFleetAndFuelManagement.rawValue, 1063)
        XCTAssertEqual(CompanyIdentifier.focusFleetAndFuelManagement.name, #"Focus fleet and fuel management inc"#)
        XCTAssertEqual(CompanyIdentifier.focusFleetAndFuelManagement.description, #"Focus fleet and fuel management inc"#)
    
        // SmallLoop, LLC
        XCTAssertEqual(CompanyIdentifier.smallloop.rawValue, 1064)
        XCTAssertEqual(CompanyIdentifier.smallloop.name, #"SmallLoop, LLC"#)
        XCTAssertEqual(CompanyIdentifier.smallloop.description, #"SmallLoop, LLC"#)
    
        // Prolon Inc.
        XCTAssertEqual(CompanyIdentifier.prolon.rawValue, 1065)
        XCTAssertEqual(CompanyIdentifier.prolon.name, #"Prolon Inc."#)
        XCTAssertEqual(CompanyIdentifier.prolon.description, #"Prolon Inc."#)
    
        // BD Medical
        XCTAssertEqual(CompanyIdentifier.bdMedical.rawValue, 1066)
        XCTAssertEqual(CompanyIdentifier.bdMedical.name, #"BD Medical"#)
        XCTAssertEqual(CompanyIdentifier.bdMedical.description, #"BD Medical"#)
    
        // iMicroMed Incorporated
        XCTAssertEqual(CompanyIdentifier.imicromed.rawValue, 1067)
        XCTAssertEqual(CompanyIdentifier.imicromed.name, #"iMicroMed Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.imicromed.description, #"iMicroMed Incorporated"#)
    
        // Ticto N.V.
        XCTAssertEqual(CompanyIdentifier.ticto.rawValue, 1068)
        XCTAssertEqual(CompanyIdentifier.ticto.name, #"Ticto N.V."#)
        XCTAssertEqual(CompanyIdentifier.ticto.description, #"Ticto N.V."#)
    
        // Meshtech AS
        XCTAssertEqual(CompanyIdentifier.meshtech.rawValue, 1069)
        XCTAssertEqual(CompanyIdentifier.meshtech.name, #"Meshtech AS"#)
        XCTAssertEqual(CompanyIdentifier.meshtech.description, #"Meshtech AS"#)
    
        // MemCachier Inc.
        XCTAssertEqual(CompanyIdentifier.memcachier.rawValue, 1070)
        XCTAssertEqual(CompanyIdentifier.memcachier.name, #"MemCachier Inc."#)
        XCTAssertEqual(CompanyIdentifier.memcachier.description, #"MemCachier Inc."#)
    
        // Danfoss A/S
        XCTAssertEqual(CompanyIdentifier.danfoss.rawValue, 1071)
        XCTAssertEqual(CompanyIdentifier.danfoss.name, #"Danfoss A/S"#)
        XCTAssertEqual(CompanyIdentifier.danfoss.description, #"Danfoss A/S"#)
    
        // SnapStyk Inc.
        XCTAssertEqual(CompanyIdentifier.snapstyk.rawValue, 1072)
        XCTAssertEqual(CompanyIdentifier.snapstyk.name, #"SnapStyk Inc."#)
        XCTAssertEqual(CompanyIdentifier.snapstyk.description, #"SnapStyk Inc."#)
    
        // Amway Corporation
        XCTAssertEqual(CompanyIdentifier.amway.rawValue, 1073)
        XCTAssertEqual(CompanyIdentifier.amway.name, #"Amway Corporation"#)
        XCTAssertEqual(CompanyIdentifier.amway.description, #"Amway Corporation"#)
    
        // Silk Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.silkLabs.rawValue, 1074)
        XCTAssertEqual(CompanyIdentifier.silkLabs.name, #"Silk Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.silkLabs.description, #"Silk Labs, Inc."#)
    
        // Pillsy Inc.
        XCTAssertEqual(CompanyIdentifier.pillsy.rawValue, 1075)
        XCTAssertEqual(CompanyIdentifier.pillsy.name, #"Pillsy Inc."#)
        XCTAssertEqual(CompanyIdentifier.pillsy.description, #"Pillsy Inc."#)
    
        // Hatch Baby, Inc.
        XCTAssertEqual(CompanyIdentifier.hatchBaby.rawValue, 1076)
        XCTAssertEqual(CompanyIdentifier.hatchBaby.name, #"Hatch Baby, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hatchBaby.description, #"Hatch Baby, Inc."#)
    
        // Blocks Wearables Ltd.
        XCTAssertEqual(CompanyIdentifier.blocksWearables.rawValue, 1077)
        XCTAssertEqual(CompanyIdentifier.blocksWearables.name, #"Blocks Wearables Ltd."#)
        XCTAssertEqual(CompanyIdentifier.blocksWearables.description, #"Blocks Wearables Ltd."#)
    
        // Drayson Technologies (Europe) Limited
        XCTAssertEqual(CompanyIdentifier.draysonTechnologiesEurope.rawValue, 1078)
        XCTAssertEqual(CompanyIdentifier.draysonTechnologiesEurope.name, #"Drayson Technologies (Europe) Limited"#)
        XCTAssertEqual(CompanyIdentifier.draysonTechnologiesEurope.description, #"Drayson Technologies (Europe) Limited"#)
    
        // eBest IOT Inc.
        XCTAssertEqual(CompanyIdentifier.ebestIot.rawValue, 1079)
        XCTAssertEqual(CompanyIdentifier.ebestIot.name, #"eBest IOT Inc."#)
        XCTAssertEqual(CompanyIdentifier.ebestIot.description, #"eBest IOT Inc."#)
    
        // Helvar Ltd
        XCTAssertEqual(CompanyIdentifier.helvar.rawValue, 1080)
        XCTAssertEqual(CompanyIdentifier.helvar.name, #"Helvar Ltd"#)
        XCTAssertEqual(CompanyIdentifier.helvar.description, #"Helvar Ltd"#)
    
        // Radiance Technologies
        XCTAssertEqual(CompanyIdentifier.radianceTechnologies.rawValue, 1081)
        XCTAssertEqual(CompanyIdentifier.radianceTechnologies.name, #"Radiance Technologies"#)
        XCTAssertEqual(CompanyIdentifier.radianceTechnologies.description, #"Radiance Technologies"#)
    
        // Nuheara Limited
        XCTAssertEqual(CompanyIdentifier.nuheara.rawValue, 1082)
        XCTAssertEqual(CompanyIdentifier.nuheara.name, #"Nuheara Limited"#)
        XCTAssertEqual(CompanyIdentifier.nuheara.description, #"Nuheara Limited"#)
    
        // Appside co., ltd.
        XCTAssertEqual(CompanyIdentifier.appside.rawValue, 1083)
        XCTAssertEqual(CompanyIdentifier.appside.name, #"Appside co., ltd."#)
        XCTAssertEqual(CompanyIdentifier.appside.description, #"Appside co., ltd."#)
    
        // DeLaval
        XCTAssertEqual(CompanyIdentifier.delaval.rawValue, 1084)
        XCTAssertEqual(CompanyIdentifier.delaval.name, #"DeLaval"#)
        XCTAssertEqual(CompanyIdentifier.delaval.description, #"DeLaval"#)
    
        // Coiler Corporation
        XCTAssertEqual(CompanyIdentifier.coiler.rawValue, 1085)
        XCTAssertEqual(CompanyIdentifier.coiler.name, #"Coiler Corporation"#)
        XCTAssertEqual(CompanyIdentifier.coiler.description, #"Coiler Corporation"#)
    
        // Thermomedics, Inc.
        XCTAssertEqual(CompanyIdentifier.thermomedics.rawValue, 1086)
        XCTAssertEqual(CompanyIdentifier.thermomedics.name, #"Thermomedics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.thermomedics.description, #"Thermomedics, Inc."#)
    
        // Tentacle Sync GmbH
        XCTAssertEqual(CompanyIdentifier.tentacleSync.rawValue, 1087)
        XCTAssertEqual(CompanyIdentifier.tentacleSync.name, #"Tentacle Sync GmbH"#)
        XCTAssertEqual(CompanyIdentifier.tentacleSync.description, #"Tentacle Sync GmbH"#)
    
        // Valencell, Inc.
        XCTAssertEqual(CompanyIdentifier.valencell.rawValue, 1088)
        XCTAssertEqual(CompanyIdentifier.valencell.name, #"Valencell, Inc."#)
        XCTAssertEqual(CompanyIdentifier.valencell.description, #"Valencell, Inc."#)
    
        // iProtoXi Oy
        XCTAssertEqual(CompanyIdentifier.iprotoxi.rawValue, 1089)
        XCTAssertEqual(CompanyIdentifier.iprotoxi.name, #"iProtoXi Oy"#)
        XCTAssertEqual(CompanyIdentifier.iprotoxi.description, #"iProtoXi Oy"#)
    
        // SECOM CO., LTD.
        XCTAssertEqual(CompanyIdentifier.secom.rawValue, 1090)
        XCTAssertEqual(CompanyIdentifier.secom.name, #"SECOM CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.secom.description, #"SECOM CO., LTD."#)
    
        // Tucker International LLC
        XCTAssertEqual(CompanyIdentifier.tuckerInternational.rawValue, 1091)
        XCTAssertEqual(CompanyIdentifier.tuckerInternational.name, #"Tucker International LLC"#)
        XCTAssertEqual(CompanyIdentifier.tuckerInternational.description, #"Tucker International LLC"#)
    
        // Metanate Limited
        XCTAssertEqual(CompanyIdentifier.metanate.rawValue, 1092)
        XCTAssertEqual(CompanyIdentifier.metanate.name, #"Metanate Limited"#)
        XCTAssertEqual(CompanyIdentifier.metanate.description, #"Metanate Limited"#)
    
        // Kobian Canada Inc.
        XCTAssertEqual(CompanyIdentifier.kobianCanada.rawValue, 1093)
        XCTAssertEqual(CompanyIdentifier.kobianCanada.name, #"Kobian Canada Inc."#)
        XCTAssertEqual(CompanyIdentifier.kobianCanada.description, #"Kobian Canada Inc."#)
    
        // NETGEAR, Inc.
        XCTAssertEqual(CompanyIdentifier.netgear.rawValue, 1094)
        XCTAssertEqual(CompanyIdentifier.netgear.name, #"NETGEAR, Inc."#)
        XCTAssertEqual(CompanyIdentifier.netgear.description, #"NETGEAR, Inc."#)
    
        // Fabtronics Australia Pty Ltd
        XCTAssertEqual(CompanyIdentifier.fabtronicsAustraliaPty.rawValue, 1095)
        XCTAssertEqual(CompanyIdentifier.fabtronicsAustraliaPty.name, #"Fabtronics Australia Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.fabtronicsAustraliaPty.description, #"Fabtronics Australia Pty Ltd"#)
    
        // Grand Centrix GmbH
        XCTAssertEqual(CompanyIdentifier.grandCentrix.rawValue, 1096)
        XCTAssertEqual(CompanyIdentifier.grandCentrix.name, #"Grand Centrix GmbH"#)
        XCTAssertEqual(CompanyIdentifier.grandCentrix.description, #"Grand Centrix GmbH"#)
    
        // 1UP USA.com llc
        XCTAssertEqual(CompanyIdentifier.company1UpUsaCom.rawValue, 1097)
        XCTAssertEqual(CompanyIdentifier.company1UpUsaCom.name, #"1UP USA.com llc"#)
        XCTAssertEqual(CompanyIdentifier.company1UpUsaCom.description, #"1UP USA.com llc"#)
    
        // SHIMANO INC.
        XCTAssertEqual(CompanyIdentifier.shimano.rawValue, 1098)
        XCTAssertEqual(CompanyIdentifier.shimano.name, #"SHIMANO INC."#)
        XCTAssertEqual(CompanyIdentifier.shimano.description, #"SHIMANO INC."#)
    
        // Nain Inc.
        XCTAssertEqual(CompanyIdentifier.nain.rawValue, 1099)
        XCTAssertEqual(CompanyIdentifier.nain.name, #"Nain Inc."#)
        XCTAssertEqual(CompanyIdentifier.nain.description, #"Nain Inc."#)
    
        // LifeStyle Lock, LLC
        XCTAssertEqual(CompanyIdentifier.lifestyleLock.rawValue, 1100)
        XCTAssertEqual(CompanyIdentifier.lifestyleLock.name, #"LifeStyle Lock, LLC"#)
        XCTAssertEqual(CompanyIdentifier.lifestyleLock.description, #"LifeStyle Lock, LLC"#)
    
        // VEGA Grieshaber KG
        XCTAssertEqual(CompanyIdentifier.vegaGrieshaberKg.rawValue, 1101)
        XCTAssertEqual(CompanyIdentifier.vegaGrieshaberKg.name, #"VEGA Grieshaber KG"#)
        XCTAssertEqual(CompanyIdentifier.vegaGrieshaberKg.description, #"VEGA Grieshaber KG"#)
    
        // Xtrava Inc.
        XCTAssertEqual(CompanyIdentifier.xtrava.rawValue, 1102)
        XCTAssertEqual(CompanyIdentifier.xtrava.name, #"Xtrava Inc."#)
        XCTAssertEqual(CompanyIdentifier.xtrava.description, #"Xtrava Inc."#)
    
        // TTS Tooltechnic Systems AG & Co. KG
        XCTAssertEqual(CompanyIdentifier.ttsTooltechnicSystems.rawValue, 1103)
        XCTAssertEqual(CompanyIdentifier.ttsTooltechnicSystems.name, #"TTS Tooltechnic Systems AG & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.ttsTooltechnicSystems.description, #"TTS Tooltechnic Systems AG & Co. KG"#)
    
        // Teenage Engineering AB
        XCTAssertEqual(CompanyIdentifier.teenageEngineering.rawValue, 1104)
        XCTAssertEqual(CompanyIdentifier.teenageEngineering.name, #"Teenage Engineering AB"#)
        XCTAssertEqual(CompanyIdentifier.teenageEngineering.description, #"Teenage Engineering AB"#)
    
        // Tunstall Nordic AB
        XCTAssertEqual(CompanyIdentifier.tunstallNordic.rawValue, 1105)
        XCTAssertEqual(CompanyIdentifier.tunstallNordic.name, #"Tunstall Nordic AB"#)
        XCTAssertEqual(CompanyIdentifier.tunstallNordic.description, #"Tunstall Nordic AB"#)
    
        // Svep Design Center AB
        XCTAssertEqual(CompanyIdentifier.svepDesignCenter.rawValue, 1106)
        XCTAssertEqual(CompanyIdentifier.svepDesignCenter.name, #"Svep Design Center AB"#)
        XCTAssertEqual(CompanyIdentifier.svepDesignCenter.description, #"Svep Design Center AB"#)
    
        // Qorvo Utrecht B.V. formerly GreenPeak Technologies BV
        XCTAssertEqual(CompanyIdentifier.qorvoUtrechtFormerlyGreenpeakTechnologies.rawValue, 1107)
        XCTAssertEqual(CompanyIdentifier.qorvoUtrechtFormerlyGreenpeakTechnologies.name, #"Qorvo Utrecht B.V. formerly GreenPeak Technologies BV"#)
        XCTAssertEqual(CompanyIdentifier.qorvoUtrechtFormerlyGreenpeakTechnologies.description, #"Qorvo Utrecht B.V. formerly GreenPeak Technologies BV"#)
    
        // Sphinx Electronics GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.sphinxElectronics.rawValue, 1108)
        XCTAssertEqual(CompanyIdentifier.sphinxElectronics.name, #"Sphinx Electronics GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.sphinxElectronics.description, #"Sphinx Electronics GmbH & Co KG"#)
    
        // Atomation
        XCTAssertEqual(CompanyIdentifier.atomation.rawValue, 1109)
        XCTAssertEqual(CompanyIdentifier.atomation.name, #"Atomation"#)
        XCTAssertEqual(CompanyIdentifier.atomation.description, #"Atomation"#)
    
        // Nemik Consulting Inc
        XCTAssertEqual(CompanyIdentifier.nemikConsulting.rawValue, 1110)
        XCTAssertEqual(CompanyIdentifier.nemikConsulting.name, #"Nemik Consulting Inc"#)
        XCTAssertEqual(CompanyIdentifier.nemikConsulting.description, #"Nemik Consulting Inc"#)
    
        // RF INNOVATION
        XCTAssertEqual(CompanyIdentifier.rfInnovation.rawValue, 1111)
        XCTAssertEqual(CompanyIdentifier.rfInnovation.name, #"RF INNOVATION"#)
        XCTAssertEqual(CompanyIdentifier.rfInnovation.description, #"RF INNOVATION"#)
    
        // Mini Solution Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.miniSolution.rawValue, 1112)
        XCTAssertEqual(CompanyIdentifier.miniSolution.name, #"Mini Solution Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.miniSolution.description, #"Mini Solution Co., Ltd."#)
    
        // Lumenetix, Inc
        XCTAssertEqual(CompanyIdentifier.lumenetix.rawValue, 1113)
        XCTAssertEqual(CompanyIdentifier.lumenetix.name, #"Lumenetix, Inc"#)
        XCTAssertEqual(CompanyIdentifier.lumenetix.description, #"Lumenetix, Inc"#)
    
        // 2048450 Ontario Inc
        XCTAssertEqual(CompanyIdentifier.company2048450Ontario.rawValue, 1114)
        XCTAssertEqual(CompanyIdentifier.company2048450Ontario.name, #"2048450 Ontario Inc"#)
        XCTAssertEqual(CompanyIdentifier.company2048450Ontario.description, #"2048450 Ontario Inc"#)
    
        // SPACEEK LTD
        XCTAssertEqual(CompanyIdentifier.spaceek.rawValue, 1115)
        XCTAssertEqual(CompanyIdentifier.spaceek.name, #"SPACEEK LTD"#)
        XCTAssertEqual(CompanyIdentifier.spaceek.description, #"SPACEEK LTD"#)
    
        // Delta T Corporation
        XCTAssertEqual(CompanyIdentifier.deltaT.rawValue, 1116)
        XCTAssertEqual(CompanyIdentifier.deltaT.name, #"Delta T Corporation"#)
        XCTAssertEqual(CompanyIdentifier.deltaT.description, #"Delta T Corporation"#)
    
        // Boston Scientific Corporation
        XCTAssertEqual(CompanyIdentifier.bostonScientific.rawValue, 1117)
        XCTAssertEqual(CompanyIdentifier.bostonScientific.name, #"Boston Scientific Corporation"#)
        XCTAssertEqual(CompanyIdentifier.bostonScientific.description, #"Boston Scientific Corporation"#)
    
        // Nuviz, Inc.
        XCTAssertEqual(CompanyIdentifier.nuviz.rawValue, 1118)
        XCTAssertEqual(CompanyIdentifier.nuviz.name, #"Nuviz, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nuviz.description, #"Nuviz, Inc."#)
    
        // Real Time Automation, Inc.
        XCTAssertEqual(CompanyIdentifier.realTimeAutomation.rawValue, 1119)
        XCTAssertEqual(CompanyIdentifier.realTimeAutomation.name, #"Real Time Automation, Inc."#)
        XCTAssertEqual(CompanyIdentifier.realTimeAutomation.description, #"Real Time Automation, Inc."#)
    
        // Kolibree
        XCTAssertEqual(CompanyIdentifier.kolibree.rawValue, 1120)
        XCTAssertEqual(CompanyIdentifier.kolibree.name, #"Kolibree"#)
        XCTAssertEqual(CompanyIdentifier.kolibree.description, #"Kolibree"#)
    
        // vhf elektronik GmbH
        XCTAssertEqual(CompanyIdentifier.vhfElektronik.rawValue, 1121)
        XCTAssertEqual(CompanyIdentifier.vhfElektronik.name, #"vhf elektronik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.vhfElektronik.description, #"vhf elektronik GmbH"#)
    
        // Bonsai Systems GmbH
        XCTAssertEqual(CompanyIdentifier.bonsaiSystems.rawValue, 1122)
        XCTAssertEqual(CompanyIdentifier.bonsaiSystems.name, #"Bonsai Systems GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bonsaiSystems.description, #"Bonsai Systems GmbH"#)
    
        // Fathom Systems Inc.
        XCTAssertEqual(CompanyIdentifier.fathomSystems.rawValue, 1123)
        XCTAssertEqual(CompanyIdentifier.fathomSystems.name, #"Fathom Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.fathomSystems.description, #"Fathom Systems Inc."#)
    
        // Bellman & Symfon
        XCTAssertEqual(CompanyIdentifier.bellmanSymfon.rawValue, 1124)
        XCTAssertEqual(CompanyIdentifier.bellmanSymfon.name, #"Bellman & Symfon"#)
        XCTAssertEqual(CompanyIdentifier.bellmanSymfon.description, #"Bellman & Symfon"#)
    
        // International Forte Group LLC
        XCTAssertEqual(CompanyIdentifier.internationalForteGroup.rawValue, 1125)
        XCTAssertEqual(CompanyIdentifier.internationalForteGroup.name, #"International Forte Group LLC"#)
        XCTAssertEqual(CompanyIdentifier.internationalForteGroup.description, #"International Forte Group LLC"#)
    
        // CycleLabs Solutions inc.
        XCTAssertEqual(CompanyIdentifier.cyclelabsSolutions.rawValue, 1126)
        XCTAssertEqual(CompanyIdentifier.cyclelabsSolutions.name, #"CycleLabs Solutions inc."#)
        XCTAssertEqual(CompanyIdentifier.cyclelabsSolutions.description, #"CycleLabs Solutions inc."#)
    
        // Codenex Oy
        XCTAssertEqual(CompanyIdentifier.codenex.rawValue, 1127)
        XCTAssertEqual(CompanyIdentifier.codenex.name, #"Codenex Oy"#)
        XCTAssertEqual(CompanyIdentifier.codenex.description, #"Codenex Oy"#)
    
        // Kynesim Ltd
        XCTAssertEqual(CompanyIdentifier.kynesim.rawValue, 1128)
        XCTAssertEqual(CompanyIdentifier.kynesim.name, #"Kynesim Ltd"#)
        XCTAssertEqual(CompanyIdentifier.kynesim.description, #"Kynesim Ltd"#)
    
        // Palago AB
        XCTAssertEqual(CompanyIdentifier.palago.rawValue, 1129)
        XCTAssertEqual(CompanyIdentifier.palago.name, #"Palago AB"#)
        XCTAssertEqual(CompanyIdentifier.palago.description, #"Palago AB"#)
    
        // INSIGMA INC.
        XCTAssertEqual(CompanyIdentifier.insigma.rawValue, 1130)
        XCTAssertEqual(CompanyIdentifier.insigma.name, #"INSIGMA INC."#)
        XCTAssertEqual(CompanyIdentifier.insigma.description, #"INSIGMA INC."#)
    
        // PMD Solutions
        XCTAssertEqual(CompanyIdentifier.pmdSolutions.rawValue, 1131)
        XCTAssertEqual(CompanyIdentifier.pmdSolutions.name, #"PMD Solutions"#)
        XCTAssertEqual(CompanyIdentifier.pmdSolutions.description, #"PMD Solutions"#)
    
        // Qingdao Realtime Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.qingdaoRealtimeTechnology.rawValue, 1132)
        XCTAssertEqual(CompanyIdentifier.qingdaoRealtimeTechnology.name, #"Qingdao Realtime Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.qingdaoRealtimeTechnology.description, #"Qingdao Realtime Technology Co., Ltd."#)
    
        // BEGA Gantenbrink-Leuchten KG
        XCTAssertEqual(CompanyIdentifier.begaGantenbrinkLeuchtenKg.rawValue, 1133)
        XCTAssertEqual(CompanyIdentifier.begaGantenbrinkLeuchtenKg.name, #"BEGA Gantenbrink-Leuchten KG"#)
        XCTAssertEqual(CompanyIdentifier.begaGantenbrinkLeuchtenKg.description, #"BEGA Gantenbrink-Leuchten KG"#)
    
        // Pambor Ltd.
        XCTAssertEqual(CompanyIdentifier.pambor.rawValue, 1134)
        XCTAssertEqual(CompanyIdentifier.pambor.name, #"Pambor Ltd."#)
        XCTAssertEqual(CompanyIdentifier.pambor.description, #"Pambor Ltd."#)
    
        // Develco Products A/S
        XCTAssertEqual(CompanyIdentifier.develcoProducts.rawValue, 1135)
        XCTAssertEqual(CompanyIdentifier.develcoProducts.name, #"Develco Products A/S"#)
        XCTAssertEqual(CompanyIdentifier.develcoProducts.description, #"Develco Products A/S"#)
    
        // iDesign s.r.l.
        XCTAssertEqual(CompanyIdentifier.idesign.rawValue, 1136)
        XCTAssertEqual(CompanyIdentifier.idesign.name, #"iDesign s.r.l."#)
        XCTAssertEqual(CompanyIdentifier.idesign.description, #"iDesign s.r.l."#)
    
        // TiVo Corp
        XCTAssertEqual(CompanyIdentifier.tivo.rawValue, 1137)
        XCTAssertEqual(CompanyIdentifier.tivo.name, #"TiVo Corp"#)
        XCTAssertEqual(CompanyIdentifier.tivo.description, #"TiVo Corp"#)
    
        // Control-J Pty Ltd
        XCTAssertEqual(CompanyIdentifier.controlJPty.rawValue, 1138)
        XCTAssertEqual(CompanyIdentifier.controlJPty.name, #"Control-J Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.controlJPty.description, #"Control-J Pty Ltd"#)
    
        // Steelcase, Inc.
        XCTAssertEqual(CompanyIdentifier.steelcase.rawValue, 1139)
        XCTAssertEqual(CompanyIdentifier.steelcase.name, #"Steelcase, Inc."#)
        XCTAssertEqual(CompanyIdentifier.steelcase.description, #"Steelcase, Inc."#)
    
        // iApartment co., ltd.
        XCTAssertEqual(CompanyIdentifier.iapartment.rawValue, 1140)
        XCTAssertEqual(CompanyIdentifier.iapartment.name, #"iApartment co., ltd."#)
        XCTAssertEqual(CompanyIdentifier.iapartment.description, #"iApartment co., ltd."#)
    
        // Icom inc.
        XCTAssertEqual(CompanyIdentifier.icom.rawValue, 1141)
        XCTAssertEqual(CompanyIdentifier.icom.name, #"Icom inc."#)
        XCTAssertEqual(CompanyIdentifier.icom.description, #"Icom inc."#)
    
        // Oxstren Wearable Technologies Private Limited
        XCTAssertEqual(CompanyIdentifier.oxstrenWearableTechnologies.rawValue, 1142)
        XCTAssertEqual(CompanyIdentifier.oxstrenWearableTechnologies.name, #"Oxstren Wearable Technologies Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.oxstrenWearableTechnologies.description, #"Oxstren Wearable Technologies Private Limited"#)
    
        // Blue Spark Technologies
        XCTAssertEqual(CompanyIdentifier.blueSparkTechnologies.rawValue, 1143)
        XCTAssertEqual(CompanyIdentifier.blueSparkTechnologies.name, #"Blue Spark Technologies"#)
        XCTAssertEqual(CompanyIdentifier.blueSparkTechnologies.description, #"Blue Spark Technologies"#)
    
        // FarSite Communications Limited
        XCTAssertEqual(CompanyIdentifier.farsiteCommunications.rawValue, 1144)
        XCTAssertEqual(CompanyIdentifier.farsiteCommunications.name, #"FarSite Communications Limited"#)
        XCTAssertEqual(CompanyIdentifier.farsiteCommunications.description, #"FarSite Communications Limited"#)
    
        // mywerk system GmbH
        XCTAssertEqual(CompanyIdentifier.mywerkSystem.rawValue, 1145)
        XCTAssertEqual(CompanyIdentifier.mywerkSystem.name, #"mywerk system GmbH"#)
        XCTAssertEqual(CompanyIdentifier.mywerkSystem.description, #"mywerk system GmbH"#)
    
        // Sinosun Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sinosunTechnology.rawValue, 1146)
        XCTAssertEqual(CompanyIdentifier.sinosunTechnology.name, #"Sinosun Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sinosunTechnology.description, #"Sinosun Technology Co., Ltd."#)
    
        // MIYOSHI ELECTRONICS CORPORATION
        XCTAssertEqual(CompanyIdentifier.miyoshiElectronics.rawValue, 1147)
        XCTAssertEqual(CompanyIdentifier.miyoshiElectronics.name, #"MIYOSHI ELECTRONICS CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.miyoshiElectronics.description, #"MIYOSHI ELECTRONICS CORPORATION"#)
    
        // POWERMAT LTD
        XCTAssertEqual(CompanyIdentifier.powermat.rawValue, 1148)
        XCTAssertEqual(CompanyIdentifier.powermat.name, #"POWERMAT LTD"#)
        XCTAssertEqual(CompanyIdentifier.powermat.description, #"POWERMAT LTD"#)
    
        // Occly LLC
        XCTAssertEqual(CompanyIdentifier.occly.rawValue, 1149)
        XCTAssertEqual(CompanyIdentifier.occly.name, #"Occly LLC"#)
        XCTAssertEqual(CompanyIdentifier.occly.description, #"Occly LLC"#)
    
        // OurHub Dev IvS
        XCTAssertEqual(CompanyIdentifier.ourhubDevIvs.rawValue, 1150)
        XCTAssertEqual(CompanyIdentifier.ourhubDevIvs.name, #"OurHub Dev IvS"#)
        XCTAssertEqual(CompanyIdentifier.ourhubDevIvs.description, #"OurHub Dev IvS"#)
    
        // Pro-Mark, Inc.
        XCTAssertEqual(CompanyIdentifier.proMark.rawValue, 1151)
        XCTAssertEqual(CompanyIdentifier.proMark.name, #"Pro-Mark, Inc."#)
        XCTAssertEqual(CompanyIdentifier.proMark.description, #"Pro-Mark, Inc."#)
    
        // Dynometrics Inc.
        XCTAssertEqual(CompanyIdentifier.dynometrics.rawValue, 1152)
        XCTAssertEqual(CompanyIdentifier.dynometrics.name, #"Dynometrics Inc."#)
        XCTAssertEqual(CompanyIdentifier.dynometrics.description, #"Dynometrics Inc."#)
    
        // Quintrax Limited
        XCTAssertEqual(CompanyIdentifier.quintrax.rawValue, 1153)
        XCTAssertEqual(CompanyIdentifier.quintrax.name, #"Quintrax Limited"#)
        XCTAssertEqual(CompanyIdentifier.quintrax.description, #"Quintrax Limited"#)
    
        // POS Tuning Udo Vosshenrich GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.posTuningUdoVosshenrich.rawValue, 1154)
        XCTAssertEqual(CompanyIdentifier.posTuningUdoVosshenrich.name, #"POS Tuning Udo Vosshenrich GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.posTuningUdoVosshenrich.description, #"POS Tuning Udo Vosshenrich GmbH & Co. KG"#)
    
        // Multi Care Systems B.V.
        XCTAssertEqual(CompanyIdentifier.multiCareSystems.rawValue, 1155)
        XCTAssertEqual(CompanyIdentifier.multiCareSystems.name, #"Multi Care Systems B.V."#)
        XCTAssertEqual(CompanyIdentifier.multiCareSystems.description, #"Multi Care Systems B.V."#)
    
        // Revol Technologies Inc
        XCTAssertEqual(CompanyIdentifier.revolTechnologies.rawValue, 1156)
        XCTAssertEqual(CompanyIdentifier.revolTechnologies.name, #"Revol Technologies Inc"#)
        XCTAssertEqual(CompanyIdentifier.revolTechnologies.description, #"Revol Technologies Inc"#)
    
        // SKIDATA AG
        XCTAssertEqual(CompanyIdentifier.skidata.rawValue, 1157)
        XCTAssertEqual(CompanyIdentifier.skidata.name, #"SKIDATA AG"#)
        XCTAssertEqual(CompanyIdentifier.skidata.description, #"SKIDATA AG"#)
    
        // DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME
        XCTAssertEqual(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentosaMe.rawValue, 1158)
        XCTAssertEqual(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentosaMe.name, #"DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"#)
        XCTAssertEqual(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentosaMe.description, #"DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"#)
    
        // Centrica Connected Home
        XCTAssertEqual(CompanyIdentifier.centricaConnectedHome.rawValue, 1159)
        XCTAssertEqual(CompanyIdentifier.centricaConnectedHome.name, #"Centrica Connected Home"#)
        XCTAssertEqual(CompanyIdentifier.centricaConnectedHome.description, #"Centrica Connected Home"#)
    
        // Automotive Data Solutions Inc
        XCTAssertEqual(CompanyIdentifier.automotiveDataSolutions.rawValue, 1160)
        XCTAssertEqual(CompanyIdentifier.automotiveDataSolutions.name, #"Automotive Data Solutions Inc"#)
        XCTAssertEqual(CompanyIdentifier.automotiveDataSolutions.description, #"Automotive Data Solutions Inc"#)
    
        // Igarashi Engineering
        XCTAssertEqual(CompanyIdentifier.igarashiEngineering.rawValue, 1161)
        XCTAssertEqual(CompanyIdentifier.igarashiEngineering.name, #"Igarashi Engineering"#)
        XCTAssertEqual(CompanyIdentifier.igarashiEngineering.description, #"Igarashi Engineering"#)
    
        // Taelek Oy
        XCTAssertEqual(CompanyIdentifier.taelek.rawValue, 1162)
        XCTAssertEqual(CompanyIdentifier.taelek.name, #"Taelek Oy"#)
        XCTAssertEqual(CompanyIdentifier.taelek.description, #"Taelek Oy"#)
    
        // CP Electronics Limited
        XCTAssertEqual(CompanyIdentifier.cpElectronics.rawValue, 1163)
        XCTAssertEqual(CompanyIdentifier.cpElectronics.name, #"CP Electronics Limited"#)
        XCTAssertEqual(CompanyIdentifier.cpElectronics.description, #"CP Electronics Limited"#)
    
        // Vectronix AG
        XCTAssertEqual(CompanyIdentifier.vectronix.rawValue, 1164)
        XCTAssertEqual(CompanyIdentifier.vectronix.name, #"Vectronix AG"#)
        XCTAssertEqual(CompanyIdentifier.vectronix.description, #"Vectronix AG"#)
    
        // S-Labs Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.sLabs.rawValue, 1165)
        XCTAssertEqual(CompanyIdentifier.sLabs.name, #"S-Labs Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.sLabs.description, #"S-Labs Sp. z o.o."#)
    
        // Companion Medical, Inc.
        XCTAssertEqual(CompanyIdentifier.companionMedical.rawValue, 1166)
        XCTAssertEqual(CompanyIdentifier.companionMedical.name, #"Companion Medical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.companionMedical.description, #"Companion Medical, Inc."#)
    
        // BlueKitchen GmbH
        XCTAssertEqual(CompanyIdentifier.bluekitchen.rawValue, 1167)
        XCTAssertEqual(CompanyIdentifier.bluekitchen.name, #"BlueKitchen GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bluekitchen.description, #"BlueKitchen GmbH"#)
    
        // Matting AB
        XCTAssertEqual(CompanyIdentifier.matting.rawValue, 1168)
        XCTAssertEqual(CompanyIdentifier.matting.name, #"Matting AB"#)
        XCTAssertEqual(CompanyIdentifier.matting.description, #"Matting AB"#)
    
        // SOREX - Wireless Solutions GmbH
        XCTAssertEqual(CompanyIdentifier.sorexWirelessSolutions.rawValue, 1169)
        XCTAssertEqual(CompanyIdentifier.sorexWirelessSolutions.name, #"SOREX - Wireless Solutions GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sorexWirelessSolutions.description, #"SOREX - Wireless Solutions GmbH"#)
    
        // ADC Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.adcTechnology.rawValue, 1170)
        XCTAssertEqual(CompanyIdentifier.adcTechnology.name, #"ADC Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.adcTechnology.description, #"ADC Technology, Inc."#)
    
        // Lynxemi Pte Ltd
        XCTAssertEqual(CompanyIdentifier.lynxemiPte.rawValue, 1171)
        XCTAssertEqual(CompanyIdentifier.lynxemiPte.name, #"Lynxemi Pte Ltd"#)
        XCTAssertEqual(CompanyIdentifier.lynxemiPte.description, #"Lynxemi Pte Ltd"#)
    
        // SENNHEISER electronic GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.sennheiserElectronic.rawValue, 1172)
        XCTAssertEqual(CompanyIdentifier.sennheiserElectronic.name, #"SENNHEISER electronic GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.sennheiserElectronic.description, #"SENNHEISER electronic GmbH & Co. KG"#)
    
        // LMT Mercer Group, Inc
        XCTAssertEqual(CompanyIdentifier.lmtMercerGroup.rawValue, 1173)
        XCTAssertEqual(CompanyIdentifier.lmtMercerGroup.name, #"LMT Mercer Group, Inc"#)
        XCTAssertEqual(CompanyIdentifier.lmtMercerGroup.description, #"LMT Mercer Group, Inc"#)
    
        // Polymorphic Labs LLC
        XCTAssertEqual(CompanyIdentifier.polymorphicLabs.rawValue, 1174)
        XCTAssertEqual(CompanyIdentifier.polymorphicLabs.name, #"Polymorphic Labs LLC"#)
        XCTAssertEqual(CompanyIdentifier.polymorphicLabs.description, #"Polymorphic Labs LLC"#)
    
        // Cochlear Limited
        XCTAssertEqual(CompanyIdentifier.cochlear.rawValue, 1175)
        XCTAssertEqual(CompanyIdentifier.cochlear.name, #"Cochlear Limited"#)
        XCTAssertEqual(CompanyIdentifier.cochlear.description, #"Cochlear Limited"#)
    
        // METER Group, Inc. USA
        XCTAssertEqual(CompanyIdentifier.meterGroup.rawValue, 1176)
        XCTAssertEqual(CompanyIdentifier.meterGroup.name, #"METER Group, Inc. USA"#)
        XCTAssertEqual(CompanyIdentifier.meterGroup.description, #"METER Group, Inc. USA"#)
    
        // Ruuvi Innovations Ltd.
        XCTAssertEqual(CompanyIdentifier.ruuviInnovations.rawValue, 1177)
        XCTAssertEqual(CompanyIdentifier.ruuviInnovations.name, #"Ruuvi Innovations Ltd."#)
        XCTAssertEqual(CompanyIdentifier.ruuviInnovations.description, #"Ruuvi Innovations Ltd."#)
    
        // Situne AS
        XCTAssertEqual(CompanyIdentifier.situne.rawValue, 1178)
        XCTAssertEqual(CompanyIdentifier.situne.name, #"Situne AS"#)
        XCTAssertEqual(CompanyIdentifier.situne.description, #"Situne AS"#)
    
        // nVisti, LLC
        XCTAssertEqual(CompanyIdentifier.nvisti.rawValue, 1179)
        XCTAssertEqual(CompanyIdentifier.nvisti.name, #"nVisti, LLC"#)
        XCTAssertEqual(CompanyIdentifier.nvisti.description, #"nVisti, LLC"#)
    
        // DyOcean
        XCTAssertEqual(CompanyIdentifier.dyocean.rawValue, 1180)
        XCTAssertEqual(CompanyIdentifier.dyocean.name, #"DyOcean"#)
        XCTAssertEqual(CompanyIdentifier.dyocean.description, #"DyOcean"#)
    
        // Uhlmann & Zacher GmbH
        XCTAssertEqual(CompanyIdentifier.uhlmannZacher.rawValue, 1181)
        XCTAssertEqual(CompanyIdentifier.uhlmannZacher.name, #"Uhlmann & Zacher GmbH"#)
        XCTAssertEqual(CompanyIdentifier.uhlmannZacher.description, #"Uhlmann & Zacher GmbH"#)
    
        // AND!XOR LLC
        XCTAssertEqual(CompanyIdentifier.andXor.rawValue, 1182)
        XCTAssertEqual(CompanyIdentifier.andXor.name, #"AND!XOR LLC"#)
        XCTAssertEqual(CompanyIdentifier.andXor.description, #"AND!XOR LLC"#)
    
        // tictote AB
        XCTAssertEqual(CompanyIdentifier.tictote.rawValue, 1183)
        XCTAssertEqual(CompanyIdentifier.tictote.name, #"tictote AB"#)
        XCTAssertEqual(CompanyIdentifier.tictote.description, #"tictote AB"#)
    
        // Vypin, LLC
        XCTAssertEqual(CompanyIdentifier.vypin.rawValue, 1184)
        XCTAssertEqual(CompanyIdentifier.vypin.name, #"Vypin, LLC"#)
        XCTAssertEqual(CompanyIdentifier.vypin.description, #"Vypin, LLC"#)
    
        // PNI Sensor Corporation
        XCTAssertEqual(CompanyIdentifier.pniSensor.rawValue, 1185)
        XCTAssertEqual(CompanyIdentifier.pniSensor.name, #"PNI Sensor Corporation"#)
        XCTAssertEqual(CompanyIdentifier.pniSensor.description, #"PNI Sensor Corporation"#)
    
        // ovrEngineered, LLC
        XCTAssertEqual(CompanyIdentifier.ovrengineered.rawValue, 1186)
        XCTAssertEqual(CompanyIdentifier.ovrengineered.name, #"ovrEngineered, LLC"#)
        XCTAssertEqual(CompanyIdentifier.ovrengineered.description, #"ovrEngineered, LLC"#)
    
        // GT-tronics HK Ltd
        XCTAssertEqual(CompanyIdentifier.gtTronics.rawValue, 1187)
        XCTAssertEqual(CompanyIdentifier.gtTronics.name, #"GT-tronics HK Ltd"#)
        XCTAssertEqual(CompanyIdentifier.gtTronics.description, #"GT-tronics HK Ltd"#)
    
        // Herbert Waldmann GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.herbertWaldmann.rawValue, 1188)
        XCTAssertEqual(CompanyIdentifier.herbertWaldmann.name, #"Herbert Waldmann GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.herbertWaldmann.description, #"Herbert Waldmann GmbH & Co. KG"#)
    
        // Guangzhou FiiO Electronics Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.guangzhouFiioElectronicsTechnology.rawValue, 1189)
        XCTAssertEqual(CompanyIdentifier.guangzhouFiioElectronicsTechnology.name, #"Guangzhou FiiO Electronics Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.guangzhouFiioElectronicsTechnology.description, #"Guangzhou FiiO Electronics Technology Co.,Ltd"#)
    
        // Vinetech Co., Ltd
        XCTAssertEqual(CompanyIdentifier.vinetech.rawValue, 1190)
        XCTAssertEqual(CompanyIdentifier.vinetech.name, #"Vinetech Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.vinetech.description, #"Vinetech Co., Ltd"#)
    
        // Dallas Logic Corporation
        XCTAssertEqual(CompanyIdentifier.dallasLogic.rawValue, 1191)
        XCTAssertEqual(CompanyIdentifier.dallasLogic.name, #"Dallas Logic Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dallasLogic.description, #"Dallas Logic Corporation"#)
    
        // BioTex, Inc.
        XCTAssertEqual(CompanyIdentifier.biotex.rawValue, 1192)
        XCTAssertEqual(CompanyIdentifier.biotex.name, #"BioTex, Inc."#)
        XCTAssertEqual(CompanyIdentifier.biotex.description, #"BioTex, Inc."#)
    
        // DISCOVERY SOUND TECHNOLOGY, LLC
        XCTAssertEqual(CompanyIdentifier.discoverySoundTechnology.rawValue, 1193)
        XCTAssertEqual(CompanyIdentifier.discoverySoundTechnology.name, #"DISCOVERY SOUND TECHNOLOGY, LLC"#)
        XCTAssertEqual(CompanyIdentifier.discoverySoundTechnology.description, #"DISCOVERY SOUND TECHNOLOGY, LLC"#)
    
        // LINKIO SAS
        XCTAssertEqual(CompanyIdentifier.linkios.rawValue, 1194)
        XCTAssertEqual(CompanyIdentifier.linkios.name, #"LINKIO SAS"#)
        XCTAssertEqual(CompanyIdentifier.linkios.description, #"LINKIO SAS"#)
    
        // Harbortronics, Inc.
        XCTAssertEqual(CompanyIdentifier.harbortronics.rawValue, 1195)
        XCTAssertEqual(CompanyIdentifier.harbortronics.name, #"Harbortronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.harbortronics.description, #"Harbortronics, Inc."#)
    
        // Undagrid B.V.
        XCTAssertEqual(CompanyIdentifier.undagrid.rawValue, 1196)
        XCTAssertEqual(CompanyIdentifier.undagrid.name, #"Undagrid B.V."#)
        XCTAssertEqual(CompanyIdentifier.undagrid.description, #"Undagrid B.V."#)
    
        // Shure Inc
        XCTAssertEqual(CompanyIdentifier.shure.rawValue, 1197)
        XCTAssertEqual(CompanyIdentifier.shure.name, #"Shure Inc"#)
        XCTAssertEqual(CompanyIdentifier.shure.description, #"Shure Inc"#)
    
        // ERM Electronic Systems LTD
        XCTAssertEqual(CompanyIdentifier.ermElectronicSystems.rawValue, 1198)
        XCTAssertEqual(CompanyIdentifier.ermElectronicSystems.name, #"ERM Electronic Systems LTD"#)
        XCTAssertEqual(CompanyIdentifier.ermElectronicSystems.description, #"ERM Electronic Systems LTD"#)
    
        // BIOROWER Handelsagentur GmbH
        XCTAssertEqual(CompanyIdentifier.biorowerHandelsagentur.rawValue, 1199)
        XCTAssertEqual(CompanyIdentifier.biorowerHandelsagentur.name, #"BIOROWER Handelsagentur GmbH"#)
        XCTAssertEqual(CompanyIdentifier.biorowerHandelsagentur.description, #"BIOROWER Handelsagentur GmbH"#)
    
        // Weba Sport und Med. Artikel GmbH
        XCTAssertEqual(CompanyIdentifier.webaSportUndMedArtikel.rawValue, 1200)
        XCTAssertEqual(CompanyIdentifier.webaSportUndMedArtikel.name, #"Weba Sport und Med. Artikel GmbH"#)
        XCTAssertEqual(CompanyIdentifier.webaSportUndMedArtikel.description, #"Weba Sport und Med. Artikel GmbH"#)
    
        // Kartographers Technologies Pvt. Ltd.
        XCTAssertEqual(CompanyIdentifier.kartographersTechnologies.rawValue, 1201)
        XCTAssertEqual(CompanyIdentifier.kartographersTechnologies.name, #"Kartographers Technologies Pvt. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.kartographersTechnologies.description, #"Kartographers Technologies Pvt. Ltd."#)
    
        // The Shadow on the Moon
        XCTAssertEqual(CompanyIdentifier.shadowOnMoon.rawValue, 1202)
        XCTAssertEqual(CompanyIdentifier.shadowOnMoon.name, #"The Shadow on the Moon"#)
        XCTAssertEqual(CompanyIdentifier.shadowOnMoon.description, #"The Shadow on the Moon"#)
    
        // mobike (Hong Kong) Limited
        XCTAssertEqual(CompanyIdentifier.mobikeHongKong.rawValue, 1203)
        XCTAssertEqual(CompanyIdentifier.mobikeHongKong.name, #"mobike (Hong Kong) Limited"#)
        XCTAssertEqual(CompanyIdentifier.mobikeHongKong.description, #"mobike (Hong Kong) Limited"#)
    
        // Inuheat Group AB
        XCTAssertEqual(CompanyIdentifier.inuheatGroup.rawValue, 1204)
        XCTAssertEqual(CompanyIdentifier.inuheatGroup.name, #"Inuheat Group AB"#)
        XCTAssertEqual(CompanyIdentifier.inuheatGroup.description, #"Inuheat Group AB"#)
    
        // Swiftronix AB
        XCTAssertEqual(CompanyIdentifier.swiftronix.rawValue, 1205)
        XCTAssertEqual(CompanyIdentifier.swiftronix.name, #"Swiftronix AB"#)
        XCTAssertEqual(CompanyIdentifier.swiftronix.description, #"Swiftronix AB"#)
    
        // Diagnoptics Technologies
        XCTAssertEqual(CompanyIdentifier.diagnopticsTechnologies.rawValue, 1206)
        XCTAssertEqual(CompanyIdentifier.diagnopticsTechnologies.name, #"Diagnoptics Technologies"#)
        XCTAssertEqual(CompanyIdentifier.diagnopticsTechnologies.description, #"Diagnoptics Technologies"#)
    
        // Analog Devices, Inc.
        XCTAssertEqual(CompanyIdentifier.analogDevices.rawValue, 1207)
        XCTAssertEqual(CompanyIdentifier.analogDevices.name, #"Analog Devices, Inc."#)
        XCTAssertEqual(CompanyIdentifier.analogDevices.description, #"Analog Devices, Inc."#)
    
        // Soraa Inc.
        XCTAssertEqual(CompanyIdentifier.soraa.rawValue, 1208)
        XCTAssertEqual(CompanyIdentifier.soraa.name, #"Soraa Inc."#)
        XCTAssertEqual(CompanyIdentifier.soraa.description, #"Soraa Inc."#)
    
        // CSR Building Products Limited
        XCTAssertEqual(CompanyIdentifier.csrBuildingProducts.rawValue, 1209)
        XCTAssertEqual(CompanyIdentifier.csrBuildingProducts.name, #"CSR Building Products Limited"#)
        XCTAssertEqual(CompanyIdentifier.csrBuildingProducts.description, #"CSR Building Products Limited"#)
    
        // Crestron Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.crestronElectronics.rawValue, 1210)
        XCTAssertEqual(CompanyIdentifier.crestronElectronics.name, #"Crestron Electronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.crestronElectronics.description, #"Crestron Electronics, Inc."#)
    
        // Neatebox Ltd
        XCTAssertEqual(CompanyIdentifier.neatebox.rawValue, 1211)
        XCTAssertEqual(CompanyIdentifier.neatebox.name, #"Neatebox Ltd"#)
        XCTAssertEqual(CompanyIdentifier.neatebox.description, #"Neatebox Ltd"#)
    
        // Draegerwerk AG & Co. KGaA
        XCTAssertEqual(CompanyIdentifier.draegerwerk.rawValue, 1212)
        XCTAssertEqual(CompanyIdentifier.draegerwerk.name, #"Draegerwerk AG & Co. KGaA"#)
        XCTAssertEqual(CompanyIdentifier.draegerwerk.description, #"Draegerwerk AG & Co. KGaA"#)
    
        // AlbynMedical
        XCTAssertEqual(CompanyIdentifier.albynmedical.rawValue, 1213)
        XCTAssertEqual(CompanyIdentifier.albynmedical.name, #"AlbynMedical"#)
        XCTAssertEqual(CompanyIdentifier.albynmedical.description, #"AlbynMedical"#)
    
        // Averos FZCO
        XCTAssertEqual(CompanyIdentifier.averos.rawValue, 1214)
        XCTAssertEqual(CompanyIdentifier.averos.name, #"Averos FZCO"#)
        XCTAssertEqual(CompanyIdentifier.averos.description, #"Averos FZCO"#)
    
        // VIT Initiative, LLC
        XCTAssertEqual(CompanyIdentifier.vitInitiative.rawValue, 1215)
        XCTAssertEqual(CompanyIdentifier.vitInitiative.name, #"VIT Initiative, LLC"#)
        XCTAssertEqual(CompanyIdentifier.vitInitiative.description, #"VIT Initiative, LLC"#)
    
        // Statsports International
        XCTAssertEqual(CompanyIdentifier.statsportsInternational.rawValue, 1216)
        XCTAssertEqual(CompanyIdentifier.statsportsInternational.name, #"Statsports International"#)
        XCTAssertEqual(CompanyIdentifier.statsportsInternational.description, #"Statsports International"#)
    
        // Sospitas, s.r.o.
        XCTAssertEqual(CompanyIdentifier.sospitas.rawValue, 1217)
        XCTAssertEqual(CompanyIdentifier.sospitas.name, #"Sospitas, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.sospitas.description, #"Sospitas, s.r.o."#)
    
        // Dmet Products Corp.
        XCTAssertEqual(CompanyIdentifier.dmetProducts.rawValue, 1218)
        XCTAssertEqual(CompanyIdentifier.dmetProducts.name, #"Dmet Products Corp."#)
        XCTAssertEqual(CompanyIdentifier.dmetProducts.description, #"Dmet Products Corp."#)
    
        // Mantracourt Electronics Limited
        XCTAssertEqual(CompanyIdentifier.mantracourtElectronics.rawValue, 1219)
        XCTAssertEqual(CompanyIdentifier.mantracourtElectronics.name, #"Mantracourt Electronics Limited"#)
        XCTAssertEqual(CompanyIdentifier.mantracourtElectronics.description, #"Mantracourt Electronics Limited"#)
    
        // TeAM Hutchins AB
        XCTAssertEqual(CompanyIdentifier.teamHutchins.rawValue, 1220)
        XCTAssertEqual(CompanyIdentifier.teamHutchins.name, #"TeAM Hutchins AB"#)
        XCTAssertEqual(CompanyIdentifier.teamHutchins.description, #"TeAM Hutchins AB"#)
    
        // Seibert Williams Glass, LLC
        XCTAssertEqual(CompanyIdentifier.seibertWilliamsGlass.rawValue, 1221)
        XCTAssertEqual(CompanyIdentifier.seibertWilliamsGlass.name, #"Seibert Williams Glass, LLC"#)
        XCTAssertEqual(CompanyIdentifier.seibertWilliamsGlass.description, #"Seibert Williams Glass, LLC"#)
    
        // Insta GmbH
        XCTAssertEqual(CompanyIdentifier.insta.rawValue, 1222)
        XCTAssertEqual(CompanyIdentifier.insta.name, #"Insta GmbH"#)
        XCTAssertEqual(CompanyIdentifier.insta.description, #"Insta GmbH"#)
    
        // Svantek Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.svantek.rawValue, 1223)
        XCTAssertEqual(CompanyIdentifier.svantek.name, #"Svantek Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.svantek.description, #"Svantek Sp. z o.o."#)
    
        // Shanghai Flyco Electrical Appliance Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiFlycoElectricalAppliance.rawValue, 1224)
        XCTAssertEqual(CompanyIdentifier.shanghaiFlycoElectricalAppliance.name, #"Shanghai Flyco Electrical Appliance Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiFlycoElectricalAppliance.description, #"Shanghai Flyco Electrical Appliance Co., Ltd."#)
    
        // Thornwave Labs Inc
        XCTAssertEqual(CompanyIdentifier.thornwaveLabs.rawValue, 1225)
        XCTAssertEqual(CompanyIdentifier.thornwaveLabs.name, #"Thornwave Labs Inc"#)
        XCTAssertEqual(CompanyIdentifier.thornwaveLabs.description, #"Thornwave Labs Inc"#)
    
        // Steiner-Optik GmbH
        XCTAssertEqual(CompanyIdentifier.steinerOptik.rawValue, 1226)
        XCTAssertEqual(CompanyIdentifier.steinerOptik.name, #"Steiner-Optik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.steinerOptik.description, #"Steiner-Optik GmbH"#)
    
        // Novo Nordisk A/S
        XCTAssertEqual(CompanyIdentifier.novoNordisk.rawValue, 1227)
        XCTAssertEqual(CompanyIdentifier.novoNordisk.name, #"Novo Nordisk A/S"#)
        XCTAssertEqual(CompanyIdentifier.novoNordisk.description, #"Novo Nordisk A/S"#)
    
        // Enflux Inc.
        XCTAssertEqual(CompanyIdentifier.enflux.rawValue, 1228)
        XCTAssertEqual(CompanyIdentifier.enflux.name, #"Enflux Inc."#)
        XCTAssertEqual(CompanyIdentifier.enflux.description, #"Enflux Inc."#)
    
        // Safetech Products LLC
        XCTAssertEqual(CompanyIdentifier.safetechProducts.rawValue, 1229)
        XCTAssertEqual(CompanyIdentifier.safetechProducts.name, #"Safetech Products LLC"#)
        XCTAssertEqual(CompanyIdentifier.safetechProducts.description, #"Safetech Products LLC"#)
    
        // GOOOLED S.R.L.
        XCTAssertEqual(CompanyIdentifier.goooled.rawValue, 1230)
        XCTAssertEqual(CompanyIdentifier.goooled.name, #"GOOOLED S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.goooled.description, #"GOOOLED S.R.L."#)
    
        // DOM Sicherheitstechnik GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.domSicherheitstechnik.rawValue, 1231)
        XCTAssertEqual(CompanyIdentifier.domSicherheitstechnik.name, #"DOM Sicherheitstechnik GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.domSicherheitstechnik.description, #"DOM Sicherheitstechnik GmbH & Co. KG"#)
    
        // Olympus Corporation
        XCTAssertEqual(CompanyIdentifier.olympus.rawValue, 1232)
        XCTAssertEqual(CompanyIdentifier.olympus.name, #"Olympus Corporation"#)
        XCTAssertEqual(CompanyIdentifier.olympus.description, #"Olympus Corporation"#)
    
        // KTS GmbH
        XCTAssertEqual(CompanyIdentifier.kts.rawValue, 1233)
        XCTAssertEqual(CompanyIdentifier.kts.name, #"KTS GmbH"#)
        XCTAssertEqual(CompanyIdentifier.kts.description, #"KTS GmbH"#)
    
        // Anloq Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.anloqTechnologies.rawValue, 1234)
        XCTAssertEqual(CompanyIdentifier.anloqTechnologies.name, #"Anloq Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.anloqTechnologies.description, #"Anloq Technologies Inc."#)
    
        // Queercon, Inc
        XCTAssertEqual(CompanyIdentifier.queercon.rawValue, 1235)
        XCTAssertEqual(CompanyIdentifier.queercon.name, #"Queercon, Inc"#)
        XCTAssertEqual(CompanyIdentifier.queercon.description, #"Queercon, Inc"#)
    
        // 5th Element Ltd
        XCTAssertEqual(CompanyIdentifier.company5ThElement.rawValue, 1236)
        XCTAssertEqual(CompanyIdentifier.company5ThElement.name, #"5th Element Ltd"#)
        XCTAssertEqual(CompanyIdentifier.company5ThElement.description, #"5th Element Ltd"#)
    
        // Gooee Limited
        XCTAssertEqual(CompanyIdentifier.gooee.rawValue, 1237)
        XCTAssertEqual(CompanyIdentifier.gooee.name, #"Gooee Limited"#)
        XCTAssertEqual(CompanyIdentifier.gooee.description, #"Gooee Limited"#)
    
        // LUGLOC LLC
        XCTAssertEqual(CompanyIdentifier.lugloc.rawValue, 1238)
        XCTAssertEqual(CompanyIdentifier.lugloc.name, #"LUGLOC LLC"#)
        XCTAssertEqual(CompanyIdentifier.lugloc.description, #"LUGLOC LLC"#)
    
        // Blincam, Inc.
        XCTAssertEqual(CompanyIdentifier.blincam.rawValue, 1239)
        XCTAssertEqual(CompanyIdentifier.blincam.name, #"Blincam, Inc."#)
        XCTAssertEqual(CompanyIdentifier.blincam.description, #"Blincam, Inc."#)
    
        // FUJIFILM Corporation
        XCTAssertEqual(CompanyIdentifier.fujifilm.rawValue, 1240)
        XCTAssertEqual(CompanyIdentifier.fujifilm.name, #"FUJIFILM Corporation"#)
        XCTAssertEqual(CompanyIdentifier.fujifilm.description, #"FUJIFILM Corporation"#)
    
        // RandMcNally
        XCTAssertEqual(CompanyIdentifier.randmcnally.rawValue, 1241)
        XCTAssertEqual(CompanyIdentifier.randmcnally.name, #"RandMcNally"#)
        XCTAssertEqual(CompanyIdentifier.randmcnally.description, #"RandMcNally"#)
    
        // Franceschi Marina snc
        XCTAssertEqual(CompanyIdentifier.franceschiMarinaSnc.rawValue, 1242)
        XCTAssertEqual(CompanyIdentifier.franceschiMarinaSnc.name, #"Franceschi Marina snc"#)
        XCTAssertEqual(CompanyIdentifier.franceschiMarinaSnc.description, #"Franceschi Marina snc"#)
    
        // Engineered Audio, LLC.
        XCTAssertEqual(CompanyIdentifier.engineeredAudio.rawValue, 1243)
        XCTAssertEqual(CompanyIdentifier.engineeredAudio.name, #"Engineered Audio, LLC."#)
        XCTAssertEqual(CompanyIdentifier.engineeredAudio.description, #"Engineered Audio, LLC."#)
    
        // IOTTIVE (OPC) PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.iottiveOpc.rawValue, 1244)
        XCTAssertEqual(CompanyIdentifier.iottiveOpc.name, #"IOTTIVE (OPC) PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.iottiveOpc.description, #"IOTTIVE (OPC) PRIVATE LIMITED"#)
    
        // 4MOD Technology
        XCTAssertEqual(CompanyIdentifier.company4ModTechnology.rawValue, 1245)
        XCTAssertEqual(CompanyIdentifier.company4ModTechnology.name, #"4MOD Technology"#)
        XCTAssertEqual(CompanyIdentifier.company4ModTechnology.description, #"4MOD Technology"#)
    
        // Lutron Electronics Co., Inc.
        XCTAssertEqual(CompanyIdentifier.lutronElectronics.rawValue, 1246)
        XCTAssertEqual(CompanyIdentifier.lutronElectronics.name, #"Lutron Electronics Co., Inc."#)
        XCTAssertEqual(CompanyIdentifier.lutronElectronics.description, #"Lutron Electronics Co., Inc."#)
    
        // Emerson
        XCTAssertEqual(CompanyIdentifier.emerson.rawValue, 1247)
        XCTAssertEqual(CompanyIdentifier.emerson.name, #"Emerson"#)
        XCTAssertEqual(CompanyIdentifier.emerson.description, #"Emerson"#)
    
        // Guardtec, Inc.
        XCTAssertEqual(CompanyIdentifier.guardtec.rawValue, 1248)
        XCTAssertEqual(CompanyIdentifier.guardtec.name, #"Guardtec, Inc."#)
        XCTAssertEqual(CompanyIdentifier.guardtec.description, #"Guardtec, Inc."#)
    
        // REACTEC LIMITED
        XCTAssertEqual(CompanyIdentifier.reactec.rawValue, 1249)
        XCTAssertEqual(CompanyIdentifier.reactec.name, #"REACTEC LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.reactec.description, #"REACTEC LIMITED"#)
    
        // EllieGrid
        XCTAssertEqual(CompanyIdentifier.elliegrid.rawValue, 1250)
        XCTAssertEqual(CompanyIdentifier.elliegrid.name, #"EllieGrid"#)
        XCTAssertEqual(CompanyIdentifier.elliegrid.description, #"EllieGrid"#)
    
        // Under Armour
        XCTAssertEqual(CompanyIdentifier.underArmour.rawValue, 1251)
        XCTAssertEqual(CompanyIdentifier.underArmour.name, #"Under Armour"#)
        XCTAssertEqual(CompanyIdentifier.underArmour.description, #"Under Armour"#)
    
        // Woodenshark
        XCTAssertEqual(CompanyIdentifier.woodenshark.rawValue, 1252)
        XCTAssertEqual(CompanyIdentifier.woodenshark.name, #"Woodenshark"#)
        XCTAssertEqual(CompanyIdentifier.woodenshark.description, #"Woodenshark"#)
    
        // Avack Oy
        XCTAssertEqual(CompanyIdentifier.avack.rawValue, 1253)
        XCTAssertEqual(CompanyIdentifier.avack.name, #"Avack Oy"#)
        XCTAssertEqual(CompanyIdentifier.avack.description, #"Avack Oy"#)
    
        // Smart Solution Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.smartSolutionTechnology.rawValue, 1254)
        XCTAssertEqual(CompanyIdentifier.smartSolutionTechnology.name, #"Smart Solution Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.smartSolutionTechnology.description, #"Smart Solution Technology, Inc."#)
    
        // REHABTRONICS INC.
        XCTAssertEqual(CompanyIdentifier.rehabtronics.rawValue, 1255)
        XCTAssertEqual(CompanyIdentifier.rehabtronics.name, #"REHABTRONICS INC."#)
        XCTAssertEqual(CompanyIdentifier.rehabtronics.description, #"REHABTRONICS INC."#)
    
        // STABILO International
        XCTAssertEqual(CompanyIdentifier.stabiloInternational.rawValue, 1256)
        XCTAssertEqual(CompanyIdentifier.stabiloInternational.name, #"STABILO International"#)
        XCTAssertEqual(CompanyIdentifier.stabiloInternational.description, #"STABILO International"#)
    
        // Busch Jaeger Elektro GmbH
        XCTAssertEqual(CompanyIdentifier.buschJaegerElektro.rawValue, 1257)
        XCTAssertEqual(CompanyIdentifier.buschJaegerElektro.name, #"Busch Jaeger Elektro GmbH"#)
        XCTAssertEqual(CompanyIdentifier.buschJaegerElektro.description, #"Busch Jaeger Elektro GmbH"#)
    
        // Pacific Bioscience Laboratories, Inc
        XCTAssertEqual(CompanyIdentifier.pacificBioscienceLaboratories.rawValue, 1258)
        XCTAssertEqual(CompanyIdentifier.pacificBioscienceLaboratories.name, #"Pacific Bioscience Laboratories, Inc"#)
        XCTAssertEqual(CompanyIdentifier.pacificBioscienceLaboratories.description, #"Pacific Bioscience Laboratories, Inc"#)
    
        // Bird Home Automation GmbH
        XCTAssertEqual(CompanyIdentifier.birdHomeAutomation.rawValue, 1259)
        XCTAssertEqual(CompanyIdentifier.birdHomeAutomation.name, #"Bird Home Automation GmbH"#)
        XCTAssertEqual(CompanyIdentifier.birdHomeAutomation.description, #"Bird Home Automation GmbH"#)
    
        // Motorola Solutions
        XCTAssertEqual(CompanyIdentifier.motorolaSolutions.rawValue, 1260)
        XCTAssertEqual(CompanyIdentifier.motorolaSolutions.name, #"Motorola Solutions"#)
        XCTAssertEqual(CompanyIdentifier.motorolaSolutions.description, #"Motorola Solutions"#)
    
        // R9 Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.r9Technology.rawValue, 1261)
        XCTAssertEqual(CompanyIdentifier.r9Technology.name, #"R9 Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.r9Technology.description, #"R9 Technology, Inc."#)
    
        // Auxivia
        XCTAssertEqual(CompanyIdentifier.auxivia.rawValue, 1262)
        XCTAssertEqual(CompanyIdentifier.auxivia.name, #"Auxivia"#)
        XCTAssertEqual(CompanyIdentifier.auxivia.description, #"Auxivia"#)
    
        // DaisyWorks, Inc
        XCTAssertEqual(CompanyIdentifier.daisyworks.rawValue, 1263)
        XCTAssertEqual(CompanyIdentifier.daisyworks.name, #"DaisyWorks, Inc"#)
        XCTAssertEqual(CompanyIdentifier.daisyworks.description, #"DaisyWorks, Inc"#)
    
        // Kosi Limited
        XCTAssertEqual(CompanyIdentifier.kosi.rawValue, 1264)
        XCTAssertEqual(CompanyIdentifier.kosi.name, #"Kosi Limited"#)
        XCTAssertEqual(CompanyIdentifier.kosi.description, #"Kosi Limited"#)
    
        // Theben AG
        XCTAssertEqual(CompanyIdentifier.theben.rawValue, 1265)
        XCTAssertEqual(CompanyIdentifier.theben.name, #"Theben AG"#)
        XCTAssertEqual(CompanyIdentifier.theben.description, #"Theben AG"#)
    
        // InDreamer Techsol Private Limited
        XCTAssertEqual(CompanyIdentifier.indreamerTechsol.rawValue, 1266)
        XCTAssertEqual(CompanyIdentifier.indreamerTechsol.name, #"InDreamer Techsol Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.indreamerTechsol.description, #"InDreamer Techsol Private Limited"#)
    
        // Cerevast Medical
        XCTAssertEqual(CompanyIdentifier.cerevastMedical.rawValue, 1267)
        XCTAssertEqual(CompanyIdentifier.cerevastMedical.name, #"Cerevast Medical"#)
        XCTAssertEqual(CompanyIdentifier.cerevastMedical.description, #"Cerevast Medical"#)
    
        // ZanCompute Inc.
        XCTAssertEqual(CompanyIdentifier.zancompute.rawValue, 1268)
        XCTAssertEqual(CompanyIdentifier.zancompute.name, #"ZanCompute Inc."#)
        XCTAssertEqual(CompanyIdentifier.zancompute.description, #"ZanCompute Inc."#)
    
        // Pirelli Tyre S.P.A.
        XCTAssertEqual(CompanyIdentifier.pirelliTyre.rawValue, 1269)
        XCTAssertEqual(CompanyIdentifier.pirelliTyre.name, #"Pirelli Tyre S.P.A."#)
        XCTAssertEqual(CompanyIdentifier.pirelliTyre.description, #"Pirelli Tyre S.P.A."#)
    
        // McLear Limited
        XCTAssertEqual(CompanyIdentifier.mclear.rawValue, 1270)
        XCTAssertEqual(CompanyIdentifier.mclear.name, #"McLear Limited"#)
        XCTAssertEqual(CompanyIdentifier.mclear.description, #"McLear Limited"#)
    
        // Shenzhen Huiding Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenHuidingTechnology.rawValue, 1271)
        XCTAssertEqual(CompanyIdentifier.shenzhenHuidingTechnology.name, #"Shenzhen Huiding Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenHuidingTechnology.description, #"Shenzhen Huiding Technology Co.,Ltd."#)
    
        // Convergence Systems Limited
        XCTAssertEqual(CompanyIdentifier.convergenceSystems.rawValue, 1272)
        XCTAssertEqual(CompanyIdentifier.convergenceSystems.name, #"Convergence Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.convergenceSystems.description, #"Convergence Systems Limited"#)
    
        // Interactio
        XCTAssertEqual(CompanyIdentifier.interactio.rawValue, 1273)
        XCTAssertEqual(CompanyIdentifier.interactio.name, #"Interactio"#)
        XCTAssertEqual(CompanyIdentifier.interactio.description, #"Interactio"#)
    
        // Androtec GmbH
        XCTAssertEqual(CompanyIdentifier.androtec.rawValue, 1274)
        XCTAssertEqual(CompanyIdentifier.androtec.name, #"Androtec GmbH"#)
        XCTAssertEqual(CompanyIdentifier.androtec.description, #"Androtec GmbH"#)
    
        // Benchmark Drives GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.benchmarkDrives.rawValue, 1275)
        XCTAssertEqual(CompanyIdentifier.benchmarkDrives.name, #"Benchmark Drives GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.benchmarkDrives.description, #"Benchmark Drives GmbH & Co. KG"#)
    
        // SwingLync L. L. C.
        XCTAssertEqual(CompanyIdentifier.swinglyncLLC.rawValue, 1276)
        XCTAssertEqual(CompanyIdentifier.swinglyncLLC.name, #"SwingLync L. L. C."#)
        XCTAssertEqual(CompanyIdentifier.swinglyncLLC.description, #"SwingLync L. L. C."#)
    
        // Tapkey GmbH
        XCTAssertEqual(CompanyIdentifier.tapkey.rawValue, 1277)
        XCTAssertEqual(CompanyIdentifier.tapkey.name, #"Tapkey GmbH"#)
        XCTAssertEqual(CompanyIdentifier.tapkey.description, #"Tapkey GmbH"#)
    
        // Woosim Systems Inc.
        XCTAssertEqual(CompanyIdentifier.woosimSystems.rawValue, 1278)
        XCTAssertEqual(CompanyIdentifier.woosimSystems.name, #"Woosim Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.woosimSystems.description, #"Woosim Systems Inc."#)
    
        // Microsemi Corporation
        XCTAssertEqual(CompanyIdentifier.microsemi.rawValue, 1279)
        XCTAssertEqual(CompanyIdentifier.microsemi.name, #"Microsemi Corporation"#)
        XCTAssertEqual(CompanyIdentifier.microsemi.description, #"Microsemi Corporation"#)
    
        // Wiliot LTD.
        XCTAssertEqual(CompanyIdentifier.wiliot.rawValue, 1280)
        XCTAssertEqual(CompanyIdentifier.wiliot.name, #"Wiliot LTD."#)
        XCTAssertEqual(CompanyIdentifier.wiliot.description, #"Wiliot LTD."#)
    
        // Polaris IND
        XCTAssertEqual(CompanyIdentifier.polarisInd.rawValue, 1281)
        XCTAssertEqual(CompanyIdentifier.polarisInd.name, #"Polaris IND"#)
        XCTAssertEqual(CompanyIdentifier.polarisInd.description, #"Polaris IND"#)
    
        // Specifi-Kali LLC
        XCTAssertEqual(CompanyIdentifier.specifiKali.rawValue, 1282)
        XCTAssertEqual(CompanyIdentifier.specifiKali.name, #"Specifi-Kali LLC"#)
        XCTAssertEqual(CompanyIdentifier.specifiKali.description, #"Specifi-Kali LLC"#)
    
        // Locoroll, Inc
        XCTAssertEqual(CompanyIdentifier.locoroll.rawValue, 1283)
        XCTAssertEqual(CompanyIdentifier.locoroll.name, #"Locoroll, Inc"#)
        XCTAssertEqual(CompanyIdentifier.locoroll.description, #"Locoroll, Inc"#)
    
        // PHYPLUS Inc
        XCTAssertEqual(CompanyIdentifier.phyplus.rawValue, 1284)
        XCTAssertEqual(CompanyIdentifier.phyplus.name, #"PHYPLUS Inc"#)
        XCTAssertEqual(CompanyIdentifier.phyplus.description, #"PHYPLUS Inc"#)
    
        // InPlay, Inc.
        XCTAssertEqual(CompanyIdentifier.inplay.rawValue, 1285)
        XCTAssertEqual(CompanyIdentifier.inplay.name, #"InPlay, Inc."#)
        XCTAssertEqual(CompanyIdentifier.inplay.description, #"InPlay, Inc."#)
    
        // Hager
        XCTAssertEqual(CompanyIdentifier.hager.rawValue, 1286)
        XCTAssertEqual(CompanyIdentifier.hager.name, #"Hager"#)
        XCTAssertEqual(CompanyIdentifier.hager.description, #"Hager"#)
    
        // Yellowcog
        XCTAssertEqual(CompanyIdentifier.yellowcog.rawValue, 1287)
        XCTAssertEqual(CompanyIdentifier.yellowcog.name, #"Yellowcog"#)
        XCTAssertEqual(CompanyIdentifier.yellowcog.description, #"Yellowcog"#)
    
        // Axes System sp. z o. o.
        XCTAssertEqual(CompanyIdentifier.axesSystemSpZOO.rawValue, 1288)
        XCTAssertEqual(CompanyIdentifier.axesSystemSpZOO.name, #"Axes System sp. z o. o."#)
        XCTAssertEqual(CompanyIdentifier.axesSystemSpZOO.description, #"Axes System sp. z o. o."#)
    
        // myLIFTER Inc.
        XCTAssertEqual(CompanyIdentifier.mylifter.rawValue, 1289)
        XCTAssertEqual(CompanyIdentifier.mylifter.name, #"myLIFTER Inc."#)
        XCTAssertEqual(CompanyIdentifier.mylifter.description, #"myLIFTER Inc."#)
    
        // Shake-on B.V.
        XCTAssertEqual(CompanyIdentifier.shakeOn.rawValue, 1290)
        XCTAssertEqual(CompanyIdentifier.shakeOn.name, #"Shake-on B.V."#)
        XCTAssertEqual(CompanyIdentifier.shakeOn.description, #"Shake-on B.V."#)
    
        // Vibrissa Inc.
        XCTAssertEqual(CompanyIdentifier.vibrissa.rawValue, 1291)
        XCTAssertEqual(CompanyIdentifier.vibrissa.name, #"Vibrissa Inc."#)
        XCTAssertEqual(CompanyIdentifier.vibrissa.description, #"Vibrissa Inc."#)
    
        // OSRAM GmbH
        XCTAssertEqual(CompanyIdentifier.osram.rawValue, 1292)
        XCTAssertEqual(CompanyIdentifier.osram.name, #"OSRAM GmbH"#)
        XCTAssertEqual(CompanyIdentifier.osram.description, #"OSRAM GmbH"#)
    
        // TRSystems GmbH
        XCTAssertEqual(CompanyIdentifier.trsystems.rawValue, 1293)
        XCTAssertEqual(CompanyIdentifier.trsystems.name, #"TRSystems GmbH"#)
        XCTAssertEqual(CompanyIdentifier.trsystems.description, #"TRSystems GmbH"#)
    
        // Yichip Microelectronics (Hangzhou) Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.yichipMicroelectronicsHangzhou.rawValue, 1294)
        XCTAssertEqual(CompanyIdentifier.yichipMicroelectronicsHangzhou.name, #"Yichip Microelectronics (Hangzhou) Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.yichipMicroelectronicsHangzhou.description, #"Yichip Microelectronics (Hangzhou) Co.,Ltd."#)
    
        // Foundation Engineering LLC
        XCTAssertEqual(CompanyIdentifier.foundationEngineering.rawValue, 1295)
        XCTAssertEqual(CompanyIdentifier.foundationEngineering.name, #"Foundation Engineering LLC"#)
        XCTAssertEqual(CompanyIdentifier.foundationEngineering.description, #"Foundation Engineering LLC"#)
    
        // UNI-ELECTRONICS, INC.
        XCTAssertEqual(CompanyIdentifier.uniElectronics.rawValue, 1296)
        XCTAssertEqual(CompanyIdentifier.uniElectronics.name, #"UNI-ELECTRONICS, INC."#)
        XCTAssertEqual(CompanyIdentifier.uniElectronics.description, #"UNI-ELECTRONICS, INC."#)
    
        // Brookfield Equinox LLC
        XCTAssertEqual(CompanyIdentifier.brookfieldEquinox.rawValue, 1297)
        XCTAssertEqual(CompanyIdentifier.brookfieldEquinox.name, #"Brookfield Equinox LLC"#)
        XCTAssertEqual(CompanyIdentifier.brookfieldEquinox.description, #"Brookfield Equinox LLC"#)
    
        // Soprod SA
        XCTAssertEqual(CompanyIdentifier.soprod.rawValue, 1298)
        XCTAssertEqual(CompanyIdentifier.soprod.name, #"Soprod SA"#)
        XCTAssertEqual(CompanyIdentifier.soprod.description, #"Soprod SA"#)
    
        // 9974091 Canada Inc.
        XCTAssertEqual(CompanyIdentifier.company9974091Canada.rawValue, 1299)
        XCTAssertEqual(CompanyIdentifier.company9974091Canada.name, #"9974091 Canada Inc."#)
        XCTAssertEqual(CompanyIdentifier.company9974091Canada.description, #"9974091 Canada Inc."#)
    
        // FIBRO GmbH
        XCTAssertEqual(CompanyIdentifier.fibro.rawValue, 1300)
        XCTAssertEqual(CompanyIdentifier.fibro.name, #"FIBRO GmbH"#)
        XCTAssertEqual(CompanyIdentifier.fibro.description, #"FIBRO GmbH"#)
    
        // RB Controls Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.rbControls.rawValue, 1301)
        XCTAssertEqual(CompanyIdentifier.rbControls.name, #"RB Controls Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.rbControls.description, #"RB Controls Co., Ltd."#)
    
        // Footmarks
        XCTAssertEqual(CompanyIdentifier.footmarks.rawValue, 1302)
        XCTAssertEqual(CompanyIdentifier.footmarks.name, #"Footmarks"#)
        XCTAssertEqual(CompanyIdentifier.footmarks.description, #"Footmarks"#)
    
        // Amtronic Sverige AB (formerly Amcore AB)
        XCTAssertEqual(CompanyIdentifier.amtronicSverige.rawValue, 1303)
        XCTAssertEqual(CompanyIdentifier.amtronicSverige.name, #"Amtronic Sverige AB (formerly Amcore AB)"#)
        XCTAssertEqual(CompanyIdentifier.amtronicSverige.description, #"Amtronic Sverige AB (formerly Amcore AB)"#)
    
        // MAMORIO.inc
        XCTAssertEqual(CompanyIdentifier.mamorioInc.rawValue, 1304)
        XCTAssertEqual(CompanyIdentifier.mamorioInc.name, #"MAMORIO.inc"#)
        XCTAssertEqual(CompanyIdentifier.mamorioInc.description, #"MAMORIO.inc"#)
    
        // Tyto Life LLC
        XCTAssertEqual(CompanyIdentifier.tytoLife.rawValue, 1305)
        XCTAssertEqual(CompanyIdentifier.tytoLife.name, #"Tyto Life LLC"#)
        XCTAssertEqual(CompanyIdentifier.tytoLife.description, #"Tyto Life LLC"#)
    
        // Leica Camera AG
        XCTAssertEqual(CompanyIdentifier.leicaCamera.rawValue, 1306)
        XCTAssertEqual(CompanyIdentifier.leicaCamera.name, #"Leica Camera AG"#)
        XCTAssertEqual(CompanyIdentifier.leicaCamera.description, #"Leica Camera AG"#)
    
        // Angee Technologies Ltd.
        XCTAssertEqual(CompanyIdentifier.angeeTechnologies.rawValue, 1307)
        XCTAssertEqual(CompanyIdentifier.angeeTechnologies.name, #"Angee Technologies Ltd."#)
        XCTAssertEqual(CompanyIdentifier.angeeTechnologies.description, #"Angee Technologies Ltd."#)
    
        // EDPS
        XCTAssertEqual(CompanyIdentifier.edps.rawValue, 1308)
        XCTAssertEqual(CompanyIdentifier.edps.name, #"EDPS"#)
        XCTAssertEqual(CompanyIdentifier.edps.description, #"EDPS"#)
    
        // OFF Line Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.offLine.rawValue, 1309)
        XCTAssertEqual(CompanyIdentifier.offLine.name, #"OFF Line Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.offLine.description, #"OFF Line Co., Ltd."#)
    
        // Detect Blue Limited
        XCTAssertEqual(CompanyIdentifier.detectBlue.rawValue, 1310)
        XCTAssertEqual(CompanyIdentifier.detectBlue.name, #"Detect Blue Limited"#)
        XCTAssertEqual(CompanyIdentifier.detectBlue.description, #"Detect Blue Limited"#)
    
        // Setec Pty Ltd
        XCTAssertEqual(CompanyIdentifier.setecPty.rawValue, 1311)
        XCTAssertEqual(CompanyIdentifier.setecPty.name, #"Setec Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.setecPty.description, #"Setec Pty Ltd"#)
    
        // Target Corporation
        XCTAssertEqual(CompanyIdentifier.target.rawValue, 1312)
        XCTAssertEqual(CompanyIdentifier.target.name, #"Target Corporation"#)
        XCTAssertEqual(CompanyIdentifier.target.description, #"Target Corporation"#)
    
        // IAI Corporation
        XCTAssertEqual(CompanyIdentifier.iai.rawValue, 1313)
        XCTAssertEqual(CompanyIdentifier.iai.name, #"IAI Corporation"#)
        XCTAssertEqual(CompanyIdentifier.iai.description, #"IAI Corporation"#)
    
        // NS Tech, Inc.
        XCTAssertEqual(CompanyIdentifier.nsTech.rawValue, 1314)
        XCTAssertEqual(CompanyIdentifier.nsTech.name, #"NS Tech, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nsTech.description, #"NS Tech, Inc."#)
    
        // MTG Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.mtg.rawValue, 1315)
        XCTAssertEqual(CompanyIdentifier.mtg.name, #"MTG Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.mtg.description, #"MTG Co., Ltd."#)
    
        // Hangzhou iMagic Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.hangzhouImagicTechnology.rawValue, 1316)
        XCTAssertEqual(CompanyIdentifier.hangzhouImagicTechnology.name, #"Hangzhou iMagic Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hangzhouImagicTechnology.description, #"Hangzhou iMagic Technology Co., Ltd"#)
    
        // HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED
        XCTAssertEqual(CompanyIdentifier.hongkongNanoIcTechnologies.rawValue, 1317)
        XCTAssertEqual(CompanyIdentifier.hongkongNanoIcTechnologies.name, #"HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.hongkongNanoIcTechnologies.description, #"HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED"#)
    
        // Honeywell International Inc.
        XCTAssertEqual(CompanyIdentifier.honeywellInternational.rawValue, 1318)
        XCTAssertEqual(CompanyIdentifier.honeywellInternational.name, #"Honeywell International Inc."#)
        XCTAssertEqual(CompanyIdentifier.honeywellInternational.description, #"Honeywell International Inc."#)
    
        // Albrecht JUNG
        XCTAssertEqual(CompanyIdentifier.albrechtJung.rawValue, 1319)
        XCTAssertEqual(CompanyIdentifier.albrechtJung.name, #"Albrecht JUNG"#)
        XCTAssertEqual(CompanyIdentifier.albrechtJung.description, #"Albrecht JUNG"#)
    
        // Lunera Lighting Inc.
        XCTAssertEqual(CompanyIdentifier.luneraLighting.rawValue, 1320)
        XCTAssertEqual(CompanyIdentifier.luneraLighting.name, #"Lunera Lighting Inc."#)
        XCTAssertEqual(CompanyIdentifier.luneraLighting.description, #"Lunera Lighting Inc."#)
    
        // Lumen UAB
        XCTAssertEqual(CompanyIdentifier.lumenUab.rawValue, 1321)
        XCTAssertEqual(CompanyIdentifier.lumenUab.name, #"Lumen UAB"#)
        XCTAssertEqual(CompanyIdentifier.lumenUab.description, #"Lumen UAB"#)
    
        // Keynes Controls Ltd
        XCTAssertEqual(CompanyIdentifier.keynesControls.rawValue, 1322)
        XCTAssertEqual(CompanyIdentifier.keynesControls.name, #"Keynes Controls Ltd"#)
        XCTAssertEqual(CompanyIdentifier.keynesControls.description, #"Keynes Controls Ltd"#)
    
        // Novartis AG
        XCTAssertEqual(CompanyIdentifier.novartis.rawValue, 1323)
        XCTAssertEqual(CompanyIdentifier.novartis.name, #"Novartis AG"#)
        XCTAssertEqual(CompanyIdentifier.novartis.description, #"Novartis AG"#)
    
        // Geosatis SA
        XCTAssertEqual(CompanyIdentifier.geosatis.rawValue, 1324)
        XCTAssertEqual(CompanyIdentifier.geosatis.name, #"Geosatis SA"#)
        XCTAssertEqual(CompanyIdentifier.geosatis.description, #"Geosatis SA"#)
    
        // EXFO, Inc.
        XCTAssertEqual(CompanyIdentifier.exfo.rawValue, 1325)
        XCTAssertEqual(CompanyIdentifier.exfo.name, #"EXFO, Inc."#)
        XCTAssertEqual(CompanyIdentifier.exfo.description, #"EXFO, Inc."#)
    
        // LEDVANCE GmbH
        XCTAssertEqual(CompanyIdentifier.ledvance.rawValue, 1326)
        XCTAssertEqual(CompanyIdentifier.ledvance.name, #"LEDVANCE GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ledvance.description, #"LEDVANCE GmbH"#)
    
        // Center ID Corp.
        XCTAssertEqual(CompanyIdentifier.centerId.rawValue, 1327)
        XCTAssertEqual(CompanyIdentifier.centerId.name, #"Center ID Corp."#)
        XCTAssertEqual(CompanyIdentifier.centerId.description, #"Center ID Corp."#)
    
        // Adolene, Inc.
        XCTAssertEqual(CompanyIdentifier.adolene.rawValue, 1328)
        XCTAssertEqual(CompanyIdentifier.adolene.name, #"Adolene, Inc."#)
        XCTAssertEqual(CompanyIdentifier.adolene.description, #"Adolene, Inc."#)
    
        // D&M Holdings Inc.
        XCTAssertEqual(CompanyIdentifier.dMHoldings.rawValue, 1329)
        XCTAssertEqual(CompanyIdentifier.dMHoldings.name, #"D&M Holdings Inc."#)
        XCTAssertEqual(CompanyIdentifier.dMHoldings.description, #"D&M Holdings Inc."#)
    
        // CRESCO Wireless, Inc.
        XCTAssertEqual(CompanyIdentifier.crescoWireless.rawValue, 1330)
        XCTAssertEqual(CompanyIdentifier.crescoWireless.name, #"CRESCO Wireless, Inc."#)
        XCTAssertEqual(CompanyIdentifier.crescoWireless.description, #"CRESCO Wireless, Inc."#)
    
        // Nura Operations Pty Ltd
        XCTAssertEqual(CompanyIdentifier.nuraOperationsPty.rawValue, 1331)
        XCTAssertEqual(CompanyIdentifier.nuraOperationsPty.name, #"Nura Operations Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.nuraOperationsPty.description, #"Nura Operations Pty Ltd"#)
    
        // Frontiergadget, Inc.
        XCTAssertEqual(CompanyIdentifier.frontiergadget.rawValue, 1332)
        XCTAssertEqual(CompanyIdentifier.frontiergadget.name, #"Frontiergadget, Inc."#)
        XCTAssertEqual(CompanyIdentifier.frontiergadget.description, #"Frontiergadget, Inc."#)
    
        // Smart Component Technologies Limited
        XCTAssertEqual(CompanyIdentifier.smartComponentTechnologies.rawValue, 1333)
        XCTAssertEqual(CompanyIdentifier.smartComponentTechnologies.name, #"Smart Component Technologies Limited"#)
        XCTAssertEqual(CompanyIdentifier.smartComponentTechnologies.description, #"Smart Component Technologies Limited"#)
    
        // ZTR Control Systems LLC
        XCTAssertEqual(CompanyIdentifier.ztrControlSystems.rawValue, 1334)
        XCTAssertEqual(CompanyIdentifier.ztrControlSystems.name, #"ZTR Control Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.ztrControlSystems.description, #"ZTR Control Systems LLC"#)
    
        // MetaLogics Corporation
        XCTAssertEqual(CompanyIdentifier.metalogics.rawValue, 1335)
        XCTAssertEqual(CompanyIdentifier.metalogics.name, #"MetaLogics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.metalogics.description, #"MetaLogics Corporation"#)
    
        // Medela AG
        XCTAssertEqual(CompanyIdentifier.medela2.rawValue, 1336)
        XCTAssertEqual(CompanyIdentifier.medela2.name, #"Medela AG"#)
        XCTAssertEqual(CompanyIdentifier.medela2.description, #"Medela AG"#)
    
        // OPPLE Lighting Co., Ltd
        XCTAssertEqual(CompanyIdentifier.oppleLighting.rawValue, 1337)
        XCTAssertEqual(CompanyIdentifier.oppleLighting.name, #"OPPLE Lighting Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.oppleLighting.description, #"OPPLE Lighting Co., Ltd"#)
    
        // Savitech Corp.,
        XCTAssertEqual(CompanyIdentifier.savitech.rawValue, 1338)
        XCTAssertEqual(CompanyIdentifier.savitech.name, #"Savitech Corp.,"#)
        XCTAssertEqual(CompanyIdentifier.savitech.description, #"Savitech Corp.,"#)
    
        // prodigy
        XCTAssertEqual(CompanyIdentifier.prodigy.rawValue, 1339)
        XCTAssertEqual(CompanyIdentifier.prodigy.name, #"prodigy"#)
        XCTAssertEqual(CompanyIdentifier.prodigy.description, #"prodigy"#)
    
        // Screenovate Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.screenovateTechnologies.rawValue, 1340)
        XCTAssertEqual(CompanyIdentifier.screenovateTechnologies.name, #"Screenovate Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.screenovateTechnologies.description, #"Screenovate Technologies Ltd"#)
    
        // TESA SA
        XCTAssertEqual(CompanyIdentifier.tesa.rawValue, 1341)
        XCTAssertEqual(CompanyIdentifier.tesa.name, #"TESA SA"#)
        XCTAssertEqual(CompanyIdentifier.tesa.description, #"TESA SA"#)
    
        // CLIM8 LIMITED
        XCTAssertEqual(CompanyIdentifier.clim8.rawValue, 1342)
        XCTAssertEqual(CompanyIdentifier.clim8.name, #"CLIM8 LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.clim8.description, #"CLIM8 LIMITED"#)
    
        // Silergy Corp
        XCTAssertEqual(CompanyIdentifier.silergy.rawValue, 1343)
        XCTAssertEqual(CompanyIdentifier.silergy.name, #"Silergy Corp"#)
        XCTAssertEqual(CompanyIdentifier.silergy.description, #"Silergy Corp"#)
    
        // SilverPlus, Inc
        XCTAssertEqual(CompanyIdentifier.silverplus.rawValue, 1344)
        XCTAssertEqual(CompanyIdentifier.silverplus.name, #"SilverPlus, Inc"#)
        XCTAssertEqual(CompanyIdentifier.silverplus.description, #"SilverPlus, Inc"#)
    
        // Sharknet srl
        XCTAssertEqual(CompanyIdentifier.sharknet.rawValue, 1345)
        XCTAssertEqual(CompanyIdentifier.sharknet.name, #"Sharknet srl"#)
        XCTAssertEqual(CompanyIdentifier.sharknet.description, #"Sharknet srl"#)
    
        // Mist Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.mistSystems.rawValue, 1346)
        XCTAssertEqual(CompanyIdentifier.mistSystems.name, #"Mist Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mistSystems.description, #"Mist Systems, Inc."#)
    
        // MIWA LOCK CO.,Ltd
        XCTAssertEqual(CompanyIdentifier.miwaLock.rawValue, 1347)
        XCTAssertEqual(CompanyIdentifier.miwaLock.name, #"MIWA LOCK CO.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.miwaLock.description, #"MIWA LOCK CO.,Ltd"#)
    
        // OrthoSensor, Inc.
        XCTAssertEqual(CompanyIdentifier.orthosensor.rawValue, 1348)
        XCTAssertEqual(CompanyIdentifier.orthosensor.name, #"OrthoSensor, Inc."#)
        XCTAssertEqual(CompanyIdentifier.orthosensor.description, #"OrthoSensor, Inc."#)
    
        // Candy Hoover Group s.r.l
        XCTAssertEqual(CompanyIdentifier.candyHooverGroupSRL.rawValue, 1349)
        XCTAssertEqual(CompanyIdentifier.candyHooverGroupSRL.name, #"Candy Hoover Group s.r.l"#)
        XCTAssertEqual(CompanyIdentifier.candyHooverGroupSRL.description, #"Candy Hoover Group s.r.l"#)
    
        // Apexar Technologies S.A.
        XCTAssertEqual(CompanyIdentifier.apexarTechnologies.rawValue, 1350)
        XCTAssertEqual(CompanyIdentifier.apexarTechnologies.name, #"Apexar Technologies S.A."#)
        XCTAssertEqual(CompanyIdentifier.apexarTechnologies.description, #"Apexar Technologies S.A."#)
    
        // LOGICDATA d.o.o.
        XCTAssertEqual(CompanyIdentifier.logicdata.rawValue, 1351)
        XCTAssertEqual(CompanyIdentifier.logicdata.name, #"LOGICDATA d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.logicdata.description, #"LOGICDATA d.o.o."#)
    
        // Knick Elektronische Messgeraete GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.knickElektronischeMessgeraete.rawValue, 1352)
        XCTAssertEqual(CompanyIdentifier.knickElektronischeMessgeraete.name, #"Knick Elektronische Messgeraete GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.knickElektronischeMessgeraete.description, #"Knick Elektronische Messgeraete GmbH & Co. KG"#)
    
        // Smart Technologies and Investment Limited
        XCTAssertEqual(CompanyIdentifier.smartTechnologiesAndInvestment.rawValue, 1353)
        XCTAssertEqual(CompanyIdentifier.smartTechnologiesAndInvestment.name, #"Smart Technologies and Investment Limited"#)
        XCTAssertEqual(CompanyIdentifier.smartTechnologiesAndInvestment.description, #"Smart Technologies and Investment Limited"#)
    
        // Linough Inc.
        XCTAssertEqual(CompanyIdentifier.linough.rawValue, 1354)
        XCTAssertEqual(CompanyIdentifier.linough.name, #"Linough Inc."#)
        XCTAssertEqual(CompanyIdentifier.linough.description, #"Linough Inc."#)
    
        // Advanced Electronic Designs, Inc.
        XCTAssertEqual(CompanyIdentifier.advancedElectronicDesigns.rawValue, 1355)
        XCTAssertEqual(CompanyIdentifier.advancedElectronicDesigns.name, #"Advanced Electronic Designs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.advancedElectronicDesigns.description, #"Advanced Electronic Designs, Inc."#)
    
        // Carefree Scott Fetzer Co Inc
        XCTAssertEqual(CompanyIdentifier.carefreeScottFetzerCo.rawValue, 1356)
        XCTAssertEqual(CompanyIdentifier.carefreeScottFetzerCo.name, #"Carefree Scott Fetzer Co Inc"#)
        XCTAssertEqual(CompanyIdentifier.carefreeScottFetzerCo.description, #"Carefree Scott Fetzer Co Inc"#)
    
        // Sensome
        XCTAssertEqual(CompanyIdentifier.sensome.rawValue, 1357)
        XCTAssertEqual(CompanyIdentifier.sensome.name, #"Sensome"#)
        XCTAssertEqual(CompanyIdentifier.sensome.description, #"Sensome"#)
    
        // FORTRONIK storitve d.o.o.
        XCTAssertEqual(CompanyIdentifier.fortronikStoritve.rawValue, 1358)
        XCTAssertEqual(CompanyIdentifier.fortronikStoritve.name, #"FORTRONIK storitve d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.fortronikStoritve.description, #"FORTRONIK storitve d.o.o."#)
    
        // Sinnoz
        XCTAssertEqual(CompanyIdentifier.sinnoz.rawValue, 1359)
        XCTAssertEqual(CompanyIdentifier.sinnoz.name, #"Sinnoz"#)
        XCTAssertEqual(CompanyIdentifier.sinnoz.description, #"Sinnoz"#)
    
        // Versa Networks, Inc.
        XCTAssertEqual(CompanyIdentifier.versaNetworks.rawValue, 1360)
        XCTAssertEqual(CompanyIdentifier.versaNetworks.name, #"Versa Networks, Inc."#)
        XCTAssertEqual(CompanyIdentifier.versaNetworks.description, #"Versa Networks, Inc."#)
    
        // Sylero
        XCTAssertEqual(CompanyIdentifier.sylero.rawValue, 1361)
        XCTAssertEqual(CompanyIdentifier.sylero.name, #"Sylero"#)
        XCTAssertEqual(CompanyIdentifier.sylero.description, #"Sylero"#)
    
        // Avempace SARL
        XCTAssertEqual(CompanyIdentifier.avempacerl.rawValue, 1362)
        XCTAssertEqual(CompanyIdentifier.avempacerl.name, #"Avempace SARL"#)
        XCTAssertEqual(CompanyIdentifier.avempacerl.description, #"Avempace SARL"#)
    
        // Nintendo Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.nintendo.rawValue, 1363)
        XCTAssertEqual(CompanyIdentifier.nintendo.name, #"Nintendo Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nintendo.description, #"Nintendo Co., Ltd."#)
    
        // National Instruments
        XCTAssertEqual(CompanyIdentifier.nationalInstruments.rawValue, 1364)
        XCTAssertEqual(CompanyIdentifier.nationalInstruments.name, #"National Instruments"#)
        XCTAssertEqual(CompanyIdentifier.nationalInstruments.description, #"National Instruments"#)
    
        // KROHNE Messtechnik GmbH
        XCTAssertEqual(CompanyIdentifier.krohneMesstechnik.rawValue, 1365)
        XCTAssertEqual(CompanyIdentifier.krohneMesstechnik.name, #"KROHNE Messtechnik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.krohneMesstechnik.description, #"KROHNE Messtechnik GmbH"#)
    
        // Otodynamics Ltd
        XCTAssertEqual(CompanyIdentifier.otodynamics.rawValue, 1366)
        XCTAssertEqual(CompanyIdentifier.otodynamics.name, #"Otodynamics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.otodynamics.description, #"Otodynamics Ltd"#)
    
        // Arwin Technology Limited
        XCTAssertEqual(CompanyIdentifier.arwinTechnology.rawValue, 1367)
        XCTAssertEqual(CompanyIdentifier.arwinTechnology.name, #"Arwin Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.arwinTechnology.description, #"Arwin Technology Limited"#)
    
        // benegear, inc.
        XCTAssertEqual(CompanyIdentifier.benegear.rawValue, 1368)
        XCTAssertEqual(CompanyIdentifier.benegear.name, #"benegear, inc."#)
        XCTAssertEqual(CompanyIdentifier.benegear.description, #"benegear, inc."#)
    
        // Newcon Optik
        XCTAssertEqual(CompanyIdentifier.newconOptik.rawValue, 1369)
        XCTAssertEqual(CompanyIdentifier.newconOptik.name, #"Newcon Optik"#)
        XCTAssertEqual(CompanyIdentifier.newconOptik.description, #"Newcon Optik"#)
    
        // CANDY HOUSE, Inc.
        XCTAssertEqual(CompanyIdentifier.candyHouse.rawValue, 1370)
        XCTAssertEqual(CompanyIdentifier.candyHouse.name, #"CANDY HOUSE, Inc."#)
        XCTAssertEqual(CompanyIdentifier.candyHouse.description, #"CANDY HOUSE, Inc."#)
    
        // FRANKLIN TECHNOLOGY INC
        XCTAssertEqual(CompanyIdentifier.franklinTechnology.rawValue, 1371)
        XCTAssertEqual(CompanyIdentifier.franklinTechnology.name, #"FRANKLIN TECHNOLOGY INC"#)
        XCTAssertEqual(CompanyIdentifier.franklinTechnology.description, #"FRANKLIN TECHNOLOGY INC"#)
    
        // Lely
        XCTAssertEqual(CompanyIdentifier.lely.rawValue, 1372)
        XCTAssertEqual(CompanyIdentifier.lely.name, #"Lely"#)
        XCTAssertEqual(CompanyIdentifier.lely.description, #"Lely"#)
    
        // Valve Corporation
        XCTAssertEqual(CompanyIdentifier.valve.rawValue, 1373)
        XCTAssertEqual(CompanyIdentifier.valve.name, #"Valve Corporation"#)
        XCTAssertEqual(CompanyIdentifier.valve.description, #"Valve Corporation"#)
    
        // Hekatron Vertriebs GmbH
        XCTAssertEqual(CompanyIdentifier.hekatronVertriebs.rawValue, 1374)
        XCTAssertEqual(CompanyIdentifier.hekatronVertriebs.name, #"Hekatron Vertriebs GmbH"#)
        XCTAssertEqual(CompanyIdentifier.hekatronVertriebs.description, #"Hekatron Vertriebs GmbH"#)
    
        // PROTECH S.A.S. DI GIRARDI ANDREA & C.
        XCTAssertEqual(CompanyIdentifier.protechDiGirardiAndreaC.rawValue, 1375)
        XCTAssertEqual(CompanyIdentifier.protechDiGirardiAndreaC.name, #"PROTECH S.A.S. DI GIRARDI ANDREA & C."#)
        XCTAssertEqual(CompanyIdentifier.protechDiGirardiAndreaC.description, #"PROTECH S.A.S. DI GIRARDI ANDREA & C."#)
    
        // Sarita CareTech APS (formerly Sarita CareTech IVS)
        XCTAssertEqual(CompanyIdentifier.saritaCaretech.rawValue, 1376)
        XCTAssertEqual(CompanyIdentifier.saritaCaretech.name, #"Sarita CareTech APS (formerly Sarita CareTech IVS)"#)
        XCTAssertEqual(CompanyIdentifier.saritaCaretech.description, #"Sarita CareTech APS (formerly Sarita CareTech IVS)"#)
    
        // Finder S.p.A.
        XCTAssertEqual(CompanyIdentifier.finder.rawValue, 1377)
        XCTAssertEqual(CompanyIdentifier.finder.name, #"Finder S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.finder.description, #"Finder S.p.A."#)
    
        // Thalmic Labs Inc.
        XCTAssertEqual(CompanyIdentifier.thalmicLabs.rawValue, 1378)
        XCTAssertEqual(CompanyIdentifier.thalmicLabs.name, #"Thalmic Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.thalmicLabs.description, #"Thalmic Labs Inc."#)
    
        // Steinel Vertrieb GmbH
        XCTAssertEqual(CompanyIdentifier.steinelVertrieb.rawValue, 1379)
        XCTAssertEqual(CompanyIdentifier.steinelVertrieb.name, #"Steinel Vertrieb GmbH"#)
        XCTAssertEqual(CompanyIdentifier.steinelVertrieb.description, #"Steinel Vertrieb GmbH"#)
    
        // Beghelli Spa
        XCTAssertEqual(CompanyIdentifier.beghelliSpa.rawValue, 1380)
        XCTAssertEqual(CompanyIdentifier.beghelliSpa.name, #"Beghelli Spa"#)
        XCTAssertEqual(CompanyIdentifier.beghelliSpa.description, #"Beghelli Spa"#)
    
        // Beijing Smartspace Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.beijingSmartspaceTechnologies.rawValue, 1381)
        XCTAssertEqual(CompanyIdentifier.beijingSmartspaceTechnologies.name, #"Beijing Smartspace Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.beijingSmartspaceTechnologies.description, #"Beijing Smartspace Technologies Inc."#)
    
        // CORE TRANSPORT TECHNOLOGIES NZ LIMITED
        XCTAssertEqual(CompanyIdentifier.coreTransportTechnologiesNz.rawValue, 1382)
        XCTAssertEqual(CompanyIdentifier.coreTransportTechnologiesNz.name, #"CORE TRANSPORT TECHNOLOGIES NZ LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.coreTransportTechnologiesNz.description, #"CORE TRANSPORT TECHNOLOGIES NZ LIMITED"#)
    
        // Xiamen Everesports Goods Co., Ltd
        XCTAssertEqual(CompanyIdentifier.xiamenEveresportsGoods.rawValue, 1383)
        XCTAssertEqual(CompanyIdentifier.xiamenEveresportsGoods.name, #"Xiamen Everesports Goods Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.xiamenEveresportsGoods.description, #"Xiamen Everesports Goods Co., Ltd"#)
    
        // Bodyport Inc.
        XCTAssertEqual(CompanyIdentifier.bodyport.rawValue, 1384)
        XCTAssertEqual(CompanyIdentifier.bodyport.name, #"Bodyport Inc."#)
        XCTAssertEqual(CompanyIdentifier.bodyport.description, #"Bodyport Inc."#)
    
        // Audionics System, INC.
        XCTAssertEqual(CompanyIdentifier.audionicsSystem.rawValue, 1385)
        XCTAssertEqual(CompanyIdentifier.audionicsSystem.name, #"Audionics System, INC."#)
        XCTAssertEqual(CompanyIdentifier.audionicsSystem.description, #"Audionics System, INC."#)
    
        // Flipnavi Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.flipnavi.rawValue, 1386)
        XCTAssertEqual(CompanyIdentifier.flipnavi.name, #"Flipnavi Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.flipnavi.description, #"Flipnavi Co.,Ltd."#)
    
        // Rion Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.rion.rawValue, 1387)
        XCTAssertEqual(CompanyIdentifier.rion.name, #"Rion Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.rion.description, #"Rion Co., Ltd."#)
    
        // Long Range Systems, LLC
        XCTAssertEqual(CompanyIdentifier.longRangeSystems.rawValue, 1388)
        XCTAssertEqual(CompanyIdentifier.longRangeSystems.name, #"Long Range Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.longRangeSystems.description, #"Long Range Systems, LLC"#)
    
        // Redmond Industrial Group LLC
        XCTAssertEqual(CompanyIdentifier.redmondIndustrialGroup.rawValue, 1389)
        XCTAssertEqual(CompanyIdentifier.redmondIndustrialGroup.name, #"Redmond Industrial Group LLC"#)
        XCTAssertEqual(CompanyIdentifier.redmondIndustrialGroup.description, #"Redmond Industrial Group LLC"#)
    
        // VIZPIN INC.
        XCTAssertEqual(CompanyIdentifier.vizpin.rawValue, 1390)
        XCTAssertEqual(CompanyIdentifier.vizpin.name, #"VIZPIN INC."#)
        XCTAssertEqual(CompanyIdentifier.vizpin.description, #"VIZPIN INC."#)
    
        // BikeFinder AS
        XCTAssertEqual(CompanyIdentifier.bikefinder.rawValue, 1391)
        XCTAssertEqual(CompanyIdentifier.bikefinder.name, #"BikeFinder AS"#)
        XCTAssertEqual(CompanyIdentifier.bikefinder.description, #"BikeFinder AS"#)
    
        // Consumer Sleep Solutions LLC
        XCTAssertEqual(CompanyIdentifier.consumerSleepSolutions.rawValue, 1392)
        XCTAssertEqual(CompanyIdentifier.consumerSleepSolutions.name, #"Consumer Sleep Solutions LLC"#)
        XCTAssertEqual(CompanyIdentifier.consumerSleepSolutions.description, #"Consumer Sleep Solutions LLC"#)
    
        // PSIKICK, INC.
        XCTAssertEqual(CompanyIdentifier.psikick.rawValue, 1393)
        XCTAssertEqual(CompanyIdentifier.psikick.name, #"PSIKICK, INC."#)
        XCTAssertEqual(CompanyIdentifier.psikick.description, #"PSIKICK, INC."#)
    
        // AntTail.com
        XCTAssertEqual(CompanyIdentifier.anttailCom.rawValue, 1394)
        XCTAssertEqual(CompanyIdentifier.anttailCom.name, #"AntTail.com"#)
        XCTAssertEqual(CompanyIdentifier.anttailCom.description, #"AntTail.com"#)
    
        // Lighting Science Group Corp.
        XCTAssertEqual(CompanyIdentifier.lightingScienceGroup.rawValue, 1395)
        XCTAssertEqual(CompanyIdentifier.lightingScienceGroup.name, #"Lighting Science Group Corp."#)
        XCTAssertEqual(CompanyIdentifier.lightingScienceGroup.description, #"Lighting Science Group Corp."#)
    
        // AFFORDABLE ELECTRONICS INC
        XCTAssertEqual(CompanyIdentifier.affordableElectronics.rawValue, 1396)
        XCTAssertEqual(CompanyIdentifier.affordableElectronics.name, #"AFFORDABLE ELECTRONICS INC"#)
        XCTAssertEqual(CompanyIdentifier.affordableElectronics.description, #"AFFORDABLE ELECTRONICS INC"#)
    
        // Integral Memroy Plc
        XCTAssertEqual(CompanyIdentifier.integralMemroyPlc.rawValue, 1397)
        XCTAssertEqual(CompanyIdentifier.integralMemroyPlc.name, #"Integral Memroy Plc"#)
        XCTAssertEqual(CompanyIdentifier.integralMemroyPlc.description, #"Integral Memroy Plc"#)
    
        // Globalstar, Inc.
        XCTAssertEqual(CompanyIdentifier.globalstar.rawValue, 1398)
        XCTAssertEqual(CompanyIdentifier.globalstar.name, #"Globalstar, Inc."#)
        XCTAssertEqual(CompanyIdentifier.globalstar.description, #"Globalstar, Inc."#)
    
        // True Wearables, Inc.
        XCTAssertEqual(CompanyIdentifier.trueWearables.rawValue, 1399)
        XCTAssertEqual(CompanyIdentifier.trueWearables.name, #"True Wearables, Inc."#)
        XCTAssertEqual(CompanyIdentifier.trueWearables.description, #"True Wearables, Inc."#)
    
        // Wellington Drive Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.wellingtonDriveTechnologies.rawValue, 1400)
        XCTAssertEqual(CompanyIdentifier.wellingtonDriveTechnologies.name, #"Wellington Drive Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.wellingtonDriveTechnologies.description, #"Wellington Drive Technologies Ltd"#)
    
        // Ensemble Tech Private Limited
        XCTAssertEqual(CompanyIdentifier.ensembleTech.rawValue, 1401)
        XCTAssertEqual(CompanyIdentifier.ensembleTech.name, #"Ensemble Tech Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.ensembleTech.description, #"Ensemble Tech Private Limited"#)
    
        // OMNI Remotes
        XCTAssertEqual(CompanyIdentifier.omniRemotes.rawValue, 1402)
        XCTAssertEqual(CompanyIdentifier.omniRemotes.name, #"OMNI Remotes"#)
        XCTAssertEqual(CompanyIdentifier.omniRemotes.description, #"OMNI Remotes"#)
    
        // Duracell U.S. Operations Inc.
        XCTAssertEqual(CompanyIdentifier.duracellUSOperations.rawValue, 1403)
        XCTAssertEqual(CompanyIdentifier.duracellUSOperations.name, #"Duracell U.S. Operations Inc."#)
        XCTAssertEqual(CompanyIdentifier.duracellUSOperations.description, #"Duracell U.S. Operations Inc."#)
    
        // Toor Technologies LLC
        XCTAssertEqual(CompanyIdentifier.toorTechnologies.rawValue, 1404)
        XCTAssertEqual(CompanyIdentifier.toorTechnologies.name, #"Toor Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.toorTechnologies.description, #"Toor Technologies LLC"#)
    
        // Instinct Performance
        XCTAssertEqual(CompanyIdentifier.instinctPerformance.rawValue, 1405)
        XCTAssertEqual(CompanyIdentifier.instinctPerformance.name, #"Instinct Performance"#)
        XCTAssertEqual(CompanyIdentifier.instinctPerformance.description, #"Instinct Performance"#)
    
        // Beco, Inc
        XCTAssertEqual(CompanyIdentifier.beco.rawValue, 1406)
        XCTAssertEqual(CompanyIdentifier.beco.name, #"Beco, Inc"#)
        XCTAssertEqual(CompanyIdentifier.beco.description, #"Beco, Inc"#)
    
        // Scuf Gaming International, LLC
        XCTAssertEqual(CompanyIdentifier.scufGamingInternational.rawValue, 1407)
        XCTAssertEqual(CompanyIdentifier.scufGamingInternational.name, #"Scuf Gaming International, LLC"#)
        XCTAssertEqual(CompanyIdentifier.scufGamingInternational.description, #"Scuf Gaming International, LLC"#)
    
        // ARANZ Medical Limited
        XCTAssertEqual(CompanyIdentifier.aranzMedical.rawValue, 1408)
        XCTAssertEqual(CompanyIdentifier.aranzMedical.name, #"ARANZ Medical Limited"#)
        XCTAssertEqual(CompanyIdentifier.aranzMedical.description, #"ARANZ Medical Limited"#)
    
        // LYS TECHNOLOGIES LTD
        XCTAssertEqual(CompanyIdentifier.lysTechnologies.rawValue, 1409)
        XCTAssertEqual(CompanyIdentifier.lysTechnologies.name, #"LYS TECHNOLOGIES LTD"#)
        XCTAssertEqual(CompanyIdentifier.lysTechnologies.description, #"LYS TECHNOLOGIES LTD"#)
    
        // Breakwall Analytics, LLC
        XCTAssertEqual(CompanyIdentifier.breakwallAnalytics.rawValue, 1410)
        XCTAssertEqual(CompanyIdentifier.breakwallAnalytics.name, #"Breakwall Analytics, LLC"#)
        XCTAssertEqual(CompanyIdentifier.breakwallAnalytics.description, #"Breakwall Analytics, LLC"#)
    
        // Code Blue Communications
        XCTAssertEqual(CompanyIdentifier.codeBlueCommunications.rawValue, 1411)
        XCTAssertEqual(CompanyIdentifier.codeBlueCommunications.name, #"Code Blue Communications"#)
        XCTAssertEqual(CompanyIdentifier.codeBlueCommunications.description, #"Code Blue Communications"#)
    
        // Gira Giersiepen GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.giraGiersiepen.rawValue, 1412)
        XCTAssertEqual(CompanyIdentifier.giraGiersiepen.name, #"Gira Giersiepen GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.giraGiersiepen.description, #"Gira Giersiepen GmbH & Co. KG"#)
    
        // Hearing Lab Technology
        XCTAssertEqual(CompanyIdentifier.hearingLabTechnology.rawValue, 1413)
        XCTAssertEqual(CompanyIdentifier.hearingLabTechnology.name, #"Hearing Lab Technology"#)
        XCTAssertEqual(CompanyIdentifier.hearingLabTechnology.description, #"Hearing Lab Technology"#)
    
        // LEGRAND
        XCTAssertEqual(CompanyIdentifier.legrand.rawValue, 1414)
        XCTAssertEqual(CompanyIdentifier.legrand.name, #"LEGRAND"#)
        XCTAssertEqual(CompanyIdentifier.legrand.description, #"LEGRAND"#)
    
        // Derichs GmbH
        XCTAssertEqual(CompanyIdentifier.derichs.rawValue, 1415)
        XCTAssertEqual(CompanyIdentifier.derichs.name, #"Derichs GmbH"#)
        XCTAssertEqual(CompanyIdentifier.derichs.description, #"Derichs GmbH"#)
    
        // ALT-TEKNIK LLC
        XCTAssertEqual(CompanyIdentifier.altTeknik.rawValue, 1416)
        XCTAssertEqual(CompanyIdentifier.altTeknik.name, #"ALT-TEKNIK LLC"#)
        XCTAssertEqual(CompanyIdentifier.altTeknik.description, #"ALT-TEKNIK LLC"#)
    
        // Star Technologies
        XCTAssertEqual(CompanyIdentifier.starTechnologies.rawValue, 1417)
        XCTAssertEqual(CompanyIdentifier.starTechnologies.name, #"Star Technologies"#)
        XCTAssertEqual(CompanyIdentifier.starTechnologies.description, #"Star Technologies"#)
    
        // START TODAY CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.startToday.rawValue, 1418)
        XCTAssertEqual(CompanyIdentifier.startToday.name, #"START TODAY CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.startToday.description, #"START TODAY CO.,LTD."#)
    
        // Maxim Integrated Products
        XCTAssertEqual(CompanyIdentifier.maximIntegratedProducts.rawValue, 1419)
        XCTAssertEqual(CompanyIdentifier.maximIntegratedProducts.name, #"Maxim Integrated Products"#)
        XCTAssertEqual(CompanyIdentifier.maximIntegratedProducts.description, #"Maxim Integrated Products"#)
    
        // MERCK Kommanditgesellschaft auf Aktien
        XCTAssertEqual(CompanyIdentifier.merckKommanditgesellschaftAufAktien.rawValue, 1420)
        XCTAssertEqual(CompanyIdentifier.merckKommanditgesellschaftAufAktien.name, #"MERCK Kommanditgesellschaft auf Aktien"#)
        XCTAssertEqual(CompanyIdentifier.merckKommanditgesellschaftAufAktien.description, #"MERCK Kommanditgesellschaft auf Aktien"#)
    
        // Jungheinrich Aktiengesellschaft
        XCTAssertEqual(CompanyIdentifier.jungheinrichAktiengesellschaft.rawValue, 1421)
        XCTAssertEqual(CompanyIdentifier.jungheinrichAktiengesellschaft.name, #"Jungheinrich Aktiengesellschaft"#)
        XCTAssertEqual(CompanyIdentifier.jungheinrichAktiengesellschaft.description, #"Jungheinrich Aktiengesellschaft"#)
    
        // Oculus VR, LLC
        XCTAssertEqual(CompanyIdentifier.oculusVr.rawValue, 1422)
        XCTAssertEqual(CompanyIdentifier.oculusVr.name, #"Oculus VR, LLC"#)
        XCTAssertEqual(CompanyIdentifier.oculusVr.description, #"Oculus VR, LLC"#)
    
        // HENDON SEMICONDUCTORS PTY LTD
        XCTAssertEqual(CompanyIdentifier.hendonSemiconductorsPty.rawValue, 1423)
        XCTAssertEqual(CompanyIdentifier.hendonSemiconductorsPty.name, #"HENDON SEMICONDUCTORS PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.hendonSemiconductorsPty.description, #"HENDON SEMICONDUCTORS PTY LTD"#)
    
        // Pur3 Ltd
        XCTAssertEqual(CompanyIdentifier.pur3.rawValue, 1424)
        XCTAssertEqual(CompanyIdentifier.pur3.name, #"Pur3 Ltd"#)
        XCTAssertEqual(CompanyIdentifier.pur3.description, #"Pur3 Ltd"#)
    
        // Viasat Group S.p.A.
        XCTAssertEqual(CompanyIdentifier.viasatGroup.rawValue, 1425)
        XCTAssertEqual(CompanyIdentifier.viasatGroup.name, #"Viasat Group S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.viasatGroup.description, #"Viasat Group S.p.A."#)
    
        // IZITHERM
        XCTAssertEqual(CompanyIdentifier.izitherm.rawValue, 1426)
        XCTAssertEqual(CompanyIdentifier.izitherm.name, #"IZITHERM"#)
        XCTAssertEqual(CompanyIdentifier.izitherm.description, #"IZITHERM"#)
    
        // Spaulding Clinical Research
        XCTAssertEqual(CompanyIdentifier.spauldingClinicalResearch.rawValue, 1427)
        XCTAssertEqual(CompanyIdentifier.spauldingClinicalResearch.name, #"Spaulding Clinical Research"#)
        XCTAssertEqual(CompanyIdentifier.spauldingClinicalResearch.description, #"Spaulding Clinical Research"#)
    
        // Kohler Company
        XCTAssertEqual(CompanyIdentifier.kohlerCompany.rawValue, 1428)
        XCTAssertEqual(CompanyIdentifier.kohlerCompany.name, #"Kohler Company"#)
        XCTAssertEqual(CompanyIdentifier.kohlerCompany.description, #"Kohler Company"#)
    
        // Inor Process AB
        XCTAssertEqual(CompanyIdentifier.inorProcess.rawValue, 1429)
        XCTAssertEqual(CompanyIdentifier.inorProcess.name, #"Inor Process AB"#)
        XCTAssertEqual(CompanyIdentifier.inorProcess.description, #"Inor Process AB"#)
    
        // My Smart Blinds
        XCTAssertEqual(CompanyIdentifier.mySmartBlinds.rawValue, 1430)
        XCTAssertEqual(CompanyIdentifier.mySmartBlinds.name, #"My Smart Blinds"#)
        XCTAssertEqual(CompanyIdentifier.mySmartBlinds.description, #"My Smart Blinds"#)
    
        // RadioPulse Inc
        XCTAssertEqual(CompanyIdentifier.radiopulse.rawValue, 1431)
        XCTAssertEqual(CompanyIdentifier.radiopulse.name, #"RadioPulse Inc"#)
        XCTAssertEqual(CompanyIdentifier.radiopulse.description, #"RadioPulse Inc"#)
    
        // rapitag GmbH
        XCTAssertEqual(CompanyIdentifier.rapitag.rawValue, 1432)
        XCTAssertEqual(CompanyIdentifier.rapitag.name, #"rapitag GmbH"#)
        XCTAssertEqual(CompanyIdentifier.rapitag.description, #"rapitag GmbH"#)
    
        // Lazlo326, LLC.
        XCTAssertEqual(CompanyIdentifier.lazlo326.rawValue, 1433)
        XCTAssertEqual(CompanyIdentifier.lazlo326.name, #"Lazlo326, LLC."#)
        XCTAssertEqual(CompanyIdentifier.lazlo326.description, #"Lazlo326, LLC."#)
    
        // Teledyne Lecroy, Inc.
        XCTAssertEqual(CompanyIdentifier.teledyneLecroy.rawValue, 1434)
        XCTAssertEqual(CompanyIdentifier.teledyneLecroy.name, #"Teledyne Lecroy, Inc."#)
        XCTAssertEqual(CompanyIdentifier.teledyneLecroy.description, #"Teledyne Lecroy, Inc."#)
    
        // Dataflow Systems Limited
        XCTAssertEqual(CompanyIdentifier.dataflowSystems.rawValue, 1435)
        XCTAssertEqual(CompanyIdentifier.dataflowSystems.name, #"Dataflow Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.dataflowSystems.description, #"Dataflow Systems Limited"#)
    
        // Macrogiga Electronics
        XCTAssertEqual(CompanyIdentifier.macrogigaElectronics.rawValue, 1436)
        XCTAssertEqual(CompanyIdentifier.macrogigaElectronics.name, #"Macrogiga Electronics"#)
        XCTAssertEqual(CompanyIdentifier.macrogigaElectronics.description, #"Macrogiga Electronics"#)
    
        // Tandem Diabetes Care
        XCTAssertEqual(CompanyIdentifier.tandemDiabetesCare.rawValue, 1437)
        XCTAssertEqual(CompanyIdentifier.tandemDiabetesCare.name, #"Tandem Diabetes Care"#)
        XCTAssertEqual(CompanyIdentifier.tandemDiabetesCare.description, #"Tandem Diabetes Care"#)
    
        // Polycom, Inc.
        XCTAssertEqual(CompanyIdentifier.polycom.rawValue, 1438)
        XCTAssertEqual(CompanyIdentifier.polycom.name, #"Polycom, Inc."#)
        XCTAssertEqual(CompanyIdentifier.polycom.description, #"Polycom, Inc."#)
    
        // Fisher & Paykel Healthcare
        XCTAssertEqual(CompanyIdentifier.fisherPaykelHealthcare.rawValue, 1439)
        XCTAssertEqual(CompanyIdentifier.fisherPaykelHealthcare.name, #"Fisher & Paykel Healthcare"#)
        XCTAssertEqual(CompanyIdentifier.fisherPaykelHealthcare.description, #"Fisher & Paykel Healthcare"#)
    
        // RCP Software Oy
        XCTAssertEqual(CompanyIdentifier.rcpSoftware.rawValue, 1440)
        XCTAssertEqual(CompanyIdentifier.rcpSoftware.name, #"RCP Software Oy"#)
        XCTAssertEqual(CompanyIdentifier.rcpSoftware.description, #"RCP Software Oy"#)
    
        // Shanghai Xiaoyi Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiXiaoyiTechnology.rawValue, 1441)
        XCTAssertEqual(CompanyIdentifier.shanghaiXiaoyiTechnology.name, #"Shanghai Xiaoyi Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiXiaoyiTechnology.description, #"Shanghai Xiaoyi Technology Co.,Ltd."#)
    
        // ADHERIUM(NZ) LIMITED
        XCTAssertEqual(CompanyIdentifier.adheriumNz.rawValue, 1442)
        XCTAssertEqual(CompanyIdentifier.adheriumNz.name, #"ADHERIUM(NZ) LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.adheriumNz.description, #"ADHERIUM(NZ) LIMITED"#)
    
        // Axiomware Systems Incorporated
        XCTAssertEqual(CompanyIdentifier.axiomwareSystems.rawValue, 1443)
        XCTAssertEqual(CompanyIdentifier.axiomwareSystems.name, #"Axiomware Systems Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.axiomwareSystems.description, #"Axiomware Systems Incorporated"#)
    
        // O. E. M. Controls, Inc.
        XCTAssertEqual(CompanyIdentifier.oEMControls.rawValue, 1444)
        XCTAssertEqual(CompanyIdentifier.oEMControls.name, #"O. E. M. Controls, Inc."#)
        XCTAssertEqual(CompanyIdentifier.oEMControls.description, #"O. E. M. Controls, Inc."#)
    
        // Kiiroo BV
        XCTAssertEqual(CompanyIdentifier.kiiroo.rawValue, 1445)
        XCTAssertEqual(CompanyIdentifier.kiiroo.name, #"Kiiroo BV"#)
        XCTAssertEqual(CompanyIdentifier.kiiroo.description, #"Kiiroo BV"#)
    
        // Telecon Mobile Limited
        XCTAssertEqual(CompanyIdentifier.teleconMobile.rawValue, 1446)
        XCTAssertEqual(CompanyIdentifier.teleconMobile.name, #"Telecon Mobile Limited"#)
        XCTAssertEqual(CompanyIdentifier.teleconMobile.description, #"Telecon Mobile Limited"#)
    
        // Sonos Inc
        XCTAssertEqual(CompanyIdentifier.sonos.rawValue, 1447)
        XCTAssertEqual(CompanyIdentifier.sonos.name, #"Sonos Inc"#)
        XCTAssertEqual(CompanyIdentifier.sonos.description, #"Sonos Inc"#)
    
        // Tom Allebrandi Consulting
        XCTAssertEqual(CompanyIdentifier.tomAllebrandiConsulting.rawValue, 1448)
        XCTAssertEqual(CompanyIdentifier.tomAllebrandiConsulting.name, #"Tom Allebrandi Consulting"#)
        XCTAssertEqual(CompanyIdentifier.tomAllebrandiConsulting.description, #"Tom Allebrandi Consulting"#)
    
        // Monidor
        XCTAssertEqual(CompanyIdentifier.monidor.rawValue, 1449)
        XCTAssertEqual(CompanyIdentifier.monidor.name, #"Monidor"#)
        XCTAssertEqual(CompanyIdentifier.monidor.description, #"Monidor"#)
    
        // Tramex Limited
        XCTAssertEqual(CompanyIdentifier.tramex.rawValue, 1450)
        XCTAssertEqual(CompanyIdentifier.tramex.name, #"Tramex Limited"#)
        XCTAssertEqual(CompanyIdentifier.tramex.description, #"Tramex Limited"#)
    
        // Nofence AS
        XCTAssertEqual(CompanyIdentifier.nofence.rawValue, 1451)
        XCTAssertEqual(CompanyIdentifier.nofence.name, #"Nofence AS"#)
        XCTAssertEqual(CompanyIdentifier.nofence.description, #"Nofence AS"#)
    
        // GoerTek Dynaudio Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.goertekDynaudio.rawValue, 1452)
        XCTAssertEqual(CompanyIdentifier.goertekDynaudio.name, #"GoerTek Dynaudio Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.goertekDynaudio.description, #"GoerTek Dynaudio Co., Ltd."#)
    
        // INIA
        XCTAssertEqual(CompanyIdentifier.inia.rawValue, 1453)
        XCTAssertEqual(CompanyIdentifier.inia.name, #"INIA"#)
        XCTAssertEqual(CompanyIdentifier.inia.description, #"INIA"#)
    
        // CARMATE MFG.CO.,LTD
        XCTAssertEqual(CompanyIdentifier.carmateMfg.rawValue, 1454)
        XCTAssertEqual(CompanyIdentifier.carmateMfg.name, #"CARMATE MFG.CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.carmateMfg.description, #"CARMATE MFG.CO.,LTD"#)
    
        // OV LOOP, INC. (formerly ONvocal)
        XCTAssertEqual(CompanyIdentifier.ovLoop.rawValue, 1455)
        XCTAssertEqual(CompanyIdentifier.ovLoop.name, #"OV LOOP, INC. (formerly ONvocal)"#)
        XCTAssertEqual(CompanyIdentifier.ovLoop.description, #"OV LOOP, INC. (formerly ONvocal)"#)
    
        // NewTec GmbH
        XCTAssertEqual(CompanyIdentifier.newtec.rawValue, 1456)
        XCTAssertEqual(CompanyIdentifier.newtec.name, #"NewTec GmbH"#)
        XCTAssertEqual(CompanyIdentifier.newtec.description, #"NewTec GmbH"#)
    
        // Medallion Instrumentation Systems
        XCTAssertEqual(CompanyIdentifier.medallionInstrumentationSystems.rawValue, 1457)
        XCTAssertEqual(CompanyIdentifier.medallionInstrumentationSystems.name, #"Medallion Instrumentation Systems"#)
        XCTAssertEqual(CompanyIdentifier.medallionInstrumentationSystems.description, #"Medallion Instrumentation Systems"#)
    
        // CAREL INDUSTRIES S.P.A.
        XCTAssertEqual(CompanyIdentifier.carelIndustries.rawValue, 1458)
        XCTAssertEqual(CompanyIdentifier.carelIndustries.name, #"CAREL INDUSTRIES S.P.A."#)
        XCTAssertEqual(CompanyIdentifier.carelIndustries.description, #"CAREL INDUSTRIES S.P.A."#)
    
        // Parabit Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.parabitSystems.rawValue, 1459)
        XCTAssertEqual(CompanyIdentifier.parabitSystems.name, #"Parabit Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.parabitSystems.description, #"Parabit Systems, Inc."#)
    
        // White Horse Scientific ltd
        XCTAssertEqual(CompanyIdentifier.whiteHorseScientific.rawValue, 1460)
        XCTAssertEqual(CompanyIdentifier.whiteHorseScientific.name, #"White Horse Scientific ltd"#)
        XCTAssertEqual(CompanyIdentifier.whiteHorseScientific.description, #"White Horse Scientific ltd"#)
    
        // verisilicon
        XCTAssertEqual(CompanyIdentifier.verisilicon.rawValue, 1461)
        XCTAssertEqual(CompanyIdentifier.verisilicon.name, #"verisilicon"#)
        XCTAssertEqual(CompanyIdentifier.verisilicon.description, #"verisilicon"#)
    
        // Elecs Industry Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.elecsIndustry.rawValue, 1462)
        XCTAssertEqual(CompanyIdentifier.elecsIndustry.name, #"Elecs Industry Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.elecsIndustry.description, #"Elecs Industry Co.,Ltd."#)
    
        // Beijing Pinecone Electronics Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingPineconeElectronics.rawValue, 1463)
        XCTAssertEqual(CompanyIdentifier.beijingPineconeElectronics.name, #"Beijing Pinecone Electronics Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingPineconeElectronics.description, #"Beijing Pinecone Electronics Co.,Ltd."#)
    
        // Ambystoma Labs Inc.
        XCTAssertEqual(CompanyIdentifier.ambystomaLabs.rawValue, 1464)
        XCTAssertEqual(CompanyIdentifier.ambystomaLabs.name, #"Ambystoma Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.ambystomaLabs.description, #"Ambystoma Labs Inc."#)
    
        // Suzhou Pairlink Network Technology
        XCTAssertEqual(CompanyIdentifier.suzhouPairlinkNetworkTechnology.rawValue, 1465)
        XCTAssertEqual(CompanyIdentifier.suzhouPairlinkNetworkTechnology.name, #"Suzhou Pairlink Network Technology"#)
        XCTAssertEqual(CompanyIdentifier.suzhouPairlinkNetworkTechnology.description, #"Suzhou Pairlink Network Technology"#)
    
        // igloohome
        XCTAssertEqual(CompanyIdentifier.igloohome.rawValue, 1466)
        XCTAssertEqual(CompanyIdentifier.igloohome.name, #"igloohome"#)
        XCTAssertEqual(CompanyIdentifier.igloohome.description, #"igloohome"#)
    
        // Oxford Metrics plc
        XCTAssertEqual(CompanyIdentifier.oxfordMetricsPlc.rawValue, 1467)
        XCTAssertEqual(CompanyIdentifier.oxfordMetricsPlc.name, #"Oxford Metrics plc"#)
        XCTAssertEqual(CompanyIdentifier.oxfordMetricsPlc.description, #"Oxford Metrics plc"#)
    
        // Leviton Mfg. Co., Inc.
        XCTAssertEqual(CompanyIdentifier.levitonMfg.rawValue, 1468)
        XCTAssertEqual(CompanyIdentifier.levitonMfg.name, #"Leviton Mfg. Co., Inc."#)
        XCTAssertEqual(CompanyIdentifier.levitonMfg.description, #"Leviton Mfg. Co., Inc."#)
    
        // ULC Robotics Inc.
        XCTAssertEqual(CompanyIdentifier.ulcRobotics.rawValue, 1469)
        XCTAssertEqual(CompanyIdentifier.ulcRobotics.name, #"ULC Robotics Inc."#)
        XCTAssertEqual(CompanyIdentifier.ulcRobotics.description, #"ULC Robotics Inc."#)
    
        // RFID Global by Softwork SrL
        XCTAssertEqual(CompanyIdentifier.rfidGlobalBySoftwork.rawValue, 1470)
        XCTAssertEqual(CompanyIdentifier.rfidGlobalBySoftwork.name, #"RFID Global by Softwork SrL"#)
        XCTAssertEqual(CompanyIdentifier.rfidGlobalBySoftwork.description, #"RFID Global by Softwork SrL"#)
    
        // Real-World-Systems Corporation
        XCTAssertEqual(CompanyIdentifier.realWorldSystems.rawValue, 1471)
        XCTAssertEqual(CompanyIdentifier.realWorldSystems.name, #"Real-World-Systems Corporation"#)
        XCTAssertEqual(CompanyIdentifier.realWorldSystems.description, #"Real-World-Systems Corporation"#)
    
        // Nalu Medical, Inc.
        XCTAssertEqual(CompanyIdentifier.naluMedical.rawValue, 1472)
        XCTAssertEqual(CompanyIdentifier.naluMedical.name, #"Nalu Medical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.naluMedical.description, #"Nalu Medical, Inc."#)
    
        // P.I.Engineering
        XCTAssertEqual(CompanyIdentifier.pIEngineering.rawValue, 1473)
        XCTAssertEqual(CompanyIdentifier.pIEngineering.name, #"P.I.Engineering"#)
        XCTAssertEqual(CompanyIdentifier.pIEngineering.description, #"P.I.Engineering"#)
    
        // Grote Industries
        XCTAssertEqual(CompanyIdentifier.groteIndustries.rawValue, 1474)
        XCTAssertEqual(CompanyIdentifier.groteIndustries.name, #"Grote Industries"#)
        XCTAssertEqual(CompanyIdentifier.groteIndustries.description, #"Grote Industries"#)
    
        // Runtime, Inc.
        XCTAssertEqual(CompanyIdentifier.runtime.rawValue, 1475)
        XCTAssertEqual(CompanyIdentifier.runtime.name, #"Runtime, Inc."#)
        XCTAssertEqual(CompanyIdentifier.runtime.description, #"Runtime, Inc."#)
    
        // Codecoup sp. z o.o. sp. k.
        XCTAssertEqual(CompanyIdentifier.codecoup.rawValue, 1476)
        XCTAssertEqual(CompanyIdentifier.codecoup.name, #"Codecoup sp. z o.o. sp. k."#)
        XCTAssertEqual(CompanyIdentifier.codecoup.description, #"Codecoup sp. z o.o. sp. k."#)
    
        // SELVE GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.selve.rawValue, 1477)
        XCTAssertEqual(CompanyIdentifier.selve.name, #"SELVE GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.selve.description, #"SELVE GmbH & Co. KG"#)
    
        // Smart Animal Training Systems, LLC
        XCTAssertEqual(CompanyIdentifier.smartAnimalTrainingSystems.rawValue, 1478)
        XCTAssertEqual(CompanyIdentifier.smartAnimalTrainingSystems.name, #"Smart Animal Training Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.smartAnimalTrainingSystems.description, #"Smart Animal Training Systems, LLC"#)
    
        // Lippert Components, INC
        XCTAssertEqual(CompanyIdentifier.lippertComponents.rawValue, 1479)
        XCTAssertEqual(CompanyIdentifier.lippertComponents.name, #"Lippert Components, INC"#)
        XCTAssertEqual(CompanyIdentifier.lippertComponents.description, #"Lippert Components, INC"#)
    
        // SOMFY SAS
        XCTAssertEqual(CompanyIdentifier.somfys.rawValue, 1480)
        XCTAssertEqual(CompanyIdentifier.somfys.name, #"SOMFY SAS"#)
        XCTAssertEqual(CompanyIdentifier.somfys.description, #"SOMFY SAS"#)
    
        // TBS Electronics B.V.
        XCTAssertEqual(CompanyIdentifier.tbsElectronics.rawValue, 1481)
        XCTAssertEqual(CompanyIdentifier.tbsElectronics.name, #"TBS Electronics B.V."#)
        XCTAssertEqual(CompanyIdentifier.tbsElectronics.description, #"TBS Electronics B.V."#)
    
        // MHL Custom Inc
        XCTAssertEqual(CompanyIdentifier.mhlCustom.rawValue, 1482)
        XCTAssertEqual(CompanyIdentifier.mhlCustom.name, #"MHL Custom Inc"#)
        XCTAssertEqual(CompanyIdentifier.mhlCustom.description, #"MHL Custom Inc"#)
    
        // LucentWear LLC
        XCTAssertEqual(CompanyIdentifier.lucentwear.rawValue, 1483)
        XCTAssertEqual(CompanyIdentifier.lucentwear.name, #"LucentWear LLC"#)
        XCTAssertEqual(CompanyIdentifier.lucentwear.description, #"LucentWear LLC"#)
    
        // WATTS ELECTRONICS
        XCTAssertEqual(CompanyIdentifier.wattsElectronics.rawValue, 1484)
        XCTAssertEqual(CompanyIdentifier.wattsElectronics.name, #"WATTS ELECTRONICS"#)
        XCTAssertEqual(CompanyIdentifier.wattsElectronics.description, #"WATTS ELECTRONICS"#)
    
        // RJ Brands LLC
        XCTAssertEqual(CompanyIdentifier.rjBrands.rawValue, 1485)
        XCTAssertEqual(CompanyIdentifier.rjBrands.name, #"RJ Brands LLC"#)
        XCTAssertEqual(CompanyIdentifier.rjBrands.description, #"RJ Brands LLC"#)
    
        // V-ZUG Ltd
        XCTAssertEqual(CompanyIdentifier.vZug.rawValue, 1486)
        XCTAssertEqual(CompanyIdentifier.vZug.name, #"V-ZUG Ltd"#)
        XCTAssertEqual(CompanyIdentifier.vZug.description, #"V-ZUG Ltd"#)
    
        // Biowatch SA
        XCTAssertEqual(CompanyIdentifier.biowatch.rawValue, 1487)
        XCTAssertEqual(CompanyIdentifier.biowatch.name, #"Biowatch SA"#)
        XCTAssertEqual(CompanyIdentifier.biowatch.description, #"Biowatch SA"#)
    
        // Anova Applied Electronics
        XCTAssertEqual(CompanyIdentifier.anovaAppliedElectronics.rawValue, 1488)
        XCTAssertEqual(CompanyIdentifier.anovaAppliedElectronics.name, #"Anova Applied Electronics"#)
        XCTAssertEqual(CompanyIdentifier.anovaAppliedElectronics.description, #"Anova Applied Electronics"#)
    
        // Lindab AB
        XCTAssertEqual(CompanyIdentifier.lindab.rawValue, 1489)
        XCTAssertEqual(CompanyIdentifier.lindab.name, #"Lindab AB"#)
        XCTAssertEqual(CompanyIdentifier.lindab.description, #"Lindab AB"#)
    
        // frogblue TECHNOLOGY GmbH
        XCTAssertEqual(CompanyIdentifier.frogblueTechnology.rawValue, 1490)
        XCTAssertEqual(CompanyIdentifier.frogblueTechnology.name, #"frogblue TECHNOLOGY GmbH"#)
        XCTAssertEqual(CompanyIdentifier.frogblueTechnology.description, #"frogblue TECHNOLOGY GmbH"#)
    
        // Acurable Limited
        XCTAssertEqual(CompanyIdentifier.acurable.rawValue, 1491)
        XCTAssertEqual(CompanyIdentifier.acurable.name, #"Acurable Limited"#)
        XCTAssertEqual(CompanyIdentifier.acurable.description, #"Acurable Limited"#)
    
        // LAMPLIGHT Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.lamplight.rawValue, 1492)
        XCTAssertEqual(CompanyIdentifier.lamplight.name, #"LAMPLIGHT Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.lamplight.description, #"LAMPLIGHT Co., Ltd."#)
    
        // TEGAM, Inc.
        XCTAssertEqual(CompanyIdentifier.tegam.rawValue, 1493)
        XCTAssertEqual(CompanyIdentifier.tegam.name, #"TEGAM, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tegam.description, #"TEGAM, Inc."#)
    
        // Zhuhai Jieli technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.zhuhaiJieliTechnology.rawValue, 1494)
        XCTAssertEqual(CompanyIdentifier.zhuhaiJieliTechnology.name, #"Zhuhai Jieli technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.zhuhaiJieliTechnology.description, #"Zhuhai Jieli technology Co.,Ltd"#)
    
        // modum.io AG
        XCTAssertEqual(CompanyIdentifier.modumIo.rawValue, 1495)
        XCTAssertEqual(CompanyIdentifier.modumIo.name, #"modum.io AG"#)
        XCTAssertEqual(CompanyIdentifier.modumIo.description, #"modum.io AG"#)
    
        // Farm Jenny LLC
        XCTAssertEqual(CompanyIdentifier.farmJenny.rawValue, 1496)
        XCTAssertEqual(CompanyIdentifier.farmJenny.name, #"Farm Jenny LLC"#)
        XCTAssertEqual(CompanyIdentifier.farmJenny.description, #"Farm Jenny LLC"#)
    
        // Toyo Electronics Corporation
        XCTAssertEqual(CompanyIdentifier.toyoElectronics.rawValue, 1497)
        XCTAssertEqual(CompanyIdentifier.toyoElectronics.name, #"Toyo Electronics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.toyoElectronics.description, #"Toyo Electronics Corporation"#)
    
        // Applied Neural Research Corp
        XCTAssertEqual(CompanyIdentifier.appliedNeuralResearch.rawValue, 1498)
        XCTAssertEqual(CompanyIdentifier.appliedNeuralResearch.name, #"Applied Neural Research Corp"#)
        XCTAssertEqual(CompanyIdentifier.appliedNeuralResearch.description, #"Applied Neural Research Corp"#)
    
        // Avid Identification Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.avidIdentificationSystems.rawValue, 1499)
        XCTAssertEqual(CompanyIdentifier.avidIdentificationSystems.name, #"Avid Identification Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.avidIdentificationSystems.description, #"Avid Identification Systems, Inc."#)
    
        // Petronics Inc.
        XCTAssertEqual(CompanyIdentifier.petronics.rawValue, 1500)
        XCTAssertEqual(CompanyIdentifier.petronics.name, #"Petronics Inc."#)
        XCTAssertEqual(CompanyIdentifier.petronics.description, #"Petronics Inc."#)
    
        // essentim GmbH
        XCTAssertEqual(CompanyIdentifier.essentim.rawValue, 1501)
        XCTAssertEqual(CompanyIdentifier.essentim.name, #"essentim GmbH"#)
        XCTAssertEqual(CompanyIdentifier.essentim.description, #"essentim GmbH"#)
    
        // QT Medical INC.
        XCTAssertEqual(CompanyIdentifier.qtMedical.rawValue, 1502)
        XCTAssertEqual(CompanyIdentifier.qtMedical.name, #"QT Medical INC."#)
        XCTAssertEqual(CompanyIdentifier.qtMedical.description, #"QT Medical INC."#)
    
        // VIRTUALCLINIC.DIRECT LIMITED
        XCTAssertEqual(CompanyIdentifier.virtualclinicDirect.rawValue, 1503)
        XCTAssertEqual(CompanyIdentifier.virtualclinicDirect.name, #"VIRTUALCLINIC.DIRECT LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.virtualclinicDirect.description, #"VIRTUALCLINIC.DIRECT LIMITED"#)
    
        // Viper Design LLC
        XCTAssertEqual(CompanyIdentifier.viperDesign.rawValue, 1504)
        XCTAssertEqual(CompanyIdentifier.viperDesign.name, #"Viper Design LLC"#)
        XCTAssertEqual(CompanyIdentifier.viperDesign.description, #"Viper Design LLC"#)
    
        // Human, Incorporated
        XCTAssertEqual(CompanyIdentifier.human.rawValue, 1505)
        XCTAssertEqual(CompanyIdentifier.human.name, #"Human, Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.human.description, #"Human, Incorporated"#)
    
        // stAPPtronics GmbH
        XCTAssertEqual(CompanyIdentifier.stapptronics.rawValue, 1506)
        XCTAssertEqual(CompanyIdentifier.stapptronics.name, #"stAPPtronics GmbH"#)
        XCTAssertEqual(CompanyIdentifier.stapptronics.description, #"stAPPtronics GmbH"#)
    
        // Elemental Machines, Inc.
        XCTAssertEqual(CompanyIdentifier.elementalMachines.rawValue, 1507)
        XCTAssertEqual(CompanyIdentifier.elementalMachines.name, #"Elemental Machines, Inc."#)
        XCTAssertEqual(CompanyIdentifier.elementalMachines.description, #"Elemental Machines, Inc."#)
    
        // Taiyo Yuden Co., Ltd
        XCTAssertEqual(CompanyIdentifier.taiyoYuden.rawValue, 1508)
        XCTAssertEqual(CompanyIdentifier.taiyoYuden.name, #"Taiyo Yuden Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.taiyoYuden.description, #"Taiyo Yuden Co., Ltd"#)
    
        // INEO ENERGY& SYSTEMS
        XCTAssertEqual(CompanyIdentifier.ineoEnergySystems.rawValue, 1509)
        XCTAssertEqual(CompanyIdentifier.ineoEnergySystems.name, #"INEO ENERGY& SYSTEMS"#)
        XCTAssertEqual(CompanyIdentifier.ineoEnergySystems.description, #"INEO ENERGY& SYSTEMS"#)
    
        // Motion Instruments Inc.
        XCTAssertEqual(CompanyIdentifier.motionInstruments.rawValue, 1510)
        XCTAssertEqual(CompanyIdentifier.motionInstruments.name, #"Motion Instruments Inc."#)
        XCTAssertEqual(CompanyIdentifier.motionInstruments.description, #"Motion Instruments Inc."#)
    
        // PressurePro
        XCTAssertEqual(CompanyIdentifier.pressurepro.rawValue, 1511)
        XCTAssertEqual(CompanyIdentifier.pressurepro.name, #"PressurePro"#)
        XCTAssertEqual(CompanyIdentifier.pressurepro.description, #"PressurePro"#)
    
        // COWBOY
        XCTAssertEqual(CompanyIdentifier.cowboy.rawValue, 1512)
        XCTAssertEqual(CompanyIdentifier.cowboy.name, #"COWBOY"#)
        XCTAssertEqual(CompanyIdentifier.cowboy.description, #"COWBOY"#)
    
        // iconmobile GmbH
        XCTAssertEqual(CompanyIdentifier.iconmobile.rawValue, 1513)
        XCTAssertEqual(CompanyIdentifier.iconmobile.name, #"iconmobile GmbH"#)
        XCTAssertEqual(CompanyIdentifier.iconmobile.description, #"iconmobile GmbH"#)
    
        // ACS-Control-System GmbH
        XCTAssertEqual(CompanyIdentifier.acsControlSystem.rawValue, 1514)
        XCTAssertEqual(CompanyIdentifier.acsControlSystem.name, #"ACS-Control-System GmbH"#)
        XCTAssertEqual(CompanyIdentifier.acsControlSystem.description, #"ACS-Control-System GmbH"#)
    
        // Bayerische Motoren Werke AG
        XCTAssertEqual(CompanyIdentifier.bayerischeMotorenWerke.rawValue, 1515)
        XCTAssertEqual(CompanyIdentifier.bayerischeMotorenWerke.name, #"Bayerische Motoren Werke AG"#)
        XCTAssertEqual(CompanyIdentifier.bayerischeMotorenWerke.description, #"Bayerische Motoren Werke AG"#)
    
        // Gycom Svenska AB
        XCTAssertEqual(CompanyIdentifier.gycomSvenska.rawValue, 1516)
        XCTAssertEqual(CompanyIdentifier.gycomSvenska.name, #"Gycom Svenska AB"#)
        XCTAssertEqual(CompanyIdentifier.gycomSvenska.description, #"Gycom Svenska AB"#)
    
        // Fuji Xerox Co., Ltd
        XCTAssertEqual(CompanyIdentifier.fujiXerox.rawValue, 1517)
        XCTAssertEqual(CompanyIdentifier.fujiXerox.name, #"Fuji Xerox Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.fujiXerox.description, #"Fuji Xerox Co., Ltd"#)
    
        // Glide Inc.
        XCTAssertEqual(CompanyIdentifier.glide.rawValue, 1518)
        XCTAssertEqual(CompanyIdentifier.glide.name, #"Glide Inc."#)
        XCTAssertEqual(CompanyIdentifier.glide.description, #"Glide Inc."#)
    
        // SIKOM AS
        XCTAssertEqual(CompanyIdentifier.sikom.rawValue, 1519)
        XCTAssertEqual(CompanyIdentifier.sikom.name, #"SIKOM AS"#)
        XCTAssertEqual(CompanyIdentifier.sikom.description, #"SIKOM AS"#)
    
        // beken
        XCTAssertEqual(CompanyIdentifier.beken.rawValue, 1520)
        XCTAssertEqual(CompanyIdentifier.beken.name, #"beken"#)
        XCTAssertEqual(CompanyIdentifier.beken.description, #"beken"#)
    
        // The Linux Foundation
        XCTAssertEqual(CompanyIdentifier.linuxFoundation.rawValue, 1521)
        XCTAssertEqual(CompanyIdentifier.linuxFoundation.name, #"The Linux Foundation"#)
        XCTAssertEqual(CompanyIdentifier.linuxFoundation.description, #"The Linux Foundation"#)
    
        // Try and E CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.tryAndE.rawValue, 1522)
        XCTAssertEqual(CompanyIdentifier.tryAndE.name, #"Try and E CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.tryAndE.description, #"Try and E CO.,LTD."#)
    
        // SeeScan
        XCTAssertEqual(CompanyIdentifier.seescan.rawValue, 1523)
        XCTAssertEqual(CompanyIdentifier.seescan.name, #"SeeScan"#)
        XCTAssertEqual(CompanyIdentifier.seescan.description, #"SeeScan"#)
    
        // Clearity, LLC
        XCTAssertEqual(CompanyIdentifier.clearity.rawValue, 1524)
        XCTAssertEqual(CompanyIdentifier.clearity.name, #"Clearity, LLC"#)
        XCTAssertEqual(CompanyIdentifier.clearity.description, #"Clearity, LLC"#)
    
        // GS TAG
        XCTAssertEqual(CompanyIdentifier.gsTag.rawValue, 1525)
        XCTAssertEqual(CompanyIdentifier.gsTag.name, #"GS TAG"#)
        XCTAssertEqual(CompanyIdentifier.gsTag.description, #"GS TAG"#)
    
        // DPTechnics
        XCTAssertEqual(CompanyIdentifier.dptechnics.rawValue, 1526)
        XCTAssertEqual(CompanyIdentifier.dptechnics.name, #"DPTechnics"#)
        XCTAssertEqual(CompanyIdentifier.dptechnics.description, #"DPTechnics"#)
    
        // TRACMO, INC.
        XCTAssertEqual(CompanyIdentifier.tracmo.rawValue, 1527)
        XCTAssertEqual(CompanyIdentifier.tracmo.name, #"TRACMO, INC."#)
        XCTAssertEqual(CompanyIdentifier.tracmo.description, #"TRACMO, INC."#)
    
        // Anki Inc.
        XCTAssertEqual(CompanyIdentifier.anki.rawValue, 1528)
        XCTAssertEqual(CompanyIdentifier.anki.name, #"Anki Inc."#)
        XCTAssertEqual(CompanyIdentifier.anki.description, #"Anki Inc."#)
    
        // Hagleitner Hygiene International GmbH
        XCTAssertEqual(CompanyIdentifier.hagleitnerHygieneInternational.rawValue, 1529)
        XCTAssertEqual(CompanyIdentifier.hagleitnerHygieneInternational.name, #"Hagleitner Hygiene International GmbH"#)
        XCTAssertEqual(CompanyIdentifier.hagleitnerHygieneInternational.description, #"Hagleitner Hygiene International GmbH"#)
    
        // Konami Sports Life Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.konamiSportsLife.rawValue, 1530)
        XCTAssertEqual(CompanyIdentifier.konamiSportsLife.name, #"Konami Sports Life Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.konamiSportsLife.description, #"Konami Sports Life Co., Ltd."#)
    
        // Arblet Inc.
        XCTAssertEqual(CompanyIdentifier.arblet.rawValue, 1531)
        XCTAssertEqual(CompanyIdentifier.arblet.name, #"Arblet Inc."#)
        XCTAssertEqual(CompanyIdentifier.arblet.description, #"Arblet Inc."#)
    
        // Masbando GmbH
        XCTAssertEqual(CompanyIdentifier.masbando.rawValue, 1532)
        XCTAssertEqual(CompanyIdentifier.masbando.name, #"Masbando GmbH"#)
        XCTAssertEqual(CompanyIdentifier.masbando.description, #"Masbando GmbH"#)
    
        // Innoseis
        XCTAssertEqual(CompanyIdentifier.innoseis.rawValue, 1533)
        XCTAssertEqual(CompanyIdentifier.innoseis.name, #"Innoseis"#)
        XCTAssertEqual(CompanyIdentifier.innoseis.description, #"Innoseis"#)
    
        // Niko nv
        XCTAssertEqual(CompanyIdentifier.nikoNv.rawValue, 1534)
        XCTAssertEqual(CompanyIdentifier.nikoNv.name, #"Niko nv"#)
        XCTAssertEqual(CompanyIdentifier.nikoNv.description, #"Niko nv"#)
    
        // Wellnomics Ltd
        XCTAssertEqual(CompanyIdentifier.wellnomics.rawValue, 1535)
        XCTAssertEqual(CompanyIdentifier.wellnomics.name, #"Wellnomics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.wellnomics.description, #"Wellnomics Ltd"#)
    
        // iRobot Corporation
        XCTAssertEqual(CompanyIdentifier.irobot.rawValue, 1536)
        XCTAssertEqual(CompanyIdentifier.irobot.name, #"iRobot Corporation"#)
        XCTAssertEqual(CompanyIdentifier.irobot.description, #"iRobot Corporation"#)
    
        // Schrader Electronics
        XCTAssertEqual(CompanyIdentifier.schraderElectronics.rawValue, 1537)
        XCTAssertEqual(CompanyIdentifier.schraderElectronics.name, #"Schrader Electronics"#)
        XCTAssertEqual(CompanyIdentifier.schraderElectronics.description, #"Schrader Electronics"#)
    
        // Geberit International AG
        XCTAssertEqual(CompanyIdentifier.geberitInternational.rawValue, 1538)
        XCTAssertEqual(CompanyIdentifier.geberitInternational.name, #"Geberit International AG"#)
        XCTAssertEqual(CompanyIdentifier.geberitInternational.description, #"Geberit International AG"#)
    
        // Fourth Evolution Inc
        XCTAssertEqual(CompanyIdentifier.fourthEvolution.rawValue, 1539)
        XCTAssertEqual(CompanyIdentifier.fourthEvolution.name, #"Fourth Evolution Inc"#)
        XCTAssertEqual(CompanyIdentifier.fourthEvolution.description, #"Fourth Evolution Inc"#)
    
        // Cell2Jack LLC
        XCTAssertEqual(CompanyIdentifier.cell2Jack.rawValue, 1540)
        XCTAssertEqual(CompanyIdentifier.cell2Jack.name, #"Cell2Jack LLC"#)
        XCTAssertEqual(CompanyIdentifier.cell2Jack.description, #"Cell2Jack LLC"#)
    
        // FMW electronic Futterer u. Maier-Wolf OHG
        XCTAssertEqual(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.rawValue, 1541)
        XCTAssertEqual(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.name, #"FMW electronic Futterer u. Maier-Wolf OHG"#)
        XCTAssertEqual(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.description, #"FMW electronic Futterer u. Maier-Wolf OHG"#)
    
        // John Deere
        XCTAssertEqual(CompanyIdentifier.johnDeere.rawValue, 1542)
        XCTAssertEqual(CompanyIdentifier.johnDeere.name, #"John Deere"#)
        XCTAssertEqual(CompanyIdentifier.johnDeere.description, #"John Deere"#)
    
        // Rookery Technology Ltd
        XCTAssertEqual(CompanyIdentifier.rookeryTechnology.rawValue, 1543)
        XCTAssertEqual(CompanyIdentifier.rookeryTechnology.name, #"Rookery Technology Ltd"#)
        XCTAssertEqual(CompanyIdentifier.rookeryTechnology.description, #"Rookery Technology Ltd"#)
    
        // KeySafe-Cloud
        XCTAssertEqual(CompanyIdentifier.keysafeCloud.rawValue, 1544)
        XCTAssertEqual(CompanyIdentifier.keysafeCloud.name, #"KeySafe-Cloud"#)
        XCTAssertEqual(CompanyIdentifier.keysafeCloud.description, #"KeySafe-Cloud"#)
    
        // BUCHI Labortechnik AG
        XCTAssertEqual(CompanyIdentifier.buchiLabortechnik.rawValue, 1545)
        XCTAssertEqual(CompanyIdentifier.buchiLabortechnik.name, #"BUCHI Labortechnik AG"#)
        XCTAssertEqual(CompanyIdentifier.buchiLabortechnik.description, #"BUCHI Labortechnik AG"#)
    
        // IQAir AG
        XCTAssertEqual(CompanyIdentifier.iqair.rawValue, 1546)
        XCTAssertEqual(CompanyIdentifier.iqair.name, #"IQAir AG"#)
        XCTAssertEqual(CompanyIdentifier.iqair.description, #"IQAir AG"#)
    
        // Triax Technologies Inc
        XCTAssertEqual(CompanyIdentifier.triaxTechnologies.rawValue, 1547)
        XCTAssertEqual(CompanyIdentifier.triaxTechnologies.name, #"Triax Technologies Inc"#)
        XCTAssertEqual(CompanyIdentifier.triaxTechnologies.description, #"Triax Technologies Inc"#)
    
        // Vuzix Corporation
        XCTAssertEqual(CompanyIdentifier.vuzix.rawValue, 1548)
        XCTAssertEqual(CompanyIdentifier.vuzix.name, #"Vuzix Corporation"#)
        XCTAssertEqual(CompanyIdentifier.vuzix.description, #"Vuzix Corporation"#)
    
        // TDK Corporation
        XCTAssertEqual(CompanyIdentifier.tdk.rawValue, 1549)
        XCTAssertEqual(CompanyIdentifier.tdk.name, #"TDK Corporation"#)
        XCTAssertEqual(CompanyIdentifier.tdk.description, #"TDK Corporation"#)
    
        // Blueair AB
        XCTAssertEqual(CompanyIdentifier.blueair.rawValue, 1550)
        XCTAssertEqual(CompanyIdentifier.blueair.name, #"Blueair AB"#)
        XCTAssertEqual(CompanyIdentifier.blueair.description, #"Blueair AB"#)
    
        // Signify Netherlands
        XCTAssertEqual(CompanyIdentifier.signifyNetherlands.rawValue, 1551)
        XCTAssertEqual(CompanyIdentifier.signifyNetherlands.name, #"Signify Netherlands"#)
        XCTAssertEqual(CompanyIdentifier.signifyNetherlands.description, #"Signify Netherlands"#)
    
        // ADH GUARDIAN USA LLC
        XCTAssertEqual(CompanyIdentifier.adhGuardian.rawValue, 1552)
        XCTAssertEqual(CompanyIdentifier.adhGuardian.name, #"ADH GUARDIAN USA LLC"#)
        XCTAssertEqual(CompanyIdentifier.adhGuardian.description, #"ADH GUARDIAN USA LLC"#)
    
        // Beurer GmbH
        XCTAssertEqual(CompanyIdentifier.beurer.rawValue, 1553)
        XCTAssertEqual(CompanyIdentifier.beurer.name, #"Beurer GmbH"#)
        XCTAssertEqual(CompanyIdentifier.beurer.description, #"Beurer GmbH"#)
    
        // Playfinity AS
        XCTAssertEqual(CompanyIdentifier.playfinity.rawValue, 1554)
        XCTAssertEqual(CompanyIdentifier.playfinity.name, #"Playfinity AS"#)
        XCTAssertEqual(CompanyIdentifier.playfinity.description, #"Playfinity AS"#)
    
        // Hans Dinslage GmbH
        XCTAssertEqual(CompanyIdentifier.hansDinslage.rawValue, 1555)
        XCTAssertEqual(CompanyIdentifier.hansDinslage.name, #"Hans Dinslage GmbH"#)
        XCTAssertEqual(CompanyIdentifier.hansDinslage.description, #"Hans Dinslage GmbH"#)
    
        // OnAsset Intelligence, Inc.
        XCTAssertEqual(CompanyIdentifier.onassetIntelligence.rawValue, 1556)
        XCTAssertEqual(CompanyIdentifier.onassetIntelligence.name, #"OnAsset Intelligence, Inc."#)
        XCTAssertEqual(CompanyIdentifier.onassetIntelligence.description, #"OnAsset Intelligence, Inc."#)
    
        // INTER ACTION Corporation
        XCTAssertEqual(CompanyIdentifier.interAction.rawValue, 1557)
        XCTAssertEqual(CompanyIdentifier.interAction.name, #"INTER ACTION Corporation"#)
        XCTAssertEqual(CompanyIdentifier.interAction.description, #"INTER ACTION Corporation"#)
    
        // OS42 UG (haftungsbeschraenkt)
        XCTAssertEqual(CompanyIdentifier.os42UgHaftungsbeschraenkt.rawValue, 1558)
        XCTAssertEqual(CompanyIdentifier.os42UgHaftungsbeschraenkt.name, #"OS42 UG (haftungsbeschraenkt)"#)
        XCTAssertEqual(CompanyIdentifier.os42UgHaftungsbeschraenkt.description, #"OS42 UG (haftungsbeschraenkt)"#)
    
        // WIZCONNECTED COMPANY LIMITED
        XCTAssertEqual(CompanyIdentifier.wizconnectedCompany.rawValue, 1559)
        XCTAssertEqual(CompanyIdentifier.wizconnectedCompany.name, #"WIZCONNECTED COMPANY LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.wizconnectedCompany.description, #"WIZCONNECTED COMPANY LIMITED"#)
    
        // Audio-Technica Corporation
        XCTAssertEqual(CompanyIdentifier.audioTechnica.rawValue, 1560)
        XCTAssertEqual(CompanyIdentifier.audioTechnica.name, #"Audio-Technica Corporation"#)
        XCTAssertEqual(CompanyIdentifier.audioTechnica.description, #"Audio-Technica Corporation"#)
    
        // Six Guys Labs, s.r.o.
        XCTAssertEqual(CompanyIdentifier.sixGuysLabs.rawValue, 1561)
        XCTAssertEqual(CompanyIdentifier.sixGuysLabs.name, #"Six Guys Labs, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.sixGuysLabs.description, #"Six Guys Labs, s.r.o."#)
    
        // R.W. Beckett Corporation
        XCTAssertEqual(CompanyIdentifier.rWBeckett.rawValue, 1562)
        XCTAssertEqual(CompanyIdentifier.rWBeckett.name, #"R.W. Beckett Corporation"#)
        XCTAssertEqual(CompanyIdentifier.rWBeckett.description, #"R.W. Beckett Corporation"#)
    
        // silex technology, inc.
        XCTAssertEqual(CompanyIdentifier.silexTechnology.rawValue, 1563)
        XCTAssertEqual(CompanyIdentifier.silexTechnology.name, #"silex technology, inc."#)
        XCTAssertEqual(CompanyIdentifier.silexTechnology.description, #"silex technology, inc."#)
    
        // Univations Limited
        XCTAssertEqual(CompanyIdentifier.univations.rawValue, 1564)
        XCTAssertEqual(CompanyIdentifier.univations.name, #"Univations Limited"#)
        XCTAssertEqual(CompanyIdentifier.univations.description, #"Univations Limited"#)
    
        // SENS Innovation ApS
        XCTAssertEqual(CompanyIdentifier.sensInnovation.rawValue, 1565)
        XCTAssertEqual(CompanyIdentifier.sensInnovation.name, #"SENS Innovation ApS"#)
        XCTAssertEqual(CompanyIdentifier.sensInnovation.description, #"SENS Innovation ApS"#)
    
        // Diamond Kinetics, Inc.
        XCTAssertEqual(CompanyIdentifier.diamondKinetics.rawValue, 1566)
        XCTAssertEqual(CompanyIdentifier.diamondKinetics.name, #"Diamond Kinetics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.diamondKinetics.description, #"Diamond Kinetics, Inc."#)
    
        // Phrame Inc.
        XCTAssertEqual(CompanyIdentifier.phrame.rawValue, 1567)
        XCTAssertEqual(CompanyIdentifier.phrame.name, #"Phrame Inc."#)
        XCTAssertEqual(CompanyIdentifier.phrame.description, #"Phrame Inc."#)
    
        // Forciot Oy
        XCTAssertEqual(CompanyIdentifier.forciot.rawValue, 1568)
        XCTAssertEqual(CompanyIdentifier.forciot.name, #"Forciot Oy"#)
        XCTAssertEqual(CompanyIdentifier.forciot.description, #"Forciot Oy"#)
    
        // Noordung d.o.o.
        XCTAssertEqual(CompanyIdentifier.noordung.rawValue, 1569)
        XCTAssertEqual(CompanyIdentifier.noordung.name, #"Noordung d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.noordung.description, #"Noordung d.o.o."#)
    
        // Beam Labs, LLC
        XCTAssertEqual(CompanyIdentifier.beamLabs.rawValue, 1570)
        XCTAssertEqual(CompanyIdentifier.beamLabs.name, #"Beam Labs, LLC"#)
        XCTAssertEqual(CompanyIdentifier.beamLabs.description, #"Beam Labs, LLC"#)
    
        // Philadelphia Scientific (U.K.) Limited
        XCTAssertEqual(CompanyIdentifier.philadelphiaScientificUK.rawValue, 1571)
        XCTAssertEqual(CompanyIdentifier.philadelphiaScientificUK.name, #"Philadelphia Scientific (U.K.) Limited"#)
        XCTAssertEqual(CompanyIdentifier.philadelphiaScientificUK.description, #"Philadelphia Scientific (U.K.) Limited"#)
    
        // Biovotion AG
        XCTAssertEqual(CompanyIdentifier.biovotion.rawValue, 1572)
        XCTAssertEqual(CompanyIdentifier.biovotion.name, #"Biovotion AG"#)
        XCTAssertEqual(CompanyIdentifier.biovotion.description, #"Biovotion AG"#)
    
        // Square Panda, Inc.
        XCTAssertEqual(CompanyIdentifier.squarePanda.rawValue, 1573)
        XCTAssertEqual(CompanyIdentifier.squarePanda.name, #"Square Panda, Inc."#)
        XCTAssertEqual(CompanyIdentifier.squarePanda.description, #"Square Panda, Inc."#)
    
        // Amplifico
        XCTAssertEqual(CompanyIdentifier.amplifico.rawValue, 1574)
        XCTAssertEqual(CompanyIdentifier.amplifico.name, #"Amplifico"#)
        XCTAssertEqual(CompanyIdentifier.amplifico.description, #"Amplifico"#)
    
        // WEG S.A.
        XCTAssertEqual(CompanyIdentifier.weg.rawValue, 1575)
        XCTAssertEqual(CompanyIdentifier.weg.name, #"WEG S.A."#)
        XCTAssertEqual(CompanyIdentifier.weg.description, #"WEG S.A."#)
    
        // Ensto Oy
        XCTAssertEqual(CompanyIdentifier.ensto.rawValue, 1576)
        XCTAssertEqual(CompanyIdentifier.ensto.name, #"Ensto Oy"#)
        XCTAssertEqual(CompanyIdentifier.ensto.description, #"Ensto Oy"#)
    
        // PHONEPE PVT LTD
        XCTAssertEqual(CompanyIdentifier.phonepePvt.rawValue, 1577)
        XCTAssertEqual(CompanyIdentifier.phonepePvt.name, #"PHONEPE PVT LTD"#)
        XCTAssertEqual(CompanyIdentifier.phonepePvt.description, #"PHONEPE PVT LTD"#)
    
        // Lunatico Astronomia SL
        XCTAssertEqual(CompanyIdentifier.lunaticoAstronomiaSl.rawValue, 1578)
        XCTAssertEqual(CompanyIdentifier.lunaticoAstronomiaSl.name, #"Lunatico Astronomia SL"#)
        XCTAssertEqual(CompanyIdentifier.lunaticoAstronomiaSl.description, #"Lunatico Astronomia SL"#)
    
        // MinebeaMitsumi Inc.
        XCTAssertEqual(CompanyIdentifier.minebeamitsumi.rawValue, 1579)
        XCTAssertEqual(CompanyIdentifier.minebeamitsumi.name, #"MinebeaMitsumi Inc."#)
        XCTAssertEqual(CompanyIdentifier.minebeamitsumi.description, #"MinebeaMitsumi Inc."#)
    
        // ASPion GmbH
        XCTAssertEqual(CompanyIdentifier.aspion.rawValue, 1580)
        XCTAssertEqual(CompanyIdentifier.aspion.name, #"ASPion GmbH"#)
        XCTAssertEqual(CompanyIdentifier.aspion.description, #"ASPion GmbH"#)
    
        // Vossloh-Schwabe Deutschland GmbH
        XCTAssertEqual(CompanyIdentifier.vosslohSchwabeDeutschland.rawValue, 1581)
        XCTAssertEqual(CompanyIdentifier.vosslohSchwabeDeutschland.name, #"Vossloh-Schwabe Deutschland GmbH"#)
        XCTAssertEqual(CompanyIdentifier.vosslohSchwabeDeutschland.description, #"Vossloh-Schwabe Deutschland GmbH"#)
    
        // Procept
        XCTAssertEqual(CompanyIdentifier.procept.rawValue, 1582)
        XCTAssertEqual(CompanyIdentifier.procept.name, #"Procept"#)
        XCTAssertEqual(CompanyIdentifier.procept.description, #"Procept"#)
    
        // ONKYO Corporation
        XCTAssertEqual(CompanyIdentifier.onkyo.rawValue, 1583)
        XCTAssertEqual(CompanyIdentifier.onkyo.name, #"ONKYO Corporation"#)
        XCTAssertEqual(CompanyIdentifier.onkyo.description, #"ONKYO Corporation"#)
    
        // Asthrea D.O.O.
        XCTAssertEqual(CompanyIdentifier.asthrea.rawValue, 1584)
        XCTAssertEqual(CompanyIdentifier.asthrea.name, #"Asthrea D.O.O."#)
        XCTAssertEqual(CompanyIdentifier.asthrea.description, #"Asthrea D.O.O."#)
    
        // Fortiori Design LLC
        XCTAssertEqual(CompanyIdentifier.fortioriDesign.rawValue, 1585)
        XCTAssertEqual(CompanyIdentifier.fortioriDesign.name, #"Fortiori Design LLC"#)
        XCTAssertEqual(CompanyIdentifier.fortioriDesign.description, #"Fortiori Design LLC"#)
    
        // Hugo Muller GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.hugoMuller.rawValue, 1586)
        XCTAssertEqual(CompanyIdentifier.hugoMuller.name, #"Hugo Muller GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.hugoMuller.description, #"Hugo Muller GmbH & Co KG"#)
    
        // Wangi Lai PLT
        XCTAssertEqual(CompanyIdentifier.wangiLaiPlt.rawValue, 1587)
        XCTAssertEqual(CompanyIdentifier.wangiLaiPlt.name, #"Wangi Lai PLT"#)
        XCTAssertEqual(CompanyIdentifier.wangiLaiPlt.description, #"Wangi Lai PLT"#)
    
        // Fanstel Corp
        XCTAssertEqual(CompanyIdentifier.fanstel.rawValue, 1588)
        XCTAssertEqual(CompanyIdentifier.fanstel.name, #"Fanstel Corp"#)
        XCTAssertEqual(CompanyIdentifier.fanstel.description, #"Fanstel Corp"#)
    
        // Crookwood
        XCTAssertEqual(CompanyIdentifier.crookwood.rawValue, 1589)
        XCTAssertEqual(CompanyIdentifier.crookwood.name, #"Crookwood"#)
        XCTAssertEqual(CompanyIdentifier.crookwood.description, #"Crookwood"#)
    
        // ELECTRONICA INTEGRAL DE SONIDO S.A.
        XCTAssertEqual(CompanyIdentifier.electronicaIntegralDeSonido.rawValue, 1590)
        XCTAssertEqual(CompanyIdentifier.electronicaIntegralDeSonido.name, #"ELECTRONICA INTEGRAL DE SONIDO S.A."#)
        XCTAssertEqual(CompanyIdentifier.electronicaIntegralDeSonido.description, #"ELECTRONICA INTEGRAL DE SONIDO S.A."#)
    
        // GiP Innovation Tools GmbH
        XCTAssertEqual(CompanyIdentifier.gipInnovationTools.rawValue, 1591)
        XCTAssertEqual(CompanyIdentifier.gipInnovationTools.name, #"GiP Innovation Tools GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gipInnovationTools.description, #"GiP Innovation Tools GmbH"#)
    
        // LX SOLUTIONS PTY LIMITED
        XCTAssertEqual(CompanyIdentifier.lxSolutionsPty.rawValue, 1592)
        XCTAssertEqual(CompanyIdentifier.lxSolutionsPty.name, #"LX SOLUTIONS PTY LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.lxSolutionsPty.description, #"LX SOLUTIONS PTY LIMITED"#)
    
        // Shenzhen Minew Technologies Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenMinewTechnologies.rawValue, 1593)
        XCTAssertEqual(CompanyIdentifier.shenzhenMinewTechnologies.name, #"Shenzhen Minew Technologies Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenMinewTechnologies.description, #"Shenzhen Minew Technologies Co., Ltd."#)
    
        // Prolojik Limited
        XCTAssertEqual(CompanyIdentifier.prolojik.rawValue, 1594)
        XCTAssertEqual(CompanyIdentifier.prolojik.name, #"Prolojik Limited"#)
        XCTAssertEqual(CompanyIdentifier.prolojik.description, #"Prolojik Limited"#)
    
        // Kromek Group Plc
        XCTAssertEqual(CompanyIdentifier.kromekGroupPlc.rawValue, 1595)
        XCTAssertEqual(CompanyIdentifier.kromekGroupPlc.name, #"Kromek Group Plc"#)
        XCTAssertEqual(CompanyIdentifier.kromekGroupPlc.description, #"Kromek Group Plc"#)
    
        // Contec Medical Systems Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.contecMedicalSystems.rawValue, 1596)
        XCTAssertEqual(CompanyIdentifier.contecMedicalSystems.name, #"Contec Medical Systems Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.contecMedicalSystems.description, #"Contec Medical Systems Co., Ltd."#)
    
        // Xradio Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.xradioTechnology.rawValue, 1597)
        XCTAssertEqual(CompanyIdentifier.xradioTechnology.name, #"Xradio Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.xradioTechnology.description, #"Xradio Technology Co.,Ltd."#)
    
        // The Indoor Lab, LLC
        XCTAssertEqual(CompanyIdentifier.indoorLab.rawValue, 1598)
        XCTAssertEqual(CompanyIdentifier.indoorLab.name, #"The Indoor Lab, LLC"#)
        XCTAssertEqual(CompanyIdentifier.indoorLab.description, #"The Indoor Lab, LLC"#)
    
        // LDL TECHNOLOGY
        XCTAssertEqual(CompanyIdentifier.ldlTechnology.rawValue, 1599)
        XCTAssertEqual(CompanyIdentifier.ldlTechnology.name, #"LDL TECHNOLOGY"#)
        XCTAssertEqual(CompanyIdentifier.ldlTechnology.description, #"LDL TECHNOLOGY"#)
    
        // Dish Network LLC
        XCTAssertEqual(CompanyIdentifier.dishNetwork.rawValue, 1600)
        XCTAssertEqual(CompanyIdentifier.dishNetwork.name, #"Dish Network LLC"#)
        XCTAssertEqual(CompanyIdentifier.dishNetwork.description, #"Dish Network LLC"#)
    
        // Revenue Collection Systems FRANCE SAS
        XCTAssertEqual(CompanyIdentifier.revenueCollectionSystemsFrances.rawValue, 1601)
        XCTAssertEqual(CompanyIdentifier.revenueCollectionSystemsFrances.name, #"Revenue Collection Systems FRANCE SAS"#)
        XCTAssertEqual(CompanyIdentifier.revenueCollectionSystemsFrances.description, #"Revenue Collection Systems FRANCE SAS"#)
    
        // Bluetrum Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.bluetrumTechnology.rawValue, 1602)
        XCTAssertEqual(CompanyIdentifier.bluetrumTechnology.name, #"Bluetrum Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.bluetrumTechnology.description, #"Bluetrum Technology Co.,Ltd"#)
    
        // makita corporation
        XCTAssertEqual(CompanyIdentifier.makita.rawValue, 1603)
        XCTAssertEqual(CompanyIdentifier.makita.name, #"makita corporation"#)
        XCTAssertEqual(CompanyIdentifier.makita.description, #"makita corporation"#)
    
        // Apogee Instruments
        XCTAssertEqual(CompanyIdentifier.apogeeInstruments.rawValue, 1604)
        XCTAssertEqual(CompanyIdentifier.apogeeInstruments.name, #"Apogee Instruments"#)
        XCTAssertEqual(CompanyIdentifier.apogeeInstruments.description, #"Apogee Instruments"#)
    
        // BM3
        XCTAssertEqual(CompanyIdentifier.bm3.rawValue, 1605)
        XCTAssertEqual(CompanyIdentifier.bm3.name, #"BM3"#)
        XCTAssertEqual(CompanyIdentifier.bm3.description, #"BM3"#)
    
        // SGV Group Holding GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.sgvGroupHolding.rawValue, 1606)
        XCTAssertEqual(CompanyIdentifier.sgvGroupHolding.name, #"SGV Group Holding GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.sgvGroupHolding.description, #"SGV Group Holding GmbH & Co. KG"#)
    
        // MED-EL
        XCTAssertEqual(CompanyIdentifier.medEl.rawValue, 1607)
        XCTAssertEqual(CompanyIdentifier.medEl.name, #"MED-EL"#)
        XCTAssertEqual(CompanyIdentifier.medEl.description, #"MED-EL"#)
    
        // Ultune Technologies
        XCTAssertEqual(CompanyIdentifier.ultuneTechnologies.rawValue, 1608)
        XCTAssertEqual(CompanyIdentifier.ultuneTechnologies.name, #"Ultune Technologies"#)
        XCTAssertEqual(CompanyIdentifier.ultuneTechnologies.description, #"Ultune Technologies"#)
    
        // Ryeex Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.ryeexTechnology.rawValue, 1609)
        XCTAssertEqual(CompanyIdentifier.ryeexTechnology.name, #"Ryeex Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.ryeexTechnology.description, #"Ryeex Technology Co.,Ltd."#)
    
        // Open Research Institute, Inc.
        XCTAssertEqual(CompanyIdentifier.openResearchInstitute.rawValue, 1610)
        XCTAssertEqual(CompanyIdentifier.openResearchInstitute.name, #"Open Research Institute, Inc."#)
        XCTAssertEqual(CompanyIdentifier.openResearchInstitute.description, #"Open Research Institute, Inc."#)
    
        // Scale-Tec, Ltd
        XCTAssertEqual(CompanyIdentifier.scaleTec.rawValue, 1611)
        XCTAssertEqual(CompanyIdentifier.scaleTec.name, #"Scale-Tec, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.scaleTec.description, #"Scale-Tec, Ltd"#)
    
        // Zumtobel Group AG
        XCTAssertEqual(CompanyIdentifier.zumtobelGroup.rawValue, 1612)
        XCTAssertEqual(CompanyIdentifier.zumtobelGroup.name, #"Zumtobel Group AG"#)
        XCTAssertEqual(CompanyIdentifier.zumtobelGroup.description, #"Zumtobel Group AG"#)
    
        // iLOQ Oy
        XCTAssertEqual(CompanyIdentifier.iloq.rawValue, 1613)
        XCTAssertEqual(CompanyIdentifier.iloq.name, #"iLOQ Oy"#)
        XCTAssertEqual(CompanyIdentifier.iloq.description, #"iLOQ Oy"#)
    
        // KRUXWorks Technologies Private Limited
        XCTAssertEqual(CompanyIdentifier.kruxworksTechnologies.rawValue, 1614)
        XCTAssertEqual(CompanyIdentifier.kruxworksTechnologies.name, #"KRUXWorks Technologies Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.kruxworksTechnologies.description, #"KRUXWorks Technologies Private Limited"#)
    
        // Digital Matter Pty Ltd
        XCTAssertEqual(CompanyIdentifier.digitalMatterPty.rawValue, 1615)
        XCTAssertEqual(CompanyIdentifier.digitalMatterPty.name, #"Digital Matter Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.digitalMatterPty.description, #"Digital Matter Pty Ltd"#)
    
        // Coravin, Inc.
        XCTAssertEqual(CompanyIdentifier.coravin.rawValue, 1616)
        XCTAssertEqual(CompanyIdentifier.coravin.name, #"Coravin, Inc."#)
        XCTAssertEqual(CompanyIdentifier.coravin.description, #"Coravin, Inc."#)
    
        // Stasis Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.stasisLabs.rawValue, 1617)
        XCTAssertEqual(CompanyIdentifier.stasisLabs.name, #"Stasis Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.stasisLabs.description, #"Stasis Labs, Inc."#)
    
        // ITZ Innovations- und Technologiezentrum GmbH
        XCTAssertEqual(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.rawValue, 1618)
        XCTAssertEqual(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.name, #"ITZ Innovations- und Technologiezentrum GmbH"#)
        XCTAssertEqual(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.description, #"ITZ Innovations- und Technologiezentrum GmbH"#)
    
        // Meggitt SA
        XCTAssertEqual(CompanyIdentifier.meggitt.rawValue, 1619)
        XCTAssertEqual(CompanyIdentifier.meggitt.name, #"Meggitt SA"#)
        XCTAssertEqual(CompanyIdentifier.meggitt.description, #"Meggitt SA"#)
    
        // Ledlenser GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.ledlenser.rawValue, 1620)
        XCTAssertEqual(CompanyIdentifier.ledlenser.name, #"Ledlenser GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.ledlenser.description, #"Ledlenser GmbH & Co. KG"#)
    
        // Renishaw PLC
        XCTAssertEqual(CompanyIdentifier.renishawPlc.rawValue, 1621)
        XCTAssertEqual(CompanyIdentifier.renishawPlc.name, #"Renishaw PLC"#)
        XCTAssertEqual(CompanyIdentifier.renishawPlc.description, #"Renishaw PLC"#)
    
        // ZhuHai AdvanPro Technology Company Limited
        XCTAssertEqual(CompanyIdentifier.zhuhaiAdvanproTechnologyCompany.rawValue, 1622)
        XCTAssertEqual(CompanyIdentifier.zhuhaiAdvanproTechnologyCompany.name, #"ZhuHai AdvanPro Technology Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.zhuhaiAdvanproTechnologyCompany.description, #"ZhuHai AdvanPro Technology Company Limited"#)
    
        // Meshtronix Limited
        XCTAssertEqual(CompanyIdentifier.meshtronix.rawValue, 1623)
        XCTAssertEqual(CompanyIdentifier.meshtronix.name, #"Meshtronix Limited"#)
        XCTAssertEqual(CompanyIdentifier.meshtronix.description, #"Meshtronix Limited"#)
    
        // Payex Norge AS
        XCTAssertEqual(CompanyIdentifier.payexNorge.rawValue, 1624)
        XCTAssertEqual(CompanyIdentifier.payexNorge.name, #"Payex Norge AS"#)
        XCTAssertEqual(CompanyIdentifier.payexNorge.description, #"Payex Norge AS"#)
    
        // UnSeen Technologies Oy
        XCTAssertEqual(CompanyIdentifier.unseenTechnologies.rawValue, 1625)
        XCTAssertEqual(CompanyIdentifier.unseenTechnologies.name, #"UnSeen Technologies Oy"#)
        XCTAssertEqual(CompanyIdentifier.unseenTechnologies.description, #"UnSeen Technologies Oy"#)
    
        // Zound Industries International AB
        XCTAssertEqual(CompanyIdentifier.zoundIndustriesInternational.rawValue, 1626)
        XCTAssertEqual(CompanyIdentifier.zoundIndustriesInternational.name, #"Zound Industries International AB"#)
        XCTAssertEqual(CompanyIdentifier.zoundIndustriesInternational.description, #"Zound Industries International AB"#)
    
        // Sesam Solutions BV
        XCTAssertEqual(CompanyIdentifier.sesamSolutions.rawValue, 1627)
        XCTAssertEqual(CompanyIdentifier.sesamSolutions.name, #"Sesam Solutions BV"#)
        XCTAssertEqual(CompanyIdentifier.sesamSolutions.description, #"Sesam Solutions BV"#)
    
        // PixArt Imaging Inc.
        XCTAssertEqual(CompanyIdentifier.pixartImaging.rawValue, 1628)
        XCTAssertEqual(CompanyIdentifier.pixartImaging.name, #"PixArt Imaging Inc."#)
        XCTAssertEqual(CompanyIdentifier.pixartImaging.description, #"PixArt Imaging Inc."#)
    
        // Panduit Corp.
        XCTAssertEqual(CompanyIdentifier.panduit.rawValue, 1629)
        XCTAssertEqual(CompanyIdentifier.panduit.name, #"Panduit Corp."#)
        XCTAssertEqual(CompanyIdentifier.panduit.description, #"Panduit Corp."#)
    
        // Alo AB
        XCTAssertEqual(CompanyIdentifier.alo.rawValue, 1630)
        XCTAssertEqual(CompanyIdentifier.alo.name, #"Alo AB"#)
        XCTAssertEqual(CompanyIdentifier.alo.description, #"Alo AB"#)
    
        // Ricoh Company Ltd
        XCTAssertEqual(CompanyIdentifier.ricohCompany.rawValue, 1631)
        XCTAssertEqual(CompanyIdentifier.ricohCompany.name, #"Ricoh Company Ltd"#)
        XCTAssertEqual(CompanyIdentifier.ricohCompany.description, #"Ricoh Company Ltd"#)
    
        // RTC Industries, Inc.
        XCTAssertEqual(CompanyIdentifier.rtcIndustries.rawValue, 1632)
        XCTAssertEqual(CompanyIdentifier.rtcIndustries.name, #"RTC Industries, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rtcIndustries.description, #"RTC Industries, Inc."#)
    
        // Mode Lighting Limited
        XCTAssertEqual(CompanyIdentifier.modeLighting.rawValue, 1633)
        XCTAssertEqual(CompanyIdentifier.modeLighting.name, #"Mode Lighting Limited"#)
        XCTAssertEqual(CompanyIdentifier.modeLighting.description, #"Mode Lighting Limited"#)
    
        // Particle Industries, Inc.
        XCTAssertEqual(CompanyIdentifier.particleIndustries.rawValue, 1634)
        XCTAssertEqual(CompanyIdentifier.particleIndustries.name, #"Particle Industries, Inc."#)
        XCTAssertEqual(CompanyIdentifier.particleIndustries.description, #"Particle Industries, Inc."#)
    
        // Advanced Telemetry Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.advancedTelemetrySystems.rawValue, 1635)
        XCTAssertEqual(CompanyIdentifier.advancedTelemetrySystems.name, #"Advanced Telemetry Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.advancedTelemetrySystems.description, #"Advanced Telemetry Systems, Inc."#)
    
        // RHA TECHNOLOGIES LTD
        XCTAssertEqual(CompanyIdentifier.rhaTechnologies.rawValue, 1636)
        XCTAssertEqual(CompanyIdentifier.rhaTechnologies.name, #"RHA TECHNOLOGIES LTD"#)
        XCTAssertEqual(CompanyIdentifier.rhaTechnologies.description, #"RHA TECHNOLOGIES LTD"#)
    
        // Pure International Limited
        XCTAssertEqual(CompanyIdentifier.pureInternational.rawValue, 1637)
        XCTAssertEqual(CompanyIdentifier.pureInternational.name, #"Pure International Limited"#)
        XCTAssertEqual(CompanyIdentifier.pureInternational.description, #"Pure International Limited"#)
    
        // WTO Werkzeug-Einrichtungen GmbH
        XCTAssertEqual(CompanyIdentifier.wtoWerkzeugEinrichtungen.rawValue, 1638)
        XCTAssertEqual(CompanyIdentifier.wtoWerkzeugEinrichtungen.name, #"WTO Werkzeug-Einrichtungen GmbH"#)
        XCTAssertEqual(CompanyIdentifier.wtoWerkzeugEinrichtungen.description, #"WTO Werkzeug-Einrichtungen GmbH"#)
    
        // Spark Technology Labs Inc.
        XCTAssertEqual(CompanyIdentifier.sparkTechnologyLabs.rawValue, 1639)
        XCTAssertEqual(CompanyIdentifier.sparkTechnologyLabs.name, #"Spark Technology Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.sparkTechnologyLabs.description, #"Spark Technology Labs Inc."#)
    
        // Bleb Technology srl
        XCTAssertEqual(CompanyIdentifier.blebTechnology.rawValue, 1640)
        XCTAssertEqual(CompanyIdentifier.blebTechnology.name, #"Bleb Technology srl"#)
        XCTAssertEqual(CompanyIdentifier.blebTechnology.description, #"Bleb Technology srl"#)
    
        // Livanova USA, Inc.
        XCTAssertEqual(CompanyIdentifier.livanova.rawValue, 1641)
        XCTAssertEqual(CompanyIdentifier.livanova.name, #"Livanova USA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.livanova.description, #"Livanova USA, Inc."#)
    
        // Brady Worldwide Inc.
        XCTAssertEqual(CompanyIdentifier.bradyWorldwide.rawValue, 1642)
        XCTAssertEqual(CompanyIdentifier.bradyWorldwide.name, #"Brady Worldwide Inc."#)
        XCTAssertEqual(CompanyIdentifier.bradyWorldwide.description, #"Brady Worldwide Inc."#)
    
        // DewertOkin GmbH
        XCTAssertEqual(CompanyIdentifier.dewertokin.rawValue, 1643)
        XCTAssertEqual(CompanyIdentifier.dewertokin.name, #"DewertOkin GmbH"#)
        XCTAssertEqual(CompanyIdentifier.dewertokin.description, #"DewertOkin GmbH"#)
    
        // Ztove ApS
        XCTAssertEqual(CompanyIdentifier.ztove.rawValue, 1644)
        XCTAssertEqual(CompanyIdentifier.ztove.name, #"Ztove ApS"#)
        XCTAssertEqual(CompanyIdentifier.ztove.description, #"Ztove ApS"#)
    
        // Venso EcoSolutions AB
        XCTAssertEqual(CompanyIdentifier.vensoEcosolutions.rawValue, 1645)
        XCTAssertEqual(CompanyIdentifier.vensoEcosolutions.name, #"Venso EcoSolutions AB"#)
        XCTAssertEqual(CompanyIdentifier.vensoEcosolutions.description, #"Venso EcoSolutions AB"#)
    
        // Eurotronik Kranj d.o.o.
        XCTAssertEqual(CompanyIdentifier.eurotronikKranj.rawValue, 1646)
        XCTAssertEqual(CompanyIdentifier.eurotronikKranj.name, #"Eurotronik Kranj d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.eurotronikKranj.description, #"Eurotronik Kranj d.o.o."#)
    
        // Hug Technology Ltd
        XCTAssertEqual(CompanyIdentifier.hugTechnology.rawValue, 1647)
        XCTAssertEqual(CompanyIdentifier.hugTechnology.name, #"Hug Technology Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hugTechnology.description, #"Hug Technology Ltd"#)
    
        // Gema Switzerland GmbH
        XCTAssertEqual(CompanyIdentifier.gemaSwitzerland.rawValue, 1648)
        XCTAssertEqual(CompanyIdentifier.gemaSwitzerland.name, #"Gema Switzerland GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gemaSwitzerland.description, #"Gema Switzerland GmbH"#)
    
        // Buzz Products Ltd.
        XCTAssertEqual(CompanyIdentifier.buzzProducts.rawValue, 1649)
        XCTAssertEqual(CompanyIdentifier.buzzProducts.name, #"Buzz Products Ltd."#)
        XCTAssertEqual(CompanyIdentifier.buzzProducts.description, #"Buzz Products Ltd."#)
    
        // Kopi
        XCTAssertEqual(CompanyIdentifier.kopi.rawValue, 1650)
        XCTAssertEqual(CompanyIdentifier.kopi.name, #"Kopi"#)
        XCTAssertEqual(CompanyIdentifier.kopi.description, #"Kopi"#)
    
        // Innova Ideas Limited
        XCTAssertEqual(CompanyIdentifier.innovaIdeas.rawValue, 1651)
        XCTAssertEqual(CompanyIdentifier.innovaIdeas.name, #"Innova Ideas Limited"#)
        XCTAssertEqual(CompanyIdentifier.innovaIdeas.description, #"Innova Ideas Limited"#)
    
        // BeSpoon
        XCTAssertEqual(CompanyIdentifier.bespoon.rawValue, 1652)
        XCTAssertEqual(CompanyIdentifier.bespoon.name, #"BeSpoon"#)
        XCTAssertEqual(CompanyIdentifier.bespoon.description, #"BeSpoon"#)
    
        // Deco Enterprises, Inc.
        XCTAssertEqual(CompanyIdentifier.decoEnterprises.rawValue, 1653)
        XCTAssertEqual(CompanyIdentifier.decoEnterprises.name, #"Deco Enterprises, Inc."#)
        XCTAssertEqual(CompanyIdentifier.decoEnterprises.description, #"Deco Enterprises, Inc."#)
    
        // Expai Solutions Private Limited
        XCTAssertEqual(CompanyIdentifier.expaiSolutions.rawValue, 1654)
        XCTAssertEqual(CompanyIdentifier.expaiSolutions.name, #"Expai Solutions Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.expaiSolutions.description, #"Expai Solutions Private Limited"#)
    
        // Innovation First, Inc.
        XCTAssertEqual(CompanyIdentifier.innovationFirst.rawValue, 1655)
        XCTAssertEqual(CompanyIdentifier.innovationFirst.name, #"Innovation First, Inc."#)
        XCTAssertEqual(CompanyIdentifier.innovationFirst.description, #"Innovation First, Inc."#)
    
        // SABIK Offshore GmbH
        XCTAssertEqual(CompanyIdentifier.sabikOffshore.rawValue, 1656)
        XCTAssertEqual(CompanyIdentifier.sabikOffshore.name, #"SABIK Offshore GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sabikOffshore.description, #"SABIK Offshore GmbH"#)
    
        // 4iiii Innovations Inc.
        XCTAssertEqual(CompanyIdentifier.company4IiiiInnovations.rawValue, 1657)
        XCTAssertEqual(CompanyIdentifier.company4IiiiInnovations.name, #"4iiii Innovations Inc."#)
        XCTAssertEqual(CompanyIdentifier.company4IiiiInnovations.description, #"4iiii Innovations Inc."#)
    
        // The Energy Conservatory, Inc.
        XCTAssertEqual(CompanyIdentifier.energyConservatory.rawValue, 1658)
        XCTAssertEqual(CompanyIdentifier.energyConservatory.name, #"The Energy Conservatory, Inc."#)
        XCTAssertEqual(CompanyIdentifier.energyConservatory.description, #"The Energy Conservatory, Inc."#)
    
        // I.FARM, INC.
        XCTAssertEqual(CompanyIdentifier.iFarm.rawValue, 1659)
        XCTAssertEqual(CompanyIdentifier.iFarm.name, #"I.FARM, INC."#)
        XCTAssertEqual(CompanyIdentifier.iFarm.description, #"I.FARM, INC."#)
    
        // Tile, Inc.
        XCTAssertEqual(CompanyIdentifier.tile.rawValue, 1660)
        XCTAssertEqual(CompanyIdentifier.tile.name, #"Tile, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tile.description, #"Tile, Inc."#)
    
        // Form Athletica Inc.
        XCTAssertEqual(CompanyIdentifier.formAthletica.rawValue, 1661)
        XCTAssertEqual(CompanyIdentifier.formAthletica.name, #"Form Athletica Inc."#)
        XCTAssertEqual(CompanyIdentifier.formAthletica.description, #"Form Athletica Inc."#)
    
        // MbientLab Inc
        XCTAssertEqual(CompanyIdentifier.mbientlab.rawValue, 1662)
        XCTAssertEqual(CompanyIdentifier.mbientlab.name, #"MbientLab Inc"#)
        XCTAssertEqual(CompanyIdentifier.mbientlab.description, #"MbientLab Inc"#)
    
        // NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO
        XCTAssertEqual(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.rawValue, 1663)
        XCTAssertEqual(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.name, #"NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO"#)
        XCTAssertEqual(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.description, #"NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO"#)
    
        // Mannkind Corporation
        XCTAssertEqual(CompanyIdentifier.mannkind.rawValue, 1664)
        XCTAssertEqual(CompanyIdentifier.mannkind.name, #"Mannkind Corporation"#)
        XCTAssertEqual(CompanyIdentifier.mannkind.description, #"Mannkind Corporation"#)
    
        // Trade FIDES a.s.
        XCTAssertEqual(CompanyIdentifier.tradeFides.rawValue, 1665)
        XCTAssertEqual(CompanyIdentifier.tradeFides.name, #"Trade FIDES a.s."#)
        XCTAssertEqual(CompanyIdentifier.tradeFides.description, #"Trade FIDES a.s."#)
    
        // Photron Limited
        XCTAssertEqual(CompanyIdentifier.photron.rawValue, 1666)
        XCTAssertEqual(CompanyIdentifier.photron.name, #"Photron Limited"#)
        XCTAssertEqual(CompanyIdentifier.photron.description, #"Photron Limited"#)
    
        // Eltako GmbH
        XCTAssertEqual(CompanyIdentifier.eltako.rawValue, 1667)
        XCTAssertEqual(CompanyIdentifier.eltako.name, #"Eltako GmbH"#)
        XCTAssertEqual(CompanyIdentifier.eltako.description, #"Eltako GmbH"#)
    
        // Dermalapps, LLC
        XCTAssertEqual(CompanyIdentifier.dermalapps.rawValue, 1668)
        XCTAssertEqual(CompanyIdentifier.dermalapps.name, #"Dermalapps, LLC"#)
        XCTAssertEqual(CompanyIdentifier.dermalapps.description, #"Dermalapps, LLC"#)
    
        // Greenwald Industries
        XCTAssertEqual(CompanyIdentifier.greenwaldIndustries.rawValue, 1669)
        XCTAssertEqual(CompanyIdentifier.greenwaldIndustries.name, #"Greenwald Industries"#)
        XCTAssertEqual(CompanyIdentifier.greenwaldIndustries.description, #"Greenwald Industries"#)
    
        // inQs Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.inqs.rawValue, 1670)
        XCTAssertEqual(CompanyIdentifier.inqs.name, #"inQs Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.inqs.description, #"inQs Co., Ltd."#)
    
        // Cherry GmbH
        XCTAssertEqual(CompanyIdentifier.cherry.rawValue, 1671)
        XCTAssertEqual(CompanyIdentifier.cherry.name, #"Cherry GmbH"#)
        XCTAssertEqual(CompanyIdentifier.cherry.description, #"Cherry GmbH"#)
    
        // Amsted Digital Solutions Inc.
        XCTAssertEqual(CompanyIdentifier.amstedDigitalSolutions.rawValue, 1672)
        XCTAssertEqual(CompanyIdentifier.amstedDigitalSolutions.name, #"Amsted Digital Solutions Inc."#)
        XCTAssertEqual(CompanyIdentifier.amstedDigitalSolutions.description, #"Amsted Digital Solutions Inc."#)
    
        // Tacx b.v.
        XCTAssertEqual(CompanyIdentifier.tacx.rawValue, 1673)
        XCTAssertEqual(CompanyIdentifier.tacx.name, #"Tacx b.v."#)
        XCTAssertEqual(CompanyIdentifier.tacx.description, #"Tacx b.v."#)
    
        // Raytac Corporation
        XCTAssertEqual(CompanyIdentifier.raytac.rawValue, 1674)
        XCTAssertEqual(CompanyIdentifier.raytac.name, #"Raytac Corporation"#)
        XCTAssertEqual(CompanyIdentifier.raytac.description, #"Raytac Corporation"#)
    
        // Jiangsu Teranovo Tech Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.jiangsuTeranovoTech.rawValue, 1675)
        XCTAssertEqual(CompanyIdentifier.jiangsuTeranovoTech.name, #"Jiangsu Teranovo Tech Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.jiangsuTeranovoTech.description, #"Jiangsu Teranovo Tech Co., Ltd."#)
    
        // Changzhou Sound Dragon Electronics and Acoustics Co., Ltd
        XCTAssertEqual(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.rawValue, 1676)
        XCTAssertEqual(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.name, #"Changzhou Sound Dragon Electronics and Acoustics Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.description, #"Changzhou Sound Dragon Electronics and Acoustics Co., Ltd"#)
    
        // JetBeep Inc.
        XCTAssertEqual(CompanyIdentifier.jetbeep.rawValue, 1677)
        XCTAssertEqual(CompanyIdentifier.jetbeep.name, #"JetBeep Inc."#)
        XCTAssertEqual(CompanyIdentifier.jetbeep.description, #"JetBeep Inc."#)
    
        // Razer Inc.
        XCTAssertEqual(CompanyIdentifier.razer.rawValue, 1678)
        XCTAssertEqual(CompanyIdentifier.razer.name, #"Razer Inc."#)
        XCTAssertEqual(CompanyIdentifier.razer.description, #"Razer Inc."#)
    
        // JRM Group Limited
        XCTAssertEqual(CompanyIdentifier.jrmGroup.rawValue, 1679)
        XCTAssertEqual(CompanyIdentifier.jrmGroup.name, #"JRM Group Limited"#)
        XCTAssertEqual(CompanyIdentifier.jrmGroup.description, #"JRM Group Limited"#)
    
        // Eccrine Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.eccrineSystems.rawValue, 1680)
        XCTAssertEqual(CompanyIdentifier.eccrineSystems.name, #"Eccrine Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.eccrineSystems.description, #"Eccrine Systems, Inc."#)
    
        // Curie Point AB
        XCTAssertEqual(CompanyIdentifier.curiePoint.rawValue, 1681)
        XCTAssertEqual(CompanyIdentifier.curiePoint.name, #"Curie Point AB"#)
        XCTAssertEqual(CompanyIdentifier.curiePoint.description, #"Curie Point AB"#)
    
        // Georg Fischer AG
        XCTAssertEqual(CompanyIdentifier.georgFischer.rawValue, 1682)
        XCTAssertEqual(CompanyIdentifier.georgFischer.name, #"Georg Fischer AG"#)
        XCTAssertEqual(CompanyIdentifier.georgFischer.description, #"Georg Fischer AG"#)
    
        // Hach - Danaher
        XCTAssertEqual(CompanyIdentifier.hachDanaher.rawValue, 1683)
        XCTAssertEqual(CompanyIdentifier.hachDanaher.name, #"Hach - Danaher"#)
        XCTAssertEqual(CompanyIdentifier.hachDanaher.description, #"Hach - Danaher"#)
    
        // T&A Laboratories LLC
        XCTAssertEqual(CompanyIdentifier.tALaboratories.rawValue, 1684)
        XCTAssertEqual(CompanyIdentifier.tALaboratories.name, #"T&A Laboratories LLC"#)
        XCTAssertEqual(CompanyIdentifier.tALaboratories.description, #"T&A Laboratories LLC"#)
    
        // Koki Holdings Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.kokiHoldings.rawValue, 1685)
        XCTAssertEqual(CompanyIdentifier.kokiHoldings.name, #"Koki Holdings Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.kokiHoldings.description, #"Koki Holdings Co., Ltd."#)
    
        // Gunakar Private Limited
        XCTAssertEqual(CompanyIdentifier.gunakar.rawValue, 1686)
        XCTAssertEqual(CompanyIdentifier.gunakar.name, #"Gunakar Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.gunakar.description, #"Gunakar Private Limited"#)
    
        // Stemco Products Inc
        XCTAssertEqual(CompanyIdentifier.stemcoProducts.rawValue, 1687)
        XCTAssertEqual(CompanyIdentifier.stemcoProducts.name, #"Stemco Products Inc"#)
        XCTAssertEqual(CompanyIdentifier.stemcoProducts.description, #"Stemco Products Inc"#)
    
        // Wood IT Security, LLC
        XCTAssertEqual(CompanyIdentifier.woodItSecurity.rawValue, 1688)
        XCTAssertEqual(CompanyIdentifier.woodItSecurity.name, #"Wood IT Security, LLC"#)
        XCTAssertEqual(CompanyIdentifier.woodItSecurity.description, #"Wood IT Security, LLC"#)
    
        // RandomLab SAS
        XCTAssertEqual(CompanyIdentifier.randomlabs.rawValue, 1689)
        XCTAssertEqual(CompanyIdentifier.randomlabs.name, #"RandomLab SAS"#)
        XCTAssertEqual(CompanyIdentifier.randomlabs.description, #"RandomLab SAS"#)
    
        // Adero, Inc. (formerly as TrackR, Inc.)
        XCTAssertEqual(CompanyIdentifier.adero.rawValue, 1690)
        XCTAssertEqual(CompanyIdentifier.adero.name, #"Adero, Inc. (formerly as TrackR, Inc.)"#)
        XCTAssertEqual(CompanyIdentifier.adero.description, #"Adero, Inc. (formerly as TrackR, Inc.)"#)
    
        // Dragonchip Limited
        XCTAssertEqual(CompanyIdentifier.dragonchip.rawValue, 1691)
        XCTAssertEqual(CompanyIdentifier.dragonchip.name, #"Dragonchip Limited"#)
        XCTAssertEqual(CompanyIdentifier.dragonchip.description, #"Dragonchip Limited"#)
    
        // Noomi AB
        XCTAssertEqual(CompanyIdentifier.noomi.rawValue, 1692)
        XCTAssertEqual(CompanyIdentifier.noomi.name, #"Noomi AB"#)
        XCTAssertEqual(CompanyIdentifier.noomi.description, #"Noomi AB"#)
    
        // Vakaros LLC
        XCTAssertEqual(CompanyIdentifier.vakaros.rawValue, 1693)
        XCTAssertEqual(CompanyIdentifier.vakaros.name, #"Vakaros LLC"#)
        XCTAssertEqual(CompanyIdentifier.vakaros.description, #"Vakaros LLC"#)
    
        // Delta Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.deltaElectronics.rawValue, 1694)
        XCTAssertEqual(CompanyIdentifier.deltaElectronics.name, #"Delta Electronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.deltaElectronics.description, #"Delta Electronics, Inc."#)
    
        // FlowMotion Technologies AS
        XCTAssertEqual(CompanyIdentifier.flowmotionTechnologies.rawValue, 1695)
        XCTAssertEqual(CompanyIdentifier.flowmotionTechnologies.name, #"FlowMotion Technologies AS"#)
        XCTAssertEqual(CompanyIdentifier.flowmotionTechnologies.description, #"FlowMotion Technologies AS"#)
    
        // OBIQ Location Technology Inc.
        XCTAssertEqual(CompanyIdentifier.obiqLocationTechnology.rawValue, 1696)
        XCTAssertEqual(CompanyIdentifier.obiqLocationTechnology.name, #"OBIQ Location Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.obiqLocationTechnology.description, #"OBIQ Location Technology Inc."#)
    
        // Cardo Systems, Ltd
        XCTAssertEqual(CompanyIdentifier.cardoSystems.rawValue, 1697)
        XCTAssertEqual(CompanyIdentifier.cardoSystems.name, #"Cardo Systems, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.cardoSystems.description, #"Cardo Systems, Ltd"#)
    
        // Globalworx GmbH
        XCTAssertEqual(CompanyIdentifier.globalworx.rawValue, 1698)
        XCTAssertEqual(CompanyIdentifier.globalworx.name, #"Globalworx GmbH"#)
        XCTAssertEqual(CompanyIdentifier.globalworx.description, #"Globalworx GmbH"#)
    
        // Nymbus, LLC
        XCTAssertEqual(CompanyIdentifier.nymbus.rawValue, 1699)
        XCTAssertEqual(CompanyIdentifier.nymbus.name, #"Nymbus, LLC"#)
        XCTAssertEqual(CompanyIdentifier.nymbus.description, #"Nymbus, LLC"#)
    
        // Sanyo Techno Solutions Tottori Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sanyoTechnoSolutionsTottori.rawValue, 1700)
        XCTAssertEqual(CompanyIdentifier.sanyoTechnoSolutionsTottori.name, #"Sanyo Techno Solutions Tottori Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sanyoTechnoSolutionsTottori.description, #"Sanyo Techno Solutions Tottori Co., Ltd."#)
    
        // TEKZITEL PTY LTD
        XCTAssertEqual(CompanyIdentifier.tekzitelPty.rawValue, 1701)
        XCTAssertEqual(CompanyIdentifier.tekzitelPty.name, #"TEKZITEL PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.tekzitelPty.description, #"TEKZITEL PTY LTD"#)
    
        // Roambee Corporation
        XCTAssertEqual(CompanyIdentifier.roambee.rawValue, 1702)
        XCTAssertEqual(CompanyIdentifier.roambee.name, #"Roambee Corporation"#)
        XCTAssertEqual(CompanyIdentifier.roambee.description, #"Roambee Corporation"#)
    
        // Chipsea Technologies (ShenZhen) Corp.
        XCTAssertEqual(CompanyIdentifier.chipseaTechnologiesShenzhen.rawValue, 1703)
        XCTAssertEqual(CompanyIdentifier.chipseaTechnologiesShenzhen.name, #"Chipsea Technologies (ShenZhen) Corp."#)
        XCTAssertEqual(CompanyIdentifier.chipseaTechnologiesShenzhen.description, #"Chipsea Technologies (ShenZhen) Corp."#)
    
        // GD Midea Air-Conditioning Equipment Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.gdMideaAirConditioningEquipment.rawValue, 1704)
        XCTAssertEqual(CompanyIdentifier.gdMideaAirConditioningEquipment.name, #"GD Midea Air-Conditioning Equipment Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.gdMideaAirConditioningEquipment.description, #"GD Midea Air-Conditioning Equipment Co., Ltd."#)
    
        // Soundmax Electronics Limited
        XCTAssertEqual(CompanyIdentifier.soundmaxElectronics.rawValue, 1705)
        XCTAssertEqual(CompanyIdentifier.soundmaxElectronics.name, #"Soundmax Electronics Limited"#)
        XCTAssertEqual(CompanyIdentifier.soundmaxElectronics.description, #"Soundmax Electronics Limited"#)
    
        // Produal Oy
        XCTAssertEqual(CompanyIdentifier.produal.rawValue, 1706)
        XCTAssertEqual(CompanyIdentifier.produal.name, #"Produal Oy"#)
        XCTAssertEqual(CompanyIdentifier.produal.description, #"Produal Oy"#)
    
        // HMS Industrial Networks AB
        XCTAssertEqual(CompanyIdentifier.hmsIndustrialNetworks.rawValue, 1707)
        XCTAssertEqual(CompanyIdentifier.hmsIndustrialNetworks.name, #"HMS Industrial Networks AB"#)
        XCTAssertEqual(CompanyIdentifier.hmsIndustrialNetworks.description, #"HMS Industrial Networks AB"#)
    
        // Ingchips Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.ingchipsTechnology.rawValue, 1708)
        XCTAssertEqual(CompanyIdentifier.ingchipsTechnology.name, #"Ingchips Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.ingchipsTechnology.description, #"Ingchips Technology Co., Ltd."#)
    
        // InnovaSea Systems Inc.
        XCTAssertEqual(CompanyIdentifier.innovaseaSystems.rawValue, 1709)
        XCTAssertEqual(CompanyIdentifier.innovaseaSystems.name, #"InnovaSea Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.innovaseaSystems.description, #"InnovaSea Systems Inc."#)
    
        // SenseQ Inc.
        XCTAssertEqual(CompanyIdentifier.senseq.rawValue, 1710)
        XCTAssertEqual(CompanyIdentifier.senseq.name, #"SenseQ Inc."#)
        XCTAssertEqual(CompanyIdentifier.senseq.description, #"SenseQ Inc."#)
    
        // Shoof Technologies
        XCTAssertEqual(CompanyIdentifier.shoofTechnologies.rawValue, 1711)
        XCTAssertEqual(CompanyIdentifier.shoofTechnologies.name, #"Shoof Technologies"#)
        XCTAssertEqual(CompanyIdentifier.shoofTechnologies.description, #"Shoof Technologies"#)
    
        // BRK Brands, Inc.
        XCTAssertEqual(CompanyIdentifier.brkBrands.rawValue, 1712)
        XCTAssertEqual(CompanyIdentifier.brkBrands.name, #"BRK Brands, Inc."#)
        XCTAssertEqual(CompanyIdentifier.brkBrands.description, #"BRK Brands, Inc."#)
    
        // SimpliSafe, Inc.
        XCTAssertEqual(CompanyIdentifier.simplisafe.rawValue, 1713)
        XCTAssertEqual(CompanyIdentifier.simplisafe.name, #"SimpliSafe, Inc."#)
        XCTAssertEqual(CompanyIdentifier.simplisafe.description, #"SimpliSafe, Inc."#)
    
        // Tussock Innovation 2013 Limited
        XCTAssertEqual(CompanyIdentifier.tussockInnovation2013.rawValue, 1714)
        XCTAssertEqual(CompanyIdentifier.tussockInnovation2013.name, #"Tussock Innovation 2013 Limited"#)
        XCTAssertEqual(CompanyIdentifier.tussockInnovation2013.description, #"Tussock Innovation 2013 Limited"#)
    
        // The Hablab ApS
        XCTAssertEqual(CompanyIdentifier.hablab.rawValue, 1715)
        XCTAssertEqual(CompanyIdentifier.hablab.name, #"The Hablab ApS"#)
        XCTAssertEqual(CompanyIdentifier.hablab.description, #"The Hablab ApS"#)
    
        // Sencilion Oy
        XCTAssertEqual(CompanyIdentifier.sencilion.rawValue, 1716)
        XCTAssertEqual(CompanyIdentifier.sencilion.name, #"Sencilion Oy"#)
        XCTAssertEqual(CompanyIdentifier.sencilion.description, #"Sencilion Oy"#)
    
        // Wabilogic Ltd.
        XCTAssertEqual(CompanyIdentifier.wabilogic.rawValue, 1717)
        XCTAssertEqual(CompanyIdentifier.wabilogic.name, #"Wabilogic Ltd."#)
        XCTAssertEqual(CompanyIdentifier.wabilogic.description, #"Wabilogic Ltd."#)
    
        // Sociometric Solutions, Inc.
        XCTAssertEqual(CompanyIdentifier.sociometricSolutions.rawValue, 1718)
        XCTAssertEqual(CompanyIdentifier.sociometricSolutions.name, #"Sociometric Solutions, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sociometricSolutions.description, #"Sociometric Solutions, Inc."#)
    
        // iCOGNIZE GmbH
        XCTAssertEqual(CompanyIdentifier.icognize.rawValue, 1719)
        XCTAssertEqual(CompanyIdentifier.icognize.name, #"iCOGNIZE GmbH"#)
        XCTAssertEqual(CompanyIdentifier.icognize.description, #"iCOGNIZE GmbH"#)
    
        // ShadeCraft, Inc
        XCTAssertEqual(CompanyIdentifier.shadecraft.rawValue, 1720)
        XCTAssertEqual(CompanyIdentifier.shadecraft.name, #"ShadeCraft, Inc"#)
        XCTAssertEqual(CompanyIdentifier.shadecraft.description, #"ShadeCraft, Inc"#)
    
        // Beflex Inc.
        XCTAssertEqual(CompanyIdentifier.beflex.rawValue, 1721)
        XCTAssertEqual(CompanyIdentifier.beflex.name, #"Beflex Inc."#)
        XCTAssertEqual(CompanyIdentifier.beflex.description, #"Beflex Inc."#)
    
        // Beaconzone Ltd
        XCTAssertEqual(CompanyIdentifier.beaconzone.rawValue, 1722)
        XCTAssertEqual(CompanyIdentifier.beaconzone.name, #"Beaconzone Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beaconzone.description, #"Beaconzone Ltd"#)
    
        // Leaftronix Analogic Solutions Private Limited
        XCTAssertEqual(CompanyIdentifier.leaftronixAnalogicSolutions.rawValue, 1723)
        XCTAssertEqual(CompanyIdentifier.leaftronixAnalogicSolutions.name, #"Leaftronix Analogic Solutions Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.leaftronixAnalogicSolutions.description, #"Leaftronix Analogic Solutions Private Limited"#)
    
        // TWS Srl
        XCTAssertEqual(CompanyIdentifier.tws.rawValue, 1724)
        XCTAssertEqual(CompanyIdentifier.tws.name, #"TWS Srl"#)
        XCTAssertEqual(CompanyIdentifier.tws.description, #"TWS Srl"#)
    
        // ABB Oy
        XCTAssertEqual(CompanyIdentifier.abb.rawValue, 1725)
        XCTAssertEqual(CompanyIdentifier.abb.name, #"ABB Oy"#)
        XCTAssertEqual(CompanyIdentifier.abb.description, #"ABB Oy"#)
    
        // HitSeed Oy
        XCTAssertEqual(CompanyIdentifier.hitseed.rawValue, 1726)
        XCTAssertEqual(CompanyIdentifier.hitseed.name, #"HitSeed Oy"#)
        XCTAssertEqual(CompanyIdentifier.hitseed.description, #"HitSeed Oy"#)
    
        // Delcom Products Inc.
        XCTAssertEqual(CompanyIdentifier.delcomProducts.rawValue, 1727)
        XCTAssertEqual(CompanyIdentifier.delcomProducts.name, #"Delcom Products Inc."#)
        XCTAssertEqual(CompanyIdentifier.delcomProducts.description, #"Delcom Products Inc."#)
    
        // CAME S.p.A.
        XCTAssertEqual(CompanyIdentifier.came.rawValue, 1728)
        XCTAssertEqual(CompanyIdentifier.came.name, #"CAME S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.came.description, #"CAME S.p.A."#)
    
        // Alarm.com Holdings, Inc
        XCTAssertEqual(CompanyIdentifier.alarmComHoldings.rawValue, 1729)
        XCTAssertEqual(CompanyIdentifier.alarmComHoldings.name, #"Alarm.com Holdings, Inc"#)
        XCTAssertEqual(CompanyIdentifier.alarmComHoldings.description, #"Alarm.com Holdings, Inc"#)
    
        // Measurlogic Inc.
        XCTAssertEqual(CompanyIdentifier.measurlogic.rawValue, 1730)
        XCTAssertEqual(CompanyIdentifier.measurlogic.name, #"Measurlogic Inc."#)
        XCTAssertEqual(CompanyIdentifier.measurlogic.description, #"Measurlogic Inc."#)
    
        // King I Electronics.Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.kingIElectronics.rawValue, 1731)
        XCTAssertEqual(CompanyIdentifier.kingIElectronics.name, #"King I Electronics.Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.kingIElectronics.description, #"King I Electronics.Co.,Ltd"#)
    
        // Dream Labs GmbH
        XCTAssertEqual(CompanyIdentifier.dreamLabs.rawValue, 1732)
        XCTAssertEqual(CompanyIdentifier.dreamLabs.name, #"Dream Labs GmbH"#)
        XCTAssertEqual(CompanyIdentifier.dreamLabs.description, #"Dream Labs GmbH"#)
    
        // Urban Compass, Inc
        XCTAssertEqual(CompanyIdentifier.urbanCompass.rawValue, 1733)
        XCTAssertEqual(CompanyIdentifier.urbanCompass.name, #"Urban Compass, Inc"#)
        XCTAssertEqual(CompanyIdentifier.urbanCompass.description, #"Urban Compass, Inc"#)
    
        // Simm Tronic Limited
        XCTAssertEqual(CompanyIdentifier.simmTronic.rawValue, 1734)
        XCTAssertEqual(CompanyIdentifier.simmTronic.name, #"Simm Tronic Limited"#)
        XCTAssertEqual(CompanyIdentifier.simmTronic.description, #"Simm Tronic Limited"#)
    
        // Somatix Inc
        XCTAssertEqual(CompanyIdentifier.somatix.rawValue, 1735)
        XCTAssertEqual(CompanyIdentifier.somatix.name, #"Somatix Inc"#)
        XCTAssertEqual(CompanyIdentifier.somatix.description, #"Somatix Inc"#)
    
        // Storz & Bickel GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.storzBickel.rawValue, 1736)
        XCTAssertEqual(CompanyIdentifier.storzBickel.name, #"Storz & Bickel GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.storzBickel.description, #"Storz & Bickel GmbH & Co. KG"#)
    
        // MYLAPS B.V.
        XCTAssertEqual(CompanyIdentifier.mylaps.rawValue, 1737)
        XCTAssertEqual(CompanyIdentifier.mylaps.name, #"MYLAPS B.V."#)
        XCTAssertEqual(CompanyIdentifier.mylaps.description, #"MYLAPS B.V."#)
    
        // Shenzhen Zhongguang Infotech Technology Development Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.rawValue, 1738)
        XCTAssertEqual(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.name, #"Shenzhen Zhongguang Infotech Technology Development Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.description, #"Shenzhen Zhongguang Infotech Technology Development Co., Ltd"#)
    
        // Dyeware, LLC
        XCTAssertEqual(CompanyIdentifier.dyeware.rawValue, 1739)
        XCTAssertEqual(CompanyIdentifier.dyeware.name, #"Dyeware, LLC"#)
        XCTAssertEqual(CompanyIdentifier.dyeware.description, #"Dyeware, LLC"#)
    
        // Dongguan SmartAction Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.dongguanSmartactionTechnology.rawValue, 1740)
        XCTAssertEqual(CompanyIdentifier.dongguanSmartactionTechnology.name, #"Dongguan SmartAction Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.dongguanSmartactionTechnology.description, #"Dongguan SmartAction Technology Co.,Ltd."#)
    
        // DIG Corporation
        XCTAssertEqual(CompanyIdentifier.dig.rawValue, 1741)
        XCTAssertEqual(CompanyIdentifier.dig.name, #"DIG Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dig.description, #"DIG Corporation"#)
    
        // FIOR & GENTZ
        XCTAssertEqual(CompanyIdentifier.fiorGentz.rawValue, 1742)
        XCTAssertEqual(CompanyIdentifier.fiorGentz.name, #"FIOR & GENTZ"#)
        XCTAssertEqual(CompanyIdentifier.fiorGentz.description, #"FIOR & GENTZ"#)
    
        // Belparts N.V.
        XCTAssertEqual(CompanyIdentifier.belparts.rawValue, 1743)
        XCTAssertEqual(CompanyIdentifier.belparts.name, #"Belparts N.V."#)
        XCTAssertEqual(CompanyIdentifier.belparts.description, #"Belparts N.V."#)
    
        // Etekcity Corporation
        XCTAssertEqual(CompanyIdentifier.etekcity.rawValue, 1744)
        XCTAssertEqual(CompanyIdentifier.etekcity.name, #"Etekcity Corporation"#)
        XCTAssertEqual(CompanyIdentifier.etekcity.description, #"Etekcity Corporation"#)
    
        // Meyer Sound Laboratories, Incorporated
        XCTAssertEqual(CompanyIdentifier.meyerSoundLaboratories.rawValue, 1745)
        XCTAssertEqual(CompanyIdentifier.meyerSoundLaboratories.name, #"Meyer Sound Laboratories, Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.meyerSoundLaboratories.description, #"Meyer Sound Laboratories, Incorporated"#)
    
        // CeoTronics AG
        XCTAssertEqual(CompanyIdentifier.ceotronics.rawValue, 1746)
        XCTAssertEqual(CompanyIdentifier.ceotronics.name, #"CeoTronics AG"#)
        XCTAssertEqual(CompanyIdentifier.ceotronics.description, #"CeoTronics AG"#)
    
        // TriTeq Lock and Security, LLC
        XCTAssertEqual(CompanyIdentifier.triteqLockAndSecurity.rawValue, 1747)
        XCTAssertEqual(CompanyIdentifier.triteqLockAndSecurity.name, #"TriTeq Lock and Security, LLC"#)
        XCTAssertEqual(CompanyIdentifier.triteqLockAndSecurity.description, #"TriTeq Lock and Security, LLC"#)
    
        // DYNAKODE TECHNOLOGY PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.dynakodeTechnology.rawValue, 1748)
        XCTAssertEqual(CompanyIdentifier.dynakodeTechnology.name, #"DYNAKODE TECHNOLOGY PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.dynakodeTechnology.description, #"DYNAKODE TECHNOLOGY PRIVATE LIMITED"#)
    
        // Sensirion AG
        XCTAssertEqual(CompanyIdentifier.sensirion.rawValue, 1749)
        XCTAssertEqual(CompanyIdentifier.sensirion.name, #"Sensirion AG"#)
        XCTAssertEqual(CompanyIdentifier.sensirion.description, #"Sensirion AG"#)
    
        // JCT Healthcare Pty Ltd
        XCTAssertEqual(CompanyIdentifier.jctHealthcarePty.rawValue, 1750)
        XCTAssertEqual(CompanyIdentifier.jctHealthcarePty.name, #"JCT Healthcare Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.jctHealthcarePty.description, #"JCT Healthcare Pty Ltd"#)
    
        // FUBA Automotive Electronics GmbH
        XCTAssertEqual(CompanyIdentifier.fubaAutomotiveElectronics.rawValue, 1751)
        XCTAssertEqual(CompanyIdentifier.fubaAutomotiveElectronics.name, #"FUBA Automotive Electronics GmbH"#)
        XCTAssertEqual(CompanyIdentifier.fubaAutomotiveElectronics.description, #"FUBA Automotive Electronics GmbH"#)
    
        // AW Company
        XCTAssertEqual(CompanyIdentifier.awCompany.rawValue, 1752)
        XCTAssertEqual(CompanyIdentifier.awCompany.name, #"AW Company"#)
        XCTAssertEqual(CompanyIdentifier.awCompany.description, #"AW Company"#)
    
        // Shanghai Mountain View Silicon Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiMountainViewSilicon.rawValue, 1753)
        XCTAssertEqual(CompanyIdentifier.shanghaiMountainViewSilicon.name, #"Shanghai Mountain View Silicon Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiMountainViewSilicon.description, #"Shanghai Mountain View Silicon Co.,Ltd."#)
    
        // Zliide Technologies ApS
        XCTAssertEqual(CompanyIdentifier.zliideTechnologies.rawValue, 1754)
        XCTAssertEqual(CompanyIdentifier.zliideTechnologies.name, #"Zliide Technologies ApS"#)
        XCTAssertEqual(CompanyIdentifier.zliideTechnologies.description, #"Zliide Technologies ApS"#)
    
        // Automatic Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.automaticLabs.rawValue, 1755)
        XCTAssertEqual(CompanyIdentifier.automaticLabs.name, #"Automatic Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.automaticLabs.description, #"Automatic Labs, Inc."#)
    
        // Industrial Network Controls, LLC
        XCTAssertEqual(CompanyIdentifier.industrialNetworkControls.rawValue, 1756)
        XCTAssertEqual(CompanyIdentifier.industrialNetworkControls.name, #"Industrial Network Controls, LLC"#)
        XCTAssertEqual(CompanyIdentifier.industrialNetworkControls.description, #"Industrial Network Controls, LLC"#)
    
        // Intellithings Ltd.
        XCTAssertEqual(CompanyIdentifier.intellithings.rawValue, 1757)
        XCTAssertEqual(CompanyIdentifier.intellithings.name, #"Intellithings Ltd."#)
        XCTAssertEqual(CompanyIdentifier.intellithings.description, #"Intellithings Ltd."#)
    
        // Navcast, Inc.
        XCTAssertEqual(CompanyIdentifier.navcast.rawValue, 1758)
        XCTAssertEqual(CompanyIdentifier.navcast.name, #"Navcast, Inc."#)
        XCTAssertEqual(CompanyIdentifier.navcast.description, #"Navcast, Inc."#)
    
        // Hubbell Lighting, Inc.
        XCTAssertEqual(CompanyIdentifier.hubbellLighting.rawValue, 1759)
        XCTAssertEqual(CompanyIdentifier.hubbellLighting.name, #"Hubbell Lighting, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hubbellLighting.description, #"Hubbell Lighting, Inc."#)
    
        // Avaya Inc.
        XCTAssertEqual(CompanyIdentifier.avaya.rawValue, 1760)
        XCTAssertEqual(CompanyIdentifier.avaya.name, #"Avaya Inc. "#)
        XCTAssertEqual(CompanyIdentifier.avaya.description, #"Avaya Inc. "#)
    
        // Milestone AV Technologies LLC
        XCTAssertEqual(CompanyIdentifier.milestoneAvTechnologies.rawValue, 1761)
        XCTAssertEqual(CompanyIdentifier.milestoneAvTechnologies.name, #"Milestone AV Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.milestoneAvTechnologies.description, #"Milestone AV Technologies LLC"#)
    
        // Alango Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.alangoTechnologies.rawValue, 1762)
        XCTAssertEqual(CompanyIdentifier.alangoTechnologies.name, #"Alango Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.alangoTechnologies.description, #"Alango Technologies Ltd"#)
    
        // Spinlock Ltd
        XCTAssertEqual(CompanyIdentifier.spinlock.rawValue, 1763)
        XCTAssertEqual(CompanyIdentifier.spinlock.name, #"Spinlock Ltd"#)
        XCTAssertEqual(CompanyIdentifier.spinlock.description, #"Spinlock Ltd"#)
    
        // Aluna
        XCTAssertEqual(CompanyIdentifier.aluna.rawValue, 1764)
        XCTAssertEqual(CompanyIdentifier.aluna.name, #"Aluna"#)
        XCTAssertEqual(CompanyIdentifier.aluna.description, #"Aluna"#)
    
        // OPTEX CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.optex.rawValue, 1765)
        XCTAssertEqual(CompanyIdentifier.optex.name, #"OPTEX CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.optex.description, #"OPTEX CO.,LTD."#)
    
        // NIHON DENGYO KOUSAKU
        XCTAssertEqual(CompanyIdentifier.nihonDengyoKousaku.rawValue, 1766)
        XCTAssertEqual(CompanyIdentifier.nihonDengyoKousaku.name, #"NIHON DENGYO KOUSAKU"#)
        XCTAssertEqual(CompanyIdentifier.nihonDengyoKousaku.description, #"NIHON DENGYO KOUSAKU"#)
    
        // VELUX A/S
        XCTAssertEqual(CompanyIdentifier.velux.rawValue, 1767)
        XCTAssertEqual(CompanyIdentifier.velux.name, #"VELUX A/S"#)
        XCTAssertEqual(CompanyIdentifier.velux.description, #"VELUX A/S"#)
    
        // Almendo Technologies GmbH
        XCTAssertEqual(CompanyIdentifier.almendoTechnologies.rawValue, 1768)
        XCTAssertEqual(CompanyIdentifier.almendoTechnologies.name, #"Almendo Technologies GmbH"#)
        XCTAssertEqual(CompanyIdentifier.almendoTechnologies.description, #"Almendo Technologies GmbH"#)
    
        // Zmartfun Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.zmartfunElectronics.rawValue, 1769)
        XCTAssertEqual(CompanyIdentifier.zmartfunElectronics.name, #"Zmartfun Electronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.zmartfunElectronics.description, #"Zmartfun Electronics, Inc."#)
    
        // SafeLine Sweden AB
        XCTAssertEqual(CompanyIdentifier.safelineSweden.rawValue, 1770)
        XCTAssertEqual(CompanyIdentifier.safelineSweden.name, #"SafeLine Sweden AB"#)
        XCTAssertEqual(CompanyIdentifier.safelineSweden.description, #"SafeLine Sweden AB"#)
    
        // Houston Radar LLC
        XCTAssertEqual(CompanyIdentifier.houstonRadar.rawValue, 1771)
        XCTAssertEqual(CompanyIdentifier.houstonRadar.name, #"Houston Radar LLC"#)
        XCTAssertEqual(CompanyIdentifier.houstonRadar.description, #"Houston Radar LLC"#)
    
        // Sigur
        XCTAssertEqual(CompanyIdentifier.sigur.rawValue, 1772)
        XCTAssertEqual(CompanyIdentifier.sigur.name, #"Sigur"#)
        XCTAssertEqual(CompanyIdentifier.sigur.description, #"Sigur"#)
    
        // J Neades Ltd
        XCTAssertEqual(CompanyIdentifier.jNeades.rawValue, 1773)
        XCTAssertEqual(CompanyIdentifier.jNeades.name, #"J Neades Ltd"#)
        XCTAssertEqual(CompanyIdentifier.jNeades.description, #"J Neades Ltd"#)
    
        // Avantis Systems Limited
        XCTAssertEqual(CompanyIdentifier.avantisSystems.rawValue, 1774)
        XCTAssertEqual(CompanyIdentifier.avantisSystems.name, #"Avantis Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.avantisSystems.description, #"Avantis Systems Limited"#)
    
        // ALCARE Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.alcare.rawValue, 1775)
        XCTAssertEqual(CompanyIdentifier.alcare.name, #"ALCARE Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.alcare.description, #"ALCARE Co., Ltd."#)
    
        // Chargy Technologies, SL
        XCTAssertEqual(CompanyIdentifier.chargyTechnologiesSl.rawValue, 1776)
        XCTAssertEqual(CompanyIdentifier.chargyTechnologiesSl.name, #"Chargy Technologies, SL"#)
        XCTAssertEqual(CompanyIdentifier.chargyTechnologiesSl.description, #"Chargy Technologies, SL"#)
    
        // Shibutani Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shibutani.rawValue, 1777)
        XCTAssertEqual(CompanyIdentifier.shibutani.name, #"Shibutani Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shibutani.description, #"Shibutani Co., Ltd."#)
    
        // Trapper Data AB
        XCTAssertEqual(CompanyIdentifier.trapperData.rawValue, 1778)
        XCTAssertEqual(CompanyIdentifier.trapperData.name, #"Trapper Data AB"#)
        XCTAssertEqual(CompanyIdentifier.trapperData.description, #"Trapper Data AB"#)
    
        // Alfred International Inc.
        XCTAssertEqual(CompanyIdentifier.alfredInternational.rawValue, 1779)
        XCTAssertEqual(CompanyIdentifier.alfredInternational.name, #"Alfred International Inc."#)
        XCTAssertEqual(CompanyIdentifier.alfredInternational.description, #"Alfred International Inc."#)
    
        // Touché Technology Ltd
        XCTAssertEqual(CompanyIdentifier.toucheTechnology.rawValue, 1780)
        XCTAssertEqual(CompanyIdentifier.toucheTechnology.name, #"Touché Technology Ltd"#)
        XCTAssertEqual(CompanyIdentifier.toucheTechnology.description, #"Touché Technology Ltd"#)
    
        // Vigil Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.vigilTechnologies.rawValue, 1781)
        XCTAssertEqual(CompanyIdentifier.vigilTechnologies.name, #"Vigil Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.vigilTechnologies.description, #"Vigil Technologies Inc."#)
    
        // Vitulo Plus BV
        XCTAssertEqual(CompanyIdentifier.vituloPlus.rawValue, 1782)
        XCTAssertEqual(CompanyIdentifier.vituloPlus.name, #"Vitulo Plus BV"#)
        XCTAssertEqual(CompanyIdentifier.vituloPlus.description, #"Vitulo Plus BV"#)
    
        // WILKA Schliesstechnik GmbH
        XCTAssertEqual(CompanyIdentifier.wilkaSchliesstechnik.rawValue, 1783)
        XCTAssertEqual(CompanyIdentifier.wilkaSchliesstechnik.name, #"WILKA Schliesstechnik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.wilkaSchliesstechnik.description, #"WILKA Schliesstechnik GmbH"#)
    
        // BodyPlus Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.bodyplusTechnology.rawValue, 1784)
        XCTAssertEqual(CompanyIdentifier.bodyplusTechnology.name, #"BodyPlus Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.bodyplusTechnology.description, #"BodyPlus Technology Co.,Ltd"#)
    
        // happybrush GmbH
        XCTAssertEqual(CompanyIdentifier.happybrush.rawValue, 1785)
        XCTAssertEqual(CompanyIdentifier.happybrush.name, #"happybrush GmbH"#)
        XCTAssertEqual(CompanyIdentifier.happybrush.description, #"happybrush GmbH"#)
    
        // Enequi AB
        XCTAssertEqual(CompanyIdentifier.enequi.rawValue, 1786)
        XCTAssertEqual(CompanyIdentifier.enequi.name, #"Enequi AB"#)
        XCTAssertEqual(CompanyIdentifier.enequi.description, #"Enequi AB"#)
    
        // Sartorius AG
        XCTAssertEqual(CompanyIdentifier.sartorius.rawValue, 1787)
        XCTAssertEqual(CompanyIdentifier.sartorius.name, #"Sartorius AG"#)
        XCTAssertEqual(CompanyIdentifier.sartorius.description, #"Sartorius AG"#)
    
        // Tom Communication Industrial Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.tomCommunicationIndustrial.rawValue, 1788)
        XCTAssertEqual(CompanyIdentifier.tomCommunicationIndustrial.name, #"Tom Communication Industrial Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.tomCommunicationIndustrial.description, #"Tom Communication Industrial Co.,Ltd."#)
    
        // ESS Embedded System Solutions Inc.
        XCTAssertEqual(CompanyIdentifier.essEmbeddedSystemSolutions.rawValue, 1789)
        XCTAssertEqual(CompanyIdentifier.essEmbeddedSystemSolutions.name, #"ESS Embedded System Solutions Inc."#)
        XCTAssertEqual(CompanyIdentifier.essEmbeddedSystemSolutions.description, #"ESS Embedded System Solutions Inc."#)
    
        // Mahr GmbH
        XCTAssertEqual(CompanyIdentifier.mahr.rawValue, 1790)
        XCTAssertEqual(CompanyIdentifier.mahr.name, #"Mahr GmbH"#)
        XCTAssertEqual(CompanyIdentifier.mahr.description, #"Mahr GmbH"#)
    
        // Redpine Signals Inc
        XCTAssertEqual(CompanyIdentifier.redpineSignals.rawValue, 1791)
        XCTAssertEqual(CompanyIdentifier.redpineSignals.name, #"Redpine Signals Inc"#)
        XCTAssertEqual(CompanyIdentifier.redpineSignals.description, #"Redpine Signals Inc"#)
    
        // TraqFreq LLC
        XCTAssertEqual(CompanyIdentifier.traqfreq.rawValue, 1792)
        XCTAssertEqual(CompanyIdentifier.traqfreq.name, #"TraqFreq LLC"#)
        XCTAssertEqual(CompanyIdentifier.traqfreq.description, #"TraqFreq LLC"#)
    
        // PAFERS TECH
        XCTAssertEqual(CompanyIdentifier.pafersTech.rawValue, 1793)
        XCTAssertEqual(CompanyIdentifier.pafersTech.name, #"PAFERS TECH"#)
        XCTAssertEqual(CompanyIdentifier.pafersTech.description, #"PAFERS TECH"#)
    
        // Akciju sabiedriba "SAF TEHNIKA"
        XCTAssertEqual(CompanyIdentifier.akcijuSabiedribafTehnika.rawValue, 1794)
        XCTAssertEqual(CompanyIdentifier.akcijuSabiedribafTehnika.name, #"Akciju sabiedriba "SAF TEHNIKA""#)
        XCTAssertEqual(CompanyIdentifier.akcijuSabiedribafTehnika.description, #"Akciju sabiedriba "SAF TEHNIKA""#)
    
        // Beijing Jingdong Century Trading Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingJingdongCenturyTrading.rawValue, 1795)
        XCTAssertEqual(CompanyIdentifier.beijingJingdongCenturyTrading.name, #"Beijing Jingdong Century Trading Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingJingdongCenturyTrading.description, #"Beijing Jingdong Century Trading Co., Ltd."#)
    
        // JBX Designs Inc.
        XCTAssertEqual(CompanyIdentifier.jbxDesigns.rawValue, 1796)
        XCTAssertEqual(CompanyIdentifier.jbxDesigns.name, #"JBX Designs Inc."#)
        XCTAssertEqual(CompanyIdentifier.jbxDesigns.description, #"JBX Designs Inc."#)
    
        // AB Electrolux
        XCTAssertEqual(CompanyIdentifier.abElectrolux.rawValue, 1797)
        XCTAssertEqual(CompanyIdentifier.abElectrolux.name, #"AB Electrolux"#)
        XCTAssertEqual(CompanyIdentifier.abElectrolux.description, #"AB Electrolux"#)
    
        // Wernher von Braun Center for ASdvanced Research
        XCTAssertEqual(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.rawValue, 1798)
        XCTAssertEqual(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.name, #"Wernher von Braun Center for ASdvanced Research"#)
        XCTAssertEqual(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.description, #"Wernher von Braun Center for ASdvanced Research"#)
    
        // Essity Hygiene and Health Aktiebolag
        XCTAssertEqual(CompanyIdentifier.essityHygieneAndHealthAktiebolag.rawValue, 1799)
        XCTAssertEqual(CompanyIdentifier.essityHygieneAndHealthAktiebolag.name, #"Essity Hygiene and Health Aktiebolag"#)
        XCTAssertEqual(CompanyIdentifier.essityHygieneAndHealthAktiebolag.description, #"Essity Hygiene and Health Aktiebolag"#)
    
        // Be Interactive Co., Ltd
        XCTAssertEqual(CompanyIdentifier.beInteractive.rawValue, 1800)
        XCTAssertEqual(CompanyIdentifier.beInteractive.name, #"Be Interactive Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beInteractive.description, #"Be Interactive Co., Ltd"#)
    
        // Carewear Corp.
        XCTAssertEqual(CompanyIdentifier.carewear.rawValue, 1801)
        XCTAssertEqual(CompanyIdentifier.carewear.name, #"Carewear Corp."#)
        XCTAssertEqual(CompanyIdentifier.carewear.description, #"Carewear Corp."#)
    
        // Huf Hülsbeck & Fürst GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.hufHulsbeckFurst.rawValue, 1802)
        XCTAssertEqual(CompanyIdentifier.hufHulsbeckFurst.name, #"Huf Hülsbeck & Fürst GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.hufHulsbeckFurst.description, #"Huf Hülsbeck & Fürst GmbH & Co. KG"#)
    
        // Element Products, Inc.
        XCTAssertEqual(CompanyIdentifier.elementProducts.rawValue, 1803)
        XCTAssertEqual(CompanyIdentifier.elementProducts.name, #"Element Products, Inc."#)
        XCTAssertEqual(CompanyIdentifier.elementProducts.description, #"Element Products, Inc."#)
    
        // Beijing Winner Microelectronics Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.beijingWinnerMicroelectronics.rawValue, 1804)
        XCTAssertEqual(CompanyIdentifier.beijingWinnerMicroelectronics.name, #"Beijing Winner Microelectronics Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beijingWinnerMicroelectronics.description, #"Beijing Winner Microelectronics Co.,Ltd"#)
    
        // SmartSnugg Pty Ltd
        XCTAssertEqual(CompanyIdentifier.smartsnuggPty.rawValue, 1805)
        XCTAssertEqual(CompanyIdentifier.smartsnuggPty.name, #"SmartSnugg Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.smartsnuggPty.description, #"SmartSnugg Pty Ltd"#)
    
        // FiveCo Sarl
        XCTAssertEqual(CompanyIdentifier.fivecoSarl.rawValue, 1806)
        XCTAssertEqual(CompanyIdentifier.fivecoSarl.name, #"FiveCo Sarl"#)
        XCTAssertEqual(CompanyIdentifier.fivecoSarl.description, #"FiveCo Sarl"#)
    
        // California Things Inc.
        XCTAssertEqual(CompanyIdentifier.californiaThings.rawValue, 1807)
        XCTAssertEqual(CompanyIdentifier.californiaThings.name, #"California Things Inc."#)
        XCTAssertEqual(CompanyIdentifier.californiaThings.description, #"California Things Inc."#)
    
        // Audiodo AB
        XCTAssertEqual(CompanyIdentifier.audiodo.rawValue, 1808)
        XCTAssertEqual(CompanyIdentifier.audiodo.name, #"Audiodo AB"#)
        XCTAssertEqual(CompanyIdentifier.audiodo.description, #"Audiodo AB"#)
    
        // ABAX AS
        XCTAssertEqual(CompanyIdentifier.abax.rawValue, 1809)
        XCTAssertEqual(CompanyIdentifier.abax.name, #"ABAX AS"#)
        XCTAssertEqual(CompanyIdentifier.abax.description, #"ABAX AS"#)
    
        // Bull Group Company Limited
        XCTAssertEqual(CompanyIdentifier.bullGroupCompany.rawValue, 1810)
        XCTAssertEqual(CompanyIdentifier.bullGroupCompany.name, #"Bull Group Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.bullGroupCompany.description, #"Bull Group Company Limited"#)
    
        // Respiri Limited
        XCTAssertEqual(CompanyIdentifier.respiri.rawValue, 1811)
        XCTAssertEqual(CompanyIdentifier.respiri.name, #"Respiri Limited"#)
        XCTAssertEqual(CompanyIdentifier.respiri.description, #"Respiri Limited"#)
    
        // MindPeace Safety LLC
        XCTAssertEqual(CompanyIdentifier.mindpeaceSafety.rawValue, 1812)
        XCTAssertEqual(CompanyIdentifier.mindpeaceSafety.name, #"MindPeace Safety LLC"#)
        XCTAssertEqual(CompanyIdentifier.mindpeaceSafety.description, #"MindPeace Safety LLC"#)
    
        // MBARC LABS Inc
        XCTAssertEqual(CompanyIdentifier.mbarcLabs.rawValue, 1813)
        XCTAssertEqual(CompanyIdentifier.mbarcLabs.name, #"MBARC LABS Inc"#)
        XCTAssertEqual(CompanyIdentifier.mbarcLabs.description, #"MBARC LABS Inc"#)
    
        // Altonics
        XCTAssertEqual(CompanyIdentifier.altonics.rawValue, 1814)
        XCTAssertEqual(CompanyIdentifier.altonics.name, #"Altonics"#)
        XCTAssertEqual(CompanyIdentifier.altonics.description, #"Altonics"#)
    
        // iQsquare BV
        XCTAssertEqual(CompanyIdentifier.iqsquare.rawValue, 1815)
        XCTAssertEqual(CompanyIdentifier.iqsquare.name, #"iQsquare BV"#)
        XCTAssertEqual(CompanyIdentifier.iqsquare.description, #"iQsquare BV"#)
    
        // IDIBAIX enginneering
        XCTAssertEqual(CompanyIdentifier.idibaixEnginneering.rawValue, 1816)
        XCTAssertEqual(CompanyIdentifier.idibaixEnginneering.name, #"IDIBAIX enginneering"#)
        XCTAssertEqual(CompanyIdentifier.idibaixEnginneering.description, #"IDIBAIX enginneering"#)
    
        // ECSG
        XCTAssertEqual(CompanyIdentifier.ecsg.rawValue, 1817)
        XCTAssertEqual(CompanyIdentifier.ecsg.name, #"ECSG"#)
        XCTAssertEqual(CompanyIdentifier.ecsg.description, #"ECSG"#)
    
        // REVSMART WEARABLE HK CO LTD
        XCTAssertEqual(CompanyIdentifier.revsmartWearableCo.rawValue, 1818)
        XCTAssertEqual(CompanyIdentifier.revsmartWearableCo.name, #"REVSMART WEARABLE HK CO LTD"#)
        XCTAssertEqual(CompanyIdentifier.revsmartWearableCo.description, #"REVSMART WEARABLE HK CO LTD"#)
    
        // Precor
        XCTAssertEqual(CompanyIdentifier.precor.rawValue, 1819)
        XCTAssertEqual(CompanyIdentifier.precor.name, #"Precor"#)
        XCTAssertEqual(CompanyIdentifier.precor.description, #"Precor"#)
    
        // F5 Sports, Inc
        XCTAssertEqual(CompanyIdentifier.f5Sports.rawValue, 1820)
        XCTAssertEqual(CompanyIdentifier.f5Sports.name, #"F5 Sports, Inc"#)
        XCTAssertEqual(CompanyIdentifier.f5Sports.description, #"F5 Sports, Inc"#)
    
        // exoTIC Systems
        XCTAssertEqual(CompanyIdentifier.exoticSystems.rawValue, 1821)
        XCTAssertEqual(CompanyIdentifier.exoticSystems.name, #"exoTIC Systems"#)
        XCTAssertEqual(CompanyIdentifier.exoticSystems.description, #"exoTIC Systems"#)
    
        // DONGGUAN HELE ELECTRONICS CO., LTD
        XCTAssertEqual(CompanyIdentifier.dongguanHeleElectronics.rawValue, 1822)
        XCTAssertEqual(CompanyIdentifier.dongguanHeleElectronics.name, #"DONGGUAN HELE ELECTRONICS CO., LTD"#)
        XCTAssertEqual(CompanyIdentifier.dongguanHeleElectronics.description, #"DONGGUAN HELE ELECTRONICS CO., LTD"#)
    
        // Dongguan Liesheng Electronic Co.Ltd
        XCTAssertEqual(CompanyIdentifier.dongguanLieshengElectronic.rawValue, 1823)
        XCTAssertEqual(CompanyIdentifier.dongguanLieshengElectronic.name, #"Dongguan Liesheng Electronic Co.Ltd"#)
        XCTAssertEqual(CompanyIdentifier.dongguanLieshengElectronic.description, #"Dongguan Liesheng Electronic Co.Ltd"#)
    
        // Oculeve, Inc.
        XCTAssertEqual(CompanyIdentifier.oculeve.rawValue, 1824)
        XCTAssertEqual(CompanyIdentifier.oculeve.name, #"Oculeve, Inc."#)
        XCTAssertEqual(CompanyIdentifier.oculeve.description, #"Oculeve, Inc."#)
    
        // Clover Network, Inc.
        XCTAssertEqual(CompanyIdentifier.cloverNetwork.rawValue, 1825)
        XCTAssertEqual(CompanyIdentifier.cloverNetwork.name, #"Clover Network, Inc."#)
        XCTAssertEqual(CompanyIdentifier.cloverNetwork.description, #"Clover Network, Inc."#)
    
        // Xiamen Eholder Electronics Co.Ltd
        XCTAssertEqual(CompanyIdentifier.xiamenEholderElectronics.rawValue, 1826)
        XCTAssertEqual(CompanyIdentifier.xiamenEholderElectronics.name, #"Xiamen Eholder Electronics Co.Ltd"#)
        XCTAssertEqual(CompanyIdentifier.xiamenEholderElectronics.description, #"Xiamen Eholder Electronics Co.Ltd"#)
    
        // Ford Motor Company
        XCTAssertEqual(CompanyIdentifier.fordMotorCompany.rawValue, 1827)
        XCTAssertEqual(CompanyIdentifier.fordMotorCompany.name, #"Ford Motor Company"#)
        XCTAssertEqual(CompanyIdentifier.fordMotorCompany.description, #"Ford Motor Company"#)
    
        // Guangzhou SuperSound Information Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.guangzhouSupersoundInformationTechnology.rawValue, 1828)
        XCTAssertEqual(CompanyIdentifier.guangzhouSupersoundInformationTechnology.name, #"Guangzhou SuperSound Information Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.guangzhouSupersoundInformationTechnology.description, #"Guangzhou SuperSound Information Technology Co.,Ltd"#)
    
        // Tedee Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.tedee.rawValue, 1829)
        XCTAssertEqual(CompanyIdentifier.tedee.name, #"Tedee Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.tedee.description, #"Tedee Sp. z o.o."#)
    
        // PHC Corporation
        XCTAssertEqual(CompanyIdentifier.phc.rawValue, 1830)
        XCTAssertEqual(CompanyIdentifier.phc.name, #"PHC Corporation"#)
        XCTAssertEqual(CompanyIdentifier.phc.description, #"PHC Corporation"#)
    
        // STALKIT AS
        XCTAssertEqual(CompanyIdentifier.stalkit.rawValue, 1831)
        XCTAssertEqual(CompanyIdentifier.stalkit.name, #"STALKIT AS"#)
        XCTAssertEqual(CompanyIdentifier.stalkit.description, #"STALKIT AS"#)
    
        // Eli Lilly and Company
        XCTAssertEqual(CompanyIdentifier.eliLillyAndCompany.rawValue, 1832)
        XCTAssertEqual(CompanyIdentifier.eliLillyAndCompany.name, #"Eli Lilly and Company"#)
        XCTAssertEqual(CompanyIdentifier.eliLillyAndCompany.description, #"Eli Lilly and Company"#)
    
        // SwaraLink Technologies
        XCTAssertEqual(CompanyIdentifier.swaralinkTechnologies.rawValue, 1833)
        XCTAssertEqual(CompanyIdentifier.swaralinkTechnologies.name, #"SwaraLink Technologies"#)
        XCTAssertEqual(CompanyIdentifier.swaralinkTechnologies.description, #"SwaraLink Technologies"#)
    
        // JMR embedded systems GmbH
        XCTAssertEqual(CompanyIdentifier.jmrEmbeddedSystems.rawValue, 1834)
        XCTAssertEqual(CompanyIdentifier.jmrEmbeddedSystems.name, #"JMR embedded systems GmbH"#)
        XCTAssertEqual(CompanyIdentifier.jmrEmbeddedSystems.description, #"JMR embedded systems GmbH"#)
    
        // Bitkey Inc.
        XCTAssertEqual(CompanyIdentifier.bitkey.rawValue, 1835)
        XCTAssertEqual(CompanyIdentifier.bitkey.name, #"Bitkey Inc."#)
        XCTAssertEqual(CompanyIdentifier.bitkey.description, #"Bitkey Inc."#)
    
        // GWA Hygiene GmbH
        XCTAssertEqual(CompanyIdentifier.gwaHygiene.rawValue, 1836)
        XCTAssertEqual(CompanyIdentifier.gwaHygiene.name, #"GWA Hygiene GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gwaHygiene.description, #"GWA Hygiene GmbH"#)
    
        // Safera Oy
        XCTAssertEqual(CompanyIdentifier.safera.rawValue, 1837)
        XCTAssertEqual(CompanyIdentifier.safera.name, #"Safera Oy"#)
        XCTAssertEqual(CompanyIdentifier.safera.description, #"Safera Oy"#)
    
        // Open Platform Systems LLC
        XCTAssertEqual(CompanyIdentifier.openPlatformSystems.rawValue, 1838)
        XCTAssertEqual(CompanyIdentifier.openPlatformSystems.name, #"Open Platform Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.openPlatformSystems.description, #"Open Platform Systems LLC"#)
    
        // OnePlus Electronics (Shenzhen) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.oneplusElectronicsShenzhen.rawValue, 1839)
        XCTAssertEqual(CompanyIdentifier.oneplusElectronicsShenzhen.name, #"OnePlus Electronics (Shenzhen) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.oneplusElectronicsShenzhen.description, #"OnePlus Electronics (Shenzhen) Co., Ltd."#)
    
        // Wildlife Acoustics, Inc.
        XCTAssertEqual(CompanyIdentifier.wildlifeAcoustics.rawValue, 1840)
        XCTAssertEqual(CompanyIdentifier.wildlifeAcoustics.name, #"Wildlife Acoustics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.wildlifeAcoustics.description, #"Wildlife Acoustics, Inc."#)
    
        // ABLIC Inc.
        XCTAssertEqual(CompanyIdentifier.ablic.rawValue, 1841)
        XCTAssertEqual(CompanyIdentifier.ablic.name, #"ABLIC Inc."#)
        XCTAssertEqual(CompanyIdentifier.ablic.description, #"ABLIC Inc."#)
    
        // Dairy Tech, Inc.
        XCTAssertEqual(CompanyIdentifier.dairyTech.rawValue, 1842)
        XCTAssertEqual(CompanyIdentifier.dairyTech.name, #"Dairy Tech, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dairyTech.description, #"Dairy Tech, Inc."#)
    
        // Iguanavation, Inc.
        XCTAssertEqual(CompanyIdentifier.iguanavation.rawValue, 1843)
        XCTAssertEqual(CompanyIdentifier.iguanavation.name, #"Iguanavation, Inc."#)
        XCTAssertEqual(CompanyIdentifier.iguanavation.description, #"Iguanavation, Inc."#)
    
        // DiUS Computing Pty Ltd
        XCTAssertEqual(CompanyIdentifier.diusComputingPty.rawValue, 1844)
        XCTAssertEqual(CompanyIdentifier.diusComputingPty.name, #"DiUS Computing Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.diusComputingPty.description, #"DiUS Computing Pty Ltd"#)
    
        // UpRight Technologies LTD
        XCTAssertEqual(CompanyIdentifier.uprightTechnologies.rawValue, 1845)
        XCTAssertEqual(CompanyIdentifier.uprightTechnologies.name, #"UpRight Technologies LTD"#)
        XCTAssertEqual(CompanyIdentifier.uprightTechnologies.description, #"UpRight Technologies LTD"#)
    
        // FrancisFund, LLC
        XCTAssertEqual(CompanyIdentifier.francisfund.rawValue, 1846)
        XCTAssertEqual(CompanyIdentifier.francisfund.name, #"FrancisFund, LLC"#)
        XCTAssertEqual(CompanyIdentifier.francisfund.description, #"FrancisFund, LLC"#)
    
        // LLC Navitek
        XCTAssertEqual(CompanyIdentifier.llcNavitek.rawValue, 1847)
        XCTAssertEqual(CompanyIdentifier.llcNavitek.name, #"LLC Navitek"#)
        XCTAssertEqual(CompanyIdentifier.llcNavitek.description, #"LLC Navitek"#)
    
        // Glass Security Pte Ltd
        XCTAssertEqual(CompanyIdentifier.glassSecurityPte.rawValue, 1848)
        XCTAssertEqual(CompanyIdentifier.glassSecurityPte.name, #"Glass Security Pte Ltd"#)
        XCTAssertEqual(CompanyIdentifier.glassSecurityPte.description, #"Glass Security Pte Ltd"#)
    
        // Jiangsu Qinheng Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.jiangsuQinheng.rawValue, 1849)
        XCTAssertEqual(CompanyIdentifier.jiangsuQinheng.name, #"Jiangsu Qinheng Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.jiangsuQinheng.description, #"Jiangsu Qinheng Co., Ltd."#)
    
        // Chandler Systems Inc.
        XCTAssertEqual(CompanyIdentifier.chandlerSystems.rawValue, 1850)
        XCTAssertEqual(CompanyIdentifier.chandlerSystems.name, #"Chandler Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.chandlerSystems.description, #"Chandler Systems Inc."#)
    
        // Fantini Cosmi s.p.a.
        XCTAssertEqual(CompanyIdentifier.fantiniCosmi.rawValue, 1851)
        XCTAssertEqual(CompanyIdentifier.fantiniCosmi.name, #"Fantini Cosmi s.p.a."#)
        XCTAssertEqual(CompanyIdentifier.fantiniCosmi.description, #"Fantini Cosmi s.p.a."#)
    
        // Acubit ApS
        XCTAssertEqual(CompanyIdentifier.acubit.rawValue, 1852)
        XCTAssertEqual(CompanyIdentifier.acubit.name, #"Acubit ApS"#)
        XCTAssertEqual(CompanyIdentifier.acubit.description, #"Acubit ApS"#)
    
        // Beijing Hao Heng Tian Tech Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingHaoHengTianTech.rawValue, 1853)
        XCTAssertEqual(CompanyIdentifier.beijingHaoHengTianTech.name, #"Beijing Hao Heng Tian Tech Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingHaoHengTianTech.description, #"Beijing Hao Heng Tian Tech Co., Ltd."#)
    
        // Bluepack S.R.L.
        XCTAssertEqual(CompanyIdentifier.bluepack.rawValue, 1854)
        XCTAssertEqual(CompanyIdentifier.bluepack.name, #"Bluepack S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.bluepack.description, #"Bluepack S.R.L."#)
    
        // Beijing Unisoc Technologies Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingUnisocTechnologies.rawValue, 1855)
        XCTAssertEqual(CompanyIdentifier.beijingUnisocTechnologies.name, #"Beijing Unisoc Technologies Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingUnisocTechnologies.description, #"Beijing Unisoc Technologies Co., Ltd."#)
    
        // HITIQ LIMITED
        XCTAssertEqual(CompanyIdentifier.hitiq.rawValue, 1856)
        XCTAssertEqual(CompanyIdentifier.hitiq.name, #"HITIQ LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.hitiq.description, #"HITIQ LIMITED"#)
    
        // MAC SRL
        XCTAssertEqual(CompanyIdentifier.mac.rawValue, 1857)
        XCTAssertEqual(CompanyIdentifier.mac.name, #"MAC SRL"#)
        XCTAssertEqual(CompanyIdentifier.mac.description, #"MAC SRL"#)
    
        // DML LLC
        XCTAssertEqual(CompanyIdentifier.dml.rawValue, 1858)
        XCTAssertEqual(CompanyIdentifier.dml.name, #"DML LLC"#)
        XCTAssertEqual(CompanyIdentifier.dml.description, #"DML LLC"#)
    
        // Sanofi
        XCTAssertEqual(CompanyIdentifier.sanofi.rawValue, 1859)
        XCTAssertEqual(CompanyIdentifier.sanofi.name, #"Sanofi"#)
        XCTAssertEqual(CompanyIdentifier.sanofi.description, #"Sanofi"#)
    
        // SOCOMEC
        XCTAssertEqual(CompanyIdentifier.socomec.rawValue, 1860)
        XCTAssertEqual(CompanyIdentifier.socomec.name, #"SOCOMEC"#)
        XCTAssertEqual(CompanyIdentifier.socomec.description, #"SOCOMEC"#)
    
        // WIZNOVA, Inc.
        XCTAssertEqual(CompanyIdentifier.wiznova.rawValue, 1861)
        XCTAssertEqual(CompanyIdentifier.wiznova.name, #"WIZNOVA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.wiznova.description, #"WIZNOVA, Inc."#)
    
        // Seitec Elektronik GmbH
        XCTAssertEqual(CompanyIdentifier.seitecElektronik.rawValue, 1862)
        XCTAssertEqual(CompanyIdentifier.seitecElektronik.name, #"Seitec Elektronik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.seitecElektronik.description, #"Seitec Elektronik GmbH"#)
    
        // OR Technologies Pty Ltd
        XCTAssertEqual(CompanyIdentifier.orTechnologiesPty.rawValue, 1863)
        XCTAssertEqual(CompanyIdentifier.orTechnologiesPty.name, #"OR Technologies Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.orTechnologiesPty.description, #"OR Technologies Pty Ltd"#)
    
        // GuangZhou KuGou Computer Technology Co.Ltd
        XCTAssertEqual(CompanyIdentifier.guangzhouKugouComputerTechnology.rawValue, 1864)
        XCTAssertEqual(CompanyIdentifier.guangzhouKugouComputerTechnology.name, #"GuangZhou KuGou Computer Technology Co.Ltd"#)
        XCTAssertEqual(CompanyIdentifier.guangzhouKugouComputerTechnology.description, #"GuangZhou KuGou Computer Technology Co.Ltd"#)
    
        // DIAODIAO (Beijing) Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.diaodiaoBeijingTechnology.rawValue, 1865)
        XCTAssertEqual(CompanyIdentifier.diaodiaoBeijingTechnology.name, #"DIAODIAO (Beijing) Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.diaodiaoBeijingTechnology.description, #"DIAODIAO (Beijing) Technology Co., Ltd."#)
    
        // Illusory Studios LLC
        XCTAssertEqual(CompanyIdentifier.illusoryStudios.rawValue, 1866)
        XCTAssertEqual(CompanyIdentifier.illusoryStudios.name, #"Illusory Studios LLC"#)
        XCTAssertEqual(CompanyIdentifier.illusoryStudios.description, #"Illusory Studios LLC"#)
    
        // Sarvavid Software Solutions LLP
        XCTAssertEqual(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.rawValue, 1867)
        XCTAssertEqual(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.name, #"Sarvavid Software Solutions LLP"#)
        XCTAssertEqual(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.description, #"Sarvavid Software Solutions LLP"#)
    
        // iopool s.a.
        XCTAssertEqual(CompanyIdentifier.iopool.rawValue, 1868)
        XCTAssertEqual(CompanyIdentifier.iopool.name, #"iopool s.a."#)
        XCTAssertEqual(CompanyIdentifier.iopool.description, #"iopool s.a."#)
    
        // Amtech Systems, LLC
        XCTAssertEqual(CompanyIdentifier.amtechSystems.rawValue, 1869)
        XCTAssertEqual(CompanyIdentifier.amtechSystems.name, #"Amtech Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.amtechSystems.description, #"Amtech Systems, LLC"#)
    
        // EAGLE DETECTION SA
        XCTAssertEqual(CompanyIdentifier.eagleDetection.rawValue, 1870)
        XCTAssertEqual(CompanyIdentifier.eagleDetection.name, #"EAGLE DETECTION SA"#)
        XCTAssertEqual(CompanyIdentifier.eagleDetection.description, #"EAGLE DETECTION SA"#)
    
        // MEDIATECH S.R.L.
        XCTAssertEqual(CompanyIdentifier.mediatech.rawValue, 1871)
        XCTAssertEqual(CompanyIdentifier.mediatech.name, #"MEDIATECH S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.mediatech.description, #"MEDIATECH S.R.L."#)
    
        // Hamilton Professional Services of Canada Incorporated
        XCTAssertEqual(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.rawValue, 1872)
        XCTAssertEqual(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.name, #"Hamilton Professional Services of Canada Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.description, #"Hamilton Professional Services of Canada Incorporated"#)
    
        // Changsha JEMO IC Design Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.changshaJemoIcDesign.rawValue, 1873)
        XCTAssertEqual(CompanyIdentifier.changshaJemoIcDesign.name, #"Changsha JEMO IC Design Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.changshaJemoIcDesign.description, #"Changsha JEMO IC Design Co.,Ltd"#)
    
        // Elatec GmbH
        XCTAssertEqual(CompanyIdentifier.elatec.rawValue, 1874)
        XCTAssertEqual(CompanyIdentifier.elatec.name, #"Elatec GmbH"#)
        XCTAssertEqual(CompanyIdentifier.elatec.description, #"Elatec GmbH"#)
    
        // JLG Industries, Inc.
        XCTAssertEqual(CompanyIdentifier.jlgIndustries.rawValue, 1875)
        XCTAssertEqual(CompanyIdentifier.jlgIndustries.name, #"JLG Industries, Inc."#)
        XCTAssertEqual(CompanyIdentifier.jlgIndustries.description, #"JLG Industries, Inc."#)
    
        // Michael Parkin
        XCTAssertEqual(CompanyIdentifier.michaelParkin.rawValue, 1876)
        XCTAssertEqual(CompanyIdentifier.michaelParkin.name, #"Michael Parkin"#)
        XCTAssertEqual(CompanyIdentifier.michaelParkin.description, #"Michael Parkin"#)
    
        // Brother Industries, Ltd
        XCTAssertEqual(CompanyIdentifier.brotherIndustries.rawValue, 1877)
        XCTAssertEqual(CompanyIdentifier.brotherIndustries.name, #"Brother Industries, Ltd"#)
        XCTAssertEqual(CompanyIdentifier.brotherIndustries.description, #"Brother Industries, Ltd"#)
    
        // Lumens For Less, Inc
        XCTAssertEqual(CompanyIdentifier.lumensForLess.rawValue, 1878)
        XCTAssertEqual(CompanyIdentifier.lumensForLess.name, #"Lumens For Less, Inc"#)
        XCTAssertEqual(CompanyIdentifier.lumensForLess.description, #"Lumens For Less, Inc"#)
    
        // ELA Innovation
        XCTAssertEqual(CompanyIdentifier.elaInnovation.rawValue, 1879)
        XCTAssertEqual(CompanyIdentifier.elaInnovation.name, #"ELA Innovation"#)
        XCTAssertEqual(CompanyIdentifier.elaInnovation.description, #"ELA Innovation"#)
    
        // umanSense AB
        XCTAssertEqual(CompanyIdentifier.umansense.rawValue, 1880)
        XCTAssertEqual(CompanyIdentifier.umansense.name, #"umanSense AB"#)
        XCTAssertEqual(CompanyIdentifier.umansense.description, #"umanSense AB"#)
    
        // Shanghai InGeek Cyber Security Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiIngeekCyberSecurity.rawValue, 1881)
        XCTAssertEqual(CompanyIdentifier.shanghaiIngeekCyberSecurity.name, #"Shanghai InGeek Cyber Security Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiIngeekCyberSecurity.description, #"Shanghai InGeek Cyber Security Co., Ltd."#)
    
        // HARMAN CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.harman.rawValue, 1882)
        XCTAssertEqual(CompanyIdentifier.harman.name, #"HARMAN CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.harman.description, #"HARMAN CO.,LTD."#)
    
        // Smart Sensor Devices AB
        XCTAssertEqual(CompanyIdentifier.smartSensorDevices.rawValue, 1883)
        XCTAssertEqual(CompanyIdentifier.smartSensorDevices.name, #"Smart Sensor Devices AB"#)
        XCTAssertEqual(CompanyIdentifier.smartSensorDevices.description, #"Smart Sensor Devices AB"#)
    
        // Antitronics Inc.
        XCTAssertEqual(CompanyIdentifier.antitronics.rawValue, 1884)
        XCTAssertEqual(CompanyIdentifier.antitronics.name, #"Antitronics Inc."#)
        XCTAssertEqual(CompanyIdentifier.antitronics.description, #"Antitronics Inc."#)
    
        // RHOMBUS SYSTEMS, INC.
        XCTAssertEqual(CompanyIdentifier.rhombusSystems.rawValue, 1885)
        XCTAssertEqual(CompanyIdentifier.rhombusSystems.name, #"RHOMBUS SYSTEMS, INC."#)
        XCTAssertEqual(CompanyIdentifier.rhombusSystems.description, #"RHOMBUS SYSTEMS, INC."#)
    
        // Katerra Inc.
        XCTAssertEqual(CompanyIdentifier.katerra.rawValue, 1886)
        XCTAssertEqual(CompanyIdentifier.katerra.name, #"Katerra Inc."#)
        XCTAssertEqual(CompanyIdentifier.katerra.description, #"Katerra Inc."#)
    
        // Remote Solution Co., LTD.
        XCTAssertEqual(CompanyIdentifier.remoteSolution.rawValue, 1887)
        XCTAssertEqual(CompanyIdentifier.remoteSolution.name, #"Remote Solution Co., LTD."#)
        XCTAssertEqual(CompanyIdentifier.remoteSolution.description, #"Remote Solution Co., LTD."#)
    
        // Vimar SpA
        XCTAssertEqual(CompanyIdentifier.vimarSpa.rawValue, 1888)
        XCTAssertEqual(CompanyIdentifier.vimarSpa.name, #"Vimar SpA"#)
        XCTAssertEqual(CompanyIdentifier.vimarSpa.description, #"Vimar SpA"#)
    
        // Mantis Tech LLC
        XCTAssertEqual(CompanyIdentifier.mantisTech.rawValue, 1889)
        XCTAssertEqual(CompanyIdentifier.mantisTech.name, #"Mantis Tech LLC"#)
        XCTAssertEqual(CompanyIdentifier.mantisTech.description, #"Mantis Tech LLC"#)
    
        // TerOpta Ltd
        XCTAssertEqual(CompanyIdentifier.teropta.rawValue, 1890)
        XCTAssertEqual(CompanyIdentifier.teropta.name, #"TerOpta Ltd"#)
        XCTAssertEqual(CompanyIdentifier.teropta.description, #"TerOpta Ltd"#)
    
        // PIKOLIN S.L.
        XCTAssertEqual(CompanyIdentifier.pikolin.rawValue, 1891)
        XCTAssertEqual(CompanyIdentifier.pikolin.name, #"PIKOLIN S.L."#)
        XCTAssertEqual(CompanyIdentifier.pikolin.description, #"PIKOLIN S.L."#)
    
        // WWZN Information Technology Company Limited
        XCTAssertEqual(CompanyIdentifier.wwznInformationTechnologyCompany.rawValue, 1892)
        XCTAssertEqual(CompanyIdentifier.wwznInformationTechnologyCompany.name, #"WWZN Information Technology Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.wwznInformationTechnologyCompany.description, #"WWZN Information Technology Company Limited"#)
    
        // Voxx International
        XCTAssertEqual(CompanyIdentifier.voxxInternational.rawValue, 1893)
        XCTAssertEqual(CompanyIdentifier.voxxInternational.name, #"Voxx International"#)
        XCTAssertEqual(CompanyIdentifier.voxxInternational.description, #"Voxx International"#)
    
        // ART AND PROGRAM, INC.
        XCTAssertEqual(CompanyIdentifier.artAndProgram.rawValue, 1894)
        XCTAssertEqual(CompanyIdentifier.artAndProgram.name, #"ART AND PROGRAM, INC."#)
        XCTAssertEqual(CompanyIdentifier.artAndProgram.description, #"ART AND PROGRAM, INC."#)
    
        // NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD.
        XCTAssertEqual(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.rawValue, 1895)
        XCTAssertEqual(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.name, #"NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD."#)
        XCTAssertEqual(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.description, #"NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD."#)
    
        // Peloton Interactive Inc.
        XCTAssertEqual(CompanyIdentifier.pelotonInteractive.rawValue, 1896)
        XCTAssertEqual(CompanyIdentifier.pelotonInteractive.name, #"Peloton Interactive Inc."#)
        XCTAssertEqual(CompanyIdentifier.pelotonInteractive.description, #"Peloton Interactive Inc."#)
    
        // Force Impact Technologies
        XCTAssertEqual(CompanyIdentifier.forceImpactTechnologies.rawValue, 1897)
        XCTAssertEqual(CompanyIdentifier.forceImpactTechnologies.name, #"Force Impact Technologies"#)
        XCTAssertEqual(CompanyIdentifier.forceImpactTechnologies.description, #"Force Impact Technologies"#)
    
        // Dmac Mobile Developments, LLC
        XCTAssertEqual(CompanyIdentifier.dmacMobileDevelopments.rawValue, 1898)
        XCTAssertEqual(CompanyIdentifier.dmacMobileDevelopments.name, #"Dmac Mobile Developments, LLC"#)
        XCTAssertEqual(CompanyIdentifier.dmacMobileDevelopments.description, #"Dmac Mobile Developments, LLC"#)
    
        // Engineered Medical Technologies
        XCTAssertEqual(CompanyIdentifier.engineeredMedicalTechnologies.rawValue, 1899)
        XCTAssertEqual(CompanyIdentifier.engineeredMedicalTechnologies.name, #"Engineered Medical Technologies"#)
        XCTAssertEqual(CompanyIdentifier.engineeredMedicalTechnologies.description, #"Engineered Medical Technologies"#)
    
        // Noodle Technology inc
        XCTAssertEqual(CompanyIdentifier.noodleTechnology.rawValue, 1900)
        XCTAssertEqual(CompanyIdentifier.noodleTechnology.name, #"Noodle Technology inc"#)
        XCTAssertEqual(CompanyIdentifier.noodleTechnology.description, #"Noodle Technology inc"#)
    
        // Graesslin GmbH
        XCTAssertEqual(CompanyIdentifier.graesslin.rawValue, 1901)
        XCTAssertEqual(CompanyIdentifier.graesslin.name, #"Graesslin GmbH"#)
        XCTAssertEqual(CompanyIdentifier.graesslin.description, #"Graesslin GmbH"#)
    
        // WuQi technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.wuqiTechnologies.rawValue, 1902)
        XCTAssertEqual(CompanyIdentifier.wuqiTechnologies.name, #"WuQi technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.wuqiTechnologies.description, #"WuQi technologies, Inc."#)
    
        // Successful Endeavours Pty Ltd
        XCTAssertEqual(CompanyIdentifier.successfulEndeavoursPty.rawValue, 1903)
        XCTAssertEqual(CompanyIdentifier.successfulEndeavoursPty.name, #"Successful Endeavours Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.successfulEndeavoursPty.description, #"Successful Endeavours Pty Ltd"#)
    
        // InnoCon Medical ApS
        XCTAssertEqual(CompanyIdentifier.innoconMedical.rawValue, 1904)
        XCTAssertEqual(CompanyIdentifier.innoconMedical.name, #"InnoCon Medical ApS"#)
        XCTAssertEqual(CompanyIdentifier.innoconMedical.description, #"InnoCon Medical ApS"#)
    
        // Corvex Connected Safety
        XCTAssertEqual(CompanyIdentifier.corvexConnectedSafety.rawValue, 1905)
        XCTAssertEqual(CompanyIdentifier.corvexConnectedSafety.name, #"Corvex Connected Safety"#)
        XCTAssertEqual(CompanyIdentifier.corvexConnectedSafety.description, #"Corvex Connected Safety"#)
    
        // Thirdwayv Inc.
        XCTAssertEqual(CompanyIdentifier.thirdwayv.rawValue, 1906)
        XCTAssertEqual(CompanyIdentifier.thirdwayv.name, #"Thirdwayv Inc."#)
        XCTAssertEqual(CompanyIdentifier.thirdwayv.description, #"Thirdwayv Inc."#)
    
        // Echoflex Solutions Inc.
        XCTAssertEqual(CompanyIdentifier.echoflexSolutions.rawValue, 1907)
        XCTAssertEqual(CompanyIdentifier.echoflexSolutions.name, #"Echoflex Solutions Inc."#)
        XCTAssertEqual(CompanyIdentifier.echoflexSolutions.description, #"Echoflex Solutions Inc."#)
    
        // C-MAX Asia Limited
        XCTAssertEqual(CompanyIdentifier.cMaxAsia.rawValue, 1908)
        XCTAssertEqual(CompanyIdentifier.cMaxAsia.name, #"C-MAX Asia Limited"#)
        XCTAssertEqual(CompanyIdentifier.cMaxAsia.description, #"C-MAX Asia Limited"#)
    
        // 4eBusiness GmbH
        XCTAssertEqual(CompanyIdentifier.company4Ebusiness.rawValue, 1909)
        XCTAssertEqual(CompanyIdentifier.company4Ebusiness.name, #"4eBusiness GmbH"#)
        XCTAssertEqual(CompanyIdentifier.company4Ebusiness.description, #"4eBusiness GmbH"#)
    
        // Cyber Transport Control GmbH
        XCTAssertEqual(CompanyIdentifier.cyberTransportControl.rawValue, 1910)
        XCTAssertEqual(CompanyIdentifier.cyberTransportControl.name, #"Cyber Transport Control GmbH"#)
        XCTAssertEqual(CompanyIdentifier.cyberTransportControl.description, #"Cyber Transport Control GmbH"#)
    
        // Cue
        XCTAssertEqual(CompanyIdentifier.cue.rawValue, 1911)
        XCTAssertEqual(CompanyIdentifier.cue.name, #"Cue"#)
        XCTAssertEqual(CompanyIdentifier.cue.description, #"Cue"#)
    
        // KOAMTAC INC.
        XCTAssertEqual(CompanyIdentifier.koamtac.rawValue, 1912)
        XCTAssertEqual(CompanyIdentifier.koamtac.name, #"KOAMTAC INC."#)
        XCTAssertEqual(CompanyIdentifier.koamtac.description, #"KOAMTAC INC."#)
    
        // Loopshore Oy
        XCTAssertEqual(CompanyIdentifier.loopshore.rawValue, 1913)
        XCTAssertEqual(CompanyIdentifier.loopshore.name, #"Loopshore Oy"#)
        XCTAssertEqual(CompanyIdentifier.loopshore.description, #"Loopshore Oy"#)
    
        // Niruha Systems Private Limited
        XCTAssertEqual(CompanyIdentifier.niruhaSystems.rawValue, 1914)
        XCTAssertEqual(CompanyIdentifier.niruhaSystems.name, #"Niruha Systems Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.niruhaSystems.description, #"Niruha Systems Private Limited"#)
    
        // AmaterZ, Inc.
        XCTAssertEqual(CompanyIdentifier.amaterz.rawValue, 1915)
        XCTAssertEqual(CompanyIdentifier.amaterz.name, #"AmaterZ, Inc."#)
        XCTAssertEqual(CompanyIdentifier.amaterz.description, #"AmaterZ, Inc."#)
    
        // radius co., ltd.
        XCTAssertEqual(CompanyIdentifier.radius.rawValue, 1916)
        XCTAssertEqual(CompanyIdentifier.radius.name, #"radius co., ltd."#)
        XCTAssertEqual(CompanyIdentifier.radius.description, #"radius co., ltd."#)
    
        // Sensority, s.r.o.
        XCTAssertEqual(CompanyIdentifier.sensority.rawValue, 1917)
        XCTAssertEqual(CompanyIdentifier.sensority.name, #"Sensority, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.sensority.description, #"Sensority, s.r.o."#)
    
        // Sparkage Inc.
        XCTAssertEqual(CompanyIdentifier.sparkage.rawValue, 1918)
        XCTAssertEqual(CompanyIdentifier.sparkage.name, #"Sparkage Inc."#)
        XCTAssertEqual(CompanyIdentifier.sparkage.description, #"Sparkage Inc."#)
    
        // Glenview Software Corporation
        XCTAssertEqual(CompanyIdentifier.glenviewSoftware.rawValue, 1919)
        XCTAssertEqual(CompanyIdentifier.glenviewSoftware.name, #"Glenview Software Corporation"#)
        XCTAssertEqual(CompanyIdentifier.glenviewSoftware.description, #"Glenview Software Corporation"#)
    
        // Finch Technologies Ltd.
        XCTAssertEqual(CompanyIdentifier.finchTechnologies.rawValue, 1920)
        XCTAssertEqual(CompanyIdentifier.finchTechnologies.name, #"Finch Technologies Ltd."#)
        XCTAssertEqual(CompanyIdentifier.finchTechnologies.description, #"Finch Technologies Ltd."#)
    
        // Qingping Technology (Beijing) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.qingpingTechnologyBeijing.rawValue, 1921)
        XCTAssertEqual(CompanyIdentifier.qingpingTechnologyBeijing.name, #"Qingping Technology (Beijing) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.qingpingTechnologyBeijing.description, #"Qingping Technology (Beijing) Co., Ltd."#)
    
        // DeviceDrive AS
        XCTAssertEqual(CompanyIdentifier.devicedrive.rawValue, 1922)
        XCTAssertEqual(CompanyIdentifier.devicedrive.name, #"DeviceDrive AS"#)
        XCTAssertEqual(CompanyIdentifier.devicedrive.description, #"DeviceDrive AS"#)
    
        // ESEMBER LIMITED LIABILITY COMPANY
        XCTAssertEqual(CompanyIdentifier.esemberLiabilityCompany.rawValue, 1923)
        XCTAssertEqual(CompanyIdentifier.esemberLiabilityCompany.name, #"ESEMBER LIMITED LIABILITY COMPANY"#)
        XCTAssertEqual(CompanyIdentifier.esemberLiabilityCompany.description, #"ESEMBER LIMITED LIABILITY COMPANY"#)
    
        // audifon GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.audifon.rawValue, 1924)
        XCTAssertEqual(CompanyIdentifier.audifon.name, #"audifon GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.audifon.description, #"audifon GmbH & Co. KG"#)
    
        // O2 Micro, Inc.
        XCTAssertEqual(CompanyIdentifier.o2Micro.rawValue, 1925)
        XCTAssertEqual(CompanyIdentifier.o2Micro.name, #"O2 Micro, Inc."#)
        XCTAssertEqual(CompanyIdentifier.o2Micro.description, #"O2 Micro, Inc."#)
    
        // HLP Controls Pty Limited
        XCTAssertEqual(CompanyIdentifier.hlpControlsPty.rawValue, 1926)
        XCTAssertEqual(CompanyIdentifier.hlpControlsPty.name, #"HLP Controls Pty Limited"#)
        XCTAssertEqual(CompanyIdentifier.hlpControlsPty.description, #"HLP Controls Pty Limited"#)
    
        // Pangaea Solution
        XCTAssertEqual(CompanyIdentifier.pangaeaSolution.rawValue, 1927)
        XCTAssertEqual(CompanyIdentifier.pangaeaSolution.name, #"Pangaea Solution"#)
        XCTAssertEqual(CompanyIdentifier.pangaeaSolution.description, #"Pangaea Solution"#)
    
        // BubblyNet, LLC
        XCTAssertEqual(CompanyIdentifier.bubblynet.rawValue, 1928)
        XCTAssertEqual(CompanyIdentifier.bubblynet.name, #"BubblyNet, LLC"#)
        XCTAssertEqual(CompanyIdentifier.bubblynet.description, #"BubblyNet, LLC"#)
    
        // The Wildflower Foundation
        XCTAssertEqual(CompanyIdentifier.wildflowerFoundation.rawValue, 1930)
        XCTAssertEqual(CompanyIdentifier.wildflowerFoundation.name, #"The Wildflower Foundation"#)
        XCTAssertEqual(CompanyIdentifier.wildflowerFoundation.description, #"The Wildflower Foundation"#)
    
        // Optikam Tech Inc.
        XCTAssertEqual(CompanyIdentifier.optikamTech.rawValue, 1931)
        XCTAssertEqual(CompanyIdentifier.optikamTech.name, #"Optikam Tech Inc."#)
        XCTAssertEqual(CompanyIdentifier.optikamTech.description, #"Optikam Tech Inc."#)
    
        // MINIBREW HOLDING B.V
        XCTAssertEqual(CompanyIdentifier.minibrewHoldingBV.rawValue, 1932)
        XCTAssertEqual(CompanyIdentifier.minibrewHoldingBV.name, #"MINIBREW HOLDING B.V"#)
        XCTAssertEqual(CompanyIdentifier.minibrewHoldingBV.description, #"MINIBREW HOLDING B.V"#)
    
        // Cybex GmbH
        XCTAssertEqual(CompanyIdentifier.cybex.rawValue, 1933)
        XCTAssertEqual(CompanyIdentifier.cybex.name, #"Cybex GmbH"#)
        XCTAssertEqual(CompanyIdentifier.cybex.description, #"Cybex GmbH"#)
    
        // FUJIMIC NIIGATA, INC.
        XCTAssertEqual(CompanyIdentifier.fujimicNiigata.rawValue, 1934)
        XCTAssertEqual(CompanyIdentifier.fujimicNiigata.name, #"FUJIMIC NIIGATA, INC."#)
        XCTAssertEqual(CompanyIdentifier.fujimicNiigata.description, #"FUJIMIC NIIGATA, INC."#)
    
        // Hanna Instruments, Inc.
        XCTAssertEqual(CompanyIdentifier.hannaInstruments.rawValue, 1935)
        XCTAssertEqual(CompanyIdentifier.hannaInstruments.name, #"Hanna Instruments, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hannaInstruments.description, #"Hanna Instruments, Inc."#)
    
        // KOMPAN A/S
        XCTAssertEqual(CompanyIdentifier.kompan.rawValue, 1936)
        XCTAssertEqual(CompanyIdentifier.kompan.name, #"KOMPAN A/S"#)
        XCTAssertEqual(CompanyIdentifier.kompan.description, #"KOMPAN A/S"#)
    
        // Scosche Industries, Inc.
        XCTAssertEqual(CompanyIdentifier.scoscheIndustries.rawValue, 1937)
        XCTAssertEqual(CompanyIdentifier.scoscheIndustries.name, #"Scosche Industries, Inc."#)
        XCTAssertEqual(CompanyIdentifier.scoscheIndustries.description, #"Scosche Industries, Inc."#)
    
        // Provo Craft
        XCTAssertEqual(CompanyIdentifier.provoCraft.rawValue, 1938)
        XCTAssertEqual(CompanyIdentifier.provoCraft.name, #"Provo Craft"#)
        XCTAssertEqual(CompanyIdentifier.provoCraft.description, #"Provo Craft"#)
    
        // AEV spol. s r.o.
        XCTAssertEqual(CompanyIdentifier.aevSpolSRO.rawValue, 1939)
        XCTAssertEqual(CompanyIdentifier.aevSpolSRO.name, #"AEV spol. s r.o."#)
        XCTAssertEqual(CompanyIdentifier.aevSpolSRO.description, #"AEV spol. s r.o."#)
    
        // The Coca-Cola Company
        XCTAssertEqual(CompanyIdentifier.cocaColaCompany.rawValue, 1940)
        XCTAssertEqual(CompanyIdentifier.cocaColaCompany.name, #"The Coca-Cola Company"#)
        XCTAssertEqual(CompanyIdentifier.cocaColaCompany.description, #"The Coca-Cola Company"#)
    
        // GASTEC CORPORATION
        XCTAssertEqual(CompanyIdentifier.gastec.rawValue, 1941)
        XCTAssertEqual(CompanyIdentifier.gastec.name, #"GASTEC CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.gastec.description, #"GASTEC CORPORATION"#)
    
        // StarLeaf Ltd
        XCTAssertEqual(CompanyIdentifier.starleaf.rawValue, 1942)
        XCTAssertEqual(CompanyIdentifier.starleaf.name, #"StarLeaf Ltd"#)
        XCTAssertEqual(CompanyIdentifier.starleaf.description, #"StarLeaf Ltd"#)
    
        // Water-i.d. GmbH
        XCTAssertEqual(CompanyIdentifier.waterID.rawValue, 1943)
        XCTAssertEqual(CompanyIdentifier.waterID.name, #"Water-i.d. GmbH"#)
        XCTAssertEqual(CompanyIdentifier.waterID.description, #"Water-i.d. GmbH"#)
    
        // HoloKit, Inc.
        XCTAssertEqual(CompanyIdentifier.holokit.rawValue, 1944)
        XCTAssertEqual(CompanyIdentifier.holokit.name, #"HoloKit, Inc."#)
        XCTAssertEqual(CompanyIdentifier.holokit.description, #"HoloKit, Inc."#)
    
        // PlantChoir Inc.
        XCTAssertEqual(CompanyIdentifier.plantchoir.rawValue, 1945)
        XCTAssertEqual(CompanyIdentifier.plantchoir.name, #"PlantChoir Inc."#)
        XCTAssertEqual(CompanyIdentifier.plantchoir.description, #"PlantChoir Inc."#)
    
        // GuangDong Oppo Mobile Telecommunications Corp., Ltd.
        XCTAssertEqual(CompanyIdentifier.guangdongOppoMobileTelecommunications.rawValue, 1946)
        XCTAssertEqual(CompanyIdentifier.guangdongOppoMobileTelecommunications.name, #"GuangDong Oppo Mobile Telecommunications Corp., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.guangdongOppoMobileTelecommunications.description, #"GuangDong Oppo Mobile Telecommunications Corp., Ltd."#)
    
        // CST ELECTRONICS (PROPRIETARY) LIMITED
        XCTAssertEqual(CompanyIdentifier.cstElectronicsProprietary.rawValue, 1947)
        XCTAssertEqual(CompanyIdentifier.cstElectronicsProprietary.name, #"CST ELECTRONICS (PROPRIETARY) LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.cstElectronicsProprietary.description, #"CST ELECTRONICS (PROPRIETARY) LIMITED"#)
    
        // Sky UK Limited
        XCTAssertEqual(CompanyIdentifier.skyUk.rawValue, 1948)
        XCTAssertEqual(CompanyIdentifier.skyUk.name, #"Sky UK Limited"#)
        XCTAssertEqual(CompanyIdentifier.skyUk.description, #"Sky UK Limited"#)
    
        // Digibale Pty Ltd
        XCTAssertEqual(CompanyIdentifier.digibalePty.rawValue, 1949)
        XCTAssertEqual(CompanyIdentifier.digibalePty.name, #"Digibale Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.digibalePty.description, #"Digibale Pty Ltd"#)
    
        // Smartloxx GmbH
        XCTAssertEqual(CompanyIdentifier.smartloxx.rawValue, 1950)
        XCTAssertEqual(CompanyIdentifier.smartloxx.name, #"Smartloxx GmbH"#)
        XCTAssertEqual(CompanyIdentifier.smartloxx.description, #"Smartloxx GmbH"#)
    
        // Pune Scientific LLP
        XCTAssertEqual(CompanyIdentifier.puneScientificLlp.rawValue, 1951)
        XCTAssertEqual(CompanyIdentifier.puneScientificLlp.name, #"Pune Scientific LLP"#)
        XCTAssertEqual(CompanyIdentifier.puneScientificLlp.description, #"Pune Scientific LLP"#)
    
        // Regent Beleuchtungskorper AG
        XCTAssertEqual(CompanyIdentifier.regentBeleuchtungskorper.rawValue, 1952)
        XCTAssertEqual(CompanyIdentifier.regentBeleuchtungskorper.name, #"Regent Beleuchtungskorper AG"#)
        XCTAssertEqual(CompanyIdentifier.regentBeleuchtungskorper.description, #"Regent Beleuchtungskorper AG"#)
    
        // Apollo Neuroscience, Inc.
        XCTAssertEqual(CompanyIdentifier.apolloNeuroscience.rawValue, 1953)
        XCTAssertEqual(CompanyIdentifier.apolloNeuroscience.name, #"Apollo Neuroscience, Inc."#)
        XCTAssertEqual(CompanyIdentifier.apolloNeuroscience.description, #"Apollo Neuroscience, Inc."#)
    
        // Roku, Inc.
        XCTAssertEqual(CompanyIdentifier.roku.rawValue, 1954)
        XCTAssertEqual(CompanyIdentifier.roku.name, #"Roku, Inc."#)
        XCTAssertEqual(CompanyIdentifier.roku.description, #"Roku, Inc."#)
    
        // Comcast Cable
        XCTAssertEqual(CompanyIdentifier.comcastCable.rawValue, 1955)
        XCTAssertEqual(CompanyIdentifier.comcastCable.name, #"Comcast Cable"#)
        XCTAssertEqual(CompanyIdentifier.comcastCable.description, #"Comcast Cable"#)
    
        // Xiamen Mage Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.xiamenMageInformationTechnology.rawValue, 1956)
        XCTAssertEqual(CompanyIdentifier.xiamenMageInformationTechnology.name, #"Xiamen Mage Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.xiamenMageInformationTechnology.description, #"Xiamen Mage Information Technology Co., Ltd."#)
    
        // RAB Lighting, Inc.
        XCTAssertEqual(CompanyIdentifier.rabLighting.rawValue, 1957)
        XCTAssertEqual(CompanyIdentifier.rabLighting.name, #"RAB Lighting, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rabLighting.description, #"RAB Lighting, Inc."#)
    
        // Musen Connect, Inc.
        XCTAssertEqual(CompanyIdentifier.musenConnect.rawValue, 1958)
        XCTAssertEqual(CompanyIdentifier.musenConnect.name, #"Musen Connect, Inc."#)
        XCTAssertEqual(CompanyIdentifier.musenConnect.description, #"Musen Connect, Inc."#)
    
        // Zume, Inc.
        XCTAssertEqual(CompanyIdentifier.zume.rawValue, 1959)
        XCTAssertEqual(CompanyIdentifier.zume.name, #"Zume, Inc."#)
        XCTAssertEqual(CompanyIdentifier.zume.description, #"Zume, Inc."#)
    
        // conbee GmbH
        XCTAssertEqual(CompanyIdentifier.conbee.rawValue, 1960)
        XCTAssertEqual(CompanyIdentifier.conbee.name, #"conbee GmbH"#)
        XCTAssertEqual(CompanyIdentifier.conbee.description, #"conbee GmbH"#)
    
        // Bruel & Kjaer Sound & Vibration
        XCTAssertEqual(CompanyIdentifier.bruelKjaerSoundVibration.rawValue, 1961)
        XCTAssertEqual(CompanyIdentifier.bruelKjaerSoundVibration.name, #"Bruel & Kjaer Sound & Vibration"#)
        XCTAssertEqual(CompanyIdentifier.bruelKjaerSoundVibration.description, #"Bruel & Kjaer Sound & Vibration"#)
    
        // The Kroger Co.
        XCTAssertEqual(CompanyIdentifier.kroger.rawValue, 1962)
        XCTAssertEqual(CompanyIdentifier.kroger.name, #"The Kroger Co."#)
        XCTAssertEqual(CompanyIdentifier.kroger.description, #"The Kroger Co."#)
    
        // Granite River Solutions, Inc.
        XCTAssertEqual(CompanyIdentifier.graniteRiverSolutions.rawValue, 1963)
        XCTAssertEqual(CompanyIdentifier.graniteRiverSolutions.name, #"Granite River Solutions, Inc."#)
        XCTAssertEqual(CompanyIdentifier.graniteRiverSolutions.description, #"Granite River Solutions, Inc."#)
    
        // LoupeDeck Oy
        XCTAssertEqual(CompanyIdentifier.loupedeck.rawValue, 1964)
        XCTAssertEqual(CompanyIdentifier.loupedeck.name, #"LoupeDeck Oy"#)
        XCTAssertEqual(CompanyIdentifier.loupedeck.description, #"LoupeDeck Oy"#)
    
        // New H3C Technologies Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.newH3CTechnologies.rawValue, 1965)
        XCTAssertEqual(CompanyIdentifier.newH3CTechnologies.name, #"New H3C Technologies Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.newH3CTechnologies.description, #"New H3C Technologies Co.,Ltd"#)
    
        // Aurea Solucoes Tecnologicas Ltda.
        XCTAssertEqual(CompanyIdentifier.aureaSolucoesTecnologicasa.rawValue, 1966)
        XCTAssertEqual(CompanyIdentifier.aureaSolucoesTecnologicasa.name, #"Aurea Solucoes Tecnologicas Ltda."#)
        XCTAssertEqual(CompanyIdentifier.aureaSolucoesTecnologicasa.description, #"Aurea Solucoes Tecnologicas Ltda."#)
    
        // Hong Kong Bouffalo Lab Limited
        XCTAssertEqual(CompanyIdentifier.hongKongBouffaloLab.rawValue, 1967)
        XCTAssertEqual(CompanyIdentifier.hongKongBouffaloLab.name, #"Hong Kong Bouffalo Lab Limited"#)
        XCTAssertEqual(CompanyIdentifier.hongKongBouffaloLab.description, #"Hong Kong Bouffalo Lab Limited"#)
    
        // GV Concepts Inc.
        XCTAssertEqual(CompanyIdentifier.gvConcepts.rawValue, 1968)
        XCTAssertEqual(CompanyIdentifier.gvConcepts.name, #"GV Concepts Inc."#)
        XCTAssertEqual(CompanyIdentifier.gvConcepts.description, #"GV Concepts Inc."#)
    
        // Thomas Dynamics, LLC
        XCTAssertEqual(CompanyIdentifier.thomasDynamics.rawValue, 1969)
        XCTAssertEqual(CompanyIdentifier.thomasDynamics.name, #"Thomas Dynamics, LLC"#)
        XCTAssertEqual(CompanyIdentifier.thomasDynamics.description, #"Thomas Dynamics, LLC"#)
    
        // Moeco IOT Inc.
        XCTAssertEqual(CompanyIdentifier.moecoIot.rawValue, 1970)
        XCTAssertEqual(CompanyIdentifier.moecoIot.name, #"Moeco IOT Inc."#)
        XCTAssertEqual(CompanyIdentifier.moecoIot.description, #"Moeco IOT Inc."#)
    
        // 2N TELEKOMUNIKACE a.s.
        XCTAssertEqual(CompanyIdentifier.company2NTelekomunikace.rawValue, 1971)
        XCTAssertEqual(CompanyIdentifier.company2NTelekomunikace.name, #"2N TELEKOMUNIKACE a.s."#)
        XCTAssertEqual(CompanyIdentifier.company2NTelekomunikace.description, #"2N TELEKOMUNIKACE a.s."#)
    
        // Hormann KG Antriebstechnik
        XCTAssertEqual(CompanyIdentifier.hormannKgAntriebstechnik.rawValue, 1972)
        XCTAssertEqual(CompanyIdentifier.hormannKgAntriebstechnik.name, #"Hormann KG Antriebstechnik"#)
        XCTAssertEqual(CompanyIdentifier.hormannKgAntriebstechnik.description, #"Hormann KG Antriebstechnik"#)
    
        // CRONO CHIP, S.L.
        XCTAssertEqual(CompanyIdentifier.cronoChip.rawValue, 1973)
        XCTAssertEqual(CompanyIdentifier.cronoChip.name, #"CRONO CHIP, S.L."#)
        XCTAssertEqual(CompanyIdentifier.cronoChip.description, #"CRONO CHIP, S.L."#)
    
        // Soundbrenner Limited
        XCTAssertEqual(CompanyIdentifier.soundbrenner.rawValue, 1974)
        XCTAssertEqual(CompanyIdentifier.soundbrenner.name, #"Soundbrenner Limited"#)
        XCTAssertEqual(CompanyIdentifier.soundbrenner.description, #"Soundbrenner Limited"#)
    
        // ETABLISSEMENTS GEORGES RENAULT
        XCTAssertEqual(CompanyIdentifier.etablissementsGeorgesRenault.rawValue, 1975)
        XCTAssertEqual(CompanyIdentifier.etablissementsGeorgesRenault.name, #"ETABLISSEMENTS GEORGES RENAULT"#)
        XCTAssertEqual(CompanyIdentifier.etablissementsGeorgesRenault.description, #"ETABLISSEMENTS GEORGES RENAULT"#)
    
        // iSwip
        XCTAssertEqual(CompanyIdentifier.iswip.rawValue, 1976)
        XCTAssertEqual(CompanyIdentifier.iswip.name, #"iSwip"#)
        XCTAssertEqual(CompanyIdentifier.iswip.description, #"iSwip"#)
    
        // Epona Biotec Limited
        XCTAssertEqual(CompanyIdentifier.eponaBiotec.rawValue, 1977)
        XCTAssertEqual(CompanyIdentifier.eponaBiotec.name, #"Epona Biotec Limited"#)
        XCTAssertEqual(CompanyIdentifier.eponaBiotec.description, #"Epona Biotec Limited"#)
    
        // Battery-Biz Inc.
        XCTAssertEqual(CompanyIdentifier.batteryBiz.rawValue, 1978)
        XCTAssertEqual(CompanyIdentifier.batteryBiz.name, #"Battery-Biz Inc."#)
        XCTAssertEqual(CompanyIdentifier.batteryBiz.description, #"Battery-Biz Inc."#)
    
        // EPIC S.R.L.
        XCTAssertEqual(CompanyIdentifier.epic.rawValue, 1979)
        XCTAssertEqual(CompanyIdentifier.epic.name, #"EPIC S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.epic.description, #"EPIC S.R.L."#)
    
        // KD CIRCUITS LLC
        XCTAssertEqual(CompanyIdentifier.kdCircuits.rawValue, 1980)
        XCTAssertEqual(CompanyIdentifier.kdCircuits.name, #"KD CIRCUITS LLC"#)
        XCTAssertEqual(CompanyIdentifier.kdCircuits.description, #"KD CIRCUITS LLC"#)
    
        // Genedrive Diagnostics Ltd
        XCTAssertEqual(CompanyIdentifier.genedriveDiagnostics.rawValue, 1981)
        XCTAssertEqual(CompanyIdentifier.genedriveDiagnostics.name, #"Genedrive Diagnostics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.genedriveDiagnostics.description, #"Genedrive Diagnostics Ltd"#)
    
        // Axentia Technologies AB
        XCTAssertEqual(CompanyIdentifier.axentiaTechnologies.rawValue, 1982)
        XCTAssertEqual(CompanyIdentifier.axentiaTechnologies.name, #"Axentia Technologies AB"#)
        XCTAssertEqual(CompanyIdentifier.axentiaTechnologies.description, #"Axentia Technologies AB"#)
    
        // REGULA Ltd.
        XCTAssertEqual(CompanyIdentifier.regula.rawValue, 1983)
        XCTAssertEqual(CompanyIdentifier.regula.name, #"REGULA Ltd."#)
        XCTAssertEqual(CompanyIdentifier.regula.description, #"REGULA Ltd."#)
    
        // Biral AG
        XCTAssertEqual(CompanyIdentifier.biral.rawValue, 1984)
        XCTAssertEqual(CompanyIdentifier.biral.name, #"Biral AG"#)
        XCTAssertEqual(CompanyIdentifier.biral.description, #"Biral AG"#)
    
        // A.W. Chesterton Company
        XCTAssertEqual(CompanyIdentifier.aWChestertonCompany.rawValue, 1985)
        XCTAssertEqual(CompanyIdentifier.aWChestertonCompany.name, #"A.W. Chesterton Company"#)
        XCTAssertEqual(CompanyIdentifier.aWChestertonCompany.description, #"A.W. Chesterton Company"#)
    
        // Radinn AB
        XCTAssertEqual(CompanyIdentifier.radinn.rawValue, 1986)
        XCTAssertEqual(CompanyIdentifier.radinn.name, #"Radinn AB"#)
        XCTAssertEqual(CompanyIdentifier.radinn.description, #"Radinn AB"#)
    
        // CIMTechniques, Inc.
        XCTAssertEqual(CompanyIdentifier.cimtechniques.rawValue, 1987)
        XCTAssertEqual(CompanyIdentifier.cimtechniques.name, #"CIMTechniques, Inc."#)
        XCTAssertEqual(CompanyIdentifier.cimtechniques.description, #"CIMTechniques, Inc."#)
    
        // Johnson Health Tech NA
        XCTAssertEqual(CompanyIdentifier.johnsonHealthTechNa.rawValue, 1988)
        XCTAssertEqual(CompanyIdentifier.johnsonHealthTechNa.name, #"Johnson Health Tech NA"#)
        XCTAssertEqual(CompanyIdentifier.johnsonHealthTechNa.description, #"Johnson Health Tech NA"#)
    
        // June Life, Inc.
        XCTAssertEqual(CompanyIdentifier.juneLife.rawValue, 1989)
        XCTAssertEqual(CompanyIdentifier.juneLife.name, #"June Life, Inc."#)
        XCTAssertEqual(CompanyIdentifier.juneLife.description, #"June Life, Inc."#)
    
        // Bluenetics GmbH
        XCTAssertEqual(CompanyIdentifier.bluenetics.rawValue, 1990)
        XCTAssertEqual(CompanyIdentifier.bluenetics.name, #"Bluenetics GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bluenetics.description, #"Bluenetics GmbH"#)
    
        // iaconicDesign Inc.
        XCTAssertEqual(CompanyIdentifier.iaconicdesign.rawValue, 1991)
        XCTAssertEqual(CompanyIdentifier.iaconicdesign.name, #"iaconicDesign Inc."#)
        XCTAssertEqual(CompanyIdentifier.iaconicdesign.description, #"iaconicDesign Inc."#)
    
        // WRLDS Creations AB
        XCTAssertEqual(CompanyIdentifier.wrldsCreations.rawValue, 1992)
        XCTAssertEqual(CompanyIdentifier.wrldsCreations.name, #"WRLDS Creations AB"#)
        XCTAssertEqual(CompanyIdentifier.wrldsCreations.description, #"WRLDS Creations AB"#)
    
        // Skullcandy, Inc.
        XCTAssertEqual(CompanyIdentifier.skullcandy.rawValue, 1993)
        XCTAssertEqual(CompanyIdentifier.skullcandy.name, #"Skullcandy, Inc."#)
        XCTAssertEqual(CompanyIdentifier.skullcandy.description, #"Skullcandy, Inc."#)
    
        // Modul-System HH AB
        XCTAssertEqual(CompanyIdentifier.modulSystemHh.rawValue, 1994)
        XCTAssertEqual(CompanyIdentifier.modulSystemHh.name, #"Modul-System HH AB"#)
        XCTAssertEqual(CompanyIdentifier.modulSystemHh.description, #"Modul-System HH AB"#)
    
        // West Pharmaceutical Services, Inc.
        XCTAssertEqual(CompanyIdentifier.westPharmaceuticalServices.rawValue, 1995)
        XCTAssertEqual(CompanyIdentifier.westPharmaceuticalServices.name, #"West Pharmaceutical Services, Inc."#)
        XCTAssertEqual(CompanyIdentifier.westPharmaceuticalServices.description, #"West Pharmaceutical Services, Inc."#)
    
        // Barnacle Systems Inc.
        XCTAssertEqual(CompanyIdentifier.barnacleSystems.rawValue, 1996)
        XCTAssertEqual(CompanyIdentifier.barnacleSystems.name, #"Barnacle Systems Inc."#)
        XCTAssertEqual(CompanyIdentifier.barnacleSystems.description, #"Barnacle Systems Inc."#)
    
        // Smart Wave Technologies Canada Inc
        XCTAssertEqual(CompanyIdentifier.smartWaveTechnologiesCanada.rawValue, 1997)
        XCTAssertEqual(CompanyIdentifier.smartWaveTechnologiesCanada.name, #"Smart Wave Technologies Canada Inc"#)
        XCTAssertEqual(CompanyIdentifier.smartWaveTechnologiesCanada.description, #"Smart Wave Technologies Canada Inc"#)
    
        // Shanghai Top-Chip Microelectronics Tech. Co., LTD
        XCTAssertEqual(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.rawValue, 1998)
        XCTAssertEqual(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.name, #"Shanghai Top-Chip Microelectronics Tech. Co., LTD"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.description, #"Shanghai Top-Chip Microelectronics Tech. Co., LTD"#)
    
        // NeoSensory, Inc.
        XCTAssertEqual(CompanyIdentifier.neosensory.rawValue, 1999)
        XCTAssertEqual(CompanyIdentifier.neosensory.name, #"NeoSensory, Inc."#)
        XCTAssertEqual(CompanyIdentifier.neosensory.description, #"NeoSensory, Inc."#)
    
        // Hangzhou Tuya Information  Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.hangzhouTuyaInformationTechnology.rawValue, 2000)
        XCTAssertEqual(CompanyIdentifier.hangzhouTuyaInformationTechnology.name, #"Hangzhou Tuya Information  Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hangzhouTuyaInformationTechnology.description, #"Hangzhou Tuya Information  Technology Co., Ltd"#)
    
        // Shanghai Panchip Microelectronics Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shanghaiPanchipMicroelectronics.rawValue, 2001)
        XCTAssertEqual(CompanyIdentifier.shanghaiPanchipMicroelectronics.name, #"Shanghai Panchip Microelectronics Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiPanchipMicroelectronics.description, #"Shanghai Panchip Microelectronics Co., Ltd"#)
    
        // React Accessibility Limited
        XCTAssertEqual(CompanyIdentifier.reactAccessibility.rawValue, 2002)
        XCTAssertEqual(CompanyIdentifier.reactAccessibility.name, #"React Accessibility Limited"#)
        XCTAssertEqual(CompanyIdentifier.reactAccessibility.description, #"React Accessibility Limited"#)
    
        // LIVNEX Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.livnex.rawValue, 2003)
        XCTAssertEqual(CompanyIdentifier.livnex.name, #"LIVNEX Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.livnex.description, #"LIVNEX Co.,Ltd."#)
    
        // Kano Computing Limited
        XCTAssertEqual(CompanyIdentifier.kanoComputing.rawValue, 2004)
        XCTAssertEqual(CompanyIdentifier.kanoComputing.name, #"Kano Computing Limited"#)
        XCTAssertEqual(CompanyIdentifier.kanoComputing.description, #"Kano Computing Limited"#)
    
        // hoots classic GmbH
        XCTAssertEqual(CompanyIdentifier.hootsClassic.rawValue, 2005)
        XCTAssertEqual(CompanyIdentifier.hootsClassic.name, #"hoots classic GmbH"#)
        XCTAssertEqual(CompanyIdentifier.hootsClassic.description, #"hoots classic GmbH"#)
    
        // ecobee Inc.
        XCTAssertEqual(CompanyIdentifier.ecobee.rawValue, 2006)
        XCTAssertEqual(CompanyIdentifier.ecobee.name, #"ecobee Inc."#)
        XCTAssertEqual(CompanyIdentifier.ecobee.description, #"ecobee Inc."#)
    
        // Nanjing Qinheng Microelectronics Co., Ltd
        XCTAssertEqual(CompanyIdentifier.nanjingQinhengMicroelectronics.rawValue, 2007)
        XCTAssertEqual(CompanyIdentifier.nanjingQinhengMicroelectronics.name, #"Nanjing Qinheng Microelectronics Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.nanjingQinhengMicroelectronics.description, #"Nanjing Qinheng Microelectronics Co., Ltd"#)
    
        // SOLUTIONS AMBRA INC.
        XCTAssertEqual(CompanyIdentifier.solutionsAmbra.rawValue, 2008)
        XCTAssertEqual(CompanyIdentifier.solutionsAmbra.name, #"SOLUTIONS AMBRA INC."#)
        XCTAssertEqual(CompanyIdentifier.solutionsAmbra.description, #"SOLUTIONS AMBRA INC."#)
    
        // Micro-Design, Inc.
        XCTAssertEqual(CompanyIdentifier.microDesign.rawValue, 2009)
        XCTAssertEqual(CompanyIdentifier.microDesign.name, #"Micro-Design, Inc."#)
        XCTAssertEqual(CompanyIdentifier.microDesign.description, #"Micro-Design, Inc."#)
    
        // STARLITE Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.starlite.rawValue, 2010)
        XCTAssertEqual(CompanyIdentifier.starlite.name, #"STARLITE Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.starlite.description, #"STARLITE Co., Ltd."#)
    
        // Remedee Labs
        XCTAssertEqual(CompanyIdentifier.remedeeLabs.rawValue, 2011)
        XCTAssertEqual(CompanyIdentifier.remedeeLabs.name, #"Remedee Labs"#)
        XCTAssertEqual(CompanyIdentifier.remedeeLabs.description, #"Remedee Labs"#)
    
        // ThingOS GmbH
        XCTAssertEqual(CompanyIdentifier.thingos.rawValue, 2012)
        XCTAssertEqual(CompanyIdentifier.thingos.name, #"ThingOS GmbH"#)
        XCTAssertEqual(CompanyIdentifier.thingos.description, #"ThingOS GmbH"#)
    
        // Linear Circuits
        XCTAssertEqual(CompanyIdentifier.linearCircuits.rawValue, 2013)
        XCTAssertEqual(CompanyIdentifier.linearCircuits.name, #"Linear Circuits"#)
        XCTAssertEqual(CompanyIdentifier.linearCircuits.description, #"Linear Circuits"#)
    
        // Unlimited Engineering SL
        XCTAssertEqual(CompanyIdentifier.unlimitedEngineeringSl.rawValue, 2014)
        XCTAssertEqual(CompanyIdentifier.unlimitedEngineeringSl.name, #"Unlimited Engineering SL"#)
        XCTAssertEqual(CompanyIdentifier.unlimitedEngineeringSl.description, #"Unlimited Engineering SL"#)
    
        // Snap-on Incorporated
        XCTAssertEqual(CompanyIdentifier.snapOn.rawValue, 2015)
        XCTAssertEqual(CompanyIdentifier.snapOn.name, #"Snap-on Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.snapOn.description, #"Snap-on Incorporated"#)
    
        // Edifier International Limited
        XCTAssertEqual(CompanyIdentifier.edifierInternational.rawValue, 2016)
        XCTAssertEqual(CompanyIdentifier.edifierInternational.name, #"Edifier International Limited"#)
        XCTAssertEqual(CompanyIdentifier.edifierInternational.description, #"Edifier International Limited"#)
    
        // Lucie Labs
        XCTAssertEqual(CompanyIdentifier.lucieLabs.rawValue, 2017)
        XCTAssertEqual(CompanyIdentifier.lucieLabs.name, #"Lucie Labs"#)
        XCTAssertEqual(CompanyIdentifier.lucieLabs.description, #"Lucie Labs"#)
    
        // Alfred Kaercher SE & Co. KG
        XCTAssertEqual(CompanyIdentifier.alfredKaercherSeKg.rawValue, 2018)
        XCTAssertEqual(CompanyIdentifier.alfredKaercherSeKg.name, #"Alfred Kaercher SE & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.alfredKaercherSeKg.description, #"Alfred Kaercher SE & Co. KG"#)
    
        // Audiowise Technology Inc.
        XCTAssertEqual(CompanyIdentifier.audiowiseTechnology.rawValue, 2019)
        XCTAssertEqual(CompanyIdentifier.audiowiseTechnology.name, #"Audiowise Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.audiowiseTechnology.description, #"Audiowise Technology Inc."#)
    
        // Geeksme S.L.
        XCTAssertEqual(CompanyIdentifier.geeksme.rawValue, 2020)
        XCTAssertEqual(CompanyIdentifier.geeksme.name, #"Geeksme S.L."#)
        XCTAssertEqual(CompanyIdentifier.geeksme.description, #"Geeksme S.L."#)
    
        // Minut, Inc.
        XCTAssertEqual(CompanyIdentifier.minut.rawValue, 2021)
        XCTAssertEqual(CompanyIdentifier.minut.name, #"Minut, Inc."#)
        XCTAssertEqual(CompanyIdentifier.minut.description, #"Minut, Inc."#)
    
        // Waybeyond Limited
        XCTAssertEqual(CompanyIdentifier.waybeyond.rawValue, 2022)
        XCTAssertEqual(CompanyIdentifier.waybeyond.name, #"Waybeyond Limited"#)
        XCTAssertEqual(CompanyIdentifier.waybeyond.description, #"Waybeyond Limited"#)
    
        // Komfort IQ, Inc.
        XCTAssertEqual(CompanyIdentifier.komfortIq.rawValue, 2023)
        XCTAssertEqual(CompanyIdentifier.komfortIq.name, #"Komfort IQ, Inc."#)
        XCTAssertEqual(CompanyIdentifier.komfortIq.description, #"Komfort IQ, Inc."#)
    
        // Packetcraft, Inc.
        XCTAssertEqual(CompanyIdentifier.packetcraft.rawValue, 2024)
        XCTAssertEqual(CompanyIdentifier.packetcraft.name, #"Packetcraft, Inc."#)
        XCTAssertEqual(CompanyIdentifier.packetcraft.description, #"Packetcraft, Inc."#)
    
        // Häfele GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.hafele.rawValue, 2025)
        XCTAssertEqual(CompanyIdentifier.hafele.name, #"Häfele GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.hafele.description, #"Häfele GmbH & Co KG"#)
    
        // ShapeLog, Inc.
        XCTAssertEqual(CompanyIdentifier.shapelog.rawValue, 2026)
        XCTAssertEqual(CompanyIdentifier.shapelog.name, #"ShapeLog, Inc."#)
        XCTAssertEqual(CompanyIdentifier.shapelog.description, #"ShapeLog, Inc."#)
    
        // NOVABASE S.R.L.
        XCTAssertEqual(CompanyIdentifier.novabase.rawValue, 2027)
        XCTAssertEqual(CompanyIdentifier.novabase.name, #"NOVABASE S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.novabase.description, #"NOVABASE S.R.L."#)
    
        // Frecce LLC
        XCTAssertEqual(CompanyIdentifier.frecce.rawValue, 2028)
        XCTAssertEqual(CompanyIdentifier.frecce.name, #"Frecce LLC"#)
        XCTAssertEqual(CompanyIdentifier.frecce.description, #"Frecce LLC"#)
    
        // Joule IQ, INC.
        XCTAssertEqual(CompanyIdentifier.jouleIq.rawValue, 2029)
        XCTAssertEqual(CompanyIdentifier.jouleIq.name, #"Joule IQ, INC."#)
        XCTAssertEqual(CompanyIdentifier.jouleIq.description, #"Joule IQ, INC."#)
    
        // KidzTek LLC
        XCTAssertEqual(CompanyIdentifier.kidztek.rawValue, 2030)
        XCTAssertEqual(CompanyIdentifier.kidztek.name, #"KidzTek LLC"#)
        XCTAssertEqual(CompanyIdentifier.kidztek.description, #"KidzTek LLC"#)
    
        // Aktiebolaget Sandvik Coromant
        XCTAssertEqual(CompanyIdentifier.aktiebolagetSandvikCoromant.rawValue, 2031)
        XCTAssertEqual(CompanyIdentifier.aktiebolagetSandvikCoromant.name, #"Aktiebolaget Sandvik Coromant"#)
        XCTAssertEqual(CompanyIdentifier.aktiebolagetSandvikCoromant.description, #"Aktiebolaget Sandvik Coromant"#)
    
        // e-moola.com Pty Ltd
        XCTAssertEqual(CompanyIdentifier.eMoolaComPty.rawValue, 2032)
        XCTAssertEqual(CompanyIdentifier.eMoolaComPty.name, #"e-moola.com Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.eMoolaComPty.description, #"e-moola.com Pty Ltd"#)
    
        // Zimi Innovations Pty Ltd
        XCTAssertEqual(CompanyIdentifier.zimiInnovationsPty.rawValue, 2033)
        XCTAssertEqual(CompanyIdentifier.zimiInnovationsPty.name, #"Zimi Innovations Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.zimiInnovationsPty.description, #"Zimi Innovations Pty Ltd"#)
    
        // SERENE GROUP, INC
        XCTAssertEqual(CompanyIdentifier.sereneGroup.rawValue, 2034)
        XCTAssertEqual(CompanyIdentifier.sereneGroup.name, #"SERENE GROUP, INC"#)
        XCTAssertEqual(CompanyIdentifier.sereneGroup.description, #"SERENE GROUP, INC"#)
    
        // DIGISINE ENERGYTECH CO. LTD.
        XCTAssertEqual(CompanyIdentifier.digisineEnergytech.rawValue, 2035)
        XCTAssertEqual(CompanyIdentifier.digisineEnergytech.name, #"DIGISINE ENERGYTECH CO. LTD."#)
        XCTAssertEqual(CompanyIdentifier.digisineEnergytech.description, #"DIGISINE ENERGYTECH CO. LTD."#)
    
        // MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag
        XCTAssertEqual(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.rawValue, 2036)
        XCTAssertEqual(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.name, #"MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag"#)
        XCTAssertEqual(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.description, #"MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag"#)
    
        // Byton North America Corporation
        XCTAssertEqual(CompanyIdentifier.bytonNorthAmerica.rawValue, 2037)
        XCTAssertEqual(CompanyIdentifier.bytonNorthAmerica.name, #"Byton North America Corporation"#)
        XCTAssertEqual(CompanyIdentifier.bytonNorthAmerica.description, #"Byton North America Corporation"#)
    
        // Shenzhen TonliScience and Technology Development Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.rawValue, 2038)
        XCTAssertEqual(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.name, #"Shenzhen TonliScience and Technology Development Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.description, #"Shenzhen TonliScience and Technology Development Co.,Ltd"#)
    
        // Cesar Systems Ltd.
        XCTAssertEqual(CompanyIdentifier.cesarSystems.rawValue, 2039)
        XCTAssertEqual(CompanyIdentifier.cesarSystems.name, #"Cesar Systems Ltd."#)
        XCTAssertEqual(CompanyIdentifier.cesarSystems.description, #"Cesar Systems Ltd."#)
    
        // quip NYC Inc.
        XCTAssertEqual(CompanyIdentifier.quipNyc.rawValue, 2040)
        XCTAssertEqual(CompanyIdentifier.quipNyc.name, #"quip NYC Inc."#)
        XCTAssertEqual(CompanyIdentifier.quipNyc.description, #"quip NYC Inc."#)
    
        // Direct Communication Solutions, Inc.
        XCTAssertEqual(CompanyIdentifier.directCommunicationSolutions.rawValue, 2041)
        XCTAssertEqual(CompanyIdentifier.directCommunicationSolutions.name, #"Direct Communication Solutions, Inc."#)
        XCTAssertEqual(CompanyIdentifier.directCommunicationSolutions.description, #"Direct Communication Solutions, Inc."#)
    
        // Klipsch Group, Inc.
        XCTAssertEqual(CompanyIdentifier.klipschGroup.rawValue, 2042)
        XCTAssertEqual(CompanyIdentifier.klipschGroup.name, #"Klipsch Group, Inc."#)
        XCTAssertEqual(CompanyIdentifier.klipschGroup.description, #"Klipsch Group, Inc."#)
    
        // Access Co., Ltd
        XCTAssertEqual(CompanyIdentifier.access.rawValue, 2043)
        XCTAssertEqual(CompanyIdentifier.access.name, #"Access Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.access.description, #"Access Co., Ltd"#)
    
        // Renault SA
        XCTAssertEqual(CompanyIdentifier.renault.rawValue, 2044)
        XCTAssertEqual(CompanyIdentifier.renault.name, #"Renault SA"#)
        XCTAssertEqual(CompanyIdentifier.renault.description, #"Renault SA"#)
    
        // JSK CO., LTD.
        XCTAssertEqual(CompanyIdentifier.jsk.rawValue, 2045)
        XCTAssertEqual(CompanyIdentifier.jsk.name, #"JSK CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.jsk.description, #"JSK CO., LTD."#)
    
        // BIROTA
        XCTAssertEqual(CompanyIdentifier.birota.rawValue, 2046)
        XCTAssertEqual(CompanyIdentifier.birota.name, #"BIROTA"#)
        XCTAssertEqual(CompanyIdentifier.birota.description, #"BIROTA"#)
    
        // maxon motor ltd.
        XCTAssertEqual(CompanyIdentifier.maxonMotor.rawValue, 2047)
        XCTAssertEqual(CompanyIdentifier.maxonMotor.name, #"maxon motor ltd."#)
        XCTAssertEqual(CompanyIdentifier.maxonMotor.description, #"maxon motor ltd."#)
    
        // Optek
        XCTAssertEqual(CompanyIdentifier.optek.rawValue, 2048)
        XCTAssertEqual(CompanyIdentifier.optek.name, #"Optek"#)
        XCTAssertEqual(CompanyIdentifier.optek.description, #"Optek"#)
    
        // CRONUS ELECTRONICS LTD
        XCTAssertEqual(CompanyIdentifier.cronusElectronics.rawValue, 2049)
        XCTAssertEqual(CompanyIdentifier.cronusElectronics.name, #"CRONUS ELECTRONICS LTD"#)
        XCTAssertEqual(CompanyIdentifier.cronusElectronics.description, #"CRONUS ELECTRONICS LTD"#)
    
        // NantSound, Inc.
        XCTAssertEqual(CompanyIdentifier.nantsound.rawValue, 2050)
        XCTAssertEqual(CompanyIdentifier.nantsound.name, #"NantSound, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nantsound.description, #"NantSound, Inc."#)
    
        // Domintell s.a.
        XCTAssertEqual(CompanyIdentifier.domintell.rawValue, 2051)
        XCTAssertEqual(CompanyIdentifier.domintell.name, #"Domintell s.a."#)
        XCTAssertEqual(CompanyIdentifier.domintell.description, #"Domintell s.a."#)
    
        // Andon Health Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.andonHealth.rawValue, 2052)
        XCTAssertEqual(CompanyIdentifier.andonHealth.name, #"Andon Health Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.andonHealth.description, #"Andon Health Co.,Ltd"#)
    
        // Urbanminded Ltd
        XCTAssertEqual(CompanyIdentifier.urbanminded.rawValue, 2053)
        XCTAssertEqual(CompanyIdentifier.urbanminded.name, #"Urbanminded Ltd"#)
        XCTAssertEqual(CompanyIdentifier.urbanminded.description, #"Urbanminded Ltd"#)
    
        // TYRI Sweden AB
        XCTAssertEqual(CompanyIdentifier.tyriSweden.rawValue, 2054)
        XCTAssertEqual(CompanyIdentifier.tyriSweden.name, #"TYRI Sweden AB"#)
        XCTAssertEqual(CompanyIdentifier.tyriSweden.description, #"TYRI Sweden AB"#)
    
        // ECD Electronic Components GmbH Dresden
        XCTAssertEqual(CompanyIdentifier.ecdElectronicComponentsDresden.rawValue, 2055)
        XCTAssertEqual(CompanyIdentifier.ecdElectronicComponentsDresden.name, #"ECD Electronic Components GmbH Dresden"#)
        XCTAssertEqual(CompanyIdentifier.ecdElectronicComponentsDresden.description, #"ECD Electronic Components GmbH Dresden"#)
    
        // SISTEMAS KERN, SOCIEDAD ANÓMINA
        XCTAssertEqual(CompanyIdentifier.sistemasKernSociedadAnomina.rawValue, 2056)
        XCTAssertEqual(CompanyIdentifier.sistemasKernSociedadAnomina.name, #"SISTEMAS KERN, SOCIEDAD ANÓMINA"#)
        XCTAssertEqual(CompanyIdentifier.sistemasKernSociedadAnomina.description, #"SISTEMAS KERN, SOCIEDAD ANÓMINA"#)
    
        // Trulli Audio
        XCTAssertEqual(CompanyIdentifier.trulliAudio.rawValue, 2057)
        XCTAssertEqual(CompanyIdentifier.trulliAudio.name, #"Trulli Audio"#)
        XCTAssertEqual(CompanyIdentifier.trulliAudio.description, #"Trulli Audio"#)
    
        // Altaneos
        XCTAssertEqual(CompanyIdentifier.altaneos.rawValue, 2058)
        XCTAssertEqual(CompanyIdentifier.altaneos.name, #"Altaneos"#)
        XCTAssertEqual(CompanyIdentifier.altaneos.description, #"Altaneos"#)
    
        // Nanoleaf Canada Limited
        XCTAssertEqual(CompanyIdentifier.nanoleafCanada.rawValue, 2059)
        XCTAssertEqual(CompanyIdentifier.nanoleafCanada.name, #"Nanoleaf Canada Limited"#)
        XCTAssertEqual(CompanyIdentifier.nanoleafCanada.description, #"Nanoleaf Canada Limited"#)
    
        // Ingy B.V.
        XCTAssertEqual(CompanyIdentifier.ingy.rawValue, 2060)
        XCTAssertEqual(CompanyIdentifier.ingy.name, #"Ingy B.V."#)
        XCTAssertEqual(CompanyIdentifier.ingy.description, #"Ingy B.V."#)
    
        // Azbil Co.
        XCTAssertEqual(CompanyIdentifier.azbil.rawValue, 2061)
        XCTAssertEqual(CompanyIdentifier.azbil.name, #"Azbil Co."#)
        XCTAssertEqual(CompanyIdentifier.azbil.description, #"Azbil Co."#)
    
        // TATTCOM LLC
        XCTAssertEqual(CompanyIdentifier.tattcom.rawValue, 2062)
        XCTAssertEqual(CompanyIdentifier.tattcom.name, #"TATTCOM LLC"#)
        XCTAssertEqual(CompanyIdentifier.tattcom.description, #"TATTCOM LLC"#)
    
        // Paradox Engineering SA
        XCTAssertEqual(CompanyIdentifier.paradoxEngineering.rawValue, 2063)
        XCTAssertEqual(CompanyIdentifier.paradoxEngineering.name, #"Paradox Engineering SA"#)
        XCTAssertEqual(CompanyIdentifier.paradoxEngineering.description, #"Paradox Engineering SA"#)
    
        // LECO Corporation
        XCTAssertEqual(CompanyIdentifier.leco.rawValue, 2064)
        XCTAssertEqual(CompanyIdentifier.leco.name, #"LECO Corporation"#)
        XCTAssertEqual(CompanyIdentifier.leco.description, #"LECO Corporation"#)
    
        // Becker Antriebe GmbH
        XCTAssertEqual(CompanyIdentifier.beckerAntriebe.rawValue, 2065)
        XCTAssertEqual(CompanyIdentifier.beckerAntriebe.name, #"Becker Antriebe GmbH"#)
        XCTAssertEqual(CompanyIdentifier.beckerAntriebe.description, #"Becker Antriebe GmbH"#)
    
        // Mstream Technologies., Inc.
        XCTAssertEqual(CompanyIdentifier.mstreamTechnologies.rawValue, 2066)
        XCTAssertEqual(CompanyIdentifier.mstreamTechnologies.name, #"Mstream Technologies., Inc."#)
        XCTAssertEqual(CompanyIdentifier.mstreamTechnologies.description, #"Mstream Technologies., Inc."#)
    
        // Flextronics International USA Inc.
        XCTAssertEqual(CompanyIdentifier.flextronicsInternational.rawValue, 2067)
        XCTAssertEqual(CompanyIdentifier.flextronicsInternational.name, #"Flextronics International USA Inc."#)
        XCTAssertEqual(CompanyIdentifier.flextronicsInternational.description, #"Flextronics International USA Inc."#)
    
        // Ossur hf.
        XCTAssertEqual(CompanyIdentifier.ossurHf.rawValue, 2068)
        XCTAssertEqual(CompanyIdentifier.ossurHf.name, #"Ossur hf."#)
        XCTAssertEqual(CompanyIdentifier.ossurHf.description, #"Ossur hf."#)
    
        // SKC Inc
        XCTAssertEqual(CompanyIdentifier.skc.rawValue, 2069)
        XCTAssertEqual(CompanyIdentifier.skc.name, #"SKC Inc"#)
        XCTAssertEqual(CompanyIdentifier.skc.description, #"SKC Inc"#)
    
        // SPICA SYSTEMS LLC
        XCTAssertEqual(CompanyIdentifier.spicaSystems.rawValue, 2070)
        XCTAssertEqual(CompanyIdentifier.spicaSystems.name, #"SPICA SYSTEMS LLC"#)
        XCTAssertEqual(CompanyIdentifier.spicaSystems.description, #"SPICA SYSTEMS LLC"#)
    
        // Wangs Alliance Corporation
        XCTAssertEqual(CompanyIdentifier.wangsAlliance.rawValue, 2071)
        XCTAssertEqual(CompanyIdentifier.wangsAlliance.name, #"Wangs Alliance Corporation"#)
        XCTAssertEqual(CompanyIdentifier.wangsAlliance.description, #"Wangs Alliance Corporation"#)
    
        // tatwah SA
        XCTAssertEqual(CompanyIdentifier.tatwah.rawValue, 2072)
        XCTAssertEqual(CompanyIdentifier.tatwah.name, #"tatwah SA"#)
        XCTAssertEqual(CompanyIdentifier.tatwah.description, #"tatwah SA"#)
    
        // Hunter Douglas Inc
        XCTAssertEqual(CompanyIdentifier.hunterDouglas.rawValue, 2073)
        XCTAssertEqual(CompanyIdentifier.hunterDouglas.name, #"Hunter Douglas Inc"#)
        XCTAssertEqual(CompanyIdentifier.hunterDouglas.description, #"Hunter Douglas Inc"#)
    
        // Shenzhen Conex
        XCTAssertEqual(CompanyIdentifier.shenzhenConex.rawValue, 2074)
        XCTAssertEqual(CompanyIdentifier.shenzhenConex.name, #"Shenzhen Conex"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenConex.description, #"Shenzhen Conex"#)
    
        // DIM3
        XCTAssertEqual(CompanyIdentifier.dim3.rawValue, 2075)
        XCTAssertEqual(CompanyIdentifier.dim3.name, #"DIM3"#)
        XCTAssertEqual(CompanyIdentifier.dim3.description, #"DIM3"#)
    
        // Bobrick Washroom Equipment, Inc.
        XCTAssertEqual(CompanyIdentifier.bobrickWashroomEquipment.rawValue, 2076)
        XCTAssertEqual(CompanyIdentifier.bobrickWashroomEquipment.name, #"Bobrick Washroom Equipment, Inc."#)
        XCTAssertEqual(CompanyIdentifier.bobrickWashroomEquipment.description, #"Bobrick Washroom Equipment, Inc."#)
    
        // Potrykus Holdings and Development LLC
        XCTAssertEqual(CompanyIdentifier.potrykusHoldingsAndDevelopment.rawValue, 2077)
        XCTAssertEqual(CompanyIdentifier.potrykusHoldingsAndDevelopment.name, #"Potrykus Holdings and Development LLC"#)
        XCTAssertEqual(CompanyIdentifier.potrykusHoldingsAndDevelopment.description, #"Potrykus Holdings and Development LLC"#)
    
        // iNFORM Technology GmbH
        XCTAssertEqual(CompanyIdentifier.informTechnology.rawValue, 2078)
        XCTAssertEqual(CompanyIdentifier.informTechnology.name, #"iNFORM Technology GmbH"#)
        XCTAssertEqual(CompanyIdentifier.informTechnology.description, #"iNFORM Technology GmbH"#)
    
        // eSenseLab LTD
        XCTAssertEqual(CompanyIdentifier.esenselab.rawValue, 2079)
        XCTAssertEqual(CompanyIdentifier.esenselab.name, #"eSenseLab LTD"#)
        XCTAssertEqual(CompanyIdentifier.esenselab.description, #"eSenseLab LTD"#)
    
        // Brilliant Home Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.brilliantHomeTechnology.rawValue, 2080)
        XCTAssertEqual(CompanyIdentifier.brilliantHomeTechnology.name, #"Brilliant Home Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.brilliantHomeTechnology.description, #"Brilliant Home Technology, Inc."#)
    
        // INOVA Geophysical, Inc.
        XCTAssertEqual(CompanyIdentifier.inovaGeophysical.rawValue, 2081)
        XCTAssertEqual(CompanyIdentifier.inovaGeophysical.name, #"INOVA Geophysical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.inovaGeophysical.description, #"INOVA Geophysical, Inc."#)
    
        // adafruit industries
        XCTAssertEqual(CompanyIdentifier.adafruitIndustries.rawValue, 2082)
        XCTAssertEqual(CompanyIdentifier.adafruitIndustries.name, #"adafruit industries"#)
        XCTAssertEqual(CompanyIdentifier.adafruitIndustries.description, #"adafruit industries"#)
    
        // Nexite Ltd
        XCTAssertEqual(CompanyIdentifier.nexite.rawValue, 2083)
        XCTAssertEqual(CompanyIdentifier.nexite.name, #"Nexite Ltd"#)
        XCTAssertEqual(CompanyIdentifier.nexite.description, #"Nexite Ltd"#)
    
        // 8Power Limited
        XCTAssertEqual(CompanyIdentifier.company8Power.rawValue, 2084)
        XCTAssertEqual(CompanyIdentifier.company8Power.name, #"8Power Limited"#)
        XCTAssertEqual(CompanyIdentifier.company8Power.description, #"8Power Limited"#)
    
        // CME PTE. LTD.
        XCTAssertEqual(CompanyIdentifier.cmePte.rawValue, 2085)
        XCTAssertEqual(CompanyIdentifier.cmePte.name, #"CME PTE. LTD."#)
        XCTAssertEqual(CompanyIdentifier.cmePte.description, #"CME PTE. LTD."#)
    
        // Hyundai Motor Company
        XCTAssertEqual(CompanyIdentifier.hyundaiMotorCompany.rawValue, 2086)
        XCTAssertEqual(CompanyIdentifier.hyundaiMotorCompany.name, #"Hyundai Motor Company"#)
        XCTAssertEqual(CompanyIdentifier.hyundaiMotorCompany.description, #"Hyundai Motor Company"#)
    
        // Kickmaker
        XCTAssertEqual(CompanyIdentifier.kickmaker.rawValue, 2087)
        XCTAssertEqual(CompanyIdentifier.kickmaker.name, #"Kickmaker"#)
        XCTAssertEqual(CompanyIdentifier.kickmaker.description, #"Kickmaker"#)
    
        // Shanghai Suisheng Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiSuishengInformationTechnology.rawValue, 2088)
        XCTAssertEqual(CompanyIdentifier.shanghaiSuishengInformationTechnology.name, #"Shanghai Suisheng Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiSuishengInformationTechnology.description, #"Shanghai Suisheng Information Technology Co., Ltd."#)
    
        // HEXAGON
        XCTAssertEqual(CompanyIdentifier.hexagon.rawValue, 2089)
        XCTAssertEqual(CompanyIdentifier.hexagon.name, #"HEXAGON"#)
        XCTAssertEqual(CompanyIdentifier.hexagon.description, #"HEXAGON"#)
    
        // Mitutoyo Corporation
        XCTAssertEqual(CompanyIdentifier.mitutoyo.rawValue, 2090)
        XCTAssertEqual(CompanyIdentifier.mitutoyo.name, #"Mitutoyo Corporation"#)
        XCTAssertEqual(CompanyIdentifier.mitutoyo.description, #"Mitutoyo Corporation"#)
    
        // shenzhen fitcare electronics Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenFitcareElectronics.rawValue, 2091)
        XCTAssertEqual(CompanyIdentifier.shenzhenFitcareElectronics.name, #"shenzhen fitcare electronics Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenFitcareElectronics.description, #"shenzhen fitcare electronics Co.,Ltd"#)
    
        // INGICS TECHNOLOGY CO., LTD.
        XCTAssertEqual(CompanyIdentifier.ingicsTechnology.rawValue, 2092)
        XCTAssertEqual(CompanyIdentifier.ingicsTechnology.name, #"INGICS TECHNOLOGY CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.ingicsTechnology.description, #"INGICS TECHNOLOGY CO., LTD."#)
    
        // INCUS PERFORMANCE LTD.
        XCTAssertEqual(CompanyIdentifier.incusPerformance.rawValue, 2093)
        XCTAssertEqual(CompanyIdentifier.incusPerformance.name, #"INCUS PERFORMANCE LTD."#)
        XCTAssertEqual(CompanyIdentifier.incusPerformance.description, #"INCUS PERFORMANCE LTD."#)
    
        // ABB S.p.A.
        XCTAssertEqual(CompanyIdentifier.abb2.rawValue, 2094)
        XCTAssertEqual(CompanyIdentifier.abb2.name, #"ABB S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.abb2.description, #"ABB S.p.A."#)
    
        // Blippit AB
        XCTAssertEqual(CompanyIdentifier.blippit.rawValue, 2095)
        XCTAssertEqual(CompanyIdentifier.blippit.name, #"Blippit AB"#)
        XCTAssertEqual(CompanyIdentifier.blippit.description, #"Blippit AB"#)
    
        // Core Health and Fitness LLC
        XCTAssertEqual(CompanyIdentifier.coreHealthAndFitness.rawValue, 2096)
        XCTAssertEqual(CompanyIdentifier.coreHealthAndFitness.name, #"Core Health and Fitness LLC"#)
        XCTAssertEqual(CompanyIdentifier.coreHealthAndFitness.description, #"Core Health and Fitness LLC"#)
    
        // Foxble, LLC
        XCTAssertEqual(CompanyIdentifier.foxble.rawValue, 2097)
        XCTAssertEqual(CompanyIdentifier.foxble.name, #"Foxble, LLC"#)
        XCTAssertEqual(CompanyIdentifier.foxble.description, #"Foxble, LLC"#)
    
        // Intermotive,Inc.
        XCTAssertEqual(CompanyIdentifier.intermotive.rawValue, 2098)
        XCTAssertEqual(CompanyIdentifier.intermotive.name, #"Intermotive,Inc."#)
        XCTAssertEqual(CompanyIdentifier.intermotive.description, #"Intermotive,Inc."#)
    
        // Conneqtech B.V.
        XCTAssertEqual(CompanyIdentifier.conneqtech.rawValue, 2099)
        XCTAssertEqual(CompanyIdentifier.conneqtech.name, #"Conneqtech B.V."#)
        XCTAssertEqual(CompanyIdentifier.conneqtech.description, #"Conneqtech B.V."#)
    
        // RIKEN KEIKI CO., LTD.,
        XCTAssertEqual(CompanyIdentifier.rikenKeiki.rawValue, 2100)
        XCTAssertEqual(CompanyIdentifier.rikenKeiki.name, #"RIKEN KEIKI CO., LTD.,"#)
        XCTAssertEqual(CompanyIdentifier.rikenKeiki.description, #"RIKEN KEIKI CO., LTD.,"#)
    
        // Canopy Growth Corporation
        XCTAssertEqual(CompanyIdentifier.canopyGrowth.rawValue, 2101)
        XCTAssertEqual(CompanyIdentifier.canopyGrowth.name, #"Canopy Growth Corporation"#)
        XCTAssertEqual(CompanyIdentifier.canopyGrowth.description, #"Canopy Growth Corporation"#)
    
        // Bitwards Oy
        XCTAssertEqual(CompanyIdentifier.bitwards.rawValue, 2102)
        XCTAssertEqual(CompanyIdentifier.bitwards.name, #"Bitwards Oy"#)
        XCTAssertEqual(CompanyIdentifier.bitwards.description, #"Bitwards Oy"#)
    
        // vivo Mobile Communication Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.vivoMobileCommunication.rawValue, 2103)
        XCTAssertEqual(CompanyIdentifier.vivoMobileCommunication.name, #"vivo Mobile Communication Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.vivoMobileCommunication.description, #"vivo Mobile Communication Co., Ltd."#)
    
        // Etymotic Research, Inc.
        XCTAssertEqual(CompanyIdentifier.etymoticResearch.rawValue, 2104)
        XCTAssertEqual(CompanyIdentifier.etymoticResearch.name, #"Etymotic Research, Inc."#)
        XCTAssertEqual(CompanyIdentifier.etymoticResearch.description, #"Etymotic Research, Inc."#)
    
        // A puissance 3
        XCTAssertEqual(CompanyIdentifier.aPuissance3.rawValue, 2105)
        XCTAssertEqual(CompanyIdentifier.aPuissance3.name, #"A puissance 3"#)
        XCTAssertEqual(CompanyIdentifier.aPuissance3.description, #"A puissance 3"#)
    
        // BPW Bergische Achsen Kommanditgesellschaft
        XCTAssertEqual(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.rawValue, 2106)
        XCTAssertEqual(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.name, #"BPW Bergische Achsen Kommanditgesellschaft"#)
        XCTAssertEqual(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.description, #"BPW Bergische Achsen Kommanditgesellschaft"#)
    
        // Piaggio Fast Forward
        XCTAssertEqual(CompanyIdentifier.piaggioFastForward.rawValue, 2107)
        XCTAssertEqual(CompanyIdentifier.piaggioFastForward.name, #"Piaggio Fast Forward"#)
        XCTAssertEqual(CompanyIdentifier.piaggioFastForward.description, #"Piaggio Fast Forward"#)
    
        // BeerTech LTD
        XCTAssertEqual(CompanyIdentifier.beertech.rawValue, 2108)
        XCTAssertEqual(CompanyIdentifier.beertech.name, #"BeerTech LTD"#)
        XCTAssertEqual(CompanyIdentifier.beertech.description, #"BeerTech LTD"#)
    
        // Tokenize, Inc.
        XCTAssertEqual(CompanyIdentifier.tokenize.rawValue, 2109)
        XCTAssertEqual(CompanyIdentifier.tokenize.name, #"Tokenize, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tokenize.description, #"Tokenize, Inc."#)
    
        // Zorachka LTD
        XCTAssertEqual(CompanyIdentifier.zorachka.rawValue, 2110)
        XCTAssertEqual(CompanyIdentifier.zorachka.name, #"Zorachka LTD"#)
        XCTAssertEqual(CompanyIdentifier.zorachka.description, #"Zorachka LTD"#)
    
        // D-Link Corp.
        XCTAssertEqual(CompanyIdentifier.dLink.rawValue, 2111)
        XCTAssertEqual(CompanyIdentifier.dLink.name, #"D-Link Corp."#)
        XCTAssertEqual(CompanyIdentifier.dLink.description, #"D-Link Corp."#)
    
        // Down Range Systems LLC
        XCTAssertEqual(CompanyIdentifier.downRangeSystems.rawValue, 2112)
        XCTAssertEqual(CompanyIdentifier.downRangeSystems.name, #"Down Range Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.downRangeSystems.description, #"Down Range Systems LLC"#)
    
        // General Luminaire (Shanghai) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.generalLuminaireShanghai.rawValue, 2113)
        XCTAssertEqual(CompanyIdentifier.generalLuminaireShanghai.name, #"General Luminaire (Shanghai) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.generalLuminaireShanghai.description, #"General Luminaire (Shanghai) Co., Ltd."#)
    
        // Tangshan HongJia electronic technology co., LTD.
        XCTAssertEqual(CompanyIdentifier.tangshanHongjiaElectronicTechnology.rawValue, 2114)
        XCTAssertEqual(CompanyIdentifier.tangshanHongjiaElectronicTechnology.name, #"Tangshan HongJia electronic technology co., LTD."#)
        XCTAssertEqual(CompanyIdentifier.tangshanHongjiaElectronicTechnology.description, #"Tangshan HongJia electronic technology co., LTD."#)
    
        // FRAGRANCE DELIVERY TECHNOLOGIES LTD
        XCTAssertEqual(CompanyIdentifier.fragranceDeliveryTechnologies.rawValue, 2115)
        XCTAssertEqual(CompanyIdentifier.fragranceDeliveryTechnologies.name, #"FRAGRANCE DELIVERY TECHNOLOGIES LTD"#)
        XCTAssertEqual(CompanyIdentifier.fragranceDeliveryTechnologies.description, #"FRAGRANCE DELIVERY TECHNOLOGIES LTD"#)
    
        // Pepperl + Fuchs GmbH
        XCTAssertEqual(CompanyIdentifier.pepperlFuchs.rawValue, 2116)
        XCTAssertEqual(CompanyIdentifier.pepperlFuchs.name, #"Pepperl + Fuchs GmbH"#)
        XCTAssertEqual(CompanyIdentifier.pepperlFuchs.description, #"Pepperl + Fuchs GmbH"#)
    
        // Dometic Corporation
        XCTAssertEqual(CompanyIdentifier.dometic.rawValue, 2117)
        XCTAssertEqual(CompanyIdentifier.dometic.name, #"Dometic Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dometic.description, #"Dometic Corporation"#)
    
        // USound GmbH
        XCTAssertEqual(CompanyIdentifier.usound.rawValue, 2118)
        XCTAssertEqual(CompanyIdentifier.usound.name, #"USound GmbH"#)
        XCTAssertEqual(CompanyIdentifier.usound.description, #"USound GmbH"#)
    
        // DNANUDGE LIMITED
        XCTAssertEqual(CompanyIdentifier.dnanudge.rawValue, 2119)
        XCTAssertEqual(CompanyIdentifier.dnanudge.name, #"DNANUDGE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.dnanudge.description, #"DNANUDGE LIMITED"#)
    
        // JUJU JOINTS CANADA CORP.
        XCTAssertEqual(CompanyIdentifier.jujuJointsCanada.rawValue, 2120)
        XCTAssertEqual(CompanyIdentifier.jujuJointsCanada.name, #"JUJU JOINTS CANADA CORP."#)
        XCTAssertEqual(CompanyIdentifier.jujuJointsCanada.description, #"JUJU JOINTS CANADA CORP."#)
    
        // Dopple Technologies B.V.
        XCTAssertEqual(CompanyIdentifier.doppleTechnologies.rawValue, 2121)
        XCTAssertEqual(CompanyIdentifier.doppleTechnologies.name, #"Dopple Technologies B.V."#)
        XCTAssertEqual(CompanyIdentifier.doppleTechnologies.description, #"Dopple Technologies B.V."#)
    
        // ARCOM
        XCTAssertEqual(CompanyIdentifier.arcom.rawValue, 2122)
        XCTAssertEqual(CompanyIdentifier.arcom.name, #"ARCOM"#)
        XCTAssertEqual(CompanyIdentifier.arcom.description, #"ARCOM"#)
    
        // Biotechware SRL
        XCTAssertEqual(CompanyIdentifier.biotechware.rawValue, 2123)
        XCTAssertEqual(CompanyIdentifier.biotechware.name, #"Biotechware SRL"#)
        XCTAssertEqual(CompanyIdentifier.biotechware.description, #"Biotechware SRL"#)
    
        // ORSO Inc.
        XCTAssertEqual(CompanyIdentifier.orso.rawValue, 2124)
        XCTAssertEqual(CompanyIdentifier.orso.name, #"ORSO Inc."#)
        XCTAssertEqual(CompanyIdentifier.orso.description, #"ORSO Inc."#)
    
        // SafePort
        XCTAssertEqual(CompanyIdentifier.safeport.rawValue, 2125)
        XCTAssertEqual(CompanyIdentifier.safeport.name, #"SafePort"#)
        XCTAssertEqual(CompanyIdentifier.safeport.description, #"SafePort"#)
    
        // Carol Cole Company
        XCTAssertEqual(CompanyIdentifier.carolColeCompany.rawValue, 2126)
        XCTAssertEqual(CompanyIdentifier.carolColeCompany.name, #"Carol Cole Company"#)
        XCTAssertEqual(CompanyIdentifier.carolColeCompany.description, #"Carol Cole Company"#)
    
        // Embedded Fitness B.V.
        XCTAssertEqual(CompanyIdentifier.embeddedFitness.rawValue, 2127)
        XCTAssertEqual(CompanyIdentifier.embeddedFitness.name, #"Embedded Fitness B.V."#)
        XCTAssertEqual(CompanyIdentifier.embeddedFitness.description, #"Embedded Fitness B.V."#)
    
        // Yealink (Xiamen) Network Technology Co.,LTD
        XCTAssertEqual(CompanyIdentifier.yealinkXiamenNetworkTechnology.rawValue, 2128)
        XCTAssertEqual(CompanyIdentifier.yealinkXiamenNetworkTechnology.name, #"Yealink (Xiamen) Network Technology Co.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.yealinkXiamenNetworkTechnology.description, #"Yealink (Xiamen) Network Technology Co.,LTD"#)
    
        // Subeca, Inc.
        XCTAssertEqual(CompanyIdentifier.subeca.rawValue, 2129)
        XCTAssertEqual(CompanyIdentifier.subeca.name, #"Subeca, Inc."#)
        XCTAssertEqual(CompanyIdentifier.subeca.description, #"Subeca, Inc."#)
    
        // Cognosos, Inc.
        XCTAssertEqual(CompanyIdentifier.cognosos.rawValue, 2130)
        XCTAssertEqual(CompanyIdentifier.cognosos.name, #"Cognosos, Inc."#)
        XCTAssertEqual(CompanyIdentifier.cognosos.description, #"Cognosos, Inc."#)
    
        // Pektron Group Limited
        XCTAssertEqual(CompanyIdentifier.pektronGroup.rawValue, 2131)
        XCTAssertEqual(CompanyIdentifier.pektronGroup.name, #"Pektron Group Limited"#)
        XCTAssertEqual(CompanyIdentifier.pektronGroup.description, #"Pektron Group Limited"#)
    
        // Tap Sound System
        XCTAssertEqual(CompanyIdentifier.tapSoundSystem.rawValue, 2132)
        XCTAssertEqual(CompanyIdentifier.tapSoundSystem.name, #"Tap Sound System"#)
        XCTAssertEqual(CompanyIdentifier.tapSoundSystem.description, #"Tap Sound System"#)
    
        // Helios Hockey, Inc.
        XCTAssertEqual(CompanyIdentifier.heliosHockey.rawValue, 2133)
        XCTAssertEqual(CompanyIdentifier.heliosHockey.name, #"Helios Hockey, Inc."#)
        XCTAssertEqual(CompanyIdentifier.heliosHockey.description, #"Helios Hockey, Inc."#)
    
        // Canopy Growth Corporation
        XCTAssertEqual(CompanyIdentifier.canopyGrowth2.rawValue, 2134)
        XCTAssertEqual(CompanyIdentifier.canopyGrowth2.name, #"Canopy Growth Corporation"#)
        XCTAssertEqual(CompanyIdentifier.canopyGrowth2.description, #"Canopy Growth Corporation"#)
    
        // Parsyl Inc
        XCTAssertEqual(CompanyIdentifier.parsyl.rawValue, 2135)
        XCTAssertEqual(CompanyIdentifier.parsyl.name, #"Parsyl Inc"#)
        XCTAssertEqual(CompanyIdentifier.parsyl.description, #"Parsyl Inc"#)
    
        // SOUNDBOKS
        XCTAssertEqual(CompanyIdentifier.soundboks.rawValue, 2136)
        XCTAssertEqual(CompanyIdentifier.soundboks.name, #"SOUNDBOKS"#)
        XCTAssertEqual(CompanyIdentifier.soundboks.description, #"SOUNDBOKS"#)
    
        // BlueUp
        XCTAssertEqual(CompanyIdentifier.blueup.rawValue, 2137)
        XCTAssertEqual(CompanyIdentifier.blueup.name, #"BlueUp"#)
        XCTAssertEqual(CompanyIdentifier.blueup.description, #"BlueUp"#)
    
        // DAKATECH
        XCTAssertEqual(CompanyIdentifier.dakatech.rawValue, 2138)
        XCTAssertEqual(CompanyIdentifier.dakatech.name, #"DAKATECH"#)
        XCTAssertEqual(CompanyIdentifier.dakatech.description, #"DAKATECH"#)
    
        // RICOH ELECTRONIC DEVICES CO., LTD.
        XCTAssertEqual(CompanyIdentifier.ricohElectronicDevices.rawValue, 2139)
        XCTAssertEqual(CompanyIdentifier.ricohElectronicDevices.name, #"RICOH ELECTRONIC DEVICES CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.ricohElectronicDevices.description, #"RICOH ELECTRONIC DEVICES CO., LTD."#)
    
        // ACOS CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.acos.rawValue, 2140)
        XCTAssertEqual(CompanyIdentifier.acos.name, #"ACOS CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.acos.description, #"ACOS CO.,LTD."#)
    
        // Guilin Zhishen Information Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.guilinZhishenInformationTechnology.rawValue, 2141)
        XCTAssertEqual(CompanyIdentifier.guilinZhishenInformationTechnology.name, #"Guilin Zhishen Information Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.guilinZhishenInformationTechnology.description, #"Guilin Zhishen Information Technology Co.,Ltd."#)
    
        // Krog Systems LLC
        XCTAssertEqual(CompanyIdentifier.krogSystems.rawValue, 2142)
        XCTAssertEqual(CompanyIdentifier.krogSystems.name, #"Krog Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.krogSystems.description, #"Krog Systems LLC"#)
    
        // COMPEGPS TEAM,SOCIEDAD LIMITADA
        XCTAssertEqual(CompanyIdentifier.compegpsTeamSociedadLimitada.rawValue, 2143)
        XCTAssertEqual(CompanyIdentifier.compegpsTeamSociedadLimitada.name, #"COMPEGPS TEAM,SOCIEDAD LIMITADA"#)
        XCTAssertEqual(CompanyIdentifier.compegpsTeamSociedadLimitada.description, #"COMPEGPS TEAM,SOCIEDAD LIMITADA"#)
    
        // Alflex Products B.V.
        XCTAssertEqual(CompanyIdentifier.alflexProducts.rawValue, 2144)
        XCTAssertEqual(CompanyIdentifier.alflexProducts.name, #"Alflex Products B.V."#)
        XCTAssertEqual(CompanyIdentifier.alflexProducts.description, #"Alflex Products B.V."#)
    
        // SmartSensor Labs Ltd
        XCTAssertEqual(CompanyIdentifier.smartsensorLabs.rawValue, 2145)
        XCTAssertEqual(CompanyIdentifier.smartsensorLabs.name, #"SmartSensor Labs Ltd"#)
        XCTAssertEqual(CompanyIdentifier.smartsensorLabs.description, #"SmartSensor Labs Ltd"#)
    
        // SmartDrive
        XCTAssertEqual(CompanyIdentifier.smartdrive.rawValue, 2146)
        XCTAssertEqual(CompanyIdentifier.smartdrive.name, #"SmartDrive"#)
        XCTAssertEqual(CompanyIdentifier.smartdrive.description, #"SmartDrive"#)
    
        // Yo-tronics Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.yoTronicsTechnology.rawValue, 2147)
        XCTAssertEqual(CompanyIdentifier.yoTronicsTechnology.name, #"Yo-tronics Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.yoTronicsTechnology.description, #"Yo-tronics Technology Co., Ltd."#)
    
        // Rafaelmicro
        XCTAssertEqual(CompanyIdentifier.rafaelmicro.rawValue, 2148)
        XCTAssertEqual(CompanyIdentifier.rafaelmicro.name, #"Rafaelmicro"#)
        XCTAssertEqual(CompanyIdentifier.rafaelmicro.description, #"Rafaelmicro"#)
    
        // Emergency Lighting Products Limited
        XCTAssertEqual(CompanyIdentifier.emergencyLightingProducts.rawValue, 2149)
        XCTAssertEqual(CompanyIdentifier.emergencyLightingProducts.name, #"Emergency Lighting Products Limited"#)
        XCTAssertEqual(CompanyIdentifier.emergencyLightingProducts.description, #"Emergency Lighting Products Limited"#)
    
        // LAONZ Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.laonz.rawValue, 2150)
        XCTAssertEqual(CompanyIdentifier.laonz.name, #"LAONZ Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.laonz.description, #"LAONZ Co.,Ltd"#)
    
        // Western Digital Techologies, Inc.
        XCTAssertEqual(CompanyIdentifier.westernDigitalTechologies.rawValue, 2151)
        XCTAssertEqual(CompanyIdentifier.westernDigitalTechologies.name, #"Western Digital Techologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.westernDigitalTechologies.description, #"Western Digital Techologies, Inc."#)
    
        // WIOsense GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.wiosense.rawValue, 2152)
        XCTAssertEqual(CompanyIdentifier.wiosense.name, #"WIOsense GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.wiosense.description, #"WIOsense GmbH & Co. KG"#)
    
        // EVVA Sicherheitstechnologie GmbH
        XCTAssertEqual(CompanyIdentifier.evvaSicherheitstechnologie.rawValue, 2153)
        XCTAssertEqual(CompanyIdentifier.evvaSicherheitstechnologie.name, #"EVVA Sicherheitstechnologie GmbH"#)
        XCTAssertEqual(CompanyIdentifier.evvaSicherheitstechnologie.description, #"EVVA Sicherheitstechnologie GmbH"#)
    
        // Odic Incorporated
        XCTAssertEqual(CompanyIdentifier.odic.rawValue, 2154)
        XCTAssertEqual(CompanyIdentifier.odic.name, #"Odic Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.odic.description, #"Odic Incorporated"#)
    
        // Pacific Track, LLC
        XCTAssertEqual(CompanyIdentifier.pacificTrack.rawValue, 2155)
        XCTAssertEqual(CompanyIdentifier.pacificTrack.name, #"Pacific Track, LLC"#)
        XCTAssertEqual(CompanyIdentifier.pacificTrack.description, #"Pacific Track, LLC"#)
    
        // Revvo Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.revvoTechnologies.rawValue, 2156)
        XCTAssertEqual(CompanyIdentifier.revvoTechnologies.name, #"Revvo Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.revvoTechnologies.description, #"Revvo Technologies, Inc."#)
    
        // Biometrika d.o.o.
        XCTAssertEqual(CompanyIdentifier.biometrika.rawValue, 2157)
        XCTAssertEqual(CompanyIdentifier.biometrika.name, #"Biometrika d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.biometrika.description, #"Biometrika d.o.o."#)
    
        // Vorwerk Elektrowerke GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.vorwerkElektrowerke.rawValue, 2158)
        XCTAssertEqual(CompanyIdentifier.vorwerkElektrowerke.name, #"Vorwerk Elektrowerke GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.vorwerkElektrowerke.description, #"Vorwerk Elektrowerke GmbH & Co. KG"#)
    
        // Trackunit A/S
        XCTAssertEqual(CompanyIdentifier.trackunit.rawValue, 2159)
        XCTAssertEqual(CompanyIdentifier.trackunit.name, #"Trackunit A/S"#)
        XCTAssertEqual(CompanyIdentifier.trackunit.description, #"Trackunit A/S"#)
    
        // Wyze Labs, Inc
        XCTAssertEqual(CompanyIdentifier.wyzeLabs.rawValue, 2160)
        XCTAssertEqual(CompanyIdentifier.wyzeLabs.name, #"Wyze Labs, Inc"#)
        XCTAssertEqual(CompanyIdentifier.wyzeLabs.description, #"Wyze Labs, Inc"#)
    
        // Dension Elektronikai Kft. (formerly: Dension Audio Systems Ltd.)
        XCTAssertEqual(CompanyIdentifier.densionElektronikaiKftFormerlyDensionAudioSystems.rawValue, 2161)
        XCTAssertEqual(CompanyIdentifier.densionElektronikaiKftFormerlyDensionAudioSystems.name, #"Dension Elektronikai Kft. (formerly: Dension Audio Systems Ltd.)"#)
        XCTAssertEqual(CompanyIdentifier.densionElektronikaiKftFormerlyDensionAudioSystems.description, #"Dension Elektronikai Kft. (formerly: Dension Audio Systems Ltd.)"#)
    
        // 11 Health & Technologies Limited
        XCTAssertEqual(CompanyIdentifier.company11HealthTechnologies.rawValue, 2162)
        XCTAssertEqual(CompanyIdentifier.company11HealthTechnologies.name, #"11 Health & Technologies Limited"#)
        XCTAssertEqual(CompanyIdentifier.company11HealthTechnologies.description, #"11 Health & Technologies Limited"#)
    
        // Innophase Incorporated
        XCTAssertEqual(CompanyIdentifier.innophase.rawValue, 2163)
        XCTAssertEqual(CompanyIdentifier.innophase.name, #"Innophase Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.innophase.description, #"Innophase Incorporated"#)
    
        // Treegreen Limited
        XCTAssertEqual(CompanyIdentifier.treegreen.rawValue, 2164)
        XCTAssertEqual(CompanyIdentifier.treegreen.name, #"Treegreen Limited"#)
        XCTAssertEqual(CompanyIdentifier.treegreen.description, #"Treegreen Limited"#)
    
        // Berner International LLC
        XCTAssertEqual(CompanyIdentifier.bernerInternational.rawValue, 2165)
        XCTAssertEqual(CompanyIdentifier.bernerInternational.name, #"Berner International LLC"#)
        XCTAssertEqual(CompanyIdentifier.bernerInternational.description, #"Berner International LLC"#)
    
        // SmartResQ ApS
        XCTAssertEqual(CompanyIdentifier.smartresq.rawValue, 2166)
        XCTAssertEqual(CompanyIdentifier.smartresq.name, #"SmartResQ ApS"#)
        XCTAssertEqual(CompanyIdentifier.smartresq.description, #"SmartResQ ApS"#)
    
        // Tome, Inc.
        XCTAssertEqual(CompanyIdentifier.tome.rawValue, 2167)
        XCTAssertEqual(CompanyIdentifier.tome.name, #"Tome, Inc."#)
        XCTAssertEqual(CompanyIdentifier.tome.description, #"Tome, Inc."#)
    
        // The Chamberlain Group, Inc.
        XCTAssertEqual(CompanyIdentifier.chamberlainGroup.rawValue, 2168)
        XCTAssertEqual(CompanyIdentifier.chamberlainGroup.name, #"The Chamberlain Group, Inc."#)
        XCTAssertEqual(CompanyIdentifier.chamberlainGroup.description, #"The Chamberlain Group, Inc."#)
    
        // MIZUNO Corporation
        XCTAssertEqual(CompanyIdentifier.mizuno.rawValue, 2169)
        XCTAssertEqual(CompanyIdentifier.mizuno.name, #"MIZUNO Corporation"#)
        XCTAssertEqual(CompanyIdentifier.mizuno.description, #"MIZUNO Corporation"#)
    
        // ZRF, LLC
        XCTAssertEqual(CompanyIdentifier.zrf.rawValue, 2170)
        XCTAssertEqual(CompanyIdentifier.zrf.name, #"ZRF, LLC"#)
        XCTAssertEqual(CompanyIdentifier.zrf.description, #"ZRF, LLC"#)
    
        // BYSTAMP
        XCTAssertEqual(CompanyIdentifier.bystamp.rawValue, 2171)
        XCTAssertEqual(CompanyIdentifier.bystamp.name, #"BYSTAMP"#)
        XCTAssertEqual(CompanyIdentifier.bystamp.description, #"BYSTAMP"#)
    
        // Crosscan GmbH
        XCTAssertEqual(CompanyIdentifier.crosscan.rawValue, 2172)
        XCTAssertEqual(CompanyIdentifier.crosscan.name, #"Crosscan GmbH"#)
        XCTAssertEqual(CompanyIdentifier.crosscan.description, #"Crosscan GmbH"#)
    
        // Konftel AB
        XCTAssertEqual(CompanyIdentifier.konftel.rawValue, 2173)
        XCTAssertEqual(CompanyIdentifier.konftel.name, #"Konftel AB"#)
        XCTAssertEqual(CompanyIdentifier.konftel.description, #"Konftel AB"#)
    
        // 1bar.net Limited
        XCTAssertEqual(CompanyIdentifier.company1BarNet.rawValue, 2174)
        XCTAssertEqual(CompanyIdentifier.company1BarNet.name, #"1bar.net Limited"#)
        XCTAssertEqual(CompanyIdentifier.company1BarNet.description, #"1bar.net Limited"#)
    
        // Phillips Connect Technologies LLC
        XCTAssertEqual(CompanyIdentifier.phillipsConnectTechnologies.rawValue, 2175)
        XCTAssertEqual(CompanyIdentifier.phillipsConnectTechnologies.name, #"Phillips Connect Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.phillipsConnectTechnologies.description, #"Phillips Connect Technologies LLC"#)
    
        // imagiLabs AB
        XCTAssertEqual(CompanyIdentifier.imagilabs.rawValue, 2176)
        XCTAssertEqual(CompanyIdentifier.imagilabs.name, #"imagiLabs AB"#)
        XCTAssertEqual(CompanyIdentifier.imagilabs.description, #"imagiLabs AB"#)
    
        // Optalert
        XCTAssertEqual(CompanyIdentifier.optalert.rawValue, 2177)
        XCTAssertEqual(CompanyIdentifier.optalert.name, #"Optalert"#)
        XCTAssertEqual(CompanyIdentifier.optalert.description, #"Optalert"#)
    
        // PSYONIC, Inc.
        XCTAssertEqual(CompanyIdentifier.psyonic.rawValue, 2178)
        XCTAssertEqual(CompanyIdentifier.psyonic.name, #"PSYONIC, Inc."#)
        XCTAssertEqual(CompanyIdentifier.psyonic.description, #"PSYONIC, Inc."#)
    
        // Wintersteiger AG
        XCTAssertEqual(CompanyIdentifier.wintersteiger.rawValue, 2179)
        XCTAssertEqual(CompanyIdentifier.wintersteiger.name, #"Wintersteiger AG"#)
        XCTAssertEqual(CompanyIdentifier.wintersteiger.description, #"Wintersteiger AG"#)
    
        // Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda
        XCTAssertEqual(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologiaa.rawValue, 2180)
        XCTAssertEqual(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologiaa.name, #"Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda"#)
        XCTAssertEqual(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologiaa.description, #"Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda"#)
    
        // LEVOLOR INC
        XCTAssertEqual(CompanyIdentifier.levolor.rawValue, 2181)
        XCTAssertEqual(CompanyIdentifier.levolor.name, #"LEVOLOR INC"#)
        XCTAssertEqual(CompanyIdentifier.levolor.description, #"LEVOLOR INC"#)
    
        // Xsens Technologies B.V.
        XCTAssertEqual(CompanyIdentifier.xsensTechnologies.rawValue, 2182)
        XCTAssertEqual(CompanyIdentifier.xsensTechnologies.name, #"Xsens Technologies B.V."#)
        XCTAssertEqual(CompanyIdentifier.xsensTechnologies.description, #"Xsens Technologies B.V."#)
    
        // Hydro-Gear Limited Partnership
        XCTAssertEqual(CompanyIdentifier.hydroGearPartnership.rawValue, 2183)
        XCTAssertEqual(CompanyIdentifier.hydroGearPartnership.name, #"Hydro-Gear Limited Partnership"#)
        XCTAssertEqual(CompanyIdentifier.hydroGearPartnership.description, #"Hydro-Gear Limited Partnership"#)
    
        // EnPointe Fencing Pty Ltd
        XCTAssertEqual(CompanyIdentifier.enpointeFencingPty.rawValue, 2184)
        XCTAssertEqual(CompanyIdentifier.enpointeFencingPty.name, #"EnPointe Fencing Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.enpointeFencingPty.description, #"EnPointe Fencing Pty Ltd"#)
    
        // XANTHIO
        XCTAssertEqual(CompanyIdentifier.xanthio.rawValue, 2185)
        XCTAssertEqual(CompanyIdentifier.xanthio.name, #"XANTHIO"#)
        XCTAssertEqual(CompanyIdentifier.xanthio.description, #"XANTHIO"#)
    
        // sclak s.r.l.
        XCTAssertEqual(CompanyIdentifier.sclak.rawValue, 2186)
        XCTAssertEqual(CompanyIdentifier.sclak.name, #"sclak s.r.l."#)
        XCTAssertEqual(CompanyIdentifier.sclak.description, #"sclak s.r.l."#)
    
        // Tricorder Arraay Technologies LLC
        XCTAssertEqual(CompanyIdentifier.tricorderArraayTechnologies.rawValue, 2187)
        XCTAssertEqual(CompanyIdentifier.tricorderArraayTechnologies.name, #"Tricorder Arraay Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.tricorderArraayTechnologies.description, #"Tricorder Arraay Technologies LLC"#)
    
        // GB Solution co.,Ltd
        XCTAssertEqual(CompanyIdentifier.gbSolution.rawValue, 2188)
        XCTAssertEqual(CompanyIdentifier.gbSolution.name, #"GB Solution co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.gbSolution.description, #"GB Solution co.,Ltd"#)
    
        // Soliton Systems K.K.
        XCTAssertEqual(CompanyIdentifier.solitonSystemsKK.rawValue, 2189)
        XCTAssertEqual(CompanyIdentifier.solitonSystemsKK.name, #"Soliton Systems K.K."#)
        XCTAssertEqual(CompanyIdentifier.solitonSystemsKK.description, #"Soliton Systems K.K."#)
    
        // GIGA-TMS INC
        XCTAssertEqual(CompanyIdentifier.gigaTms.rawValue, 2190)
        XCTAssertEqual(CompanyIdentifier.gigaTms.name, #"GIGA-TMS INC"#)
        XCTAssertEqual(CompanyIdentifier.gigaTms.description, #"GIGA-TMS INC"#)
    
        // Tait International Limited
        XCTAssertEqual(CompanyIdentifier.taitInternational.rawValue, 2191)
        XCTAssertEqual(CompanyIdentifier.taitInternational.name, #"Tait International Limited"#)
        XCTAssertEqual(CompanyIdentifier.taitInternational.description, #"Tait International Limited"#)
    
        // NICHIEI INTEC CO., LTD.
        XCTAssertEqual(CompanyIdentifier.nichieiIntec.rawValue, 2192)
        XCTAssertEqual(CompanyIdentifier.nichieiIntec.name, #"NICHIEI INTEC CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.nichieiIntec.description, #"NICHIEI INTEC CO., LTD."#)
    
        // SmartWireless GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.smartwireless.rawValue, 2193)
        XCTAssertEqual(CompanyIdentifier.smartwireless.name, #"SmartWireless GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.smartwireless.description, #"SmartWireless GmbH & Co. KG"#)
    
        // Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)
        XCTAssertEqual(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.rawValue, 2194)
        XCTAssertEqual(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.name, #"Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)"#)
        XCTAssertEqual(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.description, #"Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)"#)
    
        // Maytronics Ltd
        XCTAssertEqual(CompanyIdentifier.maytronics.rawValue, 2195)
        XCTAssertEqual(CompanyIdentifier.maytronics.name, #"Maytronics Ltd"#)
        XCTAssertEqual(CompanyIdentifier.maytronics.description, #"Maytronics Ltd"#)
    
        // EPIFIT
        XCTAssertEqual(CompanyIdentifier.epifit.rawValue, 2196)
        XCTAssertEqual(CompanyIdentifier.epifit.name, #"EPIFIT"#)
        XCTAssertEqual(CompanyIdentifier.epifit.description, #"EPIFIT"#)
    
        // Gimer medical
        XCTAssertEqual(CompanyIdentifier.gimerMedical.rawValue, 2197)
        XCTAssertEqual(CompanyIdentifier.gimerMedical.name, #"Gimer medical"#)
        XCTAssertEqual(CompanyIdentifier.gimerMedical.description, #"Gimer medical"#)
    
        // Nokian Renkaat Oyj
        XCTAssertEqual(CompanyIdentifier.nokianRenkaatj.rawValue, 2198)
        XCTAssertEqual(CompanyIdentifier.nokianRenkaatj.name, #"Nokian Renkaat Oyj"#)
        XCTAssertEqual(CompanyIdentifier.nokianRenkaatj.description, #"Nokian Renkaat Oyj"#)
    
        // Current Lighting Solutions LLC
        XCTAssertEqual(CompanyIdentifier.currentLightingSolutions.rawValue, 2199)
        XCTAssertEqual(CompanyIdentifier.currentLightingSolutions.name, #"Current Lighting Solutions LLC"#)
        XCTAssertEqual(CompanyIdentifier.currentLightingSolutions.description, #"Current Lighting Solutions LLC"#)
    
        // Sensibo, Inc.
        XCTAssertEqual(CompanyIdentifier.sensibo.rawValue, 2200)
        XCTAssertEqual(CompanyIdentifier.sensibo.name, #"Sensibo, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sensibo.description, #"Sensibo, Inc."#)
    
        // SFS unimarket AG
        XCTAssertEqual(CompanyIdentifier.sfsUnimarket.rawValue, 2201)
        XCTAssertEqual(CompanyIdentifier.sfsUnimarket.name, #"SFS unimarket AG"#)
        XCTAssertEqual(CompanyIdentifier.sfsUnimarket.description, #"SFS unimarket AG"#)
    
        // Private limited company "Teltonika"
        XCTAssertEqual(CompanyIdentifier.privateCompanyTeltonika.rawValue, 2202)
        XCTAssertEqual(CompanyIdentifier.privateCompanyTeltonika.name, #"Private limited company "Teltonika""#)
        XCTAssertEqual(CompanyIdentifier.privateCompanyTeltonika.description, #"Private limited company "Teltonika""#)
    
        // Saucon Technologies
        XCTAssertEqual(CompanyIdentifier.sauconTechnologies.rawValue, 2203)
        XCTAssertEqual(CompanyIdentifier.sauconTechnologies.name, #"Saucon Technologies"#)
        XCTAssertEqual(CompanyIdentifier.sauconTechnologies.description, #"Saucon Technologies"#)
    
        // Embedded Devices Co. Company
        XCTAssertEqual(CompanyIdentifier.embeddedDevicesCompany.rawValue, 2204)
        XCTAssertEqual(CompanyIdentifier.embeddedDevicesCompany.name, #"Embedded Devices Co. Company"#)
        XCTAssertEqual(CompanyIdentifier.embeddedDevicesCompany.description, #"Embedded Devices Co. Company"#)
    
        // J-J.A.D.E. Enterprise LLC
        XCTAssertEqual(CompanyIdentifier.jJADEEnterprise.rawValue, 2205)
        XCTAssertEqual(CompanyIdentifier.jJADEEnterprise.name, #"J-J.A.D.E. Enterprise LLC"#)
        XCTAssertEqual(CompanyIdentifier.jJADEEnterprise.description, #"J-J.A.D.E. Enterprise LLC"#)
    
        // i-SENS, inc.
        XCTAssertEqual(CompanyIdentifier.iSens.rawValue, 2206)
        XCTAssertEqual(CompanyIdentifier.iSens.name, #"i-SENS, inc."#)
        XCTAssertEqual(CompanyIdentifier.iSens.description, #"i-SENS, inc."#)
    
        // Witschi Electronic Ltd
        XCTAssertEqual(CompanyIdentifier.witschiElectronic.rawValue, 2207)
        XCTAssertEqual(CompanyIdentifier.witschiElectronic.name, #"Witschi Electronic Ltd"#)
        XCTAssertEqual(CompanyIdentifier.witschiElectronic.description, #"Witschi Electronic Ltd"#)
    
        // Aclara Technologies LLC
        XCTAssertEqual(CompanyIdentifier.aclaraTechnologies.rawValue, 2208)
        XCTAssertEqual(CompanyIdentifier.aclaraTechnologies.name, #"Aclara Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.aclaraTechnologies.description, #"Aclara Technologies LLC"#)
    
        // EXEO TECH CORPORATION
        XCTAssertEqual(CompanyIdentifier.exeoTech.rawValue, 2209)
        XCTAssertEqual(CompanyIdentifier.exeoTech.name, #"EXEO TECH CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.exeoTech.description, #"EXEO TECH CORPORATION"#)
    
        // Epic Systems Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.epicSystems.rawValue, 2210)
        XCTAssertEqual(CompanyIdentifier.epicSystems.name, #"Epic Systems Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.epicSystems.description, #"Epic Systems Co., Ltd."#)
    
        // Hoffmann SE
        XCTAssertEqual(CompanyIdentifier.hoffmannSe.rawValue, 2211)
        XCTAssertEqual(CompanyIdentifier.hoffmannSe.name, #"Hoffmann SE"#)
        XCTAssertEqual(CompanyIdentifier.hoffmannSe.description, #"Hoffmann SE"#)
    
        // Realme Chongqing Mobile Telecommunications Corp., Ltd.
        XCTAssertEqual(CompanyIdentifier.realmeChongqingMobileTelecommunications.rawValue, 2212)
        XCTAssertEqual(CompanyIdentifier.realmeChongqingMobileTelecommunications.name, #"Realme Chongqing Mobile Telecommunications Corp., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.realmeChongqingMobileTelecommunications.description, #"Realme Chongqing Mobile Telecommunications Corp., Ltd."#)
    
        // UMEHEAL Ltd
        XCTAssertEqual(CompanyIdentifier.umeheal.rawValue, 2213)
        XCTAssertEqual(CompanyIdentifier.umeheal.name, #"UMEHEAL Ltd"#)
        XCTAssertEqual(CompanyIdentifier.umeheal.description, #"UMEHEAL Ltd"#)
    
        // Intelligenceworks Inc.
        XCTAssertEqual(CompanyIdentifier.intelligenceworks.rawValue, 2214)
        XCTAssertEqual(CompanyIdentifier.intelligenceworks.name, #"Intelligenceworks Inc."#)
        XCTAssertEqual(CompanyIdentifier.intelligenceworks.description, #"Intelligenceworks Inc."#)
    
        // TGR 1.618 Limited
        XCTAssertEqual(CompanyIdentifier.tgr1618.rawValue, 2215)
        XCTAssertEqual(CompanyIdentifier.tgr1618.name, #"TGR 1.618 Limited"#)
        XCTAssertEqual(CompanyIdentifier.tgr1618.description, #"TGR 1.618 Limited"#)
    
        // Shanghai Kfcube Inc
        XCTAssertEqual(CompanyIdentifier.shanghaiKfcube.rawValue, 2216)
        XCTAssertEqual(CompanyIdentifier.shanghaiKfcube.name, #"Shanghai Kfcube Inc"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiKfcube.description, #"Shanghai Kfcube Inc"#)
    
        // Fraunhofer IIS
        XCTAssertEqual(CompanyIdentifier.fraunhoferIis.rawValue, 2217)
        XCTAssertEqual(CompanyIdentifier.fraunhoferIis.name, #"Fraunhofer IIS"#)
        XCTAssertEqual(CompanyIdentifier.fraunhoferIis.description, #"Fraunhofer IIS"#)
    
        // SZ DJI TECHNOLOGY CO.,LTD
        XCTAssertEqual(CompanyIdentifier.szDjiTechnology.rawValue, 2218)
        XCTAssertEqual(CompanyIdentifier.szDjiTechnology.name, #"SZ DJI TECHNOLOGY CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.szDjiTechnology.description, #"SZ DJI TECHNOLOGY CO.,LTD"#)
    
        // Coburn Technology, LLC
        XCTAssertEqual(CompanyIdentifier.coburnTechnology.rawValue, 2219)
        XCTAssertEqual(CompanyIdentifier.coburnTechnology.name, #"Coburn Technology, LLC"#)
        XCTAssertEqual(CompanyIdentifier.coburnTechnology.description, #"Coburn Technology, LLC"#)
    
        // Topre Corporation
        XCTAssertEqual(CompanyIdentifier.topre.rawValue, 2220)
        XCTAssertEqual(CompanyIdentifier.topre.name, #"Topre Corporation"#)
        XCTAssertEqual(CompanyIdentifier.topre.description, #"Topre Corporation"#)
    
        // Kayamatics Limited
        XCTAssertEqual(CompanyIdentifier.kayamatics.rawValue, 2221)
        XCTAssertEqual(CompanyIdentifier.kayamatics.name, #"Kayamatics Limited"#)
        XCTAssertEqual(CompanyIdentifier.kayamatics.description, #"Kayamatics Limited"#)
    
        // Moticon ReGo AG
        XCTAssertEqual(CompanyIdentifier.moticonRego.rawValue, 2222)
        XCTAssertEqual(CompanyIdentifier.moticonRego.name, #"Moticon ReGo AG"#)
        XCTAssertEqual(CompanyIdentifier.moticonRego.description, #"Moticon ReGo AG"#)
    
        // Polidea Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.polidea.rawValue, 2223)
        XCTAssertEqual(CompanyIdentifier.polidea.name, #"Polidea Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.polidea.description, #"Polidea Sp. z o.o."#)
    
        // Trivedi Advanced Technologies LLC
        XCTAssertEqual(CompanyIdentifier.trivediAdvancedTechnologies.rawValue, 2224)
        XCTAssertEqual(CompanyIdentifier.trivediAdvancedTechnologies.name, #"Trivedi Advanced Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.trivediAdvancedTechnologies.description, #"Trivedi Advanced Technologies LLC"#)
    
        // CORE|vision BV
        XCTAssertEqual(CompanyIdentifier.coreVision.rawValue, 2225)
        XCTAssertEqual(CompanyIdentifier.coreVision.name, #"CORE|vision BV"#)
        XCTAssertEqual(CompanyIdentifier.coreVision.description, #"CORE|vision BV"#)
    
        // PF SCHWEISSTECHNOLOGIE GMBH
        XCTAssertEqual(CompanyIdentifier.pfSchweisstechnologie.rawValue, 2226)
        XCTAssertEqual(CompanyIdentifier.pfSchweisstechnologie.name, #"PF SCHWEISSTECHNOLOGIE GMBH"#)
        XCTAssertEqual(CompanyIdentifier.pfSchweisstechnologie.description, #"PF SCHWEISSTECHNOLOGIE GMBH"#)
    
        // IONIQ Skincare GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.ioniqSkincare.rawValue, 2227)
        XCTAssertEqual(CompanyIdentifier.ioniqSkincare.name, #"IONIQ Skincare GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.ioniqSkincare.description, #"IONIQ Skincare GmbH & Co. KG"#)
    
        // Sengled Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sengled.rawValue, 2228)
        XCTAssertEqual(CompanyIdentifier.sengled.name, #"Sengled Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sengled.description, #"Sengled Co., Ltd."#)
    
        // TransferFi
        XCTAssertEqual(CompanyIdentifier.transferfi.rawValue, 2229)
        XCTAssertEqual(CompanyIdentifier.transferfi.name, #"TransferFi"#)
        XCTAssertEqual(CompanyIdentifier.transferfi.description, #"TransferFi"#)
    
        // Boehringer Ingelheim Vetmedica GmbH
        XCTAssertEqual(CompanyIdentifier.boehringerIngelheimVetmedica.rawValue, 2230)
        XCTAssertEqual(CompanyIdentifier.boehringerIngelheimVetmedica.name, #"Boehringer Ingelheim Vetmedica GmbH"#)
        XCTAssertEqual(CompanyIdentifier.boehringerIngelheimVetmedica.description, #"Boehringer Ingelheim Vetmedica GmbH"#)
    
        // ABB Inc
        XCTAssertEqual(CompanyIdentifier.abb3.rawValue, 2231)
        XCTAssertEqual(CompanyIdentifier.abb3.name, #"ABB Inc"#)
        XCTAssertEqual(CompanyIdentifier.abb3.description, #"ABB Inc"#)
    
        // Check Technology Solutions LLC
        XCTAssertEqual(CompanyIdentifier.checkTechnologySolutions.rawValue, 2232)
        XCTAssertEqual(CompanyIdentifier.checkTechnologySolutions.name, #"Check Technology Solutions LLC"#)
        XCTAssertEqual(CompanyIdentifier.checkTechnologySolutions.description, #"Check Technology Solutions LLC"#)
    
        // U-Shin Ltd.
        XCTAssertEqual(CompanyIdentifier.uShin.rawValue, 2233)
        XCTAssertEqual(CompanyIdentifier.uShin.name, #"U-Shin Ltd."#)
        XCTAssertEqual(CompanyIdentifier.uShin.description, #"U-Shin Ltd."#)
    
        // HYPER ICE, INC.
        XCTAssertEqual(CompanyIdentifier.hyperIce.rawValue, 2234)
        XCTAssertEqual(CompanyIdentifier.hyperIce.name, #"HYPER ICE, INC."#)
        XCTAssertEqual(CompanyIdentifier.hyperIce.description, #"HYPER ICE, INC."#)
    
        // Tokai-rika co.,ltd.
        XCTAssertEqual(CompanyIdentifier.tokaiRika.rawValue, 2235)
        XCTAssertEqual(CompanyIdentifier.tokaiRika.name, #"Tokai-rika co.,ltd."#)
        XCTAssertEqual(CompanyIdentifier.tokaiRika.description, #"Tokai-rika co.,ltd."#)
    
        // Prevayl Limited
        XCTAssertEqual(CompanyIdentifier.prevayl.rawValue, 2236)
        XCTAssertEqual(CompanyIdentifier.prevayl.name, #"Prevayl Limited"#)
        XCTAssertEqual(CompanyIdentifier.prevayl.description, #"Prevayl Limited"#)
    
        // bf1systems limited
        XCTAssertEqual(CompanyIdentifier.bf1Systems.rawValue, 2237)
        XCTAssertEqual(CompanyIdentifier.bf1Systems.name, #"bf1systems limited"#)
        XCTAssertEqual(CompanyIdentifier.bf1Systems.description, #"bf1systems limited"#)
    
        // ubisys technologies GmbH
        XCTAssertEqual(CompanyIdentifier.ubisysTechnologies.rawValue, 2238)
        XCTAssertEqual(CompanyIdentifier.ubisysTechnologies.name, #"ubisys technologies GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ubisysTechnologies.description, #"ubisys technologies GmbH"#)
    
        // SIRC Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sirc.rawValue, 2239)
        XCTAssertEqual(CompanyIdentifier.sirc.name, #"SIRC Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sirc.description, #"SIRC Co., Ltd."#)
    
        // Accent Advanced Systems SLU
        XCTAssertEqual(CompanyIdentifier.accentAdvancedSystemsSlu.rawValue, 2240)
        XCTAssertEqual(CompanyIdentifier.accentAdvancedSystemsSlu.name, #"Accent Advanced Systems SLU"#)
        XCTAssertEqual(CompanyIdentifier.accentAdvancedSystemsSlu.description, #"Accent Advanced Systems SLU"#)
    
        // Rayden.Earth LTD
        XCTAssertEqual(CompanyIdentifier.raydenEarth.rawValue, 2241)
        XCTAssertEqual(CompanyIdentifier.raydenEarth.name, #"Rayden.Earth LTD"#)
        XCTAssertEqual(CompanyIdentifier.raydenEarth.description, #"Rayden.Earth LTD"#)
    
        // Lindinvent AB
        XCTAssertEqual(CompanyIdentifier.lindinvent.rawValue, 2242)
        XCTAssertEqual(CompanyIdentifier.lindinvent.name, #"Lindinvent AB"#)
        XCTAssertEqual(CompanyIdentifier.lindinvent.description, #"Lindinvent AB"#)
    
        // CHIPOLO d.o.o.
        XCTAssertEqual(CompanyIdentifier.chipolo.rawValue, 2243)
        XCTAssertEqual(CompanyIdentifier.chipolo.name, #"CHIPOLO d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.chipolo.description, #"CHIPOLO d.o.o."#)
    
        // CellAssist, LLC
        XCTAssertEqual(CompanyIdentifier.cellassist.rawValue, 2244)
        XCTAssertEqual(CompanyIdentifier.cellassist.name, #"CellAssist, LLC"#)
        XCTAssertEqual(CompanyIdentifier.cellassist.description, #"CellAssist, LLC"#)
    
        // J. Wagner GmbH
        XCTAssertEqual(CompanyIdentifier.jWagner.rawValue, 2245)
        XCTAssertEqual(CompanyIdentifier.jWagner.name, #"J. Wagner GmbH"#)
        XCTAssertEqual(CompanyIdentifier.jWagner.description, #"J. Wagner GmbH"#)
    
        // Integra Optics Inc
        XCTAssertEqual(CompanyIdentifier.integraOptics.rawValue, 2246)
        XCTAssertEqual(CompanyIdentifier.integraOptics.name, #"Integra Optics Inc"#)
        XCTAssertEqual(CompanyIdentifier.integraOptics.description, #"Integra Optics Inc"#)
    
        // Monadnock Systems Ltd.
        XCTAssertEqual(CompanyIdentifier.monadnockSystems.rawValue, 2247)
        XCTAssertEqual(CompanyIdentifier.monadnockSystems.name, #"Monadnock Systems Ltd."#)
        XCTAssertEqual(CompanyIdentifier.monadnockSystems.description, #"Monadnock Systems Ltd."#)
    
        // Liteboxer Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.liteboxerTechnologies.rawValue, 2248)
        XCTAssertEqual(CompanyIdentifier.liteboxerTechnologies.name, #"Liteboxer Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.liteboxerTechnologies.description, #"Liteboxer Technologies Inc."#)
    
        // Noventa AG
        XCTAssertEqual(CompanyIdentifier.noventa.rawValue, 2249)
        XCTAssertEqual(CompanyIdentifier.noventa.name, #"Noventa AG"#)
        XCTAssertEqual(CompanyIdentifier.noventa.description, #"Noventa AG"#)
    
        // Nubia Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.nubiaTechnology.rawValue, 2250)
        XCTAssertEqual(CompanyIdentifier.nubiaTechnology.name, #"Nubia Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nubiaTechnology.description, #"Nubia Technology Co.,Ltd."#)
    
        // JT INNOVATIONS LIMITED
        XCTAssertEqual(CompanyIdentifier.jtInnovations.rawValue, 2251)
        XCTAssertEqual(CompanyIdentifier.jtInnovations.name, #"JT INNOVATIONS LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.jtInnovations.description, #"JT INNOVATIONS LIMITED"#)
    
        // TGM TECHNOLOGY CO., LTD.
        XCTAssertEqual(CompanyIdentifier.tgmTechnology.rawValue, 2252)
        XCTAssertEqual(CompanyIdentifier.tgmTechnology.name, #"TGM TECHNOLOGY CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.tgmTechnology.description, #"TGM TECHNOLOGY CO., LTD."#)
    
        // ifly
        XCTAssertEqual(CompanyIdentifier.ifly.rawValue, 2253)
        XCTAssertEqual(CompanyIdentifier.ifly.name, #"ifly"#)
        XCTAssertEqual(CompanyIdentifier.ifly.description, #"ifly"#)
    
        // ZIMI CORPORATION
        XCTAssertEqual(CompanyIdentifier.zimi.rawValue, 2254)
        XCTAssertEqual(CompanyIdentifier.zimi.name, #"ZIMI CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.zimi.description, #"ZIMI CORPORATION"#)
    
        // betternotstealmybike UG (with limited liability)
        XCTAssertEqual(CompanyIdentifier.betternotstealmybikeUgWithLiability.rawValue, 2255)
        XCTAssertEqual(CompanyIdentifier.betternotstealmybikeUgWithLiability.name, #"betternotstealmybike UG (with limited liability)"#)
        XCTAssertEqual(CompanyIdentifier.betternotstealmybikeUgWithLiability.description, #"betternotstealmybike UG (with limited liability)"#)
    
        // ESTOM Infotech Kft.
        XCTAssertEqual(CompanyIdentifier.estomInfotechKft.rawValue, 2256)
        XCTAssertEqual(CompanyIdentifier.estomInfotechKft.name, #"ESTOM Infotech Kft."#)
        XCTAssertEqual(CompanyIdentifier.estomInfotechKft.description, #"ESTOM Infotech Kft."#)
    
        // Sensovium Inc.
        XCTAssertEqual(CompanyIdentifier.sensovium.rawValue, 2257)
        XCTAssertEqual(CompanyIdentifier.sensovium.name, #"Sensovium Inc."#)
        XCTAssertEqual(CompanyIdentifier.sensovium.description, #"Sensovium Inc."#)
    
        // Virscient Limited
        XCTAssertEqual(CompanyIdentifier.virscient.rawValue, 2258)
        XCTAssertEqual(CompanyIdentifier.virscient.name, #"Virscient Limited"#)
        XCTAssertEqual(CompanyIdentifier.virscient.description, #"Virscient Limited"#)
    
        // Novel Bits, LLC
        XCTAssertEqual(CompanyIdentifier.novelBits.rawValue, 2259)
        XCTAssertEqual(CompanyIdentifier.novelBits.name, #"Novel Bits, LLC"#)
        XCTAssertEqual(CompanyIdentifier.novelBits.description, #"Novel Bits, LLC"#)
    
        // ADATA Technology Co., LTD.
        XCTAssertEqual(CompanyIdentifier.adataTechnology.rawValue, 2260)
        XCTAssertEqual(CompanyIdentifier.adataTechnology.name, #"ADATA Technology Co., LTD."#)
        XCTAssertEqual(CompanyIdentifier.adataTechnology.description, #"ADATA Technology Co., LTD."#)
    
        // KEYes
        XCTAssertEqual(CompanyIdentifier.keyes.rawValue, 2261)
        XCTAssertEqual(CompanyIdentifier.keyes.name, #"KEYes"#)
        XCTAssertEqual(CompanyIdentifier.keyes.description, #"KEYes"#)
    
        // Nome Oy
        XCTAssertEqual(CompanyIdentifier.nome.rawValue, 2262)
        XCTAssertEqual(CompanyIdentifier.nome.name, #"Nome Oy"#)
        XCTAssertEqual(CompanyIdentifier.nome.description, #"Nome Oy"#)
    
        // Inovonics Corp
        XCTAssertEqual(CompanyIdentifier.inovonics.rawValue, 2263)
        XCTAssertEqual(CompanyIdentifier.inovonics.name, #"Inovonics Corp"#)
        XCTAssertEqual(CompanyIdentifier.inovonics.description, #"Inovonics Corp"#)
    
        // WARES
        XCTAssertEqual(CompanyIdentifier.wares.rawValue, 2264)
        XCTAssertEqual(CompanyIdentifier.wares.name, #"WARES"#)
        XCTAssertEqual(CompanyIdentifier.wares.description, #"WARES"#)
    
        // Pointr Labs Limited
        XCTAssertEqual(CompanyIdentifier.pointrLabs.rawValue, 2265)
        XCTAssertEqual(CompanyIdentifier.pointrLabs.name, #"Pointr Labs Limited"#)
        XCTAssertEqual(CompanyIdentifier.pointrLabs.description, #"Pointr Labs Limited"#)
    
        // Miridia Technology Incorporated
        XCTAssertEqual(CompanyIdentifier.miridiaTechnology.rawValue, 2266)
        XCTAssertEqual(CompanyIdentifier.miridiaTechnology.name, #"Miridia Technology Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.miridiaTechnology.description, #"Miridia Technology Incorporated"#)
    
        // Tertium Technology
        XCTAssertEqual(CompanyIdentifier.tertiumTechnology.rawValue, 2267)
        XCTAssertEqual(CompanyIdentifier.tertiumTechnology.name, #"Tertium Technology"#)
        XCTAssertEqual(CompanyIdentifier.tertiumTechnology.description, #"Tertium Technology"#)
    
        // SHENZHEN AUKEY E BUSINESS CO., LTD
        XCTAssertEqual(CompanyIdentifier.shenzhenAukeyEBusiness.rawValue, 2268)
        XCTAssertEqual(CompanyIdentifier.shenzhenAukeyEBusiness.name, #"SHENZHEN AUKEY E BUSINESS CO., LTD"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenAukeyEBusiness.description, #"SHENZHEN AUKEY E BUSINESS CO., LTD"#)
    
        // code-Q
        XCTAssertEqual(CompanyIdentifier.codeQ.rawValue, 2269)
        XCTAssertEqual(CompanyIdentifier.codeQ.name, #"code-Q"#)
        XCTAssertEqual(CompanyIdentifier.codeQ.description, #"code-Q"#)
    
        // Tyco Electronics Corporation a TE Connectivity Ltd Company
        XCTAssertEqual(CompanyIdentifier.tycoElectronicsATeConnectivityCompany.rawValue, 2270)
        XCTAssertEqual(CompanyIdentifier.tycoElectronicsATeConnectivityCompany.name, #"Tyco Electronics Corporation a TE Connectivity Ltd Company"#)
        XCTAssertEqual(CompanyIdentifier.tycoElectronicsATeConnectivityCompany.description, #"Tyco Electronics Corporation a TE Connectivity Ltd Company"#)
    
        // IRIS OHYAMA CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.irisOhyama.rawValue, 2271)
        XCTAssertEqual(CompanyIdentifier.irisOhyama.name, #"IRIS OHYAMA CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.irisOhyama.description, #"IRIS OHYAMA CO.,LTD."#)
    
        // Philia Technology
        XCTAssertEqual(CompanyIdentifier.philiaTechnology.rawValue, 2272)
        XCTAssertEqual(CompanyIdentifier.philiaTechnology.name, #"Philia Technology"#)
        XCTAssertEqual(CompanyIdentifier.philiaTechnology.description, #"Philia Technology"#)
    
        // KOZO KEIKAKU ENGINEERING Inc.
        XCTAssertEqual(CompanyIdentifier.kozoKeikakuEngineering.rawValue, 2273)
        XCTAssertEqual(CompanyIdentifier.kozoKeikakuEngineering.name, #"KOZO KEIKAKU ENGINEERING Inc."#)
        XCTAssertEqual(CompanyIdentifier.kozoKeikakuEngineering.description, #"KOZO KEIKAKU ENGINEERING Inc."#)
    
        // Shenzhen Simo Technology co. LTD
        XCTAssertEqual(CompanyIdentifier.shenzhenSimoTechnology.rawValue, 2274)
        XCTAssertEqual(CompanyIdentifier.shenzhenSimoTechnology.name, #"Shenzhen Simo Technology co. LTD"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenSimoTechnology.description, #"Shenzhen Simo Technology co. LTD"#)
    
        // Republic Wireless, Inc.
        XCTAssertEqual(CompanyIdentifier.republicWireless.rawValue, 2275)
        XCTAssertEqual(CompanyIdentifier.republicWireless.name, #"Republic Wireless, Inc."#)
        XCTAssertEqual(CompanyIdentifier.republicWireless.description, #"Republic Wireless, Inc."#)
    
        // Rashidov ltd
        XCTAssertEqual(CompanyIdentifier.rashidov.rawValue, 2276)
        XCTAssertEqual(CompanyIdentifier.rashidov.name, #"Rashidov ltd"#)
        XCTAssertEqual(CompanyIdentifier.rashidov.description, #"Rashidov ltd"#)
    
        // Crowd Connected Ltd
        XCTAssertEqual(CompanyIdentifier.crowdConnected.rawValue, 2277)
        XCTAssertEqual(CompanyIdentifier.crowdConnected.name, #"Crowd Connected Ltd"#)
        XCTAssertEqual(CompanyIdentifier.crowdConnected.description, #"Crowd Connected Ltd"#)
    
        // Eneso Tecnologia de Adaptacion S.L.
        XCTAssertEqual(CompanyIdentifier.enesoTecnologiaDeAdaptacion.rawValue, 2278)
        XCTAssertEqual(CompanyIdentifier.enesoTecnologiaDeAdaptacion.name, #"Eneso Tecnologia de Adaptacion S.L."#)
        XCTAssertEqual(CompanyIdentifier.enesoTecnologiaDeAdaptacion.description, #"Eneso Tecnologia de Adaptacion S.L."#)
    
        // Barrot Technology Limited
        XCTAssertEqual(CompanyIdentifier.barrotTechnology.rawValue, 2279)
        XCTAssertEqual(CompanyIdentifier.barrotTechnology.name, #"Barrot Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.barrotTechnology.description, #"Barrot Technology Limited"#)
    
        // Naonext
        XCTAssertEqual(CompanyIdentifier.naonext.rawValue, 2280)
        XCTAssertEqual(CompanyIdentifier.naonext.name, #"Naonext"#)
        XCTAssertEqual(CompanyIdentifier.naonext.description, #"Naonext"#)
    
        // Taiwan Intelligent Home Corp.
        XCTAssertEqual(CompanyIdentifier.taiwanIntelligentHome.rawValue, 2281)
        XCTAssertEqual(CompanyIdentifier.taiwanIntelligentHome.name, #"Taiwan Intelligent Home Corp."#)
        XCTAssertEqual(CompanyIdentifier.taiwanIntelligentHome.description, #"Taiwan Intelligent Home Corp."#)
    
        // COWBELL ENGINEERING CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.cowbellEngineering.rawValue, 2282)
        XCTAssertEqual(CompanyIdentifier.cowbellEngineering.name, #"COWBELL ENGINEERING CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.cowbellEngineering.description, #"COWBELL ENGINEERING CO.,LTD."#)
    
        // Beijing Big Moment Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingBigMomentTechnology.rawValue, 2283)
        XCTAssertEqual(CompanyIdentifier.beijingBigMomentTechnology.name, #"Beijing Big Moment Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingBigMomentTechnology.description, #"Beijing Big Moment Technology Co., Ltd."#)
    
        // Denso Corporation
        XCTAssertEqual(CompanyIdentifier.denso.rawValue, 2284)
        XCTAssertEqual(CompanyIdentifier.denso.name, #"Denso Corporation"#)
        XCTAssertEqual(CompanyIdentifier.denso.description, #"Denso Corporation"#)
    
        // IMI Hydronic Engineering International SA
        XCTAssertEqual(CompanyIdentifier.imiHydronicEngineeringInternational.rawValue, 2285)
        XCTAssertEqual(CompanyIdentifier.imiHydronicEngineeringInternational.name, #"IMI Hydronic Engineering International SA"#)
        XCTAssertEqual(CompanyIdentifier.imiHydronicEngineeringInternational.description, #"IMI Hydronic Engineering International SA"#)
    
        // ASKEY
        XCTAssertEqual(CompanyIdentifier.askey.rawValue, 2286)
        XCTAssertEqual(CompanyIdentifier.askey.name, #"ASKEY"#)
        XCTAssertEqual(CompanyIdentifier.askey.description, #"ASKEY"#)
    
        // Cumulus Digital Systems, Inc
        XCTAssertEqual(CompanyIdentifier.cumulusDigitalSystems.rawValue, 2287)
        XCTAssertEqual(CompanyIdentifier.cumulusDigitalSystems.name, #"Cumulus Digital Systems, Inc"#)
        XCTAssertEqual(CompanyIdentifier.cumulusDigitalSystems.description, #"Cumulus Digital Systems, Inc"#)
    
        // Joovv, Inc.
        XCTAssertEqual(CompanyIdentifier.joovv.rawValue, 2288)
        XCTAssertEqual(CompanyIdentifier.joovv.name, #"Joovv, Inc."#)
        XCTAssertEqual(CompanyIdentifier.joovv.description, #"Joovv, Inc."#)
    
        // The L.S. Starrett Company
        XCTAssertEqual(CompanyIdentifier.lSStarrettCompany.rawValue, 2289)
        XCTAssertEqual(CompanyIdentifier.lSStarrettCompany.name, #"The L.S. Starrett Company"#)
        XCTAssertEqual(CompanyIdentifier.lSStarrettCompany.description, #"The L.S. Starrett Company"#)
    
        // Microoled
        XCTAssertEqual(CompanyIdentifier.microoled.rawValue, 2290)
        XCTAssertEqual(CompanyIdentifier.microoled.name, #"Microoled"#)
        XCTAssertEqual(CompanyIdentifier.microoled.description, #"Microoled"#)
    
        // PSP - Pauli Services & Products GmbH
        XCTAssertEqual(CompanyIdentifier.pspPauliServicesProducts.rawValue, 2291)
        XCTAssertEqual(CompanyIdentifier.pspPauliServicesProducts.name, #"PSP - Pauli Services & Products GmbH"#)
        XCTAssertEqual(CompanyIdentifier.pspPauliServicesProducts.description, #"PSP - Pauli Services & Products GmbH"#)
    
        // Kodimo Technologies Company Limited
        XCTAssertEqual(CompanyIdentifier.kodimoTechnologiesCompany.rawValue, 2292)
        XCTAssertEqual(CompanyIdentifier.kodimoTechnologiesCompany.name, #"Kodimo Technologies Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.kodimoTechnologiesCompany.description, #"Kodimo Technologies Company Limited"#)
    
        // Tymtix Technologies Private Limited
        XCTAssertEqual(CompanyIdentifier.tymtixTechnologies.rawValue, 2293)
        XCTAssertEqual(CompanyIdentifier.tymtixTechnologies.name, #"Tymtix Technologies Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.tymtixTechnologies.description, #"Tymtix Technologies Private Limited"#)
    
        // Dermal Photonics Corporation
        XCTAssertEqual(CompanyIdentifier.dermalPhotonics.rawValue, 2294)
        XCTAssertEqual(CompanyIdentifier.dermalPhotonics.name, #"Dermal Photonics Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dermalPhotonics.description, #"Dermal Photonics Corporation"#)
    
        // MTD Products Inc & Affiliates
        XCTAssertEqual(CompanyIdentifier.mtdProductsAffiliates.rawValue, 2295)
        XCTAssertEqual(CompanyIdentifier.mtdProductsAffiliates.name, #"MTD Products Inc & Affiliates"#)
        XCTAssertEqual(CompanyIdentifier.mtdProductsAffiliates.description, #"MTD Products Inc & Affiliates"#)
    
        // instagrid GmbH
        XCTAssertEqual(CompanyIdentifier.instagrid.rawValue, 2296)
        XCTAssertEqual(CompanyIdentifier.instagrid.name, #"instagrid GmbH"#)
        XCTAssertEqual(CompanyIdentifier.instagrid.description, #"instagrid GmbH"#)
    
        // Spacelabs Medical Inc.
        XCTAssertEqual(CompanyIdentifier.spacelabsMedical.rawValue, 2297)
        XCTAssertEqual(CompanyIdentifier.spacelabsMedical.name, #"Spacelabs Medical Inc."#)
        XCTAssertEqual(CompanyIdentifier.spacelabsMedical.description, #"Spacelabs Medical Inc."#)
    
        // Troo Corporation
        XCTAssertEqual(CompanyIdentifier.troo.rawValue, 2298)
        XCTAssertEqual(CompanyIdentifier.troo.name, #"Troo Corporation"#)
        XCTAssertEqual(CompanyIdentifier.troo.description, #"Troo Corporation"#)
    
        // Darkglass Electronics Oy
        XCTAssertEqual(CompanyIdentifier.darkglassElectronics.rawValue, 2299)
        XCTAssertEqual(CompanyIdentifier.darkglassElectronics.name, #"Darkglass Electronics Oy"#)
        XCTAssertEqual(CompanyIdentifier.darkglassElectronics.description, #"Darkglass Electronics Oy"#)
    
        // Hill-Rom
        XCTAssertEqual(CompanyIdentifier.hillRom.rawValue, 2300)
        XCTAssertEqual(CompanyIdentifier.hillRom.name, #"Hill-Rom"#)
        XCTAssertEqual(CompanyIdentifier.hillRom.description, #"Hill-Rom"#)
    
        // BioIntelliSense, Inc.
        XCTAssertEqual(CompanyIdentifier.biointellisense.rawValue, 2301)
        XCTAssertEqual(CompanyIdentifier.biointellisense.name, #"BioIntelliSense, Inc."#)
        XCTAssertEqual(CompanyIdentifier.biointellisense.description, #"BioIntelliSense, Inc."#)
    
        // Ketronixs Sdn Bhd
        XCTAssertEqual(CompanyIdentifier.ketronixsSdnBhd.rawValue, 2302)
        XCTAssertEqual(CompanyIdentifier.ketronixsSdnBhd.name, #"Ketronixs Sdn Bhd"#)
        XCTAssertEqual(CompanyIdentifier.ketronixsSdnBhd.description, #"Ketronixs Sdn Bhd"#)
    
        // Plastimold Products, Inc
        XCTAssertEqual(CompanyIdentifier.plastimoldProducts.rawValue, 2303)
        XCTAssertEqual(CompanyIdentifier.plastimoldProducts.name, #"Plastimold Products, Inc"#)
        XCTAssertEqual(CompanyIdentifier.plastimoldProducts.description, #"Plastimold Products, Inc"#)
    
        // Beijing Zizai Technology Co., LTD.
        XCTAssertEqual(CompanyIdentifier.beijingZizaiTechnology.rawValue, 2304)
        XCTAssertEqual(CompanyIdentifier.beijingZizaiTechnology.name, #"Beijing Zizai Technology Co., LTD."#)
        XCTAssertEqual(CompanyIdentifier.beijingZizaiTechnology.description, #"Beijing Zizai Technology Co., LTD."#)
    
        // Lucimed
        XCTAssertEqual(CompanyIdentifier.lucimed.rawValue, 2305)
        XCTAssertEqual(CompanyIdentifier.lucimed.name, #"Lucimed"#)
        XCTAssertEqual(CompanyIdentifier.lucimed.description, #"Lucimed"#)
    
        // TSC Auto-ID Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.tscAutoIdTechnology.rawValue, 2306)
        XCTAssertEqual(CompanyIdentifier.tscAutoIdTechnology.name, #"TSC Auto-ID Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.tscAutoIdTechnology.description, #"TSC Auto-ID Technology Co., Ltd."#)
    
        // DATAMARS, Inc.
        XCTAssertEqual(CompanyIdentifier.datamars.rawValue, 2307)
        XCTAssertEqual(CompanyIdentifier.datamars.name, #"DATAMARS, Inc."#)
        XCTAssertEqual(CompanyIdentifier.datamars.description, #"DATAMARS, Inc."#)
    
        // SUNCORPORATION
        XCTAssertEqual(CompanyIdentifier.suncorporation.rawValue, 2308)
        XCTAssertEqual(CompanyIdentifier.suncorporation.name, #"SUNCORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.suncorporation.description, #"SUNCORPORATION"#)
    
        // Yandex Services AG
        XCTAssertEqual(CompanyIdentifier.yandexServices.rawValue, 2309)
        XCTAssertEqual(CompanyIdentifier.yandexServices.name, #"Yandex Services AG"#)
        XCTAssertEqual(CompanyIdentifier.yandexServices.description, #"Yandex Services AG"#)
    
        // Scope Logistical Solutions
        XCTAssertEqual(CompanyIdentifier.scopeLogisticalSolutions.rawValue, 2310)
        XCTAssertEqual(CompanyIdentifier.scopeLogisticalSolutions.name, #"Scope Logistical Solutions"#)
        XCTAssertEqual(CompanyIdentifier.scopeLogisticalSolutions.description, #"Scope Logistical Solutions"#)
    
        // User Hello, LLC
        XCTAssertEqual(CompanyIdentifier.userHello.rawValue, 2311)
        XCTAssertEqual(CompanyIdentifier.userHello.name, #"User Hello, LLC"#)
        XCTAssertEqual(CompanyIdentifier.userHello.description, #"User Hello, LLC"#)
    
        // Pinpoint Innovations Limited
        XCTAssertEqual(CompanyIdentifier.pinpointInnovations.rawValue, 2312)
        XCTAssertEqual(CompanyIdentifier.pinpointInnovations.name, #"Pinpoint Innovations Limited"#)
        XCTAssertEqual(CompanyIdentifier.pinpointInnovations.description, #"Pinpoint Innovations Limited"#)
    
        // 70mai Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.company70Mai.rawValue, 2313)
        XCTAssertEqual(CompanyIdentifier.company70Mai.name, #"70mai Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.company70Mai.description, #"70mai Co.,Ltd."#)
    
        // Zhuhai Hoksi Technology CO.,LTD
        XCTAssertEqual(CompanyIdentifier.zhuhaiHoksiTechnology.rawValue, 2314)
        XCTAssertEqual(CompanyIdentifier.zhuhaiHoksiTechnology.name, #"Zhuhai Hoksi Technology CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.zhuhaiHoksiTechnology.description, #"Zhuhai Hoksi Technology CO.,LTD"#)
    
        // EMBR labs, INC
        XCTAssertEqual(CompanyIdentifier.embrLabs.rawValue, 2315)
        XCTAssertEqual(CompanyIdentifier.embrLabs.name, #"EMBR labs, INC"#)
        XCTAssertEqual(CompanyIdentifier.embrLabs.description, #"EMBR labs, INC"#)
    
        // Radiawave Technologies Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.radiawaveTechnologies.rawValue, 2316)
        XCTAssertEqual(CompanyIdentifier.radiawaveTechnologies.name, #"Radiawave Technologies Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.radiawaveTechnologies.description, #"Radiawave Technologies Co.,Ltd."#)
    
        // IOT Invent GmbH
        XCTAssertEqual(CompanyIdentifier.iotInvent.rawValue, 2317)
        XCTAssertEqual(CompanyIdentifier.iotInvent.name, #"IOT Invent GmbH"#)
        XCTAssertEqual(CompanyIdentifier.iotInvent.description, #"IOT Invent GmbH"#)
    
        // OPTIMUSIOT TECH LLP
        XCTAssertEqual(CompanyIdentifier.optimusiotTechLlp.rawValue, 2318)
        XCTAssertEqual(CompanyIdentifier.optimusiotTechLlp.name, #"OPTIMUSIOT TECH LLP"#)
        XCTAssertEqual(CompanyIdentifier.optimusiotTechLlp.description, #"OPTIMUSIOT TECH LLP"#)
    
        // VC Inc.
        XCTAssertEqual(CompanyIdentifier.vc.rawValue, 2319)
        XCTAssertEqual(CompanyIdentifier.vc.name, #"VC Inc."#)
        XCTAssertEqual(CompanyIdentifier.vc.description, #"VC Inc."#)
    
        // ASR Microelectronics (Shanghai) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShanghai.rawValue, 2320)
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShanghai.name, #"ASR Microelectronics (Shanghai) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShanghai.description, #"ASR Microelectronics (Shanghai) Co., Ltd."#)
    
        // Douglas Lighting Controls Inc.
        XCTAssertEqual(CompanyIdentifier.douglasLightingControls.rawValue, 2321)
        XCTAssertEqual(CompanyIdentifier.douglasLightingControls.name, #"Douglas Lighting Controls Inc."#)
        XCTAssertEqual(CompanyIdentifier.douglasLightingControls.description, #"Douglas Lighting Controls Inc."#)
    
        // Nerbio Medical Software Platforms Inc
        XCTAssertEqual(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.rawValue, 2322)
        XCTAssertEqual(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.name, #"Nerbio Medical Software Platforms Inc"#)
        XCTAssertEqual(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.description, #"Nerbio Medical Software Platforms Inc"#)
    
        // Braveheart Wireless, Inc.
        XCTAssertEqual(CompanyIdentifier.braveheartWireless.rawValue, 2323)
        XCTAssertEqual(CompanyIdentifier.braveheartWireless.name, #"Braveheart Wireless, Inc."#)
        XCTAssertEqual(CompanyIdentifier.braveheartWireless.description, #"Braveheart Wireless, Inc."#)
    
        // INEO-SENSE
        XCTAssertEqual(CompanyIdentifier.ineoSense.rawValue, 2324)
        XCTAssertEqual(CompanyIdentifier.ineoSense.name, #"INEO-SENSE"#)
        XCTAssertEqual(CompanyIdentifier.ineoSense.description, #"INEO-SENSE"#)
    
        // Honda Motor Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.hondaMotor.rawValue, 2325)
        XCTAssertEqual(CompanyIdentifier.hondaMotor.name, #"Honda Motor Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.hondaMotor.description, #"Honda Motor Co., Ltd."#)
    
        // Ambient Sensors LLC
        XCTAssertEqual(CompanyIdentifier.ambientSensors.rawValue, 2326)
        XCTAssertEqual(CompanyIdentifier.ambientSensors.name, #"Ambient Sensors LLC"#)
        XCTAssertEqual(CompanyIdentifier.ambientSensors.description, #"Ambient Sensors LLC"#)
    
        // ASR Microelectronics(ShenZhen)Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShenzhen.rawValue, 2327)
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShenzhen.name, #"ASR Microelectronics(ShenZhen)Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.asrMicroelectronicsShenzhen.description, #"ASR Microelectronics(ShenZhen)Co., Ltd."#)
    
        // Technosphere Labs Pvt. Ltd.
        XCTAssertEqual(CompanyIdentifier.technosphereLabs.rawValue, 2328)
        XCTAssertEqual(CompanyIdentifier.technosphereLabs.name, #"Technosphere Labs Pvt. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.technosphereLabs.description, #"Technosphere Labs Pvt. Ltd."#)
    
        // NO SMD LIMITED
        XCTAssertEqual(CompanyIdentifier.noSmd.rawValue, 2329)
        XCTAssertEqual(CompanyIdentifier.noSmd.name, #"NO SMD LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.noSmd.description, #"NO SMD LIMITED"#)
    
        // Albertronic BV
        XCTAssertEqual(CompanyIdentifier.albertronic.rawValue, 2330)
        XCTAssertEqual(CompanyIdentifier.albertronic.name, #"Albertronic BV"#)
        XCTAssertEqual(CompanyIdentifier.albertronic.description, #"Albertronic BV"#)
    
        // Luminostics, Inc.
        XCTAssertEqual(CompanyIdentifier.luminostics.rawValue, 2331)
        XCTAssertEqual(CompanyIdentifier.luminostics.name, #"Luminostics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.luminostics.description, #"Luminostics, Inc."#)
    
        // Oblamatik AG
        XCTAssertEqual(CompanyIdentifier.oblamatik.rawValue, 2332)
        XCTAssertEqual(CompanyIdentifier.oblamatik.name, #"Oblamatik AG"#)
        XCTAssertEqual(CompanyIdentifier.oblamatik.description, #"Oblamatik AG"#)
    
        // Innokind, Inc.
        XCTAssertEqual(CompanyIdentifier.innokind.rawValue, 2333)
        XCTAssertEqual(CompanyIdentifier.innokind.name, #"Innokind, Inc."#)
        XCTAssertEqual(CompanyIdentifier.innokind.description, #"Innokind, Inc."#)
    
        // Melbot Studios, Sociedad Limitada
        XCTAssertEqual(CompanyIdentifier.melbotStudiosSociedadLimitada.rawValue, 2334)
        XCTAssertEqual(CompanyIdentifier.melbotStudiosSociedadLimitada.name, #"Melbot Studios, Sociedad Limitada"#)
        XCTAssertEqual(CompanyIdentifier.melbotStudiosSociedadLimitada.description, #"Melbot Studios, Sociedad Limitada"#)
    
        // Myzee Technology
        XCTAssertEqual(CompanyIdentifier.myzeeTechnology.rawValue, 2335)
        XCTAssertEqual(CompanyIdentifier.myzeeTechnology.name, #"Myzee Technology"#)
        XCTAssertEqual(CompanyIdentifier.myzeeTechnology.description, #"Myzee Technology"#)
    
        // Omnisense Limited
        XCTAssertEqual(CompanyIdentifier.omnisense.rawValue, 2336)
        XCTAssertEqual(CompanyIdentifier.omnisense.name, #"Omnisense Limited"#)
        XCTAssertEqual(CompanyIdentifier.omnisense.description, #"Omnisense Limited"#)
    
        // KAHA PTE. LTD.
        XCTAssertEqual(CompanyIdentifier.kahaPte.rawValue, 2337)
        XCTAssertEqual(CompanyIdentifier.kahaPte.name, #"KAHA PTE. LTD."#)
        XCTAssertEqual(CompanyIdentifier.kahaPte.description, #"KAHA PTE. LTD."#)
    
        // Shanghai MXCHIP Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiMxchipInformationTechnology.rawValue, 2338)
        XCTAssertEqual(CompanyIdentifier.shanghaiMxchipInformationTechnology.name, #"Shanghai MXCHIP Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiMxchipInformationTechnology.description, #"Shanghai MXCHIP Information Technology Co., Ltd."#)
    
        // JSB TECH PTE LTD
        XCTAssertEqual(CompanyIdentifier.jsbTechPte.rawValue, 2339)
        XCTAssertEqual(CompanyIdentifier.jsbTechPte.name, #"JSB TECH PTE LTD"#)
        XCTAssertEqual(CompanyIdentifier.jsbTechPte.description, #"JSB TECH PTE LTD"#)
    
        // Fundacion Tecnalia Research and Innovation
        XCTAssertEqual(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.rawValue, 2340)
        XCTAssertEqual(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.name, #"Fundacion Tecnalia Research and Innovation"#)
        XCTAssertEqual(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.description, #"Fundacion Tecnalia Research and Innovation"#)
    
        // Yukai Engineering Inc.
        XCTAssertEqual(CompanyIdentifier.yukaiEngineering.rawValue, 2341)
        XCTAssertEqual(CompanyIdentifier.yukaiEngineering.name, #"Yukai Engineering Inc."#)
        XCTAssertEqual(CompanyIdentifier.yukaiEngineering.description, #"Yukai Engineering Inc."#)
    
        // Gooligum Technologies Pty Ltd
        XCTAssertEqual(CompanyIdentifier.gooligumTechnologiesPty.rawValue, 2342)
        XCTAssertEqual(CompanyIdentifier.gooligumTechnologiesPty.name, #"Gooligum Technologies Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.gooligumTechnologiesPty.description, #"Gooligum Technologies Pty Ltd"#)
    
        // ROOQ GmbH
        XCTAssertEqual(CompanyIdentifier.rooq.rawValue, 2343)
        XCTAssertEqual(CompanyIdentifier.rooq.name, #"ROOQ GmbH"#)
        XCTAssertEqual(CompanyIdentifier.rooq.description, #"ROOQ GmbH"#)
    
        // AiRISTA
        XCTAssertEqual(CompanyIdentifier.airista.rawValue, 2344)
        XCTAssertEqual(CompanyIdentifier.airista.name, #"AiRISTA"#)
        XCTAssertEqual(CompanyIdentifier.airista.description, #"AiRISTA"#)
    
        // Qingdao Haier Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.qingdaoHaierTechnology.rawValue, 2345)
        XCTAssertEqual(CompanyIdentifier.qingdaoHaierTechnology.name, #"Qingdao Haier Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.qingdaoHaierTechnology.description, #"Qingdao Haier Technology Co., Ltd."#)
    
        // Sappl Verwaltungs- und Betriebs GmbH
        XCTAssertEqual(CompanyIdentifier.sapplVerwaltungsUndBetriebs.rawValue, 2346)
        XCTAssertEqual(CompanyIdentifier.sapplVerwaltungsUndBetriebs.name, #"Sappl Verwaltungs- und Betriebs GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sapplVerwaltungsUndBetriebs.description, #"Sappl Verwaltungs- und Betriebs GmbH"#)
    
        // TekHome
        XCTAssertEqual(CompanyIdentifier.tekhome.rawValue, 2347)
        XCTAssertEqual(CompanyIdentifier.tekhome.name, #"TekHome"#)
        XCTAssertEqual(CompanyIdentifier.tekhome.description, #"TekHome"#)
    
        // PCI Private Limited
        XCTAssertEqual(CompanyIdentifier.pci.rawValue, 2348)
        XCTAssertEqual(CompanyIdentifier.pci.name, #"PCI Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.pci.description, #"PCI Private Limited"#)
    
        // Leggett & Platt, Incorporated
        XCTAssertEqual(CompanyIdentifier.leggettPlatt.rawValue, 2349)
        XCTAssertEqual(CompanyIdentifier.leggettPlatt.name, #"Leggett & Platt, Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.leggettPlatt.description, #"Leggett & Platt, Incorporated"#)
    
        // PS GmbH
        XCTAssertEqual(CompanyIdentifier.ps.rawValue, 2350)
        XCTAssertEqual(CompanyIdentifier.ps.name, #"PS GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ps.description, #"PS GmbH"#)
    
        // C.O.B.O. SpA
        XCTAssertEqual(CompanyIdentifier.cOBOSpa.rawValue, 2351)
        XCTAssertEqual(CompanyIdentifier.cOBOSpa.name, #"C.O.B.O. SpA"#)
        XCTAssertEqual(CompanyIdentifier.cOBOSpa.description, #"C.O.B.O. SpA"#)
    
        // James Walker RotaBolt Limited
        XCTAssertEqual(CompanyIdentifier.jamesWalkerRotabolt.rawValue, 2352)
        XCTAssertEqual(CompanyIdentifier.jamesWalkerRotabolt.name, #"James Walker RotaBolt Limited"#)
        XCTAssertEqual(CompanyIdentifier.jamesWalkerRotabolt.description, #"James Walker RotaBolt Limited"#)
    
        // BREATHINGS Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.breathings.rawValue, 2353)
        XCTAssertEqual(CompanyIdentifier.breathings.name, #"BREATHINGS Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.breathings.description, #"BREATHINGS Co., Ltd."#)
    
        // BarVision, LLC
        XCTAssertEqual(CompanyIdentifier.barvision.rawValue, 2354)
        XCTAssertEqual(CompanyIdentifier.barvision.name, #"BarVision, LLC"#)
        XCTAssertEqual(CompanyIdentifier.barvision.description, #"BarVision, LLC"#)
    
        // SRAM
        XCTAssertEqual(CompanyIdentifier.sram.rawValue, 2355)
        XCTAssertEqual(CompanyIdentifier.sram.name, #"SRAM"#)
        XCTAssertEqual(CompanyIdentifier.sram.description, #"SRAM"#)
    
        // KiteSpring Inc.
        XCTAssertEqual(CompanyIdentifier.kitespring.rawValue, 2356)
        XCTAssertEqual(CompanyIdentifier.kitespring.name, #"KiteSpring Inc."#)
        XCTAssertEqual(CompanyIdentifier.kitespring.description, #"KiteSpring Inc."#)
    
        // Reconnect, Inc.
        XCTAssertEqual(CompanyIdentifier.reconnect.rawValue, 2357)
        XCTAssertEqual(CompanyIdentifier.reconnect.name, #"Reconnect, Inc."#)
        XCTAssertEqual(CompanyIdentifier.reconnect.description, #"Reconnect, Inc."#)
    
        // Elekon AG
        XCTAssertEqual(CompanyIdentifier.elekon.rawValue, 2358)
        XCTAssertEqual(CompanyIdentifier.elekon.name, #"Elekon AG"#)
        XCTAssertEqual(CompanyIdentifier.elekon.description, #"Elekon AG"#)
    
        // RealThingks GmbH
        XCTAssertEqual(CompanyIdentifier.realthingks.rawValue, 2359)
        XCTAssertEqual(CompanyIdentifier.realthingks.name, #"RealThingks GmbH"#)
        XCTAssertEqual(CompanyIdentifier.realthingks.description, #"RealThingks GmbH"#)
    
        // Henway Technologies, LTD.
        XCTAssertEqual(CompanyIdentifier.henwayTechnologies.rawValue, 2360)
        XCTAssertEqual(CompanyIdentifier.henwayTechnologies.name, #"Henway Technologies, LTD."#)
        XCTAssertEqual(CompanyIdentifier.henwayTechnologies.description, #"Henway Technologies, LTD."#)
    
        // ASTEM Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.astem.rawValue, 2361)
        XCTAssertEqual(CompanyIdentifier.astem.name, #"ASTEM Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.astem.description, #"ASTEM Co.,Ltd."#)
    
        // LinkedSemi Microelectronics (Xiamen) Co., Ltd
        XCTAssertEqual(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.rawValue, 2362)
        XCTAssertEqual(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.name, #"LinkedSemi Microelectronics (Xiamen) Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.description, #"LinkedSemi Microelectronics (Xiamen) Co., Ltd"#)
    
        // ENSESO LLC
        XCTAssertEqual(CompanyIdentifier.enseso.rawValue, 2363)
        XCTAssertEqual(CompanyIdentifier.enseso.name, #"ENSESO LLC"#)
        XCTAssertEqual(CompanyIdentifier.enseso.description, #"ENSESO LLC"#)
    
        // Xenoma Inc.
        XCTAssertEqual(CompanyIdentifier.xenoma.rawValue, 2364)
        XCTAssertEqual(CompanyIdentifier.xenoma.name, #"Xenoma Inc."#)
        XCTAssertEqual(CompanyIdentifier.xenoma.description, #"Xenoma Inc."#)
    
        // Adolf Wuerth GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.adolfWuerth.rawValue, 2365)
        XCTAssertEqual(CompanyIdentifier.adolfWuerth.name, #"Adolf Wuerth GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.adolfWuerth.description, #"Adolf Wuerth GmbH & Co KG"#)
    
        // Catalyft Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.catalyftLabs.rawValue, 2366)
        XCTAssertEqual(CompanyIdentifier.catalyftLabs.name, #"Catalyft Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.catalyftLabs.description, #"Catalyft Labs, Inc."#)
    
        // JEPICO Corporation
        XCTAssertEqual(CompanyIdentifier.jepico.rawValue, 2367)
        XCTAssertEqual(CompanyIdentifier.jepico.name, #"JEPICO Corporation"#)
        XCTAssertEqual(CompanyIdentifier.jepico.description, #"JEPICO Corporation"#)
    
        // Hero Workout GmbH
        XCTAssertEqual(CompanyIdentifier.heroWorkout.rawValue, 2368)
        XCTAssertEqual(CompanyIdentifier.heroWorkout.name, #"Hero Workout GmbH"#)
        XCTAssertEqual(CompanyIdentifier.heroWorkout.description, #"Hero Workout GmbH"#)
    
        // Rivian Automotive, LLC
        XCTAssertEqual(CompanyIdentifier.rivianAutomotive.rawValue, 2369)
        XCTAssertEqual(CompanyIdentifier.rivianAutomotive.name, #"Rivian Automotive, LLC"#)
        XCTAssertEqual(CompanyIdentifier.rivianAutomotive.description, #"Rivian Automotive, LLC"#)
    
        // TRANSSION HOLDINGS LIMITED
        XCTAssertEqual(CompanyIdentifier.transsionHoldings.rawValue, 2370)
        XCTAssertEqual(CompanyIdentifier.transsionHoldings.name, #"TRANSSION HOLDINGS LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.transsionHoldings.description, #"TRANSSION HOLDINGS LIMITED"#)
    
        // Reserved
        XCTAssertEqual(CompanyIdentifier.reserved2.rawValue, 2371)
        XCTAssertEqual(CompanyIdentifier.reserved2.name, #"Reserved"#)
        XCTAssertEqual(CompanyIdentifier.reserved2.description, #"Reserved"#)
    
        // Agitron d.o.o.
        XCTAssertEqual(CompanyIdentifier.agitron.rawValue, 2372)
        XCTAssertEqual(CompanyIdentifier.agitron.name, #"Agitron d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.agitron.description, #"Agitron d.o.o."#)
    
        // Globe (Jiangsu) Co., Ltd
        XCTAssertEqual(CompanyIdentifier.globeJiangsu.rawValue, 2373)
        XCTAssertEqual(CompanyIdentifier.globeJiangsu.name, #"Globe (Jiangsu) Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.globeJiangsu.description, #"Globe (Jiangsu) Co., Ltd"#)
    
        // AMC International Alfa Metalcraft Corporation AG
        XCTAssertEqual(CompanyIdentifier.amcInternationalAlfaMetalcraft.rawValue, 2374)
        XCTAssertEqual(CompanyIdentifier.amcInternationalAlfaMetalcraft.name, #"AMC International Alfa Metalcraft Corporation AG"#)
        XCTAssertEqual(CompanyIdentifier.amcInternationalAlfaMetalcraft.description, #"AMC International Alfa Metalcraft Corporation AG"#)
    
        // First Light Technologies Ltd.
        XCTAssertEqual(CompanyIdentifier.firstLightTechnologies.rawValue, 2375)
        XCTAssertEqual(CompanyIdentifier.firstLightTechnologies.name, #"First Light Technologies Ltd."#)
        XCTAssertEqual(CompanyIdentifier.firstLightTechnologies.description, #"First Light Technologies Ltd."#)
    
        // Wearable Link Limited
        XCTAssertEqual(CompanyIdentifier.wearableLink.rawValue, 2376)
        XCTAssertEqual(CompanyIdentifier.wearableLink.name, #"Wearable Link Limited"#)
        XCTAssertEqual(CompanyIdentifier.wearableLink.description, #"Wearable Link Limited"#)
    
        // Metronom Health Europe
        XCTAssertEqual(CompanyIdentifier.metronomHealthEurope.rawValue, 2377)
        XCTAssertEqual(CompanyIdentifier.metronomHealthEurope.name, #"Metronom Health Europe"#)
        XCTAssertEqual(CompanyIdentifier.metronomHealthEurope.description, #"Metronom Health Europe"#)
    
        // Zwift, Inc.
        XCTAssertEqual(CompanyIdentifier.zwift.rawValue, 2378)
        XCTAssertEqual(CompanyIdentifier.zwift.name, #"Zwift, Inc."#)
        XCTAssertEqual(CompanyIdentifier.zwift.description, #"Zwift, Inc."#)
    
        // Kindeva Drug Delivery L.P.
        XCTAssertEqual(CompanyIdentifier.kindevaDrugDeliveryLP.rawValue, 2379)
        XCTAssertEqual(CompanyIdentifier.kindevaDrugDeliveryLP.name, #"Kindeva Drug Delivery L.P."#)
        XCTAssertEqual(CompanyIdentifier.kindevaDrugDeliveryLP.description, #"Kindeva Drug Delivery L.P."#)
    
        // GimmiSys GmbH
        XCTAssertEqual(CompanyIdentifier.gimmisys.rawValue, 2380)
        XCTAssertEqual(CompanyIdentifier.gimmisys.name, #"GimmiSys GmbH"#)
        XCTAssertEqual(CompanyIdentifier.gimmisys.description, #"GimmiSys GmbH"#)
    
        // tkLABS INC.
        XCTAssertEqual(CompanyIdentifier.tklabs.rawValue, 2381)
        XCTAssertEqual(CompanyIdentifier.tklabs.name, #"tkLABS INC."#)
        XCTAssertEqual(CompanyIdentifier.tklabs.description, #"tkLABS INC."#)
    
        // PassiveBolt, Inc.
        XCTAssertEqual(CompanyIdentifier.passivebolt.rawValue, 2382)
        XCTAssertEqual(CompanyIdentifier.passivebolt.name, #"PassiveBolt, Inc."#)
        XCTAssertEqual(CompanyIdentifier.passivebolt.description, #"PassiveBolt, Inc."#)
    
        // Limited Liability Company "Mikrotikls"
        XCTAssertEqual(CompanyIdentifier.limitedLiabilityCompanyMikrotikls.rawValue, 2383)
        XCTAssertEqual(CompanyIdentifier.limitedLiabilityCompanyMikrotikls.name, #"Limited Liability Company "Mikrotikls""#)
        XCTAssertEqual(CompanyIdentifier.limitedLiabilityCompanyMikrotikls.description, #"Limited Liability Company "Mikrotikls""#)
    
        // Capetech
        XCTAssertEqual(CompanyIdentifier.capetech.rawValue, 2384)
        XCTAssertEqual(CompanyIdentifier.capetech.name, #"Capetech"#)
        XCTAssertEqual(CompanyIdentifier.capetech.description, #"Capetech"#)
    
        // PPRS
        XCTAssertEqual(CompanyIdentifier.pprs.rawValue, 2385)
        XCTAssertEqual(CompanyIdentifier.pprs.name, #"PPRS"#)
        XCTAssertEqual(CompanyIdentifier.pprs.description, #"PPRS"#)
    
        // Apptricity Corporation
        XCTAssertEqual(CompanyIdentifier.apptricity.rawValue, 2386)
        XCTAssertEqual(CompanyIdentifier.apptricity.name, #"Apptricity Corporation"#)
        XCTAssertEqual(CompanyIdentifier.apptricity.description, #"Apptricity Corporation"#)
    
        // LogiLube, LLC
        XCTAssertEqual(CompanyIdentifier.logilube.rawValue, 2387)
        XCTAssertEqual(CompanyIdentifier.logilube.name, #"LogiLube, LLC"#)
        XCTAssertEqual(CompanyIdentifier.logilube.description, #"LogiLube, LLC"#)
    
        // Julbo
        XCTAssertEqual(CompanyIdentifier.julbo.rawValue, 2388)
        XCTAssertEqual(CompanyIdentifier.julbo.name, #"Julbo"#)
        XCTAssertEqual(CompanyIdentifier.julbo.description, #"Julbo"#)
    
        // Breville Group
        XCTAssertEqual(CompanyIdentifier.brevilleGroup.rawValue, 2389)
        XCTAssertEqual(CompanyIdentifier.brevilleGroup.name, #"Breville Group"#)
        XCTAssertEqual(CompanyIdentifier.brevilleGroup.description, #"Breville Group"#)
    
        // Kerlink
        XCTAssertEqual(CompanyIdentifier.kerlink.rawValue, 2390)
        XCTAssertEqual(CompanyIdentifier.kerlink.name, #"Kerlink"#)
        XCTAssertEqual(CompanyIdentifier.kerlink.description, #"Kerlink"#)
    
        // Ohsung Electronics
        XCTAssertEqual(CompanyIdentifier.ohsungElectronics.rawValue, 2391)
        XCTAssertEqual(CompanyIdentifier.ohsungElectronics.name, #"Ohsung Electronics"#)
        XCTAssertEqual(CompanyIdentifier.ohsungElectronics.description, #"Ohsung Electronics"#)
    
        // ZTE Corporation
        XCTAssertEqual(CompanyIdentifier.zte.rawValue, 2392)
        XCTAssertEqual(CompanyIdentifier.zte.name, #"ZTE Corporation"#)
        XCTAssertEqual(CompanyIdentifier.zte.description, #"ZTE Corporation"#)
    
        // HerdDogg, Inc
        XCTAssertEqual(CompanyIdentifier.herddogg.rawValue, 2393)
        XCTAssertEqual(CompanyIdentifier.herddogg.name, #"HerdDogg, Inc"#)
        XCTAssertEqual(CompanyIdentifier.herddogg.description, #"HerdDogg, Inc"#)
    
        // Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi
        XCTAssertEqual(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.rawValue, 2394)
        XCTAssertEqual(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.name, #"Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi"#)
        XCTAssertEqual(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.description, #"Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi"#)
    
        // Lismore Instruments Limited
        XCTAssertEqual(CompanyIdentifier.lismoreInstruments.rawValue, 2395)
        XCTAssertEqual(CompanyIdentifier.lismoreInstruments.name, #"Lismore Instruments Limited"#)
        XCTAssertEqual(CompanyIdentifier.lismoreInstruments.description, #"Lismore Instruments Limited"#)
    
        // LogiLube, LLC
        XCTAssertEqual(CompanyIdentifier.logilube2.rawValue, 2396)
        XCTAssertEqual(CompanyIdentifier.logilube2.name, #"LogiLube, LLC"#)
        XCTAssertEqual(CompanyIdentifier.logilube2.description, #"LogiLube, LLC"#)
    
        // ETC
        XCTAssertEqual(CompanyIdentifier.etc.rawValue, 2397)
        XCTAssertEqual(CompanyIdentifier.etc.name, #"ETC"#)
        XCTAssertEqual(CompanyIdentifier.etc.description, #"ETC"#)
    
        // BioEchoNet inc.
        XCTAssertEqual(CompanyIdentifier.bioechonet.rawValue, 2398)
        XCTAssertEqual(CompanyIdentifier.bioechonet.name, #"BioEchoNet inc."#)
        XCTAssertEqual(CompanyIdentifier.bioechonet.description, #"BioEchoNet inc."#)
    
        // NUANCE HEARING LTD
        XCTAssertEqual(CompanyIdentifier.nuanceHearing.rawValue, 2399)
        XCTAssertEqual(CompanyIdentifier.nuanceHearing.name, #"NUANCE HEARING LTD"#)
        XCTAssertEqual(CompanyIdentifier.nuanceHearing.description, #"NUANCE HEARING LTD"#)
    
        // Sena Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.senaTechnologies.rawValue, 2400)
        XCTAssertEqual(CompanyIdentifier.senaTechnologies.name, #"Sena Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.senaTechnologies.description, #"Sena Technologies Inc."#)
    
        // Linkura AB
        XCTAssertEqual(CompanyIdentifier.linkura.rawValue, 2401)
        XCTAssertEqual(CompanyIdentifier.linkura.name, #"Linkura AB"#)
        XCTAssertEqual(CompanyIdentifier.linkura.description, #"Linkura AB"#)
    
        // GL Solutions K.K.
        XCTAssertEqual(CompanyIdentifier.glSolutionsKK.rawValue, 2402)
        XCTAssertEqual(CompanyIdentifier.glSolutionsKK.name, #"GL Solutions K.K."#)
        XCTAssertEqual(CompanyIdentifier.glSolutionsKK.description, #"GL Solutions K.K."#)
    
        // Moonbird BV
        XCTAssertEqual(CompanyIdentifier.moonbird.rawValue, 2403)
        XCTAssertEqual(CompanyIdentifier.moonbird.name, #"Moonbird BV"#)
        XCTAssertEqual(CompanyIdentifier.moonbird.description, #"Moonbird BV"#)
    
        // Countrymate Technology Limited
        XCTAssertEqual(CompanyIdentifier.countrymateTechnology.rawValue, 2404)
        XCTAssertEqual(CompanyIdentifier.countrymateTechnology.name, #"Countrymate Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.countrymateTechnology.description, #"Countrymate Technology Limited"#)
    
        // Asahi Kasei Corporation
        XCTAssertEqual(CompanyIdentifier.asahiKasei.rawValue, 2405)
        XCTAssertEqual(CompanyIdentifier.asahiKasei.name, #"Asahi Kasei Corporation"#)
        XCTAssertEqual(CompanyIdentifier.asahiKasei.description, #"Asahi Kasei Corporation"#)
    
        // PointGuard, LLC
        XCTAssertEqual(CompanyIdentifier.pointguard.rawValue, 2406)
        XCTAssertEqual(CompanyIdentifier.pointguard.name, #"PointGuard, LLC"#)
        XCTAssertEqual(CompanyIdentifier.pointguard.description, #"PointGuard, LLC"#)
    
        // Neo Materials and Consulting Inc.
        XCTAssertEqual(CompanyIdentifier.neoMaterialsAndConsulting.rawValue, 2407)
        XCTAssertEqual(CompanyIdentifier.neoMaterialsAndConsulting.name, #"Neo Materials and Consulting Inc."#)
        XCTAssertEqual(CompanyIdentifier.neoMaterialsAndConsulting.description, #"Neo Materials and Consulting Inc."#)
    
        // Actev Motors, Inc.
        XCTAssertEqual(CompanyIdentifier.actevMotors.rawValue, 2408)
        XCTAssertEqual(CompanyIdentifier.actevMotors.name, #"Actev Motors, Inc."#)
        XCTAssertEqual(CompanyIdentifier.actevMotors.description, #"Actev Motors, Inc."#)
    
        // Woan Technology (Shenzhen) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.woanTechnologyShenzhen.rawValue, 2409)
        XCTAssertEqual(CompanyIdentifier.woanTechnologyShenzhen.name, #"Woan Technology (Shenzhen) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.woanTechnologyShenzhen.description, #"Woan Technology (Shenzhen) Co., Ltd."#)
    
        // dricos, Inc.
        XCTAssertEqual(CompanyIdentifier.dricos.rawValue, 2410)
        XCTAssertEqual(CompanyIdentifier.dricos.name, #"dricos, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dricos.description, #"dricos, Inc."#)
    
        // Guide ID B.V.
        XCTAssertEqual(CompanyIdentifier.guideId.rawValue, 2411)
        XCTAssertEqual(CompanyIdentifier.guideId.name, #"Guide ID B.V."#)
        XCTAssertEqual(CompanyIdentifier.guideId.description, #"Guide ID B.V."#)
    
        // 9374-7319 Quebec inc
        XCTAssertEqual(CompanyIdentifier.company93747319Quebec.rawValue, 2412)
        XCTAssertEqual(CompanyIdentifier.company93747319Quebec.name, #"9374-7319 Quebec inc"#)
        XCTAssertEqual(CompanyIdentifier.company93747319Quebec.description, #"9374-7319 Quebec inc"#)
    
        // Gunwerks, LLC
        XCTAssertEqual(CompanyIdentifier.gunwerks.rawValue, 2413)
        XCTAssertEqual(CompanyIdentifier.gunwerks.name, #"Gunwerks, LLC"#)
        XCTAssertEqual(CompanyIdentifier.gunwerks.description, #"Gunwerks, LLC"#)
    
        // Band Industries, inc.
        XCTAssertEqual(CompanyIdentifier.bandIndustries.rawValue, 2414)
        XCTAssertEqual(CompanyIdentifier.bandIndustries.name, #"Band Industries, inc."#)
        XCTAssertEqual(CompanyIdentifier.bandIndustries.description, #"Band Industries, inc."#)
    
        // Lund Motion Products, Inc.
        XCTAssertEqual(CompanyIdentifier.lundMotionProducts.rawValue, 2415)
        XCTAssertEqual(CompanyIdentifier.lundMotionProducts.name, #"Lund Motion Products, Inc."#)
        XCTAssertEqual(CompanyIdentifier.lundMotionProducts.description, #"Lund Motion Products, Inc."#)
    
        // IBA Dosimetry GmbH
        XCTAssertEqual(CompanyIdentifier.ibaDosimetry.rawValue, 2416)
        XCTAssertEqual(CompanyIdentifier.ibaDosimetry.name, #"IBA Dosimetry GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ibaDosimetry.description, #"IBA Dosimetry GmbH"#)
    
        // GA
        XCTAssertEqual(CompanyIdentifier.ga.rawValue, 2417)
        XCTAssertEqual(CompanyIdentifier.ga.name, #"GA"#)
        XCTAssertEqual(CompanyIdentifier.ga.description, #"GA"#)
    
        // Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)
        XCTAssertEqual(CompanyIdentifier.closedJointStockCompanyZavodFlometrZavodFlometrCjsc.rawValue, 2418)
        XCTAssertEqual(CompanyIdentifier.closedJointStockCompanyZavodFlometrZavodFlometrCjsc.name, #"Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)"#)
        XCTAssertEqual(CompanyIdentifier.closedJointStockCompanyZavodFlometrZavodFlometrCjsc.description, #"Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)"#)
    
        // Popit Oy
        XCTAssertEqual(CompanyIdentifier.popit.rawValue, 2419)
        XCTAssertEqual(CompanyIdentifier.popit.name, #"Popit Oy"#)
        XCTAssertEqual(CompanyIdentifier.popit.description, #"Popit Oy"#)
    
        // ABEYE
        XCTAssertEqual(CompanyIdentifier.abeye.rawValue, 2420)
        XCTAssertEqual(CompanyIdentifier.abeye.name, #"ABEYE"#)
        XCTAssertEqual(CompanyIdentifier.abeye.description, #"ABEYE"#)
    
        // BlueIOT(Beijing) Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.blueiotBeijingTechnology.rawValue, 2421)
        XCTAssertEqual(CompanyIdentifier.blueiotBeijingTechnology.name, #"BlueIOT(Beijing) Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.blueiotBeijingTechnology.description, #"BlueIOT(Beijing) Technology Co.,Ltd"#)
    
        // Fauna Audio GmbH
        XCTAssertEqual(CompanyIdentifier.faunaAudio.rawValue, 2422)
        XCTAssertEqual(CompanyIdentifier.faunaAudio.name, #"Fauna Audio GmbH"#)
        XCTAssertEqual(CompanyIdentifier.faunaAudio.description, #"Fauna Audio GmbH"#)
    
        // TOYOTA motor corporation
        XCTAssertEqual(CompanyIdentifier.toyotaMotor.rawValue, 2423)
        XCTAssertEqual(CompanyIdentifier.toyotaMotor.name, #"TOYOTA motor corporation"#)
        XCTAssertEqual(CompanyIdentifier.toyotaMotor.description, #"TOYOTA motor corporation"#)
    
        // ZifferEins GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.ziffereins.rawValue, 2424)
        XCTAssertEqual(CompanyIdentifier.ziffereins.name, #"ZifferEins GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.ziffereins.description, #"ZifferEins GmbH & Co. KG"#)
    
        // BIOTRONIK SE & Co. KG
        XCTAssertEqual(CompanyIdentifier.biotronikSeKg.rawValue, 2425)
        XCTAssertEqual(CompanyIdentifier.biotronikSeKg.name, #"BIOTRONIK SE & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.biotronikSeKg.description, #"BIOTRONIK SE & Co. KG"#)
    
        // CORE CORPORATION
        XCTAssertEqual(CompanyIdentifier.core.rawValue, 2426)
        XCTAssertEqual(CompanyIdentifier.core.name, #"CORE CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.core.description, #"CORE CORPORATION"#)
    
        // CTEK Sweden AB
        XCTAssertEqual(CompanyIdentifier.ctekSweden.rawValue, 2427)
        XCTAssertEqual(CompanyIdentifier.ctekSweden.name, #"CTEK Sweden AB"#)
        XCTAssertEqual(CompanyIdentifier.ctekSweden.description, #"CTEK Sweden AB"#)
    
        // Thorley Industries, LLC
        XCTAssertEqual(CompanyIdentifier.thorleyIndustries.rawValue, 2428)
        XCTAssertEqual(CompanyIdentifier.thorleyIndustries.name, #"Thorley Industries, LLC"#)
        XCTAssertEqual(CompanyIdentifier.thorleyIndustries.description, #"Thorley Industries, LLC"#)
    
        // CLB B.V.
        XCTAssertEqual(CompanyIdentifier.clb.rawValue, 2429)
        XCTAssertEqual(CompanyIdentifier.clb.name, #"CLB B.V."#)
        XCTAssertEqual(CompanyIdentifier.clb.description, #"CLB B.V."#)
    
        // SonicSensory Inc
        XCTAssertEqual(CompanyIdentifier.sonicsensory.rawValue, 2430)
        XCTAssertEqual(CompanyIdentifier.sonicsensory.name, #"SonicSensory Inc"#)
        XCTAssertEqual(CompanyIdentifier.sonicsensory.description, #"SonicSensory Inc"#)
    
        // ISEMAR S.R.L.
        XCTAssertEqual(CompanyIdentifier.isemar.rawValue, 2431)
        XCTAssertEqual(CompanyIdentifier.isemar.name, #"ISEMAR S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.isemar.description, #"ISEMAR S.R.L."#)
    
        // DEKRA TESTING AND CERTIFICATION, S.A.U.
        XCTAssertEqual(CompanyIdentifier.dekraTestingAndCertificationU.rawValue, 2432)
        XCTAssertEqual(CompanyIdentifier.dekraTestingAndCertificationU.name, #"DEKRA TESTING AND CERTIFICATION, S.A.U."#)
        XCTAssertEqual(CompanyIdentifier.dekraTestingAndCertificationU.description, #"DEKRA TESTING AND CERTIFICATION, S.A.U."#)
    
        // Bernard Krone Holding SE & Co.KG
        XCTAssertEqual(CompanyIdentifier.bernardKroneHoldingSeKg.rawValue, 2433)
        XCTAssertEqual(CompanyIdentifier.bernardKroneHoldingSeKg.name, #"Bernard Krone Holding SE & Co.KG"#)
        XCTAssertEqual(CompanyIdentifier.bernardKroneHoldingSeKg.description, #"Bernard Krone Holding SE & Co.KG"#)
    
        // ELPRO-BUCHS AG
        XCTAssertEqual(CompanyIdentifier.elproBuchs.rawValue, 2434)
        XCTAssertEqual(CompanyIdentifier.elproBuchs.name, #"ELPRO-BUCHS AG"#)
        XCTAssertEqual(CompanyIdentifier.elproBuchs.description, #"ELPRO-BUCHS AG"#)
    
        // Feedback Sports LLC
        XCTAssertEqual(CompanyIdentifier.feedbackSports.rawValue, 2435)
        XCTAssertEqual(CompanyIdentifier.feedbackSports.name, #"Feedback Sports LLC"#)
        XCTAssertEqual(CompanyIdentifier.feedbackSports.description, #"Feedback Sports LLC"#)
    
        // TeraTron GmbH
        XCTAssertEqual(CompanyIdentifier.teratron.rawValue, 2436)
        XCTAssertEqual(CompanyIdentifier.teratron.name, #"TeraTron GmbH"#)
        XCTAssertEqual(CompanyIdentifier.teratron.description, #"TeraTron GmbH"#)
    
        // Lumos Health Inc.
        XCTAssertEqual(CompanyIdentifier.lumosHealth.rawValue, 2437)
        XCTAssertEqual(CompanyIdentifier.lumosHealth.name, #"Lumos Health Inc."#)
        XCTAssertEqual(CompanyIdentifier.lumosHealth.description, #"Lumos Health Inc."#)
    
        // Cello Hill, LLC
        XCTAssertEqual(CompanyIdentifier.celloHill.rawValue, 2438)
        XCTAssertEqual(CompanyIdentifier.celloHill.name, #"Cello Hill, LLC"#)
        XCTAssertEqual(CompanyIdentifier.celloHill.description, #"Cello Hill, LLC"#)
    
        // TSE BRAKES, INC.
        XCTAssertEqual(CompanyIdentifier.tseBrakes.rawValue, 2439)
        XCTAssertEqual(CompanyIdentifier.tseBrakes.name, #"TSE BRAKES, INC."#)
        XCTAssertEqual(CompanyIdentifier.tseBrakes.description, #"TSE BRAKES, INC."#)
    
        // BHM-Tech Produktionsgesellschaft m.b.H
        XCTAssertEqual(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.rawValue, 2440)
        XCTAssertEqual(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.name, #"BHM-Tech Produktionsgesellschaft m.b.H"#)
        XCTAssertEqual(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.description, #"BHM-Tech Produktionsgesellschaft m.b.H"#)
    
        // WIKA Alexander Wiegand SE & Co.KG
        XCTAssertEqual(CompanyIdentifier.wikaAlexanderWiegandSeKg.rawValue, 2441)
        XCTAssertEqual(CompanyIdentifier.wikaAlexanderWiegandSeKg.name, #"WIKA Alexander Wiegand SE & Co.KG"#)
        XCTAssertEqual(CompanyIdentifier.wikaAlexanderWiegandSeKg.description, #"WIKA Alexander Wiegand SE & Co.KG"#)
    
        // Biovigil
        XCTAssertEqual(CompanyIdentifier.biovigil.rawValue, 2442)
        XCTAssertEqual(CompanyIdentifier.biovigil.name, #"Biovigil"#)
        XCTAssertEqual(CompanyIdentifier.biovigil.description, #"Biovigil"#)
    
        // Mequonic Engineering, S.L.
        XCTAssertEqual(CompanyIdentifier.mequonicEngineering.rawValue, 2443)
        XCTAssertEqual(CompanyIdentifier.mequonicEngineering.name, #"Mequonic Engineering, S.L."#)
        XCTAssertEqual(CompanyIdentifier.mequonicEngineering.description, #"Mequonic Engineering, S.L."#)
    
        // bGrid B.V.
        XCTAssertEqual(CompanyIdentifier.bgrid.rawValue, 2444)
        XCTAssertEqual(CompanyIdentifier.bgrid.name, #"bGrid B.V."#)
        XCTAssertEqual(CompanyIdentifier.bgrid.description, #"bGrid B.V."#)
    
        // C3-WIRELESS, LLC
        XCTAssertEqual(CompanyIdentifier.c3Wireless.rawValue, 2445)
        XCTAssertEqual(CompanyIdentifier.c3Wireless.name, #"C3-WIRELESS, LLC"#)
        XCTAssertEqual(CompanyIdentifier.c3Wireless.description, #"C3-WIRELESS, LLC"#)
    
        // ADVEEZ
        XCTAssertEqual(CompanyIdentifier.adveez.rawValue, 2446)
        XCTAssertEqual(CompanyIdentifier.adveez.name, #"ADVEEZ"#)
        XCTAssertEqual(CompanyIdentifier.adveez.description, #"ADVEEZ"#)
    
        // Aktiebolaget Regin
        XCTAssertEqual(CompanyIdentifier.aktiebolagetRegin.rawValue, 2447)
        XCTAssertEqual(CompanyIdentifier.aktiebolagetRegin.name, #"Aktiebolaget Regin"#)
        XCTAssertEqual(CompanyIdentifier.aktiebolagetRegin.description, #"Aktiebolaget Regin"#)
    
        // Anton Paar GmbH
        XCTAssertEqual(CompanyIdentifier.antonPaar.rawValue, 2448)
        XCTAssertEqual(CompanyIdentifier.antonPaar.name, #"Anton Paar GmbH"#)
        XCTAssertEqual(CompanyIdentifier.antonPaar.description, #"Anton Paar GmbH"#)
    
        // Telenor ASA
        XCTAssertEqual(CompanyIdentifier.telenor.rawValue, 2449)
        XCTAssertEqual(CompanyIdentifier.telenor.name, #"Telenor ASA"#)
        XCTAssertEqual(CompanyIdentifier.telenor.description, #"Telenor ASA"#)
    
        // Big Kaiser Precision Tooling Ltd
        XCTAssertEqual(CompanyIdentifier.bigKaiserPrecisionTooling.rawValue, 2450)
        XCTAssertEqual(CompanyIdentifier.bigKaiserPrecisionTooling.name, #"Big Kaiser Precision Tooling Ltd"#)
        XCTAssertEqual(CompanyIdentifier.bigKaiserPrecisionTooling.description, #"Big Kaiser Precision Tooling Ltd"#)
    
        // Absolute Audio Labs B.V.
        XCTAssertEqual(CompanyIdentifier.absoluteAudioLabs.rawValue, 2451)
        XCTAssertEqual(CompanyIdentifier.absoluteAudioLabs.name, #"Absolute Audio Labs B.V."#)
        XCTAssertEqual(CompanyIdentifier.absoluteAudioLabs.description, #"Absolute Audio Labs B.V."#)
    
        // VT42 Pty Ltd
        XCTAssertEqual(CompanyIdentifier.vt42Pty.rawValue, 2452)
        XCTAssertEqual(CompanyIdentifier.vt42Pty.name, #"VT42 Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.vt42Pty.description, #"VT42 Pty Ltd"#)
    
        // Bronkhorst High-Tech B.V.
        XCTAssertEqual(CompanyIdentifier.bronkhorstHighTech.rawValue, 2453)
        XCTAssertEqual(CompanyIdentifier.bronkhorstHighTech.name, #"Bronkhorst High-Tech B.V."#)
        XCTAssertEqual(CompanyIdentifier.bronkhorstHighTech.description, #"Bronkhorst High-Tech B.V."#)
    
        // C. & E. Fein GmbH
        XCTAssertEqual(CompanyIdentifier.cEFein.rawValue, 2454)
        XCTAssertEqual(CompanyIdentifier.cEFein.name, #"C. & E. Fein GmbH"#)
        XCTAssertEqual(CompanyIdentifier.cEFein.description, #"C. & E. Fein GmbH"#)
    
        // NextMind
        XCTAssertEqual(CompanyIdentifier.nextmind.rawValue, 2455)
        XCTAssertEqual(CompanyIdentifier.nextmind.name, #"NextMind"#)
        XCTAssertEqual(CompanyIdentifier.nextmind.description, #"NextMind"#)
    
        // Pixie Dust Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.pixieDustTechnologies.rawValue, 2456)
        XCTAssertEqual(CompanyIdentifier.pixieDustTechnologies.name, #"Pixie Dust Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.pixieDustTechnologies.description, #"Pixie Dust Technologies, Inc."#)
    
        // eTactica ehf
        XCTAssertEqual(CompanyIdentifier.etacticaEhf.rawValue, 2457)
        XCTAssertEqual(CompanyIdentifier.etacticaEhf.name, #"eTactica ehf"#)
        XCTAssertEqual(CompanyIdentifier.etacticaEhf.description, #"eTactica ehf"#)
    
        // New Audio LLC
        XCTAssertEqual(CompanyIdentifier.newAudio.rawValue, 2458)
        XCTAssertEqual(CompanyIdentifier.newAudio.name, #"New Audio LLC"#)
        XCTAssertEqual(CompanyIdentifier.newAudio.description, #"New Audio LLC"#)
    
        // Sendum Wireless Corporation
        XCTAssertEqual(CompanyIdentifier.sendumWireless.rawValue, 2459)
        XCTAssertEqual(CompanyIdentifier.sendumWireless.name, #"Sendum Wireless Corporation"#)
        XCTAssertEqual(CompanyIdentifier.sendumWireless.description, #"Sendum Wireless Corporation"#)
    
        // deister electronic GmbH
        XCTAssertEqual(CompanyIdentifier.deisterElectronic.rawValue, 2460)
        XCTAssertEqual(CompanyIdentifier.deisterElectronic.name, #"deister electronic GmbH"#)
        XCTAssertEqual(CompanyIdentifier.deisterElectronic.description, #"deister electronic GmbH"#)
    
        // YKK AP Inc.
        XCTAssertEqual(CompanyIdentifier.ykkAp.rawValue, 2461)
        XCTAssertEqual(CompanyIdentifier.ykkAp.name, #"YKK AP Inc."#)
        XCTAssertEqual(CompanyIdentifier.ykkAp.description, #"YKK AP Inc."#)
    
        // Step One Limited
        XCTAssertEqual(CompanyIdentifier.stepOne.rawValue, 2462)
        XCTAssertEqual(CompanyIdentifier.stepOne.name, #"Step One Limited"#)
        XCTAssertEqual(CompanyIdentifier.stepOne.description, #"Step One Limited"#)
    
        // Koya Medical, Inc.
        XCTAssertEqual(CompanyIdentifier.koyaMedical.rawValue, 2463)
        XCTAssertEqual(CompanyIdentifier.koyaMedical.name, #"Koya Medical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.koyaMedical.description, #"Koya Medical, Inc."#)
    
        // Proof Diagnostics, Inc.
        XCTAssertEqual(CompanyIdentifier.proofDiagnostics.rawValue, 2464)
        XCTAssertEqual(CompanyIdentifier.proofDiagnostics.name, #"Proof Diagnostics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.proofDiagnostics.description, #"Proof Diagnostics, Inc."#)
    
        // VOS Systems, LLC
        XCTAssertEqual(CompanyIdentifier.vosSystems.rawValue, 2465)
        XCTAssertEqual(CompanyIdentifier.vosSystems.name, #"VOS Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.vosSystems.description, #"VOS Systems, LLC"#)
    
        // ENGAGENOW DATA SCIENCES PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.engagenowDataSciences.rawValue, 2466)
        XCTAssertEqual(CompanyIdentifier.engagenowDataSciences.name, #"ENGAGENOW DATA SCIENCES PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.engagenowDataSciences.description, #"ENGAGENOW DATA SCIENCES PRIVATE LIMITED"#)
    
        // ARDUINO SA
        XCTAssertEqual(CompanyIdentifier.arduino.rawValue, 2467)
        XCTAssertEqual(CompanyIdentifier.arduino.name, #"ARDUINO SA"#)
        XCTAssertEqual(CompanyIdentifier.arduino.description, #"ARDUINO SA"#)
    
        // KUMHO ELECTRICS, INC
        XCTAssertEqual(CompanyIdentifier.kumhoElectrics.rawValue, 2468)
        XCTAssertEqual(CompanyIdentifier.kumhoElectrics.name, #"KUMHO ELECTRICS, INC"#)
        XCTAssertEqual(CompanyIdentifier.kumhoElectrics.description, #"KUMHO ELECTRICS, INC"#)
    
        // Security Enhancement Systems, LLC
        XCTAssertEqual(CompanyIdentifier.securityEnhancementSystems.rawValue, 2469)
        XCTAssertEqual(CompanyIdentifier.securityEnhancementSystems.name, #"Security Enhancement Systems, LLC"#)
        XCTAssertEqual(CompanyIdentifier.securityEnhancementSystems.description, #"Security Enhancement Systems, LLC"#)
    
        // BEIJING ELECTRIC VEHICLE CO.,LTD
        XCTAssertEqual(CompanyIdentifier.beijingElectricVehicle.rawValue, 2470)
        XCTAssertEqual(CompanyIdentifier.beijingElectricVehicle.name, #"BEIJING ELECTRIC VEHICLE CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.beijingElectricVehicle.description, #"BEIJING ELECTRIC VEHICLE CO.,LTD"#)
    
        // Paybuddy ApS
        XCTAssertEqual(CompanyIdentifier.paybuddy.rawValue, 2471)
        XCTAssertEqual(CompanyIdentifier.paybuddy.name, #"Paybuddy ApS"#)
        XCTAssertEqual(CompanyIdentifier.paybuddy.description, #"Paybuddy ApS"#)
    
        // KHN Solutions Inc
        XCTAssertEqual(CompanyIdentifier.khnSolutions.rawValue, 2472)
        XCTAssertEqual(CompanyIdentifier.khnSolutions.name, #"KHN Solutions Inc"#)
        XCTAssertEqual(CompanyIdentifier.khnSolutions.description, #"KHN Solutions Inc"#)
    
        // Nippon Ceramic Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.nipponCeramic.rawValue, 2473)
        XCTAssertEqual(CompanyIdentifier.nipponCeramic.name, #"Nippon Ceramic Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nipponCeramic.description, #"Nippon Ceramic Co.,Ltd."#)
    
        // PHOTODYNAMIC INCORPORATED
        XCTAssertEqual(CompanyIdentifier.photodynamic.rawValue, 2474)
        XCTAssertEqual(CompanyIdentifier.photodynamic.name, #"PHOTODYNAMIC INCORPORATED"#)
        XCTAssertEqual(CompanyIdentifier.photodynamic.description, #"PHOTODYNAMIC INCORPORATED"#)
    
        // DashLogic, Inc.
        XCTAssertEqual(CompanyIdentifier.dashlogic.rawValue, 2475)
        XCTAssertEqual(CompanyIdentifier.dashlogic.name, #"DashLogic, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dashlogic.description, #"DashLogic, Inc."#)
    
        // Ambiq
        XCTAssertEqual(CompanyIdentifier.ambiq.rawValue, 2476)
        XCTAssertEqual(CompanyIdentifier.ambiq.name, #"Ambiq"#)
        XCTAssertEqual(CompanyIdentifier.ambiq.description, #"Ambiq"#)
    
        // Narhwall Inc.
        XCTAssertEqual(CompanyIdentifier.narhwall.rawValue, 2477)
        XCTAssertEqual(CompanyIdentifier.narhwall.name, #"Narhwall Inc."#)
        XCTAssertEqual(CompanyIdentifier.narhwall.description, #"Narhwall Inc."#)
    
        // Pozyx NV
        XCTAssertEqual(CompanyIdentifier.pozyxNv.rawValue, 2478)
        XCTAssertEqual(CompanyIdentifier.pozyxNv.name, #"Pozyx NV"#)
        XCTAssertEqual(CompanyIdentifier.pozyxNv.description, #"Pozyx NV"#)
    
        // ifLink Open Community
        XCTAssertEqual(CompanyIdentifier.iflinkOpenCommunity.rawValue, 2479)
        XCTAssertEqual(CompanyIdentifier.iflinkOpenCommunity.name, #"ifLink Open Community"#)
        XCTAssertEqual(CompanyIdentifier.iflinkOpenCommunity.description, #"ifLink Open Community"#)
    
        // Deublin Company, LLC
        XCTAssertEqual(CompanyIdentifier.deublinCompany.rawValue, 2480)
        XCTAssertEqual(CompanyIdentifier.deublinCompany.name, #"Deublin Company, LLC"#)
        XCTAssertEqual(CompanyIdentifier.deublinCompany.description, #"Deublin Company, LLC"#)
    
        // BLINQY
        XCTAssertEqual(CompanyIdentifier.blinqy.rawValue, 2481)
        XCTAssertEqual(CompanyIdentifier.blinqy.name, #"BLINQY"#)
        XCTAssertEqual(CompanyIdentifier.blinqy.description, #"BLINQY"#)
    
        // DYPHI
        XCTAssertEqual(CompanyIdentifier.dyphi.rawValue, 2482)
        XCTAssertEqual(CompanyIdentifier.dyphi.name, #"DYPHI"#)
        XCTAssertEqual(CompanyIdentifier.dyphi.description, #"DYPHI"#)
    
        // BlueX Microelectronics Corp Ltd.
        XCTAssertEqual(CompanyIdentifier.bluexMicroelectronics.rawValue, 2483)
        XCTAssertEqual(CompanyIdentifier.bluexMicroelectronics.name, #"BlueX Microelectronics Corp Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bluexMicroelectronics.description, #"BlueX Microelectronics Corp Ltd."#)
    
        // PentaLock Aps.
        XCTAssertEqual(CompanyIdentifier.pentalock.rawValue, 2484)
        XCTAssertEqual(CompanyIdentifier.pentalock.name, #"PentaLock Aps."#)
        XCTAssertEqual(CompanyIdentifier.pentalock.description, #"PentaLock Aps."#)
    
        // AUTEC Gesellschaft fuer Automationstechnik mbH
        XCTAssertEqual(CompanyIdentifier.autecGesellschaftFuerAutomationstechnikMbh.rawValue, 2485)
        XCTAssertEqual(CompanyIdentifier.autecGesellschaftFuerAutomationstechnikMbh.name, #"AUTEC Gesellschaft fuer Automationstechnik mbH"#)
        XCTAssertEqual(CompanyIdentifier.autecGesellschaftFuerAutomationstechnikMbh.description, #"AUTEC Gesellschaft fuer Automationstechnik mbH"#)
    
        // Pegasus Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.pegasusTechnologies.rawValue, 2486)
        XCTAssertEqual(CompanyIdentifier.pegasusTechnologies.name, #"Pegasus Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.pegasusTechnologies.description, #"Pegasus Technologies, Inc."#)
    
        // Bout Labs, LLC
        XCTAssertEqual(CompanyIdentifier.boutLabs.rawValue, 2487)
        XCTAssertEqual(CompanyIdentifier.boutLabs.name, #"Bout Labs, LLC"#)
        XCTAssertEqual(CompanyIdentifier.boutLabs.description, #"Bout Labs, LLC"#)
    
        // PlayerData Limited
        XCTAssertEqual(CompanyIdentifier.playerdata.rawValue, 2488)
        XCTAssertEqual(CompanyIdentifier.playerdata.name, #"PlayerData Limited"#)
        XCTAssertEqual(CompanyIdentifier.playerdata.description, #"PlayerData Limited"#)
    
        // SAVOY ELECTRONIC LIGHTING
        XCTAssertEqual(CompanyIdentifier.savoyElectronicLighting.rawValue, 2489)
        XCTAssertEqual(CompanyIdentifier.savoyElectronicLighting.name, #"SAVOY ELECTRONIC LIGHTING"#)
        XCTAssertEqual(CompanyIdentifier.savoyElectronicLighting.description, #"SAVOY ELECTRONIC LIGHTING"#)
    
        // Elimo Engineering Ltd
        XCTAssertEqual(CompanyIdentifier.elimoEngineering.rawValue, 2490)
        XCTAssertEqual(CompanyIdentifier.elimoEngineering.name, #"Elimo Engineering Ltd"#)
        XCTAssertEqual(CompanyIdentifier.elimoEngineering.description, #"Elimo Engineering Ltd"#)
    
        // SkyStream Corporation
        XCTAssertEqual(CompanyIdentifier.skystream.rawValue, 2491)
        XCTAssertEqual(CompanyIdentifier.skystream.name, #"SkyStream Corporation"#)
        XCTAssertEqual(CompanyIdentifier.skystream.description, #"SkyStream Corporation"#)
    
        // Aerosens LLC
        XCTAssertEqual(CompanyIdentifier.aerosens.rawValue, 2492)
        XCTAssertEqual(CompanyIdentifier.aerosens.name, #"Aerosens LLC"#)
        XCTAssertEqual(CompanyIdentifier.aerosens.description, #"Aerosens LLC"#)
    
        // Centre Suisse d'Electronique et de Microtechnique SA
        XCTAssertEqual(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.rawValue, 2493)
        XCTAssertEqual(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.name, #"Centre Suisse d'Electronique et de Microtechnique SA"#)
        XCTAssertEqual(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.description, #"Centre Suisse d'Electronique et de Microtechnique SA"#)
    
        // Vessel Ltd.
        XCTAssertEqual(CompanyIdentifier.vessel.rawValue, 2494)
        XCTAssertEqual(CompanyIdentifier.vessel.name, #"Vessel Ltd."#)
        XCTAssertEqual(CompanyIdentifier.vessel.description, #"Vessel Ltd."#)
    
        // Span.IO, Inc.
        XCTAssertEqual(CompanyIdentifier.spanIo.rawValue, 2495)
        XCTAssertEqual(CompanyIdentifier.spanIo.name, #"Span.IO, Inc."#)
        XCTAssertEqual(CompanyIdentifier.spanIo.description, #"Span.IO, Inc."#)
    
        // AnotherBrain inc.
        XCTAssertEqual(CompanyIdentifier.anotherbrain.rawValue, 2496)
        XCTAssertEqual(CompanyIdentifier.anotherbrain.name, #"AnotherBrain inc."#)
        XCTAssertEqual(CompanyIdentifier.anotherbrain.description, #"AnotherBrain inc."#)
    
        // Rosewill
        XCTAssertEqual(CompanyIdentifier.rosewill.rawValue, 2497)
        XCTAssertEqual(CompanyIdentifier.rosewill.name, #"Rosewill"#)
        XCTAssertEqual(CompanyIdentifier.rosewill.description, #"Rosewill"#)
    
        // Universal Audio, Inc.
        XCTAssertEqual(CompanyIdentifier.universalAudio.rawValue, 2498)
        XCTAssertEqual(CompanyIdentifier.universalAudio.name, #"Universal Audio, Inc."#)
        XCTAssertEqual(CompanyIdentifier.universalAudio.description, #"Universal Audio, Inc."#)
    
        // JAPAN TOBACCO INC.
        XCTAssertEqual(CompanyIdentifier.japanTobacco.rawValue, 2499)
        XCTAssertEqual(CompanyIdentifier.japanTobacco.name, #"JAPAN TOBACCO INC."#)
        XCTAssertEqual(CompanyIdentifier.japanTobacco.description, #"JAPAN TOBACCO INC."#)
    
        // UVISIO
        XCTAssertEqual(CompanyIdentifier.uvisio.rawValue, 2500)
        XCTAssertEqual(CompanyIdentifier.uvisio.name, #"UVISIO"#)
        XCTAssertEqual(CompanyIdentifier.uvisio.description, #"UVISIO"#)
    
        // HungYi Microelectronics Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.hungyiMicroelectronics.rawValue, 2501)
        XCTAssertEqual(CompanyIdentifier.hungyiMicroelectronics.name, #"HungYi Microelectronics Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.hungyiMicroelectronics.description, #"HungYi Microelectronics Co.,Ltd."#)
    
        // Honor Device Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.honorDevice.rawValue, 2502)
        XCTAssertEqual(CompanyIdentifier.honorDevice.name, #"Honor Device Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.honorDevice.description, #"Honor Device Co., Ltd."#)
    
        // Combustion, LLC
        XCTAssertEqual(CompanyIdentifier.combustion.rawValue, 2503)
        XCTAssertEqual(CompanyIdentifier.combustion.name, #"Combustion, LLC"#)
        XCTAssertEqual(CompanyIdentifier.combustion.description, #"Combustion, LLC"#)
    
        // XUNTONG
        XCTAssertEqual(CompanyIdentifier.xuntong.rawValue, 2504)
        XCTAssertEqual(CompanyIdentifier.xuntong.name, #"XUNTONG"#)
        XCTAssertEqual(CompanyIdentifier.xuntong.description, #"XUNTONG"#)
    
        // CrowdGlow Ltd
        XCTAssertEqual(CompanyIdentifier.crowdglow.rawValue, 2505)
        XCTAssertEqual(CompanyIdentifier.crowdglow.name, #"CrowdGlow Ltd"#)
        XCTAssertEqual(CompanyIdentifier.crowdglow.description, #"CrowdGlow Ltd"#)
    
        // Mobitrace
        XCTAssertEqual(CompanyIdentifier.mobitrace.rawValue, 2506)
        XCTAssertEqual(CompanyIdentifier.mobitrace.name, #"Mobitrace"#)
        XCTAssertEqual(CompanyIdentifier.mobitrace.description, #"Mobitrace"#)
    
        // Hx Engineering, LLC
        XCTAssertEqual(CompanyIdentifier.hxEngineering.rawValue, 2507)
        XCTAssertEqual(CompanyIdentifier.hxEngineering.name, #"Hx Engineering, LLC"#)
        XCTAssertEqual(CompanyIdentifier.hxEngineering.description, #"Hx Engineering, LLC"#)
    
        // Senso4s d.o.o.
        XCTAssertEqual(CompanyIdentifier.senso4S.rawValue, 2508)
        XCTAssertEqual(CompanyIdentifier.senso4S.name, #"Senso4s d.o.o."#)
        XCTAssertEqual(CompanyIdentifier.senso4S.description, #"Senso4s d.o.o."#)
    
        // Blyott
        XCTAssertEqual(CompanyIdentifier.blyott.rawValue, 2509)
        XCTAssertEqual(CompanyIdentifier.blyott.name, #"Blyott"#)
        XCTAssertEqual(CompanyIdentifier.blyott.description, #"Blyott"#)
    
        // Julius Blum GmbH
        XCTAssertEqual(CompanyIdentifier.juliusBlum.rawValue, 2510)
        XCTAssertEqual(CompanyIdentifier.juliusBlum.name, #"Julius Blum GmbH"#)
        XCTAssertEqual(CompanyIdentifier.juliusBlum.description, #"Julius Blum GmbH"#)
    
        // BlueStreak IoT, LLC
        XCTAssertEqual(CompanyIdentifier.bluestreakIot.rawValue, 2511)
        XCTAssertEqual(CompanyIdentifier.bluestreakIot.name, #"BlueStreak IoT, LLC"#)
        XCTAssertEqual(CompanyIdentifier.bluestreakIot.description, #"BlueStreak IoT, LLC"#)
    
        // Chess Wise B.V.
        XCTAssertEqual(CompanyIdentifier.chessWise.rawValue, 2512)
        XCTAssertEqual(CompanyIdentifier.chessWise.name, #"Chess Wise B.V."#)
        XCTAssertEqual(CompanyIdentifier.chessWise.description, #"Chess Wise B.V."#)
    
        // ABLEPAY TECHNOLOGIES AS
        XCTAssertEqual(CompanyIdentifier.ablepayTechnologies.rawValue, 2513)
        XCTAssertEqual(CompanyIdentifier.ablepayTechnologies.name, #"ABLEPAY TECHNOLOGIES AS"#)
        XCTAssertEqual(CompanyIdentifier.ablepayTechnologies.description, #"ABLEPAY TECHNOLOGIES AS"#)
    
        // Temperature Sensitive Solutions Systems Sweden AB
        XCTAssertEqual(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.rawValue, 2514)
        XCTAssertEqual(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.name, #"Temperature Sensitive Solutions Systems Sweden AB"#)
        XCTAssertEqual(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.description, #"Temperature Sensitive Solutions Systems Sweden AB"#)
    
        // HeartHero, inc.
        XCTAssertEqual(CompanyIdentifier.hearthero.rawValue, 2515)
        XCTAssertEqual(CompanyIdentifier.hearthero.name, #"HeartHero, inc."#)
        XCTAssertEqual(CompanyIdentifier.hearthero.description, #"HeartHero, inc."#)
    
        // ORBIS Inc.
        XCTAssertEqual(CompanyIdentifier.orbis.rawValue, 2516)
        XCTAssertEqual(CompanyIdentifier.orbis.name, #"ORBIS Inc."#)
        XCTAssertEqual(CompanyIdentifier.orbis.description, #"ORBIS Inc."#)
    
        // GEAR RADIO ELECTRONICS CORP.
        XCTAssertEqual(CompanyIdentifier.gearRadioElectronics.rawValue, 2517)
        XCTAssertEqual(CompanyIdentifier.gearRadioElectronics.name, #"GEAR RADIO ELECTRONICS CORP."#)
        XCTAssertEqual(CompanyIdentifier.gearRadioElectronics.description, #"GEAR RADIO ELECTRONICS CORP."#)
    
        // EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI
        XCTAssertEqual(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.rawValue, 2518)
        XCTAssertEqual(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.name, #"EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI"#)
        XCTAssertEqual(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.description, #"EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI"#)
    
        // Coyotta
        XCTAssertEqual(CompanyIdentifier.coyotta.rawValue, 2519)
        XCTAssertEqual(CompanyIdentifier.coyotta.name, #"Coyotta"#)
        XCTAssertEqual(CompanyIdentifier.coyotta.description, #"Coyotta"#)
    
        // Synergy Tecnologia em Sistemas Ltda
        XCTAssertEqual(CompanyIdentifier.synergyTecnologiaEmSistemasa.rawValue, 2520)
        XCTAssertEqual(CompanyIdentifier.synergyTecnologiaEmSistemasa.name, #"Synergy Tecnologia em Sistemas Ltda"#)
        XCTAssertEqual(CompanyIdentifier.synergyTecnologiaEmSistemasa.description, #"Synergy Tecnologia em Sistemas Ltda"#)
    
        // VivoSensMedical GmbH
        XCTAssertEqual(CompanyIdentifier.vivosensmedical.rawValue, 2521)
        XCTAssertEqual(CompanyIdentifier.vivosensmedical.name, #"VivoSensMedical GmbH"#)
        XCTAssertEqual(CompanyIdentifier.vivosensmedical.description, #"VivoSensMedical GmbH"#)
    
        // Nagravision SA
        XCTAssertEqual(CompanyIdentifier.nagravision.rawValue, 2522)
        XCTAssertEqual(CompanyIdentifier.nagravision.name, #"Nagravision SA"#)
        XCTAssertEqual(CompanyIdentifier.nagravision.description, #"Nagravision SA"#)
    
        // Bionic Avionics Inc.
        XCTAssertEqual(CompanyIdentifier.bionicAvionics.rawValue, 2523)
        XCTAssertEqual(CompanyIdentifier.bionicAvionics.name, #"Bionic Avionics Inc."#)
        XCTAssertEqual(CompanyIdentifier.bionicAvionics.description, #"Bionic Avionics Inc."#)
    
        // AON2 Ltd.
        XCTAssertEqual(CompanyIdentifier.aon2.rawValue, 2524)
        XCTAssertEqual(CompanyIdentifier.aon2.name, #"AON2 Ltd."#)
        XCTAssertEqual(CompanyIdentifier.aon2.description, #"AON2 Ltd."#)
    
        // Innoware Development AB
        XCTAssertEqual(CompanyIdentifier.innowareDevelopment.rawValue, 2525)
        XCTAssertEqual(CompanyIdentifier.innowareDevelopment.name, #"Innoware Development AB"#)
        XCTAssertEqual(CompanyIdentifier.innowareDevelopment.description, #"Innoware Development AB"#)
    
        // JLD Technology Solutions, LLC
        XCTAssertEqual(CompanyIdentifier.jldTechnologySolutions.rawValue, 2526)
        XCTAssertEqual(CompanyIdentifier.jldTechnologySolutions.name, #"JLD Technology Solutions, LLC"#)
        XCTAssertEqual(CompanyIdentifier.jldTechnologySolutions.description, #"JLD Technology Solutions, LLC"#)
    
        // Magnus Technology Sdn Bhd
        XCTAssertEqual(CompanyIdentifier.magnusTechnologySdnBhd.rawValue, 2527)
        XCTAssertEqual(CompanyIdentifier.magnusTechnologySdnBhd.name, #"Magnus Technology Sdn Bhd"#)
        XCTAssertEqual(CompanyIdentifier.magnusTechnologySdnBhd.description, #"Magnus Technology Sdn Bhd"#)
    
        // Preddio Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.preddioTechnologies.rawValue, 2528)
        XCTAssertEqual(CompanyIdentifier.preddioTechnologies.name, #"Preddio Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.preddioTechnologies.description, #"Preddio Technologies Inc."#)
    
        // Tag-N-Trac Inc
        XCTAssertEqual(CompanyIdentifier.tagNTrac.rawValue, 2529)
        XCTAssertEqual(CompanyIdentifier.tagNTrac.name, #"Tag-N-Trac Inc"#)
        XCTAssertEqual(CompanyIdentifier.tagNTrac.description, #"Tag-N-Trac Inc"#)
    
        // Wuhan Linptech Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.wuhanLinptech.rawValue, 2530)
        XCTAssertEqual(CompanyIdentifier.wuhanLinptech.name, #"Wuhan Linptech Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.wuhanLinptech.description, #"Wuhan Linptech Co.,Ltd."#)
    
        // Friday Home Aps
        XCTAssertEqual(CompanyIdentifier.fridayHome.rawValue, 2531)
        XCTAssertEqual(CompanyIdentifier.fridayHome.name, #"Friday Home Aps"#)
        XCTAssertEqual(CompanyIdentifier.fridayHome.description, #"Friday Home Aps"#)
    
        // CPS AS
        XCTAssertEqual(CompanyIdentifier.cps.rawValue, 2532)
        XCTAssertEqual(CompanyIdentifier.cps.name, #"CPS AS"#)
        XCTAssertEqual(CompanyIdentifier.cps.description, #"CPS AS"#)
    
        // Mobilogix
        XCTAssertEqual(CompanyIdentifier.mobilogix.rawValue, 2533)
        XCTAssertEqual(CompanyIdentifier.mobilogix.name, #"Mobilogix"#)
        XCTAssertEqual(CompanyIdentifier.mobilogix.description, #"Mobilogix"#)
    
        // Masonite Corporation
        XCTAssertEqual(CompanyIdentifier.masonite.rawValue, 2534)
        XCTAssertEqual(CompanyIdentifier.masonite.name, #"Masonite Corporation"#)
        XCTAssertEqual(CompanyIdentifier.masonite.description, #"Masonite Corporation"#)
    
        // Kabushikigaisha HANERON
        XCTAssertEqual(CompanyIdentifier.kabushikigaishaHaneron.rawValue, 2535)
        XCTAssertEqual(CompanyIdentifier.kabushikigaishaHaneron.name, #"Kabushikigaisha HANERON"#)
        XCTAssertEqual(CompanyIdentifier.kabushikigaishaHaneron.description, #"Kabushikigaisha HANERON"#)
    
        // Melange Systems Pvt. Ltd.
        XCTAssertEqual(CompanyIdentifier.melangeSystems.rawValue, 2536)
        XCTAssertEqual(CompanyIdentifier.melangeSystems.name, #"Melange Systems Pvt. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.melangeSystems.description, #"Melange Systems Pvt. Ltd."#)
    
        // LumenRadio AB
        XCTAssertEqual(CompanyIdentifier.lumenradio.rawValue, 2537)
        XCTAssertEqual(CompanyIdentifier.lumenradio.name, #"LumenRadio AB"#)
        XCTAssertEqual(CompanyIdentifier.lumenradio.description, #"LumenRadio AB"#)
    
        // Athlos Oy
        XCTAssertEqual(CompanyIdentifier.athlos.rawValue, 2538)
        XCTAssertEqual(CompanyIdentifier.athlos.name, #"Athlos Oy"#)
        XCTAssertEqual(CompanyIdentifier.athlos.description, #"Athlos Oy"#)
    
        // KEAN ELECTRONICS PTY LTD
        XCTAssertEqual(CompanyIdentifier.keanElectronicsPty.rawValue, 2539)
        XCTAssertEqual(CompanyIdentifier.keanElectronicsPty.name, #"KEAN ELECTRONICS PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.keanElectronicsPty.description, #"KEAN ELECTRONICS PTY LTD"#)
    
        // Yukon advanced optics worldwide, UAB
        XCTAssertEqual(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.rawValue, 2540)
        XCTAssertEqual(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.name, #"Yukon advanced optics worldwide, UAB"#)
        XCTAssertEqual(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.description, #"Yukon advanced optics worldwide, UAB"#)
    
        // Sibel Inc.
        XCTAssertEqual(CompanyIdentifier.sibel.rawValue, 2541)
        XCTAssertEqual(CompanyIdentifier.sibel.name, #"Sibel Inc."#)
        XCTAssertEqual(CompanyIdentifier.sibel.description, #"Sibel Inc."#)
    
        // OJMAR SA
        XCTAssertEqual(CompanyIdentifier.ojmar.rawValue, 2542)
        XCTAssertEqual(CompanyIdentifier.ojmar.name, #"OJMAR SA"#)
        XCTAssertEqual(CompanyIdentifier.ojmar.description, #"OJMAR SA"#)
    
        // Steinel Solutions AG
        XCTAssertEqual(CompanyIdentifier.steinelSolutions.rawValue, 2543)
        XCTAssertEqual(CompanyIdentifier.steinelSolutions.name, #"Steinel Solutions AG"#)
        XCTAssertEqual(CompanyIdentifier.steinelSolutions.description, #"Steinel Solutions AG"#)
    
        // WatchGas B.V.
        XCTAssertEqual(CompanyIdentifier.watchgas.rawValue, 2544)
        XCTAssertEqual(CompanyIdentifier.watchgas.name, #"WatchGas B.V."#)
        XCTAssertEqual(CompanyIdentifier.watchgas.description, #"WatchGas B.V."#)
    
        // OM Digital Solutions Corporation
        XCTAssertEqual(CompanyIdentifier.omDigitalSolutions.rawValue, 2545)
        XCTAssertEqual(CompanyIdentifier.omDigitalSolutions.name, #"OM Digital Solutions Corporation"#)
        XCTAssertEqual(CompanyIdentifier.omDigitalSolutions.description, #"OM Digital Solutions Corporation"#)
    
        // Audeara Pty Ltd
        XCTAssertEqual(CompanyIdentifier.audearaPty.rawValue, 2546)
        XCTAssertEqual(CompanyIdentifier.audearaPty.name, #"Audeara Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.audearaPty.description, #"Audeara Pty Ltd"#)
    
        // Beijing Zero Zero Infinity Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingZeroZeroInfinityTechnology.rawValue, 2547)
        XCTAssertEqual(CompanyIdentifier.beijingZeroZeroInfinityTechnology.name, #"Beijing Zero Zero Infinity Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingZeroZeroInfinityTechnology.description, #"Beijing Zero Zero Infinity Technology Co.,Ltd."#)
    
        // Spectrum Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.spectrumTechnologies.rawValue, 2548)
        XCTAssertEqual(CompanyIdentifier.spectrumTechnologies.name, #"Spectrum Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.spectrumTechnologies.description, #"Spectrum Technologies, Inc."#)
    
        // OKI Electric Industry Co., Ltd
        XCTAssertEqual(CompanyIdentifier.okiElectricIndustry.rawValue, 2549)
        XCTAssertEqual(CompanyIdentifier.okiElectricIndustry.name, #"OKI Electric Industry Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.okiElectricIndustry.description, #"OKI Electric Industry Co., Ltd"#)
    
        // Mobile Action Technology Inc.
        XCTAssertEqual(CompanyIdentifier.mobileActionTechnology.rawValue, 2550)
        XCTAssertEqual(CompanyIdentifier.mobileActionTechnology.name, #"Mobile Action Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.mobileActionTechnology.description, #"Mobile Action Technology Inc."#)
    
        // SENSATEC Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sensatec.rawValue, 2551)
        XCTAssertEqual(CompanyIdentifier.sensatec.name, #"SENSATEC Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sensatec.description, #"SENSATEC Co., Ltd."#)
    
        // R.O. S.R.L.
        XCTAssertEqual(CompanyIdentifier.rO.rawValue, 2552)
        XCTAssertEqual(CompanyIdentifier.rO.name, #"R.O. S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.rO.description, #"R.O. S.R.L."#)
    
        // Hangzhou Yaguan Technology Co. LTD
        XCTAssertEqual(CompanyIdentifier.hangzhouYaguanTechnology.rawValue, 2553)
        XCTAssertEqual(CompanyIdentifier.hangzhouYaguanTechnology.name, #"Hangzhou Yaguan Technology Co. LTD"#)
        XCTAssertEqual(CompanyIdentifier.hangzhouYaguanTechnology.description, #"Hangzhou Yaguan Technology Co. LTD"#)
    
        // Listen Technologies Corporation
        XCTAssertEqual(CompanyIdentifier.listenTechnologies.rawValue, 2554)
        XCTAssertEqual(CompanyIdentifier.listenTechnologies.name, #"Listen Technologies Corporation"#)
        XCTAssertEqual(CompanyIdentifier.listenTechnologies.description, #"Listen Technologies Corporation"#)
    
        // TOITU CO., LTD.
        XCTAssertEqual(CompanyIdentifier.toitu.rawValue, 2555)
        XCTAssertEqual(CompanyIdentifier.toitu.name, #"TOITU CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.toitu.description, #"TOITU CO., LTD."#)
    
        // Confidex
        XCTAssertEqual(CompanyIdentifier.confidex.rawValue, 2556)
        XCTAssertEqual(CompanyIdentifier.confidex.name, #"Confidex"#)
        XCTAssertEqual(CompanyIdentifier.confidex.description, #"Confidex"#)
    
        // Keep Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.keepTechnologies.rawValue, 2557)
        XCTAssertEqual(CompanyIdentifier.keepTechnologies.name, #"Keep Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.keepTechnologies.description, #"Keep Technologies, Inc."#)
    
        // Lichtvision Engineering GmbH
        XCTAssertEqual(CompanyIdentifier.lichtvisionEngineering.rawValue, 2558)
        XCTAssertEqual(CompanyIdentifier.lichtvisionEngineering.name, #"Lichtvision Engineering GmbH"#)
        XCTAssertEqual(CompanyIdentifier.lichtvisionEngineering.description, #"Lichtvision Engineering GmbH"#)
    
        // AIRSTAR
        XCTAssertEqual(CompanyIdentifier.airstar.rawValue, 2559)
        XCTAssertEqual(CompanyIdentifier.airstar.name, #"AIRSTAR"#)
        XCTAssertEqual(CompanyIdentifier.airstar.description, #"AIRSTAR"#)
    
        // Ampler Bikes OU
        XCTAssertEqual(CompanyIdentifier.amplerBikesOu.rawValue, 2560)
        XCTAssertEqual(CompanyIdentifier.amplerBikesOu.name, #"Ampler Bikes OU"#)
        XCTAssertEqual(CompanyIdentifier.amplerBikesOu.description, #"Ampler Bikes OU"#)
    
        // Cleveron AS
        XCTAssertEqual(CompanyIdentifier.cleveron.rawValue, 2561)
        XCTAssertEqual(CompanyIdentifier.cleveron.name, #"Cleveron AS"#)
        XCTAssertEqual(CompanyIdentifier.cleveron.description, #"Cleveron AS"#)
    
        // Ayxon-Dynamics GmbH
        XCTAssertEqual(CompanyIdentifier.ayxonDynamics.rawValue, 2562)
        XCTAssertEqual(CompanyIdentifier.ayxonDynamics.name, #"Ayxon-Dynamics GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ayxonDynamics.description, #"Ayxon-Dynamics GmbH"#)
    
        // donutrobotics Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.donutrobotics.rawValue, 2563)
        XCTAssertEqual(CompanyIdentifier.donutrobotics.name, #"donutrobotics Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.donutrobotics.description, #"donutrobotics Co., Ltd."#)
    
        // Flosonics Medical
        XCTAssertEqual(CompanyIdentifier.flosonicsMedical.rawValue, 2564)
        XCTAssertEqual(CompanyIdentifier.flosonicsMedical.name, #"Flosonics Medical"#)
        XCTAssertEqual(CompanyIdentifier.flosonicsMedical.description, #"Flosonics Medical"#)
    
        // Southwire Company, LLC
        XCTAssertEqual(CompanyIdentifier.southwireCompany.rawValue, 2565)
        XCTAssertEqual(CompanyIdentifier.southwireCompany.name, #"Southwire Company, LLC"#)
        XCTAssertEqual(CompanyIdentifier.southwireCompany.description, #"Southwire Company, LLC"#)
    
        // Shanghai wuqi microelectronics Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shanghaiWuqiMicroelectronics.rawValue, 2566)
        XCTAssertEqual(CompanyIdentifier.shanghaiWuqiMicroelectronics.name, #"Shanghai wuqi microelectronics Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiWuqiMicroelectronics.description, #"Shanghai wuqi microelectronics Co.,Ltd"#)
    
        // Reflow Pty Ltd
        XCTAssertEqual(CompanyIdentifier.reflowPty.rawValue, 2567)
        XCTAssertEqual(CompanyIdentifier.reflowPty.name, #"Reflow Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.reflowPty.description, #"Reflow Pty Ltd"#)
    
        // Oras Oy
        XCTAssertEqual(CompanyIdentifier.oras.rawValue, 2568)
        XCTAssertEqual(CompanyIdentifier.oras.name, #"Oras Oy"#)
        XCTAssertEqual(CompanyIdentifier.oras.description, #"Oras Oy"#)
    
        // ECCT
        XCTAssertEqual(CompanyIdentifier.ecct.rawValue, 2569)
        XCTAssertEqual(CompanyIdentifier.ecct.name, #"ECCT"#)
        XCTAssertEqual(CompanyIdentifier.ecct.description, #"ECCT"#)
    
        // Volan Technology Inc.
        XCTAssertEqual(CompanyIdentifier.volanTechnology.rawValue, 2570)
        XCTAssertEqual(CompanyIdentifier.volanTechnology.name, #"Volan Technology Inc."#)
        XCTAssertEqual(CompanyIdentifier.volanTechnology.description, #"Volan Technology Inc."#)
    
        // SIANA Systems
        XCTAssertEqual(CompanyIdentifier.sianaSystems.rawValue, 2571)
        XCTAssertEqual(CompanyIdentifier.sianaSystems.name, #"SIANA Systems"#)
        XCTAssertEqual(CompanyIdentifier.sianaSystems.description, #"SIANA Systems"#)
    
        // Shanghai Yidian Intelligent Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shanghaiYidianIntelligentTechnology.rawValue, 2572)
        XCTAssertEqual(CompanyIdentifier.shanghaiYidianIntelligentTechnology.name, #"Shanghai Yidian Intelligent Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shanghaiYidianIntelligentTechnology.description, #"Shanghai Yidian Intelligent Technology Co., Ltd."#)
    
        // Blue Peacock GmbH
        XCTAssertEqual(CompanyIdentifier.bluePeacock.rawValue, 2573)
        XCTAssertEqual(CompanyIdentifier.bluePeacock.name, #"Blue Peacock GmbH"#)
        XCTAssertEqual(CompanyIdentifier.bluePeacock.description, #"Blue Peacock GmbH"#)
    
        // Roland Corporation
        XCTAssertEqual(CompanyIdentifier.roland.rawValue, 2574)
        XCTAssertEqual(CompanyIdentifier.roland.name, #"Roland Corporation"#)
        XCTAssertEqual(CompanyIdentifier.roland.description, #"Roland Corporation"#)
    
        // LIXIL Corporation
        XCTAssertEqual(CompanyIdentifier.lixil.rawValue, 2575)
        XCTAssertEqual(CompanyIdentifier.lixil.name, #"LIXIL Corporation"#)
        XCTAssertEqual(CompanyIdentifier.lixil.description, #"LIXIL Corporation"#)
    
        // SUBARU Corporation
        XCTAssertEqual(CompanyIdentifier.subaru.rawValue, 2576)
        XCTAssertEqual(CompanyIdentifier.subaru.name, #"SUBARU Corporation"#)
        XCTAssertEqual(CompanyIdentifier.subaru.description, #"SUBARU Corporation"#)
    
        // Sensolus
        XCTAssertEqual(CompanyIdentifier.sensolus.rawValue, 2577)
        XCTAssertEqual(CompanyIdentifier.sensolus.name, #"Sensolus"#)
        XCTAssertEqual(CompanyIdentifier.sensolus.description, #"Sensolus"#)
    
        // Dyson Technology Limited
        XCTAssertEqual(CompanyIdentifier.dysonTechnology.rawValue, 2578)
        XCTAssertEqual(CompanyIdentifier.dysonTechnology.name, #"Dyson Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.dysonTechnology.description, #"Dyson Technology Limited"#)
    
        // Tec4med LifeScience GmbH
        XCTAssertEqual(CompanyIdentifier.tec4MedLifescience.rawValue, 2579)
        XCTAssertEqual(CompanyIdentifier.tec4MedLifescience.name, #"Tec4med LifeScience GmbH"#)
        XCTAssertEqual(CompanyIdentifier.tec4MedLifescience.description, #"Tec4med LifeScience GmbH"#)
    
        // CROXEL, INC.
        XCTAssertEqual(CompanyIdentifier.croxel.rawValue, 2580)
        XCTAssertEqual(CompanyIdentifier.croxel.name, #"CROXEL, INC."#)
        XCTAssertEqual(CompanyIdentifier.croxel.description, #"CROXEL, INC."#)
    
        // Syng Inc
        XCTAssertEqual(CompanyIdentifier.syng.rawValue, 2581)
        XCTAssertEqual(CompanyIdentifier.syng.name, #"Syng Inc"#)
        XCTAssertEqual(CompanyIdentifier.syng.description, #"Syng Inc"#)
    
        // RIDE VISION LTD
        XCTAssertEqual(CompanyIdentifier.rideVision.rawValue, 2582)
        XCTAssertEqual(CompanyIdentifier.rideVision.name, #"RIDE VISION LTD"#)
        XCTAssertEqual(CompanyIdentifier.rideVision.description, #"RIDE VISION LTD"#)
    
        // Plume Design Inc
        XCTAssertEqual(CompanyIdentifier.plumeDesign.rawValue, 2583)
        XCTAssertEqual(CompanyIdentifier.plumeDesign.name, #"Plume Design Inc"#)
        XCTAssertEqual(CompanyIdentifier.plumeDesign.description, #"Plume Design Inc"#)
    
        // Cambridge Animal Technologies Ltd
        XCTAssertEqual(CompanyIdentifier.cambridgeAnimalTechnologies.rawValue, 2584)
        XCTAssertEqual(CompanyIdentifier.cambridgeAnimalTechnologies.name, #"Cambridge Animal Technologies Ltd"#)
        XCTAssertEqual(CompanyIdentifier.cambridgeAnimalTechnologies.description, #"Cambridge Animal Technologies Ltd"#)
    
        // Maxell, Ltd.
        XCTAssertEqual(CompanyIdentifier.maxell.rawValue, 2585)
        XCTAssertEqual(CompanyIdentifier.maxell.name, #"Maxell, Ltd."#)
        XCTAssertEqual(CompanyIdentifier.maxell.description, #"Maxell, Ltd."#)
    
        // Link Labs, Inc.
        XCTAssertEqual(CompanyIdentifier.linkLabs.rawValue, 2586)
        XCTAssertEqual(CompanyIdentifier.linkLabs.name, #"Link Labs, Inc."#)
        XCTAssertEqual(CompanyIdentifier.linkLabs.description, #"Link Labs, Inc."#)
    
        // Embrava Pty Ltd
        XCTAssertEqual(CompanyIdentifier.embravaPty.rawValue, 2587)
        XCTAssertEqual(CompanyIdentifier.embravaPty.name, #"Embrava Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.embravaPty.description, #"Embrava Pty Ltd"#)
    
        // INPEAK S.C.
        XCTAssertEqual(CompanyIdentifier.inpeakSC.rawValue, 2588)
        XCTAssertEqual(CompanyIdentifier.inpeakSC.name, #"INPEAK S.C."#)
        XCTAssertEqual(CompanyIdentifier.inpeakSC.description, #"INPEAK S.C."#)
    
        // API-K
        XCTAssertEqual(CompanyIdentifier.apiK.rawValue, 2589)
        XCTAssertEqual(CompanyIdentifier.apiK.name, #"API-K"#)
        XCTAssertEqual(CompanyIdentifier.apiK.description, #"API-K"#)
    
        // CombiQ AB
        XCTAssertEqual(CompanyIdentifier.combiq.rawValue, 2590)
        XCTAssertEqual(CompanyIdentifier.combiq.name, #"CombiQ AB"#)
        XCTAssertEqual(CompanyIdentifier.combiq.description, #"CombiQ AB"#)
    
        // DeVilbiss Healthcare LLC
        XCTAssertEqual(CompanyIdentifier.devilbissHealthcare.rawValue, 2591)
        XCTAssertEqual(CompanyIdentifier.devilbissHealthcare.name, #"DeVilbiss Healthcare LLC"#)
        XCTAssertEqual(CompanyIdentifier.devilbissHealthcare.description, #"DeVilbiss Healthcare LLC"#)
    
        // Jiangxi Innotech Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.jiangxiInnotechTechnology.rawValue, 2592)
        XCTAssertEqual(CompanyIdentifier.jiangxiInnotechTechnology.name, #"Jiangxi Innotech Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.jiangxiInnotechTechnology.description, #"Jiangxi Innotech Technology Co., Ltd"#)
    
        // Apollogic Sp. z o.o.
        XCTAssertEqual(CompanyIdentifier.apollogic.rawValue, 2593)
        XCTAssertEqual(CompanyIdentifier.apollogic.name, #"Apollogic Sp. z o.o."#)
        XCTAssertEqual(CompanyIdentifier.apollogic.description, #"Apollogic Sp. z o.o."#)
    
        // DAIICHIKOSHO CO., LTD.
        XCTAssertEqual(CompanyIdentifier.daiichikosho.rawValue, 2594)
        XCTAssertEqual(CompanyIdentifier.daiichikosho.name, #"DAIICHIKOSHO CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.daiichikosho.description, #"DAIICHIKOSHO CO., LTD."#)
    
        // BIXOLON CO.,LTD
        XCTAssertEqual(CompanyIdentifier.bixolon.rawValue, 2595)
        XCTAssertEqual(CompanyIdentifier.bixolon.name, #"BIXOLON CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.bixolon.description, #"BIXOLON CO.,LTD"#)
    
        // Atmosic Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.atmosicTechnologies.rawValue, 2596)
        XCTAssertEqual(CompanyIdentifier.atmosicTechnologies.name, #"Atmosic Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.atmosicTechnologies.description, #"Atmosic Technologies, Inc."#)
    
        // Eran Financial Services LLC
        XCTAssertEqual(CompanyIdentifier.eranFinancialServices.rawValue, 2597)
        XCTAssertEqual(CompanyIdentifier.eranFinancialServices.name, #"Eran Financial Services LLC"#)
        XCTAssertEqual(CompanyIdentifier.eranFinancialServices.description, #"Eran Financial Services LLC"#)
    
        // Louis Vuitton
        XCTAssertEqual(CompanyIdentifier.louisVuitton.rawValue, 2598)
        XCTAssertEqual(CompanyIdentifier.louisVuitton.name, #"Louis Vuitton"#)
        XCTAssertEqual(CompanyIdentifier.louisVuitton.description, #"Louis Vuitton"#)
    
        // AYU DEVICES PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.ayuDevices.rawValue, 2599)
        XCTAssertEqual(CompanyIdentifier.ayuDevices.name, #"AYU DEVICES PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.ayuDevices.description, #"AYU DEVICES PRIVATE LIMITED"#)
    
        // NanoFlex
        XCTAssertEqual(CompanyIdentifier.nanoflex.rawValue, 2600)
        XCTAssertEqual(CompanyIdentifier.nanoflex.name, #"NanoFlex"#)
        XCTAssertEqual(CompanyIdentifier.nanoflex.description, #"NanoFlex"#)
    
        // Worthcloud Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.worthcloudTechnology.rawValue, 2601)
        XCTAssertEqual(CompanyIdentifier.worthcloudTechnology.name, #"Worthcloud Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.worthcloudTechnology.description, #"Worthcloud Technology Co.,Ltd"#)
    
        // Yamaha Corporation
        XCTAssertEqual(CompanyIdentifier.yamaha.rawValue, 2602)
        XCTAssertEqual(CompanyIdentifier.yamaha.name, #"Yamaha Corporation"#)
        XCTAssertEqual(CompanyIdentifier.yamaha.description, #"Yamaha Corporation"#)
    
        // PaceBait IVS
        XCTAssertEqual(CompanyIdentifier.pacebait.rawValue, 2603)
        XCTAssertEqual(CompanyIdentifier.pacebait.name, #"PaceBait IVS"#)
        XCTAssertEqual(CompanyIdentifier.pacebait.description, #"PaceBait IVS"#)
    
        // Shenzhen H&T Intelligent Control Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenHTIntelligentControl.rawValue, 2604)
        XCTAssertEqual(CompanyIdentifier.shenzhenHTIntelligentControl.name, #"Shenzhen H&T Intelligent Control Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenHTIntelligentControl.description, #"Shenzhen H&T Intelligent Control Co., Ltd"#)
    
        // Shenzhen Feasycom Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenFeasycomTechnology.rawValue, 2605)
        XCTAssertEqual(CompanyIdentifier.shenzhenFeasycomTechnology.name, #"Shenzhen Feasycom Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenFeasycomTechnology.description, #"Shenzhen Feasycom Technology Co., Ltd."#)
    
        // Zuma Array Limited
        XCTAssertEqual(CompanyIdentifier.zumaArray.rawValue, 2606)
        XCTAssertEqual(CompanyIdentifier.zumaArray.name, #"Zuma Array Limited"#)
        XCTAssertEqual(CompanyIdentifier.zumaArray.description, #"Zuma Array Limited"#)
    
        // Instamic, Inc.
        XCTAssertEqual(CompanyIdentifier.instamic.rawValue, 2607)
        XCTAssertEqual(CompanyIdentifier.instamic.name, #"Instamic, Inc."#)
        XCTAssertEqual(CompanyIdentifier.instamic.description, #"Instamic, Inc."#)
    
        // Air-Weigh
        XCTAssertEqual(CompanyIdentifier.airWeigh.rawValue, 2608)
        XCTAssertEqual(CompanyIdentifier.airWeigh.name, #"Air-Weigh"#)
        XCTAssertEqual(CompanyIdentifier.airWeigh.description, #"Air-Weigh"#)
    
        // Nevro Corp.
        XCTAssertEqual(CompanyIdentifier.nevro.rawValue, 2609)
        XCTAssertEqual(CompanyIdentifier.nevro.name, #"Nevro Corp."#)
        XCTAssertEqual(CompanyIdentifier.nevro.description, #"Nevro Corp."#)
    
        // Pinnacle Technology, Inc.
        XCTAssertEqual(CompanyIdentifier.pinnacleTechnology.rawValue, 2610)
        XCTAssertEqual(CompanyIdentifier.pinnacleTechnology.name, #"Pinnacle Technology, Inc."#)
        XCTAssertEqual(CompanyIdentifier.pinnacleTechnology.description, #"Pinnacle Technology, Inc."#)
    
        // WMF AG
        XCTAssertEqual(CompanyIdentifier.wmf.rawValue, 2611)
        XCTAssertEqual(CompanyIdentifier.wmf.name, #"WMF AG"#)
        XCTAssertEqual(CompanyIdentifier.wmf.description, #"WMF AG"#)
    
        // Luxer Corporation
        XCTAssertEqual(CompanyIdentifier.luxer.rawValue, 2612)
        XCTAssertEqual(CompanyIdentifier.luxer.name, #"Luxer Corporation"#)
        XCTAssertEqual(CompanyIdentifier.luxer.description, #"Luxer Corporation"#)
    
        // safectory GmbH
        XCTAssertEqual(CompanyIdentifier.safectory.rawValue, 2613)
        XCTAssertEqual(CompanyIdentifier.safectory.name, #"safectory GmbH"#)
        XCTAssertEqual(CompanyIdentifier.safectory.description, #"safectory GmbH"#)
    
        // NGK SPARK PLUG CO., LTD.
        XCTAssertEqual(CompanyIdentifier.ngkSparkPlug.rawValue, 2614)
        XCTAssertEqual(CompanyIdentifier.ngkSparkPlug.name, #"NGK SPARK PLUG CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.ngkSparkPlug.description, #"NGK SPARK PLUG CO., LTD."#)
    
        // 2587702 Ontario Inc.
        XCTAssertEqual(CompanyIdentifier.company2587702Ontario.rawValue, 2615)
        XCTAssertEqual(CompanyIdentifier.company2587702Ontario.name, #"2587702 Ontario Inc."#)
        XCTAssertEqual(CompanyIdentifier.company2587702Ontario.description, #"2587702 Ontario Inc."#)
    
        // Bouffalo Lab (Nanjing)., Ltd.
        XCTAssertEqual(CompanyIdentifier.bouffaloLabNanjing.rawValue, 2616)
        XCTAssertEqual(CompanyIdentifier.bouffaloLabNanjing.name, #"Bouffalo Lab (Nanjing)., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.bouffaloLabNanjing.description, #"Bouffalo Lab (Nanjing)., Ltd."#)
    
        // BLUETICKETING SRL
        XCTAssertEqual(CompanyIdentifier.blueticketing.rawValue, 2617)
        XCTAssertEqual(CompanyIdentifier.blueticketing.name, #"BLUETICKETING SRL"#)
        XCTAssertEqual(CompanyIdentifier.blueticketing.description, #"BLUETICKETING SRL"#)
    
        // Incotex Co. Ltd.
        XCTAssertEqual(CompanyIdentifier.incotex.rawValue, 2618)
        XCTAssertEqual(CompanyIdentifier.incotex.name, #"Incotex Co. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.incotex.description, #"Incotex Co. Ltd."#)
    
        // Galileo Technology Limited
        XCTAssertEqual(CompanyIdentifier.galileoTechnology.rawValue, 2619)
        XCTAssertEqual(CompanyIdentifier.galileoTechnology.name, #"Galileo Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.galileoTechnology.description, #"Galileo Technology Limited"#)
    
        // Siteco GmbH
        XCTAssertEqual(CompanyIdentifier.siteco.rawValue, 2620)
        XCTAssertEqual(CompanyIdentifier.siteco.name, #"Siteco GmbH"#)
        XCTAssertEqual(CompanyIdentifier.siteco.description, #"Siteco GmbH"#)
    
        // DELABIE
        XCTAssertEqual(CompanyIdentifier.delabie.rawValue, 2621)
        XCTAssertEqual(CompanyIdentifier.delabie.name, #"DELABIE"#)
        XCTAssertEqual(CompanyIdentifier.delabie.description, #"DELABIE"#)
    
        // Hefei Yunlian Semiconductor Co., Ltd
        XCTAssertEqual(CompanyIdentifier.hefeiYunlianSemiconductor.rawValue, 2622)
        XCTAssertEqual(CompanyIdentifier.hefeiYunlianSemiconductor.name, #"Hefei Yunlian Semiconductor Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hefeiYunlianSemiconductor.description, #"Hefei Yunlian Semiconductor Co., Ltd"#)
    
        // Shenzhen Yopeak Optoelectronics Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.rawValue, 2623)
        XCTAssertEqual(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.name, #"Shenzhen Yopeak Optoelectronics Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.description, #"Shenzhen Yopeak Optoelectronics Technology Co., Ltd."#)
    
        // GEWISS S.p.A.
        XCTAssertEqual(CompanyIdentifier.gewiss.rawValue, 2624)
        XCTAssertEqual(CompanyIdentifier.gewiss.name, #"GEWISS S.p.A."#)
        XCTAssertEqual(CompanyIdentifier.gewiss.description, #"GEWISS S.p.A."#)
    
        // OPEX Corporation
        XCTAssertEqual(CompanyIdentifier.opex.rawValue, 2625)
        XCTAssertEqual(CompanyIdentifier.opex.name, #"OPEX Corporation"#)
        XCTAssertEqual(CompanyIdentifier.opex.description, #"OPEX Corporation"#)
    
        // Motionalysis, Inc.
        XCTAssertEqual(CompanyIdentifier.motionalysis.rawValue, 2626)
        XCTAssertEqual(CompanyIdentifier.motionalysis.name, #"Motionalysis, Inc."#)
        XCTAssertEqual(CompanyIdentifier.motionalysis.description, #"Motionalysis, Inc."#)
    
        // Busch Systems International Inc.
        XCTAssertEqual(CompanyIdentifier.buschSystemsInternational.rawValue, 2627)
        XCTAssertEqual(CompanyIdentifier.buschSystemsInternational.name, #"Busch Systems International Inc."#)
        XCTAssertEqual(CompanyIdentifier.buschSystemsInternational.description, #"Busch Systems International Inc."#)
    
        // Novidan, Inc.
        XCTAssertEqual(CompanyIdentifier.novidan.rawValue, 2628)
        XCTAssertEqual(CompanyIdentifier.novidan.name, #"Novidan, Inc."#)
        XCTAssertEqual(CompanyIdentifier.novidan.description, #"Novidan, Inc."#)
    
        // 3SI Security Systems, Inc
        XCTAssertEqual(CompanyIdentifier.company3SiSecuritySystems.rawValue, 2629)
        XCTAssertEqual(CompanyIdentifier.company3SiSecuritySystems.name, #"3SI Security Systems, Inc"#)
        XCTAssertEqual(CompanyIdentifier.company3SiSecuritySystems.description, #"3SI Security Systems, Inc"#)
    
        // Beijing HC-Infinite Technology Limited
        XCTAssertEqual(CompanyIdentifier.beijingHcInfiniteTechnology.rawValue, 2630)
        XCTAssertEqual(CompanyIdentifier.beijingHcInfiniteTechnology.name, #"Beijing HC-Infinite Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.beijingHcInfiniteTechnology.description, #"Beijing HC-Infinite Technology Limited"#)
    
        // The Wand Company Ltd
        XCTAssertEqual(CompanyIdentifier.wandCompany.rawValue, 2631)
        XCTAssertEqual(CompanyIdentifier.wandCompany.name, #"The Wand Company Ltd"#)
        XCTAssertEqual(CompanyIdentifier.wandCompany.description, #"The Wand Company Ltd"#)
    
        // JRC Mobility Inc.
        XCTAssertEqual(CompanyIdentifier.jrcMobility.rawValue, 2632)
        XCTAssertEqual(CompanyIdentifier.jrcMobility.name, #"JRC Mobility Inc."#)
        XCTAssertEqual(CompanyIdentifier.jrcMobility.description, #"JRC Mobility Inc."#)
    
        // Venture Research Inc.
        XCTAssertEqual(CompanyIdentifier.ventureResearch.rawValue, 2633)
        XCTAssertEqual(CompanyIdentifier.ventureResearch.name, #"Venture Research Inc."#)
        XCTAssertEqual(CompanyIdentifier.ventureResearch.description, #"Venture Research Inc."#)
    
        // Map Large, Inc.
        XCTAssertEqual(CompanyIdentifier.mapLarge.rawValue, 2634)
        XCTAssertEqual(CompanyIdentifier.mapLarge.name, #"Map Large, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mapLarge.description, #"Map Large, Inc."#)
    
        // MistyWest Energy and Transport Ltd.
        XCTAssertEqual(CompanyIdentifier.mistywestEnergyAndTransport.rawValue, 2635)
        XCTAssertEqual(CompanyIdentifier.mistywestEnergyAndTransport.name, #"MistyWest Energy and Transport Ltd."#)
        XCTAssertEqual(CompanyIdentifier.mistywestEnergyAndTransport.description, #"MistyWest Energy and Transport Ltd."#)
    
        // SiFli Technologies (shanghai) Inc.
        XCTAssertEqual(CompanyIdentifier.sifliTechnologiesShanghai.rawValue, 2636)
        XCTAssertEqual(CompanyIdentifier.sifliTechnologiesShanghai.name, #"SiFli Technologies (shanghai) Inc."#)
        XCTAssertEqual(CompanyIdentifier.sifliTechnologiesShanghai.description, #"SiFli Technologies (shanghai) Inc."#)
    
        // Lockn Technologies Private Limited
        XCTAssertEqual(CompanyIdentifier.locknTechnologies.rawValue, 2637)
        XCTAssertEqual(CompanyIdentifier.locknTechnologies.name, #"Lockn Technologies Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.locknTechnologies.description, #"Lockn Technologies Private Limited"#)
    
        // Toytec Corporation
        XCTAssertEqual(CompanyIdentifier.toytec.rawValue, 2638)
        XCTAssertEqual(CompanyIdentifier.toytec.name, #"Toytec Corporation"#)
        XCTAssertEqual(CompanyIdentifier.toytec.description, #"Toytec Corporation"#)
    
        // VANMOOF Global Holding B.V.
        XCTAssertEqual(CompanyIdentifier.vanmoofGlobalHolding.rawValue, 2639)
        XCTAssertEqual(CompanyIdentifier.vanmoofGlobalHolding.name, #"VANMOOF Global Holding B.V."#)
        XCTAssertEqual(CompanyIdentifier.vanmoofGlobalHolding.description, #"VANMOOF Global Holding B.V."#)
    
        // Nextscape Inc.
        XCTAssertEqual(CompanyIdentifier.nextscape.rawValue, 2640)
        XCTAssertEqual(CompanyIdentifier.nextscape.name, #"Nextscape Inc."#)
        XCTAssertEqual(CompanyIdentifier.nextscape.description, #"Nextscape Inc."#)
    
        // CSIRO
        XCTAssertEqual(CompanyIdentifier.csiro.rawValue, 2641)
        XCTAssertEqual(CompanyIdentifier.csiro.name, #"CSIRO"#)
        XCTAssertEqual(CompanyIdentifier.csiro.description, #"CSIRO"#)
    
        // Follow Sense Europe B.V.
        XCTAssertEqual(CompanyIdentifier.followSenseEurope.rawValue, 2642)
        XCTAssertEqual(CompanyIdentifier.followSenseEurope.name, #"Follow Sense Europe B.V."#)
        XCTAssertEqual(CompanyIdentifier.followSenseEurope.description, #"Follow Sense Europe B.V."#)
    
        // KKM COMPANY LIMITED
        XCTAssertEqual(CompanyIdentifier.kkmCompany.rawValue, 2643)
        XCTAssertEqual(CompanyIdentifier.kkmCompany.name, #"KKM COMPANY LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.kkmCompany.description, #"KKM COMPANY LIMITED"#)
    
        // SQL Technologies Corp.
        XCTAssertEqual(CompanyIdentifier.sqlTechnologies.rawValue, 2644)
        XCTAssertEqual(CompanyIdentifier.sqlTechnologies.name, #"SQL Technologies Corp."#)
        XCTAssertEqual(CompanyIdentifier.sqlTechnologies.description, #"SQL Technologies Corp."#)
    
        // Inugo Systems Limited
        XCTAssertEqual(CompanyIdentifier.inugoSystems.rawValue, 2645)
        XCTAssertEqual(CompanyIdentifier.inugoSystems.name, #"Inugo Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.inugoSystems.description, #"Inugo Systems Limited"#)
    
        // ambie
        XCTAssertEqual(CompanyIdentifier.ambie.rawValue, 2646)
        XCTAssertEqual(CompanyIdentifier.ambie.name, #"ambie"#)
        XCTAssertEqual(CompanyIdentifier.ambie.description, #"ambie"#)
    
        // Meizhou Guo Wei Electronics Co., Ltd
        XCTAssertEqual(CompanyIdentifier.meizhouGuoWeiElectronics.rawValue, 2647)
        XCTAssertEqual(CompanyIdentifier.meizhouGuoWeiElectronics.name, #"Meizhou Guo Wei Electronics Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.meizhouGuoWeiElectronics.description, #"Meizhou Guo Wei Electronics Co., Ltd"#)
    
        // Indigo Diabetes
        XCTAssertEqual(CompanyIdentifier.indigoDiabetes.rawValue, 2648)
        XCTAssertEqual(CompanyIdentifier.indigoDiabetes.name, #"Indigo Diabetes"#)
        XCTAssertEqual(CompanyIdentifier.indigoDiabetes.description, #"Indigo Diabetes"#)
    
        // TourBuilt, LLC
        XCTAssertEqual(CompanyIdentifier.tourbuilt.rawValue, 2649)
        XCTAssertEqual(CompanyIdentifier.tourbuilt.name, #"TourBuilt, LLC"#)
        XCTAssertEqual(CompanyIdentifier.tourbuilt.description, #"TourBuilt, LLC"#)
    
        // Sontheim Industrie Elektronik GmbH
        XCTAssertEqual(CompanyIdentifier.sontheimIndustrieElektronik.rawValue, 2650)
        XCTAssertEqual(CompanyIdentifier.sontheimIndustrieElektronik.name, #"Sontheim Industrie Elektronik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sontheimIndustrieElektronik.description, #"Sontheim Industrie Elektronik GmbH"#)
    
        // LEGIC Identsystems AG
        XCTAssertEqual(CompanyIdentifier.legicIdentsystems.rawValue, 2651)
        XCTAssertEqual(CompanyIdentifier.legicIdentsystems.name, #"LEGIC Identsystems AG"#)
        XCTAssertEqual(CompanyIdentifier.legicIdentsystems.description, #"LEGIC Identsystems AG"#)
    
        // Innovative Design Labs Inc.
        XCTAssertEqual(CompanyIdentifier.innovativeDesignLabs.rawValue, 2652)
        XCTAssertEqual(CompanyIdentifier.innovativeDesignLabs.name, #"Innovative Design Labs Inc."#)
        XCTAssertEqual(CompanyIdentifier.innovativeDesignLabs.description, #"Innovative Design Labs Inc."#)
    
        // MG Energy Systems B.V.
        XCTAssertEqual(CompanyIdentifier.mgEnergySystems.rawValue, 2653)
        XCTAssertEqual(CompanyIdentifier.mgEnergySystems.name, #"MG Energy Systems B.V."#)
        XCTAssertEqual(CompanyIdentifier.mgEnergySystems.description, #"MG Energy Systems B.V."#)
    
        // LaceClips llc
        XCTAssertEqual(CompanyIdentifier.laceclips.rawValue, 2654)
        XCTAssertEqual(CompanyIdentifier.laceclips.name, #"LaceClips llc"#)
        XCTAssertEqual(CompanyIdentifier.laceclips.description, #"LaceClips llc"#)
    
        // stryker
        XCTAssertEqual(CompanyIdentifier.stryker.rawValue, 2655)
        XCTAssertEqual(CompanyIdentifier.stryker.name, #"stryker"#)
        XCTAssertEqual(CompanyIdentifier.stryker.description, #"stryker"#)
    
        // DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD
        XCTAssertEqual(CompanyIdentifier.datangSemiconductorTechnology.rawValue, 2656)
        XCTAssertEqual(CompanyIdentifier.datangSemiconductorTechnology.name, #"DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.datangSemiconductorTechnology.description, #"DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD"#)
    
        // Smart Parks B.V.
        XCTAssertEqual(CompanyIdentifier.smartParks.rawValue, 2657)
        XCTAssertEqual(CompanyIdentifier.smartParks.name, #"Smart Parks B.V."#)
        XCTAssertEqual(CompanyIdentifier.smartParks.description, #"Smart Parks B.V."#)
    
        // MOKO TECHNOLOGY Ltd
        XCTAssertEqual(CompanyIdentifier.mokoTechnology.rawValue, 2658)
        XCTAssertEqual(CompanyIdentifier.mokoTechnology.name, #"MOKO TECHNOLOGY Ltd"#)
        XCTAssertEqual(CompanyIdentifier.mokoTechnology.description, #"MOKO TECHNOLOGY Ltd"#)
    
        // Gremsy JSC
        XCTAssertEqual(CompanyIdentifier.gremsyJsc.rawValue, 2659)
        XCTAssertEqual(CompanyIdentifier.gremsyJsc.name, #"Gremsy JSC"#)
        XCTAssertEqual(CompanyIdentifier.gremsyJsc.description, #"Gremsy JSC"#)
    
        // Geopal system A/S
        XCTAssertEqual(CompanyIdentifier.geopalSystem.rawValue, 2660)
        XCTAssertEqual(CompanyIdentifier.geopalSystem.name, #"Geopal system A/S"#)
        XCTAssertEqual(CompanyIdentifier.geopalSystem.description, #"Geopal system A/S"#)
    
        // Lytx, INC.
        XCTAssertEqual(CompanyIdentifier.lytx.rawValue, 2661)
        XCTAssertEqual(CompanyIdentifier.lytx.name, #"Lytx, INC."#)
        XCTAssertEqual(CompanyIdentifier.lytx.description, #"Lytx, INC."#)
    
        // JUSTMORPH PTE. LTD.
        XCTAssertEqual(CompanyIdentifier.justmorphPte.rawValue, 2662)
        XCTAssertEqual(CompanyIdentifier.justmorphPte.name, #"JUSTMORPH PTE. LTD."#)
        XCTAssertEqual(CompanyIdentifier.justmorphPte.description, #"JUSTMORPH PTE. LTD."#)
    
        // Beijing SuperHexa Century Technology CO. Ltd
        XCTAssertEqual(CompanyIdentifier.beijingSuperhexaCenturyTechnology.rawValue, 2663)
        XCTAssertEqual(CompanyIdentifier.beijingSuperhexaCenturyTechnology.name, #"Beijing SuperHexa Century Technology CO. Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beijingSuperhexaCenturyTechnology.description, #"Beijing SuperHexa Century Technology CO. Ltd"#)
    
        // Focus Ingenieria SRL
        XCTAssertEqual(CompanyIdentifier.focusIngenieria.rawValue, 2664)
        XCTAssertEqual(CompanyIdentifier.focusIngenieria.name, #"Focus Ingenieria SRL"#)
        XCTAssertEqual(CompanyIdentifier.focusIngenieria.description, #"Focus Ingenieria SRL"#)
    
        // HAPPIEST BABY, INC.
        XCTAssertEqual(CompanyIdentifier.happiestBaby.rawValue, 2665)
        XCTAssertEqual(CompanyIdentifier.happiestBaby.name, #"HAPPIEST BABY, INC."#)
        XCTAssertEqual(CompanyIdentifier.happiestBaby.description, #"HAPPIEST BABY, INC."#)
    
        // Scribble Design Inc.
        XCTAssertEqual(CompanyIdentifier.scribbleDesign.rawValue, 2666)
        XCTAssertEqual(CompanyIdentifier.scribbleDesign.name, #"Scribble Design Inc."#)
        XCTAssertEqual(CompanyIdentifier.scribbleDesign.description, #"Scribble Design Inc."#)
    
        // Olympic Ophthalmics, Inc.
        XCTAssertEqual(CompanyIdentifier.olympicOphthalmics.rawValue, 2667)
        XCTAssertEqual(CompanyIdentifier.olympicOphthalmics.name, #"Olympic Ophthalmics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.olympicOphthalmics.description, #"Olympic Ophthalmics, Inc."#)
    
        // Pokkels
        XCTAssertEqual(CompanyIdentifier.pokkels.rawValue, 2668)
        XCTAssertEqual(CompanyIdentifier.pokkels.name, #"Pokkels"#)
        XCTAssertEqual(CompanyIdentifier.pokkels.description, #"Pokkels"#)
    
        // KUUKANJYOKIN Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.kuukanjyokin.rawValue, 2669)
        XCTAssertEqual(CompanyIdentifier.kuukanjyokin.name, #"KUUKANJYOKIN Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.kuukanjyokin.description, #"KUUKANJYOKIN Co.,Ltd."#)
    
        // Pac Sane Limited
        XCTAssertEqual(CompanyIdentifier.pacSane.rawValue, 2670)
        XCTAssertEqual(CompanyIdentifier.pacSane.name, #"Pac Sane Limited"#)
        XCTAssertEqual(CompanyIdentifier.pacSane.description, #"Pac Sane Limited"#)
    
        // Warner Bros.
        XCTAssertEqual(CompanyIdentifier.warnerBros.rawValue, 2671)
        XCTAssertEqual(CompanyIdentifier.warnerBros.name, #"Warner Bros."#)
        XCTAssertEqual(CompanyIdentifier.warnerBros.description, #"Warner Bros."#)
    
        // Ooma
        XCTAssertEqual(CompanyIdentifier.ooma.rawValue, 2672)
        XCTAssertEqual(CompanyIdentifier.ooma.name, #"Ooma"#)
        XCTAssertEqual(CompanyIdentifier.ooma.description, #"Ooma"#)
    
        // Senquip Pty Ltd
        XCTAssertEqual(CompanyIdentifier.senquipPty.rawValue, 2673)
        XCTAssertEqual(CompanyIdentifier.senquipPty.name, #"Senquip Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.senquipPty.description, #"Senquip Pty Ltd"#)
    
        // Jumo GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.jumo.rawValue, 2674)
        XCTAssertEqual(CompanyIdentifier.jumo.name, #"Jumo GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.jumo.description, #"Jumo GmbH & Co. KG"#)
    
        // Innohome Oy
        XCTAssertEqual(CompanyIdentifier.innohome.rawValue, 2675)
        XCTAssertEqual(CompanyIdentifier.innohome.name, #"Innohome Oy"#)
        XCTAssertEqual(CompanyIdentifier.innohome.description, #"Innohome Oy"#)
    
        // MICROSON S.A.
        XCTAssertEqual(CompanyIdentifier.microson.rawValue, 2676)
        XCTAssertEqual(CompanyIdentifier.microson.name, #"MICROSON S.A."#)
        XCTAssertEqual(CompanyIdentifier.microson.description, #"MICROSON S.A."#)
    
        // Delta Cycle Corporation
        XCTAssertEqual(CompanyIdentifier.deltaCycle.rawValue, 2677)
        XCTAssertEqual(CompanyIdentifier.deltaCycle.name, #"Delta Cycle Corporation"#)
        XCTAssertEqual(CompanyIdentifier.deltaCycle.description, #"Delta Cycle Corporation"#)
    
        // Synaptics Incorporated
        XCTAssertEqual(CompanyIdentifier.synaptics.rawValue, 2678)
        XCTAssertEqual(CompanyIdentifier.synaptics.name, #"Synaptics Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.synaptics.description, #"Synaptics Incorporated"#)
    
        // JMD PACIFIC PTE. LTD.
        XCTAssertEqual(CompanyIdentifier.jmdPacificPte.rawValue, 2679)
        XCTAssertEqual(CompanyIdentifier.jmdPacificPte.name, #"JMD PACIFIC PTE. LTD."#)
        XCTAssertEqual(CompanyIdentifier.jmdPacificPte.description, #"JMD PACIFIC PTE. LTD."#)
    
        // Shenzhen Sunricher Technology Limited
        XCTAssertEqual(CompanyIdentifier.shenzhenSunricherTechnology.rawValue, 2680)
        XCTAssertEqual(CompanyIdentifier.shenzhenSunricherTechnology.name, #"Shenzhen Sunricher Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenSunricherTechnology.description, #"Shenzhen Sunricher Technology Limited"#)
    
        // Webasto SE
        XCTAssertEqual(CompanyIdentifier.webastoSe.rawValue, 2681)
        XCTAssertEqual(CompanyIdentifier.webastoSe.name, #"Webasto SE"#)
        XCTAssertEqual(CompanyIdentifier.webastoSe.description, #"Webasto SE"#)
    
        // Emlid Limited
        XCTAssertEqual(CompanyIdentifier.emlid.rawValue, 2682)
        XCTAssertEqual(CompanyIdentifier.emlid.name, #"Emlid Limited"#)
        XCTAssertEqual(CompanyIdentifier.emlid.description, #"Emlid Limited"#)
    
        // UniqAir Oy
        XCTAssertEqual(CompanyIdentifier.uniqair.rawValue, 2683)
        XCTAssertEqual(CompanyIdentifier.uniqair.name, #"UniqAir Oy"#)
        XCTAssertEqual(CompanyIdentifier.uniqair.description, #"UniqAir Oy"#)
    
        // WAFERLOCK
        XCTAssertEqual(CompanyIdentifier.waferlock.rawValue, 2684)
        XCTAssertEqual(CompanyIdentifier.waferlock.name, #"WAFERLOCK"#)
        XCTAssertEqual(CompanyIdentifier.waferlock.description, #"WAFERLOCK"#)
    
        // Freedman Electronics Pty Ltd
        XCTAssertEqual(CompanyIdentifier.freedmanElectronicsPty.rawValue, 2685)
        XCTAssertEqual(CompanyIdentifier.freedmanElectronicsPty.name, #"Freedman Electronics Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.freedmanElectronicsPty.description, #"Freedman Electronics Pty Ltd"#)
    
        // KEBA Handover Automation GmbH
        XCTAssertEqual(CompanyIdentifier.kebaHandoverAutomation.rawValue, 2686)
        XCTAssertEqual(CompanyIdentifier.kebaHandoverAutomation.name, #"KEBA Handover Automation GmbH"#)
        XCTAssertEqual(CompanyIdentifier.kebaHandoverAutomation.description, #"KEBA Handover Automation GmbH"#)
    
        // Intuity Medical
        XCTAssertEqual(CompanyIdentifier.intuityMedical.rawValue, 2687)
        XCTAssertEqual(CompanyIdentifier.intuityMedical.name, #"Intuity Medical"#)
        XCTAssertEqual(CompanyIdentifier.intuityMedical.description, #"Intuity Medical"#)
    
        // Cleer Limited
        XCTAssertEqual(CompanyIdentifier.cleer.rawValue, 2688)
        XCTAssertEqual(CompanyIdentifier.cleer.name, #"Cleer Limited"#)
        XCTAssertEqual(CompanyIdentifier.cleer.description, #"Cleer Limited"#)
    
        // Universal Biosensors Pty Ltd
        XCTAssertEqual(CompanyIdentifier.universalBiosensorsPty.rawValue, 2689)
        XCTAssertEqual(CompanyIdentifier.universalBiosensorsPty.name, #"Universal Biosensors Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.universalBiosensorsPty.description, #"Universal Biosensors Pty Ltd"#)
    
        // Corsair
        XCTAssertEqual(CompanyIdentifier.corsair.rawValue, 2690)
        XCTAssertEqual(CompanyIdentifier.corsair.name, #"Corsair"#)
        XCTAssertEqual(CompanyIdentifier.corsair.description, #"Corsair"#)
    
        // Rivata, Inc.
        XCTAssertEqual(CompanyIdentifier.rivata.rawValue, 2691)
        XCTAssertEqual(CompanyIdentifier.rivata.name, #"Rivata, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rivata.description, #"Rivata, Inc."#)
    
        // Greennote Inc,
        XCTAssertEqual(CompanyIdentifier.greennote.rawValue, 2692)
        XCTAssertEqual(CompanyIdentifier.greennote.name, #"Greennote Inc,"#)
        XCTAssertEqual(CompanyIdentifier.greennote.description, #"Greennote Inc,"#)
    
        // Snowball Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.snowballTechnology.rawValue, 2693)
        XCTAssertEqual(CompanyIdentifier.snowballTechnology.name, #"Snowball Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.snowballTechnology.description, #"Snowball Technology Co., Ltd."#)
    
        // ALIZENT International
        XCTAssertEqual(CompanyIdentifier.alizentInternational.rawValue, 2694)
        XCTAssertEqual(CompanyIdentifier.alizentInternational.name, #"ALIZENT International"#)
        XCTAssertEqual(CompanyIdentifier.alizentInternational.description, #"ALIZENT International"#)
    
        // Shanghai Smart System Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shanghaiSmartSystemTechnology.rawValue, 2695)
        XCTAssertEqual(CompanyIdentifier.shanghaiSmartSystemTechnology.name, #"Shanghai Smart System Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiSmartSystemTechnology.description, #"Shanghai Smart System Technology Co., Ltd"#)
    
        // PSA Peugeot Citroen
        XCTAssertEqual(CompanyIdentifier.psaPeugeotCitroen.rawValue, 2696)
        XCTAssertEqual(CompanyIdentifier.psaPeugeotCitroen.name, #"PSA Peugeot Citroen"#)
        XCTAssertEqual(CompanyIdentifier.psaPeugeotCitroen.description, #"PSA Peugeot Citroen"#)
    
        // SES-Imagotag
        XCTAssertEqual(CompanyIdentifier.sesImagotag.rawValue, 2697)
        XCTAssertEqual(CompanyIdentifier.sesImagotag.name, #"SES-Imagotag"#)
        XCTAssertEqual(CompanyIdentifier.sesImagotag.description, #"SES-Imagotag"#)
    
        // HAINBUCH SPANNENDE TECHNIK
        XCTAssertEqual(CompanyIdentifier.hainbuchSpannendeTechnik.rawValue, 2698)
        XCTAssertEqual(CompanyIdentifier.hainbuchSpannendeTechnik.name, #"HAINBUCH SPANNENDE TECHNIK"#)
        XCTAssertEqual(CompanyIdentifier.hainbuchSpannendeTechnik.description, #"HAINBUCH SPANNENDE TECHNIK"#)
    
        // SANlight GmbH
        XCTAssertEqual(CompanyIdentifier.sanlight.rawValue, 2699)
        XCTAssertEqual(CompanyIdentifier.sanlight.name, #"SANlight GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sanlight.description, #"SANlight GmbH"#)
    
        // DelpSys, s.r.o.
        XCTAssertEqual(CompanyIdentifier.delpsys.rawValue, 2700)
        XCTAssertEqual(CompanyIdentifier.delpsys.name, #"DelpSys, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.delpsys.description, #"DelpSys, s.r.o."#)
    
        // JCM TECHNOLOGIES S.A.
        XCTAssertEqual(CompanyIdentifier.jcmTechnologies.rawValue, 2701)
        XCTAssertEqual(CompanyIdentifier.jcmTechnologies.name, #"JCM TECHNOLOGIES S.A."#)
        XCTAssertEqual(CompanyIdentifier.jcmTechnologies.description, #"JCM TECHNOLOGIES S.A."#)
    
        // Perfect Company
        XCTAssertEqual(CompanyIdentifier.perfectCompany.rawValue, 2702)
        XCTAssertEqual(CompanyIdentifier.perfectCompany.name, #"Perfect Company"#)
        XCTAssertEqual(CompanyIdentifier.perfectCompany.description, #"Perfect Company"#)
    
        // TOTO LTD.
        XCTAssertEqual(CompanyIdentifier.toto.rawValue, 2703)
        XCTAssertEqual(CompanyIdentifier.toto.name, #"TOTO LTD."#)
        XCTAssertEqual(CompanyIdentifier.toto.description, #"TOTO LTD."#)
    
        // Shenzhen Grandsun Electronic Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenGrandsunElectronic.rawValue, 2704)
        XCTAssertEqual(CompanyIdentifier.shenzhenGrandsunElectronic.name, #"Shenzhen Grandsun Electronic Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenGrandsunElectronic.description, #"Shenzhen Grandsun Electronic Co.,Ltd."#)
    
        // Monarch International Inc.
        XCTAssertEqual(CompanyIdentifier.monarchInternational.rawValue, 2705)
        XCTAssertEqual(CompanyIdentifier.monarchInternational.name, #"Monarch International Inc."#)
        XCTAssertEqual(CompanyIdentifier.monarchInternational.description, #"Monarch International Inc."#)
    
        // Carestream Dental LLC
        XCTAssertEqual(CompanyIdentifier.carestreamDental.rawValue, 2706)
        XCTAssertEqual(CompanyIdentifier.carestreamDental.name, #"Carestream Dental LLC"#)
        XCTAssertEqual(CompanyIdentifier.carestreamDental.description, #"Carestream Dental LLC"#)
    
        // GiPStech S.r.l.
        XCTAssertEqual(CompanyIdentifier.gipstech.rawValue, 2707)
        XCTAssertEqual(CompanyIdentifier.gipstech.name, #"GiPStech S.r.l."#)
        XCTAssertEqual(CompanyIdentifier.gipstech.description, #"GiPStech S.r.l."#)
    
        // OOBIK Inc.
        XCTAssertEqual(CompanyIdentifier.oobik.rawValue, 2708)
        XCTAssertEqual(CompanyIdentifier.oobik.name, #"OOBIK Inc."#)
        XCTAssertEqual(CompanyIdentifier.oobik.description, #"OOBIK Inc."#)
    
        // Pamex Inc.
        XCTAssertEqual(CompanyIdentifier.pamex.rawValue, 2709)
        XCTAssertEqual(CompanyIdentifier.pamex.name, #"Pamex Inc."#)
        XCTAssertEqual(CompanyIdentifier.pamex.description, #"Pamex Inc."#)
    
        // Lightricity Ltd
        XCTAssertEqual(CompanyIdentifier.lightricity.rawValue, 2710)
        XCTAssertEqual(CompanyIdentifier.lightricity.name, #"Lightricity Ltd"#)
        XCTAssertEqual(CompanyIdentifier.lightricity.description, #"Lightricity Ltd"#)
    
        // SensTek
        XCTAssertEqual(CompanyIdentifier.senstek.rawValue, 2711)
        XCTAssertEqual(CompanyIdentifier.senstek.name, #"SensTek"#)
        XCTAssertEqual(CompanyIdentifier.senstek.description, #"SensTek"#)
    
        // Foil, Inc.
        XCTAssertEqual(CompanyIdentifier.foil.rawValue, 2712)
        XCTAssertEqual(CompanyIdentifier.foil.name, #"Foil, Inc."#)
        XCTAssertEqual(CompanyIdentifier.foil.description, #"Foil, Inc."#)
    
        // Shanghai high-flying electronics technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.rawValue, 2713)
        XCTAssertEqual(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.name, #"Shanghai high-flying electronics technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.description, #"Shanghai high-flying electronics technology Co.,Ltd"#)
    
        // TEMKIN ASSOCIATES, LLC
        XCTAssertEqual(CompanyIdentifier.temkinsociates.rawValue, 2714)
        XCTAssertEqual(CompanyIdentifier.temkinsociates.name, #"TEMKIN ASSOCIATES, LLC"#)
        XCTAssertEqual(CompanyIdentifier.temkinsociates.description, #"TEMKIN ASSOCIATES, LLC"#)
    
        // Eello LLC
        XCTAssertEqual(CompanyIdentifier.eello.rawValue, 2715)
        XCTAssertEqual(CompanyIdentifier.eello.name, #"Eello LLC"#)
        XCTAssertEqual(CompanyIdentifier.eello.description, #"Eello LLC"#)
    
        // Xi'an Fengyu Information Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.xiAnFengyuInformationTechnology.rawValue, 2716)
        XCTAssertEqual(CompanyIdentifier.xiAnFengyuInformationTechnology.name, #"Xi'an Fengyu Information Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.xiAnFengyuInformationTechnology.description, #"Xi'an Fengyu Information Technology Co., Ltd."#)
    
        // Canon Finetech Nisca Inc.
        XCTAssertEqual(CompanyIdentifier.canonFinetechNisca.rawValue, 2717)
        XCTAssertEqual(CompanyIdentifier.canonFinetechNisca.name, #"Canon Finetech Nisca Inc."#)
        XCTAssertEqual(CompanyIdentifier.canonFinetechNisca.description, #"Canon Finetech Nisca Inc."#)
    
        // LifePlus, Inc.
        XCTAssertEqual(CompanyIdentifier.lifeplus.rawValue, 2718)
        XCTAssertEqual(CompanyIdentifier.lifeplus.name, #"LifePlus, Inc."#)
        XCTAssertEqual(CompanyIdentifier.lifeplus.description, #"LifePlus, Inc."#)
    
        // ista International GmbH
        XCTAssertEqual(CompanyIdentifier.istaInternational.rawValue, 2719)
        XCTAssertEqual(CompanyIdentifier.istaInternational.name, #"ista International GmbH"#)
        XCTAssertEqual(CompanyIdentifier.istaInternational.description, #"ista International GmbH"#)
    
        // Loy Tec electronics GmbH
        XCTAssertEqual(CompanyIdentifier.loyTecElectronics.rawValue, 2720)
        XCTAssertEqual(CompanyIdentifier.loyTecElectronics.name, #"Loy Tec electronics GmbH"#)
        XCTAssertEqual(CompanyIdentifier.loyTecElectronics.description, #"Loy Tec electronics GmbH"#)
    
        // LINCOGN TECHNOLOGY CO. LIMITED
        XCTAssertEqual(CompanyIdentifier.lincognTechnology.rawValue, 2721)
        XCTAssertEqual(CompanyIdentifier.lincognTechnology.name, #"LINCOGN TECHNOLOGY CO. LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.lincognTechnology.description, #"LINCOGN TECHNOLOGY CO. LIMITED"#)
    
        // Care Bloom, LLC
        XCTAssertEqual(CompanyIdentifier.careBloom.rawValue, 2722)
        XCTAssertEqual(CompanyIdentifier.careBloom.name, #"Care Bloom, LLC"#)
        XCTAssertEqual(CompanyIdentifier.careBloom.description, #"Care Bloom, LLC"#)
    
        // DIC Corporation
        XCTAssertEqual(CompanyIdentifier.dic.rawValue, 2723)
        XCTAssertEqual(CompanyIdentifier.dic.name, #"DIC Corporation"#)
        XCTAssertEqual(CompanyIdentifier.dic.description, #"DIC Corporation"#)
    
        // FAZEPRO LLC
        XCTAssertEqual(CompanyIdentifier.fazepro.rawValue, 2724)
        XCTAssertEqual(CompanyIdentifier.fazepro.name, #"FAZEPRO LLC"#)
        XCTAssertEqual(CompanyIdentifier.fazepro.description, #"FAZEPRO LLC"#)
    
        // Shenzhen Uascent Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenUascentTechnology.rawValue, 2725)
        XCTAssertEqual(CompanyIdentifier.shenzhenUascentTechnology.name, #"Shenzhen Uascent Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenUascentTechnology.description, #"Shenzhen Uascent Technology Co., Ltd"#)
    
        // Realityworks, inc.
        XCTAssertEqual(CompanyIdentifier.realityworks.rawValue, 2726)
        XCTAssertEqual(CompanyIdentifier.realityworks.name, #"Realityworks, inc."#)
        XCTAssertEqual(CompanyIdentifier.realityworks.description, #"Realityworks, inc."#)
    
        // Urbanista AB
        XCTAssertEqual(CompanyIdentifier.urbanista.rawValue, 2727)
        XCTAssertEqual(CompanyIdentifier.urbanista.name, #"Urbanista AB"#)
        XCTAssertEqual(CompanyIdentifier.urbanista.description, #"Urbanista AB"#)
    
        // Zencontrol Pty Ltd
        XCTAssertEqual(CompanyIdentifier.zencontrolPty.rawValue, 2728)
        XCTAssertEqual(CompanyIdentifier.zencontrolPty.name, #"Zencontrol Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.zencontrolPty.description, #"Zencontrol Pty Ltd"#)
    
        // Mrinq Technologies LLC
        XCTAssertEqual(CompanyIdentifier.mrinqTechnologies.rawValue, 2729)
        XCTAssertEqual(CompanyIdentifier.mrinqTechnologies.name, #"Mrinq Technologies LLC"#)
        XCTAssertEqual(CompanyIdentifier.mrinqTechnologies.description, #"Mrinq Technologies LLC"#)
    
        // Computime International Ltd
        XCTAssertEqual(CompanyIdentifier.computimeInternational.rawValue, 2730)
        XCTAssertEqual(CompanyIdentifier.computimeInternational.name, #"Computime International Ltd"#)
        XCTAssertEqual(CompanyIdentifier.computimeInternational.description, #"Computime International Ltd"#)
    
        // Anhui Listenai Co
        XCTAssertEqual(CompanyIdentifier.anhuiListenaiCo.rawValue, 2731)
        XCTAssertEqual(CompanyIdentifier.anhuiListenaiCo.name, #"Anhui Listenai Co"#)
        XCTAssertEqual(CompanyIdentifier.anhuiListenaiCo.description, #"Anhui Listenai Co"#)
    
        // OSM HK Limited
        XCTAssertEqual(CompanyIdentifier.osm.rawValue, 2732)
        XCTAssertEqual(CompanyIdentifier.osm.name, #"OSM HK Limited"#)
        XCTAssertEqual(CompanyIdentifier.osm.description, #"OSM HK Limited"#)
    
        // Adevo Consulting AB
        XCTAssertEqual(CompanyIdentifier.adevoConsulting.rawValue, 2733)
        XCTAssertEqual(CompanyIdentifier.adevoConsulting.name, #"Adevo Consulting AB"#)
        XCTAssertEqual(CompanyIdentifier.adevoConsulting.description, #"Adevo Consulting AB"#)
    
        // PS Engineering, Inc.
        XCTAssertEqual(CompanyIdentifier.psEngineering.rawValue, 2734)
        XCTAssertEqual(CompanyIdentifier.psEngineering.name, #"PS Engineering, Inc."#)
        XCTAssertEqual(CompanyIdentifier.psEngineering.description, #"PS Engineering, Inc."#)
    
        // AIAIAI ApS
        XCTAssertEqual(CompanyIdentifier.aiaiai.rawValue, 2735)
        XCTAssertEqual(CompanyIdentifier.aiaiai.name, #"AIAIAI ApS"#)
        XCTAssertEqual(CompanyIdentifier.aiaiai.description, #"AIAIAI ApS"#)
    
        // Visiontronic s.r.o.
        XCTAssertEqual(CompanyIdentifier.visiontronic.rawValue, 2736)
        XCTAssertEqual(CompanyIdentifier.visiontronic.name, #"Visiontronic s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.visiontronic.description, #"Visiontronic s.r.o."#)
    
        // InVue Security Products Inc
        XCTAssertEqual(CompanyIdentifier.invueSecurityProducts.rawValue, 2737)
        XCTAssertEqual(CompanyIdentifier.invueSecurityProducts.name, #"InVue Security Products Inc"#)
        XCTAssertEqual(CompanyIdentifier.invueSecurityProducts.description, #"InVue Security Products Inc"#)
    
        // TouchTronics, Inc.
        XCTAssertEqual(CompanyIdentifier.touchtronics.rawValue, 2738)
        XCTAssertEqual(CompanyIdentifier.touchtronics.name, #"TouchTronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.touchtronics.description, #"TouchTronics, Inc."#)
    
        // INNER RANGE PTY. LTD.
        XCTAssertEqual(CompanyIdentifier.innerRangePty.rawValue, 2739)
        XCTAssertEqual(CompanyIdentifier.innerRangePty.name, #"INNER RANGE PTY. LTD."#)
        XCTAssertEqual(CompanyIdentifier.innerRangePty.description, #"INNER RANGE PTY. LTD."#)
    
        // Ellenby Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.ellenbyTechnologies.rawValue, 2740)
        XCTAssertEqual(CompanyIdentifier.ellenbyTechnologies.name, #"Ellenby Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ellenbyTechnologies.description, #"Ellenby Technologies, Inc."#)
    
        // Elstat Ltd [ Formerly Elstat Electronics Ltd.]
        XCTAssertEqual(CompanyIdentifier.elstatFormerlyElstatElectronics.rawValue, 2741)
        XCTAssertEqual(CompanyIdentifier.elstatFormerlyElstatElectronics.name, #"Elstat Ltd [ Formerly Elstat Electronics Ltd.]"#)
        XCTAssertEqual(CompanyIdentifier.elstatFormerlyElstatElectronics.description, #"Elstat Ltd [ Formerly Elstat Electronics Ltd.]"#)
    
        // Xenter, Inc.
        XCTAssertEqual(CompanyIdentifier.xenter.rawValue, 2742)
        XCTAssertEqual(CompanyIdentifier.xenter.name, #"Xenter, Inc."#)
        XCTAssertEqual(CompanyIdentifier.xenter.description, #"Xenter, Inc."#)
    
        // LogTag North America Inc.
        XCTAssertEqual(CompanyIdentifier.logtagNorthAmerica.rawValue, 2743)
        XCTAssertEqual(CompanyIdentifier.logtagNorthAmerica.name, #"LogTag North America Inc."#)
        XCTAssertEqual(CompanyIdentifier.logtagNorthAmerica.description, #"LogTag North America Inc."#)
    
        // Sens.ai Incorporated
        XCTAssertEqual(CompanyIdentifier.sensAi.rawValue, 2744)
        XCTAssertEqual(CompanyIdentifier.sensAi.name, #"Sens.ai Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.sensAi.description, #"Sens.ai Incorporated"#)
    
        // STL
        XCTAssertEqual(CompanyIdentifier.stl.rawValue, 2745)
        XCTAssertEqual(CompanyIdentifier.stl.name, #"STL"#)
        XCTAssertEqual(CompanyIdentifier.stl.description, #"STL"#)
    
        // Open Bionics Ltd.
        XCTAssertEqual(CompanyIdentifier.openBionics.rawValue, 2746)
        XCTAssertEqual(CompanyIdentifier.openBionics.name, #"Open Bionics Ltd."#)
        XCTAssertEqual(CompanyIdentifier.openBionics.description, #"Open Bionics Ltd."#)
    
        // R-DAS, s.r.o.
        XCTAssertEqual(CompanyIdentifier.rDas.rawValue, 2747)
        XCTAssertEqual(CompanyIdentifier.rDas.name, #"R-DAS, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.rDas.description, #"R-DAS, s.r.o."#)
    
        // KCCS Mobile Engineering Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.kccsMobileEngineering.rawValue, 2748)
        XCTAssertEqual(CompanyIdentifier.kccsMobileEngineering.name, #"KCCS Mobile Engineering Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.kccsMobileEngineering.description, #"KCCS Mobile Engineering Co., Ltd."#)
    
        // Inventas AS
        XCTAssertEqual(CompanyIdentifier.inventas.rawValue, 2749)
        XCTAssertEqual(CompanyIdentifier.inventas.name, #"Inventas AS"#)
        XCTAssertEqual(CompanyIdentifier.inventas.description, #"Inventas AS"#)
    
        // Robkoo Information & Technologies Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.robkooInformationTechnologies.rawValue, 2750)
        XCTAssertEqual(CompanyIdentifier.robkooInformationTechnologies.name, #"Robkoo Information & Technologies Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.robkooInformationTechnologies.description, #"Robkoo Information & Technologies Co., Ltd."#)
    
        // PAUL HARTMANN AG
        XCTAssertEqual(CompanyIdentifier.paulHartmann.rawValue, 2751)
        XCTAssertEqual(CompanyIdentifier.paulHartmann.name, #"PAUL HARTMANN AG"#)
        XCTAssertEqual(CompanyIdentifier.paulHartmann.description, #"PAUL HARTMANN AG"#)
    
        // Omni-ID USA, INC.
        XCTAssertEqual(CompanyIdentifier.omniId.rawValue, 2752)
        XCTAssertEqual(CompanyIdentifier.omniId.name, #"Omni-ID USA, INC."#)
        XCTAssertEqual(CompanyIdentifier.omniId.description, #"Omni-ID USA, INC."#)
    
        // Shenzhen Jingxun Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenJingxunTechnology.rawValue, 2753)
        XCTAssertEqual(CompanyIdentifier.shenzhenJingxunTechnology.name, #"Shenzhen Jingxun Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenJingxunTechnology.description, #"Shenzhen Jingxun Technology Co., Ltd."#)
    
        // RealMega Microelectronics technology (Shanghai) Co. Ltd.
        XCTAssertEqual(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.rawValue, 2754)
        XCTAssertEqual(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.name, #"RealMega Microelectronics technology (Shanghai) Co. Ltd."#)
        XCTAssertEqual(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.description, #"RealMega Microelectronics technology (Shanghai) Co. Ltd."#)
    
        // Kenzen, Inc.
        XCTAssertEqual(CompanyIdentifier.kenzen.rawValue, 2755)
        XCTAssertEqual(CompanyIdentifier.kenzen.name, #"Kenzen, Inc."#)
        XCTAssertEqual(CompanyIdentifier.kenzen.description, #"Kenzen, Inc."#)
    
        // CODIUM
        XCTAssertEqual(CompanyIdentifier.codium.rawValue, 2756)
        XCTAssertEqual(CompanyIdentifier.codium.name, #"CODIUM"#)
        XCTAssertEqual(CompanyIdentifier.codium.description, #"CODIUM"#)
    
        // Flexoptix GmbH
        XCTAssertEqual(CompanyIdentifier.flexoptix.rawValue, 2757)
        XCTAssertEqual(CompanyIdentifier.flexoptix.name, #"Flexoptix GmbH"#)
        XCTAssertEqual(CompanyIdentifier.flexoptix.description, #"Flexoptix GmbH"#)
    
        // Barnes Group Inc.
        XCTAssertEqual(CompanyIdentifier.barnesGroup.rawValue, 2758)
        XCTAssertEqual(CompanyIdentifier.barnesGroup.name, #"Barnes Group Inc."#)
        XCTAssertEqual(CompanyIdentifier.barnesGroup.description, #"Barnes Group Inc."#)
    
        // Chengdu Aich Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.chengduAichTechnology.rawValue, 2759)
        XCTAssertEqual(CompanyIdentifier.chengduAichTechnology.name, #"Chengdu Aich Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.chengduAichTechnology.description, #"Chengdu Aich Technology Co.,Ltd"#)
    
        // Keepin Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.keepin.rawValue, 2760)
        XCTAssertEqual(CompanyIdentifier.keepin.name, #"Keepin Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.keepin.description, #"Keepin Co., Ltd."#)
    
        // Swedlock AB
        XCTAssertEqual(CompanyIdentifier.swedlock.rawValue, 2761)
        XCTAssertEqual(CompanyIdentifier.swedlock.name, #"Swedlock AB"#)
        XCTAssertEqual(CompanyIdentifier.swedlock.description, #"Swedlock AB"#)
    
        // Shenzhen CoolKit Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenCoolkitTechnology.rawValue, 2762)
        XCTAssertEqual(CompanyIdentifier.shenzhenCoolkitTechnology.name, #"Shenzhen CoolKit Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenCoolkitTechnology.description, #"Shenzhen CoolKit Technology Co., Ltd"#)
    
        // ise Individuelle Software und Elektronik GmbH
        XCTAssertEqual(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.rawValue, 2763)
        XCTAssertEqual(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.name, #"ise Individuelle Software und Elektronik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.description, #"ise Individuelle Software und Elektronik GmbH"#)
    
        // Nuvoton
        XCTAssertEqual(CompanyIdentifier.nuvoton.rawValue, 2764)
        XCTAssertEqual(CompanyIdentifier.nuvoton.name, #"Nuvoton"#)
        XCTAssertEqual(CompanyIdentifier.nuvoton.description, #"Nuvoton"#)
    
        // Visuallex Sport International Limited
        XCTAssertEqual(CompanyIdentifier.visuallexSportInternational.rawValue, 2765)
        XCTAssertEqual(CompanyIdentifier.visuallexSportInternational.name, #"Visuallex Sport International Limited"#)
        XCTAssertEqual(CompanyIdentifier.visuallexSportInternational.description, #"Visuallex Sport International Limited"#)
    
        // KOBATA GAUGE MFG. CO., LTD.
        XCTAssertEqual(CompanyIdentifier.kobataGaugeMfg.rawValue, 2766)
        XCTAssertEqual(CompanyIdentifier.kobataGaugeMfg.name, #"KOBATA GAUGE MFG. CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.kobataGaugeMfg.description, #"KOBATA GAUGE MFG. CO., LTD."#)
    
        // CACI Technologies
        XCTAssertEqual(CompanyIdentifier.caciTechnologies.rawValue, 2767)
        XCTAssertEqual(CompanyIdentifier.caciTechnologies.name, #"CACI Technologies"#)
        XCTAssertEqual(CompanyIdentifier.caciTechnologies.description, #"CACI Technologies"#)
    
        // Nordic Strong ApS
        XCTAssertEqual(CompanyIdentifier.nordicStrong.rawValue, 2768)
        XCTAssertEqual(CompanyIdentifier.nordicStrong.name, #"Nordic Strong ApS"#)
        XCTAssertEqual(CompanyIdentifier.nordicStrong.description, #"Nordic Strong ApS"#)
    
        // EAGLE KINGDOM TECHNOLOGIES LIMITED
        XCTAssertEqual(CompanyIdentifier.eagleKingdomTechnologies.rawValue, 2769)
        XCTAssertEqual(CompanyIdentifier.eagleKingdomTechnologies.name, #"EAGLE KINGDOM TECHNOLOGIES LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.eagleKingdomTechnologies.description, #"EAGLE KINGDOM TECHNOLOGIES LIMITED"#)
    
        // Lautsprecher Teufel GmbH
        XCTAssertEqual(CompanyIdentifier.lautsprecherTeufel.rawValue, 2770)
        XCTAssertEqual(CompanyIdentifier.lautsprecherTeufel.name, #"Lautsprecher Teufel GmbH"#)
        XCTAssertEqual(CompanyIdentifier.lautsprecherTeufel.description, #"Lautsprecher Teufel GmbH"#)
    
        // SSV Software Systems GmbH
        XCTAssertEqual(CompanyIdentifier.ssvSoftwareSystems.rawValue, 2771)
        XCTAssertEqual(CompanyIdentifier.ssvSoftwareSystems.name, #"SSV Software Systems GmbH"#)
        XCTAssertEqual(CompanyIdentifier.ssvSoftwareSystems.description, #"SSV Software Systems GmbH"#)
    
        // Zhuhai Pantum Electronisc Co., Ltd
        XCTAssertEqual(CompanyIdentifier.zhuhaiPantumElectronisc.rawValue, 2772)
        XCTAssertEqual(CompanyIdentifier.zhuhaiPantumElectronisc.name, #"Zhuhai Pantum Electronisc Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.zhuhaiPantumElectronisc.description, #"Zhuhai Pantum Electronisc Co., Ltd"#)
    
        // Streamit B.V.
        XCTAssertEqual(CompanyIdentifier.streamit.rawValue, 2773)
        XCTAssertEqual(CompanyIdentifier.streamit.name, #"Streamit B.V."#)
        XCTAssertEqual(CompanyIdentifier.streamit.description, #"Streamit B.V."#)
    
        // nymea GmbH
        XCTAssertEqual(CompanyIdentifier.nymea.rawValue, 2774)
        XCTAssertEqual(CompanyIdentifier.nymea.name, #"nymea GmbH"#)
        XCTAssertEqual(CompanyIdentifier.nymea.description, #"nymea GmbH"#)
    
        // AL-KO Geraete GmbH
        XCTAssertEqual(CompanyIdentifier.alKoGeraete.rawValue, 2775)
        XCTAssertEqual(CompanyIdentifier.alKoGeraete.name, #"AL-KO Geraete GmbH"#)
        XCTAssertEqual(CompanyIdentifier.alKoGeraete.description, #"AL-KO Geraete GmbH"#)
    
        // Franz Kaldewei GmbH&Co KG
        XCTAssertEqual(CompanyIdentifier.franzKaldeweiCoKg.rawValue, 2776)
        XCTAssertEqual(CompanyIdentifier.franzKaldeweiCoKg.name, #"Franz Kaldewei GmbH&Co KG"#)
        XCTAssertEqual(CompanyIdentifier.franzKaldeweiCoKg.description, #"Franz Kaldewei GmbH&Co KG"#)
    
        // Shenzhen Aimore. Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenAimore.rawValue, 2777)
        XCTAssertEqual(CompanyIdentifier.shenzhenAimore.name, #"Shenzhen Aimore. Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenAimore.description, #"Shenzhen Aimore. Co.,Ltd"#)
    
        // Codefabrik GmbH
        XCTAssertEqual(CompanyIdentifier.codefabrik.rawValue, 2778)
        XCTAssertEqual(CompanyIdentifier.codefabrik.name, #"Codefabrik GmbH"#)
        XCTAssertEqual(CompanyIdentifier.codefabrik.description, #"Codefabrik GmbH"#)
    
        // Reelables, Inc.
        XCTAssertEqual(CompanyIdentifier.reelables.rawValue, 2779)
        XCTAssertEqual(CompanyIdentifier.reelables.name, #"Reelables, Inc."#)
        XCTAssertEqual(CompanyIdentifier.reelables.description, #"Reelables, Inc."#)
    
        // Duravit AG
        XCTAssertEqual(CompanyIdentifier.duravit.rawValue, 2780)
        XCTAssertEqual(CompanyIdentifier.duravit.name, #"Duravit AG "#)
        XCTAssertEqual(CompanyIdentifier.duravit.description, #"Duravit AG "#)
    
        // Boss Audio
        XCTAssertEqual(CompanyIdentifier.bossAudio.rawValue, 2781)
        XCTAssertEqual(CompanyIdentifier.bossAudio.name, #"Boss Audio"#)
        XCTAssertEqual(CompanyIdentifier.bossAudio.description, #"Boss Audio"#)
    
        // Vocera Communications, Inc.
        XCTAssertEqual(CompanyIdentifier.voceraCommunications.rawValue, 2782)
        XCTAssertEqual(CompanyIdentifier.voceraCommunications.name, #"Vocera Communications, Inc."#)
        XCTAssertEqual(CompanyIdentifier.voceraCommunications.description, #"Vocera Communications, Inc."#)
    
        // Douglas Dynamics L.L.C.
        XCTAssertEqual(CompanyIdentifier.douglasDynamicsLLC.rawValue, 2783)
        XCTAssertEqual(CompanyIdentifier.douglasDynamicsLLC.name, #"Douglas Dynamics L.L.C."#)
        XCTAssertEqual(CompanyIdentifier.douglasDynamicsLLC.description, #"Douglas Dynamics L.L.C."#)
    
        // Viceroy Devices Corporation
        XCTAssertEqual(CompanyIdentifier.viceroyDevices.rawValue, 2784)
        XCTAssertEqual(CompanyIdentifier.viceroyDevices.name, #"Viceroy Devices Corporation"#)
        XCTAssertEqual(CompanyIdentifier.viceroyDevices.description, #"Viceroy Devices Corporation"#)
    
        // ChengDu ForThink Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.chengduForthinkTechnology.rawValue, 2785)
        XCTAssertEqual(CompanyIdentifier.chengduForthinkTechnology.name, #"ChengDu ForThink Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.chengduForthinkTechnology.description, #"ChengDu ForThink Technology Co., Ltd."#)
    
        // IMATRIX SYSTEMS, INC.
        XCTAssertEqual(CompanyIdentifier.imatrixSystems.rawValue, 2786)
        XCTAssertEqual(CompanyIdentifier.imatrixSystems.name, #"IMATRIX SYSTEMS, INC."#)
        XCTAssertEqual(CompanyIdentifier.imatrixSystems.description, #"IMATRIX SYSTEMS, INC."#)
    
        // GlobalMed
        XCTAssertEqual(CompanyIdentifier.globalmed.rawValue, 2787)
        XCTAssertEqual(CompanyIdentifier.globalmed.name, #"GlobalMed"#)
        XCTAssertEqual(CompanyIdentifier.globalmed.description, #"GlobalMed"#)
    
        // DALI Alliance
        XCTAssertEqual(CompanyIdentifier.daliAlliance.rawValue, 2788)
        XCTAssertEqual(CompanyIdentifier.daliAlliance.name, #"DALI Alliance"#)
        XCTAssertEqual(CompanyIdentifier.daliAlliance.description, #"DALI Alliance"#)
    
        // unu GmbH
        XCTAssertEqual(CompanyIdentifier.unu.rawValue, 2789)
        XCTAssertEqual(CompanyIdentifier.unu.name, #"unu GmbH"#)
        XCTAssertEqual(CompanyIdentifier.unu.description, #"unu GmbH"#)
    
        // Hexology
        XCTAssertEqual(CompanyIdentifier.hexology.rawValue, 2790)
        XCTAssertEqual(CompanyIdentifier.hexology.name, #"Hexology"#)
        XCTAssertEqual(CompanyIdentifier.hexology.description, #"Hexology"#)
    
        // Sunplus Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.sunplusTechnology.rawValue, 2791)
        XCTAssertEqual(CompanyIdentifier.sunplusTechnology.name, #"Sunplus Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sunplusTechnology.description, #"Sunplus Technology Co., Ltd."#)
    
        // LEVEL, s.r.o.
        XCTAssertEqual(CompanyIdentifier.level.rawValue, 2792)
        XCTAssertEqual(CompanyIdentifier.level.name, #"LEVEL, s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.level.description, #"LEVEL, s.r.o."#)
    
        // FLIR Systems AB
        XCTAssertEqual(CompanyIdentifier.flirSystems.rawValue, 2793)
        XCTAssertEqual(CompanyIdentifier.flirSystems.name, #"FLIR Systems AB"#)
        XCTAssertEqual(CompanyIdentifier.flirSystems.description, #"FLIR Systems AB"#)
    
        // Borda Technology
        XCTAssertEqual(CompanyIdentifier.bordaTechnology.rawValue, 2794)
        XCTAssertEqual(CompanyIdentifier.bordaTechnology.name, #"Borda Technology"#)
        XCTAssertEqual(CompanyIdentifier.bordaTechnology.description, #"Borda Technology"#)
    
        // Square, Inc.
        XCTAssertEqual(CompanyIdentifier.square.rawValue, 2795)
        XCTAssertEqual(CompanyIdentifier.square.name, #"Square, Inc."#)
        XCTAssertEqual(CompanyIdentifier.square.description, #"Square, Inc."#)
    
        // FUTEK ADVANCED SENSOR TECHNOLOGY, INC
        XCTAssertEqual(CompanyIdentifier.futekAdvancedSensorTechnology.rawValue, 2796)
        XCTAssertEqual(CompanyIdentifier.futekAdvancedSensorTechnology.name, #"FUTEK ADVANCED SENSOR TECHNOLOGY, INC"#)
        XCTAssertEqual(CompanyIdentifier.futekAdvancedSensorTechnology.description, #"FUTEK ADVANCED SENSOR TECHNOLOGY, INC"#)
    
        // Saxonar GmbH
        XCTAssertEqual(CompanyIdentifier.saxonar.rawValue, 2797)
        XCTAssertEqual(CompanyIdentifier.saxonar.name, #"Saxonar GmbH"#)
        XCTAssertEqual(CompanyIdentifier.saxonar.description, #"Saxonar GmbH"#)
    
        // Velentium, LLC
        XCTAssertEqual(CompanyIdentifier.velentium.rawValue, 2798)
        XCTAssertEqual(CompanyIdentifier.velentium.name, #"Velentium, LLC"#)
        XCTAssertEqual(CompanyIdentifier.velentium.description, #"Velentium, LLC"#)
    
        // GLP German Light Products GmbH
        XCTAssertEqual(CompanyIdentifier.glpGermanLightProducts.rawValue, 2799)
        XCTAssertEqual(CompanyIdentifier.glpGermanLightProducts.name, #"GLP German Light Products GmbH"#)
        XCTAssertEqual(CompanyIdentifier.glpGermanLightProducts.description, #"GLP German Light Products GmbH"#)
    
        // Leupold & Stevens, Inc.
        XCTAssertEqual(CompanyIdentifier.leupoldStevens.rawValue, 2800)
        XCTAssertEqual(CompanyIdentifier.leupoldStevens.name, #"Leupold & Stevens, Inc."#)
        XCTAssertEqual(CompanyIdentifier.leupoldStevens.description, #"Leupold & Stevens, Inc."#)
    
        // CRADERS,CO.,LTD
        XCTAssertEqual(CompanyIdentifier.craders.rawValue, 2801)
        XCTAssertEqual(CompanyIdentifier.craders.name, #"CRADERS,CO.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.craders.description, #"CRADERS,CO.,LTD"#)
    
        // Shanghai All Link Microelectronics Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shanghaiAllLinkMicroelectronics.rawValue, 2802)
        XCTAssertEqual(CompanyIdentifier.shanghaiAllLinkMicroelectronics.name, #"Shanghai All Link Microelectronics Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shanghaiAllLinkMicroelectronics.description, #"Shanghai All Link Microelectronics Co.,Ltd"#)
    
        // 701x Inc.
        XCTAssertEqual(CompanyIdentifier.company701X.rawValue, 2803)
        XCTAssertEqual(CompanyIdentifier.company701X.name, #"701x Inc."#)
        XCTAssertEqual(CompanyIdentifier.company701X.description, #"701x Inc."#)
    
        // Radioworks Microelectronics PTY LTD
        XCTAssertEqual(CompanyIdentifier.radioworksMicroelectronicsPty.rawValue, 2804)
        XCTAssertEqual(CompanyIdentifier.radioworksMicroelectronicsPty.name, #"Radioworks Microelectronics PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.radioworksMicroelectronicsPty.description, #"Radioworks Microelectronics PTY LTD"#)
    
        // Unitech Electronic Inc.
        XCTAssertEqual(CompanyIdentifier.unitechElectronic.rawValue, 2805)
        XCTAssertEqual(CompanyIdentifier.unitechElectronic.name, #"Unitech Electronic Inc."#)
        XCTAssertEqual(CompanyIdentifier.unitechElectronic.description, #"Unitech Electronic Inc."#)
    
        // AMETEK, Inc.
        XCTAssertEqual(CompanyIdentifier.ametek.rawValue, 2806)
        XCTAssertEqual(CompanyIdentifier.ametek.name, #"AMETEK, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ametek.description, #"AMETEK, Inc."#)
    
        // Irdeto
        XCTAssertEqual(CompanyIdentifier.irdeto.rawValue, 2807)
        XCTAssertEqual(CompanyIdentifier.irdeto.name, #"Irdeto"#)
        XCTAssertEqual(CompanyIdentifier.irdeto.description, #"Irdeto"#)
    
        // First Design System Inc.
        XCTAssertEqual(CompanyIdentifier.firstDesignSystem.rawValue, 2808)
        XCTAssertEqual(CompanyIdentifier.firstDesignSystem.name, #"First Design System Inc."#)
        XCTAssertEqual(CompanyIdentifier.firstDesignSystem.description, #"First Design System Inc."#)
    
        // Unisto AG
        XCTAssertEqual(CompanyIdentifier.unisto.rawValue, 2809)
        XCTAssertEqual(CompanyIdentifier.unisto.name, #"Unisto AG"#)
        XCTAssertEqual(CompanyIdentifier.unisto.description, #"Unisto AG"#)
    
        // Chengdu Ambit Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.chengduAmbitTechnology.rawValue, 2810)
        XCTAssertEqual(CompanyIdentifier.chengduAmbitTechnology.name, #"Chengdu Ambit Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.chengduAmbitTechnology.description, #"Chengdu Ambit Technology Co., Ltd."#)
    
        // SMT ELEKTRONIK GmbH
        XCTAssertEqual(CompanyIdentifier.smtElektronik.rawValue, 2811)
        XCTAssertEqual(CompanyIdentifier.smtElektronik.name, #"SMT ELEKTRONIK GmbH"#)
        XCTAssertEqual(CompanyIdentifier.smtElektronik.description, #"SMT ELEKTRONIK GmbH"#)
    
        // Cerebrum Sensor Technologies Inc.
        XCTAssertEqual(CompanyIdentifier.cerebrumSensorTechnologies.rawValue, 2812)
        XCTAssertEqual(CompanyIdentifier.cerebrumSensorTechnologies.name, #"Cerebrum Sensor Technologies Inc."#)
        XCTAssertEqual(CompanyIdentifier.cerebrumSensorTechnologies.description, #"Cerebrum Sensor Technologies Inc."#)
    
        // Weber Sensors, LLC
        XCTAssertEqual(CompanyIdentifier.weberSensors.rawValue, 2813)
        XCTAssertEqual(CompanyIdentifier.weberSensors.name, #"Weber Sensors, LLC"#)
        XCTAssertEqual(CompanyIdentifier.weberSensors.description, #"Weber Sensors, LLC"#)
    
        // Earda Technologies Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.eardaTechnologies.rawValue, 2814)
        XCTAssertEqual(CompanyIdentifier.eardaTechnologies.name, #"Earda Technologies Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.eardaTechnologies.description, #"Earda Technologies Co.,Ltd"#)
    
        // FUSEAWARE LIMITED
        XCTAssertEqual(CompanyIdentifier.fuseaware.rawValue, 2815)
        XCTAssertEqual(CompanyIdentifier.fuseaware.name, #"FUSEAWARE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.fuseaware.description, #"FUSEAWARE LIMITED"#)
    
        // Flaircomm Microelectronics Inc.
        XCTAssertEqual(CompanyIdentifier.flaircommMicroelectronics.rawValue, 2816)
        XCTAssertEqual(CompanyIdentifier.flaircommMicroelectronics.name, #"Flaircomm Microelectronics Inc."#)
        XCTAssertEqual(CompanyIdentifier.flaircommMicroelectronics.description, #"Flaircomm Microelectronics Inc."#)
    
        // RESIDEO TECHNOLOGIES, INC.
        XCTAssertEqual(CompanyIdentifier.resideoTechnologies.rawValue, 2817)
        XCTAssertEqual(CompanyIdentifier.resideoTechnologies.name, #"RESIDEO TECHNOLOGIES, INC."#)
        XCTAssertEqual(CompanyIdentifier.resideoTechnologies.description, #"RESIDEO TECHNOLOGIES, INC."#)
    
        // IORA Technology Development Ltd. Sti.
        XCTAssertEqual(CompanyIdentifier.ioraTechnologyDevelopmentSti.rawValue, 2818)
        XCTAssertEqual(CompanyIdentifier.ioraTechnologyDevelopmentSti.name, #"IORA Technology Development Ltd. Sti."#)
        XCTAssertEqual(CompanyIdentifier.ioraTechnologyDevelopmentSti.description, #"IORA Technology Development Ltd. Sti."#)
    
        // Precision Triathlon Systems Limited
        XCTAssertEqual(CompanyIdentifier.precisionTriathlonSystems.rawValue, 2819)
        XCTAssertEqual(CompanyIdentifier.precisionTriathlonSystems.name, #"Precision Triathlon Systems Limited"#)
        XCTAssertEqual(CompanyIdentifier.precisionTriathlonSystems.description, #"Precision Triathlon Systems Limited"#)
    
        // I-PERCUT
        XCTAssertEqual(CompanyIdentifier.iPercut.rawValue, 2820)
        XCTAssertEqual(CompanyIdentifier.iPercut.name, #"I-PERCUT"#)
        XCTAssertEqual(CompanyIdentifier.iPercut.description, #"I-PERCUT"#)
    
        // Marquardt GmbH
        XCTAssertEqual(CompanyIdentifier.marquardt.rawValue, 2821)
        XCTAssertEqual(CompanyIdentifier.marquardt.name, #"Marquardt GmbH"#)
        XCTAssertEqual(CompanyIdentifier.marquardt.description, #"Marquardt GmbH"#)
    
        // FAZUA GmbH
        XCTAssertEqual(CompanyIdentifier.fazua.rawValue, 2822)
        XCTAssertEqual(CompanyIdentifier.fazua.name, #"FAZUA GmbH"#)
        XCTAssertEqual(CompanyIdentifier.fazua.description, #"FAZUA GmbH"#)
    
        // Workaround Gmbh
        XCTAssertEqual(CompanyIdentifier.workaround.rawValue, 2823)
        XCTAssertEqual(CompanyIdentifier.workaround.name, #"Workaround Gmbh"#)
        XCTAssertEqual(CompanyIdentifier.workaround.description, #"Workaround Gmbh"#)
    
        // Shenzhen Qianfenyi Intelligent Technology Co., LTD
        XCTAssertEqual(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.rawValue, 2824)
        XCTAssertEqual(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.name, #"Shenzhen Qianfenyi Intelligent Technology Co., LTD"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.description, #"Shenzhen Qianfenyi Intelligent Technology Co., LTD"#)
    
        // soonisys
        XCTAssertEqual(CompanyIdentifier.soonisys.rawValue, 2825)
        XCTAssertEqual(CompanyIdentifier.soonisys.name, #"soonisys"#)
        XCTAssertEqual(CompanyIdentifier.soonisys.description, #"soonisys"#)
    
        // Belun Technology Company Limited
        XCTAssertEqual(CompanyIdentifier.belunTechnologyCompany.rawValue, 2826)
        XCTAssertEqual(CompanyIdentifier.belunTechnologyCompany.name, #"Belun Technology Company Limited"#)
        XCTAssertEqual(CompanyIdentifier.belunTechnologyCompany.description, #"Belun Technology Company Limited"#)
    
        // Sanistaal A/S
        XCTAssertEqual(CompanyIdentifier.sanistaal.rawValue, 2827)
        XCTAssertEqual(CompanyIdentifier.sanistaal.name, #"Sanistaal A/S"#)
        XCTAssertEqual(CompanyIdentifier.sanistaal.description, #"Sanistaal A/S"#)
    
        // BluPeak
        XCTAssertEqual(CompanyIdentifier.blupeak.rawValue, 2828)
        XCTAssertEqual(CompanyIdentifier.blupeak.name, #"BluPeak"#)
        XCTAssertEqual(CompanyIdentifier.blupeak.description, #"BluPeak"#)
    
        // SANYO DENKO Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.sanyoDenko.rawValue, 2829)
        XCTAssertEqual(CompanyIdentifier.sanyoDenko.name, #"SANYO DENKO Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sanyoDenko.description, #"SANYO DENKO Co.,Ltd."#)
    
        // Honda Lock Mfg. Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.hondaLockMfg.rawValue, 2830)
        XCTAssertEqual(CompanyIdentifier.hondaLockMfg.name, #"Honda Lock Mfg. Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.hondaLockMfg.description, #"Honda Lock Mfg. Co.,Ltd."#)
    
        // B.E.A. S.A.
        XCTAssertEqual(CompanyIdentifier.bEA.rawValue, 2831)
        XCTAssertEqual(CompanyIdentifier.bEA.name, #"B.E.A. S.A."#)
        XCTAssertEqual(CompanyIdentifier.bEA.description, #"B.E.A. S.A."#)
    
        // Alfa Laval Corporate AB
        XCTAssertEqual(CompanyIdentifier.alfaLavalorate.rawValue, 2832)
        XCTAssertEqual(CompanyIdentifier.alfaLavalorate.name, #"Alfa Laval Corporate AB"#)
        XCTAssertEqual(CompanyIdentifier.alfaLavalorate.description, #"Alfa Laval Corporate AB"#)
    
        // ThermoWorks, Inc.
        XCTAssertEqual(CompanyIdentifier.thermoworks.rawValue, 2833)
        XCTAssertEqual(CompanyIdentifier.thermoworks.name, #"ThermoWorks, Inc."#)
        XCTAssertEqual(CompanyIdentifier.thermoworks.description, #"ThermoWorks, Inc."#)
    
        // ToughBuilt Industries LLC
        XCTAssertEqual(CompanyIdentifier.toughbuiltIndustries.rawValue, 2834)
        XCTAssertEqual(CompanyIdentifier.toughbuiltIndustries.name, #"ToughBuilt Industries LLC"#)
        XCTAssertEqual(CompanyIdentifier.toughbuiltIndustries.description, #"ToughBuilt Industries LLC"#)
    
        // IOTOOLS
        XCTAssertEqual(CompanyIdentifier.iotools.rawValue, 2835)
        XCTAssertEqual(CompanyIdentifier.iotools.name, #"IOTOOLS"#)
        XCTAssertEqual(CompanyIdentifier.iotools.description, #"IOTOOLS"#)
    
        // Olumee
        XCTAssertEqual(CompanyIdentifier.olumee.rawValue, 2836)
        XCTAssertEqual(CompanyIdentifier.olumee.name, #"Olumee"#)
        XCTAssertEqual(CompanyIdentifier.olumee.description, #"Olumee"#)
    
        // NAOS JAPAN K.K.
        XCTAssertEqual(CompanyIdentifier.naosJapanKK.rawValue, 2837)
        XCTAssertEqual(CompanyIdentifier.naosJapanKK.name, #"NAOS JAPAN K.K."#)
        XCTAssertEqual(CompanyIdentifier.naosJapanKK.description, #"NAOS JAPAN K.K."#)
    
        // Guard RFID Solutions Inc.
        XCTAssertEqual(CompanyIdentifier.guardRfidSolutions.rawValue, 2838)
        XCTAssertEqual(CompanyIdentifier.guardRfidSolutions.name, #"Guard RFID Solutions Inc."#)
        XCTAssertEqual(CompanyIdentifier.guardRfidSolutions.description, #"Guard RFID Solutions Inc."#)
    
        // SIG SAUER, INC.
        XCTAssertEqual(CompanyIdentifier.siguer.rawValue, 2839)
        XCTAssertEqual(CompanyIdentifier.siguer.name, #"SIG SAUER, INC."#)
        XCTAssertEqual(CompanyIdentifier.siguer.description, #"SIG SAUER, INC."#)
    
        // DECATHLON SE
        XCTAssertEqual(CompanyIdentifier.decathlonSe.rawValue, 2840)
        XCTAssertEqual(CompanyIdentifier.decathlonSe.name, #"DECATHLON SE"#)
        XCTAssertEqual(CompanyIdentifier.decathlonSe.description, #"DECATHLON SE"#)
    
        // WBS PROJECT H PTY LTD
        XCTAssertEqual(CompanyIdentifier.wbsProjectHPty.rawValue, 2841)
        XCTAssertEqual(CompanyIdentifier.wbsProjectHPty.name, #"WBS PROJECT H PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.wbsProjectHPty.description, #"WBS PROJECT H PTY LTD"#)
    
        // Roca Sanitario, S.A.
        XCTAssertEqual(CompanyIdentifier.rocaSanitario.rawValue, 2842)
        XCTAssertEqual(CompanyIdentifier.rocaSanitario.name, #"Roca Sanitario, S.A."#)
        XCTAssertEqual(CompanyIdentifier.rocaSanitario.description, #"Roca Sanitario, S.A."#)
    
        // Enerpac Tool Group Corp.
        XCTAssertEqual(CompanyIdentifier.enerpacToolGroup.rawValue, 2843)
        XCTAssertEqual(CompanyIdentifier.enerpacToolGroup.name, #"Enerpac Tool Group Corp."#)
        XCTAssertEqual(CompanyIdentifier.enerpacToolGroup.description, #"Enerpac Tool Group Corp."#)
    
        // Nanoleq AG
        XCTAssertEqual(CompanyIdentifier.nanoleq.rawValue, 2844)
        XCTAssertEqual(CompanyIdentifier.nanoleq.name, #"Nanoleq AG"#)
        XCTAssertEqual(CompanyIdentifier.nanoleq.description, #"Nanoleq AG"#)
    
        // Accelerated Systems
        XCTAssertEqual(CompanyIdentifier.acceleratedSystems.rawValue, 2845)
        XCTAssertEqual(CompanyIdentifier.acceleratedSystems.name, #"Accelerated Systems"#)
        XCTAssertEqual(CompanyIdentifier.acceleratedSystems.description, #"Accelerated Systems"#)
    
        // PB INC.
        XCTAssertEqual(CompanyIdentifier.pb.rawValue, 2846)
        XCTAssertEqual(CompanyIdentifier.pb.name, #"PB INC."#)
        XCTAssertEqual(CompanyIdentifier.pb.description, #"PB INC."#)
    
        // Beijing ESWIN Computing Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingEswinComputingTechnology.rawValue, 2847)
        XCTAssertEqual(CompanyIdentifier.beijingEswinComputingTechnology.name, #"Beijing ESWIN Computing Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingEswinComputingTechnology.description, #"Beijing ESWIN Computing Technology Co., Ltd."#)
    
        // TKH Security B.V.
        XCTAssertEqual(CompanyIdentifier.tkhSecurity.rawValue, 2848)
        XCTAssertEqual(CompanyIdentifier.tkhSecurity.name, #"TKH Security B.V."#)
        XCTAssertEqual(CompanyIdentifier.tkhSecurity.description, #"TKH Security B.V."#)
    
        // ams AG
        XCTAssertEqual(CompanyIdentifier.ams.rawValue, 2849)
        XCTAssertEqual(CompanyIdentifier.ams.name, #"ams AG"#)
        XCTAssertEqual(CompanyIdentifier.ams.description, #"ams AG"#)
    
        // Hygiene IQ, LLC.
        XCTAssertEqual(CompanyIdentifier.hygieneIq.rawValue, 2850)
        XCTAssertEqual(CompanyIdentifier.hygieneIq.name, #"Hygiene IQ, LLC."#)
        XCTAssertEqual(CompanyIdentifier.hygieneIq.description, #"Hygiene IQ, LLC."#)
    
        // iRhythm Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.irhythmTechnologies.rawValue, 2851)
        XCTAssertEqual(CompanyIdentifier.irhythmTechnologies.name, #"iRhythm Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.irhythmTechnologies.description, #"iRhythm Technologies, Inc."#)
    
        // BeiJing ZiJie TiaoDong KeJi Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.beijingZijieTiaodongKeji.rawValue, 2852)
        XCTAssertEqual(CompanyIdentifier.beijingZijieTiaodongKeji.name, #"BeiJing ZiJie TiaoDong KeJi Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.beijingZijieTiaodongKeji.description, #"BeiJing ZiJie TiaoDong KeJi Co.,Ltd."#)
    
        // NIBROTECH LTD
        XCTAssertEqual(CompanyIdentifier.nibrotech.rawValue, 2853)
        XCTAssertEqual(CompanyIdentifier.nibrotech.name, #"NIBROTECH LTD"#)
        XCTAssertEqual(CompanyIdentifier.nibrotech.description, #"NIBROTECH LTD"#)
    
        // Baracoda Daily Healthtech.
        XCTAssertEqual(CompanyIdentifier.baracodaDailyHealthtech.rawValue, 2854)
        XCTAssertEqual(CompanyIdentifier.baracodaDailyHealthtech.name, #"Baracoda Daily Healthtech."#)
        XCTAssertEqual(CompanyIdentifier.baracodaDailyHealthtech.description, #"Baracoda Daily Healthtech."#)
    
        // Lumi United Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.lumiUnitedTechnology.rawValue, 2855)
        XCTAssertEqual(CompanyIdentifier.lumiUnitedTechnology.name, #"Lumi United Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.lumiUnitedTechnology.description, #"Lumi United Technology Co., Ltd"#)
    
        // CHACON
        XCTAssertEqual(CompanyIdentifier.chacon.rawValue, 2856)
        XCTAssertEqual(CompanyIdentifier.chacon.name, #"CHACON"#)
        XCTAssertEqual(CompanyIdentifier.chacon.description, #"CHACON"#)
    
        // Tech-Venom Entertainment Private Limited
        XCTAssertEqual(CompanyIdentifier.techVenomEntertainment.rawValue, 2857)
        XCTAssertEqual(CompanyIdentifier.techVenomEntertainment.name, #"Tech-Venom Entertainment Private Limited"#)
        XCTAssertEqual(CompanyIdentifier.techVenomEntertainment.description, #"Tech-Venom Entertainment Private Limited"#)
    
        // ACL Airshop B.V.
        XCTAssertEqual(CompanyIdentifier.aclAirshop.rawValue, 2858)
        XCTAssertEqual(CompanyIdentifier.aclAirshop.name, #"ACL Airshop B.V."#)
        XCTAssertEqual(CompanyIdentifier.aclAirshop.description, #"ACL Airshop B.V."#)
    
        // MAINBOT
        XCTAssertEqual(CompanyIdentifier.mainbot.rawValue, 2859)
        XCTAssertEqual(CompanyIdentifier.mainbot.name, #"MAINBOT"#)
        XCTAssertEqual(CompanyIdentifier.mainbot.description, #"MAINBOT"#)
    
        // ILLUMAGEAR, Inc.
        XCTAssertEqual(CompanyIdentifier.illumagear.rawValue, 2860)
        XCTAssertEqual(CompanyIdentifier.illumagear.name, #"ILLUMAGEAR, Inc."#)
        XCTAssertEqual(CompanyIdentifier.illumagear.description, #"ILLUMAGEAR, Inc."#)
    
        // REDARC ELECTRONICS PTY LTD
        XCTAssertEqual(CompanyIdentifier.redarcElectronicsPty.rawValue, 2861)
        XCTAssertEqual(CompanyIdentifier.redarcElectronicsPty.name, #"REDARC ELECTRONICS PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.redarcElectronicsPty.description, #"REDARC ELECTRONICS PTY LTD"#)
    
        // MOCA System Inc.
        XCTAssertEqual(CompanyIdentifier.mocaSystem.rawValue, 2862)
        XCTAssertEqual(CompanyIdentifier.mocaSystem.name, #"MOCA System Inc."#)
        XCTAssertEqual(CompanyIdentifier.mocaSystem.description, #"MOCA System Inc."#)
    
        // Duke Manufacturing Co
        XCTAssertEqual(CompanyIdentifier.dukeManufacturingCo.rawValue, 2863)
        XCTAssertEqual(CompanyIdentifier.dukeManufacturingCo.name, #"Duke Manufacturing Co"#)
        XCTAssertEqual(CompanyIdentifier.dukeManufacturingCo.description, #"Duke Manufacturing Co"#)
    
        // ART SPA
        XCTAssertEqual(CompanyIdentifier.artSpa.rawValue, 2864)
        XCTAssertEqual(CompanyIdentifier.artSpa.name, #"ART SPA"#)
        XCTAssertEqual(CompanyIdentifier.artSpa.description, #"ART SPA"#)
    
        // Silver Wolf Vehicles Inc.
        XCTAssertEqual(CompanyIdentifier.silverWolfVehicles.rawValue, 2865)
        XCTAssertEqual(CompanyIdentifier.silverWolfVehicles.name, #"Silver Wolf Vehicles Inc."#)
        XCTAssertEqual(CompanyIdentifier.silverWolfVehicles.description, #"Silver Wolf Vehicles Inc."#)
    
        // Hala Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.halaSystems.rawValue, 2866)
        XCTAssertEqual(CompanyIdentifier.halaSystems.name, #"Hala Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.halaSystems.description, #"Hala Systems, Inc."#)
    
        // ARMATURA LLC
        XCTAssertEqual(CompanyIdentifier.armatura.rawValue, 2867)
        XCTAssertEqual(CompanyIdentifier.armatura.name, #"ARMATURA LLC"#)
        XCTAssertEqual(CompanyIdentifier.armatura.description, #"ARMATURA LLC"#)
    
        // CONZUMEX INDUSTRIES PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.conzumexIndustries.rawValue, 2868)
        XCTAssertEqual(CompanyIdentifier.conzumexIndustries.name, #"CONZUMEX INDUSTRIES PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.conzumexIndustries.description, #"CONZUMEX INDUSTRIES PRIVATE LIMITED"#)
    
        // BH Sens
        XCTAssertEqual(CompanyIdentifier.bhSens.rawValue, 2869)
        XCTAssertEqual(CompanyIdentifier.bhSens.name, #"BH Sens"#)
        XCTAssertEqual(CompanyIdentifier.bhSens.description, #"BH Sens"#)
    
        // SINTEF
        XCTAssertEqual(CompanyIdentifier.sintef.rawValue, 2870)
        XCTAssertEqual(CompanyIdentifier.sintef.name, #"SINTEF"#)
        XCTAssertEqual(CompanyIdentifier.sintef.description, #"SINTEF"#)
    
        // Omnivoltaic Energy Solutions Limited Company
        XCTAssertEqual(CompanyIdentifier.omnivoltaicEnergySolutionsCompany.rawValue, 2871)
        XCTAssertEqual(CompanyIdentifier.omnivoltaicEnergySolutionsCompany.name, #"Omnivoltaic Energy Solutions Limited Company"#)
        XCTAssertEqual(CompanyIdentifier.omnivoltaicEnergySolutionsCompany.description, #"Omnivoltaic Energy Solutions Limited Company"#)
    
        // WISYCOM S.R.L.
        XCTAssertEqual(CompanyIdentifier.wisycom.rawValue, 2872)
        XCTAssertEqual(CompanyIdentifier.wisycom.name, #"WISYCOM S.R.L."#)
        XCTAssertEqual(CompanyIdentifier.wisycom.description, #"WISYCOM S.R.L."#)
    
        // Red 100 Lighting Co., ltd.
        XCTAssertEqual(CompanyIdentifier.red100Lighting.rawValue, 2873)
        XCTAssertEqual(CompanyIdentifier.red100Lighting.name, #"Red 100 Lighting Co., ltd."#)
        XCTAssertEqual(CompanyIdentifier.red100Lighting.description, #"Red 100 Lighting Co., ltd."#)
    
        // Impact Biosystems, Inc.
        XCTAssertEqual(CompanyIdentifier.impactBiosystems.rawValue, 2874)
        XCTAssertEqual(CompanyIdentifier.impactBiosystems.name, #"Impact Biosystems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.impactBiosystems.description, #"Impact Biosystems, Inc."#)
    
        // AIC semiconductor (Shanghai) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.aicSemiconductorShanghai.rawValue, 2875)
        XCTAssertEqual(CompanyIdentifier.aicSemiconductorShanghai.name, #"AIC semiconductor (Shanghai) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.aicSemiconductorShanghai.description, #"AIC semiconductor (Shanghai) Co., Ltd."#)
    
        // Dodge Industrial, Inc.
        XCTAssertEqual(CompanyIdentifier.dodgeIndustrial.rawValue, 2876)
        XCTAssertEqual(CompanyIdentifier.dodgeIndustrial.name, #"Dodge Industrial, Inc."#)
        XCTAssertEqual(CompanyIdentifier.dodgeIndustrial.description, #"Dodge Industrial, Inc."#)
    
        // REALTIMEID AS
        XCTAssertEqual(CompanyIdentifier.realtimeid.rawValue, 2877)
        XCTAssertEqual(CompanyIdentifier.realtimeid.name, #"REALTIMEID AS"#)
        XCTAssertEqual(CompanyIdentifier.realtimeid.description, #"REALTIMEID AS"#)
    
        // ISEO Serrature S.p.a.
        XCTAssertEqual(CompanyIdentifier.iseoSerrature.rawValue, 2878)
        XCTAssertEqual(CompanyIdentifier.iseoSerrature.name, #"ISEO Serrature S.p.a."#)
        XCTAssertEqual(CompanyIdentifier.iseoSerrature.description, #"ISEO Serrature S.p.a."#)
    
        // MindRhythm, Inc.
        XCTAssertEqual(CompanyIdentifier.mindrhythm.rawValue, 2879)
        XCTAssertEqual(CompanyIdentifier.mindrhythm.name, #"MindRhythm, Inc."#)
        XCTAssertEqual(CompanyIdentifier.mindrhythm.description, #"MindRhythm, Inc."#)
    
        // Havells India Limited
        XCTAssertEqual(CompanyIdentifier.havellsIndia.rawValue, 2880)
        XCTAssertEqual(CompanyIdentifier.havellsIndia.name, #"Havells India Limited"#)
        XCTAssertEqual(CompanyIdentifier.havellsIndia.description, #"Havells India Limited"#)
    
        // Sentrax GmbH
        XCTAssertEqual(CompanyIdentifier.sentrax.rawValue, 2881)
        XCTAssertEqual(CompanyIdentifier.sentrax.name, #"Sentrax GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sentrax.description, #"Sentrax GmbH"#)
    
        // TSI
        XCTAssertEqual(CompanyIdentifier.tsi.rawValue, 2882)
        XCTAssertEqual(CompanyIdentifier.tsi.name, #"TSI"#)
        XCTAssertEqual(CompanyIdentifier.tsi.description, #"TSI"#)
    
        // INCITAT ENVIRONNEMENT
        XCTAssertEqual(CompanyIdentifier.incitatEnvironnement.rawValue, 2883)
        XCTAssertEqual(CompanyIdentifier.incitatEnvironnement.name, #"INCITAT ENVIRONNEMENT"#)
        XCTAssertEqual(CompanyIdentifier.incitatEnvironnement.description, #"INCITAT ENVIRONNEMENT"#)
    
        // nFore Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.nforeTechnology.rawValue, 2884)
        XCTAssertEqual(CompanyIdentifier.nforeTechnology.name, #"nFore Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nforeTechnology.description, #"nFore Technology Co., Ltd."#)
    
        // Electronic Sensors, Inc.
        XCTAssertEqual(CompanyIdentifier.electronicSensors.rawValue, 2885)
        XCTAssertEqual(CompanyIdentifier.electronicSensors.name, #"Electronic Sensors, Inc."#)
        XCTAssertEqual(CompanyIdentifier.electronicSensors.description, #"Electronic Sensors, Inc."#)
    
        // Bird Rides, Inc.
        XCTAssertEqual(CompanyIdentifier.birdRides.rawValue, 2886)
        XCTAssertEqual(CompanyIdentifier.birdRides.name, #"Bird Rides, Inc."#)
        XCTAssertEqual(CompanyIdentifier.birdRides.description, #"Bird Rides, Inc."#)
    
        // Gentex Corporation
        XCTAssertEqual(CompanyIdentifier.gentex.rawValue, 2887)
        XCTAssertEqual(CompanyIdentifier.gentex.name, #"Gentex Corporation "#)
        XCTAssertEqual(CompanyIdentifier.gentex.description, #"Gentex Corporation "#)
    
        // NIO USA, Inc.
        XCTAssertEqual(CompanyIdentifier.nio.rawValue, 2888)
        XCTAssertEqual(CompanyIdentifier.nio.name, #"NIO USA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.nio.description, #"NIO USA, Inc."#)
    
        // SkyHawke Technologies
        XCTAssertEqual(CompanyIdentifier.skyhawkeTechnologies.rawValue, 2889)
        XCTAssertEqual(CompanyIdentifier.skyhawkeTechnologies.name, #"SkyHawke Technologies"#)
        XCTAssertEqual(CompanyIdentifier.skyhawkeTechnologies.description, #"SkyHawke Technologies"#)
    
        // Nomono AS
        XCTAssertEqual(CompanyIdentifier.nomono.rawValue, 2890)
        XCTAssertEqual(CompanyIdentifier.nomono.name, #"Nomono AS"#)
        XCTAssertEqual(CompanyIdentifier.nomono.description, #"Nomono AS"#)
    
        // EMS Integrators, LLC
        XCTAssertEqual(CompanyIdentifier.emsIntegrators.rawValue, 2891)
        XCTAssertEqual(CompanyIdentifier.emsIntegrators.name, #"EMS Integrators, LLC"#)
        XCTAssertEqual(CompanyIdentifier.emsIntegrators.description, #"EMS Integrators, LLC"#)
    
        // BiosBob.Biz
        XCTAssertEqual(CompanyIdentifier.biosbobBiz.rawValue, 2892)
        XCTAssertEqual(CompanyIdentifier.biosbobBiz.name, #"BiosBob.Biz"#)
        XCTAssertEqual(CompanyIdentifier.biosbobBiz.description, #"BiosBob.Biz"#)
    
        // Adam Hall GmbH
        XCTAssertEqual(CompanyIdentifier.adamHall.rawValue, 2893)
        XCTAssertEqual(CompanyIdentifier.adamHall.name, #"Adam Hall GmbH"#)
        XCTAssertEqual(CompanyIdentifier.adamHall.description, #"Adam Hall GmbH"#)
    
        // ICP Systems B.V.
        XCTAssertEqual(CompanyIdentifier.icpSystems.rawValue, 2894)
        XCTAssertEqual(CompanyIdentifier.icpSystems.name, #"ICP Systems B.V."#)
        XCTAssertEqual(CompanyIdentifier.icpSystems.description, #"ICP Systems B.V."#)
    
        // Breezi.io, Inc.
        XCTAssertEqual(CompanyIdentifier.breeziIo.rawValue, 2895)
        XCTAssertEqual(CompanyIdentifier.breeziIo.name, #"Breezi.io, Inc."#)
        XCTAssertEqual(CompanyIdentifier.breeziIo.description, #"Breezi.io, Inc."#)
    
        // Mesh Systems LLC
        XCTAssertEqual(CompanyIdentifier.meshSystems.rawValue, 2896)
        XCTAssertEqual(CompanyIdentifier.meshSystems.name, #"Mesh Systems LLC"#)
        XCTAssertEqual(CompanyIdentifier.meshSystems.description, #"Mesh Systems LLC"#)
    
        // FUN FACTORY GmbH
        XCTAssertEqual(CompanyIdentifier.funFactory.rawValue, 2897)
        XCTAssertEqual(CompanyIdentifier.funFactory.name, #"FUN FACTORY GmbH"#)
        XCTAssertEqual(CompanyIdentifier.funFactory.description, #"FUN FACTORY GmbH"#)
    
        // ZIIP Inc
        XCTAssertEqual(CompanyIdentifier.ziip.rawValue, 2898)
        XCTAssertEqual(CompanyIdentifier.ziip.name, #"ZIIP Inc"#)
        XCTAssertEqual(CompanyIdentifier.ziip.description, #"ZIIP Inc"#)
    
        // SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.rawValue, 2899)
        XCTAssertEqual(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.name, #"SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.description, #"SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd"#)
    
        // Emotion Fitness GmbH & Co. KG
        XCTAssertEqual(CompanyIdentifier.emotionFitness.rawValue, 2900)
        XCTAssertEqual(CompanyIdentifier.emotionFitness.name, #"Emotion Fitness GmbH & Co. KG"#)
        XCTAssertEqual(CompanyIdentifier.emotionFitness.description, #"Emotion Fitness GmbH & Co. KG"#)
    
        // H G M Automotive Electronics, Inc.
        XCTAssertEqual(CompanyIdentifier.hGMAutomotiveElectronics.rawValue, 2901)
        XCTAssertEqual(CompanyIdentifier.hGMAutomotiveElectronics.name, #"H G M Automotive Electronics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.hGMAutomotiveElectronics.description, #"H G M Automotive Electronics, Inc."#)
    
        // BORA - Vertriebs GmbH & Co KG
        XCTAssertEqual(CompanyIdentifier.boraVertriebs.rawValue, 2902)
        XCTAssertEqual(CompanyIdentifier.boraVertriebs.name, #"BORA - Vertriebs GmbH & Co KG"#)
        XCTAssertEqual(CompanyIdentifier.boraVertriebs.description, #"BORA - Vertriebs GmbH & Co KG"#)
    
        // CONVERTRONIX TECHNOLOGIES AND SERVICES LLP
        XCTAssertEqual(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.rawValue, 2903)
        XCTAssertEqual(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.name, #"CONVERTRONIX TECHNOLOGIES AND SERVICES LLP"#)
        XCTAssertEqual(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.description, #"CONVERTRONIX TECHNOLOGIES AND SERVICES LLP"#)
    
        // TOKAI-DENSHI INC
        XCTAssertEqual(CompanyIdentifier.tokaiDenshi.rawValue, 2904)
        XCTAssertEqual(CompanyIdentifier.tokaiDenshi.name, #"TOKAI-DENSHI INC"#)
        XCTAssertEqual(CompanyIdentifier.tokaiDenshi.description, #"TOKAI-DENSHI INC"#)
    
        // Versa Group B.V.
        XCTAssertEqual(CompanyIdentifier.versaGroup.rawValue, 2905)
        XCTAssertEqual(CompanyIdentifier.versaGroup.name, #"Versa Group B.V."#)
        XCTAssertEqual(CompanyIdentifier.versaGroup.description, #"Versa Group B.V."#)
    
        // H.P. Shelby Manufacturing, LLC.
        XCTAssertEqual(CompanyIdentifier.hPShelbyManufacturing.rawValue, 2906)
        XCTAssertEqual(CompanyIdentifier.hPShelbyManufacturing.name, #"H.P. Shelby Manufacturing, LLC."#)
        XCTAssertEqual(CompanyIdentifier.hPShelbyManufacturing.description, #"H.P. Shelby Manufacturing, LLC."#)
    
        // Shenzhen ImagineVision Technology Limited
        XCTAssertEqual(CompanyIdentifier.shenzhenImaginevisionTechnology.rawValue, 2907)
        XCTAssertEqual(CompanyIdentifier.shenzhenImaginevisionTechnology.name, #"Shenzhen ImagineVision Technology Limited"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenImaginevisionTechnology.description, #"Shenzhen ImagineVision Technology Limited"#)
    
        // Exponential Power, Inc.
        XCTAssertEqual(CompanyIdentifier.exponentialPower.rawValue, 2908)
        XCTAssertEqual(CompanyIdentifier.exponentialPower.name, #"Exponential Power, Inc."#)
        XCTAssertEqual(CompanyIdentifier.exponentialPower.description, #"Exponential Power, Inc."#)
    
        // Fujian Newland Auto-ID Tech. Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.fujianNewlandAutoIdTech.rawValue, 2909)
        XCTAssertEqual(CompanyIdentifier.fujianNewlandAutoIdTech.name, #"Fujian Newland Auto-ID Tech. Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.fujianNewlandAutoIdTech.description, #"Fujian Newland Auto-ID Tech. Co., Ltd."#)
    
        // CELLCONTROL, INC.
        XCTAssertEqual(CompanyIdentifier.cellcontrol.rawValue, 2910)
        XCTAssertEqual(CompanyIdentifier.cellcontrol.name, #"CELLCONTROL, INC."#)
        XCTAssertEqual(CompanyIdentifier.cellcontrol.description, #"CELLCONTROL, INC."#)
    
        // Rivieh, Inc.
        XCTAssertEqual(CompanyIdentifier.rivieh.rawValue, 2911)
        XCTAssertEqual(CompanyIdentifier.rivieh.name, #"Rivieh, Inc."#)
        XCTAssertEqual(CompanyIdentifier.rivieh.description, #"Rivieh, Inc."#)
    
        // RATOC Systems, Inc.
        XCTAssertEqual(CompanyIdentifier.ratocSystems.rawValue, 2912)
        XCTAssertEqual(CompanyIdentifier.ratocSystems.name, #"RATOC Systems, Inc."#)
        XCTAssertEqual(CompanyIdentifier.ratocSystems.description, #"RATOC Systems, Inc."#)
    
        // Sentek Pty Ltd
        XCTAssertEqual(CompanyIdentifier.sentekPty.rawValue, 2913)
        XCTAssertEqual(CompanyIdentifier.sentekPty.name, #"Sentek Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.sentekPty.description, #"Sentek Pty Ltd"#)
    
        // NOVEA ENERGIES
        XCTAssertEqual(CompanyIdentifier.noveaEnergies.rawValue, 2914)
        XCTAssertEqual(CompanyIdentifier.noveaEnergies.name, #"NOVEA ENERGIES"#)
        XCTAssertEqual(CompanyIdentifier.noveaEnergies.description, #"NOVEA ENERGIES"#)
    
        // Innolux Corporation
        XCTAssertEqual(CompanyIdentifier.innolux.rawValue, 2915)
        XCTAssertEqual(CompanyIdentifier.innolux.name, #"Innolux Corporation"#)
        XCTAssertEqual(CompanyIdentifier.innolux.description, #"Innolux Corporation"#)
    
        // NingBo klite Electric Manufacture Co.,LTD
        XCTAssertEqual(CompanyIdentifier.ningboKliteElectricManufacture.rawValue, 2916)
        XCTAssertEqual(CompanyIdentifier.ningboKliteElectricManufacture.name, #"NingBo klite Electric Manufacture Co.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.ningboKliteElectricManufacture.description, #"NingBo klite Electric Manufacture Co.,LTD"#)
    
        // The Apache Software Foundation
        XCTAssertEqual(CompanyIdentifier.apacheSoftwareFoundation.rawValue, 2917)
        XCTAssertEqual(CompanyIdentifier.apacheSoftwareFoundation.name, #"The Apache Software Foundation"#)
        XCTAssertEqual(CompanyIdentifier.apacheSoftwareFoundation.description, #"The Apache Software Foundation"#)
    
        // MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectricAutomationThailandCompany.rawValue, 2918)
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectricAutomationThailandCompany.name, #"MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.mitsubishiElectricAutomationThailandCompany.description, #"MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED"#)
    
        // CleanSpace Technology Pty Ltd
        XCTAssertEqual(CompanyIdentifier.cleanspaceTechnologyPty.rawValue, 2919)
        XCTAssertEqual(CompanyIdentifier.cleanspaceTechnologyPty.name, #"CleanSpace Technology Pty Ltd"#)
        XCTAssertEqual(CompanyIdentifier.cleanspaceTechnologyPty.description, #"CleanSpace Technology Pty Ltd"#)
    
        // Quha oy
        XCTAssertEqual(CompanyIdentifier.quha.rawValue, 2920)
        XCTAssertEqual(CompanyIdentifier.quha.name, #"Quha oy"#)
        XCTAssertEqual(CompanyIdentifier.quha.description, #"Quha oy"#)
    
        // Addaday
        XCTAssertEqual(CompanyIdentifier.addaday.rawValue, 2921)
        XCTAssertEqual(CompanyIdentifier.addaday.name, #"Addaday"#)
        XCTAssertEqual(CompanyIdentifier.addaday.description, #"Addaday"#)
    
        // Dymo
        XCTAssertEqual(CompanyIdentifier.dymo.rawValue, 2922)
        XCTAssertEqual(CompanyIdentifier.dymo.name, #"Dymo"#)
        XCTAssertEqual(CompanyIdentifier.dymo.description, #"Dymo"#)
    
        // Samsara Networks, Inc
        XCTAssertEqual(CompanyIdentifier.samsaraNetworks.rawValue, 2923)
        XCTAssertEqual(CompanyIdentifier.samsaraNetworks.name, #"Samsara Networks, Inc"#)
        XCTAssertEqual(CompanyIdentifier.samsaraNetworks.description, #"Samsara Networks, Inc"#)
    
        // Sensitech, Inc.
        XCTAssertEqual(CompanyIdentifier.sensitech.rawValue, 2924)
        XCTAssertEqual(CompanyIdentifier.sensitech.name, #"Sensitech, Inc."#)
        XCTAssertEqual(CompanyIdentifier.sensitech.description, #"Sensitech, Inc."#)
    
        // SOLUM CO., LTD
        XCTAssertEqual(CompanyIdentifier.solum.rawValue, 2925)
        XCTAssertEqual(CompanyIdentifier.solum.name, #"SOLUM CO., LTD"#)
        XCTAssertEqual(CompanyIdentifier.solum.description, #"SOLUM CO., LTD"#)
    
        // React Mobile
        XCTAssertEqual(CompanyIdentifier.reactMobile.rawValue, 2926)
        XCTAssertEqual(CompanyIdentifier.reactMobile.name, #"React Mobile"#)
        XCTAssertEqual(CompanyIdentifier.reactMobile.description, #"React Mobile"#)
    
        // Shenzhen Malide Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.shenzhenMalideTechnology.rawValue, 2927)
        XCTAssertEqual(CompanyIdentifier.shenzhenMalideTechnology.name, #"Shenzhen Malide Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.shenzhenMalideTechnology.description, #"Shenzhen Malide Technology Co.,Ltd"#)
    
        // JDRF Electromag Engineering Inc
        XCTAssertEqual(CompanyIdentifier.jdrfElectromagEngineering.rawValue, 2928)
        XCTAssertEqual(CompanyIdentifier.jdrfElectromagEngineering.name, #"JDRF Electromag Engineering Inc"#)
        XCTAssertEqual(CompanyIdentifier.jdrfElectromagEngineering.description, #"JDRF Electromag Engineering Inc"#)
    
        // lilbit ODM AS
        XCTAssertEqual(CompanyIdentifier.lilbitOdm.rawValue, 2929)
        XCTAssertEqual(CompanyIdentifier.lilbitOdm.name, #"lilbit ODM AS"#)
        XCTAssertEqual(CompanyIdentifier.lilbitOdm.description, #"lilbit ODM AS"#)
    
        // Geeknet, Inc.
        XCTAssertEqual(CompanyIdentifier.geeknet.rawValue, 2930)
        XCTAssertEqual(CompanyIdentifier.geeknet.name, #"Geeknet, Inc."#)
        XCTAssertEqual(CompanyIdentifier.geeknet.description, #"Geeknet, Inc."#)
    
        // HARADA INDUSTRY CO., LTD.
        XCTAssertEqual(CompanyIdentifier.haradaIndustry.rawValue, 2931)
        XCTAssertEqual(CompanyIdentifier.haradaIndustry.name, #"HARADA INDUSTRY CO., LTD."#)
        XCTAssertEqual(CompanyIdentifier.haradaIndustry.description, #"HARADA INDUSTRY CO., LTD."#)
    
        // BQN
        XCTAssertEqual(CompanyIdentifier.bqn.rawValue, 2932)
        XCTAssertEqual(CompanyIdentifier.bqn.name, #"BQN"#)
        XCTAssertEqual(CompanyIdentifier.bqn.description, #"BQN"#)
    
        // Triple W Japan Inc.
        XCTAssertEqual(CompanyIdentifier.tripleWJapan.rawValue, 2933)
        XCTAssertEqual(CompanyIdentifier.tripleWJapan.name, #"Triple W Japan Inc."#)
        XCTAssertEqual(CompanyIdentifier.tripleWJapan.description, #"Triple W Japan Inc."#)
    
        // MAX-co., ltd
        XCTAssertEqual(CompanyIdentifier.max.rawValue, 2934)
        XCTAssertEqual(CompanyIdentifier.max.name, #"MAX-co., ltd"#)
        XCTAssertEqual(CompanyIdentifier.max.description, #"MAX-co., ltd"#)
    
        // Aixlink(Chengdu) Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.aixlinkChengdu.rawValue, 2935)
        XCTAssertEqual(CompanyIdentifier.aixlinkChengdu.name, #"Aixlink(Chengdu) Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.aixlinkChengdu.description, #"Aixlink(Chengdu) Co., Ltd."#)
    
        // FIELD DESIGN INC.
        XCTAssertEqual(CompanyIdentifier.fieldDesign.rawValue, 2936)
        XCTAssertEqual(CompanyIdentifier.fieldDesign.name, #"FIELD DESIGN INC."#)
        XCTAssertEqual(CompanyIdentifier.fieldDesign.description, #"FIELD DESIGN INC."#)
    
        // Sankyo Air Tech Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.sankyoAirTech.rawValue, 2937)
        XCTAssertEqual(CompanyIdentifier.sankyoAirTech.name, #"Sankyo Air Tech Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.sankyoAirTech.description, #"Sankyo Air Tech Co.,Ltd."#)
    
        // Shenzhen KTC Technology Co.,Ltd.
        XCTAssertEqual(CompanyIdentifier.shenzhenKtcTechnology.rawValue, 2938)
        XCTAssertEqual(CompanyIdentifier.shenzhenKtcTechnology.name, #"Shenzhen KTC Technology Co.,Ltd."#)
        XCTAssertEqual(CompanyIdentifier.shenzhenKtcTechnology.description, #"Shenzhen KTC Technology Co.,Ltd."#)
    
        // Hardcoder Oy
        XCTAssertEqual(CompanyIdentifier.hardcoder.rawValue, 2939)
        XCTAssertEqual(CompanyIdentifier.hardcoder.name, #"Hardcoder Oy"#)
        XCTAssertEqual(CompanyIdentifier.hardcoder.description, #"Hardcoder Oy"#)
    
        // Scangrip A/S
        XCTAssertEqual(CompanyIdentifier.scangrip.rawValue, 2940)
        XCTAssertEqual(CompanyIdentifier.scangrip.name, #"Scangrip A/S"#)
        XCTAssertEqual(CompanyIdentifier.scangrip.description, #"Scangrip A/S"#)
    
        // FoundersLane GmbH
        XCTAssertEqual(CompanyIdentifier.founderslane.rawValue, 2941)
        XCTAssertEqual(CompanyIdentifier.founderslane.name, #"FoundersLane GmbH"#)
        XCTAssertEqual(CompanyIdentifier.founderslane.description, #"FoundersLane GmbH"#)
    
        // Offcode Oy
        XCTAssertEqual(CompanyIdentifier.offcode.rawValue, 2942)
        XCTAssertEqual(CompanyIdentifier.offcode.name, #"Offcode Oy"#)
        XCTAssertEqual(CompanyIdentifier.offcode.description, #"Offcode Oy"#)
    
        // ICU tech GmbH
        XCTAssertEqual(CompanyIdentifier.icuTech.rawValue, 2943)
        XCTAssertEqual(CompanyIdentifier.icuTech.name, #"ICU tech GmbH"#)
        XCTAssertEqual(CompanyIdentifier.icuTech.description, #"ICU tech GmbH"#)
    
        // AXELIFE
        XCTAssertEqual(CompanyIdentifier.axelife.rawValue, 2944)
        XCTAssertEqual(CompanyIdentifier.axelife.name, #"AXELIFE"#)
        XCTAssertEqual(CompanyIdentifier.axelife.description, #"AXELIFE"#)
    
        // SCM Group
        XCTAssertEqual(CompanyIdentifier.scmGroup.rawValue, 2945)
        XCTAssertEqual(CompanyIdentifier.scmGroup.name, #"SCM Group"#)
        XCTAssertEqual(CompanyIdentifier.scmGroup.description, #"SCM Group"#)
    
        // Mammut Sports Group AG
        XCTAssertEqual(CompanyIdentifier.mammutSportsGroup.rawValue, 2946)
        XCTAssertEqual(CompanyIdentifier.mammutSportsGroup.name, #"Mammut Sports Group AG"#)
        XCTAssertEqual(CompanyIdentifier.mammutSportsGroup.description, #"Mammut Sports Group AG"#)
    
        // Taiga Motors Inc.
        XCTAssertEqual(CompanyIdentifier.taigaMotors.rawValue, 2947)
        XCTAssertEqual(CompanyIdentifier.taigaMotors.name, #"Taiga Motors Inc."#)
        XCTAssertEqual(CompanyIdentifier.taigaMotors.description, #"Taiga Motors Inc."#)
    
        // Presidio Medical, Inc.
        XCTAssertEqual(CompanyIdentifier.presidioMedical.rawValue, 2948)
        XCTAssertEqual(CompanyIdentifier.presidioMedical.name, #"Presidio Medical, Inc."#)
        XCTAssertEqual(CompanyIdentifier.presidioMedical.description, #"Presidio Medical, Inc."#)
    
        // VIMANA TECH PTY LTD
        XCTAssertEqual(CompanyIdentifier.vimanaTechPty.rawValue, 2949)
        XCTAssertEqual(CompanyIdentifier.vimanaTechPty.name, #"VIMANA TECH PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.vimanaTechPty.description, #"VIMANA TECH PTY LTD"#)
    
        // Trek Bicycle
        XCTAssertEqual(CompanyIdentifier.trekBicycle.rawValue, 2950)
        XCTAssertEqual(CompanyIdentifier.trekBicycle.name, #"Trek Bicycle"#)
        XCTAssertEqual(CompanyIdentifier.trekBicycle.description, #"Trek Bicycle"#)
    
        // Ampetronic Ltd
        XCTAssertEqual(CompanyIdentifier.ampetronic.rawValue, 2951)
        XCTAssertEqual(CompanyIdentifier.ampetronic.name, #"Ampetronic Ltd"#)
        XCTAssertEqual(CompanyIdentifier.ampetronic.description, #"Ampetronic Ltd"#)
    
        // Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd
        XCTAssertEqual(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.rawValue, 2952)
        XCTAssertEqual(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.name, #"Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd"#)
        XCTAssertEqual(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.description, #"Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd"#)
    
        // Rotronic AG
        XCTAssertEqual(CompanyIdentifier.rotronic.rawValue, 2953)
        XCTAssertEqual(CompanyIdentifier.rotronic.name, #"Rotronic AG"#)
        XCTAssertEqual(CompanyIdentifier.rotronic.description, #"Rotronic AG"#)
    
        // Seiko Instruments Inc.
        XCTAssertEqual(CompanyIdentifier.seikoInstruments.rawValue, 2954)
        XCTAssertEqual(CompanyIdentifier.seikoInstruments.name, #"Seiko Instruments Inc."#)
        XCTAssertEqual(CompanyIdentifier.seikoInstruments.description, #"Seiko Instruments Inc."#)
    
        // American Technology Components, Incorporated
        XCTAssertEqual(CompanyIdentifier.americanTechnologyComponents.rawValue, 2955)
        XCTAssertEqual(CompanyIdentifier.americanTechnologyComponents.name, #"American Technology Components, Incorporated"#)
        XCTAssertEqual(CompanyIdentifier.americanTechnologyComponents.description, #"American Technology Components, Incorporated"#)
    
        // MOTREX
        XCTAssertEqual(CompanyIdentifier.motrex.rawValue, 2956)
        XCTAssertEqual(CompanyIdentifier.motrex.name, #"MOTREX"#)
        XCTAssertEqual(CompanyIdentifier.motrex.description, #"MOTREX"#)
    
        // Pertech Industries Inc
        XCTAssertEqual(CompanyIdentifier.pertechIndustries.rawValue, 2957)
        XCTAssertEqual(CompanyIdentifier.pertechIndustries.name, #"Pertech Industries Inc"#)
        XCTAssertEqual(CompanyIdentifier.pertechIndustries.description, #"Pertech Industries Inc"#)
    
        // Gentle Energy Corp.
        XCTAssertEqual(CompanyIdentifier.gentleEnergy.rawValue, 2958)
        XCTAssertEqual(CompanyIdentifier.gentleEnergy.name, #"Gentle Energy Corp."#)
        XCTAssertEqual(CompanyIdentifier.gentleEnergy.description, #"Gentle Energy Corp."#)
    
        // Senscomm Semiconductor Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.senscommSemiconductor.rawValue, 2959)
        XCTAssertEqual(CompanyIdentifier.senscommSemiconductor.name, #"Senscomm Semiconductor Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.senscommSemiconductor.description, #"Senscomm Semiconductor Co., Ltd."#)
    
        // Ineos Automotive Limited
        XCTAssertEqual(CompanyIdentifier.ineosAutomotive.rawValue, 2960)
        XCTAssertEqual(CompanyIdentifier.ineosAutomotive.name, #"Ineos Automotive Limited"#)
        XCTAssertEqual(CompanyIdentifier.ineosAutomotive.description, #"Ineos Automotive Limited"#)
    
        // Alfen ICU B.V.
        XCTAssertEqual(CompanyIdentifier.alfenIcu.rawValue, 2961)
        XCTAssertEqual(CompanyIdentifier.alfenIcu.name, #"Alfen ICU B.V."#)
        XCTAssertEqual(CompanyIdentifier.alfenIcu.description, #"Alfen ICU B.V."#)
    
        // Citisend Solutions, SL
        XCTAssertEqual(CompanyIdentifier.citisendSolutionsSl.rawValue, 2962)
        XCTAssertEqual(CompanyIdentifier.citisendSolutionsSl.name, #"Citisend Solutions, SL"#)
        XCTAssertEqual(CompanyIdentifier.citisendSolutionsSl.description, #"Citisend Solutions, SL"#)
    
        // Hangzhou BroadLink Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.hangzhouBroadlinkTechnology.rawValue, 2963)
        XCTAssertEqual(CompanyIdentifier.hangzhouBroadlinkTechnology.name, #"Hangzhou BroadLink Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.hangzhouBroadlinkTechnology.description, #"Hangzhou BroadLink Technology Co., Ltd."#)
    
        // Dreem SAS
        XCTAssertEqual(CompanyIdentifier.dreems.rawValue, 2964)
        XCTAssertEqual(CompanyIdentifier.dreems.name, #"Dreem SAS"#)
        XCTAssertEqual(CompanyIdentifier.dreems.description, #"Dreem SAS"#)
    
        // Netwake GmbH
        XCTAssertEqual(CompanyIdentifier.netwake.rawValue, 2965)
        XCTAssertEqual(CompanyIdentifier.netwake.name, #"Netwake GmbH"#)
        XCTAssertEqual(CompanyIdentifier.netwake.description, #"Netwake GmbH"#)
    
        // Telecom Design
        XCTAssertEqual(CompanyIdentifier.telecomDesign.rawValue, 2966)
        XCTAssertEqual(CompanyIdentifier.telecomDesign.name, #"Telecom Design"#)
        XCTAssertEqual(CompanyIdentifier.telecomDesign.description, #"Telecom Design"#)
    
        // SILVER TREE LABS, INC.
        XCTAssertEqual(CompanyIdentifier.silverTreeLabs.rawValue, 2967)
        XCTAssertEqual(CompanyIdentifier.silverTreeLabs.name, #"SILVER TREE LABS, INC."#)
        XCTAssertEqual(CompanyIdentifier.silverTreeLabs.description, #"SILVER TREE LABS, INC."#)
    
        // Gymstory B.V.
        XCTAssertEqual(CompanyIdentifier.gymstory.rawValue, 2968)
        XCTAssertEqual(CompanyIdentifier.gymstory.name, #"Gymstory B.V."#)
        XCTAssertEqual(CompanyIdentifier.gymstory.description, #"Gymstory B.V."#)
    
        // The Goodyear Tire & Rubber Company
        XCTAssertEqual(CompanyIdentifier.goodyearTireRubberCompany.rawValue, 2969)
        XCTAssertEqual(CompanyIdentifier.goodyearTireRubberCompany.name, #"The Goodyear Tire & Rubber Company"#)
        XCTAssertEqual(CompanyIdentifier.goodyearTireRubberCompany.description, #"The Goodyear Tire & Rubber Company"#)
    
        // Beijing Wisepool Infinite Intelligence Technology Co.,Ltd
        XCTAssertEqual(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.rawValue, 2970)
        XCTAssertEqual(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.name, #"Beijing Wisepool Infinite Intelligence Technology Co.,Ltd"#)
        XCTAssertEqual(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.description, #"Beijing Wisepool Infinite Intelligence Technology Co.,Ltd"#)
    
        // GISMAN
        XCTAssertEqual(CompanyIdentifier.gisman.rawValue, 2971)
        XCTAssertEqual(CompanyIdentifier.gisman.name, #"GISMAN"#)
        XCTAssertEqual(CompanyIdentifier.gisman.description, #"GISMAN"#)
    
        // Komatsu Ltd.
        XCTAssertEqual(CompanyIdentifier.komatsu.rawValue, 2972)
        XCTAssertEqual(CompanyIdentifier.komatsu.name, #"Komatsu Ltd."#)
        XCTAssertEqual(CompanyIdentifier.komatsu.description, #"Komatsu Ltd."#)
    
        // Sensoria Holdings LTD
        XCTAssertEqual(CompanyIdentifier.sensoriaHoldings.rawValue, 2973)
        XCTAssertEqual(CompanyIdentifier.sensoriaHoldings.name, #"Sensoria Holdings LTD"#)
        XCTAssertEqual(CompanyIdentifier.sensoriaHoldings.description, #"Sensoria Holdings LTD"#)
    
        // Audio Partnership Plc
        XCTAssertEqual(CompanyIdentifier.audioPartnershipPlc.rawValue, 2974)
        XCTAssertEqual(CompanyIdentifier.audioPartnershipPlc.name, #"Audio Partnership Plc"#)
        XCTAssertEqual(CompanyIdentifier.audioPartnershipPlc.description, #"Audio Partnership Plc"#)
    
        // Group Lotus Limited
        XCTAssertEqual(CompanyIdentifier.groupLotus.rawValue, 2975)
        XCTAssertEqual(CompanyIdentifier.groupLotus.name, #"Group Lotus Limited"#)
        XCTAssertEqual(CompanyIdentifier.groupLotus.description, #"Group Lotus Limited"#)
    
        // Data Sciences International
        XCTAssertEqual(CompanyIdentifier.dataSciencesInternational.rawValue, 2976)
        XCTAssertEqual(CompanyIdentifier.dataSciencesInternational.name, #"Data Sciences International"#)
        XCTAssertEqual(CompanyIdentifier.dataSciencesInternational.description, #"Data Sciences International"#)
    
        // Bunn-O-Matic Corporation
        XCTAssertEqual(CompanyIdentifier.bunnOMatic.rawValue, 2977)
        XCTAssertEqual(CompanyIdentifier.bunnOMatic.name, #"Bunn-O-Matic Corporation"#)
        XCTAssertEqual(CompanyIdentifier.bunnOMatic.description, #"Bunn-O-Matic Corporation"#)
    
        // TireCheck GmbH
        XCTAssertEqual(CompanyIdentifier.tirecheck.rawValue, 2978)
        XCTAssertEqual(CompanyIdentifier.tirecheck.name, #"TireCheck GmbH"#)
        XCTAssertEqual(CompanyIdentifier.tirecheck.description, #"TireCheck GmbH"#)
    
        // Sonova Consumer Hearing GmbH
        XCTAssertEqual(CompanyIdentifier.sonovaConsumerHearing.rawValue, 2979)
        XCTAssertEqual(CompanyIdentifier.sonovaConsumerHearing.name, #"Sonova Consumer Hearing GmbH"#)
        XCTAssertEqual(CompanyIdentifier.sonovaConsumerHearing.description, #"Sonova Consumer Hearing GmbH"#)
    
        // Vervent Audio Group
        XCTAssertEqual(CompanyIdentifier.verventAudioGroup.rawValue, 2980)
        XCTAssertEqual(CompanyIdentifier.verventAudioGroup.name, #"Vervent Audio Group"#)
        XCTAssertEqual(CompanyIdentifier.verventAudioGroup.description, #"Vervent Audio Group"#)
    
        // SONICOS ENTERPRISES, LLC
        XCTAssertEqual(CompanyIdentifier.sonicosEnterprises.rawValue, 2981)
        XCTAssertEqual(CompanyIdentifier.sonicosEnterprises.name, #"SONICOS ENTERPRISES, LLC"#)
        XCTAssertEqual(CompanyIdentifier.sonicosEnterprises.description, #"SONICOS ENTERPRISES, LLC"#)
    
        // Nissan Motor Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.nissanMotor.rawValue, 2982)
        XCTAssertEqual(CompanyIdentifier.nissanMotor.name, #"Nissan Motor Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.nissanMotor.description, #"Nissan Motor Co., Ltd."#)
    
        // hearX Group (Pty) Ltd
        XCTAssertEqual(CompanyIdentifier.hearxGroupPty.rawValue, 2983)
        XCTAssertEqual(CompanyIdentifier.hearxGroupPty.name, #"hearX Group (Pty) Ltd"#)
        XCTAssertEqual(CompanyIdentifier.hearxGroupPty.description, #"hearX Group (Pty) Ltd"#)
    
        // GLOWFORGE INC.
        XCTAssertEqual(CompanyIdentifier.glowforge.rawValue, 2984)
        XCTAssertEqual(CompanyIdentifier.glowforge.name, #"GLOWFORGE INC."#)
        XCTAssertEqual(CompanyIdentifier.glowforge.description, #"GLOWFORGE INC."#)
    
        // Allterco Robotics ltd
        XCTAssertEqual(CompanyIdentifier.alltercoRobotics.rawValue, 2985)
        XCTAssertEqual(CompanyIdentifier.alltercoRobotics.name, #"Allterco Robotics ltd"#)
        XCTAssertEqual(CompanyIdentifier.alltercoRobotics.description, #"Allterco Robotics ltd"#)
    
        // Infinitegra, Inc.
        XCTAssertEqual(CompanyIdentifier.infinitegra.rawValue, 2986)
        XCTAssertEqual(CompanyIdentifier.infinitegra.name, #"Infinitegra, Inc."#)
        XCTAssertEqual(CompanyIdentifier.infinitegra.description, #"Infinitegra, Inc."#)
    
        // Grandex International Corporation
        XCTAssertEqual(CompanyIdentifier.grandexInternational.rawValue, 2987)
        XCTAssertEqual(CompanyIdentifier.grandexInternational.name, #"Grandex International Corporation"#)
        XCTAssertEqual(CompanyIdentifier.grandexInternational.description, #"Grandex International Corporation"#)
    
        // Machfu Inc.
        XCTAssertEqual(CompanyIdentifier.machfu.rawValue, 2988)
        XCTAssertEqual(CompanyIdentifier.machfu.name, #"Machfu Inc."#)
        XCTAssertEqual(CompanyIdentifier.machfu.description, #"Machfu Inc."#)
    
        // Roambotics, Inc.
        XCTAssertEqual(CompanyIdentifier.roambotics.rawValue, 2989)
        XCTAssertEqual(CompanyIdentifier.roambotics.name, #"Roambotics, Inc."#)
        XCTAssertEqual(CompanyIdentifier.roambotics.description, #"Roambotics, Inc."#)
    
        // Soma Labs LLC
        XCTAssertEqual(CompanyIdentifier.somaLabs.rawValue, 2990)
        XCTAssertEqual(CompanyIdentifier.somaLabs.name, #"Soma Labs LLC"#)
        XCTAssertEqual(CompanyIdentifier.somaLabs.description, #"Soma Labs LLC"#)
    
        // NITTO KOGYO CORPORATION
        XCTAssertEqual(CompanyIdentifier.nittoKogyo.rawValue, 2991)
        XCTAssertEqual(CompanyIdentifier.nittoKogyo.name, #"NITTO KOGYO CORPORATION"#)
        XCTAssertEqual(CompanyIdentifier.nittoKogyo.description, #"NITTO KOGYO CORPORATION"#)
    
        // Ecolab Inc.
        XCTAssertEqual(CompanyIdentifier.ecolab.rawValue, 2992)
        XCTAssertEqual(CompanyIdentifier.ecolab.name, #"Ecolab Inc."#)
        XCTAssertEqual(CompanyIdentifier.ecolab.description, #"Ecolab Inc."#)
    
        // Beijing ranxin intelligence technology Co.,LTD
        XCTAssertEqual(CompanyIdentifier.beijingRanxinIntelligenceTechnology.rawValue, 2993)
        XCTAssertEqual(CompanyIdentifier.beijingRanxinIntelligenceTechnology.name, #"Beijing ranxin intelligence technology Co.,LTD"#)
        XCTAssertEqual(CompanyIdentifier.beijingRanxinIntelligenceTechnology.description, #"Beijing ranxin intelligence technology Co.,LTD"#)
    
        // Fjorden Electra AS
        XCTAssertEqual(CompanyIdentifier.fjordenElectra.rawValue, 2994)
        XCTAssertEqual(CompanyIdentifier.fjordenElectra.name, #"Fjorden Electra AS"#)
        XCTAssertEqual(CompanyIdentifier.fjordenElectra.description, #"Fjorden Electra AS"#)
    
        // Flender GmbH
        XCTAssertEqual(CompanyIdentifier.flender.rawValue, 2995)
        XCTAssertEqual(CompanyIdentifier.flender.name, #"Flender GmbH"#)
        XCTAssertEqual(CompanyIdentifier.flender.description, #"Flender GmbH"#)
    
        // New Cosmos USA, Inc.
        XCTAssertEqual(CompanyIdentifier.newCosmos.rawValue, 2996)
        XCTAssertEqual(CompanyIdentifier.newCosmos.name, #"New Cosmos USA, Inc."#)
        XCTAssertEqual(CompanyIdentifier.newCosmos.description, #"New Cosmos USA, Inc."#)
    
        // Xirgo Technologies, LLC
        XCTAssertEqual(CompanyIdentifier.xirgoTechnologies.rawValue, 2997)
        XCTAssertEqual(CompanyIdentifier.xirgoTechnologies.name, #"Xirgo Technologies, LLC"#)
        XCTAssertEqual(CompanyIdentifier.xirgoTechnologies.description, #"Xirgo Technologies, LLC"#)
    
        // Build With Robots Inc.
        XCTAssertEqual(CompanyIdentifier.buildWithRobots.rawValue, 2998)
        XCTAssertEqual(CompanyIdentifier.buildWithRobots.name, #"Build With Robots Inc."#)
        XCTAssertEqual(CompanyIdentifier.buildWithRobots.description, #"Build With Robots Inc."#)
    
        // IONA Tech LLC
        XCTAssertEqual(CompanyIdentifier.ionaTech.rawValue, 2999)
        XCTAssertEqual(CompanyIdentifier.ionaTech.name, #"IONA Tech LLC"#)
        XCTAssertEqual(CompanyIdentifier.ionaTech.description, #"IONA Tech LLC"#)
    
        // INNOVAG PTY. LTD.
        XCTAssertEqual(CompanyIdentifier.innovagPty.rawValue, 3000)
        XCTAssertEqual(CompanyIdentifier.innovagPty.name, #"INNOVAG PTY. LTD."#)
        XCTAssertEqual(CompanyIdentifier.innovagPty.description, #"INNOVAG PTY. LTD."#)
    
        // SaluStim Group Oy
        XCTAssertEqual(CompanyIdentifier.salustimGroup.rawValue, 3001)
        XCTAssertEqual(CompanyIdentifier.salustimGroup.name, #"SaluStim Group Oy"#)
        XCTAssertEqual(CompanyIdentifier.salustimGroup.description, #"SaluStim Group Oy"#)
    
        // Huso, INC
        XCTAssertEqual(CompanyIdentifier.huso.rawValue, 3002)
        XCTAssertEqual(CompanyIdentifier.huso.name, #"Huso, INC"#)
        XCTAssertEqual(CompanyIdentifier.huso.description, #"Huso, INC"#)
    
        // SWISSINNO SOLUTIONS AG
        XCTAssertEqual(CompanyIdentifier.swissinnoSolutions.rawValue, 3003)
        XCTAssertEqual(CompanyIdentifier.swissinnoSolutions.name, #"SWISSINNO SOLUTIONS AG"#)
        XCTAssertEqual(CompanyIdentifier.swissinnoSolutions.description, #"SWISSINNO SOLUTIONS AG"#)
    
        // T2REALITY SOLUTIONS PRIVATE LIMITED
        XCTAssertEqual(CompanyIdentifier.t2RealitySolutions.rawValue, 3004)
        XCTAssertEqual(CompanyIdentifier.t2RealitySolutions.name, #"T2REALITY SOLUTIONS PRIVATE LIMITED"#)
        XCTAssertEqual(CompanyIdentifier.t2RealitySolutions.description, #"T2REALITY SOLUTIONS PRIVATE LIMITED"#)
    
        // ETHEORY PTY LTD
        XCTAssertEqual(CompanyIdentifier.etheoryPty.rawValue, 3005)
        XCTAssertEqual(CompanyIdentifier.etheoryPty.name, #"ETHEORY PTY LTD"#)
        XCTAssertEqual(CompanyIdentifier.etheoryPty.description, #"ETHEORY PTY LTD"#)
    
        // SAAB Aktiebolag
        XCTAssertEqual(CompanyIdentifier.saabAktiebolag.rawValue, 3006)
        XCTAssertEqual(CompanyIdentifier.saabAktiebolag.name, #"SAAB Aktiebolag"#)
        XCTAssertEqual(CompanyIdentifier.saabAktiebolag.description, #"SAAB Aktiebolag"#)
    
        // HIMSA II K/S
        XCTAssertEqual(CompanyIdentifier.himsaIiKS.rawValue, 3007)
        XCTAssertEqual(CompanyIdentifier.himsaIiKS.name, #"HIMSA II K/S"#)
        XCTAssertEqual(CompanyIdentifier.himsaIiKS.description, #"HIMSA II K/S"#)
    
        // READY FOR SKY LLP
        XCTAssertEqual(CompanyIdentifier.readyForSkyLlp.rawValue, 3008)
        XCTAssertEqual(CompanyIdentifier.readyForSkyLlp.name, #"READY FOR SKY LLP"#)
        XCTAssertEqual(CompanyIdentifier.readyForSkyLlp.description, #"READY FOR SKY LLP"#)
    
        // Miele & Cie. KG
        XCTAssertEqual(CompanyIdentifier.mieleCieKg.rawValue, 3009)
        XCTAssertEqual(CompanyIdentifier.mieleCieKg.name, #"Miele & Cie. KG"#)
        XCTAssertEqual(CompanyIdentifier.mieleCieKg.description, #"Miele & Cie. KG"#)
    
        // EntWick Co.
        XCTAssertEqual(CompanyIdentifier.entwick.rawValue, 3010)
        XCTAssertEqual(CompanyIdentifier.entwick.name, #"EntWick Co."#)
        XCTAssertEqual(CompanyIdentifier.entwick.description, #"EntWick Co."#)
    
        // MCOT INC.
        XCTAssertEqual(CompanyIdentifier.mcot.rawValue, 3011)
        XCTAssertEqual(CompanyIdentifier.mcot.name, #"MCOT INC."#)
        XCTAssertEqual(CompanyIdentifier.mcot.description, #"MCOT INC."#)
    
        // TECHTICS ENGINEERING B.V.
        XCTAssertEqual(CompanyIdentifier.techticsEngineering.rawValue, 3012)
        XCTAssertEqual(CompanyIdentifier.techticsEngineering.name, #"TECHTICS ENGINEERING B.V."#)
        XCTAssertEqual(CompanyIdentifier.techticsEngineering.description, #"TECHTICS ENGINEERING B.V."#)
    
        // Aperia Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.aperiaTechnologies.rawValue, 3013)
        XCTAssertEqual(CompanyIdentifier.aperiaTechnologies.name, #"Aperia Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.aperiaTechnologies.description, #"Aperia Technologies, Inc."#)
    
        // TCL COMMUNICATION EQUIPMENT CO.,LTD.
        XCTAssertEqual(CompanyIdentifier.tclCommunicationEquipment.rawValue, 3014)
        XCTAssertEqual(CompanyIdentifier.tclCommunicationEquipment.name, #"TCL COMMUNICATION EQUIPMENT CO.,LTD."#)
        XCTAssertEqual(CompanyIdentifier.tclCommunicationEquipment.description, #"TCL COMMUNICATION EQUIPMENT CO.,LTD."#)
    
        // Signtle Inc.
        XCTAssertEqual(CompanyIdentifier.signtle.rawValue, 3015)
        XCTAssertEqual(CompanyIdentifier.signtle.name, #"Signtle Inc."#)
        XCTAssertEqual(CompanyIdentifier.signtle.description, #"Signtle Inc."#)
    
        // OTF Distribution, LLC
        XCTAssertEqual(CompanyIdentifier.otfDistribution.rawValue, 3016)
        XCTAssertEqual(CompanyIdentifier.otfDistribution.name, #"OTF Distribution, LLC"#)
        XCTAssertEqual(CompanyIdentifier.otfDistribution.description, #"OTF Distribution, LLC"#)
    
        // Neuvatek Inc.
        XCTAssertEqual(CompanyIdentifier.neuvatek.rawValue, 3017)
        XCTAssertEqual(CompanyIdentifier.neuvatek.name, #"Neuvatek Inc."#)
        XCTAssertEqual(CompanyIdentifier.neuvatek.description, #"Neuvatek Inc."#)
    
        // Perimeter Technologies, Inc.
        XCTAssertEqual(CompanyIdentifier.perimeterTechnologies.rawValue, 3018)
        XCTAssertEqual(CompanyIdentifier.perimeterTechnologies.name, #"Perimeter Technologies, Inc."#)
        XCTAssertEqual(CompanyIdentifier.perimeterTechnologies.description, #"Perimeter Technologies, Inc."#)
    
        // Divesoft s.r.o.
        XCTAssertEqual(CompanyIdentifier.divesoft.rawValue, 3019)
        XCTAssertEqual(CompanyIdentifier.divesoft.name, #"Divesoft s.r.o."#)
        XCTAssertEqual(CompanyIdentifier.divesoft.description, #"Divesoft s.r.o."#)
    
        // Sylvac sa
        XCTAssertEqual(CompanyIdentifier.sylvacSa.rawValue, 3020)
        XCTAssertEqual(CompanyIdentifier.sylvacSa.name, #"Sylvac sa"#)
        XCTAssertEqual(CompanyIdentifier.sylvacSa.description, #"Sylvac sa"#)
    
        // Amiko srl
        XCTAssertEqual(CompanyIdentifier.amiko.rawValue, 3021)
        XCTAssertEqual(CompanyIdentifier.amiko.name, #"Amiko srl"#)
        XCTAssertEqual(CompanyIdentifier.amiko.description, #"Amiko srl"#)
    
        // Neurosity, Inc.
        XCTAssertEqual(CompanyIdentifier.neurosity.rawValue, 3022)
        XCTAssertEqual(CompanyIdentifier.neurosity.name, #"Neurosity, Inc."#)
        XCTAssertEqual(CompanyIdentifier.neurosity.description, #"Neurosity, Inc."#)
    
        // LL Tec Group LLC
        XCTAssertEqual(CompanyIdentifier.llTecGroup.rawValue, 3023)
        XCTAssertEqual(CompanyIdentifier.llTecGroup.name, #"LL Tec Group LLC"#)
        XCTAssertEqual(CompanyIdentifier.llTecGroup.description, #"LL Tec Group LLC"#)
    
        // Durag GmbH
        XCTAssertEqual(CompanyIdentifier.durag.rawValue, 3024)
        XCTAssertEqual(CompanyIdentifier.durag.name, #"Durag GmbH"#)
        XCTAssertEqual(CompanyIdentifier.durag.description, #"Durag GmbH"#)
    
        // Hubei Yuanshidai Technology Co., Ltd.
        XCTAssertEqual(CompanyIdentifier.hubeiYuanshidaiTechnology.rawValue, 3025)
        XCTAssertEqual(CompanyIdentifier.hubeiYuanshidaiTechnology.name, #"Hubei Yuanshidai Technology Co., Ltd."#)
        XCTAssertEqual(CompanyIdentifier.hubeiYuanshidaiTechnology.description, #"Hubei Yuanshidai Technology Co., Ltd."#)
    
        // IDEC
        XCTAssertEqual(CompanyIdentifier.idec.rawValue, 3026)
        XCTAssertEqual(CompanyIdentifier.idec.name, #"IDEC"#)
        XCTAssertEqual(CompanyIdentifier.idec.description, #"IDEC"#)
    
        // Procon Analytics, LLC
        XCTAssertEqual(CompanyIdentifier.proconAnalytics.rawValue, 3027)
        XCTAssertEqual(CompanyIdentifier.proconAnalytics.name, #"Procon Analytics, LLC"#)
        XCTAssertEqual(CompanyIdentifier.proconAnalytics.description, #"Procon Analytics, LLC"#)
    
        // ndd Medizintechnik AG
        XCTAssertEqual(CompanyIdentifier.nddMedizintechnik.rawValue, 3028)
        XCTAssertEqual(CompanyIdentifier.nddMedizintechnik.name, #"ndd Medizintechnik AG"#)
        XCTAssertEqual(CompanyIdentifier.nddMedizintechnik.description, #"ndd Medizintechnik AG"#)
    
        // Super B Lithium Power B.V.
        XCTAssertEqual(CompanyIdentifier.superBLithiumPower.rawValue, 3029)
        XCTAssertEqual(CompanyIdentifier.superBLithiumPower.name, #"Super B Lithium Power B.V."#)
        XCTAssertEqual(CompanyIdentifier.superBLithiumPower.description, #"Super B Lithium Power B.V."#)
    
        // Injoinic
        XCTAssertEqual(CompanyIdentifier.injoinic.rawValue, 3030)
        XCTAssertEqual(CompanyIdentifier.injoinic.name, #"Injoinic"#)
        XCTAssertEqual(CompanyIdentifier.injoinic.description, #"Injoinic"#)
    
        // VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY
        XCTAssertEqual(CompanyIdentifier.vinfastTradingAndProductionJointStockCompany.rawValue, 3031)
        XCTAssertEqual(CompanyIdentifier.vinfastTradingAndProductionJointStockCompany.name, #"VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY"#)
        XCTAssertEqual(CompanyIdentifier.vinfastTradingAndProductionJointStockCompany.description, #"VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY"#)
    
    }

}
#endif
// swiftlint:enable type_body_length
