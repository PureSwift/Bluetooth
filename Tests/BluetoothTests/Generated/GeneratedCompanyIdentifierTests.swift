//
//  CompanyIdentifierTests.swift
//  Bluetooth
//

import Foundation
import Testing
@testable import Bluetooth

// swiftlint:disable type_body_length
#if !SWIFTPM_ENABLE_PLUGINS && !os(WASI)
@Suite
struct CompanyIdentifierTests {
    
    @Test func companies() {

        // Ericsson AB
        #expect(CompanyIdentifier.ericsson.rawValue == 0)
        #expect(CompanyIdentifier.ericsson.name == #"Ericsson AB"#)
        #expect(CompanyIdentifier.ericsson.description == #"Ericsson AB"#)
    
        // Nokia Mobile Phones
        #expect(CompanyIdentifier.nokiaMobilePhones.rawValue == 1)
        #expect(CompanyIdentifier.nokiaMobilePhones.name == #"Nokia Mobile Phones"#)
        #expect(CompanyIdentifier.nokiaMobilePhones.description == #"Nokia Mobile Phones"#)
    
        // Intel Corp.
        #expect(CompanyIdentifier.intel.rawValue == 2)
        #expect(CompanyIdentifier.intel.name == #"Intel Corp."#)
        #expect(CompanyIdentifier.intel.description == #"Intel Corp."#)
    
        // IBM Corp.
        #expect(CompanyIdentifier.ibm.rawValue == 3)
        #expect(CompanyIdentifier.ibm.name == #"IBM Corp."#)
        #expect(CompanyIdentifier.ibm.description == #"IBM Corp."#)
    
        // Toshiba Corp.
        #expect(CompanyIdentifier.toshiba.rawValue == 4)
        #expect(CompanyIdentifier.toshiba.name == #"Toshiba Corp."#)
        #expect(CompanyIdentifier.toshiba.description == #"Toshiba Corp."#)
    
        // 3Com
        #expect(CompanyIdentifier.company3Com.rawValue == 5)
        #expect(CompanyIdentifier.company3Com.name == #"3Com"#)
        #expect(CompanyIdentifier.company3Com.description == #"3Com"#)
    
        // Microsoft
        #expect(CompanyIdentifier.microsoft.rawValue == 6)
        #expect(CompanyIdentifier.microsoft.name == #"Microsoft"#)
        #expect(CompanyIdentifier.microsoft.description == #"Microsoft"#)
    
        // Lucent
        #expect(CompanyIdentifier.lucent.rawValue == 7)
        #expect(CompanyIdentifier.lucent.name == #"Lucent"#)
        #expect(CompanyIdentifier.lucent.description == #"Lucent"#)
    
        // Motorola
        #expect(CompanyIdentifier.motorola.rawValue == 8)
        #expect(CompanyIdentifier.motorola.name == #"Motorola"#)
        #expect(CompanyIdentifier.motorola.description == #"Motorola"#)
    
        // Infineon Technologies AG
        #expect(CompanyIdentifier.infineonTechnologies.rawValue == 9)
        #expect(CompanyIdentifier.infineonTechnologies.name == #"Infineon Technologies AG"#)
        #expect(CompanyIdentifier.infineonTechnologies.description == #"Infineon Technologies AG"#)
    
        // Qualcomm Technologies International, Ltd. (QTIL)
        #expect(CompanyIdentifier.qualcommTechnologiesInternational.rawValue == 10)
        #expect(CompanyIdentifier.qualcommTechnologiesInternational.name == #"Qualcomm Technologies International, Ltd. (QTIL)"#)
        #expect(CompanyIdentifier.qualcommTechnologiesInternational.description == #"Qualcomm Technologies International, Ltd. (QTIL)"#)
    
        // Silicon Wave
        #expect(CompanyIdentifier.siliconWave.rawValue == 11)
        #expect(CompanyIdentifier.siliconWave.name == #"Silicon Wave"#)
        #expect(CompanyIdentifier.siliconWave.description == #"Silicon Wave"#)
    
        // Digianswer A/S
        #expect(CompanyIdentifier.digianswer.rawValue == 12)
        #expect(CompanyIdentifier.digianswer.name == #"Digianswer A/S"#)
        #expect(CompanyIdentifier.digianswer.description == #"Digianswer A/S"#)
    
        // Texas Instruments Inc.
        #expect(CompanyIdentifier.texasInstruments.rawValue == 13)
        #expect(CompanyIdentifier.texasInstruments.name == #"Texas Instruments Inc."#)
        #expect(CompanyIdentifier.texasInstruments.description == #"Texas Instruments Inc."#)
    
        // Parthus Technologies Inc.
        #expect(CompanyIdentifier.parthusTechnologies.rawValue == 14)
        #expect(CompanyIdentifier.parthusTechnologies.name == #"Parthus Technologies Inc."#)
        #expect(CompanyIdentifier.parthusTechnologies.description == #"Parthus Technologies Inc."#)
    
        // Broadcom Corporation
        #expect(CompanyIdentifier.broadcom.rawValue == 15)
        #expect(CompanyIdentifier.broadcom.name == #"Broadcom Corporation"#)
        #expect(CompanyIdentifier.broadcom.description == #"Broadcom Corporation"#)
    
        // Mitel Semiconductor
        #expect(CompanyIdentifier.mitelSemiconductor.rawValue == 16)
        #expect(CompanyIdentifier.mitelSemiconductor.name == #"Mitel Semiconductor"#)
        #expect(CompanyIdentifier.mitelSemiconductor.description == #"Mitel Semiconductor"#)
    
        // Widcomm, Inc.
        #expect(CompanyIdentifier.widcomm.rawValue == 17)
        #expect(CompanyIdentifier.widcomm.name == #"Widcomm, Inc."#)
        #expect(CompanyIdentifier.widcomm.description == #"Widcomm, Inc."#)
    
        // Zeevo, Inc.
        #expect(CompanyIdentifier.zeevo.rawValue == 18)
        #expect(CompanyIdentifier.zeevo.name == #"Zeevo, Inc."#)
        #expect(CompanyIdentifier.zeevo.description == #"Zeevo, Inc."#)
    
        // Atmel Corporation
        #expect(CompanyIdentifier.atmel.rawValue == 19)
        #expect(CompanyIdentifier.atmel.name == #"Atmel Corporation"#)
        #expect(CompanyIdentifier.atmel.description == #"Atmel Corporation"#)
    
        // Mitsubishi Electric Corporation
        #expect(CompanyIdentifier.mitsubishiElectric.rawValue == 20)
        #expect(CompanyIdentifier.mitsubishiElectric.name == #"Mitsubishi Electric Corporation"#)
        #expect(CompanyIdentifier.mitsubishiElectric.description == #"Mitsubishi Electric Corporation"#)
    
        // RTX A/S
        #expect(CompanyIdentifier.rtx.rawValue == 21)
        #expect(CompanyIdentifier.rtx.name == #"RTX A/S"#)
        #expect(CompanyIdentifier.rtx.description == #"RTX A/S"#)
    
        // KC Technology Inc.
        #expect(CompanyIdentifier.kcTechnology.rawValue == 22)
        #expect(CompanyIdentifier.kcTechnology.name == #"KC Technology Inc."#)
        #expect(CompanyIdentifier.kcTechnology.description == #"KC Technology Inc."#)
    
        // Newlogic
        #expect(CompanyIdentifier.newlogic.rawValue == 23)
        #expect(CompanyIdentifier.newlogic.name == #"Newlogic"#)
        #expect(CompanyIdentifier.newlogic.description == #"Newlogic"#)
    
        // Transilica, Inc.
        #expect(CompanyIdentifier.transilica.rawValue == 24)
        #expect(CompanyIdentifier.transilica.name == #"Transilica, Inc."#)
        #expect(CompanyIdentifier.transilica.description == #"Transilica, Inc."#)
    
        // Rohde & Schwarz GmbH & Co. KG
        #expect(CompanyIdentifier.rohdeSchwarz.rawValue == 25)
        #expect(CompanyIdentifier.rohdeSchwarz.name == #"Rohde & Schwarz GmbH & Co. KG"#)
        #expect(CompanyIdentifier.rohdeSchwarz.description == #"Rohde & Schwarz GmbH & Co. KG"#)
    
        // TTPCom Limited
        #expect(CompanyIdentifier.ttpcom.rawValue == 26)
        #expect(CompanyIdentifier.ttpcom.name == #"TTPCom Limited"#)
        #expect(CompanyIdentifier.ttpcom.description == #"TTPCom Limited"#)
    
        // Signia Technologies, Inc.
        #expect(CompanyIdentifier.signiaTechnologies.rawValue == 27)
        #expect(CompanyIdentifier.signiaTechnologies.name == #"Signia Technologies, Inc."#)
        #expect(CompanyIdentifier.signiaTechnologies.description == #"Signia Technologies, Inc."#)
    
        // Conexant Systems Inc.
        #expect(CompanyIdentifier.conexantSystems.rawValue == 28)
        #expect(CompanyIdentifier.conexantSystems.name == #"Conexant Systems Inc."#)
        #expect(CompanyIdentifier.conexantSystems.description == #"Conexant Systems Inc."#)
    
        // Qualcomm
        #expect(CompanyIdentifier.qualcomm.rawValue == 29)
        #expect(CompanyIdentifier.qualcomm.name == #"Qualcomm"#)
        #expect(CompanyIdentifier.qualcomm.description == #"Qualcomm"#)
    
        // Inventel
        #expect(CompanyIdentifier.inventel.rawValue == 30)
        #expect(CompanyIdentifier.inventel.name == #"Inventel"#)
        #expect(CompanyIdentifier.inventel.description == #"Inventel"#)
    
        // AVM Berlin
        #expect(CompanyIdentifier.avmBerlin.rawValue == 31)
        #expect(CompanyIdentifier.avmBerlin.name == #"AVM Berlin"#)
        #expect(CompanyIdentifier.avmBerlin.description == #"AVM Berlin"#)
    
        // BandSpeed, Inc.
        #expect(CompanyIdentifier.bandspeed.rawValue == 32)
        #expect(CompanyIdentifier.bandspeed.name == #"BandSpeed, Inc."#)
        #expect(CompanyIdentifier.bandspeed.description == #"BandSpeed, Inc."#)
    
        // Mansella Ltd
        #expect(CompanyIdentifier.mansella.rawValue == 33)
        #expect(CompanyIdentifier.mansella.name == #"Mansella Ltd"#)
        #expect(CompanyIdentifier.mansella.description == #"Mansella Ltd"#)
    
        // NEC Corporation
        #expect(CompanyIdentifier.nec.rawValue == 34)
        #expect(CompanyIdentifier.nec.name == #"NEC Corporation"#)
        #expect(CompanyIdentifier.nec.description == #"NEC Corporation"#)
    
        // WavePlus Technology Co., Ltd.
        #expect(CompanyIdentifier.waveplusTechnology.rawValue == 35)
        #expect(CompanyIdentifier.waveplusTechnology.name == #"WavePlus Technology Co., Ltd."#)
        #expect(CompanyIdentifier.waveplusTechnology.description == #"WavePlus Technology Co., Ltd."#)
    
        // Alcatel
        #expect(CompanyIdentifier.alcatel.rawValue == 36)
        #expect(CompanyIdentifier.alcatel.name == #"Alcatel"#)
        #expect(CompanyIdentifier.alcatel.description == #"Alcatel"#)
    
        // NXP B.V.
        #expect(CompanyIdentifier.nxp.rawValue == 37)
        #expect(CompanyIdentifier.nxp.name == #"NXP B.V."#)
        #expect(CompanyIdentifier.nxp.description == #"NXP B.V."#)
    
        // C Technologies
        #expect(CompanyIdentifier.cTechnologies.rawValue == 38)
        #expect(CompanyIdentifier.cTechnologies.name == #"C Technologies"#)
        #expect(CompanyIdentifier.cTechnologies.description == #"C Technologies"#)
    
        // Open Interface
        #expect(CompanyIdentifier.openInterface.rawValue == 39)
        #expect(CompanyIdentifier.openInterface.name == #"Open Interface"#)
        #expect(CompanyIdentifier.openInterface.description == #"Open Interface"#)
    
        // R F Micro Devices
        #expect(CompanyIdentifier.rFMicroDevices.rawValue == 40)
        #expect(CompanyIdentifier.rFMicroDevices.name == #"R F Micro Devices"#)
        #expect(CompanyIdentifier.rFMicroDevices.description == #"R F Micro Devices"#)
    
        // Hitachi Ltd
        #expect(CompanyIdentifier.hitachi.rawValue == 41)
        #expect(CompanyIdentifier.hitachi.name == #"Hitachi Ltd"#)
        #expect(CompanyIdentifier.hitachi.description == #"Hitachi Ltd"#)
    
        // Symbol Technologies, Inc.
        #expect(CompanyIdentifier.symbolTechnologies.rawValue == 42)
        #expect(CompanyIdentifier.symbolTechnologies.name == #"Symbol Technologies, Inc."#)
        #expect(CompanyIdentifier.symbolTechnologies.description == #"Symbol Technologies, Inc."#)
    
        // Tenovis
        #expect(CompanyIdentifier.tenovis.rawValue == 43)
        #expect(CompanyIdentifier.tenovis.name == #"Tenovis"#)
        #expect(CompanyIdentifier.tenovis.description == #"Tenovis"#)
    
        // Macronix International Co. Ltd.
        #expect(CompanyIdentifier.macronixInternational.rawValue == 44)
        #expect(CompanyIdentifier.macronixInternational.name == #"Macronix International Co. Ltd."#)
        #expect(CompanyIdentifier.macronixInternational.description == #"Macronix International Co. Ltd."#)
    
        // GCT Semiconductor
        #expect(CompanyIdentifier.gctSemiconductor.rawValue == 45)
        #expect(CompanyIdentifier.gctSemiconductor.name == #"GCT Semiconductor"#)
        #expect(CompanyIdentifier.gctSemiconductor.description == #"GCT Semiconductor"#)
    
        // Norwood Systems
        #expect(CompanyIdentifier.norwoodSystems.rawValue == 46)
        #expect(CompanyIdentifier.norwoodSystems.name == #"Norwood Systems"#)
        #expect(CompanyIdentifier.norwoodSystems.description == #"Norwood Systems"#)
    
        // MewTel Technology Inc.
        #expect(CompanyIdentifier.mewtelTechnology.rawValue == 47)
        #expect(CompanyIdentifier.mewtelTechnology.name == #"MewTel Technology Inc."#)
        #expect(CompanyIdentifier.mewtelTechnology.description == #"MewTel Technology Inc."#)
    
        // ST Microelectronics
        #expect(CompanyIdentifier.stMicroelectronics.rawValue == 48)
        #expect(CompanyIdentifier.stMicroelectronics.name == #"ST Microelectronics"#)
        #expect(CompanyIdentifier.stMicroelectronics.description == #"ST Microelectronics"#)
    
        // Synopsys, Inc.
        #expect(CompanyIdentifier.synopsys.rawValue == 49)
        #expect(CompanyIdentifier.synopsys.name == #"Synopsys, Inc."#)
        #expect(CompanyIdentifier.synopsys.description == #"Synopsys, Inc."#)
    
        // Red-M (Communications) Ltd
        #expect(CompanyIdentifier.redMCommunications.rawValue == 50)
        #expect(CompanyIdentifier.redMCommunications.name == #"Red-M (Communications) Ltd"#)
        #expect(CompanyIdentifier.redMCommunications.description == #"Red-M (Communications) Ltd"#)
    
        // Commil Ltd
        #expect(CompanyIdentifier.commil.rawValue == 51)
        #expect(CompanyIdentifier.commil.name == #"Commil Ltd"#)
        #expect(CompanyIdentifier.commil.description == #"Commil Ltd"#)
    
        // Computer Access Technology Corporation (CATC)
        #expect(CompanyIdentifier.computerAccessTechnologyCatc.rawValue == 52)
        #expect(CompanyIdentifier.computerAccessTechnologyCatc.name == #"Computer Access Technology Corporation (CATC)"#)
        #expect(CompanyIdentifier.computerAccessTechnologyCatc.description == #"Computer Access Technology Corporation (CATC)"#)
    
        // Eclipse (HQ Espana) S.L.
        #expect(CompanyIdentifier.eclipseHqEspana.rawValue == 53)
        #expect(CompanyIdentifier.eclipseHqEspana.name == #"Eclipse (HQ Espana) S.L."#)
        #expect(CompanyIdentifier.eclipseHqEspana.description == #"Eclipse (HQ Espana) S.L."#)
    
        // Renesas Electronics Corporation
        #expect(CompanyIdentifier.renesasElectronics.rawValue == 54)
        #expect(CompanyIdentifier.renesasElectronics.name == #"Renesas Electronics Corporation"#)
        #expect(CompanyIdentifier.renesasElectronics.description == #"Renesas Electronics Corporation"#)
    
        // Mobilian Corporation
        #expect(CompanyIdentifier.mobilian.rawValue == 55)
        #expect(CompanyIdentifier.mobilian.name == #"Mobilian Corporation"#)
        #expect(CompanyIdentifier.mobilian.description == #"Mobilian Corporation"#)
    
        // Syntronix Corporation
        #expect(CompanyIdentifier.syntronix.rawValue == 56)
        #expect(CompanyIdentifier.syntronix.name == #"Syntronix Corporation"#)
        #expect(CompanyIdentifier.syntronix.description == #"Syntronix Corporation"#)
    
        // Integrated System Solution Corp.
        #expect(CompanyIdentifier.integratedSystemSolution.rawValue == 57)
        #expect(CompanyIdentifier.integratedSystemSolution.name == #"Integrated System Solution Corp."#)
        #expect(CompanyIdentifier.integratedSystemSolution.description == #"Integrated System Solution Corp."#)
    
        // Panasonic Holdings Corporation
        #expect(CompanyIdentifier.panasonicHoldings.rawValue == 58)
        #expect(CompanyIdentifier.panasonicHoldings.name == #"Panasonic Holdings Corporation"#)
        #expect(CompanyIdentifier.panasonicHoldings.description == #"Panasonic Holdings Corporation"#)
    
        // Gennum Corporation
        #expect(CompanyIdentifier.gennum.rawValue == 59)
        #expect(CompanyIdentifier.gennum.name == #"Gennum Corporation"#)
        #expect(CompanyIdentifier.gennum.description == #"Gennum Corporation"#)
    
        // BlackBerry Limited
        #expect(CompanyIdentifier.blackberry.rawValue == 60)
        #expect(CompanyIdentifier.blackberry.name == #"BlackBerry Limited"#)
        #expect(CompanyIdentifier.blackberry.description == #"BlackBerry Limited"#)
    
        // IPextreme, Inc.
        #expect(CompanyIdentifier.ipextreme.rawValue == 61)
        #expect(CompanyIdentifier.ipextreme.name == #"IPextreme, Inc."#)
        #expect(CompanyIdentifier.ipextreme.description == #"IPextreme, Inc."#)
    
        // Systems and Chips, Inc
        #expect(CompanyIdentifier.systemsAndChips.rawValue == 62)
        #expect(CompanyIdentifier.systemsAndChips.name == #"Systems and Chips, Inc"#)
        #expect(CompanyIdentifier.systemsAndChips.description == #"Systems and Chips, Inc"#)
    
        // Bluetooth SIG, Inc
        #expect(CompanyIdentifier.bluetoothSig.rawValue == 63)
        #expect(CompanyIdentifier.bluetoothSig.name == #"Bluetooth SIG, Inc"#)
        #expect(CompanyIdentifier.bluetoothSig.description == #"Bluetooth SIG, Inc"#)
    
        // Seiko Epson Corporation
        #expect(CompanyIdentifier.seikoEpson.rawValue == 64)
        #expect(CompanyIdentifier.seikoEpson.name == #"Seiko Epson Corporation"#)
        #expect(CompanyIdentifier.seikoEpson.description == #"Seiko Epson Corporation"#)
    
        // Integrated Silicon Solution Taiwan, Inc.
        #expect(CompanyIdentifier.integratedSiliconSolutionTaiwan.rawValue == 65)
        #expect(CompanyIdentifier.integratedSiliconSolutionTaiwan.name == #"Integrated Silicon Solution Taiwan, Inc."#)
        #expect(CompanyIdentifier.integratedSiliconSolutionTaiwan.description == #"Integrated Silicon Solution Taiwan, Inc."#)
    
        // CONWISE Technology Corporation Ltd
        #expect(CompanyIdentifier.conwiseTechnology.rawValue == 66)
        #expect(CompanyIdentifier.conwiseTechnology.name == #"CONWISE Technology Corporation Ltd"#)
        #expect(CompanyIdentifier.conwiseTechnology.description == #"CONWISE Technology Corporation Ltd"#)
    
        // PARROT AUTOMOTIVE SAS
        #expect(CompanyIdentifier.parrotAutomotives.rawValue == 67)
        #expect(CompanyIdentifier.parrotAutomotives.name == #"PARROT AUTOMOTIVE SAS"#)
        #expect(CompanyIdentifier.parrotAutomotives.description == #"PARROT AUTOMOTIVE SAS"#)
    
        // Socket Mobile
        #expect(CompanyIdentifier.socketMobile.rawValue == 68)
        #expect(CompanyIdentifier.socketMobile.name == #"Socket Mobile"#)
        #expect(CompanyIdentifier.socketMobile.description == #"Socket Mobile"#)
    
        // Atheros Communications, Inc.
        #expect(CompanyIdentifier.atherosCommunications.rawValue == 69)
        #expect(CompanyIdentifier.atherosCommunications.name == #"Atheros Communications, Inc."#)
        #expect(CompanyIdentifier.atherosCommunications.description == #"Atheros Communications, Inc."#)
    
        // MediaTek, Inc.
        #expect(CompanyIdentifier.mediatek.rawValue == 70)
        #expect(CompanyIdentifier.mediatek.name == #"MediaTek, Inc."#)
        #expect(CompanyIdentifier.mediatek.description == #"MediaTek, Inc."#)
    
        // Bluegiga
        #expect(CompanyIdentifier.bluegiga.rawValue == 71)
        #expect(CompanyIdentifier.bluegiga.name == #"Bluegiga"#)
        #expect(CompanyIdentifier.bluegiga.description == #"Bluegiga"#)
    
        // Marvell Technology Group Ltd.
        #expect(CompanyIdentifier.marvellTechnologyGroup.rawValue == 72)
        #expect(CompanyIdentifier.marvellTechnologyGroup.name == #"Marvell Technology Group Ltd."#)
        #expect(CompanyIdentifier.marvellTechnologyGroup.description == #"Marvell Technology Group Ltd."#)
    
        // 3DSP Corporation
        #expect(CompanyIdentifier.company3Dsp.rawValue == 73)
        #expect(CompanyIdentifier.company3Dsp.name == #"3DSP Corporation"#)
        #expect(CompanyIdentifier.company3Dsp.description == #"3DSP Corporation"#)
    
        // Accel Semiconductor Ltd.
        #expect(CompanyIdentifier.accelSemiconductor.rawValue == 74)
        #expect(CompanyIdentifier.accelSemiconductor.name == #"Accel Semiconductor Ltd."#)
        #expect(CompanyIdentifier.accelSemiconductor.description == #"Accel Semiconductor Ltd."#)
    
        // Continental Automotive Systems
        #expect(CompanyIdentifier.continentalAutomotiveSystems.rawValue == 75)
        #expect(CompanyIdentifier.continentalAutomotiveSystems.name == #"Continental Automotive Systems"#)
        #expect(CompanyIdentifier.continentalAutomotiveSystems.description == #"Continental Automotive Systems"#)
    
        // Apple, Inc.
        #expect(CompanyIdentifier.apple.rawValue == 76)
        #expect(CompanyIdentifier.apple.name == #"Apple, Inc."#)
        #expect(CompanyIdentifier.apple.description == #"Apple, Inc."#)
    
        // Staccato Communications, Inc.
        #expect(CompanyIdentifier.staccatoCommunications.rawValue == 77)
        #expect(CompanyIdentifier.staccatoCommunications.name == #"Staccato Communications, Inc."#)
        #expect(CompanyIdentifier.staccatoCommunications.description == #"Staccato Communications, Inc."#)
    
        // Avago Technologies
        #expect(CompanyIdentifier.avagoTechnologies.rawValue == 78)
        #expect(CompanyIdentifier.avagoTechnologies.name == #"Avago Technologies"#)
        #expect(CompanyIdentifier.avagoTechnologies.description == #"Avago Technologies"#)
    
        // APT Ltd.
        #expect(CompanyIdentifier.apt.rawValue == 79)
        #expect(CompanyIdentifier.apt.name == #"APT Ltd."#)
        #expect(CompanyIdentifier.apt.description == #"APT Ltd."#)
    
        // SiRF Technology, Inc.
        #expect(CompanyIdentifier.sirfTechnology.rawValue == 80)
        #expect(CompanyIdentifier.sirfTechnology.name == #"SiRF Technology, Inc."#)
        #expect(CompanyIdentifier.sirfTechnology.description == #"SiRF Technology, Inc."#)
    
        // Tzero Technologies, Inc.
        #expect(CompanyIdentifier.tzeroTechnologies.rawValue == 81)
        #expect(CompanyIdentifier.tzeroTechnologies.name == #"Tzero Technologies, Inc."#)
        #expect(CompanyIdentifier.tzeroTechnologies.description == #"Tzero Technologies, Inc."#)
    
        // J&M Corporation
        #expect(CompanyIdentifier.jM.rawValue == 82)
        #expect(CompanyIdentifier.jM.name == #"J&M Corporation"#)
        #expect(CompanyIdentifier.jM.description == #"J&M Corporation"#)
    
        // Free2move AB
        #expect(CompanyIdentifier.free2Move.rawValue == 83)
        #expect(CompanyIdentifier.free2Move.name == #"Free2move AB"#)
        #expect(CompanyIdentifier.free2Move.description == #"Free2move AB"#)
    
        // 3DiJoy Corporation
        #expect(CompanyIdentifier.company3Dijoy.rawValue == 84)
        #expect(CompanyIdentifier.company3Dijoy.name == #"3DiJoy Corporation"#)
        #expect(CompanyIdentifier.company3Dijoy.description == #"3DiJoy Corporation"#)
    
        // Plantronics, Inc.
        #expect(CompanyIdentifier.plantronics.rawValue == 85)
        #expect(CompanyIdentifier.plantronics.name == #"Plantronics, Inc."#)
        #expect(CompanyIdentifier.plantronics.description == #"Plantronics, Inc."#)
    
        // Sony Ericsson Mobile Communications
        #expect(CompanyIdentifier.sonyEricssonMobileCommunications.rawValue == 86)
        #expect(CompanyIdentifier.sonyEricssonMobileCommunications.name == #"Sony Ericsson Mobile Communications"#)
        #expect(CompanyIdentifier.sonyEricssonMobileCommunications.description == #"Sony Ericsson Mobile Communications"#)
    
        // Harman International Industries, Inc.
        #expect(CompanyIdentifier.harmanInternationalIndustries.rawValue == 87)
        #expect(CompanyIdentifier.harmanInternationalIndustries.name == #"Harman International Industries, Inc."#)
        #expect(CompanyIdentifier.harmanInternationalIndustries.description == #"Harman International Industries, Inc."#)
    
        // Vizio, Inc.
        #expect(CompanyIdentifier.vizio.rawValue == 88)
        #expect(CompanyIdentifier.vizio.name == #"Vizio, Inc."#)
        #expect(CompanyIdentifier.vizio.description == #"Vizio, Inc."#)
    
        // Nordic Semiconductor ASA
        #expect(CompanyIdentifier.nordicSemiconductor.rawValue == 89)
        #expect(CompanyIdentifier.nordicSemiconductor.name == #"Nordic Semiconductor ASA"#)
        #expect(CompanyIdentifier.nordicSemiconductor.description == #"Nordic Semiconductor ASA"#)
    
        // EM Microelectronic-Marin SA
        #expect(CompanyIdentifier.emMicroelectronicMarin.rawValue == 90)
        #expect(CompanyIdentifier.emMicroelectronicMarin.name == #"EM Microelectronic-Marin SA"#)
        #expect(CompanyIdentifier.emMicroelectronicMarin.description == #"EM Microelectronic-Marin SA"#)
    
        // Ralink Technology Corporation
        #expect(CompanyIdentifier.ralinkTechnology.rawValue == 91)
        #expect(CompanyIdentifier.ralinkTechnology.name == #"Ralink Technology Corporation"#)
        #expect(CompanyIdentifier.ralinkTechnology.description == #"Ralink Technology Corporation"#)
    
        // Belkin International, Inc.
        #expect(CompanyIdentifier.belkinInternational.rawValue == 92)
        #expect(CompanyIdentifier.belkinInternational.name == #"Belkin International, Inc."#)
        #expect(CompanyIdentifier.belkinInternational.description == #"Belkin International, Inc."#)
    
        // Realtek Semiconductor Corporation
        #expect(CompanyIdentifier.realtekSemiconductor.rawValue == 93)
        #expect(CompanyIdentifier.realtekSemiconductor.name == #"Realtek Semiconductor Corporation"#)
        #expect(CompanyIdentifier.realtekSemiconductor.description == #"Realtek Semiconductor Corporation"#)
    
        // Stonestreet One, LLC
        #expect(CompanyIdentifier.stonestreetOne.rawValue == 94)
        #expect(CompanyIdentifier.stonestreetOne.name == #"Stonestreet One, LLC"#)
        #expect(CompanyIdentifier.stonestreetOne.description == #"Stonestreet One, LLC"#)
    
        // Wicentric, Inc.
        #expect(CompanyIdentifier.wicentric.rawValue == 95)
        #expect(CompanyIdentifier.wicentric.name == #"Wicentric, Inc."#)
        #expect(CompanyIdentifier.wicentric.description == #"Wicentric, Inc."#)
    
        // RivieraWaves S.A.S
        #expect(CompanyIdentifier.rivierawaves.rawValue == 96)
        #expect(CompanyIdentifier.rivierawaves.name == #"RivieraWaves S.A.S"#)
        #expect(CompanyIdentifier.rivierawaves.description == #"RivieraWaves S.A.S"#)
    
        // RDA Microelectronics
        #expect(CompanyIdentifier.rdaMicroelectronics.rawValue == 97)
        #expect(CompanyIdentifier.rdaMicroelectronics.name == #"RDA Microelectronics"#)
        #expect(CompanyIdentifier.rdaMicroelectronics.description == #"RDA Microelectronics"#)
    
        // Gibson Guitars
        #expect(CompanyIdentifier.gibsonGuitars.rawValue == 98)
        #expect(CompanyIdentifier.gibsonGuitars.name == #"Gibson Guitars"#)
        #expect(CompanyIdentifier.gibsonGuitars.description == #"Gibson Guitars"#)
    
        // MiCommand Inc.
        #expect(CompanyIdentifier.micommand.rawValue == 99)
        #expect(CompanyIdentifier.micommand.name == #"MiCommand Inc."#)
        #expect(CompanyIdentifier.micommand.description == #"MiCommand Inc."#)
    
        // Band XI International, LLC
        #expect(CompanyIdentifier.bandXiInternational.rawValue == 100)
        #expect(CompanyIdentifier.bandXiInternational.name == #"Band XI International, LLC"#)
        #expect(CompanyIdentifier.bandXiInternational.description == #"Band XI International, LLC"#)
    
        // HP, Inc.
        #expect(CompanyIdentifier.hp.rawValue == 101)
        #expect(CompanyIdentifier.hp.name == #"HP, Inc."#)
        #expect(CompanyIdentifier.hp.description == #"HP, Inc."#)
    
        // 9Solutions Oy
        #expect(CompanyIdentifier.company9Solutions.rawValue == 102)
        #expect(CompanyIdentifier.company9Solutions.name == #"9Solutions Oy"#)
        #expect(CompanyIdentifier.company9Solutions.description == #"9Solutions Oy"#)
    
        // GN Audio A/S
        #expect(CompanyIdentifier.gnAudio.rawValue == 103)
        #expect(CompanyIdentifier.gnAudio.name == #"GN Audio A/S"#)
        #expect(CompanyIdentifier.gnAudio.description == #"GN Audio A/S"#)
    
        // General Motors
        #expect(CompanyIdentifier.generalMotors.rawValue == 104)
        #expect(CompanyIdentifier.generalMotors.name == #"General Motors"#)
        #expect(CompanyIdentifier.generalMotors.description == #"General Motors"#)
    
        // A&D Engineering, Inc.
        #expect(CompanyIdentifier.aDEngineering.rawValue == 105)
        #expect(CompanyIdentifier.aDEngineering.name == #"A&D Engineering, Inc."#)
        #expect(CompanyIdentifier.aDEngineering.description == #"A&D Engineering, Inc."#)
    
        // LTIMINDTREE LIMITED
        #expect(CompanyIdentifier.ltimindtree.rawValue == 106)
        #expect(CompanyIdentifier.ltimindtree.name == #"LTIMINDTREE LIMITED"#)
        #expect(CompanyIdentifier.ltimindtree.description == #"LTIMINDTREE LIMITED"#)
    
        // Polar Electro OY
        #expect(CompanyIdentifier.polarElectro.rawValue == 107)
        #expect(CompanyIdentifier.polarElectro.name == #"Polar Electro OY"#)
        #expect(CompanyIdentifier.polarElectro.description == #"Polar Electro OY"#)
    
        // Beautiful Enterprise Co., Ltd.
        #expect(CompanyIdentifier.beautifulEnterprise.rawValue == 108)
        #expect(CompanyIdentifier.beautifulEnterprise.name == #"Beautiful Enterprise Co., Ltd."#)
        #expect(CompanyIdentifier.beautifulEnterprise.description == #"Beautiful Enterprise Co., Ltd."#)
    
        // BriarTek, Inc
        #expect(CompanyIdentifier.briartek.rawValue == 109)
        #expect(CompanyIdentifier.briartek.name == #"BriarTek, Inc"#)
        #expect(CompanyIdentifier.briartek.description == #"BriarTek, Inc"#)
    
        // Summit Data Communications, Inc.
        #expect(CompanyIdentifier.summitDataCommunications.rawValue == 110)
        #expect(CompanyIdentifier.summitDataCommunications.name == #"Summit Data Communications, Inc."#)
        #expect(CompanyIdentifier.summitDataCommunications.description == #"Summit Data Communications, Inc."#)
    
        // Sound ID
        #expect(CompanyIdentifier.soundId.rawValue == 111)
        #expect(CompanyIdentifier.soundId.name == #"Sound ID"#)
        #expect(CompanyIdentifier.soundId.description == #"Sound ID"#)
    
        // Monster, LLC
        #expect(CompanyIdentifier.monster.rawValue == 112)
        #expect(CompanyIdentifier.monster.name == #"Monster, LLC"#)
        #expect(CompanyIdentifier.monster.description == #"Monster, LLC"#)
    
        // connectBlue AB
        #expect(CompanyIdentifier.connectblue.rawValue == 113)
        #expect(CompanyIdentifier.connectblue.name == #"connectBlue AB"#)
        #expect(CompanyIdentifier.connectblue.description == #"connectBlue AB"#)
    
        // ShangHai Super Smart Electronics Co. Ltd.
        #expect(CompanyIdentifier.shanghaiSuperSmartElectronics.rawValue == 114)
        #expect(CompanyIdentifier.shanghaiSuperSmartElectronics.name == #"ShangHai Super Smart Electronics Co. Ltd."#)
        #expect(CompanyIdentifier.shanghaiSuperSmartElectronics.description == #"ShangHai Super Smart Electronics Co. Ltd."#)
    
        // Group Sense Ltd.
        #expect(CompanyIdentifier.groupSense.rawValue == 115)
        #expect(CompanyIdentifier.groupSense.name == #"Group Sense Ltd."#)
        #expect(CompanyIdentifier.groupSense.description == #"Group Sense Ltd."#)
    
        // Zomm, LLC
        #expect(CompanyIdentifier.zomm.rawValue == 116)
        #expect(CompanyIdentifier.zomm.name == #"Zomm, LLC"#)
        #expect(CompanyIdentifier.zomm.description == #"Zomm, LLC"#)
    
        // Samsung Electronics Co. Ltd.
        #expect(CompanyIdentifier.samsungElectronics.rawValue == 117)
        #expect(CompanyIdentifier.samsungElectronics.name == #"Samsung Electronics Co. Ltd."#)
        #expect(CompanyIdentifier.samsungElectronics.description == #"Samsung Electronics Co. Ltd."#)
    
        // Creative Technology Ltd.
        #expect(CompanyIdentifier.creativeTechnology.rawValue == 118)
        #expect(CompanyIdentifier.creativeTechnology.name == #"Creative Technology Ltd."#)
        #expect(CompanyIdentifier.creativeTechnology.description == #"Creative Technology Ltd."#)
    
        // Laird Connectivity LLC
        #expect(CompanyIdentifier.lairdConnectivity.rawValue == 119)
        #expect(CompanyIdentifier.lairdConnectivity.name == #"Laird Connectivity LLC"#)
        #expect(CompanyIdentifier.lairdConnectivity.description == #"Laird Connectivity LLC"#)
    
        // Nike, Inc.
        #expect(CompanyIdentifier.nike.rawValue == 120)
        #expect(CompanyIdentifier.nike.name == #"Nike, Inc."#)
        #expect(CompanyIdentifier.nike.description == #"Nike, Inc."#)
    
        // lesswire AG
        #expect(CompanyIdentifier.lesswire.rawValue == 121)
        #expect(CompanyIdentifier.lesswire.name == #"lesswire AG"#)
        #expect(CompanyIdentifier.lesswire.description == #"lesswire AG"#)
    
        // MStar Semiconductor, Inc.
        #expect(CompanyIdentifier.mstarSemiconductor.rawValue == 122)
        #expect(CompanyIdentifier.mstarSemiconductor.name == #"MStar Semiconductor, Inc."#)
        #expect(CompanyIdentifier.mstarSemiconductor.description == #"MStar Semiconductor, Inc."#)
    
        // Hanlynn Technologies
        #expect(CompanyIdentifier.hanlynnTechnologies.rawValue == 123)
        #expect(CompanyIdentifier.hanlynnTechnologies.name == #"Hanlynn Technologies"#)
        #expect(CompanyIdentifier.hanlynnTechnologies.description == #"Hanlynn Technologies"#)
    
        // A & R Cambridge
        #expect(CompanyIdentifier.aRCambridge.rawValue == 124)
        #expect(CompanyIdentifier.aRCambridge.name == #"A & R Cambridge"#)
        #expect(CompanyIdentifier.aRCambridge.description == #"A & R Cambridge"#)
    
        // Seers Technology Co., Ltd.
        #expect(CompanyIdentifier.seersTechnology.rawValue == 125)
        #expect(CompanyIdentifier.seersTechnology.name == #"Seers Technology Co., Ltd."#)
        #expect(CompanyIdentifier.seersTechnology.description == #"Seers Technology Co., Ltd."#)
    
        // Sports Tracking Technologies Ltd.
        #expect(CompanyIdentifier.sportsTrackingTechnologies.rawValue == 126)
        #expect(CompanyIdentifier.sportsTrackingTechnologies.name == #"Sports Tracking Technologies Ltd."#)
        #expect(CompanyIdentifier.sportsTrackingTechnologies.description == #"Sports Tracking Technologies Ltd."#)
    
        // Autonet Mobile
        #expect(CompanyIdentifier.autonetMobile.rawValue == 127)
        #expect(CompanyIdentifier.autonetMobile.name == #"Autonet Mobile"#)
        #expect(CompanyIdentifier.autonetMobile.description == #"Autonet Mobile"#)
    
        // DeLorme Publishing Company, Inc.
        #expect(CompanyIdentifier.delormePublishing.rawValue == 128)
        #expect(CompanyIdentifier.delormePublishing.name == #"DeLorme Publishing Company, Inc."#)
        #expect(CompanyIdentifier.delormePublishing.description == #"DeLorme Publishing Company, Inc."#)
    
        // WuXi Vimicro
        #expect(CompanyIdentifier.wuxiVimicro.rawValue == 129)
        #expect(CompanyIdentifier.wuxiVimicro.name == #"WuXi Vimicro"#)
        #expect(CompanyIdentifier.wuxiVimicro.description == #"WuXi Vimicro"#)
    
        // DSEA A/S
        #expect(CompanyIdentifier.dsea.rawValue == 130)
        #expect(CompanyIdentifier.dsea.name == #"DSEA A/S"#)
        #expect(CompanyIdentifier.dsea.description == #"DSEA A/S"#)
    
        // TimeKeeping Systems, Inc.
        #expect(CompanyIdentifier.timekeepingSystems.rawValue == 131)
        #expect(CompanyIdentifier.timekeepingSystems.name == #"TimeKeeping Systems, Inc."#)
        #expect(CompanyIdentifier.timekeepingSystems.description == #"TimeKeeping Systems, Inc."#)
    
        // Ludus Helsinki Ltd.
        #expect(CompanyIdentifier.ludusHelsinki.rawValue == 132)
        #expect(CompanyIdentifier.ludusHelsinki.name == #"Ludus Helsinki Ltd."#)
        #expect(CompanyIdentifier.ludusHelsinki.description == #"Ludus Helsinki Ltd."#)
    
        // BlueRadios, Inc.
        #expect(CompanyIdentifier.blueradios.rawValue == 133)
        #expect(CompanyIdentifier.blueradios.name == #"BlueRadios, Inc."#)
        #expect(CompanyIdentifier.blueradios.description == #"BlueRadios, Inc."#)
    
        // Equinux AG
        #expect(CompanyIdentifier.equinux.rawValue == 134)
        #expect(CompanyIdentifier.equinux.name == #"Equinux AG"#)
        #expect(CompanyIdentifier.equinux.description == #"Equinux AG"#)
    
        // Garmin International, Inc.
        #expect(CompanyIdentifier.garminInternational.rawValue == 135)
        #expect(CompanyIdentifier.garminInternational.name == #"Garmin International, Inc."#)
        #expect(CompanyIdentifier.garminInternational.description == #"Garmin International, Inc."#)
    
        // Ecotest
        #expect(CompanyIdentifier.ecotest.rawValue == 136)
        #expect(CompanyIdentifier.ecotest.name == #"Ecotest"#)
        #expect(CompanyIdentifier.ecotest.description == #"Ecotest"#)
    
        // GN Hearing A/S
        #expect(CompanyIdentifier.gnHearing.rawValue == 137)
        #expect(CompanyIdentifier.gnHearing.name == #"GN Hearing A/S"#)
        #expect(CompanyIdentifier.gnHearing.description == #"GN Hearing A/S"#)
    
        // Jawbone
        #expect(CompanyIdentifier.jawbone.rawValue == 138)
        #expect(CompanyIdentifier.jawbone.name == #"Jawbone"#)
        #expect(CompanyIdentifier.jawbone.description == #"Jawbone"#)
    
        // Topcon Positioning Systems, LLC
        #expect(CompanyIdentifier.topconPositioningSystems.rawValue == 139)
        #expect(CompanyIdentifier.topconPositioningSystems.name == #"Topcon Positioning Systems, LLC"#)
        #expect(CompanyIdentifier.topconPositioningSystems.description == #"Topcon Positioning Systems, LLC"#)
    
        // Gimbal Inc.
        #expect(CompanyIdentifier.gimbal.rawValue == 140)
        #expect(CompanyIdentifier.gimbal.name == #"Gimbal Inc."#)
        #expect(CompanyIdentifier.gimbal.description == #"Gimbal Inc."#)
    
        // Zscan Software
        #expect(CompanyIdentifier.zscanSoftware.rawValue == 141)
        #expect(CompanyIdentifier.zscanSoftware.name == #"Zscan Software"#)
        #expect(CompanyIdentifier.zscanSoftware.description == #"Zscan Software"#)
    
        // Quintic Corp
        #expect(CompanyIdentifier.quintic.rawValue == 142)
        #expect(CompanyIdentifier.quintic.name == #"Quintic Corp"#)
        #expect(CompanyIdentifier.quintic.description == #"Quintic Corp"#)
    
        // Telit Wireless Solutions GmbH
        #expect(CompanyIdentifier.telitWirelessSolutions.rawValue == 143)
        #expect(CompanyIdentifier.telitWirelessSolutions.name == #"Telit Wireless Solutions GmbH"#)
        #expect(CompanyIdentifier.telitWirelessSolutions.description == #"Telit Wireless Solutions GmbH"#)
    
        // Funai Electric Co., Ltd.
        #expect(CompanyIdentifier.funaiElectric.rawValue == 144)
        #expect(CompanyIdentifier.funaiElectric.name == #"Funai Electric Co., Ltd."#)
        #expect(CompanyIdentifier.funaiElectric.description == #"Funai Electric Co., Ltd."#)
    
        // Advanced PANMOBIL systems GmbH & Co. KG
        #expect(CompanyIdentifier.advancedPanmobilSystems.rawValue == 145)
        #expect(CompanyIdentifier.advancedPanmobilSystems.name == #"Advanced PANMOBIL systems GmbH & Co. KG"#)
        #expect(CompanyIdentifier.advancedPanmobilSystems.description == #"Advanced PANMOBIL systems GmbH & Co. KG"#)
    
        // ThinkOptics, Inc.
        #expect(CompanyIdentifier.thinkoptics.rawValue == 146)
        #expect(CompanyIdentifier.thinkoptics.name == #"ThinkOptics, Inc."#)
        #expect(CompanyIdentifier.thinkoptics.description == #"ThinkOptics, Inc."#)
    
        // Universal Electronics, Inc.
        #expect(CompanyIdentifier.universalElectronics.rawValue == 147)
        #expect(CompanyIdentifier.universalElectronics.name == #"Universal Electronics, Inc."#)
        #expect(CompanyIdentifier.universalElectronics.description == #"Universal Electronics, Inc."#)
    
        // Airoha Technology Corp.
        #expect(CompanyIdentifier.airohaTechnology.rawValue == 148)
        #expect(CompanyIdentifier.airohaTechnology.name == #"Airoha Technology Corp."#)
        #expect(CompanyIdentifier.airohaTechnology.description == #"Airoha Technology Corp."#)
    
        // NEC Lighting, Ltd.
        #expect(CompanyIdentifier.necLighting.rawValue == 149)
        #expect(CompanyIdentifier.necLighting.name == #"NEC Lighting, Ltd."#)
        #expect(CompanyIdentifier.necLighting.description == #"NEC Lighting, Ltd."#)
    
        // ODM Technology, Inc.
        #expect(CompanyIdentifier.odmTechnology.rawValue == 150)
        #expect(CompanyIdentifier.odmTechnology.name == #"ODM Technology, Inc."#)
        #expect(CompanyIdentifier.odmTechnology.description == #"ODM Technology, Inc."#)
    
        // ConnecteDevice Ltd.
        #expect(CompanyIdentifier.connectedevice.rawValue == 151)
        #expect(CompanyIdentifier.connectedevice.name == #"ConnecteDevice Ltd."#)
        #expect(CompanyIdentifier.connectedevice.description == #"ConnecteDevice Ltd."#)
    
        // zero1.tv GmbH
        #expect(CompanyIdentifier.zero1Tv.rawValue == 152)
        #expect(CompanyIdentifier.zero1Tv.name == #"zero1.tv GmbH"#)
        #expect(CompanyIdentifier.zero1Tv.description == #"zero1.tv GmbH"#)
    
        // i.Tech Dynamic Global Distribution Ltd.
        #expect(CompanyIdentifier.iTechDynamicGlobalDistribution.rawValue == 153)
        #expect(CompanyIdentifier.iTechDynamicGlobalDistribution.name == #"i.Tech Dynamic Global Distribution Ltd."#)
        #expect(CompanyIdentifier.iTechDynamicGlobalDistribution.description == #"i.Tech Dynamic Global Distribution Ltd."#)
    
        // Alpwise
        #expect(CompanyIdentifier.alpwise.rawValue == 154)
        #expect(CompanyIdentifier.alpwise.name == #"Alpwise"#)
        #expect(CompanyIdentifier.alpwise.description == #"Alpwise"#)
    
        // Jiangsu Toppower Automotive Electronics Co., Ltd.
        #expect(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.rawValue == 155)
        #expect(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.name == #"Jiangsu Toppower Automotive Electronics Co., Ltd."#)
        #expect(CompanyIdentifier.jiangsuToppowerAutomotiveElectronics.description == #"Jiangsu Toppower Automotive Electronics Co., Ltd."#)
    
        // Colorfy, Inc.
        #expect(CompanyIdentifier.colorfy.rawValue == 156)
        #expect(CompanyIdentifier.colorfy.name == #"Colorfy, Inc."#)
        #expect(CompanyIdentifier.colorfy.description == #"Colorfy, Inc."#)
    
        // Geoforce Inc.
        #expect(CompanyIdentifier.geoforce.rawValue == 157)
        #expect(CompanyIdentifier.geoforce.name == #"Geoforce Inc."#)
        #expect(CompanyIdentifier.geoforce.description == #"Geoforce Inc."#)
    
        // Bose Corporation
        #expect(CompanyIdentifier.bose.rawValue == 158)
        #expect(CompanyIdentifier.bose.name == #"Bose Corporation"#)
        #expect(CompanyIdentifier.bose.description == #"Bose Corporation"#)
    
        // Suunto Oy
        #expect(CompanyIdentifier.suunto.rawValue == 159)
        #expect(CompanyIdentifier.suunto.name == #"Suunto Oy"#)
        #expect(CompanyIdentifier.suunto.description == #"Suunto Oy"#)
    
        // Kensington Computer Products Group
        #expect(CompanyIdentifier.kensingtonComputerProductsGroup.rawValue == 160)
        #expect(CompanyIdentifier.kensingtonComputerProductsGroup.name == #"Kensington Computer Products Group"#)
        #expect(CompanyIdentifier.kensingtonComputerProductsGroup.description == #"Kensington Computer Products Group"#)
    
        // SR-Medizinelektronik
        #expect(CompanyIdentifier.srMedizinelektronik.rawValue == 161)
        #expect(CompanyIdentifier.srMedizinelektronik.name == #"SR-Medizinelektronik"#)
        #expect(CompanyIdentifier.srMedizinelektronik.description == #"SR-Medizinelektronik"#)
    
        // Vertu Corporation Limited
        #expect(CompanyIdentifier.vertu.rawValue == 162)
        #expect(CompanyIdentifier.vertu.name == #"Vertu Corporation Limited"#)
        #expect(CompanyIdentifier.vertu.description == #"Vertu Corporation Limited"#)
    
        // Meta Watch Ltd.
        #expect(CompanyIdentifier.metaWatch.rawValue == 163)
        #expect(CompanyIdentifier.metaWatch.name == #"Meta Watch Ltd."#)
        #expect(CompanyIdentifier.metaWatch.description == #"Meta Watch Ltd."#)
    
        // LINAK A/S
        #expect(CompanyIdentifier.linak.rawValue == 164)
        #expect(CompanyIdentifier.linak.name == #"LINAK A/S"#)
        #expect(CompanyIdentifier.linak.description == #"LINAK A/S"#)
    
        // OTL Dynamics LLC
        #expect(CompanyIdentifier.otlDynamics.rawValue == 165)
        #expect(CompanyIdentifier.otlDynamics.name == #"OTL Dynamics LLC"#)
        #expect(CompanyIdentifier.otlDynamics.description == #"OTL Dynamics LLC"#)
    
        // Panda Ocean Inc.
        #expect(CompanyIdentifier.pandaOcean.rawValue == 166)
        #expect(CompanyIdentifier.pandaOcean.name == #"Panda Ocean Inc."#)
        #expect(CompanyIdentifier.pandaOcean.description == #"Panda Ocean Inc."#)
    
        // Visteon Corporation
        #expect(CompanyIdentifier.visteon.rawValue == 167)
        #expect(CompanyIdentifier.visteon.name == #"Visteon Corporation"#)
        #expect(CompanyIdentifier.visteon.description == #"Visteon Corporation"#)
    
        // ARP Devices Limited
        #expect(CompanyIdentifier.arpDevices.rawValue == 168)
        #expect(CompanyIdentifier.arpDevices.name == #"ARP Devices Limited"#)
        #expect(CompanyIdentifier.arpDevices.description == #"ARP Devices Limited"#)
    
        // MARELLI EUROPE S.P.A.
        #expect(CompanyIdentifier.marelliEurope.rawValue == 169)
        #expect(CompanyIdentifier.marelliEurope.name == #"MARELLI EUROPE S.P.A."#)
        #expect(CompanyIdentifier.marelliEurope.description == #"MARELLI EUROPE S.P.A."#)
    
        // CAEN RFID srl
        #expect(CompanyIdentifier.caenRfid.rawValue == 170)
        #expect(CompanyIdentifier.caenRfid.name == #"CAEN RFID srl"#)
        #expect(CompanyIdentifier.caenRfid.description == #"CAEN RFID srl"#)
    
        // Ingenieur-Systemgruppe Zahn GmbH
        #expect(CompanyIdentifier.ingenieurSystemgruppeZahn.rawValue == 171)
        #expect(CompanyIdentifier.ingenieurSystemgruppeZahn.name == #"Ingenieur-Systemgruppe Zahn GmbH"#)
        #expect(CompanyIdentifier.ingenieurSystemgruppeZahn.description == #"Ingenieur-Systemgruppe Zahn GmbH"#)
    
        // Green Throttle Games
        #expect(CompanyIdentifier.greenThrottleGames.rawValue == 172)
        #expect(CompanyIdentifier.greenThrottleGames.name == #"Green Throttle Games"#)
        #expect(CompanyIdentifier.greenThrottleGames.description == #"Green Throttle Games"#)
    
        // Peter Systemtechnik GmbH
        #expect(CompanyIdentifier.peterSystemtechnik.rawValue == 173)
        #expect(CompanyIdentifier.peterSystemtechnik.name == #"Peter Systemtechnik GmbH"#)
        #expect(CompanyIdentifier.peterSystemtechnik.description == #"Peter Systemtechnik GmbH"#)
    
        // Omegawave Oy
        #expect(CompanyIdentifier.omegawave.rawValue == 174)
        #expect(CompanyIdentifier.omegawave.name == #"Omegawave Oy"#)
        #expect(CompanyIdentifier.omegawave.description == #"Omegawave Oy"#)
    
        // Cinetix
        #expect(CompanyIdentifier.cinetix.rawValue == 175)
        #expect(CompanyIdentifier.cinetix.name == #"Cinetix"#)
        #expect(CompanyIdentifier.cinetix.description == #"Cinetix"#)
    
        // Passif Semiconductor Corp
        #expect(CompanyIdentifier.passifSemiconductor.rawValue == 176)
        #expect(CompanyIdentifier.passifSemiconductor.name == #"Passif Semiconductor Corp"#)
        #expect(CompanyIdentifier.passifSemiconductor.description == #"Passif Semiconductor Corp"#)
    
        // Saris Cycling Group, Inc
        #expect(CompanyIdentifier.sarisCyclingGroup.rawValue == 177)
        #expect(CompanyIdentifier.sarisCyclingGroup.name == #"Saris Cycling Group, Inc"#)
        #expect(CompanyIdentifier.sarisCyclingGroup.description == #"Saris Cycling Group, Inc"#)
    
        // Bekey A/S
        #expect(CompanyIdentifier.bekey.rawValue == 178)
        #expect(CompanyIdentifier.bekey.name == #"Bekey A/S"#)
        #expect(CompanyIdentifier.bekey.description == #"Bekey A/S"#)
    
        // Clarinox Technologies Pty. Ltd.
        #expect(CompanyIdentifier.clarinoxTechnologies.rawValue == 179)
        #expect(CompanyIdentifier.clarinoxTechnologies.name == #"Clarinox Technologies Pty. Ltd."#)
        #expect(CompanyIdentifier.clarinoxTechnologies.description == #"Clarinox Technologies Pty. Ltd."#)
    
        // BDE Technology Co., Ltd.
        #expect(CompanyIdentifier.bdeTechnology.rawValue == 180)
        #expect(CompanyIdentifier.bdeTechnology.name == #"BDE Technology Co., Ltd."#)
        #expect(CompanyIdentifier.bdeTechnology.description == #"BDE Technology Co., Ltd."#)
    
        // Swirl Networks
        #expect(CompanyIdentifier.swirlNetworks.rawValue == 181)
        #expect(CompanyIdentifier.swirlNetworks.name == #"Swirl Networks"#)
        #expect(CompanyIdentifier.swirlNetworks.description == #"Swirl Networks"#)
    
        // Meso international
        #expect(CompanyIdentifier.mesoInternational.rawValue == 182)
        #expect(CompanyIdentifier.mesoInternational.name == #"Meso international"#)
        #expect(CompanyIdentifier.mesoInternational.description == #"Meso international"#)
    
        // TreLab Ltd
        #expect(CompanyIdentifier.trelab.rawValue == 183)
        #expect(CompanyIdentifier.trelab.name == #"TreLab Ltd"#)
        #expect(CompanyIdentifier.trelab.description == #"TreLab Ltd"#)
    
        // Qualcomm Innovation Center, Inc. (QuIC)
        #expect(CompanyIdentifier.qualcommInnovationCenterQuic.rawValue == 184)
        #expect(CompanyIdentifier.qualcommInnovationCenterQuic.name == #"Qualcomm Innovation Center, Inc. (QuIC)"#)
        #expect(CompanyIdentifier.qualcommInnovationCenterQuic.description == #"Qualcomm Innovation Center, Inc. (QuIC)"#)
    
        // Johnson Controls, Inc.
        #expect(CompanyIdentifier.johnsonControls.rawValue == 185)
        #expect(CompanyIdentifier.johnsonControls.name == #"Johnson Controls, Inc."#)
        #expect(CompanyIdentifier.johnsonControls.description == #"Johnson Controls, Inc."#)
    
        // Starkey Hearing Technologies
        #expect(CompanyIdentifier.starkeyHearingTechnologies.rawValue == 186)
        #expect(CompanyIdentifier.starkeyHearingTechnologies.name == #"Starkey Hearing Technologies"#)
        #expect(CompanyIdentifier.starkeyHearingTechnologies.description == #"Starkey Hearing Technologies"#)
    
        // S-Power Electronics Limited
        #expect(CompanyIdentifier.sPowerElectronics.rawValue == 187)
        #expect(CompanyIdentifier.sPowerElectronics.name == #"S-Power Electronics Limited"#)
        #expect(CompanyIdentifier.sPowerElectronics.description == #"S-Power Electronics Limited"#)
    
        // Ace Sensor Inc
        #expect(CompanyIdentifier.aceSensor.rawValue == 188)
        #expect(CompanyIdentifier.aceSensor.name == #"Ace Sensor Inc"#)
        #expect(CompanyIdentifier.aceSensor.description == #"Ace Sensor Inc"#)
    
        // Aplix Corporation
        #expect(CompanyIdentifier.aplix.rawValue == 189)
        #expect(CompanyIdentifier.aplix.name == #"Aplix Corporation"#)
        #expect(CompanyIdentifier.aplix.description == #"Aplix Corporation"#)
    
        // AAMP of America
        #expect(CompanyIdentifier.aampOfAmerica.rawValue == 190)
        #expect(CompanyIdentifier.aampOfAmerica.name == #"AAMP of America"#)
        #expect(CompanyIdentifier.aampOfAmerica.description == #"AAMP of America"#)
    
        // Stalmart Technology Limited
        #expect(CompanyIdentifier.stalmartTechnology.rawValue == 191)
        #expect(CompanyIdentifier.stalmartTechnology.name == #"Stalmart Technology Limited"#)
        #expect(CompanyIdentifier.stalmartTechnology.description == #"Stalmart Technology Limited"#)
    
        // AMICCOM Electronics Corporation
        #expect(CompanyIdentifier.amiccomElectronics.rawValue == 192)
        #expect(CompanyIdentifier.amiccomElectronics.name == #"AMICCOM Electronics Corporation"#)
        #expect(CompanyIdentifier.amiccomElectronics.description == #"AMICCOM Electronics Corporation"#)
    
        // Shenzhen Excelsecu Data Technology Co.,Ltd
        #expect(CompanyIdentifier.shenzhenExcelsecuDataTechnology.rawValue == 193)
        #expect(CompanyIdentifier.shenzhenExcelsecuDataTechnology.name == #"Shenzhen Excelsecu Data Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenExcelsecuDataTechnology.description == #"Shenzhen Excelsecu Data Technology Co.,Ltd"#)
    
        // Geneq Inc.
        #expect(CompanyIdentifier.geneq.rawValue == 194)
        #expect(CompanyIdentifier.geneq.name == #"Geneq Inc."#)
        #expect(CompanyIdentifier.geneq.description == #"Geneq Inc."#)
    
        // adidas AG
        #expect(CompanyIdentifier.adidas.rawValue == 195)
        #expect(CompanyIdentifier.adidas.name == #"adidas AG"#)
        #expect(CompanyIdentifier.adidas.description == #"adidas AG"#)
    
        // LG Electronics
        #expect(CompanyIdentifier.lgElectronics.rawValue == 196)
        #expect(CompanyIdentifier.lgElectronics.name == #"LG Electronics"#)
        #expect(CompanyIdentifier.lgElectronics.description == #"LG Electronics"#)
    
        // Onset Computer Corporation
        #expect(CompanyIdentifier.onsetComputer.rawValue == 197)
        #expect(CompanyIdentifier.onsetComputer.name == #"Onset Computer Corporation"#)
        #expect(CompanyIdentifier.onsetComputer.description == #"Onset Computer Corporation"#)
    
        // Selfly BV
        #expect(CompanyIdentifier.selfly.rawValue == 198)
        #expect(CompanyIdentifier.selfly.name == #"Selfly BV"#)
        #expect(CompanyIdentifier.selfly.description == #"Selfly BV"#)
    
        // Quuppa Oy.
        #expect(CompanyIdentifier.quuppa.rawValue == 199)
        #expect(CompanyIdentifier.quuppa.name == #"Quuppa Oy."#)
        #expect(CompanyIdentifier.quuppa.description == #"Quuppa Oy."#)
    
        // GeLo Inc
        #expect(CompanyIdentifier.gelo.rawValue == 200)
        #expect(CompanyIdentifier.gelo.name == #"GeLo Inc"#)
        #expect(CompanyIdentifier.gelo.description == #"GeLo Inc"#)
    
        // Evluma
        #expect(CompanyIdentifier.evluma.rawValue == 201)
        #expect(CompanyIdentifier.evluma.name == #"Evluma"#)
        #expect(CompanyIdentifier.evluma.description == #"Evluma"#)
    
        // MC10
        #expect(CompanyIdentifier.mc10.rawValue == 202)
        #expect(CompanyIdentifier.mc10.name == #"MC10"#)
        #expect(CompanyIdentifier.mc10.description == #"MC10"#)
    
        // Binauric SE
        #expect(CompanyIdentifier.binauric.rawValue == 203)
        #expect(CompanyIdentifier.binauric.name == #"Binauric SE"#)
        #expect(CompanyIdentifier.binauric.description == #"Binauric SE"#)
    
        // Beats Electronics
        #expect(CompanyIdentifier.beatsElectronics.rawValue == 204)
        #expect(CompanyIdentifier.beatsElectronics.name == #"Beats Electronics"#)
        #expect(CompanyIdentifier.beatsElectronics.description == #"Beats Electronics"#)
    
        // Microchip Technology Inc.
        #expect(CompanyIdentifier.microchipTechnology.rawValue == 205)
        #expect(CompanyIdentifier.microchipTechnology.name == #"Microchip Technology Inc."#)
        #expect(CompanyIdentifier.microchipTechnology.description == #"Microchip Technology Inc."#)
    
        // Eve Systems GmbH
        #expect(CompanyIdentifier.eveSystems.rawValue == 206)
        #expect(CompanyIdentifier.eveSystems.name == #"Eve Systems GmbH"#)
        #expect(CompanyIdentifier.eveSystems.description == #"Eve Systems GmbH"#)
    
        // ARCHOS SA
        #expect(CompanyIdentifier.archos.rawValue == 207)
        #expect(CompanyIdentifier.archos.name == #"ARCHOS SA"#)
        #expect(CompanyIdentifier.archos.description == #"ARCHOS SA"#)
    
        // Dexcom, Inc.
        #expect(CompanyIdentifier.dexcom.rawValue == 208)
        #expect(CompanyIdentifier.dexcom.name == #"Dexcom, Inc."#)
        #expect(CompanyIdentifier.dexcom.description == #"Dexcom, Inc."#)
    
        // Polar Electro Europe B.V.
        #expect(CompanyIdentifier.polarElectroEurope.rawValue == 209)
        #expect(CompanyIdentifier.polarElectroEurope.name == #"Polar Electro Europe B.V."#)
        #expect(CompanyIdentifier.polarElectroEurope.description == #"Polar Electro Europe B.V."#)
    
        // Dialog Semiconductor B.V.
        #expect(CompanyIdentifier.dialogSemiconductor.rawValue == 210)
        #expect(CompanyIdentifier.dialogSemiconductor.name == #"Dialog Semiconductor B.V."#)
        #expect(CompanyIdentifier.dialogSemiconductor.description == #"Dialog Semiconductor B.V."#)
    
        // Taixingbang Technology (HK) Co,. LTD.
        #expect(CompanyIdentifier.taixingbangTechnology.rawValue == 211)
        #expect(CompanyIdentifier.taixingbangTechnology.name == #"Taixingbang Technology (HK) Co,. LTD."#)
        #expect(CompanyIdentifier.taixingbangTechnology.description == #"Taixingbang Technology (HK) Co,. LTD."#)
    
        // Kawantech
        #expect(CompanyIdentifier.kawantech.rawValue == 212)
        #expect(CompanyIdentifier.kawantech.name == #"Kawantech"#)
        #expect(CompanyIdentifier.kawantech.description == #"Kawantech"#)
    
        // Austco Communication Systems
        #expect(CompanyIdentifier.austcoCommunicationSystems.rawValue == 213)
        #expect(CompanyIdentifier.austcoCommunicationSystems.name == #"Austco Communication Systems"#)
        #expect(CompanyIdentifier.austcoCommunicationSystems.description == #"Austco Communication Systems"#)
    
        // Timex Group USA, Inc.
        #expect(CompanyIdentifier.timexGroup.rawValue == 214)
        #expect(CompanyIdentifier.timexGroup.name == #"Timex Group USA, Inc."#)
        #expect(CompanyIdentifier.timexGroup.description == #"Timex Group USA, Inc."#)
    
        // Qualcomm Technologies, Inc.
        #expect(CompanyIdentifier.qualcommTechnologies.rawValue == 215)
        #expect(CompanyIdentifier.qualcommTechnologies.name == #"Qualcomm Technologies, Inc."#)
        #expect(CompanyIdentifier.qualcommTechnologies.description == #"Qualcomm Technologies, Inc."#)
    
        // Qualcomm Connected Experiences, Inc.
        #expect(CompanyIdentifier.qualcommConnectedExperiences.rawValue == 216)
        #expect(CompanyIdentifier.qualcommConnectedExperiences.name == #"Qualcomm Connected Experiences, Inc."#)
        #expect(CompanyIdentifier.qualcommConnectedExperiences.description == #"Qualcomm Connected Experiences, Inc."#)
    
        // Voyetra Turtle Beach
        #expect(CompanyIdentifier.voyetraTurtleBeach.rawValue == 217)
        #expect(CompanyIdentifier.voyetraTurtleBeach.name == #"Voyetra Turtle Beach"#)
        #expect(CompanyIdentifier.voyetraTurtleBeach.description == #"Voyetra Turtle Beach"#)
    
        // txtr GmbH
        #expect(CompanyIdentifier.txtr.rawValue == 218)
        #expect(CompanyIdentifier.txtr.name == #"txtr GmbH"#)
        #expect(CompanyIdentifier.txtr.description == #"txtr GmbH"#)
    
        // Snuza (Pty) Ltd
        #expect(CompanyIdentifier.snuzaPty.rawValue == 219)
        #expect(CompanyIdentifier.snuzaPty.name == #"Snuza (Pty) Ltd"#)
        #expect(CompanyIdentifier.snuzaPty.description == #"Snuza (Pty) Ltd"#)
    
        // Procter & Gamble
        #expect(CompanyIdentifier.procterGamble.rawValue == 220)
        #expect(CompanyIdentifier.procterGamble.name == #"Procter & Gamble"#)
        #expect(CompanyIdentifier.procterGamble.description == #"Procter & Gamble"#)
    
        // Hosiden Corporation
        #expect(CompanyIdentifier.hosiden.rawValue == 221)
        #expect(CompanyIdentifier.hosiden.name == #"Hosiden Corporation"#)
        #expect(CompanyIdentifier.hosiden.description == #"Hosiden Corporation"#)
    
        // Muzik LLC
        #expect(CompanyIdentifier.muzik.rawValue == 222)
        #expect(CompanyIdentifier.muzik.name == #"Muzik LLC"#)
        #expect(CompanyIdentifier.muzik.description == #"Muzik LLC"#)
    
        // Misfit Wearables Corp
        #expect(CompanyIdentifier.misfitWearables.rawValue == 223)
        #expect(CompanyIdentifier.misfitWearables.name == #"Misfit Wearables Corp"#)
        #expect(CompanyIdentifier.misfitWearables.description == #"Misfit Wearables Corp"#)
    
        // Google
        #expect(CompanyIdentifier.google.rawValue == 224)
        #expect(CompanyIdentifier.google.name == #"Google"#)
        #expect(CompanyIdentifier.google.description == #"Google"#)
    
        // Danlers Ltd
        #expect(CompanyIdentifier.danlers.rawValue == 225)
        #expect(CompanyIdentifier.danlers.name == #"Danlers Ltd"#)
        #expect(CompanyIdentifier.danlers.description == #"Danlers Ltd"#)
    
        // Semilink Inc
        #expect(CompanyIdentifier.semilink.rawValue == 226)
        #expect(CompanyIdentifier.semilink.name == #"Semilink Inc"#)
        #expect(CompanyIdentifier.semilink.description == #"Semilink Inc"#)
    
        // inMusic Brands, Inc
        #expect(CompanyIdentifier.inmusicBrands.rawValue == 227)
        #expect(CompanyIdentifier.inmusicBrands.name == #"inMusic Brands, Inc"#)
        #expect(CompanyIdentifier.inmusicBrands.description == #"inMusic Brands, Inc"#)
    
        // L.S. Research, Inc.
        #expect(CompanyIdentifier.lSResearch.rawValue == 228)
        #expect(CompanyIdentifier.lSResearch.name == #"L.S. Research, Inc."#)
        #expect(CompanyIdentifier.lSResearch.description == #"L.S. Research, Inc."#)
    
        // Eden Software Consultants Ltd.
        #expect(CompanyIdentifier.edenSoftwareConsultants.rawValue == 229)
        #expect(CompanyIdentifier.edenSoftwareConsultants.name == #"Eden Software Consultants Ltd."#)
        #expect(CompanyIdentifier.edenSoftwareConsultants.description == #"Eden Software Consultants Ltd."#)
    
        // Freshtemp
        #expect(CompanyIdentifier.freshtemp.rawValue == 230)
        #expect(CompanyIdentifier.freshtemp.name == #"Freshtemp"#)
        #expect(CompanyIdentifier.freshtemp.description == #"Freshtemp"#)
    
        // KS Technologies
        #expect(CompanyIdentifier.ksTechnologies.rawValue == 231)
        #expect(CompanyIdentifier.ksTechnologies.name == #"KS Technologies"#)
        #expect(CompanyIdentifier.ksTechnologies.description == #"KS Technologies"#)
    
        // ACTS Technologies
        #expect(CompanyIdentifier.actsTechnologies.rawValue == 232)
        #expect(CompanyIdentifier.actsTechnologies.name == #"ACTS Technologies"#)
        #expect(CompanyIdentifier.actsTechnologies.description == #"ACTS Technologies"#)
    
        // Vtrack Systems
        #expect(CompanyIdentifier.vtrackSystems.rawValue == 233)
        #expect(CompanyIdentifier.vtrackSystems.name == #"Vtrack Systems"#)
        #expect(CompanyIdentifier.vtrackSystems.description == #"Vtrack Systems"#)
    
        // www.vtracksystems.com
        #expect(CompanyIdentifier.wwwVtracksystemsCom.rawValue == 234)
        #expect(CompanyIdentifier.wwwVtracksystemsCom.name == #"www.vtracksystems.com"#)
        #expect(CompanyIdentifier.wwwVtracksystemsCom.description == #"www.vtracksystems.com"#)
    
        // Server Technology Inc.
        #expect(CompanyIdentifier.serverTechnology.rawValue == 235)
        #expect(CompanyIdentifier.serverTechnology.name == #"Server Technology Inc."#)
        #expect(CompanyIdentifier.serverTechnology.description == #"Server Technology Inc."#)
    
        // BioResearch Associates
        #expect(CompanyIdentifier.bioresearchAssociates.rawValue == 236)
        #expect(CompanyIdentifier.bioresearchAssociates.name == #"BioResearch Associates"#)
        #expect(CompanyIdentifier.bioresearchAssociates.description == #"BioResearch Associates"#)
    
        // Jolly Logic, LLC
        #expect(CompanyIdentifier.jollyLogic.rawValue == 237)
        #expect(CompanyIdentifier.jollyLogic.name == #"Jolly Logic, LLC"#)
        #expect(CompanyIdentifier.jollyLogic.description == #"Jolly Logic, LLC"#)
    
        // Above Average Outcomes, Inc.
        #expect(CompanyIdentifier.aboveAverageOutcomes.rawValue == 238)
        #expect(CompanyIdentifier.aboveAverageOutcomes.name == #"Above Average Outcomes, Inc."#)
        #expect(CompanyIdentifier.aboveAverageOutcomes.description == #"Above Average Outcomes, Inc."#)
    
        // Bitsplitters GmbH
        #expect(CompanyIdentifier.bitsplitters.rawValue == 239)
        #expect(CompanyIdentifier.bitsplitters.name == #"Bitsplitters GmbH"#)
        #expect(CompanyIdentifier.bitsplitters.description == #"Bitsplitters GmbH"#)
    
        // PayPal, Inc.
        #expect(CompanyIdentifier.paypal.rawValue == 240)
        #expect(CompanyIdentifier.paypal.name == #"PayPal, Inc."#)
        #expect(CompanyIdentifier.paypal.description == #"PayPal, Inc."#)
    
        // Witron Technology Limited
        #expect(CompanyIdentifier.witronTechnology.rawValue == 241)
        #expect(CompanyIdentifier.witronTechnology.name == #"Witron Technology Limited"#)
        #expect(CompanyIdentifier.witronTechnology.description == #"Witron Technology Limited"#)
    
        // Morse Project Inc.
        #expect(CompanyIdentifier.morseProject.rawValue == 242)
        #expect(CompanyIdentifier.morseProject.name == #"Morse Project Inc."#)
        #expect(CompanyIdentifier.morseProject.description == #"Morse Project Inc."#)
    
        // Kent Displays Inc.
        #expect(CompanyIdentifier.kentDisplays.rawValue == 243)
        #expect(CompanyIdentifier.kentDisplays.name == #"Kent Displays Inc."#)
        #expect(CompanyIdentifier.kentDisplays.description == #"Kent Displays Inc."#)
    
        // Nautilus Inc.
        #expect(CompanyIdentifier.nautilus.rawValue == 244)
        #expect(CompanyIdentifier.nautilus.name == #"Nautilus Inc."#)
        #expect(CompanyIdentifier.nautilus.description == #"Nautilus Inc."#)
    
        // Smartifier Oy
        #expect(CompanyIdentifier.smartifier.rawValue == 245)
        #expect(CompanyIdentifier.smartifier.name == #"Smartifier Oy"#)
        #expect(CompanyIdentifier.smartifier.description == #"Smartifier Oy"#)
    
        // Elcometer Limited
        #expect(CompanyIdentifier.elcometer.rawValue == 246)
        #expect(CompanyIdentifier.elcometer.name == #"Elcometer Limited"#)
        #expect(CompanyIdentifier.elcometer.description == #"Elcometer Limited"#)
    
        // VSN Technologies, Inc.
        #expect(CompanyIdentifier.vsnTechnologies.rawValue == 247)
        #expect(CompanyIdentifier.vsnTechnologies.name == #"VSN Technologies, Inc."#)
        #expect(CompanyIdentifier.vsnTechnologies.description == #"VSN Technologies, Inc."#)
    
        // AceUni Corp., Ltd.
        #expect(CompanyIdentifier.aceuni.rawValue == 248)
        #expect(CompanyIdentifier.aceuni.name == #"AceUni Corp., Ltd."#)
        #expect(CompanyIdentifier.aceuni.description == #"AceUni Corp., Ltd."#)
    
        // StickNFind
        #expect(CompanyIdentifier.sticknfind.rawValue == 249)
        #expect(CompanyIdentifier.sticknfind.name == #"StickNFind"#)
        #expect(CompanyIdentifier.sticknfind.description == #"StickNFind"#)
    
        // Crystal Alarm AB
        #expect(CompanyIdentifier.crystalAlarm.rawValue == 250)
        #expect(CompanyIdentifier.crystalAlarm.name == #"Crystal Alarm AB"#)
        #expect(CompanyIdentifier.crystalAlarm.description == #"Crystal Alarm AB"#)
    
        // KOUKAAM a.s.
        #expect(CompanyIdentifier.koukaam.rawValue == 251)
        #expect(CompanyIdentifier.koukaam.name == #"KOUKAAM a.s."#)
        #expect(CompanyIdentifier.koukaam.description == #"KOUKAAM a.s."#)
    
        // Delphi Corporation
        #expect(CompanyIdentifier.delphi.rawValue == 252)
        #expect(CompanyIdentifier.delphi.name == #"Delphi Corporation"#)
        #expect(CompanyIdentifier.delphi.description == #"Delphi Corporation"#)
    
        // ValenceTech Limited
        #expect(CompanyIdentifier.valencetech.rawValue == 253)
        #expect(CompanyIdentifier.valencetech.name == #"ValenceTech Limited"#)
        #expect(CompanyIdentifier.valencetech.description == #"ValenceTech Limited"#)
    
        // Stanley Black and Decker
        #expect(CompanyIdentifier.stanleyBlackAndDecker.rawValue == 254)
        #expect(CompanyIdentifier.stanleyBlackAndDecker.name == #"Stanley Black and Decker"#)
        #expect(CompanyIdentifier.stanleyBlackAndDecker.description == #"Stanley Black and Decker"#)
    
        // Typo Products, LLC
        #expect(CompanyIdentifier.typoProducts.rawValue == 255)
        #expect(CompanyIdentifier.typoProducts.name == #"Typo Products, LLC"#)
        #expect(CompanyIdentifier.typoProducts.description == #"Typo Products, LLC"#)
    
        // TomTom International BV
        #expect(CompanyIdentifier.tomtomInternational.rawValue == 256)
        #expect(CompanyIdentifier.tomtomInternational.name == #"TomTom International BV"#)
        #expect(CompanyIdentifier.tomtomInternational.description == #"TomTom International BV"#)
    
        // Fugoo, Inc.
        #expect(CompanyIdentifier.fugoo.rawValue == 257)
        #expect(CompanyIdentifier.fugoo.name == #"Fugoo, Inc."#)
        #expect(CompanyIdentifier.fugoo.description == #"Fugoo, Inc."#)
    
        // Keiser Corporation
        #expect(CompanyIdentifier.keiser.rawValue == 258)
        #expect(CompanyIdentifier.keiser.name == #"Keiser Corporation"#)
        #expect(CompanyIdentifier.keiser.description == #"Keiser Corporation"#)
    
        // Bang & Olufsen A/S
        #expect(CompanyIdentifier.bangOlufsen.rawValue == 259)
        #expect(CompanyIdentifier.bangOlufsen.name == #"Bang & Olufsen A/S"#)
        #expect(CompanyIdentifier.bangOlufsen.description == #"Bang & Olufsen A/S"#)
    
        // PLUS Location Systems Pty Ltd
        #expect(CompanyIdentifier.plusLocationSystems.rawValue == 260)
        #expect(CompanyIdentifier.plusLocationSystems.name == #"PLUS Location Systems Pty Ltd"#)
        #expect(CompanyIdentifier.plusLocationSystems.description == #"PLUS Location Systems Pty Ltd"#)
    
        // Ubiquitous Computing Technology Corporation
        #expect(CompanyIdentifier.ubiquitousComputingTechnology.rawValue == 261)
        #expect(CompanyIdentifier.ubiquitousComputingTechnology.name == #"Ubiquitous Computing Technology Corporation"#)
        #expect(CompanyIdentifier.ubiquitousComputingTechnology.description == #"Ubiquitous Computing Technology Corporation"#)
    
        // Innovative Yachtter Solutions
        #expect(CompanyIdentifier.innovativeYachtterSolutions.rawValue == 262)
        #expect(CompanyIdentifier.innovativeYachtterSolutions.name == #"Innovative Yachtter Solutions"#)
        #expect(CompanyIdentifier.innovativeYachtterSolutions.description == #"Innovative Yachtter Solutions"#)
    
        // Demant A/S
        #expect(CompanyIdentifier.demant.rawValue == 263)
        #expect(CompanyIdentifier.demant.name == #"Demant A/S"#)
        #expect(CompanyIdentifier.demant.description == #"Demant A/S"#)
    
        // Chicony Electronics Co., Ltd.
        #expect(CompanyIdentifier.chiconyElectronics.rawValue == 264)
        #expect(CompanyIdentifier.chiconyElectronics.name == #"Chicony Electronics Co., Ltd."#)
        #expect(CompanyIdentifier.chiconyElectronics.description == #"Chicony Electronics Co., Ltd."#)
    
        // Atus BV
        #expect(CompanyIdentifier.atus.rawValue == 265)
        #expect(CompanyIdentifier.atus.name == #"Atus BV"#)
        #expect(CompanyIdentifier.atus.description == #"Atus BV"#)
    
        // Codegate Ltd
        #expect(CompanyIdentifier.codegate.rawValue == 266)
        #expect(CompanyIdentifier.codegate.name == #"Codegate Ltd"#)
        #expect(CompanyIdentifier.codegate.description == #"Codegate Ltd"#)
    
        // ERi, Inc
        #expect(CompanyIdentifier.eri.rawValue == 267)
        #expect(CompanyIdentifier.eri.name == #"ERi, Inc"#)
        #expect(CompanyIdentifier.eri.description == #"ERi, Inc"#)
    
        // Transducers Direct, LLC
        #expect(CompanyIdentifier.transducersDirect.rawValue == 268)
        #expect(CompanyIdentifier.transducersDirect.name == #"Transducers Direct, LLC"#)
        #expect(CompanyIdentifier.transducersDirect.description == #"Transducers Direct, LLC"#)
    
        // DENSO TEN Limited
        #expect(CompanyIdentifier.densoTen.rawValue == 269)
        #expect(CompanyIdentifier.densoTen.name == #"DENSO TEN Limited"#)
        #expect(CompanyIdentifier.densoTen.description == #"DENSO TEN Limited"#)
    
        // Audi AG
        #expect(CompanyIdentifier.audi.rawValue == 270)
        #expect(CompanyIdentifier.audi.name == #"Audi AG"#)
        #expect(CompanyIdentifier.audi.description == #"Audi AG"#)
    
        // HiSilicon Technologies CO., LIMITED
        #expect(CompanyIdentifier.hisiliconTechnologies.rawValue == 271)
        #expect(CompanyIdentifier.hisiliconTechnologies.name == #"HiSilicon Technologies CO., LIMITED"#)
        #expect(CompanyIdentifier.hisiliconTechnologies.description == #"HiSilicon Technologies CO., LIMITED"#)
    
        // Nippon Seiki Co., Ltd.
        #expect(CompanyIdentifier.nipponSeiki.rawValue == 272)
        #expect(CompanyIdentifier.nipponSeiki.name == #"Nippon Seiki Co., Ltd."#)
        #expect(CompanyIdentifier.nipponSeiki.description == #"Nippon Seiki Co., Ltd."#)
    
        // Steelseries ApS
        #expect(CompanyIdentifier.steelseries.rawValue == 273)
        #expect(CompanyIdentifier.steelseries.name == #"Steelseries ApS"#)
        #expect(CompanyIdentifier.steelseries.description == #"Steelseries ApS"#)
    
        // Visybl Inc.
        #expect(CompanyIdentifier.visybl.rawValue == 274)
        #expect(CompanyIdentifier.visybl.name == #"Visybl Inc."#)
        #expect(CompanyIdentifier.visybl.description == #"Visybl Inc."#)
    
        // Openbrain Technologies, Co., Ltd.
        #expect(CompanyIdentifier.openbrainTechnologies.rawValue == 275)
        #expect(CompanyIdentifier.openbrainTechnologies.name == #"Openbrain Technologies, Co., Ltd."#)
        #expect(CompanyIdentifier.openbrainTechnologies.description == #"Openbrain Technologies, Co., Ltd."#)
    
        // Xensr
        #expect(CompanyIdentifier.xensr.rawValue == 276)
        #expect(CompanyIdentifier.xensr.name == #"Xensr"#)
        #expect(CompanyIdentifier.xensr.description == #"Xensr"#)
    
        // e.solutions
        #expect(CompanyIdentifier.eSolutions.rawValue == 277)
        #expect(CompanyIdentifier.eSolutions.name == #"e.solutions"#)
        #expect(CompanyIdentifier.eSolutions.description == #"e.solutions"#)
    
        // 10AK Technologies
        #expect(CompanyIdentifier.company10AkTechnologies.rawValue == 278)
        #expect(CompanyIdentifier.company10AkTechnologies.name == #"10AK Technologies"#)
        #expect(CompanyIdentifier.company10AkTechnologies.description == #"10AK Technologies"#)
    
        // Wimoto Technologies Inc
        #expect(CompanyIdentifier.wimotoTechnologies.rawValue == 279)
        #expect(CompanyIdentifier.wimotoTechnologies.name == #"Wimoto Technologies Inc"#)
        #expect(CompanyIdentifier.wimotoTechnologies.description == #"Wimoto Technologies Inc"#)
    
        // Radius Networks, Inc.
        #expect(CompanyIdentifier.radiusNetworks.rawValue == 280)
        #expect(CompanyIdentifier.radiusNetworks.name == #"Radius Networks, Inc."#)
        #expect(CompanyIdentifier.radiusNetworks.description == #"Radius Networks, Inc."#)
    
        // Wize Technology Co., Ltd.
        #expect(CompanyIdentifier.wizeTechnology.rawValue == 281)
        #expect(CompanyIdentifier.wizeTechnology.name == #"Wize Technology Co., Ltd."#)
        #expect(CompanyIdentifier.wizeTechnology.description == #"Wize Technology Co., Ltd."#)
    
        // Qualcomm Labs, Inc.
        #expect(CompanyIdentifier.qualcommLabs.rawValue == 282)
        #expect(CompanyIdentifier.qualcommLabs.name == #"Qualcomm Labs, Inc."#)
        #expect(CompanyIdentifier.qualcommLabs.description == #"Qualcomm Labs, Inc."#)
    
        // Hewlett Packard Enterprise
        #expect(CompanyIdentifier.hewlettPackardEnterprise.rawValue == 283)
        #expect(CompanyIdentifier.hewlettPackardEnterprise.name == #"Hewlett Packard Enterprise"#)
        #expect(CompanyIdentifier.hewlettPackardEnterprise.description == #"Hewlett Packard Enterprise"#)
    
        // Baidu
        #expect(CompanyIdentifier.baidu.rawValue == 284)
        #expect(CompanyIdentifier.baidu.name == #"Baidu"#)
        #expect(CompanyIdentifier.baidu.description == #"Baidu"#)
    
        // Arendi AG
        #expect(CompanyIdentifier.arendi.rawValue == 285)
        #expect(CompanyIdentifier.arendi.name == #"Arendi AG"#)
        #expect(CompanyIdentifier.arendi.description == #"Arendi AG"#)
    
        // Skoda Auto a.s.
        #expect(CompanyIdentifier.skodaAuto.rawValue == 286)
        #expect(CompanyIdentifier.skodaAuto.name == #"Skoda Auto a.s."#)
        #expect(CompanyIdentifier.skodaAuto.description == #"Skoda Auto a.s."#)
    
        // Volkswagen AG
        #expect(CompanyIdentifier.volkswagen.rawValue == 287)
        #expect(CompanyIdentifier.volkswagen.name == #"Volkswagen AG"#)
        #expect(CompanyIdentifier.volkswagen.description == #"Volkswagen AG"#)
    
        // Porsche AG
        #expect(CompanyIdentifier.porsche.rawValue == 288)
        #expect(CompanyIdentifier.porsche.name == #"Porsche AG"#)
        #expect(CompanyIdentifier.porsche.description == #"Porsche AG"#)
    
        // Sino Wealth Electronic Ltd.
        #expect(CompanyIdentifier.sinoWealthElectronic.rawValue == 289)
        #expect(CompanyIdentifier.sinoWealthElectronic.name == #"Sino Wealth Electronic Ltd."#)
        #expect(CompanyIdentifier.sinoWealthElectronic.description == #"Sino Wealth Electronic Ltd."#)
    
        // AirTurn, Inc.
        #expect(CompanyIdentifier.airturn.rawValue == 290)
        #expect(CompanyIdentifier.airturn.name == #"AirTurn, Inc."#)
        #expect(CompanyIdentifier.airturn.description == #"AirTurn, Inc."#)
    
        // Kinsa, Inc
        #expect(CompanyIdentifier.kinsa.rawValue == 291)
        #expect(CompanyIdentifier.kinsa.name == #"Kinsa, Inc"#)
        #expect(CompanyIdentifier.kinsa.description == #"Kinsa, Inc"#)
    
        // HID Global
        #expect(CompanyIdentifier.hidGlobal.rawValue == 292)
        #expect(CompanyIdentifier.hidGlobal.name == #"HID Global"#)
        #expect(CompanyIdentifier.hidGlobal.description == #"HID Global"#)
    
        // SEAT es
        #expect(CompanyIdentifier.seatEs.rawValue == 293)
        #expect(CompanyIdentifier.seatEs.name == #"SEAT es"#)
        #expect(CompanyIdentifier.seatEs.description == #"SEAT es"#)
    
        // Promethean Ltd.
        #expect(CompanyIdentifier.promethean.rawValue == 294)
        #expect(CompanyIdentifier.promethean.name == #"Promethean Ltd."#)
        #expect(CompanyIdentifier.promethean.description == #"Promethean Ltd."#)
    
        // Salutica Allied Solutions
        #expect(CompanyIdentifier.saluticaAlliedSolutions.rawValue == 295)
        #expect(CompanyIdentifier.saluticaAlliedSolutions.name == #"Salutica Allied Solutions"#)
        #expect(CompanyIdentifier.saluticaAlliedSolutions.description == #"Salutica Allied Solutions"#)
    
        // GPSI Group Pty Ltd
        #expect(CompanyIdentifier.gpsiGroup.rawValue == 296)
        #expect(CompanyIdentifier.gpsiGroup.name == #"GPSI Group Pty Ltd"#)
        #expect(CompanyIdentifier.gpsiGroup.description == #"GPSI Group Pty Ltd"#)
    
        // Nimble Devices Oy
        #expect(CompanyIdentifier.nimbleDevices.rawValue == 297)
        #expect(CompanyIdentifier.nimbleDevices.name == #"Nimble Devices Oy"#)
        #expect(CompanyIdentifier.nimbleDevices.description == #"Nimble Devices Oy"#)
    
        // Changzhou Yongse Infotech  Co., Ltd.
        #expect(CompanyIdentifier.changzhouYongseInfotech.rawValue == 298)
        #expect(CompanyIdentifier.changzhouYongseInfotech.name == #"Changzhou Yongse Infotech  Co., Ltd."#)
        #expect(CompanyIdentifier.changzhouYongseInfotech.description == #"Changzhou Yongse Infotech  Co., Ltd."#)
    
        // SportIQ
        #expect(CompanyIdentifier.sportiq.rawValue == 299)
        #expect(CompanyIdentifier.sportiq.name == #"SportIQ"#)
        #expect(CompanyIdentifier.sportiq.description == #"SportIQ"#)
    
        // TEMEC Instruments B.V.
        #expect(CompanyIdentifier.temecInstruments.rawValue == 300)
        #expect(CompanyIdentifier.temecInstruments.name == #"TEMEC Instruments B.V."#)
        #expect(CompanyIdentifier.temecInstruments.description == #"TEMEC Instruments B.V."#)
    
        // Sony Corporation
        #expect(CompanyIdentifier.sony.rawValue == 301)
        #expect(CompanyIdentifier.sony.name == #"Sony Corporation"#)
        #expect(CompanyIdentifier.sony.description == #"Sony Corporation"#)
    
        // ASSA ABLOY
        #expect(CompanyIdentifier.assaAbloy.rawValue == 302)
        #expect(CompanyIdentifier.assaAbloy.name == #"ASSA ABLOY"#)
        #expect(CompanyIdentifier.assaAbloy.description == #"ASSA ABLOY"#)
    
        // Clarion Co. Inc.
        #expect(CompanyIdentifier.clarion.rawValue == 303)
        #expect(CompanyIdentifier.clarion.name == #"Clarion Co. Inc."#)
        #expect(CompanyIdentifier.clarion.description == #"Clarion Co. Inc."#)
    
        // Warehouse Innovations
        #expect(CompanyIdentifier.warehouseInnovations.rawValue == 304)
        #expect(CompanyIdentifier.warehouseInnovations.name == #"Warehouse Innovations"#)
        #expect(CompanyIdentifier.warehouseInnovations.description == #"Warehouse Innovations"#)
    
        // Cypress Semiconductor
        #expect(CompanyIdentifier.cypressSemiconductor.rawValue == 305)
        #expect(CompanyIdentifier.cypressSemiconductor.name == #"Cypress Semiconductor"#)
        #expect(CompanyIdentifier.cypressSemiconductor.description == #"Cypress Semiconductor"#)
    
        // MADS Inc
        #expect(CompanyIdentifier.mads.rawValue == 306)
        #expect(CompanyIdentifier.mads.name == #"MADS Inc"#)
        #expect(CompanyIdentifier.mads.description == #"MADS Inc"#)
    
        // Blue Maestro Limited
        #expect(CompanyIdentifier.blueMaestro.rawValue == 307)
        #expect(CompanyIdentifier.blueMaestro.name == #"Blue Maestro Limited"#)
        #expect(CompanyIdentifier.blueMaestro.description == #"Blue Maestro Limited"#)
    
        // Resolution Products, Ltd.
        #expect(CompanyIdentifier.resolutionProducts.rawValue == 308)
        #expect(CompanyIdentifier.resolutionProducts.name == #"Resolution Products, Ltd."#)
        #expect(CompanyIdentifier.resolutionProducts.description == #"Resolution Products, Ltd."#)
    
        // Aireware LLC
        #expect(CompanyIdentifier.aireware.rawValue == 309)
        #expect(CompanyIdentifier.aireware.name == #"Aireware LLC"#)
        #expect(CompanyIdentifier.aireware.description == #"Aireware LLC"#)
    
        // Silvair, Inc.
        #expect(CompanyIdentifier.silvair.rawValue == 310)
        #expect(CompanyIdentifier.silvair.name == #"Silvair, Inc."#)
        #expect(CompanyIdentifier.silvair.description == #"Silvair, Inc."#)
    
        // Prestigio Plaza Ltd.
        #expect(CompanyIdentifier.prestigioPlaza.rawValue == 311)
        #expect(CompanyIdentifier.prestigioPlaza.name == #"Prestigio Plaza Ltd."#)
        #expect(CompanyIdentifier.prestigioPlaza.description == #"Prestigio Plaza Ltd."#)
    
        // NTEO Inc.
        #expect(CompanyIdentifier.nteo.rawValue == 312)
        #expect(CompanyIdentifier.nteo.name == #"NTEO Inc."#)
        #expect(CompanyIdentifier.nteo.description == #"NTEO Inc."#)
    
        // Focus Systems Corporation
        #expect(CompanyIdentifier.focusSystems.rawValue == 313)
        #expect(CompanyIdentifier.focusSystems.name == #"Focus Systems Corporation"#)
        #expect(CompanyIdentifier.focusSystems.description == #"Focus Systems Corporation"#)
    
        // Tencent Holdings Ltd.
        #expect(CompanyIdentifier.tencentHoldings.rawValue == 314)
        #expect(CompanyIdentifier.tencentHoldings.name == #"Tencent Holdings Ltd."#)
        #expect(CompanyIdentifier.tencentHoldings.description == #"Tencent Holdings Ltd."#)
    
        // Allegion
        #expect(CompanyIdentifier.allegion.rawValue == 315)
        #expect(CompanyIdentifier.allegion.name == #"Allegion"#)
        #expect(CompanyIdentifier.allegion.description == #"Allegion"#)
    
        // Murata Manufacturing Co., Ltd.
        #expect(CompanyIdentifier.murataManufacturing.rawValue == 316)
        #expect(CompanyIdentifier.murataManufacturing.name == #"Murata Manufacturing Co., Ltd."#)
        #expect(CompanyIdentifier.murataManufacturing.description == #"Murata Manufacturing Co., Ltd."#)
    
        // WirelessWERX
        #expect(CompanyIdentifier.wirelesswerx.rawValue == 317)
        #expect(CompanyIdentifier.wirelesswerx.name == #"WirelessWERX"#)
        #expect(CompanyIdentifier.wirelesswerx.description == #"WirelessWERX"#)
    
        // Nod, Inc.
        #expect(CompanyIdentifier.nod.rawValue == 318)
        #expect(CompanyIdentifier.nod.name == #"Nod, Inc."#)
        #expect(CompanyIdentifier.nod.description == #"Nod, Inc."#)
    
        // B&B Manufacturing Company
        #expect(CompanyIdentifier.bBManufacturing.rawValue == 319)
        #expect(CompanyIdentifier.bBManufacturing.name == #"B&B Manufacturing Company"#)
        #expect(CompanyIdentifier.bBManufacturing.description == #"B&B Manufacturing Company"#)
    
        // Alpine Electronics (China) Co., Ltd
        #expect(CompanyIdentifier.alpineElectronicsChina.rawValue == 320)
        #expect(CompanyIdentifier.alpineElectronicsChina.name == #"Alpine Electronics (China) Co., Ltd"#)
        #expect(CompanyIdentifier.alpineElectronicsChina.description == #"Alpine Electronics (China) Co., Ltd"#)
    
        // FedEx Services
        #expect(CompanyIdentifier.fedexServices.rawValue == 321)
        #expect(CompanyIdentifier.fedexServices.name == #"FedEx Services"#)
        #expect(CompanyIdentifier.fedexServices.description == #"FedEx Services"#)
    
        // Grape Systems Inc.
        #expect(CompanyIdentifier.grapeSystems.rawValue == 322)
        #expect(CompanyIdentifier.grapeSystems.name == #"Grape Systems Inc."#)
        #expect(CompanyIdentifier.grapeSystems.description == #"Grape Systems Inc."#)
    
        // Bkon Connect
        #expect(CompanyIdentifier.bkonConnect.rawValue == 323)
        #expect(CompanyIdentifier.bkonConnect.name == #"Bkon Connect"#)
        #expect(CompanyIdentifier.bkonConnect.description == #"Bkon Connect"#)
    
        // Lintech GmbH
        #expect(CompanyIdentifier.lintech.rawValue == 324)
        #expect(CompanyIdentifier.lintech.name == #"Lintech GmbH"#)
        #expect(CompanyIdentifier.lintech.description == #"Lintech GmbH"#)
    
        // Novatel Wireless
        #expect(CompanyIdentifier.novatelWireless.rawValue == 325)
        #expect(CompanyIdentifier.novatelWireless.name == #"Novatel Wireless"#)
        #expect(CompanyIdentifier.novatelWireless.description == #"Novatel Wireless"#)
    
        // Ciright
        #expect(CompanyIdentifier.ciright.rawValue == 326)
        #expect(CompanyIdentifier.ciright.name == #"Ciright"#)
        #expect(CompanyIdentifier.ciright.description == #"Ciright"#)
    
        // Mighty Cast, Inc.
        #expect(CompanyIdentifier.mightyCast.rawValue == 327)
        #expect(CompanyIdentifier.mightyCast.name == #"Mighty Cast, Inc."#)
        #expect(CompanyIdentifier.mightyCast.description == #"Mighty Cast, Inc."#)
    
        // Ambimat Electronics
        #expect(CompanyIdentifier.ambimatElectronics.rawValue == 328)
        #expect(CompanyIdentifier.ambimatElectronics.name == #"Ambimat Electronics"#)
        #expect(CompanyIdentifier.ambimatElectronics.description == #"Ambimat Electronics"#)
    
        // Perytons Ltd.
        #expect(CompanyIdentifier.perytons.rawValue == 329)
        #expect(CompanyIdentifier.perytons.name == #"Perytons Ltd."#)
        #expect(CompanyIdentifier.perytons.description == #"Perytons Ltd."#)
    
        // Tivoli Audio, LLC
        #expect(CompanyIdentifier.tivoliAudio.rawValue == 330)
        #expect(CompanyIdentifier.tivoliAudio.name == #"Tivoli Audio, LLC"#)
        #expect(CompanyIdentifier.tivoliAudio.description == #"Tivoli Audio, LLC"#)
    
        // Master Lock
        #expect(CompanyIdentifier.masterLock.rawValue == 331)
        #expect(CompanyIdentifier.masterLock.name == #"Master Lock"#)
        #expect(CompanyIdentifier.masterLock.description == #"Master Lock"#)
    
        // Mesh-Net Ltd
        #expect(CompanyIdentifier.meshNet.rawValue == 332)
        #expect(CompanyIdentifier.meshNet.name == #"Mesh-Net Ltd"#)
        #expect(CompanyIdentifier.meshNet.description == #"Mesh-Net Ltd"#)
    
        // HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.
        #expect(CompanyIdentifier.huizhouDesaySvAutomotive.rawValue == 333)
        #expect(CompanyIdentifier.huizhouDesaySvAutomotive.name == #"HUIZHOU DESAY SV AUTOMOTIVE CO., LTD."#)
        #expect(CompanyIdentifier.huizhouDesaySvAutomotive.description == #"HUIZHOU DESAY SV AUTOMOTIVE CO., LTD."#)
    
        // Tangerine, Inc.
        #expect(CompanyIdentifier.tangerine.rawValue == 334)
        #expect(CompanyIdentifier.tangerine.name == #"Tangerine, Inc."#)
        #expect(CompanyIdentifier.tangerine.description == #"Tangerine, Inc."#)
    
        // B&W Group Ltd.
        #expect(CompanyIdentifier.bWGroup.rawValue == 335)
        #expect(CompanyIdentifier.bWGroup.name == #"B&W Group Ltd."#)
        #expect(CompanyIdentifier.bWGroup.description == #"B&W Group Ltd."#)
    
        // Pioneer Corporation
        #expect(CompanyIdentifier.pioneer.rawValue == 336)
        #expect(CompanyIdentifier.pioneer.name == #"Pioneer Corporation"#)
        #expect(CompanyIdentifier.pioneer.description == #"Pioneer Corporation"#)
    
        // OnBeep
        #expect(CompanyIdentifier.onbeep.rawValue == 337)
        #expect(CompanyIdentifier.onbeep.name == #"OnBeep"#)
        #expect(CompanyIdentifier.onbeep.description == #"OnBeep"#)
    
        // Vernier Software & Technology
        #expect(CompanyIdentifier.vernierSoftwareTechnology.rawValue == 338)
        #expect(CompanyIdentifier.vernierSoftwareTechnology.name == #"Vernier Software & Technology"#)
        #expect(CompanyIdentifier.vernierSoftwareTechnology.description == #"Vernier Software & Technology"#)
    
        // ROL Ergo
        #expect(CompanyIdentifier.rolErgo.rawValue == 339)
        #expect(CompanyIdentifier.rolErgo.name == #"ROL Ergo"#)
        #expect(CompanyIdentifier.rolErgo.description == #"ROL Ergo"#)
    
        // Pebble Technology
        #expect(CompanyIdentifier.pebbleTechnology.rawValue == 340)
        #expect(CompanyIdentifier.pebbleTechnology.name == #"Pebble Technology"#)
        #expect(CompanyIdentifier.pebbleTechnology.description == #"Pebble Technology"#)
    
        // NETATMO
        #expect(CompanyIdentifier.netatmo.rawValue == 341)
        #expect(CompanyIdentifier.netatmo.name == #"NETATMO"#)
        #expect(CompanyIdentifier.netatmo.description == #"NETATMO"#)
    
        // Accumulate AB
        #expect(CompanyIdentifier.accumulate.rawValue == 342)
        #expect(CompanyIdentifier.accumulate.name == #"Accumulate AB"#)
        #expect(CompanyIdentifier.accumulate.description == #"Accumulate AB"#)
    
        // Anhui Huami Information Technology Co., Ltd.
        #expect(CompanyIdentifier.anhuiHuamiInformationTechnology.rawValue == 343)
        #expect(CompanyIdentifier.anhuiHuamiInformationTechnology.name == #"Anhui Huami Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.anhuiHuamiInformationTechnology.description == #"Anhui Huami Information Technology Co., Ltd."#)
    
        // Inmite s.r.o.
        #expect(CompanyIdentifier.inmite.rawValue == 344)
        #expect(CompanyIdentifier.inmite.name == #"Inmite s.r.o."#)
        #expect(CompanyIdentifier.inmite.description == #"Inmite s.r.o."#)
    
        // ChefSteps, Inc.
        #expect(CompanyIdentifier.chefsteps.rawValue == 345)
        #expect(CompanyIdentifier.chefsteps.name == #"ChefSteps, Inc."#)
        #expect(CompanyIdentifier.chefsteps.description == #"ChefSteps, Inc."#)
    
        // micas AG
        #expect(CompanyIdentifier.micas.rawValue == 346)
        #expect(CompanyIdentifier.micas.name == #"micas AG"#)
        #expect(CompanyIdentifier.micas.description == #"micas AG"#)
    
        // Biomedical Research Ltd.
        #expect(CompanyIdentifier.biomedicalResearch.rawValue == 347)
        #expect(CompanyIdentifier.biomedicalResearch.name == #"Biomedical Research Ltd."#)
        #expect(CompanyIdentifier.biomedicalResearch.description == #"Biomedical Research Ltd."#)
    
        // Pitius Tec S.L.
        #expect(CompanyIdentifier.pitiusTec.rawValue == 348)
        #expect(CompanyIdentifier.pitiusTec.name == #"Pitius Tec S.L."#)
        #expect(CompanyIdentifier.pitiusTec.description == #"Pitius Tec S.L."#)
    
        // Estimote, Inc.
        #expect(CompanyIdentifier.estimote.rawValue == 349)
        #expect(CompanyIdentifier.estimote.name == #"Estimote, Inc."#)
        #expect(CompanyIdentifier.estimote.description == #"Estimote, Inc."#)
    
        // Unikey Technologies, Inc.
        #expect(CompanyIdentifier.unikeyTechnologies.rawValue == 350)
        #expect(CompanyIdentifier.unikeyTechnologies.name == #"Unikey Technologies, Inc."#)
        #expect(CompanyIdentifier.unikeyTechnologies.description == #"Unikey Technologies, Inc."#)
    
        // Timer Cap Co.
        #expect(CompanyIdentifier.timerCap.rawValue == 351)
        #expect(CompanyIdentifier.timerCap.name == #"Timer Cap Co."#)
        #expect(CompanyIdentifier.timerCap.description == #"Timer Cap Co."#)
    
        // AwoX
        #expect(CompanyIdentifier.awox.rawValue == 352)
        #expect(CompanyIdentifier.awox.name == #"AwoX"#)
        #expect(CompanyIdentifier.awox.description == #"AwoX"#)
    
        // yikes
        #expect(CompanyIdentifier.yikes.rawValue == 353)
        #expect(CompanyIdentifier.yikes.name == #"yikes"#)
        #expect(CompanyIdentifier.yikes.description == #"yikes"#)
    
        // MADSGlobalNZ Ltd.
        #expect(CompanyIdentifier.madsglobalnz.rawValue == 354)
        #expect(CompanyIdentifier.madsglobalnz.name == #"MADSGlobalNZ Ltd."#)
        #expect(CompanyIdentifier.madsglobalnz.description == #"MADSGlobalNZ Ltd."#)
    
        // PCH International
        #expect(CompanyIdentifier.pchInternational.rawValue == 355)
        #expect(CompanyIdentifier.pchInternational.name == #"PCH International"#)
        #expect(CompanyIdentifier.pchInternational.description == #"PCH International"#)
    
        // Qingdao Yeelink Information Technology Co., Ltd.
        #expect(CompanyIdentifier.qingdaoYeelinkInformationTechnology.rawValue == 356)
        #expect(CompanyIdentifier.qingdaoYeelinkInformationTechnology.name == #"Qingdao Yeelink Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.qingdaoYeelinkInformationTechnology.description == #"Qingdao Yeelink Information Technology Co., Ltd."#)
    
        // Milwaukee Electric Tools
        #expect(CompanyIdentifier.milwaukeeElectricTools.rawValue == 357)
        #expect(CompanyIdentifier.milwaukeeElectricTools.name == #"Milwaukee Electric Tools"#)
        #expect(CompanyIdentifier.milwaukeeElectricTools.description == #"Milwaukee Electric Tools"#)
    
        // MISHIK Pte Ltd
        #expect(CompanyIdentifier.mishikPte.rawValue == 358)
        #expect(CompanyIdentifier.mishikPte.name == #"MISHIK Pte Ltd"#)
        #expect(CompanyIdentifier.mishikPte.description == #"MISHIK Pte Ltd"#)
    
        // Ascensia Diabetes Care US Inc.
        #expect(CompanyIdentifier.ascensiaDiabetesCareUs.rawValue == 359)
        #expect(CompanyIdentifier.ascensiaDiabetesCareUs.name == #"Ascensia Diabetes Care US Inc."#)
        #expect(CompanyIdentifier.ascensiaDiabetesCareUs.description == #"Ascensia Diabetes Care US Inc."#)
    
        // Spicebox LLC
        #expect(CompanyIdentifier.spicebox.rawValue == 360)
        #expect(CompanyIdentifier.spicebox.name == #"Spicebox LLC"#)
        #expect(CompanyIdentifier.spicebox.description == #"Spicebox LLC"#)
    
        // emberlight
        #expect(CompanyIdentifier.emberlight.rawValue == 361)
        #expect(CompanyIdentifier.emberlight.name == #"emberlight"#)
        #expect(CompanyIdentifier.emberlight.description == #"emberlight"#)
    
        // Copeland Cold Chain LP
        #expect(CompanyIdentifier.copelandColdChainLp.rawValue == 362)
        #expect(CompanyIdentifier.copelandColdChainLp.name == #"Copeland Cold Chain LP"#)
        #expect(CompanyIdentifier.copelandColdChainLp.description == #"Copeland Cold Chain LP"#)
    
        // Qblinks
        #expect(CompanyIdentifier.qblinks.rawValue == 363)
        #expect(CompanyIdentifier.qblinks.name == #"Qblinks"#)
        #expect(CompanyIdentifier.qblinks.description == #"Qblinks"#)
    
        // MYSPHERA
        #expect(CompanyIdentifier.mysphera.rawValue == 364)
        #expect(CompanyIdentifier.mysphera.name == #"MYSPHERA"#)
        #expect(CompanyIdentifier.mysphera.description == #"MYSPHERA"#)
    
        // LifeScan Inc
        #expect(CompanyIdentifier.lifescan.rawValue == 365)
        #expect(CompanyIdentifier.lifescan.name == #"LifeScan Inc"#)
        #expect(CompanyIdentifier.lifescan.description == #"LifeScan Inc"#)
    
        // Volantic AB
        #expect(CompanyIdentifier.volantic.rawValue == 366)
        #expect(CompanyIdentifier.volantic.name == #"Volantic AB"#)
        #expect(CompanyIdentifier.volantic.description == #"Volantic AB"#)
    
        // Podo Labs, Inc
        #expect(CompanyIdentifier.podoLabs.rawValue == 367)
        #expect(CompanyIdentifier.podoLabs.name == #"Podo Labs, Inc"#)
        #expect(CompanyIdentifier.podoLabs.description == #"Podo Labs, Inc"#)
    
        // Roche Diabetes Care AG
        #expect(CompanyIdentifier.rocheDiabetesCare.rawValue == 368)
        #expect(CompanyIdentifier.rocheDiabetesCare.name == #"Roche Diabetes Care AG"#)
        #expect(CompanyIdentifier.rocheDiabetesCare.description == #"Roche Diabetes Care AG"#)
    
        // Amazon.com Services LLC
        #expect(CompanyIdentifier.amazonComServices.rawValue == 369)
        #expect(CompanyIdentifier.amazonComServices.name == #"Amazon.com Services LLC"#)
        #expect(CompanyIdentifier.amazonComServices.description == #"Amazon.com Services LLC"#)
    
        // Connovate Technology Private Limited
        #expect(CompanyIdentifier.connovateTechnology.rawValue == 370)
        #expect(CompanyIdentifier.connovateTechnology.name == #"Connovate Technology Private Limited"#)
        #expect(CompanyIdentifier.connovateTechnology.description == #"Connovate Technology Private Limited"#)
    
        // Kocomojo, LLC
        #expect(CompanyIdentifier.kocomojo.rawValue == 371)
        #expect(CompanyIdentifier.kocomojo.name == #"Kocomojo, LLC"#)
        #expect(CompanyIdentifier.kocomojo.description == #"Kocomojo, LLC"#)
    
        // Everykey Inc.
        #expect(CompanyIdentifier.everykey.rawValue == 372)
        #expect(CompanyIdentifier.everykey.name == #"Everykey Inc."#)
        #expect(CompanyIdentifier.everykey.description == #"Everykey Inc."#)
    
        // Dynamic Controls
        #expect(CompanyIdentifier.dynamicControls.rawValue == 373)
        #expect(CompanyIdentifier.dynamicControls.name == #"Dynamic Controls"#)
        #expect(CompanyIdentifier.dynamicControls.description == #"Dynamic Controls"#)
    
        // SentriLock
        #expect(CompanyIdentifier.sentrilock.rawValue == 374)
        #expect(CompanyIdentifier.sentrilock.name == #"SentriLock"#)
        #expect(CompanyIdentifier.sentrilock.description == #"SentriLock"#)
    
        // I-SYST inc.
        #expect(CompanyIdentifier.iSyst.rawValue == 375)
        #expect(CompanyIdentifier.iSyst.name == #"I-SYST inc."#)
        #expect(CompanyIdentifier.iSyst.description == #"I-SYST inc."#)
    
        // CASIO COMPUTER CO., LTD.
        #expect(CompanyIdentifier.casioComputer.rawValue == 376)
        #expect(CompanyIdentifier.casioComputer.name == #"CASIO COMPUTER CO., LTD."#)
        #expect(CompanyIdentifier.casioComputer.description == #"CASIO COMPUTER CO., LTD."#)
    
        // LAPIS Semiconductor Co.,Ltd
        #expect(CompanyIdentifier.lapisSemiconductor.rawValue == 377)
        #expect(CompanyIdentifier.lapisSemiconductor.name == #"LAPIS Semiconductor Co.,Ltd"#)
        #expect(CompanyIdentifier.lapisSemiconductor.description == #"LAPIS Semiconductor Co.,Ltd"#)
    
        // Telemonitor, Inc.
        #expect(CompanyIdentifier.telemonitor.rawValue == 378)
        #expect(CompanyIdentifier.telemonitor.name == #"Telemonitor, Inc."#)
        #expect(CompanyIdentifier.telemonitor.description == #"Telemonitor, Inc."#)
    
        // taskit GmbH
        #expect(CompanyIdentifier.taskit.rawValue == 379)
        #expect(CompanyIdentifier.taskit.name == #"taskit GmbH"#)
        #expect(CompanyIdentifier.taskit.description == #"taskit GmbH"#)
    
        // Mercedes-Benz Group AG
        #expect(CompanyIdentifier.mercedesBenzGroup.rawValue == 380)
        #expect(CompanyIdentifier.mercedesBenzGroup.name == #"Mercedes-Benz Group AG"#)
        #expect(CompanyIdentifier.mercedesBenzGroup.description == #"Mercedes-Benz Group AG"#)
    
        // BatAndCat
        #expect(CompanyIdentifier.batandcat.rawValue == 381)
        #expect(CompanyIdentifier.batandcat.name == #"BatAndCat"#)
        #expect(CompanyIdentifier.batandcat.description == #"BatAndCat"#)
    
        // BluDotz Ltd
        #expect(CompanyIdentifier.bludotz.rawValue == 382)
        #expect(CompanyIdentifier.bludotz.name == #"BluDotz Ltd"#)
        #expect(CompanyIdentifier.bludotz.description == #"BluDotz Ltd"#)
    
        // XTel Wireless ApS
        #expect(CompanyIdentifier.xtelWireless.rawValue == 383)
        #expect(CompanyIdentifier.xtelWireless.name == #"XTel Wireless ApS"#)
        #expect(CompanyIdentifier.xtelWireless.description == #"XTel Wireless ApS"#)
    
        // Gigaset Technologies GmbH
        #expect(CompanyIdentifier.gigasetTechnologies.rawValue == 384)
        #expect(CompanyIdentifier.gigasetTechnologies.name == #"Gigaset Technologies GmbH"#)
        #expect(CompanyIdentifier.gigasetTechnologies.description == #"Gigaset Technologies GmbH"#)
    
        // Gecko Health Innovations, Inc.
        #expect(CompanyIdentifier.geckoHealthInnovations.rawValue == 385)
        #expect(CompanyIdentifier.geckoHealthInnovations.name == #"Gecko Health Innovations, Inc."#)
        #expect(CompanyIdentifier.geckoHealthInnovations.description == #"Gecko Health Innovations, Inc."#)
    
        // HOP Ubiquitous
        #expect(CompanyIdentifier.hopUbiquitous.rawValue == 386)
        #expect(CompanyIdentifier.hopUbiquitous.name == #"HOP Ubiquitous"#)
        #expect(CompanyIdentifier.hopUbiquitous.description == #"HOP Ubiquitous"#)
    
        // Walt Disney
        #expect(CompanyIdentifier.waltDisney.rawValue == 387)
        #expect(CompanyIdentifier.waltDisney.name == #"Walt Disney"#)
        #expect(CompanyIdentifier.waltDisney.description == #"Walt Disney"#)
    
        // Nectar
        #expect(CompanyIdentifier.nectar.rawValue == 388)
        #expect(CompanyIdentifier.nectar.name == #"Nectar"#)
        #expect(CompanyIdentifier.nectar.description == #"Nectar"#)
    
        // bel'apps LLC
        #expect(CompanyIdentifier.belApps.rawValue == 389)
        #expect(CompanyIdentifier.belApps.name == #"bel'apps LLC"#)
        #expect(CompanyIdentifier.belApps.description == #"bel'apps LLC"#)
    
        // CORE Lighting Ltd
        #expect(CompanyIdentifier.coreLighting.rawValue == 390)
        #expect(CompanyIdentifier.coreLighting.name == #"CORE Lighting Ltd"#)
        #expect(CompanyIdentifier.coreLighting.description == #"CORE Lighting Ltd"#)
    
        // Seraphim Sense Ltd
        #expect(CompanyIdentifier.seraphimSense.rawValue == 391)
        #expect(CompanyIdentifier.seraphimSense.name == #"Seraphim Sense Ltd"#)
        #expect(CompanyIdentifier.seraphimSense.description == #"Seraphim Sense Ltd"#)
    
        // Unico RBC
        #expect(CompanyIdentifier.unicoRbc.rawValue == 392)
        #expect(CompanyIdentifier.unicoRbc.name == #"Unico RBC"#)
        #expect(CompanyIdentifier.unicoRbc.description == #"Unico RBC"#)
    
        // Physical Enterprises Inc.
        #expect(CompanyIdentifier.physicalEnterprises.rawValue == 393)
        #expect(CompanyIdentifier.physicalEnterprises.name == #"Physical Enterprises Inc."#)
        #expect(CompanyIdentifier.physicalEnterprises.description == #"Physical Enterprises Inc."#)
    
        // Able Trend Technology Limited
        #expect(CompanyIdentifier.ableTrendTechnology.rawValue == 394)
        #expect(CompanyIdentifier.ableTrendTechnology.name == #"Able Trend Technology Limited"#)
        #expect(CompanyIdentifier.ableTrendTechnology.description == #"Able Trend Technology Limited"#)
    
        // Konica Minolta, Inc.
        #expect(CompanyIdentifier.konicaMinolta.rawValue == 395)
        #expect(CompanyIdentifier.konicaMinolta.name == #"Konica Minolta, Inc."#)
        #expect(CompanyIdentifier.konicaMinolta.description == #"Konica Minolta, Inc."#)
    
        // Wilo SE
        #expect(CompanyIdentifier.wilo.rawValue == 396)
        #expect(CompanyIdentifier.wilo.name == #"Wilo SE"#)
        #expect(CompanyIdentifier.wilo.description == #"Wilo SE"#)
    
        // Extron Design Services
        #expect(CompanyIdentifier.extronDesignServices.rawValue == 397)
        #expect(CompanyIdentifier.extronDesignServices.name == #"Extron Design Services"#)
        #expect(CompanyIdentifier.extronDesignServices.description == #"Extron Design Services"#)
    
        // Google LLC
        #expect(CompanyIdentifier.google2.rawValue == 398)
        #expect(CompanyIdentifier.google2.name == #"Google LLC"#)
        #expect(CompanyIdentifier.google2.description == #"Google LLC"#)
    
        // Fireflies Systems
        #expect(CompanyIdentifier.firefliesSystems.rawValue == 399)
        #expect(CompanyIdentifier.firefliesSystems.name == #"Fireflies Systems"#)
        #expect(CompanyIdentifier.firefliesSystems.description == #"Fireflies Systems"#)
    
        // Intelletto Technologies Inc.
        #expect(CompanyIdentifier.intellettoTechnologies.rawValue == 400)
        #expect(CompanyIdentifier.intellettoTechnologies.name == #"Intelletto Technologies Inc."#)
        #expect(CompanyIdentifier.intellettoTechnologies.description == #"Intelletto Technologies Inc."#)
    
        // FDK CORPORATION
        #expect(CompanyIdentifier.fdk.rawValue == 401)
        #expect(CompanyIdentifier.fdk.name == #"FDK CORPORATION"#)
        #expect(CompanyIdentifier.fdk.description == #"FDK CORPORATION"#)
    
        // Cloudleaf, Inc
        #expect(CompanyIdentifier.cloudleaf.rawValue == 402)
        #expect(CompanyIdentifier.cloudleaf.name == #"Cloudleaf, Inc"#)
        #expect(CompanyIdentifier.cloudleaf.description == #"Cloudleaf, Inc"#)
    
        // Maveric Automation LLC
        #expect(CompanyIdentifier.mavericAutomation.rawValue == 403)
        #expect(CompanyIdentifier.mavericAutomation.name == #"Maveric Automation LLC"#)
        #expect(CompanyIdentifier.mavericAutomation.description == #"Maveric Automation LLC"#)
    
        // Acoustic Stream Corporation
        #expect(CompanyIdentifier.acousticStream.rawValue == 404)
        #expect(CompanyIdentifier.acousticStream.name == #"Acoustic Stream Corporation"#)
        #expect(CompanyIdentifier.acousticStream.description == #"Acoustic Stream Corporation"#)
    
        // Zuli
        #expect(CompanyIdentifier.zuli.rawValue == 405)
        #expect(CompanyIdentifier.zuli.name == #"Zuli"#)
        #expect(CompanyIdentifier.zuli.description == #"Zuli"#)
    
        // Paxton Access Ltd
        #expect(CompanyIdentifier.paxtonAccess.rawValue == 406)
        #expect(CompanyIdentifier.paxtonAccess.name == #"Paxton Access Ltd"#)
        #expect(CompanyIdentifier.paxtonAccess.description == #"Paxton Access Ltd"#)
    
        // WiSilica Inc.
        #expect(CompanyIdentifier.wisilica.rawValue == 407)
        #expect(CompanyIdentifier.wisilica.name == #"WiSilica Inc."#)
        #expect(CompanyIdentifier.wisilica.description == #"WiSilica Inc."#)
    
        // VENGIT Korlatolt Felelossegu Tarsasag
        #expect(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.rawValue == 408)
        #expect(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.name == #"VENGIT Korlatolt Felelossegu Tarsasag"#)
        #expect(CompanyIdentifier.vengitKorlatoltFelelosseguTarsasag.description == #"VENGIT Korlatolt Felelossegu Tarsasag"#)
    
        // SALTO SYSTEMS S.L.
        #expect(CompanyIdentifier.saltoSystems.rawValue == 409)
        #expect(CompanyIdentifier.saltoSystems.name == #"SALTO SYSTEMS S.L."#)
        #expect(CompanyIdentifier.saltoSystems.description == #"SALTO SYSTEMS S.L."#)
    
        // TRON Forum
        #expect(CompanyIdentifier.tronForum.rawValue == 410)
        #expect(CompanyIdentifier.tronForum.name == #"TRON Forum"#)
        #expect(CompanyIdentifier.tronForum.description == #"TRON Forum"#)
    
        // CUBETECH s.r.o.
        #expect(CompanyIdentifier.cubetech.rawValue == 411)
        #expect(CompanyIdentifier.cubetech.name == #"CUBETECH s.r.o."#)
        #expect(CompanyIdentifier.cubetech.description == #"CUBETECH s.r.o."#)
    
        // Cokiya Incorporated
        #expect(CompanyIdentifier.cokiya.rawValue == 412)
        #expect(CompanyIdentifier.cokiya.name == #"Cokiya Incorporated"#)
        #expect(CompanyIdentifier.cokiya.description == #"Cokiya Incorporated"#)
    
        // CVS Health
        #expect(CompanyIdentifier.cvsHealth.rawValue == 413)
        #expect(CompanyIdentifier.cvsHealth.name == #"CVS Health"#)
        #expect(CompanyIdentifier.cvsHealth.description == #"CVS Health"#)
    
        // Ceruus
        #expect(CompanyIdentifier.ceruus.rawValue == 414)
        #expect(CompanyIdentifier.ceruus.name == #"Ceruus"#)
        #expect(CompanyIdentifier.ceruus.description == #"Ceruus"#)
    
        // Strainstall Ltd
        #expect(CompanyIdentifier.strainstall.rawValue == 415)
        #expect(CompanyIdentifier.strainstall.name == #"Strainstall Ltd"#)
        #expect(CompanyIdentifier.strainstall.description == #"Strainstall Ltd"#)
    
        // Channel Enterprises (HK) Ltd.
        #expect(CompanyIdentifier.channelEnterprises.rawValue == 416)
        #expect(CompanyIdentifier.channelEnterprises.name == #"Channel Enterprises (HK) Ltd."#)
        #expect(CompanyIdentifier.channelEnterprises.description == #"Channel Enterprises (HK) Ltd."#)
    
        // FIAMM
        #expect(CompanyIdentifier.fiamm.rawValue == 417)
        #expect(CompanyIdentifier.fiamm.name == #"FIAMM"#)
        #expect(CompanyIdentifier.fiamm.description == #"FIAMM"#)
    
        // GIGALANE.CO.,LTD
        #expect(CompanyIdentifier.gigalane.rawValue == 418)
        #expect(CompanyIdentifier.gigalane.name == #"GIGALANE.CO.,LTD"#)
        #expect(CompanyIdentifier.gigalane.description == #"GIGALANE.CO.,LTD"#)
    
        // EROAD
        #expect(CompanyIdentifier.eroad.rawValue == 419)
        #expect(CompanyIdentifier.eroad.name == #"EROAD"#)
        #expect(CompanyIdentifier.eroad.description == #"EROAD"#)
    
        // MSA Innovation, LLC
        #expect(CompanyIdentifier.msaInnovation.rawValue == 420)
        #expect(CompanyIdentifier.msaInnovation.name == #"MSA Innovation, LLC"#)
        #expect(CompanyIdentifier.msaInnovation.description == #"MSA Innovation, LLC"#)
    
        // Icon Health and Fitness
        #expect(CompanyIdentifier.iconHealthAndFitness.rawValue == 421)
        #expect(CompanyIdentifier.iconHealthAndFitness.name == #"Icon Health and Fitness"#)
        #expect(CompanyIdentifier.iconHealthAndFitness.description == #"Icon Health and Fitness"#)
    
        // Wille Engineering
        #expect(CompanyIdentifier.willeEngineering.rawValue == 422)
        #expect(CompanyIdentifier.willeEngineering.name == #"Wille Engineering"#)
        #expect(CompanyIdentifier.willeEngineering.description == #"Wille Engineering"#)
    
        // ENERGOUS CORPORATION
        #expect(CompanyIdentifier.energous.rawValue == 423)
        #expect(CompanyIdentifier.energous.name == #"ENERGOUS CORPORATION"#)
        #expect(CompanyIdentifier.energous.description == #"ENERGOUS CORPORATION"#)
    
        // Taobao
        #expect(CompanyIdentifier.taobao.rawValue == 424)
        #expect(CompanyIdentifier.taobao.name == #"Taobao"#)
        #expect(CompanyIdentifier.taobao.description == #"Taobao"#)
    
        // Canon Inc.
        #expect(CompanyIdentifier.canon.rawValue == 425)
        #expect(CompanyIdentifier.canon.name == #"Canon Inc."#)
        #expect(CompanyIdentifier.canon.description == #"Canon Inc."#)
    
        // Geophysical Technology Inc.
        #expect(CompanyIdentifier.geophysicalTechnology.rawValue == 426)
        #expect(CompanyIdentifier.geophysicalTechnology.name == #"Geophysical Technology Inc."#)
        #expect(CompanyIdentifier.geophysicalTechnology.description == #"Geophysical Technology Inc."#)
    
        // Meta Platforms, Inc.
        #expect(CompanyIdentifier.metaPlatforms.rawValue == 427)
        #expect(CompanyIdentifier.metaPlatforms.name == #"Meta Platforms, Inc."#)
        #expect(CompanyIdentifier.metaPlatforms.description == #"Meta Platforms, Inc."#)
    
        // Trividia Health, Inc.
        #expect(CompanyIdentifier.trividiaHealth.rawValue == 428)
        #expect(CompanyIdentifier.trividiaHealth.name == #"Trividia Health, Inc."#)
        #expect(CompanyIdentifier.trividiaHealth.description == #"Trividia Health, Inc."#)
    
        // FlightSafety International
        #expect(CompanyIdentifier.flightsafetyInternational.rawValue == 429)
        #expect(CompanyIdentifier.flightsafetyInternational.name == #"FlightSafety International"#)
        #expect(CompanyIdentifier.flightsafetyInternational.description == #"FlightSafety International"#)
    
        // Earlens Corporation
        #expect(CompanyIdentifier.earlens.rawValue == 430)
        #expect(CompanyIdentifier.earlens.name == #"Earlens Corporation"#)
        #expect(CompanyIdentifier.earlens.description == #"Earlens Corporation"#)
    
        // Sunrise Micro Devices, Inc.
        #expect(CompanyIdentifier.sunriseMicroDevices.rawValue == 431)
        #expect(CompanyIdentifier.sunriseMicroDevices.name == #"Sunrise Micro Devices, Inc."#)
        #expect(CompanyIdentifier.sunriseMicroDevices.description == #"Sunrise Micro Devices, Inc."#)
    
        // Star Micronics Co., Ltd.
        #expect(CompanyIdentifier.starMicronics.rawValue == 432)
        #expect(CompanyIdentifier.starMicronics.name == #"Star Micronics Co., Ltd."#)
        #expect(CompanyIdentifier.starMicronics.description == #"Star Micronics Co., Ltd."#)
    
        // Netizens Sp. z o.o.
        #expect(CompanyIdentifier.netizens.rawValue == 433)
        #expect(CompanyIdentifier.netizens.name == #"Netizens Sp. z o.o."#)
        #expect(CompanyIdentifier.netizens.description == #"Netizens Sp. z o.o."#)
    
        // Nymi Inc.
        #expect(CompanyIdentifier.nymi.rawValue == 434)
        #expect(CompanyIdentifier.nymi.name == #"Nymi Inc."#)
        #expect(CompanyIdentifier.nymi.description == #"Nymi Inc."#)
    
        // Nytec, Inc.
        #expect(CompanyIdentifier.nytec.rawValue == 435)
        #expect(CompanyIdentifier.nytec.name == #"Nytec, Inc."#)
        #expect(CompanyIdentifier.nytec.description == #"Nytec, Inc."#)
    
        // Trineo Sp. z o.o.
        #expect(CompanyIdentifier.trineo.rawValue == 436)
        #expect(CompanyIdentifier.trineo.name == #"Trineo Sp. z o.o."#)
        #expect(CompanyIdentifier.trineo.description == #"Trineo Sp. z o.o."#)
    
        // Nest Labs Inc.
        #expect(CompanyIdentifier.nestLabs.rawValue == 437)
        #expect(CompanyIdentifier.nestLabs.name == #"Nest Labs Inc."#)
        #expect(CompanyIdentifier.nestLabs.description == #"Nest Labs Inc."#)
    
        // LM Technologies Ltd
        #expect(CompanyIdentifier.lmTechnologies.rawValue == 438)
        #expect(CompanyIdentifier.lmTechnologies.name == #"LM Technologies Ltd"#)
        #expect(CompanyIdentifier.lmTechnologies.description == #"LM Technologies Ltd"#)
    
        // General Electric Company
        #expect(CompanyIdentifier.generalElectric.rawValue == 439)
        #expect(CompanyIdentifier.generalElectric.name == #"General Electric Company"#)
        #expect(CompanyIdentifier.generalElectric.description == #"General Electric Company"#)
    
        // i+D3 S.L.
        #expect(CompanyIdentifier.iD3.rawValue == 440)
        #expect(CompanyIdentifier.iD3.name == #"i+D3 S.L."#)
        #expect(CompanyIdentifier.iD3.description == #"i+D3 S.L."#)
    
        // HANA Micron
        #expect(CompanyIdentifier.hanaMicron.rawValue == 441)
        #expect(CompanyIdentifier.hanaMicron.name == #"HANA Micron"#)
        #expect(CompanyIdentifier.hanaMicron.description == #"HANA Micron"#)
    
        // Stages Cycling LLC
        #expect(CompanyIdentifier.stagesCycling.rawValue == 442)
        #expect(CompanyIdentifier.stagesCycling.name == #"Stages Cycling LLC"#)
        #expect(CompanyIdentifier.stagesCycling.description == #"Stages Cycling LLC"#)
    
        // Cochlear Bone Anchored Solutions AB
        #expect(CompanyIdentifier.cochlearBoneAnchoredSolutions.rawValue == 443)
        #expect(CompanyIdentifier.cochlearBoneAnchoredSolutions.name == #"Cochlear Bone Anchored Solutions AB"#)
        #expect(CompanyIdentifier.cochlearBoneAnchoredSolutions.description == #"Cochlear Bone Anchored Solutions AB"#)
    
        // SenionLab AB
        #expect(CompanyIdentifier.senionlab.rawValue == 444)
        #expect(CompanyIdentifier.senionlab.name == #"SenionLab AB"#)
        #expect(CompanyIdentifier.senionlab.description == #"SenionLab AB"#)
    
        // Syszone Co., Ltd
        #expect(CompanyIdentifier.syszone.rawValue == 445)
        #expect(CompanyIdentifier.syszone.name == #"Syszone Co., Ltd"#)
        #expect(CompanyIdentifier.syszone.description == #"Syszone Co., Ltd"#)
    
        // Pulsate Mobile Ltd.
        #expect(CompanyIdentifier.pulsateMobile.rawValue == 446)
        #expect(CompanyIdentifier.pulsateMobile.name == #"Pulsate Mobile Ltd."#)
        #expect(CompanyIdentifier.pulsateMobile.description == #"Pulsate Mobile Ltd."#)
    
        // Hongkong OnMicro Electronics Limited
        #expect(CompanyIdentifier.hongkongOnmicroElectronics.rawValue == 447)
        #expect(CompanyIdentifier.hongkongOnmicroElectronics.name == #"Hongkong OnMicro Electronics Limited"#)
        #expect(CompanyIdentifier.hongkongOnmicroElectronics.description == #"Hongkong OnMicro Electronics Limited"#)
    
        // pironex GmbH
        #expect(CompanyIdentifier.pironex.rawValue == 448)
        #expect(CompanyIdentifier.pironex.name == #"pironex GmbH"#)
        #expect(CompanyIdentifier.pironex.description == #"pironex GmbH"#)
    
        // BRADATECH Corp.
        #expect(CompanyIdentifier.bradatech.rawValue == 449)
        #expect(CompanyIdentifier.bradatech.name == #"BRADATECH Corp."#)
        #expect(CompanyIdentifier.bradatech.description == #"BRADATECH Corp."#)
    
        // Transenergooil AG
        #expect(CompanyIdentifier.transenergooil.rawValue == 450)
        #expect(CompanyIdentifier.transenergooil.name == #"Transenergooil AG"#)
        #expect(CompanyIdentifier.transenergooil.description == #"Transenergooil AG"#)
    
        // Bunch
        #expect(CompanyIdentifier.bunch.rawValue == 451)
        #expect(CompanyIdentifier.bunch.name == #"Bunch"#)
        #expect(CompanyIdentifier.bunch.description == #"Bunch"#)
    
        // DME Microelectronics
        #expect(CompanyIdentifier.dmeMicroelectronics.rawValue == 452)
        #expect(CompanyIdentifier.dmeMicroelectronics.name == #"DME Microelectronics"#)
        #expect(CompanyIdentifier.dmeMicroelectronics.description == #"DME Microelectronics"#)
    
        // Bitcraze AB
        #expect(CompanyIdentifier.bitcraze.rawValue == 453)
        #expect(CompanyIdentifier.bitcraze.name == #"Bitcraze AB"#)
        #expect(CompanyIdentifier.bitcraze.description == #"Bitcraze AB"#)
    
        // HASWARE Inc.
        #expect(CompanyIdentifier.hasware.rawValue == 454)
        #expect(CompanyIdentifier.hasware.name == #"HASWARE Inc."#)
        #expect(CompanyIdentifier.hasware.description == #"HASWARE Inc."#)
    
        // Abiogenix Inc.
        #expect(CompanyIdentifier.abiogenix.rawValue == 455)
        #expect(CompanyIdentifier.abiogenix.name == #"Abiogenix Inc."#)
        #expect(CompanyIdentifier.abiogenix.description == #"Abiogenix Inc."#)
    
        // Poly-Control ApS
        #expect(CompanyIdentifier.polyControl.rawValue == 456)
        #expect(CompanyIdentifier.polyControl.name == #"Poly-Control ApS"#)
        #expect(CompanyIdentifier.polyControl.description == #"Poly-Control ApS"#)
    
        // Avi-on
        #expect(CompanyIdentifier.aviOn.rawValue == 457)
        #expect(CompanyIdentifier.aviOn.name == #"Avi-on"#)
        #expect(CompanyIdentifier.aviOn.description == #"Avi-on"#)
    
        // Laerdal Medical AS
        #expect(CompanyIdentifier.laerdalMedical.rawValue == 458)
        #expect(CompanyIdentifier.laerdalMedical.name == #"Laerdal Medical AS"#)
        #expect(CompanyIdentifier.laerdalMedical.description == #"Laerdal Medical AS"#)
    
        // Fetch My Pet
        #expect(CompanyIdentifier.fetchMyPet.rawValue == 459)
        #expect(CompanyIdentifier.fetchMyPet.name == #"Fetch My Pet"#)
        #expect(CompanyIdentifier.fetchMyPet.description == #"Fetch My Pet"#)
    
        // Sam Labs Ltd.
        #expect(CompanyIdentifier.samLabs.rawValue == 460)
        #expect(CompanyIdentifier.samLabs.name == #"Sam Labs Ltd."#)
        #expect(CompanyIdentifier.samLabs.description == #"Sam Labs Ltd."#)
    
        // Chengdu Synwing Technology Ltd
        #expect(CompanyIdentifier.chengduSynwingTechnology.rawValue == 461)
        #expect(CompanyIdentifier.chengduSynwingTechnology.name == #"Chengdu Synwing Technology Ltd"#)
        #expect(CompanyIdentifier.chengduSynwingTechnology.description == #"Chengdu Synwing Technology Ltd"#)
    
        // HOUWA SYSTEM DESIGN, k.k.
        #expect(CompanyIdentifier.houwaSystemDesignKK.rawValue == 462)
        #expect(CompanyIdentifier.houwaSystemDesignKK.name == #"HOUWA SYSTEM DESIGN, k.k."#)
        #expect(CompanyIdentifier.houwaSystemDesignKK.description == #"HOUWA SYSTEM DESIGN, k.k."#)
    
        // BSH
        #expect(CompanyIdentifier.bsh.rawValue == 463)
        #expect(CompanyIdentifier.bsh.name == #"BSH"#)
        #expect(CompanyIdentifier.bsh.description == #"BSH"#)
    
        // Primus Inter Pares Ltd
        #expect(CompanyIdentifier.primusInterPares.rawValue == 464)
        #expect(CompanyIdentifier.primusInterPares.name == #"Primus Inter Pares Ltd"#)
        #expect(CompanyIdentifier.primusInterPares.description == #"Primus Inter Pares Ltd"#)
    
        // August Home, Inc
        #expect(CompanyIdentifier.augustHome.rawValue == 465)
        #expect(CompanyIdentifier.augustHome.name == #"August Home, Inc"#)
        #expect(CompanyIdentifier.augustHome.description == #"August Home, Inc"#)
    
        // Gill Electronics
        #expect(CompanyIdentifier.gillElectronics.rawValue == 466)
        #expect(CompanyIdentifier.gillElectronics.name == #"Gill Electronics"#)
        #expect(CompanyIdentifier.gillElectronics.description == #"Gill Electronics"#)
    
        // Sky Wave Design
        #expect(CompanyIdentifier.skyWaveDesign.rawValue == 467)
        #expect(CompanyIdentifier.skyWaveDesign.name == #"Sky Wave Design"#)
        #expect(CompanyIdentifier.skyWaveDesign.description == #"Sky Wave Design"#)
    
        // Newlab S.r.l.
        #expect(CompanyIdentifier.newlab.rawValue == 468)
        #expect(CompanyIdentifier.newlab.name == #"Newlab S.r.l."#)
        #expect(CompanyIdentifier.newlab.description == #"Newlab S.r.l."#)
    
        // ELAD srl
        #expect(CompanyIdentifier.elad.rawValue == 469)
        #expect(CompanyIdentifier.elad.name == #"ELAD srl"#)
        #expect(CompanyIdentifier.elad.description == #"ELAD srl"#)
    
        // G-wearables inc.
        #expect(CompanyIdentifier.gWearables.rawValue == 470)
        #expect(CompanyIdentifier.gWearables.name == #"G-wearables inc."#)
        #expect(CompanyIdentifier.gWearables.description == #"G-wearables inc."#)
    
        // Squadrone Systems Inc.
        #expect(CompanyIdentifier.squadroneSystems.rawValue == 471)
        #expect(CompanyIdentifier.squadroneSystems.name == #"Squadrone Systems Inc."#)
        #expect(CompanyIdentifier.squadroneSystems.description == #"Squadrone Systems Inc."#)
    
        // Code Corporation
        #expect(CompanyIdentifier.code.rawValue == 472)
        #expect(CompanyIdentifier.code.name == #"Code Corporation"#)
        #expect(CompanyIdentifier.code.description == #"Code Corporation"#)
    
        // Savant Systems LLC
        #expect(CompanyIdentifier.savantSystems.rawValue == 473)
        #expect(CompanyIdentifier.savantSystems.name == #"Savant Systems LLC"#)
        #expect(CompanyIdentifier.savantSystems.description == #"Savant Systems LLC"#)
    
        // Logitech International SA
        #expect(CompanyIdentifier.logitechInternational.rawValue == 474)
        #expect(CompanyIdentifier.logitechInternational.name == #"Logitech International SA"#)
        #expect(CompanyIdentifier.logitechInternational.description == #"Logitech International SA"#)
    
        // Innblue Consulting
        #expect(CompanyIdentifier.innblueConsulting.rawValue == 475)
        #expect(CompanyIdentifier.innblueConsulting.name == #"Innblue Consulting"#)
        #expect(CompanyIdentifier.innblueConsulting.description == #"Innblue Consulting"#)
    
        // iParking Ltd.
        #expect(CompanyIdentifier.iparking.rawValue == 476)
        #expect(CompanyIdentifier.iparking.name == #"iParking Ltd."#)
        #expect(CompanyIdentifier.iparking.description == #"iParking Ltd."#)
    
        // Koninklijke Philips N.V.
        #expect(CompanyIdentifier.koninklijkePhilips.rawValue == 477)
        #expect(CompanyIdentifier.koninklijkePhilips.name == #"Koninklijke Philips N.V."#)
        #expect(CompanyIdentifier.koninklijkePhilips.description == #"Koninklijke Philips N.V."#)
    
        // Minelab Electronics Pty Limited
        #expect(CompanyIdentifier.minelabElectronics.rawValue == 478)
        #expect(CompanyIdentifier.minelabElectronics.name == #"Minelab Electronics Pty Limited"#)
        #expect(CompanyIdentifier.minelabElectronics.description == #"Minelab Electronics Pty Limited"#)
    
        // Bison Group Ltd.
        #expect(CompanyIdentifier.bisonGroup.rawValue == 479)
        #expect(CompanyIdentifier.bisonGroup.name == #"Bison Group Ltd."#)
        #expect(CompanyIdentifier.bisonGroup.description == #"Bison Group Ltd."#)
    
        // Widex A/S
        #expect(CompanyIdentifier.widex.rawValue == 480)
        #expect(CompanyIdentifier.widex.name == #"Widex A/S"#)
        #expect(CompanyIdentifier.widex.description == #"Widex A/S"#)
    
        // Jolla Ltd
        #expect(CompanyIdentifier.jolla.rawValue == 481)
        #expect(CompanyIdentifier.jolla.name == #"Jolla Ltd"#)
        #expect(CompanyIdentifier.jolla.description == #"Jolla Ltd"#)
    
        // Lectronix, Inc.
        #expect(CompanyIdentifier.lectronix.rawValue == 482)
        #expect(CompanyIdentifier.lectronix.name == #"Lectronix, Inc."#)
        #expect(CompanyIdentifier.lectronix.description == #"Lectronix, Inc."#)
    
        // Caterpillar Inc
        #expect(CompanyIdentifier.caterpillar.rawValue == 483)
        #expect(CompanyIdentifier.caterpillar.name == #"Caterpillar Inc"#)
        #expect(CompanyIdentifier.caterpillar.description == #"Caterpillar Inc"#)
    
        // Freedom Innovations
        #expect(CompanyIdentifier.freedomInnovations.rawValue == 484)
        #expect(CompanyIdentifier.freedomInnovations.name == #"Freedom Innovations"#)
        #expect(CompanyIdentifier.freedomInnovations.description == #"Freedom Innovations"#)
    
        // Dynamic Devices Ltd
        #expect(CompanyIdentifier.dynamicDevices.rawValue == 485)
        #expect(CompanyIdentifier.dynamicDevices.name == #"Dynamic Devices Ltd"#)
        #expect(CompanyIdentifier.dynamicDevices.description == #"Dynamic Devices Ltd"#)
    
        // Technology Solutions (UK) Ltd
        #expect(CompanyIdentifier.technologySolutionsUk.rawValue == 486)
        #expect(CompanyIdentifier.technologySolutionsUk.name == #"Technology Solutions (UK) Ltd"#)
        #expect(CompanyIdentifier.technologySolutionsUk.description == #"Technology Solutions (UK) Ltd"#)
    
        // IPS Group Inc.
        #expect(CompanyIdentifier.ipsGroup.rawValue == 487)
        #expect(CompanyIdentifier.ipsGroup.name == #"IPS Group Inc."#)
        #expect(CompanyIdentifier.ipsGroup.description == #"IPS Group Inc."#)
    
        // STIR
        #expect(CompanyIdentifier.stir.rawValue == 488)
        #expect(CompanyIdentifier.stir.name == #"STIR"#)
        #expect(CompanyIdentifier.stir.description == #"STIR"#)
    
        // Sano, Inc.
        #expect(CompanyIdentifier.sano.rawValue == 489)
        #expect(CompanyIdentifier.sano.name == #"Sano, Inc."#)
        #expect(CompanyIdentifier.sano.description == #"Sano, Inc."#)
    
        // Advanced Application Design, Inc.
        #expect(CompanyIdentifier.advancedApplicationDesign.rawValue == 490)
        #expect(CompanyIdentifier.advancedApplicationDesign.name == #"Advanced Application Design, Inc."#)
        #expect(CompanyIdentifier.advancedApplicationDesign.description == #"Advanced Application Design, Inc."#)
    
        // AutoMap LLC
        #expect(CompanyIdentifier.automap.rawValue == 491)
        #expect(CompanyIdentifier.automap.name == #"AutoMap LLC"#)
        #expect(CompanyIdentifier.automap.description == #"AutoMap LLC"#)
    
        // Spreadtrum Communications Shanghai Ltd
        #expect(CompanyIdentifier.spreadtrumCommunicationsShanghai.rawValue == 492)
        #expect(CompanyIdentifier.spreadtrumCommunicationsShanghai.name == #"Spreadtrum Communications Shanghai Ltd"#)
        #expect(CompanyIdentifier.spreadtrumCommunicationsShanghai.description == #"Spreadtrum Communications Shanghai Ltd"#)
    
        // CuteCircuit LTD
        #expect(CompanyIdentifier.cutecircuit.rawValue == 493)
        #expect(CompanyIdentifier.cutecircuit.name == #"CuteCircuit LTD"#)
        #expect(CompanyIdentifier.cutecircuit.description == #"CuteCircuit LTD"#)
    
        // Valeo Service
        #expect(CompanyIdentifier.valeoService.rawValue == 494)
        #expect(CompanyIdentifier.valeoService.name == #"Valeo Service"#)
        #expect(CompanyIdentifier.valeoService.description == #"Valeo Service"#)
    
        // Fullpower Technologies, Inc.
        #expect(CompanyIdentifier.fullpowerTechnologies.rawValue == 495)
        #expect(CompanyIdentifier.fullpowerTechnologies.name == #"Fullpower Technologies, Inc."#)
        #expect(CompanyIdentifier.fullpowerTechnologies.description == #"Fullpower Technologies, Inc."#)
    
        // KloudNation
        #expect(CompanyIdentifier.kloudnation.rawValue == 496)
        #expect(CompanyIdentifier.kloudnation.name == #"KloudNation"#)
        #expect(CompanyIdentifier.kloudnation.description == #"KloudNation"#)
    
        // Zebra Technologies Corporation
        #expect(CompanyIdentifier.zebraTechnologies.rawValue == 497)
        #expect(CompanyIdentifier.zebraTechnologies.name == #"Zebra Technologies Corporation"#)
        #expect(CompanyIdentifier.zebraTechnologies.description == #"Zebra Technologies Corporation"#)
    
        // Itron, Inc.
        #expect(CompanyIdentifier.itron.rawValue == 498)
        #expect(CompanyIdentifier.itron.name == #"Itron, Inc."#)
        #expect(CompanyIdentifier.itron.description == #"Itron, Inc."#)
    
        // The University of Tokyo
        #expect(CompanyIdentifier.universityOfTokyo.rawValue == 499)
        #expect(CompanyIdentifier.universityOfTokyo.name == #"The University of Tokyo"#)
        #expect(CompanyIdentifier.universityOfTokyo.description == #"The University of Tokyo"#)
    
        // UTC Fire and Security
        #expect(CompanyIdentifier.utcFireAndSecurity.rawValue == 500)
        #expect(CompanyIdentifier.utcFireAndSecurity.name == #"UTC Fire and Security"#)
        #expect(CompanyIdentifier.utcFireAndSecurity.description == #"UTC Fire and Security"#)
    
        // Cool Webthings Limited
        #expect(CompanyIdentifier.coolWebthings.rawValue == 501)
        #expect(CompanyIdentifier.coolWebthings.name == #"Cool Webthings Limited"#)
        #expect(CompanyIdentifier.coolWebthings.description == #"Cool Webthings Limited"#)
    
        // DJO Global
        #expect(CompanyIdentifier.djoGlobal.rawValue == 502)
        #expect(CompanyIdentifier.djoGlobal.name == #"DJO Global"#)
        #expect(CompanyIdentifier.djoGlobal.description == #"DJO Global"#)
    
        // Gelliner Limited
        #expect(CompanyIdentifier.gelliner.rawValue == 503)
        #expect(CompanyIdentifier.gelliner.name == #"Gelliner Limited"#)
        #expect(CompanyIdentifier.gelliner.description == #"Gelliner Limited"#)
    
        // Anyka (Guangzhou) Microelectronics Technology Co, LTD
        #expect(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.rawValue == 504)
        #expect(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.name == #"Anyka (Guangzhou) Microelectronics Technology Co, LTD"#)
        #expect(CompanyIdentifier.anykaGuangzhouMicroelectronicsTechnology.description == #"Anyka (Guangzhou) Microelectronics Technology Co, LTD"#)
    
        // Medtronic Inc.
        #expect(CompanyIdentifier.medtronic.rawValue == 505)
        #expect(CompanyIdentifier.medtronic.name == #"Medtronic Inc."#)
        #expect(CompanyIdentifier.medtronic.description == #"Medtronic Inc."#)
    
        // Gozio Inc.
        #expect(CompanyIdentifier.gozio.rawValue == 506)
        #expect(CompanyIdentifier.gozio.name == #"Gozio Inc."#)
        #expect(CompanyIdentifier.gozio.description == #"Gozio Inc."#)
    
        // Form Lifting, LLC
        #expect(CompanyIdentifier.formLifting.rawValue == 507)
        #expect(CompanyIdentifier.formLifting.name == #"Form Lifting, LLC"#)
        #expect(CompanyIdentifier.formLifting.description == #"Form Lifting, LLC"#)
    
        // Wahoo Fitness, LLC
        #expect(CompanyIdentifier.wahooFitness.rawValue == 508)
        #expect(CompanyIdentifier.wahooFitness.name == #"Wahoo Fitness, LLC"#)
        #expect(CompanyIdentifier.wahooFitness.description == #"Wahoo Fitness, LLC"#)
    
        // Kontakt Micro-Location Sp. z o.o.
        #expect(CompanyIdentifier.kontaktMicroLocation.rawValue == 509)
        #expect(CompanyIdentifier.kontaktMicroLocation.name == #"Kontakt Micro-Location Sp. z o.o."#)
        #expect(CompanyIdentifier.kontaktMicroLocation.description == #"Kontakt Micro-Location Sp. z o.o."#)
    
        // Radio Systems Corporation
        #expect(CompanyIdentifier.radioSystems.rawValue == 510)
        #expect(CompanyIdentifier.radioSystems.name == #"Radio Systems Corporation"#)
        #expect(CompanyIdentifier.radioSystems.description == #"Radio Systems Corporation"#)
    
        // Freescale Semiconductor, Inc.
        #expect(CompanyIdentifier.freescaleSemiconductor.rawValue == 511)
        #expect(CompanyIdentifier.freescaleSemiconductor.name == #"Freescale Semiconductor, Inc."#)
        #expect(CompanyIdentifier.freescaleSemiconductor.description == #"Freescale Semiconductor, Inc."#)
    
        // Verifone Systems Pte Ltd. Taiwan Branch
        #expect(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.rawValue == 512)
        #expect(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.name == #"Verifone Systems Pte Ltd. Taiwan Branch"#)
        #expect(CompanyIdentifier.verifoneSystemsPteTaiwanBranch.description == #"Verifone Systems Pte Ltd. Taiwan Branch"#)
    
        // AR Timing
        #expect(CompanyIdentifier.arTiming.rawValue == 513)
        #expect(CompanyIdentifier.arTiming.name == #"AR Timing"#)
        #expect(CompanyIdentifier.arTiming.description == #"AR Timing"#)
    
        // Rigado LLC
        #expect(CompanyIdentifier.rigado.rawValue == 514)
        #expect(CompanyIdentifier.rigado.name == #"Rigado LLC"#)
        #expect(CompanyIdentifier.rigado.description == #"Rigado LLC"#)
    
        // Kemppi Oy
        #expect(CompanyIdentifier.kemppi.rawValue == 515)
        #expect(CompanyIdentifier.kemppi.name == #"Kemppi Oy"#)
        #expect(CompanyIdentifier.kemppi.description == #"Kemppi Oy"#)
    
        // Tapcentive Inc.
        #expect(CompanyIdentifier.tapcentive.rawValue == 516)
        #expect(CompanyIdentifier.tapcentive.name == #"Tapcentive Inc."#)
        #expect(CompanyIdentifier.tapcentive.description == #"Tapcentive Inc."#)
    
        // Smartbotics Inc.
        #expect(CompanyIdentifier.smartbotics.rawValue == 517)
        #expect(CompanyIdentifier.smartbotics.name == #"Smartbotics Inc."#)
        #expect(CompanyIdentifier.smartbotics.description == #"Smartbotics Inc."#)
    
        // Otter Products, LLC
        #expect(CompanyIdentifier.otterProducts.rawValue == 518)
        #expect(CompanyIdentifier.otterProducts.name == #"Otter Products, LLC"#)
        #expect(CompanyIdentifier.otterProducts.description == #"Otter Products, LLC"#)
    
        // STEMP Inc.
        #expect(CompanyIdentifier.stemp.rawValue == 519)
        #expect(CompanyIdentifier.stemp.name == #"STEMP Inc."#)
        #expect(CompanyIdentifier.stemp.description == #"STEMP Inc."#)
    
        // LumiGeek LLC
        #expect(CompanyIdentifier.lumigeek.rawValue == 520)
        #expect(CompanyIdentifier.lumigeek.name == #"LumiGeek LLC"#)
        #expect(CompanyIdentifier.lumigeek.description == #"LumiGeek LLC"#)
    
        // InvisionHeart Inc.
        #expect(CompanyIdentifier.invisionheart.rawValue == 521)
        #expect(CompanyIdentifier.invisionheart.name == #"InvisionHeart Inc."#)
        #expect(CompanyIdentifier.invisionheart.description == #"InvisionHeart Inc."#)
    
        // Macnica Inc.
        #expect(CompanyIdentifier.macnica.rawValue == 522)
        #expect(CompanyIdentifier.macnica.name == #"Macnica Inc."#)
        #expect(CompanyIdentifier.macnica.description == #"Macnica Inc."#)
    
        // Jaguar Land Rover Limited
        #expect(CompanyIdentifier.jaguarLandRover.rawValue == 523)
        #expect(CompanyIdentifier.jaguarLandRover.name == #"Jaguar Land Rover Limited"#)
        #expect(CompanyIdentifier.jaguarLandRover.description == #"Jaguar Land Rover Limited"#)
    
        // CoroWare Technologies, Inc
        #expect(CompanyIdentifier.corowareTechnologies.rawValue == 524)
        #expect(CompanyIdentifier.corowareTechnologies.name == #"CoroWare Technologies, Inc"#)
        #expect(CompanyIdentifier.corowareTechnologies.description == #"CoroWare Technologies, Inc"#)
    
        // Simplo Technology Co., LTD
        #expect(CompanyIdentifier.simploTechnology.rawValue == 525)
        #expect(CompanyIdentifier.simploTechnology.name == #"Simplo Technology Co., LTD"#)
        #expect(CompanyIdentifier.simploTechnology.description == #"Simplo Technology Co., LTD"#)
    
        // Omron Healthcare Co., LTD
        #expect(CompanyIdentifier.omronHealthcare.rawValue == 526)
        #expect(CompanyIdentifier.omronHealthcare.name == #"Omron Healthcare Co., LTD"#)
        #expect(CompanyIdentifier.omronHealthcare.description == #"Omron Healthcare Co., LTD"#)
    
        // Comodule GMBH
        #expect(CompanyIdentifier.comodule.rawValue == 527)
        #expect(CompanyIdentifier.comodule.name == #"Comodule GMBH"#)
        #expect(CompanyIdentifier.comodule.description == #"Comodule GMBH"#)
    
        // ikeGPS
        #expect(CompanyIdentifier.ikegps.rawValue == 528)
        #expect(CompanyIdentifier.ikegps.name == #"ikeGPS"#)
        #expect(CompanyIdentifier.ikegps.description == #"ikeGPS"#)
    
        // Telink Semiconductor Co. Ltd
        #expect(CompanyIdentifier.telinkSemiconductor.rawValue == 529)
        #expect(CompanyIdentifier.telinkSemiconductor.name == #"Telink Semiconductor Co. Ltd"#)
        #expect(CompanyIdentifier.telinkSemiconductor.description == #"Telink Semiconductor Co. Ltd"#)
    
        // Interplan Co., Ltd
        #expect(CompanyIdentifier.interplan.rawValue == 530)
        #expect(CompanyIdentifier.interplan.name == #"Interplan Co., Ltd"#)
        #expect(CompanyIdentifier.interplan.description == #"Interplan Co., Ltd"#)
    
        // Wyler AG
        #expect(CompanyIdentifier.wyler.rawValue == 531)
        #expect(CompanyIdentifier.wyler.name == #"Wyler AG"#)
        #expect(CompanyIdentifier.wyler.description == #"Wyler AG"#)
    
        // IK Multimedia Production srl
        #expect(CompanyIdentifier.ikMultimediaProduction.rawValue == 532)
        #expect(CompanyIdentifier.ikMultimediaProduction.name == #"IK Multimedia Production srl"#)
        #expect(CompanyIdentifier.ikMultimediaProduction.description == #"IK Multimedia Production srl"#)
    
        // Lukoton Experience Oy
        #expect(CompanyIdentifier.lukotonExperience.rawValue == 533)
        #expect(CompanyIdentifier.lukotonExperience.name == #"Lukoton Experience Oy"#)
        #expect(CompanyIdentifier.lukotonExperience.description == #"Lukoton Experience Oy"#)
    
        // MTI Ltd
        #expect(CompanyIdentifier.mti.rawValue == 534)
        #expect(CompanyIdentifier.mti.name == #"MTI Ltd"#)
        #expect(CompanyIdentifier.mti.description == #"MTI Ltd"#)
    
        // Tech4home, Lda
        #expect(CompanyIdentifier.tech4HomeLda.rawValue == 535)
        #expect(CompanyIdentifier.tech4HomeLda.name == #"Tech4home, Lda"#)
        #expect(CompanyIdentifier.tech4HomeLda.description == #"Tech4home, Lda"#)
    
        // Hiotech AB
        #expect(CompanyIdentifier.hiotech.rawValue == 536)
        #expect(CompanyIdentifier.hiotech.name == #"Hiotech AB"#)
        #expect(CompanyIdentifier.hiotech.description == #"Hiotech AB"#)
    
        // DOTT Limited
        #expect(CompanyIdentifier.dott.rawValue == 537)
        #expect(CompanyIdentifier.dott.name == #"DOTT Limited"#)
        #expect(CompanyIdentifier.dott.description == #"DOTT Limited"#)
    
        // Blue Speck Labs, LLC
        #expect(CompanyIdentifier.blueSpeckLabs.rawValue == 538)
        #expect(CompanyIdentifier.blueSpeckLabs.name == #"Blue Speck Labs, LLC"#)
        #expect(CompanyIdentifier.blueSpeckLabs.description == #"Blue Speck Labs, LLC"#)
    
        // Cisco Systems, Inc
        #expect(CompanyIdentifier.ciscoSystems.rawValue == 539)
        #expect(CompanyIdentifier.ciscoSystems.name == #"Cisco Systems, Inc"#)
        #expect(CompanyIdentifier.ciscoSystems.description == #"Cisco Systems, Inc"#)
    
        // Mobicomm Inc
        #expect(CompanyIdentifier.mobicomm.rawValue == 540)
        #expect(CompanyIdentifier.mobicomm.name == #"Mobicomm Inc"#)
        #expect(CompanyIdentifier.mobicomm.description == #"Mobicomm Inc"#)
    
        // Edamic
        #expect(CompanyIdentifier.edamic.rawValue == 541)
        #expect(CompanyIdentifier.edamic.name == #"Edamic"#)
        #expect(CompanyIdentifier.edamic.description == #"Edamic"#)
    
        // Goodnet, Ltd
        #expect(CompanyIdentifier.goodnet.rawValue == 542)
        #expect(CompanyIdentifier.goodnet.name == #"Goodnet, Ltd"#)
        #expect(CompanyIdentifier.goodnet.description == #"Goodnet, Ltd"#)
    
        // Luster Leaf Products  Inc
        #expect(CompanyIdentifier.lusterLeafProducts.rawValue == 543)
        #expect(CompanyIdentifier.lusterLeafProducts.name == #"Luster Leaf Products  Inc"#)
        #expect(CompanyIdentifier.lusterLeafProducts.description == #"Luster Leaf Products  Inc"#)
    
        // Manus Machina BV
        #expect(CompanyIdentifier.manusMachina.rawValue == 544)
        #expect(CompanyIdentifier.manusMachina.name == #"Manus Machina BV"#)
        #expect(CompanyIdentifier.manusMachina.description == #"Manus Machina BV"#)
    
        // Mobiquity Networks Inc
        #expect(CompanyIdentifier.mobiquityNetworks.rawValue == 545)
        #expect(CompanyIdentifier.mobiquityNetworks.name == #"Mobiquity Networks Inc"#)
        #expect(CompanyIdentifier.mobiquityNetworks.description == #"Mobiquity Networks Inc"#)
    
        // Praxis Dynamics
        #expect(CompanyIdentifier.praxisDynamics.rawValue == 546)
        #expect(CompanyIdentifier.praxisDynamics.name == #"Praxis Dynamics"#)
        #expect(CompanyIdentifier.praxisDynamics.description == #"Praxis Dynamics"#)
    
        // Philip Morris Products S.A.
        #expect(CompanyIdentifier.philipMorrisProducts.rawValue == 547)
        #expect(CompanyIdentifier.philipMorrisProducts.name == #"Philip Morris Products S.A."#)
        #expect(CompanyIdentifier.philipMorrisProducts.description == #"Philip Morris Products S.A."#)
    
        // Comarch SA
        #expect(CompanyIdentifier.comarch.rawValue == 548)
        #expect(CompanyIdentifier.comarch.name == #"Comarch SA"#)
        #expect(CompanyIdentifier.comarch.description == #"Comarch SA"#)
    
        // Nestlé Nespresso S.A.
        #expect(CompanyIdentifier.nestleNespresso.rawValue == 549)
        #expect(CompanyIdentifier.nestleNespresso.name == #"Nestlé Nespresso S.A."#)
        #expect(CompanyIdentifier.nestleNespresso.description == #"Nestlé Nespresso S.A."#)
    
        // Merlinia A/S
        #expect(CompanyIdentifier.merlinia.rawValue == 550)
        #expect(CompanyIdentifier.merlinia.name == #"Merlinia A/S"#)
        #expect(CompanyIdentifier.merlinia.description == #"Merlinia A/S"#)
    
        // LifeBEAM Technologies
        #expect(CompanyIdentifier.lifebeamTechnologies.rawValue == 551)
        #expect(CompanyIdentifier.lifebeamTechnologies.name == #"LifeBEAM Technologies"#)
        #expect(CompanyIdentifier.lifebeamTechnologies.description == #"LifeBEAM Technologies"#)
    
        // Twocanoes Labs, LLC
        #expect(CompanyIdentifier.twocanoesLabs.rawValue == 552)
        #expect(CompanyIdentifier.twocanoesLabs.name == #"Twocanoes Labs, LLC"#)
        #expect(CompanyIdentifier.twocanoesLabs.description == #"Twocanoes Labs, LLC"#)
    
        // Muoverti Limited
        #expect(CompanyIdentifier.muoverti.rawValue == 553)
        #expect(CompanyIdentifier.muoverti.name == #"Muoverti Limited"#)
        #expect(CompanyIdentifier.muoverti.description == #"Muoverti Limited"#)
    
        // Stamer Musikanlagen GMBH
        #expect(CompanyIdentifier.stamerMusikanlagen.rawValue == 554)
        #expect(CompanyIdentifier.stamerMusikanlagen.name == #"Stamer Musikanlagen GMBH"#)
        #expect(CompanyIdentifier.stamerMusikanlagen.description == #"Stamer Musikanlagen GMBH"#)
    
        // Tesla, Inc.
        #expect(CompanyIdentifier.tesla.rawValue == 555)
        #expect(CompanyIdentifier.tesla.name == #"Tesla, Inc."#)
        #expect(CompanyIdentifier.tesla.description == #"Tesla, Inc."#)
    
        // Pharynks Corporation
        #expect(CompanyIdentifier.pharynks.rawValue == 556)
        #expect(CompanyIdentifier.pharynks.name == #"Pharynks Corporation"#)
        #expect(CompanyIdentifier.pharynks.description == #"Pharynks Corporation"#)
    
        // Lupine
        #expect(CompanyIdentifier.lupine.rawValue == 557)
        #expect(CompanyIdentifier.lupine.name == #"Lupine"#)
        #expect(CompanyIdentifier.lupine.description == #"Lupine"#)
    
        // Siemens AG
        #expect(CompanyIdentifier.siemens.rawValue == 558)
        #expect(CompanyIdentifier.siemens.name == #"Siemens AG"#)
        #expect(CompanyIdentifier.siemens.description == #"Siemens AG"#)
    
        // Huami (Shanghai) Culture Communication CO., LTD
        #expect(CompanyIdentifier.huamiShanghaiCultureCommunication.rawValue == 559)
        #expect(CompanyIdentifier.huamiShanghaiCultureCommunication.name == #"Huami (Shanghai) Culture Communication CO., LTD"#)
        #expect(CompanyIdentifier.huamiShanghaiCultureCommunication.description == #"Huami (Shanghai) Culture Communication CO., LTD"#)
    
        // Foster Electric Company, Ltd
        #expect(CompanyIdentifier.fosterElectric.rawValue == 560)
        #expect(CompanyIdentifier.fosterElectric.name == #"Foster Electric Company, Ltd"#)
        #expect(CompanyIdentifier.fosterElectric.description == #"Foster Electric Company, Ltd"#)
    
        // ETA SA
        #expect(CompanyIdentifier.eta.rawValue == 561)
        #expect(CompanyIdentifier.eta.name == #"ETA SA"#)
        #expect(CompanyIdentifier.eta.description == #"ETA SA"#)
    
        // x-Senso Solutions Kft
        #expect(CompanyIdentifier.xSensoSolutions.rawValue == 562)
        #expect(CompanyIdentifier.xSensoSolutions.name == #"x-Senso Solutions Kft"#)
        #expect(CompanyIdentifier.xSensoSolutions.description == #"x-Senso Solutions Kft"#)
    
        // Shenzhen SuLong Communication Ltd
        #expect(CompanyIdentifier.shenzhenSulongCommunication.rawValue == 563)
        #expect(CompanyIdentifier.shenzhenSulongCommunication.name == #"Shenzhen SuLong Communication Ltd"#)
        #expect(CompanyIdentifier.shenzhenSulongCommunication.description == #"Shenzhen SuLong Communication Ltd"#)
    
        // FengFan (BeiJing) Technology Co, Ltd
        #expect(CompanyIdentifier.fengfanBeijingTechnology.rawValue == 564)
        #expect(CompanyIdentifier.fengfanBeijingTechnology.name == #"FengFan (BeiJing) Technology Co, Ltd"#)
        #expect(CompanyIdentifier.fengfanBeijingTechnology.description == #"FengFan (BeiJing) Technology Co, Ltd"#)
    
        // Qrio Inc
        #expect(CompanyIdentifier.qrio.rawValue == 565)
        #expect(CompanyIdentifier.qrio.name == #"Qrio Inc"#)
        #expect(CompanyIdentifier.qrio.description == #"Qrio Inc"#)
    
        // Pitpatpet Ltd
        #expect(CompanyIdentifier.pitpatpet.rawValue == 566)
        #expect(CompanyIdentifier.pitpatpet.name == #"Pitpatpet Ltd"#)
        #expect(CompanyIdentifier.pitpatpet.description == #"Pitpatpet Ltd"#)
    
        // MSHeli s.r.l.
        #expect(CompanyIdentifier.msheli.rawValue == 567)
        #expect(CompanyIdentifier.msheli.name == #"MSHeli s.r.l."#)
        #expect(CompanyIdentifier.msheli.description == #"MSHeli s.r.l."#)
    
        // Trakm8 Ltd
        #expect(CompanyIdentifier.trakm8.rawValue == 568)
        #expect(CompanyIdentifier.trakm8.name == #"Trakm8 Ltd"#)
        #expect(CompanyIdentifier.trakm8.description == #"Trakm8 Ltd"#)
    
        // JIN CO, Ltd
        #expect(CompanyIdentifier.jin.rawValue == 569)
        #expect(CompanyIdentifier.jin.name == #"JIN CO, Ltd"#)
        #expect(CompanyIdentifier.jin.description == #"JIN CO, Ltd"#)
    
        // Alatech Tehnology
        #expect(CompanyIdentifier.alatechTehnology.rawValue == 570)
        #expect(CompanyIdentifier.alatechTehnology.name == #"Alatech Tehnology"#)
        #expect(CompanyIdentifier.alatechTehnology.description == #"Alatech Tehnology"#)
    
        // Beijing CarePulse Electronic Technology Co, Ltd
        #expect(CompanyIdentifier.beijingCarepulseElectronicTechnology.rawValue == 571)
        #expect(CompanyIdentifier.beijingCarepulseElectronicTechnology.name == #"Beijing CarePulse Electronic Technology Co, Ltd"#)
        #expect(CompanyIdentifier.beijingCarepulseElectronicTechnology.description == #"Beijing CarePulse Electronic Technology Co, Ltd"#)
    
        // Awarepoint
        #expect(CompanyIdentifier.awarepoint.rawValue == 572)
        #expect(CompanyIdentifier.awarepoint.name == #"Awarepoint"#)
        #expect(CompanyIdentifier.awarepoint.description == #"Awarepoint"#)
    
        // ViCentra B.V.
        #expect(CompanyIdentifier.vicentra.rawValue == 573)
        #expect(CompanyIdentifier.vicentra.name == #"ViCentra B.V."#)
        #expect(CompanyIdentifier.vicentra.description == #"ViCentra B.V."#)
    
        // Raven Industries
        #expect(CompanyIdentifier.ravenIndustries.rawValue == 574)
        #expect(CompanyIdentifier.ravenIndustries.name == #"Raven Industries"#)
        #expect(CompanyIdentifier.ravenIndustries.description == #"Raven Industries"#)
    
        // WaveWare Technologies Inc.
        #expect(CompanyIdentifier.wavewareTechnologies.rawValue == 575)
        #expect(CompanyIdentifier.wavewareTechnologies.name == #"WaveWare Technologies Inc."#)
        #expect(CompanyIdentifier.wavewareTechnologies.description == #"WaveWare Technologies Inc."#)
    
        // Argenox Technologies
        #expect(CompanyIdentifier.argenoxTechnologies.rawValue == 576)
        #expect(CompanyIdentifier.argenoxTechnologies.name == #"Argenox Technologies"#)
        #expect(CompanyIdentifier.argenoxTechnologies.description == #"Argenox Technologies"#)
    
        // Bragi GmbH
        #expect(CompanyIdentifier.bragi.rawValue == 577)
        #expect(CompanyIdentifier.bragi.name == #"Bragi GmbH"#)
        #expect(CompanyIdentifier.bragi.description == #"Bragi GmbH"#)
    
        // 16Lab Inc
        #expect(CompanyIdentifier.company16Lab.rawValue == 578)
        #expect(CompanyIdentifier.company16Lab.name == #"16Lab Inc"#)
        #expect(CompanyIdentifier.company16Lab.description == #"16Lab Inc"#)
    
        // Masimo Corp
        #expect(CompanyIdentifier.masimo.rawValue == 579)
        #expect(CompanyIdentifier.masimo.name == #"Masimo Corp"#)
        #expect(CompanyIdentifier.masimo.description == #"Masimo Corp"#)
    
        // Iotera Inc
        #expect(CompanyIdentifier.iotera.rawValue == 580)
        #expect(CompanyIdentifier.iotera.name == #"Iotera Inc"#)
        #expect(CompanyIdentifier.iotera.description == #"Iotera Inc"#)
    
        // Endress+Hauser
        #expect(CompanyIdentifier.endressHauser.rawValue == 581)
        #expect(CompanyIdentifier.endressHauser.name == #"Endress+Hauser"#)
        #expect(CompanyIdentifier.endressHauser.description == #"Endress+Hauser"#)
    
        // ACKme Networks, Inc.
        #expect(CompanyIdentifier.ackmeNetworks.rawValue == 582)
        #expect(CompanyIdentifier.ackmeNetworks.name == #"ACKme Networks, Inc."#)
        #expect(CompanyIdentifier.ackmeNetworks.description == #"ACKme Networks, Inc."#)
    
        // FiftyThree Inc.
        #expect(CompanyIdentifier.fiftythree.rawValue == 583)
        #expect(CompanyIdentifier.fiftythree.name == #"FiftyThree Inc."#)
        #expect(CompanyIdentifier.fiftythree.description == #"FiftyThree Inc."#)
    
        // Parker Hannifin Corp
        #expect(CompanyIdentifier.parkerHannifin.rawValue == 584)
        #expect(CompanyIdentifier.parkerHannifin.name == #"Parker Hannifin Corp"#)
        #expect(CompanyIdentifier.parkerHannifin.description == #"Parker Hannifin Corp"#)
    
        // Transcranial Ltd
        #expect(CompanyIdentifier.transcranial.rawValue == 585)
        #expect(CompanyIdentifier.transcranial.name == #"Transcranial Ltd"#)
        #expect(CompanyIdentifier.transcranial.description == #"Transcranial Ltd"#)
    
        // Uwatec AG
        #expect(CompanyIdentifier.uwatec.rawValue == 586)
        #expect(CompanyIdentifier.uwatec.name == #"Uwatec AG"#)
        #expect(CompanyIdentifier.uwatec.description == #"Uwatec AG"#)
    
        // Orlan LLC
        #expect(CompanyIdentifier.orlan.rawValue == 587)
        #expect(CompanyIdentifier.orlan.name == #"Orlan LLC"#)
        #expect(CompanyIdentifier.orlan.description == #"Orlan LLC"#)
    
        // Blue Clover Devices
        #expect(CompanyIdentifier.blueCloverDevices.rawValue == 588)
        #expect(CompanyIdentifier.blueCloverDevices.name == #"Blue Clover Devices"#)
        #expect(CompanyIdentifier.blueCloverDevices.description == #"Blue Clover Devices"#)
    
        // M-Way Solutions GmbH
        #expect(CompanyIdentifier.mWaySolutions.rawValue == 589)
        #expect(CompanyIdentifier.mWaySolutions.name == #"M-Way Solutions GmbH"#)
        #expect(CompanyIdentifier.mWaySolutions.description == #"M-Way Solutions GmbH"#)
    
        // Microtronics Engineering GmbH
        #expect(CompanyIdentifier.microtronicsEngineering.rawValue == 590)
        #expect(CompanyIdentifier.microtronicsEngineering.name == #"Microtronics Engineering GmbH"#)
        #expect(CompanyIdentifier.microtronicsEngineering.description == #"Microtronics Engineering GmbH"#)
    
        // Schneider Schreibgeräte GmbH
        #expect(CompanyIdentifier.schneiderSchreibgerate.rawValue == 591)
        #expect(CompanyIdentifier.schneiderSchreibgerate.name == #"Schneider Schreibgeräte GmbH"#)
        #expect(CompanyIdentifier.schneiderSchreibgerate.description == #"Schneider Schreibgeräte GmbH"#)
    
        // Sapphire Circuits LLC
        #expect(CompanyIdentifier.sapphireCircuits.rawValue == 592)
        #expect(CompanyIdentifier.sapphireCircuits.name == #"Sapphire Circuits LLC"#)
        #expect(CompanyIdentifier.sapphireCircuits.description == #"Sapphire Circuits LLC"#)
    
        // Lumo Bodytech Inc.
        #expect(CompanyIdentifier.lumoBodytech.rawValue == 593)
        #expect(CompanyIdentifier.lumoBodytech.name == #"Lumo Bodytech Inc."#)
        #expect(CompanyIdentifier.lumoBodytech.description == #"Lumo Bodytech Inc."#)
    
        // UKC Technosolution
        #expect(CompanyIdentifier.ukcTechnosolution.rawValue == 594)
        #expect(CompanyIdentifier.ukcTechnosolution.name == #"UKC Technosolution"#)
        #expect(CompanyIdentifier.ukcTechnosolution.description == #"UKC Technosolution"#)
    
        // Xicato Inc.
        #expect(CompanyIdentifier.xicato.rawValue == 595)
        #expect(CompanyIdentifier.xicato.name == #"Xicato Inc."#)
        #expect(CompanyIdentifier.xicato.description == #"Xicato Inc."#)
    
        // Playbrush
        #expect(CompanyIdentifier.playbrush.rawValue == 596)
        #expect(CompanyIdentifier.playbrush.name == #"Playbrush"#)
        #expect(CompanyIdentifier.playbrush.description == #"Playbrush"#)
    
        // Dai Nippon Printing Co., Ltd.
        #expect(CompanyIdentifier.daiNipponPrinting.rawValue == 597)
        #expect(CompanyIdentifier.daiNipponPrinting.name == #"Dai Nippon Printing Co., Ltd."#)
        #expect(CompanyIdentifier.daiNipponPrinting.description == #"Dai Nippon Printing Co., Ltd."#)
    
        // G24 Power Limited
        #expect(CompanyIdentifier.g24Power.rawValue == 598)
        #expect(CompanyIdentifier.g24Power.name == #"G24 Power Limited"#)
        #expect(CompanyIdentifier.g24Power.description == #"G24 Power Limited"#)
    
        // AdBabble Local Commerce Inc.
        #expect(CompanyIdentifier.adbabbleLocalCommerce.rawValue == 599)
        #expect(CompanyIdentifier.adbabbleLocalCommerce.name == #"AdBabble Local Commerce Inc."#)
        #expect(CompanyIdentifier.adbabbleLocalCommerce.description == #"AdBabble Local Commerce Inc."#)
    
        // Devialet SA
        #expect(CompanyIdentifier.devialet.rawValue == 600)
        #expect(CompanyIdentifier.devialet.name == #"Devialet SA"#)
        #expect(CompanyIdentifier.devialet.description == #"Devialet SA"#)
    
        // ALTYOR
        #expect(CompanyIdentifier.altyor.rawValue == 601)
        #expect(CompanyIdentifier.altyor.name == #"ALTYOR"#)
        #expect(CompanyIdentifier.altyor.description == #"ALTYOR"#)
    
        // University of Applied Sciences Valais/Haute Ecole Valaisanne
        #expect(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.rawValue == 602)
        #expect(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.name == #"University of Applied Sciences Valais/Haute Ecole Valaisanne"#)
        #expect(CompanyIdentifier.universityOfAppliedSciencesValaisHauteEcoleValaisanne.description == #"University of Applied Sciences Valais/Haute Ecole Valaisanne"#)
    
        // Five Interactive, LLC dba Zendo
        #expect(CompanyIdentifier.fiveInteractiveDbaZendo.rawValue == 603)
        #expect(CompanyIdentifier.fiveInteractiveDbaZendo.name == #"Five Interactive, LLC dba Zendo"#)
        #expect(CompanyIdentifier.fiveInteractiveDbaZendo.description == #"Five Interactive, LLC dba Zendo"#)
    
        // NetEase（Hangzhou）Network co.Ltd.
        #expect(CompanyIdentifier.neteaseHangzhouNetwork.rawValue == 604)
        #expect(CompanyIdentifier.neteaseHangzhouNetwork.name == #"NetEase（Hangzhou）Network co.Ltd."#)
        #expect(CompanyIdentifier.neteaseHangzhouNetwork.description == #"NetEase（Hangzhou）Network co.Ltd."#)
    
        // Lexmark International Inc.
        #expect(CompanyIdentifier.lexmarkInternational.rawValue == 605)
        #expect(CompanyIdentifier.lexmarkInternational.name == #"Lexmark International Inc."#)
        #expect(CompanyIdentifier.lexmarkInternational.description == #"Lexmark International Inc."#)
    
        // Fluke Corporation
        #expect(CompanyIdentifier.fluke.rawValue == 606)
        #expect(CompanyIdentifier.fluke.name == #"Fluke Corporation"#)
        #expect(CompanyIdentifier.fluke.description == #"Fluke Corporation"#)
    
        // Yardarm Technologies
        #expect(CompanyIdentifier.yardarmTechnologies.rawValue == 607)
        #expect(CompanyIdentifier.yardarmTechnologies.name == #"Yardarm Technologies"#)
        #expect(CompanyIdentifier.yardarmTechnologies.description == #"Yardarm Technologies"#)
    
        // SensaRx
        #expect(CompanyIdentifier.sensarx.rawValue == 608)
        #expect(CompanyIdentifier.sensarx.name == #"SensaRx"#)
        #expect(CompanyIdentifier.sensarx.description == #"SensaRx"#)
    
        // SECVRE GmbH
        #expect(CompanyIdentifier.secvre.rawValue == 609)
        #expect(CompanyIdentifier.secvre.name == #"SECVRE GmbH"#)
        #expect(CompanyIdentifier.secvre.description == #"SECVRE GmbH"#)
    
        // Glacial Ridge Technologies
        #expect(CompanyIdentifier.glacialRidgeTechnologies.rawValue == 610)
        #expect(CompanyIdentifier.glacialRidgeTechnologies.name == #"Glacial Ridge Technologies"#)
        #expect(CompanyIdentifier.glacialRidgeTechnologies.description == #"Glacial Ridge Technologies"#)
    
        // Identiv, Inc.
        #expect(CompanyIdentifier.identiv.rawValue == 611)
        #expect(CompanyIdentifier.identiv.name == #"Identiv, Inc."#)
        #expect(CompanyIdentifier.identiv.description == #"Identiv, Inc."#)
    
        // DDS, Inc.
        #expect(CompanyIdentifier.dds.rawValue == 612)
        #expect(CompanyIdentifier.dds.name == #"DDS, Inc."#)
        #expect(CompanyIdentifier.dds.description == #"DDS, Inc."#)
    
        // SMK Corporation
        #expect(CompanyIdentifier.smk.rawValue == 613)
        #expect(CompanyIdentifier.smk.name == #"SMK Corporation"#)
        #expect(CompanyIdentifier.smk.description == #"SMK Corporation"#)
    
        // Schawbel Technologies LLC
        #expect(CompanyIdentifier.schawbelTechnologies.rawValue == 614)
        #expect(CompanyIdentifier.schawbelTechnologies.name == #"Schawbel Technologies LLC"#)
        #expect(CompanyIdentifier.schawbelTechnologies.description == #"Schawbel Technologies LLC"#)
    
        // XMI Systems SA
        #expect(CompanyIdentifier.xmiSystems.rawValue == 615)
        #expect(CompanyIdentifier.xmiSystems.name == #"XMI Systems SA"#)
        #expect(CompanyIdentifier.xmiSystems.description == #"XMI Systems SA"#)
    
        // Cerevo
        #expect(CompanyIdentifier.cerevo.rawValue == 616)
        #expect(CompanyIdentifier.cerevo.name == #"Cerevo"#)
        #expect(CompanyIdentifier.cerevo.description == #"Cerevo"#)
    
        // Torrox GmbH & Co KG
        #expect(CompanyIdentifier.torrox.rawValue == 617)
        #expect(CompanyIdentifier.torrox.name == #"Torrox GmbH & Co KG"#)
        #expect(CompanyIdentifier.torrox.description == #"Torrox GmbH & Co KG"#)
    
        // Gemalto
        #expect(CompanyIdentifier.gemalto.rawValue == 618)
        #expect(CompanyIdentifier.gemalto.name == #"Gemalto"#)
        #expect(CompanyIdentifier.gemalto.description == #"Gemalto"#)
    
        // DEKA Research & Development Corp.
        #expect(CompanyIdentifier.dekaResearchDevelopment.rawValue == 619)
        #expect(CompanyIdentifier.dekaResearchDevelopment.name == #"DEKA Research & Development Corp."#)
        #expect(CompanyIdentifier.dekaResearchDevelopment.description == #"DEKA Research & Development Corp."#)
    
        // Domster Tadeusz Szydlowski
        #expect(CompanyIdentifier.domsterTadeuszSzydlowski.rawValue == 620)
        #expect(CompanyIdentifier.domsterTadeuszSzydlowski.name == #"Domster Tadeusz Szydlowski"#)
        #expect(CompanyIdentifier.domsterTadeuszSzydlowski.description == #"Domster Tadeusz Szydlowski"#)
    
        // Technogym SPA
        #expect(CompanyIdentifier.technogymSpa.rawValue == 621)
        #expect(CompanyIdentifier.technogymSpa.name == #"Technogym SPA"#)
        #expect(CompanyIdentifier.technogymSpa.description == #"Technogym SPA"#)
    
        // FLEURBAEY BVBA
        #expect(CompanyIdentifier.fleurbaeyba.rawValue == 622)
        #expect(CompanyIdentifier.fleurbaeyba.name == #"FLEURBAEY BVBA"#)
        #expect(CompanyIdentifier.fleurbaeyba.description == #"FLEURBAEY BVBA"#)
    
        // Aptcode Solutions
        #expect(CompanyIdentifier.aptcodeSolutions.rawValue == 623)
        #expect(CompanyIdentifier.aptcodeSolutions.name == #"Aptcode Solutions"#)
        #expect(CompanyIdentifier.aptcodeSolutions.description == #"Aptcode Solutions"#)
    
        // LSI ADL Technology
        #expect(CompanyIdentifier.lsiAdlTechnology.rawValue == 624)
        #expect(CompanyIdentifier.lsiAdlTechnology.name == #"LSI ADL Technology"#)
        #expect(CompanyIdentifier.lsiAdlTechnology.description == #"LSI ADL Technology"#)
    
        // Animas Corp
        #expect(CompanyIdentifier.animas.rawValue == 625)
        #expect(CompanyIdentifier.animas.name == #"Animas Corp"#)
        #expect(CompanyIdentifier.animas.description == #"Animas Corp"#)
    
        // Alps Alpine Co., Ltd.
        #expect(CompanyIdentifier.alpsAlpine.rawValue == 626)
        #expect(CompanyIdentifier.alpsAlpine.name == #"Alps Alpine Co., Ltd."#)
        #expect(CompanyIdentifier.alpsAlpine.description == #"Alps Alpine Co., Ltd."#)
    
        // OCEASOFT
        #expect(CompanyIdentifier.oceasoft.rawValue == 627)
        #expect(CompanyIdentifier.oceasoft.name == #"OCEASOFT"#)
        #expect(CompanyIdentifier.oceasoft.description == #"OCEASOFT"#)
    
        // Motsai Research
        #expect(CompanyIdentifier.motsaiResearch.rawValue == 628)
        #expect(CompanyIdentifier.motsaiResearch.name == #"Motsai Research"#)
        #expect(CompanyIdentifier.motsaiResearch.description == #"Motsai Research"#)
    
        // Geotab
        #expect(CompanyIdentifier.geotab.rawValue == 629)
        #expect(CompanyIdentifier.geotab.name == #"Geotab"#)
        #expect(CompanyIdentifier.geotab.description == #"Geotab"#)
    
        // E.G.O. Elektro-Geraetebau GmbH
        #expect(CompanyIdentifier.eGOElektroGeraetebau.rawValue == 630)
        #expect(CompanyIdentifier.eGOElektroGeraetebau.name == #"E.G.O. Elektro-Geraetebau GmbH"#)
        #expect(CompanyIdentifier.eGOElektroGeraetebau.description == #"E.G.O. Elektro-Geraetebau GmbH"#)
    
        // bewhere inc
        #expect(CompanyIdentifier.bewhere.rawValue == 631)
        #expect(CompanyIdentifier.bewhere.name == #"bewhere inc"#)
        #expect(CompanyIdentifier.bewhere.description == #"bewhere inc"#)
    
        // Johnson Outdoors Inc
        #expect(CompanyIdentifier.johnsonOutdoors.rawValue == 632)
        #expect(CompanyIdentifier.johnsonOutdoors.name == #"Johnson Outdoors Inc"#)
        #expect(CompanyIdentifier.johnsonOutdoors.description == #"Johnson Outdoors Inc"#)
    
        // steute Schaltgerate GmbH & Co. KG
        #expect(CompanyIdentifier.steuteSchaltgerate.rawValue == 633)
        #expect(CompanyIdentifier.steuteSchaltgerate.name == #"steute Schaltgerate GmbH & Co. KG"#)
        #expect(CompanyIdentifier.steuteSchaltgerate.description == #"steute Schaltgerate GmbH & Co. KG"#)
    
        // Ekomini inc.
        #expect(CompanyIdentifier.ekomini.rawValue == 634)
        #expect(CompanyIdentifier.ekomini.name == #"Ekomini inc."#)
        #expect(CompanyIdentifier.ekomini.description == #"Ekomini inc."#)
    
        // DEFA AS
        #expect(CompanyIdentifier.defa.rawValue == 635)
        #expect(CompanyIdentifier.defa.name == #"DEFA AS"#)
        #expect(CompanyIdentifier.defa.description == #"DEFA AS"#)
    
        // Aseptika Ltd
        #expect(CompanyIdentifier.aseptika.rawValue == 636)
        #expect(CompanyIdentifier.aseptika.name == #"Aseptika Ltd"#)
        #expect(CompanyIdentifier.aseptika.description == #"Aseptika Ltd"#)
    
        // HUAWEI Technologies Co., Ltd.
        #expect(CompanyIdentifier.huaweiTechnologies.rawValue == 637)
        #expect(CompanyIdentifier.huaweiTechnologies.name == #"HUAWEI Technologies Co., Ltd."#)
        #expect(CompanyIdentifier.huaweiTechnologies.description == #"HUAWEI Technologies Co., Ltd."#)
    
        // HabitAware, LLC
        #expect(CompanyIdentifier.habitaware.rawValue == 638)
        #expect(CompanyIdentifier.habitaware.name == #"HabitAware, LLC"#)
        #expect(CompanyIdentifier.habitaware.description == #"HabitAware, LLC"#)
    
        // ruwido austria gmbh
        #expect(CompanyIdentifier.ruwidoAustria.rawValue == 639)
        #expect(CompanyIdentifier.ruwidoAustria.name == #"ruwido austria gmbh"#)
        #expect(CompanyIdentifier.ruwidoAustria.description == #"ruwido austria gmbh"#)
    
        // ITEC corporation
        #expect(CompanyIdentifier.itec.rawValue == 640)
        #expect(CompanyIdentifier.itec.name == #"ITEC corporation"#)
        #expect(CompanyIdentifier.itec.description == #"ITEC corporation"#)
    
        // StoneL
        #expect(CompanyIdentifier.stonel.rawValue == 641)
        #expect(CompanyIdentifier.stonel.name == #"StoneL"#)
        #expect(CompanyIdentifier.stonel.description == #"StoneL"#)
    
        // Sonova AG
        #expect(CompanyIdentifier.sonova.rawValue == 642)
        #expect(CompanyIdentifier.sonova.name == #"Sonova AG"#)
        #expect(CompanyIdentifier.sonova.description == #"Sonova AG"#)
    
        // Maven Machines, Inc.
        #expect(CompanyIdentifier.mavenMachines.rawValue == 643)
        #expect(CompanyIdentifier.mavenMachines.name == #"Maven Machines, Inc."#)
        #expect(CompanyIdentifier.mavenMachines.description == #"Maven Machines, Inc."#)
    
        // Synapse Electronics
        #expect(CompanyIdentifier.synapseElectronics.rawValue == 644)
        #expect(CompanyIdentifier.synapseElectronics.name == #"Synapse Electronics"#)
        #expect(CompanyIdentifier.synapseElectronics.description == #"Synapse Electronics"#)
    
        // WOWTech Canada Ltd.
        #expect(CompanyIdentifier.wowtechCanada.rawValue == 645)
        #expect(CompanyIdentifier.wowtechCanada.name == #"WOWTech Canada Ltd."#)
        #expect(CompanyIdentifier.wowtechCanada.description == #"WOWTech Canada Ltd."#)
    
        // RF Code, Inc.
        #expect(CompanyIdentifier.rfCode.rawValue == 646)
        #expect(CompanyIdentifier.rfCode.name == #"RF Code, Inc."#)
        #expect(CompanyIdentifier.rfCode.description == #"RF Code, Inc."#)
    
        // Wally Ventures S.L.
        #expect(CompanyIdentifier.wallyVentures.rawValue == 647)
        #expect(CompanyIdentifier.wallyVentures.name == #"Wally Ventures S.L."#)
        #expect(CompanyIdentifier.wallyVentures.description == #"Wally Ventures S.L."#)
    
        // Willowbank Electronics Ltd
        #expect(CompanyIdentifier.willowbankElectronics.rawValue == 648)
        #expect(CompanyIdentifier.willowbankElectronics.name == #"Willowbank Electronics Ltd"#)
        #expect(CompanyIdentifier.willowbankElectronics.description == #"Willowbank Electronics Ltd"#)
    
        // SK Telecom
        #expect(CompanyIdentifier.skTelecom.rawValue == 649)
        #expect(CompanyIdentifier.skTelecom.name == #"SK Telecom"#)
        #expect(CompanyIdentifier.skTelecom.description == #"SK Telecom"#)
    
        // Jetro AS
        #expect(CompanyIdentifier.jetro.rawValue == 650)
        #expect(CompanyIdentifier.jetro.name == #"Jetro AS"#)
        #expect(CompanyIdentifier.jetro.description == #"Jetro AS"#)
    
        // Code Gears LTD
        #expect(CompanyIdentifier.codeGears.rawValue == 651)
        #expect(CompanyIdentifier.codeGears.name == #"Code Gears LTD"#)
        #expect(CompanyIdentifier.codeGears.description == #"Code Gears LTD"#)
    
        // NANOLINK APS
        #expect(CompanyIdentifier.nanolink.rawValue == 652)
        #expect(CompanyIdentifier.nanolink.name == #"NANOLINK APS"#)
        #expect(CompanyIdentifier.nanolink.description == #"NANOLINK APS"#)
    
        // IF, LLC
        #expect(CompanyIdentifier.ifllc.rawValue == 653)
        #expect(CompanyIdentifier.ifllc.name == #"IF, LLC"#)
        #expect(CompanyIdentifier.ifllc.description == #"IF, LLC"#)
    
        // RF Digital Corp
        #expect(CompanyIdentifier.rfDigital.rawValue == 654)
        #expect(CompanyIdentifier.rfDigital.name == #"RF Digital Corp"#)
        #expect(CompanyIdentifier.rfDigital.description == #"RF Digital Corp"#)
    
        // Church & Dwight Co., Inc
        #expect(CompanyIdentifier.churchDwight.rawValue == 655)
        #expect(CompanyIdentifier.churchDwight.name == #"Church & Dwight Co., Inc"#)
        #expect(CompanyIdentifier.churchDwight.description == #"Church & Dwight Co., Inc"#)
    
        // Multibit Oy
        #expect(CompanyIdentifier.multibit.rawValue == 656)
        #expect(CompanyIdentifier.multibit.name == #"Multibit Oy"#)
        #expect(CompanyIdentifier.multibit.description == #"Multibit Oy"#)
    
        // CliniCloud Inc
        #expect(CompanyIdentifier.clinicloud.rawValue == 657)
        #expect(CompanyIdentifier.clinicloud.name == #"CliniCloud Inc"#)
        #expect(CompanyIdentifier.clinicloud.description == #"CliniCloud Inc"#)
    
        // SwiftSensors
        #expect(CompanyIdentifier.swiftsensors.rawValue == 658)
        #expect(CompanyIdentifier.swiftsensors.name == #"SwiftSensors"#)
        #expect(CompanyIdentifier.swiftsensors.description == #"SwiftSensors"#)
    
        // Blue Bite
        #expect(CompanyIdentifier.blueBite.rawValue == 659)
        #expect(CompanyIdentifier.blueBite.name == #"Blue Bite"#)
        #expect(CompanyIdentifier.blueBite.description == #"Blue Bite"#)
    
        // ELIAS GmbH
        #expect(CompanyIdentifier.elias.rawValue == 660)
        #expect(CompanyIdentifier.elias.name == #"ELIAS GmbH"#)
        #expect(CompanyIdentifier.elias.description == #"ELIAS GmbH"#)
    
        // Sivantos GmbH
        #expect(CompanyIdentifier.sivantos.rawValue == 661)
        #expect(CompanyIdentifier.sivantos.name == #"Sivantos GmbH"#)
        #expect(CompanyIdentifier.sivantos.description == #"Sivantos GmbH"#)
    
        // Petzl
        #expect(CompanyIdentifier.petzl.rawValue == 662)
        #expect(CompanyIdentifier.petzl.name == #"Petzl"#)
        #expect(CompanyIdentifier.petzl.description == #"Petzl"#)
    
        // storm power ltd
        #expect(CompanyIdentifier.stormPower.rawValue == 663)
        #expect(CompanyIdentifier.stormPower.name == #"storm power ltd"#)
        #expect(CompanyIdentifier.stormPower.description == #"storm power ltd"#)
    
        // EISST Ltd
        #expect(CompanyIdentifier.eisst.rawValue == 664)
        #expect(CompanyIdentifier.eisst.name == #"EISST Ltd"#)
        #expect(CompanyIdentifier.eisst.description == #"EISST Ltd"#)
    
        // Inexess Technology Simma KG
        #expect(CompanyIdentifier.inexessTechnologySimmaKg.rawValue == 665)
        #expect(CompanyIdentifier.inexessTechnologySimmaKg.name == #"Inexess Technology Simma KG"#)
        #expect(CompanyIdentifier.inexessTechnologySimmaKg.description == #"Inexess Technology Simma KG"#)
    
        // Currant, Inc.
        #expect(CompanyIdentifier.currant.rawValue == 666)
        #expect(CompanyIdentifier.currant.name == #"Currant, Inc."#)
        #expect(CompanyIdentifier.currant.description == #"Currant, Inc."#)
    
        // C2 Development, Inc.
        #expect(CompanyIdentifier.c2Development.rawValue == 667)
        #expect(CompanyIdentifier.c2Development.name == #"C2 Development, Inc."#)
        #expect(CompanyIdentifier.c2Development.description == #"C2 Development, Inc."#)
    
        // Blue Sky Scientific, LLC
        #expect(CompanyIdentifier.blueSkyScientific.rawValue == 668)
        #expect(CompanyIdentifier.blueSkyScientific.name == #"Blue Sky Scientific, LLC"#)
        #expect(CompanyIdentifier.blueSkyScientific.description == #"Blue Sky Scientific, LLC"#)
    
        // ALOTTAZS LABS, LLC
        #expect(CompanyIdentifier.alottazsLabs.rawValue == 669)
        #expect(CompanyIdentifier.alottazsLabs.name == #"ALOTTAZS LABS, LLC"#)
        #expect(CompanyIdentifier.alottazsLabs.description == #"ALOTTAZS LABS, LLC"#)
    
        // Kupson spol. s r.o.
        #expect(CompanyIdentifier.kupsonSpolSRO.rawValue == 670)
        #expect(CompanyIdentifier.kupsonSpolSRO.name == #"Kupson spol. s r.o."#)
        #expect(CompanyIdentifier.kupsonSpolSRO.description == #"Kupson spol. s r.o."#)
    
        // Areus Engineering GmbH
        #expect(CompanyIdentifier.areusEngineering.rawValue == 671)
        #expect(CompanyIdentifier.areusEngineering.name == #"Areus Engineering GmbH"#)
        #expect(CompanyIdentifier.areusEngineering.description == #"Areus Engineering GmbH"#)
    
        // Impossible Camera GmbH
        #expect(CompanyIdentifier.impossibleCamera.rawValue == 672)
        #expect(CompanyIdentifier.impossibleCamera.name == #"Impossible Camera GmbH"#)
        #expect(CompanyIdentifier.impossibleCamera.description == #"Impossible Camera GmbH"#)
    
        // InventureTrack Systems
        #expect(CompanyIdentifier.inventuretrackSystems.rawValue == 673)
        #expect(CompanyIdentifier.inventuretrackSystems.name == #"InventureTrack Systems"#)
        #expect(CompanyIdentifier.inventuretrackSystems.description == #"InventureTrack Systems"#)
    
        // Sera4 Ltd.
        #expect(CompanyIdentifier.sera4.rawValue == 674)
        #expect(CompanyIdentifier.sera4.name == #"Sera4 Ltd."#)
        #expect(CompanyIdentifier.sera4.description == #"Sera4 Ltd."#)
    
        // Itude
        #expect(CompanyIdentifier.itude.rawValue == 675)
        #expect(CompanyIdentifier.itude.name == #"Itude"#)
        #expect(CompanyIdentifier.itude.description == #"Itude"#)
    
        // Pacific Lock Company
        #expect(CompanyIdentifier.pacificLock.rawValue == 676)
        #expect(CompanyIdentifier.pacificLock.name == #"Pacific Lock Company"#)
        #expect(CompanyIdentifier.pacificLock.description == #"Pacific Lock Company"#)
    
        // Tendyron Corporation
        #expect(CompanyIdentifier.tendyron.rawValue == 677)
        #expect(CompanyIdentifier.tendyron.name == #"Tendyron Corporation"#)
        #expect(CompanyIdentifier.tendyron.description == #"Tendyron Corporation"#)
    
        // Robert Bosch GmbH
        #expect(CompanyIdentifier.robertBosch.rawValue == 678)
        #expect(CompanyIdentifier.robertBosch.name == #"Robert Bosch GmbH"#)
        #expect(CompanyIdentifier.robertBosch.description == #"Robert Bosch GmbH"#)
    
        // Illuxtron international B.V.
        #expect(CompanyIdentifier.illuxtronInternational.rawValue == 679)
        #expect(CompanyIdentifier.illuxtronInternational.name == #"Illuxtron international B.V."#)
        #expect(CompanyIdentifier.illuxtronInternational.description == #"Illuxtron international B.V."#)
    
        // miSport Ltd.
        #expect(CompanyIdentifier.misport.rawValue == 680)
        #expect(CompanyIdentifier.misport.name == #"miSport Ltd."#)
        #expect(CompanyIdentifier.misport.description == #"miSport Ltd."#)
    
        // Chargelib
        #expect(CompanyIdentifier.chargelib.rawValue == 681)
        #expect(CompanyIdentifier.chargelib.name == #"Chargelib"#)
        #expect(CompanyIdentifier.chargelib.description == #"Chargelib"#)
    
        // Doppler Lab
        #expect(CompanyIdentifier.dopplerLab.rawValue == 682)
        #expect(CompanyIdentifier.dopplerLab.name == #"Doppler Lab"#)
        #expect(CompanyIdentifier.dopplerLab.description == #"Doppler Lab"#)
    
        // BBPOS Limited
        #expect(CompanyIdentifier.bbpos.rawValue == 683)
        #expect(CompanyIdentifier.bbpos.name == #"BBPOS Limited"#)
        #expect(CompanyIdentifier.bbpos.description == #"BBPOS Limited"#)
    
        // RTB Elektronik GmbH & Co. KG
        #expect(CompanyIdentifier.rtbElektronik.rawValue == 684)
        #expect(CompanyIdentifier.rtbElektronik.name == #"RTB Elektronik GmbH & Co. KG"#)
        #expect(CompanyIdentifier.rtbElektronik.description == #"RTB Elektronik GmbH & Co. KG"#)
    
        // Rx Networks, Inc.
        #expect(CompanyIdentifier.rxNetworks.rawValue == 685)
        #expect(CompanyIdentifier.rxNetworks.name == #"Rx Networks, Inc."#)
        #expect(CompanyIdentifier.rxNetworks.description == #"Rx Networks, Inc."#)
    
        // WeatherFlow, Inc.
        #expect(CompanyIdentifier.weatherflow.rawValue == 686)
        #expect(CompanyIdentifier.weatherflow.name == #"WeatherFlow, Inc."#)
        #expect(CompanyIdentifier.weatherflow.description == #"WeatherFlow, Inc."#)
    
        // Technicolor USA Inc.
        #expect(CompanyIdentifier.technicolor.rawValue == 687)
        #expect(CompanyIdentifier.technicolor.name == #"Technicolor USA Inc."#)
        #expect(CompanyIdentifier.technicolor.description == #"Technicolor USA Inc."#)
    
        // Bestechnic(Shanghai),Ltd
        #expect(CompanyIdentifier.bestechnicShanghaiLtd.rawValue == 688)
        #expect(CompanyIdentifier.bestechnicShanghaiLtd.name == #"Bestechnic(Shanghai),Ltd"#)
        #expect(CompanyIdentifier.bestechnicShanghaiLtd.description == #"Bestechnic(Shanghai),Ltd"#)
    
        // Raden Inc
        #expect(CompanyIdentifier.raden.rawValue == 689)
        #expect(CompanyIdentifier.raden.name == #"Raden Inc"#)
        #expect(CompanyIdentifier.raden.description == #"Raden Inc"#)
    
        // Oura Health Oy
        #expect(CompanyIdentifier.ouraHealth.rawValue == 690)
        #expect(CompanyIdentifier.ouraHealth.name == #"Oura Health Oy"#)
        #expect(CompanyIdentifier.ouraHealth.description == #"Oura Health Oy"#)
    
        // CLABER S.P.A.
        #expect(CompanyIdentifier.claber.rawValue == 691)
        #expect(CompanyIdentifier.claber.name == #"CLABER S.P.A."#)
        #expect(CompanyIdentifier.claber.description == #"CLABER S.P.A."#)
    
        // Hyginex, Inc.
        #expect(CompanyIdentifier.hyginex.rawValue == 692)
        #expect(CompanyIdentifier.hyginex.name == #"Hyginex, Inc."#)
        #expect(CompanyIdentifier.hyginex.description == #"Hyginex, Inc."#)
    
        // HANSHIN ELECTRIC RAILWAY CO.,LTD.
        #expect(CompanyIdentifier.hanshinElectricRailway.rawValue == 693)
        #expect(CompanyIdentifier.hanshinElectricRailway.name == #"HANSHIN ELECTRIC RAILWAY CO.,LTD."#)
        #expect(CompanyIdentifier.hanshinElectricRailway.description == #"HANSHIN ELECTRIC RAILWAY CO.,LTD."#)
    
        // Schneider Electric
        #expect(CompanyIdentifier.schneiderElectric.rawValue == 694)
        #expect(CompanyIdentifier.schneiderElectric.name == #"Schneider Electric"#)
        #expect(CompanyIdentifier.schneiderElectric.description == #"Schneider Electric"#)
    
        // Oort Technologies LLC
        #expect(CompanyIdentifier.oortTechnologies.rawValue == 695)
        #expect(CompanyIdentifier.oortTechnologies.name == #"Oort Technologies LLC"#)
        #expect(CompanyIdentifier.oortTechnologies.description == #"Oort Technologies LLC"#)
    
        // Chrono Therapeutics
        #expect(CompanyIdentifier.chronoTherapeutics.rawValue == 696)
        #expect(CompanyIdentifier.chronoTherapeutics.name == #"Chrono Therapeutics"#)
        #expect(CompanyIdentifier.chronoTherapeutics.description == #"Chrono Therapeutics"#)
    
        // Rinnai Corporation
        #expect(CompanyIdentifier.rinnai.rawValue == 697)
        #expect(CompanyIdentifier.rinnai.name == #"Rinnai Corporation"#)
        #expect(CompanyIdentifier.rinnai.description == #"Rinnai Corporation"#)
    
        // Swissprime Technologies AG
        #expect(CompanyIdentifier.swissprimeTechnologies.rawValue == 698)
        #expect(CompanyIdentifier.swissprimeTechnologies.name == #"Swissprime Technologies AG"#)
        #expect(CompanyIdentifier.swissprimeTechnologies.description == #"Swissprime Technologies AG"#)
    
        // Koha.,Co.Ltd
        #expect(CompanyIdentifier.koha.rawValue == 699)
        #expect(CompanyIdentifier.koha.name == #"Koha.,Co.Ltd"#)
        #expect(CompanyIdentifier.koha.description == #"Koha.,Co.Ltd"#)
    
        // Genevac Ltd
        #expect(CompanyIdentifier.genevac.rawValue == 700)
        #expect(CompanyIdentifier.genevac.name == #"Genevac Ltd"#)
        #expect(CompanyIdentifier.genevac.description == #"Genevac Ltd"#)
    
        // Chemtronics
        #expect(CompanyIdentifier.chemtronics.rawValue == 701)
        #expect(CompanyIdentifier.chemtronics.name == #"Chemtronics"#)
        #expect(CompanyIdentifier.chemtronics.description == #"Chemtronics"#)
    
        // Seguro Technology Sp. z o.o.
        #expect(CompanyIdentifier.seguroTechnology.rawValue == 702)
        #expect(CompanyIdentifier.seguroTechnology.name == #"Seguro Technology Sp. z o.o."#)
        #expect(CompanyIdentifier.seguroTechnology.description == #"Seguro Technology Sp. z o.o."#)
    
        // Redbird Flight Simulations
        #expect(CompanyIdentifier.redbirdFlightSimulations.rawValue == 703)
        #expect(CompanyIdentifier.redbirdFlightSimulations.name == #"Redbird Flight Simulations"#)
        #expect(CompanyIdentifier.redbirdFlightSimulations.description == #"Redbird Flight Simulations"#)
    
        // Dash Robotics
        #expect(CompanyIdentifier.dashRobotics.rawValue == 704)
        #expect(CompanyIdentifier.dashRobotics.name == #"Dash Robotics"#)
        #expect(CompanyIdentifier.dashRobotics.description == #"Dash Robotics"#)
    
        // LINE Corporation
        #expect(CompanyIdentifier.line.rawValue == 705)
        #expect(CompanyIdentifier.line.name == #"LINE Corporation"#)
        #expect(CompanyIdentifier.line.description == #"LINE Corporation"#)
    
        // Guillemot Corporation
        #expect(CompanyIdentifier.guillemot.rawValue == 706)
        #expect(CompanyIdentifier.guillemot.name == #"Guillemot Corporation"#)
        #expect(CompanyIdentifier.guillemot.description == #"Guillemot Corporation"#)
    
        // Techtronic Power Tools Technology Limited
        #expect(CompanyIdentifier.techtronicPowerToolsTechnology.rawValue == 707)
        #expect(CompanyIdentifier.techtronicPowerToolsTechnology.name == #"Techtronic Power Tools Technology Limited"#)
        #expect(CompanyIdentifier.techtronicPowerToolsTechnology.description == #"Techtronic Power Tools Technology Limited"#)
    
        // Wilson Sporting Goods
        #expect(CompanyIdentifier.wilsonSportingGoods.rawValue == 708)
        #expect(CompanyIdentifier.wilsonSportingGoods.name == #"Wilson Sporting Goods"#)
        #expect(CompanyIdentifier.wilsonSportingGoods.description == #"Wilson Sporting Goods"#)
    
        // Lenovo (Singapore) Pte Ltd.
        #expect(CompanyIdentifier.lenovoSingaporePte.rawValue == 709)
        #expect(CompanyIdentifier.lenovoSingaporePte.name == #"Lenovo (Singapore) Pte Ltd."#)
        #expect(CompanyIdentifier.lenovoSingaporePte.description == #"Lenovo (Singapore) Pte Ltd."#)
    
        // Ayatan Sensors
        #expect(CompanyIdentifier.ayatanSensors.rawValue == 710)
        #expect(CompanyIdentifier.ayatanSensors.name == #"Ayatan Sensors"#)
        #expect(CompanyIdentifier.ayatanSensors.description == #"Ayatan Sensors"#)
    
        // Electronics Tomorrow Limited
        #expect(CompanyIdentifier.electronicsTomorrow.rawValue == 711)
        #expect(CompanyIdentifier.electronicsTomorrow.name == #"Electronics Tomorrow Limited"#)
        #expect(CompanyIdentifier.electronicsTomorrow.description == #"Electronics Tomorrow Limited"#)
    
        // OneSpan
        #expect(CompanyIdentifier.onespan.rawValue == 712)
        #expect(CompanyIdentifier.onespan.name == #"OneSpan"#)
        #expect(CompanyIdentifier.onespan.description == #"OneSpan"#)
    
        // PayRange Inc.
        #expect(CompanyIdentifier.payrange.rawValue == 713)
        #expect(CompanyIdentifier.payrange.name == #"PayRange Inc."#)
        #expect(CompanyIdentifier.payrange.description == #"PayRange Inc."#)
    
        // ABOV Semiconductor
        #expect(CompanyIdentifier.abovSemiconductor.rawValue == 714)
        #expect(CompanyIdentifier.abovSemiconductor.name == #"ABOV Semiconductor"#)
        #expect(CompanyIdentifier.abovSemiconductor.description == #"ABOV Semiconductor"#)
    
        // AINA-Wireless Inc.
        #expect(CompanyIdentifier.ainaWireless.rawValue == 715)
        #expect(CompanyIdentifier.ainaWireless.name == #"AINA-Wireless Inc."#)
        #expect(CompanyIdentifier.ainaWireless.description == #"AINA-Wireless Inc."#)
    
        // Eijkelkamp Soil & Water
        #expect(CompanyIdentifier.eijkelkampSoilWater.rawValue == 716)
        #expect(CompanyIdentifier.eijkelkampSoilWater.name == #"Eijkelkamp Soil & Water"#)
        #expect(CompanyIdentifier.eijkelkampSoilWater.description == #"Eijkelkamp Soil & Water"#)
    
        // BMA ergonomics b.v.
        #expect(CompanyIdentifier.bmaErgonomics.rawValue == 717)
        #expect(CompanyIdentifier.bmaErgonomics.name == #"BMA ergonomics b.v."#)
        #expect(CompanyIdentifier.bmaErgonomics.description == #"BMA ergonomics b.v."#)
    
        // Teva Branded Pharmaceutical Products R&D, Inc.
        #expect(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.rawValue == 718)
        #expect(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.name == #"Teva Branded Pharmaceutical Products R&D, Inc."#)
        #expect(CompanyIdentifier.tevaBrandedPharmaceuticalProductsRD.description == #"Teva Branded Pharmaceutical Products R&D, Inc."#)
    
        // Anima
        #expect(CompanyIdentifier.anima.rawValue == 719)
        #expect(CompanyIdentifier.anima.name == #"Anima"#)
        #expect(CompanyIdentifier.anima.description == #"Anima"#)
    
        // 3M
        #expect(CompanyIdentifier.company3M.rawValue == 720)
        #expect(CompanyIdentifier.company3M.name == #"3M"#)
        #expect(CompanyIdentifier.company3M.description == #"3M"#)
    
        // Empatica Srl
        #expect(CompanyIdentifier.empatica.rawValue == 721)
        #expect(CompanyIdentifier.empatica.name == #"Empatica Srl"#)
        #expect(CompanyIdentifier.empatica.description == #"Empatica Srl"#)
    
        // Afero, Inc.
        #expect(CompanyIdentifier.afero.rawValue == 722)
        #expect(CompanyIdentifier.afero.name == #"Afero, Inc."#)
        #expect(CompanyIdentifier.afero.description == #"Afero, Inc."#)
    
        // Powercast Corporation
        #expect(CompanyIdentifier.powercast.rawValue == 723)
        #expect(CompanyIdentifier.powercast.name == #"Powercast Corporation"#)
        #expect(CompanyIdentifier.powercast.description == #"Powercast Corporation"#)
    
        // Secuyou ApS
        #expect(CompanyIdentifier.secuyou.rawValue == 724)
        #expect(CompanyIdentifier.secuyou.name == #"Secuyou ApS"#)
        #expect(CompanyIdentifier.secuyou.description == #"Secuyou ApS"#)
    
        // OMRON Corporation
        #expect(CompanyIdentifier.omron.rawValue == 725)
        #expect(CompanyIdentifier.omron.name == #"OMRON Corporation"#)
        #expect(CompanyIdentifier.omron.description == #"OMRON Corporation"#)
    
        // Send Solutions
        #expect(CompanyIdentifier.sendSolutions.rawValue == 726)
        #expect(CompanyIdentifier.sendSolutions.name == #"Send Solutions"#)
        #expect(CompanyIdentifier.sendSolutions.description == #"Send Solutions"#)
    
        // NIPPON SYSTEMWARE CO.,LTD.
        #expect(CompanyIdentifier.nipponSystemware.rawValue == 727)
        #expect(CompanyIdentifier.nipponSystemware.name == #"NIPPON SYSTEMWARE CO.,LTD."#)
        #expect(CompanyIdentifier.nipponSystemware.description == #"NIPPON SYSTEMWARE CO.,LTD."#)
    
        // Neosfar
        #expect(CompanyIdentifier.neosfar.rawValue == 728)
        #expect(CompanyIdentifier.neosfar.name == #"Neosfar"#)
        #expect(CompanyIdentifier.neosfar.description == #"Neosfar"#)
    
        // Fliegl Agrartechnik GmbH
        #expect(CompanyIdentifier.flieglAgrartechnik.rawValue == 729)
        #expect(CompanyIdentifier.flieglAgrartechnik.name == #"Fliegl Agrartechnik GmbH"#)
        #expect(CompanyIdentifier.flieglAgrartechnik.description == #"Fliegl Agrartechnik GmbH"#)
    
        // Gilvader
        #expect(CompanyIdentifier.gilvader.rawValue == 730)
        #expect(CompanyIdentifier.gilvader.name == #"Gilvader"#)
        #expect(CompanyIdentifier.gilvader.description == #"Gilvader"#)
    
        // Digi International Inc (R)
        #expect(CompanyIdentifier.digiInternationalR.rawValue == 731)
        #expect(CompanyIdentifier.digiInternationalR.name == #"Digi International Inc (R)"#)
        #expect(CompanyIdentifier.digiInternationalR.description == #"Digi International Inc (R)"#)
    
        // DeWalch Technologies, Inc.
        #expect(CompanyIdentifier.dewalchTechnologies.rawValue == 732)
        #expect(CompanyIdentifier.dewalchTechnologies.name == #"DeWalch Technologies, Inc."#)
        #expect(CompanyIdentifier.dewalchTechnologies.description == #"DeWalch Technologies, Inc."#)
    
        // Flint Rehabilitation Devices, LLC
        #expect(CompanyIdentifier.flintRehabilitationDevices.rawValue == 733)
        #expect(CompanyIdentifier.flintRehabilitationDevices.name == #"Flint Rehabilitation Devices, LLC"#)
        #expect(CompanyIdentifier.flintRehabilitationDevices.description == #"Flint Rehabilitation Devices, LLC"#)
    
        // Samsung SDS Co., Ltd.
        #expect(CompanyIdentifier.samsungSds.rawValue == 734)
        #expect(CompanyIdentifier.samsungSds.name == #"Samsung SDS Co., Ltd."#)
        #expect(CompanyIdentifier.samsungSds.description == #"Samsung SDS Co., Ltd."#)
    
        // Blur Product Development
        #expect(CompanyIdentifier.blurProductDevelopment.rawValue == 735)
        #expect(CompanyIdentifier.blurProductDevelopment.name == #"Blur Product Development"#)
        #expect(CompanyIdentifier.blurProductDevelopment.description == #"Blur Product Development"#)
    
        // University of Michigan
        #expect(CompanyIdentifier.universityOfMichigan.rawValue == 736)
        #expect(CompanyIdentifier.universityOfMichigan.name == #"University of Michigan"#)
        #expect(CompanyIdentifier.universityOfMichigan.description == #"University of Michigan"#)
    
        // Victron Energy BV
        #expect(CompanyIdentifier.victronEnergy.rawValue == 737)
        #expect(CompanyIdentifier.victronEnergy.name == #"Victron Energy BV"#)
        #expect(CompanyIdentifier.victronEnergy.description == #"Victron Energy BV"#)
    
        // NTT docomo
        #expect(CompanyIdentifier.nttDocomo.rawValue == 738)
        #expect(CompanyIdentifier.nttDocomo.name == #"NTT docomo"#)
        #expect(CompanyIdentifier.nttDocomo.description == #"NTT docomo"#)
    
        // Carmanah Technologies Corp.
        #expect(CompanyIdentifier.carmanahTechnologies.rawValue == 739)
        #expect(CompanyIdentifier.carmanahTechnologies.name == #"Carmanah Technologies Corp."#)
        #expect(CompanyIdentifier.carmanahTechnologies.description == #"Carmanah Technologies Corp."#)
    
        // Bytestorm Ltd.
        #expect(CompanyIdentifier.bytestorm.rawValue == 740)
        #expect(CompanyIdentifier.bytestorm.name == #"Bytestorm Ltd."#)
        #expect(CompanyIdentifier.bytestorm.description == #"Bytestorm Ltd."#)
    
        // Espressif Systems (Shanghai) Co., Ltd.
        #expect(CompanyIdentifier.espressifSystemsShanghai.rawValue == 741)
        #expect(CompanyIdentifier.espressifSystemsShanghai.name == #"Espressif Systems (Shanghai) Co., Ltd."#)
        #expect(CompanyIdentifier.espressifSystemsShanghai.description == #"Espressif Systems (Shanghai) Co., Ltd."#)
    
        // Unwire
        #expect(CompanyIdentifier.unwire.rawValue == 742)
        #expect(CompanyIdentifier.unwire.name == #"Unwire"#)
        #expect(CompanyIdentifier.unwire.description == #"Unwire"#)
    
        // Connected Yard, Inc.
        #expect(CompanyIdentifier.connectedYard.rawValue == 743)
        #expect(CompanyIdentifier.connectedYard.name == #"Connected Yard, Inc."#)
        #expect(CompanyIdentifier.connectedYard.description == #"Connected Yard, Inc."#)
    
        // American Music Environments
        #expect(CompanyIdentifier.americanMusicEnvironments.rawValue == 744)
        #expect(CompanyIdentifier.americanMusicEnvironments.name == #"American Music Environments"#)
        #expect(CompanyIdentifier.americanMusicEnvironments.description == #"American Music Environments"#)
    
        // Sensogram Technologies, Inc.
        #expect(CompanyIdentifier.sensogramTechnologies.rawValue == 745)
        #expect(CompanyIdentifier.sensogramTechnologies.name == #"Sensogram Technologies, Inc."#)
        #expect(CompanyIdentifier.sensogramTechnologies.description == #"Sensogram Technologies, Inc."#)
    
        // Fujitsu Limited
        #expect(CompanyIdentifier.fujitsu.rawValue == 746)
        #expect(CompanyIdentifier.fujitsu.name == #"Fujitsu Limited"#)
        #expect(CompanyIdentifier.fujitsu.description == #"Fujitsu Limited"#)
    
        // Ardic Technology
        #expect(CompanyIdentifier.ardicTechnology.rawValue == 747)
        #expect(CompanyIdentifier.ardicTechnology.name == #"Ardic Technology"#)
        #expect(CompanyIdentifier.ardicTechnology.description == #"Ardic Technology"#)
    
        // Delta Systems, Inc
        #expect(CompanyIdentifier.deltaSystems.rawValue == 748)
        #expect(CompanyIdentifier.deltaSystems.name == #"Delta Systems, Inc"#)
        #expect(CompanyIdentifier.deltaSystems.description == #"Delta Systems, Inc"#)
    
        // HTC Corporation
        #expect(CompanyIdentifier.htc.rawValue == 749)
        #expect(CompanyIdentifier.htc.name == #"HTC Corporation"#)
        #expect(CompanyIdentifier.htc.description == #"HTC Corporation"#)
    
        // Citizen Holdings Co., Ltd.
        #expect(CompanyIdentifier.citizenHoldings.rawValue == 750)
        #expect(CompanyIdentifier.citizenHoldings.name == #"Citizen Holdings Co., Ltd."#)
        #expect(CompanyIdentifier.citizenHoldings.description == #"Citizen Holdings Co., Ltd."#)
    
        // SMART-INNOVATION.inc
        #expect(CompanyIdentifier.smartInnovationInc.rawValue == 751)
        #expect(CompanyIdentifier.smartInnovationInc.name == #"SMART-INNOVATION.inc"#)
        #expect(CompanyIdentifier.smartInnovationInc.description == #"SMART-INNOVATION.inc"#)
    
        // Blackrat Software
        #expect(CompanyIdentifier.blackratSoftware.rawValue == 752)
        #expect(CompanyIdentifier.blackratSoftware.name == #"Blackrat Software"#)
        #expect(CompanyIdentifier.blackratSoftware.description == #"Blackrat Software"#)
    
        // The Idea Cave, LLC
        #expect(CompanyIdentifier.ideaCave.rawValue == 753)
        #expect(CompanyIdentifier.ideaCave.name == #"The Idea Cave, LLC"#)
        #expect(CompanyIdentifier.ideaCave.description == #"The Idea Cave, LLC"#)
    
        // GoPro, Inc.
        #expect(CompanyIdentifier.gopro.rawValue == 754)
        #expect(CompanyIdentifier.gopro.name == #"GoPro, Inc."#)
        #expect(CompanyIdentifier.gopro.description == #"GoPro, Inc."#)
    
        // AuthAir, Inc
        #expect(CompanyIdentifier.authair.rawValue == 755)
        #expect(CompanyIdentifier.authair.name == #"AuthAir, Inc"#)
        #expect(CompanyIdentifier.authair.description == #"AuthAir, Inc"#)
    
        // Vensi, Inc.
        #expect(CompanyIdentifier.vensi.rawValue == 756)
        #expect(CompanyIdentifier.vensi.name == #"Vensi, Inc."#)
        #expect(CompanyIdentifier.vensi.description == #"Vensi, Inc."#)
    
        // Indagem Tech LLC
        #expect(CompanyIdentifier.indagemTech.rawValue == 757)
        #expect(CompanyIdentifier.indagemTech.name == #"Indagem Tech LLC"#)
        #expect(CompanyIdentifier.indagemTech.description == #"Indagem Tech LLC"#)
    
        // Intemo Technologies
        #expect(CompanyIdentifier.intemoTechnologies.rawValue == 758)
        #expect(CompanyIdentifier.intemoTechnologies.name == #"Intemo Technologies"#)
        #expect(CompanyIdentifier.intemoTechnologies.description == #"Intemo Technologies"#)
    
        // DreamVisions co., Ltd.
        #expect(CompanyIdentifier.dreamvisions.rawValue == 759)
        #expect(CompanyIdentifier.dreamvisions.name == #"DreamVisions co., Ltd."#)
        #expect(CompanyIdentifier.dreamvisions.description == #"DreamVisions co., Ltd."#)
    
        // Runteq Oy Ltd
        #expect(CompanyIdentifier.runteq.rawValue == 760)
        #expect(CompanyIdentifier.runteq.name == #"Runteq Oy Ltd"#)
        #expect(CompanyIdentifier.runteq.description == #"Runteq Oy Ltd"#)
    
        // IMAGINATION TECHNOLOGIES LTD
        #expect(CompanyIdentifier.imaginationTechnologies.rawValue == 761)
        #expect(CompanyIdentifier.imaginationTechnologies.name == #"IMAGINATION TECHNOLOGIES LTD"#)
        #expect(CompanyIdentifier.imaginationTechnologies.description == #"IMAGINATION TECHNOLOGIES LTD"#)
    
        // CoSTAR TEchnologies
        #expect(CompanyIdentifier.costarTechnologies.rawValue == 762)
        #expect(CompanyIdentifier.costarTechnologies.name == #"CoSTAR TEchnologies"#)
        #expect(CompanyIdentifier.costarTechnologies.description == #"CoSTAR TEchnologies"#)
    
        // Clarius Mobile Health Corp.
        #expect(CompanyIdentifier.clariusMobileHealth.rawValue == 763)
        #expect(CompanyIdentifier.clariusMobileHealth.name == #"Clarius Mobile Health Corp."#)
        #expect(CompanyIdentifier.clariusMobileHealth.description == #"Clarius Mobile Health Corp."#)
    
        // Shanghai Frequen Microelectronics Co., Ltd.
        #expect(CompanyIdentifier.shanghaiFrequenMicroelectronics.rawValue == 764)
        #expect(CompanyIdentifier.shanghaiFrequenMicroelectronics.name == #"Shanghai Frequen Microelectronics Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiFrequenMicroelectronics.description == #"Shanghai Frequen Microelectronics Co., Ltd."#)
    
        // Uwanna, Inc.
        #expect(CompanyIdentifier.uwanna.rawValue == 765)
        #expect(CompanyIdentifier.uwanna.name == #"Uwanna, Inc."#)
        #expect(CompanyIdentifier.uwanna.description == #"Uwanna, Inc."#)
    
        // Lierda Science & Technology Group Co., Ltd.
        #expect(CompanyIdentifier.lierdaScienceTechnologyGroup.rawValue == 766)
        #expect(CompanyIdentifier.lierdaScienceTechnologyGroup.name == #"Lierda Science & Technology Group Co., Ltd."#)
        #expect(CompanyIdentifier.lierdaScienceTechnologyGroup.description == #"Lierda Science & Technology Group Co., Ltd."#)
    
        // Silicon Laboratories
        #expect(CompanyIdentifier.siliconLaboratories.rawValue == 767)
        #expect(CompanyIdentifier.siliconLaboratories.name == #"Silicon Laboratories"#)
        #expect(CompanyIdentifier.siliconLaboratories.description == #"Silicon Laboratories"#)
    
        // World Moto Inc.
        #expect(CompanyIdentifier.worldMoto.rawValue == 768)
        #expect(CompanyIdentifier.worldMoto.name == #"World Moto Inc."#)
        #expect(CompanyIdentifier.worldMoto.description == #"World Moto Inc."#)
    
        // Giatec Scientific Inc.
        #expect(CompanyIdentifier.giatecScientific.rawValue == 769)
        #expect(CompanyIdentifier.giatecScientific.name == #"Giatec Scientific Inc."#)
        #expect(CompanyIdentifier.giatecScientific.description == #"Giatec Scientific Inc."#)
    
        // Loop Devices, Inc
        #expect(CompanyIdentifier.loopDevices.rawValue == 770)
        #expect(CompanyIdentifier.loopDevices.name == #"Loop Devices, Inc"#)
        #expect(CompanyIdentifier.loopDevices.description == #"Loop Devices, Inc"#)
    
        // IACA electronique
        #expect(CompanyIdentifier.iacaElectronique.rawValue == 771)
        #expect(CompanyIdentifier.iacaElectronique.name == #"IACA electronique"#)
        #expect(CompanyIdentifier.iacaElectronique.description == #"IACA electronique"#)
    
        // Oura Health Ltd
        #expect(CompanyIdentifier.ouraHealth2.rawValue == 772)
        #expect(CompanyIdentifier.ouraHealth2.name == #"Oura Health Ltd"#)
        #expect(CompanyIdentifier.ouraHealth2.description == #"Oura Health Ltd"#)
    
        // Swipp ApS
        #expect(CompanyIdentifier.swipp.rawValue == 773)
        #expect(CompanyIdentifier.swipp.name == #"Swipp ApS"#)
        #expect(CompanyIdentifier.swipp.description == #"Swipp ApS"#)
    
        // Life Laboratory Inc.
        #expect(CompanyIdentifier.lifeLaboratory.rawValue == 774)
        #expect(CompanyIdentifier.lifeLaboratory.name == #"Life Laboratory Inc."#)
        #expect(CompanyIdentifier.lifeLaboratory.description == #"Life Laboratory Inc."#)
    
        // FUJI INDUSTRIAL CO.,LTD.
        #expect(CompanyIdentifier.fujiIndustrial.rawValue == 775)
        #expect(CompanyIdentifier.fujiIndustrial.name == #"FUJI INDUSTRIAL CO.,LTD."#)
        #expect(CompanyIdentifier.fujiIndustrial.description == #"FUJI INDUSTRIAL CO.,LTD."#)
    
        // Surefire, LLC
        #expect(CompanyIdentifier.surefire.rawValue == 776)
        #expect(CompanyIdentifier.surefire.name == #"Surefire, LLC"#)
        #expect(CompanyIdentifier.surefire.description == #"Surefire, LLC"#)
    
        // Dolby Labs
        #expect(CompanyIdentifier.dolbyLabs.rawValue == 777)
        #expect(CompanyIdentifier.dolbyLabs.name == #"Dolby Labs"#)
        #expect(CompanyIdentifier.dolbyLabs.description == #"Dolby Labs"#)
    
        // Ellisys
        #expect(CompanyIdentifier.ellisys.rawValue == 778)
        #expect(CompanyIdentifier.ellisys.name == #"Ellisys"#)
        #expect(CompanyIdentifier.ellisys.description == #"Ellisys"#)
    
        // Magnitude Lighting Converters
        #expect(CompanyIdentifier.magnitudeLightingConverters.rawValue == 779)
        #expect(CompanyIdentifier.magnitudeLightingConverters.name == #"Magnitude Lighting Converters"#)
        #expect(CompanyIdentifier.magnitudeLightingConverters.description == #"Magnitude Lighting Converters"#)
    
        // Hilti AG
        #expect(CompanyIdentifier.hilti.rawValue == 780)
        #expect(CompanyIdentifier.hilti.name == #"Hilti AG"#)
        #expect(CompanyIdentifier.hilti.description == #"Hilti AG"#)
    
        // Devdata S.r.l.
        #expect(CompanyIdentifier.devdata.rawValue == 781)
        #expect(CompanyIdentifier.devdata.name == #"Devdata S.r.l."#)
        #expect(CompanyIdentifier.devdata.description == #"Devdata S.r.l."#)
    
        // Deviceworx
        #expect(CompanyIdentifier.deviceworx.rawValue == 782)
        #expect(CompanyIdentifier.deviceworx.name == #"Deviceworx"#)
        #expect(CompanyIdentifier.deviceworx.description == #"Deviceworx"#)
    
        // Shortcut Labs
        #expect(CompanyIdentifier.shortcutLabs.rawValue == 783)
        #expect(CompanyIdentifier.shortcutLabs.name == #"Shortcut Labs"#)
        #expect(CompanyIdentifier.shortcutLabs.description == #"Shortcut Labs"#)
    
        // SGL Italia S.r.l.
        #expect(CompanyIdentifier.sglItalia.rawValue == 784)
        #expect(CompanyIdentifier.sglItalia.name == #"SGL Italia S.r.l."#)
        #expect(CompanyIdentifier.sglItalia.description == #"SGL Italia S.r.l."#)
    
        // PEEQ DATA
        #expect(CompanyIdentifier.peeqData.rawValue == 785)
        #expect(CompanyIdentifier.peeqData.name == #"PEEQ DATA"#)
        #expect(CompanyIdentifier.peeqData.description == #"PEEQ DATA"#)
    
        // Ducere Technologies Pvt Ltd
        #expect(CompanyIdentifier.ducereTechnologiesPvt.rawValue == 786)
        #expect(CompanyIdentifier.ducereTechnologiesPvt.name == #"Ducere Technologies Pvt Ltd"#)
        #expect(CompanyIdentifier.ducereTechnologiesPvt.description == #"Ducere Technologies Pvt Ltd"#)
    
        // DiveNav, Inc.
        #expect(CompanyIdentifier.divenav.rawValue == 787)
        #expect(CompanyIdentifier.divenav.name == #"DiveNav, Inc."#)
        #expect(CompanyIdentifier.divenav.description == #"DiveNav, Inc."#)
    
        // RIIG AI Sp. z o.o.
        #expect(CompanyIdentifier.riigAi.rawValue == 788)
        #expect(CompanyIdentifier.riigAi.name == #"RIIG AI Sp. z o.o."#)
        #expect(CompanyIdentifier.riigAi.description == #"RIIG AI Sp. z o.o."#)
    
        // Thermo Fisher Scientific
        #expect(CompanyIdentifier.thermoFisherScientific.rawValue == 789)
        #expect(CompanyIdentifier.thermoFisherScientific.name == #"Thermo Fisher Scientific"#)
        #expect(CompanyIdentifier.thermoFisherScientific.description == #"Thermo Fisher Scientific"#)
    
        // AG Measurematics Pvt. Ltd.
        #expect(CompanyIdentifier.agMeasurematics.rawValue == 790)
        #expect(CompanyIdentifier.agMeasurematics.name == #"AG Measurematics Pvt. Ltd."#)
        #expect(CompanyIdentifier.agMeasurematics.description == #"AG Measurematics Pvt. Ltd."#)
    
        // CHUO Electronics CO., LTD.
        #expect(CompanyIdentifier.chuoElectronics.rawValue == 791)
        #expect(CompanyIdentifier.chuoElectronics.name == #"CHUO Electronics CO., LTD."#)
        #expect(CompanyIdentifier.chuoElectronics.description == #"CHUO Electronics CO., LTD."#)
    
        // Aspenta International
        #expect(CompanyIdentifier.aspentaInternational.rawValue == 792)
        #expect(CompanyIdentifier.aspentaInternational.name == #"Aspenta International"#)
        #expect(CompanyIdentifier.aspentaInternational.description == #"Aspenta International"#)
    
        // Eugster Frismag AG
        #expect(CompanyIdentifier.eugsterFrismag.rawValue == 793)
        #expect(CompanyIdentifier.eugsterFrismag.name == #"Eugster Frismag AG"#)
        #expect(CompanyIdentifier.eugsterFrismag.description == #"Eugster Frismag AG"#)
    
        // Wurth Elektronik eiSos GmbH & Co. KG
        #expect(CompanyIdentifier.wurthElektronikEisos.rawValue == 794)
        #expect(CompanyIdentifier.wurthElektronikEisos.name == #"Wurth Elektronik eiSos GmbH & Co. KG"#)
        #expect(CompanyIdentifier.wurthElektronikEisos.description == #"Wurth Elektronik eiSos GmbH & Co. KG"#)
    
        // HQ Inc
        #expect(CompanyIdentifier.hq.rawValue == 795)
        #expect(CompanyIdentifier.hq.name == #"HQ Inc"#)
        #expect(CompanyIdentifier.hq.description == #"HQ Inc"#)
    
        // Lab Sensor Solutions
        #expect(CompanyIdentifier.labSensorSolutions.rawValue == 796)
        #expect(CompanyIdentifier.labSensorSolutions.name == #"Lab Sensor Solutions"#)
        #expect(CompanyIdentifier.labSensorSolutions.description == #"Lab Sensor Solutions"#)
    
        // Enterlab ApS
        #expect(CompanyIdentifier.enterlab.rawValue == 797)
        #expect(CompanyIdentifier.enterlab.name == #"Enterlab ApS"#)
        #expect(CompanyIdentifier.enterlab.description == #"Enterlab ApS"#)
    
        // Eyefi, Inc.
        #expect(CompanyIdentifier.eyefi.rawValue == 798)
        #expect(CompanyIdentifier.eyefi.name == #"Eyefi, Inc."#)
        #expect(CompanyIdentifier.eyefi.description == #"Eyefi, Inc."#)
    
        // MetaSystem S.p.A.
        #expect(CompanyIdentifier.metasystem.rawValue == 799)
        #expect(CompanyIdentifier.metasystem.name == #"MetaSystem S.p.A."#)
        #expect(CompanyIdentifier.metasystem.description == #"MetaSystem S.p.A."#)
    
        // SONO ELECTRONICS. CO., LTD
        #expect(CompanyIdentifier.sonoElectronics.rawValue == 800)
        #expect(CompanyIdentifier.sonoElectronics.name == #"SONO ELECTRONICS. CO., LTD"#)
        #expect(CompanyIdentifier.sonoElectronics.description == #"SONO ELECTRONICS. CO., LTD"#)
    
        // Jewelbots
        #expect(CompanyIdentifier.jewelbots.rawValue == 801)
        #expect(CompanyIdentifier.jewelbots.name == #"Jewelbots"#)
        #expect(CompanyIdentifier.jewelbots.description == #"Jewelbots"#)
    
        // Compumedics Limited
        #expect(CompanyIdentifier.compumedics.rawValue == 802)
        #expect(CompanyIdentifier.compumedics.name == #"Compumedics Limited"#)
        #expect(CompanyIdentifier.compumedics.description == #"Compumedics Limited"#)
    
        // Rotor Bike Components
        #expect(CompanyIdentifier.rotorBikeComponents.rawValue == 803)
        #expect(CompanyIdentifier.rotorBikeComponents.name == #"Rotor Bike Components"#)
        #expect(CompanyIdentifier.rotorBikeComponents.description == #"Rotor Bike Components"#)
    
        // Astro, Inc.
        #expect(CompanyIdentifier.astro.rawValue == 804)
        #expect(CompanyIdentifier.astro.name == #"Astro, Inc."#)
        #expect(CompanyIdentifier.astro.description == #"Astro, Inc."#)
    
        // Amotus Solutions
        #expect(CompanyIdentifier.amotusSolutions.rawValue == 805)
        #expect(CompanyIdentifier.amotusSolutions.name == #"Amotus Solutions"#)
        #expect(CompanyIdentifier.amotusSolutions.description == #"Amotus Solutions"#)
    
        // Healthwear Technologies (Changzhou)Ltd
        #expect(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.rawValue == 806)
        #expect(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.name == #"Healthwear Technologies (Changzhou)Ltd"#)
        #expect(CompanyIdentifier.healthwearTechnologiesChangzhouLtd.description == #"Healthwear Technologies (Changzhou)Ltd"#)
    
        // Essex Electronics
        #expect(CompanyIdentifier.essexElectronics.rawValue == 807)
        #expect(CompanyIdentifier.essexElectronics.name == #"Essex Electronics"#)
        #expect(CompanyIdentifier.essexElectronics.description == #"Essex Electronics"#)
    
        // Grundfos A/S
        #expect(CompanyIdentifier.grundfos.rawValue == 808)
        #expect(CompanyIdentifier.grundfos.name == #"Grundfos A/S"#)
        #expect(CompanyIdentifier.grundfos.description == #"Grundfos A/S"#)
    
        // Eargo, Inc.
        #expect(CompanyIdentifier.eargo.rawValue == 809)
        #expect(CompanyIdentifier.eargo.name == #"Eargo, Inc."#)
        #expect(CompanyIdentifier.eargo.description == #"Eargo, Inc."#)
    
        // Electronic Design Lab
        #expect(CompanyIdentifier.electronicDesignLab.rawValue == 810)
        #expect(CompanyIdentifier.electronicDesignLab.name == #"Electronic Design Lab"#)
        #expect(CompanyIdentifier.electronicDesignLab.description == #"Electronic Design Lab"#)
    
        // ESYLUX
        #expect(CompanyIdentifier.esylux.rawValue == 811)
        #expect(CompanyIdentifier.esylux.name == #"ESYLUX"#)
        #expect(CompanyIdentifier.esylux.description == #"ESYLUX"#)
    
        // NIPPON SMT.CO.,Ltd
        #expect(CompanyIdentifier.nipponSmt.rawValue == 812)
        #expect(CompanyIdentifier.nipponSmt.name == #"NIPPON SMT.CO.,Ltd"#)
        #expect(CompanyIdentifier.nipponSmt.description == #"NIPPON SMT.CO.,Ltd"#)
    
        // BM innovations GmbH
        #expect(CompanyIdentifier.bmInnovations.rawValue == 813)
        #expect(CompanyIdentifier.bmInnovations.name == #"BM innovations GmbH"#)
        #expect(CompanyIdentifier.bmInnovations.description == #"BM innovations GmbH"#)
    
        // indoormap
        #expect(CompanyIdentifier.indoormap.rawValue == 814)
        #expect(CompanyIdentifier.indoormap.name == #"indoormap"#)
        #expect(CompanyIdentifier.indoormap.description == #"indoormap"#)
    
        // OttoQ Inc
        #expect(CompanyIdentifier.ottoq.rawValue == 815)
        #expect(CompanyIdentifier.ottoq.name == #"OttoQ Inc"#)
        #expect(CompanyIdentifier.ottoq.description == #"OttoQ Inc"#)
    
        // North Pole Engineering
        #expect(CompanyIdentifier.northPoleEngineering.rawValue == 816)
        #expect(CompanyIdentifier.northPoleEngineering.name == #"North Pole Engineering"#)
        #expect(CompanyIdentifier.northPoleEngineering.description == #"North Pole Engineering"#)
    
        // 3flares Technologies Inc.
        #expect(CompanyIdentifier.company3FlaresTechnologies.rawValue == 817)
        #expect(CompanyIdentifier.company3FlaresTechnologies.name == #"3flares Technologies Inc."#)
        #expect(CompanyIdentifier.company3FlaresTechnologies.description == #"3flares Technologies Inc."#)
    
        // Electrocompaniet A.S.
        #expect(CompanyIdentifier.electrocompaniet.rawValue == 818)
        #expect(CompanyIdentifier.electrocompaniet.name == #"Electrocompaniet A.S."#)
        #expect(CompanyIdentifier.electrocompaniet.description == #"Electrocompaniet A.S."#)
    
        // Mul-T-Lock
        #expect(CompanyIdentifier.mulTLock.rawValue == 819)
        #expect(CompanyIdentifier.mulTLock.name == #"Mul-T-Lock"#)
        #expect(CompanyIdentifier.mulTLock.description == #"Mul-T-Lock"#)
    
        // Airthings ASA
        #expect(CompanyIdentifier.airthings.rawValue == 820)
        #expect(CompanyIdentifier.airthings.name == #"Airthings ASA"#)
        #expect(CompanyIdentifier.airthings.description == #"Airthings ASA"#)
    
        // Enlighted Inc
        #expect(CompanyIdentifier.enlighted.rawValue == 821)
        #expect(CompanyIdentifier.enlighted.name == #"Enlighted Inc"#)
        #expect(CompanyIdentifier.enlighted.description == #"Enlighted Inc"#)
    
        // GISTIC
        #expect(CompanyIdentifier.gistic.rawValue == 822)
        #expect(CompanyIdentifier.gistic.name == #"GISTIC"#)
        #expect(CompanyIdentifier.gistic.description == #"GISTIC"#)
    
        // AJP2 Holdings, LLC
        #expect(CompanyIdentifier.ajp2Holdings.rawValue == 823)
        #expect(CompanyIdentifier.ajp2Holdings.name == #"AJP2 Holdings, LLC"#)
        #expect(CompanyIdentifier.ajp2Holdings.description == #"AJP2 Holdings, LLC"#)
    
        // COBI GmbH
        #expect(CompanyIdentifier.cobi.rawValue == 824)
        #expect(CompanyIdentifier.cobi.name == #"COBI GmbH"#)
        #expect(CompanyIdentifier.cobi.description == #"COBI GmbH"#)
    
        // Blue Sky Scientific, LLC
        #expect(CompanyIdentifier.blueSkyScientific2.rawValue == 825)
        #expect(CompanyIdentifier.blueSkyScientific2.name == #"Blue Sky Scientific, LLC"#)
        #expect(CompanyIdentifier.blueSkyScientific2.description == #"Blue Sky Scientific, LLC"#)
    
        // Appception, Inc.
        #expect(CompanyIdentifier.appception.rawValue == 826)
        #expect(CompanyIdentifier.appception.name == #"Appception, Inc."#)
        #expect(CompanyIdentifier.appception.description == #"Appception, Inc."#)
    
        // Courtney Thorne Limited
        #expect(CompanyIdentifier.courtneyThorne.rawValue == 827)
        #expect(CompanyIdentifier.courtneyThorne.name == #"Courtney Thorne Limited"#)
        #expect(CompanyIdentifier.courtneyThorne.description == #"Courtney Thorne Limited"#)
    
        // Virtuosys
        #expect(CompanyIdentifier.virtuosys.rawValue == 828)
        #expect(CompanyIdentifier.virtuosys.name == #"Virtuosys"#)
        #expect(CompanyIdentifier.virtuosys.description == #"Virtuosys"#)
    
        // TPV Technology Limited
        #expect(CompanyIdentifier.tpvTechnology.rawValue == 829)
        #expect(CompanyIdentifier.tpvTechnology.name == #"TPV Technology Limited"#)
        #expect(CompanyIdentifier.tpvTechnology.description == #"TPV Technology Limited"#)
    
        // Monitra SA
        #expect(CompanyIdentifier.monitra.rawValue == 830)
        #expect(CompanyIdentifier.monitra.name == #"Monitra SA"#)
        #expect(CompanyIdentifier.monitra.description == #"Monitra SA"#)
    
        // Automation Components, Inc.
        #expect(CompanyIdentifier.automationComponents.rawValue == 831)
        #expect(CompanyIdentifier.automationComponents.name == #"Automation Components, Inc."#)
        #expect(CompanyIdentifier.automationComponents.description == #"Automation Components, Inc."#)
    
        // Letsense s.r.l.
        #expect(CompanyIdentifier.letsense.rawValue == 832)
        #expect(CompanyIdentifier.letsense.name == #"Letsense s.r.l."#)
        #expect(CompanyIdentifier.letsense.description == #"Letsense s.r.l."#)
    
        // Etesian Technologies LLC
        #expect(CompanyIdentifier.etesianTechnologies.rawValue == 833)
        #expect(CompanyIdentifier.etesianTechnologies.name == #"Etesian Technologies LLC"#)
        #expect(CompanyIdentifier.etesianTechnologies.description == #"Etesian Technologies LLC"#)
    
        // GERTEC BRASIL LTDA.
        #expect(CompanyIdentifier.gertecBrasil.rawValue == 834)
        #expect(CompanyIdentifier.gertecBrasil.name == #"GERTEC BRASIL LTDA."#)
        #expect(CompanyIdentifier.gertecBrasil.description == #"GERTEC BRASIL LTDA."#)
    
        // Drekker Development Pty. Ltd.
        #expect(CompanyIdentifier.drekkerDevelopment.rawValue == 835)
        #expect(CompanyIdentifier.drekkerDevelopment.name == #"Drekker Development Pty. Ltd."#)
        #expect(CompanyIdentifier.drekkerDevelopment.description == #"Drekker Development Pty. Ltd."#)
    
        // Whirl Inc
        #expect(CompanyIdentifier.whirl.rawValue == 836)
        #expect(CompanyIdentifier.whirl.name == #"Whirl Inc"#)
        #expect(CompanyIdentifier.whirl.description == #"Whirl Inc"#)
    
        // Locus Positioning
        #expect(CompanyIdentifier.locusPositioning.rawValue == 837)
        #expect(CompanyIdentifier.locusPositioning.name == #"Locus Positioning"#)
        #expect(CompanyIdentifier.locusPositioning.description == #"Locus Positioning"#)
    
        // Acuity Brands Lighting, Inc
        #expect(CompanyIdentifier.acuityBrandsLighting.rawValue == 838)
        #expect(CompanyIdentifier.acuityBrandsLighting.name == #"Acuity Brands Lighting, Inc"#)
        #expect(CompanyIdentifier.acuityBrandsLighting.description == #"Acuity Brands Lighting, Inc"#)
    
        // Prevent Biometrics
        #expect(CompanyIdentifier.preventBiometrics.rawValue == 839)
        #expect(CompanyIdentifier.preventBiometrics.name == #"Prevent Biometrics"#)
        #expect(CompanyIdentifier.preventBiometrics.description == #"Prevent Biometrics"#)
    
        // Arioneo
        #expect(CompanyIdentifier.arioneo.rawValue == 840)
        #expect(CompanyIdentifier.arioneo.name == #"Arioneo"#)
        #expect(CompanyIdentifier.arioneo.description == #"Arioneo"#)
    
        // VersaMe
        #expect(CompanyIdentifier.versame.rawValue == 841)
        #expect(CompanyIdentifier.versame.name == #"VersaMe"#)
        #expect(CompanyIdentifier.versame.description == #"VersaMe"#)
    
        // Vaddio
        #expect(CompanyIdentifier.vaddio.rawValue == 842)
        #expect(CompanyIdentifier.vaddio.name == #"Vaddio"#)
        #expect(CompanyIdentifier.vaddio.description == #"Vaddio"#)
    
        // Libratone A/S
        #expect(CompanyIdentifier.libratone.rawValue == 843)
        #expect(CompanyIdentifier.libratone.name == #"Libratone A/S"#)
        #expect(CompanyIdentifier.libratone.description == #"Libratone A/S"#)
    
        // HM Electronics, Inc.
        #expect(CompanyIdentifier.hmElectronics.rawValue == 844)
        #expect(CompanyIdentifier.hmElectronics.name == #"HM Electronics, Inc."#)
        #expect(CompanyIdentifier.hmElectronics.description == #"HM Electronics, Inc."#)
    
        // TASER International, Inc.
        #expect(CompanyIdentifier.taserInternational.rawValue == 845)
        #expect(CompanyIdentifier.taserInternational.name == #"TASER International, Inc."#)
        #expect(CompanyIdentifier.taserInternational.description == #"TASER International, Inc."#)
    
        // SafeTrust Inc.
        #expect(CompanyIdentifier.safetrust.rawValue == 846)
        #expect(CompanyIdentifier.safetrust.name == #"SafeTrust Inc."#)
        #expect(CompanyIdentifier.safetrust.description == #"SafeTrust Inc."#)
    
        // Heartland Payment Systems
        #expect(CompanyIdentifier.heartlandPaymentSystems.rawValue == 847)
        #expect(CompanyIdentifier.heartlandPaymentSystems.name == #"Heartland Payment Systems"#)
        #expect(CompanyIdentifier.heartlandPaymentSystems.description == #"Heartland Payment Systems"#)
    
        // Bitstrata Systems Inc.
        #expect(CompanyIdentifier.bitstrataSystems.rawValue == 848)
        #expect(CompanyIdentifier.bitstrataSystems.name == #"Bitstrata Systems Inc."#)
        #expect(CompanyIdentifier.bitstrataSystems.description == #"Bitstrata Systems Inc."#)
    
        // Pieps GmbH
        #expect(CompanyIdentifier.pieps.rawValue == 849)
        #expect(CompanyIdentifier.pieps.name == #"Pieps GmbH"#)
        #expect(CompanyIdentifier.pieps.description == #"Pieps GmbH"#)
    
        // iRiding(Xiamen)Technology Co.,Ltd.
        #expect(CompanyIdentifier.iridingXiamenTechnology.rawValue == 850)
        #expect(CompanyIdentifier.iridingXiamenTechnology.name == #"iRiding(Xiamen)Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.iridingXiamenTechnology.description == #"iRiding(Xiamen)Technology Co.,Ltd."#)
    
        // Alpha Audiotronics, Inc.
        #expect(CompanyIdentifier.alphaAudiotronics.rawValue == 851)
        #expect(CompanyIdentifier.alphaAudiotronics.name == #"Alpha Audiotronics, Inc."#)
        #expect(CompanyIdentifier.alphaAudiotronics.description == #"Alpha Audiotronics, Inc."#)
    
        // TOPPAN FORMS CO.,LTD.
        #expect(CompanyIdentifier.toppanForms.rawValue == 852)
        #expect(CompanyIdentifier.toppanForms.name == #"TOPPAN FORMS CO.,LTD."#)
        #expect(CompanyIdentifier.toppanForms.description == #"TOPPAN FORMS CO.,LTD."#)
    
        // Sigma Designs, Inc.
        #expect(CompanyIdentifier.sigmaDesigns.rawValue == 853)
        #expect(CompanyIdentifier.sigmaDesigns.name == #"Sigma Designs, Inc."#)
        #expect(CompanyIdentifier.sigmaDesigns.description == #"Sigma Designs, Inc."#)
    
        // Spectrum Brands, Inc.
        #expect(CompanyIdentifier.spectrumBrands.rawValue == 854)
        #expect(CompanyIdentifier.spectrumBrands.name == #"Spectrum Brands, Inc."#)
        #expect(CompanyIdentifier.spectrumBrands.description == #"Spectrum Brands, Inc."#)
    
        // Polymap Wireless
        #expect(CompanyIdentifier.polymapWireless.rawValue == 855)
        #expect(CompanyIdentifier.polymapWireless.name == #"Polymap Wireless"#)
        #expect(CompanyIdentifier.polymapWireless.description == #"Polymap Wireless"#)
    
        // MagniWare Ltd.
        #expect(CompanyIdentifier.magniware.rawValue == 856)
        #expect(CompanyIdentifier.magniware.name == #"MagniWare Ltd."#)
        #expect(CompanyIdentifier.magniware.description == #"MagniWare Ltd."#)
    
        // Novotec Medical GmbH
        #expect(CompanyIdentifier.novotecMedical.rawValue == 857)
        #expect(CompanyIdentifier.novotecMedical.name == #"Novotec Medical GmbH"#)
        #expect(CompanyIdentifier.novotecMedical.description == #"Novotec Medical GmbH"#)
    
        // Phillips-Medisize A/S
        #expect(CompanyIdentifier.phillipsMedisize.rawValue == 858)
        #expect(CompanyIdentifier.phillipsMedisize.name == #"Phillips-Medisize A/S"#)
        #expect(CompanyIdentifier.phillipsMedisize.description == #"Phillips-Medisize A/S"#)
    
        // Matrix Inc.
        #expect(CompanyIdentifier.matrix.rawValue == 859)
        #expect(CompanyIdentifier.matrix.name == #"Matrix Inc."#)
        #expect(CompanyIdentifier.matrix.description == #"Matrix Inc."#)
    
        // Eaton Corporation
        #expect(CompanyIdentifier.eaton.rawValue == 860)
        #expect(CompanyIdentifier.eaton.name == #"Eaton Corporation"#)
        #expect(CompanyIdentifier.eaton.description == #"Eaton Corporation"#)
    
        // KYS
        #expect(CompanyIdentifier.kys.rawValue == 861)
        #expect(CompanyIdentifier.kys.name == #"KYS"#)
        #expect(CompanyIdentifier.kys.description == #"KYS"#)
    
        // Naya Health, Inc.
        #expect(CompanyIdentifier.nayaHealth.rawValue == 862)
        #expect(CompanyIdentifier.nayaHealth.name == #"Naya Health, Inc."#)
        #expect(CompanyIdentifier.nayaHealth.description == #"Naya Health, Inc."#)
    
        // Acromag
        #expect(CompanyIdentifier.acromag.rawValue == 863)
        #expect(CompanyIdentifier.acromag.name == #"Acromag"#)
        #expect(CompanyIdentifier.acromag.description == #"Acromag"#)
    
        // Insulet Corporation
        #expect(CompanyIdentifier.insulet.rawValue == 864)
        #expect(CompanyIdentifier.insulet.name == #"Insulet Corporation"#)
        #expect(CompanyIdentifier.insulet.description == #"Insulet Corporation"#)
    
        // Wellinks Inc.
        #expect(CompanyIdentifier.wellinks.rawValue == 865)
        #expect(CompanyIdentifier.wellinks.name == #"Wellinks Inc."#)
        #expect(CompanyIdentifier.wellinks.description == #"Wellinks Inc."#)
    
        // ON Semiconductor
        #expect(CompanyIdentifier.onSemiconductor.rawValue == 866)
        #expect(CompanyIdentifier.onSemiconductor.name == #"ON Semiconductor"#)
        #expect(CompanyIdentifier.onSemiconductor.description == #"ON Semiconductor"#)
    
        // FREELAP SA
        #expect(CompanyIdentifier.freelap.rawValue == 867)
        #expect(CompanyIdentifier.freelap.name == #"FREELAP SA"#)
        #expect(CompanyIdentifier.freelap.description == #"FREELAP SA"#)
    
        // Favero Electronics Srl
        #expect(CompanyIdentifier.faveroElectronics.rawValue == 868)
        #expect(CompanyIdentifier.faveroElectronics.name == #"Favero Electronics Srl"#)
        #expect(CompanyIdentifier.faveroElectronics.description == #"Favero Electronics Srl"#)
    
        // BioMech Sensor LLC
        #expect(CompanyIdentifier.biomechSensor.rawValue == 869)
        #expect(CompanyIdentifier.biomechSensor.name == #"BioMech Sensor LLC"#)
        #expect(CompanyIdentifier.biomechSensor.description == #"BioMech Sensor LLC"#)
    
        // BOLTT Sports technologies Private limited
        #expect(CompanyIdentifier.bolttSportsTechnologies.rawValue == 870)
        #expect(CompanyIdentifier.bolttSportsTechnologies.name == #"BOLTT Sports technologies Private limited"#)
        #expect(CompanyIdentifier.bolttSportsTechnologies.description == #"BOLTT Sports technologies Private limited"#)
    
        // Saphe International
        #expect(CompanyIdentifier.sapheInternational.rawValue == 871)
        #expect(CompanyIdentifier.sapheInternational.name == #"Saphe International"#)
        #expect(CompanyIdentifier.sapheInternational.description == #"Saphe International"#)
    
        // Metormote AB
        #expect(CompanyIdentifier.metormote.rawValue == 872)
        #expect(CompanyIdentifier.metormote.name == #"Metormote AB"#)
        #expect(CompanyIdentifier.metormote.description == #"Metormote AB"#)
    
        // littleBits
        #expect(CompanyIdentifier.littlebits.rawValue == 873)
        #expect(CompanyIdentifier.littlebits.name == #"littleBits"#)
        #expect(CompanyIdentifier.littlebits.description == #"littleBits"#)
    
        // SetPoint Medical
        #expect(CompanyIdentifier.setpointMedical.rawValue == 874)
        #expect(CompanyIdentifier.setpointMedical.name == #"SetPoint Medical"#)
        #expect(CompanyIdentifier.setpointMedical.description == #"SetPoint Medical"#)
    
        // BRControls Products BV
        #expect(CompanyIdentifier.brcontrolsProducts.rawValue == 875)
        #expect(CompanyIdentifier.brcontrolsProducts.name == #"BRControls Products BV"#)
        #expect(CompanyIdentifier.brcontrolsProducts.description == #"BRControls Products BV"#)
    
        // Zipcar
        #expect(CompanyIdentifier.zipcar.rawValue == 876)
        #expect(CompanyIdentifier.zipcar.name == #"Zipcar"#)
        #expect(CompanyIdentifier.zipcar.description == #"Zipcar"#)
    
        // AirBolt Pty Ltd
        #expect(CompanyIdentifier.airbolt.rawValue == 877)
        #expect(CompanyIdentifier.airbolt.name == #"AirBolt Pty Ltd"#)
        #expect(CompanyIdentifier.airbolt.description == #"AirBolt Pty Ltd"#)
    
        // MOTIVE TECHNOLOGIES, INC.
        #expect(CompanyIdentifier.motiveTechnologies.rawValue == 878)
        #expect(CompanyIdentifier.motiveTechnologies.name == #"MOTIVE TECHNOLOGIES, INC."#)
        #expect(CompanyIdentifier.motiveTechnologies.description == #"MOTIVE TECHNOLOGIES, INC."#)
    
        // Motiv, Inc.
        #expect(CompanyIdentifier.motiv.rawValue == 879)
        #expect(CompanyIdentifier.motiv.name == #"Motiv, Inc."#)
        #expect(CompanyIdentifier.motiv.description == #"Motiv, Inc."#)
    
        // Wazombi Labs OÜ
        #expect(CompanyIdentifier.wazombiLabsOu.rawValue == 880)
        #expect(CompanyIdentifier.wazombiLabsOu.name == #"Wazombi Labs OÜ"#)
        #expect(CompanyIdentifier.wazombiLabsOu.description == #"Wazombi Labs OÜ"#)
    
        // ORBCOMM
        #expect(CompanyIdentifier.orbcomm.rawValue == 881)
        #expect(CompanyIdentifier.orbcomm.name == #"ORBCOMM"#)
        #expect(CompanyIdentifier.orbcomm.description == #"ORBCOMM"#)
    
        // Nixie Labs, Inc.
        #expect(CompanyIdentifier.nixieLabs.rawValue == 882)
        #expect(CompanyIdentifier.nixieLabs.name == #"Nixie Labs, Inc."#)
        #expect(CompanyIdentifier.nixieLabs.description == #"Nixie Labs, Inc."#)
    
        // AppNearMe Ltd
        #expect(CompanyIdentifier.appnearme.rawValue == 883)
        #expect(CompanyIdentifier.appnearme.name == #"AppNearMe Ltd"#)
        #expect(CompanyIdentifier.appnearme.description == #"AppNearMe Ltd"#)
    
        // Holman Industries
        #expect(CompanyIdentifier.holmanIndustries.rawValue == 884)
        #expect(CompanyIdentifier.holmanIndustries.name == #"Holman Industries"#)
        #expect(CompanyIdentifier.holmanIndustries.description == #"Holman Industries"#)
    
        // Expain AS
        #expect(CompanyIdentifier.expain.rawValue == 885)
        #expect(CompanyIdentifier.expain.name == #"Expain AS"#)
        #expect(CompanyIdentifier.expain.description == #"Expain AS"#)
    
        // Electronic Temperature Instruments Ltd
        #expect(CompanyIdentifier.electronicTemperatureInstruments.rawValue == 886)
        #expect(CompanyIdentifier.electronicTemperatureInstruments.name == #"Electronic Temperature Instruments Ltd"#)
        #expect(CompanyIdentifier.electronicTemperatureInstruments.description == #"Electronic Temperature Instruments Ltd"#)
    
        // Plejd AB
        #expect(CompanyIdentifier.plejd.rawValue == 887)
        #expect(CompanyIdentifier.plejd.name == #"Plejd AB"#)
        #expect(CompanyIdentifier.plejd.description == #"Plejd AB"#)
    
        // Propeller Health
        #expect(CompanyIdentifier.propellerHealth.rawValue == 888)
        #expect(CompanyIdentifier.propellerHealth.name == #"Propeller Health"#)
        #expect(CompanyIdentifier.propellerHealth.description == #"Propeller Health"#)
    
        // Shenzhen iMCO Electronic Technology Co.,Ltd
        #expect(CompanyIdentifier.shenzhenImcoElectronicTechnology.rawValue == 889)
        #expect(CompanyIdentifier.shenzhenImcoElectronicTechnology.name == #"Shenzhen iMCO Electronic Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenImcoElectronicTechnology.description == #"Shenzhen iMCO Electronic Technology Co.,Ltd"#)
    
        // Algoria
        #expect(CompanyIdentifier.algoria.rawValue == 890)
        #expect(CompanyIdentifier.algoria.name == #"Algoria"#)
        #expect(CompanyIdentifier.algoria.description == #"Algoria"#)
    
        // Apption Labs Inc.
        #expect(CompanyIdentifier.apptionLabs.rawValue == 891)
        #expect(CompanyIdentifier.apptionLabs.name == #"Apption Labs Inc."#)
        #expect(CompanyIdentifier.apptionLabs.description == #"Apption Labs Inc."#)
    
        // Cronologics Corporation
        #expect(CompanyIdentifier.cronologics.rawValue == 892)
        #expect(CompanyIdentifier.cronologics.name == #"Cronologics Corporation"#)
        #expect(CompanyIdentifier.cronologics.description == #"Cronologics Corporation"#)
    
        // MICRODIA Ltd.
        #expect(CompanyIdentifier.microdia.rawValue == 893)
        #expect(CompanyIdentifier.microdia.name == #"MICRODIA Ltd."#)
        #expect(CompanyIdentifier.microdia.description == #"MICRODIA Ltd."#)
    
        // lulabytes S.L.
        #expect(CompanyIdentifier.lulabytes.rawValue == 894)
        #expect(CompanyIdentifier.lulabytes.name == #"lulabytes S.L."#)
        #expect(CompanyIdentifier.lulabytes.description == #"lulabytes S.L."#)
    
        // Société des Produits Nestlé S.A.
        #expect(CompanyIdentifier.societeDesProduitsNestle.rawValue == 895)
        #expect(CompanyIdentifier.societeDesProduitsNestle.name == #"Société des Produits Nestlé S.A."#)
        #expect(CompanyIdentifier.societeDesProduitsNestle.description == #"Société des Produits Nestlé S.A."#)
    
        // LLC "MEGA-F service"
        #expect(CompanyIdentifier.megaFService.rawValue == 896)
        #expect(CompanyIdentifier.megaFService.name == #"LLC "MEGA-F service""#)
        #expect(CompanyIdentifier.megaFService.description == #"LLC "MEGA-F service""#)
    
        // Sharp Corporation
        #expect(CompanyIdentifier.sharp.rawValue == 897)
        #expect(CompanyIdentifier.sharp.name == #"Sharp Corporation"#)
        #expect(CompanyIdentifier.sharp.description == #"Sharp Corporation"#)
    
        // Precision Outcomes Ltd
        #expect(CompanyIdentifier.precisionOutcomes.rawValue == 898)
        #expect(CompanyIdentifier.precisionOutcomes.name == #"Precision Outcomes Ltd"#)
        #expect(CompanyIdentifier.precisionOutcomes.description == #"Precision Outcomes Ltd"#)
    
        // Kronos Incorporated
        #expect(CompanyIdentifier.kronos.rawValue == 899)
        #expect(CompanyIdentifier.kronos.name == #"Kronos Incorporated"#)
        #expect(CompanyIdentifier.kronos.description == #"Kronos Incorporated"#)
    
        // OCOSMOS Co., Ltd.
        #expect(CompanyIdentifier.ocosmos.rawValue == 900)
        #expect(CompanyIdentifier.ocosmos.name == #"OCOSMOS Co., Ltd."#)
        #expect(CompanyIdentifier.ocosmos.description == #"OCOSMOS Co., Ltd."#)
    
        // Embedded Electronic Solutions Ltd. dba e2Solutions
        #expect(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.rawValue == 901)
        #expect(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.name == #"Embedded Electronic Solutions Ltd. dba e2Solutions"#)
        #expect(CompanyIdentifier.embeddedElectronicSolutionsDbaE2Solutions.description == #"Embedded Electronic Solutions Ltd. dba e2Solutions"#)
    
        // Aterica Inc.
        #expect(CompanyIdentifier.aterica.rawValue == 902)
        #expect(CompanyIdentifier.aterica.name == #"Aterica Inc."#)
        #expect(CompanyIdentifier.aterica.description == #"Aterica Inc."#)
    
        // BluStor PMC, Inc.
        #expect(CompanyIdentifier.blustorPmc.rawValue == 903)
        #expect(CompanyIdentifier.blustorPmc.name == #"BluStor PMC, Inc."#)
        #expect(CompanyIdentifier.blustorPmc.description == #"BluStor PMC, Inc."#)
    
        // Kapsch TrafficCom AB
        #expect(CompanyIdentifier.kapschTrafficcom.rawValue == 904)
        #expect(CompanyIdentifier.kapschTrafficcom.name == #"Kapsch TrafficCom AB"#)
        #expect(CompanyIdentifier.kapschTrafficcom.description == #"Kapsch TrafficCom AB"#)
    
        // ActiveBlu Corporation
        #expect(CompanyIdentifier.activeblu.rawValue == 905)
        #expect(CompanyIdentifier.activeblu.name == #"ActiveBlu Corporation"#)
        #expect(CompanyIdentifier.activeblu.description == #"ActiveBlu Corporation"#)
    
        // Kohler Mira Limited
        #expect(CompanyIdentifier.kohlerMira.rawValue == 906)
        #expect(CompanyIdentifier.kohlerMira.name == #"Kohler Mira Limited"#)
        #expect(CompanyIdentifier.kohlerMira.description == #"Kohler Mira Limited"#)
    
        // Noke
        #expect(CompanyIdentifier.noke.rawValue == 907)
        #expect(CompanyIdentifier.noke.name == #"Noke"#)
        #expect(CompanyIdentifier.noke.description == #"Noke"#)
    
        // Appion Inc.
        #expect(CompanyIdentifier.appion.rawValue == 908)
        #expect(CompanyIdentifier.appion.name == #"Appion Inc."#)
        #expect(CompanyIdentifier.appion.description == #"Appion Inc."#)
    
        // Resmed Ltd
        #expect(CompanyIdentifier.resmed.rawValue == 909)
        #expect(CompanyIdentifier.resmed.name == #"Resmed Ltd"#)
        #expect(CompanyIdentifier.resmed.description == #"Resmed Ltd"#)
    
        // Crownstone B.V.
        #expect(CompanyIdentifier.crownstone.rawValue == 910)
        #expect(CompanyIdentifier.crownstone.name == #"Crownstone B.V."#)
        #expect(CompanyIdentifier.crownstone.description == #"Crownstone B.V."#)
    
        // Xiaomi Inc.
        #expect(CompanyIdentifier.xiaomi.rawValue == 911)
        #expect(CompanyIdentifier.xiaomi.name == #"Xiaomi Inc."#)
        #expect(CompanyIdentifier.xiaomi.description == #"Xiaomi Inc."#)
    
        // INFOTECH s.r.o.
        #expect(CompanyIdentifier.infotech.rawValue == 912)
        #expect(CompanyIdentifier.infotech.name == #"INFOTECH s.r.o."#)
        #expect(CompanyIdentifier.infotech.description == #"INFOTECH s.r.o."#)
    
        // Thingsquare AB
        #expect(CompanyIdentifier.thingsquare.rawValue == 913)
        #expect(CompanyIdentifier.thingsquare.name == #"Thingsquare AB"#)
        #expect(CompanyIdentifier.thingsquare.description == #"Thingsquare AB"#)
    
        // T&D
        #expect(CompanyIdentifier.tD.rawValue == 914)
        #expect(CompanyIdentifier.tD.name == #"T&D"#)
        #expect(CompanyIdentifier.tD.description == #"T&D"#)
    
        // LAVAZZA S.p.A.
        #expect(CompanyIdentifier.lavazza.rawValue == 915)
        #expect(CompanyIdentifier.lavazza.name == #"LAVAZZA S.p.A."#)
        #expect(CompanyIdentifier.lavazza.description == #"LAVAZZA S.p.A."#)
    
        // Netclearance Systems, Inc.
        #expect(CompanyIdentifier.netclearanceSystems.rawValue == 916)
        #expect(CompanyIdentifier.netclearanceSystems.name == #"Netclearance Systems, Inc."#)
        #expect(CompanyIdentifier.netclearanceSystems.description == #"Netclearance Systems, Inc."#)
    
        // SDATAWAY
        #expect(CompanyIdentifier.sdataway.rawValue == 917)
        #expect(CompanyIdentifier.sdataway.name == #"SDATAWAY"#)
        #expect(CompanyIdentifier.sdataway.description == #"SDATAWAY"#)
    
        // BLOKS GmbH
        #expect(CompanyIdentifier.bloks.rawValue == 918)
        #expect(CompanyIdentifier.bloks.name == #"BLOKS GmbH"#)
        #expect(CompanyIdentifier.bloks.description == #"BLOKS GmbH"#)
    
        // LEGO System A/S
        #expect(CompanyIdentifier.legoSystem.rawValue == 919)
        #expect(CompanyIdentifier.legoSystem.name == #"LEGO System A/S"#)
        #expect(CompanyIdentifier.legoSystem.description == #"LEGO System A/S"#)
    
        // Thetatronics Ltd
        #expect(CompanyIdentifier.thetatronics.rawValue == 920)
        #expect(CompanyIdentifier.thetatronics.name == #"Thetatronics Ltd"#)
        #expect(CompanyIdentifier.thetatronics.description == #"Thetatronics Ltd"#)
    
        // Nikon Corporation
        #expect(CompanyIdentifier.nikon.rawValue == 921)
        #expect(CompanyIdentifier.nikon.name == #"Nikon Corporation"#)
        #expect(CompanyIdentifier.nikon.description == #"Nikon Corporation"#)
    
        // NeST
        #expect(CompanyIdentifier.nest.rawValue == 922)
        #expect(CompanyIdentifier.nest.name == #"NeST"#)
        #expect(CompanyIdentifier.nest.description == #"NeST"#)
    
        // South Silicon Valley Microelectronics
        #expect(CompanyIdentifier.southSiliconValleyMicroelectronics.rawValue == 923)
        #expect(CompanyIdentifier.southSiliconValleyMicroelectronics.name == #"South Silicon Valley Microelectronics"#)
        #expect(CompanyIdentifier.southSiliconValleyMicroelectronics.description == #"South Silicon Valley Microelectronics"#)
    
        // ALE International
        #expect(CompanyIdentifier.aleInternational.rawValue == 924)
        #expect(CompanyIdentifier.aleInternational.name == #"ALE International"#)
        #expect(CompanyIdentifier.aleInternational.description == #"ALE International"#)
    
        // CareView Communications, Inc.
        #expect(CompanyIdentifier.careviewCommunications.rawValue == 925)
        #expect(CompanyIdentifier.careviewCommunications.name == #"CareView Communications, Inc."#)
        #expect(CompanyIdentifier.careviewCommunications.description == #"CareView Communications, Inc."#)
    
        // SchoolBoard Limited
        #expect(CompanyIdentifier.schoolboard.rawValue == 926)
        #expect(CompanyIdentifier.schoolboard.name == #"SchoolBoard Limited"#)
        #expect(CompanyIdentifier.schoolboard.description == #"SchoolBoard Limited"#)
    
        // Molex Corporation
        #expect(CompanyIdentifier.molex.rawValue == 927)
        #expect(CompanyIdentifier.molex.name == #"Molex Corporation"#)
        #expect(CompanyIdentifier.molex.description == #"Molex Corporation"#)
    
        // IVT Wireless Limited
        #expect(CompanyIdentifier.ivtWireless.rawValue == 928)
        #expect(CompanyIdentifier.ivtWireless.name == #"IVT Wireless Limited"#)
        #expect(CompanyIdentifier.ivtWireless.description == #"IVT Wireless Limited"#)
    
        // Alpine Labs LLC
        #expect(CompanyIdentifier.alpineLabs.rawValue == 929)
        #expect(CompanyIdentifier.alpineLabs.name == #"Alpine Labs LLC"#)
        #expect(CompanyIdentifier.alpineLabs.description == #"Alpine Labs LLC"#)
    
        // Candura Instruments
        #expect(CompanyIdentifier.canduraInstruments.rawValue == 930)
        #expect(CompanyIdentifier.canduraInstruments.name == #"Candura Instruments"#)
        #expect(CompanyIdentifier.canduraInstruments.description == #"Candura Instruments"#)
    
        // SmartMovt Technology Co., Ltd
        #expect(CompanyIdentifier.smartmovtTechnology.rawValue == 931)
        #expect(CompanyIdentifier.smartmovtTechnology.name == #"SmartMovt Technology Co., Ltd"#)
        #expect(CompanyIdentifier.smartmovtTechnology.description == #"SmartMovt Technology Co., Ltd"#)
    
        // Token Zero Ltd
        #expect(CompanyIdentifier.tokenZero.rawValue == 932)
        #expect(CompanyIdentifier.tokenZero.name == #"Token Zero Ltd"#)
        #expect(CompanyIdentifier.tokenZero.description == #"Token Zero Ltd"#)
    
        // ACE CAD Enterprise Co., Ltd. (ACECAD)
        #expect(CompanyIdentifier.aceCadEnterpriseAcecad.rawValue == 933)
        #expect(CompanyIdentifier.aceCadEnterpriseAcecad.name == #"ACE CAD Enterprise Co., Ltd. (ACECAD)"#)
        #expect(CompanyIdentifier.aceCadEnterpriseAcecad.description == #"ACE CAD Enterprise Co., Ltd. (ACECAD)"#)
    
        // Medela, Inc
        #expect(CompanyIdentifier.medela.rawValue == 934)
        #expect(CompanyIdentifier.medela.name == #"Medela, Inc"#)
        #expect(CompanyIdentifier.medela.description == #"Medela, Inc"#)
    
        // AeroScout
        #expect(CompanyIdentifier.aeroscout.rawValue == 935)
        #expect(CompanyIdentifier.aeroscout.name == #"AeroScout"#)
        #expect(CompanyIdentifier.aeroscout.description == #"AeroScout"#)
    
        // Esrille Inc.
        #expect(CompanyIdentifier.esrille.rawValue == 936)
        #expect(CompanyIdentifier.esrille.name == #"Esrille Inc."#)
        #expect(CompanyIdentifier.esrille.description == #"Esrille Inc."#)
    
        // THINKERLY SRL
        #expect(CompanyIdentifier.thinkerly.rawValue == 937)
        #expect(CompanyIdentifier.thinkerly.name == #"THINKERLY SRL"#)
        #expect(CompanyIdentifier.thinkerly.description == #"THINKERLY SRL"#)
    
        // Exon Sp. z o.o.
        #expect(CompanyIdentifier.exon.rawValue == 938)
        #expect(CompanyIdentifier.exon.name == #"Exon Sp. z o.o."#)
        #expect(CompanyIdentifier.exon.description == #"Exon Sp. z o.o."#)
    
        // Meizu Technology Co., Ltd.
        #expect(CompanyIdentifier.meizuTechnology.rawValue == 939)
        #expect(CompanyIdentifier.meizuTechnology.name == #"Meizu Technology Co., Ltd."#)
        #expect(CompanyIdentifier.meizuTechnology.description == #"Meizu Technology Co., Ltd."#)
    
        // Smablo LTD
        #expect(CompanyIdentifier.smablo.rawValue == 940)
        #expect(CompanyIdentifier.smablo.name == #"Smablo LTD"#)
        #expect(CompanyIdentifier.smablo.description == #"Smablo LTD"#)
    
        // XiQ
        #expect(CompanyIdentifier.xiq.rawValue == 941)
        #expect(CompanyIdentifier.xiq.name == #"XiQ"#)
        #expect(CompanyIdentifier.xiq.description == #"XiQ"#)
    
        // Allswell Inc.
        #expect(CompanyIdentifier.allswell.rawValue == 942)
        #expect(CompanyIdentifier.allswell.name == #"Allswell Inc."#)
        #expect(CompanyIdentifier.allswell.description == #"Allswell Inc."#)
    
        // Comm-N-Sense Corp DBA Verigo
        #expect(CompanyIdentifier.commNSenseDbaVerigo.rawValue == 943)
        #expect(CompanyIdentifier.commNSenseDbaVerigo.name == #"Comm-N-Sense Corp DBA Verigo"#)
        #expect(CompanyIdentifier.commNSenseDbaVerigo.description == #"Comm-N-Sense Corp DBA Verigo"#)
    
        // VIBRADORM GmbH
        #expect(CompanyIdentifier.vibradorm.rawValue == 944)
        #expect(CompanyIdentifier.vibradorm.name == #"VIBRADORM GmbH"#)
        #expect(CompanyIdentifier.vibradorm.description == #"VIBRADORM GmbH"#)
    
        // Otodata Wireless Network Inc.
        #expect(CompanyIdentifier.otodataWirelessNetwork.rawValue == 945)
        #expect(CompanyIdentifier.otodataWirelessNetwork.name == #"Otodata Wireless Network Inc."#)
        #expect(CompanyIdentifier.otodataWirelessNetwork.description == #"Otodata Wireless Network Inc."#)
    
        // Propagation Systems Limited
        #expect(CompanyIdentifier.propagationSystems.rawValue == 946)
        #expect(CompanyIdentifier.propagationSystems.name == #"Propagation Systems Limited"#)
        #expect(CompanyIdentifier.propagationSystems.description == #"Propagation Systems Limited"#)
    
        // Midwest Instruments & Controls
        #expect(CompanyIdentifier.midwestInstrumentsControls.rawValue == 947)
        #expect(CompanyIdentifier.midwestInstrumentsControls.name == #"Midwest Instruments & Controls"#)
        #expect(CompanyIdentifier.midwestInstrumentsControls.description == #"Midwest Instruments & Controls"#)
    
        // Alpha Nodus, inc.
        #expect(CompanyIdentifier.alphaNodus.rawValue == 948)
        #expect(CompanyIdentifier.alphaNodus.name == #"Alpha Nodus, inc."#)
        #expect(CompanyIdentifier.alphaNodus.description == #"Alpha Nodus, inc."#)
    
        // petPOMM, Inc
        #expect(CompanyIdentifier.petpomm.rawValue == 949)
        #expect(CompanyIdentifier.petpomm.name == #"petPOMM, Inc"#)
        #expect(CompanyIdentifier.petpomm.description == #"petPOMM, Inc"#)
    
        // Mattel
        #expect(CompanyIdentifier.mattel.rawValue == 950)
        #expect(CompanyIdentifier.mattel.name == #"Mattel"#)
        #expect(CompanyIdentifier.mattel.description == #"Mattel"#)
    
        // Airbly Inc.
        #expect(CompanyIdentifier.airbly.rawValue == 951)
        #expect(CompanyIdentifier.airbly.name == #"Airbly Inc."#)
        #expect(CompanyIdentifier.airbly.description == #"Airbly Inc."#)
    
        // A-Safe Limited
        #expect(CompanyIdentifier.aSafe.rawValue == 952)
        #expect(CompanyIdentifier.aSafe.name == #"A-Safe Limited"#)
        #expect(CompanyIdentifier.aSafe.description == #"A-Safe Limited"#)
    
        // FREDERIQUE CONSTANT SA
        #expect(CompanyIdentifier.frederiqueConstant.rawValue == 953)
        #expect(CompanyIdentifier.frederiqueConstant.name == #"FREDERIQUE CONSTANT SA"#)
        #expect(CompanyIdentifier.frederiqueConstant.description == #"FREDERIQUE CONSTANT SA"#)
    
        // Maxscend Microelectronics Company Limited
        #expect(CompanyIdentifier.maxscendMicroelectronics.rawValue == 954)
        #expect(CompanyIdentifier.maxscendMicroelectronics.name == #"Maxscend Microelectronics Company Limited"#)
        #expect(CompanyIdentifier.maxscendMicroelectronics.description == #"Maxscend Microelectronics Company Limited"#)
    
        // Abbott
        #expect(CompanyIdentifier.abbott.rawValue == 955)
        #expect(CompanyIdentifier.abbott.name == #"Abbott"#)
        #expect(CompanyIdentifier.abbott.description == #"Abbott"#)
    
        // ASB Bank Ltd
        #expect(CompanyIdentifier.asbBank.rawValue == 956)
        #expect(CompanyIdentifier.asbBank.name == #"ASB Bank Ltd"#)
        #expect(CompanyIdentifier.asbBank.description == #"ASB Bank Ltd"#)
    
        // amadas
        #expect(CompanyIdentifier.amadas.rawValue == 957)
        #expect(CompanyIdentifier.amadas.name == #"amadas"#)
        #expect(CompanyIdentifier.amadas.description == #"amadas"#)
    
        // Applied Science, Inc.
        #expect(CompanyIdentifier.appliedScience.rawValue == 958)
        #expect(CompanyIdentifier.appliedScience.name == #"Applied Science, Inc."#)
        #expect(CompanyIdentifier.appliedScience.description == #"Applied Science, Inc."#)
    
        // iLumi Solutions Inc.
        #expect(CompanyIdentifier.ilumiSolutions.rawValue == 959)
        #expect(CompanyIdentifier.ilumiSolutions.name == #"iLumi Solutions Inc."#)
        #expect(CompanyIdentifier.ilumiSolutions.description == #"iLumi Solutions Inc."#)
    
        // Arch Systems Inc.
        #expect(CompanyIdentifier.archSystems.rawValue == 960)
        #expect(CompanyIdentifier.archSystems.name == #"Arch Systems Inc."#)
        #expect(CompanyIdentifier.archSystems.description == #"Arch Systems Inc."#)
    
        // Ember Technologies, Inc.
        #expect(CompanyIdentifier.emberTechnologies.rawValue == 961)
        #expect(CompanyIdentifier.emberTechnologies.name == #"Ember Technologies, Inc."#)
        #expect(CompanyIdentifier.emberTechnologies.description == #"Ember Technologies, Inc."#)
    
        // Snapchat Inc
        #expect(CompanyIdentifier.snapchat.rawValue == 962)
        #expect(CompanyIdentifier.snapchat.name == #"Snapchat Inc"#)
        #expect(CompanyIdentifier.snapchat.description == #"Snapchat Inc"#)
    
        // Casambi Technologies Oy
        #expect(CompanyIdentifier.casambiTechnologies.rawValue == 963)
        #expect(CompanyIdentifier.casambiTechnologies.name == #"Casambi Technologies Oy"#)
        #expect(CompanyIdentifier.casambiTechnologies.description == #"Casambi Technologies Oy"#)
    
        // Pico Technology Inc.
        #expect(CompanyIdentifier.picoTechnology.rawValue == 964)
        #expect(CompanyIdentifier.picoTechnology.name == #"Pico Technology Inc."#)
        #expect(CompanyIdentifier.picoTechnology.description == #"Pico Technology Inc."#)
    
        // St. Jude Medical, Inc.
        #expect(CompanyIdentifier.stJudeMedical.rawValue == 965)
        #expect(CompanyIdentifier.stJudeMedical.name == #"St. Jude Medical, Inc."#)
        #expect(CompanyIdentifier.stJudeMedical.description == #"St. Jude Medical, Inc."#)
    
        // Intricon
        #expect(CompanyIdentifier.intricon.rawValue == 966)
        #expect(CompanyIdentifier.intricon.name == #"Intricon"#)
        #expect(CompanyIdentifier.intricon.description == #"Intricon"#)
    
        // Structural Health Systems, Inc.
        #expect(CompanyIdentifier.structuralHealthSystems.rawValue == 967)
        #expect(CompanyIdentifier.structuralHealthSystems.name == #"Structural Health Systems, Inc."#)
        #expect(CompanyIdentifier.structuralHealthSystems.description == #"Structural Health Systems, Inc."#)
    
        // Avvel International
        #expect(CompanyIdentifier.avvelInternational.rawValue == 968)
        #expect(CompanyIdentifier.avvelInternational.name == #"Avvel International"#)
        #expect(CompanyIdentifier.avvelInternational.description == #"Avvel International"#)
    
        // Gallagher Group
        #expect(CompanyIdentifier.gallagherGroup.rawValue == 969)
        #expect(CompanyIdentifier.gallagherGroup.name == #"Gallagher Group"#)
        #expect(CompanyIdentifier.gallagherGroup.description == #"Gallagher Group"#)
    
        // In2things Automation Pvt. Ltd.
        #expect(CompanyIdentifier.in2ThingsAutomation.rawValue == 970)
        #expect(CompanyIdentifier.in2ThingsAutomation.name == #"In2things Automation Pvt. Ltd."#)
        #expect(CompanyIdentifier.in2ThingsAutomation.description == #"In2things Automation Pvt. Ltd."#)
    
        // SYSDEV Srl
        #expect(CompanyIdentifier.sysdev.rawValue == 971)
        #expect(CompanyIdentifier.sysdev.name == #"SYSDEV Srl"#)
        #expect(CompanyIdentifier.sysdev.description == #"SYSDEV Srl"#)
    
        // Vonkil Technologies Ltd
        #expect(CompanyIdentifier.vonkilTechnologies.rawValue == 972)
        #expect(CompanyIdentifier.vonkilTechnologies.name == #"Vonkil Technologies Ltd"#)
        #expect(CompanyIdentifier.vonkilTechnologies.description == #"Vonkil Technologies Ltd"#)
    
        // Wynd Technologies, Inc.
        #expect(CompanyIdentifier.wyndTechnologies.rawValue == 973)
        #expect(CompanyIdentifier.wyndTechnologies.name == #"Wynd Technologies, Inc."#)
        #expect(CompanyIdentifier.wyndTechnologies.description == #"Wynd Technologies, Inc."#)
    
        // CONTRINEX S.A.
        #expect(CompanyIdentifier.contrinex.rawValue == 974)
        #expect(CompanyIdentifier.contrinex.name == #"CONTRINEX S.A."#)
        #expect(CompanyIdentifier.contrinex.description == #"CONTRINEX S.A."#)
    
        // MIRA, Inc.
        #expect(CompanyIdentifier.mira.rawValue == 975)
        #expect(CompanyIdentifier.mira.name == #"MIRA, Inc."#)
        #expect(CompanyIdentifier.mira.description == #"MIRA, Inc."#)
    
        // Watteam Ltd
        #expect(CompanyIdentifier.watteam.rawValue == 976)
        #expect(CompanyIdentifier.watteam.name == #"Watteam Ltd"#)
        #expect(CompanyIdentifier.watteam.description == #"Watteam Ltd"#)
    
        // Density Inc.
        #expect(CompanyIdentifier.density.rawValue == 977)
        #expect(CompanyIdentifier.density.name == #"Density Inc."#)
        #expect(CompanyIdentifier.density.description == #"Density Inc."#)
    
        // IOT Pot India Private Limited
        #expect(CompanyIdentifier.iotPotIndia.rawValue == 978)
        #expect(CompanyIdentifier.iotPotIndia.name == #"IOT Pot India Private Limited"#)
        #expect(CompanyIdentifier.iotPotIndia.description == #"IOT Pot India Private Limited"#)
    
        // Sigma Connectivity AB
        #expect(CompanyIdentifier.sigmaConnectivity.rawValue == 979)
        #expect(CompanyIdentifier.sigmaConnectivity.name == #"Sigma Connectivity AB"#)
        #expect(CompanyIdentifier.sigmaConnectivity.description == #"Sigma Connectivity AB"#)
    
        // PEG PEREGO SPA
        #expect(CompanyIdentifier.pegPeregoSpa.rawValue == 980)
        #expect(CompanyIdentifier.pegPeregoSpa.name == #"PEG PEREGO SPA"#)
        #expect(CompanyIdentifier.pegPeregoSpa.description == #"PEG PEREGO SPA"#)
    
        // Wyzelink Systems Inc.
        #expect(CompanyIdentifier.wyzelinkSystems.rawValue == 981)
        #expect(CompanyIdentifier.wyzelinkSystems.name == #"Wyzelink Systems Inc."#)
        #expect(CompanyIdentifier.wyzelinkSystems.description == #"Wyzelink Systems Inc."#)
    
        // Yota Devices LTD
        #expect(CompanyIdentifier.yotaDevices.rawValue == 982)
        #expect(CompanyIdentifier.yotaDevices.name == #"Yota Devices LTD"#)
        #expect(CompanyIdentifier.yotaDevices.description == #"Yota Devices LTD"#)
    
        // FINSECUR
        #expect(CompanyIdentifier.finsecur.rawValue == 983)
        #expect(CompanyIdentifier.finsecur.name == #"FINSECUR"#)
        #expect(CompanyIdentifier.finsecur.description == #"FINSECUR"#)
    
        // Zen-Me Labs Ltd
        #expect(CompanyIdentifier.zenMeLabs.rawValue == 984)
        #expect(CompanyIdentifier.zenMeLabs.name == #"Zen-Me Labs Ltd"#)
        #expect(CompanyIdentifier.zenMeLabs.description == #"Zen-Me Labs Ltd"#)
    
        // 3IWare Co., Ltd.
        #expect(CompanyIdentifier.company3Iware.rawValue == 985)
        #expect(CompanyIdentifier.company3Iware.name == #"3IWare Co., Ltd."#)
        #expect(CompanyIdentifier.company3Iware.description == #"3IWare Co., Ltd."#)
    
        // EnOcean GmbH
        #expect(CompanyIdentifier.enocean.rawValue == 986)
        #expect(CompanyIdentifier.enocean.name == #"EnOcean GmbH"#)
        #expect(CompanyIdentifier.enocean.description == #"EnOcean GmbH"#)
    
        // Instabeat, Inc
        #expect(CompanyIdentifier.instabeat.rawValue == 987)
        #expect(CompanyIdentifier.instabeat.name == #"Instabeat, Inc"#)
        #expect(CompanyIdentifier.instabeat.description == #"Instabeat, Inc"#)
    
        // Nima Labs
        #expect(CompanyIdentifier.nimaLabs.rawValue == 988)
        #expect(CompanyIdentifier.nimaLabs.name == #"Nima Labs"#)
        #expect(CompanyIdentifier.nimaLabs.description == #"Nima Labs"#)
    
        // Andreas Stihl AG & Co. KG
        #expect(CompanyIdentifier.andreasStihl.rawValue == 989)
        #expect(CompanyIdentifier.andreasStihl.name == #"Andreas Stihl AG & Co. KG"#)
        #expect(CompanyIdentifier.andreasStihl.description == #"Andreas Stihl AG & Co. KG"#)
    
        // Nathan Rhoades LLC
        #expect(CompanyIdentifier.nathanRhoades.rawValue == 990)
        #expect(CompanyIdentifier.nathanRhoades.name == #"Nathan Rhoades LLC"#)
        #expect(CompanyIdentifier.nathanRhoades.description == #"Nathan Rhoades LLC"#)
    
        // Grob Technologies, LLC
        #expect(CompanyIdentifier.grobTechnologies.rawValue == 991)
        #expect(CompanyIdentifier.grobTechnologies.name == #"Grob Technologies, LLC"#)
        #expect(CompanyIdentifier.grobTechnologies.description == #"Grob Technologies, LLC"#)
    
        // Actions Technology Co.,Ltd
        #expect(CompanyIdentifier.actionsTechnology.rawValue == 992)
        #expect(CompanyIdentifier.actionsTechnology.name == #"Actions Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.actionsTechnology.description == #"Actions Technology Co.,Ltd"#)
    
        // SPD Development Company Ltd
        #expect(CompanyIdentifier.spdDevelopment.rawValue == 993)
        #expect(CompanyIdentifier.spdDevelopment.name == #"SPD Development Company Ltd"#)
        #expect(CompanyIdentifier.spdDevelopment.description == #"SPD Development Company Ltd"#)
    
        // Sensoan Oy
        #expect(CompanyIdentifier.sensoan.rawValue == 994)
        #expect(CompanyIdentifier.sensoan.name == #"Sensoan Oy"#)
        #expect(CompanyIdentifier.sensoan.description == #"Sensoan Oy"#)
    
        // Qualcomm Life Inc
        #expect(CompanyIdentifier.qualcommLife.rawValue == 995)
        #expect(CompanyIdentifier.qualcommLife.name == #"Qualcomm Life Inc"#)
        #expect(CompanyIdentifier.qualcommLife.description == #"Qualcomm Life Inc"#)
    
        // Chip-ing AG
        #expect(CompanyIdentifier.chipIng.rawValue == 996)
        #expect(CompanyIdentifier.chipIng.name == #"Chip-ing AG"#)
        #expect(CompanyIdentifier.chipIng.description == #"Chip-ing AG"#)
    
        // ffly4u
        #expect(CompanyIdentifier.ffly4U.rawValue == 997)
        #expect(CompanyIdentifier.ffly4U.name == #"ffly4u"#)
        #expect(CompanyIdentifier.ffly4U.description == #"ffly4u"#)
    
        // IoT Instruments Oy
        #expect(CompanyIdentifier.iotInstruments.rawValue == 998)
        #expect(CompanyIdentifier.iotInstruments.name == #"IoT Instruments Oy"#)
        #expect(CompanyIdentifier.iotInstruments.description == #"IoT Instruments Oy"#)
    
        // TRUE Fitness Technology
        #expect(CompanyIdentifier.trueFitnessTechnology.rawValue == 999)
        #expect(CompanyIdentifier.trueFitnessTechnology.name == #"TRUE Fitness Technology"#)
        #expect(CompanyIdentifier.trueFitnessTechnology.description == #"TRUE Fitness Technology"#)
    
        // Reiner Kartengeraete GmbH & Co. KG.
        #expect(CompanyIdentifier.reinerKartengeraete.rawValue == 1000)
        #expect(CompanyIdentifier.reinerKartengeraete.name == #"Reiner Kartengeraete GmbH & Co. KG."#)
        #expect(CompanyIdentifier.reinerKartengeraete.description == #"Reiner Kartengeraete GmbH & Co. KG."#)
    
        // SHENZHEN LEMONJOY TECHNOLOGY CO., LTD.
        #expect(CompanyIdentifier.shenzhenLemonjoyTechnology.rawValue == 1001)
        #expect(CompanyIdentifier.shenzhenLemonjoyTechnology.name == #"SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."#)
        #expect(CompanyIdentifier.shenzhenLemonjoyTechnology.description == #"SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."#)
    
        // Hello Inc.
        #expect(CompanyIdentifier.hello.rawValue == 1002)
        #expect(CompanyIdentifier.hello.name == #"Hello Inc."#)
        #expect(CompanyIdentifier.hello.description == #"Hello Inc."#)
    
        // Ozo Edu, Inc.
        #expect(CompanyIdentifier.ozoEdu.rawValue == 1003)
        #expect(CompanyIdentifier.ozoEdu.name == #"Ozo Edu, Inc."#)
        #expect(CompanyIdentifier.ozoEdu.description == #"Ozo Edu, Inc."#)
    
        // Jigowatts Inc.
        #expect(CompanyIdentifier.jigowatts.rawValue == 1004)
        #expect(CompanyIdentifier.jigowatts.name == #"Jigowatts Inc."#)
        #expect(CompanyIdentifier.jigowatts.description == #"Jigowatts Inc."#)
    
        // BASIC MICRO.COM,INC.
        #expect(CompanyIdentifier.basicMicroCom.rawValue == 1005)
        #expect(CompanyIdentifier.basicMicroCom.name == #"BASIC MICRO.COM,INC."#)
        #expect(CompanyIdentifier.basicMicroCom.description == #"BASIC MICRO.COM,INC."#)
    
        // CUBE TECHNOLOGIES
        #expect(CompanyIdentifier.cubeTechnologies.rawValue == 1006)
        #expect(CompanyIdentifier.cubeTechnologies.name == #"CUBE TECHNOLOGIES"#)
        #expect(CompanyIdentifier.cubeTechnologies.description == #"CUBE TECHNOLOGIES"#)
    
        // foolography GmbH
        #expect(CompanyIdentifier.foolography.rawValue == 1007)
        #expect(CompanyIdentifier.foolography.name == #"foolography GmbH"#)
        #expect(CompanyIdentifier.foolography.description == #"foolography GmbH"#)
    
        // CLINK
        #expect(CompanyIdentifier.clink.rawValue == 1008)
        #expect(CompanyIdentifier.clink.name == #"CLINK"#)
        #expect(CompanyIdentifier.clink.description == #"CLINK"#)
    
        // Hestan Smart Cooking Inc.
        #expect(CompanyIdentifier.hestanSmartCooking.rawValue == 1009)
        #expect(CompanyIdentifier.hestanSmartCooking.name == #"Hestan Smart Cooking Inc."#)
        #expect(CompanyIdentifier.hestanSmartCooking.description == #"Hestan Smart Cooking Inc."#)
    
        // WindowMaster A/S
        #expect(CompanyIdentifier.windowmaster.rawValue == 1010)
        #expect(CompanyIdentifier.windowmaster.name == #"WindowMaster A/S"#)
        #expect(CompanyIdentifier.windowmaster.description == #"WindowMaster A/S"#)
    
        // Flowscape AB
        #expect(CompanyIdentifier.flowscape.rawValue == 1011)
        #expect(CompanyIdentifier.flowscape.name == #"Flowscape AB"#)
        #expect(CompanyIdentifier.flowscape.description == #"Flowscape AB"#)
    
        // PAL Technologies Ltd
        #expect(CompanyIdentifier.palTechnologies.rawValue == 1012)
        #expect(CompanyIdentifier.palTechnologies.name == #"PAL Technologies Ltd"#)
        #expect(CompanyIdentifier.palTechnologies.description == #"PAL Technologies Ltd"#)
    
        // WHERE, Inc.
        #expect(CompanyIdentifier.whereinc.rawValue == 1013)
        #expect(CompanyIdentifier.whereinc.name == #"WHERE, Inc."#)
        #expect(CompanyIdentifier.whereinc.description == #"WHERE, Inc."#)
    
        // Iton Technology Corp.
        #expect(CompanyIdentifier.itonTechnology.rawValue == 1014)
        #expect(CompanyIdentifier.itonTechnology.name == #"Iton Technology Corp."#)
        #expect(CompanyIdentifier.itonTechnology.description == #"Iton Technology Corp."#)
    
        // Owl Labs Inc.
        #expect(CompanyIdentifier.owlLabs.rawValue == 1015)
        #expect(CompanyIdentifier.owlLabs.name == #"Owl Labs Inc."#)
        #expect(CompanyIdentifier.owlLabs.description == #"Owl Labs Inc."#)
    
        // Rockford Corp.
        #expect(CompanyIdentifier.rockford.rawValue == 1016)
        #expect(CompanyIdentifier.rockford.name == #"Rockford Corp."#)
        #expect(CompanyIdentifier.rockford.description == #"Rockford Corp."#)
    
        // Becon Technologies Co.,Ltd.
        #expect(CompanyIdentifier.beconTechnologies.rawValue == 1017)
        #expect(CompanyIdentifier.beconTechnologies.name == #"Becon Technologies Co.,Ltd."#)
        #expect(CompanyIdentifier.beconTechnologies.description == #"Becon Technologies Co.,Ltd."#)
    
        // Vyassoft Technologies Inc
        #expect(CompanyIdentifier.vyassoftTechnologies.rawValue == 1018)
        #expect(CompanyIdentifier.vyassoftTechnologies.name == #"Vyassoft Technologies Inc"#)
        #expect(CompanyIdentifier.vyassoftTechnologies.description == #"Vyassoft Technologies Inc"#)
    
        // Nox Medical
        #expect(CompanyIdentifier.noxMedical.rawValue == 1019)
        #expect(CompanyIdentifier.noxMedical.name == #"Nox Medical"#)
        #expect(CompanyIdentifier.noxMedical.description == #"Nox Medical"#)
    
        // Kimberly-Clark
        #expect(CompanyIdentifier.kimberlyClark.rawValue == 1020)
        #expect(CompanyIdentifier.kimberlyClark.name == #"Kimberly-Clark"#)
        #expect(CompanyIdentifier.kimberlyClark.description == #"Kimberly-Clark"#)
    
        // Trimble Inc.
        #expect(CompanyIdentifier.trimble.rawValue == 1021)
        #expect(CompanyIdentifier.trimble.name == #"Trimble Inc."#)
        #expect(CompanyIdentifier.trimble.description == #"Trimble Inc."#)
    
        // Littelfuse
        #expect(CompanyIdentifier.littelfuse.rawValue == 1022)
        #expect(CompanyIdentifier.littelfuse.name == #"Littelfuse"#)
        #expect(CompanyIdentifier.littelfuse.description == #"Littelfuse"#)
    
        // Withings
        #expect(CompanyIdentifier.withings.rawValue == 1023)
        #expect(CompanyIdentifier.withings.name == #"Withings"#)
        #expect(CompanyIdentifier.withings.description == #"Withings"#)
    
        // i-developer IT Beratung UG
        #expect(CompanyIdentifier.iDeveloperItBeratungUg.rawValue == 1024)
        #expect(CompanyIdentifier.iDeveloperItBeratungUg.name == #"i-developer IT Beratung UG"#)
        #expect(CompanyIdentifier.iDeveloperItBeratungUg.description == #"i-developer IT Beratung UG"#)
    
        // Relations Inc.
        #expect(CompanyIdentifier.relations.rawValue == 1025)
        #expect(CompanyIdentifier.relations.name == #"Relations Inc."#)
        #expect(CompanyIdentifier.relations.description == #"Relations Inc."#)
    
        // Sears Holdings Corporation
        #expect(CompanyIdentifier.searsHoldings.rawValue == 1026)
        #expect(CompanyIdentifier.searsHoldings.name == #"Sears Holdings Corporation"#)
        #expect(CompanyIdentifier.searsHoldings.description == #"Sears Holdings Corporation"#)
    
        // Gantner Electronic GmbH
        #expect(CompanyIdentifier.gantnerElectronic.rawValue == 1027)
        #expect(CompanyIdentifier.gantnerElectronic.name == #"Gantner Electronic GmbH"#)
        #expect(CompanyIdentifier.gantnerElectronic.description == #"Gantner Electronic GmbH"#)
    
        // Authomate Inc
        #expect(CompanyIdentifier.authomate.rawValue == 1028)
        #expect(CompanyIdentifier.authomate.name == #"Authomate Inc"#)
        #expect(CompanyIdentifier.authomate.description == #"Authomate Inc"#)
    
        // Vertex International, Inc.
        #expect(CompanyIdentifier.vertexInternational.rawValue == 1029)
        #expect(CompanyIdentifier.vertexInternational.name == #"Vertex International, Inc."#)
        #expect(CompanyIdentifier.vertexInternational.description == #"Vertex International, Inc."#)
    
        // Airtago
        #expect(CompanyIdentifier.airtago.rawValue == 1030)
        #expect(CompanyIdentifier.airtago.name == #"Airtago"#)
        #expect(CompanyIdentifier.airtago.description == #"Airtago"#)
    
        // Swiss Audio SA
        #expect(CompanyIdentifier.swissAudio.rawValue == 1031)
        #expect(CompanyIdentifier.swissAudio.name == #"Swiss Audio SA"#)
        #expect(CompanyIdentifier.swissAudio.description == #"Swiss Audio SA"#)
    
        // ToGetHome Inc.
        #expect(CompanyIdentifier.togethome.rawValue == 1032)
        #expect(CompanyIdentifier.togethome.name == #"ToGetHome Inc."#)
        #expect(CompanyIdentifier.togethome.description == #"ToGetHome Inc."#)
    
        // RYSE INC.
        #expect(CompanyIdentifier.ryse.rawValue == 1033)
        #expect(CompanyIdentifier.ryse.name == #"RYSE INC."#)
        #expect(CompanyIdentifier.ryse.description == #"RYSE INC."#)
    
        // ZF OPENMATICS s.r.o.
        #expect(CompanyIdentifier.zfOpenmatics.rawValue == 1034)
        #expect(CompanyIdentifier.zfOpenmatics.name == #"ZF OPENMATICS s.r.o."#)
        #expect(CompanyIdentifier.zfOpenmatics.description == #"ZF OPENMATICS s.r.o."#)
    
        // Jana Care Inc.
        #expect(CompanyIdentifier.janaCare.rawValue == 1035)
        #expect(CompanyIdentifier.janaCare.name == #"Jana Care Inc."#)
        #expect(CompanyIdentifier.janaCare.description == #"Jana Care Inc."#)
    
        // Senix Corporation
        #expect(CompanyIdentifier.senix.rawValue == 1036)
        #expect(CompanyIdentifier.senix.name == #"Senix Corporation"#)
        #expect(CompanyIdentifier.senix.description == #"Senix Corporation"#)
    
        // NorthStar Battery Company, LLC
        #expect(CompanyIdentifier.northstarBattery.rawValue == 1037)
        #expect(CompanyIdentifier.northstarBattery.name == #"NorthStar Battery Company, LLC"#)
        #expect(CompanyIdentifier.northstarBattery.description == #"NorthStar Battery Company, LLC"#)
    
        // SKF (U.K.) Limited
        #expect(CompanyIdentifier.skfUK.rawValue == 1038)
        #expect(CompanyIdentifier.skfUK.name == #"SKF (U.K.) Limited"#)
        #expect(CompanyIdentifier.skfUK.description == #"SKF (U.K.) Limited"#)
    
        // CO-AX Technology, Inc.
        #expect(CompanyIdentifier.coAxTechnology.rawValue == 1039)
        #expect(CompanyIdentifier.coAxTechnology.name == #"CO-AX Technology, Inc."#)
        #expect(CompanyIdentifier.coAxTechnology.description == #"CO-AX Technology, Inc."#)
    
        // Fender Musical Instruments
        #expect(CompanyIdentifier.fenderMusicalInstruments.rawValue == 1040)
        #expect(CompanyIdentifier.fenderMusicalInstruments.name == #"Fender Musical Instruments"#)
        #expect(CompanyIdentifier.fenderMusicalInstruments.description == #"Fender Musical Instruments"#)
    
        // Luidia Inc
        #expect(CompanyIdentifier.luidia.rawValue == 1041)
        #expect(CompanyIdentifier.luidia.name == #"Luidia Inc"#)
        #expect(CompanyIdentifier.luidia.description == #"Luidia Inc"#)
    
        // SEFAM
        #expect(CompanyIdentifier.sefam.rawValue == 1042)
        #expect(CompanyIdentifier.sefam.name == #"SEFAM"#)
        #expect(CompanyIdentifier.sefam.description == #"SEFAM"#)
    
        // Wireless Cables Inc
        #expect(CompanyIdentifier.wirelessCables.rawValue == 1043)
        #expect(CompanyIdentifier.wirelessCables.name == #"Wireless Cables Inc"#)
        #expect(CompanyIdentifier.wirelessCables.description == #"Wireless Cables Inc"#)
    
        // Lightning Protection International Pty Ltd
        #expect(CompanyIdentifier.lightningProtectionInternational.rawValue == 1044)
        #expect(CompanyIdentifier.lightningProtectionInternational.name == #"Lightning Protection International Pty Ltd"#)
        #expect(CompanyIdentifier.lightningProtectionInternational.description == #"Lightning Protection International Pty Ltd"#)
    
        // Uber Technologies Inc
        #expect(CompanyIdentifier.uberTechnologies.rawValue == 1045)
        #expect(CompanyIdentifier.uberTechnologies.name == #"Uber Technologies Inc"#)
        #expect(CompanyIdentifier.uberTechnologies.description == #"Uber Technologies Inc"#)
    
        // SODA GmbH
        #expect(CompanyIdentifier.soda.rawValue == 1046)
        #expect(CompanyIdentifier.soda.name == #"SODA GmbH"#)
        #expect(CompanyIdentifier.soda.description == #"SODA GmbH"#)
    
        // Fatigue Science
        #expect(CompanyIdentifier.fatigueScience.rawValue == 1047)
        #expect(CompanyIdentifier.fatigueScience.name == #"Fatigue Science"#)
        #expect(CompanyIdentifier.fatigueScience.description == #"Fatigue Science"#)
    
        // Novalogy LTD
        #expect(CompanyIdentifier.novalogy.rawValue == 1049)
        #expect(CompanyIdentifier.novalogy.name == #"Novalogy LTD"#)
        #expect(CompanyIdentifier.novalogy.description == #"Novalogy LTD"#)
    
        // Friday Labs Limited
        #expect(CompanyIdentifier.fridayLabs.rawValue == 1050)
        #expect(CompanyIdentifier.fridayLabs.name == #"Friday Labs Limited"#)
        #expect(CompanyIdentifier.fridayLabs.description == #"Friday Labs Limited"#)
    
        // OrthoAccel Technologies
        #expect(CompanyIdentifier.orthoaccelTechnologies.rawValue == 1051)
        #expect(CompanyIdentifier.orthoaccelTechnologies.name == #"OrthoAccel Technologies"#)
        #expect(CompanyIdentifier.orthoaccelTechnologies.description == #"OrthoAccel Technologies"#)
    
        // WaterGuru, Inc.
        #expect(CompanyIdentifier.waterguru.rawValue == 1052)
        #expect(CompanyIdentifier.waterguru.name == #"WaterGuru, Inc."#)
        #expect(CompanyIdentifier.waterguru.description == #"WaterGuru, Inc."#)
    
        // Benning Elektrotechnik und Elektronik GmbH & Co. KG
        #expect(CompanyIdentifier.benningElektrotechnikUndElektronik.rawValue == 1053)
        #expect(CompanyIdentifier.benningElektrotechnikUndElektronik.name == #"Benning Elektrotechnik und Elektronik GmbH & Co. KG"#)
        #expect(CompanyIdentifier.benningElektrotechnikUndElektronik.description == #"Benning Elektrotechnik und Elektronik GmbH & Co. KG"#)
    
        // Dell Computer Corporation
        #expect(CompanyIdentifier.dellComputer.rawValue == 1054)
        #expect(CompanyIdentifier.dellComputer.name == #"Dell Computer Corporation"#)
        #expect(CompanyIdentifier.dellComputer.description == #"Dell Computer Corporation"#)
    
        // Kopin Corporation
        #expect(CompanyIdentifier.kopin.rawValue == 1055)
        #expect(CompanyIdentifier.kopin.name == #"Kopin Corporation"#)
        #expect(CompanyIdentifier.kopin.description == #"Kopin Corporation"#)
    
        // TecBakery GmbH
        #expect(CompanyIdentifier.tecbakery.rawValue == 1056)
        #expect(CompanyIdentifier.tecbakery.name == #"TecBakery GmbH"#)
        #expect(CompanyIdentifier.tecbakery.description == #"TecBakery GmbH"#)
    
        // Backbone Labs, Inc.
        #expect(CompanyIdentifier.backboneLabs.rawValue == 1057)
        #expect(CompanyIdentifier.backboneLabs.name == #"Backbone Labs, Inc."#)
        #expect(CompanyIdentifier.backboneLabs.description == #"Backbone Labs, Inc."#)
    
        // DELSEY SA
        #expect(CompanyIdentifier.delsey.rawValue == 1058)
        #expect(CompanyIdentifier.delsey.name == #"DELSEY SA"#)
        #expect(CompanyIdentifier.delsey.description == #"DELSEY SA"#)
    
        // Chargifi Limited
        #expect(CompanyIdentifier.chargifi.rawValue == 1059)
        #expect(CompanyIdentifier.chargifi.name == #"Chargifi Limited"#)
        #expect(CompanyIdentifier.chargifi.description == #"Chargifi Limited"#)
    
        // Trainesense Ltd.
        #expect(CompanyIdentifier.trainesense.rawValue == 1060)
        #expect(CompanyIdentifier.trainesense.name == #"Trainesense Ltd."#)
        #expect(CompanyIdentifier.trainesense.description == #"Trainesense Ltd."#)
    
        // Unify Software and Solutions GmbH & Co. KG
        #expect(CompanyIdentifier.unifySoftwareAndSolutions.rawValue == 1061)
        #expect(CompanyIdentifier.unifySoftwareAndSolutions.name == #"Unify Software and Solutions GmbH & Co. KG"#)
        #expect(CompanyIdentifier.unifySoftwareAndSolutions.description == #"Unify Software and Solutions GmbH & Co. KG"#)
    
        // Husqvarna AB
        #expect(CompanyIdentifier.husqvarna.rawValue == 1062)
        #expect(CompanyIdentifier.husqvarna.name == #"Husqvarna AB"#)
        #expect(CompanyIdentifier.husqvarna.description == #"Husqvarna AB"#)
    
        // Focus fleet and fuel management inc
        #expect(CompanyIdentifier.focusFleetAndFuelManagement.rawValue == 1063)
        #expect(CompanyIdentifier.focusFleetAndFuelManagement.name == #"Focus fleet and fuel management inc"#)
        #expect(CompanyIdentifier.focusFleetAndFuelManagement.description == #"Focus fleet and fuel management inc"#)
    
        // SmallLoop, LLC
        #expect(CompanyIdentifier.smallloop.rawValue == 1064)
        #expect(CompanyIdentifier.smallloop.name == #"SmallLoop, LLC"#)
        #expect(CompanyIdentifier.smallloop.description == #"SmallLoop, LLC"#)
    
        // Prolon Inc.
        #expect(CompanyIdentifier.prolon.rawValue == 1065)
        #expect(CompanyIdentifier.prolon.name == #"Prolon Inc."#)
        #expect(CompanyIdentifier.prolon.description == #"Prolon Inc."#)
    
        // BD Medical
        #expect(CompanyIdentifier.bdMedical.rawValue == 1066)
        #expect(CompanyIdentifier.bdMedical.name == #"BD Medical"#)
        #expect(CompanyIdentifier.bdMedical.description == #"BD Medical"#)
    
        // iMicroMed Incorporated
        #expect(CompanyIdentifier.imicromed.rawValue == 1067)
        #expect(CompanyIdentifier.imicromed.name == #"iMicroMed Incorporated"#)
        #expect(CompanyIdentifier.imicromed.description == #"iMicroMed Incorporated"#)
    
        // Ticto N.V.
        #expect(CompanyIdentifier.ticto.rawValue == 1068)
        #expect(CompanyIdentifier.ticto.name == #"Ticto N.V."#)
        #expect(CompanyIdentifier.ticto.description == #"Ticto N.V."#)
    
        // Meshtech AS
        #expect(CompanyIdentifier.meshtech.rawValue == 1069)
        #expect(CompanyIdentifier.meshtech.name == #"Meshtech AS"#)
        #expect(CompanyIdentifier.meshtech.description == #"Meshtech AS"#)
    
        // MemCachier Inc.
        #expect(CompanyIdentifier.memcachier.rawValue == 1070)
        #expect(CompanyIdentifier.memcachier.name == #"MemCachier Inc."#)
        #expect(CompanyIdentifier.memcachier.description == #"MemCachier Inc."#)
    
        // Danfoss A/S
        #expect(CompanyIdentifier.danfoss.rawValue == 1071)
        #expect(CompanyIdentifier.danfoss.name == #"Danfoss A/S"#)
        #expect(CompanyIdentifier.danfoss.description == #"Danfoss A/S"#)
    
        // SnapStyk Inc.
        #expect(CompanyIdentifier.snapstyk.rawValue == 1072)
        #expect(CompanyIdentifier.snapstyk.name == #"SnapStyk Inc."#)
        #expect(CompanyIdentifier.snapstyk.description == #"SnapStyk Inc."#)
    
        // Alticor Inc.
        #expect(CompanyIdentifier.alticor.rawValue == 1073)
        #expect(CompanyIdentifier.alticor.name == #"Alticor Inc."#)
        #expect(CompanyIdentifier.alticor.description == #"Alticor Inc."#)
    
        // Silk Labs, Inc.
        #expect(CompanyIdentifier.silkLabs.rawValue == 1074)
        #expect(CompanyIdentifier.silkLabs.name == #"Silk Labs, Inc."#)
        #expect(CompanyIdentifier.silkLabs.description == #"Silk Labs, Inc."#)
    
        // Pillsy Inc.
        #expect(CompanyIdentifier.pillsy.rawValue == 1075)
        #expect(CompanyIdentifier.pillsy.name == #"Pillsy Inc."#)
        #expect(CompanyIdentifier.pillsy.description == #"Pillsy Inc."#)
    
        // Hatch Baby, Inc.
        #expect(CompanyIdentifier.hatchBaby.rawValue == 1076)
        #expect(CompanyIdentifier.hatchBaby.name == #"Hatch Baby, Inc."#)
        #expect(CompanyIdentifier.hatchBaby.description == #"Hatch Baby, Inc."#)
    
        // Blocks Wearables Ltd.
        #expect(CompanyIdentifier.blocksWearables.rawValue == 1077)
        #expect(CompanyIdentifier.blocksWearables.name == #"Blocks Wearables Ltd."#)
        #expect(CompanyIdentifier.blocksWearables.description == #"Blocks Wearables Ltd."#)
    
        // Drayson Technologies (Europe) Limited
        #expect(CompanyIdentifier.draysonTechnologiesEurope.rawValue == 1078)
        #expect(CompanyIdentifier.draysonTechnologiesEurope.name == #"Drayson Technologies (Europe) Limited"#)
        #expect(CompanyIdentifier.draysonTechnologiesEurope.description == #"Drayson Technologies (Europe) Limited"#)
    
        // eBest IOT Inc.
        #expect(CompanyIdentifier.ebestIot.rawValue == 1079)
        #expect(CompanyIdentifier.ebestIot.name == #"eBest IOT Inc."#)
        #expect(CompanyIdentifier.ebestIot.description == #"eBest IOT Inc."#)
    
        // Helvar Ltd
        #expect(CompanyIdentifier.helvar.rawValue == 1080)
        #expect(CompanyIdentifier.helvar.name == #"Helvar Ltd"#)
        #expect(CompanyIdentifier.helvar.description == #"Helvar Ltd"#)
    
        // Radiance Technologies
        #expect(CompanyIdentifier.radianceTechnologies.rawValue == 1081)
        #expect(CompanyIdentifier.radianceTechnologies.name == #"Radiance Technologies"#)
        #expect(CompanyIdentifier.radianceTechnologies.description == #"Radiance Technologies"#)
    
        // Nuheara Limited
        #expect(CompanyIdentifier.nuheara.rawValue == 1082)
        #expect(CompanyIdentifier.nuheara.name == #"Nuheara Limited"#)
        #expect(CompanyIdentifier.nuheara.description == #"Nuheara Limited"#)
    
        // Appside co., ltd.
        #expect(CompanyIdentifier.appside.rawValue == 1083)
        #expect(CompanyIdentifier.appside.name == #"Appside co., ltd."#)
        #expect(CompanyIdentifier.appside.description == #"Appside co., ltd."#)
    
        // DeLaval
        #expect(CompanyIdentifier.delaval.rawValue == 1084)
        #expect(CompanyIdentifier.delaval.name == #"DeLaval"#)
        #expect(CompanyIdentifier.delaval.description == #"DeLaval"#)
    
        // Coiler Corporation
        #expect(CompanyIdentifier.coiler.rawValue == 1085)
        #expect(CompanyIdentifier.coiler.name == #"Coiler Corporation"#)
        #expect(CompanyIdentifier.coiler.description == #"Coiler Corporation"#)
    
        // Thermomedics, Inc.
        #expect(CompanyIdentifier.thermomedics.rawValue == 1086)
        #expect(CompanyIdentifier.thermomedics.name == #"Thermomedics, Inc."#)
        #expect(CompanyIdentifier.thermomedics.description == #"Thermomedics, Inc."#)
    
        // Tentacle Sync GmbH
        #expect(CompanyIdentifier.tentacleSync.rawValue == 1087)
        #expect(CompanyIdentifier.tentacleSync.name == #"Tentacle Sync GmbH"#)
        #expect(CompanyIdentifier.tentacleSync.description == #"Tentacle Sync GmbH"#)
    
        // Valencell, Inc.
        #expect(CompanyIdentifier.valencell.rawValue == 1088)
        #expect(CompanyIdentifier.valencell.name == #"Valencell, Inc."#)
        #expect(CompanyIdentifier.valencell.description == #"Valencell, Inc."#)
    
        // iProtoXi Oy
        #expect(CompanyIdentifier.iprotoxi.rawValue == 1089)
        #expect(CompanyIdentifier.iprotoxi.name == #"iProtoXi Oy"#)
        #expect(CompanyIdentifier.iprotoxi.description == #"iProtoXi Oy"#)
    
        // SECOM CO., LTD.
        #expect(CompanyIdentifier.secom.rawValue == 1090)
        #expect(CompanyIdentifier.secom.name == #"SECOM CO., LTD."#)
        #expect(CompanyIdentifier.secom.description == #"SECOM CO., LTD."#)
    
        // Tucker International LLC
        #expect(CompanyIdentifier.tuckerInternational.rawValue == 1091)
        #expect(CompanyIdentifier.tuckerInternational.name == #"Tucker International LLC"#)
        #expect(CompanyIdentifier.tuckerInternational.description == #"Tucker International LLC"#)
    
        // Metanate Limited
        #expect(CompanyIdentifier.metanate.rawValue == 1092)
        #expect(CompanyIdentifier.metanate.name == #"Metanate Limited"#)
        #expect(CompanyIdentifier.metanate.description == #"Metanate Limited"#)
    
        // Kobian Canada Inc.
        #expect(CompanyIdentifier.kobianCanada.rawValue == 1093)
        #expect(CompanyIdentifier.kobianCanada.name == #"Kobian Canada Inc."#)
        #expect(CompanyIdentifier.kobianCanada.description == #"Kobian Canada Inc."#)
    
        // NETGEAR, Inc.
        #expect(CompanyIdentifier.netgear.rawValue == 1094)
        #expect(CompanyIdentifier.netgear.name == #"NETGEAR, Inc."#)
        #expect(CompanyIdentifier.netgear.description == #"NETGEAR, Inc."#)
    
        // Fabtronics Australia Pty Ltd
        #expect(CompanyIdentifier.fabtronicsAustralia.rawValue == 1095)
        #expect(CompanyIdentifier.fabtronicsAustralia.name == #"Fabtronics Australia Pty Ltd"#)
        #expect(CompanyIdentifier.fabtronicsAustralia.description == #"Fabtronics Australia Pty Ltd"#)
    
        // Grand Centrix GmbH
        #expect(CompanyIdentifier.grandCentrix.rawValue == 1096)
        #expect(CompanyIdentifier.grandCentrix.name == #"Grand Centrix GmbH"#)
        #expect(CompanyIdentifier.grandCentrix.description == #"Grand Centrix GmbH"#)
    
        // 1UP USA.com llc
        #expect(CompanyIdentifier.company1UpUsaCom.rawValue == 1097)
        #expect(CompanyIdentifier.company1UpUsaCom.name == #"1UP USA.com llc"#)
        #expect(CompanyIdentifier.company1UpUsaCom.description == #"1UP USA.com llc"#)
    
        // SHIMANO INC.
        #expect(CompanyIdentifier.shimano.rawValue == 1098)
        #expect(CompanyIdentifier.shimano.name == #"SHIMANO INC."#)
        #expect(CompanyIdentifier.shimano.description == #"SHIMANO INC."#)
    
        // Nain Inc.
        #expect(CompanyIdentifier.nain.rawValue == 1099)
        #expect(CompanyIdentifier.nain.name == #"Nain Inc."#)
        #expect(CompanyIdentifier.nain.description == #"Nain Inc."#)
    
        // LifeStyle Lock, LLC
        #expect(CompanyIdentifier.lifestyleLock.rawValue == 1100)
        #expect(CompanyIdentifier.lifestyleLock.name == #"LifeStyle Lock, LLC"#)
        #expect(CompanyIdentifier.lifestyleLock.description == #"LifeStyle Lock, LLC"#)
    
        // VEGA Grieshaber KG
        #expect(CompanyIdentifier.vegaGrieshaberKg.rawValue == 1101)
        #expect(CompanyIdentifier.vegaGrieshaberKg.name == #"VEGA Grieshaber KG"#)
        #expect(CompanyIdentifier.vegaGrieshaberKg.description == #"VEGA Grieshaber KG"#)
    
        // Xtrava Inc.
        #expect(CompanyIdentifier.xtrava.rawValue == 1102)
        #expect(CompanyIdentifier.xtrava.name == #"Xtrava Inc."#)
        #expect(CompanyIdentifier.xtrava.description == #"Xtrava Inc."#)
    
        // TTS Tooltechnic Systems AG & Co. KG
        #expect(CompanyIdentifier.ttsTooltechnicSystems.rawValue == 1103)
        #expect(CompanyIdentifier.ttsTooltechnicSystems.name == #"TTS Tooltechnic Systems AG & Co. KG"#)
        #expect(CompanyIdentifier.ttsTooltechnicSystems.description == #"TTS Tooltechnic Systems AG & Co. KG"#)
    
        // Teenage Engineering AB
        #expect(CompanyIdentifier.teenageEngineering.rawValue == 1104)
        #expect(CompanyIdentifier.teenageEngineering.name == #"Teenage Engineering AB"#)
        #expect(CompanyIdentifier.teenageEngineering.description == #"Teenage Engineering AB"#)
    
        // Tunstall Nordic AB
        #expect(CompanyIdentifier.tunstallNordic.rawValue == 1105)
        #expect(CompanyIdentifier.tunstallNordic.name == #"Tunstall Nordic AB"#)
        #expect(CompanyIdentifier.tunstallNordic.description == #"Tunstall Nordic AB"#)
    
        // Svep Design Center AB
        #expect(CompanyIdentifier.svepDesignCenter.rawValue == 1106)
        #expect(CompanyIdentifier.svepDesignCenter.name == #"Svep Design Center AB"#)
        #expect(CompanyIdentifier.svepDesignCenter.description == #"Svep Design Center AB"#)
    
        // Qorvo Utrecht B.V.
        #expect(CompanyIdentifier.qorvoUtrecht.rawValue == 1107)
        #expect(CompanyIdentifier.qorvoUtrecht.name == #"Qorvo Utrecht B.V."#)
        #expect(CompanyIdentifier.qorvoUtrecht.description == #"Qorvo Utrecht B.V."#)
    
        // Sphinx Electronics GmbH & Co KG
        #expect(CompanyIdentifier.sphinxElectronics.rawValue == 1108)
        #expect(CompanyIdentifier.sphinxElectronics.name == #"Sphinx Electronics GmbH & Co KG"#)
        #expect(CompanyIdentifier.sphinxElectronics.description == #"Sphinx Electronics GmbH & Co KG"#)
    
        // Atomation
        #expect(CompanyIdentifier.atomation.rawValue == 1109)
        #expect(CompanyIdentifier.atomation.name == #"Atomation"#)
        #expect(CompanyIdentifier.atomation.description == #"Atomation"#)
    
        // Nemik Consulting Inc
        #expect(CompanyIdentifier.nemikConsulting.rawValue == 1110)
        #expect(CompanyIdentifier.nemikConsulting.name == #"Nemik Consulting Inc"#)
        #expect(CompanyIdentifier.nemikConsulting.description == #"Nemik Consulting Inc"#)
    
        // RF INNOVATION
        #expect(CompanyIdentifier.rfInnovation.rawValue == 1111)
        #expect(CompanyIdentifier.rfInnovation.name == #"RF INNOVATION"#)
        #expect(CompanyIdentifier.rfInnovation.description == #"RF INNOVATION"#)
    
        // Mini Solution Co., Ltd.
        #expect(CompanyIdentifier.miniSolution.rawValue == 1112)
        #expect(CompanyIdentifier.miniSolution.name == #"Mini Solution Co., Ltd."#)
        #expect(CompanyIdentifier.miniSolution.description == #"Mini Solution Co., Ltd."#)
    
        // Lumenetix, Inc
        #expect(CompanyIdentifier.lumenetix.rawValue == 1113)
        #expect(CompanyIdentifier.lumenetix.name == #"Lumenetix, Inc"#)
        #expect(CompanyIdentifier.lumenetix.description == #"Lumenetix, Inc"#)
    
        // 2048450 Ontario Inc
        #expect(CompanyIdentifier.company2048450Ontario.rawValue == 1114)
        #expect(CompanyIdentifier.company2048450Ontario.name == #"2048450 Ontario Inc"#)
        #expect(CompanyIdentifier.company2048450Ontario.description == #"2048450 Ontario Inc"#)
    
        // SPACEEK LTD
        #expect(CompanyIdentifier.spaceek.rawValue == 1115)
        #expect(CompanyIdentifier.spaceek.name == #"SPACEEK LTD"#)
        #expect(CompanyIdentifier.spaceek.description == #"SPACEEK LTD"#)
    
        // Delta T Corporation
        #expect(CompanyIdentifier.deltaT.rawValue == 1116)
        #expect(CompanyIdentifier.deltaT.name == #"Delta T Corporation"#)
        #expect(CompanyIdentifier.deltaT.description == #"Delta T Corporation"#)
    
        // Boston Scientific Corporation
        #expect(CompanyIdentifier.bostonScientific.rawValue == 1117)
        #expect(CompanyIdentifier.bostonScientific.name == #"Boston Scientific Corporation"#)
        #expect(CompanyIdentifier.bostonScientific.description == #"Boston Scientific Corporation"#)
    
        // Nuviz, Inc.
        #expect(CompanyIdentifier.nuviz.rawValue == 1118)
        #expect(CompanyIdentifier.nuviz.name == #"Nuviz, Inc."#)
        #expect(CompanyIdentifier.nuviz.description == #"Nuviz, Inc."#)
    
        // Real Time Automation, Inc.
        #expect(CompanyIdentifier.realTimeAutomation.rawValue == 1119)
        #expect(CompanyIdentifier.realTimeAutomation.name == #"Real Time Automation, Inc."#)
        #expect(CompanyIdentifier.realTimeAutomation.description == #"Real Time Automation, Inc."#)
    
        // Kolibree
        #expect(CompanyIdentifier.kolibree.rawValue == 1120)
        #expect(CompanyIdentifier.kolibree.name == #"Kolibree"#)
        #expect(CompanyIdentifier.kolibree.description == #"Kolibree"#)
    
        // vhf elektronik GmbH
        #expect(CompanyIdentifier.vhfElektronik.rawValue == 1121)
        #expect(CompanyIdentifier.vhfElektronik.name == #"vhf elektronik GmbH"#)
        #expect(CompanyIdentifier.vhfElektronik.description == #"vhf elektronik GmbH"#)
    
        // Bonsai Systems GmbH
        #expect(CompanyIdentifier.bonsaiSystems.rawValue == 1122)
        #expect(CompanyIdentifier.bonsaiSystems.name == #"Bonsai Systems GmbH"#)
        #expect(CompanyIdentifier.bonsaiSystems.description == #"Bonsai Systems GmbH"#)
    
        // Fathom Systems Inc.
        #expect(CompanyIdentifier.fathomSystems.rawValue == 1123)
        #expect(CompanyIdentifier.fathomSystems.name == #"Fathom Systems Inc."#)
        #expect(CompanyIdentifier.fathomSystems.description == #"Fathom Systems Inc."#)
    
        // Bellman & Symfon Group AB
        #expect(CompanyIdentifier.bellmanSymfonGroup.rawValue == 1124)
        #expect(CompanyIdentifier.bellmanSymfonGroup.name == #"Bellman & Symfon Group AB"#)
        #expect(CompanyIdentifier.bellmanSymfonGroup.description == #"Bellman & Symfon Group AB"#)
    
        // International Forte Group LLC
        #expect(CompanyIdentifier.internationalForteGroup.rawValue == 1125)
        #expect(CompanyIdentifier.internationalForteGroup.name == #"International Forte Group LLC"#)
        #expect(CompanyIdentifier.internationalForteGroup.description == #"International Forte Group LLC"#)
    
        // CycleLabs Solutions inc.
        #expect(CompanyIdentifier.cyclelabsSolutions.rawValue == 1126)
        #expect(CompanyIdentifier.cyclelabsSolutions.name == #"CycleLabs Solutions inc."#)
        #expect(CompanyIdentifier.cyclelabsSolutions.description == #"CycleLabs Solutions inc."#)
    
        // Codenex Oy
        #expect(CompanyIdentifier.codenex.rawValue == 1127)
        #expect(CompanyIdentifier.codenex.name == #"Codenex Oy"#)
        #expect(CompanyIdentifier.codenex.description == #"Codenex Oy"#)
    
        // Kynesim Ltd
        #expect(CompanyIdentifier.kynesim.rawValue == 1128)
        #expect(CompanyIdentifier.kynesim.name == #"Kynesim Ltd"#)
        #expect(CompanyIdentifier.kynesim.description == #"Kynesim Ltd"#)
    
        // Palago AB
        #expect(CompanyIdentifier.palago.rawValue == 1129)
        #expect(CompanyIdentifier.palago.name == #"Palago AB"#)
        #expect(CompanyIdentifier.palago.description == #"Palago AB"#)
    
        // INSIGMA INC.
        #expect(CompanyIdentifier.insigma.rawValue == 1130)
        #expect(CompanyIdentifier.insigma.name == #"INSIGMA INC."#)
        #expect(CompanyIdentifier.insigma.description == #"INSIGMA INC."#)
    
        // PMD Solutions
        #expect(CompanyIdentifier.pmdSolutions.rawValue == 1131)
        #expect(CompanyIdentifier.pmdSolutions.name == #"PMD Solutions"#)
        #expect(CompanyIdentifier.pmdSolutions.description == #"PMD Solutions"#)
    
        // Qingdao Realtime Technology Co., Ltd.
        #expect(CompanyIdentifier.qingdaoRealtimeTechnology.rawValue == 1132)
        #expect(CompanyIdentifier.qingdaoRealtimeTechnology.name == #"Qingdao Realtime Technology Co., Ltd."#)
        #expect(CompanyIdentifier.qingdaoRealtimeTechnology.description == #"Qingdao Realtime Technology Co., Ltd."#)
    
        // BEGA Gantenbrink-Leuchten KG
        #expect(CompanyIdentifier.begaGantenbrinkLeuchtenKg.rawValue == 1133)
        #expect(CompanyIdentifier.begaGantenbrinkLeuchtenKg.name == #"BEGA Gantenbrink-Leuchten KG"#)
        #expect(CompanyIdentifier.begaGantenbrinkLeuchtenKg.description == #"BEGA Gantenbrink-Leuchten KG"#)
    
        // Pambor Ltd.
        #expect(CompanyIdentifier.pambor.rawValue == 1134)
        #expect(CompanyIdentifier.pambor.name == #"Pambor Ltd."#)
        #expect(CompanyIdentifier.pambor.description == #"Pambor Ltd."#)
    
        // Develco Products A/S
        #expect(CompanyIdentifier.develcoProducts.rawValue == 1135)
        #expect(CompanyIdentifier.develcoProducts.name == #"Develco Products A/S"#)
        #expect(CompanyIdentifier.develcoProducts.description == #"Develco Products A/S"#)
    
        // iDesign s.r.l.
        #expect(CompanyIdentifier.idesign.rawValue == 1136)
        #expect(CompanyIdentifier.idesign.name == #"iDesign s.r.l."#)
        #expect(CompanyIdentifier.idesign.description == #"iDesign s.r.l."#)
    
        // TiVo Corp
        #expect(CompanyIdentifier.tivo.rawValue == 1137)
        #expect(CompanyIdentifier.tivo.name == #"TiVo Corp"#)
        #expect(CompanyIdentifier.tivo.description == #"TiVo Corp"#)
    
        // Control-J Pty Ltd
        #expect(CompanyIdentifier.controlJ.rawValue == 1138)
        #expect(CompanyIdentifier.controlJ.name == #"Control-J Pty Ltd"#)
        #expect(CompanyIdentifier.controlJ.description == #"Control-J Pty Ltd"#)
    
        // Steelcase, Inc.
        #expect(CompanyIdentifier.steelcase.rawValue == 1139)
        #expect(CompanyIdentifier.steelcase.name == #"Steelcase, Inc."#)
        #expect(CompanyIdentifier.steelcase.description == #"Steelcase, Inc."#)
    
        // iApartment co., ltd.
        #expect(CompanyIdentifier.iapartment.rawValue == 1140)
        #expect(CompanyIdentifier.iapartment.name == #"iApartment co., ltd."#)
        #expect(CompanyIdentifier.iapartment.description == #"iApartment co., ltd."#)
    
        // Icom inc.
        #expect(CompanyIdentifier.icom.rawValue == 1141)
        #expect(CompanyIdentifier.icom.name == #"Icom inc."#)
        #expect(CompanyIdentifier.icom.description == #"Icom inc."#)
    
        // Oxstren Wearable Technologies Private Limited
        #expect(CompanyIdentifier.oxstrenWearableTechnologies.rawValue == 1142)
        #expect(CompanyIdentifier.oxstrenWearableTechnologies.name == #"Oxstren Wearable Technologies Private Limited"#)
        #expect(CompanyIdentifier.oxstrenWearableTechnologies.description == #"Oxstren Wearable Technologies Private Limited"#)
    
        // Blue Spark Technologies
        #expect(CompanyIdentifier.blueSparkTechnologies.rawValue == 1143)
        #expect(CompanyIdentifier.blueSparkTechnologies.name == #"Blue Spark Technologies"#)
        #expect(CompanyIdentifier.blueSparkTechnologies.description == #"Blue Spark Technologies"#)
    
        // FarSite Communications Limited
        #expect(CompanyIdentifier.farsiteCommunications.rawValue == 1144)
        #expect(CompanyIdentifier.farsiteCommunications.name == #"FarSite Communications Limited"#)
        #expect(CompanyIdentifier.farsiteCommunications.description == #"FarSite Communications Limited"#)
    
        // mywerk system GmbH
        #expect(CompanyIdentifier.mywerkSystem.rawValue == 1145)
        #expect(CompanyIdentifier.mywerkSystem.name == #"mywerk system GmbH"#)
        #expect(CompanyIdentifier.mywerkSystem.description == #"mywerk system GmbH"#)
    
        // Sinosun Technology Co., Ltd.
        #expect(CompanyIdentifier.sinosunTechnology.rawValue == 1146)
        #expect(CompanyIdentifier.sinosunTechnology.name == #"Sinosun Technology Co., Ltd."#)
        #expect(CompanyIdentifier.sinosunTechnology.description == #"Sinosun Technology Co., Ltd."#)
    
        // MIYOSHI ELECTRONICS CORPORATION
        #expect(CompanyIdentifier.miyoshiElectronics.rawValue == 1147)
        #expect(CompanyIdentifier.miyoshiElectronics.name == #"MIYOSHI ELECTRONICS CORPORATION"#)
        #expect(CompanyIdentifier.miyoshiElectronics.description == #"MIYOSHI ELECTRONICS CORPORATION"#)
    
        // POWERMAT LTD
        #expect(CompanyIdentifier.powermat.rawValue == 1148)
        #expect(CompanyIdentifier.powermat.name == #"POWERMAT LTD"#)
        #expect(CompanyIdentifier.powermat.description == #"POWERMAT LTD"#)
    
        // Occly LLC
        #expect(CompanyIdentifier.occly.rawValue == 1149)
        #expect(CompanyIdentifier.occly.name == #"Occly LLC"#)
        #expect(CompanyIdentifier.occly.description == #"Occly LLC"#)
    
        // OurHub Dev IvS
        #expect(CompanyIdentifier.ourhubDevIvs.rawValue == 1150)
        #expect(CompanyIdentifier.ourhubDevIvs.name == #"OurHub Dev IvS"#)
        #expect(CompanyIdentifier.ourhubDevIvs.description == #"OurHub Dev IvS"#)
    
        // Pro-Mark, Inc.
        #expect(CompanyIdentifier.proMark.rawValue == 1151)
        #expect(CompanyIdentifier.proMark.name == #"Pro-Mark, Inc."#)
        #expect(CompanyIdentifier.proMark.description == #"Pro-Mark, Inc."#)
    
        // Dynometrics Inc.
        #expect(CompanyIdentifier.dynometrics.rawValue == 1152)
        #expect(CompanyIdentifier.dynometrics.name == #"Dynometrics Inc."#)
        #expect(CompanyIdentifier.dynometrics.description == #"Dynometrics Inc."#)
    
        // Quintrax Limited
        #expect(CompanyIdentifier.quintrax.rawValue == 1153)
        #expect(CompanyIdentifier.quintrax.name == #"Quintrax Limited"#)
        #expect(CompanyIdentifier.quintrax.description == #"Quintrax Limited"#)
    
        // POS Tuning Udo Vosshenrich GmbH & Co. KG
        #expect(CompanyIdentifier.posTuningUdoVosshenrich.rawValue == 1154)
        #expect(CompanyIdentifier.posTuningUdoVosshenrich.name == #"POS Tuning Udo Vosshenrich GmbH & Co. KG"#)
        #expect(CompanyIdentifier.posTuningUdoVosshenrich.description == #"POS Tuning Udo Vosshenrich GmbH & Co. KG"#)
    
        // Multi Care Systems B.V.
        #expect(CompanyIdentifier.multiCareSystems.rawValue == 1155)
        #expect(CompanyIdentifier.multiCareSystems.name == #"Multi Care Systems B.V."#)
        #expect(CompanyIdentifier.multiCareSystems.description == #"Multi Care Systems B.V."#)
    
        // Revol Technologies Inc
        #expect(CompanyIdentifier.revolTechnologies.rawValue == 1156)
        #expect(CompanyIdentifier.revolTechnologies.name == #"Revol Technologies Inc"#)
        #expect(CompanyIdentifier.revolTechnologies.description == #"Revol Technologies Inc"#)
    
        // SKIDATA AG
        #expect(CompanyIdentifier.skidata.rawValue == 1157)
        #expect(CompanyIdentifier.skidata.name == #"SKIDATA AG"#)
        #expect(CompanyIdentifier.skidata.description == #"SKIDATA AG"#)
    
        // DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME
        #expect(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentos.rawValue == 1158)
        #expect(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentos.name == #"DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"#)
        #expect(CompanyIdentifier.devTecnologiaIndustriaComercioEManutencaoDeEquipamentos.description == #"DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"#)
    
        // Centrica Connected Home
        #expect(CompanyIdentifier.centricaConnectedHome.rawValue == 1159)
        #expect(CompanyIdentifier.centricaConnectedHome.name == #"Centrica Connected Home"#)
        #expect(CompanyIdentifier.centricaConnectedHome.description == #"Centrica Connected Home"#)
    
        // Automotive Data Solutions Inc
        #expect(CompanyIdentifier.automotiveDataSolutions.rawValue == 1160)
        #expect(CompanyIdentifier.automotiveDataSolutions.name == #"Automotive Data Solutions Inc"#)
        #expect(CompanyIdentifier.automotiveDataSolutions.description == #"Automotive Data Solutions Inc"#)
    
        // Igarashi Engineering
        #expect(CompanyIdentifier.igarashiEngineering.rawValue == 1161)
        #expect(CompanyIdentifier.igarashiEngineering.name == #"Igarashi Engineering"#)
        #expect(CompanyIdentifier.igarashiEngineering.description == #"Igarashi Engineering"#)
    
        // Taelek Oy
        #expect(CompanyIdentifier.taelek.rawValue == 1162)
        #expect(CompanyIdentifier.taelek.name == #"Taelek Oy"#)
        #expect(CompanyIdentifier.taelek.description == #"Taelek Oy"#)
    
        // CP Electronics Limited
        #expect(CompanyIdentifier.cpElectronics.rawValue == 1163)
        #expect(CompanyIdentifier.cpElectronics.name == #"CP Electronics Limited"#)
        #expect(CompanyIdentifier.cpElectronics.description == #"CP Electronics Limited"#)
    
        // Vectronix AG
        #expect(CompanyIdentifier.vectronix.rawValue == 1164)
        #expect(CompanyIdentifier.vectronix.name == #"Vectronix AG"#)
        #expect(CompanyIdentifier.vectronix.description == #"Vectronix AG"#)
    
        // S-Labs Sp. z o.o.
        #expect(CompanyIdentifier.sLabs.rawValue == 1165)
        #expect(CompanyIdentifier.sLabs.name == #"S-Labs Sp. z o.o."#)
        #expect(CompanyIdentifier.sLabs.description == #"S-Labs Sp. z o.o."#)
    
        // Companion Medical, Inc.
        #expect(CompanyIdentifier.companionMedical.rawValue == 1166)
        #expect(CompanyIdentifier.companionMedical.name == #"Companion Medical, Inc."#)
        #expect(CompanyIdentifier.companionMedical.description == #"Companion Medical, Inc."#)
    
        // BlueKitchen GmbH
        #expect(CompanyIdentifier.bluekitchen.rawValue == 1167)
        #expect(CompanyIdentifier.bluekitchen.name == #"BlueKitchen GmbH"#)
        #expect(CompanyIdentifier.bluekitchen.description == #"BlueKitchen GmbH"#)
    
        // Matting AB
        #expect(CompanyIdentifier.matting.rawValue == 1168)
        #expect(CompanyIdentifier.matting.name == #"Matting AB"#)
        #expect(CompanyIdentifier.matting.description == #"Matting AB"#)
    
        // SOREX - Wireless Solutions GmbH
        #expect(CompanyIdentifier.sorexWirelessSolutions.rawValue == 1169)
        #expect(CompanyIdentifier.sorexWirelessSolutions.name == #"SOREX - Wireless Solutions GmbH"#)
        #expect(CompanyIdentifier.sorexWirelessSolutions.description == #"SOREX - Wireless Solutions GmbH"#)
    
        // ADC Technology, Inc.
        #expect(CompanyIdentifier.adcTechnology.rawValue == 1170)
        #expect(CompanyIdentifier.adcTechnology.name == #"ADC Technology, Inc."#)
        #expect(CompanyIdentifier.adcTechnology.description == #"ADC Technology, Inc."#)
    
        // Lynxemi Pte Ltd
        #expect(CompanyIdentifier.lynxemiPte.rawValue == 1171)
        #expect(CompanyIdentifier.lynxemiPte.name == #"Lynxemi Pte Ltd"#)
        #expect(CompanyIdentifier.lynxemiPte.description == #"Lynxemi Pte Ltd"#)
    
        // SENNHEISER electronic GmbH & Co. KG
        #expect(CompanyIdentifier.sennheiserElectronic.rawValue == 1172)
        #expect(CompanyIdentifier.sennheiserElectronic.name == #"SENNHEISER electronic GmbH & Co. KG"#)
        #expect(CompanyIdentifier.sennheiserElectronic.description == #"SENNHEISER electronic GmbH & Co. KG"#)
    
        // LMT Mercer Group, Inc
        #expect(CompanyIdentifier.lmtMercerGroup.rawValue == 1173)
        #expect(CompanyIdentifier.lmtMercerGroup.name == #"LMT Mercer Group, Inc"#)
        #expect(CompanyIdentifier.lmtMercerGroup.description == #"LMT Mercer Group, Inc"#)
    
        // Polymorphic Labs LLC
        #expect(CompanyIdentifier.polymorphicLabs.rawValue == 1174)
        #expect(CompanyIdentifier.polymorphicLabs.name == #"Polymorphic Labs LLC"#)
        #expect(CompanyIdentifier.polymorphicLabs.description == #"Polymorphic Labs LLC"#)
    
        // Cochlear Limited
        #expect(CompanyIdentifier.cochlear.rawValue == 1175)
        #expect(CompanyIdentifier.cochlear.name == #"Cochlear Limited"#)
        #expect(CompanyIdentifier.cochlear.description == #"Cochlear Limited"#)
    
        // METER Group, Inc. USA
        #expect(CompanyIdentifier.meterGroup.rawValue == 1176)
        #expect(CompanyIdentifier.meterGroup.name == #"METER Group, Inc. USA"#)
        #expect(CompanyIdentifier.meterGroup.description == #"METER Group, Inc. USA"#)
    
        // Ruuvi Innovations Ltd.
        #expect(CompanyIdentifier.ruuviInnovations.rawValue == 1177)
        #expect(CompanyIdentifier.ruuviInnovations.name == #"Ruuvi Innovations Ltd."#)
        #expect(CompanyIdentifier.ruuviInnovations.description == #"Ruuvi Innovations Ltd."#)
    
        // Situne AS
        #expect(CompanyIdentifier.situne.rawValue == 1178)
        #expect(CompanyIdentifier.situne.name == #"Situne AS"#)
        #expect(CompanyIdentifier.situne.description == #"Situne AS"#)
    
        // nVisti, LLC
        #expect(CompanyIdentifier.nvisti.rawValue == 1179)
        #expect(CompanyIdentifier.nvisti.name == #"nVisti, LLC"#)
        #expect(CompanyIdentifier.nvisti.description == #"nVisti, LLC"#)
    
        // DyOcean
        #expect(CompanyIdentifier.dyocean.rawValue == 1180)
        #expect(CompanyIdentifier.dyocean.name == #"DyOcean"#)
        #expect(CompanyIdentifier.dyocean.description == #"DyOcean"#)
    
        // Uhlmann & Zacher GmbH
        #expect(CompanyIdentifier.uhlmannZacher.rawValue == 1181)
        #expect(CompanyIdentifier.uhlmannZacher.name == #"Uhlmann & Zacher GmbH"#)
        #expect(CompanyIdentifier.uhlmannZacher.description == #"Uhlmann & Zacher GmbH"#)
    
        // AND!XOR LLC
        #expect(CompanyIdentifier.andXor.rawValue == 1182)
        #expect(CompanyIdentifier.andXor.name == #"AND!XOR LLC"#)
        #expect(CompanyIdentifier.andXor.description == #"AND!XOR LLC"#)
    
        // Popper Pay AB
        #expect(CompanyIdentifier.popperPay.rawValue == 1183)
        #expect(CompanyIdentifier.popperPay.name == #"Popper Pay AB"#)
        #expect(CompanyIdentifier.popperPay.description == #"Popper Pay AB"#)
    
        // Vypin, LLC
        #expect(CompanyIdentifier.vypin.rawValue == 1184)
        #expect(CompanyIdentifier.vypin.name == #"Vypin, LLC"#)
        #expect(CompanyIdentifier.vypin.description == #"Vypin, LLC"#)
    
        // PNI Sensor Corporation
        #expect(CompanyIdentifier.pniSensor.rawValue == 1185)
        #expect(CompanyIdentifier.pniSensor.name == #"PNI Sensor Corporation"#)
        #expect(CompanyIdentifier.pniSensor.description == #"PNI Sensor Corporation"#)
    
        // ovrEngineered, LLC
        #expect(CompanyIdentifier.ovrengineered.rawValue == 1186)
        #expect(CompanyIdentifier.ovrengineered.name == #"ovrEngineered, LLC"#)
        #expect(CompanyIdentifier.ovrengineered.description == #"ovrEngineered, LLC"#)
    
        // GT-tronics HK Ltd
        #expect(CompanyIdentifier.gtTronics.rawValue == 1187)
        #expect(CompanyIdentifier.gtTronics.name == #"GT-tronics HK Ltd"#)
        #expect(CompanyIdentifier.gtTronics.description == #"GT-tronics HK Ltd"#)
    
        // Herbert Waldmann GmbH & Co. KG
        #expect(CompanyIdentifier.herbertWaldmann.rawValue == 1188)
        #expect(CompanyIdentifier.herbertWaldmann.name == #"Herbert Waldmann GmbH & Co. KG"#)
        #expect(CompanyIdentifier.herbertWaldmann.description == #"Herbert Waldmann GmbH & Co. KG"#)
    
        // Guangzhou FiiO Electronics Technology Co.,Ltd
        #expect(CompanyIdentifier.guangzhouFiioElectronicsTechnology.rawValue == 1189)
        #expect(CompanyIdentifier.guangzhouFiioElectronicsTechnology.name == #"Guangzhou FiiO Electronics Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.guangzhouFiioElectronicsTechnology.description == #"Guangzhou FiiO Electronics Technology Co.,Ltd"#)
    
        // Vinetech Co., Ltd
        #expect(CompanyIdentifier.vinetech.rawValue == 1190)
        #expect(CompanyIdentifier.vinetech.name == #"Vinetech Co., Ltd"#)
        #expect(CompanyIdentifier.vinetech.description == #"Vinetech Co., Ltd"#)
    
        // Dallas Logic Corporation
        #expect(CompanyIdentifier.dallasLogic.rawValue == 1191)
        #expect(CompanyIdentifier.dallasLogic.name == #"Dallas Logic Corporation"#)
        #expect(CompanyIdentifier.dallasLogic.description == #"Dallas Logic Corporation"#)
    
        // BioTex, Inc.
        #expect(CompanyIdentifier.biotex.rawValue == 1192)
        #expect(CompanyIdentifier.biotex.name == #"BioTex, Inc."#)
        #expect(CompanyIdentifier.biotex.description == #"BioTex, Inc."#)
    
        // DISCOVERY SOUND TECHNOLOGY, LLC
        #expect(CompanyIdentifier.discoverySoundTechnology.rawValue == 1193)
        #expect(CompanyIdentifier.discoverySoundTechnology.name == #"DISCOVERY SOUND TECHNOLOGY, LLC"#)
        #expect(CompanyIdentifier.discoverySoundTechnology.description == #"DISCOVERY SOUND TECHNOLOGY, LLC"#)
    
        // LINKIO SAS
        #expect(CompanyIdentifier.linkios.rawValue == 1194)
        #expect(CompanyIdentifier.linkios.name == #"LINKIO SAS"#)
        #expect(CompanyIdentifier.linkios.description == #"LINKIO SAS"#)
    
        // Harbortronics, Inc.
        #expect(CompanyIdentifier.harbortronics.rawValue == 1195)
        #expect(CompanyIdentifier.harbortronics.name == #"Harbortronics, Inc."#)
        #expect(CompanyIdentifier.harbortronics.description == #"Harbortronics, Inc."#)
    
        // Undagrid B.V.
        #expect(CompanyIdentifier.undagrid.rawValue == 1196)
        #expect(CompanyIdentifier.undagrid.name == #"Undagrid B.V."#)
        #expect(CompanyIdentifier.undagrid.description == #"Undagrid B.V."#)
    
        // Shure Inc
        #expect(CompanyIdentifier.shure.rawValue == 1197)
        #expect(CompanyIdentifier.shure.name == #"Shure Inc"#)
        #expect(CompanyIdentifier.shure.description == #"Shure Inc"#)
    
        // ERM Electronic Systems LTD
        #expect(CompanyIdentifier.ermElectronicSystems.rawValue == 1198)
        #expect(CompanyIdentifier.ermElectronicSystems.name == #"ERM Electronic Systems LTD"#)
        #expect(CompanyIdentifier.ermElectronicSystems.description == #"ERM Electronic Systems LTD"#)
    
        // BIOROWER Handelsagentur GmbH
        #expect(CompanyIdentifier.biorowerHandelsagentur.rawValue == 1199)
        #expect(CompanyIdentifier.biorowerHandelsagentur.name == #"BIOROWER Handelsagentur GmbH"#)
        #expect(CompanyIdentifier.biorowerHandelsagentur.description == #"BIOROWER Handelsagentur GmbH"#)
    
        // Weba Sport und Med. Artikel GmbH
        #expect(CompanyIdentifier.webaSportUndMedArtikel.rawValue == 1200)
        #expect(CompanyIdentifier.webaSportUndMedArtikel.name == #"Weba Sport und Med. Artikel GmbH"#)
        #expect(CompanyIdentifier.webaSportUndMedArtikel.description == #"Weba Sport und Med. Artikel GmbH"#)
    
        // Kartographers Technologies Pvt. Ltd.
        #expect(CompanyIdentifier.kartographersTechnologies.rawValue == 1201)
        #expect(CompanyIdentifier.kartographersTechnologies.name == #"Kartographers Technologies Pvt. Ltd."#)
        #expect(CompanyIdentifier.kartographersTechnologies.description == #"Kartographers Technologies Pvt. Ltd."#)
    
        // The Shadow on the Moon
        #expect(CompanyIdentifier.shadowOnMoon.rawValue == 1202)
        #expect(CompanyIdentifier.shadowOnMoon.name == #"The Shadow on the Moon"#)
        #expect(CompanyIdentifier.shadowOnMoon.description == #"The Shadow on the Moon"#)
    
        // mobike (Hong Kong) Limited
        #expect(CompanyIdentifier.mobikeHongKong.rawValue == 1203)
        #expect(CompanyIdentifier.mobikeHongKong.name == #"mobike (Hong Kong) Limited"#)
        #expect(CompanyIdentifier.mobikeHongKong.description == #"mobike (Hong Kong) Limited"#)
    
        // Inuheat Group AB
        #expect(CompanyIdentifier.inuheatGroup.rawValue == 1204)
        #expect(CompanyIdentifier.inuheatGroup.name == #"Inuheat Group AB"#)
        #expect(CompanyIdentifier.inuheatGroup.description == #"Inuheat Group AB"#)
    
        // Swiftronix AB
        #expect(CompanyIdentifier.swiftronix.rawValue == 1205)
        #expect(CompanyIdentifier.swiftronix.name == #"Swiftronix AB"#)
        #expect(CompanyIdentifier.swiftronix.description == #"Swiftronix AB"#)
    
        // Diagnoptics Technologies
        #expect(CompanyIdentifier.diagnopticsTechnologies.rawValue == 1206)
        #expect(CompanyIdentifier.diagnopticsTechnologies.name == #"Diagnoptics Technologies"#)
        #expect(CompanyIdentifier.diagnopticsTechnologies.description == #"Diagnoptics Technologies"#)
    
        // Analog Devices, Inc.
        #expect(CompanyIdentifier.analogDevices.rawValue == 1207)
        #expect(CompanyIdentifier.analogDevices.name == #"Analog Devices, Inc."#)
        #expect(CompanyIdentifier.analogDevices.description == #"Analog Devices, Inc."#)
    
        // Soraa Inc.
        #expect(CompanyIdentifier.soraa.rawValue == 1208)
        #expect(CompanyIdentifier.soraa.name == #"Soraa Inc."#)
        #expect(CompanyIdentifier.soraa.description == #"Soraa Inc."#)
    
        // CSR Building Products Limited
        #expect(CompanyIdentifier.csrBuildingProducts.rawValue == 1209)
        #expect(CompanyIdentifier.csrBuildingProducts.name == #"CSR Building Products Limited"#)
        #expect(CompanyIdentifier.csrBuildingProducts.description == #"CSR Building Products Limited"#)
    
        // Crestron Electronics, Inc.
        #expect(CompanyIdentifier.crestronElectronics.rawValue == 1210)
        #expect(CompanyIdentifier.crestronElectronics.name == #"Crestron Electronics, Inc."#)
        #expect(CompanyIdentifier.crestronElectronics.description == #"Crestron Electronics, Inc."#)
    
        // Neatebox Ltd
        #expect(CompanyIdentifier.neatebox.rawValue == 1211)
        #expect(CompanyIdentifier.neatebox.name == #"Neatebox Ltd"#)
        #expect(CompanyIdentifier.neatebox.description == #"Neatebox Ltd"#)
    
        // Draegerwerk AG & Co. KGaA
        #expect(CompanyIdentifier.draegerwerk.rawValue == 1212)
        #expect(CompanyIdentifier.draegerwerk.name == #"Draegerwerk AG & Co. KGaA"#)
        #expect(CompanyIdentifier.draegerwerk.description == #"Draegerwerk AG & Co. KGaA"#)
    
        // AlbynMedical
        #expect(CompanyIdentifier.albynmedical.rawValue == 1213)
        #expect(CompanyIdentifier.albynmedical.name == #"AlbynMedical"#)
        #expect(CompanyIdentifier.albynmedical.description == #"AlbynMedical"#)
    
        // Averos FZCO
        #expect(CompanyIdentifier.averos.rawValue == 1214)
        #expect(CompanyIdentifier.averos.name == #"Averos FZCO"#)
        #expect(CompanyIdentifier.averos.description == #"Averos FZCO"#)
    
        // VIT Initiative, LLC
        #expect(CompanyIdentifier.vitInitiative.rawValue == 1215)
        #expect(CompanyIdentifier.vitInitiative.name == #"VIT Initiative, LLC"#)
        #expect(CompanyIdentifier.vitInitiative.description == #"VIT Initiative, LLC"#)
    
        // Statsports International
        #expect(CompanyIdentifier.statsportsInternational.rawValue == 1216)
        #expect(CompanyIdentifier.statsportsInternational.name == #"Statsports International"#)
        #expect(CompanyIdentifier.statsportsInternational.description == #"Statsports International"#)
    
        // Sospitas, s.r.o.
        #expect(CompanyIdentifier.sospitas.rawValue == 1217)
        #expect(CompanyIdentifier.sospitas.name == #"Sospitas, s.r.o."#)
        #expect(CompanyIdentifier.sospitas.description == #"Sospitas, s.r.o."#)
    
        // Dmet Products Corp.
        #expect(CompanyIdentifier.dmetProducts.rawValue == 1218)
        #expect(CompanyIdentifier.dmetProducts.name == #"Dmet Products Corp."#)
        #expect(CompanyIdentifier.dmetProducts.description == #"Dmet Products Corp."#)
    
        // Mantracourt Electronics Limited
        #expect(CompanyIdentifier.mantracourtElectronics.rawValue == 1219)
        #expect(CompanyIdentifier.mantracourtElectronics.name == #"Mantracourt Electronics Limited"#)
        #expect(CompanyIdentifier.mantracourtElectronics.description == #"Mantracourt Electronics Limited"#)
    
        // TeAM Hutchins AB
        #expect(CompanyIdentifier.teamHutchins.rawValue == 1220)
        #expect(CompanyIdentifier.teamHutchins.name == #"TeAM Hutchins AB"#)
        #expect(CompanyIdentifier.teamHutchins.description == #"TeAM Hutchins AB"#)
    
        // Seibert Williams Glass, LLC
        #expect(CompanyIdentifier.seibertWilliamsGlass.rawValue == 1221)
        #expect(CompanyIdentifier.seibertWilliamsGlass.name == #"Seibert Williams Glass, LLC"#)
        #expect(CompanyIdentifier.seibertWilliamsGlass.description == #"Seibert Williams Glass, LLC"#)
    
        // Insta GmbH
        #expect(CompanyIdentifier.insta.rawValue == 1222)
        #expect(CompanyIdentifier.insta.name == #"Insta GmbH"#)
        #expect(CompanyIdentifier.insta.description == #"Insta GmbH"#)
    
        // Svantek Sp. z o.o.
        #expect(CompanyIdentifier.svantek.rawValue == 1223)
        #expect(CompanyIdentifier.svantek.name == #"Svantek Sp. z o.o."#)
        #expect(CompanyIdentifier.svantek.description == #"Svantek Sp. z o.o."#)
    
        // Shanghai Flyco Electrical Appliance Co., Ltd.
        #expect(CompanyIdentifier.shanghaiFlycoElectricalAppliance.rawValue == 1224)
        #expect(CompanyIdentifier.shanghaiFlycoElectricalAppliance.name == #"Shanghai Flyco Electrical Appliance Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiFlycoElectricalAppliance.description == #"Shanghai Flyco Electrical Appliance Co., Ltd."#)
    
        // Thornwave Labs Inc
        #expect(CompanyIdentifier.thornwaveLabs.rawValue == 1225)
        #expect(CompanyIdentifier.thornwaveLabs.name == #"Thornwave Labs Inc"#)
        #expect(CompanyIdentifier.thornwaveLabs.description == #"Thornwave Labs Inc"#)
    
        // Steiner-Optik GmbH
        #expect(CompanyIdentifier.steinerOptik.rawValue == 1226)
        #expect(CompanyIdentifier.steinerOptik.name == #"Steiner-Optik GmbH"#)
        #expect(CompanyIdentifier.steinerOptik.description == #"Steiner-Optik GmbH"#)
    
        // Novo Nordisk A/S
        #expect(CompanyIdentifier.novoNordisk.rawValue == 1227)
        #expect(CompanyIdentifier.novoNordisk.name == #"Novo Nordisk A/S"#)
        #expect(CompanyIdentifier.novoNordisk.description == #"Novo Nordisk A/S"#)
    
        // Enflux Inc.
        #expect(CompanyIdentifier.enflux.rawValue == 1228)
        #expect(CompanyIdentifier.enflux.name == #"Enflux Inc."#)
        #expect(CompanyIdentifier.enflux.description == #"Enflux Inc."#)
    
        // Safetech Products LLC
        #expect(CompanyIdentifier.safetechProducts.rawValue == 1229)
        #expect(CompanyIdentifier.safetechProducts.name == #"Safetech Products LLC"#)
        #expect(CompanyIdentifier.safetechProducts.description == #"Safetech Products LLC"#)
    
        // GOOOLED S.R.L.
        #expect(CompanyIdentifier.goooled.rawValue == 1230)
        #expect(CompanyIdentifier.goooled.name == #"GOOOLED S.R.L."#)
        #expect(CompanyIdentifier.goooled.description == #"GOOOLED S.R.L."#)
    
        // DOM Sicherheitstechnik GmbH & Co. KG
        #expect(CompanyIdentifier.domSicherheitstechnik.rawValue == 1231)
        #expect(CompanyIdentifier.domSicherheitstechnik.name == #"DOM Sicherheitstechnik GmbH & Co. KG"#)
        #expect(CompanyIdentifier.domSicherheitstechnik.description == #"DOM Sicherheitstechnik GmbH & Co. KG"#)
    
        // Olympus Corporation
        #expect(CompanyIdentifier.olympus.rawValue == 1232)
        #expect(CompanyIdentifier.olympus.name == #"Olympus Corporation"#)
        #expect(CompanyIdentifier.olympus.description == #"Olympus Corporation"#)
    
        // KTS GmbH
        #expect(CompanyIdentifier.kts.rawValue == 1233)
        #expect(CompanyIdentifier.kts.name == #"KTS GmbH"#)
        #expect(CompanyIdentifier.kts.description == #"KTS GmbH"#)
    
        // Anloq Technologies Inc.
        #expect(CompanyIdentifier.anloqTechnologies.rawValue == 1234)
        #expect(CompanyIdentifier.anloqTechnologies.name == #"Anloq Technologies Inc."#)
        #expect(CompanyIdentifier.anloqTechnologies.description == #"Anloq Technologies Inc."#)
    
        // Queercon, Inc
        #expect(CompanyIdentifier.queercon.rawValue == 1235)
        #expect(CompanyIdentifier.queercon.name == #"Queercon, Inc"#)
        #expect(CompanyIdentifier.queercon.description == #"Queercon, Inc"#)
    
        // 5th Element Ltd
        #expect(CompanyIdentifier.company5ThElement.rawValue == 1236)
        #expect(CompanyIdentifier.company5ThElement.name == #"5th Element Ltd"#)
        #expect(CompanyIdentifier.company5ThElement.description == #"5th Element Ltd"#)
    
        // Gooee Limited
        #expect(CompanyIdentifier.gooee.rawValue == 1237)
        #expect(CompanyIdentifier.gooee.name == #"Gooee Limited"#)
        #expect(CompanyIdentifier.gooee.description == #"Gooee Limited"#)
    
        // LUGLOC LLC
        #expect(CompanyIdentifier.lugloc.rawValue == 1238)
        #expect(CompanyIdentifier.lugloc.name == #"LUGLOC LLC"#)
        #expect(CompanyIdentifier.lugloc.description == #"LUGLOC LLC"#)
    
        // Blincam, Inc.
        #expect(CompanyIdentifier.blincam.rawValue == 1239)
        #expect(CompanyIdentifier.blincam.name == #"Blincam, Inc."#)
        #expect(CompanyIdentifier.blincam.description == #"Blincam, Inc."#)
    
        // FUJIFILM Corporation
        #expect(CompanyIdentifier.fujifilm.rawValue == 1240)
        #expect(CompanyIdentifier.fujifilm.name == #"FUJIFILM Corporation"#)
        #expect(CompanyIdentifier.fujifilm.description == #"FUJIFILM Corporation"#)
    
        // RM Acquisition LLC
        #expect(CompanyIdentifier.rmAcquisition.rawValue == 1241)
        #expect(CompanyIdentifier.rmAcquisition.name == #"RM Acquisition LLC"#)
        #expect(CompanyIdentifier.rmAcquisition.description == #"RM Acquisition LLC"#)
    
        // Franceschi Marina snc
        #expect(CompanyIdentifier.franceschiMarinaSnc.rawValue == 1242)
        #expect(CompanyIdentifier.franceschiMarinaSnc.name == #"Franceschi Marina snc"#)
        #expect(CompanyIdentifier.franceschiMarinaSnc.description == #"Franceschi Marina snc"#)
    
        // Engineered Audio, LLC.
        #expect(CompanyIdentifier.engineeredAudio.rawValue == 1243)
        #expect(CompanyIdentifier.engineeredAudio.name == #"Engineered Audio, LLC."#)
        #expect(CompanyIdentifier.engineeredAudio.description == #"Engineered Audio, LLC."#)
    
        // IOTTIVE (OPC) PRIVATE LIMITED
        #expect(CompanyIdentifier.iottiveOpc.rawValue == 1244)
        #expect(CompanyIdentifier.iottiveOpc.name == #"IOTTIVE (OPC) PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.iottiveOpc.description == #"IOTTIVE (OPC) PRIVATE LIMITED"#)
    
        // 4MOD Technology
        #expect(CompanyIdentifier.company4ModTechnology.rawValue == 1245)
        #expect(CompanyIdentifier.company4ModTechnology.name == #"4MOD Technology"#)
        #expect(CompanyIdentifier.company4ModTechnology.description == #"4MOD Technology"#)
    
        // Lutron Electronics Co., Inc.
        #expect(CompanyIdentifier.lutronElectronics.rawValue == 1246)
        #expect(CompanyIdentifier.lutronElectronics.name == #"Lutron Electronics Co., Inc."#)
        #expect(CompanyIdentifier.lutronElectronics.description == #"Lutron Electronics Co., Inc."#)
    
        // Emerson Electric Co.
        #expect(CompanyIdentifier.emersonElectric.rawValue == 1247)
        #expect(CompanyIdentifier.emersonElectric.name == #"Emerson Electric Co."#)
        #expect(CompanyIdentifier.emersonElectric.description == #"Emerson Electric Co."#)
    
        // Guardtec, Inc.
        #expect(CompanyIdentifier.guardtec.rawValue == 1248)
        #expect(CompanyIdentifier.guardtec.name == #"Guardtec, Inc."#)
        #expect(CompanyIdentifier.guardtec.description == #"Guardtec, Inc."#)
    
        // REACTEC LIMITED
        #expect(CompanyIdentifier.reactec.rawValue == 1249)
        #expect(CompanyIdentifier.reactec.name == #"REACTEC LIMITED"#)
        #expect(CompanyIdentifier.reactec.description == #"REACTEC LIMITED"#)
    
        // EllieGrid
        #expect(CompanyIdentifier.elliegrid.rawValue == 1250)
        #expect(CompanyIdentifier.elliegrid.name == #"EllieGrid"#)
        #expect(CompanyIdentifier.elliegrid.description == #"EllieGrid"#)
    
        // Under Armour
        #expect(CompanyIdentifier.underArmour.rawValue == 1251)
        #expect(CompanyIdentifier.underArmour.name == #"Under Armour"#)
        #expect(CompanyIdentifier.underArmour.description == #"Under Armour"#)
    
        // Woodenshark
        #expect(CompanyIdentifier.woodenshark.rawValue == 1252)
        #expect(CompanyIdentifier.woodenshark.name == #"Woodenshark"#)
        #expect(CompanyIdentifier.woodenshark.description == #"Woodenshark"#)
    
        // Avack Oy
        #expect(CompanyIdentifier.avack.rawValue == 1253)
        #expect(CompanyIdentifier.avack.name == #"Avack Oy"#)
        #expect(CompanyIdentifier.avack.description == #"Avack Oy"#)
    
        // Smart Solution Technology, Inc.
        #expect(CompanyIdentifier.smartSolutionTechnology.rawValue == 1254)
        #expect(CompanyIdentifier.smartSolutionTechnology.name == #"Smart Solution Technology, Inc."#)
        #expect(CompanyIdentifier.smartSolutionTechnology.description == #"Smart Solution Technology, Inc."#)
    
        // REHABTRONICS INC.
        #expect(CompanyIdentifier.rehabtronics.rawValue == 1255)
        #expect(CompanyIdentifier.rehabtronics.name == #"REHABTRONICS INC."#)
        #expect(CompanyIdentifier.rehabtronics.description == #"REHABTRONICS INC."#)
    
        // STABILO International
        #expect(CompanyIdentifier.stabiloInternational.rawValue == 1256)
        #expect(CompanyIdentifier.stabiloInternational.name == #"STABILO International"#)
        #expect(CompanyIdentifier.stabiloInternational.description == #"STABILO International"#)
    
        // Busch Jaeger Elektro GmbH
        #expect(CompanyIdentifier.buschJaegerElektro.rawValue == 1257)
        #expect(CompanyIdentifier.buschJaegerElektro.name == #"Busch Jaeger Elektro GmbH"#)
        #expect(CompanyIdentifier.buschJaegerElektro.description == #"Busch Jaeger Elektro GmbH"#)
    
        // Pacific Bioscience Laboratories, Inc
        #expect(CompanyIdentifier.pacificBioscienceLaboratories.rawValue == 1258)
        #expect(CompanyIdentifier.pacificBioscienceLaboratories.name == #"Pacific Bioscience Laboratories, Inc"#)
        #expect(CompanyIdentifier.pacificBioscienceLaboratories.description == #"Pacific Bioscience Laboratories, Inc"#)
    
        // Bird Home Automation GmbH
        #expect(CompanyIdentifier.birdHomeAutomation.rawValue == 1259)
        #expect(CompanyIdentifier.birdHomeAutomation.name == #"Bird Home Automation GmbH"#)
        #expect(CompanyIdentifier.birdHomeAutomation.description == #"Bird Home Automation GmbH"#)
    
        // Motorola Solutions
        #expect(CompanyIdentifier.motorolaSolutions.rawValue == 1260)
        #expect(CompanyIdentifier.motorolaSolutions.name == #"Motorola Solutions"#)
        #expect(CompanyIdentifier.motorolaSolutions.description == #"Motorola Solutions"#)
    
        // R9 Technology, Inc.
        #expect(CompanyIdentifier.r9Technology.rawValue == 1261)
        #expect(CompanyIdentifier.r9Technology.name == #"R9 Technology, Inc."#)
        #expect(CompanyIdentifier.r9Technology.description == #"R9 Technology, Inc."#)
    
        // Auxivia
        #expect(CompanyIdentifier.auxivia.rawValue == 1262)
        #expect(CompanyIdentifier.auxivia.name == #"Auxivia"#)
        #expect(CompanyIdentifier.auxivia.description == #"Auxivia"#)
    
        // DaisyWorks, Inc
        #expect(CompanyIdentifier.daisyworks.rawValue == 1263)
        #expect(CompanyIdentifier.daisyworks.name == #"DaisyWorks, Inc"#)
        #expect(CompanyIdentifier.daisyworks.description == #"DaisyWorks, Inc"#)
    
        // Kosi Limited
        #expect(CompanyIdentifier.kosi.rawValue == 1264)
        #expect(CompanyIdentifier.kosi.name == #"Kosi Limited"#)
        #expect(CompanyIdentifier.kosi.description == #"Kosi Limited"#)
    
        // Theben AG
        #expect(CompanyIdentifier.theben.rawValue == 1265)
        #expect(CompanyIdentifier.theben.name == #"Theben AG"#)
        #expect(CompanyIdentifier.theben.description == #"Theben AG"#)
    
        // InDreamer Techsol Private Limited
        #expect(CompanyIdentifier.indreamerTechsol.rawValue == 1266)
        #expect(CompanyIdentifier.indreamerTechsol.name == #"InDreamer Techsol Private Limited"#)
        #expect(CompanyIdentifier.indreamerTechsol.description == #"InDreamer Techsol Private Limited"#)
    
        // Cerevast Medical
        #expect(CompanyIdentifier.cerevastMedical.rawValue == 1267)
        #expect(CompanyIdentifier.cerevastMedical.name == #"Cerevast Medical"#)
        #expect(CompanyIdentifier.cerevastMedical.description == #"Cerevast Medical"#)
    
        // ZanCompute Inc.
        #expect(CompanyIdentifier.zancompute.rawValue == 1268)
        #expect(CompanyIdentifier.zancompute.name == #"ZanCompute Inc."#)
        #expect(CompanyIdentifier.zancompute.description == #"ZanCompute Inc."#)
    
        // Pirelli Tyre S.P.A.
        #expect(CompanyIdentifier.pirelliTyre.rawValue == 1269)
        #expect(CompanyIdentifier.pirelliTyre.name == #"Pirelli Tyre S.P.A."#)
        #expect(CompanyIdentifier.pirelliTyre.description == #"Pirelli Tyre S.P.A."#)
    
        // McLear Limited
        #expect(CompanyIdentifier.mclear.rawValue == 1270)
        #expect(CompanyIdentifier.mclear.name == #"McLear Limited"#)
        #expect(CompanyIdentifier.mclear.description == #"McLear Limited"#)
    
        // Shenzhen Goodix Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenGoodixTechnology.rawValue == 1271)
        #expect(CompanyIdentifier.shenzhenGoodixTechnology.name == #"Shenzhen Goodix Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenGoodixTechnology.description == #"Shenzhen Goodix Technology Co., Ltd"#)
    
        // Convergence Systems Limited
        #expect(CompanyIdentifier.convergenceSystems.rawValue == 1272)
        #expect(CompanyIdentifier.convergenceSystems.name == #"Convergence Systems Limited"#)
        #expect(CompanyIdentifier.convergenceSystems.description == #"Convergence Systems Limited"#)
    
        // Interactio
        #expect(CompanyIdentifier.interactio.rawValue == 1273)
        #expect(CompanyIdentifier.interactio.name == #"Interactio"#)
        #expect(CompanyIdentifier.interactio.description == #"Interactio"#)
    
        // Androtec GmbH
        #expect(CompanyIdentifier.androtec.rawValue == 1274)
        #expect(CompanyIdentifier.androtec.name == #"Androtec GmbH"#)
        #expect(CompanyIdentifier.androtec.description == #"Androtec GmbH"#)
    
        // Benchmark Drives GmbH & Co. KG
        #expect(CompanyIdentifier.benchmarkDrives.rawValue == 1275)
        #expect(CompanyIdentifier.benchmarkDrives.name == #"Benchmark Drives GmbH & Co. KG"#)
        #expect(CompanyIdentifier.benchmarkDrives.description == #"Benchmark Drives GmbH & Co. KG"#)
    
        // SwingLync L. L. C.
        #expect(CompanyIdentifier.swinglyncLLC.rawValue == 1276)
        #expect(CompanyIdentifier.swinglyncLLC.name == #"SwingLync L. L. C."#)
        #expect(CompanyIdentifier.swinglyncLLC.description == #"SwingLync L. L. C."#)
    
        // Tapkey GmbH
        #expect(CompanyIdentifier.tapkey.rawValue == 1277)
        #expect(CompanyIdentifier.tapkey.name == #"Tapkey GmbH"#)
        #expect(CompanyIdentifier.tapkey.description == #"Tapkey GmbH"#)
    
        // Woosim Systems Inc.
        #expect(CompanyIdentifier.woosimSystems.rawValue == 1278)
        #expect(CompanyIdentifier.woosimSystems.name == #"Woosim Systems Inc."#)
        #expect(CompanyIdentifier.woosimSystems.description == #"Woosim Systems Inc."#)
    
        // Microsemi Corporation
        #expect(CompanyIdentifier.microsemi.rawValue == 1279)
        #expect(CompanyIdentifier.microsemi.name == #"Microsemi Corporation"#)
        #expect(CompanyIdentifier.microsemi.description == #"Microsemi Corporation"#)
    
        // Wiliot LTD.
        #expect(CompanyIdentifier.wiliot.rawValue == 1280)
        #expect(CompanyIdentifier.wiliot.name == #"Wiliot LTD."#)
        #expect(CompanyIdentifier.wiliot.description == #"Wiliot LTD."#)
    
        // Polaris IND
        #expect(CompanyIdentifier.polarisInd.rawValue == 1281)
        #expect(CompanyIdentifier.polarisInd.name == #"Polaris IND"#)
        #expect(CompanyIdentifier.polarisInd.description == #"Polaris IND"#)
    
        // Specifi-Kali LLC
        #expect(CompanyIdentifier.specifiKali.rawValue == 1282)
        #expect(CompanyIdentifier.specifiKali.name == #"Specifi-Kali LLC"#)
        #expect(CompanyIdentifier.specifiKali.description == #"Specifi-Kali LLC"#)
    
        // Locoroll, Inc
        #expect(CompanyIdentifier.locoroll.rawValue == 1283)
        #expect(CompanyIdentifier.locoroll.name == #"Locoroll, Inc"#)
        #expect(CompanyIdentifier.locoroll.description == #"Locoroll, Inc"#)
    
        // PHYPLUS Inc
        #expect(CompanyIdentifier.phyplus.rawValue == 1284)
        #expect(CompanyIdentifier.phyplus.name == #"PHYPLUS Inc"#)
        #expect(CompanyIdentifier.phyplus.description == #"PHYPLUS Inc"#)
    
        // InPlay, Inc.
        #expect(CompanyIdentifier.inplay.rawValue == 1285)
        #expect(CompanyIdentifier.inplay.name == #"InPlay, Inc."#)
        #expect(CompanyIdentifier.inplay.description == #"InPlay, Inc."#)
    
        // Hager
        #expect(CompanyIdentifier.hager.rawValue == 1286)
        #expect(CompanyIdentifier.hager.name == #"Hager"#)
        #expect(CompanyIdentifier.hager.description == #"Hager"#)
    
        // Yellowcog
        #expect(CompanyIdentifier.yellowcog.rawValue == 1287)
        #expect(CompanyIdentifier.yellowcog.name == #"Yellowcog"#)
        #expect(CompanyIdentifier.yellowcog.description == #"Yellowcog"#)
    
        // Axes System sp. z o. o.
        #expect(CompanyIdentifier.axesSystemSpZOO.rawValue == 1288)
        #expect(CompanyIdentifier.axesSystemSpZOO.name == #"Axes System sp. z o. o."#)
        #expect(CompanyIdentifier.axesSystemSpZOO.description == #"Axes System sp. z o. o."#)
    
        // Garage Smart, Inc.
        #expect(CompanyIdentifier.garageSmart.rawValue == 1289)
        #expect(CompanyIdentifier.garageSmart.name == #"Garage Smart, Inc."#)
        #expect(CompanyIdentifier.garageSmart.description == #"Garage Smart, Inc."#)
    
        // Shake-on B.V.
        #expect(CompanyIdentifier.shakeOn.rawValue == 1290)
        #expect(CompanyIdentifier.shakeOn.name == #"Shake-on B.V."#)
        #expect(CompanyIdentifier.shakeOn.description == #"Shake-on B.V."#)
    
        // Vibrissa Inc.
        #expect(CompanyIdentifier.vibrissa.rawValue == 1291)
        #expect(CompanyIdentifier.vibrissa.name == #"Vibrissa Inc."#)
        #expect(CompanyIdentifier.vibrissa.description == #"Vibrissa Inc."#)
    
        // OSRAM GmbH
        #expect(CompanyIdentifier.osram.rawValue == 1292)
        #expect(CompanyIdentifier.osram.name == #"OSRAM GmbH"#)
        #expect(CompanyIdentifier.osram.description == #"OSRAM GmbH"#)
    
        // TRSystems GmbH
        #expect(CompanyIdentifier.trsystems.rawValue == 1293)
        #expect(CompanyIdentifier.trsystems.name == #"TRSystems GmbH"#)
        #expect(CompanyIdentifier.trsystems.description == #"TRSystems GmbH"#)
    
        // Yichip Microelectronics (Hangzhou) Co.,Ltd.
        #expect(CompanyIdentifier.yichipMicroelectronicsHangzhou.rawValue == 1294)
        #expect(CompanyIdentifier.yichipMicroelectronicsHangzhou.name == #"Yichip Microelectronics (Hangzhou) Co.,Ltd."#)
        #expect(CompanyIdentifier.yichipMicroelectronicsHangzhou.description == #"Yichip Microelectronics (Hangzhou) Co.,Ltd."#)
    
        // Foundation Engineering LLC
        #expect(CompanyIdentifier.foundationEngineering.rawValue == 1295)
        #expect(CompanyIdentifier.foundationEngineering.name == #"Foundation Engineering LLC"#)
        #expect(CompanyIdentifier.foundationEngineering.description == #"Foundation Engineering LLC"#)
    
        // UNI-ELECTRONICS, INC.
        #expect(CompanyIdentifier.uniElectronics.rawValue == 1296)
        #expect(CompanyIdentifier.uniElectronics.name == #"UNI-ELECTRONICS, INC."#)
        #expect(CompanyIdentifier.uniElectronics.description == #"UNI-ELECTRONICS, INC."#)
    
        // Brookfield Equinox LLC
        #expect(CompanyIdentifier.brookfieldEquinox.rawValue == 1297)
        #expect(CompanyIdentifier.brookfieldEquinox.name == #"Brookfield Equinox LLC"#)
        #expect(CompanyIdentifier.brookfieldEquinox.description == #"Brookfield Equinox LLC"#)
    
        // Soprod SA
        #expect(CompanyIdentifier.soprod.rawValue == 1298)
        #expect(CompanyIdentifier.soprod.name == #"Soprod SA"#)
        #expect(CompanyIdentifier.soprod.description == #"Soprod SA"#)
    
        // 9974091 Canada Inc.
        #expect(CompanyIdentifier.company9974091Canada.rawValue == 1299)
        #expect(CompanyIdentifier.company9974091Canada.name == #"9974091 Canada Inc."#)
        #expect(CompanyIdentifier.company9974091Canada.description == #"9974091 Canada Inc."#)
    
        // FIBRO GmbH
        #expect(CompanyIdentifier.fibro.rawValue == 1300)
        #expect(CompanyIdentifier.fibro.name == #"FIBRO GmbH"#)
        #expect(CompanyIdentifier.fibro.description == #"FIBRO GmbH"#)
    
        // RB Controls Co., Ltd.
        #expect(CompanyIdentifier.rbControls.rawValue == 1301)
        #expect(CompanyIdentifier.rbControls.name == #"RB Controls Co., Ltd."#)
        #expect(CompanyIdentifier.rbControls.description == #"RB Controls Co., Ltd."#)
    
        // Footmarks
        #expect(CompanyIdentifier.footmarks.rawValue == 1302)
        #expect(CompanyIdentifier.footmarks.name == #"Footmarks"#)
        #expect(CompanyIdentifier.footmarks.description == #"Footmarks"#)
    
        // Amtronic Sverige AB
        #expect(CompanyIdentifier.amtronicSverige.rawValue == 1303)
        #expect(CompanyIdentifier.amtronicSverige.name == #"Amtronic Sverige AB"#)
        #expect(CompanyIdentifier.amtronicSverige.description == #"Amtronic Sverige AB"#)
    
        // MAMORIO.inc
        #expect(CompanyIdentifier.mamorioInc.rawValue == 1304)
        #expect(CompanyIdentifier.mamorioInc.name == #"MAMORIO.inc"#)
        #expect(CompanyIdentifier.mamorioInc.description == #"MAMORIO.inc"#)
    
        // Tyto Life LLC
        #expect(CompanyIdentifier.tytoLife.rawValue == 1305)
        #expect(CompanyIdentifier.tytoLife.name == #"Tyto Life LLC"#)
        #expect(CompanyIdentifier.tytoLife.description == #"Tyto Life LLC"#)
    
        // Leica Camera AG
        #expect(CompanyIdentifier.leicaCamera.rawValue == 1306)
        #expect(CompanyIdentifier.leicaCamera.name == #"Leica Camera AG"#)
        #expect(CompanyIdentifier.leicaCamera.description == #"Leica Camera AG"#)
    
        // Angee Technologies Ltd.
        #expect(CompanyIdentifier.angeeTechnologies.rawValue == 1307)
        #expect(CompanyIdentifier.angeeTechnologies.name == #"Angee Technologies Ltd."#)
        #expect(CompanyIdentifier.angeeTechnologies.description == #"Angee Technologies Ltd."#)
    
        // EDPS
        #expect(CompanyIdentifier.edps.rawValue == 1308)
        #expect(CompanyIdentifier.edps.name == #"EDPS"#)
        #expect(CompanyIdentifier.edps.description == #"EDPS"#)
    
        // OFF Line Co., Ltd.
        #expect(CompanyIdentifier.offLine.rawValue == 1309)
        #expect(CompanyIdentifier.offLine.name == #"OFF Line Co., Ltd."#)
        #expect(CompanyIdentifier.offLine.description == #"OFF Line Co., Ltd."#)
    
        // Detect Blue Limited
        #expect(CompanyIdentifier.detectBlue.rawValue == 1310)
        #expect(CompanyIdentifier.detectBlue.name == #"Detect Blue Limited"#)
        #expect(CompanyIdentifier.detectBlue.description == #"Detect Blue Limited"#)
    
        // Setec Pty Ltd
        #expect(CompanyIdentifier.setec.rawValue == 1311)
        #expect(CompanyIdentifier.setec.name == #"Setec Pty Ltd"#)
        #expect(CompanyIdentifier.setec.description == #"Setec Pty Ltd"#)
    
        // Target Corporation
        #expect(CompanyIdentifier.target.rawValue == 1312)
        #expect(CompanyIdentifier.target.name == #"Target Corporation"#)
        #expect(CompanyIdentifier.target.description == #"Target Corporation"#)
    
        // IAI Corporation
        #expect(CompanyIdentifier.iai.rawValue == 1313)
        #expect(CompanyIdentifier.iai.name == #"IAI Corporation"#)
        #expect(CompanyIdentifier.iai.description == #"IAI Corporation"#)
    
        // NS Tech, Inc.
        #expect(CompanyIdentifier.nsTech.rawValue == 1314)
        #expect(CompanyIdentifier.nsTech.name == #"NS Tech, Inc."#)
        #expect(CompanyIdentifier.nsTech.description == #"NS Tech, Inc."#)
    
        // MTG Co., Ltd.
        #expect(CompanyIdentifier.mtg.rawValue == 1315)
        #expect(CompanyIdentifier.mtg.name == #"MTG Co., Ltd."#)
        #expect(CompanyIdentifier.mtg.description == #"MTG Co., Ltd."#)
    
        // Hangzhou iMagic Technology Co., Ltd
        #expect(CompanyIdentifier.hangzhouImagicTechnology.rawValue == 1316)
        #expect(CompanyIdentifier.hangzhouImagicTechnology.name == #"Hangzhou iMagic Technology Co., Ltd"#)
        #expect(CompanyIdentifier.hangzhouImagicTechnology.description == #"Hangzhou iMagic Technology Co., Ltd"#)
    
        // HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED
        #expect(CompanyIdentifier.hongkongNanoIcTechnologies.rawValue == 1317)
        #expect(CompanyIdentifier.hongkongNanoIcTechnologies.name == #"HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED"#)
        #expect(CompanyIdentifier.hongkongNanoIcTechnologies.description == #"HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED"#)
    
        // Honeywell International Inc.
        #expect(CompanyIdentifier.honeywellInternational.rawValue == 1318)
        #expect(CompanyIdentifier.honeywellInternational.name == #"Honeywell International Inc."#)
        #expect(CompanyIdentifier.honeywellInternational.description == #"Honeywell International Inc."#)
    
        // Albrecht JUNG
        #expect(CompanyIdentifier.albrechtJung.rawValue == 1319)
        #expect(CompanyIdentifier.albrechtJung.name == #"Albrecht JUNG"#)
        #expect(CompanyIdentifier.albrechtJung.description == #"Albrecht JUNG"#)
    
        // Lunera Lighting Inc.
        #expect(CompanyIdentifier.luneraLighting.rawValue == 1320)
        #expect(CompanyIdentifier.luneraLighting.name == #"Lunera Lighting Inc."#)
        #expect(CompanyIdentifier.luneraLighting.description == #"Lunera Lighting Inc."#)
    
        // Lumen UAB
        #expect(CompanyIdentifier.lumenUab.rawValue == 1321)
        #expect(CompanyIdentifier.lumenUab.name == #"Lumen UAB"#)
        #expect(CompanyIdentifier.lumenUab.description == #"Lumen UAB"#)
    
        // Keynes Controls Ltd
        #expect(CompanyIdentifier.keynesControls.rawValue == 1322)
        #expect(CompanyIdentifier.keynesControls.name == #"Keynes Controls Ltd"#)
        #expect(CompanyIdentifier.keynesControls.description == #"Keynes Controls Ltd"#)
    
        // Novartis AG
        #expect(CompanyIdentifier.novartis.rawValue == 1323)
        #expect(CompanyIdentifier.novartis.name == #"Novartis AG"#)
        #expect(CompanyIdentifier.novartis.description == #"Novartis AG"#)
    
        // Geosatis SA
        #expect(CompanyIdentifier.geosatis.rawValue == 1324)
        #expect(CompanyIdentifier.geosatis.name == #"Geosatis SA"#)
        #expect(CompanyIdentifier.geosatis.description == #"Geosatis SA"#)
    
        // EXFO, Inc.
        #expect(CompanyIdentifier.exfo.rawValue == 1325)
        #expect(CompanyIdentifier.exfo.name == #"EXFO, Inc."#)
        #expect(CompanyIdentifier.exfo.description == #"EXFO, Inc."#)
    
        // LEDVANCE GmbH
        #expect(CompanyIdentifier.ledvance.rawValue == 1326)
        #expect(CompanyIdentifier.ledvance.name == #"LEDVANCE GmbH"#)
        #expect(CompanyIdentifier.ledvance.description == #"LEDVANCE GmbH"#)
    
        // Center ID Corp.
        #expect(CompanyIdentifier.centerId.rawValue == 1327)
        #expect(CompanyIdentifier.centerId.name == #"Center ID Corp."#)
        #expect(CompanyIdentifier.centerId.description == #"Center ID Corp."#)
    
        // Adolene, Inc.
        #expect(CompanyIdentifier.adolene.rawValue == 1328)
        #expect(CompanyIdentifier.adolene.name == #"Adolene, Inc."#)
        #expect(CompanyIdentifier.adolene.description == #"Adolene, Inc."#)
    
        // D&M Holdings Inc.
        #expect(CompanyIdentifier.dMHoldings.rawValue == 1329)
        #expect(CompanyIdentifier.dMHoldings.name == #"D&M Holdings Inc."#)
        #expect(CompanyIdentifier.dMHoldings.description == #"D&M Holdings Inc."#)
    
        // CRESCO Wireless, Inc.
        #expect(CompanyIdentifier.crescoWireless.rawValue == 1330)
        #expect(CompanyIdentifier.crescoWireless.name == #"CRESCO Wireless, Inc."#)
        #expect(CompanyIdentifier.crescoWireless.description == #"CRESCO Wireless, Inc."#)
    
        // Nura Operations Pty Ltd
        #expect(CompanyIdentifier.nuraOperations.rawValue == 1331)
        #expect(CompanyIdentifier.nuraOperations.name == #"Nura Operations Pty Ltd"#)
        #expect(CompanyIdentifier.nuraOperations.description == #"Nura Operations Pty Ltd"#)
    
        // Frontiergadget, Inc.
        #expect(CompanyIdentifier.frontiergadget.rawValue == 1332)
        #expect(CompanyIdentifier.frontiergadget.name == #"Frontiergadget, Inc."#)
        #expect(CompanyIdentifier.frontiergadget.description == #"Frontiergadget, Inc."#)
    
        // Smart Component Technologies Limited
        #expect(CompanyIdentifier.smartComponentTechnologies.rawValue == 1333)
        #expect(CompanyIdentifier.smartComponentTechnologies.name == #"Smart Component Technologies Limited"#)
        #expect(CompanyIdentifier.smartComponentTechnologies.description == #"Smart Component Technologies Limited"#)
    
        // ZTR Control Systems LLC
        #expect(CompanyIdentifier.ztrControlSystems.rawValue == 1334)
        #expect(CompanyIdentifier.ztrControlSystems.name == #"ZTR Control Systems LLC"#)
        #expect(CompanyIdentifier.ztrControlSystems.description == #"ZTR Control Systems LLC"#)
    
        // MetaLogics Corporation
        #expect(CompanyIdentifier.metalogics.rawValue == 1335)
        #expect(CompanyIdentifier.metalogics.name == #"MetaLogics Corporation"#)
        #expect(CompanyIdentifier.metalogics.description == #"MetaLogics Corporation"#)
    
        // Medela AG
        #expect(CompanyIdentifier.medela2.rawValue == 1336)
        #expect(CompanyIdentifier.medela2.name == #"Medela AG"#)
        #expect(CompanyIdentifier.medela2.description == #"Medela AG"#)
    
        // OPPLE Lighting Co., Ltd
        #expect(CompanyIdentifier.oppleLighting.rawValue == 1337)
        #expect(CompanyIdentifier.oppleLighting.name == #"OPPLE Lighting Co., Ltd"#)
        #expect(CompanyIdentifier.oppleLighting.description == #"OPPLE Lighting Co., Ltd"#)
    
        // Savitech Corp.,
        #expect(CompanyIdentifier.savitech.rawValue == 1338)
        #expect(CompanyIdentifier.savitech.name == #"Savitech Corp.,"#)
        #expect(CompanyIdentifier.savitech.description == #"Savitech Corp.,"#)
    
        // prodigy
        #expect(CompanyIdentifier.prodigy.rawValue == 1339)
        #expect(CompanyIdentifier.prodigy.name == #"prodigy"#)
        #expect(CompanyIdentifier.prodigy.description == #"prodigy"#)
    
        // Screenovate Technologies Ltd
        #expect(CompanyIdentifier.screenovateTechnologies.rawValue == 1340)
        #expect(CompanyIdentifier.screenovateTechnologies.name == #"Screenovate Technologies Ltd"#)
        #expect(CompanyIdentifier.screenovateTechnologies.description == #"Screenovate Technologies Ltd"#)
    
        // TESA SA
        #expect(CompanyIdentifier.tesa.rawValue == 1341)
        #expect(CompanyIdentifier.tesa.name == #"TESA SA"#)
        #expect(CompanyIdentifier.tesa.description == #"TESA SA"#)
    
        // CLIM8 LIMITED
        #expect(CompanyIdentifier.clim8.rawValue == 1342)
        #expect(CompanyIdentifier.clim8.name == #"CLIM8 LIMITED"#)
        #expect(CompanyIdentifier.clim8.description == #"CLIM8 LIMITED"#)
    
        // Silergy Corp
        #expect(CompanyIdentifier.silergy.rawValue == 1343)
        #expect(CompanyIdentifier.silergy.name == #"Silergy Corp"#)
        #expect(CompanyIdentifier.silergy.description == #"Silergy Corp"#)
    
        // SilverPlus, Inc
        #expect(CompanyIdentifier.silverplus.rawValue == 1344)
        #expect(CompanyIdentifier.silverplus.name == #"SilverPlus, Inc"#)
        #expect(CompanyIdentifier.silverplus.description == #"SilverPlus, Inc"#)
    
        // Sharknet srl
        #expect(CompanyIdentifier.sharknet.rawValue == 1345)
        #expect(CompanyIdentifier.sharknet.name == #"Sharknet srl"#)
        #expect(CompanyIdentifier.sharknet.description == #"Sharknet srl"#)
    
        // Mist Systems, Inc.
        #expect(CompanyIdentifier.mistSystems.rawValue == 1346)
        #expect(CompanyIdentifier.mistSystems.name == #"Mist Systems, Inc."#)
        #expect(CompanyIdentifier.mistSystems.description == #"Mist Systems, Inc."#)
    
        // MIWA LOCK CO.,Ltd
        #expect(CompanyIdentifier.miwaLock.rawValue == 1347)
        #expect(CompanyIdentifier.miwaLock.name == #"MIWA LOCK CO.,Ltd"#)
        #expect(CompanyIdentifier.miwaLock.description == #"MIWA LOCK CO.,Ltd"#)
    
        // OrthoSensor, Inc.
        #expect(CompanyIdentifier.orthosensor.rawValue == 1348)
        #expect(CompanyIdentifier.orthosensor.name == #"OrthoSensor, Inc."#)
        #expect(CompanyIdentifier.orthosensor.description == #"OrthoSensor, Inc."#)
    
        // Candy Hoover Group s.r.l
        #expect(CompanyIdentifier.candyHooverGroupSRL.rawValue == 1349)
        #expect(CompanyIdentifier.candyHooverGroupSRL.name == #"Candy Hoover Group s.r.l"#)
        #expect(CompanyIdentifier.candyHooverGroupSRL.description == #"Candy Hoover Group s.r.l"#)
    
        // Apexar Technologies S.A.
        #expect(CompanyIdentifier.apexarTechnologies.rawValue == 1350)
        #expect(CompanyIdentifier.apexarTechnologies.name == #"Apexar Technologies S.A."#)
        #expect(CompanyIdentifier.apexarTechnologies.description == #"Apexar Technologies S.A."#)
    
        // LOGICDATA Electronic & Software Entwicklungs GmbH
        #expect(CompanyIdentifier.logicdataElectronicSoftwareEntwicklungs.rawValue == 1351)
        #expect(CompanyIdentifier.logicdataElectronicSoftwareEntwicklungs.name == #"LOGICDATA Electronic & Software Entwicklungs GmbH"#)
        #expect(CompanyIdentifier.logicdataElectronicSoftwareEntwicklungs.description == #"LOGICDATA Electronic & Software Entwicklungs GmbH"#)
    
        // Knick Elektronische Messgeraete GmbH & Co. KG
        #expect(CompanyIdentifier.knickElektronischeMessgeraete.rawValue == 1352)
        #expect(CompanyIdentifier.knickElektronischeMessgeraete.name == #"Knick Elektronische Messgeraete GmbH & Co. KG"#)
        #expect(CompanyIdentifier.knickElektronischeMessgeraete.description == #"Knick Elektronische Messgeraete GmbH & Co. KG"#)
    
        // Smart Technologies and Investment Limited
        #expect(CompanyIdentifier.smartTechnologiesAndInvestment.rawValue == 1353)
        #expect(CompanyIdentifier.smartTechnologiesAndInvestment.name == #"Smart Technologies and Investment Limited"#)
        #expect(CompanyIdentifier.smartTechnologiesAndInvestment.description == #"Smart Technologies and Investment Limited"#)
    
        // Linough Inc.
        #expect(CompanyIdentifier.linough.rawValue == 1354)
        #expect(CompanyIdentifier.linough.name == #"Linough Inc."#)
        #expect(CompanyIdentifier.linough.description == #"Linough Inc."#)
    
        // Advanced Electronic Designs, Inc.
        #expect(CompanyIdentifier.advancedElectronicDesigns.rawValue == 1355)
        #expect(CompanyIdentifier.advancedElectronicDesigns.name == #"Advanced Electronic Designs, Inc."#)
        #expect(CompanyIdentifier.advancedElectronicDesigns.description == #"Advanced Electronic Designs, Inc."#)
    
        // Carefree Scott Fetzer Co Inc
        #expect(CompanyIdentifier.carefreeScottFetzerCo.rawValue == 1356)
        #expect(CompanyIdentifier.carefreeScottFetzerCo.name == #"Carefree Scott Fetzer Co Inc"#)
        #expect(CompanyIdentifier.carefreeScottFetzerCo.description == #"Carefree Scott Fetzer Co Inc"#)
    
        // Sensome
        #expect(CompanyIdentifier.sensome.rawValue == 1357)
        #expect(CompanyIdentifier.sensome.name == #"Sensome"#)
        #expect(CompanyIdentifier.sensome.description == #"Sensome"#)
    
        // FORTRONIK storitve d.o.o.
        #expect(CompanyIdentifier.fortronikStoritve.rawValue == 1358)
        #expect(CompanyIdentifier.fortronikStoritve.name == #"FORTRONIK storitve d.o.o."#)
        #expect(CompanyIdentifier.fortronikStoritve.description == #"FORTRONIK storitve d.o.o."#)
    
        // Sinnoz
        #expect(CompanyIdentifier.sinnoz.rawValue == 1359)
        #expect(CompanyIdentifier.sinnoz.name == #"Sinnoz"#)
        #expect(CompanyIdentifier.sinnoz.description == #"Sinnoz"#)
    
        // Versa Networks, Inc.
        #expect(CompanyIdentifier.versaNetworks.rawValue == 1360)
        #expect(CompanyIdentifier.versaNetworks.name == #"Versa Networks, Inc."#)
        #expect(CompanyIdentifier.versaNetworks.description == #"Versa Networks, Inc."#)
    
        // Sylero
        #expect(CompanyIdentifier.sylero.rawValue == 1361)
        #expect(CompanyIdentifier.sylero.name == #"Sylero"#)
        #expect(CompanyIdentifier.sylero.description == #"Sylero"#)
    
        // Avempace SARL
        #expect(CompanyIdentifier.avempacerl.rawValue == 1362)
        #expect(CompanyIdentifier.avempacerl.name == #"Avempace SARL"#)
        #expect(CompanyIdentifier.avempacerl.description == #"Avempace SARL"#)
    
        // Nintendo Co., Ltd.
        #expect(CompanyIdentifier.nintendo.rawValue == 1363)
        #expect(CompanyIdentifier.nintendo.name == #"Nintendo Co., Ltd."#)
        #expect(CompanyIdentifier.nintendo.description == #"Nintendo Co., Ltd."#)
    
        // National Instruments
        #expect(CompanyIdentifier.nationalInstruments.rawValue == 1364)
        #expect(CompanyIdentifier.nationalInstruments.name == #"National Instruments"#)
        #expect(CompanyIdentifier.nationalInstruments.description == #"National Instruments"#)
    
        // KROHNE Messtechnik GmbH
        #expect(CompanyIdentifier.krohneMesstechnik.rawValue == 1365)
        #expect(CompanyIdentifier.krohneMesstechnik.name == #"KROHNE Messtechnik GmbH"#)
        #expect(CompanyIdentifier.krohneMesstechnik.description == #"KROHNE Messtechnik GmbH"#)
    
        // Otodynamics Ltd
        #expect(CompanyIdentifier.otodynamics.rawValue == 1366)
        #expect(CompanyIdentifier.otodynamics.name == #"Otodynamics Ltd"#)
        #expect(CompanyIdentifier.otodynamics.description == #"Otodynamics Ltd"#)
    
        // Arwin Technology Limited
        #expect(CompanyIdentifier.arwinTechnology.rawValue == 1367)
        #expect(CompanyIdentifier.arwinTechnology.name == #"Arwin Technology Limited"#)
        #expect(CompanyIdentifier.arwinTechnology.description == #"Arwin Technology Limited"#)
    
        // benegear, inc.
        #expect(CompanyIdentifier.benegear.rawValue == 1368)
        #expect(CompanyIdentifier.benegear.name == #"benegear, inc."#)
        #expect(CompanyIdentifier.benegear.description == #"benegear, inc."#)
    
        // Newcon Optik
        #expect(CompanyIdentifier.newconOptik.rawValue == 1369)
        #expect(CompanyIdentifier.newconOptik.name == #"Newcon Optik"#)
        #expect(CompanyIdentifier.newconOptik.description == #"Newcon Optik"#)
    
        // CANDY HOUSE, Inc.
        #expect(CompanyIdentifier.candyHouse.rawValue == 1370)
        #expect(CompanyIdentifier.candyHouse.name == #"CANDY HOUSE, Inc."#)
        #expect(CompanyIdentifier.candyHouse.description == #"CANDY HOUSE, Inc."#)
    
        // FRANKLIN TECHNOLOGY INC
        #expect(CompanyIdentifier.franklinTechnology.rawValue == 1371)
        #expect(CompanyIdentifier.franklinTechnology.name == #"FRANKLIN TECHNOLOGY INC"#)
        #expect(CompanyIdentifier.franklinTechnology.description == #"FRANKLIN TECHNOLOGY INC"#)
    
        // Lely
        #expect(CompanyIdentifier.lely.rawValue == 1372)
        #expect(CompanyIdentifier.lely.name == #"Lely"#)
        #expect(CompanyIdentifier.lely.description == #"Lely"#)
    
        // Valve Corporation
        #expect(CompanyIdentifier.valve.rawValue == 1373)
        #expect(CompanyIdentifier.valve.name == #"Valve Corporation"#)
        #expect(CompanyIdentifier.valve.description == #"Valve Corporation"#)
    
        // Hekatron Vertriebs GmbH
        #expect(CompanyIdentifier.hekatronVertriebs.rawValue == 1374)
        #expect(CompanyIdentifier.hekatronVertriebs.name == #"Hekatron Vertriebs GmbH"#)
        #expect(CompanyIdentifier.hekatronVertriebs.description == #"Hekatron Vertriebs GmbH"#)
    
        // PROTECH S.A.S. DI GIRARDI ANDREA & C.
        #expect(CompanyIdentifier.protechDiGirardiAndreaC.rawValue == 1375)
        #expect(CompanyIdentifier.protechDiGirardiAndreaC.name == #"PROTECH S.A.S. DI GIRARDI ANDREA & C."#)
        #expect(CompanyIdentifier.protechDiGirardiAndreaC.description == #"PROTECH S.A.S. DI GIRARDI ANDREA & C."#)
    
        // Sarita CareTech APS
        #expect(CompanyIdentifier.saritaCaretech.rawValue == 1376)
        #expect(CompanyIdentifier.saritaCaretech.name == #"Sarita CareTech APS"#)
        #expect(CompanyIdentifier.saritaCaretech.description == #"Sarita CareTech APS"#)
    
        // Finder S.p.A.
        #expect(CompanyIdentifier.finder.rawValue == 1377)
        #expect(CompanyIdentifier.finder.name == #"Finder S.p.A."#)
        #expect(CompanyIdentifier.finder.description == #"Finder S.p.A."#)
    
        // Thalmic Labs Inc.
        #expect(CompanyIdentifier.thalmicLabs.rawValue == 1378)
        #expect(CompanyIdentifier.thalmicLabs.name == #"Thalmic Labs Inc."#)
        #expect(CompanyIdentifier.thalmicLabs.description == #"Thalmic Labs Inc."#)
    
        // Steinel Vertrieb GmbH
        #expect(CompanyIdentifier.steinelVertrieb.rawValue == 1379)
        #expect(CompanyIdentifier.steinelVertrieb.name == #"Steinel Vertrieb GmbH"#)
        #expect(CompanyIdentifier.steinelVertrieb.description == #"Steinel Vertrieb GmbH"#)
    
        // Beghelli Spa
        #expect(CompanyIdentifier.beghelliSpa.rawValue == 1380)
        #expect(CompanyIdentifier.beghelliSpa.name == #"Beghelli Spa"#)
        #expect(CompanyIdentifier.beghelliSpa.description == #"Beghelli Spa"#)
    
        // Beijing Smartspace Technologies Inc.
        #expect(CompanyIdentifier.beijingSmartspaceTechnologies.rawValue == 1381)
        #expect(CompanyIdentifier.beijingSmartspaceTechnologies.name == #"Beijing Smartspace Technologies Inc."#)
        #expect(CompanyIdentifier.beijingSmartspaceTechnologies.description == #"Beijing Smartspace Technologies Inc."#)
    
        // CORE TRANSPORT TECHNOLOGIES NZ LIMITED
        #expect(CompanyIdentifier.coreTransportTechnologiesNz.rawValue == 1382)
        #expect(CompanyIdentifier.coreTransportTechnologiesNz.name == #"CORE TRANSPORT TECHNOLOGIES NZ LIMITED"#)
        #expect(CompanyIdentifier.coreTransportTechnologiesNz.description == #"CORE TRANSPORT TECHNOLOGIES NZ LIMITED"#)
    
        // Xiamen Everesports Goods Co., Ltd
        #expect(CompanyIdentifier.xiamenEveresportsGoods.rawValue == 1383)
        #expect(CompanyIdentifier.xiamenEveresportsGoods.name == #"Xiamen Everesports Goods Co., Ltd"#)
        #expect(CompanyIdentifier.xiamenEveresportsGoods.description == #"Xiamen Everesports Goods Co., Ltd"#)
    
        // Bodyport Inc.
        #expect(CompanyIdentifier.bodyport.rawValue == 1384)
        #expect(CompanyIdentifier.bodyport.name == #"Bodyport Inc."#)
        #expect(CompanyIdentifier.bodyport.description == #"Bodyport Inc."#)
    
        // Audionics System, INC.
        #expect(CompanyIdentifier.audionicsSystem.rawValue == 1385)
        #expect(CompanyIdentifier.audionicsSystem.name == #"Audionics System, INC."#)
        #expect(CompanyIdentifier.audionicsSystem.description == #"Audionics System, INC."#)
    
        // Flipnavi Co.,Ltd.
        #expect(CompanyIdentifier.flipnavi.rawValue == 1386)
        #expect(CompanyIdentifier.flipnavi.name == #"Flipnavi Co.,Ltd."#)
        #expect(CompanyIdentifier.flipnavi.description == #"Flipnavi Co.,Ltd."#)
    
        // Rion Co., Ltd.
        #expect(CompanyIdentifier.rion.rawValue == 1387)
        #expect(CompanyIdentifier.rion.name == #"Rion Co., Ltd."#)
        #expect(CompanyIdentifier.rion.description == #"Rion Co., Ltd."#)
    
        // Long Range Systems, LLC
        #expect(CompanyIdentifier.longRangeSystems.rawValue == 1388)
        #expect(CompanyIdentifier.longRangeSystems.name == #"Long Range Systems, LLC"#)
        #expect(CompanyIdentifier.longRangeSystems.description == #"Long Range Systems, LLC"#)
    
        // Redmond Industrial Group LLC
        #expect(CompanyIdentifier.redmondIndustrialGroup.rawValue == 1389)
        #expect(CompanyIdentifier.redmondIndustrialGroup.name == #"Redmond Industrial Group LLC"#)
        #expect(CompanyIdentifier.redmondIndustrialGroup.description == #"Redmond Industrial Group LLC"#)
    
        // VIZPIN INC.
        #expect(CompanyIdentifier.vizpin.rawValue == 1390)
        #expect(CompanyIdentifier.vizpin.name == #"VIZPIN INC."#)
        #expect(CompanyIdentifier.vizpin.description == #"VIZPIN INC."#)
    
        // BikeFinder AS
        #expect(CompanyIdentifier.bikefinder.rawValue == 1391)
        #expect(CompanyIdentifier.bikefinder.name == #"BikeFinder AS"#)
        #expect(CompanyIdentifier.bikefinder.description == #"BikeFinder AS"#)
    
        // Consumer Sleep Solutions LLC
        #expect(CompanyIdentifier.consumerSleepSolutions.rawValue == 1392)
        #expect(CompanyIdentifier.consumerSleepSolutions.name == #"Consumer Sleep Solutions LLC"#)
        #expect(CompanyIdentifier.consumerSleepSolutions.description == #"Consumer Sleep Solutions LLC"#)
    
        // PSIKICK, INC.
        #expect(CompanyIdentifier.psikick.rawValue == 1393)
        #expect(CompanyIdentifier.psikick.name == #"PSIKICK, INC."#)
        #expect(CompanyIdentifier.psikick.description == #"PSIKICK, INC."#)
    
        // AntTail.com
        #expect(CompanyIdentifier.anttailCom.rawValue == 1394)
        #expect(CompanyIdentifier.anttailCom.name == #"AntTail.com"#)
        #expect(CompanyIdentifier.anttailCom.description == #"AntTail.com"#)
    
        // Lighting Science Group Corp.
        #expect(CompanyIdentifier.lightingScienceGroup.rawValue == 1395)
        #expect(CompanyIdentifier.lightingScienceGroup.name == #"Lighting Science Group Corp."#)
        #expect(CompanyIdentifier.lightingScienceGroup.description == #"Lighting Science Group Corp."#)
    
        // AFFORDABLE ELECTRONICS INC
        #expect(CompanyIdentifier.affordableElectronics.rawValue == 1396)
        #expect(CompanyIdentifier.affordableElectronics.name == #"AFFORDABLE ELECTRONICS INC"#)
        #expect(CompanyIdentifier.affordableElectronics.description == #"AFFORDABLE ELECTRONICS INC"#)
    
        // Integral Memroy Plc
        #expect(CompanyIdentifier.integralMemroyPlc.rawValue == 1397)
        #expect(CompanyIdentifier.integralMemroyPlc.name == #"Integral Memroy Plc"#)
        #expect(CompanyIdentifier.integralMemroyPlc.description == #"Integral Memroy Plc"#)
    
        // Globalstar, Inc.
        #expect(CompanyIdentifier.globalstar.rawValue == 1398)
        #expect(CompanyIdentifier.globalstar.name == #"Globalstar, Inc."#)
        #expect(CompanyIdentifier.globalstar.description == #"Globalstar, Inc."#)
    
        // True Wearables, Inc.
        #expect(CompanyIdentifier.trueWearables.rawValue == 1399)
        #expect(CompanyIdentifier.trueWearables.name == #"True Wearables, Inc."#)
        #expect(CompanyIdentifier.trueWearables.description == #"True Wearables, Inc."#)
    
        // Wellington Drive Technologies Ltd
        #expect(CompanyIdentifier.wellingtonDriveTechnologies.rawValue == 1400)
        #expect(CompanyIdentifier.wellingtonDriveTechnologies.name == #"Wellington Drive Technologies Ltd"#)
        #expect(CompanyIdentifier.wellingtonDriveTechnologies.description == #"Wellington Drive Technologies Ltd"#)
    
        // Ensemble Tech Private Limited
        #expect(CompanyIdentifier.ensembleTech.rawValue == 1401)
        #expect(CompanyIdentifier.ensembleTech.name == #"Ensemble Tech Private Limited"#)
        #expect(CompanyIdentifier.ensembleTech.description == #"Ensemble Tech Private Limited"#)
    
        // OMNI Remotes
        #expect(CompanyIdentifier.omniRemotes.rawValue == 1402)
        #expect(CompanyIdentifier.omniRemotes.name == #"OMNI Remotes"#)
        #expect(CompanyIdentifier.omniRemotes.description == #"OMNI Remotes"#)
    
        // Duracell U.S. Operations Inc.
        #expect(CompanyIdentifier.duracellUSOperations.rawValue == 1403)
        #expect(CompanyIdentifier.duracellUSOperations.name == #"Duracell U.S. Operations Inc."#)
        #expect(CompanyIdentifier.duracellUSOperations.description == #"Duracell U.S. Operations Inc."#)
    
        // Toor Technologies LLC
        #expect(CompanyIdentifier.toorTechnologies.rawValue == 1404)
        #expect(CompanyIdentifier.toorTechnologies.name == #"Toor Technologies LLC"#)
        #expect(CompanyIdentifier.toorTechnologies.description == #"Toor Technologies LLC"#)
    
        // Instinct Performance
        #expect(CompanyIdentifier.instinctPerformance.rawValue == 1405)
        #expect(CompanyIdentifier.instinctPerformance.name == #"Instinct Performance"#)
        #expect(CompanyIdentifier.instinctPerformance.description == #"Instinct Performance"#)
    
        // Beco, Inc
        #expect(CompanyIdentifier.beco.rawValue == 1406)
        #expect(CompanyIdentifier.beco.name == #"Beco, Inc"#)
        #expect(CompanyIdentifier.beco.description == #"Beco, Inc"#)
    
        // Scuf Gaming International, LLC
        #expect(CompanyIdentifier.scufGamingInternational.rawValue == 1407)
        #expect(CompanyIdentifier.scufGamingInternational.name == #"Scuf Gaming International, LLC"#)
        #expect(CompanyIdentifier.scufGamingInternational.description == #"Scuf Gaming International, LLC"#)
    
        // ARANZ Medical Limited
        #expect(CompanyIdentifier.aranzMedical.rawValue == 1408)
        #expect(CompanyIdentifier.aranzMedical.name == #"ARANZ Medical Limited"#)
        #expect(CompanyIdentifier.aranzMedical.description == #"ARANZ Medical Limited"#)
    
        // LYS TECHNOLOGIES LTD
        #expect(CompanyIdentifier.lysTechnologies.rawValue == 1409)
        #expect(CompanyIdentifier.lysTechnologies.name == #"LYS TECHNOLOGIES LTD"#)
        #expect(CompanyIdentifier.lysTechnologies.description == #"LYS TECHNOLOGIES LTD"#)
    
        // Breakwall Analytics, LLC
        #expect(CompanyIdentifier.breakwallAnalytics.rawValue == 1410)
        #expect(CompanyIdentifier.breakwallAnalytics.name == #"Breakwall Analytics, LLC"#)
        #expect(CompanyIdentifier.breakwallAnalytics.description == #"Breakwall Analytics, LLC"#)
    
        // Code Blue Communications
        #expect(CompanyIdentifier.codeBlueCommunications.rawValue == 1411)
        #expect(CompanyIdentifier.codeBlueCommunications.name == #"Code Blue Communications"#)
        #expect(CompanyIdentifier.codeBlueCommunications.description == #"Code Blue Communications"#)
    
        // Gira Giersiepen GmbH & Co. KG
        #expect(CompanyIdentifier.giraGiersiepen.rawValue == 1412)
        #expect(CompanyIdentifier.giraGiersiepen.name == #"Gira Giersiepen GmbH & Co. KG"#)
        #expect(CompanyIdentifier.giraGiersiepen.description == #"Gira Giersiepen GmbH & Co. KG"#)
    
        // Hearing Lab Technology
        #expect(CompanyIdentifier.hearingLabTechnology.rawValue == 1413)
        #expect(CompanyIdentifier.hearingLabTechnology.name == #"Hearing Lab Technology"#)
        #expect(CompanyIdentifier.hearingLabTechnology.description == #"Hearing Lab Technology"#)
    
        // LEGRAND
        #expect(CompanyIdentifier.legrand.rawValue == 1414)
        #expect(CompanyIdentifier.legrand.name == #"LEGRAND"#)
        #expect(CompanyIdentifier.legrand.description == #"LEGRAND"#)
    
        // Derichs GmbH
        #expect(CompanyIdentifier.derichs.rawValue == 1415)
        #expect(CompanyIdentifier.derichs.name == #"Derichs GmbH"#)
        #expect(CompanyIdentifier.derichs.description == #"Derichs GmbH"#)
    
        // ALT-TEKNIK LLC
        #expect(CompanyIdentifier.altTeknik.rawValue == 1416)
        #expect(CompanyIdentifier.altTeknik.name == #"ALT-TEKNIK LLC"#)
        #expect(CompanyIdentifier.altTeknik.description == #"ALT-TEKNIK LLC"#)
    
        // Star Technologies
        #expect(CompanyIdentifier.starTechnologies.rawValue == 1417)
        #expect(CompanyIdentifier.starTechnologies.name == #"Star Technologies"#)
        #expect(CompanyIdentifier.starTechnologies.description == #"Star Technologies"#)
    
        // START TODAY CO.,LTD.
        #expect(CompanyIdentifier.startToday.rawValue == 1418)
        #expect(CompanyIdentifier.startToday.name == #"START TODAY CO.,LTD."#)
        #expect(CompanyIdentifier.startToday.description == #"START TODAY CO.,LTD."#)
    
        // Maxim Integrated Products
        #expect(CompanyIdentifier.maximIntegratedProducts.rawValue == 1419)
        #expect(CompanyIdentifier.maximIntegratedProducts.name == #"Maxim Integrated Products"#)
        #expect(CompanyIdentifier.maximIntegratedProducts.description == #"Maxim Integrated Products"#)
    
        // Fracarro Radioindustrie SRL
        #expect(CompanyIdentifier.fracarroRadioindustrie.rawValue == 1420)
        #expect(CompanyIdentifier.fracarroRadioindustrie.name == #"Fracarro Radioindustrie SRL"#)
        #expect(CompanyIdentifier.fracarroRadioindustrie.description == #"Fracarro Radioindustrie SRL"#)
    
        // Jungheinrich Aktiengesellschaft
        #expect(CompanyIdentifier.jungheinrichAktiengesellschaft.rawValue == 1421)
        #expect(CompanyIdentifier.jungheinrichAktiengesellschaft.name == #"Jungheinrich Aktiengesellschaft"#)
        #expect(CompanyIdentifier.jungheinrichAktiengesellschaft.description == #"Jungheinrich Aktiengesellschaft"#)
    
        // Meta Platforms Technologies, LLC
        #expect(CompanyIdentifier.metaPlatformsTechnologies.rawValue == 1422)
        #expect(CompanyIdentifier.metaPlatformsTechnologies.name == #"Meta Platforms Technologies, LLC"#)
        #expect(CompanyIdentifier.metaPlatformsTechnologies.description == #"Meta Platforms Technologies, LLC"#)
    
        // HENDON SEMICONDUCTORS PTY LTD
        #expect(CompanyIdentifier.hendonSemiconductors.rawValue == 1423)
        #expect(CompanyIdentifier.hendonSemiconductors.name == #"HENDON SEMICONDUCTORS PTY LTD"#)
        #expect(CompanyIdentifier.hendonSemiconductors.description == #"HENDON SEMICONDUCTORS PTY LTD"#)
    
        // Pur3 Ltd
        #expect(CompanyIdentifier.pur3.rawValue == 1424)
        #expect(CompanyIdentifier.pur3.name == #"Pur3 Ltd"#)
        #expect(CompanyIdentifier.pur3.description == #"Pur3 Ltd"#)
    
        // Viasat Group S.p.A.
        #expect(CompanyIdentifier.viasatGroup.rawValue == 1425)
        #expect(CompanyIdentifier.viasatGroup.name == #"Viasat Group S.p.A."#)
        #expect(CompanyIdentifier.viasatGroup.description == #"Viasat Group S.p.A."#)
    
        // IZITHERM
        #expect(CompanyIdentifier.izitherm.rawValue == 1426)
        #expect(CompanyIdentifier.izitherm.name == #"IZITHERM"#)
        #expect(CompanyIdentifier.izitherm.description == #"IZITHERM"#)
    
        // Spaulding Clinical Research
        #expect(CompanyIdentifier.spauldingClinicalResearch.rawValue == 1427)
        #expect(CompanyIdentifier.spauldingClinicalResearch.name == #"Spaulding Clinical Research"#)
        #expect(CompanyIdentifier.spauldingClinicalResearch.description == #"Spaulding Clinical Research"#)
    
        // Kohler Company
        #expect(CompanyIdentifier.kohler.rawValue == 1428)
        #expect(CompanyIdentifier.kohler.name == #"Kohler Company"#)
        #expect(CompanyIdentifier.kohler.description == #"Kohler Company"#)
    
        // Inor Process AB
        #expect(CompanyIdentifier.inorProcess.rawValue == 1429)
        #expect(CompanyIdentifier.inorProcess.name == #"Inor Process AB"#)
        #expect(CompanyIdentifier.inorProcess.description == #"Inor Process AB"#)
    
        // My Smart Blinds
        #expect(CompanyIdentifier.mySmartBlinds.rawValue == 1430)
        #expect(CompanyIdentifier.mySmartBlinds.name == #"My Smart Blinds"#)
        #expect(CompanyIdentifier.mySmartBlinds.description == #"My Smart Blinds"#)
    
        // RadioPulse Inc
        #expect(CompanyIdentifier.radiopulse.rawValue == 1431)
        #expect(CompanyIdentifier.radiopulse.name == #"RadioPulse Inc"#)
        #expect(CompanyIdentifier.radiopulse.description == #"RadioPulse Inc"#)
    
        // rapitag GmbH
        #expect(CompanyIdentifier.rapitag.rawValue == 1432)
        #expect(CompanyIdentifier.rapitag.name == #"rapitag GmbH"#)
        #expect(CompanyIdentifier.rapitag.description == #"rapitag GmbH"#)
    
        // Lazlo326, LLC.
        #expect(CompanyIdentifier.lazlo326.rawValue == 1433)
        #expect(CompanyIdentifier.lazlo326.name == #"Lazlo326, LLC."#)
        #expect(CompanyIdentifier.lazlo326.description == #"Lazlo326, LLC."#)
    
        // Teledyne Lecroy, Inc.
        #expect(CompanyIdentifier.teledyneLecroy.rawValue == 1434)
        #expect(CompanyIdentifier.teledyneLecroy.name == #"Teledyne Lecroy, Inc."#)
        #expect(CompanyIdentifier.teledyneLecroy.description == #"Teledyne Lecroy, Inc."#)
    
        // Dataflow Systems Limited
        #expect(CompanyIdentifier.dataflowSystems.rawValue == 1435)
        #expect(CompanyIdentifier.dataflowSystems.name == #"Dataflow Systems Limited"#)
        #expect(CompanyIdentifier.dataflowSystems.description == #"Dataflow Systems Limited"#)
    
        // Macrogiga Electronics
        #expect(CompanyIdentifier.macrogigaElectronics.rawValue == 1436)
        #expect(CompanyIdentifier.macrogigaElectronics.name == #"Macrogiga Electronics"#)
        #expect(CompanyIdentifier.macrogigaElectronics.description == #"Macrogiga Electronics"#)
    
        // Tandem Diabetes Care
        #expect(CompanyIdentifier.tandemDiabetesCare.rawValue == 1437)
        #expect(CompanyIdentifier.tandemDiabetesCare.name == #"Tandem Diabetes Care"#)
        #expect(CompanyIdentifier.tandemDiabetesCare.description == #"Tandem Diabetes Care"#)
    
        // Polycom, Inc.
        #expect(CompanyIdentifier.polycom.rawValue == 1438)
        #expect(CompanyIdentifier.polycom.name == #"Polycom, Inc."#)
        #expect(CompanyIdentifier.polycom.description == #"Polycom, Inc."#)
    
        // Fisher & Paykel Healthcare
        #expect(CompanyIdentifier.fisherPaykelHealthcare.rawValue == 1439)
        #expect(CompanyIdentifier.fisherPaykelHealthcare.name == #"Fisher & Paykel Healthcare"#)
        #expect(CompanyIdentifier.fisherPaykelHealthcare.description == #"Fisher & Paykel Healthcare"#)
    
        // Dream Devices Technologies Oy
        #expect(CompanyIdentifier.dreamDevicesTechnologies.rawValue == 1440)
        #expect(CompanyIdentifier.dreamDevicesTechnologies.name == #"Dream Devices Technologies Oy"#)
        #expect(CompanyIdentifier.dreamDevicesTechnologies.description == #"Dream Devices Technologies Oy"#)
    
        // Shanghai Xiaoyi Technology Co.,Ltd.
        #expect(CompanyIdentifier.shanghaiXiaoyiTechnology.rawValue == 1441)
        #expect(CompanyIdentifier.shanghaiXiaoyiTechnology.name == #"Shanghai Xiaoyi Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.shanghaiXiaoyiTechnology.description == #"Shanghai Xiaoyi Technology Co.,Ltd."#)
    
        // ADHERIUM(NZ) LIMITED
        #expect(CompanyIdentifier.adheriumNz.rawValue == 1442)
        #expect(CompanyIdentifier.adheriumNz.name == #"ADHERIUM(NZ) LIMITED"#)
        #expect(CompanyIdentifier.adheriumNz.description == #"ADHERIUM(NZ) LIMITED"#)
    
        // Axiomware Systems Incorporated
        #expect(CompanyIdentifier.axiomwareSystems.rawValue == 1443)
        #expect(CompanyIdentifier.axiomwareSystems.name == #"Axiomware Systems Incorporated"#)
        #expect(CompanyIdentifier.axiomwareSystems.description == #"Axiomware Systems Incorporated"#)
    
        // O. E. M. Controls, Inc.
        #expect(CompanyIdentifier.oEMControls.rawValue == 1444)
        #expect(CompanyIdentifier.oEMControls.name == #"O. E. M. Controls, Inc."#)
        #expect(CompanyIdentifier.oEMControls.description == #"O. E. M. Controls, Inc."#)
    
        // Kiiroo BV
        #expect(CompanyIdentifier.kiiroo.rawValue == 1445)
        #expect(CompanyIdentifier.kiiroo.name == #"Kiiroo BV"#)
        #expect(CompanyIdentifier.kiiroo.description == #"Kiiroo BV"#)
    
        // Telecon Mobile Limited
        #expect(CompanyIdentifier.teleconMobile.rawValue == 1446)
        #expect(CompanyIdentifier.teleconMobile.name == #"Telecon Mobile Limited"#)
        #expect(CompanyIdentifier.teleconMobile.description == #"Telecon Mobile Limited"#)
    
        // Sonos Inc
        #expect(CompanyIdentifier.sonos.rawValue == 1447)
        #expect(CompanyIdentifier.sonos.name == #"Sonos Inc"#)
        #expect(CompanyIdentifier.sonos.description == #"Sonos Inc"#)
    
        // Tom Allebrandi Consulting
        #expect(CompanyIdentifier.tomAllebrandiConsulting.rawValue == 1448)
        #expect(CompanyIdentifier.tomAllebrandiConsulting.name == #"Tom Allebrandi Consulting"#)
        #expect(CompanyIdentifier.tomAllebrandiConsulting.description == #"Tom Allebrandi Consulting"#)
    
        // Monidor
        #expect(CompanyIdentifier.monidor.rawValue == 1449)
        #expect(CompanyIdentifier.monidor.name == #"Monidor"#)
        #expect(CompanyIdentifier.monidor.description == #"Monidor"#)
    
        // Tramex Limited
        #expect(CompanyIdentifier.tramex.rawValue == 1450)
        #expect(CompanyIdentifier.tramex.name == #"Tramex Limited"#)
        #expect(CompanyIdentifier.tramex.description == #"Tramex Limited"#)
    
        // Nofence AS
        #expect(CompanyIdentifier.nofence.rawValue == 1451)
        #expect(CompanyIdentifier.nofence.name == #"Nofence AS"#)
        #expect(CompanyIdentifier.nofence.description == #"Nofence AS"#)
    
        // GoerTek Dynaudio Co., Ltd.
        #expect(CompanyIdentifier.goertekDynaudio.rawValue == 1452)
        #expect(CompanyIdentifier.goertekDynaudio.name == #"GoerTek Dynaudio Co., Ltd."#)
        #expect(CompanyIdentifier.goertekDynaudio.description == #"GoerTek Dynaudio Co., Ltd."#)
    
        // INIA
        #expect(CompanyIdentifier.inia.rawValue == 1453)
        #expect(CompanyIdentifier.inia.name == #"INIA"#)
        #expect(CompanyIdentifier.inia.description == #"INIA"#)
    
        // CARMATE MFG.CO.,LTD
        #expect(CompanyIdentifier.carmateMfg.rawValue == 1454)
        #expect(CompanyIdentifier.carmateMfg.name == #"CARMATE MFG.CO.,LTD"#)
        #expect(CompanyIdentifier.carmateMfg.description == #"CARMATE MFG.CO.,LTD"#)
    
        // OV LOOP, INC.
        #expect(CompanyIdentifier.ovLoop.rawValue == 1455)
        #expect(CompanyIdentifier.ovLoop.name == #"OV LOOP, INC."#)
        #expect(CompanyIdentifier.ovLoop.description == #"OV LOOP, INC."#)
    
        // NewTec GmbH
        #expect(CompanyIdentifier.newtec.rawValue == 1456)
        #expect(CompanyIdentifier.newtec.name == #"NewTec GmbH"#)
        #expect(CompanyIdentifier.newtec.description == #"NewTec GmbH"#)
    
        // Medallion Instrumentation Systems
        #expect(CompanyIdentifier.medallionInstrumentationSystems.rawValue == 1457)
        #expect(CompanyIdentifier.medallionInstrumentationSystems.name == #"Medallion Instrumentation Systems"#)
        #expect(CompanyIdentifier.medallionInstrumentationSystems.description == #"Medallion Instrumentation Systems"#)
    
        // CAREL INDUSTRIES S.P.A.
        #expect(CompanyIdentifier.carelIndustries.rawValue == 1458)
        #expect(CompanyIdentifier.carelIndustries.name == #"CAREL INDUSTRIES S.P.A."#)
        #expect(CompanyIdentifier.carelIndustries.description == #"CAREL INDUSTRIES S.P.A."#)
    
        // Parabit Systems, Inc.
        #expect(CompanyIdentifier.parabitSystems.rawValue == 1459)
        #expect(CompanyIdentifier.parabitSystems.name == #"Parabit Systems, Inc."#)
        #expect(CompanyIdentifier.parabitSystems.description == #"Parabit Systems, Inc."#)
    
        // White Horse Scientific ltd
        #expect(CompanyIdentifier.whiteHorseScientific.rawValue == 1460)
        #expect(CompanyIdentifier.whiteHorseScientific.name == #"White Horse Scientific ltd"#)
        #expect(CompanyIdentifier.whiteHorseScientific.description == #"White Horse Scientific ltd"#)
    
        // verisilicon
        #expect(CompanyIdentifier.verisilicon.rawValue == 1461)
        #expect(CompanyIdentifier.verisilicon.name == #"verisilicon"#)
        #expect(CompanyIdentifier.verisilicon.description == #"verisilicon"#)
    
        // Elecs Industry Co.,Ltd.
        #expect(CompanyIdentifier.elecsIndustry.rawValue == 1462)
        #expect(CompanyIdentifier.elecsIndustry.name == #"Elecs Industry Co.,Ltd."#)
        #expect(CompanyIdentifier.elecsIndustry.description == #"Elecs Industry Co.,Ltd."#)
    
        // Beijing Pinecone Electronics Co.,Ltd.
        #expect(CompanyIdentifier.beijingPineconeElectronics.rawValue == 1463)
        #expect(CompanyIdentifier.beijingPineconeElectronics.name == #"Beijing Pinecone Electronics Co.,Ltd."#)
        #expect(CompanyIdentifier.beijingPineconeElectronics.description == #"Beijing Pinecone Electronics Co.,Ltd."#)
    
        // Ambystoma Labs Inc.
        #expect(CompanyIdentifier.ambystomaLabs.rawValue == 1464)
        #expect(CompanyIdentifier.ambystomaLabs.name == #"Ambystoma Labs Inc."#)
        #expect(CompanyIdentifier.ambystomaLabs.description == #"Ambystoma Labs Inc."#)
    
        // Suzhou Pairlink Network Technology
        #expect(CompanyIdentifier.suzhouPairlinkNetworkTechnology.rawValue == 1465)
        #expect(CompanyIdentifier.suzhouPairlinkNetworkTechnology.name == #"Suzhou Pairlink Network Technology"#)
        #expect(CompanyIdentifier.suzhouPairlinkNetworkTechnology.description == #"Suzhou Pairlink Network Technology"#)
    
        // igloohome
        #expect(CompanyIdentifier.igloohome.rawValue == 1466)
        #expect(CompanyIdentifier.igloohome.name == #"igloohome"#)
        #expect(CompanyIdentifier.igloohome.description == #"igloohome"#)
    
        // Oxford Metrics plc
        #expect(CompanyIdentifier.oxfordMetricsPlc.rawValue == 1467)
        #expect(CompanyIdentifier.oxfordMetricsPlc.name == #"Oxford Metrics plc"#)
        #expect(CompanyIdentifier.oxfordMetricsPlc.description == #"Oxford Metrics plc"#)
    
        // Leviton Mfg. Co., Inc.
        #expect(CompanyIdentifier.levitonMfg.rawValue == 1468)
        #expect(CompanyIdentifier.levitonMfg.name == #"Leviton Mfg. Co., Inc."#)
        #expect(CompanyIdentifier.levitonMfg.description == #"Leviton Mfg. Co., Inc."#)
    
        // ULC Robotics Inc.
        #expect(CompanyIdentifier.ulcRobotics.rawValue == 1469)
        #expect(CompanyIdentifier.ulcRobotics.name == #"ULC Robotics Inc."#)
        #expect(CompanyIdentifier.ulcRobotics.description == #"ULC Robotics Inc."#)
    
        // RFID Global by Softwork SrL
        #expect(CompanyIdentifier.rfidGlobalBySoftwork.rawValue == 1470)
        #expect(CompanyIdentifier.rfidGlobalBySoftwork.name == #"RFID Global by Softwork SrL"#)
        #expect(CompanyIdentifier.rfidGlobalBySoftwork.description == #"RFID Global by Softwork SrL"#)
    
        // Real-World-Systems Corporation
        #expect(CompanyIdentifier.realWorldSystems.rawValue == 1471)
        #expect(CompanyIdentifier.realWorldSystems.name == #"Real-World-Systems Corporation"#)
        #expect(CompanyIdentifier.realWorldSystems.description == #"Real-World-Systems Corporation"#)
    
        // Nalu Medical, Inc.
        #expect(CompanyIdentifier.naluMedical.rawValue == 1472)
        #expect(CompanyIdentifier.naluMedical.name == #"Nalu Medical, Inc."#)
        #expect(CompanyIdentifier.naluMedical.description == #"Nalu Medical, Inc."#)
    
        // P.I.Engineering
        #expect(CompanyIdentifier.pIEngineering.rawValue == 1473)
        #expect(CompanyIdentifier.pIEngineering.name == #"P.I.Engineering"#)
        #expect(CompanyIdentifier.pIEngineering.description == #"P.I.Engineering"#)
    
        // Grote Industries
        #expect(CompanyIdentifier.groteIndustries.rawValue == 1474)
        #expect(CompanyIdentifier.groteIndustries.name == #"Grote Industries"#)
        #expect(CompanyIdentifier.groteIndustries.description == #"Grote Industries"#)
    
        // Runtime, Inc.
        #expect(CompanyIdentifier.runtime.rawValue == 1475)
        #expect(CompanyIdentifier.runtime.name == #"Runtime, Inc."#)
        #expect(CompanyIdentifier.runtime.description == #"Runtime, Inc."#)
    
        // Codecoup sp. z o.o. sp. k.
        #expect(CompanyIdentifier.codecoup.rawValue == 1476)
        #expect(CompanyIdentifier.codecoup.name == #"Codecoup sp. z o.o. sp. k."#)
        #expect(CompanyIdentifier.codecoup.description == #"Codecoup sp. z o.o. sp. k."#)
    
        // SELVE GmbH & Co. KG
        #expect(CompanyIdentifier.selve.rawValue == 1477)
        #expect(CompanyIdentifier.selve.name == #"SELVE GmbH & Co. KG"#)
        #expect(CompanyIdentifier.selve.description == #"SELVE GmbH & Co. KG"#)
    
        // Smart Animal Training Systems, LLC
        #expect(CompanyIdentifier.smartAnimalTrainingSystems.rawValue == 1478)
        #expect(CompanyIdentifier.smartAnimalTrainingSystems.name == #"Smart Animal Training Systems, LLC"#)
        #expect(CompanyIdentifier.smartAnimalTrainingSystems.description == #"Smart Animal Training Systems, LLC"#)
    
        // Lippert Components, INC
        #expect(CompanyIdentifier.lippertComponents.rawValue == 1479)
        #expect(CompanyIdentifier.lippertComponents.name == #"Lippert Components, INC"#)
        #expect(CompanyIdentifier.lippertComponents.description == #"Lippert Components, INC"#)
    
        // SOMFY SAS
        #expect(CompanyIdentifier.somfys.rawValue == 1480)
        #expect(CompanyIdentifier.somfys.name == #"SOMFY SAS"#)
        #expect(CompanyIdentifier.somfys.description == #"SOMFY SAS"#)
    
        // TBS Electronics B.V.
        #expect(CompanyIdentifier.tbsElectronics.rawValue == 1481)
        #expect(CompanyIdentifier.tbsElectronics.name == #"TBS Electronics B.V."#)
        #expect(CompanyIdentifier.tbsElectronics.description == #"TBS Electronics B.V."#)
    
        // MHL Custom Inc
        #expect(CompanyIdentifier.mhlCustom.rawValue == 1482)
        #expect(CompanyIdentifier.mhlCustom.name == #"MHL Custom Inc"#)
        #expect(CompanyIdentifier.mhlCustom.description == #"MHL Custom Inc"#)
    
        // LucentWear LLC
        #expect(CompanyIdentifier.lucentwear.rawValue == 1483)
        #expect(CompanyIdentifier.lucentwear.name == #"LucentWear LLC"#)
        #expect(CompanyIdentifier.lucentwear.description == #"LucentWear LLC"#)
    
        // WATTS ELECTRONICS
        #expect(CompanyIdentifier.wattsElectronics.rawValue == 1484)
        #expect(CompanyIdentifier.wattsElectronics.name == #"WATTS ELECTRONICS"#)
        #expect(CompanyIdentifier.wattsElectronics.description == #"WATTS ELECTRONICS"#)
    
        // RJ Brands LLC
        #expect(CompanyIdentifier.rjBrands.rawValue == 1485)
        #expect(CompanyIdentifier.rjBrands.name == #"RJ Brands LLC"#)
        #expect(CompanyIdentifier.rjBrands.description == #"RJ Brands LLC"#)
    
        // V-ZUG Ltd
        #expect(CompanyIdentifier.vZug.rawValue == 1486)
        #expect(CompanyIdentifier.vZug.name == #"V-ZUG Ltd"#)
        #expect(CompanyIdentifier.vZug.description == #"V-ZUG Ltd"#)
    
        // Biowatch SA
        #expect(CompanyIdentifier.biowatch.rawValue == 1487)
        #expect(CompanyIdentifier.biowatch.name == #"Biowatch SA"#)
        #expect(CompanyIdentifier.biowatch.description == #"Biowatch SA"#)
    
        // Anova Applied Electronics
        #expect(CompanyIdentifier.anovaAppliedElectronics.rawValue == 1488)
        #expect(CompanyIdentifier.anovaAppliedElectronics.name == #"Anova Applied Electronics"#)
        #expect(CompanyIdentifier.anovaAppliedElectronics.description == #"Anova Applied Electronics"#)
    
        // Lindab AB
        #expect(CompanyIdentifier.lindab.rawValue == 1489)
        #expect(CompanyIdentifier.lindab.name == #"Lindab AB"#)
        #expect(CompanyIdentifier.lindab.description == #"Lindab AB"#)
    
        // frogblue TECHNOLOGY GmbH
        #expect(CompanyIdentifier.frogblueTechnology.rawValue == 1490)
        #expect(CompanyIdentifier.frogblueTechnology.name == #"frogblue TECHNOLOGY GmbH"#)
        #expect(CompanyIdentifier.frogblueTechnology.description == #"frogblue TECHNOLOGY GmbH"#)
    
        // Acurable Limited
        #expect(CompanyIdentifier.acurable.rawValue == 1491)
        #expect(CompanyIdentifier.acurable.name == #"Acurable Limited"#)
        #expect(CompanyIdentifier.acurable.description == #"Acurable Limited"#)
    
        // LAMPLIGHT Co., Ltd.
        #expect(CompanyIdentifier.lamplight.rawValue == 1492)
        #expect(CompanyIdentifier.lamplight.name == #"LAMPLIGHT Co., Ltd."#)
        #expect(CompanyIdentifier.lamplight.description == #"LAMPLIGHT Co., Ltd."#)
    
        // TEGAM, Inc.
        #expect(CompanyIdentifier.tegam.rawValue == 1493)
        #expect(CompanyIdentifier.tegam.name == #"TEGAM, Inc."#)
        #expect(CompanyIdentifier.tegam.description == #"TEGAM, Inc."#)
    
        // Zhuhai Jieli technology Co.,Ltd
        #expect(CompanyIdentifier.zhuhaiJieliTechnology.rawValue == 1494)
        #expect(CompanyIdentifier.zhuhaiJieliTechnology.name == #"Zhuhai Jieli technology Co.,Ltd"#)
        #expect(CompanyIdentifier.zhuhaiJieliTechnology.description == #"Zhuhai Jieli technology Co.,Ltd"#)
    
        // modum.io AG
        #expect(CompanyIdentifier.modumIo.rawValue == 1495)
        #expect(CompanyIdentifier.modumIo.name == #"modum.io AG"#)
        #expect(CompanyIdentifier.modumIo.description == #"modum.io AG"#)
    
        // Farm Jenny LLC
        #expect(CompanyIdentifier.farmJenny.rawValue == 1496)
        #expect(CompanyIdentifier.farmJenny.name == #"Farm Jenny LLC"#)
        #expect(CompanyIdentifier.farmJenny.description == #"Farm Jenny LLC"#)
    
        // Toyo Electronics Corporation
        #expect(CompanyIdentifier.toyoElectronics.rawValue == 1497)
        #expect(CompanyIdentifier.toyoElectronics.name == #"Toyo Electronics Corporation"#)
        #expect(CompanyIdentifier.toyoElectronics.description == #"Toyo Electronics Corporation"#)
    
        // Applied Neural Research Corp
        #expect(CompanyIdentifier.appliedNeuralResearch.rawValue == 1498)
        #expect(CompanyIdentifier.appliedNeuralResearch.name == #"Applied Neural Research Corp"#)
        #expect(CompanyIdentifier.appliedNeuralResearch.description == #"Applied Neural Research Corp"#)
    
        // Avid Identification Systems, Inc.
        #expect(CompanyIdentifier.avidIdentificationSystems.rawValue == 1499)
        #expect(CompanyIdentifier.avidIdentificationSystems.name == #"Avid Identification Systems, Inc."#)
        #expect(CompanyIdentifier.avidIdentificationSystems.description == #"Avid Identification Systems, Inc."#)
    
        // Petronics Inc.
        #expect(CompanyIdentifier.petronics.rawValue == 1500)
        #expect(CompanyIdentifier.petronics.name == #"Petronics Inc."#)
        #expect(CompanyIdentifier.petronics.description == #"Petronics Inc."#)
    
        // essentim GmbH
        #expect(CompanyIdentifier.essentim.rawValue == 1501)
        #expect(CompanyIdentifier.essentim.name == #"essentim GmbH"#)
        #expect(CompanyIdentifier.essentim.description == #"essentim GmbH"#)
    
        // QT Medical INC.
        #expect(CompanyIdentifier.qtMedical.rawValue == 1502)
        #expect(CompanyIdentifier.qtMedical.name == #"QT Medical INC."#)
        #expect(CompanyIdentifier.qtMedical.description == #"QT Medical INC."#)
    
        // VIRTUALCLINIC.DIRECT LIMITED
        #expect(CompanyIdentifier.virtualclinicDirect.rawValue == 1503)
        #expect(CompanyIdentifier.virtualclinicDirect.name == #"VIRTUALCLINIC.DIRECT LIMITED"#)
        #expect(CompanyIdentifier.virtualclinicDirect.description == #"VIRTUALCLINIC.DIRECT LIMITED"#)
    
        // Viper Design LLC
        #expect(CompanyIdentifier.viperDesign.rawValue == 1504)
        #expect(CompanyIdentifier.viperDesign.name == #"Viper Design LLC"#)
        #expect(CompanyIdentifier.viperDesign.description == #"Viper Design LLC"#)
    
        // Human, Incorporated
        #expect(CompanyIdentifier.human.rawValue == 1505)
        #expect(CompanyIdentifier.human.name == #"Human, Incorporated"#)
        #expect(CompanyIdentifier.human.description == #"Human, Incorporated"#)
    
        // stAPPtronics GmbH
        #expect(CompanyIdentifier.stapptronics.rawValue == 1506)
        #expect(CompanyIdentifier.stapptronics.name == #"stAPPtronics GmbH"#)
        #expect(CompanyIdentifier.stapptronics.description == #"stAPPtronics GmbH"#)
    
        // Elemental Machines, Inc.
        #expect(CompanyIdentifier.elementalMachines.rawValue == 1507)
        #expect(CompanyIdentifier.elementalMachines.name == #"Elemental Machines, Inc."#)
        #expect(CompanyIdentifier.elementalMachines.description == #"Elemental Machines, Inc."#)
    
        // Taiyo Yuden Co., Ltd
        #expect(CompanyIdentifier.taiyoYuden.rawValue == 1508)
        #expect(CompanyIdentifier.taiyoYuden.name == #"Taiyo Yuden Co., Ltd"#)
        #expect(CompanyIdentifier.taiyoYuden.description == #"Taiyo Yuden Co., Ltd"#)
    
        // INEO ENERGY& SYSTEMS
        #expect(CompanyIdentifier.ineoEnergySystems.rawValue == 1509)
        #expect(CompanyIdentifier.ineoEnergySystems.name == #"INEO ENERGY& SYSTEMS"#)
        #expect(CompanyIdentifier.ineoEnergySystems.description == #"INEO ENERGY& SYSTEMS"#)
    
        // Motion Instruments Inc.
        #expect(CompanyIdentifier.motionInstruments.rawValue == 1510)
        #expect(CompanyIdentifier.motionInstruments.name == #"Motion Instruments Inc."#)
        #expect(CompanyIdentifier.motionInstruments.description == #"Motion Instruments Inc."#)
    
        // PressurePro
        #expect(CompanyIdentifier.pressurepro.rawValue == 1511)
        #expect(CompanyIdentifier.pressurepro.name == #"PressurePro"#)
        #expect(CompanyIdentifier.pressurepro.description == #"PressurePro"#)
    
        // COWBOY
        #expect(CompanyIdentifier.cowboy.rawValue == 1512)
        #expect(CompanyIdentifier.cowboy.name == #"COWBOY"#)
        #expect(CompanyIdentifier.cowboy.description == #"COWBOY"#)
    
        // iconmobile GmbH
        #expect(CompanyIdentifier.iconmobile.rawValue == 1513)
        #expect(CompanyIdentifier.iconmobile.name == #"iconmobile GmbH"#)
        #expect(CompanyIdentifier.iconmobile.description == #"iconmobile GmbH"#)
    
        // ACS-Control-System GmbH
        #expect(CompanyIdentifier.acsControlSystem.rawValue == 1514)
        #expect(CompanyIdentifier.acsControlSystem.name == #"ACS-Control-System GmbH"#)
        #expect(CompanyIdentifier.acsControlSystem.description == #"ACS-Control-System GmbH"#)
    
        // Bayerische Motoren Werke AG
        #expect(CompanyIdentifier.bayerischeMotorenWerke.rawValue == 1515)
        #expect(CompanyIdentifier.bayerischeMotorenWerke.name == #"Bayerische Motoren Werke AG"#)
        #expect(CompanyIdentifier.bayerischeMotorenWerke.description == #"Bayerische Motoren Werke AG"#)
    
        // Gycom Svenska AB
        #expect(CompanyIdentifier.gycomSvenska.rawValue == 1516)
        #expect(CompanyIdentifier.gycomSvenska.name == #"Gycom Svenska AB"#)
        #expect(CompanyIdentifier.gycomSvenska.description == #"Gycom Svenska AB"#)
    
        // Fuji Xerox Co., Ltd
        #expect(CompanyIdentifier.fujiXerox.rawValue == 1517)
        #expect(CompanyIdentifier.fujiXerox.name == #"Fuji Xerox Co., Ltd"#)
        #expect(CompanyIdentifier.fujiXerox.description == #"Fuji Xerox Co., Ltd"#)
    
        // Wristcam Inc.
        #expect(CompanyIdentifier.wristcam.rawValue == 1518)
        #expect(CompanyIdentifier.wristcam.name == #"Wristcam Inc."#)
        #expect(CompanyIdentifier.wristcam.description == #"Wristcam Inc."#)
    
        // SIKOM AS
        #expect(CompanyIdentifier.sikom.rawValue == 1519)
        #expect(CompanyIdentifier.sikom.name == #"SIKOM AS"#)
        #expect(CompanyIdentifier.sikom.description == #"SIKOM AS"#)
    
        // beken
        #expect(CompanyIdentifier.beken.rawValue == 1520)
        #expect(CompanyIdentifier.beken.name == #"beken"#)
        #expect(CompanyIdentifier.beken.description == #"beken"#)
    
        // The Linux Foundation
        #expect(CompanyIdentifier.linuxFoundation.rawValue == 1521)
        #expect(CompanyIdentifier.linuxFoundation.name == #"The Linux Foundation"#)
        #expect(CompanyIdentifier.linuxFoundation.description == #"The Linux Foundation"#)
    
        // Try and E CO.,LTD.
        #expect(CompanyIdentifier.tryAndE.rawValue == 1522)
        #expect(CompanyIdentifier.tryAndE.name == #"Try and E CO.,LTD."#)
        #expect(CompanyIdentifier.tryAndE.description == #"Try and E CO.,LTD."#)
    
        // SeeScan
        #expect(CompanyIdentifier.seescan.rawValue == 1523)
        #expect(CompanyIdentifier.seescan.name == #"SeeScan"#)
        #expect(CompanyIdentifier.seescan.description == #"SeeScan"#)
    
        // Clearity, LLC
        #expect(CompanyIdentifier.clearity.rawValue == 1524)
        #expect(CompanyIdentifier.clearity.name == #"Clearity, LLC"#)
        #expect(CompanyIdentifier.clearity.description == #"Clearity, LLC"#)
    
        // GS TAG
        #expect(CompanyIdentifier.gsTag.rawValue == 1525)
        #expect(CompanyIdentifier.gsTag.name == #"GS TAG"#)
        #expect(CompanyIdentifier.gsTag.description == #"GS TAG"#)
    
        // DPTechnics
        #expect(CompanyIdentifier.dptechnics.rawValue == 1526)
        #expect(CompanyIdentifier.dptechnics.name == #"DPTechnics"#)
        #expect(CompanyIdentifier.dptechnics.description == #"DPTechnics"#)
    
        // TRACMO, INC.
        #expect(CompanyIdentifier.tracmo.rawValue == 1527)
        #expect(CompanyIdentifier.tracmo.name == #"TRACMO, INC."#)
        #expect(CompanyIdentifier.tracmo.description == #"TRACMO, INC."#)
    
        // Anki Inc.
        #expect(CompanyIdentifier.anki.rawValue == 1528)
        #expect(CompanyIdentifier.anki.name == #"Anki Inc."#)
        #expect(CompanyIdentifier.anki.description == #"Anki Inc."#)
    
        // Hagleitner Hygiene International GmbH
        #expect(CompanyIdentifier.hagleitnerHygieneInternational.rawValue == 1529)
        #expect(CompanyIdentifier.hagleitnerHygieneInternational.name == #"Hagleitner Hygiene International GmbH"#)
        #expect(CompanyIdentifier.hagleitnerHygieneInternational.description == #"Hagleitner Hygiene International GmbH"#)
    
        // Konami Sports Life Co., Ltd.
        #expect(CompanyIdentifier.konamiSportsLife.rawValue == 1530)
        #expect(CompanyIdentifier.konamiSportsLife.name == #"Konami Sports Life Co., Ltd."#)
        #expect(CompanyIdentifier.konamiSportsLife.description == #"Konami Sports Life Co., Ltd."#)
    
        // Arblet Inc.
        #expect(CompanyIdentifier.arblet.rawValue == 1531)
        #expect(CompanyIdentifier.arblet.name == #"Arblet Inc."#)
        #expect(CompanyIdentifier.arblet.description == #"Arblet Inc."#)
    
        // Masbando GmbH
        #expect(CompanyIdentifier.masbando.rawValue == 1532)
        #expect(CompanyIdentifier.masbando.name == #"Masbando GmbH"#)
        #expect(CompanyIdentifier.masbando.description == #"Masbando GmbH"#)
    
        // Innoseis
        #expect(CompanyIdentifier.innoseis.rawValue == 1533)
        #expect(CompanyIdentifier.innoseis.name == #"Innoseis"#)
        #expect(CompanyIdentifier.innoseis.description == #"Innoseis"#)
    
        // Niko nv
        #expect(CompanyIdentifier.nikoNv.rawValue == 1534)
        #expect(CompanyIdentifier.nikoNv.name == #"Niko nv"#)
        #expect(CompanyIdentifier.nikoNv.description == #"Niko nv"#)
    
        // Wellnomics Ltd
        #expect(CompanyIdentifier.wellnomics.rawValue == 1535)
        #expect(CompanyIdentifier.wellnomics.name == #"Wellnomics Ltd"#)
        #expect(CompanyIdentifier.wellnomics.description == #"Wellnomics Ltd"#)
    
        // iRobot Corporation
        #expect(CompanyIdentifier.irobot.rawValue == 1536)
        #expect(CompanyIdentifier.irobot.name == #"iRobot Corporation"#)
        #expect(CompanyIdentifier.irobot.description == #"iRobot Corporation"#)
    
        // Schrader Electronics
        #expect(CompanyIdentifier.schraderElectronics.rawValue == 1537)
        #expect(CompanyIdentifier.schraderElectronics.name == #"Schrader Electronics"#)
        #expect(CompanyIdentifier.schraderElectronics.description == #"Schrader Electronics"#)
    
        // Geberit International AG
        #expect(CompanyIdentifier.geberitInternational.rawValue == 1538)
        #expect(CompanyIdentifier.geberitInternational.name == #"Geberit International AG"#)
        #expect(CompanyIdentifier.geberitInternational.description == #"Geberit International AG"#)
    
        // Fourth Evolution Inc
        #expect(CompanyIdentifier.fourthEvolution.rawValue == 1539)
        #expect(CompanyIdentifier.fourthEvolution.name == #"Fourth Evolution Inc"#)
        #expect(CompanyIdentifier.fourthEvolution.description == #"Fourth Evolution Inc"#)
    
        // Cell2Jack LLC
        #expect(CompanyIdentifier.cell2Jack.rawValue == 1540)
        #expect(CompanyIdentifier.cell2Jack.name == #"Cell2Jack LLC"#)
        #expect(CompanyIdentifier.cell2Jack.description == #"Cell2Jack LLC"#)
    
        // FMW electronic Futterer u. Maier-Wolf OHG
        #expect(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.rawValue == 1541)
        #expect(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.name == #"FMW electronic Futterer u. Maier-Wolf OHG"#)
        #expect(CompanyIdentifier.fmwElectronicFuttererUMaierWolfOhg.description == #"FMW electronic Futterer u. Maier-Wolf OHG"#)
    
        // John Deere
        #expect(CompanyIdentifier.johnDeere.rawValue == 1542)
        #expect(CompanyIdentifier.johnDeere.name == #"John Deere"#)
        #expect(CompanyIdentifier.johnDeere.description == #"John Deere"#)
    
        // Rookery Technology Ltd
        #expect(CompanyIdentifier.rookeryTechnology.rawValue == 1543)
        #expect(CompanyIdentifier.rookeryTechnology.name == #"Rookery Technology Ltd"#)
        #expect(CompanyIdentifier.rookeryTechnology.description == #"Rookery Technology Ltd"#)
    
        // KeySafe-Cloud
        #expect(CompanyIdentifier.keysafeCloud.rawValue == 1544)
        #expect(CompanyIdentifier.keysafeCloud.name == #"KeySafe-Cloud"#)
        #expect(CompanyIdentifier.keysafeCloud.description == #"KeySafe-Cloud"#)
    
        // BUCHI Labortechnik AG
        #expect(CompanyIdentifier.buchiLabortechnik.rawValue == 1545)
        #expect(CompanyIdentifier.buchiLabortechnik.name == #"BUCHI Labortechnik AG"#)
        #expect(CompanyIdentifier.buchiLabortechnik.description == #"BUCHI Labortechnik AG"#)
    
        // IQAir AG
        #expect(CompanyIdentifier.iqair.rawValue == 1546)
        #expect(CompanyIdentifier.iqair.name == #"IQAir AG"#)
        #expect(CompanyIdentifier.iqair.description == #"IQAir AG"#)
    
        // Triax Technologies Inc
        #expect(CompanyIdentifier.triaxTechnologies.rawValue == 1547)
        #expect(CompanyIdentifier.triaxTechnologies.name == #"Triax Technologies Inc"#)
        #expect(CompanyIdentifier.triaxTechnologies.description == #"Triax Technologies Inc"#)
    
        // Vuzix Corporation
        #expect(CompanyIdentifier.vuzix.rawValue == 1548)
        #expect(CompanyIdentifier.vuzix.name == #"Vuzix Corporation"#)
        #expect(CompanyIdentifier.vuzix.description == #"Vuzix Corporation"#)
    
        // TDK Corporation
        #expect(CompanyIdentifier.tdk.rawValue == 1549)
        #expect(CompanyIdentifier.tdk.name == #"TDK Corporation"#)
        #expect(CompanyIdentifier.tdk.description == #"TDK Corporation"#)
    
        // Blueair AB
        #expect(CompanyIdentifier.blueair.rawValue == 1550)
        #expect(CompanyIdentifier.blueair.name == #"Blueair AB"#)
        #expect(CompanyIdentifier.blueair.description == #"Blueair AB"#)
    
        // Signify Netherlands B.V.
        #expect(CompanyIdentifier.signifyNetherlands.rawValue == 1551)
        #expect(CompanyIdentifier.signifyNetherlands.name == #"Signify Netherlands B.V."#)
        #expect(CompanyIdentifier.signifyNetherlands.description == #"Signify Netherlands B.V."#)
    
        // ADH GUARDIAN USA LLC
        #expect(CompanyIdentifier.adhGuardian.rawValue == 1552)
        #expect(CompanyIdentifier.adhGuardian.name == #"ADH GUARDIAN USA LLC"#)
        #expect(CompanyIdentifier.adhGuardian.description == #"ADH GUARDIAN USA LLC"#)
    
        // Beurer GmbH
        #expect(CompanyIdentifier.beurer.rawValue == 1553)
        #expect(CompanyIdentifier.beurer.name == #"Beurer GmbH"#)
        #expect(CompanyIdentifier.beurer.description == #"Beurer GmbH"#)
    
        // Playfinity AS
        #expect(CompanyIdentifier.playfinity.rawValue == 1554)
        #expect(CompanyIdentifier.playfinity.name == #"Playfinity AS"#)
        #expect(CompanyIdentifier.playfinity.description == #"Playfinity AS"#)
    
        // Hans Dinslage GmbH
        #expect(CompanyIdentifier.hansDinslage.rawValue == 1555)
        #expect(CompanyIdentifier.hansDinslage.name == #"Hans Dinslage GmbH"#)
        #expect(CompanyIdentifier.hansDinslage.description == #"Hans Dinslage GmbH"#)
    
        // OnAsset Intelligence, Inc.
        #expect(CompanyIdentifier.onassetIntelligence.rawValue == 1556)
        #expect(CompanyIdentifier.onassetIntelligence.name == #"OnAsset Intelligence, Inc."#)
        #expect(CompanyIdentifier.onassetIntelligence.description == #"OnAsset Intelligence, Inc."#)
    
        // INTER ACTION Corporation
        #expect(CompanyIdentifier.interAction.rawValue == 1557)
        #expect(CompanyIdentifier.interAction.name == #"INTER ACTION Corporation"#)
        #expect(CompanyIdentifier.interAction.description == #"INTER ACTION Corporation"#)
    
        // OS42 UG (haftungsbeschraenkt)
        #expect(CompanyIdentifier.os42UgHaftungsbeschraenkt.rawValue == 1558)
        #expect(CompanyIdentifier.os42UgHaftungsbeschraenkt.name == #"OS42 UG (haftungsbeschraenkt)"#)
        #expect(CompanyIdentifier.os42UgHaftungsbeschraenkt.description == #"OS42 UG (haftungsbeschraenkt)"#)
    
        // WIZCONNECTED COMPANY LIMITED
        #expect(CompanyIdentifier.wizconnected.rawValue == 1559)
        #expect(CompanyIdentifier.wizconnected.name == #"WIZCONNECTED COMPANY LIMITED"#)
        #expect(CompanyIdentifier.wizconnected.description == #"WIZCONNECTED COMPANY LIMITED"#)
    
        // Audio-Technica Corporation
        #expect(CompanyIdentifier.audioTechnica.rawValue == 1560)
        #expect(CompanyIdentifier.audioTechnica.name == #"Audio-Technica Corporation"#)
        #expect(CompanyIdentifier.audioTechnica.description == #"Audio-Technica Corporation"#)
    
        // Six Guys Labs, s.r.o.
        #expect(CompanyIdentifier.sixGuysLabs.rawValue == 1561)
        #expect(CompanyIdentifier.sixGuysLabs.name == #"Six Guys Labs, s.r.o."#)
        #expect(CompanyIdentifier.sixGuysLabs.description == #"Six Guys Labs, s.r.o."#)
    
        // R.W. Beckett Corporation
        #expect(CompanyIdentifier.rWBeckett.rawValue == 1562)
        #expect(CompanyIdentifier.rWBeckett.name == #"R.W. Beckett Corporation"#)
        #expect(CompanyIdentifier.rWBeckett.description == #"R.W. Beckett Corporation"#)
    
        // silex technology, inc.
        #expect(CompanyIdentifier.silexTechnology.rawValue == 1563)
        #expect(CompanyIdentifier.silexTechnology.name == #"silex technology, inc."#)
        #expect(CompanyIdentifier.silexTechnology.description == #"silex technology, inc."#)
    
        // Univations Limited
        #expect(CompanyIdentifier.univations.rawValue == 1564)
        #expect(CompanyIdentifier.univations.name == #"Univations Limited"#)
        #expect(CompanyIdentifier.univations.description == #"Univations Limited"#)
    
        // SENS Innovation ApS
        #expect(CompanyIdentifier.sensInnovation.rawValue == 1565)
        #expect(CompanyIdentifier.sensInnovation.name == #"SENS Innovation ApS"#)
        #expect(CompanyIdentifier.sensInnovation.description == #"SENS Innovation ApS"#)
    
        // Diamond Kinetics, Inc.
        #expect(CompanyIdentifier.diamondKinetics.rawValue == 1566)
        #expect(CompanyIdentifier.diamondKinetics.name == #"Diamond Kinetics, Inc."#)
        #expect(CompanyIdentifier.diamondKinetics.description == #"Diamond Kinetics, Inc."#)
    
        // Phrame Inc.
        #expect(CompanyIdentifier.phrame.rawValue == 1567)
        #expect(CompanyIdentifier.phrame.name == #"Phrame Inc."#)
        #expect(CompanyIdentifier.phrame.description == #"Phrame Inc."#)
    
        // Forciot Oy
        #expect(CompanyIdentifier.forciot.rawValue == 1568)
        #expect(CompanyIdentifier.forciot.name == #"Forciot Oy"#)
        #expect(CompanyIdentifier.forciot.description == #"Forciot Oy"#)
    
        // Noordung d.o.o.
        #expect(CompanyIdentifier.noordung.rawValue == 1569)
        #expect(CompanyIdentifier.noordung.name == #"Noordung d.o.o."#)
        #expect(CompanyIdentifier.noordung.description == #"Noordung d.o.o."#)
    
        // Beam Labs, LLC
        #expect(CompanyIdentifier.beamLabs.rawValue == 1570)
        #expect(CompanyIdentifier.beamLabs.name == #"Beam Labs, LLC"#)
        #expect(CompanyIdentifier.beamLabs.description == #"Beam Labs, LLC"#)
    
        // Philadelphia Scientific (U.K.) Limited
        #expect(CompanyIdentifier.philadelphiaScientificUK.rawValue == 1571)
        #expect(CompanyIdentifier.philadelphiaScientificUK.name == #"Philadelphia Scientific (U.K.) Limited"#)
        #expect(CompanyIdentifier.philadelphiaScientificUK.description == #"Philadelphia Scientific (U.K.) Limited"#)
    
        // Biovotion AG
        #expect(CompanyIdentifier.biovotion.rawValue == 1572)
        #expect(CompanyIdentifier.biovotion.name == #"Biovotion AG"#)
        #expect(CompanyIdentifier.biovotion.description == #"Biovotion AG"#)
    
        // Square Panda, Inc.
        #expect(CompanyIdentifier.squarePanda.rawValue == 1573)
        #expect(CompanyIdentifier.squarePanda.name == #"Square Panda, Inc."#)
        #expect(CompanyIdentifier.squarePanda.description == #"Square Panda, Inc."#)
    
        // Amplifico
        #expect(CompanyIdentifier.amplifico.rawValue == 1574)
        #expect(CompanyIdentifier.amplifico.name == #"Amplifico"#)
        #expect(CompanyIdentifier.amplifico.description == #"Amplifico"#)
    
        // WEG S.A.
        #expect(CompanyIdentifier.weg.rawValue == 1575)
        #expect(CompanyIdentifier.weg.name == #"WEG S.A."#)
        #expect(CompanyIdentifier.weg.description == #"WEG S.A."#)
    
        // Ensto Oy
        #expect(CompanyIdentifier.ensto.rawValue == 1576)
        #expect(CompanyIdentifier.ensto.name == #"Ensto Oy"#)
        #expect(CompanyIdentifier.ensto.description == #"Ensto Oy"#)
    
        // PHONEPE PVT LTD
        #expect(CompanyIdentifier.phonepePvt.rawValue == 1577)
        #expect(CompanyIdentifier.phonepePvt.name == #"PHONEPE PVT LTD"#)
        #expect(CompanyIdentifier.phonepePvt.description == #"PHONEPE PVT LTD"#)
    
        // Lunatico Astronomia SL
        #expect(CompanyIdentifier.lunaticoAstronomia.rawValue == 1578)
        #expect(CompanyIdentifier.lunaticoAstronomia.name == #"Lunatico Astronomia SL"#)
        #expect(CompanyIdentifier.lunaticoAstronomia.description == #"Lunatico Astronomia SL"#)
    
        // MinebeaMitsumi Inc.
        #expect(CompanyIdentifier.minebeamitsumi.rawValue == 1579)
        #expect(CompanyIdentifier.minebeamitsumi.name == #"MinebeaMitsumi Inc."#)
        #expect(CompanyIdentifier.minebeamitsumi.description == #"MinebeaMitsumi Inc."#)
    
        // ASPion GmbH
        #expect(CompanyIdentifier.aspion.rawValue == 1580)
        #expect(CompanyIdentifier.aspion.name == #"ASPion GmbH"#)
        #expect(CompanyIdentifier.aspion.description == #"ASPion GmbH"#)
    
        // Vossloh-Schwabe Deutschland GmbH
        #expect(CompanyIdentifier.vosslohSchwabeDeutschland.rawValue == 1581)
        #expect(CompanyIdentifier.vosslohSchwabeDeutschland.name == #"Vossloh-Schwabe Deutschland GmbH"#)
        #expect(CompanyIdentifier.vosslohSchwabeDeutschland.description == #"Vossloh-Schwabe Deutschland GmbH"#)
    
        // Procept
        #expect(CompanyIdentifier.procept.rawValue == 1582)
        #expect(CompanyIdentifier.procept.name == #"Procept"#)
        #expect(CompanyIdentifier.procept.description == #"Procept"#)
    
        // ONKYO Corporation
        #expect(CompanyIdentifier.onkyo.rawValue == 1583)
        #expect(CompanyIdentifier.onkyo.name == #"ONKYO Corporation"#)
        #expect(CompanyIdentifier.onkyo.description == #"ONKYO Corporation"#)
    
        // Asthrea D.O.O.
        #expect(CompanyIdentifier.asthrea.rawValue == 1584)
        #expect(CompanyIdentifier.asthrea.name == #"Asthrea D.O.O."#)
        #expect(CompanyIdentifier.asthrea.description == #"Asthrea D.O.O."#)
    
        // Fortiori Design LLC
        #expect(CompanyIdentifier.fortioriDesign.rawValue == 1585)
        #expect(CompanyIdentifier.fortioriDesign.name == #"Fortiori Design LLC"#)
        #expect(CompanyIdentifier.fortioriDesign.description == #"Fortiori Design LLC"#)
    
        // Hugo Muller GmbH & Co KG
        #expect(CompanyIdentifier.hugoMuller.rawValue == 1586)
        #expect(CompanyIdentifier.hugoMuller.name == #"Hugo Muller GmbH & Co KG"#)
        #expect(CompanyIdentifier.hugoMuller.description == #"Hugo Muller GmbH & Co KG"#)
    
        // Wangi Lai PLT
        #expect(CompanyIdentifier.wangiLaiPlt.rawValue == 1587)
        #expect(CompanyIdentifier.wangiLaiPlt.name == #"Wangi Lai PLT"#)
        #expect(CompanyIdentifier.wangiLaiPlt.description == #"Wangi Lai PLT"#)
    
        // Fanstel Corp
        #expect(CompanyIdentifier.fanstel.rawValue == 1588)
        #expect(CompanyIdentifier.fanstel.name == #"Fanstel Corp"#)
        #expect(CompanyIdentifier.fanstel.description == #"Fanstel Corp"#)
    
        // Crookwood
        #expect(CompanyIdentifier.crookwood.rawValue == 1589)
        #expect(CompanyIdentifier.crookwood.name == #"Crookwood"#)
        #expect(CompanyIdentifier.crookwood.description == #"Crookwood"#)
    
        // ELECTRONICA INTEGRAL DE SONIDO S.A.
        #expect(CompanyIdentifier.electronicaIntegralDeSonido.rawValue == 1590)
        #expect(CompanyIdentifier.electronicaIntegralDeSonido.name == #"ELECTRONICA INTEGRAL DE SONIDO S.A."#)
        #expect(CompanyIdentifier.electronicaIntegralDeSonido.description == #"ELECTRONICA INTEGRAL DE SONIDO S.A."#)
    
        // GiP Innovation Tools GmbH
        #expect(CompanyIdentifier.gipInnovationTools.rawValue == 1591)
        #expect(CompanyIdentifier.gipInnovationTools.name == #"GiP Innovation Tools GmbH"#)
        #expect(CompanyIdentifier.gipInnovationTools.description == #"GiP Innovation Tools GmbH"#)
    
        // LX SOLUTIONS PTY LIMITED
        #expect(CompanyIdentifier.lxSolutions.rawValue == 1592)
        #expect(CompanyIdentifier.lxSolutions.name == #"LX SOLUTIONS PTY LIMITED"#)
        #expect(CompanyIdentifier.lxSolutions.description == #"LX SOLUTIONS PTY LIMITED"#)
    
        // Shenzhen Minew Technologies Co., Ltd.
        #expect(CompanyIdentifier.shenzhenMinewTechnologies.rawValue == 1593)
        #expect(CompanyIdentifier.shenzhenMinewTechnologies.name == #"Shenzhen Minew Technologies Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenMinewTechnologies.description == #"Shenzhen Minew Technologies Co., Ltd."#)
    
        // Prolojik Limited
        #expect(CompanyIdentifier.prolojik.rawValue == 1594)
        #expect(CompanyIdentifier.prolojik.name == #"Prolojik Limited"#)
        #expect(CompanyIdentifier.prolojik.description == #"Prolojik Limited"#)
    
        // Kromek Group Plc
        #expect(CompanyIdentifier.kromekGroupPlc.rawValue == 1595)
        #expect(CompanyIdentifier.kromekGroupPlc.name == #"Kromek Group Plc"#)
        #expect(CompanyIdentifier.kromekGroupPlc.description == #"Kromek Group Plc"#)
    
        // Contec Medical Systems Co., Ltd.
        #expect(CompanyIdentifier.contecMedicalSystems.rawValue == 1596)
        #expect(CompanyIdentifier.contecMedicalSystems.name == #"Contec Medical Systems Co., Ltd."#)
        #expect(CompanyIdentifier.contecMedicalSystems.description == #"Contec Medical Systems Co., Ltd."#)
    
        // Xradio Technology Co.,Ltd.
        #expect(CompanyIdentifier.xradioTechnology.rawValue == 1597)
        #expect(CompanyIdentifier.xradioTechnology.name == #"Xradio Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.xradioTechnology.description == #"Xradio Technology Co.,Ltd."#)
    
        // The Indoor Lab, LLC
        #expect(CompanyIdentifier.indoorLab.rawValue == 1598)
        #expect(CompanyIdentifier.indoorLab.name == #"The Indoor Lab, LLC"#)
        #expect(CompanyIdentifier.indoorLab.description == #"The Indoor Lab, LLC"#)
    
        // LDL TECHNOLOGY
        #expect(CompanyIdentifier.ldlTechnology.rawValue == 1599)
        #expect(CompanyIdentifier.ldlTechnology.name == #"LDL TECHNOLOGY"#)
        #expect(CompanyIdentifier.ldlTechnology.description == #"LDL TECHNOLOGY"#)
    
        // Dish Network LLC
        #expect(CompanyIdentifier.dishNetwork.rawValue == 1600)
        #expect(CompanyIdentifier.dishNetwork.name == #"Dish Network LLC"#)
        #expect(CompanyIdentifier.dishNetwork.description == #"Dish Network LLC"#)
    
        // Revenue Collection Systems FRANCE SAS
        #expect(CompanyIdentifier.revenueCollectionSystemsFrances.rawValue == 1601)
        #expect(CompanyIdentifier.revenueCollectionSystemsFrances.name == #"Revenue Collection Systems FRANCE SAS"#)
        #expect(CompanyIdentifier.revenueCollectionSystemsFrances.description == #"Revenue Collection Systems FRANCE SAS"#)
    
        // Bluetrum Technology Co.,Ltd
        #expect(CompanyIdentifier.bluetrumTechnology.rawValue == 1602)
        #expect(CompanyIdentifier.bluetrumTechnology.name == #"Bluetrum Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.bluetrumTechnology.description == #"Bluetrum Technology Co.,Ltd"#)
    
        // makita corporation
        #expect(CompanyIdentifier.makita.rawValue == 1603)
        #expect(CompanyIdentifier.makita.name == #"makita corporation"#)
        #expect(CompanyIdentifier.makita.description == #"makita corporation"#)
    
        // Apogee Instruments
        #expect(CompanyIdentifier.apogeeInstruments.rawValue == 1604)
        #expect(CompanyIdentifier.apogeeInstruments.name == #"Apogee Instruments"#)
        #expect(CompanyIdentifier.apogeeInstruments.description == #"Apogee Instruments"#)
    
        // BM3
        #expect(CompanyIdentifier.bm3.rawValue == 1605)
        #expect(CompanyIdentifier.bm3.name == #"BM3"#)
        #expect(CompanyIdentifier.bm3.description == #"BM3"#)
    
        // SGV Group Holding GmbH & Co. KG
        #expect(CompanyIdentifier.sgvGroupHolding.rawValue == 1606)
        #expect(CompanyIdentifier.sgvGroupHolding.name == #"SGV Group Holding GmbH & Co. KG"#)
        #expect(CompanyIdentifier.sgvGroupHolding.description == #"SGV Group Holding GmbH & Co. KG"#)
    
        // MED-EL
        #expect(CompanyIdentifier.medEl.rawValue == 1607)
        #expect(CompanyIdentifier.medEl.name == #"MED-EL"#)
        #expect(CompanyIdentifier.medEl.description == #"MED-EL"#)
    
        // Ultune Technologies
        #expect(CompanyIdentifier.ultuneTechnologies.rawValue == 1608)
        #expect(CompanyIdentifier.ultuneTechnologies.name == #"Ultune Technologies"#)
        #expect(CompanyIdentifier.ultuneTechnologies.description == #"Ultune Technologies"#)
    
        // Ryeex Technology Co.,Ltd.
        #expect(CompanyIdentifier.ryeexTechnology.rawValue == 1609)
        #expect(CompanyIdentifier.ryeexTechnology.name == #"Ryeex Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.ryeexTechnology.description == #"Ryeex Technology Co.,Ltd."#)
    
        // Open Research Institute, Inc.
        #expect(CompanyIdentifier.openResearchInstitute.rawValue == 1610)
        #expect(CompanyIdentifier.openResearchInstitute.name == #"Open Research Institute, Inc."#)
        #expect(CompanyIdentifier.openResearchInstitute.description == #"Open Research Institute, Inc."#)
    
        // Scale-Tec, Ltd
        #expect(CompanyIdentifier.scaleTec.rawValue == 1611)
        #expect(CompanyIdentifier.scaleTec.name == #"Scale-Tec, Ltd"#)
        #expect(CompanyIdentifier.scaleTec.description == #"Scale-Tec, Ltd"#)
    
        // Zumtobel Group AG
        #expect(CompanyIdentifier.zumtobelGroup.rawValue == 1612)
        #expect(CompanyIdentifier.zumtobelGroup.name == #"Zumtobel Group AG"#)
        #expect(CompanyIdentifier.zumtobelGroup.description == #"Zumtobel Group AG"#)
    
        // iLOQ Oy
        #expect(CompanyIdentifier.iloq.rawValue == 1613)
        #expect(CompanyIdentifier.iloq.name == #"iLOQ Oy"#)
        #expect(CompanyIdentifier.iloq.description == #"iLOQ Oy"#)
    
        // KRUXWorks Technologies Private Limited
        #expect(CompanyIdentifier.kruxworksTechnologies.rawValue == 1614)
        #expect(CompanyIdentifier.kruxworksTechnologies.name == #"KRUXWorks Technologies Private Limited"#)
        #expect(CompanyIdentifier.kruxworksTechnologies.description == #"KRUXWorks Technologies Private Limited"#)
    
        // Digital Matter Pty Ltd
        #expect(CompanyIdentifier.digitalMatter.rawValue == 1615)
        #expect(CompanyIdentifier.digitalMatter.name == #"Digital Matter Pty Ltd"#)
        #expect(CompanyIdentifier.digitalMatter.description == #"Digital Matter Pty Ltd"#)
    
        // Coravin, Inc.
        #expect(CompanyIdentifier.coravin.rawValue == 1616)
        #expect(CompanyIdentifier.coravin.name == #"Coravin, Inc."#)
        #expect(CompanyIdentifier.coravin.description == #"Coravin, Inc."#)
    
        // Stasis Labs, Inc.
        #expect(CompanyIdentifier.stasisLabs.rawValue == 1617)
        #expect(CompanyIdentifier.stasisLabs.name == #"Stasis Labs, Inc."#)
        #expect(CompanyIdentifier.stasisLabs.description == #"Stasis Labs, Inc."#)
    
        // ITZ Innovations- und Technologiezentrum GmbH
        #expect(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.rawValue == 1618)
        #expect(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.name == #"ITZ Innovations- und Technologiezentrum GmbH"#)
        #expect(CompanyIdentifier.itzInnovationsUndTechnologiezentrum.description == #"ITZ Innovations- und Technologiezentrum GmbH"#)
    
        // Meggitt SA
        #expect(CompanyIdentifier.meggitt.rawValue == 1619)
        #expect(CompanyIdentifier.meggitt.name == #"Meggitt SA"#)
        #expect(CompanyIdentifier.meggitt.description == #"Meggitt SA"#)
    
        // Ledlenser GmbH & Co. KG
        #expect(CompanyIdentifier.ledlenser.rawValue == 1620)
        #expect(CompanyIdentifier.ledlenser.name == #"Ledlenser GmbH & Co. KG"#)
        #expect(CompanyIdentifier.ledlenser.description == #"Ledlenser GmbH & Co. KG"#)
    
        // Renishaw PLC
        #expect(CompanyIdentifier.renishawPlc.rawValue == 1621)
        #expect(CompanyIdentifier.renishawPlc.name == #"Renishaw PLC"#)
        #expect(CompanyIdentifier.renishawPlc.description == #"Renishaw PLC"#)
    
        // ZhuHai AdvanPro Technology Company Limited
        #expect(CompanyIdentifier.zhuhaiAdvanproTechnology.rawValue == 1622)
        #expect(CompanyIdentifier.zhuhaiAdvanproTechnology.name == #"ZhuHai AdvanPro Technology Company Limited"#)
        #expect(CompanyIdentifier.zhuhaiAdvanproTechnology.description == #"ZhuHai AdvanPro Technology Company Limited"#)
    
        // Meshtronix Limited
        #expect(CompanyIdentifier.meshtronix.rawValue == 1623)
        #expect(CompanyIdentifier.meshtronix.name == #"Meshtronix Limited"#)
        #expect(CompanyIdentifier.meshtronix.description == #"Meshtronix Limited"#)
    
        // Payex Norge AS
        #expect(CompanyIdentifier.payexNorge.rawValue == 1624)
        #expect(CompanyIdentifier.payexNorge.name == #"Payex Norge AS"#)
        #expect(CompanyIdentifier.payexNorge.description == #"Payex Norge AS"#)
    
        // UnSeen Technologies Oy
        #expect(CompanyIdentifier.unseenTechnologies.rawValue == 1625)
        #expect(CompanyIdentifier.unseenTechnologies.name == #"UnSeen Technologies Oy"#)
        #expect(CompanyIdentifier.unseenTechnologies.description == #"UnSeen Technologies Oy"#)
    
        // Zound Industries International AB
        #expect(CompanyIdentifier.zoundIndustriesInternational.rawValue == 1626)
        #expect(CompanyIdentifier.zoundIndustriesInternational.name == #"Zound Industries International AB"#)
        #expect(CompanyIdentifier.zoundIndustriesInternational.description == #"Zound Industries International AB"#)
    
        // Sesam Solutions BV
        #expect(CompanyIdentifier.sesamSolutions.rawValue == 1627)
        #expect(CompanyIdentifier.sesamSolutions.name == #"Sesam Solutions BV"#)
        #expect(CompanyIdentifier.sesamSolutions.description == #"Sesam Solutions BV"#)
    
        // PixArt Imaging Inc.
        #expect(CompanyIdentifier.pixartImaging.rawValue == 1628)
        #expect(CompanyIdentifier.pixartImaging.name == #"PixArt Imaging Inc."#)
        #expect(CompanyIdentifier.pixartImaging.description == #"PixArt Imaging Inc."#)
    
        // Panduit Corp.
        #expect(CompanyIdentifier.panduit.rawValue == 1629)
        #expect(CompanyIdentifier.panduit.name == #"Panduit Corp."#)
        #expect(CompanyIdentifier.panduit.description == #"Panduit Corp."#)
    
        // Alo AB
        #expect(CompanyIdentifier.alo.rawValue == 1630)
        #expect(CompanyIdentifier.alo.name == #"Alo AB"#)
        #expect(CompanyIdentifier.alo.description == #"Alo AB"#)
    
        // Ricoh Company Ltd
        #expect(CompanyIdentifier.ricoh.rawValue == 1631)
        #expect(CompanyIdentifier.ricoh.name == #"Ricoh Company Ltd"#)
        #expect(CompanyIdentifier.ricoh.description == #"Ricoh Company Ltd"#)
    
        // RTC Industries, Inc.
        #expect(CompanyIdentifier.rtcIndustries.rawValue == 1632)
        #expect(CompanyIdentifier.rtcIndustries.name == #"RTC Industries, Inc."#)
        #expect(CompanyIdentifier.rtcIndustries.description == #"RTC Industries, Inc."#)
    
        // Mode Lighting Limited
        #expect(CompanyIdentifier.modeLighting.rawValue == 1633)
        #expect(CompanyIdentifier.modeLighting.name == #"Mode Lighting Limited"#)
        #expect(CompanyIdentifier.modeLighting.description == #"Mode Lighting Limited"#)
    
        // Particle Industries, Inc.
        #expect(CompanyIdentifier.particleIndustries.rawValue == 1634)
        #expect(CompanyIdentifier.particleIndustries.name == #"Particle Industries, Inc."#)
        #expect(CompanyIdentifier.particleIndustries.description == #"Particle Industries, Inc."#)
    
        // Advanced Telemetry Systems, Inc.
        #expect(CompanyIdentifier.advancedTelemetrySystems.rawValue == 1635)
        #expect(CompanyIdentifier.advancedTelemetrySystems.name == #"Advanced Telemetry Systems, Inc."#)
        #expect(CompanyIdentifier.advancedTelemetrySystems.description == #"Advanced Telemetry Systems, Inc."#)
    
        // RHA TECHNOLOGIES LTD
        #expect(CompanyIdentifier.rhaTechnologies.rawValue == 1636)
        #expect(CompanyIdentifier.rhaTechnologies.name == #"RHA TECHNOLOGIES LTD"#)
        #expect(CompanyIdentifier.rhaTechnologies.description == #"RHA TECHNOLOGIES LTD"#)
    
        // Pure International Limited
        #expect(CompanyIdentifier.pureInternational.rawValue == 1637)
        #expect(CompanyIdentifier.pureInternational.name == #"Pure International Limited"#)
        #expect(CompanyIdentifier.pureInternational.description == #"Pure International Limited"#)
    
        // WTO Werkzeug-Einrichtungen GmbH
        #expect(CompanyIdentifier.wtoWerkzeugEinrichtungen.rawValue == 1638)
        #expect(CompanyIdentifier.wtoWerkzeugEinrichtungen.name == #"WTO Werkzeug-Einrichtungen GmbH"#)
        #expect(CompanyIdentifier.wtoWerkzeugEinrichtungen.description == #"WTO Werkzeug-Einrichtungen GmbH"#)
    
        // Spark Technology Labs Inc.
        #expect(CompanyIdentifier.sparkTechnologyLabs.rawValue == 1639)
        #expect(CompanyIdentifier.sparkTechnologyLabs.name == #"Spark Technology Labs Inc."#)
        #expect(CompanyIdentifier.sparkTechnologyLabs.description == #"Spark Technology Labs Inc."#)
    
        // Bleb Technology srl
        #expect(CompanyIdentifier.blebTechnology.rawValue == 1640)
        #expect(CompanyIdentifier.blebTechnology.name == #"Bleb Technology srl"#)
        #expect(CompanyIdentifier.blebTechnology.description == #"Bleb Technology srl"#)
    
        // Livanova USA, Inc.
        #expect(CompanyIdentifier.livanova.rawValue == 1641)
        #expect(CompanyIdentifier.livanova.name == #"Livanova USA, Inc."#)
        #expect(CompanyIdentifier.livanova.description == #"Livanova USA, Inc."#)
    
        // Brady Worldwide Inc.
        #expect(CompanyIdentifier.bradyWorldwide.rawValue == 1642)
        #expect(CompanyIdentifier.bradyWorldwide.name == #"Brady Worldwide Inc."#)
        #expect(CompanyIdentifier.bradyWorldwide.description == #"Brady Worldwide Inc."#)
    
        // DewertOkin GmbH
        #expect(CompanyIdentifier.dewertokin.rawValue == 1643)
        #expect(CompanyIdentifier.dewertokin.name == #"DewertOkin GmbH"#)
        #expect(CompanyIdentifier.dewertokin.description == #"DewertOkin GmbH"#)
    
        // Ztove ApS
        #expect(CompanyIdentifier.ztove.rawValue == 1644)
        #expect(CompanyIdentifier.ztove.name == #"Ztove ApS"#)
        #expect(CompanyIdentifier.ztove.description == #"Ztove ApS"#)
    
        // Venso EcoSolutions AB
        #expect(CompanyIdentifier.vensoEcosolutions.rawValue == 1645)
        #expect(CompanyIdentifier.vensoEcosolutions.name == #"Venso EcoSolutions AB"#)
        #expect(CompanyIdentifier.vensoEcosolutions.description == #"Venso EcoSolutions AB"#)
    
        // Eurotronik Kranj d.o.o.
        #expect(CompanyIdentifier.eurotronikKranj.rawValue == 1646)
        #expect(CompanyIdentifier.eurotronikKranj.name == #"Eurotronik Kranj d.o.o."#)
        #expect(CompanyIdentifier.eurotronikKranj.description == #"Eurotronik Kranj d.o.o."#)
    
        // Hug Technology Ltd
        #expect(CompanyIdentifier.hugTechnology.rawValue == 1647)
        #expect(CompanyIdentifier.hugTechnology.name == #"Hug Technology Ltd"#)
        #expect(CompanyIdentifier.hugTechnology.description == #"Hug Technology Ltd"#)
    
        // Gema Switzerland GmbH
        #expect(CompanyIdentifier.gemaSwitzerland.rawValue == 1648)
        #expect(CompanyIdentifier.gemaSwitzerland.name == #"Gema Switzerland GmbH"#)
        #expect(CompanyIdentifier.gemaSwitzerland.description == #"Gema Switzerland GmbH"#)
    
        // Buzz Products Ltd.
        #expect(CompanyIdentifier.buzzProducts.rawValue == 1649)
        #expect(CompanyIdentifier.buzzProducts.name == #"Buzz Products Ltd."#)
        #expect(CompanyIdentifier.buzzProducts.description == #"Buzz Products Ltd."#)
    
        // Kopi
        #expect(CompanyIdentifier.kopi.rawValue == 1650)
        #expect(CompanyIdentifier.kopi.name == #"Kopi"#)
        #expect(CompanyIdentifier.kopi.description == #"Kopi"#)
    
        // Innova Ideas Limited
        #expect(CompanyIdentifier.innovaIdeas.rawValue == 1651)
        #expect(CompanyIdentifier.innovaIdeas.name == #"Innova Ideas Limited"#)
        #expect(CompanyIdentifier.innovaIdeas.description == #"Innova Ideas Limited"#)
    
        // BeSpoon
        #expect(CompanyIdentifier.bespoon.rawValue == 1652)
        #expect(CompanyIdentifier.bespoon.name == #"BeSpoon"#)
        #expect(CompanyIdentifier.bespoon.description == #"BeSpoon"#)
    
        // Deco Enterprises, Inc.
        #expect(CompanyIdentifier.decoEnterprises.rawValue == 1653)
        #expect(CompanyIdentifier.decoEnterprises.name == #"Deco Enterprises, Inc."#)
        #expect(CompanyIdentifier.decoEnterprises.description == #"Deco Enterprises, Inc."#)
    
        // Expai Solutions Private Limited
        #expect(CompanyIdentifier.expaiSolutions.rawValue == 1654)
        #expect(CompanyIdentifier.expaiSolutions.name == #"Expai Solutions Private Limited"#)
        #expect(CompanyIdentifier.expaiSolutions.description == #"Expai Solutions Private Limited"#)
    
        // Innovation First, Inc.
        #expect(CompanyIdentifier.innovationFirst.rawValue == 1655)
        #expect(CompanyIdentifier.innovationFirst.name == #"Innovation First, Inc."#)
        #expect(CompanyIdentifier.innovationFirst.description == #"Innovation First, Inc."#)
    
        // SABIK Offshore GmbH
        #expect(CompanyIdentifier.sabikOffshore.rawValue == 1656)
        #expect(CompanyIdentifier.sabikOffshore.name == #"SABIK Offshore GmbH"#)
        #expect(CompanyIdentifier.sabikOffshore.description == #"SABIK Offshore GmbH"#)
    
        // 4iiii Innovations Inc.
        #expect(CompanyIdentifier.company4IiiiInnovations.rawValue == 1657)
        #expect(CompanyIdentifier.company4IiiiInnovations.name == #"4iiii Innovations Inc."#)
        #expect(CompanyIdentifier.company4IiiiInnovations.description == #"4iiii Innovations Inc."#)
    
        // The Energy Conservatory, Inc.
        #expect(CompanyIdentifier.energyConservatory.rawValue == 1658)
        #expect(CompanyIdentifier.energyConservatory.name == #"The Energy Conservatory, Inc."#)
        #expect(CompanyIdentifier.energyConservatory.description == #"The Energy Conservatory, Inc."#)
    
        // I.FARM, INC.
        #expect(CompanyIdentifier.iFarm.rawValue == 1659)
        #expect(CompanyIdentifier.iFarm.name == #"I.FARM, INC."#)
        #expect(CompanyIdentifier.iFarm.description == #"I.FARM, INC."#)
    
        // Tile, Inc.
        #expect(CompanyIdentifier.tile.rawValue == 1660)
        #expect(CompanyIdentifier.tile.name == #"Tile, Inc."#)
        #expect(CompanyIdentifier.tile.description == #"Tile, Inc."#)
    
        // Form Athletica Inc.
        #expect(CompanyIdentifier.formAthletica.rawValue == 1661)
        #expect(CompanyIdentifier.formAthletica.name == #"Form Athletica Inc."#)
        #expect(CompanyIdentifier.formAthletica.description == #"Form Athletica Inc."#)
    
        // MbientLab Inc
        #expect(CompanyIdentifier.mbientlab.rawValue == 1662)
        #expect(CompanyIdentifier.mbientlab.name == #"MbientLab Inc"#)
        #expect(CompanyIdentifier.mbientlab.description == #"MbientLab Inc"#)
    
        // NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO
        #expect(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.rawValue == 1663)
        #expect(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.name == #"NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO"#)
        #expect(CompanyIdentifier.netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico.description == #"NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO"#)
    
        // Mannkind Corporation
        #expect(CompanyIdentifier.mannkind.rawValue == 1664)
        #expect(CompanyIdentifier.mannkind.name == #"Mannkind Corporation"#)
        #expect(CompanyIdentifier.mannkind.description == #"Mannkind Corporation"#)
    
        // Trade FIDES a.s.
        #expect(CompanyIdentifier.tradeFides.rawValue == 1665)
        #expect(CompanyIdentifier.tradeFides.name == #"Trade FIDES a.s."#)
        #expect(CompanyIdentifier.tradeFides.description == #"Trade FIDES a.s."#)
    
        // Photron Limited
        #expect(CompanyIdentifier.photron.rawValue == 1666)
        #expect(CompanyIdentifier.photron.name == #"Photron Limited"#)
        #expect(CompanyIdentifier.photron.description == #"Photron Limited"#)
    
        // Eltako GmbH
        #expect(CompanyIdentifier.eltako.rawValue == 1667)
        #expect(CompanyIdentifier.eltako.name == #"Eltako GmbH"#)
        #expect(CompanyIdentifier.eltako.description == #"Eltako GmbH"#)
    
        // Dermalapps, LLC
        #expect(CompanyIdentifier.dermalapps.rawValue == 1668)
        #expect(CompanyIdentifier.dermalapps.name == #"Dermalapps, LLC"#)
        #expect(CompanyIdentifier.dermalapps.description == #"Dermalapps, LLC"#)
    
        // Greenwald Industries
        #expect(CompanyIdentifier.greenwaldIndustries.rawValue == 1669)
        #expect(CompanyIdentifier.greenwaldIndustries.name == #"Greenwald Industries"#)
        #expect(CompanyIdentifier.greenwaldIndustries.description == #"Greenwald Industries"#)
    
        // inQs Co., Ltd.
        #expect(CompanyIdentifier.inqs.rawValue == 1670)
        #expect(CompanyIdentifier.inqs.name == #"inQs Co., Ltd."#)
        #expect(CompanyIdentifier.inqs.description == #"inQs Co., Ltd."#)
    
        // Cherry GmbH
        #expect(CompanyIdentifier.cherry.rawValue == 1671)
        #expect(CompanyIdentifier.cherry.name == #"Cherry GmbH"#)
        #expect(CompanyIdentifier.cherry.description == #"Cherry GmbH"#)
    
        // Amsted Digital Solutions Inc.
        #expect(CompanyIdentifier.amstedDigitalSolutions.rawValue == 1672)
        #expect(CompanyIdentifier.amstedDigitalSolutions.name == #"Amsted Digital Solutions Inc."#)
        #expect(CompanyIdentifier.amstedDigitalSolutions.description == #"Amsted Digital Solutions Inc."#)
    
        // Tacx b.v.
        #expect(CompanyIdentifier.tacx.rawValue == 1673)
        #expect(CompanyIdentifier.tacx.name == #"Tacx b.v."#)
        #expect(CompanyIdentifier.tacx.description == #"Tacx b.v."#)
    
        // Raytac Corporation
        #expect(CompanyIdentifier.raytac.rawValue == 1674)
        #expect(CompanyIdentifier.raytac.name == #"Raytac Corporation"#)
        #expect(CompanyIdentifier.raytac.description == #"Raytac Corporation"#)
    
        // Jiangsu Teranovo Tech Co., Ltd.
        #expect(CompanyIdentifier.jiangsuTeranovoTech.rawValue == 1675)
        #expect(CompanyIdentifier.jiangsuTeranovoTech.name == #"Jiangsu Teranovo Tech Co., Ltd."#)
        #expect(CompanyIdentifier.jiangsuTeranovoTech.description == #"Jiangsu Teranovo Tech Co., Ltd."#)
    
        // Changzhou Sound Dragon Electronics and Acoustics Co., Ltd
        #expect(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.rawValue == 1676)
        #expect(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.name == #"Changzhou Sound Dragon Electronics and Acoustics Co., Ltd"#)
        #expect(CompanyIdentifier.changzhouSoundDragonElectronicsAndAcoustics.description == #"Changzhou Sound Dragon Electronics and Acoustics Co., Ltd"#)
    
        // JetBeep Inc.
        #expect(CompanyIdentifier.jetbeep.rawValue == 1677)
        #expect(CompanyIdentifier.jetbeep.name == #"JetBeep Inc."#)
        #expect(CompanyIdentifier.jetbeep.description == #"JetBeep Inc."#)
    
        // Razer Inc.
        #expect(CompanyIdentifier.razer.rawValue == 1678)
        #expect(CompanyIdentifier.razer.name == #"Razer Inc."#)
        #expect(CompanyIdentifier.razer.description == #"Razer Inc."#)
    
        // JRM Group Limited
        #expect(CompanyIdentifier.jrmGroup.rawValue == 1679)
        #expect(CompanyIdentifier.jrmGroup.name == #"JRM Group Limited"#)
        #expect(CompanyIdentifier.jrmGroup.description == #"JRM Group Limited"#)
    
        // Eccrine Systems, Inc.
        #expect(CompanyIdentifier.eccrineSystems.rawValue == 1680)
        #expect(CompanyIdentifier.eccrineSystems.name == #"Eccrine Systems, Inc."#)
        #expect(CompanyIdentifier.eccrineSystems.description == #"Eccrine Systems, Inc."#)
    
        // Curie Point AB
        #expect(CompanyIdentifier.curiePoint.rawValue == 1681)
        #expect(CompanyIdentifier.curiePoint.name == #"Curie Point AB"#)
        #expect(CompanyIdentifier.curiePoint.description == #"Curie Point AB"#)
    
        // Georg Fischer AG
        #expect(CompanyIdentifier.georgFischer.rawValue == 1682)
        #expect(CompanyIdentifier.georgFischer.name == #"Georg Fischer AG"#)
        #expect(CompanyIdentifier.georgFischer.description == #"Georg Fischer AG"#)
    
        // Hach - Danaher
        #expect(CompanyIdentifier.hachDanaher.rawValue == 1683)
        #expect(CompanyIdentifier.hachDanaher.name == #"Hach - Danaher"#)
        #expect(CompanyIdentifier.hachDanaher.description == #"Hach - Danaher"#)
    
        // T&A Laboratories LLC
        #expect(CompanyIdentifier.tALaboratories.rawValue == 1684)
        #expect(CompanyIdentifier.tALaboratories.name == #"T&A Laboratories LLC"#)
        #expect(CompanyIdentifier.tALaboratories.description == #"T&A Laboratories LLC"#)
    
        // Koki Holdings Co., Ltd.
        #expect(CompanyIdentifier.kokiHoldings.rawValue == 1685)
        #expect(CompanyIdentifier.kokiHoldings.name == #"Koki Holdings Co., Ltd."#)
        #expect(CompanyIdentifier.kokiHoldings.description == #"Koki Holdings Co., Ltd."#)
    
        // Gunakar Private Limited
        #expect(CompanyIdentifier.gunakar.rawValue == 1686)
        #expect(CompanyIdentifier.gunakar.name == #"Gunakar Private Limited"#)
        #expect(CompanyIdentifier.gunakar.description == #"Gunakar Private Limited"#)
    
        // Stemco Products Inc
        #expect(CompanyIdentifier.stemcoProducts.rawValue == 1687)
        #expect(CompanyIdentifier.stemcoProducts.name == #"Stemco Products Inc"#)
        #expect(CompanyIdentifier.stemcoProducts.description == #"Stemco Products Inc"#)
    
        // Wood IT Security, LLC
        #expect(CompanyIdentifier.woodItSecurity.rawValue == 1688)
        #expect(CompanyIdentifier.woodItSecurity.name == #"Wood IT Security, LLC"#)
        #expect(CompanyIdentifier.woodItSecurity.description == #"Wood IT Security, LLC"#)
    
        // RandomLab SAS
        #expect(CompanyIdentifier.randomlabs.rawValue == 1689)
        #expect(CompanyIdentifier.randomlabs.name == #"RandomLab SAS"#)
        #expect(CompanyIdentifier.randomlabs.description == #"RandomLab SAS"#)
    
        // Adero, Inc.
        #expect(CompanyIdentifier.adero.rawValue == 1690)
        #expect(CompanyIdentifier.adero.name == #"Adero, Inc."#)
        #expect(CompanyIdentifier.adero.description == #"Adero, Inc."#)
    
        // Dragonchip Limited
        #expect(CompanyIdentifier.dragonchip.rawValue == 1691)
        #expect(CompanyIdentifier.dragonchip.name == #"Dragonchip Limited"#)
        #expect(CompanyIdentifier.dragonchip.description == #"Dragonchip Limited"#)
    
        // Noomi AB
        #expect(CompanyIdentifier.noomi.rawValue == 1692)
        #expect(CompanyIdentifier.noomi.name == #"Noomi AB"#)
        #expect(CompanyIdentifier.noomi.description == #"Noomi AB"#)
    
        // Vakaros LLC
        #expect(CompanyIdentifier.vakaros.rawValue == 1693)
        #expect(CompanyIdentifier.vakaros.name == #"Vakaros LLC"#)
        #expect(CompanyIdentifier.vakaros.description == #"Vakaros LLC"#)
    
        // Delta Electronics, Inc.
        #expect(CompanyIdentifier.deltaElectronics.rawValue == 1694)
        #expect(CompanyIdentifier.deltaElectronics.name == #"Delta Electronics, Inc."#)
        #expect(CompanyIdentifier.deltaElectronics.description == #"Delta Electronics, Inc."#)
    
        // FlowMotion Technologies AS
        #expect(CompanyIdentifier.flowmotionTechnologies.rawValue == 1695)
        #expect(CompanyIdentifier.flowmotionTechnologies.name == #"FlowMotion Technologies AS"#)
        #expect(CompanyIdentifier.flowmotionTechnologies.description == #"FlowMotion Technologies AS"#)
    
        // OBIQ Location Technology Inc.
        #expect(CompanyIdentifier.obiqLocationTechnology.rawValue == 1696)
        #expect(CompanyIdentifier.obiqLocationTechnology.name == #"OBIQ Location Technology Inc."#)
        #expect(CompanyIdentifier.obiqLocationTechnology.description == #"OBIQ Location Technology Inc."#)
    
        // Cardo Systems, Ltd
        #expect(CompanyIdentifier.cardoSystems.rawValue == 1697)
        #expect(CompanyIdentifier.cardoSystems.name == #"Cardo Systems, Ltd"#)
        #expect(CompanyIdentifier.cardoSystems.description == #"Cardo Systems, Ltd"#)
    
        // Globalworx GmbH
        #expect(CompanyIdentifier.globalworx.rawValue == 1698)
        #expect(CompanyIdentifier.globalworx.name == #"Globalworx GmbH"#)
        #expect(CompanyIdentifier.globalworx.description == #"Globalworx GmbH"#)
    
        // Nymbus, LLC
        #expect(CompanyIdentifier.nymbus.rawValue == 1699)
        #expect(CompanyIdentifier.nymbus.name == #"Nymbus, LLC"#)
        #expect(CompanyIdentifier.nymbus.description == #"Nymbus, LLC"#)
    
        // LIMNO Co. Ltd.
        #expect(CompanyIdentifier.limno.rawValue == 1700)
        #expect(CompanyIdentifier.limno.name == #"LIMNO Co. Ltd."#)
        #expect(CompanyIdentifier.limno.description == #"LIMNO Co. Ltd."#)
    
        // TEKZITEL PTY LTD
        #expect(CompanyIdentifier.tekzitel.rawValue == 1701)
        #expect(CompanyIdentifier.tekzitel.name == #"TEKZITEL PTY LTD"#)
        #expect(CompanyIdentifier.tekzitel.description == #"TEKZITEL PTY LTD"#)
    
        // Roambee Corporation
        #expect(CompanyIdentifier.roambee.rawValue == 1702)
        #expect(CompanyIdentifier.roambee.name == #"Roambee Corporation"#)
        #expect(CompanyIdentifier.roambee.description == #"Roambee Corporation"#)
    
        // Chipsea Technologies (ShenZhen) Corp.
        #expect(CompanyIdentifier.chipseaTechnologiesShenzhen.rawValue == 1703)
        #expect(CompanyIdentifier.chipseaTechnologiesShenzhen.name == #"Chipsea Technologies (ShenZhen) Corp."#)
        #expect(CompanyIdentifier.chipseaTechnologiesShenzhen.description == #"Chipsea Technologies (ShenZhen) Corp."#)
    
        // GD Midea Air-Conditioning Equipment Co., Ltd.
        #expect(CompanyIdentifier.gdMideaAirConditioningEquipment.rawValue == 1704)
        #expect(CompanyIdentifier.gdMideaAirConditioningEquipment.name == #"GD Midea Air-Conditioning Equipment Co., Ltd."#)
        #expect(CompanyIdentifier.gdMideaAirConditioningEquipment.description == #"GD Midea Air-Conditioning Equipment Co., Ltd."#)
    
        // Soundmax Electronics Limited
        #expect(CompanyIdentifier.soundmaxElectronics.rawValue == 1705)
        #expect(CompanyIdentifier.soundmaxElectronics.name == #"Soundmax Electronics Limited"#)
        #expect(CompanyIdentifier.soundmaxElectronics.description == #"Soundmax Electronics Limited"#)
    
        // Produal Oy
        #expect(CompanyIdentifier.produal.rawValue == 1706)
        #expect(CompanyIdentifier.produal.name == #"Produal Oy"#)
        #expect(CompanyIdentifier.produal.description == #"Produal Oy"#)
    
        // HMS Industrial Networks AB
        #expect(CompanyIdentifier.hmsIndustrialNetworks.rawValue == 1707)
        #expect(CompanyIdentifier.hmsIndustrialNetworks.name == #"HMS Industrial Networks AB"#)
        #expect(CompanyIdentifier.hmsIndustrialNetworks.description == #"HMS Industrial Networks AB"#)
    
        // Ingchips Technology Co., Ltd.
        #expect(CompanyIdentifier.ingchipsTechnology.rawValue == 1708)
        #expect(CompanyIdentifier.ingchipsTechnology.name == #"Ingchips Technology Co., Ltd."#)
        #expect(CompanyIdentifier.ingchipsTechnology.description == #"Ingchips Technology Co., Ltd."#)
    
        // InnovaSea Systems Inc.
        #expect(CompanyIdentifier.innovaseaSystems.rawValue == 1709)
        #expect(CompanyIdentifier.innovaseaSystems.name == #"InnovaSea Systems Inc."#)
        #expect(CompanyIdentifier.innovaseaSystems.description == #"InnovaSea Systems Inc."#)
    
        // SenseQ Inc.
        #expect(CompanyIdentifier.senseq.rawValue == 1710)
        #expect(CompanyIdentifier.senseq.name == #"SenseQ Inc."#)
        #expect(CompanyIdentifier.senseq.description == #"SenseQ Inc."#)
    
        // Shoof Technologies
        #expect(CompanyIdentifier.shoofTechnologies.rawValue == 1711)
        #expect(CompanyIdentifier.shoofTechnologies.name == #"Shoof Technologies"#)
        #expect(CompanyIdentifier.shoofTechnologies.description == #"Shoof Technologies"#)
    
        // BRK Brands, Inc.
        #expect(CompanyIdentifier.brkBrands.rawValue == 1712)
        #expect(CompanyIdentifier.brkBrands.name == #"BRK Brands, Inc."#)
        #expect(CompanyIdentifier.brkBrands.description == #"BRK Brands, Inc."#)
    
        // SimpliSafe, Inc.
        #expect(CompanyIdentifier.simplisafe.rawValue == 1713)
        #expect(CompanyIdentifier.simplisafe.name == #"SimpliSafe, Inc."#)
        #expect(CompanyIdentifier.simplisafe.description == #"SimpliSafe, Inc."#)
    
        // Tussock Innovation 2013 Limited
        #expect(CompanyIdentifier.tussockInnovation2013.rawValue == 1714)
        #expect(CompanyIdentifier.tussockInnovation2013.name == #"Tussock Innovation 2013 Limited"#)
        #expect(CompanyIdentifier.tussockInnovation2013.description == #"Tussock Innovation 2013 Limited"#)
    
        // The Hablab ApS
        #expect(CompanyIdentifier.hablab.rawValue == 1715)
        #expect(CompanyIdentifier.hablab.name == #"The Hablab ApS"#)
        #expect(CompanyIdentifier.hablab.description == #"The Hablab ApS"#)
    
        // Sencilion Oy
        #expect(CompanyIdentifier.sencilion.rawValue == 1716)
        #expect(CompanyIdentifier.sencilion.name == #"Sencilion Oy"#)
        #expect(CompanyIdentifier.sencilion.description == #"Sencilion Oy"#)
    
        // Wabilogic Ltd.
        #expect(CompanyIdentifier.wabilogic.rawValue == 1717)
        #expect(CompanyIdentifier.wabilogic.name == #"Wabilogic Ltd."#)
        #expect(CompanyIdentifier.wabilogic.description == #"Wabilogic Ltd."#)
    
        // Sociometric Solutions, Inc.
        #expect(CompanyIdentifier.sociometricSolutions.rawValue == 1718)
        #expect(CompanyIdentifier.sociometricSolutions.name == #"Sociometric Solutions, Inc."#)
        #expect(CompanyIdentifier.sociometricSolutions.description == #"Sociometric Solutions, Inc."#)
    
        // iCOGNIZE GmbH
        #expect(CompanyIdentifier.icognize.rawValue == 1719)
        #expect(CompanyIdentifier.icognize.name == #"iCOGNIZE GmbH"#)
        #expect(CompanyIdentifier.icognize.description == #"iCOGNIZE GmbH"#)
    
        // ShadeCraft, Inc
        #expect(CompanyIdentifier.shadecraft.rawValue == 1720)
        #expect(CompanyIdentifier.shadecraft.name == #"ShadeCraft, Inc"#)
        #expect(CompanyIdentifier.shadecraft.description == #"ShadeCraft, Inc"#)
    
        // Beflex Inc.
        #expect(CompanyIdentifier.beflex.rawValue == 1721)
        #expect(CompanyIdentifier.beflex.name == #"Beflex Inc."#)
        #expect(CompanyIdentifier.beflex.description == #"Beflex Inc."#)
    
        // Beaconzone Ltd
        #expect(CompanyIdentifier.beaconzone.rawValue == 1722)
        #expect(CompanyIdentifier.beaconzone.name == #"Beaconzone Ltd"#)
        #expect(CompanyIdentifier.beaconzone.description == #"Beaconzone Ltd"#)
    
        // Leaftronix Analogic Solutions Private Limited
        #expect(CompanyIdentifier.leaftronixAnalogicSolutions.rawValue == 1723)
        #expect(CompanyIdentifier.leaftronixAnalogicSolutions.name == #"Leaftronix Analogic Solutions Private Limited"#)
        #expect(CompanyIdentifier.leaftronixAnalogicSolutions.description == #"Leaftronix Analogic Solutions Private Limited"#)
    
        // TWS Srl
        #expect(CompanyIdentifier.tws.rawValue == 1724)
        #expect(CompanyIdentifier.tws.name == #"TWS Srl"#)
        #expect(CompanyIdentifier.tws.description == #"TWS Srl"#)
    
        // ABB Oy
        #expect(CompanyIdentifier.abb.rawValue == 1725)
        #expect(CompanyIdentifier.abb.name == #"ABB Oy"#)
        #expect(CompanyIdentifier.abb.description == #"ABB Oy"#)
    
        // HitSeed Oy
        #expect(CompanyIdentifier.hitseed.rawValue == 1726)
        #expect(CompanyIdentifier.hitseed.name == #"HitSeed Oy"#)
        #expect(CompanyIdentifier.hitseed.description == #"HitSeed Oy"#)
    
        // Delcom Products Inc.
        #expect(CompanyIdentifier.delcomProducts.rawValue == 1727)
        #expect(CompanyIdentifier.delcomProducts.name == #"Delcom Products Inc."#)
        #expect(CompanyIdentifier.delcomProducts.description == #"Delcom Products Inc."#)
    
        // CAME S.p.A.
        #expect(CompanyIdentifier.came.rawValue == 1728)
        #expect(CompanyIdentifier.came.name == #"CAME S.p.A."#)
        #expect(CompanyIdentifier.came.description == #"CAME S.p.A."#)
    
        // Alarm.com Holdings, Inc
        #expect(CompanyIdentifier.alarmComHoldings.rawValue == 1729)
        #expect(CompanyIdentifier.alarmComHoldings.name == #"Alarm.com Holdings, Inc"#)
        #expect(CompanyIdentifier.alarmComHoldings.description == #"Alarm.com Holdings, Inc"#)
    
        // Measurlogic Inc.
        #expect(CompanyIdentifier.measurlogic.rawValue == 1730)
        #expect(CompanyIdentifier.measurlogic.name == #"Measurlogic Inc."#)
        #expect(CompanyIdentifier.measurlogic.description == #"Measurlogic Inc."#)
    
        // King I Electronics.Co.,Ltd
        #expect(CompanyIdentifier.kingIElectronics.rawValue == 1731)
        #expect(CompanyIdentifier.kingIElectronics.name == #"King I Electronics.Co.,Ltd"#)
        #expect(CompanyIdentifier.kingIElectronics.description == #"King I Electronics.Co.,Ltd"#)
    
        // Dream Labs GmbH
        #expect(CompanyIdentifier.dreamLabs.rawValue == 1732)
        #expect(CompanyIdentifier.dreamLabs.name == #"Dream Labs GmbH"#)
        #expect(CompanyIdentifier.dreamLabs.description == #"Dream Labs GmbH"#)
    
        // Urban Compass, Inc
        #expect(CompanyIdentifier.urbanCompass.rawValue == 1733)
        #expect(CompanyIdentifier.urbanCompass.name == #"Urban Compass, Inc"#)
        #expect(CompanyIdentifier.urbanCompass.description == #"Urban Compass, Inc"#)
    
        // Simm Tronic Limited
        #expect(CompanyIdentifier.simmTronic.rawValue == 1734)
        #expect(CompanyIdentifier.simmTronic.name == #"Simm Tronic Limited"#)
        #expect(CompanyIdentifier.simmTronic.description == #"Simm Tronic Limited"#)
    
        // Somatix Inc
        #expect(CompanyIdentifier.somatix.rawValue == 1735)
        #expect(CompanyIdentifier.somatix.name == #"Somatix Inc"#)
        #expect(CompanyIdentifier.somatix.description == #"Somatix Inc"#)
    
        // Storz & Bickel GmbH & Co. KG
        #expect(CompanyIdentifier.storzBickel.rawValue == 1736)
        #expect(CompanyIdentifier.storzBickel.name == #"Storz & Bickel GmbH & Co. KG"#)
        #expect(CompanyIdentifier.storzBickel.description == #"Storz & Bickel GmbH & Co. KG"#)
    
        // MYLAPS B.V.
        #expect(CompanyIdentifier.mylaps.rawValue == 1737)
        #expect(CompanyIdentifier.mylaps.name == #"MYLAPS B.V."#)
        #expect(CompanyIdentifier.mylaps.description == #"MYLAPS B.V."#)
    
        // Shenzhen Zhongguang Infotech Technology Development Co., Ltd
        #expect(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.rawValue == 1738)
        #expect(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.name == #"Shenzhen Zhongguang Infotech Technology Development Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenZhongguangInfotechTechnologyDevelopment.description == #"Shenzhen Zhongguang Infotech Technology Development Co., Ltd"#)
    
        // Dyeware, LLC
        #expect(CompanyIdentifier.dyeware.rawValue == 1739)
        #expect(CompanyIdentifier.dyeware.name == #"Dyeware, LLC"#)
        #expect(CompanyIdentifier.dyeware.description == #"Dyeware, LLC"#)
    
        // Dongguan SmartAction Technology Co.,Ltd.
        #expect(CompanyIdentifier.dongguanSmartactionTechnology.rawValue == 1740)
        #expect(CompanyIdentifier.dongguanSmartactionTechnology.name == #"Dongguan SmartAction Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.dongguanSmartactionTechnology.description == #"Dongguan SmartAction Technology Co.,Ltd."#)
    
        // DIG Corporation
        #expect(CompanyIdentifier.dig.rawValue == 1741)
        #expect(CompanyIdentifier.dig.name == #"DIG Corporation"#)
        #expect(CompanyIdentifier.dig.description == #"DIG Corporation"#)
    
        // FIOR & GENTZ
        #expect(CompanyIdentifier.fiorGentz.rawValue == 1742)
        #expect(CompanyIdentifier.fiorGentz.name == #"FIOR & GENTZ"#)
        #expect(CompanyIdentifier.fiorGentz.description == #"FIOR & GENTZ"#)
    
        // Belparts N.V.
        #expect(CompanyIdentifier.belparts.rawValue == 1743)
        #expect(CompanyIdentifier.belparts.name == #"Belparts N.V."#)
        #expect(CompanyIdentifier.belparts.description == #"Belparts N.V."#)
    
        // Etekcity Corporation
        #expect(CompanyIdentifier.etekcity.rawValue == 1744)
        #expect(CompanyIdentifier.etekcity.name == #"Etekcity Corporation"#)
        #expect(CompanyIdentifier.etekcity.description == #"Etekcity Corporation"#)
    
        // Meyer Sound Laboratories, Incorporated
        #expect(CompanyIdentifier.meyerSoundLaboratories.rawValue == 1745)
        #expect(CompanyIdentifier.meyerSoundLaboratories.name == #"Meyer Sound Laboratories, Incorporated"#)
        #expect(CompanyIdentifier.meyerSoundLaboratories.description == #"Meyer Sound Laboratories, Incorporated"#)
    
        // CeoTronics AG
        #expect(CompanyIdentifier.ceotronics.rawValue == 1746)
        #expect(CompanyIdentifier.ceotronics.name == #"CeoTronics AG"#)
        #expect(CompanyIdentifier.ceotronics.description == #"CeoTronics AG"#)
    
        // TriTeq Lock and Security, LLC
        #expect(CompanyIdentifier.triteqLockAndSecurity.rawValue == 1747)
        #expect(CompanyIdentifier.triteqLockAndSecurity.name == #"TriTeq Lock and Security, LLC"#)
        #expect(CompanyIdentifier.triteqLockAndSecurity.description == #"TriTeq Lock and Security, LLC"#)
    
        // DYNAKODE TECHNOLOGY PRIVATE LIMITED
        #expect(CompanyIdentifier.dynakodeTechnology.rawValue == 1748)
        #expect(CompanyIdentifier.dynakodeTechnology.name == #"DYNAKODE TECHNOLOGY PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.dynakodeTechnology.description == #"DYNAKODE TECHNOLOGY PRIVATE LIMITED"#)
    
        // Sensirion AG
        #expect(CompanyIdentifier.sensirion.rawValue == 1749)
        #expect(CompanyIdentifier.sensirion.name == #"Sensirion AG"#)
        #expect(CompanyIdentifier.sensirion.description == #"Sensirion AG"#)
    
        // JCT Healthcare Pty Ltd
        #expect(CompanyIdentifier.jctHealthcare.rawValue == 1750)
        #expect(CompanyIdentifier.jctHealthcare.name == #"JCT Healthcare Pty Ltd"#)
        #expect(CompanyIdentifier.jctHealthcare.description == #"JCT Healthcare Pty Ltd"#)
    
        // FUBA Automotive Electronics GmbH
        #expect(CompanyIdentifier.fubaAutomotiveElectronics.rawValue == 1751)
        #expect(CompanyIdentifier.fubaAutomotiveElectronics.name == #"FUBA Automotive Electronics GmbH"#)
        #expect(CompanyIdentifier.fubaAutomotiveElectronics.description == #"FUBA Automotive Electronics GmbH"#)
    
        // AW Company
        #expect(CompanyIdentifier.aw.rawValue == 1752)
        #expect(CompanyIdentifier.aw.name == #"AW Company"#)
        #expect(CompanyIdentifier.aw.description == #"AW Company"#)
    
        // Shanghai Mountain View Silicon Co.,Ltd.
        #expect(CompanyIdentifier.shanghaiMountainViewSilicon.rawValue == 1753)
        #expect(CompanyIdentifier.shanghaiMountainViewSilicon.name == #"Shanghai Mountain View Silicon Co.,Ltd."#)
        #expect(CompanyIdentifier.shanghaiMountainViewSilicon.description == #"Shanghai Mountain View Silicon Co.,Ltd."#)
    
        // Zliide Technologies ApS
        #expect(CompanyIdentifier.zliideTechnologies.rawValue == 1754)
        #expect(CompanyIdentifier.zliideTechnologies.name == #"Zliide Technologies ApS"#)
        #expect(CompanyIdentifier.zliideTechnologies.description == #"Zliide Technologies ApS"#)
    
        // Automatic Labs, Inc.
        #expect(CompanyIdentifier.automaticLabs.rawValue == 1755)
        #expect(CompanyIdentifier.automaticLabs.name == #"Automatic Labs, Inc."#)
        #expect(CompanyIdentifier.automaticLabs.description == #"Automatic Labs, Inc."#)
    
        // Industrial Network Controls, LLC
        #expect(CompanyIdentifier.industrialNetworkControls.rawValue == 1756)
        #expect(CompanyIdentifier.industrialNetworkControls.name == #"Industrial Network Controls, LLC"#)
        #expect(CompanyIdentifier.industrialNetworkControls.description == #"Industrial Network Controls, LLC"#)
    
        // Intellithings Ltd.
        #expect(CompanyIdentifier.intellithings.rawValue == 1757)
        #expect(CompanyIdentifier.intellithings.name == #"Intellithings Ltd."#)
        #expect(CompanyIdentifier.intellithings.description == #"Intellithings Ltd."#)
    
        // Navcast, Inc.
        #expect(CompanyIdentifier.navcast.rawValue == 1758)
        #expect(CompanyIdentifier.navcast.name == #"Navcast, Inc."#)
        #expect(CompanyIdentifier.navcast.description == #"Navcast, Inc."#)
    
        // HLI Solutions Inc.
        #expect(CompanyIdentifier.hliSolutions.rawValue == 1759)
        #expect(CompanyIdentifier.hliSolutions.name == #"HLI Solutions Inc."#)
        #expect(CompanyIdentifier.hliSolutions.description == #"HLI Solutions Inc."#)
    
        // Avaya Inc.
        #expect(CompanyIdentifier.avaya.rawValue == 1760)
        #expect(CompanyIdentifier.avaya.name == #"Avaya Inc."#)
        #expect(CompanyIdentifier.avaya.description == #"Avaya Inc."#)
    
        // Milestone AV Technologies LLC
        #expect(CompanyIdentifier.milestoneAvTechnologies.rawValue == 1761)
        #expect(CompanyIdentifier.milestoneAvTechnologies.name == #"Milestone AV Technologies LLC"#)
        #expect(CompanyIdentifier.milestoneAvTechnologies.description == #"Milestone AV Technologies LLC"#)
    
        // Alango Technologies Ltd
        #expect(CompanyIdentifier.alangoTechnologies.rawValue == 1762)
        #expect(CompanyIdentifier.alangoTechnologies.name == #"Alango Technologies Ltd"#)
        #expect(CompanyIdentifier.alangoTechnologies.description == #"Alango Technologies Ltd"#)
    
        // Spinlock Ltd
        #expect(CompanyIdentifier.spinlock.rawValue == 1763)
        #expect(CompanyIdentifier.spinlock.name == #"Spinlock Ltd"#)
        #expect(CompanyIdentifier.spinlock.description == #"Spinlock Ltd"#)
    
        // Aluna
        #expect(CompanyIdentifier.aluna.rawValue == 1764)
        #expect(CompanyIdentifier.aluna.name == #"Aluna"#)
        #expect(CompanyIdentifier.aluna.description == #"Aluna"#)
    
        // OPTEX CO.,LTD.
        #expect(CompanyIdentifier.optex.rawValue == 1765)
        #expect(CompanyIdentifier.optex.name == #"OPTEX CO.,LTD."#)
        #expect(CompanyIdentifier.optex.description == #"OPTEX CO.,LTD."#)
    
        // NIHON DENGYO KOUSAKU
        #expect(CompanyIdentifier.nihonDengyoKousaku.rawValue == 1766)
        #expect(CompanyIdentifier.nihonDengyoKousaku.name == #"NIHON DENGYO KOUSAKU"#)
        #expect(CompanyIdentifier.nihonDengyoKousaku.description == #"NIHON DENGYO KOUSAKU"#)
    
        // VELUX A/S
        #expect(CompanyIdentifier.velux.rawValue == 1767)
        #expect(CompanyIdentifier.velux.name == #"VELUX A/S"#)
        #expect(CompanyIdentifier.velux.description == #"VELUX A/S"#)
    
        // Almendo Technologies GmbH
        #expect(CompanyIdentifier.almendoTechnologies.rawValue == 1768)
        #expect(CompanyIdentifier.almendoTechnologies.name == #"Almendo Technologies GmbH"#)
        #expect(CompanyIdentifier.almendoTechnologies.description == #"Almendo Technologies GmbH"#)
    
        // Zmartfun Electronics, Inc.
        #expect(CompanyIdentifier.zmartfunElectronics.rawValue == 1769)
        #expect(CompanyIdentifier.zmartfunElectronics.name == #"Zmartfun Electronics, Inc."#)
        #expect(CompanyIdentifier.zmartfunElectronics.description == #"Zmartfun Electronics, Inc."#)
    
        // SafeLine Sweden AB
        #expect(CompanyIdentifier.safelineSweden.rawValue == 1770)
        #expect(CompanyIdentifier.safelineSweden.name == #"SafeLine Sweden AB"#)
        #expect(CompanyIdentifier.safelineSweden.description == #"SafeLine Sweden AB"#)
    
        // Houston Radar LLC
        #expect(CompanyIdentifier.houstonRadar.rawValue == 1771)
        #expect(CompanyIdentifier.houstonRadar.name == #"Houston Radar LLC"#)
        #expect(CompanyIdentifier.houstonRadar.description == #"Houston Radar LLC"#)
    
        // Sigur
        #expect(CompanyIdentifier.sigur.rawValue == 1772)
        #expect(CompanyIdentifier.sigur.name == #"Sigur"#)
        #expect(CompanyIdentifier.sigur.description == #"Sigur"#)
    
        // J Neades Ltd
        #expect(CompanyIdentifier.jNeades.rawValue == 1773)
        #expect(CompanyIdentifier.jNeades.name == #"J Neades Ltd"#)
        #expect(CompanyIdentifier.jNeades.description == #"J Neades Ltd"#)
    
        // Avantis Systems Limited
        #expect(CompanyIdentifier.avantisSystems.rawValue == 1774)
        #expect(CompanyIdentifier.avantisSystems.name == #"Avantis Systems Limited"#)
        #expect(CompanyIdentifier.avantisSystems.description == #"Avantis Systems Limited"#)
    
        // ALCARE Co., Ltd.
        #expect(CompanyIdentifier.alcare.rawValue == 1775)
        #expect(CompanyIdentifier.alcare.name == #"ALCARE Co., Ltd."#)
        #expect(CompanyIdentifier.alcare.description == #"ALCARE Co., Ltd."#)
    
        // Chargy Technologies, SL
        #expect(CompanyIdentifier.chargyTechnologies.rawValue == 1776)
        #expect(CompanyIdentifier.chargyTechnologies.name == #"Chargy Technologies, SL"#)
        #expect(CompanyIdentifier.chargyTechnologies.description == #"Chargy Technologies, SL"#)
    
        // Shibutani Co., Ltd.
        #expect(CompanyIdentifier.shibutani.rawValue == 1777)
        #expect(CompanyIdentifier.shibutani.name == #"Shibutani Co., Ltd."#)
        #expect(CompanyIdentifier.shibutani.description == #"Shibutani Co., Ltd."#)
    
        // Trapper Data AB
        #expect(CompanyIdentifier.trapperData.rawValue == 1778)
        #expect(CompanyIdentifier.trapperData.name == #"Trapper Data AB"#)
        #expect(CompanyIdentifier.trapperData.description == #"Trapper Data AB"#)
    
        // Alfred International Inc.
        #expect(CompanyIdentifier.alfredInternational.rawValue == 1779)
        #expect(CompanyIdentifier.alfredInternational.name == #"Alfred International Inc."#)
        #expect(CompanyIdentifier.alfredInternational.description == #"Alfred International Inc."#)
    
        // Touché Technology Ltd
        #expect(CompanyIdentifier.toucheTechnology.rawValue == 1780)
        #expect(CompanyIdentifier.toucheTechnology.name == #"Touché Technology Ltd"#)
        #expect(CompanyIdentifier.toucheTechnology.description == #"Touché Technology Ltd"#)
    
        // Vigil Technologies Inc.
        #expect(CompanyIdentifier.vigilTechnologies.rawValue == 1781)
        #expect(CompanyIdentifier.vigilTechnologies.name == #"Vigil Technologies Inc."#)
        #expect(CompanyIdentifier.vigilTechnologies.description == #"Vigil Technologies Inc."#)
    
        // Vitulo Plus BV
        #expect(CompanyIdentifier.vituloPlus.rawValue == 1782)
        #expect(CompanyIdentifier.vituloPlus.name == #"Vitulo Plus BV"#)
        #expect(CompanyIdentifier.vituloPlus.description == #"Vitulo Plus BV"#)
    
        // WILKA Schliesstechnik GmbH
        #expect(CompanyIdentifier.wilkaSchliesstechnik.rawValue == 1783)
        #expect(CompanyIdentifier.wilkaSchliesstechnik.name == #"WILKA Schliesstechnik GmbH"#)
        #expect(CompanyIdentifier.wilkaSchliesstechnik.description == #"WILKA Schliesstechnik GmbH"#)
    
        // BodyPlus Technology Co.,Ltd
        #expect(CompanyIdentifier.bodyplusTechnology.rawValue == 1784)
        #expect(CompanyIdentifier.bodyplusTechnology.name == #"BodyPlus Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.bodyplusTechnology.description == #"BodyPlus Technology Co.,Ltd"#)
    
        // happybrush GmbH
        #expect(CompanyIdentifier.happybrush.rawValue == 1785)
        #expect(CompanyIdentifier.happybrush.name == #"happybrush GmbH"#)
        #expect(CompanyIdentifier.happybrush.description == #"happybrush GmbH"#)
    
        // Enequi AB
        #expect(CompanyIdentifier.enequi.rawValue == 1786)
        #expect(CompanyIdentifier.enequi.name == #"Enequi AB"#)
        #expect(CompanyIdentifier.enequi.description == #"Enequi AB"#)
    
        // Sartorius AG
        #expect(CompanyIdentifier.sartorius.rawValue == 1787)
        #expect(CompanyIdentifier.sartorius.name == #"Sartorius AG"#)
        #expect(CompanyIdentifier.sartorius.description == #"Sartorius AG"#)
    
        // Tom Communication Industrial Co.,Ltd.
        #expect(CompanyIdentifier.tomCommunicationIndustrial.rawValue == 1788)
        #expect(CompanyIdentifier.tomCommunicationIndustrial.name == #"Tom Communication Industrial Co.,Ltd."#)
        #expect(CompanyIdentifier.tomCommunicationIndustrial.description == #"Tom Communication Industrial Co.,Ltd."#)
    
        // ESS Embedded System Solutions Inc.
        #expect(CompanyIdentifier.essEmbeddedSystemSolutions.rawValue == 1789)
        #expect(CompanyIdentifier.essEmbeddedSystemSolutions.name == #"ESS Embedded System Solutions Inc."#)
        #expect(CompanyIdentifier.essEmbeddedSystemSolutions.description == #"ESS Embedded System Solutions Inc."#)
    
        // Mahr GmbH
        #expect(CompanyIdentifier.mahr.rawValue == 1790)
        #expect(CompanyIdentifier.mahr.name == #"Mahr GmbH"#)
        #expect(CompanyIdentifier.mahr.description == #"Mahr GmbH"#)
    
        // Redpine Signals Inc
        #expect(CompanyIdentifier.redpineSignals.rawValue == 1791)
        #expect(CompanyIdentifier.redpineSignals.name == #"Redpine Signals Inc"#)
        #expect(CompanyIdentifier.redpineSignals.description == #"Redpine Signals Inc"#)
    
        // TraqFreq LLC
        #expect(CompanyIdentifier.traqfreq.rawValue == 1792)
        #expect(CompanyIdentifier.traqfreq.name == #"TraqFreq LLC"#)
        #expect(CompanyIdentifier.traqfreq.description == #"TraqFreq LLC"#)
    
        // PAFERS TECH
        #expect(CompanyIdentifier.pafersTech.rawValue == 1793)
        #expect(CompanyIdentifier.pafersTech.name == #"PAFERS TECH"#)
        #expect(CompanyIdentifier.pafersTech.description == #"PAFERS TECH"#)
    
        // Akciju sabiedriba "SAF TEHNIKA"
        #expect(CompanyIdentifier.akcijuSabiedribafTehnika.rawValue == 1794)
        #expect(CompanyIdentifier.akcijuSabiedribafTehnika.name == #"Akciju sabiedriba "SAF TEHNIKA""#)
        #expect(CompanyIdentifier.akcijuSabiedribafTehnika.description == #"Akciju sabiedriba "SAF TEHNIKA""#)
    
        // Beijing Jingdong Century Trading Co., Ltd.
        #expect(CompanyIdentifier.beijingJingdongCenturyTrading.rawValue == 1795)
        #expect(CompanyIdentifier.beijingJingdongCenturyTrading.name == #"Beijing Jingdong Century Trading Co., Ltd."#)
        #expect(CompanyIdentifier.beijingJingdongCenturyTrading.description == #"Beijing Jingdong Century Trading Co., Ltd."#)
    
        // JBX Designs Inc.
        #expect(CompanyIdentifier.jbxDesigns.rawValue == 1796)
        #expect(CompanyIdentifier.jbxDesigns.name == #"JBX Designs Inc."#)
        #expect(CompanyIdentifier.jbxDesigns.description == #"JBX Designs Inc."#)
    
        // AB Electrolux
        #expect(CompanyIdentifier.abElectrolux.rawValue == 1797)
        #expect(CompanyIdentifier.abElectrolux.name == #"AB Electrolux"#)
        #expect(CompanyIdentifier.abElectrolux.description == #"AB Electrolux"#)
    
        // Wernher von Braun Center for ASdvanced Research
        #expect(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.rawValue == 1798)
        #expect(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.name == #"Wernher von Braun Center for ASdvanced Research"#)
        #expect(CompanyIdentifier.wernherVonBraunCenterFordvancedResearch.description == #"Wernher von Braun Center for ASdvanced Research"#)
    
        // Essity Hygiene and Health Aktiebolag
        #expect(CompanyIdentifier.essityHygieneAndHealthAktiebolag.rawValue == 1799)
        #expect(CompanyIdentifier.essityHygieneAndHealthAktiebolag.name == #"Essity Hygiene and Health Aktiebolag"#)
        #expect(CompanyIdentifier.essityHygieneAndHealthAktiebolag.description == #"Essity Hygiene and Health Aktiebolag"#)
    
        // Be Interactive Co., Ltd
        #expect(CompanyIdentifier.beInteractive.rawValue == 1800)
        #expect(CompanyIdentifier.beInteractive.name == #"Be Interactive Co., Ltd"#)
        #expect(CompanyIdentifier.beInteractive.description == #"Be Interactive Co., Ltd"#)
    
        // Carewear Corp.
        #expect(CompanyIdentifier.carewear.rawValue == 1801)
        #expect(CompanyIdentifier.carewear.name == #"Carewear Corp."#)
        #expect(CompanyIdentifier.carewear.description == #"Carewear Corp."#)
    
        // Huf Hülsbeck & Fürst GmbH & Co. KG
        #expect(CompanyIdentifier.hufHulsbeckFurst.rawValue == 1802)
        #expect(CompanyIdentifier.hufHulsbeckFurst.name == #"Huf Hülsbeck & Fürst GmbH & Co. KG"#)
        #expect(CompanyIdentifier.hufHulsbeckFurst.description == #"Huf Hülsbeck & Fürst GmbH & Co. KG"#)
    
        // Element Products, Inc.
        #expect(CompanyIdentifier.elementProducts.rawValue == 1803)
        #expect(CompanyIdentifier.elementProducts.name == #"Element Products, Inc."#)
        #expect(CompanyIdentifier.elementProducts.description == #"Element Products, Inc."#)
    
        // Beijing Winner Microelectronics Co.,Ltd
        #expect(CompanyIdentifier.beijingWinnerMicroelectronics.rawValue == 1804)
        #expect(CompanyIdentifier.beijingWinnerMicroelectronics.name == #"Beijing Winner Microelectronics Co.,Ltd"#)
        #expect(CompanyIdentifier.beijingWinnerMicroelectronics.description == #"Beijing Winner Microelectronics Co.,Ltd"#)
    
        // SmartSnugg Pty Ltd
        #expect(CompanyIdentifier.smartsnugg.rawValue == 1805)
        #expect(CompanyIdentifier.smartsnugg.name == #"SmartSnugg Pty Ltd"#)
        #expect(CompanyIdentifier.smartsnugg.description == #"SmartSnugg Pty Ltd"#)
    
        // FiveCo Sarl
        #expect(CompanyIdentifier.fivecoSarl.rawValue == 1806)
        #expect(CompanyIdentifier.fivecoSarl.name == #"FiveCo Sarl"#)
        #expect(CompanyIdentifier.fivecoSarl.description == #"FiveCo Sarl"#)
    
        // California Things Inc.
        #expect(CompanyIdentifier.californiaThings.rawValue == 1807)
        #expect(CompanyIdentifier.californiaThings.name == #"California Things Inc."#)
        #expect(CompanyIdentifier.californiaThings.description == #"California Things Inc."#)
    
        // Audiodo AB
        #expect(CompanyIdentifier.audiodo.rawValue == 1808)
        #expect(CompanyIdentifier.audiodo.name == #"Audiodo AB"#)
        #expect(CompanyIdentifier.audiodo.description == #"Audiodo AB"#)
    
        // ABAX AS
        #expect(CompanyIdentifier.abax.rawValue == 1809)
        #expect(CompanyIdentifier.abax.name == #"ABAX AS"#)
        #expect(CompanyIdentifier.abax.description == #"ABAX AS"#)
    
        // Bull Group Company Limited
        #expect(CompanyIdentifier.bullGroup.rawValue == 1810)
        #expect(CompanyIdentifier.bullGroup.name == #"Bull Group Company Limited"#)
        #expect(CompanyIdentifier.bullGroup.description == #"Bull Group Company Limited"#)
    
        // Respiri Limited
        #expect(CompanyIdentifier.respiri.rawValue == 1811)
        #expect(CompanyIdentifier.respiri.name == #"Respiri Limited"#)
        #expect(CompanyIdentifier.respiri.description == #"Respiri Limited"#)
    
        // MindPeace Safety LLC
        #expect(CompanyIdentifier.mindpeaceSafety.rawValue == 1812)
        #expect(CompanyIdentifier.mindpeaceSafety.name == #"MindPeace Safety LLC"#)
        #expect(CompanyIdentifier.mindpeaceSafety.description == #"MindPeace Safety LLC"#)
    
        // MBARC LABS Inc
        #expect(CompanyIdentifier.mbarcLabs.rawValue == 1813)
        #expect(CompanyIdentifier.mbarcLabs.name == #"MBARC LABS Inc"#)
        #expect(CompanyIdentifier.mbarcLabs.description == #"MBARC LABS Inc"#)
    
        // Altonics
        #expect(CompanyIdentifier.altonics.rawValue == 1814)
        #expect(CompanyIdentifier.altonics.name == #"Altonics"#)
        #expect(CompanyIdentifier.altonics.description == #"Altonics"#)
    
        // iQsquare BV
        #expect(CompanyIdentifier.iqsquare.rawValue == 1815)
        #expect(CompanyIdentifier.iqsquare.name == #"iQsquare BV"#)
        #expect(CompanyIdentifier.iqsquare.description == #"iQsquare BV"#)
    
        // IDIBAIX enginneering
        #expect(CompanyIdentifier.idibaixEnginneering.rawValue == 1816)
        #expect(CompanyIdentifier.idibaixEnginneering.name == #"IDIBAIX enginneering"#)
        #expect(CompanyIdentifier.idibaixEnginneering.description == #"IDIBAIX enginneering"#)
    
        // COREIOT PTY LTD
        #expect(CompanyIdentifier.coreiot.rawValue == 1817)
        #expect(CompanyIdentifier.coreiot.name == #"COREIOT PTY LTD"#)
        #expect(CompanyIdentifier.coreiot.description == #"COREIOT PTY LTD"#)
    
        // REVSMART WEARABLE HK CO LTD
        #expect(CompanyIdentifier.revsmartWearableCo.rawValue == 1818)
        #expect(CompanyIdentifier.revsmartWearableCo.name == #"REVSMART WEARABLE HK CO LTD"#)
        #expect(CompanyIdentifier.revsmartWearableCo.description == #"REVSMART WEARABLE HK CO LTD"#)
    
        // Precor
        #expect(CompanyIdentifier.precor.rawValue == 1819)
        #expect(CompanyIdentifier.precor.name == #"Precor"#)
        #expect(CompanyIdentifier.precor.description == #"Precor"#)
    
        // F5 Sports, Inc
        #expect(CompanyIdentifier.f5Sports.rawValue == 1820)
        #expect(CompanyIdentifier.f5Sports.name == #"F5 Sports, Inc"#)
        #expect(CompanyIdentifier.f5Sports.description == #"F5 Sports, Inc"#)
    
        // exoTIC Systems
        #expect(CompanyIdentifier.exoticSystems.rawValue == 1821)
        #expect(CompanyIdentifier.exoticSystems.name == #"exoTIC Systems"#)
        #expect(CompanyIdentifier.exoticSystems.description == #"exoTIC Systems"#)
    
        // DONGGUAN HELE ELECTRONICS CO., LTD
        #expect(CompanyIdentifier.dongguanHeleElectronics.rawValue == 1822)
        #expect(CompanyIdentifier.dongguanHeleElectronics.name == #"DONGGUAN HELE ELECTRONICS CO., LTD"#)
        #expect(CompanyIdentifier.dongguanHeleElectronics.description == #"DONGGUAN HELE ELECTRONICS CO., LTD"#)
    
        // Dongguan Liesheng Electronic Co.Ltd
        #expect(CompanyIdentifier.dongguanLieshengElectronic.rawValue == 1823)
        #expect(CompanyIdentifier.dongguanLieshengElectronic.name == #"Dongguan Liesheng Electronic Co.Ltd"#)
        #expect(CompanyIdentifier.dongguanLieshengElectronic.description == #"Dongguan Liesheng Electronic Co.Ltd"#)
    
        // Oculeve, Inc.
        #expect(CompanyIdentifier.oculeve.rawValue == 1824)
        #expect(CompanyIdentifier.oculeve.name == #"Oculeve, Inc."#)
        #expect(CompanyIdentifier.oculeve.description == #"Oculeve, Inc."#)
    
        // Clover Network, Inc.
        #expect(CompanyIdentifier.cloverNetwork.rawValue == 1825)
        #expect(CompanyIdentifier.cloverNetwork.name == #"Clover Network, Inc."#)
        #expect(CompanyIdentifier.cloverNetwork.description == #"Clover Network, Inc."#)
    
        // Xiamen Eholder Electronics Co.Ltd
        #expect(CompanyIdentifier.xiamenEholderElectronics.rawValue == 1826)
        #expect(CompanyIdentifier.xiamenEholderElectronics.name == #"Xiamen Eholder Electronics Co.Ltd"#)
        #expect(CompanyIdentifier.xiamenEholderElectronics.description == #"Xiamen Eholder Electronics Co.Ltd"#)
    
        // Ford Motor Company
        #expect(CompanyIdentifier.fordMotor.rawValue == 1827)
        #expect(CompanyIdentifier.fordMotor.name == #"Ford Motor Company"#)
        #expect(CompanyIdentifier.fordMotor.description == #"Ford Motor Company"#)
    
        // Guangzhou SuperSound Information Technology Co.,Ltd
        #expect(CompanyIdentifier.guangzhouSupersoundInformationTechnology.rawValue == 1828)
        #expect(CompanyIdentifier.guangzhouSupersoundInformationTechnology.name == #"Guangzhou SuperSound Information Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.guangzhouSupersoundInformationTechnology.description == #"Guangzhou SuperSound Information Technology Co.,Ltd"#)
    
        // Tedee Sp. z o.o.
        #expect(CompanyIdentifier.tedee.rawValue == 1829)
        #expect(CompanyIdentifier.tedee.name == #"Tedee Sp. z o.o."#)
        #expect(CompanyIdentifier.tedee.description == #"Tedee Sp. z o.o."#)
    
        // PHC Corporation
        #expect(CompanyIdentifier.phc.rawValue == 1830)
        #expect(CompanyIdentifier.phc.name == #"PHC Corporation"#)
        #expect(CompanyIdentifier.phc.description == #"PHC Corporation"#)
    
        // STALKIT AS
        #expect(CompanyIdentifier.stalkit.rawValue == 1831)
        #expect(CompanyIdentifier.stalkit.name == #"STALKIT AS"#)
        #expect(CompanyIdentifier.stalkit.description == #"STALKIT AS"#)
    
        // Eli Lilly and Company
        #expect(CompanyIdentifier.eliLillyAndcompany.rawValue == 1832)
        #expect(CompanyIdentifier.eliLillyAndcompany.name == #"Eli Lilly and Company"#)
        #expect(CompanyIdentifier.eliLillyAndcompany.description == #"Eli Lilly and Company"#)
    
        // SwaraLink Technologies
        #expect(CompanyIdentifier.swaralinkTechnologies.rawValue == 1833)
        #expect(CompanyIdentifier.swaralinkTechnologies.name == #"SwaraLink Technologies"#)
        #expect(CompanyIdentifier.swaralinkTechnologies.description == #"SwaraLink Technologies"#)
    
        // JMR embedded systems GmbH
        #expect(CompanyIdentifier.jmrEmbeddedSystems.rawValue == 1834)
        #expect(CompanyIdentifier.jmrEmbeddedSystems.name == #"JMR embedded systems GmbH"#)
        #expect(CompanyIdentifier.jmrEmbeddedSystems.description == #"JMR embedded systems GmbH"#)
    
        // Bitkey Inc.
        #expect(CompanyIdentifier.bitkey.rawValue == 1835)
        #expect(CompanyIdentifier.bitkey.name == #"Bitkey Inc."#)
        #expect(CompanyIdentifier.bitkey.description == #"Bitkey Inc."#)
    
        // GWA Hygiene GmbH
        #expect(CompanyIdentifier.gwaHygiene.rawValue == 1836)
        #expect(CompanyIdentifier.gwaHygiene.name == #"GWA Hygiene GmbH"#)
        #expect(CompanyIdentifier.gwaHygiene.description == #"GWA Hygiene GmbH"#)
    
        // Safera Oy
        #expect(CompanyIdentifier.safera.rawValue == 1837)
        #expect(CompanyIdentifier.safera.name == #"Safera Oy"#)
        #expect(CompanyIdentifier.safera.description == #"Safera Oy"#)
    
        // Open Platform Systems LLC
        #expect(CompanyIdentifier.openPlatformSystems.rawValue == 1838)
        #expect(CompanyIdentifier.openPlatformSystems.name == #"Open Platform Systems LLC"#)
        #expect(CompanyIdentifier.openPlatformSystems.description == #"Open Platform Systems LLC"#)
    
        // OnePlus Electronics (Shenzhen) Co., Ltd.
        #expect(CompanyIdentifier.oneplusElectronicsShenzhen.rawValue == 1839)
        #expect(CompanyIdentifier.oneplusElectronicsShenzhen.name == #"OnePlus Electronics (Shenzhen) Co., Ltd."#)
        #expect(CompanyIdentifier.oneplusElectronicsShenzhen.description == #"OnePlus Electronics (Shenzhen) Co., Ltd."#)
    
        // Wildlife Acoustics, Inc.
        #expect(CompanyIdentifier.wildlifeAcoustics.rawValue == 1840)
        #expect(CompanyIdentifier.wildlifeAcoustics.name == #"Wildlife Acoustics, Inc."#)
        #expect(CompanyIdentifier.wildlifeAcoustics.description == #"Wildlife Acoustics, Inc."#)
    
        // ABLIC Inc.
        #expect(CompanyIdentifier.ablic.rawValue == 1841)
        #expect(CompanyIdentifier.ablic.name == #"ABLIC Inc."#)
        #expect(CompanyIdentifier.ablic.description == #"ABLIC Inc."#)
    
        // Dairy Tech, LLC
        #expect(CompanyIdentifier.dairyTech.rawValue == 1842)
        #expect(CompanyIdentifier.dairyTech.name == #"Dairy Tech, LLC"#)
        #expect(CompanyIdentifier.dairyTech.description == #"Dairy Tech, LLC"#)
    
        // Iguanavation, Inc.
        #expect(CompanyIdentifier.iguanavation.rawValue == 1843)
        #expect(CompanyIdentifier.iguanavation.name == #"Iguanavation, Inc."#)
        #expect(CompanyIdentifier.iguanavation.description == #"Iguanavation, Inc."#)
    
        // DiUS Computing Pty Ltd
        #expect(CompanyIdentifier.diusComputing.rawValue == 1844)
        #expect(CompanyIdentifier.diusComputing.name == #"DiUS Computing Pty Ltd"#)
        #expect(CompanyIdentifier.diusComputing.description == #"DiUS Computing Pty Ltd"#)
    
        // UpRight Technologies LTD
        #expect(CompanyIdentifier.uprightTechnologies.rawValue == 1845)
        #expect(CompanyIdentifier.uprightTechnologies.name == #"UpRight Technologies LTD"#)
        #expect(CompanyIdentifier.uprightTechnologies.description == #"UpRight Technologies LTD"#)
    
        // Luna XIO, Inc.
        #expect(CompanyIdentifier.lunaXio.rawValue == 1846)
        #expect(CompanyIdentifier.lunaXio.name == #"Luna XIO, Inc."#)
        #expect(CompanyIdentifier.lunaXio.description == #"Luna XIO, Inc."#)
    
        // LLC Navitek
        #expect(CompanyIdentifier.llcNavitek.rawValue == 1847)
        #expect(CompanyIdentifier.llcNavitek.name == #"LLC Navitek"#)
        #expect(CompanyIdentifier.llcNavitek.description == #"LLC Navitek"#)
    
        // Glass Security Pte Ltd
        #expect(CompanyIdentifier.glassSecurityPte.rawValue == 1848)
        #expect(CompanyIdentifier.glassSecurityPte.name == #"Glass Security Pte Ltd"#)
        #expect(CompanyIdentifier.glassSecurityPte.description == #"Glass Security Pte Ltd"#)
    
        // Jiangsu Qinheng Co., Ltd.
        #expect(CompanyIdentifier.jiangsuQinheng.rawValue == 1849)
        #expect(CompanyIdentifier.jiangsuQinheng.name == #"Jiangsu Qinheng Co., Ltd."#)
        #expect(CompanyIdentifier.jiangsuQinheng.description == #"Jiangsu Qinheng Co., Ltd."#)
    
        // Chandler Systems Inc.
        #expect(CompanyIdentifier.chandlerSystems.rawValue == 1850)
        #expect(CompanyIdentifier.chandlerSystems.name == #"Chandler Systems Inc."#)
        #expect(CompanyIdentifier.chandlerSystems.description == #"Chandler Systems Inc."#)
    
        // Fantini Cosmi s.p.a.
        #expect(CompanyIdentifier.fantiniCosmi.rawValue == 1851)
        #expect(CompanyIdentifier.fantiniCosmi.name == #"Fantini Cosmi s.p.a."#)
        #expect(CompanyIdentifier.fantiniCosmi.description == #"Fantini Cosmi s.p.a."#)
    
        // Acubit ApS
        #expect(CompanyIdentifier.acubit.rawValue == 1852)
        #expect(CompanyIdentifier.acubit.name == #"Acubit ApS"#)
        #expect(CompanyIdentifier.acubit.description == #"Acubit ApS"#)
    
        // Beijing Hao Heng Tian Tech Co., Ltd.
        #expect(CompanyIdentifier.beijingHaoHengTianTech.rawValue == 1853)
        #expect(CompanyIdentifier.beijingHaoHengTianTech.name == #"Beijing Hao Heng Tian Tech Co., Ltd."#)
        #expect(CompanyIdentifier.beijingHaoHengTianTech.description == #"Beijing Hao Heng Tian Tech Co., Ltd."#)
    
        // Bluepack S.R.L.
        #expect(CompanyIdentifier.bluepack.rawValue == 1854)
        #expect(CompanyIdentifier.bluepack.name == #"Bluepack S.R.L."#)
        #expect(CompanyIdentifier.bluepack.description == #"Bluepack S.R.L."#)
    
        // Beijing Unisoc Technologies Co., Ltd.
        #expect(CompanyIdentifier.beijingUnisocTechnologies.rawValue == 1855)
        #expect(CompanyIdentifier.beijingUnisocTechnologies.name == #"Beijing Unisoc Technologies Co., Ltd."#)
        #expect(CompanyIdentifier.beijingUnisocTechnologies.description == #"Beijing Unisoc Technologies Co., Ltd."#)
    
        // HITIQ LIMITED
        #expect(CompanyIdentifier.hitiq.rawValue == 1856)
        #expect(CompanyIdentifier.hitiq.name == #"HITIQ LIMITED"#)
        #expect(CompanyIdentifier.hitiq.description == #"HITIQ LIMITED"#)
    
        // MAC SRL
        #expect(CompanyIdentifier.mac.rawValue == 1857)
        #expect(CompanyIdentifier.mac.name == #"MAC SRL"#)
        #expect(CompanyIdentifier.mac.description == #"MAC SRL"#)
    
        // DML LLC
        #expect(CompanyIdentifier.dml.rawValue == 1858)
        #expect(CompanyIdentifier.dml.name == #"DML LLC"#)
        #expect(CompanyIdentifier.dml.description == #"DML LLC"#)
    
        // Sanofi
        #expect(CompanyIdentifier.sanofi.rawValue == 1859)
        #expect(CompanyIdentifier.sanofi.name == #"Sanofi"#)
        #expect(CompanyIdentifier.sanofi.description == #"Sanofi"#)
    
        // SOCOMEC
        #expect(CompanyIdentifier.socomec.rawValue == 1860)
        #expect(CompanyIdentifier.socomec.name == #"SOCOMEC"#)
        #expect(CompanyIdentifier.socomec.description == #"SOCOMEC"#)
    
        // WIZNOVA, Inc.
        #expect(CompanyIdentifier.wiznova.rawValue == 1861)
        #expect(CompanyIdentifier.wiznova.name == #"WIZNOVA, Inc."#)
        #expect(CompanyIdentifier.wiznova.description == #"WIZNOVA, Inc."#)
    
        // Seitec Elektronik GmbH
        #expect(CompanyIdentifier.seitecElektronik.rawValue == 1862)
        #expect(CompanyIdentifier.seitecElektronik.name == #"Seitec Elektronik GmbH"#)
        #expect(CompanyIdentifier.seitecElektronik.description == #"Seitec Elektronik GmbH"#)
    
        // OR Technologies Pty Ltd
        #expect(CompanyIdentifier.orTechnologies.rawValue == 1863)
        #expect(CompanyIdentifier.orTechnologies.name == #"OR Technologies Pty Ltd"#)
        #expect(CompanyIdentifier.orTechnologies.description == #"OR Technologies Pty Ltd"#)
    
        // GuangZhou KuGou Computer Technology Co.Ltd
        #expect(CompanyIdentifier.guangzhouKugouComputerTechnology.rawValue == 1864)
        #expect(CompanyIdentifier.guangzhouKugouComputerTechnology.name == #"GuangZhou KuGou Computer Technology Co.Ltd"#)
        #expect(CompanyIdentifier.guangzhouKugouComputerTechnology.description == #"GuangZhou KuGou Computer Technology Co.Ltd"#)
    
        // DIAODIAO (Beijing) Technology Co., Ltd.
        #expect(CompanyIdentifier.diaodiaoBeijingTechnology.rawValue == 1865)
        #expect(CompanyIdentifier.diaodiaoBeijingTechnology.name == #"DIAODIAO (Beijing) Technology Co., Ltd."#)
        #expect(CompanyIdentifier.diaodiaoBeijingTechnology.description == #"DIAODIAO (Beijing) Technology Co., Ltd."#)
    
        // Illusory Studios LLC
        #expect(CompanyIdentifier.illusoryStudios.rawValue == 1866)
        #expect(CompanyIdentifier.illusoryStudios.name == #"Illusory Studios LLC"#)
        #expect(CompanyIdentifier.illusoryStudios.description == #"Illusory Studios LLC"#)
    
        // Sarvavid Software Solutions LLP
        #expect(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.rawValue == 1867)
        #expect(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.name == #"Sarvavid Software Solutions LLP"#)
        #expect(CompanyIdentifier.sarvavidSoftwareSolutionsLlp.description == #"Sarvavid Software Solutions LLP"#)
    
        // iopool s.a.
        #expect(CompanyIdentifier.iopool.rawValue == 1868)
        #expect(CompanyIdentifier.iopool.name == #"iopool s.a."#)
        #expect(CompanyIdentifier.iopool.description == #"iopool s.a."#)
    
        // Amtech Systems, LLC
        #expect(CompanyIdentifier.amtechSystems.rawValue == 1869)
        #expect(CompanyIdentifier.amtechSystems.name == #"Amtech Systems, LLC"#)
        #expect(CompanyIdentifier.amtechSystems.description == #"Amtech Systems, LLC"#)
    
        // EAGLE DETECTION SA
        #expect(CompanyIdentifier.eagleDetection.rawValue == 1870)
        #expect(CompanyIdentifier.eagleDetection.name == #"EAGLE DETECTION SA"#)
        #expect(CompanyIdentifier.eagleDetection.description == #"EAGLE DETECTION SA"#)
    
        // MEDIATECH S.R.L.
        #expect(CompanyIdentifier.mediatech.rawValue == 1871)
        #expect(CompanyIdentifier.mediatech.name == #"MEDIATECH S.R.L."#)
        #expect(CompanyIdentifier.mediatech.description == #"MEDIATECH S.R.L."#)
    
        // Hamilton Professional Services of Canada Incorporated
        #expect(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.rawValue == 1872)
        #expect(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.name == #"Hamilton Professional Services of Canada Incorporated"#)
        #expect(CompanyIdentifier.hamiltonProfessionalServicesOfCanada.description == #"Hamilton Professional Services of Canada Incorporated"#)
    
        // Changsha JEMO IC Design Co.,Ltd
        #expect(CompanyIdentifier.changshaJemoIcDesign.rawValue == 1873)
        #expect(CompanyIdentifier.changshaJemoIcDesign.name == #"Changsha JEMO IC Design Co.,Ltd"#)
        #expect(CompanyIdentifier.changshaJemoIcDesign.description == #"Changsha JEMO IC Design Co.,Ltd"#)
    
        // Elatec GmbH
        #expect(CompanyIdentifier.elatec.rawValue == 1874)
        #expect(CompanyIdentifier.elatec.name == #"Elatec GmbH"#)
        #expect(CompanyIdentifier.elatec.description == #"Elatec GmbH"#)
    
        // JLG Industries, Inc.
        #expect(CompanyIdentifier.jlgIndustries.rawValue == 1875)
        #expect(CompanyIdentifier.jlgIndustries.name == #"JLG Industries, Inc."#)
        #expect(CompanyIdentifier.jlgIndustries.description == #"JLG Industries, Inc."#)
    
        // Michael Parkin
        #expect(CompanyIdentifier.michaelParkin.rawValue == 1876)
        #expect(CompanyIdentifier.michaelParkin.name == #"Michael Parkin"#)
        #expect(CompanyIdentifier.michaelParkin.description == #"Michael Parkin"#)
    
        // Brother Industries, Ltd
        #expect(CompanyIdentifier.brotherIndustries.rawValue == 1877)
        #expect(CompanyIdentifier.brotherIndustries.name == #"Brother Industries, Ltd"#)
        #expect(CompanyIdentifier.brotherIndustries.description == #"Brother Industries, Ltd"#)
    
        // Lumens For Less, Inc
        #expect(CompanyIdentifier.lumensForLess.rawValue == 1878)
        #expect(CompanyIdentifier.lumensForLess.name == #"Lumens For Less, Inc"#)
        #expect(CompanyIdentifier.lumensForLess.description == #"Lumens For Less, Inc"#)
    
        // ELA Innovation
        #expect(CompanyIdentifier.elaInnovation.rawValue == 1879)
        #expect(CompanyIdentifier.elaInnovation.name == #"ELA Innovation"#)
        #expect(CompanyIdentifier.elaInnovation.description == #"ELA Innovation"#)
    
        // umanSense AB
        #expect(CompanyIdentifier.umansense.rawValue == 1880)
        #expect(CompanyIdentifier.umansense.name == #"umanSense AB"#)
        #expect(CompanyIdentifier.umansense.description == #"umanSense AB"#)
    
        // Shanghai InGeek Cyber Security Co., Ltd.
        #expect(CompanyIdentifier.shanghaiIngeekCyberSecurity.rawValue == 1881)
        #expect(CompanyIdentifier.shanghaiIngeekCyberSecurity.name == #"Shanghai InGeek Cyber Security Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiIngeekCyberSecurity.description == #"Shanghai InGeek Cyber Security Co., Ltd."#)
    
        // HARMAN CO.,LTD.
        #expect(CompanyIdentifier.harman.rawValue == 1882)
        #expect(CompanyIdentifier.harman.name == #"HARMAN CO.,LTD."#)
        #expect(CompanyIdentifier.harman.description == #"HARMAN CO.,LTD."#)
    
        // Smart Sensor Devices AB
        #expect(CompanyIdentifier.smartSensorDevices.rawValue == 1883)
        #expect(CompanyIdentifier.smartSensorDevices.name == #"Smart Sensor Devices AB"#)
        #expect(CompanyIdentifier.smartSensorDevices.description == #"Smart Sensor Devices AB"#)
    
        // Antitronics Inc.
        #expect(CompanyIdentifier.antitronics.rawValue == 1884)
        #expect(CompanyIdentifier.antitronics.name == #"Antitronics Inc."#)
        #expect(CompanyIdentifier.antitronics.description == #"Antitronics Inc."#)
    
        // RHOMBUS SYSTEMS, INC.
        #expect(CompanyIdentifier.rhombusSystems.rawValue == 1885)
        #expect(CompanyIdentifier.rhombusSystems.name == #"RHOMBUS SYSTEMS, INC."#)
        #expect(CompanyIdentifier.rhombusSystems.description == #"RHOMBUS SYSTEMS, INC."#)
    
        // Katerra Inc.
        #expect(CompanyIdentifier.katerra.rawValue == 1886)
        #expect(CompanyIdentifier.katerra.name == #"Katerra Inc."#)
        #expect(CompanyIdentifier.katerra.description == #"Katerra Inc."#)
    
        // Remote Solution Co., LTD.
        #expect(CompanyIdentifier.remoteSolution.rawValue == 1887)
        #expect(CompanyIdentifier.remoteSolution.name == #"Remote Solution Co., LTD."#)
        #expect(CompanyIdentifier.remoteSolution.description == #"Remote Solution Co., LTD."#)
    
        // Vimar SpA
        #expect(CompanyIdentifier.vimarSpa.rawValue == 1888)
        #expect(CompanyIdentifier.vimarSpa.name == #"Vimar SpA"#)
        #expect(CompanyIdentifier.vimarSpa.description == #"Vimar SpA"#)
    
        // Mantis Tech LLC
        #expect(CompanyIdentifier.mantisTech.rawValue == 1889)
        #expect(CompanyIdentifier.mantisTech.name == #"Mantis Tech LLC"#)
        #expect(CompanyIdentifier.mantisTech.description == #"Mantis Tech LLC"#)
    
        // TerOpta Ltd
        #expect(CompanyIdentifier.teropta.rawValue == 1890)
        #expect(CompanyIdentifier.teropta.name == #"TerOpta Ltd"#)
        #expect(CompanyIdentifier.teropta.description == #"TerOpta Ltd"#)
    
        // PIKOLIN S.L.
        #expect(CompanyIdentifier.pikolin.rawValue == 1891)
        #expect(CompanyIdentifier.pikolin.name == #"PIKOLIN S.L."#)
        #expect(CompanyIdentifier.pikolin.description == #"PIKOLIN S.L."#)
    
        // WWZN Information Technology Company Limited
        #expect(CompanyIdentifier.wwznInformationTechnology.rawValue == 1892)
        #expect(CompanyIdentifier.wwznInformationTechnology.name == #"WWZN Information Technology Company Limited"#)
        #expect(CompanyIdentifier.wwznInformationTechnology.description == #"WWZN Information Technology Company Limited"#)
    
        // Voxx International
        #expect(CompanyIdentifier.voxxInternational.rawValue == 1893)
        #expect(CompanyIdentifier.voxxInternational.name == #"Voxx International"#)
        #expect(CompanyIdentifier.voxxInternational.description == #"Voxx International"#)
    
        // ART AND PROGRAM, INC.
        #expect(CompanyIdentifier.artAndProgram.rawValue == 1894)
        #expect(CompanyIdentifier.artAndProgram.name == #"ART AND PROGRAM, INC."#)
        #expect(CompanyIdentifier.artAndProgram.description == #"ART AND PROGRAM, INC."#)
    
        // NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD.
        #expect(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.rawValue == 1895)
        #expect(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.name == #"NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD."#)
        #expect(CompanyIdentifier.nittoDenkoiaTechnicalCentrePte.description == #"NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD."#)
    
        // Peloton Interactive Inc.
        #expect(CompanyIdentifier.pelotonInteractive.rawValue == 1896)
        #expect(CompanyIdentifier.pelotonInteractive.name == #"Peloton Interactive Inc."#)
        #expect(CompanyIdentifier.pelotonInteractive.description == #"Peloton Interactive Inc."#)
    
        // Force Impact Technologies
        #expect(CompanyIdentifier.forceImpactTechnologies.rawValue == 1897)
        #expect(CompanyIdentifier.forceImpactTechnologies.name == #"Force Impact Technologies"#)
        #expect(CompanyIdentifier.forceImpactTechnologies.description == #"Force Impact Technologies"#)
    
        // Dmac Mobile Developments, LLC
        #expect(CompanyIdentifier.dmacMobileDevelopments.rawValue == 1898)
        #expect(CompanyIdentifier.dmacMobileDevelopments.name == #"Dmac Mobile Developments, LLC"#)
        #expect(CompanyIdentifier.dmacMobileDevelopments.description == #"Dmac Mobile Developments, LLC"#)
    
        // Engineered Medical Technologies
        #expect(CompanyIdentifier.engineeredMedicalTechnologies.rawValue == 1899)
        #expect(CompanyIdentifier.engineeredMedicalTechnologies.name == #"Engineered Medical Technologies"#)
        #expect(CompanyIdentifier.engineeredMedicalTechnologies.description == #"Engineered Medical Technologies"#)
    
        // Noodle Technology inc
        #expect(CompanyIdentifier.noodleTechnology.rawValue == 1900)
        #expect(CompanyIdentifier.noodleTechnology.name == #"Noodle Technology inc"#)
        #expect(CompanyIdentifier.noodleTechnology.description == #"Noodle Technology inc"#)
    
        // Graesslin GmbH
        #expect(CompanyIdentifier.graesslin.rawValue == 1901)
        #expect(CompanyIdentifier.graesslin.name == #"Graesslin GmbH"#)
        #expect(CompanyIdentifier.graesslin.description == #"Graesslin GmbH"#)
    
        // WuQi technologies, Inc.
        #expect(CompanyIdentifier.wuqiTechnologies.rawValue == 1902)
        #expect(CompanyIdentifier.wuqiTechnologies.name == #"WuQi technologies, Inc."#)
        #expect(CompanyIdentifier.wuqiTechnologies.description == #"WuQi technologies, Inc."#)
    
        // Successful Endeavours Pty Ltd
        #expect(CompanyIdentifier.successfulEndeavours.rawValue == 1903)
        #expect(CompanyIdentifier.successfulEndeavours.name == #"Successful Endeavours Pty Ltd"#)
        #expect(CompanyIdentifier.successfulEndeavours.description == #"Successful Endeavours Pty Ltd"#)
    
        // InnoCon Medical ApS
        #expect(CompanyIdentifier.innoconMedical.rawValue == 1904)
        #expect(CompanyIdentifier.innoconMedical.name == #"InnoCon Medical ApS"#)
        #expect(CompanyIdentifier.innoconMedical.description == #"InnoCon Medical ApS"#)
    
        // Corvex Connected Safety
        #expect(CompanyIdentifier.corvexConnectedSafety.rawValue == 1905)
        #expect(CompanyIdentifier.corvexConnectedSafety.name == #"Corvex Connected Safety"#)
        #expect(CompanyIdentifier.corvexConnectedSafety.description == #"Corvex Connected Safety"#)
    
        // Thirdwayv Inc.
        #expect(CompanyIdentifier.thirdwayv.rawValue == 1906)
        #expect(CompanyIdentifier.thirdwayv.name == #"Thirdwayv Inc."#)
        #expect(CompanyIdentifier.thirdwayv.description == #"Thirdwayv Inc."#)
    
        // Echoflex Solutions Inc.
        #expect(CompanyIdentifier.echoflexSolutions.rawValue == 1907)
        #expect(CompanyIdentifier.echoflexSolutions.name == #"Echoflex Solutions Inc."#)
        #expect(CompanyIdentifier.echoflexSolutions.description == #"Echoflex Solutions Inc."#)
    
        // C-MAX Asia Limited
        #expect(CompanyIdentifier.cMaxAsia.rawValue == 1908)
        #expect(CompanyIdentifier.cMaxAsia.name == #"C-MAX Asia Limited"#)
        #expect(CompanyIdentifier.cMaxAsia.description == #"C-MAX Asia Limited"#)
    
        // 4eBusiness GmbH
        #expect(CompanyIdentifier.company4Ebusiness.rawValue == 1909)
        #expect(CompanyIdentifier.company4Ebusiness.name == #"4eBusiness GmbH"#)
        #expect(CompanyIdentifier.company4Ebusiness.description == #"4eBusiness GmbH"#)
    
        // Cyber Transport Control GmbH
        #expect(CompanyIdentifier.cyberTransportControl.rawValue == 1910)
        #expect(CompanyIdentifier.cyberTransportControl.name == #"Cyber Transport Control GmbH"#)
        #expect(CompanyIdentifier.cyberTransportControl.description == #"Cyber Transport Control GmbH"#)
    
        // Cue
        #expect(CompanyIdentifier.cue.rawValue == 1911)
        #expect(CompanyIdentifier.cue.name == #"Cue"#)
        #expect(CompanyIdentifier.cue.description == #"Cue"#)
    
        // KOAMTAC INC.
        #expect(CompanyIdentifier.koamtac.rawValue == 1912)
        #expect(CompanyIdentifier.koamtac.name == #"KOAMTAC INC."#)
        #expect(CompanyIdentifier.koamtac.description == #"KOAMTAC INC."#)
    
        // Loopshore Oy
        #expect(CompanyIdentifier.loopshore.rawValue == 1913)
        #expect(CompanyIdentifier.loopshore.name == #"Loopshore Oy"#)
        #expect(CompanyIdentifier.loopshore.description == #"Loopshore Oy"#)
    
        // Niruha Systems Private Limited
        #expect(CompanyIdentifier.niruhaSystems.rawValue == 1914)
        #expect(CompanyIdentifier.niruhaSystems.name == #"Niruha Systems Private Limited"#)
        #expect(CompanyIdentifier.niruhaSystems.description == #"Niruha Systems Private Limited"#)
    
        // AmaterZ, Inc.
        #expect(CompanyIdentifier.amaterz.rawValue == 1915)
        #expect(CompanyIdentifier.amaterz.name == #"AmaterZ, Inc."#)
        #expect(CompanyIdentifier.amaterz.description == #"AmaterZ, Inc."#)
    
        // radius co., ltd.
        #expect(CompanyIdentifier.radius.rawValue == 1916)
        #expect(CompanyIdentifier.radius.name == #"radius co., ltd."#)
        #expect(CompanyIdentifier.radius.description == #"radius co., ltd."#)
    
        // Sensority, s.r.o.
        #expect(CompanyIdentifier.sensority.rawValue == 1917)
        #expect(CompanyIdentifier.sensority.name == #"Sensority, s.r.o."#)
        #expect(CompanyIdentifier.sensority.description == #"Sensority, s.r.o."#)
    
        // Sparkage Inc.
        #expect(CompanyIdentifier.sparkage.rawValue == 1918)
        #expect(CompanyIdentifier.sparkage.name == #"Sparkage Inc."#)
        #expect(CompanyIdentifier.sparkage.description == #"Sparkage Inc."#)
    
        // Glenview Software Corporation
        #expect(CompanyIdentifier.glenviewSoftware.rawValue == 1919)
        #expect(CompanyIdentifier.glenviewSoftware.name == #"Glenview Software Corporation"#)
        #expect(CompanyIdentifier.glenviewSoftware.description == #"Glenview Software Corporation"#)
    
        // Finch Technologies Ltd.
        #expect(CompanyIdentifier.finchTechnologies.rawValue == 1920)
        #expect(CompanyIdentifier.finchTechnologies.name == #"Finch Technologies Ltd."#)
        #expect(CompanyIdentifier.finchTechnologies.description == #"Finch Technologies Ltd."#)
    
        // Qingping Technology (Beijing) Co., Ltd.
        #expect(CompanyIdentifier.qingpingTechnologyBeijing.rawValue == 1921)
        #expect(CompanyIdentifier.qingpingTechnologyBeijing.name == #"Qingping Technology (Beijing) Co., Ltd."#)
        #expect(CompanyIdentifier.qingpingTechnologyBeijing.description == #"Qingping Technology (Beijing) Co., Ltd."#)
    
        // DeviceDrive AS
        #expect(CompanyIdentifier.devicedrive.rawValue == 1922)
        #expect(CompanyIdentifier.devicedrive.name == #"DeviceDrive AS"#)
        #expect(CompanyIdentifier.devicedrive.description == #"DeviceDrive AS"#)
    
        // ESEMBER LIMITED LIABILITY COMPANY
        #expect(CompanyIdentifier.esemberLiability.rawValue == 1923)
        #expect(CompanyIdentifier.esemberLiability.name == #"ESEMBER LIMITED LIABILITY COMPANY"#)
        #expect(CompanyIdentifier.esemberLiability.description == #"ESEMBER LIMITED LIABILITY COMPANY"#)
    
        // audifon GmbH & Co. KG
        #expect(CompanyIdentifier.audifon.rawValue == 1924)
        #expect(CompanyIdentifier.audifon.name == #"audifon GmbH & Co. KG"#)
        #expect(CompanyIdentifier.audifon.description == #"audifon GmbH & Co. KG"#)
    
        // O2 Micro, Inc.
        #expect(CompanyIdentifier.o2Micro.rawValue == 1925)
        #expect(CompanyIdentifier.o2Micro.name == #"O2 Micro, Inc."#)
        #expect(CompanyIdentifier.o2Micro.description == #"O2 Micro, Inc."#)
    
        // HLP Controls Pty Limited
        #expect(CompanyIdentifier.hlpControls.rawValue == 1926)
        #expect(CompanyIdentifier.hlpControls.name == #"HLP Controls Pty Limited"#)
        #expect(CompanyIdentifier.hlpControls.description == #"HLP Controls Pty Limited"#)
    
        // Pangaea Solution
        #expect(CompanyIdentifier.pangaeaSolution.rawValue == 1927)
        #expect(CompanyIdentifier.pangaeaSolution.name == #"Pangaea Solution"#)
        #expect(CompanyIdentifier.pangaeaSolution.description == #"Pangaea Solution"#)
    
        // BubblyNet, LLC
        #expect(CompanyIdentifier.bubblynet.rawValue == 1928)
        #expect(CompanyIdentifier.bubblynet.name == #"BubblyNet, LLC"#)
        #expect(CompanyIdentifier.bubblynet.description == #"BubblyNet, LLC"#)
    
        // PCB Piezotronics, Inc.
        #expect(CompanyIdentifier.pcbPiezotronics.rawValue == 1929)
        #expect(CompanyIdentifier.pcbPiezotronics.name == #"PCB Piezotronics, Inc."#)
        #expect(CompanyIdentifier.pcbPiezotronics.description == #"PCB Piezotronics, Inc."#)
    
        // The Wildflower Foundation
        #expect(CompanyIdentifier.wildflowerFoundation.rawValue == 1930)
        #expect(CompanyIdentifier.wildflowerFoundation.name == #"The Wildflower Foundation"#)
        #expect(CompanyIdentifier.wildflowerFoundation.description == #"The Wildflower Foundation"#)
    
        // Optikam Tech Inc.
        #expect(CompanyIdentifier.optikamTech.rawValue == 1931)
        #expect(CompanyIdentifier.optikamTech.name == #"Optikam Tech Inc."#)
        #expect(CompanyIdentifier.optikamTech.description == #"Optikam Tech Inc."#)
    
        // MINIBREW HOLDING B.V
        #expect(CompanyIdentifier.minibrewHoldingBV.rawValue == 1932)
        #expect(CompanyIdentifier.minibrewHoldingBV.name == #"MINIBREW HOLDING B.V"#)
        #expect(CompanyIdentifier.minibrewHoldingBV.description == #"MINIBREW HOLDING B.V"#)
    
        // Cybex GmbH
        #expect(CompanyIdentifier.cybex.rawValue == 1933)
        #expect(CompanyIdentifier.cybex.name == #"Cybex GmbH"#)
        #expect(CompanyIdentifier.cybex.description == #"Cybex GmbH"#)
    
        // FUJIMIC NIIGATA, INC.
        #expect(CompanyIdentifier.fujimicNiigata.rawValue == 1934)
        #expect(CompanyIdentifier.fujimicNiigata.name == #"FUJIMIC NIIGATA, INC."#)
        #expect(CompanyIdentifier.fujimicNiigata.description == #"FUJIMIC NIIGATA, INC."#)
    
        // Hanna Instruments, Inc.
        #expect(CompanyIdentifier.hannaInstruments.rawValue == 1935)
        #expect(CompanyIdentifier.hannaInstruments.name == #"Hanna Instruments, Inc."#)
        #expect(CompanyIdentifier.hannaInstruments.description == #"Hanna Instruments, Inc."#)
    
        // KOMPAN A/S
        #expect(CompanyIdentifier.kompan.rawValue == 1936)
        #expect(CompanyIdentifier.kompan.name == #"KOMPAN A/S"#)
        #expect(CompanyIdentifier.kompan.description == #"KOMPAN A/S"#)
    
        // Scosche Industries, Inc.
        #expect(CompanyIdentifier.scoscheIndustries.rawValue == 1937)
        #expect(CompanyIdentifier.scoscheIndustries.name == #"Scosche Industries, Inc."#)
        #expect(CompanyIdentifier.scoscheIndustries.description == #"Scosche Industries, Inc."#)
    
        // Cricut, Inc.
        #expect(CompanyIdentifier.cricut.rawValue == 1938)
        #expect(CompanyIdentifier.cricut.name == #"Cricut, Inc."#)
        #expect(CompanyIdentifier.cricut.description == #"Cricut, Inc."#)
    
        // AEV spol. s r.o.
        #expect(CompanyIdentifier.aevSpolSRO.rawValue == 1939)
        #expect(CompanyIdentifier.aevSpolSRO.name == #"AEV spol. s r.o."#)
        #expect(CompanyIdentifier.aevSpolSRO.description == #"AEV spol. s r.o."#)
    
        // The Coca-Cola Company
        #expect(CompanyIdentifier.cocaCola.rawValue == 1940)
        #expect(CompanyIdentifier.cocaCola.name == #"The Coca-Cola Company"#)
        #expect(CompanyIdentifier.cocaCola.description == #"The Coca-Cola Company"#)
    
        // GASTEC CORPORATION
        #expect(CompanyIdentifier.gastec.rawValue == 1941)
        #expect(CompanyIdentifier.gastec.name == #"GASTEC CORPORATION"#)
        #expect(CompanyIdentifier.gastec.description == #"GASTEC CORPORATION"#)
    
        // StarLeaf Ltd
        #expect(CompanyIdentifier.starleaf.rawValue == 1942)
        #expect(CompanyIdentifier.starleaf.name == #"StarLeaf Ltd"#)
        #expect(CompanyIdentifier.starleaf.description == #"StarLeaf Ltd"#)
    
        // Water-i.d. GmbH
        #expect(CompanyIdentifier.waterID.rawValue == 1943)
        #expect(CompanyIdentifier.waterID.name == #"Water-i.d. GmbH"#)
        #expect(CompanyIdentifier.waterID.description == #"Water-i.d. GmbH"#)
    
        // HoloKit, Inc.
        #expect(CompanyIdentifier.holokit.rawValue == 1944)
        #expect(CompanyIdentifier.holokit.name == #"HoloKit, Inc."#)
        #expect(CompanyIdentifier.holokit.description == #"HoloKit, Inc."#)
    
        // PlantChoir Inc.
        #expect(CompanyIdentifier.plantchoir.rawValue == 1945)
        #expect(CompanyIdentifier.plantchoir.name == #"PlantChoir Inc."#)
        #expect(CompanyIdentifier.plantchoir.description == #"PlantChoir Inc."#)
    
        // GuangDong Oppo Mobile Telecommunications Corp., Ltd.
        #expect(CompanyIdentifier.guangdongOppoMobileTelecommunications.rawValue == 1946)
        #expect(CompanyIdentifier.guangdongOppoMobileTelecommunications.name == #"GuangDong Oppo Mobile Telecommunications Corp., Ltd."#)
        #expect(CompanyIdentifier.guangdongOppoMobileTelecommunications.description == #"GuangDong Oppo Mobile Telecommunications Corp., Ltd."#)
    
        // CST ELECTRONICS (PROPRIETARY) LIMITED
        #expect(CompanyIdentifier.cstElectronicsProprietary.rawValue == 1947)
        #expect(CompanyIdentifier.cstElectronicsProprietary.name == #"CST ELECTRONICS (PROPRIETARY) LIMITED"#)
        #expect(CompanyIdentifier.cstElectronicsProprietary.description == #"CST ELECTRONICS (PROPRIETARY) LIMITED"#)
    
        // Sky UK Limited
        #expect(CompanyIdentifier.skyUk.rawValue == 1948)
        #expect(CompanyIdentifier.skyUk.name == #"Sky UK Limited"#)
        #expect(CompanyIdentifier.skyUk.description == #"Sky UK Limited"#)
    
        // Digibale Pty Ltd
        #expect(CompanyIdentifier.digibale.rawValue == 1949)
        #expect(CompanyIdentifier.digibale.name == #"Digibale Pty Ltd"#)
        #expect(CompanyIdentifier.digibale.description == #"Digibale Pty Ltd"#)
    
        // Smartloxx GmbH
        #expect(CompanyIdentifier.smartloxx.rawValue == 1950)
        #expect(CompanyIdentifier.smartloxx.name == #"Smartloxx GmbH"#)
        #expect(CompanyIdentifier.smartloxx.description == #"Smartloxx GmbH"#)
    
        // Pune Scientific LLP
        #expect(CompanyIdentifier.puneScientificLlp.rawValue == 1951)
        #expect(CompanyIdentifier.puneScientificLlp.name == #"Pune Scientific LLP"#)
        #expect(CompanyIdentifier.puneScientificLlp.description == #"Pune Scientific LLP"#)
    
        // Regent Beleuchtungskorper AG
        #expect(CompanyIdentifier.regentBeleuchtungskorper.rawValue == 1952)
        #expect(CompanyIdentifier.regentBeleuchtungskorper.name == #"Regent Beleuchtungskorper AG"#)
        #expect(CompanyIdentifier.regentBeleuchtungskorper.description == #"Regent Beleuchtungskorper AG"#)
    
        // Apollo Neuroscience, Inc.
        #expect(CompanyIdentifier.apolloNeuroscience.rawValue == 1953)
        #expect(CompanyIdentifier.apolloNeuroscience.name == #"Apollo Neuroscience, Inc."#)
        #expect(CompanyIdentifier.apolloNeuroscience.description == #"Apollo Neuroscience, Inc."#)
    
        // Roku, Inc.
        #expect(CompanyIdentifier.roku.rawValue == 1954)
        #expect(CompanyIdentifier.roku.name == #"Roku, Inc."#)
        #expect(CompanyIdentifier.roku.description == #"Roku, Inc."#)
    
        // Comcast Cable
        #expect(CompanyIdentifier.comcastCable.rawValue == 1955)
        #expect(CompanyIdentifier.comcastCable.name == #"Comcast Cable"#)
        #expect(CompanyIdentifier.comcastCable.description == #"Comcast Cable"#)
    
        // Xiamen Mage Information Technology Co., Ltd.
        #expect(CompanyIdentifier.xiamenMageInformationTechnology.rawValue == 1956)
        #expect(CompanyIdentifier.xiamenMageInformationTechnology.name == #"Xiamen Mage Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.xiamenMageInformationTechnology.description == #"Xiamen Mage Information Technology Co., Ltd."#)
    
        // RAB Lighting, Inc.
        #expect(CompanyIdentifier.rabLighting.rawValue == 1957)
        #expect(CompanyIdentifier.rabLighting.name == #"RAB Lighting, Inc."#)
        #expect(CompanyIdentifier.rabLighting.description == #"RAB Lighting, Inc."#)
    
        // Musen Connect, Inc.
        #expect(CompanyIdentifier.musenConnect.rawValue == 1958)
        #expect(CompanyIdentifier.musenConnect.name == #"Musen Connect, Inc."#)
        #expect(CompanyIdentifier.musenConnect.description == #"Musen Connect, Inc."#)
    
        // Zume, Inc.
        #expect(CompanyIdentifier.zume.rawValue == 1959)
        #expect(CompanyIdentifier.zume.name == #"Zume, Inc."#)
        #expect(CompanyIdentifier.zume.description == #"Zume, Inc."#)
    
        // conbee GmbH
        #expect(CompanyIdentifier.conbee.rawValue == 1960)
        #expect(CompanyIdentifier.conbee.name == #"conbee GmbH"#)
        #expect(CompanyIdentifier.conbee.description == #"conbee GmbH"#)
    
        // Bruel & Kjaer Sound & Vibration
        #expect(CompanyIdentifier.bruelKjaerSoundVibration.rawValue == 1961)
        #expect(CompanyIdentifier.bruelKjaerSoundVibration.name == #"Bruel & Kjaer Sound & Vibration"#)
        #expect(CompanyIdentifier.bruelKjaerSoundVibration.description == #"Bruel & Kjaer Sound & Vibration"#)
    
        // The Kroger Co.
        #expect(CompanyIdentifier.kroger.rawValue == 1962)
        #expect(CompanyIdentifier.kroger.name == #"The Kroger Co."#)
        #expect(CompanyIdentifier.kroger.description == #"The Kroger Co."#)
    
        // Granite River Solutions, Inc.
        #expect(CompanyIdentifier.graniteRiverSolutions.rawValue == 1963)
        #expect(CompanyIdentifier.graniteRiverSolutions.name == #"Granite River Solutions, Inc."#)
        #expect(CompanyIdentifier.graniteRiverSolutions.description == #"Granite River Solutions, Inc."#)
    
        // LoupeDeck Oy
        #expect(CompanyIdentifier.loupedeck.rawValue == 1964)
        #expect(CompanyIdentifier.loupedeck.name == #"LoupeDeck Oy"#)
        #expect(CompanyIdentifier.loupedeck.description == #"LoupeDeck Oy"#)
    
        // New H3C Technologies Co.,Ltd
        #expect(CompanyIdentifier.newH3CTechnologies.rawValue == 1965)
        #expect(CompanyIdentifier.newH3CTechnologies.name == #"New H3C Technologies Co.,Ltd"#)
        #expect(CompanyIdentifier.newH3CTechnologies.description == #"New H3C Technologies Co.,Ltd"#)
    
        // Aurea Solucoes Tecnologicas Ltda.
        #expect(CompanyIdentifier.aureaSolucoesTecnologicas.rawValue == 1966)
        #expect(CompanyIdentifier.aureaSolucoesTecnologicas.name == #"Aurea Solucoes Tecnologicas Ltda."#)
        #expect(CompanyIdentifier.aureaSolucoesTecnologicas.description == #"Aurea Solucoes Tecnologicas Ltda."#)
    
        // Hong Kong Bouffalo Lab Limited
        #expect(CompanyIdentifier.hongKongBouffaloLab.rawValue == 1967)
        #expect(CompanyIdentifier.hongKongBouffaloLab.name == #"Hong Kong Bouffalo Lab Limited"#)
        #expect(CompanyIdentifier.hongKongBouffaloLab.description == #"Hong Kong Bouffalo Lab Limited"#)
    
        // GV Concepts Inc.
        #expect(CompanyIdentifier.gvConcepts.rawValue == 1968)
        #expect(CompanyIdentifier.gvConcepts.name == #"GV Concepts Inc."#)
        #expect(CompanyIdentifier.gvConcepts.description == #"GV Concepts Inc."#)
    
        // Thomas Dynamics, LLC
        #expect(CompanyIdentifier.thomasDynamics.rawValue == 1969)
        #expect(CompanyIdentifier.thomasDynamics.name == #"Thomas Dynamics, LLC"#)
        #expect(CompanyIdentifier.thomasDynamics.description == #"Thomas Dynamics, LLC"#)
    
        // Moeco IOT Inc.
        #expect(CompanyIdentifier.moecoIot.rawValue == 1970)
        #expect(CompanyIdentifier.moecoIot.name == #"Moeco IOT Inc."#)
        #expect(CompanyIdentifier.moecoIot.description == #"Moeco IOT Inc."#)
    
        // 2N TELEKOMUNIKACE a.s.
        #expect(CompanyIdentifier.company2NTelekomunikace.rawValue == 1971)
        #expect(CompanyIdentifier.company2NTelekomunikace.name == #"2N TELEKOMUNIKACE a.s."#)
        #expect(CompanyIdentifier.company2NTelekomunikace.description == #"2N TELEKOMUNIKACE a.s."#)
    
        // Hormann KG Antriebstechnik
        #expect(CompanyIdentifier.hormannKgAntriebstechnik.rawValue == 1972)
        #expect(CompanyIdentifier.hormannKgAntriebstechnik.name == #"Hormann KG Antriebstechnik"#)
        #expect(CompanyIdentifier.hormannKgAntriebstechnik.description == #"Hormann KG Antriebstechnik"#)
    
        // CRONO CHIP, S.L.
        #expect(CompanyIdentifier.cronoChip.rawValue == 1973)
        #expect(CompanyIdentifier.cronoChip.name == #"CRONO CHIP, S.L."#)
        #expect(CompanyIdentifier.cronoChip.description == #"CRONO CHIP, S.L."#)
    
        // Soundbrenner Limited
        #expect(CompanyIdentifier.soundbrenner.rawValue == 1974)
        #expect(CompanyIdentifier.soundbrenner.name == #"Soundbrenner Limited"#)
        #expect(CompanyIdentifier.soundbrenner.description == #"Soundbrenner Limited"#)
    
        // ETABLISSEMENTS GEORGES RENAULT
        #expect(CompanyIdentifier.etablissementsGeorgesRenault.rawValue == 1975)
        #expect(CompanyIdentifier.etablissementsGeorgesRenault.name == #"ETABLISSEMENTS GEORGES RENAULT"#)
        #expect(CompanyIdentifier.etablissementsGeorgesRenault.description == #"ETABLISSEMENTS GEORGES RENAULT"#)
    
        // iSwip
        #expect(CompanyIdentifier.iswip.rawValue == 1976)
        #expect(CompanyIdentifier.iswip.name == #"iSwip"#)
        #expect(CompanyIdentifier.iswip.description == #"iSwip"#)
    
        // Epona Biotec Limited
        #expect(CompanyIdentifier.eponaBiotec.rawValue == 1977)
        #expect(CompanyIdentifier.eponaBiotec.name == #"Epona Biotec Limited"#)
        #expect(CompanyIdentifier.eponaBiotec.description == #"Epona Biotec Limited"#)
    
        // Battery-Biz Inc.
        #expect(CompanyIdentifier.batteryBiz.rawValue == 1978)
        #expect(CompanyIdentifier.batteryBiz.name == #"Battery-Biz Inc."#)
        #expect(CompanyIdentifier.batteryBiz.description == #"Battery-Biz Inc."#)
    
        // EPIC S.R.L.
        #expect(CompanyIdentifier.epic.rawValue == 1979)
        #expect(CompanyIdentifier.epic.name == #"EPIC S.R.L."#)
        #expect(CompanyIdentifier.epic.description == #"EPIC S.R.L."#)
    
        // KD CIRCUITS LLC
        #expect(CompanyIdentifier.kdCircuits.rawValue == 1980)
        #expect(CompanyIdentifier.kdCircuits.name == #"KD CIRCUITS LLC"#)
        #expect(CompanyIdentifier.kdCircuits.description == #"KD CIRCUITS LLC"#)
    
        // Genedrive Diagnostics Ltd
        #expect(CompanyIdentifier.genedriveDiagnostics.rawValue == 1981)
        #expect(CompanyIdentifier.genedriveDiagnostics.name == #"Genedrive Diagnostics Ltd"#)
        #expect(CompanyIdentifier.genedriveDiagnostics.description == #"Genedrive Diagnostics Ltd"#)
    
        // Axentia Technologies AB
        #expect(CompanyIdentifier.axentiaTechnologies.rawValue == 1982)
        #expect(CompanyIdentifier.axentiaTechnologies.name == #"Axentia Technologies AB"#)
        #expect(CompanyIdentifier.axentiaTechnologies.description == #"Axentia Technologies AB"#)
    
        // REGULA Ltd.
        #expect(CompanyIdentifier.regula.rawValue == 1983)
        #expect(CompanyIdentifier.regula.name == #"REGULA Ltd."#)
        #expect(CompanyIdentifier.regula.description == #"REGULA Ltd."#)
    
        // Biral AG
        #expect(CompanyIdentifier.biral.rawValue == 1984)
        #expect(CompanyIdentifier.biral.name == #"Biral AG"#)
        #expect(CompanyIdentifier.biral.description == #"Biral AG"#)
    
        // A.W. Chesterton Company
        #expect(CompanyIdentifier.aWChesterton.rawValue == 1985)
        #expect(CompanyIdentifier.aWChesterton.name == #"A.W. Chesterton Company"#)
        #expect(CompanyIdentifier.aWChesterton.description == #"A.W. Chesterton Company"#)
    
        // Radinn AB
        #expect(CompanyIdentifier.radinn.rawValue == 1986)
        #expect(CompanyIdentifier.radinn.name == #"Radinn AB"#)
        #expect(CompanyIdentifier.radinn.description == #"Radinn AB"#)
    
        // CIMTechniques, Inc.
        #expect(CompanyIdentifier.cimtechniques.rawValue == 1987)
        #expect(CompanyIdentifier.cimtechniques.name == #"CIMTechniques, Inc."#)
        #expect(CompanyIdentifier.cimtechniques.description == #"CIMTechniques, Inc."#)
    
        // Johnson Health Tech NA
        #expect(CompanyIdentifier.johnsonHealthTechNa.rawValue == 1988)
        #expect(CompanyIdentifier.johnsonHealthTechNa.name == #"Johnson Health Tech NA"#)
        #expect(CompanyIdentifier.johnsonHealthTechNa.description == #"Johnson Health Tech NA"#)
    
        // June Life, Inc.
        #expect(CompanyIdentifier.juneLife.rawValue == 1989)
        #expect(CompanyIdentifier.juneLife.name == #"June Life, Inc."#)
        #expect(CompanyIdentifier.juneLife.description == #"June Life, Inc."#)
    
        // Bluenetics GmbH
        #expect(CompanyIdentifier.bluenetics.rawValue == 1990)
        #expect(CompanyIdentifier.bluenetics.name == #"Bluenetics GmbH"#)
        #expect(CompanyIdentifier.bluenetics.description == #"Bluenetics GmbH"#)
    
        // iaconicDesign Inc.
        #expect(CompanyIdentifier.iaconicdesign.rawValue == 1991)
        #expect(CompanyIdentifier.iaconicdesign.name == #"iaconicDesign Inc."#)
        #expect(CompanyIdentifier.iaconicdesign.description == #"iaconicDesign Inc."#)
    
        // WRLDS Creations AB
        #expect(CompanyIdentifier.wrldsCreations.rawValue == 1992)
        #expect(CompanyIdentifier.wrldsCreations.name == #"WRLDS Creations AB"#)
        #expect(CompanyIdentifier.wrldsCreations.description == #"WRLDS Creations AB"#)
    
        // Skullcandy, Inc.
        #expect(CompanyIdentifier.skullcandy.rawValue == 1993)
        #expect(CompanyIdentifier.skullcandy.name == #"Skullcandy, Inc."#)
        #expect(CompanyIdentifier.skullcandy.description == #"Skullcandy, Inc."#)
    
        // Modul-System HH AB
        #expect(CompanyIdentifier.modulSystemHh.rawValue == 1994)
        #expect(CompanyIdentifier.modulSystemHh.name == #"Modul-System HH AB"#)
        #expect(CompanyIdentifier.modulSystemHh.description == #"Modul-System HH AB"#)
    
        // West Pharmaceutical Services, Inc.
        #expect(CompanyIdentifier.westPharmaceuticalServices.rawValue == 1995)
        #expect(CompanyIdentifier.westPharmaceuticalServices.name == #"West Pharmaceutical Services, Inc."#)
        #expect(CompanyIdentifier.westPharmaceuticalServices.description == #"West Pharmaceutical Services, Inc."#)
    
        // Barnacle Systems Inc.
        #expect(CompanyIdentifier.barnacleSystems.rawValue == 1996)
        #expect(CompanyIdentifier.barnacleSystems.name == #"Barnacle Systems Inc."#)
        #expect(CompanyIdentifier.barnacleSystems.description == #"Barnacle Systems Inc."#)
    
        // Smart Wave Technologies Canada Inc
        #expect(CompanyIdentifier.smartWaveTechnologiesCanada.rawValue == 1997)
        #expect(CompanyIdentifier.smartWaveTechnologiesCanada.name == #"Smart Wave Technologies Canada Inc"#)
        #expect(CompanyIdentifier.smartWaveTechnologiesCanada.description == #"Smart Wave Technologies Canada Inc"#)
    
        // Shanghai Top-Chip Microelectronics Tech. Co., LTD
        #expect(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.rawValue == 1998)
        #expect(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.name == #"Shanghai Top-Chip Microelectronics Tech. Co., LTD"#)
        #expect(CompanyIdentifier.shanghaiTopChipMicroelectronicsTech.description == #"Shanghai Top-Chip Microelectronics Tech. Co., LTD"#)
    
        // NeoSensory, Inc.
        #expect(CompanyIdentifier.neosensory.rawValue == 1999)
        #expect(CompanyIdentifier.neosensory.name == #"NeoSensory, Inc."#)
        #expect(CompanyIdentifier.neosensory.description == #"NeoSensory, Inc."#)
    
        // Hangzhou Tuya Information  Technology Co., Ltd
        #expect(CompanyIdentifier.hangzhouTuyaInformationTechnology.rawValue == 2000)
        #expect(CompanyIdentifier.hangzhouTuyaInformationTechnology.name == #"Hangzhou Tuya Information  Technology Co., Ltd"#)
        #expect(CompanyIdentifier.hangzhouTuyaInformationTechnology.description == #"Hangzhou Tuya Information  Technology Co., Ltd"#)
    
        // Shanghai Panchip Microelectronics Co., Ltd
        #expect(CompanyIdentifier.shanghaiPanchipMicroelectronics.rawValue == 2001)
        #expect(CompanyIdentifier.shanghaiPanchipMicroelectronics.name == #"Shanghai Panchip Microelectronics Co., Ltd"#)
        #expect(CompanyIdentifier.shanghaiPanchipMicroelectronics.description == #"Shanghai Panchip Microelectronics Co., Ltd"#)
    
        // React Accessibility Limited
        #expect(CompanyIdentifier.reactAccessibility.rawValue == 2002)
        #expect(CompanyIdentifier.reactAccessibility.name == #"React Accessibility Limited"#)
        #expect(CompanyIdentifier.reactAccessibility.description == #"React Accessibility Limited"#)
    
        // LIVNEX Co.,Ltd.
        #expect(CompanyIdentifier.livnex.rawValue == 2003)
        #expect(CompanyIdentifier.livnex.name == #"LIVNEX Co.,Ltd."#)
        #expect(CompanyIdentifier.livnex.description == #"LIVNEX Co.,Ltd."#)
    
        // Kano Computing Limited
        #expect(CompanyIdentifier.kanoComputing.rawValue == 2004)
        #expect(CompanyIdentifier.kanoComputing.name == #"Kano Computing Limited"#)
        #expect(CompanyIdentifier.kanoComputing.description == #"Kano Computing Limited"#)
    
        // hoots classic GmbH
        #expect(CompanyIdentifier.hootsClassic.rawValue == 2005)
        #expect(CompanyIdentifier.hootsClassic.name == #"hoots classic GmbH"#)
        #expect(CompanyIdentifier.hootsClassic.description == #"hoots classic GmbH"#)
    
        // ecobee Inc.
        #expect(CompanyIdentifier.ecobee.rawValue == 2006)
        #expect(CompanyIdentifier.ecobee.name == #"ecobee Inc."#)
        #expect(CompanyIdentifier.ecobee.description == #"ecobee Inc."#)
    
        // Nanjing Qinheng Microelectronics Co., Ltd
        #expect(CompanyIdentifier.nanjingQinhengMicroelectronics.rawValue == 2007)
        #expect(CompanyIdentifier.nanjingQinhengMicroelectronics.name == #"Nanjing Qinheng Microelectronics Co., Ltd"#)
        #expect(CompanyIdentifier.nanjingQinhengMicroelectronics.description == #"Nanjing Qinheng Microelectronics Co., Ltd"#)
    
        // SOLUTIONS AMBRA INC.
        #expect(CompanyIdentifier.solutionsAmbra.rawValue == 2008)
        #expect(CompanyIdentifier.solutionsAmbra.name == #"SOLUTIONS AMBRA INC."#)
        #expect(CompanyIdentifier.solutionsAmbra.description == #"SOLUTIONS AMBRA INC."#)
    
        // Micro-Design, Inc.
        #expect(CompanyIdentifier.microDesign.rawValue == 2009)
        #expect(CompanyIdentifier.microDesign.name == #"Micro-Design, Inc."#)
        #expect(CompanyIdentifier.microDesign.description == #"Micro-Design, Inc."#)
    
        // STARLITE Co., Ltd.
        #expect(CompanyIdentifier.starlite.rawValue == 2010)
        #expect(CompanyIdentifier.starlite.name == #"STARLITE Co., Ltd."#)
        #expect(CompanyIdentifier.starlite.description == #"STARLITE Co., Ltd."#)
    
        // Remedee Labs
        #expect(CompanyIdentifier.remedeeLabs.rawValue == 2011)
        #expect(CompanyIdentifier.remedeeLabs.name == #"Remedee Labs"#)
        #expect(CompanyIdentifier.remedeeLabs.description == #"Remedee Labs"#)
    
        // ThingOS GmbH & Co KG
        #expect(CompanyIdentifier.thingos.rawValue == 2012)
        #expect(CompanyIdentifier.thingos.name == #"ThingOS GmbH & Co KG"#)
        #expect(CompanyIdentifier.thingos.description == #"ThingOS GmbH & Co KG"#)
    
        // Linear Circuits
        #expect(CompanyIdentifier.linearCircuits.rawValue == 2013)
        #expect(CompanyIdentifier.linearCircuits.name == #"Linear Circuits"#)
        #expect(CompanyIdentifier.linearCircuits.description == #"Linear Circuits"#)
    
        // Unlimited Engineering SL
        #expect(CompanyIdentifier.unlimitedEngineering.rawValue == 2014)
        #expect(CompanyIdentifier.unlimitedEngineering.name == #"Unlimited Engineering SL"#)
        #expect(CompanyIdentifier.unlimitedEngineering.description == #"Unlimited Engineering SL"#)
    
        // Snap-on Incorporated
        #expect(CompanyIdentifier.snapOn.rawValue == 2015)
        #expect(CompanyIdentifier.snapOn.name == #"Snap-on Incorporated"#)
        #expect(CompanyIdentifier.snapOn.description == #"Snap-on Incorporated"#)
    
        // Edifier International Limited
        #expect(CompanyIdentifier.edifierInternational.rawValue == 2016)
        #expect(CompanyIdentifier.edifierInternational.name == #"Edifier International Limited"#)
        #expect(CompanyIdentifier.edifierInternational.description == #"Edifier International Limited"#)
    
        // Lucie Labs
        #expect(CompanyIdentifier.lucieLabs.rawValue == 2017)
        #expect(CompanyIdentifier.lucieLabs.name == #"Lucie Labs"#)
        #expect(CompanyIdentifier.lucieLabs.description == #"Lucie Labs"#)
    
        // Alfred Kaercher SE & Co. KG
        #expect(CompanyIdentifier.alfredKaercherSeKg.rawValue == 2018)
        #expect(CompanyIdentifier.alfredKaercherSeKg.name == #"Alfred Kaercher SE & Co. KG"#)
        #expect(CompanyIdentifier.alfredKaercherSeKg.description == #"Alfred Kaercher SE & Co. KG"#)
    
        // Airoha Technology Corp.
        #expect(CompanyIdentifier.airohaTechnology2.rawValue == 2019)
        #expect(CompanyIdentifier.airohaTechnology2.name == #"Airoha Technology Corp."#)
        #expect(CompanyIdentifier.airohaTechnology2.description == #"Airoha Technology Corp."#)
    
        // Geeksme S.L.
        #expect(CompanyIdentifier.geeksme.rawValue == 2020)
        #expect(CompanyIdentifier.geeksme.name == #"Geeksme S.L."#)
        #expect(CompanyIdentifier.geeksme.description == #"Geeksme S.L."#)
    
        // Minut, Inc.
        #expect(CompanyIdentifier.minut.rawValue == 2021)
        #expect(CompanyIdentifier.minut.name == #"Minut, Inc."#)
        #expect(CompanyIdentifier.minut.description == #"Minut, Inc."#)
    
        // Waybeyond Limited
        #expect(CompanyIdentifier.waybeyond.rawValue == 2022)
        #expect(CompanyIdentifier.waybeyond.name == #"Waybeyond Limited"#)
        #expect(CompanyIdentifier.waybeyond.description == #"Waybeyond Limited"#)
    
        // Komfort IQ, Inc.
        #expect(CompanyIdentifier.komfortIq.rawValue == 2023)
        #expect(CompanyIdentifier.komfortIq.name == #"Komfort IQ, Inc."#)
        #expect(CompanyIdentifier.komfortIq.description == #"Komfort IQ, Inc."#)
    
        // Packetcraft, Inc.
        #expect(CompanyIdentifier.packetcraft.rawValue == 2024)
        #expect(CompanyIdentifier.packetcraft.name == #"Packetcraft, Inc."#)
        #expect(CompanyIdentifier.packetcraft.description == #"Packetcraft, Inc."#)
    
        // Häfele GmbH & Co KG
        #expect(CompanyIdentifier.hafele.rawValue == 2025)
        #expect(CompanyIdentifier.hafele.name == #"Häfele GmbH & Co KG"#)
        #expect(CompanyIdentifier.hafele.description == #"Häfele GmbH & Co KG"#)
    
        // ShapeLog, Inc.
        #expect(CompanyIdentifier.shapelog.rawValue == 2026)
        #expect(CompanyIdentifier.shapelog.name == #"ShapeLog, Inc."#)
        #expect(CompanyIdentifier.shapelog.description == #"ShapeLog, Inc."#)
    
        // NOVABASE S.R.L.
        #expect(CompanyIdentifier.novabase.rawValue == 2027)
        #expect(CompanyIdentifier.novabase.name == #"NOVABASE S.R.L."#)
        #expect(CompanyIdentifier.novabase.description == #"NOVABASE S.R.L."#)
    
        // Frecce LLC
        #expect(CompanyIdentifier.frecce.rawValue == 2028)
        #expect(CompanyIdentifier.frecce.name == #"Frecce LLC"#)
        #expect(CompanyIdentifier.frecce.description == #"Frecce LLC"#)
    
        // Joule IQ, INC.
        #expect(CompanyIdentifier.jouleIq.rawValue == 2029)
        #expect(CompanyIdentifier.jouleIq.name == #"Joule IQ, INC."#)
        #expect(CompanyIdentifier.jouleIq.description == #"Joule IQ, INC."#)
    
        // KidzTek LLC
        #expect(CompanyIdentifier.kidztek.rawValue == 2030)
        #expect(CompanyIdentifier.kidztek.name == #"KidzTek LLC"#)
        #expect(CompanyIdentifier.kidztek.description == #"KidzTek LLC"#)
    
        // Aktiebolaget Sandvik Coromant
        #expect(CompanyIdentifier.aktiebolagetSandvikCoromant.rawValue == 2031)
        #expect(CompanyIdentifier.aktiebolagetSandvikCoromant.name == #"Aktiebolaget Sandvik Coromant"#)
        #expect(CompanyIdentifier.aktiebolagetSandvikCoromant.description == #"Aktiebolaget Sandvik Coromant"#)
    
        // e-moola.com Pty Ltd
        #expect(CompanyIdentifier.eMoolaCom.rawValue == 2032)
        #expect(CompanyIdentifier.eMoolaCom.name == #"e-moola.com Pty Ltd"#)
        #expect(CompanyIdentifier.eMoolaCom.description == #"e-moola.com Pty Ltd"#)
    
        // Zimi Innovations Pty Ltd
        #expect(CompanyIdentifier.zimiInnovations.rawValue == 2033)
        #expect(CompanyIdentifier.zimiInnovations.name == #"Zimi Innovations Pty Ltd"#)
        #expect(CompanyIdentifier.zimiInnovations.description == #"Zimi Innovations Pty Ltd"#)
    
        // SERENE GROUP, INC
        #expect(CompanyIdentifier.sereneGroup.rawValue == 2034)
        #expect(CompanyIdentifier.sereneGroup.name == #"SERENE GROUP, INC"#)
        #expect(CompanyIdentifier.sereneGroup.description == #"SERENE GROUP, INC"#)
    
        // DIGISINE ENERGYTECH CO. LTD.
        #expect(CompanyIdentifier.digisineEnergytech.rawValue == 2035)
        #expect(CompanyIdentifier.digisineEnergytech.name == #"DIGISINE ENERGYTECH CO. LTD."#)
        #expect(CompanyIdentifier.digisineEnergytech.description == #"DIGISINE ENERGYTECH CO. LTD."#)
    
        // MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag
        #expect(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.rawValue == 2036)
        #expect(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.name == #"MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag"#)
        #expect(CompanyIdentifier.medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag.description == #"MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag"#)
    
        // Byton North America Corporation
        #expect(CompanyIdentifier.bytonNorthAmerica.rawValue == 2037)
        #expect(CompanyIdentifier.bytonNorthAmerica.name == #"Byton North America Corporation"#)
        #expect(CompanyIdentifier.bytonNorthAmerica.description == #"Byton North America Corporation"#)
    
        // Shenzhen TonliScience and Technology Development Co.,Ltd
        #expect(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.rawValue == 2038)
        #expect(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.name == #"Shenzhen TonliScience and Technology Development Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenTonliscienceAndTechnologyDevelopment.description == #"Shenzhen TonliScience and Technology Development Co.,Ltd"#)
    
        // Cesar Systems Ltd.
        #expect(CompanyIdentifier.cesarSystems.rawValue == 2039)
        #expect(CompanyIdentifier.cesarSystems.name == #"Cesar Systems Ltd."#)
        #expect(CompanyIdentifier.cesarSystems.description == #"Cesar Systems Ltd."#)
    
        // quip NYC Inc.
        #expect(CompanyIdentifier.quipNyc.rawValue == 2040)
        #expect(CompanyIdentifier.quipNyc.name == #"quip NYC Inc."#)
        #expect(CompanyIdentifier.quipNyc.description == #"quip NYC Inc."#)
    
        // Direct Communication Solutions, Inc.
        #expect(CompanyIdentifier.directCommunicationSolutions.rawValue == 2041)
        #expect(CompanyIdentifier.directCommunicationSolutions.name == #"Direct Communication Solutions, Inc."#)
        #expect(CompanyIdentifier.directCommunicationSolutions.description == #"Direct Communication Solutions, Inc."#)
    
        // Klipsch Group, Inc.
        #expect(CompanyIdentifier.klipschGroup.rawValue == 2042)
        #expect(CompanyIdentifier.klipschGroup.name == #"Klipsch Group, Inc."#)
        #expect(CompanyIdentifier.klipschGroup.description == #"Klipsch Group, Inc."#)
    
        // Access Co., Ltd
        #expect(CompanyIdentifier.access.rawValue == 2043)
        #expect(CompanyIdentifier.access.name == #"Access Co., Ltd"#)
        #expect(CompanyIdentifier.access.description == #"Access Co., Ltd"#)
    
        // Renault SA
        #expect(CompanyIdentifier.renault.rawValue == 2044)
        #expect(CompanyIdentifier.renault.name == #"Renault SA"#)
        #expect(CompanyIdentifier.renault.description == #"Renault SA"#)
    
        // JSK CO., LTD.
        #expect(CompanyIdentifier.jsk.rawValue == 2045)
        #expect(CompanyIdentifier.jsk.name == #"JSK CO., LTD."#)
        #expect(CompanyIdentifier.jsk.description == #"JSK CO., LTD."#)
    
        // BIROTA
        #expect(CompanyIdentifier.birota.rawValue == 2046)
        #expect(CompanyIdentifier.birota.name == #"BIROTA"#)
        #expect(CompanyIdentifier.birota.description == #"BIROTA"#)
    
        // maxon motor ltd.
        #expect(CompanyIdentifier.maxonMotor.rawValue == 2047)
        #expect(CompanyIdentifier.maxonMotor.name == #"maxon motor ltd."#)
        #expect(CompanyIdentifier.maxonMotor.description == #"maxon motor ltd."#)
    
        // Optek
        #expect(CompanyIdentifier.optek.rawValue == 2048)
        #expect(CompanyIdentifier.optek.name == #"Optek"#)
        #expect(CompanyIdentifier.optek.description == #"Optek"#)
    
        // CRONUS ELECTRONICS LTD
        #expect(CompanyIdentifier.cronusElectronics.rawValue == 2049)
        #expect(CompanyIdentifier.cronusElectronics.name == #"CRONUS ELECTRONICS LTD"#)
        #expect(CompanyIdentifier.cronusElectronics.description == #"CRONUS ELECTRONICS LTD"#)
    
        // NantSound, Inc.
        #expect(CompanyIdentifier.nantsound.rawValue == 2050)
        #expect(CompanyIdentifier.nantsound.name == #"NantSound, Inc."#)
        #expect(CompanyIdentifier.nantsound.description == #"NantSound, Inc."#)
    
        // Domintell s.a.
        #expect(CompanyIdentifier.domintell.rawValue == 2051)
        #expect(CompanyIdentifier.domintell.name == #"Domintell s.a."#)
        #expect(CompanyIdentifier.domintell.description == #"Domintell s.a."#)
    
        // Andon Health Co.,Ltd
        #expect(CompanyIdentifier.andonHealth.rawValue == 2052)
        #expect(CompanyIdentifier.andonHealth.name == #"Andon Health Co.,Ltd"#)
        #expect(CompanyIdentifier.andonHealth.description == #"Andon Health Co.,Ltd"#)
    
        // Urbanminded Ltd
        #expect(CompanyIdentifier.urbanminded.rawValue == 2053)
        #expect(CompanyIdentifier.urbanminded.name == #"Urbanminded Ltd"#)
        #expect(CompanyIdentifier.urbanminded.description == #"Urbanminded Ltd"#)
    
        // TYRI Sweden AB
        #expect(CompanyIdentifier.tyriSweden.rawValue == 2054)
        #expect(CompanyIdentifier.tyriSweden.name == #"TYRI Sweden AB"#)
        #expect(CompanyIdentifier.tyriSweden.description == #"TYRI Sweden AB"#)
    
        // ECD Electronic Components GmbH Dresden
        #expect(CompanyIdentifier.ecdElectronicComponentsDresden.rawValue == 2055)
        #expect(CompanyIdentifier.ecdElectronicComponentsDresden.name == #"ECD Electronic Components GmbH Dresden"#)
        #expect(CompanyIdentifier.ecdElectronicComponentsDresden.description == #"ECD Electronic Components GmbH Dresden"#)
    
        // SISTEMAS KERN, SOCIEDAD ANÓMINA
        #expect(CompanyIdentifier.sistemasKernSociedadAnomina.rawValue == 2056)
        #expect(CompanyIdentifier.sistemasKernSociedadAnomina.name == #"SISTEMAS KERN, SOCIEDAD ANÓMINA"#)
        #expect(CompanyIdentifier.sistemasKernSociedadAnomina.description == #"SISTEMAS KERN, SOCIEDAD ANÓMINA"#)
    
        // Trulli Audio
        #expect(CompanyIdentifier.trulliAudio.rawValue == 2057)
        #expect(CompanyIdentifier.trulliAudio.name == #"Trulli Audio"#)
        #expect(CompanyIdentifier.trulliAudio.description == #"Trulli Audio"#)
    
        // Altaneos
        #expect(CompanyIdentifier.altaneos.rawValue == 2058)
        #expect(CompanyIdentifier.altaneos.name == #"Altaneos"#)
        #expect(CompanyIdentifier.altaneos.description == #"Altaneos"#)
    
        // Nanoleaf Canada Limited
        #expect(CompanyIdentifier.nanoleafCanada.rawValue == 2059)
        #expect(CompanyIdentifier.nanoleafCanada.name == #"Nanoleaf Canada Limited"#)
        #expect(CompanyIdentifier.nanoleafCanada.description == #"Nanoleaf Canada Limited"#)
    
        // Ingy B.V.
        #expect(CompanyIdentifier.ingy.rawValue == 2060)
        #expect(CompanyIdentifier.ingy.name == #"Ingy B.V."#)
        #expect(CompanyIdentifier.ingy.description == #"Ingy B.V."#)
    
        // Azbil Co.
        #expect(CompanyIdentifier.azbil.rawValue == 2061)
        #expect(CompanyIdentifier.azbil.name == #"Azbil Co."#)
        #expect(CompanyIdentifier.azbil.description == #"Azbil Co."#)
    
        // TATTCOM LLC
        #expect(CompanyIdentifier.tattcom.rawValue == 2062)
        #expect(CompanyIdentifier.tattcom.name == #"TATTCOM LLC"#)
        #expect(CompanyIdentifier.tattcom.description == #"TATTCOM LLC"#)
    
        // Paradox Engineering SA
        #expect(CompanyIdentifier.paradoxEngineering.rawValue == 2063)
        #expect(CompanyIdentifier.paradoxEngineering.name == #"Paradox Engineering SA"#)
        #expect(CompanyIdentifier.paradoxEngineering.description == #"Paradox Engineering SA"#)
    
        // LECO Corporation
        #expect(CompanyIdentifier.leco.rawValue == 2064)
        #expect(CompanyIdentifier.leco.name == #"LECO Corporation"#)
        #expect(CompanyIdentifier.leco.description == #"LECO Corporation"#)
    
        // Becker Antriebe GmbH
        #expect(CompanyIdentifier.beckerAntriebe.rawValue == 2065)
        #expect(CompanyIdentifier.beckerAntriebe.name == #"Becker Antriebe GmbH"#)
        #expect(CompanyIdentifier.beckerAntriebe.description == #"Becker Antriebe GmbH"#)
    
        // Mstream Technologies., Inc.
        #expect(CompanyIdentifier.mstreamTechnologies.rawValue == 2066)
        #expect(CompanyIdentifier.mstreamTechnologies.name == #"Mstream Technologies., Inc."#)
        #expect(CompanyIdentifier.mstreamTechnologies.description == #"Mstream Technologies., Inc."#)
    
        // Flextronics International USA Inc.
        #expect(CompanyIdentifier.flextronicsInternational.rawValue == 2067)
        #expect(CompanyIdentifier.flextronicsInternational.name == #"Flextronics International USA Inc."#)
        #expect(CompanyIdentifier.flextronicsInternational.description == #"Flextronics International USA Inc."#)
    
        // Ossur hf.
        #expect(CompanyIdentifier.ossurHf.rawValue == 2068)
        #expect(CompanyIdentifier.ossurHf.name == #"Ossur hf."#)
        #expect(CompanyIdentifier.ossurHf.description == #"Ossur hf."#)
    
        // SKC Inc
        #expect(CompanyIdentifier.skc.rawValue == 2069)
        #expect(CompanyIdentifier.skc.name == #"SKC Inc"#)
        #expect(CompanyIdentifier.skc.description == #"SKC Inc"#)
    
        // SPICA SYSTEMS LLC
        #expect(CompanyIdentifier.spicaSystems.rawValue == 2070)
        #expect(CompanyIdentifier.spicaSystems.name == #"SPICA SYSTEMS LLC"#)
        #expect(CompanyIdentifier.spicaSystems.description == #"SPICA SYSTEMS LLC"#)
    
        // Wangs Alliance Corporation
        #expect(CompanyIdentifier.wangsAlliance.rawValue == 2071)
        #expect(CompanyIdentifier.wangsAlliance.name == #"Wangs Alliance Corporation"#)
        #expect(CompanyIdentifier.wangsAlliance.description == #"Wangs Alliance Corporation"#)
    
        // tatwah SA
        #expect(CompanyIdentifier.tatwah.rawValue == 2072)
        #expect(CompanyIdentifier.tatwah.name == #"tatwah SA"#)
        #expect(CompanyIdentifier.tatwah.description == #"tatwah SA"#)
    
        // Hunter Douglas Inc
        #expect(CompanyIdentifier.hunterDouglas.rawValue == 2073)
        #expect(CompanyIdentifier.hunterDouglas.name == #"Hunter Douglas Inc"#)
        #expect(CompanyIdentifier.hunterDouglas.description == #"Hunter Douglas Inc"#)
    
        // Shenzhen Conex
        #expect(CompanyIdentifier.shenzhenConex.rawValue == 2074)
        #expect(CompanyIdentifier.shenzhenConex.name == #"Shenzhen Conex"#)
        #expect(CompanyIdentifier.shenzhenConex.description == #"Shenzhen Conex"#)
    
        // DIM3
        #expect(CompanyIdentifier.dim3.rawValue == 2075)
        #expect(CompanyIdentifier.dim3.name == #"DIM3"#)
        #expect(CompanyIdentifier.dim3.description == #"DIM3"#)
    
        // Bobrick Washroom Equipment, Inc.
        #expect(CompanyIdentifier.bobrickWashroomEquipment.rawValue == 2076)
        #expect(CompanyIdentifier.bobrickWashroomEquipment.name == #"Bobrick Washroom Equipment, Inc."#)
        #expect(CompanyIdentifier.bobrickWashroomEquipment.description == #"Bobrick Washroom Equipment, Inc."#)
    
        // Potrykus Holdings and Development LLC
        #expect(CompanyIdentifier.potrykusHoldingsAndDevelopment.rawValue == 2077)
        #expect(CompanyIdentifier.potrykusHoldingsAndDevelopment.name == #"Potrykus Holdings and Development LLC"#)
        #expect(CompanyIdentifier.potrykusHoldingsAndDevelopment.description == #"Potrykus Holdings and Development LLC"#)
    
        // iNFORM Technology GmbH
        #expect(CompanyIdentifier.informTechnology.rawValue == 2078)
        #expect(CompanyIdentifier.informTechnology.name == #"iNFORM Technology GmbH"#)
        #expect(CompanyIdentifier.informTechnology.description == #"iNFORM Technology GmbH"#)
    
        // eSenseLab LTD
        #expect(CompanyIdentifier.esenselab.rawValue == 2079)
        #expect(CompanyIdentifier.esenselab.name == #"eSenseLab LTD"#)
        #expect(CompanyIdentifier.esenselab.description == #"eSenseLab LTD"#)
    
        // Brilliant Home Technology, Inc.
        #expect(CompanyIdentifier.brilliantHomeTechnology.rawValue == 2080)
        #expect(CompanyIdentifier.brilliantHomeTechnology.name == #"Brilliant Home Technology, Inc."#)
        #expect(CompanyIdentifier.brilliantHomeTechnology.description == #"Brilliant Home Technology, Inc."#)
    
        // INOVA Geophysical, Inc.
        #expect(CompanyIdentifier.inovaGeophysical.rawValue == 2081)
        #expect(CompanyIdentifier.inovaGeophysical.name == #"INOVA Geophysical, Inc."#)
        #expect(CompanyIdentifier.inovaGeophysical.description == #"INOVA Geophysical, Inc."#)
    
        // adafruit industries
        #expect(CompanyIdentifier.adafruitIndustries.rawValue == 2082)
        #expect(CompanyIdentifier.adafruitIndustries.name == #"adafruit industries"#)
        #expect(CompanyIdentifier.adafruitIndustries.description == #"adafruit industries"#)
    
        // Nexite Ltd
        #expect(CompanyIdentifier.nexite.rawValue == 2083)
        #expect(CompanyIdentifier.nexite.name == #"Nexite Ltd"#)
        #expect(CompanyIdentifier.nexite.description == #"Nexite Ltd"#)
    
        // 8Power Limited
        #expect(CompanyIdentifier.company8Power.rawValue == 2084)
        #expect(CompanyIdentifier.company8Power.name == #"8Power Limited"#)
        #expect(CompanyIdentifier.company8Power.description == #"8Power Limited"#)
    
        // CME PTE. LTD.
        #expect(CompanyIdentifier.cmePte.rawValue == 2085)
        #expect(CompanyIdentifier.cmePte.name == #"CME PTE. LTD."#)
        #expect(CompanyIdentifier.cmePte.description == #"CME PTE. LTD."#)
    
        // Hyundai Motor Company
        #expect(CompanyIdentifier.hyundaiMotor.rawValue == 2086)
        #expect(CompanyIdentifier.hyundaiMotor.name == #"Hyundai Motor Company"#)
        #expect(CompanyIdentifier.hyundaiMotor.description == #"Hyundai Motor Company"#)
    
        // Kickmaker
        #expect(CompanyIdentifier.kickmaker.rawValue == 2087)
        #expect(CompanyIdentifier.kickmaker.name == #"Kickmaker"#)
        #expect(CompanyIdentifier.kickmaker.description == #"Kickmaker"#)
    
        // Shanghai Suisheng Information Technology Co., Ltd.
        #expect(CompanyIdentifier.shanghaiSuishengInformationTechnology.rawValue == 2088)
        #expect(CompanyIdentifier.shanghaiSuishengInformationTechnology.name == #"Shanghai Suisheng Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiSuishengInformationTechnology.description == #"Shanghai Suisheng Information Technology Co., Ltd."#)
    
        // HEXAGON METROLOGY DIVISION ROMER
        #expect(CompanyIdentifier.hexagonMetrologyDivisionRomer.rawValue == 2089)
        #expect(CompanyIdentifier.hexagonMetrologyDivisionRomer.name == #"HEXAGON METROLOGY DIVISION ROMER"#)
        #expect(CompanyIdentifier.hexagonMetrologyDivisionRomer.description == #"HEXAGON METROLOGY DIVISION ROMER"#)
    
        // Mitutoyo Corporation
        #expect(CompanyIdentifier.mitutoyo.rawValue == 2090)
        #expect(CompanyIdentifier.mitutoyo.name == #"Mitutoyo Corporation"#)
        #expect(CompanyIdentifier.mitutoyo.description == #"Mitutoyo Corporation"#)
    
        // shenzhen fitcare electronics Co.,Ltd
        #expect(CompanyIdentifier.shenzhenFitcareElectronics.rawValue == 2091)
        #expect(CompanyIdentifier.shenzhenFitcareElectronics.name == #"shenzhen fitcare electronics Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenFitcareElectronics.description == #"shenzhen fitcare electronics Co.,Ltd"#)
    
        // INGICS TECHNOLOGY CO., LTD.
        #expect(CompanyIdentifier.ingicsTechnology.rawValue == 2092)
        #expect(CompanyIdentifier.ingicsTechnology.name == #"INGICS TECHNOLOGY CO., LTD."#)
        #expect(CompanyIdentifier.ingicsTechnology.description == #"INGICS TECHNOLOGY CO., LTD."#)
    
        // INCUS PERFORMANCE LTD.
        #expect(CompanyIdentifier.incusPerformance.rawValue == 2093)
        #expect(CompanyIdentifier.incusPerformance.name == #"INCUS PERFORMANCE LTD."#)
        #expect(CompanyIdentifier.incusPerformance.description == #"INCUS PERFORMANCE LTD."#)
    
        // ABB S.p.A.
        #expect(CompanyIdentifier.abb2.rawValue == 2094)
        #expect(CompanyIdentifier.abb2.name == #"ABB S.p.A."#)
        #expect(CompanyIdentifier.abb2.description == #"ABB S.p.A."#)
    
        // Blippit AB
        #expect(CompanyIdentifier.blippit.rawValue == 2095)
        #expect(CompanyIdentifier.blippit.name == #"Blippit AB"#)
        #expect(CompanyIdentifier.blippit.description == #"Blippit AB"#)
    
        // Core Health and Fitness LLC
        #expect(CompanyIdentifier.coreHealthAndFitness.rawValue == 2096)
        #expect(CompanyIdentifier.coreHealthAndFitness.name == #"Core Health and Fitness LLC"#)
        #expect(CompanyIdentifier.coreHealthAndFitness.description == #"Core Health and Fitness LLC"#)
    
        // Foxble, LLC
        #expect(CompanyIdentifier.foxble.rawValue == 2097)
        #expect(CompanyIdentifier.foxble.name == #"Foxble, LLC"#)
        #expect(CompanyIdentifier.foxble.description == #"Foxble, LLC"#)
    
        // Intermotive,Inc.
        #expect(CompanyIdentifier.intermotive.rawValue == 2098)
        #expect(CompanyIdentifier.intermotive.name == #"Intermotive,Inc."#)
        #expect(CompanyIdentifier.intermotive.description == #"Intermotive,Inc."#)
    
        // Conneqtech B.V.
        #expect(CompanyIdentifier.conneqtech.rawValue == 2099)
        #expect(CompanyIdentifier.conneqtech.name == #"Conneqtech B.V."#)
        #expect(CompanyIdentifier.conneqtech.description == #"Conneqtech B.V."#)
    
        // RIKEN KEIKI CO., LTD.,
        #expect(CompanyIdentifier.rikenKeiki.rawValue == 2100)
        #expect(CompanyIdentifier.rikenKeiki.name == #"RIKEN KEIKI CO., LTD.,"#)
        #expect(CompanyIdentifier.rikenKeiki.description == #"RIKEN KEIKI CO., LTD.,"#)
    
        // Canopy Growth Corporation
        #expect(CompanyIdentifier.canopyGrowth.rawValue == 2101)
        #expect(CompanyIdentifier.canopyGrowth.name == #"Canopy Growth Corporation"#)
        #expect(CompanyIdentifier.canopyGrowth.description == #"Canopy Growth Corporation"#)
    
        // Bitwards Oy
        #expect(CompanyIdentifier.bitwards.rawValue == 2102)
        #expect(CompanyIdentifier.bitwards.name == #"Bitwards Oy"#)
        #expect(CompanyIdentifier.bitwards.description == #"Bitwards Oy"#)
    
        // vivo Mobile Communication Co., Ltd.
        #expect(CompanyIdentifier.vivoMobileCommunication.rawValue == 2103)
        #expect(CompanyIdentifier.vivoMobileCommunication.name == #"vivo Mobile Communication Co., Ltd."#)
        #expect(CompanyIdentifier.vivoMobileCommunication.description == #"vivo Mobile Communication Co., Ltd."#)
    
        // Etymotic Research, Inc.
        #expect(CompanyIdentifier.etymoticResearch.rawValue == 2104)
        #expect(CompanyIdentifier.etymoticResearch.name == #"Etymotic Research, Inc."#)
        #expect(CompanyIdentifier.etymoticResearch.description == #"Etymotic Research, Inc."#)
    
        // A puissance 3
        #expect(CompanyIdentifier.aPuissance3.rawValue == 2105)
        #expect(CompanyIdentifier.aPuissance3.name == #"A puissance 3"#)
        #expect(CompanyIdentifier.aPuissance3.description == #"A puissance 3"#)
    
        // BPW Bergische Achsen Kommanditgesellschaft
        #expect(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.rawValue == 2106)
        #expect(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.name == #"BPW Bergische Achsen Kommanditgesellschaft"#)
        #expect(CompanyIdentifier.bpwBergischeAchsenKommanditgesellschaft.description == #"BPW Bergische Achsen Kommanditgesellschaft"#)
    
        // Piaggio Fast Forward
        #expect(CompanyIdentifier.piaggioFastForward.rawValue == 2107)
        #expect(CompanyIdentifier.piaggioFastForward.name == #"Piaggio Fast Forward"#)
        #expect(CompanyIdentifier.piaggioFastForward.description == #"Piaggio Fast Forward"#)
    
        // BeerTech LTD
        #expect(CompanyIdentifier.beertech.rawValue == 2108)
        #expect(CompanyIdentifier.beertech.name == #"BeerTech LTD"#)
        #expect(CompanyIdentifier.beertech.description == #"BeerTech LTD"#)
    
        // Tokenize, Inc.
        #expect(CompanyIdentifier.tokenize.rawValue == 2109)
        #expect(CompanyIdentifier.tokenize.name == #"Tokenize, Inc."#)
        #expect(CompanyIdentifier.tokenize.description == #"Tokenize, Inc."#)
    
        // Zorachka LTD
        #expect(CompanyIdentifier.zorachka.rawValue == 2110)
        #expect(CompanyIdentifier.zorachka.name == #"Zorachka LTD"#)
        #expect(CompanyIdentifier.zorachka.description == #"Zorachka LTD"#)
    
        // D-Link Corp.
        #expect(CompanyIdentifier.dLink.rawValue == 2111)
        #expect(CompanyIdentifier.dLink.name == #"D-Link Corp."#)
        #expect(CompanyIdentifier.dLink.description == #"D-Link Corp."#)
    
        // Down Range Systems LLC
        #expect(CompanyIdentifier.downRangeSystems.rawValue == 2112)
        #expect(CompanyIdentifier.downRangeSystems.name == #"Down Range Systems LLC"#)
        #expect(CompanyIdentifier.downRangeSystems.description == #"Down Range Systems LLC"#)
    
        // General Luminaire (Shanghai) Co., Ltd.
        #expect(CompanyIdentifier.generalLuminaireShanghai.rawValue == 2113)
        #expect(CompanyIdentifier.generalLuminaireShanghai.name == #"General Luminaire (Shanghai) Co., Ltd."#)
        #expect(CompanyIdentifier.generalLuminaireShanghai.description == #"General Luminaire (Shanghai) Co., Ltd."#)
    
        // Tangshan HongJia electronic technology co., LTD.
        #expect(CompanyIdentifier.tangshanHongjiaElectronicTechnology.rawValue == 2114)
        #expect(CompanyIdentifier.tangshanHongjiaElectronicTechnology.name == #"Tangshan HongJia electronic technology co., LTD."#)
        #expect(CompanyIdentifier.tangshanHongjiaElectronicTechnology.description == #"Tangshan HongJia electronic technology co., LTD."#)
    
        // FRAGRANCE DELIVERY TECHNOLOGIES LTD
        #expect(CompanyIdentifier.fragranceDeliveryTechnologies.rawValue == 2115)
        #expect(CompanyIdentifier.fragranceDeliveryTechnologies.name == #"FRAGRANCE DELIVERY TECHNOLOGIES LTD"#)
        #expect(CompanyIdentifier.fragranceDeliveryTechnologies.description == #"FRAGRANCE DELIVERY TECHNOLOGIES LTD"#)
    
        // Pepperl + Fuchs GmbH
        #expect(CompanyIdentifier.pepperlFuchs.rawValue == 2116)
        #expect(CompanyIdentifier.pepperlFuchs.name == #"Pepperl + Fuchs GmbH"#)
        #expect(CompanyIdentifier.pepperlFuchs.description == #"Pepperl + Fuchs GmbH"#)
    
        // Dometic Corporation
        #expect(CompanyIdentifier.dometic.rawValue == 2117)
        #expect(CompanyIdentifier.dometic.name == #"Dometic Corporation"#)
        #expect(CompanyIdentifier.dometic.description == #"Dometic Corporation"#)
    
        // USound GmbH
        #expect(CompanyIdentifier.usound.rawValue == 2118)
        #expect(CompanyIdentifier.usound.name == #"USound GmbH"#)
        #expect(CompanyIdentifier.usound.description == #"USound GmbH"#)
    
        // DNANUDGE LIMITED
        #expect(CompanyIdentifier.dnanudge.rawValue == 2119)
        #expect(CompanyIdentifier.dnanudge.name == #"DNANUDGE LIMITED"#)
        #expect(CompanyIdentifier.dnanudge.description == #"DNANUDGE LIMITED"#)
    
        // JUJU JOINTS CANADA CORP.
        #expect(CompanyIdentifier.jujuJointsCanada.rawValue == 2120)
        #expect(CompanyIdentifier.jujuJointsCanada.name == #"JUJU JOINTS CANADA CORP."#)
        #expect(CompanyIdentifier.jujuJointsCanada.description == #"JUJU JOINTS CANADA CORP."#)
    
        // Dopple Technologies B.V.
        #expect(CompanyIdentifier.doppleTechnologies.rawValue == 2121)
        #expect(CompanyIdentifier.doppleTechnologies.name == #"Dopple Technologies B.V."#)
        #expect(CompanyIdentifier.doppleTechnologies.description == #"Dopple Technologies B.V."#)
    
        // ARCOM
        #expect(CompanyIdentifier.arcom.rawValue == 2122)
        #expect(CompanyIdentifier.arcom.name == #"ARCOM"#)
        #expect(CompanyIdentifier.arcom.description == #"ARCOM"#)
    
        // Biotechware SRL
        #expect(CompanyIdentifier.biotechware.rawValue == 2123)
        #expect(CompanyIdentifier.biotechware.name == #"Biotechware SRL"#)
        #expect(CompanyIdentifier.biotechware.description == #"Biotechware SRL"#)
    
        // ORSO Inc.
        #expect(CompanyIdentifier.orso.rawValue == 2124)
        #expect(CompanyIdentifier.orso.name == #"ORSO Inc."#)
        #expect(CompanyIdentifier.orso.description == #"ORSO Inc."#)
    
        // SafePort
        #expect(CompanyIdentifier.safeport.rawValue == 2125)
        #expect(CompanyIdentifier.safeport.name == #"SafePort"#)
        #expect(CompanyIdentifier.safeport.description == #"SafePort"#)
    
        // Carol Cole Company
        #expect(CompanyIdentifier.carolCole.rawValue == 2126)
        #expect(CompanyIdentifier.carolCole.name == #"Carol Cole Company"#)
        #expect(CompanyIdentifier.carolCole.description == #"Carol Cole Company"#)
    
        // Embedded Fitness B.V.
        #expect(CompanyIdentifier.embeddedFitness.rawValue == 2127)
        #expect(CompanyIdentifier.embeddedFitness.name == #"Embedded Fitness B.V."#)
        #expect(CompanyIdentifier.embeddedFitness.description == #"Embedded Fitness B.V."#)
    
        // Yealink (Xiamen) Network Technology Co.,LTD
        #expect(CompanyIdentifier.yealinkXiamenNetworkTechnology.rawValue == 2128)
        #expect(CompanyIdentifier.yealinkXiamenNetworkTechnology.name == #"Yealink (Xiamen) Network Technology Co.,LTD"#)
        #expect(CompanyIdentifier.yealinkXiamenNetworkTechnology.description == #"Yealink (Xiamen) Network Technology Co.,LTD"#)
    
        // Subeca, Inc.
        #expect(CompanyIdentifier.subeca.rawValue == 2129)
        #expect(CompanyIdentifier.subeca.name == #"Subeca, Inc."#)
        #expect(CompanyIdentifier.subeca.description == #"Subeca, Inc."#)
    
        // Cognosos, Inc.
        #expect(CompanyIdentifier.cognosos.rawValue == 2130)
        #expect(CompanyIdentifier.cognosos.name == #"Cognosos, Inc."#)
        #expect(CompanyIdentifier.cognosos.description == #"Cognosos, Inc."#)
    
        // Pektron Group Limited
        #expect(CompanyIdentifier.pektronGroup.rawValue == 2131)
        #expect(CompanyIdentifier.pektronGroup.name == #"Pektron Group Limited"#)
        #expect(CompanyIdentifier.pektronGroup.description == #"Pektron Group Limited"#)
    
        // Tap Sound System
        #expect(CompanyIdentifier.tapSoundSystem.rawValue == 2132)
        #expect(CompanyIdentifier.tapSoundSystem.name == #"Tap Sound System"#)
        #expect(CompanyIdentifier.tapSoundSystem.description == #"Tap Sound System"#)
    
        // Helios Sports, Inc.
        #expect(CompanyIdentifier.heliosSports.rawValue == 2133)
        #expect(CompanyIdentifier.heliosSports.name == #"Helios Sports, Inc."#)
        #expect(CompanyIdentifier.heliosSports.description == #"Helios Sports, Inc."#)
    
        // Canopy Growth Corporation
        #expect(CompanyIdentifier.canopyGrowth2.rawValue == 2134)
        #expect(CompanyIdentifier.canopyGrowth2.name == #"Canopy Growth Corporation"#)
        #expect(CompanyIdentifier.canopyGrowth2.description == #"Canopy Growth Corporation"#)
    
        // Parsyl Inc
        #expect(CompanyIdentifier.parsyl.rawValue == 2135)
        #expect(CompanyIdentifier.parsyl.name == #"Parsyl Inc"#)
        #expect(CompanyIdentifier.parsyl.description == #"Parsyl Inc"#)
    
        // SOUNDBOKS
        #expect(CompanyIdentifier.soundboks.rawValue == 2136)
        #expect(CompanyIdentifier.soundboks.name == #"SOUNDBOKS"#)
        #expect(CompanyIdentifier.soundboks.description == #"SOUNDBOKS"#)
    
        // BlueUp
        #expect(CompanyIdentifier.blueup.rawValue == 2137)
        #expect(CompanyIdentifier.blueup.name == #"BlueUp"#)
        #expect(CompanyIdentifier.blueup.description == #"BlueUp"#)
    
        // DAKATECH
        #expect(CompanyIdentifier.dakatech.rawValue == 2138)
        #expect(CompanyIdentifier.dakatech.name == #"DAKATECH"#)
        #expect(CompanyIdentifier.dakatech.description == #"DAKATECH"#)
    
        // Nisshinbo Micro Devices Inc.
        #expect(CompanyIdentifier.nisshinboMicroDevices.rawValue == 2139)
        #expect(CompanyIdentifier.nisshinboMicroDevices.name == #"Nisshinbo Micro Devices Inc."#)
        #expect(CompanyIdentifier.nisshinboMicroDevices.description == #"Nisshinbo Micro Devices Inc."#)
    
        // ACOS CO.,LTD.
        #expect(CompanyIdentifier.acos.rawValue == 2140)
        #expect(CompanyIdentifier.acos.name == #"ACOS CO.,LTD."#)
        #expect(CompanyIdentifier.acos.description == #"ACOS CO.,LTD."#)
    
        // Guilin Zhishen Information Technology Co.,Ltd.
        #expect(CompanyIdentifier.guilinZhishenInformationTechnology.rawValue == 2141)
        #expect(CompanyIdentifier.guilinZhishenInformationTechnology.name == #"Guilin Zhishen Information Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.guilinZhishenInformationTechnology.description == #"Guilin Zhishen Information Technology Co.,Ltd."#)
    
        // Krog Systems LLC
        #expect(CompanyIdentifier.krogSystems.rawValue == 2142)
        #expect(CompanyIdentifier.krogSystems.name == #"Krog Systems LLC"#)
        #expect(CompanyIdentifier.krogSystems.description == #"Krog Systems LLC"#)
    
        // COMPEGPS TEAM,SOCIEDAD LIMITADA
        #expect(CompanyIdentifier.compegpsTeamSociedadLimitada.rawValue == 2143)
        #expect(CompanyIdentifier.compegpsTeamSociedadLimitada.name == #"COMPEGPS TEAM,SOCIEDAD LIMITADA"#)
        #expect(CompanyIdentifier.compegpsTeamSociedadLimitada.description == #"COMPEGPS TEAM,SOCIEDAD LIMITADA"#)
    
        // Alflex Products B.V.
        #expect(CompanyIdentifier.alflexProducts.rawValue == 2144)
        #expect(CompanyIdentifier.alflexProducts.name == #"Alflex Products B.V."#)
        #expect(CompanyIdentifier.alflexProducts.description == #"Alflex Products B.V."#)
    
        // SmartSensor Labs Ltd
        #expect(CompanyIdentifier.smartsensorLabs.rawValue == 2145)
        #expect(CompanyIdentifier.smartsensorLabs.name == #"SmartSensor Labs Ltd"#)
        #expect(CompanyIdentifier.smartsensorLabs.description == #"SmartSensor Labs Ltd"#)
    
        // SmartDrive
        #expect(CompanyIdentifier.smartdrive.rawValue == 2146)
        #expect(CompanyIdentifier.smartdrive.name == #"SmartDrive"#)
        #expect(CompanyIdentifier.smartdrive.description == #"SmartDrive"#)
    
        // Yo-tronics Technology Co., Ltd.
        #expect(CompanyIdentifier.yoTronicsTechnology.rawValue == 2147)
        #expect(CompanyIdentifier.yoTronicsTechnology.name == #"Yo-tronics Technology Co., Ltd."#)
        #expect(CompanyIdentifier.yoTronicsTechnology.description == #"Yo-tronics Technology Co., Ltd."#)
    
        // Rafaelmicro
        #expect(CompanyIdentifier.rafaelmicro.rawValue == 2148)
        #expect(CompanyIdentifier.rafaelmicro.name == #"Rafaelmicro"#)
        #expect(CompanyIdentifier.rafaelmicro.description == #"Rafaelmicro"#)
    
        // Emergency Lighting Products Limited
        #expect(CompanyIdentifier.emergencyLightingProducts.rawValue == 2149)
        #expect(CompanyIdentifier.emergencyLightingProducts.name == #"Emergency Lighting Products Limited"#)
        #expect(CompanyIdentifier.emergencyLightingProducts.description == #"Emergency Lighting Products Limited"#)
    
        // LAONZ Co.,Ltd
        #expect(CompanyIdentifier.laonz.rawValue == 2150)
        #expect(CompanyIdentifier.laonz.name == #"LAONZ Co.,Ltd"#)
        #expect(CompanyIdentifier.laonz.description == #"LAONZ Co.,Ltd"#)
    
        // Western Digital Techologies, Inc.
        #expect(CompanyIdentifier.westernDigitalTechologies.rawValue == 2151)
        #expect(CompanyIdentifier.westernDigitalTechologies.name == #"Western Digital Techologies, Inc."#)
        #expect(CompanyIdentifier.westernDigitalTechologies.description == #"Western Digital Techologies, Inc."#)
    
        // WIOsense GmbH & Co. KG
        #expect(CompanyIdentifier.wiosense.rawValue == 2152)
        #expect(CompanyIdentifier.wiosense.name == #"WIOsense GmbH & Co. KG"#)
        #expect(CompanyIdentifier.wiosense.description == #"WIOsense GmbH & Co. KG"#)
    
        // EVVA Sicherheitstechnologie GmbH
        #expect(CompanyIdentifier.evvaSicherheitstechnologie.rawValue == 2153)
        #expect(CompanyIdentifier.evvaSicherheitstechnologie.name == #"EVVA Sicherheitstechnologie GmbH"#)
        #expect(CompanyIdentifier.evvaSicherheitstechnologie.description == #"EVVA Sicherheitstechnologie GmbH"#)
    
        // Odic Incorporated
        #expect(CompanyIdentifier.odic.rawValue == 2154)
        #expect(CompanyIdentifier.odic.name == #"Odic Incorporated"#)
        #expect(CompanyIdentifier.odic.description == #"Odic Incorporated"#)
    
        // Pacific Track, LLC
        #expect(CompanyIdentifier.pacificTrack.rawValue == 2155)
        #expect(CompanyIdentifier.pacificTrack.name == #"Pacific Track, LLC"#)
        #expect(CompanyIdentifier.pacificTrack.description == #"Pacific Track, LLC"#)
    
        // Revvo Technologies, Inc.
        #expect(CompanyIdentifier.revvoTechnologies.rawValue == 2156)
        #expect(CompanyIdentifier.revvoTechnologies.name == #"Revvo Technologies, Inc."#)
        #expect(CompanyIdentifier.revvoTechnologies.description == #"Revvo Technologies, Inc."#)
    
        // Biometrika d.o.o.
        #expect(CompanyIdentifier.biometrika.rawValue == 2157)
        #expect(CompanyIdentifier.biometrika.name == #"Biometrika d.o.o."#)
        #expect(CompanyIdentifier.biometrika.description == #"Biometrika d.o.o."#)
    
        // Vorwerk Elektrowerke GmbH & Co. KG
        #expect(CompanyIdentifier.vorwerkElektrowerke.rawValue == 2158)
        #expect(CompanyIdentifier.vorwerkElektrowerke.name == #"Vorwerk Elektrowerke GmbH & Co. KG"#)
        #expect(CompanyIdentifier.vorwerkElektrowerke.description == #"Vorwerk Elektrowerke GmbH & Co. KG"#)
    
        // Trackunit A/S
        #expect(CompanyIdentifier.trackunit.rawValue == 2159)
        #expect(CompanyIdentifier.trackunit.name == #"Trackunit A/S"#)
        #expect(CompanyIdentifier.trackunit.description == #"Trackunit A/S"#)
    
        // Wyze Labs, Inc
        #expect(CompanyIdentifier.wyzeLabs.rawValue == 2160)
        #expect(CompanyIdentifier.wyzeLabs.name == #"Wyze Labs, Inc"#)
        #expect(CompanyIdentifier.wyzeLabs.description == #"Wyze Labs, Inc"#)
    
        // Dension Elektronikai Kft.
        #expect(CompanyIdentifier.densionElektronikai.rawValue == 2161)
        #expect(CompanyIdentifier.densionElektronikai.name == #"Dension Elektronikai Kft."#)
        #expect(CompanyIdentifier.densionElektronikai.description == #"Dension Elektronikai Kft."#)
    
        // 11 Health & Technologies Limited
        #expect(CompanyIdentifier.company11HealthTechnologies.rawValue == 2162)
        #expect(CompanyIdentifier.company11HealthTechnologies.name == #"11 Health & Technologies Limited"#)
        #expect(CompanyIdentifier.company11HealthTechnologies.description == #"11 Health & Technologies Limited"#)
    
        // Innophase Incorporated
        #expect(CompanyIdentifier.innophase.rawValue == 2163)
        #expect(CompanyIdentifier.innophase.name == #"Innophase Incorporated"#)
        #expect(CompanyIdentifier.innophase.description == #"Innophase Incorporated"#)
    
        // Treegreen Limited
        #expect(CompanyIdentifier.treegreen.rawValue == 2164)
        #expect(CompanyIdentifier.treegreen.name == #"Treegreen Limited"#)
        #expect(CompanyIdentifier.treegreen.description == #"Treegreen Limited"#)
    
        // Berner International LLC
        #expect(CompanyIdentifier.bernerInternational.rawValue == 2165)
        #expect(CompanyIdentifier.bernerInternational.name == #"Berner International LLC"#)
        #expect(CompanyIdentifier.bernerInternational.description == #"Berner International LLC"#)
    
        // SmartResQ ApS
        #expect(CompanyIdentifier.smartresq.rawValue == 2166)
        #expect(CompanyIdentifier.smartresq.name == #"SmartResQ ApS"#)
        #expect(CompanyIdentifier.smartresq.description == #"SmartResQ ApS"#)
    
        // Tome, Inc.
        #expect(CompanyIdentifier.tome.rawValue == 2167)
        #expect(CompanyIdentifier.tome.name == #"Tome, Inc."#)
        #expect(CompanyIdentifier.tome.description == #"Tome, Inc."#)
    
        // The Chamberlain Group, Inc.
        #expect(CompanyIdentifier.chamberlainGroup.rawValue == 2168)
        #expect(CompanyIdentifier.chamberlainGroup.name == #"The Chamberlain Group, Inc."#)
        #expect(CompanyIdentifier.chamberlainGroup.description == #"The Chamberlain Group, Inc."#)
    
        // MIZUNO Corporation
        #expect(CompanyIdentifier.mizuno.rawValue == 2169)
        #expect(CompanyIdentifier.mizuno.name == #"MIZUNO Corporation"#)
        #expect(CompanyIdentifier.mizuno.description == #"MIZUNO Corporation"#)
    
        // ZRF, LLC
        #expect(CompanyIdentifier.zrf.rawValue == 2170)
        #expect(CompanyIdentifier.zrf.name == #"ZRF, LLC"#)
        #expect(CompanyIdentifier.zrf.description == #"ZRF, LLC"#)
    
        // BYSTAMP
        #expect(CompanyIdentifier.bystamp.rawValue == 2171)
        #expect(CompanyIdentifier.bystamp.name == #"BYSTAMP"#)
        #expect(CompanyIdentifier.bystamp.description == #"BYSTAMP"#)
    
        // Crosscan GmbH
        #expect(CompanyIdentifier.crosscan.rawValue == 2172)
        #expect(CompanyIdentifier.crosscan.name == #"Crosscan GmbH"#)
        #expect(CompanyIdentifier.crosscan.description == #"Crosscan GmbH"#)
    
        // Konftel AB
        #expect(CompanyIdentifier.konftel.rawValue == 2173)
        #expect(CompanyIdentifier.konftel.name == #"Konftel AB"#)
        #expect(CompanyIdentifier.konftel.description == #"Konftel AB"#)
    
        // 1bar.net Limited
        #expect(CompanyIdentifier.company1BarNet.rawValue == 2174)
        #expect(CompanyIdentifier.company1BarNet.name == #"1bar.net Limited"#)
        #expect(CompanyIdentifier.company1BarNet.description == #"1bar.net Limited"#)
    
        // Phillips Connect Technologies LLC
        #expect(CompanyIdentifier.phillipsConnectTechnologies.rawValue == 2175)
        #expect(CompanyIdentifier.phillipsConnectTechnologies.name == #"Phillips Connect Technologies LLC"#)
        #expect(CompanyIdentifier.phillipsConnectTechnologies.description == #"Phillips Connect Technologies LLC"#)
    
        // imagiLabs AB
        #expect(CompanyIdentifier.imagilabs.rawValue == 2176)
        #expect(CompanyIdentifier.imagilabs.name == #"imagiLabs AB"#)
        #expect(CompanyIdentifier.imagilabs.description == #"imagiLabs AB"#)
    
        // Optalert
        #expect(CompanyIdentifier.optalert.rawValue == 2177)
        #expect(CompanyIdentifier.optalert.name == #"Optalert"#)
        #expect(CompanyIdentifier.optalert.description == #"Optalert"#)
    
        // PSYONIC, Inc.
        #expect(CompanyIdentifier.psyonic.rawValue == 2178)
        #expect(CompanyIdentifier.psyonic.name == #"PSYONIC, Inc."#)
        #expect(CompanyIdentifier.psyonic.description == #"PSYONIC, Inc."#)
    
        // Wintersteiger AG
        #expect(CompanyIdentifier.wintersteiger.rawValue == 2179)
        #expect(CompanyIdentifier.wintersteiger.name == #"Wintersteiger AG"#)
        #expect(CompanyIdentifier.wintersteiger.description == #"Wintersteiger AG"#)
    
        // Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda
        #expect(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologia.rawValue == 2180)
        #expect(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologia.name == #"Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda"#)
        #expect(CompanyIdentifier.controlidIndustriaComercioDeHardwareEServicosDeTecnologia.description == #"Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda"#)
    
        // LEVOLOR INC
        #expect(CompanyIdentifier.levolor.rawValue == 2181)
        #expect(CompanyIdentifier.levolor.name == #"LEVOLOR INC"#)
        #expect(CompanyIdentifier.levolor.description == #"LEVOLOR INC"#)
    
        // Movella Technologies B.V.
        #expect(CompanyIdentifier.movellaTechnologies.rawValue == 2182)
        #expect(CompanyIdentifier.movellaTechnologies.name == #"Movella Technologies B.V."#)
        #expect(CompanyIdentifier.movellaTechnologies.description == #"Movella Technologies B.V."#)
    
        // Hydro-Gear Limited Partnership
        #expect(CompanyIdentifier.hydroGearPartnership.rawValue == 2183)
        #expect(CompanyIdentifier.hydroGearPartnership.name == #"Hydro-Gear Limited Partnership"#)
        #expect(CompanyIdentifier.hydroGearPartnership.description == #"Hydro-Gear Limited Partnership"#)
    
        // EnPointe Fencing Pty Ltd
        #expect(CompanyIdentifier.enpointeFencing.rawValue == 2184)
        #expect(CompanyIdentifier.enpointeFencing.name == #"EnPointe Fencing Pty Ltd"#)
        #expect(CompanyIdentifier.enpointeFencing.description == #"EnPointe Fencing Pty Ltd"#)
    
        // XANTHIO
        #expect(CompanyIdentifier.xanthio.rawValue == 2185)
        #expect(CompanyIdentifier.xanthio.name == #"XANTHIO"#)
        #expect(CompanyIdentifier.xanthio.description == #"XANTHIO"#)
    
        // sclak s.r.l.
        #expect(CompanyIdentifier.sclak.rawValue == 2186)
        #expect(CompanyIdentifier.sclak.name == #"sclak s.r.l."#)
        #expect(CompanyIdentifier.sclak.description == #"sclak s.r.l."#)
    
        // Tricorder Arraay Technologies LLC
        #expect(CompanyIdentifier.tricorderArraayTechnologies.rawValue == 2187)
        #expect(CompanyIdentifier.tricorderArraayTechnologies.name == #"Tricorder Arraay Technologies LLC"#)
        #expect(CompanyIdentifier.tricorderArraayTechnologies.description == #"Tricorder Arraay Technologies LLC"#)
    
        // GB Solution co.,Ltd
        #expect(CompanyIdentifier.gbSolution.rawValue == 2188)
        #expect(CompanyIdentifier.gbSolution.name == #"GB Solution co.,Ltd"#)
        #expect(CompanyIdentifier.gbSolution.description == #"GB Solution co.,Ltd"#)
    
        // Soliton Systems K.K.
        #expect(CompanyIdentifier.solitonSystemsKK.rawValue == 2189)
        #expect(CompanyIdentifier.solitonSystemsKK.name == #"Soliton Systems K.K."#)
        #expect(CompanyIdentifier.solitonSystemsKK.description == #"Soliton Systems K.K."#)
    
        // GIGA-TMS INC
        #expect(CompanyIdentifier.gigaTms.rawValue == 2190)
        #expect(CompanyIdentifier.gigaTms.name == #"GIGA-TMS INC"#)
        #expect(CompanyIdentifier.gigaTms.description == #"GIGA-TMS INC"#)
    
        // Tait International Limited
        #expect(CompanyIdentifier.taitInternational.rawValue == 2191)
        #expect(CompanyIdentifier.taitInternational.name == #"Tait International Limited"#)
        #expect(CompanyIdentifier.taitInternational.description == #"Tait International Limited"#)
    
        // NICHIEI INTEC CO., LTD.
        #expect(CompanyIdentifier.nichieiIntec.rawValue == 2192)
        #expect(CompanyIdentifier.nichieiIntec.name == #"NICHIEI INTEC CO., LTD."#)
        #expect(CompanyIdentifier.nichieiIntec.description == #"NICHIEI INTEC CO., LTD."#)
    
        // SmartWireless GmbH & Co. KG
        #expect(CompanyIdentifier.smartwireless.rawValue == 2193)
        #expect(CompanyIdentifier.smartwireless.name == #"SmartWireless GmbH & Co. KG"#)
        #expect(CompanyIdentifier.smartwireless.description == #"SmartWireless GmbH & Co. KG"#)
    
        // Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)
        #expect(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.rawValue == 2194)
        #expect(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.name == #"Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)"#)
        #expect(CompanyIdentifier.ingenieurbueroBirnfeldUgHaftungsbeschraenkt.description == #"Ingenieurbuero Birnfeld UG (haftungsbeschraenkt)"#)
    
        // Maytronics Ltd
        #expect(CompanyIdentifier.maytronics.rawValue == 2195)
        #expect(CompanyIdentifier.maytronics.name == #"Maytronics Ltd"#)
        #expect(CompanyIdentifier.maytronics.description == #"Maytronics Ltd"#)
    
        // EPIFIT
        #expect(CompanyIdentifier.epifit.rawValue == 2196)
        #expect(CompanyIdentifier.epifit.name == #"EPIFIT"#)
        #expect(CompanyIdentifier.epifit.description == #"EPIFIT"#)
    
        // Gimer medical
        #expect(CompanyIdentifier.gimerMedical.rawValue == 2197)
        #expect(CompanyIdentifier.gimerMedical.name == #"Gimer medical"#)
        #expect(CompanyIdentifier.gimerMedical.description == #"Gimer medical"#)
    
        // Nokian Renkaat Oyj
        #expect(CompanyIdentifier.nokianRenkaatj.rawValue == 2198)
        #expect(CompanyIdentifier.nokianRenkaatj.name == #"Nokian Renkaat Oyj"#)
        #expect(CompanyIdentifier.nokianRenkaatj.description == #"Nokian Renkaat Oyj"#)
    
        // Current Lighting Solutions LLC
        #expect(CompanyIdentifier.currentLightingSolutions.rawValue == 2199)
        #expect(CompanyIdentifier.currentLightingSolutions.name == #"Current Lighting Solutions LLC"#)
        #expect(CompanyIdentifier.currentLightingSolutions.description == #"Current Lighting Solutions LLC"#)
    
        // Sensibo, Inc.
        #expect(CompanyIdentifier.sensibo.rawValue == 2200)
        #expect(CompanyIdentifier.sensibo.name == #"Sensibo, Inc."#)
        #expect(CompanyIdentifier.sensibo.description == #"Sensibo, Inc."#)
    
        // SFS unimarket AG
        #expect(CompanyIdentifier.sfsUnimarket.rawValue == 2201)
        #expect(CompanyIdentifier.sfsUnimarket.name == #"SFS unimarket AG"#)
        #expect(CompanyIdentifier.sfsUnimarket.description == #"SFS unimarket AG"#)
    
        // Private limited company "Teltonika"
        #expect(CompanyIdentifier.teltonika.rawValue == 2202)
        #expect(CompanyIdentifier.teltonika.name == #"Private limited company "Teltonika""#)
        #expect(CompanyIdentifier.teltonika.description == #"Private limited company "Teltonika""#)
    
        // Saucon Technologies
        #expect(CompanyIdentifier.sauconTechnologies.rawValue == 2203)
        #expect(CompanyIdentifier.sauconTechnologies.name == #"Saucon Technologies"#)
        #expect(CompanyIdentifier.sauconTechnologies.description == #"Saucon Technologies"#)
    
        // Embedded Devices Co. Company
        #expect(CompanyIdentifier.embeddedDevices.rawValue == 2204)
        #expect(CompanyIdentifier.embeddedDevices.name == #"Embedded Devices Co. Company"#)
        #expect(CompanyIdentifier.embeddedDevices.description == #"Embedded Devices Co. Company"#)
    
        // J-J.A.D.E. Enterprise LLC
        #expect(CompanyIdentifier.jJADEEnterprise.rawValue == 2205)
        #expect(CompanyIdentifier.jJADEEnterprise.name == #"J-J.A.D.E. Enterprise LLC"#)
        #expect(CompanyIdentifier.jJADEEnterprise.description == #"J-J.A.D.E. Enterprise LLC"#)
    
        // i-SENS, inc.
        #expect(CompanyIdentifier.iSens.rawValue == 2206)
        #expect(CompanyIdentifier.iSens.name == #"i-SENS, inc."#)
        #expect(CompanyIdentifier.iSens.description == #"i-SENS, inc."#)
    
        // Witschi Electronic Ltd
        #expect(CompanyIdentifier.witschiElectronic.rawValue == 2207)
        #expect(CompanyIdentifier.witschiElectronic.name == #"Witschi Electronic Ltd"#)
        #expect(CompanyIdentifier.witschiElectronic.description == #"Witschi Electronic Ltd"#)
    
        // Aclara Technologies LLC
        #expect(CompanyIdentifier.aclaraTechnologies.rawValue == 2208)
        #expect(CompanyIdentifier.aclaraTechnologies.name == #"Aclara Technologies LLC"#)
        #expect(CompanyIdentifier.aclaraTechnologies.description == #"Aclara Technologies LLC"#)
    
        // EXEO TECH CORPORATION
        #expect(CompanyIdentifier.exeoTech.rawValue == 2209)
        #expect(CompanyIdentifier.exeoTech.name == #"EXEO TECH CORPORATION"#)
        #expect(CompanyIdentifier.exeoTech.description == #"EXEO TECH CORPORATION"#)
    
        // Epic Systems Co., Ltd.
        #expect(CompanyIdentifier.epicSystems.rawValue == 2210)
        #expect(CompanyIdentifier.epicSystems.name == #"Epic Systems Co., Ltd."#)
        #expect(CompanyIdentifier.epicSystems.description == #"Epic Systems Co., Ltd."#)
    
        // Hoffmann SE
        #expect(CompanyIdentifier.hoffmann.rawValue == 2211)
        #expect(CompanyIdentifier.hoffmann.name == #"Hoffmann SE"#)
        #expect(CompanyIdentifier.hoffmann.description == #"Hoffmann SE"#)
    
        // Realme Chongqing Mobile Telecommunications Corp., Ltd.
        #expect(CompanyIdentifier.realmeChongqingMobileTelecommunications.rawValue == 2212)
        #expect(CompanyIdentifier.realmeChongqingMobileTelecommunications.name == #"Realme Chongqing Mobile Telecommunications Corp., Ltd."#)
        #expect(CompanyIdentifier.realmeChongqingMobileTelecommunications.description == #"Realme Chongqing Mobile Telecommunications Corp., Ltd."#)
    
        // UMEHEAL Ltd
        #expect(CompanyIdentifier.umeheal.rawValue == 2213)
        #expect(CompanyIdentifier.umeheal.name == #"UMEHEAL Ltd"#)
        #expect(CompanyIdentifier.umeheal.description == #"UMEHEAL Ltd"#)
    
        // Intelligenceworks Inc.
        #expect(CompanyIdentifier.intelligenceworks.rawValue == 2214)
        #expect(CompanyIdentifier.intelligenceworks.name == #"Intelligenceworks Inc."#)
        #expect(CompanyIdentifier.intelligenceworks.description == #"Intelligenceworks Inc."#)
    
        // TGR 1.618 Limited
        #expect(CompanyIdentifier.tgr1618.rawValue == 2215)
        #expect(CompanyIdentifier.tgr1618.name == #"TGR 1.618 Limited"#)
        #expect(CompanyIdentifier.tgr1618.description == #"TGR 1.618 Limited"#)
    
        // Shanghai Kfcube Inc
        #expect(CompanyIdentifier.shanghaiKfcube.rawValue == 2216)
        #expect(CompanyIdentifier.shanghaiKfcube.name == #"Shanghai Kfcube Inc"#)
        #expect(CompanyIdentifier.shanghaiKfcube.description == #"Shanghai Kfcube Inc"#)
    
        // Fraunhofer IIS
        #expect(CompanyIdentifier.fraunhoferIis.rawValue == 2217)
        #expect(CompanyIdentifier.fraunhoferIis.name == #"Fraunhofer IIS"#)
        #expect(CompanyIdentifier.fraunhoferIis.description == #"Fraunhofer IIS"#)
    
        // SZ DJI TECHNOLOGY CO.,LTD
        #expect(CompanyIdentifier.szDjiTechnology.rawValue == 2218)
        #expect(CompanyIdentifier.szDjiTechnology.name == #"SZ DJI TECHNOLOGY CO.,LTD"#)
        #expect(CompanyIdentifier.szDjiTechnology.description == #"SZ DJI TECHNOLOGY CO.,LTD"#)
    
        // Coburn Technology, LLC
        #expect(CompanyIdentifier.coburnTechnology.rawValue == 2219)
        #expect(CompanyIdentifier.coburnTechnology.name == #"Coburn Technology, LLC"#)
        #expect(CompanyIdentifier.coburnTechnology.description == #"Coburn Technology, LLC"#)
    
        // Topre Corporation
        #expect(CompanyIdentifier.topre.rawValue == 2220)
        #expect(CompanyIdentifier.topre.name == #"Topre Corporation"#)
        #expect(CompanyIdentifier.topre.description == #"Topre Corporation"#)
    
        // Kayamatics Limited
        #expect(CompanyIdentifier.kayamatics.rawValue == 2221)
        #expect(CompanyIdentifier.kayamatics.name == #"Kayamatics Limited"#)
        #expect(CompanyIdentifier.kayamatics.description == #"Kayamatics Limited"#)
    
        // Moticon ReGo AG
        #expect(CompanyIdentifier.moticonRego.rawValue == 2222)
        #expect(CompanyIdentifier.moticonRego.name == #"Moticon ReGo AG"#)
        #expect(CompanyIdentifier.moticonRego.description == #"Moticon ReGo AG"#)
    
        // Polidea Sp. z o.o.
        #expect(CompanyIdentifier.polidea.rawValue == 2223)
        #expect(CompanyIdentifier.polidea.name == #"Polidea Sp. z o.o."#)
        #expect(CompanyIdentifier.polidea.description == #"Polidea Sp. z o.o."#)
    
        // Trivedi Advanced Technologies LLC
        #expect(CompanyIdentifier.trivediAdvancedTechnologies.rawValue == 2224)
        #expect(CompanyIdentifier.trivediAdvancedTechnologies.name == #"Trivedi Advanced Technologies LLC"#)
        #expect(CompanyIdentifier.trivediAdvancedTechnologies.description == #"Trivedi Advanced Technologies LLC"#)
    
        // CORE|vision BV
        #expect(CompanyIdentifier.coreVision.rawValue == 2225)
        #expect(CompanyIdentifier.coreVision.name == #"CORE|vision BV"#)
        #expect(CompanyIdentifier.coreVision.description == #"CORE|vision BV"#)
    
        // PF SCHWEISSTECHNOLOGIE GMBH
        #expect(CompanyIdentifier.pfSchweisstechnologie.rawValue == 2226)
        #expect(CompanyIdentifier.pfSchweisstechnologie.name == #"PF SCHWEISSTECHNOLOGIE GMBH"#)
        #expect(CompanyIdentifier.pfSchweisstechnologie.description == #"PF SCHWEISSTECHNOLOGIE GMBH"#)
    
        // IONIQ Skincare GmbH & Co. KG
        #expect(CompanyIdentifier.ioniqSkincare.rawValue == 2227)
        #expect(CompanyIdentifier.ioniqSkincare.name == #"IONIQ Skincare GmbH & Co. KG"#)
        #expect(CompanyIdentifier.ioniqSkincare.description == #"IONIQ Skincare GmbH & Co. KG"#)
    
        // Sengled Co., Ltd.
        #expect(CompanyIdentifier.sengled.rawValue == 2228)
        #expect(CompanyIdentifier.sengled.name == #"Sengled Co., Ltd."#)
        #expect(CompanyIdentifier.sengled.description == #"Sengled Co., Ltd."#)
    
        // TransferFi
        #expect(CompanyIdentifier.transferfi.rawValue == 2229)
        #expect(CompanyIdentifier.transferfi.name == #"TransferFi"#)
        #expect(CompanyIdentifier.transferfi.description == #"TransferFi"#)
    
        // Boehringer Ingelheim Vetmedica GmbH
        #expect(CompanyIdentifier.boehringerIngelheimVetmedica.rawValue == 2230)
        #expect(CompanyIdentifier.boehringerIngelheimVetmedica.name == #"Boehringer Ingelheim Vetmedica GmbH"#)
        #expect(CompanyIdentifier.boehringerIngelheimVetmedica.description == #"Boehringer Ingelheim Vetmedica GmbH"#)
    
        // ABB Inc
        #expect(CompanyIdentifier.abb3.rawValue == 2231)
        #expect(CompanyIdentifier.abb3.name == #"ABB Inc"#)
        #expect(CompanyIdentifier.abb3.description == #"ABB Inc"#)
    
        // Check Technology Solutions LLC
        #expect(CompanyIdentifier.checkTechnologySolutions.rawValue == 2232)
        #expect(CompanyIdentifier.checkTechnologySolutions.name == #"Check Technology Solutions LLC"#)
        #expect(CompanyIdentifier.checkTechnologySolutions.description == #"Check Technology Solutions LLC"#)
    
        // U-Shin Ltd.
        #expect(CompanyIdentifier.uShin.rawValue == 2233)
        #expect(CompanyIdentifier.uShin.name == #"U-Shin Ltd."#)
        #expect(CompanyIdentifier.uShin.description == #"U-Shin Ltd."#)
    
        // HYPER ICE, INC.
        #expect(CompanyIdentifier.hyperIce.rawValue == 2234)
        #expect(CompanyIdentifier.hyperIce.name == #"HYPER ICE, INC."#)
        #expect(CompanyIdentifier.hyperIce.description == #"HYPER ICE, INC."#)
    
        // Tokai-rika co.,ltd.
        #expect(CompanyIdentifier.tokaiRika.rawValue == 2235)
        #expect(CompanyIdentifier.tokaiRika.name == #"Tokai-rika co.,ltd."#)
        #expect(CompanyIdentifier.tokaiRika.description == #"Tokai-rika co.,ltd."#)
    
        // Prevayl Limited
        #expect(CompanyIdentifier.prevayl.rawValue == 2236)
        #expect(CompanyIdentifier.prevayl.name == #"Prevayl Limited"#)
        #expect(CompanyIdentifier.prevayl.description == #"Prevayl Limited"#)
    
        // bf1systems limited
        #expect(CompanyIdentifier.bf1Systems.rawValue == 2237)
        #expect(CompanyIdentifier.bf1Systems.name == #"bf1systems limited"#)
        #expect(CompanyIdentifier.bf1Systems.description == #"bf1systems limited"#)
    
        // ubisys technologies GmbH
        #expect(CompanyIdentifier.ubisysTechnologies.rawValue == 2238)
        #expect(CompanyIdentifier.ubisysTechnologies.name == #"ubisys technologies GmbH"#)
        #expect(CompanyIdentifier.ubisysTechnologies.description == #"ubisys technologies GmbH"#)
    
        // SIRC Co., Ltd.
        #expect(CompanyIdentifier.sirc.rawValue == 2239)
        #expect(CompanyIdentifier.sirc.name == #"SIRC Co., Ltd."#)
        #expect(CompanyIdentifier.sirc.description == #"SIRC Co., Ltd."#)
    
        // Accent Advanced Systems SLU
        #expect(CompanyIdentifier.accentAdvancedSystems.rawValue == 2240)
        #expect(CompanyIdentifier.accentAdvancedSystems.name == #"Accent Advanced Systems SLU"#)
        #expect(CompanyIdentifier.accentAdvancedSystems.description == #"Accent Advanced Systems SLU"#)
    
        // Rayden.Earth LTD
        #expect(CompanyIdentifier.raydenEarth.rawValue == 2241)
        #expect(CompanyIdentifier.raydenEarth.name == #"Rayden.Earth LTD"#)
        #expect(CompanyIdentifier.raydenEarth.description == #"Rayden.Earth LTD"#)
    
        // Lindinvent AB
        #expect(CompanyIdentifier.lindinvent.rawValue == 2242)
        #expect(CompanyIdentifier.lindinvent.name == #"Lindinvent AB"#)
        #expect(CompanyIdentifier.lindinvent.description == #"Lindinvent AB"#)
    
        // CHIPOLO d.o.o.
        #expect(CompanyIdentifier.chipolo.rawValue == 2243)
        #expect(CompanyIdentifier.chipolo.name == #"CHIPOLO d.o.o."#)
        #expect(CompanyIdentifier.chipolo.description == #"CHIPOLO d.o.o."#)
    
        // CellAssist, LLC
        #expect(CompanyIdentifier.cellassist.rawValue == 2244)
        #expect(CompanyIdentifier.cellassist.name == #"CellAssist, LLC"#)
        #expect(CompanyIdentifier.cellassist.description == #"CellAssist, LLC"#)
    
        // J. Wagner GmbH
        #expect(CompanyIdentifier.jWagner.rawValue == 2245)
        #expect(CompanyIdentifier.jWagner.name == #"J. Wagner GmbH"#)
        #expect(CompanyIdentifier.jWagner.description == #"J. Wagner GmbH"#)
    
        // Integra Optics Inc
        #expect(CompanyIdentifier.integraOptics.rawValue == 2246)
        #expect(CompanyIdentifier.integraOptics.name == #"Integra Optics Inc"#)
        #expect(CompanyIdentifier.integraOptics.description == #"Integra Optics Inc"#)
    
        // Monadnock Systems Ltd.
        #expect(CompanyIdentifier.monadnockSystems.rawValue == 2247)
        #expect(CompanyIdentifier.monadnockSystems.name == #"Monadnock Systems Ltd."#)
        #expect(CompanyIdentifier.monadnockSystems.description == #"Monadnock Systems Ltd."#)
    
        // Liteboxer Technologies Inc.
        #expect(CompanyIdentifier.liteboxerTechnologies.rawValue == 2248)
        #expect(CompanyIdentifier.liteboxerTechnologies.name == #"Liteboxer Technologies Inc."#)
        #expect(CompanyIdentifier.liteboxerTechnologies.description == #"Liteboxer Technologies Inc."#)
    
        // Noventa AG
        #expect(CompanyIdentifier.noventa.rawValue == 2249)
        #expect(CompanyIdentifier.noventa.name == #"Noventa AG"#)
        #expect(CompanyIdentifier.noventa.description == #"Noventa AG"#)
    
        // Nubia Technology Co.,Ltd.
        #expect(CompanyIdentifier.nubiaTechnology.rawValue == 2250)
        #expect(CompanyIdentifier.nubiaTechnology.name == #"Nubia Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.nubiaTechnology.description == #"Nubia Technology Co.,Ltd."#)
    
        // JT INNOVATIONS LIMITED
        #expect(CompanyIdentifier.jtInnovations.rawValue == 2251)
        #expect(CompanyIdentifier.jtInnovations.name == #"JT INNOVATIONS LIMITED"#)
        #expect(CompanyIdentifier.jtInnovations.description == #"JT INNOVATIONS LIMITED"#)
    
        // TGM TECHNOLOGY CO., LTD.
        #expect(CompanyIdentifier.tgmTechnology.rawValue == 2252)
        #expect(CompanyIdentifier.tgmTechnology.name == #"TGM TECHNOLOGY CO., LTD."#)
        #expect(CompanyIdentifier.tgmTechnology.description == #"TGM TECHNOLOGY CO., LTD."#)
    
        // ifly
        #expect(CompanyIdentifier.ifly.rawValue == 2253)
        #expect(CompanyIdentifier.ifly.name == #"ifly"#)
        #expect(CompanyIdentifier.ifly.description == #"ifly"#)
    
        // ZIMI CORPORATION
        #expect(CompanyIdentifier.zimi.rawValue == 2254)
        #expect(CompanyIdentifier.zimi.name == #"ZIMI CORPORATION"#)
        #expect(CompanyIdentifier.zimi.description == #"ZIMI CORPORATION"#)
    
        // betternotstealmybike UG (with limited liability)
        #expect(CompanyIdentifier.betternotstealmybikeUgWithLiability.rawValue == 2255)
        #expect(CompanyIdentifier.betternotstealmybikeUgWithLiability.name == #"betternotstealmybike UG (with limited liability)"#)
        #expect(CompanyIdentifier.betternotstealmybikeUgWithLiability.description == #"betternotstealmybike UG (with limited liability)"#)
    
        // ESTOM Infotech Kft.
        #expect(CompanyIdentifier.estomInfotech.rawValue == 2256)
        #expect(CompanyIdentifier.estomInfotech.name == #"ESTOM Infotech Kft."#)
        #expect(CompanyIdentifier.estomInfotech.description == #"ESTOM Infotech Kft."#)
    
        // Sensovium Inc.
        #expect(CompanyIdentifier.sensovium.rawValue == 2257)
        #expect(CompanyIdentifier.sensovium.name == #"Sensovium Inc."#)
        #expect(CompanyIdentifier.sensovium.description == #"Sensovium Inc."#)
    
        // Virscient Limited
        #expect(CompanyIdentifier.virscient.rawValue == 2258)
        #expect(CompanyIdentifier.virscient.name == #"Virscient Limited"#)
        #expect(CompanyIdentifier.virscient.description == #"Virscient Limited"#)
    
        // Novel Bits, LLC
        #expect(CompanyIdentifier.novelBits.rawValue == 2259)
        #expect(CompanyIdentifier.novelBits.name == #"Novel Bits, LLC"#)
        #expect(CompanyIdentifier.novelBits.description == #"Novel Bits, LLC"#)
    
        // ADATA Technology Co., LTD.
        #expect(CompanyIdentifier.adataTechnology.rawValue == 2260)
        #expect(CompanyIdentifier.adataTechnology.name == #"ADATA Technology Co., LTD."#)
        #expect(CompanyIdentifier.adataTechnology.description == #"ADATA Technology Co., LTD."#)
    
        // KEYes
        #expect(CompanyIdentifier.keyes.rawValue == 2261)
        #expect(CompanyIdentifier.keyes.name == #"KEYes"#)
        #expect(CompanyIdentifier.keyes.description == #"KEYes"#)
    
        // Nome Oy
        #expect(CompanyIdentifier.nome.rawValue == 2262)
        #expect(CompanyIdentifier.nome.name == #"Nome Oy"#)
        #expect(CompanyIdentifier.nome.description == #"Nome Oy"#)
    
        // Inovonics Corp
        #expect(CompanyIdentifier.inovonics.rawValue == 2263)
        #expect(CompanyIdentifier.inovonics.name == #"Inovonics Corp"#)
        #expect(CompanyIdentifier.inovonics.description == #"Inovonics Corp"#)
    
        // WARES
        #expect(CompanyIdentifier.wares.rawValue == 2264)
        #expect(CompanyIdentifier.wares.name == #"WARES"#)
        #expect(CompanyIdentifier.wares.description == #"WARES"#)
    
        // Pointr Labs Limited
        #expect(CompanyIdentifier.pointrLabs.rawValue == 2265)
        #expect(CompanyIdentifier.pointrLabs.name == #"Pointr Labs Limited"#)
        #expect(CompanyIdentifier.pointrLabs.description == #"Pointr Labs Limited"#)
    
        // Miridia Technology Incorporated
        #expect(CompanyIdentifier.miridiaTechnology.rawValue == 2266)
        #expect(CompanyIdentifier.miridiaTechnology.name == #"Miridia Technology Incorporated"#)
        #expect(CompanyIdentifier.miridiaTechnology.description == #"Miridia Technology Incorporated"#)
    
        // Tertium Technology
        #expect(CompanyIdentifier.tertiumTechnology.rawValue == 2267)
        #expect(CompanyIdentifier.tertiumTechnology.name == #"Tertium Technology"#)
        #expect(CompanyIdentifier.tertiumTechnology.description == #"Tertium Technology"#)
    
        // SHENZHEN AUKEY E BUSINESS CO., LTD
        #expect(CompanyIdentifier.shenzhenAukeyEBusiness.rawValue == 2268)
        #expect(CompanyIdentifier.shenzhenAukeyEBusiness.name == #"SHENZHEN AUKEY E BUSINESS CO., LTD"#)
        #expect(CompanyIdentifier.shenzhenAukeyEBusiness.description == #"SHENZHEN AUKEY E BUSINESS CO., LTD"#)
    
        // code-Q
        #expect(CompanyIdentifier.codeQ.rawValue == 2269)
        #expect(CompanyIdentifier.codeQ.name == #"code-Q"#)
        #expect(CompanyIdentifier.codeQ.description == #"code-Q"#)
    
        // TE Connectivity Corporation
        #expect(CompanyIdentifier.teConnectivity.rawValue == 2270)
        #expect(CompanyIdentifier.teConnectivity.name == #"TE Connectivity Corporation"#)
        #expect(CompanyIdentifier.teConnectivity.description == #"TE Connectivity Corporation"#)
    
        // IRIS OHYAMA CO.,LTD.
        #expect(CompanyIdentifier.irisOhyama.rawValue == 2271)
        #expect(CompanyIdentifier.irisOhyama.name == #"IRIS OHYAMA CO.,LTD."#)
        #expect(CompanyIdentifier.irisOhyama.description == #"IRIS OHYAMA CO.,LTD."#)
    
        // Philia Technology
        #expect(CompanyIdentifier.philiaTechnology.rawValue == 2272)
        #expect(CompanyIdentifier.philiaTechnology.name == #"Philia Technology"#)
        #expect(CompanyIdentifier.philiaTechnology.description == #"Philia Technology"#)
    
        // KOZO KEIKAKU ENGINEERING Inc.
        #expect(CompanyIdentifier.kozoKeikakuEngineering.rawValue == 2273)
        #expect(CompanyIdentifier.kozoKeikakuEngineering.name == #"KOZO KEIKAKU ENGINEERING Inc."#)
        #expect(CompanyIdentifier.kozoKeikakuEngineering.description == #"KOZO KEIKAKU ENGINEERING Inc."#)
    
        // Shenzhen Simo Technology co. LTD
        #expect(CompanyIdentifier.shenzhenSimoTechnology.rawValue == 2274)
        #expect(CompanyIdentifier.shenzhenSimoTechnology.name == #"Shenzhen Simo Technology co. LTD"#)
        #expect(CompanyIdentifier.shenzhenSimoTechnology.description == #"Shenzhen Simo Technology co. LTD"#)
    
        // Republic Wireless, Inc.
        #expect(CompanyIdentifier.republicWireless.rawValue == 2275)
        #expect(CompanyIdentifier.republicWireless.name == #"Republic Wireless, Inc."#)
        #expect(CompanyIdentifier.republicWireless.description == #"Republic Wireless, Inc."#)
    
        // Rashidov ltd
        #expect(CompanyIdentifier.rashidov.rawValue == 2276)
        #expect(CompanyIdentifier.rashidov.name == #"Rashidov ltd"#)
        #expect(CompanyIdentifier.rashidov.description == #"Rashidov ltd"#)
    
        // Crowd Connected Ltd
        #expect(CompanyIdentifier.crowdConnected.rawValue == 2277)
        #expect(CompanyIdentifier.crowdConnected.name == #"Crowd Connected Ltd"#)
        #expect(CompanyIdentifier.crowdConnected.description == #"Crowd Connected Ltd"#)
    
        // Eneso Tecnologia de Adaptacion S.L.
        #expect(CompanyIdentifier.enesoTecnologiaDeAdaptacion.rawValue == 2278)
        #expect(CompanyIdentifier.enesoTecnologiaDeAdaptacion.name == #"Eneso Tecnologia de Adaptacion S.L."#)
        #expect(CompanyIdentifier.enesoTecnologiaDeAdaptacion.description == #"Eneso Tecnologia de Adaptacion S.L."#)
    
        // Barrot Technology Co.,Ltd.
        #expect(CompanyIdentifier.barrotTechnology.rawValue == 2279)
        #expect(CompanyIdentifier.barrotTechnology.name == #"Barrot Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.barrotTechnology.description == #"Barrot Technology Co.,Ltd."#)
    
        // Naonext
        #expect(CompanyIdentifier.naonext.rawValue == 2280)
        #expect(CompanyIdentifier.naonext.name == #"Naonext"#)
        #expect(CompanyIdentifier.naonext.description == #"Naonext"#)
    
        // Taiwan Intelligent Home Corp.
        #expect(CompanyIdentifier.taiwanIntelligentHome.rawValue == 2281)
        #expect(CompanyIdentifier.taiwanIntelligentHome.name == #"Taiwan Intelligent Home Corp."#)
        #expect(CompanyIdentifier.taiwanIntelligentHome.description == #"Taiwan Intelligent Home Corp."#)
    
        // COWBELL ENGINEERING CO.,LTD.
        #expect(CompanyIdentifier.cowbellEngineering.rawValue == 2282)
        #expect(CompanyIdentifier.cowbellEngineering.name == #"COWBELL ENGINEERING CO.,LTD."#)
        #expect(CompanyIdentifier.cowbellEngineering.description == #"COWBELL ENGINEERING CO.,LTD."#)
    
        // Beijing Big Moment Technology Co., Ltd.
        #expect(CompanyIdentifier.beijingBigMomentTechnology.rawValue == 2283)
        #expect(CompanyIdentifier.beijingBigMomentTechnology.name == #"Beijing Big Moment Technology Co., Ltd."#)
        #expect(CompanyIdentifier.beijingBigMomentTechnology.description == #"Beijing Big Moment Technology Co., Ltd."#)
    
        // Denso Corporation
        #expect(CompanyIdentifier.denso.rawValue == 2284)
        #expect(CompanyIdentifier.denso.name == #"Denso Corporation"#)
        #expect(CompanyIdentifier.denso.description == #"Denso Corporation"#)
    
        // IMI Hydronic Engineering International SA
        #expect(CompanyIdentifier.imiHydronicEngineeringInternational.rawValue == 2285)
        #expect(CompanyIdentifier.imiHydronicEngineeringInternational.name == #"IMI Hydronic Engineering International SA"#)
        #expect(CompanyIdentifier.imiHydronicEngineeringInternational.description == #"IMI Hydronic Engineering International SA"#)
    
        // Askey Computer Corp.
        #expect(CompanyIdentifier.askeyComputer.rawValue == 2286)
        #expect(CompanyIdentifier.askeyComputer.name == #"Askey Computer Corp."#)
        #expect(CompanyIdentifier.askeyComputer.description == #"Askey Computer Corp."#)
    
        // Cumulus Digital Systems, Inc
        #expect(CompanyIdentifier.cumulusDigitalSystems.rawValue == 2287)
        #expect(CompanyIdentifier.cumulusDigitalSystems.name == #"Cumulus Digital Systems, Inc"#)
        #expect(CompanyIdentifier.cumulusDigitalSystems.description == #"Cumulus Digital Systems, Inc"#)
    
        // Joovv, Inc.
        #expect(CompanyIdentifier.joovv.rawValue == 2288)
        #expect(CompanyIdentifier.joovv.name == #"Joovv, Inc."#)
        #expect(CompanyIdentifier.joovv.description == #"Joovv, Inc."#)
    
        // The L.S. Starrett Company
        #expect(CompanyIdentifier.lSStarrett.rawValue == 2289)
        #expect(CompanyIdentifier.lSStarrett.name == #"The L.S. Starrett Company"#)
        #expect(CompanyIdentifier.lSStarrett.description == #"The L.S. Starrett Company"#)
    
        // Microoled
        #expect(CompanyIdentifier.microoled.rawValue == 2290)
        #expect(CompanyIdentifier.microoled.name == #"Microoled"#)
        #expect(CompanyIdentifier.microoled.description == #"Microoled"#)
    
        // PSP - Pauli Services & Products GmbH
        #expect(CompanyIdentifier.pspPauliServicesProducts.rawValue == 2291)
        #expect(CompanyIdentifier.pspPauliServicesProducts.name == #"PSP - Pauli Services & Products GmbH"#)
        #expect(CompanyIdentifier.pspPauliServicesProducts.description == #"PSP - Pauli Services & Products GmbH"#)
    
        // Kodimo Technologies Company Limited
        #expect(CompanyIdentifier.kodimoTechnologies.rawValue == 2292)
        #expect(CompanyIdentifier.kodimoTechnologies.name == #"Kodimo Technologies Company Limited"#)
        #expect(CompanyIdentifier.kodimoTechnologies.description == #"Kodimo Technologies Company Limited"#)
    
        // Tymtix Technologies Private Limited
        #expect(CompanyIdentifier.tymtixTechnologies.rawValue == 2293)
        #expect(CompanyIdentifier.tymtixTechnologies.name == #"Tymtix Technologies Private Limited"#)
        #expect(CompanyIdentifier.tymtixTechnologies.description == #"Tymtix Technologies Private Limited"#)
    
        // Dermal Photonics Corporation
        #expect(CompanyIdentifier.dermalPhotonics.rawValue == 2294)
        #expect(CompanyIdentifier.dermalPhotonics.name == #"Dermal Photonics Corporation"#)
        #expect(CompanyIdentifier.dermalPhotonics.description == #"Dermal Photonics Corporation"#)
    
        // MTD Products Inc & Affiliates
        #expect(CompanyIdentifier.mtdProductsAffiliates.rawValue == 2295)
        #expect(CompanyIdentifier.mtdProductsAffiliates.name == #"MTD Products Inc & Affiliates"#)
        #expect(CompanyIdentifier.mtdProductsAffiliates.description == #"MTD Products Inc & Affiliates"#)
    
        // instagrid GmbH
        #expect(CompanyIdentifier.instagrid.rawValue == 2296)
        #expect(CompanyIdentifier.instagrid.name == #"instagrid GmbH"#)
        #expect(CompanyIdentifier.instagrid.description == #"instagrid GmbH"#)
    
        // Spacelabs Medical Inc.
        #expect(CompanyIdentifier.spacelabsMedical.rawValue == 2297)
        #expect(CompanyIdentifier.spacelabsMedical.name == #"Spacelabs Medical Inc."#)
        #expect(CompanyIdentifier.spacelabsMedical.description == #"Spacelabs Medical Inc."#)
    
        // Troo Corporation
        #expect(CompanyIdentifier.troo.rawValue == 2298)
        #expect(CompanyIdentifier.troo.name == #"Troo Corporation"#)
        #expect(CompanyIdentifier.troo.description == #"Troo Corporation"#)
    
        // Darkglass Electronics Oy
        #expect(CompanyIdentifier.darkglassElectronics.rawValue == 2299)
        #expect(CompanyIdentifier.darkglassElectronics.name == #"Darkglass Electronics Oy"#)
        #expect(CompanyIdentifier.darkglassElectronics.description == #"Darkglass Electronics Oy"#)
    
        // Hill-Rom
        #expect(CompanyIdentifier.hillRom.rawValue == 2300)
        #expect(CompanyIdentifier.hillRom.name == #"Hill-Rom"#)
        #expect(CompanyIdentifier.hillRom.description == #"Hill-Rom"#)
    
        // BioIntelliSense, Inc.
        #expect(CompanyIdentifier.biointellisense.rawValue == 2301)
        #expect(CompanyIdentifier.biointellisense.name == #"BioIntelliSense, Inc."#)
        #expect(CompanyIdentifier.biointellisense.description == #"BioIntelliSense, Inc."#)
    
        // Ketronixs Sdn Bhd
        #expect(CompanyIdentifier.ketronixs.rawValue == 2302)
        #expect(CompanyIdentifier.ketronixs.name == #"Ketronixs Sdn Bhd"#)
        #expect(CompanyIdentifier.ketronixs.description == #"Ketronixs Sdn Bhd"#)
    
        // Plastimold Products, Inc
        #expect(CompanyIdentifier.plastimoldProducts.rawValue == 2303)
        #expect(CompanyIdentifier.plastimoldProducts.name == #"Plastimold Products, Inc"#)
        #expect(CompanyIdentifier.plastimoldProducts.description == #"Plastimold Products, Inc"#)
    
        // Beijing Zizai Technology Co., LTD.
        #expect(CompanyIdentifier.beijingZizaiTechnology.rawValue == 2304)
        #expect(CompanyIdentifier.beijingZizaiTechnology.name == #"Beijing Zizai Technology Co., LTD."#)
        #expect(CompanyIdentifier.beijingZizaiTechnology.description == #"Beijing Zizai Technology Co., LTD."#)
    
        // Lucimed
        #expect(CompanyIdentifier.lucimed.rawValue == 2305)
        #expect(CompanyIdentifier.lucimed.name == #"Lucimed"#)
        #expect(CompanyIdentifier.lucimed.description == #"Lucimed"#)
    
        // TSC Auto-ID Technology Co., Ltd.
        #expect(CompanyIdentifier.tscAutoIdTechnology.rawValue == 2306)
        #expect(CompanyIdentifier.tscAutoIdTechnology.name == #"TSC Auto-ID Technology Co., Ltd."#)
        #expect(CompanyIdentifier.tscAutoIdTechnology.description == #"TSC Auto-ID Technology Co., Ltd."#)
    
        // DATAMARS, Inc.
        #expect(CompanyIdentifier.datamars.rawValue == 2307)
        #expect(CompanyIdentifier.datamars.name == #"DATAMARS, Inc."#)
        #expect(CompanyIdentifier.datamars.description == #"DATAMARS, Inc."#)
    
        // SUNCORPORATION
        #expect(CompanyIdentifier.suncorporation.rawValue == 2308)
        #expect(CompanyIdentifier.suncorporation.name == #"SUNCORPORATION"#)
        #expect(CompanyIdentifier.suncorporation.description == #"SUNCORPORATION"#)
    
        // Yandex Services AG
        #expect(CompanyIdentifier.yandexServices.rawValue == 2309)
        #expect(CompanyIdentifier.yandexServices.name == #"Yandex Services AG"#)
        #expect(CompanyIdentifier.yandexServices.description == #"Yandex Services AG"#)
    
        // Scope Logistical Solutions
        #expect(CompanyIdentifier.scopeLogisticalSolutions.rawValue == 2310)
        #expect(CompanyIdentifier.scopeLogisticalSolutions.name == #"Scope Logistical Solutions"#)
        #expect(CompanyIdentifier.scopeLogisticalSolutions.description == #"Scope Logistical Solutions"#)
    
        // User Hello, LLC
        #expect(CompanyIdentifier.userHello.rawValue == 2311)
        #expect(CompanyIdentifier.userHello.name == #"User Hello, LLC"#)
        #expect(CompanyIdentifier.userHello.description == #"User Hello, LLC"#)
    
        // Pinpoint Innovations Limited
        #expect(CompanyIdentifier.pinpointInnovations.rawValue == 2312)
        #expect(CompanyIdentifier.pinpointInnovations.name == #"Pinpoint Innovations Limited"#)
        #expect(CompanyIdentifier.pinpointInnovations.description == #"Pinpoint Innovations Limited"#)
    
        // 70mai Co.,Ltd.
        #expect(CompanyIdentifier.company70Mai.rawValue == 2313)
        #expect(CompanyIdentifier.company70Mai.name == #"70mai Co.,Ltd."#)
        #expect(CompanyIdentifier.company70Mai.description == #"70mai Co.,Ltd."#)
    
        // Zhuhai Hoksi Technology CO.,LTD
        #expect(CompanyIdentifier.zhuhaiHoksiTechnology.rawValue == 2314)
        #expect(CompanyIdentifier.zhuhaiHoksiTechnology.name == #"Zhuhai Hoksi Technology CO.,LTD"#)
        #expect(CompanyIdentifier.zhuhaiHoksiTechnology.description == #"Zhuhai Hoksi Technology CO.,LTD"#)
    
        // EMBR labs, INC
        #expect(CompanyIdentifier.embrLabs.rawValue == 2315)
        #expect(CompanyIdentifier.embrLabs.name == #"EMBR labs, INC"#)
        #expect(CompanyIdentifier.embrLabs.description == #"EMBR labs, INC"#)
    
        // Radiawave Technologies Co.,Ltd.
        #expect(CompanyIdentifier.radiawaveTechnologies.rawValue == 2316)
        #expect(CompanyIdentifier.radiawaveTechnologies.name == #"Radiawave Technologies Co.,Ltd."#)
        #expect(CompanyIdentifier.radiawaveTechnologies.description == #"Radiawave Technologies Co.,Ltd."#)
    
        // IOT Invent GmbH
        #expect(CompanyIdentifier.iotInvent.rawValue == 2317)
        #expect(CompanyIdentifier.iotInvent.name == #"IOT Invent GmbH"#)
        #expect(CompanyIdentifier.iotInvent.description == #"IOT Invent GmbH"#)
    
        // OPTIMUSIOT TECH LLP
        #expect(CompanyIdentifier.optimusiotTechLlp.rawValue == 2318)
        #expect(CompanyIdentifier.optimusiotTechLlp.name == #"OPTIMUSIOT TECH LLP"#)
        #expect(CompanyIdentifier.optimusiotTechLlp.description == #"OPTIMUSIOT TECH LLP"#)
    
        // VC Inc.
        #expect(CompanyIdentifier.vc.rawValue == 2319)
        #expect(CompanyIdentifier.vc.name == #"VC Inc."#)
        #expect(CompanyIdentifier.vc.description == #"VC Inc."#)
    
        // ASR Microelectronics (Shanghai) Co., Ltd.
        #expect(CompanyIdentifier.asrMicroelectronicsShanghai.rawValue == 2320)
        #expect(CompanyIdentifier.asrMicroelectronicsShanghai.name == #"ASR Microelectronics (Shanghai) Co., Ltd."#)
        #expect(CompanyIdentifier.asrMicroelectronicsShanghai.description == #"ASR Microelectronics (Shanghai) Co., Ltd."#)
    
        // Douglas Lighting Controls Inc.
        #expect(CompanyIdentifier.douglasLightingControls.rawValue == 2321)
        #expect(CompanyIdentifier.douglasLightingControls.name == #"Douglas Lighting Controls Inc."#)
        #expect(CompanyIdentifier.douglasLightingControls.description == #"Douglas Lighting Controls Inc."#)
    
        // Nerbio Medical Software Platforms Inc
        #expect(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.rawValue == 2322)
        #expect(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.name == #"Nerbio Medical Software Platforms Inc"#)
        #expect(CompanyIdentifier.nerbioMedicalSoftwarePlatforms.description == #"Nerbio Medical Software Platforms Inc"#)
    
        // Braveheart Wireless, Inc.
        #expect(CompanyIdentifier.braveheartWireless.rawValue == 2323)
        #expect(CompanyIdentifier.braveheartWireless.name == #"Braveheart Wireless, Inc."#)
        #expect(CompanyIdentifier.braveheartWireless.description == #"Braveheart Wireless, Inc."#)
    
        // INEO-SENSE
        #expect(CompanyIdentifier.ineoSense.rawValue == 2324)
        #expect(CompanyIdentifier.ineoSense.name == #"INEO-SENSE"#)
        #expect(CompanyIdentifier.ineoSense.description == #"INEO-SENSE"#)
    
        // Honda Motor Co., Ltd.
        #expect(CompanyIdentifier.hondaMotor.rawValue == 2325)
        #expect(CompanyIdentifier.hondaMotor.name == #"Honda Motor Co., Ltd."#)
        #expect(CompanyIdentifier.hondaMotor.description == #"Honda Motor Co., Ltd."#)
    
        // Ambient Sensors LLC
        #expect(CompanyIdentifier.ambientSensors.rawValue == 2326)
        #expect(CompanyIdentifier.ambientSensors.name == #"Ambient Sensors LLC"#)
        #expect(CompanyIdentifier.ambientSensors.description == #"Ambient Sensors LLC"#)
    
        // ASR Microelectronics(ShenZhen)Co., Ltd.
        #expect(CompanyIdentifier.asrMicroelectronicsShenzhen.rawValue == 2327)
        #expect(CompanyIdentifier.asrMicroelectronicsShenzhen.name == #"ASR Microelectronics(ShenZhen)Co., Ltd."#)
        #expect(CompanyIdentifier.asrMicroelectronicsShenzhen.description == #"ASR Microelectronics(ShenZhen)Co., Ltd."#)
    
        // Technosphere Labs Pvt. Ltd.
        #expect(CompanyIdentifier.technosphereLabs.rawValue == 2328)
        #expect(CompanyIdentifier.technosphereLabs.name == #"Technosphere Labs Pvt. Ltd."#)
        #expect(CompanyIdentifier.technosphereLabs.description == #"Technosphere Labs Pvt. Ltd."#)
    
        // NO SMD LIMITED
        #expect(CompanyIdentifier.noSmd.rawValue == 2329)
        #expect(CompanyIdentifier.noSmd.name == #"NO SMD LIMITED"#)
        #expect(CompanyIdentifier.noSmd.description == #"NO SMD LIMITED"#)
    
        // Albertronic BV
        #expect(CompanyIdentifier.albertronic.rawValue == 2330)
        #expect(CompanyIdentifier.albertronic.name == #"Albertronic BV"#)
        #expect(CompanyIdentifier.albertronic.description == #"Albertronic BV"#)
    
        // Luminostics, Inc.
        #expect(CompanyIdentifier.luminostics.rawValue == 2331)
        #expect(CompanyIdentifier.luminostics.name == #"Luminostics, Inc."#)
        #expect(CompanyIdentifier.luminostics.description == #"Luminostics, Inc."#)
    
        // Oblamatik AG
        #expect(CompanyIdentifier.oblamatik.rawValue == 2332)
        #expect(CompanyIdentifier.oblamatik.name == #"Oblamatik AG"#)
        #expect(CompanyIdentifier.oblamatik.description == #"Oblamatik AG"#)
    
        // Innokind, Inc.
        #expect(CompanyIdentifier.innokind.rawValue == 2333)
        #expect(CompanyIdentifier.innokind.name == #"Innokind, Inc."#)
        #expect(CompanyIdentifier.innokind.description == #"Innokind, Inc."#)
    
        // Melbot Studios, Sociedad Limitada
        #expect(CompanyIdentifier.melbotStudiosSociedadLimitada.rawValue == 2334)
        #expect(CompanyIdentifier.melbotStudiosSociedadLimitada.name == #"Melbot Studios, Sociedad Limitada"#)
        #expect(CompanyIdentifier.melbotStudiosSociedadLimitada.description == #"Melbot Studios, Sociedad Limitada"#)
    
        // Myzee Technology
        #expect(CompanyIdentifier.myzeeTechnology.rawValue == 2335)
        #expect(CompanyIdentifier.myzeeTechnology.name == #"Myzee Technology"#)
        #expect(CompanyIdentifier.myzeeTechnology.description == #"Myzee Technology"#)
    
        // Omnisense Limited
        #expect(CompanyIdentifier.omnisense.rawValue == 2336)
        #expect(CompanyIdentifier.omnisense.name == #"Omnisense Limited"#)
        #expect(CompanyIdentifier.omnisense.description == #"Omnisense Limited"#)
    
        // KAHA PTE. LTD.
        #expect(CompanyIdentifier.kahaPte.rawValue == 2337)
        #expect(CompanyIdentifier.kahaPte.name == #"KAHA PTE. LTD."#)
        #expect(CompanyIdentifier.kahaPte.description == #"KAHA PTE. LTD."#)
    
        // Shanghai MXCHIP Information Technology Co., Ltd.
        #expect(CompanyIdentifier.shanghaiMxchipInformationTechnology.rawValue == 2338)
        #expect(CompanyIdentifier.shanghaiMxchipInformationTechnology.name == #"Shanghai MXCHIP Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiMxchipInformationTechnology.description == #"Shanghai MXCHIP Information Technology Co., Ltd."#)
    
        // JSB TECH PTE LTD
        #expect(CompanyIdentifier.jsbTechPte.rawValue == 2339)
        #expect(CompanyIdentifier.jsbTechPte.name == #"JSB TECH PTE LTD"#)
        #expect(CompanyIdentifier.jsbTechPte.description == #"JSB TECH PTE LTD"#)
    
        // Fundacion Tecnalia Research and Innovation
        #expect(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.rawValue == 2340)
        #expect(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.name == #"Fundacion Tecnalia Research and Innovation"#)
        #expect(CompanyIdentifier.fundacionTecnaliaResearchAndInnovation.description == #"Fundacion Tecnalia Research and Innovation"#)
    
        // Yukai Engineering Inc.
        #expect(CompanyIdentifier.yukaiEngineering.rawValue == 2341)
        #expect(CompanyIdentifier.yukaiEngineering.name == #"Yukai Engineering Inc."#)
        #expect(CompanyIdentifier.yukaiEngineering.description == #"Yukai Engineering Inc."#)
    
        // Gooligum Technologies Pty Ltd
        #expect(CompanyIdentifier.gooligumTechnologies.rawValue == 2342)
        #expect(CompanyIdentifier.gooligumTechnologies.name == #"Gooligum Technologies Pty Ltd"#)
        #expect(CompanyIdentifier.gooligumTechnologies.description == #"Gooligum Technologies Pty Ltd"#)
    
        // ROOQ GmbH
        #expect(CompanyIdentifier.rooq.rawValue == 2343)
        #expect(CompanyIdentifier.rooq.name == #"ROOQ GmbH"#)
        #expect(CompanyIdentifier.rooq.description == #"ROOQ GmbH"#)
    
        // AiRISTA
        #expect(CompanyIdentifier.airista.rawValue == 2344)
        #expect(CompanyIdentifier.airista.name == #"AiRISTA"#)
        #expect(CompanyIdentifier.airista.description == #"AiRISTA"#)
    
        // Qingdao Haier Technology Co., Ltd.
        #expect(CompanyIdentifier.qingdaoHaierTechnology.rawValue == 2345)
        #expect(CompanyIdentifier.qingdaoHaierTechnology.name == #"Qingdao Haier Technology Co., Ltd."#)
        #expect(CompanyIdentifier.qingdaoHaierTechnology.description == #"Qingdao Haier Technology Co., Ltd."#)
    
        // Sappl Verwaltungs- und Betriebs GmbH
        #expect(CompanyIdentifier.sapplVerwaltungsUndBetriebs.rawValue == 2346)
        #expect(CompanyIdentifier.sapplVerwaltungsUndBetriebs.name == #"Sappl Verwaltungs- und Betriebs GmbH"#)
        #expect(CompanyIdentifier.sapplVerwaltungsUndBetriebs.description == #"Sappl Verwaltungs- und Betriebs GmbH"#)
    
        // TekHome
        #expect(CompanyIdentifier.tekhome.rawValue == 2347)
        #expect(CompanyIdentifier.tekhome.name == #"TekHome"#)
        #expect(CompanyIdentifier.tekhome.description == #"TekHome"#)
    
        // PCI Private Limited
        #expect(CompanyIdentifier.pci.rawValue == 2348)
        #expect(CompanyIdentifier.pci.name == #"PCI Private Limited"#)
        #expect(CompanyIdentifier.pci.description == #"PCI Private Limited"#)
    
        // Leggett & Platt, Incorporated
        #expect(CompanyIdentifier.leggettPlatt.rawValue == 2349)
        #expect(CompanyIdentifier.leggettPlatt.name == #"Leggett & Platt, Incorporated"#)
        #expect(CompanyIdentifier.leggettPlatt.description == #"Leggett & Platt, Incorporated"#)
    
        // PS GmbH
        #expect(CompanyIdentifier.ps.rawValue == 2350)
        #expect(CompanyIdentifier.ps.name == #"PS GmbH"#)
        #expect(CompanyIdentifier.ps.description == #"PS GmbH"#)
    
        // C.O.B.O. SpA
        #expect(CompanyIdentifier.cOBOSpa.rawValue == 2351)
        #expect(CompanyIdentifier.cOBOSpa.name == #"C.O.B.O. SpA"#)
        #expect(CompanyIdentifier.cOBOSpa.description == #"C.O.B.O. SpA"#)
    
        // James Walker RotaBolt Limited
        #expect(CompanyIdentifier.jamesWalkerRotabolt.rawValue == 2352)
        #expect(CompanyIdentifier.jamesWalkerRotabolt.name == #"James Walker RotaBolt Limited"#)
        #expect(CompanyIdentifier.jamesWalkerRotabolt.description == #"James Walker RotaBolt Limited"#)
    
        // BREATHINGS Co., Ltd.
        #expect(CompanyIdentifier.breathings.rawValue == 2353)
        #expect(CompanyIdentifier.breathings.name == #"BREATHINGS Co., Ltd."#)
        #expect(CompanyIdentifier.breathings.description == #"BREATHINGS Co., Ltd."#)
    
        // BarVision, LLC
        #expect(CompanyIdentifier.barvision.rawValue == 2354)
        #expect(CompanyIdentifier.barvision.name == #"BarVision, LLC"#)
        #expect(CompanyIdentifier.barvision.description == #"BarVision, LLC"#)
    
        // SRAM
        #expect(CompanyIdentifier.sram.rawValue == 2355)
        #expect(CompanyIdentifier.sram.name == #"SRAM"#)
        #expect(CompanyIdentifier.sram.description == #"SRAM"#)
    
        // KiteSpring Inc.
        #expect(CompanyIdentifier.kitespring.rawValue == 2356)
        #expect(CompanyIdentifier.kitespring.name == #"KiteSpring Inc."#)
        #expect(CompanyIdentifier.kitespring.description == #"KiteSpring Inc."#)
    
        // Reconnect, Inc.
        #expect(CompanyIdentifier.reconnect.rawValue == 2357)
        #expect(CompanyIdentifier.reconnect.name == #"Reconnect, Inc."#)
        #expect(CompanyIdentifier.reconnect.description == #"Reconnect, Inc."#)
    
        // Elekon AG
        #expect(CompanyIdentifier.elekon.rawValue == 2358)
        #expect(CompanyIdentifier.elekon.name == #"Elekon AG"#)
        #expect(CompanyIdentifier.elekon.description == #"Elekon AG"#)
    
        // RealThingks GmbH
        #expect(CompanyIdentifier.realthingks.rawValue == 2359)
        #expect(CompanyIdentifier.realthingks.name == #"RealThingks GmbH"#)
        #expect(CompanyIdentifier.realthingks.description == #"RealThingks GmbH"#)
    
        // Henway Technologies, LTD.
        #expect(CompanyIdentifier.henwayTechnologies.rawValue == 2360)
        #expect(CompanyIdentifier.henwayTechnologies.name == #"Henway Technologies, LTD."#)
        #expect(CompanyIdentifier.henwayTechnologies.description == #"Henway Technologies, LTD."#)
    
        // ASTEM Co.,Ltd.
        #expect(CompanyIdentifier.astem.rawValue == 2361)
        #expect(CompanyIdentifier.astem.name == #"ASTEM Co.,Ltd."#)
        #expect(CompanyIdentifier.astem.description == #"ASTEM Co.,Ltd."#)
    
        // LinkedSemi Microelectronics (Xiamen) Co., Ltd
        #expect(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.rawValue == 2362)
        #expect(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.name == #"LinkedSemi Microelectronics (Xiamen) Co., Ltd"#)
        #expect(CompanyIdentifier.linkedsemiMicroelectronicsXiamen.description == #"LinkedSemi Microelectronics (Xiamen) Co., Ltd"#)
    
        // ENSESO LLC
        #expect(CompanyIdentifier.enseso.rawValue == 2363)
        #expect(CompanyIdentifier.enseso.name == #"ENSESO LLC"#)
        #expect(CompanyIdentifier.enseso.description == #"ENSESO LLC"#)
    
        // Xenoma Inc.
        #expect(CompanyIdentifier.xenoma.rawValue == 2364)
        #expect(CompanyIdentifier.xenoma.name == #"Xenoma Inc."#)
        #expect(CompanyIdentifier.xenoma.description == #"Xenoma Inc."#)
    
        // Adolf Wuerth GmbH & Co KG
        #expect(CompanyIdentifier.adolfWuerth.rawValue == 2365)
        #expect(CompanyIdentifier.adolfWuerth.name == #"Adolf Wuerth GmbH & Co KG"#)
        #expect(CompanyIdentifier.adolfWuerth.description == #"Adolf Wuerth GmbH & Co KG"#)
    
        // Catalyft Labs, Inc.
        #expect(CompanyIdentifier.catalyftLabs.rawValue == 2366)
        #expect(CompanyIdentifier.catalyftLabs.name == #"Catalyft Labs, Inc."#)
        #expect(CompanyIdentifier.catalyftLabs.description == #"Catalyft Labs, Inc."#)
    
        // JEPICO Corporation
        #expect(CompanyIdentifier.jepico.rawValue == 2367)
        #expect(CompanyIdentifier.jepico.name == #"JEPICO Corporation"#)
        #expect(CompanyIdentifier.jepico.description == #"JEPICO Corporation"#)
    
        // Hero Workout GmbH
        #expect(CompanyIdentifier.heroWorkout.rawValue == 2368)
        #expect(CompanyIdentifier.heroWorkout.name == #"Hero Workout GmbH"#)
        #expect(CompanyIdentifier.heroWorkout.description == #"Hero Workout GmbH"#)
    
        // Rivian Automotive, LLC
        #expect(CompanyIdentifier.rivianAutomotive.rawValue == 2369)
        #expect(CompanyIdentifier.rivianAutomotive.name == #"Rivian Automotive, LLC"#)
        #expect(CompanyIdentifier.rivianAutomotive.description == #"Rivian Automotive, LLC"#)
    
        // TRANSSION HOLDINGS LIMITED
        #expect(CompanyIdentifier.transsionHoldings.rawValue == 2370)
        #expect(CompanyIdentifier.transsionHoldings.name == #"TRANSSION HOLDINGS LIMITED"#)
        #expect(CompanyIdentifier.transsionHoldings.description == #"TRANSSION HOLDINGS LIMITED"#)
    
        // Agitron d.o.o.
        #expect(CompanyIdentifier.agitron.rawValue == 2372)
        #expect(CompanyIdentifier.agitron.name == #"Agitron d.o.o."#)
        #expect(CompanyIdentifier.agitron.description == #"Agitron d.o.o."#)
    
        // Globe (Jiangsu) Co., Ltd
        #expect(CompanyIdentifier.globeJiangsu.rawValue == 2373)
        #expect(CompanyIdentifier.globeJiangsu.name == #"Globe (Jiangsu) Co., Ltd"#)
        #expect(CompanyIdentifier.globeJiangsu.description == #"Globe (Jiangsu) Co., Ltd"#)
    
        // AMC International Alfa Metalcraft Corporation AG
        #expect(CompanyIdentifier.amcInternationalAlfaMetalcraft.rawValue == 2374)
        #expect(CompanyIdentifier.amcInternationalAlfaMetalcraft.name == #"AMC International Alfa Metalcraft Corporation AG"#)
        #expect(CompanyIdentifier.amcInternationalAlfaMetalcraft.description == #"AMC International Alfa Metalcraft Corporation AG"#)
    
        // First Light Technologies Ltd.
        #expect(CompanyIdentifier.firstLightTechnologies.rawValue == 2375)
        #expect(CompanyIdentifier.firstLightTechnologies.name == #"First Light Technologies Ltd."#)
        #expect(CompanyIdentifier.firstLightTechnologies.description == #"First Light Technologies Ltd."#)
    
        // Wearable Link Limited
        #expect(CompanyIdentifier.wearableLink.rawValue == 2376)
        #expect(CompanyIdentifier.wearableLink.name == #"Wearable Link Limited"#)
        #expect(CompanyIdentifier.wearableLink.description == #"Wearable Link Limited"#)
    
        // Metronom Health Europe
        #expect(CompanyIdentifier.metronomHealthEurope.rawValue == 2377)
        #expect(CompanyIdentifier.metronomHealthEurope.name == #"Metronom Health Europe"#)
        #expect(CompanyIdentifier.metronomHealthEurope.description == #"Metronom Health Europe"#)
    
        // Zwift, Inc.
        #expect(CompanyIdentifier.zwift.rawValue == 2378)
        #expect(CompanyIdentifier.zwift.name == #"Zwift, Inc."#)
        #expect(CompanyIdentifier.zwift.description == #"Zwift, Inc."#)
    
        // Kindeva Drug Delivery L.P.
        #expect(CompanyIdentifier.kindevaDrugDeliveryLP.rawValue == 2379)
        #expect(CompanyIdentifier.kindevaDrugDeliveryLP.name == #"Kindeva Drug Delivery L.P."#)
        #expect(CompanyIdentifier.kindevaDrugDeliveryLP.description == #"Kindeva Drug Delivery L.P."#)
    
        // GimmiSys GmbH
        #expect(CompanyIdentifier.gimmisys.rawValue == 2380)
        #expect(CompanyIdentifier.gimmisys.name == #"GimmiSys GmbH"#)
        #expect(CompanyIdentifier.gimmisys.description == #"GimmiSys GmbH"#)
    
        // tkLABS INC.
        #expect(CompanyIdentifier.tklabs.rawValue == 2381)
        #expect(CompanyIdentifier.tklabs.name == #"tkLABS INC."#)
        #expect(CompanyIdentifier.tklabs.description == #"tkLABS INC."#)
    
        // PassiveBolt, Inc.
        #expect(CompanyIdentifier.passivebolt.rawValue == 2382)
        #expect(CompanyIdentifier.passivebolt.name == #"PassiveBolt, Inc."#)
        #expect(CompanyIdentifier.passivebolt.description == #"PassiveBolt, Inc."#)
    
        // Limited Liability Company "Mikrotikls"
        #expect(CompanyIdentifier.mikrotikls.rawValue == 2383)
        #expect(CompanyIdentifier.mikrotikls.name == #"Limited Liability Company "Mikrotikls""#)
        #expect(CompanyIdentifier.mikrotikls.description == #"Limited Liability Company "Mikrotikls""#)
    
        // Capetech
        #expect(CompanyIdentifier.capetech.rawValue == 2384)
        #expect(CompanyIdentifier.capetech.name == #"Capetech"#)
        #expect(CompanyIdentifier.capetech.description == #"Capetech"#)
    
        // PPRS
        #expect(CompanyIdentifier.pprs.rawValue == 2385)
        #expect(CompanyIdentifier.pprs.name == #"PPRS"#)
        #expect(CompanyIdentifier.pprs.description == #"PPRS"#)
    
        // Apptricity Corporation
        #expect(CompanyIdentifier.apptricity.rawValue == 2386)
        #expect(CompanyIdentifier.apptricity.name == #"Apptricity Corporation"#)
        #expect(CompanyIdentifier.apptricity.description == #"Apptricity Corporation"#)
    
        // LogiLube, LLC
        #expect(CompanyIdentifier.logilube.rawValue == 2387)
        #expect(CompanyIdentifier.logilube.name == #"LogiLube, LLC"#)
        #expect(CompanyIdentifier.logilube.description == #"LogiLube, LLC"#)
    
        // Julbo
        #expect(CompanyIdentifier.julbo.rawValue == 2388)
        #expect(CompanyIdentifier.julbo.name == #"Julbo"#)
        #expect(CompanyIdentifier.julbo.description == #"Julbo"#)
    
        // Breville Group
        #expect(CompanyIdentifier.brevilleGroup.rawValue == 2389)
        #expect(CompanyIdentifier.brevilleGroup.name == #"Breville Group"#)
        #expect(CompanyIdentifier.brevilleGroup.description == #"Breville Group"#)
    
        // Kerlink
        #expect(CompanyIdentifier.kerlink.rawValue == 2390)
        #expect(CompanyIdentifier.kerlink.name == #"Kerlink"#)
        #expect(CompanyIdentifier.kerlink.description == #"Kerlink"#)
    
        // Ohsung Electronics
        #expect(CompanyIdentifier.ohsungElectronics.rawValue == 2391)
        #expect(CompanyIdentifier.ohsungElectronics.name == #"Ohsung Electronics"#)
        #expect(CompanyIdentifier.ohsungElectronics.description == #"Ohsung Electronics"#)
    
        // ZTE Corporation
        #expect(CompanyIdentifier.zte.rawValue == 2392)
        #expect(CompanyIdentifier.zte.name == #"ZTE Corporation"#)
        #expect(CompanyIdentifier.zte.description == #"ZTE Corporation"#)
    
        // HerdDogg, Inc
        #expect(CompanyIdentifier.herddogg.rawValue == 2393)
        #expect(CompanyIdentifier.herddogg.name == #"HerdDogg, Inc"#)
        #expect(CompanyIdentifier.herddogg.description == #"HerdDogg, Inc"#)
    
        // Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi
        #expect(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.rawValue == 2394)
        #expect(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.name == #"Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi"#)
        #expect(CompanyIdentifier.selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi.description == #"Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi"#)
    
        // Lismore Instruments Limited
        #expect(CompanyIdentifier.lismoreInstruments.rawValue == 2395)
        #expect(CompanyIdentifier.lismoreInstruments.name == #"Lismore Instruments Limited"#)
        #expect(CompanyIdentifier.lismoreInstruments.description == #"Lismore Instruments Limited"#)
    
        // LogiLube, LLC
        #expect(CompanyIdentifier.logilube2.rawValue == 2396)
        #expect(CompanyIdentifier.logilube2.name == #"LogiLube, LLC"#)
        #expect(CompanyIdentifier.logilube2.description == #"LogiLube, LLC"#)
    
        // Electronic Theatre Controls
        #expect(CompanyIdentifier.electronicTheatreControls.rawValue == 2397)
        #expect(CompanyIdentifier.electronicTheatreControls.name == #"Electronic Theatre Controls"#)
        #expect(CompanyIdentifier.electronicTheatreControls.description == #"Electronic Theatre Controls"#)
    
        // BioEchoNet inc.
        #expect(CompanyIdentifier.bioechonet.rawValue == 2398)
        #expect(CompanyIdentifier.bioechonet.name == #"BioEchoNet inc."#)
        #expect(CompanyIdentifier.bioechonet.description == #"BioEchoNet inc."#)
    
        // NUANCE HEARING LTD
        #expect(CompanyIdentifier.nuanceHearing.rawValue == 2399)
        #expect(CompanyIdentifier.nuanceHearing.name == #"NUANCE HEARING LTD"#)
        #expect(CompanyIdentifier.nuanceHearing.description == #"NUANCE HEARING LTD"#)
    
        // Sena Technologies Inc.
        #expect(CompanyIdentifier.senaTechnologies.rawValue == 2400)
        #expect(CompanyIdentifier.senaTechnologies.name == #"Sena Technologies Inc."#)
        #expect(CompanyIdentifier.senaTechnologies.description == #"Sena Technologies Inc."#)
    
        // Linkura AB
        #expect(CompanyIdentifier.linkura.rawValue == 2401)
        #expect(CompanyIdentifier.linkura.name == #"Linkura AB"#)
        #expect(CompanyIdentifier.linkura.description == #"Linkura AB"#)
    
        // GL Solutions K.K.
        #expect(CompanyIdentifier.glSolutionsKK.rawValue == 2402)
        #expect(CompanyIdentifier.glSolutionsKK.name == #"GL Solutions K.K."#)
        #expect(CompanyIdentifier.glSolutionsKK.description == #"GL Solutions K.K."#)
    
        // Moonbird BV
        #expect(CompanyIdentifier.moonbird.rawValue == 2403)
        #expect(CompanyIdentifier.moonbird.name == #"Moonbird BV"#)
        #expect(CompanyIdentifier.moonbird.description == #"Moonbird BV"#)
    
        // Countrymate Technology Limited
        #expect(CompanyIdentifier.countrymateTechnology.rawValue == 2404)
        #expect(CompanyIdentifier.countrymateTechnology.name == #"Countrymate Technology Limited"#)
        #expect(CompanyIdentifier.countrymateTechnology.description == #"Countrymate Technology Limited"#)
    
        // Asahi Kasei Corporation
        #expect(CompanyIdentifier.asahiKasei.rawValue == 2405)
        #expect(CompanyIdentifier.asahiKasei.name == #"Asahi Kasei Corporation"#)
        #expect(CompanyIdentifier.asahiKasei.description == #"Asahi Kasei Corporation"#)
    
        // PointGuard, LLC
        #expect(CompanyIdentifier.pointguard.rawValue == 2406)
        #expect(CompanyIdentifier.pointguard.name == #"PointGuard, LLC"#)
        #expect(CompanyIdentifier.pointguard.description == #"PointGuard, LLC"#)
    
        // Neo Materials and Consulting Inc.
        #expect(CompanyIdentifier.neoMaterialsAndConsulting.rawValue == 2407)
        #expect(CompanyIdentifier.neoMaterialsAndConsulting.name == #"Neo Materials and Consulting Inc."#)
        #expect(CompanyIdentifier.neoMaterialsAndConsulting.description == #"Neo Materials and Consulting Inc."#)
    
        // Actev Motors, Inc.
        #expect(CompanyIdentifier.actevMotors.rawValue == 2408)
        #expect(CompanyIdentifier.actevMotors.name == #"Actev Motors, Inc."#)
        #expect(CompanyIdentifier.actevMotors.description == #"Actev Motors, Inc."#)
    
        // Woan Technology (Shenzhen) Co., Ltd.
        #expect(CompanyIdentifier.woanTechnologyShenzhen.rawValue == 2409)
        #expect(CompanyIdentifier.woanTechnologyShenzhen.name == #"Woan Technology (Shenzhen) Co., Ltd."#)
        #expect(CompanyIdentifier.woanTechnologyShenzhen.description == #"Woan Technology (Shenzhen) Co., Ltd."#)
    
        // dricos, Inc.
        #expect(CompanyIdentifier.dricos.rawValue == 2410)
        #expect(CompanyIdentifier.dricos.name == #"dricos, Inc."#)
        #expect(CompanyIdentifier.dricos.description == #"dricos, Inc."#)
    
        // Guide ID B.V.
        #expect(CompanyIdentifier.guideId.rawValue == 2411)
        #expect(CompanyIdentifier.guideId.name == #"Guide ID B.V."#)
        #expect(CompanyIdentifier.guideId.description == #"Guide ID B.V."#)
    
        // 9374-7319 Quebec inc
        #expect(CompanyIdentifier.company93747319Quebec.rawValue == 2412)
        #expect(CompanyIdentifier.company93747319Quebec.name == #"9374-7319 Quebec inc"#)
        #expect(CompanyIdentifier.company93747319Quebec.description == #"9374-7319 Quebec inc"#)
    
        // Gunwerks, LLC
        #expect(CompanyIdentifier.gunwerks.rawValue == 2413)
        #expect(CompanyIdentifier.gunwerks.name == #"Gunwerks, LLC"#)
        #expect(CompanyIdentifier.gunwerks.description == #"Gunwerks, LLC"#)
    
        // Band Industries, inc.
        #expect(CompanyIdentifier.bandIndustries.rawValue == 2414)
        #expect(CompanyIdentifier.bandIndustries.name == #"Band Industries, inc."#)
        #expect(CompanyIdentifier.bandIndustries.description == #"Band Industries, inc."#)
    
        // Lund Motion Products, Inc.
        #expect(CompanyIdentifier.lundMotionProducts.rawValue == 2415)
        #expect(CompanyIdentifier.lundMotionProducts.name == #"Lund Motion Products, Inc."#)
        #expect(CompanyIdentifier.lundMotionProducts.description == #"Lund Motion Products, Inc."#)
    
        // IBA Dosimetry GmbH
        #expect(CompanyIdentifier.ibaDosimetry.rawValue == 2416)
        #expect(CompanyIdentifier.ibaDosimetry.name == #"IBA Dosimetry GmbH"#)
        #expect(CompanyIdentifier.ibaDosimetry.description == #"IBA Dosimetry GmbH"#)
    
        // GA
        #expect(CompanyIdentifier.ga.rawValue == 2417)
        #expect(CompanyIdentifier.ga.name == #"GA"#)
        #expect(CompanyIdentifier.ga.description == #"GA"#)
    
        // Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)
        #expect(CompanyIdentifier.zavodFlometrZavodFlometrCjsc.rawValue == 2418)
        #expect(CompanyIdentifier.zavodFlometrZavodFlometrCjsc.name == #"Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)"#)
        #expect(CompanyIdentifier.zavodFlometrZavodFlometrCjsc.description == #"Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC)"#)
    
        // Popit Oy
        #expect(CompanyIdentifier.popit.rawValue == 2419)
        #expect(CompanyIdentifier.popit.name == #"Popit Oy"#)
        #expect(CompanyIdentifier.popit.description == #"Popit Oy"#)
    
        // ABEYE
        #expect(CompanyIdentifier.abeye.rawValue == 2420)
        #expect(CompanyIdentifier.abeye.name == #"ABEYE"#)
        #expect(CompanyIdentifier.abeye.description == #"ABEYE"#)
    
        // BlueIOT(Beijing) Technology Co.,Ltd
        #expect(CompanyIdentifier.blueiotBeijingTechnology.rawValue == 2421)
        #expect(CompanyIdentifier.blueiotBeijingTechnology.name == #"BlueIOT(Beijing) Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.blueiotBeijingTechnology.description == #"BlueIOT(Beijing) Technology Co.,Ltd"#)
    
        // Fauna Audio GmbH
        #expect(CompanyIdentifier.faunaAudio.rawValue == 2422)
        #expect(CompanyIdentifier.faunaAudio.name == #"Fauna Audio GmbH"#)
        #expect(CompanyIdentifier.faunaAudio.description == #"Fauna Audio GmbH"#)
    
        // TOYOTA motor corporation
        #expect(CompanyIdentifier.toyotaMotor.rawValue == 2423)
        #expect(CompanyIdentifier.toyotaMotor.name == #"TOYOTA motor corporation"#)
        #expect(CompanyIdentifier.toyotaMotor.description == #"TOYOTA motor corporation"#)
    
        // ZifferEins GmbH & Co. KG
        #expect(CompanyIdentifier.ziffereins.rawValue == 2424)
        #expect(CompanyIdentifier.ziffereins.name == #"ZifferEins GmbH & Co. KG"#)
        #expect(CompanyIdentifier.ziffereins.description == #"ZifferEins GmbH & Co. KG"#)
    
        // BIOTRONIK SE & Co. KG
        #expect(CompanyIdentifier.biotronikSeKg.rawValue == 2425)
        #expect(CompanyIdentifier.biotronikSeKg.name == #"BIOTRONIK SE & Co. KG"#)
        #expect(CompanyIdentifier.biotronikSeKg.description == #"BIOTRONIK SE & Co. KG"#)
    
        // CORE CORPORATION
        #expect(CompanyIdentifier.core.rawValue == 2426)
        #expect(CompanyIdentifier.core.name == #"CORE CORPORATION"#)
        #expect(CompanyIdentifier.core.description == #"CORE CORPORATION"#)
    
        // CTEK Sweden AB
        #expect(CompanyIdentifier.ctekSweden.rawValue == 2427)
        #expect(CompanyIdentifier.ctekSweden.name == #"CTEK Sweden AB"#)
        #expect(CompanyIdentifier.ctekSweden.description == #"CTEK Sweden AB"#)
    
        // Thorley Industries, LLC
        #expect(CompanyIdentifier.thorleyIndustries.rawValue == 2428)
        #expect(CompanyIdentifier.thorleyIndustries.name == #"Thorley Industries, LLC"#)
        #expect(CompanyIdentifier.thorleyIndustries.description == #"Thorley Industries, LLC"#)
    
        // CLB B.V.
        #expect(CompanyIdentifier.clb.rawValue == 2429)
        #expect(CompanyIdentifier.clb.name == #"CLB B.V."#)
        #expect(CompanyIdentifier.clb.description == #"CLB B.V."#)
    
        // SonicSensory Inc
        #expect(CompanyIdentifier.sonicsensory.rawValue == 2430)
        #expect(CompanyIdentifier.sonicsensory.name == #"SonicSensory Inc"#)
        #expect(CompanyIdentifier.sonicsensory.description == #"SonicSensory Inc"#)
    
        // ISEMAR S.R.L.
        #expect(CompanyIdentifier.isemar.rawValue == 2431)
        #expect(CompanyIdentifier.isemar.name == #"ISEMAR S.R.L."#)
        #expect(CompanyIdentifier.isemar.description == #"ISEMAR S.R.L."#)
    
        // DEKRA TESTING AND CERTIFICATION, S.A.U.
        #expect(CompanyIdentifier.dekraTestingAndCertificationU.rawValue == 2432)
        #expect(CompanyIdentifier.dekraTestingAndCertificationU.name == #"DEKRA TESTING AND CERTIFICATION, S.A.U."#)
        #expect(CompanyIdentifier.dekraTestingAndCertificationU.description == #"DEKRA TESTING AND CERTIFICATION, S.A.U."#)
    
        // Bernard Krone Holding SE & Co.KG
        #expect(CompanyIdentifier.bernardKroneHoldingSeKg.rawValue == 2433)
        #expect(CompanyIdentifier.bernardKroneHoldingSeKg.name == #"Bernard Krone Holding SE & Co.KG"#)
        #expect(CompanyIdentifier.bernardKroneHoldingSeKg.description == #"Bernard Krone Holding SE & Co.KG"#)
    
        // ELPRO-BUCHS AG
        #expect(CompanyIdentifier.elproBuchs.rawValue == 2434)
        #expect(CompanyIdentifier.elproBuchs.name == #"ELPRO-BUCHS AG"#)
        #expect(CompanyIdentifier.elproBuchs.description == #"ELPRO-BUCHS AG"#)
    
        // Feedback Sports LLC
        #expect(CompanyIdentifier.feedbackSports.rawValue == 2435)
        #expect(CompanyIdentifier.feedbackSports.name == #"Feedback Sports LLC"#)
        #expect(CompanyIdentifier.feedbackSports.description == #"Feedback Sports LLC"#)
    
        // TeraTron GmbH
        #expect(CompanyIdentifier.teratron.rawValue == 2436)
        #expect(CompanyIdentifier.teratron.name == #"TeraTron GmbH"#)
        #expect(CompanyIdentifier.teratron.description == #"TeraTron GmbH"#)
    
        // Lumos Health Inc.
        #expect(CompanyIdentifier.lumosHealth.rawValue == 2437)
        #expect(CompanyIdentifier.lumosHealth.name == #"Lumos Health Inc."#)
        #expect(CompanyIdentifier.lumosHealth.description == #"Lumos Health Inc."#)
    
        // Cello Hill, LLC
        #expect(CompanyIdentifier.celloHill.rawValue == 2438)
        #expect(CompanyIdentifier.celloHill.name == #"Cello Hill, LLC"#)
        #expect(CompanyIdentifier.celloHill.description == #"Cello Hill, LLC"#)
    
        // TSE BRAKES, INC.
        #expect(CompanyIdentifier.tseBrakes.rawValue == 2439)
        #expect(CompanyIdentifier.tseBrakes.name == #"TSE BRAKES, INC."#)
        #expect(CompanyIdentifier.tseBrakes.description == #"TSE BRAKES, INC."#)
    
        // BHM-Tech Produktionsgesellschaft m.b.H
        #expect(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.rawValue == 2440)
        #expect(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.name == #"BHM-Tech Produktionsgesellschaft m.b.H"#)
        #expect(CompanyIdentifier.bhmTechProduktionsgesellschaftMBH.description == #"BHM-Tech Produktionsgesellschaft m.b.H"#)
    
        // WIKA Alexander Wiegand SE & Co.KG
        #expect(CompanyIdentifier.wikaAlexanderWiegandSeKg.rawValue == 2441)
        #expect(CompanyIdentifier.wikaAlexanderWiegandSeKg.name == #"WIKA Alexander Wiegand SE & Co.KG"#)
        #expect(CompanyIdentifier.wikaAlexanderWiegandSeKg.description == #"WIKA Alexander Wiegand SE & Co.KG"#)
    
        // Biovigil
        #expect(CompanyIdentifier.biovigil.rawValue == 2442)
        #expect(CompanyIdentifier.biovigil.name == #"Biovigil"#)
        #expect(CompanyIdentifier.biovigil.description == #"Biovigil"#)
    
        // Mequonic Engineering, S.L.
        #expect(CompanyIdentifier.mequonicEngineering.rawValue == 2443)
        #expect(CompanyIdentifier.mequonicEngineering.name == #"Mequonic Engineering, S.L."#)
        #expect(CompanyIdentifier.mequonicEngineering.description == #"Mequonic Engineering, S.L."#)
    
        // bGrid B.V.
        #expect(CompanyIdentifier.bgrid.rawValue == 2444)
        #expect(CompanyIdentifier.bgrid.name == #"bGrid B.V."#)
        #expect(CompanyIdentifier.bgrid.description == #"bGrid B.V."#)
    
        // C3-WIRELESS, LLC
        #expect(CompanyIdentifier.c3Wireless.rawValue == 2445)
        #expect(CompanyIdentifier.c3Wireless.name == #"C3-WIRELESS, LLC"#)
        #expect(CompanyIdentifier.c3Wireless.description == #"C3-WIRELESS, LLC"#)
    
        // ADVEEZ
        #expect(CompanyIdentifier.adveez.rawValue == 2446)
        #expect(CompanyIdentifier.adveez.name == #"ADVEEZ"#)
        #expect(CompanyIdentifier.adveez.description == #"ADVEEZ"#)
    
        // Aktiebolaget Regin
        #expect(CompanyIdentifier.aktiebolagetRegin.rawValue == 2447)
        #expect(CompanyIdentifier.aktiebolagetRegin.name == #"Aktiebolaget Regin"#)
        #expect(CompanyIdentifier.aktiebolagetRegin.description == #"Aktiebolaget Regin"#)
    
        // Anton Paar GmbH
        #expect(CompanyIdentifier.antonPaar.rawValue == 2448)
        #expect(CompanyIdentifier.antonPaar.name == #"Anton Paar GmbH"#)
        #expect(CompanyIdentifier.antonPaar.description == #"Anton Paar GmbH"#)
    
        // Telenor ASA
        #expect(CompanyIdentifier.telenor.rawValue == 2449)
        #expect(CompanyIdentifier.telenor.name == #"Telenor ASA"#)
        #expect(CompanyIdentifier.telenor.description == #"Telenor ASA"#)
    
        // Big Kaiser Precision Tooling Ltd
        #expect(CompanyIdentifier.bigKaiserPrecisionTooling.rawValue == 2450)
        #expect(CompanyIdentifier.bigKaiserPrecisionTooling.name == #"Big Kaiser Precision Tooling Ltd"#)
        #expect(CompanyIdentifier.bigKaiserPrecisionTooling.description == #"Big Kaiser Precision Tooling Ltd"#)
    
        // Absolute Audio Labs B.V.
        #expect(CompanyIdentifier.absoluteAudioLabs.rawValue == 2451)
        #expect(CompanyIdentifier.absoluteAudioLabs.name == #"Absolute Audio Labs B.V."#)
        #expect(CompanyIdentifier.absoluteAudioLabs.description == #"Absolute Audio Labs B.V."#)
    
        // VT42 Pty Ltd
        #expect(CompanyIdentifier.vt42.rawValue == 2452)
        #expect(CompanyIdentifier.vt42.name == #"VT42 Pty Ltd"#)
        #expect(CompanyIdentifier.vt42.description == #"VT42 Pty Ltd"#)
    
        // Bronkhorst High-Tech B.V.
        #expect(CompanyIdentifier.bronkhorstHighTech.rawValue == 2453)
        #expect(CompanyIdentifier.bronkhorstHighTech.name == #"Bronkhorst High-Tech B.V."#)
        #expect(CompanyIdentifier.bronkhorstHighTech.description == #"Bronkhorst High-Tech B.V."#)
    
        // C. & E. Fein GmbH
        #expect(CompanyIdentifier.cEFein.rawValue == 2454)
        #expect(CompanyIdentifier.cEFein.name == #"C. & E. Fein GmbH"#)
        #expect(CompanyIdentifier.cEFein.description == #"C. & E. Fein GmbH"#)
    
        // NextMind
        #expect(CompanyIdentifier.nextmind.rawValue == 2455)
        #expect(CompanyIdentifier.nextmind.name == #"NextMind"#)
        #expect(CompanyIdentifier.nextmind.description == #"NextMind"#)
    
        // Pixie Dust Technologies, Inc.
        #expect(CompanyIdentifier.pixieDustTechnologies.rawValue == 2456)
        #expect(CompanyIdentifier.pixieDustTechnologies.name == #"Pixie Dust Technologies, Inc."#)
        #expect(CompanyIdentifier.pixieDustTechnologies.description == #"Pixie Dust Technologies, Inc."#)
    
        // eTactica ehf
        #expect(CompanyIdentifier.etacticaEhf.rawValue == 2457)
        #expect(CompanyIdentifier.etacticaEhf.name == #"eTactica ehf"#)
        #expect(CompanyIdentifier.etacticaEhf.description == #"eTactica ehf"#)
    
        // New Audio LLC
        #expect(CompanyIdentifier.newAudio.rawValue == 2458)
        #expect(CompanyIdentifier.newAudio.name == #"New Audio LLC"#)
        #expect(CompanyIdentifier.newAudio.description == #"New Audio LLC"#)
    
        // Sendum Wireless Corporation
        #expect(CompanyIdentifier.sendumWireless.rawValue == 2459)
        #expect(CompanyIdentifier.sendumWireless.name == #"Sendum Wireless Corporation"#)
        #expect(CompanyIdentifier.sendumWireless.description == #"Sendum Wireless Corporation"#)
    
        // deister electronic GmbH
        #expect(CompanyIdentifier.deisterElectronic.rawValue == 2460)
        #expect(CompanyIdentifier.deisterElectronic.name == #"deister electronic GmbH"#)
        #expect(CompanyIdentifier.deisterElectronic.description == #"deister electronic GmbH"#)
    
        // YKK AP Inc.
        #expect(CompanyIdentifier.ykkAp.rawValue == 2461)
        #expect(CompanyIdentifier.ykkAp.name == #"YKK AP Inc."#)
        #expect(CompanyIdentifier.ykkAp.description == #"YKK AP Inc."#)
    
        // Step One Limited
        #expect(CompanyIdentifier.stepOne.rawValue == 2462)
        #expect(CompanyIdentifier.stepOne.name == #"Step One Limited"#)
        #expect(CompanyIdentifier.stepOne.description == #"Step One Limited"#)
    
        // Koya Medical, Inc.
        #expect(CompanyIdentifier.koyaMedical.rawValue == 2463)
        #expect(CompanyIdentifier.koyaMedical.name == #"Koya Medical, Inc."#)
        #expect(CompanyIdentifier.koyaMedical.description == #"Koya Medical, Inc."#)
    
        // Proof Diagnostics, Inc.
        #expect(CompanyIdentifier.proofDiagnostics.rawValue == 2464)
        #expect(CompanyIdentifier.proofDiagnostics.name == #"Proof Diagnostics, Inc."#)
        #expect(CompanyIdentifier.proofDiagnostics.description == #"Proof Diagnostics, Inc."#)
    
        // VOS Systems, LLC
        #expect(CompanyIdentifier.vosSystems.rawValue == 2465)
        #expect(CompanyIdentifier.vosSystems.name == #"VOS Systems, LLC"#)
        #expect(CompanyIdentifier.vosSystems.description == #"VOS Systems, LLC"#)
    
        // ENGAGENOW DATA SCIENCES PRIVATE LIMITED
        #expect(CompanyIdentifier.engagenowDataSciences.rawValue == 2466)
        #expect(CompanyIdentifier.engagenowDataSciences.name == #"ENGAGENOW DATA SCIENCES PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.engagenowDataSciences.description == #"ENGAGENOW DATA SCIENCES PRIVATE LIMITED"#)
    
        // ARDUINO SA
        #expect(CompanyIdentifier.arduino.rawValue == 2467)
        #expect(CompanyIdentifier.arduino.name == #"ARDUINO SA"#)
        #expect(CompanyIdentifier.arduino.description == #"ARDUINO SA"#)
    
        // KUMHO ELECTRICS, INC
        #expect(CompanyIdentifier.kumhoElectrics.rawValue == 2468)
        #expect(CompanyIdentifier.kumhoElectrics.name == #"KUMHO ELECTRICS, INC"#)
        #expect(CompanyIdentifier.kumhoElectrics.description == #"KUMHO ELECTRICS, INC"#)
    
        // Security Enhancement Systems, LLC
        #expect(CompanyIdentifier.securityEnhancementSystems.rawValue == 2469)
        #expect(CompanyIdentifier.securityEnhancementSystems.name == #"Security Enhancement Systems, LLC"#)
        #expect(CompanyIdentifier.securityEnhancementSystems.description == #"Security Enhancement Systems, LLC"#)
    
        // BEIJING ELECTRIC VEHICLE CO.,LTD
        #expect(CompanyIdentifier.beijingElectricVehicle.rawValue == 2470)
        #expect(CompanyIdentifier.beijingElectricVehicle.name == #"BEIJING ELECTRIC VEHICLE CO.,LTD"#)
        #expect(CompanyIdentifier.beijingElectricVehicle.description == #"BEIJING ELECTRIC VEHICLE CO.,LTD"#)
    
        // Paybuddy ApS
        #expect(CompanyIdentifier.paybuddy.rawValue == 2471)
        #expect(CompanyIdentifier.paybuddy.name == #"Paybuddy ApS"#)
        #expect(CompanyIdentifier.paybuddy.description == #"Paybuddy ApS"#)
    
        // KHN Solutions LLC
        #expect(CompanyIdentifier.khnSolutions.rawValue == 2472)
        #expect(CompanyIdentifier.khnSolutions.name == #"KHN Solutions LLC"#)
        #expect(CompanyIdentifier.khnSolutions.description == #"KHN Solutions LLC"#)
    
        // Nippon Ceramic Co.,Ltd.
        #expect(CompanyIdentifier.nipponCeramic.rawValue == 2473)
        #expect(CompanyIdentifier.nipponCeramic.name == #"Nippon Ceramic Co.,Ltd."#)
        #expect(CompanyIdentifier.nipponCeramic.description == #"Nippon Ceramic Co.,Ltd."#)
    
        // PHOTODYNAMIC INCORPORATED
        #expect(CompanyIdentifier.photodynamic.rawValue == 2474)
        #expect(CompanyIdentifier.photodynamic.name == #"PHOTODYNAMIC INCORPORATED"#)
        #expect(CompanyIdentifier.photodynamic.description == #"PHOTODYNAMIC INCORPORATED"#)
    
        // DashLogic, Inc.
        #expect(CompanyIdentifier.dashlogic.rawValue == 2475)
        #expect(CompanyIdentifier.dashlogic.name == #"DashLogic, Inc."#)
        #expect(CompanyIdentifier.dashlogic.description == #"DashLogic, Inc."#)
    
        // Ambiq
        #expect(CompanyIdentifier.ambiq.rawValue == 2476)
        #expect(CompanyIdentifier.ambiq.name == #"Ambiq"#)
        #expect(CompanyIdentifier.ambiq.description == #"Ambiq"#)
    
        // Narhwall Inc.
        #expect(CompanyIdentifier.narhwall.rawValue == 2477)
        #expect(CompanyIdentifier.narhwall.name == #"Narhwall Inc."#)
        #expect(CompanyIdentifier.narhwall.description == #"Narhwall Inc."#)
    
        // Pozyx NV
        #expect(CompanyIdentifier.pozyx.rawValue == 2478)
        #expect(CompanyIdentifier.pozyx.name == #"Pozyx NV"#)
        #expect(CompanyIdentifier.pozyx.description == #"Pozyx NV"#)
    
        // ifLink Open Community
        #expect(CompanyIdentifier.iflinkOpenCommunity.rawValue == 2479)
        #expect(CompanyIdentifier.iflinkOpenCommunity.name == #"ifLink Open Community"#)
        #expect(CompanyIdentifier.iflinkOpenCommunity.description == #"ifLink Open Community"#)
    
        // Deublin Company, LLC
        #expect(CompanyIdentifier.deublin.rawValue == 2480)
        #expect(CompanyIdentifier.deublin.name == #"Deublin Company, LLC"#)
        #expect(CompanyIdentifier.deublin.description == #"Deublin Company, LLC"#)
    
        // BLINQY
        #expect(CompanyIdentifier.blinqy.rawValue == 2481)
        #expect(CompanyIdentifier.blinqy.name == #"BLINQY"#)
        #expect(CompanyIdentifier.blinqy.description == #"BLINQY"#)
    
        // DYPHI
        #expect(CompanyIdentifier.dyphi.rawValue == 2482)
        #expect(CompanyIdentifier.dyphi.name == #"DYPHI"#)
        #expect(CompanyIdentifier.dyphi.description == #"DYPHI"#)
    
        // BlueX Microelectronics Corp Ltd.
        #expect(CompanyIdentifier.bluexMicroelectronics.rawValue == 2483)
        #expect(CompanyIdentifier.bluexMicroelectronics.name == #"BlueX Microelectronics Corp Ltd."#)
        #expect(CompanyIdentifier.bluexMicroelectronics.description == #"BlueX Microelectronics Corp Ltd."#)
    
        // PentaLock Aps.
        #expect(CompanyIdentifier.pentalock.rawValue == 2484)
        #expect(CompanyIdentifier.pentalock.name == #"PentaLock Aps."#)
        #expect(CompanyIdentifier.pentalock.description == #"PentaLock Aps."#)
    
        // AUTEC Gesellschaft fuer Automationstechnik mbH
        #expect(CompanyIdentifier.autecGesellschaftFuerAutomationstechnik.rawValue == 2485)
        #expect(CompanyIdentifier.autecGesellschaftFuerAutomationstechnik.name == #"AUTEC Gesellschaft fuer Automationstechnik mbH"#)
        #expect(CompanyIdentifier.autecGesellschaftFuerAutomationstechnik.description == #"AUTEC Gesellschaft fuer Automationstechnik mbH"#)
    
        // Pegasus Technologies, Inc.
        #expect(CompanyIdentifier.pegasusTechnologies.rawValue == 2486)
        #expect(CompanyIdentifier.pegasusTechnologies.name == #"Pegasus Technologies, Inc."#)
        #expect(CompanyIdentifier.pegasusTechnologies.description == #"Pegasus Technologies, Inc."#)
    
        // Bout Labs, LLC
        #expect(CompanyIdentifier.boutLabs.rawValue == 2487)
        #expect(CompanyIdentifier.boutLabs.name == #"Bout Labs, LLC"#)
        #expect(CompanyIdentifier.boutLabs.description == #"Bout Labs, LLC"#)
    
        // PlayerData Limited
        #expect(CompanyIdentifier.playerdata.rawValue == 2488)
        #expect(CompanyIdentifier.playerdata.name == #"PlayerData Limited"#)
        #expect(CompanyIdentifier.playerdata.description == #"PlayerData Limited"#)
    
        // SAVOY ELECTRONIC LIGHTING
        #expect(CompanyIdentifier.savoyElectronicLighting.rawValue == 2489)
        #expect(CompanyIdentifier.savoyElectronicLighting.name == #"SAVOY ELECTRONIC LIGHTING"#)
        #expect(CompanyIdentifier.savoyElectronicLighting.description == #"SAVOY ELECTRONIC LIGHTING"#)
    
        // Elimo Engineering Ltd
        #expect(CompanyIdentifier.elimoEngineering.rawValue == 2490)
        #expect(CompanyIdentifier.elimoEngineering.name == #"Elimo Engineering Ltd"#)
        #expect(CompanyIdentifier.elimoEngineering.description == #"Elimo Engineering Ltd"#)
    
        // SkyStream Corporation
        #expect(CompanyIdentifier.skystream.rawValue == 2491)
        #expect(CompanyIdentifier.skystream.name == #"SkyStream Corporation"#)
        #expect(CompanyIdentifier.skystream.description == #"SkyStream Corporation"#)
    
        // Aerosens LLC
        #expect(CompanyIdentifier.aerosens.rawValue == 2492)
        #expect(CompanyIdentifier.aerosens.name == #"Aerosens LLC"#)
        #expect(CompanyIdentifier.aerosens.description == #"Aerosens LLC"#)
    
        // Centre Suisse d'Electronique et de Microtechnique SA
        #expect(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.rawValue == 2493)
        #expect(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.name == #"Centre Suisse d'Electronique et de Microtechnique SA"#)
        #expect(CompanyIdentifier.centreSuisseDElectroniqueEtDeMicrotechnique.description == #"Centre Suisse d'Electronique et de Microtechnique SA"#)
    
        // Vessel Ltd.
        #expect(CompanyIdentifier.vessel.rawValue == 2494)
        #expect(CompanyIdentifier.vessel.name == #"Vessel Ltd."#)
        #expect(CompanyIdentifier.vessel.description == #"Vessel Ltd."#)
    
        // Span.IO, Inc.
        #expect(CompanyIdentifier.spanIo.rawValue == 2495)
        #expect(CompanyIdentifier.spanIo.name == #"Span.IO, Inc."#)
        #expect(CompanyIdentifier.spanIo.description == #"Span.IO, Inc."#)
    
        // AnotherBrain inc.
        #expect(CompanyIdentifier.anotherbrain.rawValue == 2496)
        #expect(CompanyIdentifier.anotherbrain.name == #"AnotherBrain inc."#)
        #expect(CompanyIdentifier.anotherbrain.description == #"AnotherBrain inc."#)
    
        // Rosewill
        #expect(CompanyIdentifier.rosewill.rawValue == 2497)
        #expect(CompanyIdentifier.rosewill.name == #"Rosewill"#)
        #expect(CompanyIdentifier.rosewill.description == #"Rosewill"#)
    
        // Universal Audio, Inc.
        #expect(CompanyIdentifier.universalAudio.rawValue == 2498)
        #expect(CompanyIdentifier.universalAudio.name == #"Universal Audio, Inc."#)
        #expect(CompanyIdentifier.universalAudio.description == #"Universal Audio, Inc."#)
    
        // JAPAN TOBACCO INC.
        #expect(CompanyIdentifier.japanTobacco.rawValue == 2499)
        #expect(CompanyIdentifier.japanTobacco.name == #"JAPAN TOBACCO INC."#)
        #expect(CompanyIdentifier.japanTobacco.description == #"JAPAN TOBACCO INC."#)
    
        // UVISIO
        #expect(CompanyIdentifier.uvisio.rawValue == 2500)
        #expect(CompanyIdentifier.uvisio.name == #"UVISIO"#)
        #expect(CompanyIdentifier.uvisio.description == #"UVISIO"#)
    
        // HungYi Microelectronics Co.,Ltd.
        #expect(CompanyIdentifier.hungyiMicroelectronics.rawValue == 2501)
        #expect(CompanyIdentifier.hungyiMicroelectronics.name == #"HungYi Microelectronics Co.,Ltd."#)
        #expect(CompanyIdentifier.hungyiMicroelectronics.description == #"HungYi Microelectronics Co.,Ltd."#)
    
        // Honor Device Co., Ltd.
        #expect(CompanyIdentifier.honorDevice.rawValue == 2502)
        #expect(CompanyIdentifier.honorDevice.name == #"Honor Device Co., Ltd."#)
        #expect(CompanyIdentifier.honorDevice.description == #"Honor Device Co., Ltd."#)
    
        // Combustion, LLC
        #expect(CompanyIdentifier.combustion.rawValue == 2503)
        #expect(CompanyIdentifier.combustion.name == #"Combustion, LLC"#)
        #expect(CompanyIdentifier.combustion.description == #"Combustion, LLC"#)
    
        // XUNTONG
        #expect(CompanyIdentifier.xuntong.rawValue == 2504)
        #expect(CompanyIdentifier.xuntong.name == #"XUNTONG"#)
        #expect(CompanyIdentifier.xuntong.description == #"XUNTONG"#)
    
        // CrowdGlow Ltd
        #expect(CompanyIdentifier.crowdglow.rawValue == 2505)
        #expect(CompanyIdentifier.crowdglow.name == #"CrowdGlow Ltd"#)
        #expect(CompanyIdentifier.crowdglow.description == #"CrowdGlow Ltd"#)
    
        // Mobitrace
        #expect(CompanyIdentifier.mobitrace.rawValue == 2506)
        #expect(CompanyIdentifier.mobitrace.name == #"Mobitrace"#)
        #expect(CompanyIdentifier.mobitrace.description == #"Mobitrace"#)
    
        // Hx Engineering, LLC
        #expect(CompanyIdentifier.hxEngineering.rawValue == 2507)
        #expect(CompanyIdentifier.hxEngineering.name == #"Hx Engineering, LLC"#)
        #expect(CompanyIdentifier.hxEngineering.description == #"Hx Engineering, LLC"#)
    
        // Senso4s d.o.o.
        #expect(CompanyIdentifier.senso4S.rawValue == 2508)
        #expect(CompanyIdentifier.senso4S.name == #"Senso4s d.o.o."#)
        #expect(CompanyIdentifier.senso4S.description == #"Senso4s d.o.o."#)
    
        // Blyott
        #expect(CompanyIdentifier.blyott.rawValue == 2509)
        #expect(CompanyIdentifier.blyott.name == #"Blyott"#)
        #expect(CompanyIdentifier.blyott.description == #"Blyott"#)
    
        // Julius Blum GmbH
        #expect(CompanyIdentifier.juliusBlum.rawValue == 2510)
        #expect(CompanyIdentifier.juliusBlum.name == #"Julius Blum GmbH"#)
        #expect(CompanyIdentifier.juliusBlum.description == #"Julius Blum GmbH"#)
    
        // BlueStreak IoT, LLC
        #expect(CompanyIdentifier.bluestreakIot.rawValue == 2511)
        #expect(CompanyIdentifier.bluestreakIot.name == #"BlueStreak IoT, LLC"#)
        #expect(CompanyIdentifier.bluestreakIot.description == #"BlueStreak IoT, LLC"#)
    
        // Chess Wise B.V.
        #expect(CompanyIdentifier.chessWise.rawValue == 2512)
        #expect(CompanyIdentifier.chessWise.name == #"Chess Wise B.V."#)
        #expect(CompanyIdentifier.chessWise.description == #"Chess Wise B.V."#)
    
        // ABLEPAY TECHNOLOGIES AS
        #expect(CompanyIdentifier.ablepayTechnologies.rawValue == 2513)
        #expect(CompanyIdentifier.ablepayTechnologies.name == #"ABLEPAY TECHNOLOGIES AS"#)
        #expect(CompanyIdentifier.ablepayTechnologies.description == #"ABLEPAY TECHNOLOGIES AS"#)
    
        // Temperature Sensitive Solutions Systems Sweden AB
        #expect(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.rawValue == 2514)
        #expect(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.name == #"Temperature Sensitive Solutions Systems Sweden AB"#)
        #expect(CompanyIdentifier.temperatureSensitiveSolutionsSystemsSweden.description == #"Temperature Sensitive Solutions Systems Sweden AB"#)
    
        // HeartHero, inc.
        #expect(CompanyIdentifier.hearthero.rawValue == 2515)
        #expect(CompanyIdentifier.hearthero.name == #"HeartHero, inc."#)
        #expect(CompanyIdentifier.hearthero.description == #"HeartHero, inc."#)
    
        // ORBIS Inc.
        #expect(CompanyIdentifier.orbis.rawValue == 2516)
        #expect(CompanyIdentifier.orbis.name == #"ORBIS Inc."#)
        #expect(CompanyIdentifier.orbis.description == #"ORBIS Inc."#)
    
        // GEAR RADIO ELECTRONICS CORP.
        #expect(CompanyIdentifier.gearRadioElectronics.rawValue == 2517)
        #expect(CompanyIdentifier.gearRadioElectronics.name == #"GEAR RADIO ELECTRONICS CORP."#)
        #expect(CompanyIdentifier.gearRadioElectronics.description == #"GEAR RADIO ELECTRONICS CORP."#)
    
        // EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI
        #expect(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.rawValue == 2518)
        #expect(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.name == #"EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI"#)
        #expect(CompanyIdentifier.earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi.description == #"EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI"#)
    
        // Coyotta
        #expect(CompanyIdentifier.coyotta.rawValue == 2519)
        #expect(CompanyIdentifier.coyotta.name == #"Coyotta"#)
        #expect(CompanyIdentifier.coyotta.description == #"Coyotta"#)
    
        // Synergy Tecnologia em Sistemas Ltda
        #expect(CompanyIdentifier.synergyTecnologiaEmSistemas.rawValue == 2520)
        #expect(CompanyIdentifier.synergyTecnologiaEmSistemas.name == #"Synergy Tecnologia em Sistemas Ltda"#)
        #expect(CompanyIdentifier.synergyTecnologiaEmSistemas.description == #"Synergy Tecnologia em Sistemas Ltda"#)
    
        // VivoSensMedical GmbH
        #expect(CompanyIdentifier.vivosensmedical.rawValue == 2521)
        #expect(CompanyIdentifier.vivosensmedical.name == #"VivoSensMedical GmbH"#)
        #expect(CompanyIdentifier.vivosensmedical.description == #"VivoSensMedical GmbH"#)
    
        // Nagravision SA
        #expect(CompanyIdentifier.nagravision.rawValue == 2522)
        #expect(CompanyIdentifier.nagravision.name == #"Nagravision SA"#)
        #expect(CompanyIdentifier.nagravision.description == #"Nagravision SA"#)
    
        // Bionic Avionics Inc.
        #expect(CompanyIdentifier.bionicAvionics.rawValue == 2523)
        #expect(CompanyIdentifier.bionicAvionics.name == #"Bionic Avionics Inc."#)
        #expect(CompanyIdentifier.bionicAvionics.description == #"Bionic Avionics Inc."#)
    
        // AON2 Ltd.
        #expect(CompanyIdentifier.aon2.rawValue == 2524)
        #expect(CompanyIdentifier.aon2.name == #"AON2 Ltd."#)
        #expect(CompanyIdentifier.aon2.description == #"AON2 Ltd."#)
    
        // Innoware Development AB
        #expect(CompanyIdentifier.innowareDevelopment.rawValue == 2525)
        #expect(CompanyIdentifier.innowareDevelopment.name == #"Innoware Development AB"#)
        #expect(CompanyIdentifier.innowareDevelopment.description == #"Innoware Development AB"#)
    
        // JLD Technology Solutions, LLC
        #expect(CompanyIdentifier.jldTechnologySolutions.rawValue == 2526)
        #expect(CompanyIdentifier.jldTechnologySolutions.name == #"JLD Technology Solutions, LLC"#)
        #expect(CompanyIdentifier.jldTechnologySolutions.description == #"JLD Technology Solutions, LLC"#)
    
        // Magnus Technology Sdn Bhd
        #expect(CompanyIdentifier.magnusTechnology.rawValue == 2527)
        #expect(CompanyIdentifier.magnusTechnology.name == #"Magnus Technology Sdn Bhd"#)
        #expect(CompanyIdentifier.magnusTechnology.description == #"Magnus Technology Sdn Bhd"#)
    
        // Preddio Technologies Inc.
        #expect(CompanyIdentifier.preddioTechnologies.rawValue == 2528)
        #expect(CompanyIdentifier.preddioTechnologies.name == #"Preddio Technologies Inc."#)
        #expect(CompanyIdentifier.preddioTechnologies.description == #"Preddio Technologies Inc."#)
    
        // Tag-N-Trac Inc
        #expect(CompanyIdentifier.tagNTrac.rawValue == 2529)
        #expect(CompanyIdentifier.tagNTrac.name == #"Tag-N-Trac Inc"#)
        #expect(CompanyIdentifier.tagNTrac.description == #"Tag-N-Trac Inc"#)
    
        // Wuhan Linptech Co.,Ltd.
        #expect(CompanyIdentifier.wuhanLinptech.rawValue == 2530)
        #expect(CompanyIdentifier.wuhanLinptech.name == #"Wuhan Linptech Co.,Ltd."#)
        #expect(CompanyIdentifier.wuhanLinptech.description == #"Wuhan Linptech Co.,Ltd."#)
    
        // Friday Home Aps
        #expect(CompanyIdentifier.fridayHome.rawValue == 2531)
        #expect(CompanyIdentifier.fridayHome.name == #"Friday Home Aps"#)
        #expect(CompanyIdentifier.fridayHome.description == #"Friday Home Aps"#)
    
        // CPS AS
        #expect(CompanyIdentifier.cps.rawValue == 2532)
        #expect(CompanyIdentifier.cps.name == #"CPS AS"#)
        #expect(CompanyIdentifier.cps.description == #"CPS AS"#)
    
        // Mobilogix
        #expect(CompanyIdentifier.mobilogix.rawValue == 2533)
        #expect(CompanyIdentifier.mobilogix.name == #"Mobilogix"#)
        #expect(CompanyIdentifier.mobilogix.description == #"Mobilogix"#)
    
        // Masonite Corporation
        #expect(CompanyIdentifier.masonite.rawValue == 2534)
        #expect(CompanyIdentifier.masonite.name == #"Masonite Corporation"#)
        #expect(CompanyIdentifier.masonite.description == #"Masonite Corporation"#)
    
        // Kabushikigaisha HANERON
        #expect(CompanyIdentifier.kabushikigaishaHaneron.rawValue == 2535)
        #expect(CompanyIdentifier.kabushikigaishaHaneron.name == #"Kabushikigaisha HANERON"#)
        #expect(CompanyIdentifier.kabushikigaishaHaneron.description == #"Kabushikigaisha HANERON"#)
    
        // Melange Systems Pvt. Ltd.
        #expect(CompanyIdentifier.melangeSystems.rawValue == 2536)
        #expect(CompanyIdentifier.melangeSystems.name == #"Melange Systems Pvt. Ltd."#)
        #expect(CompanyIdentifier.melangeSystems.description == #"Melange Systems Pvt. Ltd."#)
    
        // LumenRadio AB
        #expect(CompanyIdentifier.lumenradio.rawValue == 2537)
        #expect(CompanyIdentifier.lumenradio.name == #"LumenRadio AB"#)
        #expect(CompanyIdentifier.lumenradio.description == #"LumenRadio AB"#)
    
        // Athlos Oy
        #expect(CompanyIdentifier.athlos.rawValue == 2538)
        #expect(CompanyIdentifier.athlos.name == #"Athlos Oy"#)
        #expect(CompanyIdentifier.athlos.description == #"Athlos Oy"#)
    
        // KEAN ELECTRONICS PTY LTD
        #expect(CompanyIdentifier.keanElectronics.rawValue == 2539)
        #expect(CompanyIdentifier.keanElectronics.name == #"KEAN ELECTRONICS PTY LTD"#)
        #expect(CompanyIdentifier.keanElectronics.description == #"KEAN ELECTRONICS PTY LTD"#)
    
        // Yukon advanced optics worldwide, UAB
        #expect(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.rawValue == 2540)
        #expect(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.name == #"Yukon advanced optics worldwide, UAB"#)
        #expect(CompanyIdentifier.yukonAdvancedOpticsWorldwideUab.description == #"Yukon advanced optics worldwide, UAB"#)
    
        // Sibel Inc.
        #expect(CompanyIdentifier.sibel.rawValue == 2541)
        #expect(CompanyIdentifier.sibel.name == #"Sibel Inc."#)
        #expect(CompanyIdentifier.sibel.description == #"Sibel Inc."#)
    
        // OJMAR SA
        #expect(CompanyIdentifier.ojmar.rawValue == 2542)
        #expect(CompanyIdentifier.ojmar.name == #"OJMAR SA"#)
        #expect(CompanyIdentifier.ojmar.description == #"OJMAR SA"#)
    
        // Steinel Solutions AG
        #expect(CompanyIdentifier.steinelSolutions.rawValue == 2543)
        #expect(CompanyIdentifier.steinelSolutions.name == #"Steinel Solutions AG"#)
        #expect(CompanyIdentifier.steinelSolutions.description == #"Steinel Solutions AG"#)
    
        // WatchGas B.V.
        #expect(CompanyIdentifier.watchgas.rawValue == 2544)
        #expect(CompanyIdentifier.watchgas.name == #"WatchGas B.V."#)
        #expect(CompanyIdentifier.watchgas.description == #"WatchGas B.V."#)
    
        // OM Digital Solutions Corporation
        #expect(CompanyIdentifier.omDigitalSolutions.rawValue == 2545)
        #expect(CompanyIdentifier.omDigitalSolutions.name == #"OM Digital Solutions Corporation"#)
        #expect(CompanyIdentifier.omDigitalSolutions.description == #"OM Digital Solutions Corporation"#)
    
        // Audeara Pty Ltd
        #expect(CompanyIdentifier.audeara.rawValue == 2546)
        #expect(CompanyIdentifier.audeara.name == #"Audeara Pty Ltd"#)
        #expect(CompanyIdentifier.audeara.description == #"Audeara Pty Ltd"#)
    
        // Beijing Zero Zero Infinity Technology Co.,Ltd.
        #expect(CompanyIdentifier.beijingZeroZeroInfinityTechnology.rawValue == 2547)
        #expect(CompanyIdentifier.beijingZeroZeroInfinityTechnology.name == #"Beijing Zero Zero Infinity Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.beijingZeroZeroInfinityTechnology.description == #"Beijing Zero Zero Infinity Technology Co.,Ltd."#)
    
        // Spectrum Technologies, Inc.
        #expect(CompanyIdentifier.spectrumTechnologies.rawValue == 2548)
        #expect(CompanyIdentifier.spectrumTechnologies.name == #"Spectrum Technologies, Inc."#)
        #expect(CompanyIdentifier.spectrumTechnologies.description == #"Spectrum Technologies, Inc."#)
    
        // OKI Electric Industry Co., Ltd
        #expect(CompanyIdentifier.okiElectricIndustry.rawValue == 2549)
        #expect(CompanyIdentifier.okiElectricIndustry.name == #"OKI Electric Industry Co., Ltd"#)
        #expect(CompanyIdentifier.okiElectricIndustry.description == #"OKI Electric Industry Co., Ltd"#)
    
        // Mobile Action Technology Inc.
        #expect(CompanyIdentifier.mobileActionTechnology.rawValue == 2550)
        #expect(CompanyIdentifier.mobileActionTechnology.name == #"Mobile Action Technology Inc."#)
        #expect(CompanyIdentifier.mobileActionTechnology.description == #"Mobile Action Technology Inc."#)
    
        // SENSATEC Co., Ltd.
        #expect(CompanyIdentifier.sensatec.rawValue == 2551)
        #expect(CompanyIdentifier.sensatec.name == #"SENSATEC Co., Ltd."#)
        #expect(CompanyIdentifier.sensatec.description == #"SENSATEC Co., Ltd."#)
    
        // R.O. S.R.L.
        #expect(CompanyIdentifier.rO.rawValue == 2552)
        #expect(CompanyIdentifier.rO.name == #"R.O. S.R.L."#)
        #expect(CompanyIdentifier.rO.description == #"R.O. S.R.L."#)
    
        // Hangzhou Yaguan Technology Co. LTD
        #expect(CompanyIdentifier.hangzhouYaguanTechnology.rawValue == 2553)
        #expect(CompanyIdentifier.hangzhouYaguanTechnology.name == #"Hangzhou Yaguan Technology Co. LTD"#)
        #expect(CompanyIdentifier.hangzhouYaguanTechnology.description == #"Hangzhou Yaguan Technology Co. LTD"#)
    
        // Listen Technologies Corporation
        #expect(CompanyIdentifier.listenTechnologies.rawValue == 2554)
        #expect(CompanyIdentifier.listenTechnologies.name == #"Listen Technologies Corporation"#)
        #expect(CompanyIdentifier.listenTechnologies.description == #"Listen Technologies Corporation"#)
    
        // TOITU CO., LTD.
        #expect(CompanyIdentifier.toitu.rawValue == 2555)
        #expect(CompanyIdentifier.toitu.name == #"TOITU CO., LTD."#)
        #expect(CompanyIdentifier.toitu.description == #"TOITU CO., LTD."#)
    
        // Confidex
        #expect(CompanyIdentifier.confidex.rawValue == 2556)
        #expect(CompanyIdentifier.confidex.name == #"Confidex"#)
        #expect(CompanyIdentifier.confidex.description == #"Confidex"#)
    
        // Keep Technologies, Inc.
        #expect(CompanyIdentifier.keepTechnologies.rawValue == 2557)
        #expect(CompanyIdentifier.keepTechnologies.name == #"Keep Technologies, Inc."#)
        #expect(CompanyIdentifier.keepTechnologies.description == #"Keep Technologies, Inc."#)
    
        // Lichtvision Engineering GmbH
        #expect(CompanyIdentifier.lichtvisionEngineering.rawValue == 2558)
        #expect(CompanyIdentifier.lichtvisionEngineering.name == #"Lichtvision Engineering GmbH"#)
        #expect(CompanyIdentifier.lichtvisionEngineering.description == #"Lichtvision Engineering GmbH"#)
    
        // AIRSTAR
        #expect(CompanyIdentifier.airstar.rawValue == 2559)
        #expect(CompanyIdentifier.airstar.name == #"AIRSTAR"#)
        #expect(CompanyIdentifier.airstar.description == #"AIRSTAR"#)
    
        // Ampler Bikes OU
        #expect(CompanyIdentifier.amplerBikesOu.rawValue == 2560)
        #expect(CompanyIdentifier.amplerBikesOu.name == #"Ampler Bikes OU"#)
        #expect(CompanyIdentifier.amplerBikesOu.description == #"Ampler Bikes OU"#)
    
        // Cleveron AS
        #expect(CompanyIdentifier.cleveron.rawValue == 2561)
        #expect(CompanyIdentifier.cleveron.name == #"Cleveron AS"#)
        #expect(CompanyIdentifier.cleveron.description == #"Cleveron AS"#)
    
        // Ayxon-Dynamics GmbH
        #expect(CompanyIdentifier.ayxonDynamics.rawValue == 2562)
        #expect(CompanyIdentifier.ayxonDynamics.name == #"Ayxon-Dynamics GmbH"#)
        #expect(CompanyIdentifier.ayxonDynamics.description == #"Ayxon-Dynamics GmbH"#)
    
        // donutrobotics Co., Ltd.
        #expect(CompanyIdentifier.donutrobotics.rawValue == 2563)
        #expect(CompanyIdentifier.donutrobotics.name == #"donutrobotics Co., Ltd."#)
        #expect(CompanyIdentifier.donutrobotics.description == #"donutrobotics Co., Ltd."#)
    
        // Flosonics Medical
        #expect(CompanyIdentifier.flosonicsMedical.rawValue == 2564)
        #expect(CompanyIdentifier.flosonicsMedical.name == #"Flosonics Medical"#)
        #expect(CompanyIdentifier.flosonicsMedical.description == #"Flosonics Medical"#)
    
        // Southwire Company, LLC
        #expect(CompanyIdentifier.southwire.rawValue == 2565)
        #expect(CompanyIdentifier.southwire.name == #"Southwire Company, LLC"#)
        #expect(CompanyIdentifier.southwire.description == #"Southwire Company, LLC"#)
    
        // Shanghai wuqi microelectronics Co.,Ltd
        #expect(CompanyIdentifier.shanghaiWuqiMicroelectronics.rawValue == 2566)
        #expect(CompanyIdentifier.shanghaiWuqiMicroelectronics.name == #"Shanghai wuqi microelectronics Co.,Ltd"#)
        #expect(CompanyIdentifier.shanghaiWuqiMicroelectronics.description == #"Shanghai wuqi microelectronics Co.,Ltd"#)
    
        // Reflow Pty Ltd
        #expect(CompanyIdentifier.reflow.rawValue == 2567)
        #expect(CompanyIdentifier.reflow.name == #"Reflow Pty Ltd"#)
        #expect(CompanyIdentifier.reflow.description == #"Reflow Pty Ltd"#)
    
        // Oras Oy
        #expect(CompanyIdentifier.oras.rawValue == 2568)
        #expect(CompanyIdentifier.oras.name == #"Oras Oy"#)
        #expect(CompanyIdentifier.oras.description == #"Oras Oy"#)
    
        // ECCT
        #expect(CompanyIdentifier.ecct.rawValue == 2569)
        #expect(CompanyIdentifier.ecct.name == #"ECCT"#)
        #expect(CompanyIdentifier.ecct.description == #"ECCT"#)
    
        // Volan Technology Inc.
        #expect(CompanyIdentifier.volanTechnology.rawValue == 2570)
        #expect(CompanyIdentifier.volanTechnology.name == #"Volan Technology Inc."#)
        #expect(CompanyIdentifier.volanTechnology.description == #"Volan Technology Inc."#)
    
        // SIANA Systems
        #expect(CompanyIdentifier.sianaSystems.rawValue == 2571)
        #expect(CompanyIdentifier.sianaSystems.name == #"SIANA Systems"#)
        #expect(CompanyIdentifier.sianaSystems.description == #"SIANA Systems"#)
    
        // Shanghai Yidian Intelligent Technology Co., Ltd.
        #expect(CompanyIdentifier.shanghaiYidianIntelligentTechnology.rawValue == 2572)
        #expect(CompanyIdentifier.shanghaiYidianIntelligentTechnology.name == #"Shanghai Yidian Intelligent Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiYidianIntelligentTechnology.description == #"Shanghai Yidian Intelligent Technology Co., Ltd."#)
    
        // Blue Peacock GmbH
        #expect(CompanyIdentifier.bluePeacock.rawValue == 2573)
        #expect(CompanyIdentifier.bluePeacock.name == #"Blue Peacock GmbH"#)
        #expect(CompanyIdentifier.bluePeacock.description == #"Blue Peacock GmbH"#)
    
        // Roland Corporation
        #expect(CompanyIdentifier.roland.rawValue == 2574)
        #expect(CompanyIdentifier.roland.name == #"Roland Corporation"#)
        #expect(CompanyIdentifier.roland.description == #"Roland Corporation"#)
    
        // LIXIL Corporation
        #expect(CompanyIdentifier.lixil.rawValue == 2575)
        #expect(CompanyIdentifier.lixil.name == #"LIXIL Corporation"#)
        #expect(CompanyIdentifier.lixil.description == #"LIXIL Corporation"#)
    
        // SUBARU Corporation
        #expect(CompanyIdentifier.subaru.rawValue == 2576)
        #expect(CompanyIdentifier.subaru.name == #"SUBARU Corporation"#)
        #expect(CompanyIdentifier.subaru.description == #"SUBARU Corporation"#)
    
        // Sensolus
        #expect(CompanyIdentifier.sensolus.rawValue == 2577)
        #expect(CompanyIdentifier.sensolus.name == #"Sensolus"#)
        #expect(CompanyIdentifier.sensolus.description == #"Sensolus"#)
    
        // Dyson Technology Limited
        #expect(CompanyIdentifier.dysonTechnology.rawValue == 2578)
        #expect(CompanyIdentifier.dysonTechnology.name == #"Dyson Technology Limited"#)
        #expect(CompanyIdentifier.dysonTechnology.description == #"Dyson Technology Limited"#)
    
        // Tec4med LifeScience GmbH
        #expect(CompanyIdentifier.tec4MedLifescience.rawValue == 2579)
        #expect(CompanyIdentifier.tec4MedLifescience.name == #"Tec4med LifeScience GmbH"#)
        #expect(CompanyIdentifier.tec4MedLifescience.description == #"Tec4med LifeScience GmbH"#)
    
        // CROXEL, INC.
        #expect(CompanyIdentifier.croxel.rawValue == 2580)
        #expect(CompanyIdentifier.croxel.name == #"CROXEL, INC."#)
        #expect(CompanyIdentifier.croxel.description == #"CROXEL, INC."#)
    
        // Syng Inc
        #expect(CompanyIdentifier.syng.rawValue == 2581)
        #expect(CompanyIdentifier.syng.name == #"Syng Inc"#)
        #expect(CompanyIdentifier.syng.description == #"Syng Inc"#)
    
        // RIDE VISION LTD
        #expect(CompanyIdentifier.rideVision.rawValue == 2582)
        #expect(CompanyIdentifier.rideVision.name == #"RIDE VISION LTD"#)
        #expect(CompanyIdentifier.rideVision.description == #"RIDE VISION LTD"#)
    
        // Plume Design Inc
        #expect(CompanyIdentifier.plumeDesign.rawValue == 2583)
        #expect(CompanyIdentifier.plumeDesign.name == #"Plume Design Inc"#)
        #expect(CompanyIdentifier.plumeDesign.description == #"Plume Design Inc"#)
    
        // Cambridge Animal Technologies Ltd
        #expect(CompanyIdentifier.cambridgeAnimalTechnologies.rawValue == 2584)
        #expect(CompanyIdentifier.cambridgeAnimalTechnologies.name == #"Cambridge Animal Technologies Ltd"#)
        #expect(CompanyIdentifier.cambridgeAnimalTechnologies.description == #"Cambridge Animal Technologies Ltd"#)
    
        // Maxell, Ltd.
        #expect(CompanyIdentifier.maxell.rawValue == 2585)
        #expect(CompanyIdentifier.maxell.name == #"Maxell, Ltd."#)
        #expect(CompanyIdentifier.maxell.description == #"Maxell, Ltd."#)
    
        // Link Labs, Inc.
        #expect(CompanyIdentifier.linkLabs.rawValue == 2586)
        #expect(CompanyIdentifier.linkLabs.name == #"Link Labs, Inc."#)
        #expect(CompanyIdentifier.linkLabs.description == #"Link Labs, Inc."#)
    
        // Embrava Pty Ltd
        #expect(CompanyIdentifier.embrava.rawValue == 2587)
        #expect(CompanyIdentifier.embrava.name == #"Embrava Pty Ltd"#)
        #expect(CompanyIdentifier.embrava.description == #"Embrava Pty Ltd"#)
    
        // INPEAK S.C.
        #expect(CompanyIdentifier.inpeakSC.rawValue == 2588)
        #expect(CompanyIdentifier.inpeakSC.name == #"INPEAK S.C."#)
        #expect(CompanyIdentifier.inpeakSC.description == #"INPEAK S.C."#)
    
        // API-K
        #expect(CompanyIdentifier.apiK.rawValue == 2589)
        #expect(CompanyIdentifier.apiK.name == #"API-K"#)
        #expect(CompanyIdentifier.apiK.description == #"API-K"#)
    
        // CombiQ AB
        #expect(CompanyIdentifier.combiq.rawValue == 2590)
        #expect(CompanyIdentifier.combiq.name == #"CombiQ AB"#)
        #expect(CompanyIdentifier.combiq.description == #"CombiQ AB"#)
    
        // DeVilbiss Healthcare LLC
        #expect(CompanyIdentifier.devilbissHealthcare.rawValue == 2591)
        #expect(CompanyIdentifier.devilbissHealthcare.name == #"DeVilbiss Healthcare LLC"#)
        #expect(CompanyIdentifier.devilbissHealthcare.description == #"DeVilbiss Healthcare LLC"#)
    
        // Jiangxi Innotech Technology Co., Ltd
        #expect(CompanyIdentifier.jiangxiInnotechTechnology.rawValue == 2592)
        #expect(CompanyIdentifier.jiangxiInnotechTechnology.name == #"Jiangxi Innotech Technology Co., Ltd"#)
        #expect(CompanyIdentifier.jiangxiInnotechTechnology.description == #"Jiangxi Innotech Technology Co., Ltd"#)
    
        // Apollogic Sp. z o.o.
        #expect(CompanyIdentifier.apollogic.rawValue == 2593)
        #expect(CompanyIdentifier.apollogic.name == #"Apollogic Sp. z o.o."#)
        #expect(CompanyIdentifier.apollogic.description == #"Apollogic Sp. z o.o."#)
    
        // DAIICHIKOSHO CO., LTD.
        #expect(CompanyIdentifier.daiichikosho.rawValue == 2594)
        #expect(CompanyIdentifier.daiichikosho.name == #"DAIICHIKOSHO CO., LTD."#)
        #expect(CompanyIdentifier.daiichikosho.description == #"DAIICHIKOSHO CO., LTD."#)
    
        // BIXOLON CO.,LTD
        #expect(CompanyIdentifier.bixolon.rawValue == 2595)
        #expect(CompanyIdentifier.bixolon.name == #"BIXOLON CO.,LTD"#)
        #expect(CompanyIdentifier.bixolon.description == #"BIXOLON CO.,LTD"#)
    
        // Atmosic Technologies, Inc.
        #expect(CompanyIdentifier.atmosicTechnologies.rawValue == 2596)
        #expect(CompanyIdentifier.atmosicTechnologies.name == #"Atmosic Technologies, Inc."#)
        #expect(CompanyIdentifier.atmosicTechnologies.description == #"Atmosic Technologies, Inc."#)
    
        // Eran Financial Services LLC
        #expect(CompanyIdentifier.eranFinancialServices.rawValue == 2597)
        #expect(CompanyIdentifier.eranFinancialServices.name == #"Eran Financial Services LLC"#)
        #expect(CompanyIdentifier.eranFinancialServices.description == #"Eran Financial Services LLC"#)
    
        // Louis Vuitton
        #expect(CompanyIdentifier.louisVuitton.rawValue == 2598)
        #expect(CompanyIdentifier.louisVuitton.name == #"Louis Vuitton"#)
        #expect(CompanyIdentifier.louisVuitton.description == #"Louis Vuitton"#)
    
        // AYU DEVICES PRIVATE LIMITED
        #expect(CompanyIdentifier.ayuDevices.rawValue == 2599)
        #expect(CompanyIdentifier.ayuDevices.name == #"AYU DEVICES PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.ayuDevices.description == #"AYU DEVICES PRIVATE LIMITED"#)
    
        // NanoFlex Power Corporation
        #expect(CompanyIdentifier.nanoflexPower.rawValue == 2600)
        #expect(CompanyIdentifier.nanoflexPower.name == #"NanoFlex Power Corporation"#)
        #expect(CompanyIdentifier.nanoflexPower.description == #"NanoFlex Power Corporation"#)
    
        // Worthcloud Technology Co.,Ltd
        #expect(CompanyIdentifier.worthcloudTechnology.rawValue == 2601)
        #expect(CompanyIdentifier.worthcloudTechnology.name == #"Worthcloud Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.worthcloudTechnology.description == #"Worthcloud Technology Co.,Ltd"#)
    
        // Yamaha Corporation
        #expect(CompanyIdentifier.yamaha.rawValue == 2602)
        #expect(CompanyIdentifier.yamaha.name == #"Yamaha Corporation"#)
        #expect(CompanyIdentifier.yamaha.description == #"Yamaha Corporation"#)
    
        // PaceBait IVS
        #expect(CompanyIdentifier.pacebait.rawValue == 2603)
        #expect(CompanyIdentifier.pacebait.name == #"PaceBait IVS"#)
        #expect(CompanyIdentifier.pacebait.description == #"PaceBait IVS"#)
    
        // Shenzhen H&T Intelligent Control Co., Ltd
        #expect(CompanyIdentifier.shenzhenHTIntelligentControl.rawValue == 2604)
        #expect(CompanyIdentifier.shenzhenHTIntelligentControl.name == #"Shenzhen H&T Intelligent Control Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenHTIntelligentControl.description == #"Shenzhen H&T Intelligent Control Co., Ltd"#)
    
        // Shenzhen Feasycom Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenFeasycomTechnology.rawValue == 2605)
        #expect(CompanyIdentifier.shenzhenFeasycomTechnology.name == #"Shenzhen Feasycom Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenFeasycomTechnology.description == #"Shenzhen Feasycom Technology Co., Ltd."#)
    
        // Zuma Array Limited
        #expect(CompanyIdentifier.zumaArray.rawValue == 2606)
        #expect(CompanyIdentifier.zumaArray.name == #"Zuma Array Limited"#)
        #expect(CompanyIdentifier.zumaArray.description == #"Zuma Array Limited"#)
    
        // Instamic, Inc.
        #expect(CompanyIdentifier.instamic.rawValue == 2607)
        #expect(CompanyIdentifier.instamic.name == #"Instamic, Inc."#)
        #expect(CompanyIdentifier.instamic.description == #"Instamic, Inc."#)
    
        // Air-Weigh
        #expect(CompanyIdentifier.airWeigh.rawValue == 2608)
        #expect(CompanyIdentifier.airWeigh.name == #"Air-Weigh"#)
        #expect(CompanyIdentifier.airWeigh.description == #"Air-Weigh"#)
    
        // Nevro Corp.
        #expect(CompanyIdentifier.nevro.rawValue == 2609)
        #expect(CompanyIdentifier.nevro.name == #"Nevro Corp."#)
        #expect(CompanyIdentifier.nevro.description == #"Nevro Corp."#)
    
        // Pinnacle Technology, Inc.
        #expect(CompanyIdentifier.pinnacleTechnology.rawValue == 2610)
        #expect(CompanyIdentifier.pinnacleTechnology.name == #"Pinnacle Technology, Inc."#)
        #expect(CompanyIdentifier.pinnacleTechnology.description == #"Pinnacle Technology, Inc."#)
    
        // WMF AG
        #expect(CompanyIdentifier.wmf.rawValue == 2611)
        #expect(CompanyIdentifier.wmf.name == #"WMF AG"#)
        #expect(CompanyIdentifier.wmf.description == #"WMF AG"#)
    
        // Luxer Corporation
        #expect(CompanyIdentifier.luxer.rawValue == 2612)
        #expect(CompanyIdentifier.luxer.name == #"Luxer Corporation"#)
        #expect(CompanyIdentifier.luxer.description == #"Luxer Corporation"#)
    
        // safectory GmbH
        #expect(CompanyIdentifier.safectory.rawValue == 2613)
        #expect(CompanyIdentifier.safectory.name == #"safectory GmbH"#)
        #expect(CompanyIdentifier.safectory.description == #"safectory GmbH"#)
    
        // NGK SPARK PLUG CO., LTD.
        #expect(CompanyIdentifier.ngkSparkPlug.rawValue == 2614)
        #expect(CompanyIdentifier.ngkSparkPlug.name == #"NGK SPARK PLUG CO., LTD."#)
        #expect(CompanyIdentifier.ngkSparkPlug.description == #"NGK SPARK PLUG CO., LTD."#)
    
        // 2587702 Ontario Inc.
        #expect(CompanyIdentifier.company2587702Ontario.rawValue == 2615)
        #expect(CompanyIdentifier.company2587702Ontario.name == #"2587702 Ontario Inc."#)
        #expect(CompanyIdentifier.company2587702Ontario.description == #"2587702 Ontario Inc."#)
    
        // Bouffalo Lab (Nanjing)., Ltd.
        #expect(CompanyIdentifier.bouffaloLabNanjing.rawValue == 2616)
        #expect(CompanyIdentifier.bouffaloLabNanjing.name == #"Bouffalo Lab (Nanjing)., Ltd."#)
        #expect(CompanyIdentifier.bouffaloLabNanjing.description == #"Bouffalo Lab (Nanjing)., Ltd."#)
    
        // BLUETICKETING SRL
        #expect(CompanyIdentifier.blueticketing.rawValue == 2617)
        #expect(CompanyIdentifier.blueticketing.name == #"BLUETICKETING SRL"#)
        #expect(CompanyIdentifier.blueticketing.description == #"BLUETICKETING SRL"#)
    
        // Incotex Co. Ltd.
        #expect(CompanyIdentifier.incotex.rawValue == 2618)
        #expect(CompanyIdentifier.incotex.name == #"Incotex Co. Ltd."#)
        #expect(CompanyIdentifier.incotex.description == #"Incotex Co. Ltd."#)
    
        // Galileo Technology Limited
        #expect(CompanyIdentifier.galileoTechnology.rawValue == 2619)
        #expect(CompanyIdentifier.galileoTechnology.name == #"Galileo Technology Limited"#)
        #expect(CompanyIdentifier.galileoTechnology.description == #"Galileo Technology Limited"#)
    
        // Siteco GmbH
        #expect(CompanyIdentifier.siteco.rawValue == 2620)
        #expect(CompanyIdentifier.siteco.name == #"Siteco GmbH"#)
        #expect(CompanyIdentifier.siteco.description == #"Siteco GmbH"#)
    
        // DELABIE
        #expect(CompanyIdentifier.delabie.rawValue == 2621)
        #expect(CompanyIdentifier.delabie.name == #"DELABIE"#)
        #expect(CompanyIdentifier.delabie.description == #"DELABIE"#)
    
        // Hefei Yunlian Semiconductor Co., Ltd
        #expect(CompanyIdentifier.hefeiYunlianSemiconductor.rawValue == 2622)
        #expect(CompanyIdentifier.hefeiYunlianSemiconductor.name == #"Hefei Yunlian Semiconductor Co., Ltd"#)
        #expect(CompanyIdentifier.hefeiYunlianSemiconductor.description == #"Hefei Yunlian Semiconductor Co., Ltd"#)
    
        // Shenzhen Yopeak Optoelectronics Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.rawValue == 2623)
        #expect(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.name == #"Shenzhen Yopeak Optoelectronics Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenYopeakOptoelectronicsTechnology.description == #"Shenzhen Yopeak Optoelectronics Technology Co., Ltd."#)
    
        // GEWISS S.p.A.
        #expect(CompanyIdentifier.gewiss.rawValue == 2624)
        #expect(CompanyIdentifier.gewiss.name == #"GEWISS S.p.A."#)
        #expect(CompanyIdentifier.gewiss.description == #"GEWISS S.p.A."#)
    
        // OPEX Corporation
        #expect(CompanyIdentifier.opex.rawValue == 2625)
        #expect(CompanyIdentifier.opex.name == #"OPEX Corporation"#)
        #expect(CompanyIdentifier.opex.description == #"OPEX Corporation"#)
    
        // Motionalysis, Inc.
        #expect(CompanyIdentifier.motionalysis.rawValue == 2626)
        #expect(CompanyIdentifier.motionalysis.name == #"Motionalysis, Inc."#)
        #expect(CompanyIdentifier.motionalysis.description == #"Motionalysis, Inc."#)
    
        // Busch Systems International Inc.
        #expect(CompanyIdentifier.buschSystemsInternational.rawValue == 2627)
        #expect(CompanyIdentifier.buschSystemsInternational.name == #"Busch Systems International Inc."#)
        #expect(CompanyIdentifier.buschSystemsInternational.description == #"Busch Systems International Inc."#)
    
        // Novidan, Inc.
        #expect(CompanyIdentifier.novidan.rawValue == 2628)
        #expect(CompanyIdentifier.novidan.name == #"Novidan, Inc."#)
        #expect(CompanyIdentifier.novidan.description == #"Novidan, Inc."#)
    
        // 3SI Security Systems, Inc
        #expect(CompanyIdentifier.company3SiSecuritySystems.rawValue == 2629)
        #expect(CompanyIdentifier.company3SiSecuritySystems.name == #"3SI Security Systems, Inc"#)
        #expect(CompanyIdentifier.company3SiSecuritySystems.description == #"3SI Security Systems, Inc"#)
    
        // Beijing HC-Infinite Technology Limited
        #expect(CompanyIdentifier.beijingHcInfiniteTechnology.rawValue == 2630)
        #expect(CompanyIdentifier.beijingHcInfiniteTechnology.name == #"Beijing HC-Infinite Technology Limited"#)
        #expect(CompanyIdentifier.beijingHcInfiniteTechnology.description == #"Beijing HC-Infinite Technology Limited"#)
    
        // The Wand Company Ltd
        #expect(CompanyIdentifier.wandcompany.rawValue == 2631)
        #expect(CompanyIdentifier.wandcompany.name == #"The Wand Company Ltd"#)
        #expect(CompanyIdentifier.wandcompany.description == #"The Wand Company Ltd"#)
    
        // JRC Mobility Inc.
        #expect(CompanyIdentifier.jrcMobility.rawValue == 2632)
        #expect(CompanyIdentifier.jrcMobility.name == #"JRC Mobility Inc."#)
        #expect(CompanyIdentifier.jrcMobility.description == #"JRC Mobility Inc."#)
    
        // Venture Research Inc.
        #expect(CompanyIdentifier.ventureResearch.rawValue == 2633)
        #expect(CompanyIdentifier.ventureResearch.name == #"Venture Research Inc."#)
        #expect(CompanyIdentifier.ventureResearch.description == #"Venture Research Inc."#)
    
        // Map Large, Inc.
        #expect(CompanyIdentifier.mapLarge.rawValue == 2634)
        #expect(CompanyIdentifier.mapLarge.name == #"Map Large, Inc."#)
        #expect(CompanyIdentifier.mapLarge.description == #"Map Large, Inc."#)
    
        // MistyWest Energy and Transport Ltd.
        #expect(CompanyIdentifier.mistywestEnergyAndTransport.rawValue == 2635)
        #expect(CompanyIdentifier.mistywestEnergyAndTransport.name == #"MistyWest Energy and Transport Ltd."#)
        #expect(CompanyIdentifier.mistywestEnergyAndTransport.description == #"MistyWest Energy and Transport Ltd."#)
    
        // SiFli Technologies (shanghai) Inc.
        #expect(CompanyIdentifier.sifliTechnologiesShanghai.rawValue == 2636)
        #expect(CompanyIdentifier.sifliTechnologiesShanghai.name == #"SiFli Technologies (shanghai) Inc."#)
        #expect(CompanyIdentifier.sifliTechnologiesShanghai.description == #"SiFli Technologies (shanghai) Inc."#)
    
        // Lockn Technologies Private Limited
        #expect(CompanyIdentifier.locknTechnologies.rawValue == 2637)
        #expect(CompanyIdentifier.locknTechnologies.name == #"Lockn Technologies Private Limited"#)
        #expect(CompanyIdentifier.locknTechnologies.description == #"Lockn Technologies Private Limited"#)
    
        // Toytec Corporation
        #expect(CompanyIdentifier.toytec.rawValue == 2638)
        #expect(CompanyIdentifier.toytec.name == #"Toytec Corporation"#)
        #expect(CompanyIdentifier.toytec.description == #"Toytec Corporation"#)
    
        // VANMOOF Global Holding B.V.
        #expect(CompanyIdentifier.vanmoofGlobalHolding.rawValue == 2639)
        #expect(CompanyIdentifier.vanmoofGlobalHolding.name == #"VANMOOF Global Holding B.V."#)
        #expect(CompanyIdentifier.vanmoofGlobalHolding.description == #"VANMOOF Global Holding B.V."#)
    
        // Nextscape Inc.
        #expect(CompanyIdentifier.nextscape.rawValue == 2640)
        #expect(CompanyIdentifier.nextscape.name == #"Nextscape Inc."#)
        #expect(CompanyIdentifier.nextscape.description == #"Nextscape Inc."#)
    
        // CSIRO
        #expect(CompanyIdentifier.csiro.rawValue == 2641)
        #expect(CompanyIdentifier.csiro.name == #"CSIRO"#)
        #expect(CompanyIdentifier.csiro.description == #"CSIRO"#)
    
        // Follow Sense Europe B.V.
        #expect(CompanyIdentifier.followSenseEurope.rawValue == 2642)
        #expect(CompanyIdentifier.followSenseEurope.name == #"Follow Sense Europe B.V."#)
        #expect(CompanyIdentifier.followSenseEurope.description == #"Follow Sense Europe B.V."#)
    
        // KKM COMPANY LIMITED
        #expect(CompanyIdentifier.kkm.rawValue == 2643)
        #expect(CompanyIdentifier.kkm.name == #"KKM COMPANY LIMITED"#)
        #expect(CompanyIdentifier.kkm.description == #"KKM COMPANY LIMITED"#)
    
        // SQL Technologies Corp.
        #expect(CompanyIdentifier.sqlTechnologies.rawValue == 2644)
        #expect(CompanyIdentifier.sqlTechnologies.name == #"SQL Technologies Corp."#)
        #expect(CompanyIdentifier.sqlTechnologies.description == #"SQL Technologies Corp."#)
    
        // Inugo Systems Limited
        #expect(CompanyIdentifier.inugoSystems.rawValue == 2645)
        #expect(CompanyIdentifier.inugoSystems.name == #"Inugo Systems Limited"#)
        #expect(CompanyIdentifier.inugoSystems.description == #"Inugo Systems Limited"#)
    
        // ambie
        #expect(CompanyIdentifier.ambie.rawValue == 2646)
        #expect(CompanyIdentifier.ambie.name == #"ambie"#)
        #expect(CompanyIdentifier.ambie.description == #"ambie"#)
    
        // Meizhou Guo Wei Electronics Co., Ltd
        #expect(CompanyIdentifier.meizhouGuoWeiElectronics.rawValue == 2647)
        #expect(CompanyIdentifier.meizhouGuoWeiElectronics.name == #"Meizhou Guo Wei Electronics Co., Ltd"#)
        #expect(CompanyIdentifier.meizhouGuoWeiElectronics.description == #"Meizhou Guo Wei Electronics Co., Ltd"#)
    
        // Indigo Diabetes
        #expect(CompanyIdentifier.indigoDiabetes.rawValue == 2648)
        #expect(CompanyIdentifier.indigoDiabetes.name == #"Indigo Diabetes"#)
        #expect(CompanyIdentifier.indigoDiabetes.description == #"Indigo Diabetes"#)
    
        // TourBuilt, LLC
        #expect(CompanyIdentifier.tourbuilt.rawValue == 2649)
        #expect(CompanyIdentifier.tourbuilt.name == #"TourBuilt, LLC"#)
        #expect(CompanyIdentifier.tourbuilt.description == #"TourBuilt, LLC"#)
    
        // Sontheim Industrie Elektronik GmbH
        #expect(CompanyIdentifier.sontheimIndustrieElektronik.rawValue == 2650)
        #expect(CompanyIdentifier.sontheimIndustrieElektronik.name == #"Sontheim Industrie Elektronik GmbH"#)
        #expect(CompanyIdentifier.sontheimIndustrieElektronik.description == #"Sontheim Industrie Elektronik GmbH"#)
    
        // LEGIC Identsystems AG
        #expect(CompanyIdentifier.legicIdentsystems.rawValue == 2651)
        #expect(CompanyIdentifier.legicIdentsystems.name == #"LEGIC Identsystems AG"#)
        #expect(CompanyIdentifier.legicIdentsystems.description == #"LEGIC Identsystems AG"#)
    
        // Innovative Design Labs Inc.
        #expect(CompanyIdentifier.innovativeDesignLabs.rawValue == 2652)
        #expect(CompanyIdentifier.innovativeDesignLabs.name == #"Innovative Design Labs Inc."#)
        #expect(CompanyIdentifier.innovativeDesignLabs.description == #"Innovative Design Labs Inc."#)
    
        // MG Energy Systems B.V.
        #expect(CompanyIdentifier.mgEnergySystems.rawValue == 2653)
        #expect(CompanyIdentifier.mgEnergySystems.name == #"MG Energy Systems B.V."#)
        #expect(CompanyIdentifier.mgEnergySystems.description == #"MG Energy Systems B.V."#)
    
        // LaceClips llc
        #expect(CompanyIdentifier.laceclips.rawValue == 2654)
        #expect(CompanyIdentifier.laceclips.name == #"LaceClips llc"#)
        #expect(CompanyIdentifier.laceclips.description == #"LaceClips llc"#)
    
        // stryker
        #expect(CompanyIdentifier.stryker.rawValue == 2655)
        #expect(CompanyIdentifier.stryker.name == #"stryker"#)
        #expect(CompanyIdentifier.stryker.description == #"stryker"#)
    
        // DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD
        #expect(CompanyIdentifier.datangSemiconductorTechnology.rawValue == 2656)
        #expect(CompanyIdentifier.datangSemiconductorTechnology.name == #"DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD"#)
        #expect(CompanyIdentifier.datangSemiconductorTechnology.description == #"DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD"#)
    
        // Smart Parks B.V.
        #expect(CompanyIdentifier.smartParks.rawValue == 2657)
        #expect(CompanyIdentifier.smartParks.name == #"Smart Parks B.V."#)
        #expect(CompanyIdentifier.smartParks.description == #"Smart Parks B.V."#)
    
        // MOKO TECHNOLOGY Ltd
        #expect(CompanyIdentifier.mokoTechnology.rawValue == 2658)
        #expect(CompanyIdentifier.mokoTechnology.name == #"MOKO TECHNOLOGY Ltd"#)
        #expect(CompanyIdentifier.mokoTechnology.description == #"MOKO TECHNOLOGY Ltd"#)
    
        // Gremsy JSC
        #expect(CompanyIdentifier.gremsyJsc.rawValue == 2659)
        #expect(CompanyIdentifier.gremsyJsc.name == #"Gremsy JSC"#)
        #expect(CompanyIdentifier.gremsyJsc.description == #"Gremsy JSC"#)
    
        // Geopal system A/S
        #expect(CompanyIdentifier.geopalSystem.rawValue == 2660)
        #expect(CompanyIdentifier.geopalSystem.name == #"Geopal system A/S"#)
        #expect(CompanyIdentifier.geopalSystem.description == #"Geopal system A/S"#)
    
        // Lytx, INC.
        #expect(CompanyIdentifier.lytx.rawValue == 2661)
        #expect(CompanyIdentifier.lytx.name == #"Lytx, INC."#)
        #expect(CompanyIdentifier.lytx.description == #"Lytx, INC."#)
    
        // JUSTMORPH PTE. LTD.
        #expect(CompanyIdentifier.justmorphPte.rawValue == 2662)
        #expect(CompanyIdentifier.justmorphPte.name == #"JUSTMORPH PTE. LTD."#)
        #expect(CompanyIdentifier.justmorphPte.description == #"JUSTMORPH PTE. LTD."#)
    
        // Beijing SuperHexa Century Technology CO. Ltd
        #expect(CompanyIdentifier.beijingSuperhexaCenturyTechnology.rawValue == 2663)
        #expect(CompanyIdentifier.beijingSuperhexaCenturyTechnology.name == #"Beijing SuperHexa Century Technology CO. Ltd"#)
        #expect(CompanyIdentifier.beijingSuperhexaCenturyTechnology.description == #"Beijing SuperHexa Century Technology CO. Ltd"#)
    
        // Focus Ingenieria SRL
        #expect(CompanyIdentifier.focusIngenieria.rawValue == 2664)
        #expect(CompanyIdentifier.focusIngenieria.name == #"Focus Ingenieria SRL"#)
        #expect(CompanyIdentifier.focusIngenieria.description == #"Focus Ingenieria SRL"#)
    
        // HAPPIEST BABY, INC.
        #expect(CompanyIdentifier.happiestBaby.rawValue == 2665)
        #expect(CompanyIdentifier.happiestBaby.name == #"HAPPIEST BABY, INC."#)
        #expect(CompanyIdentifier.happiestBaby.description == #"HAPPIEST BABY, INC."#)
    
        // Scribble Design Inc.
        #expect(CompanyIdentifier.scribbleDesign.rawValue == 2666)
        #expect(CompanyIdentifier.scribbleDesign.name == #"Scribble Design Inc."#)
        #expect(CompanyIdentifier.scribbleDesign.description == #"Scribble Design Inc."#)
    
        // Olympic Ophthalmics, Inc.
        #expect(CompanyIdentifier.olympicOphthalmics.rawValue == 2667)
        #expect(CompanyIdentifier.olympicOphthalmics.name == #"Olympic Ophthalmics, Inc."#)
        #expect(CompanyIdentifier.olympicOphthalmics.description == #"Olympic Ophthalmics, Inc."#)
    
        // Pokkels
        #expect(CompanyIdentifier.pokkels.rawValue == 2668)
        #expect(CompanyIdentifier.pokkels.name == #"Pokkels"#)
        #expect(CompanyIdentifier.pokkels.description == #"Pokkels"#)
    
        // KUUKANJYOKIN Co.,Ltd.
        #expect(CompanyIdentifier.kuukanjyokin.rawValue == 2669)
        #expect(CompanyIdentifier.kuukanjyokin.name == #"KUUKANJYOKIN Co.,Ltd."#)
        #expect(CompanyIdentifier.kuukanjyokin.description == #"KUUKANJYOKIN Co.,Ltd."#)
    
        // Pac Sane Limited
        #expect(CompanyIdentifier.pacSane.rawValue == 2670)
        #expect(CompanyIdentifier.pacSane.name == #"Pac Sane Limited"#)
        #expect(CompanyIdentifier.pacSane.description == #"Pac Sane Limited"#)
    
        // Warner Bros.
        #expect(CompanyIdentifier.warnerBros.rawValue == 2671)
        #expect(CompanyIdentifier.warnerBros.name == #"Warner Bros."#)
        #expect(CompanyIdentifier.warnerBros.description == #"Warner Bros."#)
    
        // Ooma
        #expect(CompanyIdentifier.ooma.rawValue == 2672)
        #expect(CompanyIdentifier.ooma.name == #"Ooma"#)
        #expect(CompanyIdentifier.ooma.description == #"Ooma"#)
    
        // Senquip Pty Ltd
        #expect(CompanyIdentifier.senquip.rawValue == 2673)
        #expect(CompanyIdentifier.senquip.name == #"Senquip Pty Ltd"#)
        #expect(CompanyIdentifier.senquip.description == #"Senquip Pty Ltd"#)
    
        // Jumo GmbH & Co. KG
        #expect(CompanyIdentifier.jumo.rawValue == 2674)
        #expect(CompanyIdentifier.jumo.name == #"Jumo GmbH & Co. KG"#)
        #expect(CompanyIdentifier.jumo.description == #"Jumo GmbH & Co. KG"#)
    
        // Innohome Oy
        #expect(CompanyIdentifier.innohome.rawValue == 2675)
        #expect(CompanyIdentifier.innohome.name == #"Innohome Oy"#)
        #expect(CompanyIdentifier.innohome.description == #"Innohome Oy"#)
    
        // MICROSON S.A.
        #expect(CompanyIdentifier.microson.rawValue == 2676)
        #expect(CompanyIdentifier.microson.name == #"MICROSON S.A."#)
        #expect(CompanyIdentifier.microson.description == #"MICROSON S.A."#)
    
        // Delta Cycle Corporation
        #expect(CompanyIdentifier.deltaCycle.rawValue == 2677)
        #expect(CompanyIdentifier.deltaCycle.name == #"Delta Cycle Corporation"#)
        #expect(CompanyIdentifier.deltaCycle.description == #"Delta Cycle Corporation"#)
    
        // Synaptics Incorporated
        #expect(CompanyIdentifier.synaptics.rawValue == 2678)
        #expect(CompanyIdentifier.synaptics.name == #"Synaptics Incorporated"#)
        #expect(CompanyIdentifier.synaptics.description == #"Synaptics Incorporated"#)
    
        // AXTRO PTE. LTD.
        #expect(CompanyIdentifier.axtroPte.rawValue == 2679)
        #expect(CompanyIdentifier.axtroPte.name == #"AXTRO PTE. LTD."#)
        #expect(CompanyIdentifier.axtroPte.description == #"AXTRO PTE. LTD."#)
    
        // Shenzhen Sunricher Technology Limited
        #expect(CompanyIdentifier.shenzhenSunricherTechnology.rawValue == 2680)
        #expect(CompanyIdentifier.shenzhenSunricherTechnology.name == #"Shenzhen Sunricher Technology Limited"#)
        #expect(CompanyIdentifier.shenzhenSunricherTechnology.description == #"Shenzhen Sunricher Technology Limited"#)
    
        // Webasto SE
        #expect(CompanyIdentifier.webasto.rawValue == 2681)
        #expect(CompanyIdentifier.webasto.name == #"Webasto SE"#)
        #expect(CompanyIdentifier.webasto.description == #"Webasto SE"#)
    
        // Emlid Limited
        #expect(CompanyIdentifier.emlid.rawValue == 2682)
        #expect(CompanyIdentifier.emlid.name == #"Emlid Limited"#)
        #expect(CompanyIdentifier.emlid.description == #"Emlid Limited"#)
    
        // UniqAir Oy
        #expect(CompanyIdentifier.uniqair.rawValue == 2683)
        #expect(CompanyIdentifier.uniqair.name == #"UniqAir Oy"#)
        #expect(CompanyIdentifier.uniqair.description == #"UniqAir Oy"#)
    
        // WAFERLOCK
        #expect(CompanyIdentifier.waferlock.rawValue == 2684)
        #expect(CompanyIdentifier.waferlock.name == #"WAFERLOCK"#)
        #expect(CompanyIdentifier.waferlock.description == #"WAFERLOCK"#)
    
        // Freedman Electronics Pty Ltd
        #expect(CompanyIdentifier.freedmanElectronics.rawValue == 2685)
        #expect(CompanyIdentifier.freedmanElectronics.name == #"Freedman Electronics Pty Ltd"#)
        #expect(CompanyIdentifier.freedmanElectronics.description == #"Freedman Electronics Pty Ltd"#)
    
        // KEBA Handover Automation GmbH
        #expect(CompanyIdentifier.kebaHandoverAutomation.rawValue == 2686)
        #expect(CompanyIdentifier.kebaHandoverAutomation.name == #"KEBA Handover Automation GmbH"#)
        #expect(CompanyIdentifier.kebaHandoverAutomation.description == #"KEBA Handover Automation GmbH"#)
    
        // Intuity Medical
        #expect(CompanyIdentifier.intuityMedical.rawValue == 2687)
        #expect(CompanyIdentifier.intuityMedical.name == #"Intuity Medical"#)
        #expect(CompanyIdentifier.intuityMedical.description == #"Intuity Medical"#)
    
        // Cleer Limited
        #expect(CompanyIdentifier.cleer.rawValue == 2688)
        #expect(CompanyIdentifier.cleer.name == #"Cleer Limited"#)
        #expect(CompanyIdentifier.cleer.description == #"Cleer Limited"#)
    
        // Universal Biosensors Pty Ltd
        #expect(CompanyIdentifier.universalBiosensors.rawValue == 2689)
        #expect(CompanyIdentifier.universalBiosensors.name == #"Universal Biosensors Pty Ltd"#)
        #expect(CompanyIdentifier.universalBiosensors.description == #"Universal Biosensors Pty Ltd"#)
    
        // Corsair
        #expect(CompanyIdentifier.corsair.rawValue == 2690)
        #expect(CompanyIdentifier.corsair.name == #"Corsair"#)
        #expect(CompanyIdentifier.corsair.description == #"Corsair"#)
    
        // Rivata, Inc.
        #expect(CompanyIdentifier.rivata.rawValue == 2691)
        #expect(CompanyIdentifier.rivata.name == #"Rivata, Inc."#)
        #expect(CompanyIdentifier.rivata.description == #"Rivata, Inc."#)
    
        // Greennote Inc,
        #expect(CompanyIdentifier.greennote.rawValue == 2692)
        #expect(CompanyIdentifier.greennote.name == #"Greennote Inc,"#)
        #expect(CompanyIdentifier.greennote.description == #"Greennote Inc,"#)
    
        // Snowball Technology Co., Ltd.
        #expect(CompanyIdentifier.snowballTechnology.rawValue == 2693)
        #expect(CompanyIdentifier.snowballTechnology.name == #"Snowball Technology Co., Ltd."#)
        #expect(CompanyIdentifier.snowballTechnology.description == #"Snowball Technology Co., Ltd."#)
    
        // ALIZENT International
        #expect(CompanyIdentifier.alizentInternational.rawValue == 2694)
        #expect(CompanyIdentifier.alizentInternational.name == #"ALIZENT International"#)
        #expect(CompanyIdentifier.alizentInternational.description == #"ALIZENT International"#)
    
        // Shanghai Smart System Technology Co., Ltd
        #expect(CompanyIdentifier.shanghaiSmartSystemTechnology.rawValue == 2695)
        #expect(CompanyIdentifier.shanghaiSmartSystemTechnology.name == #"Shanghai Smart System Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shanghaiSmartSystemTechnology.description == #"Shanghai Smart System Technology Co., Ltd"#)
    
        // PSA Peugeot Citroen
        #expect(CompanyIdentifier.psaPeugeotCitroen.rawValue == 2696)
        #expect(CompanyIdentifier.psaPeugeotCitroen.name == #"PSA Peugeot Citroen"#)
        #expect(CompanyIdentifier.psaPeugeotCitroen.description == #"PSA Peugeot Citroen"#)
    
        // SES-Imagotag
        #expect(CompanyIdentifier.sesImagotag.rawValue == 2697)
        #expect(CompanyIdentifier.sesImagotag.name == #"SES-Imagotag"#)
        #expect(CompanyIdentifier.sesImagotag.description == #"SES-Imagotag"#)
    
        // HAINBUCH GMBH SPANNENDE TECHNIK
        #expect(CompanyIdentifier.hainbuchSpannendeTechnik.rawValue == 2698)
        #expect(CompanyIdentifier.hainbuchSpannendeTechnik.name == #"HAINBUCH GMBH SPANNENDE TECHNIK"#)
        #expect(CompanyIdentifier.hainbuchSpannendeTechnik.description == #"HAINBUCH GMBH SPANNENDE TECHNIK"#)
    
        // SANlight GmbH
        #expect(CompanyIdentifier.sanlight.rawValue == 2699)
        #expect(CompanyIdentifier.sanlight.name == #"SANlight GmbH"#)
        #expect(CompanyIdentifier.sanlight.description == #"SANlight GmbH"#)
    
        // DelpSys, s.r.o.
        #expect(CompanyIdentifier.delpsys.rawValue == 2700)
        #expect(CompanyIdentifier.delpsys.name == #"DelpSys, s.r.o."#)
        #expect(CompanyIdentifier.delpsys.description == #"DelpSys, s.r.o."#)
    
        // JCM TECHNOLOGIES S.A.
        #expect(CompanyIdentifier.jcmTechnologies.rawValue == 2701)
        #expect(CompanyIdentifier.jcmTechnologies.name == #"JCM TECHNOLOGIES S.A."#)
        #expect(CompanyIdentifier.jcmTechnologies.description == #"JCM TECHNOLOGIES S.A."#)
    
        // Perfect Company
        #expect(CompanyIdentifier.perfect.rawValue == 2702)
        #expect(CompanyIdentifier.perfect.name == #"Perfect Company"#)
        #expect(CompanyIdentifier.perfect.description == #"Perfect Company"#)
    
        // TOTO LTD.
        #expect(CompanyIdentifier.toto.rawValue == 2703)
        #expect(CompanyIdentifier.toto.name == #"TOTO LTD."#)
        #expect(CompanyIdentifier.toto.description == #"TOTO LTD."#)
    
        // Shenzhen Grandsun Electronic Co.,Ltd.
        #expect(CompanyIdentifier.shenzhenGrandsunElectronic.rawValue == 2704)
        #expect(CompanyIdentifier.shenzhenGrandsunElectronic.name == #"Shenzhen Grandsun Electronic Co.,Ltd."#)
        #expect(CompanyIdentifier.shenzhenGrandsunElectronic.description == #"Shenzhen Grandsun Electronic Co.,Ltd."#)
    
        // Monarch International Inc.
        #expect(CompanyIdentifier.monarchInternational.rawValue == 2705)
        #expect(CompanyIdentifier.monarchInternational.name == #"Monarch International Inc."#)
        #expect(CompanyIdentifier.monarchInternational.description == #"Monarch International Inc."#)
    
        // Carestream Dental LLC
        #expect(CompanyIdentifier.carestreamDental.rawValue == 2706)
        #expect(CompanyIdentifier.carestreamDental.name == #"Carestream Dental LLC"#)
        #expect(CompanyIdentifier.carestreamDental.description == #"Carestream Dental LLC"#)
    
        // GiPStech S.r.l.
        #expect(CompanyIdentifier.gipstech.rawValue == 2707)
        #expect(CompanyIdentifier.gipstech.name == #"GiPStech S.r.l."#)
        #expect(CompanyIdentifier.gipstech.description == #"GiPStech S.r.l."#)
    
        // OOBIK Inc.
        #expect(CompanyIdentifier.oobik.rawValue == 2708)
        #expect(CompanyIdentifier.oobik.name == #"OOBIK Inc."#)
        #expect(CompanyIdentifier.oobik.description == #"OOBIK Inc."#)
    
        // Pamex Inc.
        #expect(CompanyIdentifier.pamex.rawValue == 2709)
        #expect(CompanyIdentifier.pamex.name == #"Pamex Inc."#)
        #expect(CompanyIdentifier.pamex.description == #"Pamex Inc."#)
    
        // Lightricity Ltd
        #expect(CompanyIdentifier.lightricity.rawValue == 2710)
        #expect(CompanyIdentifier.lightricity.name == #"Lightricity Ltd"#)
        #expect(CompanyIdentifier.lightricity.description == #"Lightricity Ltd"#)
    
        // SensTek
        #expect(CompanyIdentifier.senstek.rawValue == 2711)
        #expect(CompanyIdentifier.senstek.name == #"SensTek"#)
        #expect(CompanyIdentifier.senstek.description == #"SensTek"#)
    
        // Foil, Inc.
        #expect(CompanyIdentifier.foil.rawValue == 2712)
        #expect(CompanyIdentifier.foil.name == #"Foil, Inc."#)
        #expect(CompanyIdentifier.foil.description == #"Foil, Inc."#)
    
        // Shanghai high-flying electronics technology Co.,Ltd
        #expect(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.rawValue == 2713)
        #expect(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.name == #"Shanghai high-flying electronics technology Co.,Ltd"#)
        #expect(CompanyIdentifier.shanghaiHighFlyingElectronicsTechnology.description == #"Shanghai high-flying electronics technology Co.,Ltd"#)
    
        // TEMKIN ASSOCIATES, LLC
        #expect(CompanyIdentifier.temkinsociates.rawValue == 2714)
        #expect(CompanyIdentifier.temkinsociates.name == #"TEMKIN ASSOCIATES, LLC"#)
        #expect(CompanyIdentifier.temkinsociates.description == #"TEMKIN ASSOCIATES, LLC"#)
    
        // Eello LLC
        #expect(CompanyIdentifier.eello.rawValue == 2715)
        #expect(CompanyIdentifier.eello.name == #"Eello LLC"#)
        #expect(CompanyIdentifier.eello.description == #"Eello LLC"#)
    
        // Xi'an Fengyu Information Technology Co., Ltd.
        #expect(CompanyIdentifier.xiAnFengyuInformationTechnology.rawValue == 2716)
        #expect(CompanyIdentifier.xiAnFengyuInformationTechnology.name == #"Xi'an Fengyu Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.xiAnFengyuInformationTechnology.description == #"Xi'an Fengyu Information Technology Co., Ltd."#)
    
        // Canon Finetech Nisca Inc.
        #expect(CompanyIdentifier.canonFinetechNisca.rawValue == 2717)
        #expect(CompanyIdentifier.canonFinetechNisca.name == #"Canon Finetech Nisca Inc."#)
        #expect(CompanyIdentifier.canonFinetechNisca.description == #"Canon Finetech Nisca Inc."#)
    
        // LifePlus, Inc.
        #expect(CompanyIdentifier.lifeplus.rawValue == 2718)
        #expect(CompanyIdentifier.lifeplus.name == #"LifePlus, Inc."#)
        #expect(CompanyIdentifier.lifeplus.description == #"LifePlus, Inc."#)
    
        // ista International GmbH
        #expect(CompanyIdentifier.istaInternational.rawValue == 2719)
        #expect(CompanyIdentifier.istaInternational.name == #"ista International GmbH"#)
        #expect(CompanyIdentifier.istaInternational.description == #"ista International GmbH"#)
    
        // Loy Tec electronics GmbH
        #expect(CompanyIdentifier.loyTecElectronics.rawValue == 2720)
        #expect(CompanyIdentifier.loyTecElectronics.name == #"Loy Tec electronics GmbH"#)
        #expect(CompanyIdentifier.loyTecElectronics.description == #"Loy Tec electronics GmbH"#)
    
        // LINCOGN TECHNOLOGY CO. LIMITED
        #expect(CompanyIdentifier.lincognTechnology.rawValue == 2721)
        #expect(CompanyIdentifier.lincognTechnology.name == #"LINCOGN TECHNOLOGY CO. LIMITED"#)
        #expect(CompanyIdentifier.lincognTechnology.description == #"LINCOGN TECHNOLOGY CO. LIMITED"#)
    
        // Care Bloom, LLC
        #expect(CompanyIdentifier.careBloom.rawValue == 2722)
        #expect(CompanyIdentifier.careBloom.name == #"Care Bloom, LLC"#)
        #expect(CompanyIdentifier.careBloom.description == #"Care Bloom, LLC"#)
    
        // DIC Corporation
        #expect(CompanyIdentifier.dic.rawValue == 2723)
        #expect(CompanyIdentifier.dic.name == #"DIC Corporation"#)
        #expect(CompanyIdentifier.dic.description == #"DIC Corporation"#)
    
        // FAZEPRO LLC
        #expect(CompanyIdentifier.fazepro.rawValue == 2724)
        #expect(CompanyIdentifier.fazepro.name == #"FAZEPRO LLC"#)
        #expect(CompanyIdentifier.fazepro.description == #"FAZEPRO LLC"#)
    
        // Shenzhen Uascent Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenUascentTechnology.rawValue == 2725)
        #expect(CompanyIdentifier.shenzhenUascentTechnology.name == #"Shenzhen Uascent Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenUascentTechnology.description == #"Shenzhen Uascent Technology Co., Ltd"#)
    
        // Realityworks, inc.
        #expect(CompanyIdentifier.realityworks.rawValue == 2726)
        #expect(CompanyIdentifier.realityworks.name == #"Realityworks, inc."#)
        #expect(CompanyIdentifier.realityworks.description == #"Realityworks, inc."#)
    
        // Urbanista AB
        #expect(CompanyIdentifier.urbanista.rawValue == 2727)
        #expect(CompanyIdentifier.urbanista.name == #"Urbanista AB"#)
        #expect(CompanyIdentifier.urbanista.description == #"Urbanista AB"#)
    
        // Zencontrol Pty Ltd
        #expect(CompanyIdentifier.zencontrol.rawValue == 2728)
        #expect(CompanyIdentifier.zencontrol.name == #"Zencontrol Pty Ltd"#)
        #expect(CompanyIdentifier.zencontrol.description == #"Zencontrol Pty Ltd"#)
    
        // Spintly, Inc.
        #expect(CompanyIdentifier.spintly.rawValue == 2729)
        #expect(CompanyIdentifier.spintly.name == #"Spintly, Inc."#)
        #expect(CompanyIdentifier.spintly.description == #"Spintly, Inc."#)
    
        // Computime International Ltd
        #expect(CompanyIdentifier.computimeInternational.rawValue == 2730)
        #expect(CompanyIdentifier.computimeInternational.name == #"Computime International Ltd"#)
        #expect(CompanyIdentifier.computimeInternational.description == #"Computime International Ltd"#)
    
        // Anhui Listenai Co
        #expect(CompanyIdentifier.anhuiListenaiCo.rawValue == 2731)
        #expect(CompanyIdentifier.anhuiListenaiCo.name == #"Anhui Listenai Co"#)
        #expect(CompanyIdentifier.anhuiListenaiCo.description == #"Anhui Listenai Co"#)
    
        // OSM HK Limited
        #expect(CompanyIdentifier.osm.rawValue == 2732)
        #expect(CompanyIdentifier.osm.name == #"OSM HK Limited"#)
        #expect(CompanyIdentifier.osm.description == #"OSM HK Limited"#)
    
        // Adevo Consulting AB
        #expect(CompanyIdentifier.adevoConsulting.rawValue == 2733)
        #expect(CompanyIdentifier.adevoConsulting.name == #"Adevo Consulting AB"#)
        #expect(CompanyIdentifier.adevoConsulting.description == #"Adevo Consulting AB"#)
    
        // PS Engineering, Inc.
        #expect(CompanyIdentifier.psEngineering.rawValue == 2734)
        #expect(CompanyIdentifier.psEngineering.name == #"PS Engineering, Inc."#)
        #expect(CompanyIdentifier.psEngineering.description == #"PS Engineering, Inc."#)
    
        // AIAIAI ApS
        #expect(CompanyIdentifier.aiaiai.rawValue == 2735)
        #expect(CompanyIdentifier.aiaiai.name == #"AIAIAI ApS"#)
        #expect(CompanyIdentifier.aiaiai.description == #"AIAIAI ApS"#)
    
        // Visiontronic s.r.o.
        #expect(CompanyIdentifier.visiontronic.rawValue == 2736)
        #expect(CompanyIdentifier.visiontronic.name == #"Visiontronic s.r.o."#)
        #expect(CompanyIdentifier.visiontronic.description == #"Visiontronic s.r.o."#)
    
        // InVue Security Products Inc
        #expect(CompanyIdentifier.invueSecurityProducts.rawValue == 2737)
        #expect(CompanyIdentifier.invueSecurityProducts.name == #"InVue Security Products Inc"#)
        #expect(CompanyIdentifier.invueSecurityProducts.description == #"InVue Security Products Inc"#)
    
        // TouchTronics, Inc.
        #expect(CompanyIdentifier.touchtronics.rawValue == 2738)
        #expect(CompanyIdentifier.touchtronics.name == #"TouchTronics, Inc."#)
        #expect(CompanyIdentifier.touchtronics.description == #"TouchTronics, Inc."#)
    
        // INNER RANGE PTY. LTD.
        #expect(CompanyIdentifier.innerRange.rawValue == 2739)
        #expect(CompanyIdentifier.innerRange.name == #"INNER RANGE PTY. LTD."#)
        #expect(CompanyIdentifier.innerRange.description == #"INNER RANGE PTY. LTD."#)
    
        // Ellenby Technologies, Inc.
        #expect(CompanyIdentifier.ellenbyTechnologies.rawValue == 2740)
        #expect(CompanyIdentifier.ellenbyTechnologies.name == #"Ellenby Technologies, Inc."#)
        #expect(CompanyIdentifier.ellenbyTechnologies.description == #"Ellenby Technologies, Inc."#)
    
        // Elstat Electronics Ltd.
        #expect(CompanyIdentifier.elstatElectronics.rawValue == 2741)
        #expect(CompanyIdentifier.elstatElectronics.name == #"Elstat Electronics Ltd."#)
        #expect(CompanyIdentifier.elstatElectronics.description == #"Elstat Electronics Ltd."#)
    
        // Xenter, Inc.
        #expect(CompanyIdentifier.xenter.rawValue == 2742)
        #expect(CompanyIdentifier.xenter.name == #"Xenter, Inc."#)
        #expect(CompanyIdentifier.xenter.description == #"Xenter, Inc."#)
    
        // LogTag North America Inc.
        #expect(CompanyIdentifier.logtagNorthAmerica.rawValue == 2743)
        #expect(CompanyIdentifier.logtagNorthAmerica.name == #"LogTag North America Inc."#)
        #expect(CompanyIdentifier.logtagNorthAmerica.description == #"LogTag North America Inc."#)
    
        // Sens.ai Incorporated
        #expect(CompanyIdentifier.sensAi.rawValue == 2744)
        #expect(CompanyIdentifier.sensAi.name == #"Sens.ai Incorporated"#)
        #expect(CompanyIdentifier.sensAi.description == #"Sens.ai Incorporated"#)
    
        // STL
        #expect(CompanyIdentifier.stl.rawValue == 2745)
        #expect(CompanyIdentifier.stl.name == #"STL"#)
        #expect(CompanyIdentifier.stl.description == #"STL"#)
    
        // Open Bionics Ltd.
        #expect(CompanyIdentifier.openBionics.rawValue == 2746)
        #expect(CompanyIdentifier.openBionics.name == #"Open Bionics Ltd."#)
        #expect(CompanyIdentifier.openBionics.description == #"Open Bionics Ltd."#)
    
        // R-DAS, s.r.o.
        #expect(CompanyIdentifier.rDas.rawValue == 2747)
        #expect(CompanyIdentifier.rDas.name == #"R-DAS, s.r.o."#)
        #expect(CompanyIdentifier.rDas.description == #"R-DAS, s.r.o."#)
    
        // KCCS Mobile Engineering Co., Ltd.
        #expect(CompanyIdentifier.kccsMobileEngineering.rawValue == 2748)
        #expect(CompanyIdentifier.kccsMobileEngineering.name == #"KCCS Mobile Engineering Co., Ltd."#)
        #expect(CompanyIdentifier.kccsMobileEngineering.description == #"KCCS Mobile Engineering Co., Ltd."#)
    
        // Inventas AS
        #expect(CompanyIdentifier.inventas.rawValue == 2749)
        #expect(CompanyIdentifier.inventas.name == #"Inventas AS"#)
        #expect(CompanyIdentifier.inventas.description == #"Inventas AS"#)
    
        // Robkoo Information & Technologies Co., Ltd.
        #expect(CompanyIdentifier.robkooInformationTechnologies.rawValue == 2750)
        #expect(CompanyIdentifier.robkooInformationTechnologies.name == #"Robkoo Information & Technologies Co., Ltd."#)
        #expect(CompanyIdentifier.robkooInformationTechnologies.description == #"Robkoo Information & Technologies Co., Ltd."#)
    
        // PAUL HARTMANN AG
        #expect(CompanyIdentifier.paulHartmann.rawValue == 2751)
        #expect(CompanyIdentifier.paulHartmann.name == #"PAUL HARTMANN AG"#)
        #expect(CompanyIdentifier.paulHartmann.description == #"PAUL HARTMANN AG"#)
    
        // Omni-ID USA, INC.
        #expect(CompanyIdentifier.omniId.rawValue == 2752)
        #expect(CompanyIdentifier.omniId.name == #"Omni-ID USA, INC."#)
        #expect(CompanyIdentifier.omniId.description == #"Omni-ID USA, INC."#)
    
        // Shenzhen Jingxun Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenJingxunTechnology.rawValue == 2753)
        #expect(CompanyIdentifier.shenzhenJingxunTechnology.name == #"Shenzhen Jingxun Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenJingxunTechnology.description == #"Shenzhen Jingxun Technology Co., Ltd."#)
    
        // RealMega Microelectronics technology (Shanghai) Co. Ltd.
        #expect(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.rawValue == 2754)
        #expect(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.name == #"RealMega Microelectronics technology (Shanghai) Co. Ltd."#)
        #expect(CompanyIdentifier.realmegaMicroelectronicsTechnologyShanghai.description == #"RealMega Microelectronics technology (Shanghai) Co. Ltd."#)
    
        // Kenzen, Inc.
        #expect(CompanyIdentifier.kenzen.rawValue == 2755)
        #expect(CompanyIdentifier.kenzen.name == #"Kenzen, Inc."#)
        #expect(CompanyIdentifier.kenzen.description == #"Kenzen, Inc."#)
    
        // CODIUM
        #expect(CompanyIdentifier.codium.rawValue == 2756)
        #expect(CompanyIdentifier.codium.name == #"CODIUM"#)
        #expect(CompanyIdentifier.codium.description == #"CODIUM"#)
    
        // Flexoptix GmbH
        #expect(CompanyIdentifier.flexoptix.rawValue == 2757)
        #expect(CompanyIdentifier.flexoptix.name == #"Flexoptix GmbH"#)
        #expect(CompanyIdentifier.flexoptix.description == #"Flexoptix GmbH"#)
    
        // Barnes Group Inc.
        #expect(CompanyIdentifier.barnesGroup.rawValue == 2758)
        #expect(CompanyIdentifier.barnesGroup.name == #"Barnes Group Inc."#)
        #expect(CompanyIdentifier.barnesGroup.description == #"Barnes Group Inc."#)
    
        // Chengdu Aich Technology Co.,Ltd
        #expect(CompanyIdentifier.chengduAichTechnology.rawValue == 2759)
        #expect(CompanyIdentifier.chengduAichTechnology.name == #"Chengdu Aich Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.chengduAichTechnology.description == #"Chengdu Aich Technology Co.,Ltd"#)
    
        // Keepin Co., Ltd.
        #expect(CompanyIdentifier.keepin.rawValue == 2760)
        #expect(CompanyIdentifier.keepin.name == #"Keepin Co., Ltd."#)
        #expect(CompanyIdentifier.keepin.description == #"Keepin Co., Ltd."#)
    
        // Swedlock AB
        #expect(CompanyIdentifier.swedlock.rawValue == 2761)
        #expect(CompanyIdentifier.swedlock.name == #"Swedlock AB"#)
        #expect(CompanyIdentifier.swedlock.description == #"Swedlock AB"#)
    
        // Shenzhen CoolKit Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenCoolkitTechnology.rawValue == 2762)
        #expect(CompanyIdentifier.shenzhenCoolkitTechnology.name == #"Shenzhen CoolKit Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenCoolkitTechnology.description == #"Shenzhen CoolKit Technology Co., Ltd"#)
    
        // ise Individuelle Software und Elektronik GmbH
        #expect(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.rawValue == 2763)
        #expect(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.name == #"ise Individuelle Software und Elektronik GmbH"#)
        #expect(CompanyIdentifier.iseIndividuelleSoftwareUndElektronik.description == #"ise Individuelle Software und Elektronik GmbH"#)
    
        // Nuvoton
        #expect(CompanyIdentifier.nuvoton.rawValue == 2764)
        #expect(CompanyIdentifier.nuvoton.name == #"Nuvoton"#)
        #expect(CompanyIdentifier.nuvoton.description == #"Nuvoton"#)
    
        // Visuallex Sport International Limited
        #expect(CompanyIdentifier.visuallexSportInternational.rawValue == 2765)
        #expect(CompanyIdentifier.visuallexSportInternational.name == #"Visuallex Sport International Limited"#)
        #expect(CompanyIdentifier.visuallexSportInternational.description == #"Visuallex Sport International Limited"#)
    
        // KOBATA GAUGE MFG. CO., LTD.
        #expect(CompanyIdentifier.kobataGaugeMfg.rawValue == 2766)
        #expect(CompanyIdentifier.kobataGaugeMfg.name == #"KOBATA GAUGE MFG. CO., LTD."#)
        #expect(CompanyIdentifier.kobataGaugeMfg.description == #"KOBATA GAUGE MFG. CO., LTD."#)
    
        // CACI Technologies
        #expect(CompanyIdentifier.caciTechnologies.rawValue == 2767)
        #expect(CompanyIdentifier.caciTechnologies.name == #"CACI Technologies"#)
        #expect(CompanyIdentifier.caciTechnologies.description == #"CACI Technologies"#)
    
        // Nordic Strong ApS
        #expect(CompanyIdentifier.nordicStrong.rawValue == 2768)
        #expect(CompanyIdentifier.nordicStrong.name == #"Nordic Strong ApS"#)
        #expect(CompanyIdentifier.nordicStrong.description == #"Nordic Strong ApS"#)
    
        // EAGLE KINGDOM TECHNOLOGIES LIMITED
        #expect(CompanyIdentifier.eagleKingdomTechnologies.rawValue == 2769)
        #expect(CompanyIdentifier.eagleKingdomTechnologies.name == #"EAGLE KINGDOM TECHNOLOGIES LIMITED"#)
        #expect(CompanyIdentifier.eagleKingdomTechnologies.description == #"EAGLE KINGDOM TECHNOLOGIES LIMITED"#)
    
        // Lautsprecher Teufel GmbH
        #expect(CompanyIdentifier.lautsprecherTeufel.rawValue == 2770)
        #expect(CompanyIdentifier.lautsprecherTeufel.name == #"Lautsprecher Teufel GmbH"#)
        #expect(CompanyIdentifier.lautsprecherTeufel.description == #"Lautsprecher Teufel GmbH"#)
    
        // SSV Software Systems GmbH
        #expect(CompanyIdentifier.ssvSoftwareSystems.rawValue == 2771)
        #expect(CompanyIdentifier.ssvSoftwareSystems.name == #"SSV Software Systems GmbH"#)
        #expect(CompanyIdentifier.ssvSoftwareSystems.description == #"SSV Software Systems GmbH"#)
    
        // Zhuhai Pantum Electronisc Co., Ltd
        #expect(CompanyIdentifier.zhuhaiPantumElectronisc.rawValue == 2772)
        #expect(CompanyIdentifier.zhuhaiPantumElectronisc.name == #"Zhuhai Pantum Electronisc Co., Ltd"#)
        #expect(CompanyIdentifier.zhuhaiPantumElectronisc.description == #"Zhuhai Pantum Electronisc Co., Ltd"#)
    
        // Streamit B.V.
        #expect(CompanyIdentifier.streamit.rawValue == 2773)
        #expect(CompanyIdentifier.streamit.name == #"Streamit B.V."#)
        #expect(CompanyIdentifier.streamit.description == #"Streamit B.V."#)
    
        // nymea GmbH
        #expect(CompanyIdentifier.nymea.rawValue == 2774)
        #expect(CompanyIdentifier.nymea.name == #"nymea GmbH"#)
        #expect(CompanyIdentifier.nymea.description == #"nymea GmbH"#)
    
        // AL-KO Geraete GmbH
        #expect(CompanyIdentifier.alKoGeraete.rawValue == 2775)
        #expect(CompanyIdentifier.alKoGeraete.name == #"AL-KO Geraete GmbH"#)
        #expect(CompanyIdentifier.alKoGeraete.description == #"AL-KO Geraete GmbH"#)
    
        // Franz Kaldewei GmbH&Co KG
        #expect(CompanyIdentifier.franzKaldeweiCoKg.rawValue == 2776)
        #expect(CompanyIdentifier.franzKaldeweiCoKg.name == #"Franz Kaldewei GmbH&Co KG"#)
        #expect(CompanyIdentifier.franzKaldeweiCoKg.description == #"Franz Kaldewei GmbH&Co KG"#)
    
        // Shenzhen Aimore. Co.,Ltd
        #expect(CompanyIdentifier.shenzhenAimore.rawValue == 2777)
        #expect(CompanyIdentifier.shenzhenAimore.name == #"Shenzhen Aimore. Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenAimore.description == #"Shenzhen Aimore. Co.,Ltd"#)
    
        // Codefabrik GmbH
        #expect(CompanyIdentifier.codefabrik.rawValue == 2778)
        #expect(CompanyIdentifier.codefabrik.name == #"Codefabrik GmbH"#)
        #expect(CompanyIdentifier.codefabrik.description == #"Codefabrik GmbH"#)
    
        // Reelables, Inc.
        #expect(CompanyIdentifier.reelables.rawValue == 2779)
        #expect(CompanyIdentifier.reelables.name == #"Reelables, Inc."#)
        #expect(CompanyIdentifier.reelables.description == #"Reelables, Inc."#)
    
        // Duravit AG
        #expect(CompanyIdentifier.duravit.rawValue == 2780)
        #expect(CompanyIdentifier.duravit.name == #"Duravit AG"#)
        #expect(CompanyIdentifier.duravit.description == #"Duravit AG"#)
    
        // Boss Audio
        #expect(CompanyIdentifier.bossAudio.rawValue == 2781)
        #expect(CompanyIdentifier.bossAudio.name == #"Boss Audio"#)
        #expect(CompanyIdentifier.bossAudio.description == #"Boss Audio"#)
    
        // Vocera Communications, Inc.
        #expect(CompanyIdentifier.voceraCommunications.rawValue == 2782)
        #expect(CompanyIdentifier.voceraCommunications.name == #"Vocera Communications, Inc."#)
        #expect(CompanyIdentifier.voceraCommunications.description == #"Vocera Communications, Inc."#)
    
        // Douglas Dynamics L.L.C.
        #expect(CompanyIdentifier.douglasDynamicsLLC.rawValue == 2783)
        #expect(CompanyIdentifier.douglasDynamicsLLC.name == #"Douglas Dynamics L.L.C."#)
        #expect(CompanyIdentifier.douglasDynamicsLLC.description == #"Douglas Dynamics L.L.C."#)
    
        // Viceroy Devices Corporation
        #expect(CompanyIdentifier.viceroyDevices.rawValue == 2784)
        #expect(CompanyIdentifier.viceroyDevices.name == #"Viceroy Devices Corporation"#)
        #expect(CompanyIdentifier.viceroyDevices.description == #"Viceroy Devices Corporation"#)
    
        // ChengDu ForThink Technology Co., Ltd.
        #expect(CompanyIdentifier.chengduForthinkTechnology.rawValue == 2785)
        #expect(CompanyIdentifier.chengduForthinkTechnology.name == #"ChengDu ForThink Technology Co., Ltd."#)
        #expect(CompanyIdentifier.chengduForthinkTechnology.description == #"ChengDu ForThink Technology Co., Ltd."#)
    
        // IMATRIX SYSTEMS, INC.
        #expect(CompanyIdentifier.imatrixSystems.rawValue == 2786)
        #expect(CompanyIdentifier.imatrixSystems.name == #"IMATRIX SYSTEMS, INC."#)
        #expect(CompanyIdentifier.imatrixSystems.description == #"IMATRIX SYSTEMS, INC."#)
    
        // GlobalMed
        #expect(CompanyIdentifier.globalmed.rawValue == 2787)
        #expect(CompanyIdentifier.globalmed.name == #"GlobalMed"#)
        #expect(CompanyIdentifier.globalmed.description == #"GlobalMed"#)
    
        // DALI Alliance
        #expect(CompanyIdentifier.daliAlliance.rawValue == 2788)
        #expect(CompanyIdentifier.daliAlliance.name == #"DALI Alliance"#)
        #expect(CompanyIdentifier.daliAlliance.description == #"DALI Alliance"#)
    
        // unu GmbH
        #expect(CompanyIdentifier.unu.rawValue == 2789)
        #expect(CompanyIdentifier.unu.name == #"unu GmbH"#)
        #expect(CompanyIdentifier.unu.description == #"unu GmbH"#)
    
        // Hexology
        #expect(CompanyIdentifier.hexology.rawValue == 2790)
        #expect(CompanyIdentifier.hexology.name == #"Hexology"#)
        #expect(CompanyIdentifier.hexology.description == #"Hexology"#)
    
        // Sunplus Technology Co., Ltd.
        #expect(CompanyIdentifier.sunplusTechnology.rawValue == 2791)
        #expect(CompanyIdentifier.sunplusTechnology.name == #"Sunplus Technology Co., Ltd."#)
        #expect(CompanyIdentifier.sunplusTechnology.description == #"Sunplus Technology Co., Ltd."#)
    
        // LEVEL, s.r.o.
        #expect(CompanyIdentifier.level.rawValue == 2792)
        #expect(CompanyIdentifier.level.name == #"LEVEL, s.r.o."#)
        #expect(CompanyIdentifier.level.description == #"LEVEL, s.r.o."#)
    
        // FLIR Systems AB
        #expect(CompanyIdentifier.flirSystems.rawValue == 2793)
        #expect(CompanyIdentifier.flirSystems.name == #"FLIR Systems AB"#)
        #expect(CompanyIdentifier.flirSystems.description == #"FLIR Systems AB"#)
    
        // Borda Technology
        #expect(CompanyIdentifier.bordaTechnology.rawValue == 2794)
        #expect(CompanyIdentifier.bordaTechnology.name == #"Borda Technology"#)
        #expect(CompanyIdentifier.bordaTechnology.description == #"Borda Technology"#)
    
        // Square, Inc.
        #expect(CompanyIdentifier.square.rawValue == 2795)
        #expect(CompanyIdentifier.square.name == #"Square, Inc."#)
        #expect(CompanyIdentifier.square.description == #"Square, Inc."#)
    
        // FUTEK ADVANCED SENSOR TECHNOLOGY, INC
        #expect(CompanyIdentifier.futekAdvancedSensorTechnology.rawValue == 2796)
        #expect(CompanyIdentifier.futekAdvancedSensorTechnology.name == #"FUTEK ADVANCED SENSOR TECHNOLOGY, INC"#)
        #expect(CompanyIdentifier.futekAdvancedSensorTechnology.description == #"FUTEK ADVANCED SENSOR TECHNOLOGY, INC"#)
    
        // Saxonar GmbH
        #expect(CompanyIdentifier.saxonar.rawValue == 2797)
        #expect(CompanyIdentifier.saxonar.name == #"Saxonar GmbH"#)
        #expect(CompanyIdentifier.saxonar.description == #"Saxonar GmbH"#)
    
        // Velentium, LLC
        #expect(CompanyIdentifier.velentium.rawValue == 2798)
        #expect(CompanyIdentifier.velentium.name == #"Velentium, LLC"#)
        #expect(CompanyIdentifier.velentium.description == #"Velentium, LLC"#)
    
        // GLP German Light Products GmbH
        #expect(CompanyIdentifier.glpGermanLightProducts.rawValue == 2799)
        #expect(CompanyIdentifier.glpGermanLightProducts.name == #"GLP German Light Products GmbH"#)
        #expect(CompanyIdentifier.glpGermanLightProducts.description == #"GLP German Light Products GmbH"#)
    
        // Leupold & Stevens, Inc.
        #expect(CompanyIdentifier.leupoldStevens.rawValue == 2800)
        #expect(CompanyIdentifier.leupoldStevens.name == #"Leupold & Stevens, Inc."#)
        #expect(CompanyIdentifier.leupoldStevens.description == #"Leupold & Stevens, Inc."#)
    
        // CRADERS,CO.,LTD
        #expect(CompanyIdentifier.craders.rawValue == 2801)
        #expect(CompanyIdentifier.craders.name == #"CRADERS,CO.,LTD"#)
        #expect(CompanyIdentifier.craders.description == #"CRADERS,CO.,LTD"#)
    
        // Shanghai All Link Microelectronics Co.,Ltd
        #expect(CompanyIdentifier.shanghaiAllLinkMicroelectronics.rawValue == 2802)
        #expect(CompanyIdentifier.shanghaiAllLinkMicroelectronics.name == #"Shanghai All Link Microelectronics Co.,Ltd"#)
        #expect(CompanyIdentifier.shanghaiAllLinkMicroelectronics.description == #"Shanghai All Link Microelectronics Co.,Ltd"#)
    
        // 701x Inc.
        #expect(CompanyIdentifier.company701X.rawValue == 2803)
        #expect(CompanyIdentifier.company701X.name == #"701x Inc."#)
        #expect(CompanyIdentifier.company701X.description == #"701x Inc."#)
    
        // Radioworks Microelectronics PTY LTD
        #expect(CompanyIdentifier.radioworksMicroelectronics.rawValue == 2804)
        #expect(CompanyIdentifier.radioworksMicroelectronics.name == #"Radioworks Microelectronics PTY LTD"#)
        #expect(CompanyIdentifier.radioworksMicroelectronics.description == #"Radioworks Microelectronics PTY LTD"#)
    
        // Unitech Electronic Inc.
        #expect(CompanyIdentifier.unitechElectronic.rawValue == 2805)
        #expect(CompanyIdentifier.unitechElectronic.name == #"Unitech Electronic Inc."#)
        #expect(CompanyIdentifier.unitechElectronic.description == #"Unitech Electronic Inc."#)
    
        // AMETEK, Inc.
        #expect(CompanyIdentifier.ametek.rawValue == 2806)
        #expect(CompanyIdentifier.ametek.name == #"AMETEK, Inc."#)
        #expect(CompanyIdentifier.ametek.description == #"AMETEK, Inc."#)
    
        // Irdeto
        #expect(CompanyIdentifier.irdeto.rawValue == 2807)
        #expect(CompanyIdentifier.irdeto.name == #"Irdeto"#)
        #expect(CompanyIdentifier.irdeto.description == #"Irdeto"#)
    
        // First Design System Inc.
        #expect(CompanyIdentifier.firstDesignSystem.rawValue == 2808)
        #expect(CompanyIdentifier.firstDesignSystem.name == #"First Design System Inc."#)
        #expect(CompanyIdentifier.firstDesignSystem.description == #"First Design System Inc."#)
    
        // Unisto AG
        #expect(CompanyIdentifier.unisto.rawValue == 2809)
        #expect(CompanyIdentifier.unisto.name == #"Unisto AG"#)
        #expect(CompanyIdentifier.unisto.description == #"Unisto AG"#)
    
        // Chengdu Ambit Technology Co., Ltd.
        #expect(CompanyIdentifier.chengduAmbitTechnology.rawValue == 2810)
        #expect(CompanyIdentifier.chengduAmbitTechnology.name == #"Chengdu Ambit Technology Co., Ltd."#)
        #expect(CompanyIdentifier.chengduAmbitTechnology.description == #"Chengdu Ambit Technology Co., Ltd."#)
    
        // SMT ELEKTRONIK GmbH
        #expect(CompanyIdentifier.smtElektronik.rawValue == 2811)
        #expect(CompanyIdentifier.smtElektronik.name == #"SMT ELEKTRONIK GmbH"#)
        #expect(CompanyIdentifier.smtElektronik.description == #"SMT ELEKTRONIK GmbH"#)
    
        // Cerebrum Sensor Technologies Inc.
        #expect(CompanyIdentifier.cerebrumSensorTechnologies.rawValue == 2812)
        #expect(CompanyIdentifier.cerebrumSensorTechnologies.name == #"Cerebrum Sensor Technologies Inc."#)
        #expect(CompanyIdentifier.cerebrumSensorTechnologies.description == #"Cerebrum Sensor Technologies Inc."#)
    
        // Weber Sensors, LLC
        #expect(CompanyIdentifier.weberSensors.rawValue == 2813)
        #expect(CompanyIdentifier.weberSensors.name == #"Weber Sensors, LLC"#)
        #expect(CompanyIdentifier.weberSensors.description == #"Weber Sensors, LLC"#)
    
        // Earda Technologies Co.,Ltd
        #expect(CompanyIdentifier.eardaTechnologies.rawValue == 2814)
        #expect(CompanyIdentifier.eardaTechnologies.name == #"Earda Technologies Co.,Ltd"#)
        #expect(CompanyIdentifier.eardaTechnologies.description == #"Earda Technologies Co.,Ltd"#)
    
        // FUSEAWARE LIMITED
        #expect(CompanyIdentifier.fuseaware.rawValue == 2815)
        #expect(CompanyIdentifier.fuseaware.name == #"FUSEAWARE LIMITED"#)
        #expect(CompanyIdentifier.fuseaware.description == #"FUSEAWARE LIMITED"#)
    
        // Flaircomm Microelectronics Inc.
        #expect(CompanyIdentifier.flaircommMicroelectronics.rawValue == 2816)
        #expect(CompanyIdentifier.flaircommMicroelectronics.name == #"Flaircomm Microelectronics Inc."#)
        #expect(CompanyIdentifier.flaircommMicroelectronics.description == #"Flaircomm Microelectronics Inc."#)
    
        // RESIDEO TECHNOLOGIES, INC.
        #expect(CompanyIdentifier.resideoTechnologies.rawValue == 2817)
        #expect(CompanyIdentifier.resideoTechnologies.name == #"RESIDEO TECHNOLOGIES, INC."#)
        #expect(CompanyIdentifier.resideoTechnologies.description == #"RESIDEO TECHNOLOGIES, INC."#)
    
        // IORA Technology Development Ltd. Sti.
        #expect(CompanyIdentifier.ioraTechnologyDevelopmentSti.rawValue == 2818)
        #expect(CompanyIdentifier.ioraTechnologyDevelopmentSti.name == #"IORA Technology Development Ltd. Sti."#)
        #expect(CompanyIdentifier.ioraTechnologyDevelopmentSti.description == #"IORA Technology Development Ltd. Sti."#)
    
        // Precision Triathlon Systems Limited
        #expect(CompanyIdentifier.precisionTriathlonSystems.rawValue == 2819)
        #expect(CompanyIdentifier.precisionTriathlonSystems.name == #"Precision Triathlon Systems Limited"#)
        #expect(CompanyIdentifier.precisionTriathlonSystems.description == #"Precision Triathlon Systems Limited"#)
    
        // I-PERCUT
        #expect(CompanyIdentifier.iPercut.rawValue == 2820)
        #expect(CompanyIdentifier.iPercut.name == #"I-PERCUT"#)
        #expect(CompanyIdentifier.iPercut.description == #"I-PERCUT"#)
    
        // Marquardt GmbH
        #expect(CompanyIdentifier.marquardt.rawValue == 2821)
        #expect(CompanyIdentifier.marquardt.name == #"Marquardt GmbH"#)
        #expect(CompanyIdentifier.marquardt.description == #"Marquardt GmbH"#)
    
        // FAZUA GmbH
        #expect(CompanyIdentifier.fazua.rawValue == 2822)
        #expect(CompanyIdentifier.fazua.name == #"FAZUA GmbH"#)
        #expect(CompanyIdentifier.fazua.description == #"FAZUA GmbH"#)
    
        // Workaround Gmbh
        #expect(CompanyIdentifier.workaround.rawValue == 2823)
        #expect(CompanyIdentifier.workaround.name == #"Workaround Gmbh"#)
        #expect(CompanyIdentifier.workaround.description == #"Workaround Gmbh"#)
    
        // Shenzhen Qianfenyi Intelligent Technology Co., LTD
        #expect(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.rawValue == 2824)
        #expect(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.name == #"Shenzhen Qianfenyi Intelligent Technology Co., LTD"#)
        #expect(CompanyIdentifier.shenzhenQianfenyiIntelligentTechnology.description == #"Shenzhen Qianfenyi Intelligent Technology Co., LTD"#)
    
        // soonisys
        #expect(CompanyIdentifier.soonisys.rawValue == 2825)
        #expect(CompanyIdentifier.soonisys.name == #"soonisys"#)
        #expect(CompanyIdentifier.soonisys.description == #"soonisys"#)
    
        // Belun Technology Company Limited
        #expect(CompanyIdentifier.belunTechnology.rawValue == 2826)
        #expect(CompanyIdentifier.belunTechnology.name == #"Belun Technology Company Limited"#)
        #expect(CompanyIdentifier.belunTechnology.description == #"Belun Technology Company Limited"#)
    
        // Sanistaal A/S
        #expect(CompanyIdentifier.sanistaal.rawValue == 2827)
        #expect(CompanyIdentifier.sanistaal.name == #"Sanistaal A/S"#)
        #expect(CompanyIdentifier.sanistaal.description == #"Sanistaal A/S"#)
    
        // BluPeak
        #expect(CompanyIdentifier.blupeak.rawValue == 2828)
        #expect(CompanyIdentifier.blupeak.name == #"BluPeak"#)
        #expect(CompanyIdentifier.blupeak.description == #"BluPeak"#)
    
        // SANYO DENKO Co.,Ltd.
        #expect(CompanyIdentifier.sanyoDenko.rawValue == 2829)
        #expect(CompanyIdentifier.sanyoDenko.name == #"SANYO DENKO Co.,Ltd."#)
        #expect(CompanyIdentifier.sanyoDenko.description == #"SANYO DENKO Co.,Ltd."#)
    
        // Honda Lock Mfg. Co.,Ltd.
        #expect(CompanyIdentifier.hondaLockMfg.rawValue == 2830)
        #expect(CompanyIdentifier.hondaLockMfg.name == #"Honda Lock Mfg. Co.,Ltd."#)
        #expect(CompanyIdentifier.hondaLockMfg.description == #"Honda Lock Mfg. Co.,Ltd."#)
    
        // B.E.A. S.A.
        #expect(CompanyIdentifier.bEA.rawValue == 2831)
        #expect(CompanyIdentifier.bEA.name == #"B.E.A. S.A."#)
        #expect(CompanyIdentifier.bEA.description == #"B.E.A. S.A."#)
    
        // Alfa Laval Corporate AB
        #expect(CompanyIdentifier.alfaLavalorate.rawValue == 2832)
        #expect(CompanyIdentifier.alfaLavalorate.name == #"Alfa Laval Corporate AB"#)
        #expect(CompanyIdentifier.alfaLavalorate.description == #"Alfa Laval Corporate AB"#)
    
        // ThermoWorks, Inc.
        #expect(CompanyIdentifier.thermoworks.rawValue == 2833)
        #expect(CompanyIdentifier.thermoworks.name == #"ThermoWorks, Inc."#)
        #expect(CompanyIdentifier.thermoworks.description == #"ThermoWorks, Inc."#)
    
        // ToughBuilt Industries LLC
        #expect(CompanyIdentifier.toughbuiltIndustries.rawValue == 2834)
        #expect(CompanyIdentifier.toughbuiltIndustries.name == #"ToughBuilt Industries LLC"#)
        #expect(CompanyIdentifier.toughbuiltIndustries.description == #"ToughBuilt Industries LLC"#)
    
        // IOTOOLS
        #expect(CompanyIdentifier.iotools.rawValue == 2835)
        #expect(CompanyIdentifier.iotools.name == #"IOTOOLS"#)
        #expect(CompanyIdentifier.iotools.description == #"IOTOOLS"#)
    
        // Olumee
        #expect(CompanyIdentifier.olumee.rawValue == 2836)
        #expect(CompanyIdentifier.olumee.name == #"Olumee"#)
        #expect(CompanyIdentifier.olumee.description == #"Olumee"#)
    
        // NAOS JAPAN K.K.
        #expect(CompanyIdentifier.naosJapanKK.rawValue == 2837)
        #expect(CompanyIdentifier.naosJapanKK.name == #"NAOS JAPAN K.K."#)
        #expect(CompanyIdentifier.naosJapanKK.description == #"NAOS JAPAN K.K."#)
    
        // Guard RFID Solutions Inc.
        #expect(CompanyIdentifier.guardRfidSolutions.rawValue == 2838)
        #expect(CompanyIdentifier.guardRfidSolutions.name == #"Guard RFID Solutions Inc."#)
        #expect(CompanyIdentifier.guardRfidSolutions.description == #"Guard RFID Solutions Inc."#)
    
        // SIG SAUER, INC.
        #expect(CompanyIdentifier.siguer.rawValue == 2839)
        #expect(CompanyIdentifier.siguer.name == #"SIG SAUER, INC."#)
        #expect(CompanyIdentifier.siguer.description == #"SIG SAUER, INC."#)
    
        // DECATHLON SE
        #expect(CompanyIdentifier.decathlon.rawValue == 2840)
        #expect(CompanyIdentifier.decathlon.name == #"DECATHLON SE"#)
        #expect(CompanyIdentifier.decathlon.description == #"DECATHLON SE"#)
    
        // WBS PROJECT H PTY LTD
        #expect(CompanyIdentifier.wbsProjectH.rawValue == 2841)
        #expect(CompanyIdentifier.wbsProjectH.name == #"WBS PROJECT H PTY LTD"#)
        #expect(CompanyIdentifier.wbsProjectH.description == #"WBS PROJECT H PTY LTD"#)
    
        // Roca Sanitario, S.A.
        #expect(CompanyIdentifier.rocaSanitario.rawValue == 2842)
        #expect(CompanyIdentifier.rocaSanitario.name == #"Roca Sanitario, S.A."#)
        #expect(CompanyIdentifier.rocaSanitario.description == #"Roca Sanitario, S.A."#)
    
        // Enerpac Tool Group Corp.
        #expect(CompanyIdentifier.enerpacToolGroup.rawValue == 2843)
        #expect(CompanyIdentifier.enerpacToolGroup.name == #"Enerpac Tool Group Corp."#)
        #expect(CompanyIdentifier.enerpacToolGroup.description == #"Enerpac Tool Group Corp."#)
    
        // Nanoleq AG
        #expect(CompanyIdentifier.nanoleq.rawValue == 2844)
        #expect(CompanyIdentifier.nanoleq.name == #"Nanoleq AG"#)
        #expect(CompanyIdentifier.nanoleq.description == #"Nanoleq AG"#)
    
        // Accelerated Systems
        #expect(CompanyIdentifier.acceleratedSystems.rawValue == 2845)
        #expect(CompanyIdentifier.acceleratedSystems.name == #"Accelerated Systems"#)
        #expect(CompanyIdentifier.acceleratedSystems.description == #"Accelerated Systems"#)
    
        // PB INC.
        #expect(CompanyIdentifier.pb.rawValue == 2846)
        #expect(CompanyIdentifier.pb.name == #"PB INC."#)
        #expect(CompanyIdentifier.pb.description == #"PB INC."#)
    
        // Beijing ESWIN Computing Technology Co., Ltd.
        #expect(CompanyIdentifier.beijingEswinComputingTechnology.rawValue == 2847)
        #expect(CompanyIdentifier.beijingEswinComputingTechnology.name == #"Beijing ESWIN Computing Technology Co., Ltd."#)
        #expect(CompanyIdentifier.beijingEswinComputingTechnology.description == #"Beijing ESWIN Computing Technology Co., Ltd."#)
    
        // TKH Security B.V.
        #expect(CompanyIdentifier.tkhSecurity.rawValue == 2848)
        #expect(CompanyIdentifier.tkhSecurity.name == #"TKH Security B.V."#)
        #expect(CompanyIdentifier.tkhSecurity.description == #"TKH Security B.V."#)
    
        // ams AG
        #expect(CompanyIdentifier.ams.rawValue == 2849)
        #expect(CompanyIdentifier.ams.name == #"ams AG"#)
        #expect(CompanyIdentifier.ams.description == #"ams AG"#)
    
        // Hygiene IQ, LLC.
        #expect(CompanyIdentifier.hygieneIq.rawValue == 2850)
        #expect(CompanyIdentifier.hygieneIq.name == #"Hygiene IQ, LLC."#)
        #expect(CompanyIdentifier.hygieneIq.description == #"Hygiene IQ, LLC."#)
    
        // iRhythm Technologies, Inc.
        #expect(CompanyIdentifier.irhythmTechnologies.rawValue == 2851)
        #expect(CompanyIdentifier.irhythmTechnologies.name == #"iRhythm Technologies, Inc."#)
        #expect(CompanyIdentifier.irhythmTechnologies.description == #"iRhythm Technologies, Inc."#)
    
        // BeiJing ZiJie TiaoDong KeJi Co.,Ltd.
        #expect(CompanyIdentifier.beijingZijieTiaodongKeji.rawValue == 2852)
        #expect(CompanyIdentifier.beijingZijieTiaodongKeji.name == #"BeiJing ZiJie TiaoDong KeJi Co.,Ltd."#)
        #expect(CompanyIdentifier.beijingZijieTiaodongKeji.description == #"BeiJing ZiJie TiaoDong KeJi Co.,Ltd."#)
    
        // NIBROTECH LTD
        #expect(CompanyIdentifier.nibrotech.rawValue == 2853)
        #expect(CompanyIdentifier.nibrotech.name == #"NIBROTECH LTD"#)
        #expect(CompanyIdentifier.nibrotech.description == #"NIBROTECH LTD"#)
    
        // Baracoda Daily Healthtech.
        #expect(CompanyIdentifier.baracodaDailyHealthtech.rawValue == 2854)
        #expect(CompanyIdentifier.baracodaDailyHealthtech.name == #"Baracoda Daily Healthtech."#)
        #expect(CompanyIdentifier.baracodaDailyHealthtech.description == #"Baracoda Daily Healthtech."#)
    
        // Lumi United Technology Co., Ltd
        #expect(CompanyIdentifier.lumiUnitedTechnology.rawValue == 2855)
        #expect(CompanyIdentifier.lumiUnitedTechnology.name == #"Lumi United Technology Co., Ltd"#)
        #expect(CompanyIdentifier.lumiUnitedTechnology.description == #"Lumi United Technology Co., Ltd"#)
    
        // CHACON
        #expect(CompanyIdentifier.chacon.rawValue == 2856)
        #expect(CompanyIdentifier.chacon.name == #"CHACON"#)
        #expect(CompanyIdentifier.chacon.description == #"CHACON"#)
    
        // Tech-Venom Entertainment Private Limited
        #expect(CompanyIdentifier.techVenomEntertainment.rawValue == 2857)
        #expect(CompanyIdentifier.techVenomEntertainment.name == #"Tech-Venom Entertainment Private Limited"#)
        #expect(CompanyIdentifier.techVenomEntertainment.description == #"Tech-Venom Entertainment Private Limited"#)
    
        // ACL Airshop B.V.
        #expect(CompanyIdentifier.aclAirshop.rawValue == 2858)
        #expect(CompanyIdentifier.aclAirshop.name == #"ACL Airshop B.V."#)
        #expect(CompanyIdentifier.aclAirshop.description == #"ACL Airshop B.V."#)
    
        // MAINBOT
        #expect(CompanyIdentifier.mainbot.rawValue == 2859)
        #expect(CompanyIdentifier.mainbot.name == #"MAINBOT"#)
        #expect(CompanyIdentifier.mainbot.description == #"MAINBOT"#)
    
        // ILLUMAGEAR, Inc.
        #expect(CompanyIdentifier.illumagear.rawValue == 2860)
        #expect(CompanyIdentifier.illumagear.name == #"ILLUMAGEAR, Inc."#)
        #expect(CompanyIdentifier.illumagear.description == #"ILLUMAGEAR, Inc."#)
    
        // REDARC ELECTRONICS PTY LTD
        #expect(CompanyIdentifier.redarcElectronics.rawValue == 2861)
        #expect(CompanyIdentifier.redarcElectronics.name == #"REDARC ELECTRONICS PTY LTD"#)
        #expect(CompanyIdentifier.redarcElectronics.description == #"REDARC ELECTRONICS PTY LTD"#)
    
        // MOCA System Inc.
        #expect(CompanyIdentifier.mocaSystem.rawValue == 2862)
        #expect(CompanyIdentifier.mocaSystem.name == #"MOCA System Inc."#)
        #expect(CompanyIdentifier.mocaSystem.description == #"MOCA System Inc."#)
    
        // Duke Manufacturing Co
        #expect(CompanyIdentifier.dukeManufacturingCo.rawValue == 2863)
        #expect(CompanyIdentifier.dukeManufacturingCo.name == #"Duke Manufacturing Co"#)
        #expect(CompanyIdentifier.dukeManufacturingCo.description == #"Duke Manufacturing Co"#)
    
        // ART SPA
        #expect(CompanyIdentifier.artSpa.rawValue == 2864)
        #expect(CompanyIdentifier.artSpa.name == #"ART SPA"#)
        #expect(CompanyIdentifier.artSpa.description == #"ART SPA"#)
    
        // Silver Wolf Vehicles Inc.
        #expect(CompanyIdentifier.silverWolfVehicles.rawValue == 2865)
        #expect(CompanyIdentifier.silverWolfVehicles.name == #"Silver Wolf Vehicles Inc."#)
        #expect(CompanyIdentifier.silverWolfVehicles.description == #"Silver Wolf Vehicles Inc."#)
    
        // Hala Systems, Inc.
        #expect(CompanyIdentifier.halaSystems.rawValue == 2866)
        #expect(CompanyIdentifier.halaSystems.name == #"Hala Systems, Inc."#)
        #expect(CompanyIdentifier.halaSystems.description == #"Hala Systems, Inc."#)
    
        // ARMATURA LLC
        #expect(CompanyIdentifier.armatura.rawValue == 2867)
        #expect(CompanyIdentifier.armatura.name == #"ARMATURA LLC"#)
        #expect(CompanyIdentifier.armatura.description == #"ARMATURA LLC"#)
    
        // CONZUMEX INDUSTRIES PRIVATE LIMITED
        #expect(CompanyIdentifier.conzumexIndustries.rawValue == 2868)
        #expect(CompanyIdentifier.conzumexIndustries.name == #"CONZUMEX INDUSTRIES PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.conzumexIndustries.description == #"CONZUMEX INDUSTRIES PRIVATE LIMITED"#)
    
        // BH SENS
        #expect(CompanyIdentifier.bhSens.rawValue == 2869)
        #expect(CompanyIdentifier.bhSens.name == #"BH SENS"#)
        #expect(CompanyIdentifier.bhSens.description == #"BH SENS"#)
    
        // SINTEF
        #expect(CompanyIdentifier.sintef.rawValue == 2870)
        #expect(CompanyIdentifier.sintef.name == #"SINTEF"#)
        #expect(CompanyIdentifier.sintef.description == #"SINTEF"#)
    
        // Omnivoltaic Energy Solutions Limited Company
        #expect(CompanyIdentifier.omnivoltaicEnergySolutions.rawValue == 2871)
        #expect(CompanyIdentifier.omnivoltaicEnergySolutions.name == #"Omnivoltaic Energy Solutions Limited Company"#)
        #expect(CompanyIdentifier.omnivoltaicEnergySolutions.description == #"Omnivoltaic Energy Solutions Limited Company"#)
    
        // WISYCOM S.R.L.
        #expect(CompanyIdentifier.wisycom.rawValue == 2872)
        #expect(CompanyIdentifier.wisycom.name == #"WISYCOM S.R.L."#)
        #expect(CompanyIdentifier.wisycom.description == #"WISYCOM S.R.L."#)
    
        // Red 100 Lighting Co., ltd.
        #expect(CompanyIdentifier.red100Lighting.rawValue == 2873)
        #expect(CompanyIdentifier.red100Lighting.name == #"Red 100 Lighting Co., ltd."#)
        #expect(CompanyIdentifier.red100Lighting.description == #"Red 100 Lighting Co., ltd."#)
    
        // Impact Biosystems, Inc.
        #expect(CompanyIdentifier.impactBiosystems.rawValue == 2874)
        #expect(CompanyIdentifier.impactBiosystems.name == #"Impact Biosystems, Inc."#)
        #expect(CompanyIdentifier.impactBiosystems.description == #"Impact Biosystems, Inc."#)
    
        // AIC semiconductor (Shanghai) Co., Ltd.
        #expect(CompanyIdentifier.aicSemiconductorShanghai.rawValue == 2875)
        #expect(CompanyIdentifier.aicSemiconductorShanghai.name == #"AIC semiconductor (Shanghai) Co., Ltd."#)
        #expect(CompanyIdentifier.aicSemiconductorShanghai.description == #"AIC semiconductor (Shanghai) Co., Ltd."#)
    
        // Dodge Industrial, Inc.
        #expect(CompanyIdentifier.dodgeIndustrial.rawValue == 2876)
        #expect(CompanyIdentifier.dodgeIndustrial.name == #"Dodge Industrial, Inc."#)
        #expect(CompanyIdentifier.dodgeIndustrial.description == #"Dodge Industrial, Inc."#)
    
        // REALTIMEID AS
        #expect(CompanyIdentifier.realtimeid.rawValue == 2877)
        #expect(CompanyIdentifier.realtimeid.name == #"REALTIMEID AS"#)
        #expect(CompanyIdentifier.realtimeid.description == #"REALTIMEID AS"#)
    
        // ISEO Serrature S.p.a.
        #expect(CompanyIdentifier.iseoSerrature.rawValue == 2878)
        #expect(CompanyIdentifier.iseoSerrature.name == #"ISEO Serrature S.p.a."#)
        #expect(CompanyIdentifier.iseoSerrature.description == #"ISEO Serrature S.p.a."#)
    
        // MindRhythm, Inc.
        #expect(CompanyIdentifier.mindrhythm.rawValue == 2879)
        #expect(CompanyIdentifier.mindrhythm.name == #"MindRhythm, Inc."#)
        #expect(CompanyIdentifier.mindrhythm.description == #"MindRhythm, Inc."#)
    
        // Havells India Limited
        #expect(CompanyIdentifier.havellsIndia.rawValue == 2880)
        #expect(CompanyIdentifier.havellsIndia.name == #"Havells India Limited"#)
        #expect(CompanyIdentifier.havellsIndia.description == #"Havells India Limited"#)
    
        // Sentrax GmbH
        #expect(CompanyIdentifier.sentrax.rawValue == 2881)
        #expect(CompanyIdentifier.sentrax.name == #"Sentrax GmbH"#)
        #expect(CompanyIdentifier.sentrax.description == #"Sentrax GmbH"#)
    
        // TSI
        #expect(CompanyIdentifier.tsi.rawValue == 2882)
        #expect(CompanyIdentifier.tsi.name == #"TSI"#)
        #expect(CompanyIdentifier.tsi.description == #"TSI"#)
    
        // INCITAT ENVIRONNEMENT
        #expect(CompanyIdentifier.incitatEnvironnement.rawValue == 2883)
        #expect(CompanyIdentifier.incitatEnvironnement.name == #"INCITAT ENVIRONNEMENT"#)
        #expect(CompanyIdentifier.incitatEnvironnement.description == #"INCITAT ENVIRONNEMENT"#)
    
        // nFore Technology Co., Ltd.
        #expect(CompanyIdentifier.nforeTechnology.rawValue == 2884)
        #expect(CompanyIdentifier.nforeTechnology.name == #"nFore Technology Co., Ltd."#)
        #expect(CompanyIdentifier.nforeTechnology.description == #"nFore Technology Co., Ltd."#)
    
        // Electronic Sensors, Inc.
        #expect(CompanyIdentifier.electronicSensors.rawValue == 2885)
        #expect(CompanyIdentifier.electronicSensors.name == #"Electronic Sensors, Inc."#)
        #expect(CompanyIdentifier.electronicSensors.description == #"Electronic Sensors, Inc."#)
    
        // Bird Rides, Inc.
        #expect(CompanyIdentifier.birdRides.rawValue == 2886)
        #expect(CompanyIdentifier.birdRides.name == #"Bird Rides, Inc."#)
        #expect(CompanyIdentifier.birdRides.description == #"Bird Rides, Inc."#)
    
        // Gentex Corporation
        #expect(CompanyIdentifier.gentex.rawValue == 2887)
        #expect(CompanyIdentifier.gentex.name == #"Gentex Corporation"#)
        #expect(CompanyIdentifier.gentex.description == #"Gentex Corporation"#)
    
        // NIO USA, Inc.
        #expect(CompanyIdentifier.nio.rawValue == 2888)
        #expect(CompanyIdentifier.nio.name == #"NIO USA, Inc."#)
        #expect(CompanyIdentifier.nio.description == #"NIO USA, Inc."#)
    
        // SkyHawke Technologies
        #expect(CompanyIdentifier.skyhawkeTechnologies.rawValue == 2889)
        #expect(CompanyIdentifier.skyhawkeTechnologies.name == #"SkyHawke Technologies"#)
        #expect(CompanyIdentifier.skyhawkeTechnologies.description == #"SkyHawke Technologies"#)
    
        // Nomono AS
        #expect(CompanyIdentifier.nomono.rawValue == 2890)
        #expect(CompanyIdentifier.nomono.name == #"Nomono AS"#)
        #expect(CompanyIdentifier.nomono.description == #"Nomono AS"#)
    
        // EMS Integrators, LLC
        #expect(CompanyIdentifier.emsIntegrators.rawValue == 2891)
        #expect(CompanyIdentifier.emsIntegrators.name == #"EMS Integrators, LLC"#)
        #expect(CompanyIdentifier.emsIntegrators.description == #"EMS Integrators, LLC"#)
    
        // BiosBob.Biz
        #expect(CompanyIdentifier.biosbobBiz.rawValue == 2892)
        #expect(CompanyIdentifier.biosbobBiz.name == #"BiosBob.Biz"#)
        #expect(CompanyIdentifier.biosbobBiz.description == #"BiosBob.Biz"#)
    
        // Adam Hall GmbH
        #expect(CompanyIdentifier.adamHall.rawValue == 2893)
        #expect(CompanyIdentifier.adamHall.name == #"Adam Hall GmbH"#)
        #expect(CompanyIdentifier.adamHall.description == #"Adam Hall GmbH"#)
    
        // ICP Systems B.V.
        #expect(CompanyIdentifier.icpSystems.rawValue == 2894)
        #expect(CompanyIdentifier.icpSystems.name == #"ICP Systems B.V."#)
        #expect(CompanyIdentifier.icpSystems.description == #"ICP Systems B.V."#)
    
        // Breezi.io, Inc.
        #expect(CompanyIdentifier.breeziIo.rawValue == 2895)
        #expect(CompanyIdentifier.breeziIo.name == #"Breezi.io, Inc."#)
        #expect(CompanyIdentifier.breeziIo.description == #"Breezi.io, Inc."#)
    
        // Mesh Systems LLC
        #expect(CompanyIdentifier.meshSystems.rawValue == 2896)
        #expect(CompanyIdentifier.meshSystems.name == #"Mesh Systems LLC"#)
        #expect(CompanyIdentifier.meshSystems.description == #"Mesh Systems LLC"#)
    
        // FUN FACTORY GmbH
        #expect(CompanyIdentifier.funFactory.rawValue == 2897)
        #expect(CompanyIdentifier.funFactory.name == #"FUN FACTORY GmbH"#)
        #expect(CompanyIdentifier.funFactory.description == #"FUN FACTORY GmbH"#)
    
        // ZIIP Inc
        #expect(CompanyIdentifier.ziip.rawValue == 2898)
        #expect(CompanyIdentifier.ziip.name == #"ZIIP Inc"#)
        #expect(CompanyIdentifier.ziip.description == #"ZIIP Inc"#)
    
        // SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd
        #expect(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.rawValue == 2899)
        #expect(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.name == #"SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenKaadasIntelligentTechnology.description == #"SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd"#)
    
        // Emotion Fitness GmbH & Co. KG
        #expect(CompanyIdentifier.emotionFitness.rawValue == 2900)
        #expect(CompanyIdentifier.emotionFitness.name == #"Emotion Fitness GmbH & Co. KG"#)
        #expect(CompanyIdentifier.emotionFitness.description == #"Emotion Fitness GmbH & Co. KG"#)
    
        // H G M Automotive Electronics, Inc.
        #expect(CompanyIdentifier.hGMAutomotiveElectronics.rawValue == 2901)
        #expect(CompanyIdentifier.hGMAutomotiveElectronics.name == #"H G M Automotive Electronics, Inc."#)
        #expect(CompanyIdentifier.hGMAutomotiveElectronics.description == #"H G M Automotive Electronics, Inc."#)
    
        // BORA - Vertriebs GmbH & Co KG
        #expect(CompanyIdentifier.boraVertriebs.rawValue == 2902)
        #expect(CompanyIdentifier.boraVertriebs.name == #"BORA - Vertriebs GmbH & Co KG"#)
        #expect(CompanyIdentifier.boraVertriebs.description == #"BORA - Vertriebs GmbH & Co KG"#)
    
        // CONVERTRONIX TECHNOLOGIES AND SERVICES LLP
        #expect(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.rawValue == 2903)
        #expect(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.name == #"CONVERTRONIX TECHNOLOGIES AND SERVICES LLP"#)
        #expect(CompanyIdentifier.convertronixTechnologiesAndServicesLlp.description == #"CONVERTRONIX TECHNOLOGIES AND SERVICES LLP"#)
    
        // TOKAI-DENSHI INC
        #expect(CompanyIdentifier.tokaiDenshi.rawValue == 2904)
        #expect(CompanyIdentifier.tokaiDenshi.name == #"TOKAI-DENSHI INC"#)
        #expect(CompanyIdentifier.tokaiDenshi.description == #"TOKAI-DENSHI INC"#)
    
        // Versa Group B.V.
        #expect(CompanyIdentifier.versaGroup.rawValue == 2905)
        #expect(CompanyIdentifier.versaGroup.name == #"Versa Group B.V."#)
        #expect(CompanyIdentifier.versaGroup.description == #"Versa Group B.V."#)
    
        // H.P. Shelby Manufacturing, LLC.
        #expect(CompanyIdentifier.hPShelbyManufacturing.rawValue == 2906)
        #expect(CompanyIdentifier.hPShelbyManufacturing.name == #"H.P. Shelby Manufacturing, LLC."#)
        #expect(CompanyIdentifier.hPShelbyManufacturing.description == #"H.P. Shelby Manufacturing, LLC."#)
    
        // Shenzhen ImagineVision Technology Limited
        #expect(CompanyIdentifier.shenzhenImaginevisionTechnology.rawValue == 2907)
        #expect(CompanyIdentifier.shenzhenImaginevisionTechnology.name == #"Shenzhen ImagineVision Technology Limited"#)
        #expect(CompanyIdentifier.shenzhenImaginevisionTechnology.description == #"Shenzhen ImagineVision Technology Limited"#)
    
        // Exponential Power, Inc.
        #expect(CompanyIdentifier.exponentialPower.rawValue == 2908)
        #expect(CompanyIdentifier.exponentialPower.name == #"Exponential Power, Inc."#)
        #expect(CompanyIdentifier.exponentialPower.description == #"Exponential Power, Inc."#)
    
        // Fujian Newland Auto-ID Tech. Co., Ltd.
        #expect(CompanyIdentifier.fujianNewlandAutoIdTech.rawValue == 2909)
        #expect(CompanyIdentifier.fujianNewlandAutoIdTech.name == #"Fujian Newland Auto-ID Tech. Co., Ltd."#)
        #expect(CompanyIdentifier.fujianNewlandAutoIdTech.description == #"Fujian Newland Auto-ID Tech. Co., Ltd."#)
    
        // CELLCONTROL, INC.
        #expect(CompanyIdentifier.cellcontrol.rawValue == 2910)
        #expect(CompanyIdentifier.cellcontrol.name == #"CELLCONTROL, INC."#)
        #expect(CompanyIdentifier.cellcontrol.description == #"CELLCONTROL, INC."#)
    
        // Rivieh, Inc.
        #expect(CompanyIdentifier.rivieh.rawValue == 2911)
        #expect(CompanyIdentifier.rivieh.name == #"Rivieh, Inc."#)
        #expect(CompanyIdentifier.rivieh.description == #"Rivieh, Inc."#)
    
        // RATOC Systems, Inc.
        #expect(CompanyIdentifier.ratocSystems.rawValue == 2912)
        #expect(CompanyIdentifier.ratocSystems.name == #"RATOC Systems, Inc."#)
        #expect(CompanyIdentifier.ratocSystems.description == #"RATOC Systems, Inc."#)
    
        // Sentek Pty Ltd
        #expect(CompanyIdentifier.sentek.rawValue == 2913)
        #expect(CompanyIdentifier.sentek.name == #"Sentek Pty Ltd"#)
        #expect(CompanyIdentifier.sentek.description == #"Sentek Pty Ltd"#)
    
        // NOVEA ENERGIES
        #expect(CompanyIdentifier.noveaEnergies.rawValue == 2914)
        #expect(CompanyIdentifier.noveaEnergies.name == #"NOVEA ENERGIES"#)
        #expect(CompanyIdentifier.noveaEnergies.description == #"NOVEA ENERGIES"#)
    
        // Innolux Corporation
        #expect(CompanyIdentifier.innolux.rawValue == 2915)
        #expect(CompanyIdentifier.innolux.name == #"Innolux Corporation"#)
        #expect(CompanyIdentifier.innolux.description == #"Innolux Corporation"#)
    
        // NingBo klite Electric Manufacture Co.,LTD
        #expect(CompanyIdentifier.ningboKliteElectricManufacture.rawValue == 2916)
        #expect(CompanyIdentifier.ningboKliteElectricManufacture.name == #"NingBo klite Electric Manufacture Co.,LTD"#)
        #expect(CompanyIdentifier.ningboKliteElectricManufacture.description == #"NingBo klite Electric Manufacture Co.,LTD"#)
    
        // The Apache Software Foundation
        #expect(CompanyIdentifier.apacheSoftwareFoundation.rawValue == 2917)
        #expect(CompanyIdentifier.apacheSoftwareFoundation.name == #"The Apache Software Foundation"#)
        #expect(CompanyIdentifier.apacheSoftwareFoundation.description == #"The Apache Software Foundation"#)
    
        // MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED
        #expect(CompanyIdentifier.mitsubishiElectricAutomationThailand.rawValue == 2918)
        #expect(CompanyIdentifier.mitsubishiElectricAutomationThailand.name == #"MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED"#)
        #expect(CompanyIdentifier.mitsubishiElectricAutomationThailand.description == #"MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED"#)
    
        // CleanSpace Technology Pty Ltd
        #expect(CompanyIdentifier.cleanspaceTechnology.rawValue == 2919)
        #expect(CompanyIdentifier.cleanspaceTechnology.name == #"CleanSpace Technology Pty Ltd"#)
        #expect(CompanyIdentifier.cleanspaceTechnology.description == #"CleanSpace Technology Pty Ltd"#)
    
        // Quha oy
        #expect(CompanyIdentifier.quha.rawValue == 2920)
        #expect(CompanyIdentifier.quha.name == #"Quha oy"#)
        #expect(CompanyIdentifier.quha.description == #"Quha oy"#)
    
        // Addaday
        #expect(CompanyIdentifier.addaday.rawValue == 2921)
        #expect(CompanyIdentifier.addaday.name == #"Addaday"#)
        #expect(CompanyIdentifier.addaday.description == #"Addaday"#)
    
        // Dymo
        #expect(CompanyIdentifier.dymo.rawValue == 2922)
        #expect(CompanyIdentifier.dymo.name == #"Dymo"#)
        #expect(CompanyIdentifier.dymo.description == #"Dymo"#)
    
        // Samsara Networks, Inc
        #expect(CompanyIdentifier.samsaraNetworks.rawValue == 2923)
        #expect(CompanyIdentifier.samsaraNetworks.name == #"Samsara Networks, Inc"#)
        #expect(CompanyIdentifier.samsaraNetworks.description == #"Samsara Networks, Inc"#)
    
        // Sensitech, Inc.
        #expect(CompanyIdentifier.sensitech.rawValue == 2924)
        #expect(CompanyIdentifier.sensitech.name == #"Sensitech, Inc."#)
        #expect(CompanyIdentifier.sensitech.description == #"Sensitech, Inc."#)
    
        // SOLUM CO., LTD
        #expect(CompanyIdentifier.solum.rawValue == 2925)
        #expect(CompanyIdentifier.solum.name == #"SOLUM CO., LTD"#)
        #expect(CompanyIdentifier.solum.description == #"SOLUM CO., LTD"#)
    
        // React Mobile
        #expect(CompanyIdentifier.reactMobile.rawValue == 2926)
        #expect(CompanyIdentifier.reactMobile.name == #"React Mobile"#)
        #expect(CompanyIdentifier.reactMobile.description == #"React Mobile"#)
    
        // Shenzhen Malide Technology Co.,Ltd
        #expect(CompanyIdentifier.shenzhenMalideTechnology.rawValue == 2927)
        #expect(CompanyIdentifier.shenzhenMalideTechnology.name == #"Shenzhen Malide Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenMalideTechnology.description == #"Shenzhen Malide Technology Co.,Ltd"#)
    
        // JDRF Electromag Engineering Inc
        #expect(CompanyIdentifier.jdrfElectromagEngineering.rawValue == 2928)
        #expect(CompanyIdentifier.jdrfElectromagEngineering.name == #"JDRF Electromag Engineering Inc"#)
        #expect(CompanyIdentifier.jdrfElectromagEngineering.description == #"JDRF Electromag Engineering Inc"#)
    
        // lilbit ODM AS
        #expect(CompanyIdentifier.lilbitOdm.rawValue == 2929)
        #expect(CompanyIdentifier.lilbitOdm.name == #"lilbit ODM AS"#)
        #expect(CompanyIdentifier.lilbitOdm.description == #"lilbit ODM AS"#)
    
        // Geeknet, Inc.
        #expect(CompanyIdentifier.geeknet.rawValue == 2930)
        #expect(CompanyIdentifier.geeknet.name == #"Geeknet, Inc."#)
        #expect(CompanyIdentifier.geeknet.description == #"Geeknet, Inc."#)
    
        // HARADA INDUSTRY CO., LTD.
        #expect(CompanyIdentifier.haradaIndustry.rawValue == 2931)
        #expect(CompanyIdentifier.haradaIndustry.name == #"HARADA INDUSTRY CO., LTD."#)
        #expect(CompanyIdentifier.haradaIndustry.description == #"HARADA INDUSTRY CO., LTD."#)
    
        // BQN
        #expect(CompanyIdentifier.bqn.rawValue == 2932)
        #expect(CompanyIdentifier.bqn.name == #"BQN"#)
        #expect(CompanyIdentifier.bqn.description == #"BQN"#)
    
        // Triple W Japan Inc.
        #expect(CompanyIdentifier.tripleWJapan.rawValue == 2933)
        #expect(CompanyIdentifier.tripleWJapan.name == #"Triple W Japan Inc."#)
        #expect(CompanyIdentifier.tripleWJapan.description == #"Triple W Japan Inc."#)
    
        // MAX-co., ltd
        #expect(CompanyIdentifier.max.rawValue == 2934)
        #expect(CompanyIdentifier.max.name == #"MAX-co., ltd"#)
        #expect(CompanyIdentifier.max.description == #"MAX-co., ltd"#)
    
        // Aixlink(Chengdu) Co., Ltd.
        #expect(CompanyIdentifier.aixlinkChengdu.rawValue == 2935)
        #expect(CompanyIdentifier.aixlinkChengdu.name == #"Aixlink(Chengdu) Co., Ltd."#)
        #expect(CompanyIdentifier.aixlinkChengdu.description == #"Aixlink(Chengdu) Co., Ltd."#)
    
        // FIELD DESIGN INC.
        #expect(CompanyIdentifier.fieldDesign.rawValue == 2936)
        #expect(CompanyIdentifier.fieldDesign.name == #"FIELD DESIGN INC."#)
        #expect(CompanyIdentifier.fieldDesign.description == #"FIELD DESIGN INC."#)
    
        // Sankyo Air Tech Co.,Ltd.
        #expect(CompanyIdentifier.sankyoAirTech.rawValue == 2937)
        #expect(CompanyIdentifier.sankyoAirTech.name == #"Sankyo Air Tech Co.,Ltd."#)
        #expect(CompanyIdentifier.sankyoAirTech.description == #"Sankyo Air Tech Co.,Ltd."#)
    
        // Shenzhen KTC Technology Co.,Ltd.
        #expect(CompanyIdentifier.shenzhenKtcTechnology.rawValue == 2938)
        #expect(CompanyIdentifier.shenzhenKtcTechnology.name == #"Shenzhen KTC Technology Co.,Ltd."#)
        #expect(CompanyIdentifier.shenzhenKtcTechnology.description == #"Shenzhen KTC Technology Co.,Ltd."#)
    
        // Hardcoder Oy
        #expect(CompanyIdentifier.hardcoder.rawValue == 2939)
        #expect(CompanyIdentifier.hardcoder.name == #"Hardcoder Oy"#)
        #expect(CompanyIdentifier.hardcoder.description == #"Hardcoder Oy"#)
    
        // Scangrip A/S
        #expect(CompanyIdentifier.scangrip.rawValue == 2940)
        #expect(CompanyIdentifier.scangrip.name == #"Scangrip A/S"#)
        #expect(CompanyIdentifier.scangrip.description == #"Scangrip A/S"#)
    
        // FoundersLane GmbH
        #expect(CompanyIdentifier.founderslane.rawValue == 2941)
        #expect(CompanyIdentifier.founderslane.name == #"FoundersLane GmbH"#)
        #expect(CompanyIdentifier.founderslane.description == #"FoundersLane GmbH"#)
    
        // Offcode Oy
        #expect(CompanyIdentifier.offcode.rawValue == 2942)
        #expect(CompanyIdentifier.offcode.name == #"Offcode Oy"#)
        #expect(CompanyIdentifier.offcode.description == #"Offcode Oy"#)
    
        // ICU tech GmbH
        #expect(CompanyIdentifier.icuTech.rawValue == 2943)
        #expect(CompanyIdentifier.icuTech.name == #"ICU tech GmbH"#)
        #expect(CompanyIdentifier.icuTech.description == #"ICU tech GmbH"#)
    
        // AXELIFE
        #expect(CompanyIdentifier.axelife.rawValue == 2944)
        #expect(CompanyIdentifier.axelife.name == #"AXELIFE"#)
        #expect(CompanyIdentifier.axelife.description == #"AXELIFE"#)
    
        // SCM Group
        #expect(CompanyIdentifier.scmGroup.rawValue == 2945)
        #expect(CompanyIdentifier.scmGroup.name == #"SCM Group"#)
        #expect(CompanyIdentifier.scmGroup.description == #"SCM Group"#)
    
        // Mammut Sports Group AG
        #expect(CompanyIdentifier.mammutSportsGroup.rawValue == 2946)
        #expect(CompanyIdentifier.mammutSportsGroup.name == #"Mammut Sports Group AG"#)
        #expect(CompanyIdentifier.mammutSportsGroup.description == #"Mammut Sports Group AG"#)
    
        // Taiga Motors Inc.
        #expect(CompanyIdentifier.taigaMotors.rawValue == 2947)
        #expect(CompanyIdentifier.taigaMotors.name == #"Taiga Motors Inc."#)
        #expect(CompanyIdentifier.taigaMotors.description == #"Taiga Motors Inc."#)
    
        // Presidio Medical, Inc.
        #expect(CompanyIdentifier.presidioMedical.rawValue == 2948)
        #expect(CompanyIdentifier.presidioMedical.name == #"Presidio Medical, Inc."#)
        #expect(CompanyIdentifier.presidioMedical.description == #"Presidio Medical, Inc."#)
    
        // VIMANA TECH PTY LTD
        #expect(CompanyIdentifier.vimanaTech.rawValue == 2949)
        #expect(CompanyIdentifier.vimanaTech.name == #"VIMANA TECH PTY LTD"#)
        #expect(CompanyIdentifier.vimanaTech.description == #"VIMANA TECH PTY LTD"#)
    
        // Trek Bicycle
        #expect(CompanyIdentifier.trekBicycle.rawValue == 2950)
        #expect(CompanyIdentifier.trekBicycle.name == #"Trek Bicycle"#)
        #expect(CompanyIdentifier.trekBicycle.description == #"Trek Bicycle"#)
    
        // Ampetronic Ltd
        #expect(CompanyIdentifier.ampetronic.rawValue == 2951)
        #expect(CompanyIdentifier.ampetronic.name == #"Ampetronic Ltd"#)
        #expect(CompanyIdentifier.ampetronic.description == #"Ampetronic Ltd"#)
    
        // Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd
        #expect(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.rawValue == 2952)
        #expect(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.name == #"Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd"#)
        #expect(CompanyIdentifier.muguangGuangdongIntelligentLightingTechnology.description == #"Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd"#)
    
        // Rotronic AG
        #expect(CompanyIdentifier.rotronic.rawValue == 2953)
        #expect(CompanyIdentifier.rotronic.name == #"Rotronic AG"#)
        #expect(CompanyIdentifier.rotronic.description == #"Rotronic AG"#)
    
        // Seiko Instruments Inc.
        #expect(CompanyIdentifier.seikoInstruments.rawValue == 2954)
        #expect(CompanyIdentifier.seikoInstruments.name == #"Seiko Instruments Inc."#)
        #expect(CompanyIdentifier.seikoInstruments.description == #"Seiko Instruments Inc."#)
    
        // American Technology Components, Incorporated
        #expect(CompanyIdentifier.americanTechnologyComponents.rawValue == 2955)
        #expect(CompanyIdentifier.americanTechnologyComponents.name == #"American Technology Components, Incorporated"#)
        #expect(CompanyIdentifier.americanTechnologyComponents.description == #"American Technology Components, Incorporated"#)
    
        // MOTREX
        #expect(CompanyIdentifier.motrex.rawValue == 2956)
        #expect(CompanyIdentifier.motrex.name == #"MOTREX"#)
        #expect(CompanyIdentifier.motrex.description == #"MOTREX"#)
    
        // Pertech Industries Inc
        #expect(CompanyIdentifier.pertechIndustries.rawValue == 2957)
        #expect(CompanyIdentifier.pertechIndustries.name == #"Pertech Industries Inc"#)
        #expect(CompanyIdentifier.pertechIndustries.description == #"Pertech Industries Inc"#)
    
        // Gentle Energy Corp.
        #expect(CompanyIdentifier.gentleEnergy.rawValue == 2958)
        #expect(CompanyIdentifier.gentleEnergy.name == #"Gentle Energy Corp."#)
        #expect(CompanyIdentifier.gentleEnergy.description == #"Gentle Energy Corp."#)
    
        // Senscomm Semiconductor Co., Ltd.
        #expect(CompanyIdentifier.senscommSemiconductor.rawValue == 2959)
        #expect(CompanyIdentifier.senscommSemiconductor.name == #"Senscomm Semiconductor Co., Ltd."#)
        #expect(CompanyIdentifier.senscommSemiconductor.description == #"Senscomm Semiconductor Co., Ltd."#)
    
        // Ineos Automotive Limited
        #expect(CompanyIdentifier.ineosAutomotive.rawValue == 2960)
        #expect(CompanyIdentifier.ineosAutomotive.name == #"Ineos Automotive Limited"#)
        #expect(CompanyIdentifier.ineosAutomotive.description == #"Ineos Automotive Limited"#)
    
        // Alfen ICU B.V.
        #expect(CompanyIdentifier.alfenIcu.rawValue == 2961)
        #expect(CompanyIdentifier.alfenIcu.name == #"Alfen ICU B.V."#)
        #expect(CompanyIdentifier.alfenIcu.description == #"Alfen ICU B.V."#)
    
        // Citisend Solutions, SL
        #expect(CompanyIdentifier.citisendSolutions.rawValue == 2962)
        #expect(CompanyIdentifier.citisendSolutions.name == #"Citisend Solutions, SL"#)
        #expect(CompanyIdentifier.citisendSolutions.description == #"Citisend Solutions, SL"#)
    
        // Hangzhou BroadLink Technology Co., Ltd.
        #expect(CompanyIdentifier.hangzhouBroadlinkTechnology.rawValue == 2963)
        #expect(CompanyIdentifier.hangzhouBroadlinkTechnology.name == #"Hangzhou BroadLink Technology Co., Ltd."#)
        #expect(CompanyIdentifier.hangzhouBroadlinkTechnology.description == #"Hangzhou BroadLink Technology Co., Ltd."#)
    
        // Dreem SAS
        #expect(CompanyIdentifier.dreems.rawValue == 2964)
        #expect(CompanyIdentifier.dreems.name == #"Dreem SAS"#)
        #expect(CompanyIdentifier.dreems.description == #"Dreem SAS"#)
    
        // Netwake GmbH
        #expect(CompanyIdentifier.netwake.rawValue == 2965)
        #expect(CompanyIdentifier.netwake.name == #"Netwake GmbH"#)
        #expect(CompanyIdentifier.netwake.description == #"Netwake GmbH"#)
    
        // Telecom Design
        #expect(CompanyIdentifier.telecomDesign.rawValue == 2966)
        #expect(CompanyIdentifier.telecomDesign.name == #"Telecom Design"#)
        #expect(CompanyIdentifier.telecomDesign.description == #"Telecom Design"#)
    
        // SILVER TREE LABS, INC.
        #expect(CompanyIdentifier.silverTreeLabs.rawValue == 2967)
        #expect(CompanyIdentifier.silverTreeLabs.name == #"SILVER TREE LABS, INC."#)
        #expect(CompanyIdentifier.silverTreeLabs.description == #"SILVER TREE LABS, INC."#)
    
        // Gymstory B.V.
        #expect(CompanyIdentifier.gymstory.rawValue == 2968)
        #expect(CompanyIdentifier.gymstory.name == #"Gymstory B.V."#)
        #expect(CompanyIdentifier.gymstory.description == #"Gymstory B.V."#)
    
        // The Goodyear Tire & Rubber Company
        #expect(CompanyIdentifier.goodyearTireRubber.rawValue == 2969)
        #expect(CompanyIdentifier.goodyearTireRubber.name == #"The Goodyear Tire & Rubber Company"#)
        #expect(CompanyIdentifier.goodyearTireRubber.description == #"The Goodyear Tire & Rubber Company"#)
    
        // Beijing Wisepool Infinite Intelligence Technology Co.,Ltd
        #expect(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.rawValue == 2970)
        #expect(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.name == #"Beijing Wisepool Infinite Intelligence Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.beijingWisepoolInfiniteIntelligenceTechnology.description == #"Beijing Wisepool Infinite Intelligence Technology Co.,Ltd"#)
    
        // GISMAN
        #expect(CompanyIdentifier.gisman.rawValue == 2971)
        #expect(CompanyIdentifier.gisman.name == #"GISMAN"#)
        #expect(CompanyIdentifier.gisman.description == #"GISMAN"#)
    
        // Komatsu Ltd.
        #expect(CompanyIdentifier.komatsu.rawValue == 2972)
        #expect(CompanyIdentifier.komatsu.name == #"Komatsu Ltd."#)
        #expect(CompanyIdentifier.komatsu.description == #"Komatsu Ltd."#)
    
        // Sensoria Holdings LTD
        #expect(CompanyIdentifier.sensoriaHoldings.rawValue == 2973)
        #expect(CompanyIdentifier.sensoriaHoldings.name == #"Sensoria Holdings LTD"#)
        #expect(CompanyIdentifier.sensoriaHoldings.description == #"Sensoria Holdings LTD"#)
    
        // Audio Partnership Plc
        #expect(CompanyIdentifier.audioPartnershipPlc.rawValue == 2974)
        #expect(CompanyIdentifier.audioPartnershipPlc.name == #"Audio Partnership Plc"#)
        #expect(CompanyIdentifier.audioPartnershipPlc.description == #"Audio Partnership Plc"#)
    
        // Group Lotus Limited
        #expect(CompanyIdentifier.groupLotus.rawValue == 2975)
        #expect(CompanyIdentifier.groupLotus.name == #"Group Lotus Limited"#)
        #expect(CompanyIdentifier.groupLotus.description == #"Group Lotus Limited"#)
    
        // Data Sciences International
        #expect(CompanyIdentifier.dataSciencesInternational.rawValue == 2976)
        #expect(CompanyIdentifier.dataSciencesInternational.name == #"Data Sciences International"#)
        #expect(CompanyIdentifier.dataSciencesInternational.description == #"Data Sciences International"#)
    
        // Bunn-O-Matic Corporation
        #expect(CompanyIdentifier.bunnOMatic.rawValue == 2977)
        #expect(CompanyIdentifier.bunnOMatic.name == #"Bunn-O-Matic Corporation"#)
        #expect(CompanyIdentifier.bunnOMatic.description == #"Bunn-O-Matic Corporation"#)
    
        // TireCheck GmbH
        #expect(CompanyIdentifier.tirecheck.rawValue == 2978)
        #expect(CompanyIdentifier.tirecheck.name == #"TireCheck GmbH"#)
        #expect(CompanyIdentifier.tirecheck.description == #"TireCheck GmbH"#)
    
        // Sonova Consumer Hearing GmbH
        #expect(CompanyIdentifier.sonovaConsumerHearing.rawValue == 2979)
        #expect(CompanyIdentifier.sonovaConsumerHearing.name == #"Sonova Consumer Hearing GmbH"#)
        #expect(CompanyIdentifier.sonovaConsumerHearing.description == #"Sonova Consumer Hearing GmbH"#)
    
        // Vervent Audio Group
        #expect(CompanyIdentifier.verventAudioGroup.rawValue == 2980)
        #expect(CompanyIdentifier.verventAudioGroup.name == #"Vervent Audio Group"#)
        #expect(CompanyIdentifier.verventAudioGroup.description == #"Vervent Audio Group"#)
    
        // SONICOS ENTERPRISES, LLC
        #expect(CompanyIdentifier.sonicosEnterprises.rawValue == 2981)
        #expect(CompanyIdentifier.sonicosEnterprises.name == #"SONICOS ENTERPRISES, LLC"#)
        #expect(CompanyIdentifier.sonicosEnterprises.description == #"SONICOS ENTERPRISES, LLC"#)
    
        // Nissan Motor Co., Ltd.
        #expect(CompanyIdentifier.nissanMotor.rawValue == 2982)
        #expect(CompanyIdentifier.nissanMotor.name == #"Nissan Motor Co., Ltd."#)
        #expect(CompanyIdentifier.nissanMotor.description == #"Nissan Motor Co., Ltd."#)
    
        // hearX Group (Pty) Ltd
        #expect(CompanyIdentifier.hearxGroupPty.rawValue == 2983)
        #expect(CompanyIdentifier.hearxGroupPty.name == #"hearX Group (Pty) Ltd"#)
        #expect(CompanyIdentifier.hearxGroupPty.description == #"hearX Group (Pty) Ltd"#)
    
        // GLOWFORGE INC.
        #expect(CompanyIdentifier.glowforge.rawValue == 2984)
        #expect(CompanyIdentifier.glowforge.name == #"GLOWFORGE INC."#)
        #expect(CompanyIdentifier.glowforge.description == #"GLOWFORGE INC."#)
    
        // Allterco Robotics ltd
        #expect(CompanyIdentifier.alltercoRobotics.rawValue == 2985)
        #expect(CompanyIdentifier.alltercoRobotics.name == #"Allterco Robotics ltd"#)
        #expect(CompanyIdentifier.alltercoRobotics.description == #"Allterco Robotics ltd"#)
    
        // Infinitegra, Inc.
        #expect(CompanyIdentifier.infinitegra.rawValue == 2986)
        #expect(CompanyIdentifier.infinitegra.name == #"Infinitegra, Inc."#)
        #expect(CompanyIdentifier.infinitegra.description == #"Infinitegra, Inc."#)
    
        // Grandex International Corporation
        #expect(CompanyIdentifier.grandexInternational.rawValue == 2987)
        #expect(CompanyIdentifier.grandexInternational.name == #"Grandex International Corporation"#)
        #expect(CompanyIdentifier.grandexInternational.description == #"Grandex International Corporation"#)
    
        // Machfu Inc.
        #expect(CompanyIdentifier.machfu.rawValue == 2988)
        #expect(CompanyIdentifier.machfu.name == #"Machfu Inc."#)
        #expect(CompanyIdentifier.machfu.description == #"Machfu Inc."#)
    
        // Roambotics, Inc.
        #expect(CompanyIdentifier.roambotics.rawValue == 2989)
        #expect(CompanyIdentifier.roambotics.name == #"Roambotics, Inc."#)
        #expect(CompanyIdentifier.roambotics.description == #"Roambotics, Inc."#)
    
        // Soma Labs LLC
        #expect(CompanyIdentifier.somaLabs.rawValue == 2990)
        #expect(CompanyIdentifier.somaLabs.name == #"Soma Labs LLC"#)
        #expect(CompanyIdentifier.somaLabs.description == #"Soma Labs LLC"#)
    
        // NITTO KOGYO CORPORATION
        #expect(CompanyIdentifier.nittoKogyo.rawValue == 2991)
        #expect(CompanyIdentifier.nittoKogyo.name == #"NITTO KOGYO CORPORATION"#)
        #expect(CompanyIdentifier.nittoKogyo.description == #"NITTO KOGYO CORPORATION"#)
    
        // Ecolab Inc.
        #expect(CompanyIdentifier.ecolab.rawValue == 2992)
        #expect(CompanyIdentifier.ecolab.name == #"Ecolab Inc."#)
        #expect(CompanyIdentifier.ecolab.description == #"Ecolab Inc."#)
    
        // Beijing ranxin intelligence technology Co.,LTD
        #expect(CompanyIdentifier.beijingRanxinIntelligenceTechnology.rawValue == 2993)
        #expect(CompanyIdentifier.beijingRanxinIntelligenceTechnology.name == #"Beijing ranxin intelligence technology Co.,LTD"#)
        #expect(CompanyIdentifier.beijingRanxinIntelligenceTechnology.description == #"Beijing ranxin intelligence technology Co.,LTD"#)
    
        // Fjorden Electra AS
        #expect(CompanyIdentifier.fjordenElectra.rawValue == 2994)
        #expect(CompanyIdentifier.fjordenElectra.name == #"Fjorden Electra AS"#)
        #expect(CompanyIdentifier.fjordenElectra.description == #"Fjorden Electra AS"#)
    
        // Flender GmbH
        #expect(CompanyIdentifier.flender.rawValue == 2995)
        #expect(CompanyIdentifier.flender.name == #"Flender GmbH"#)
        #expect(CompanyIdentifier.flender.description == #"Flender GmbH"#)
    
        // New Cosmos USA, Inc.
        #expect(CompanyIdentifier.newCosmos.rawValue == 2996)
        #expect(CompanyIdentifier.newCosmos.name == #"New Cosmos USA, Inc."#)
        #expect(CompanyIdentifier.newCosmos.description == #"New Cosmos USA, Inc."#)
    
        // Xirgo Technologies, LLC
        #expect(CompanyIdentifier.xirgoTechnologies.rawValue == 2997)
        #expect(CompanyIdentifier.xirgoTechnologies.name == #"Xirgo Technologies, LLC"#)
        #expect(CompanyIdentifier.xirgoTechnologies.description == #"Xirgo Technologies, LLC"#)
    
        // Build With Robots Inc.
        #expect(CompanyIdentifier.buildWithRobots.rawValue == 2998)
        #expect(CompanyIdentifier.buildWithRobots.name == #"Build With Robots Inc."#)
        #expect(CompanyIdentifier.buildWithRobots.description == #"Build With Robots Inc."#)
    
        // IONA Tech LLC
        #expect(CompanyIdentifier.ionaTech.rawValue == 2999)
        #expect(CompanyIdentifier.ionaTech.name == #"IONA Tech LLC"#)
        #expect(CompanyIdentifier.ionaTech.description == #"IONA Tech LLC"#)
    
        // INNOVAG PTY. LTD.
        #expect(CompanyIdentifier.innovag.rawValue == 3000)
        #expect(CompanyIdentifier.innovag.name == #"INNOVAG PTY. LTD."#)
        #expect(CompanyIdentifier.innovag.description == #"INNOVAG PTY. LTD."#)
    
        // SaluStim Group Oy
        #expect(CompanyIdentifier.salustimGroup.rawValue == 3001)
        #expect(CompanyIdentifier.salustimGroup.name == #"SaluStim Group Oy"#)
        #expect(CompanyIdentifier.salustimGroup.description == #"SaluStim Group Oy"#)
    
        // Huso, INC
        #expect(CompanyIdentifier.huso.rawValue == 3002)
        #expect(CompanyIdentifier.huso.name == #"Huso, INC"#)
        #expect(CompanyIdentifier.huso.description == #"Huso, INC"#)
    
        // SWISSINNO SOLUTIONS AG
        #expect(CompanyIdentifier.swissinnoSolutions.rawValue == 3003)
        #expect(CompanyIdentifier.swissinnoSolutions.name == #"SWISSINNO SOLUTIONS AG"#)
        #expect(CompanyIdentifier.swissinnoSolutions.description == #"SWISSINNO SOLUTIONS AG"#)
    
        // T2REALITY SOLUTIONS PRIVATE LIMITED
        #expect(CompanyIdentifier.t2RealitySolutions.rawValue == 3004)
        #expect(CompanyIdentifier.t2RealitySolutions.name == #"T2REALITY SOLUTIONS PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.t2RealitySolutions.description == #"T2REALITY SOLUTIONS PRIVATE LIMITED"#)
    
        // ETHEORY PTY LTD
        #expect(CompanyIdentifier.etheory.rawValue == 3005)
        #expect(CompanyIdentifier.etheory.name == #"ETHEORY PTY LTD"#)
        #expect(CompanyIdentifier.etheory.description == #"ETHEORY PTY LTD"#)
    
        // SAAB Aktiebolag
        #expect(CompanyIdentifier.saabAktiebolag.rawValue == 3006)
        #expect(CompanyIdentifier.saabAktiebolag.name == #"SAAB Aktiebolag"#)
        #expect(CompanyIdentifier.saabAktiebolag.description == #"SAAB Aktiebolag"#)
    
        // HIMSA II K/S
        #expect(CompanyIdentifier.himsaIiKS.rawValue == 3007)
        #expect(CompanyIdentifier.himsaIiKS.name == #"HIMSA II K/S"#)
        #expect(CompanyIdentifier.himsaIiKS.description == #"HIMSA II K/S"#)
    
        // READY FOR SKY LLP
        #expect(CompanyIdentifier.readyForSkyLlp.rawValue == 3008)
        #expect(CompanyIdentifier.readyForSkyLlp.name == #"READY FOR SKY LLP"#)
        #expect(CompanyIdentifier.readyForSkyLlp.description == #"READY FOR SKY LLP"#)
    
        // Miele & Cie. KG
        #expect(CompanyIdentifier.mieleCieKg.rawValue == 3009)
        #expect(CompanyIdentifier.mieleCieKg.name == #"Miele & Cie. KG"#)
        #expect(CompanyIdentifier.mieleCieKg.description == #"Miele & Cie. KG"#)
    
        // EntWick Co.
        #expect(CompanyIdentifier.entwick.rawValue == 3010)
        #expect(CompanyIdentifier.entwick.name == #"EntWick Co."#)
        #expect(CompanyIdentifier.entwick.description == #"EntWick Co."#)
    
        // MCOT INC.
        #expect(CompanyIdentifier.mcot.rawValue == 3011)
        #expect(CompanyIdentifier.mcot.name == #"MCOT INC."#)
        #expect(CompanyIdentifier.mcot.description == #"MCOT INC."#)
    
        // TECHTICS ENGINEERING B.V.
        #expect(CompanyIdentifier.techticsEngineering.rawValue == 3012)
        #expect(CompanyIdentifier.techticsEngineering.name == #"TECHTICS ENGINEERING B.V."#)
        #expect(CompanyIdentifier.techticsEngineering.description == #"TECHTICS ENGINEERING B.V."#)
    
        // Aperia Technologies, Inc.
        #expect(CompanyIdentifier.aperiaTechnologies.rawValue == 3013)
        #expect(CompanyIdentifier.aperiaTechnologies.name == #"Aperia Technologies, Inc."#)
        #expect(CompanyIdentifier.aperiaTechnologies.description == #"Aperia Technologies, Inc."#)
    
        // TCL COMMUNICATION EQUIPMENT CO.,LTD.
        #expect(CompanyIdentifier.tclCommunicationEquipment.rawValue == 3014)
        #expect(CompanyIdentifier.tclCommunicationEquipment.name == #"TCL COMMUNICATION EQUIPMENT CO.,LTD."#)
        #expect(CompanyIdentifier.tclCommunicationEquipment.description == #"TCL COMMUNICATION EQUIPMENT CO.,LTD."#)
    
        // Signtle Inc.
        #expect(CompanyIdentifier.signtle.rawValue == 3015)
        #expect(CompanyIdentifier.signtle.name == #"Signtle Inc."#)
        #expect(CompanyIdentifier.signtle.description == #"Signtle Inc."#)
    
        // OTF Distribution, LLC
        #expect(CompanyIdentifier.otfDistribution.rawValue == 3016)
        #expect(CompanyIdentifier.otfDistribution.name == #"OTF Distribution, LLC"#)
        #expect(CompanyIdentifier.otfDistribution.description == #"OTF Distribution, LLC"#)
    
        // Neuvatek Inc.
        #expect(CompanyIdentifier.neuvatek.rawValue == 3017)
        #expect(CompanyIdentifier.neuvatek.name == #"Neuvatek Inc."#)
        #expect(CompanyIdentifier.neuvatek.description == #"Neuvatek Inc."#)
    
        // Perimeter Technologies, Inc.
        #expect(CompanyIdentifier.perimeterTechnologies.rawValue == 3018)
        #expect(CompanyIdentifier.perimeterTechnologies.name == #"Perimeter Technologies, Inc."#)
        #expect(CompanyIdentifier.perimeterTechnologies.description == #"Perimeter Technologies, Inc."#)
    
        // Divesoft s.r.o.
        #expect(CompanyIdentifier.divesoft.rawValue == 3019)
        #expect(CompanyIdentifier.divesoft.name == #"Divesoft s.r.o."#)
        #expect(CompanyIdentifier.divesoft.description == #"Divesoft s.r.o."#)
    
        // Sylvac sa
        #expect(CompanyIdentifier.sylvacSa.rawValue == 3020)
        #expect(CompanyIdentifier.sylvacSa.name == #"Sylvac sa"#)
        #expect(CompanyIdentifier.sylvacSa.description == #"Sylvac sa"#)
    
        // Amiko srl
        #expect(CompanyIdentifier.amiko.rawValue == 3021)
        #expect(CompanyIdentifier.amiko.name == #"Amiko srl"#)
        #expect(CompanyIdentifier.amiko.description == #"Amiko srl"#)
    
        // Neurosity, Inc.
        #expect(CompanyIdentifier.neurosity.rawValue == 3022)
        #expect(CompanyIdentifier.neurosity.name == #"Neurosity, Inc."#)
        #expect(CompanyIdentifier.neurosity.description == #"Neurosity, Inc."#)
    
        // LL Tec Group LLC
        #expect(CompanyIdentifier.llTecGroup.rawValue == 3023)
        #expect(CompanyIdentifier.llTecGroup.name == #"LL Tec Group LLC"#)
        #expect(CompanyIdentifier.llTecGroup.description == #"LL Tec Group LLC"#)
    
        // Durag GmbH
        #expect(CompanyIdentifier.durag.rawValue == 3024)
        #expect(CompanyIdentifier.durag.name == #"Durag GmbH"#)
        #expect(CompanyIdentifier.durag.description == #"Durag GmbH"#)
    
        // Hubei Yuan Times Technology Co., Ltd.
        #expect(CompanyIdentifier.hubeiYuanTimesTechnology.rawValue == 3025)
        #expect(CompanyIdentifier.hubeiYuanTimesTechnology.name == #"Hubei Yuan Times Technology Co., Ltd."#)
        #expect(CompanyIdentifier.hubeiYuanTimesTechnology.description == #"Hubei Yuan Times Technology Co., Ltd."#)
    
        // IDEC
        #expect(CompanyIdentifier.idec.rawValue == 3026)
        #expect(CompanyIdentifier.idec.name == #"IDEC"#)
        #expect(CompanyIdentifier.idec.description == #"IDEC"#)
    
        // Procon Analytics, LLC
        #expect(CompanyIdentifier.proconAnalytics.rawValue == 3027)
        #expect(CompanyIdentifier.proconAnalytics.name == #"Procon Analytics, LLC"#)
        #expect(CompanyIdentifier.proconAnalytics.description == #"Procon Analytics, LLC"#)
    
        // ndd Medizintechnik AG
        #expect(CompanyIdentifier.nddMedizintechnik.rawValue == 3028)
        #expect(CompanyIdentifier.nddMedizintechnik.name == #"ndd Medizintechnik AG"#)
        #expect(CompanyIdentifier.nddMedizintechnik.description == #"ndd Medizintechnik AG"#)
    
        // Super B Lithium Power B.V.
        #expect(CompanyIdentifier.superBLithiumPower.rawValue == 3029)
        #expect(CompanyIdentifier.superBLithiumPower.name == #"Super B Lithium Power B.V."#)
        #expect(CompanyIdentifier.superBLithiumPower.description == #"Super B Lithium Power B.V."#)
    
        // Shenzhen Injoinic Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenInjoinicTechnology.rawValue == 3030)
        #expect(CompanyIdentifier.shenzhenInjoinicTechnology.name == #"Shenzhen Injoinic Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenInjoinicTechnology.description == #"Shenzhen Injoinic Technology Co., Ltd."#)
    
        // VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY
        #expect(CompanyIdentifier.vinfastTradingAndProduction.rawValue == 3031)
        #expect(CompanyIdentifier.vinfastTradingAndProduction.name == #"VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY"#)
        #expect(CompanyIdentifier.vinfastTradingAndProduction.description == #"VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY"#)
    
        // PURA SCENTS, INC.
        #expect(CompanyIdentifier.puraScents.rawValue == 3032)
        #expect(CompanyIdentifier.puraScents.name == #"PURA SCENTS, INC."#)
        #expect(CompanyIdentifier.puraScents.description == #"PURA SCENTS, INC."#)
    
        // Elics Basis Ltd.
        #expect(CompanyIdentifier.elicsBasis.rawValue == 3033)
        #expect(CompanyIdentifier.elicsBasis.name == #"Elics Basis Ltd."#)
        #expect(CompanyIdentifier.elicsBasis.description == #"Elics Basis Ltd."#)
    
        // Aardex Ltd.
        #expect(CompanyIdentifier.aardex.rawValue == 3034)
        #expect(CompanyIdentifier.aardex.name == #"Aardex Ltd."#)
        #expect(CompanyIdentifier.aardex.description == #"Aardex Ltd."#)
    
        // CHAR-BROIL, LLC
        #expect(CompanyIdentifier.charBroil.rawValue == 3035)
        #expect(CompanyIdentifier.charBroil.name == #"CHAR-BROIL, LLC"#)
        #expect(CompanyIdentifier.charBroil.description == #"CHAR-BROIL, LLC"#)
    
        // Ledworks S.r.l.
        #expect(CompanyIdentifier.ledworks.rawValue == 3036)
        #expect(CompanyIdentifier.ledworks.name == #"Ledworks S.r.l."#)
        #expect(CompanyIdentifier.ledworks.description == #"Ledworks S.r.l."#)
    
        // Coroflo Limited
        #expect(CompanyIdentifier.coroflo.rawValue == 3037)
        #expect(CompanyIdentifier.coroflo.name == #"Coroflo Limited"#)
        #expect(CompanyIdentifier.coroflo.description == #"Coroflo Limited"#)
    
        // Yale
        #expect(CompanyIdentifier.yale.rawValue == 3038)
        #expect(CompanyIdentifier.yale.name == #"Yale"#)
        #expect(CompanyIdentifier.yale.description == #"Yale"#)
    
        // WINKEY ENTERPRISE (HONG KONG) LIMITED
        #expect(CompanyIdentifier.winkeyEnterpriseHongKong.rawValue == 3039)
        #expect(CompanyIdentifier.winkeyEnterpriseHongKong.name == #"WINKEY ENTERPRISE (HONG KONG) LIMITED"#)
        #expect(CompanyIdentifier.winkeyEnterpriseHongKong.description == #"WINKEY ENTERPRISE (HONG KONG) LIMITED"#)
    
        // Koizumi Lighting Technology corp.
        #expect(CompanyIdentifier.koizumiLightingTechnology.rawValue == 3040)
        #expect(CompanyIdentifier.koizumiLightingTechnology.name == #"Koizumi Lighting Technology corp."#)
        #expect(CompanyIdentifier.koizumiLightingTechnology.description == #"Koizumi Lighting Technology corp."#)
    
        // Back40 Precision
        #expect(CompanyIdentifier.back40Precision.rawValue == 3041)
        #expect(CompanyIdentifier.back40Precision.name == #"Back40 Precision"#)
        #expect(CompanyIdentifier.back40Precision.description == #"Back40 Precision"#)
    
        // OTC engineering
        #expect(CompanyIdentifier.otcEngineering.rawValue == 3042)
        #expect(CompanyIdentifier.otcEngineering.name == #"OTC engineering"#)
        #expect(CompanyIdentifier.otcEngineering.description == #"OTC engineering"#)
    
        // Comtel Systems Ltd.
        #expect(CompanyIdentifier.comtelSystems.rawValue == 3043)
        #expect(CompanyIdentifier.comtelSystems.name == #"Comtel Systems Ltd."#)
        #expect(CompanyIdentifier.comtelSystems.description == #"Comtel Systems Ltd."#)
    
        // Deepfield Connect GmbH
        #expect(CompanyIdentifier.deepfieldConnect.rawValue == 3044)
        #expect(CompanyIdentifier.deepfieldConnect.name == #"Deepfield Connect GmbH"#)
        #expect(CompanyIdentifier.deepfieldConnect.description == #"Deepfield Connect GmbH"#)
    
        // ZWILLING J.A. Henckels Aktiengesellschaft
        #expect(CompanyIdentifier.zwillingJAHenckelsAktiengesellschaft.rawValue == 3045)
        #expect(CompanyIdentifier.zwillingJAHenckelsAktiengesellschaft.name == #"ZWILLING J.A. Henckels Aktiengesellschaft"#)
        #expect(CompanyIdentifier.zwillingJAHenckelsAktiengesellschaft.description == #"ZWILLING J.A. Henckels Aktiengesellschaft"#)
    
        // Puratap Pty Ltd
        #expect(CompanyIdentifier.puratap.rawValue == 3046)
        #expect(CompanyIdentifier.puratap.name == #"Puratap Pty Ltd"#)
        #expect(CompanyIdentifier.puratap.description == #"Puratap Pty Ltd"#)
    
        // Fresnel Technologies, Inc.
        #expect(CompanyIdentifier.fresnelTechnologies.rawValue == 3047)
        #expect(CompanyIdentifier.fresnelTechnologies.name == #"Fresnel Technologies, Inc."#)
        #expect(CompanyIdentifier.fresnelTechnologies.description == #"Fresnel Technologies, Inc."#)
    
        // Sensormate AG
        #expect(CompanyIdentifier.sensormate.rawValue == 3048)
        #expect(CompanyIdentifier.sensormate.name == #"Sensormate AG"#)
        #expect(CompanyIdentifier.sensormate.description == #"Sensormate AG"#)
    
        // Shindengen Electric Manufacturing Co., Ltd.
        #expect(CompanyIdentifier.shindengenElectricManufacturing.rawValue == 3049)
        #expect(CompanyIdentifier.shindengenElectricManufacturing.name == #"Shindengen Electric Manufacturing Co., Ltd."#)
        #expect(CompanyIdentifier.shindengenElectricManufacturing.description == #"Shindengen Electric Manufacturing Co., Ltd."#)
    
        // Twenty Five Seven, prodaja in storitve, d.o.o.
        #expect(CompanyIdentifier.twentyFiveSevenProdajaInStoritve.rawValue == 3050)
        #expect(CompanyIdentifier.twentyFiveSevenProdajaInStoritve.name == #"Twenty Five Seven, prodaja in storitve, d.o.o."#)
        #expect(CompanyIdentifier.twentyFiveSevenProdajaInStoritve.description == #"Twenty Five Seven, prodaja in storitve, d.o.o."#)
    
        // Luna Health, Inc.
        #expect(CompanyIdentifier.lunaHealth.rawValue == 3051)
        #expect(CompanyIdentifier.lunaHealth.name == #"Luna Health, Inc."#)
        #expect(CompanyIdentifier.lunaHealth.description == #"Luna Health, Inc."#)
    
        // Miracle-Ear, Inc.
        #expect(CompanyIdentifier.miracleEar.rawValue == 3052)
        #expect(CompanyIdentifier.miracleEar.name == #"Miracle-Ear, Inc."#)
        #expect(CompanyIdentifier.miracleEar.description == #"Miracle-Ear, Inc."#)
    
        // CORAL-TAIYI Co. Ltd.
        #expect(CompanyIdentifier.coralTaiyi.rawValue == 3053)
        #expect(CompanyIdentifier.coralTaiyi.name == #"CORAL-TAIYI Co. Ltd."#)
        #expect(CompanyIdentifier.coralTaiyi.description == #"CORAL-TAIYI Co. Ltd."#)
    
        // LINKSYS USA, INC.
        #expect(CompanyIdentifier.linksys.rawValue == 3054)
        #expect(CompanyIdentifier.linksys.name == #"LINKSYS USA, INC."#)
        #expect(CompanyIdentifier.linksys.description == #"LINKSYS USA, INC."#)
    
        // Safetytest GmbH
        #expect(CompanyIdentifier.safetytest.rawValue == 3055)
        #expect(CompanyIdentifier.safetytest.name == #"Safetytest GmbH"#)
        #expect(CompanyIdentifier.safetytest.description == #"Safetytest GmbH"#)
    
        // KIDO SPORTS CO., LTD.
        #expect(CompanyIdentifier.kidoSports.rawValue == 3056)
        #expect(CompanyIdentifier.kidoSports.name == #"KIDO SPORTS CO., LTD."#)
        #expect(CompanyIdentifier.kidoSports.description == #"KIDO SPORTS CO., LTD."#)
    
        // Site IQ LLC
        #expect(CompanyIdentifier.siteIq.rawValue == 3057)
        #expect(CompanyIdentifier.siteIq.name == #"Site IQ LLC"#)
        #expect(CompanyIdentifier.siteIq.description == #"Site IQ LLC"#)
    
        // Angel Medical Systems, Inc.
        #expect(CompanyIdentifier.angelMedicalSystems.rawValue == 3058)
        #expect(CompanyIdentifier.angelMedicalSystems.name == #"Angel Medical Systems, Inc."#)
        #expect(CompanyIdentifier.angelMedicalSystems.description == #"Angel Medical Systems, Inc."#)
    
        // PONE BIOMETRICS AS
        #expect(CompanyIdentifier.poneBiometrics.rawValue == 3059)
        #expect(CompanyIdentifier.poneBiometrics.name == #"PONE BIOMETRICS AS"#)
        #expect(CompanyIdentifier.poneBiometrics.description == #"PONE BIOMETRICS AS"#)
    
        // ER Lab LLC
        #expect(CompanyIdentifier.erLab.rawValue == 3060)
        #expect(CompanyIdentifier.erLab.name == #"ER Lab LLC"#)
        #expect(CompanyIdentifier.erLab.description == #"ER Lab LLC"#)
    
        // T5 tek, Inc.
        #expect(CompanyIdentifier.t5Tek.rawValue == 3061)
        #expect(CompanyIdentifier.t5Tek.name == #"T5 tek, Inc."#)
        #expect(CompanyIdentifier.t5Tek.description == #"T5 tek, Inc."#)
    
        // greenTEG AG
        #expect(CompanyIdentifier.greenteg.rawValue == 3062)
        #expect(CompanyIdentifier.greenteg.name == #"greenTEG AG"#)
        #expect(CompanyIdentifier.greenteg.description == #"greenTEG AG"#)
    
        // Wacker Neuson SE
        #expect(CompanyIdentifier.wackerNeuson.rawValue == 3063)
        #expect(CompanyIdentifier.wackerNeuson.name == #"Wacker Neuson SE"#)
        #expect(CompanyIdentifier.wackerNeuson.description == #"Wacker Neuson SE"#)
    
        // Innovacionnye Resheniya
        #expect(CompanyIdentifier.innovacionnyeResheniya.rawValue == 3064)
        #expect(CompanyIdentifier.innovacionnyeResheniya.name == #"Innovacionnye Resheniya"#)
        #expect(CompanyIdentifier.innovacionnyeResheniya.description == #"Innovacionnye Resheniya"#)
    
        // Alio, Inc
        #expect(CompanyIdentifier.alio.rawValue == 3065)
        #expect(CompanyIdentifier.alio.name == #"Alio, Inc"#)
        #expect(CompanyIdentifier.alio.description == #"Alio, Inc"#)
    
        // CleanBands Systems Ltd.
        #expect(CompanyIdentifier.cleanbandsSystems.rawValue == 3066)
        #expect(CompanyIdentifier.cleanbandsSystems.name == #"CleanBands Systems Ltd."#)
        #expect(CompanyIdentifier.cleanbandsSystems.description == #"CleanBands Systems Ltd."#)
    
        // Dodam Enersys Co., Ltd
        #expect(CompanyIdentifier.dodamEnersys.rawValue == 3067)
        #expect(CompanyIdentifier.dodamEnersys.name == #"Dodam Enersys Co., Ltd"#)
        #expect(CompanyIdentifier.dodamEnersys.description == #"Dodam Enersys Co., Ltd"#)
    
        // T+A elektroakustik GmbH & Co.KG
        #expect(CompanyIdentifier.tAElektroakustikKg.rawValue == 3068)
        #expect(CompanyIdentifier.tAElektroakustikKg.name == #"T+A elektroakustik GmbH & Co.KG"#)
        #expect(CompanyIdentifier.tAElektroakustikKg.description == #"T+A elektroakustik GmbH & Co.KG"#)
    
        // Esmé Solutions
        #expect(CompanyIdentifier.esmeSolutions.rawValue == 3069)
        #expect(CompanyIdentifier.esmeSolutions.name == #"Esmé Solutions"#)
        #expect(CompanyIdentifier.esmeSolutions.description == #"Esmé Solutions"#)
    
        // Media-Cartec GmbH
        #expect(CompanyIdentifier.mediaCartec.rawValue == 3070)
        #expect(CompanyIdentifier.mediaCartec.name == #"Media-Cartec GmbH"#)
        #expect(CompanyIdentifier.mediaCartec.description == #"Media-Cartec GmbH"#)
    
        // Ratio Electric BV
        #expect(CompanyIdentifier.ratioElectric.rawValue == 3071)
        #expect(CompanyIdentifier.ratioElectric.name == #"Ratio Electric BV"#)
        #expect(CompanyIdentifier.ratioElectric.description == #"Ratio Electric BV"#)
    
        // MQA Limited
        #expect(CompanyIdentifier.mqa.rawValue == 3072)
        #expect(CompanyIdentifier.mqa.name == #"MQA Limited"#)
        #expect(CompanyIdentifier.mqa.description == #"MQA Limited"#)
    
        // NEOWRK SISTEMAS INTELIGENTES S.A.
        #expect(CompanyIdentifier.neowrkSistemasInteligentes.rawValue == 3073)
        #expect(CompanyIdentifier.neowrkSistemasInteligentes.name == #"NEOWRK SISTEMAS INTELIGENTES S.A."#)
        #expect(CompanyIdentifier.neowrkSistemasInteligentes.description == #"NEOWRK SISTEMAS INTELIGENTES S.A."#)
    
        // Loomanet, Inc.
        #expect(CompanyIdentifier.loomanet.rawValue == 3074)
        #expect(CompanyIdentifier.loomanet.name == #"Loomanet, Inc."#)
        #expect(CompanyIdentifier.loomanet.description == #"Loomanet, Inc."#)
    
        // Puff Corp
        #expect(CompanyIdentifier.puff.rawValue == 3075)
        #expect(CompanyIdentifier.puff.name == #"Puff Corp"#)
        #expect(CompanyIdentifier.puff.description == #"Puff Corp"#)
    
        // Happy Health, Inc.
        #expect(CompanyIdentifier.happyHealth.rawValue == 3076)
        #expect(CompanyIdentifier.happyHealth.name == #"Happy Health, Inc."#)
        #expect(CompanyIdentifier.happyHealth.description == #"Happy Health, Inc."#)
    
        // Montage Connect, Inc.
        #expect(CompanyIdentifier.montageConnect.rawValue == 3077)
        #expect(CompanyIdentifier.montageConnect.name == #"Montage Connect, Inc."#)
        #expect(CompanyIdentifier.montageConnect.description == #"Montage Connect, Inc."#)
    
        // LED Smart Inc.
        #expect(CompanyIdentifier.ledSmart.rawValue == 3078)
        #expect(CompanyIdentifier.ledSmart.name == #"LED Smart Inc."#)
        #expect(CompanyIdentifier.ledSmart.description == #"LED Smart Inc."#)
    
        // CONSTRUKTS, INC.
        #expect(CompanyIdentifier.construkts.rawValue == 3079)
        #expect(CompanyIdentifier.construkts.name == #"CONSTRUKTS, INC."#)
        #expect(CompanyIdentifier.construkts.description == #"CONSTRUKTS, INC."#)
    
        // limited liability company "Red"
        #expect(CompanyIdentifier.red.rawValue == 3080)
        #expect(CompanyIdentifier.red.name == #"limited liability company "Red""#)
        #expect(CompanyIdentifier.red.description == #"limited liability company "Red""#)
    
        // Senic Inc.
        #expect(CompanyIdentifier.senic.rawValue == 3081)
        #expect(CompanyIdentifier.senic.name == #"Senic Inc."#)
        #expect(CompanyIdentifier.senic.description == #"Senic Inc."#)
    
        // Automated Pet Care Products, LLC
        #expect(CompanyIdentifier.automatedPetCareProducts.rawValue == 3082)
        #expect(CompanyIdentifier.automatedPetCareProducts.name == #"Automated Pet Care Products, LLC"#)
        #expect(CompanyIdentifier.automatedPetCareProducts.description == #"Automated Pet Care Products, LLC"#)
    
        // aconno GmbH
        #expect(CompanyIdentifier.aconno.rawValue == 3083)
        #expect(CompanyIdentifier.aconno.name == #"aconno GmbH"#)
        #expect(CompanyIdentifier.aconno.description == #"aconno GmbH"#)
    
        // Mendeltron, Inc.
        #expect(CompanyIdentifier.mendeltron.rawValue == 3084)
        #expect(CompanyIdentifier.mendeltron.name == #"Mendeltron, Inc."#)
        #expect(CompanyIdentifier.mendeltron.description == #"Mendeltron, Inc."#)
    
        // Mereltron bv
        #expect(CompanyIdentifier.mereltronBv.rawValue == 3085)
        #expect(CompanyIdentifier.mereltronBv.name == #"Mereltron bv"#)
        #expect(CompanyIdentifier.mereltronBv.description == #"Mereltron bv"#)
    
        // ALEX DENKO CO.,LTD.
        #expect(CompanyIdentifier.alexDenko.rawValue == 3086)
        #expect(CompanyIdentifier.alexDenko.name == #"ALEX DENKO CO.,LTD."#)
        #expect(CompanyIdentifier.alexDenko.description == #"ALEX DENKO CO.,LTD."#)
    
        // AETERLINK
        #expect(CompanyIdentifier.aeterlink.rawValue == 3087)
        #expect(CompanyIdentifier.aeterlink.name == #"AETERLINK"#)
        #expect(CompanyIdentifier.aeterlink.description == #"AETERLINK"#)
    
        // Cosmed s.r.l.
        #expect(CompanyIdentifier.cosmed.rawValue == 3088)
        #expect(CompanyIdentifier.cosmed.name == #"Cosmed s.r.l."#)
        #expect(CompanyIdentifier.cosmed.description == #"Cosmed s.r.l."#)
    
        // Gordon Murray Design Limited
        #expect(CompanyIdentifier.gordonMurrayDesign.rawValue == 3089)
        #expect(CompanyIdentifier.gordonMurrayDesign.name == #"Gordon Murray Design Limited"#)
        #expect(CompanyIdentifier.gordonMurrayDesign.description == #"Gordon Murray Design Limited"#)
    
        // IoSA
        #expect(CompanyIdentifier.iosa.rawValue == 3090)
        #expect(CompanyIdentifier.iosa.name == #"IoSA"#)
        #expect(CompanyIdentifier.iosa.description == #"IoSA"#)
    
        // Scandinavian Health Limited
        #expect(CompanyIdentifier.scandinavianHealth.rawValue == 3091)
        #expect(CompanyIdentifier.scandinavianHealth.name == #"Scandinavian Health Limited"#)
        #expect(CompanyIdentifier.scandinavianHealth.description == #"Scandinavian Health Limited"#)
    
        // Fasetto, Inc.
        #expect(CompanyIdentifier.fasetto.rawValue == 3092)
        #expect(CompanyIdentifier.fasetto.name == #"Fasetto, Inc."#)
        #expect(CompanyIdentifier.fasetto.description == #"Fasetto, Inc."#)
    
        // Geva Sol B.V.
        #expect(CompanyIdentifier.gevaSol.rawValue == 3093)
        #expect(CompanyIdentifier.gevaSol.name == #"Geva Sol B.V."#)
        #expect(CompanyIdentifier.gevaSol.description == #"Geva Sol B.V."#)
    
        // TYKEE PTY. LTD.
        #expect(CompanyIdentifier.tykee.rawValue == 3094)
        #expect(CompanyIdentifier.tykee.name == #"TYKEE PTY. LTD."#)
        #expect(CompanyIdentifier.tykee.description == #"TYKEE PTY. LTD."#)
    
        // SomnoMed Limited
        #expect(CompanyIdentifier.somnomed.rawValue == 3095)
        #expect(CompanyIdentifier.somnomed.name == #"SomnoMed Limited"#)
        #expect(CompanyIdentifier.somnomed.description == #"SomnoMed Limited"#)
    
        // CORROHM
        #expect(CompanyIdentifier.corrohm.rawValue == 3096)
        #expect(CompanyIdentifier.corrohm.name == #"CORROHM"#)
        #expect(CompanyIdentifier.corrohm.description == #"CORROHM"#)
    
        // Arlo Technologies, Inc.
        #expect(CompanyIdentifier.arloTechnologies.rawValue == 3097)
        #expect(CompanyIdentifier.arloTechnologies.name == #"Arlo Technologies, Inc."#)
        #expect(CompanyIdentifier.arloTechnologies.description == #"Arlo Technologies, Inc."#)
    
        // Catapult Group International Ltd
        #expect(CompanyIdentifier.catapultGroupInternational.rawValue == 3098)
        #expect(CompanyIdentifier.catapultGroupInternational.name == #"Catapult Group International Ltd"#)
        #expect(CompanyIdentifier.catapultGroupInternational.description == #"Catapult Group International Ltd"#)
    
        // Rockchip Electronics Co., Ltd.
        #expect(CompanyIdentifier.rockchipElectronics.rawValue == 3099)
        #expect(CompanyIdentifier.rockchipElectronics.name == #"Rockchip Electronics Co., Ltd."#)
        #expect(CompanyIdentifier.rockchipElectronics.description == #"Rockchip Electronics Co., Ltd."#)
    
        // GEMU
        #expect(CompanyIdentifier.gemu.rawValue == 3100)
        #expect(CompanyIdentifier.gemu.name == #"GEMU"#)
        #expect(CompanyIdentifier.gemu.description == #"GEMU"#)
    
        // OFF Line Japan Co., Ltd.
        #expect(CompanyIdentifier.offLineJapan.rawValue == 3101)
        #expect(CompanyIdentifier.offLineJapan.name == #"OFF Line Japan Co., Ltd."#)
        #expect(CompanyIdentifier.offLineJapan.description == #"OFF Line Japan Co., Ltd."#)
    
        // EC sense co., Ltd
        #expect(CompanyIdentifier.ecSense.rawValue == 3102)
        #expect(CompanyIdentifier.ecSense.name == #"EC sense co., Ltd"#)
        #expect(CompanyIdentifier.ecSense.description == #"EC sense co., Ltd"#)
    
        // LVI Co.
        #expect(CompanyIdentifier.lvi.rawValue == 3103)
        #expect(CompanyIdentifier.lvi.name == #"LVI Co."#)
        #expect(CompanyIdentifier.lvi.description == #"LVI Co."#)
    
        // COMELIT GROUP S.P.A.
        #expect(CompanyIdentifier.comelitGroup.rawValue == 3104)
        #expect(CompanyIdentifier.comelitGroup.name == #"COMELIT GROUP S.P.A."#)
        #expect(CompanyIdentifier.comelitGroup.description == #"COMELIT GROUP S.P.A."#)
    
        // Foshan Viomi Electrical Technology Co., Ltd
        #expect(CompanyIdentifier.foshanViomiElectricalTechnology.rawValue == 3105)
        #expect(CompanyIdentifier.foshanViomiElectricalTechnology.name == #"Foshan Viomi Electrical Technology Co., Ltd"#)
        #expect(CompanyIdentifier.foshanViomiElectricalTechnology.description == #"Foshan Viomi Electrical Technology Co., Ltd"#)
    
        // Glamo Inc.
        #expect(CompanyIdentifier.glamo.rawValue == 3106)
        #expect(CompanyIdentifier.glamo.name == #"Glamo Inc."#)
        #expect(CompanyIdentifier.glamo.description == #"Glamo Inc."#)
    
        // KEYTEC,Inc.
        #expect(CompanyIdentifier.keytec.rawValue == 3107)
        #expect(CompanyIdentifier.keytec.name == #"KEYTEC,Inc."#)
        #expect(CompanyIdentifier.keytec.description == #"KEYTEC,Inc."#)
    
        // SMARTD TECHNOLOGIES INC.
        #expect(CompanyIdentifier.smartdTechnologies.rawValue == 3108)
        #expect(CompanyIdentifier.smartdTechnologies.name == #"SMARTD TECHNOLOGIES INC."#)
        #expect(CompanyIdentifier.smartdTechnologies.description == #"SMARTD TECHNOLOGIES INC."#)
    
        // JURA Elektroapparate AG
        #expect(CompanyIdentifier.juraElektroapparate.rawValue == 3109)
        #expect(CompanyIdentifier.juraElektroapparate.name == #"JURA Elektroapparate AG"#)
        #expect(CompanyIdentifier.juraElektroapparate.description == #"JURA Elektroapparate AG"#)
    
        // Performance Electronics, Ltd.
        #expect(CompanyIdentifier.performanceElectronics.rawValue == 3110)
        #expect(CompanyIdentifier.performanceElectronics.name == #"Performance Electronics, Ltd."#)
        #expect(CompanyIdentifier.performanceElectronics.description == #"Performance Electronics, Ltd."#)
    
        // Pal Electronics
        #expect(CompanyIdentifier.palElectronics.rawValue == 3111)
        #expect(CompanyIdentifier.palElectronics.name == #"Pal Electronics"#)
        #expect(CompanyIdentifier.palElectronics.description == #"Pal Electronics"#)
    
        // Embecta Corp.
        #expect(CompanyIdentifier.embecta.rawValue == 3112)
        #expect(CompanyIdentifier.embecta.name == #"Embecta Corp."#)
        #expect(CompanyIdentifier.embecta.description == #"Embecta Corp."#)
    
        // DENSO AIRCOOL CORPORATION
        #expect(CompanyIdentifier.densoAircool.rawValue == 3113)
        #expect(CompanyIdentifier.densoAircool.name == #"DENSO AIRCOOL CORPORATION"#)
        #expect(CompanyIdentifier.densoAircool.description == #"DENSO AIRCOOL CORPORATION"#)
    
        // Caresix Inc.
        #expect(CompanyIdentifier.caresix.rawValue == 3114)
        #expect(CompanyIdentifier.caresix.name == #"Caresix Inc."#)
        #expect(CompanyIdentifier.caresix.description == #"Caresix Inc."#)
    
        // GigaDevice Semiconductor Inc.
        #expect(CompanyIdentifier.gigadeviceSemiconductor.rawValue == 3115)
        #expect(CompanyIdentifier.gigadeviceSemiconductor.name == #"GigaDevice Semiconductor Inc."#)
        #expect(CompanyIdentifier.gigadeviceSemiconductor.description == #"GigaDevice Semiconductor Inc."#)
    
        // Zeku Technology (Shanghai) Corp., Ltd.
        #expect(CompanyIdentifier.zekuTechnologyShanghai.rawValue == 3116)
        #expect(CompanyIdentifier.zekuTechnologyShanghai.name == #"Zeku Technology (Shanghai) Corp., Ltd."#)
        #expect(CompanyIdentifier.zekuTechnologyShanghai.description == #"Zeku Technology (Shanghai) Corp., Ltd."#)
    
        // OTF Product Sourcing, LLC
        #expect(CompanyIdentifier.otfProductSourcing.rawValue == 3117)
        #expect(CompanyIdentifier.otfProductSourcing.name == #"OTF Product Sourcing, LLC"#)
        #expect(CompanyIdentifier.otfProductSourcing.description == #"OTF Product Sourcing, LLC"#)
    
        // Easee AS
        #expect(CompanyIdentifier.easee.rawValue == 3118)
        #expect(CompanyIdentifier.easee.name == #"Easee AS"#)
        #expect(CompanyIdentifier.easee.description == #"Easee AS"#)
    
        // BEEHERO, INC.
        #expect(CompanyIdentifier.beehero.rawValue == 3119)
        #expect(CompanyIdentifier.beehero.name == #"BEEHERO, INC."#)
        #expect(CompanyIdentifier.beehero.description == #"BEEHERO, INC."#)
    
        // McIntosh Group Inc
        #expect(CompanyIdentifier.mcintoshGroup.rawValue == 3120)
        #expect(CompanyIdentifier.mcintoshGroup.name == #"McIntosh Group Inc"#)
        #expect(CompanyIdentifier.mcintoshGroup.description == #"McIntosh Group Inc"#)
    
        // KINDOO LLP
        #expect(CompanyIdentifier.kindooLlp.rawValue == 3121)
        #expect(CompanyIdentifier.kindooLlp.name == #"KINDOO LLP"#)
        #expect(CompanyIdentifier.kindooLlp.description == #"KINDOO LLP"#)
    
        // Xian Yisuobao Electronic Technology Co., Ltd.
        #expect(CompanyIdentifier.xianYisuobaoElectronicTechnology.rawValue == 3122)
        #expect(CompanyIdentifier.xianYisuobaoElectronicTechnology.name == #"Xian Yisuobao Electronic Technology Co., Ltd."#)
        #expect(CompanyIdentifier.xianYisuobaoElectronicTechnology.description == #"Xian Yisuobao Electronic Technology Co., Ltd."#)
    
        // Exeger Operations AB
        #expect(CompanyIdentifier.exegerOperations.rawValue == 3123)
        #expect(CompanyIdentifier.exegerOperations.name == #"Exeger Operations AB"#)
        #expect(CompanyIdentifier.exegerOperations.description == #"Exeger Operations AB"#)
    
        // BYD Company Limited
        #expect(CompanyIdentifier.byd.rawValue == 3124)
        #expect(CompanyIdentifier.byd.name == #"BYD Company Limited"#)
        #expect(CompanyIdentifier.byd.description == #"BYD Company Limited"#)
    
        // Thermokon-Sensortechnik GmbH
        #expect(CompanyIdentifier.thermokonSensortechnik.rawValue == 3125)
        #expect(CompanyIdentifier.thermokonSensortechnik.name == #"Thermokon-Sensortechnik GmbH"#)
        #expect(CompanyIdentifier.thermokonSensortechnik.description == #"Thermokon-Sensortechnik GmbH"#)
    
        // Cosmicnode BV
        #expect(CompanyIdentifier.cosmicnode.rawValue == 3126)
        #expect(CompanyIdentifier.cosmicnode.name == #"Cosmicnode BV"#)
        #expect(CompanyIdentifier.cosmicnode.description == #"Cosmicnode BV"#)
    
        // SignalQuest, LLC
        #expect(CompanyIdentifier.signalquest.rawValue == 3127)
        #expect(CompanyIdentifier.signalquest.name == #"SignalQuest, LLC"#)
        #expect(CompanyIdentifier.signalquest.description == #"SignalQuest, LLC"#)
    
        // Noritz Corporation.
        #expect(CompanyIdentifier.noritz.rawValue == 3128)
        #expect(CompanyIdentifier.noritz.name == #"Noritz Corporation."#)
        #expect(CompanyIdentifier.noritz.description == #"Noritz Corporation."#)
    
        // TIGER CORPORATION
        #expect(CompanyIdentifier.tiger.rawValue == 3129)
        #expect(CompanyIdentifier.tiger.name == #"TIGER CORPORATION"#)
        #expect(CompanyIdentifier.tiger.description == #"TIGER CORPORATION"#)
    
        // Equinosis, LLC
        #expect(CompanyIdentifier.equinosis.rawValue == 3130)
        #expect(CompanyIdentifier.equinosis.name == #"Equinosis, LLC"#)
        #expect(CompanyIdentifier.equinosis.description == #"Equinosis, LLC"#)
    
        // ORB Innovations Ltd
        #expect(CompanyIdentifier.orbInnovations.rawValue == 3131)
        #expect(CompanyIdentifier.orbInnovations.name == #"ORB Innovations Ltd"#)
        #expect(CompanyIdentifier.orbInnovations.description == #"ORB Innovations Ltd"#)
    
        // Classified Cycling
        #expect(CompanyIdentifier.classifiedCycling.rawValue == 3132)
        #expect(CompanyIdentifier.classifiedCycling.name == #"Classified Cycling"#)
        #expect(CompanyIdentifier.classifiedCycling.description == #"Classified Cycling"#)
    
        // Wrmth Corp.
        #expect(CompanyIdentifier.wrmth.rawValue == 3133)
        #expect(CompanyIdentifier.wrmth.name == #"Wrmth Corp."#)
        #expect(CompanyIdentifier.wrmth.description == #"Wrmth Corp."#)
    
        // BELLDESIGN Inc.
        #expect(CompanyIdentifier.belldesign.rawValue == 3134)
        #expect(CompanyIdentifier.belldesign.name == #"BELLDESIGN Inc."#)
        #expect(CompanyIdentifier.belldesign.description == #"BELLDESIGN Inc."#)
    
        // Stinger Equipment, Inc.
        #expect(CompanyIdentifier.stingerEquipment.rawValue == 3135)
        #expect(CompanyIdentifier.stingerEquipment.name == #"Stinger Equipment, Inc."#)
        #expect(CompanyIdentifier.stingerEquipment.description == #"Stinger Equipment, Inc."#)
    
        // HORIBA, Ltd.
        #expect(CompanyIdentifier.horiba.rawValue == 3136)
        #expect(CompanyIdentifier.horiba.name == #"HORIBA, Ltd."#)
        #expect(CompanyIdentifier.horiba.description == #"HORIBA, Ltd."#)
    
        // Control Solutions LLC
        #expect(CompanyIdentifier.controlSolutions.rawValue == 3137)
        #expect(CompanyIdentifier.controlSolutions.name == #"Control Solutions LLC"#)
        #expect(CompanyIdentifier.controlSolutions.description == #"Control Solutions LLC"#)
    
        // Heath Consultants Inc.
        #expect(CompanyIdentifier.heathConsultants.rawValue == 3138)
        #expect(CompanyIdentifier.heathConsultants.name == #"Heath Consultants Inc."#)
        #expect(CompanyIdentifier.heathConsultants.description == #"Heath Consultants Inc."#)
    
        // Berlinger & Co. AG
        #expect(CompanyIdentifier.berlinger.rawValue == 3139)
        #expect(CompanyIdentifier.berlinger.name == #"Berlinger & Co. AG"#)
        #expect(CompanyIdentifier.berlinger.description == #"Berlinger & Co. AG"#)
    
        // ONCELABS LLC
        #expect(CompanyIdentifier.oncelabs.rawValue == 3140)
        #expect(CompanyIdentifier.oncelabs.name == #"ONCELABS LLC"#)
        #expect(CompanyIdentifier.oncelabs.description == #"ONCELABS LLC"#)
    
        // Brose Verwaltung SE, Bamberg
        #expect(CompanyIdentifier.broseVerwaltungSeBamberg.rawValue == 3141)
        #expect(CompanyIdentifier.broseVerwaltungSeBamberg.name == #"Brose Verwaltung SE, Bamberg"#)
        #expect(CompanyIdentifier.broseVerwaltungSeBamberg.description == #"Brose Verwaltung SE, Bamberg"#)
    
        // Granwin IoT Technology (Guangzhou) Co.,Ltd
        #expect(CompanyIdentifier.granwinIotTechnologyGuangzhou.rawValue == 3142)
        #expect(CompanyIdentifier.granwinIotTechnologyGuangzhou.name == #"Granwin IoT Technology (Guangzhou) Co.,Ltd"#)
        #expect(CompanyIdentifier.granwinIotTechnologyGuangzhou.description == #"Granwin IoT Technology (Guangzhou) Co.,Ltd"#)
    
        // Epsilon Electronics,lnc
        #expect(CompanyIdentifier.epsilonElectronicsLnc.rawValue == 3143)
        #expect(CompanyIdentifier.epsilonElectronicsLnc.name == #"Epsilon Electronics,lnc"#)
        #expect(CompanyIdentifier.epsilonElectronicsLnc.description == #"Epsilon Electronics,lnc"#)
    
        // VALEO MANAGEMENT SERVICES
        #expect(CompanyIdentifier.valeoManagementServices.rawValue == 3144)
        #expect(CompanyIdentifier.valeoManagementServices.name == #"VALEO MANAGEMENT SERVICES"#)
        #expect(CompanyIdentifier.valeoManagementServices.description == #"VALEO MANAGEMENT SERVICES"#)
    
        // twopounds gmbh
        #expect(CompanyIdentifier.twopounds.rawValue == 3145)
        #expect(CompanyIdentifier.twopounds.name == #"twopounds gmbh"#)
        #expect(CompanyIdentifier.twopounds.description == #"twopounds gmbh"#)
    
        // atSpiro ApS
        #expect(CompanyIdentifier.atspiro.rawValue == 3146)
        #expect(CompanyIdentifier.atspiro.name == #"atSpiro ApS"#)
        #expect(CompanyIdentifier.atspiro.description == #"atSpiro ApS"#)
    
        // ADTRAN, Inc.
        #expect(CompanyIdentifier.adtran.rawValue == 3147)
        #expect(CompanyIdentifier.adtran.name == #"ADTRAN, Inc."#)
        #expect(CompanyIdentifier.adtran.description == #"ADTRAN, Inc."#)
    
        // Orpyx Medical Technologies Inc.
        #expect(CompanyIdentifier.orpyxMedicalTechnologies.rawValue == 3148)
        #expect(CompanyIdentifier.orpyxMedicalTechnologies.name == #"Orpyx Medical Technologies Inc."#)
        #expect(CompanyIdentifier.orpyxMedicalTechnologies.description == #"Orpyx Medical Technologies Inc."#)
    
        // Seekwave Technology Co.,ltd.
        #expect(CompanyIdentifier.seekwaveTechnology.rawValue == 3149)
        #expect(CompanyIdentifier.seekwaveTechnology.name == #"Seekwave Technology Co.,ltd."#)
        #expect(CompanyIdentifier.seekwaveTechnology.description == #"Seekwave Technology Co.,ltd."#)
    
        // Tactile Engineering, Inc.
        #expect(CompanyIdentifier.tactileEngineering.rawValue == 3150)
        #expect(CompanyIdentifier.tactileEngineering.name == #"Tactile Engineering, Inc."#)
        #expect(CompanyIdentifier.tactileEngineering.description == #"Tactile Engineering, Inc."#)
    
        // SharkNinja Operating LLC
        #expect(CompanyIdentifier.sharkninjaOperating.rawValue == 3151)
        #expect(CompanyIdentifier.sharkninjaOperating.name == #"SharkNinja Operating LLC"#)
        #expect(CompanyIdentifier.sharkninjaOperating.description == #"SharkNinja Operating LLC"#)
    
        // Imostar Technologies Inc.
        #expect(CompanyIdentifier.imostarTechnologies.rawValue == 3152)
        #expect(CompanyIdentifier.imostarTechnologies.name == #"Imostar Technologies Inc."#)
        #expect(CompanyIdentifier.imostarTechnologies.description == #"Imostar Technologies Inc."#)
    
        // INNOVA S.R.L.
        #expect(CompanyIdentifier.innova.rawValue == 3153)
        #expect(CompanyIdentifier.innova.name == #"INNOVA S.R.L."#)
        #expect(CompanyIdentifier.innova.description == #"INNOVA S.R.L."#)
    
        // ESCEA LIMITED
        #expect(CompanyIdentifier.escea.rawValue == 3154)
        #expect(CompanyIdentifier.escea.name == #"ESCEA LIMITED"#)
        #expect(CompanyIdentifier.escea.description == #"ESCEA LIMITED"#)
    
        // Taco, Inc.
        #expect(CompanyIdentifier.taco.rawValue == 3155)
        #expect(CompanyIdentifier.taco.name == #"Taco, Inc."#)
        #expect(CompanyIdentifier.taco.description == #"Taco, Inc."#)
    
        // HiViz Lighting, Inc.
        #expect(CompanyIdentifier.hivizLighting.rawValue == 3156)
        #expect(CompanyIdentifier.hivizLighting.name == #"HiViz Lighting, Inc."#)
        #expect(CompanyIdentifier.hivizLighting.description == #"HiViz Lighting, Inc."#)
    
        // Zintouch B.V.
        #expect(CompanyIdentifier.zintouch.rawValue == 3157)
        #expect(CompanyIdentifier.zintouch.name == #"Zintouch B.V."#)
        #expect(CompanyIdentifier.zintouch.description == #"Zintouch B.V."#)
    
        // Rheem Sales Company, Inc.
        #expect(CompanyIdentifier.rheemSales.rawValue == 3158)
        #expect(CompanyIdentifier.rheemSales.name == #"Rheem Sales Company, Inc."#)
        #expect(CompanyIdentifier.rheemSales.description == #"Rheem Sales Company, Inc."#)
    
        // UNEEG medical A/S
        #expect(CompanyIdentifier.uneegMedical.rawValue == 3159)
        #expect(CompanyIdentifier.uneegMedical.name == #"UNEEG medical A/S"#)
        #expect(CompanyIdentifier.uneegMedical.description == #"UNEEG medical A/S"#)
    
        // Hykso Inc.
        #expect(CompanyIdentifier.hykso.rawValue == 3160)
        #expect(CompanyIdentifier.hykso.name == #"Hykso Inc."#)
        #expect(CompanyIdentifier.hykso.description == #"Hykso Inc."#)
    
        // CYBERDYNE Inc.
        #expect(CompanyIdentifier.cyberdyne.rawValue == 3161)
        #expect(CompanyIdentifier.cyberdyne.name == #"CYBERDYNE Inc."#)
        #expect(CompanyIdentifier.cyberdyne.description == #"CYBERDYNE Inc."#)
    
        // Lockswitch Sdn Bhd
        #expect(CompanyIdentifier.lockswitch.rawValue == 3162)
        #expect(CompanyIdentifier.lockswitch.name == #"Lockswitch Sdn Bhd"#)
        #expect(CompanyIdentifier.lockswitch.description == #"Lockswitch Sdn Bhd"#)
    
        // Alban Giacomo S.P.A.
        #expect(CompanyIdentifier.albanGiacomo.rawValue == 3163)
        #expect(CompanyIdentifier.albanGiacomo.name == #"Alban Giacomo S.P.A."#)
        #expect(CompanyIdentifier.albanGiacomo.description == #"Alban Giacomo S.P.A."#)
    
        // MGM WIRELESSS HOLDINGS PTY LTD
        #expect(CompanyIdentifier.mgmWirelesssHoldings.rawValue == 3164)
        #expect(CompanyIdentifier.mgmWirelesssHoldings.name == #"MGM WIRELESSS HOLDINGS PTY LTD"#)
        #expect(CompanyIdentifier.mgmWirelesssHoldings.description == #"MGM WIRELESSS HOLDINGS PTY LTD"#)
    
        // StepUp Solutions ApS
        #expect(CompanyIdentifier.stepupSolutions.rawValue == 3165)
        #expect(CompanyIdentifier.stepupSolutions.name == #"StepUp Solutions ApS"#)
        #expect(CompanyIdentifier.stepupSolutions.description == #"StepUp Solutions ApS"#)
    
        // BlueID GmbH
        #expect(CompanyIdentifier.blueid.rawValue == 3166)
        #expect(CompanyIdentifier.blueid.name == #"BlueID GmbH"#)
        #expect(CompanyIdentifier.blueid.description == #"BlueID GmbH"#)
    
        // Wuxi Linkpower Microelectronics Co.,Ltd
        #expect(CompanyIdentifier.wuxiLinkpowerMicroelectronics.rawValue == 3167)
        #expect(CompanyIdentifier.wuxiLinkpowerMicroelectronics.name == #"Wuxi Linkpower Microelectronics Co.,Ltd"#)
        #expect(CompanyIdentifier.wuxiLinkpowerMicroelectronics.description == #"Wuxi Linkpower Microelectronics Co.,Ltd"#)
    
        // KEBA Energy Automation GmbH
        #expect(CompanyIdentifier.kebaEnergyAutomation.rawValue == 3168)
        #expect(CompanyIdentifier.kebaEnergyAutomation.name == #"KEBA Energy Automation GmbH"#)
        #expect(CompanyIdentifier.kebaEnergyAutomation.description == #"KEBA Energy Automation GmbH"#)
    
        // NNOXX, Inc
        #expect(CompanyIdentifier.nnoxx.rawValue == 3169)
        #expect(CompanyIdentifier.nnoxx.name == #"NNOXX, Inc"#)
        #expect(CompanyIdentifier.nnoxx.description == #"NNOXX, Inc"#)
    
        // Phiaton Corporation
        #expect(CompanyIdentifier.phiaton.rawValue == 3170)
        #expect(CompanyIdentifier.phiaton.name == #"Phiaton Corporation"#)
        #expect(CompanyIdentifier.phiaton.description == #"Phiaton Corporation"#)
    
        // phg Peter Hengstler GmbH + Co. KG
        #expect(CompanyIdentifier.phgPeterHengstlerKg.rawValue == 3171)
        #expect(CompanyIdentifier.phgPeterHengstlerKg.name == #"phg Peter Hengstler GmbH + Co. KG"#)
        #expect(CompanyIdentifier.phgPeterHengstlerKg.description == #"phg Peter Hengstler GmbH + Co. KG"#)
    
        // dormakaba Holding AG
        #expect(CompanyIdentifier.dormakabaHolding.rawValue == 3172)
        #expect(CompanyIdentifier.dormakabaHolding.name == #"dormakaba Holding AG"#)
        #expect(CompanyIdentifier.dormakabaHolding.description == #"dormakaba Holding AG"#)
    
        // WAKO CO,.LTD
        #expect(CompanyIdentifier.wakoCoLtd.rawValue == 3173)
        #expect(CompanyIdentifier.wakoCoLtd.name == #"WAKO CO,.LTD"#)
        #expect(CompanyIdentifier.wakoCoLtd.description == #"WAKO CO,.LTD"#)
    
        // DEN Smart Home B.V.
        #expect(CompanyIdentifier.denSmartHome.rawValue == 3174)
        #expect(CompanyIdentifier.denSmartHome.name == #"DEN Smart Home B.V."#)
        #expect(CompanyIdentifier.denSmartHome.description == #"DEN Smart Home B.V."#)
    
        // TRACKTING S.R.L.
        #expect(CompanyIdentifier.trackting.rawValue == 3175)
        #expect(CompanyIdentifier.trackting.name == #"TRACKTING S.R.L."#)
        #expect(CompanyIdentifier.trackting.description == #"TRACKTING S.R.L."#)
    
        // Emerja Corporation
        #expect(CompanyIdentifier.emerja.rawValue == 3176)
        #expect(CompanyIdentifier.emerja.name == #"Emerja Corporation"#)
        #expect(CompanyIdentifier.emerja.description == #"Emerja Corporation"#)
    
        // BLITZ electric motors. LTD
        #expect(CompanyIdentifier.blitzElectricMotors.rawValue == 3177)
        #expect(CompanyIdentifier.blitzElectricMotors.name == #"BLITZ electric motors. LTD"#)
        #expect(CompanyIdentifier.blitzElectricMotors.description == #"BLITZ electric motors. LTD"#)
    
        // CONSORCIO TRUST CONTROL - NETTEL
        #expect(CompanyIdentifier.consorcioTrustControlNettel.rawValue == 3178)
        #expect(CompanyIdentifier.consorcioTrustControlNettel.name == #"CONSORCIO TRUST CONTROL - NETTEL"#)
        #expect(CompanyIdentifier.consorcioTrustControlNettel.description == #"CONSORCIO TRUST CONTROL - NETTEL"#)
    
        // GILSON SAS
        #expect(CompanyIdentifier.gilsons.rawValue == 3179)
        #expect(CompanyIdentifier.gilsons.name == #"GILSON SAS"#)
        #expect(CompanyIdentifier.gilsons.description == #"GILSON SAS"#)
    
        // SNIFF LOGIC LTD
        #expect(CompanyIdentifier.sniffLogic.rawValue == 3180)
        #expect(CompanyIdentifier.sniffLogic.name == #"SNIFF LOGIC LTD"#)
        #expect(CompanyIdentifier.sniffLogic.description == #"SNIFF LOGIC LTD"#)
    
        // Fidure Corp.
        #expect(CompanyIdentifier.fidure.rawValue == 3181)
        #expect(CompanyIdentifier.fidure.name == #"Fidure Corp."#)
        #expect(CompanyIdentifier.fidure.description == #"Fidure Corp."#)
    
        // Sensa LLC
        #expect(CompanyIdentifier.sensa.rawValue == 3182)
        #expect(CompanyIdentifier.sensa.name == #"Sensa LLC"#)
        #expect(CompanyIdentifier.sensa.description == #"Sensa LLC"#)
    
        // Parakey AB
        #expect(CompanyIdentifier.parakey.rawValue == 3183)
        #expect(CompanyIdentifier.parakey.name == #"Parakey AB"#)
        #expect(CompanyIdentifier.parakey.description == #"Parakey AB"#)
    
        // SCARAB SOLUTIONS LTD
        #expect(CompanyIdentifier.scarabSolutions.rawValue == 3184)
        #expect(CompanyIdentifier.scarabSolutions.name == #"SCARAB SOLUTIONS LTD"#)
        #expect(CompanyIdentifier.scarabSolutions.description == #"SCARAB SOLUTIONS LTD"#)
    
        // BitGreen Technolabz (OPC) Private Limited
        #expect(CompanyIdentifier.bitgreenTechnolabzOpc.rawValue == 3185)
        #expect(CompanyIdentifier.bitgreenTechnolabzOpc.name == #"BitGreen Technolabz (OPC) Private Limited"#)
        #expect(CompanyIdentifier.bitgreenTechnolabzOpc.description == #"BitGreen Technolabz (OPC) Private Limited"#)
    
        // StreetCar ORV, LLC
        #expect(CompanyIdentifier.streetcarOrv.rawValue == 3186)
        #expect(CompanyIdentifier.streetcarOrv.name == #"StreetCar ORV, LLC"#)
        #expect(CompanyIdentifier.streetcarOrv.description == #"StreetCar ORV, LLC"#)
    
        // Truma Gerätetechnik GmbH & Co. KG
        #expect(CompanyIdentifier.trumaGeratetechnik.rawValue == 3187)
        #expect(CompanyIdentifier.trumaGeratetechnik.name == #"Truma Gerätetechnik GmbH & Co. KG"#)
        #expect(CompanyIdentifier.trumaGeratetechnik.description == #"Truma Gerätetechnik GmbH & Co. KG"#)
    
        // yupiteru
        #expect(CompanyIdentifier.yupiteru.rawValue == 3188)
        #expect(CompanyIdentifier.yupiteru.name == #"yupiteru"#)
        #expect(CompanyIdentifier.yupiteru.description == #"yupiteru"#)
    
        // Embedded Engineering Solutions LLC
        #expect(CompanyIdentifier.embeddedEngineeringSolutions.rawValue == 3189)
        #expect(CompanyIdentifier.embeddedEngineeringSolutions.name == #"Embedded Engineering Solutions LLC"#)
        #expect(CompanyIdentifier.embeddedEngineeringSolutions.description == #"Embedded Engineering Solutions LLC"#)
    
        // Shenzhen Gwell Times Technology Co. , Ltd
        #expect(CompanyIdentifier.shenzhenGwellTimesTechnology.rawValue == 3190)
        #expect(CompanyIdentifier.shenzhenGwellTimesTechnology.name == #"Shenzhen Gwell Times Technology Co. , Ltd"#)
        #expect(CompanyIdentifier.shenzhenGwellTimesTechnology.description == #"Shenzhen Gwell Times Technology Co. , Ltd"#)
    
        // TEAC Corporation
        #expect(CompanyIdentifier.teac.rawValue == 3191)
        #expect(CompanyIdentifier.teac.name == #"TEAC Corporation"#)
        #expect(CompanyIdentifier.teac.description == #"TEAC Corporation"#)
    
        // CHARGTRON IOT PRIVATE LIMITED
        #expect(CompanyIdentifier.chargtronIot.rawValue == 3192)
        #expect(CompanyIdentifier.chargtronIot.name == #"CHARGTRON IOT PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.chargtronIot.description == #"CHARGTRON IOT PRIVATE LIMITED"#)
    
        // Zhuhai Smartlink Technology Co., Ltd
        #expect(CompanyIdentifier.zhuhaiSmartlinkTechnology.rawValue == 3193)
        #expect(CompanyIdentifier.zhuhaiSmartlinkTechnology.name == #"Zhuhai Smartlink Technology Co., Ltd"#)
        #expect(CompanyIdentifier.zhuhaiSmartlinkTechnology.description == #"Zhuhai Smartlink Technology Co., Ltd"#)
    
        // Triductor Technology (Suzhou), Inc.
        #expect(CompanyIdentifier.triductorTechnologySuzhou.rawValue == 3194)
        #expect(CompanyIdentifier.triductorTechnologySuzhou.name == #"Triductor Technology (Suzhou), Inc."#)
        #expect(CompanyIdentifier.triductorTechnologySuzhou.description == #"Triductor Technology (Suzhou), Inc."#)
    
        // PT SADAMAYA GRAHA TEKNOLOGI
        #expect(CompanyIdentifier.ptdamayaGrahaTeknologi.rawValue == 3195)
        #expect(CompanyIdentifier.ptdamayaGrahaTeknologi.name == #"PT SADAMAYA GRAHA TEKNOLOGI"#)
        #expect(CompanyIdentifier.ptdamayaGrahaTeknologi.description == #"PT SADAMAYA GRAHA TEKNOLOGI"#)
    
        // Mopeka Products LLC
        #expect(CompanyIdentifier.mopekaProducts.rawValue == 3196)
        #expect(CompanyIdentifier.mopekaProducts.name == #"Mopeka Products LLC"#)
        #expect(CompanyIdentifier.mopekaProducts.description == #"Mopeka Products LLC"#)
    
        // 3ALogics, Inc.
        #expect(CompanyIdentifier.company3Alogics.rawValue == 3197)
        #expect(CompanyIdentifier.company3Alogics.name == #"3ALogics, Inc."#)
        #expect(CompanyIdentifier.company3Alogics.description == #"3ALogics, Inc."#)
    
        // BOOMING OF THINGS
        #expect(CompanyIdentifier.boomingOfThings.rawValue == 3198)
        #expect(CompanyIdentifier.boomingOfThings.name == #"BOOMING OF THINGS"#)
        #expect(CompanyIdentifier.boomingOfThings.description == #"BOOMING OF THINGS"#)
    
        // Rochester Sensors, LLC
        #expect(CompanyIdentifier.rochesterSensors.rawValue == 3199)
        #expect(CompanyIdentifier.rochesterSensors.name == #"Rochester Sensors, LLC"#)
        #expect(CompanyIdentifier.rochesterSensors.description == #"Rochester Sensors, LLC"#)
    
        // CARDIOID - TECHNOLOGIES, LDA
        #expect(CompanyIdentifier.cardioidTechnologiesLda.rawValue == 3200)
        #expect(CompanyIdentifier.cardioidTechnologiesLda.name == #"CARDIOID - TECHNOLOGIES, LDA"#)
        #expect(CompanyIdentifier.cardioidTechnologiesLda.description == #"CARDIOID - TECHNOLOGIES, LDA"#)
    
        // Carrier Corporation
        #expect(CompanyIdentifier.carrier.rawValue == 3201)
        #expect(CompanyIdentifier.carrier.name == #"Carrier Corporation"#)
        #expect(CompanyIdentifier.carrier.description == #"Carrier Corporation"#)
    
        // NACON
        #expect(CompanyIdentifier.nacon.rawValue == 3202)
        #expect(CompanyIdentifier.nacon.name == #"NACON"#)
        #expect(CompanyIdentifier.nacon.description == #"NACON"#)
    
        // Watchdog Systems LLC
        #expect(CompanyIdentifier.watchdogSystems.rawValue == 3203)
        #expect(CompanyIdentifier.watchdogSystems.name == #"Watchdog Systems LLC"#)
        #expect(CompanyIdentifier.watchdogSystems.description == #"Watchdog Systems LLC"#)
    
        // MAXON INDUSTRIES, INC.
        #expect(CompanyIdentifier.maxonIndustries.rawValue == 3204)
        #expect(CompanyIdentifier.maxonIndustries.name == #"MAXON INDUSTRIES, INC."#)
        #expect(CompanyIdentifier.maxonIndustries.description == #"MAXON INDUSTRIES, INC."#)
    
        // Amlogic, Inc.
        #expect(CompanyIdentifier.amlogic.rawValue == 3205)
        #expect(CompanyIdentifier.amlogic.name == #"Amlogic, Inc."#)
        #expect(CompanyIdentifier.amlogic.description == #"Amlogic, Inc."#)
    
        // Qingdao Eastsoft Communication Technology Co.,Ltd
        #expect(CompanyIdentifier.qingdaoEastsoftCommunicationTechnology.rawValue == 3206)
        #expect(CompanyIdentifier.qingdaoEastsoftCommunicationTechnology.name == #"Qingdao Eastsoft Communication Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.qingdaoEastsoftCommunicationTechnology.description == #"Qingdao Eastsoft Communication Technology Co.,Ltd"#)
    
        // Weltek Technologies Company Limited
        #expect(CompanyIdentifier.weltekTechnologies.rawValue == 3207)
        #expect(CompanyIdentifier.weltekTechnologies.name == #"Weltek Technologies Company Limited"#)
        #expect(CompanyIdentifier.weltekTechnologies.description == #"Weltek Technologies Company Limited"#)
    
        // Nextivity Inc.
        #expect(CompanyIdentifier.nextivity.rawValue == 3208)
        #expect(CompanyIdentifier.nextivity.name == #"Nextivity Inc."#)
        #expect(CompanyIdentifier.nextivity.description == #"Nextivity Inc."#)
    
        // AGZZX OPTOELECTRONICS TECHNOLOGY CO., LTD
        #expect(CompanyIdentifier.agzzxOptoelectronicsTechnology.rawValue == 3209)
        #expect(CompanyIdentifier.agzzxOptoelectronicsTechnology.name == #"AGZZX OPTOELECTRONICS TECHNOLOGY CO., LTD"#)
        #expect(CompanyIdentifier.agzzxOptoelectronicsTechnology.description == #"AGZZX OPTOELECTRONICS TECHNOLOGY CO., LTD"#)
    
        // A.GLOBAL co.,Ltd.
        #expect(CompanyIdentifier.aGlobal.rawValue == 3210)
        #expect(CompanyIdentifier.aGlobal.name == #"A.GLOBAL co.,Ltd."#)
        #expect(CompanyIdentifier.aGlobal.description == #"A.GLOBAL co.,Ltd."#)
    
        // Heavys Inc
        #expect(CompanyIdentifier.heavys.rawValue == 3211)
        #expect(CompanyIdentifier.heavys.name == #"Heavys Inc"#)
        #expect(CompanyIdentifier.heavys.description == #"Heavys Inc"#)
    
        // T-Mobile USA
        #expect(CompanyIdentifier.tMobileUsa.rawValue == 3212)
        #expect(CompanyIdentifier.tMobileUsa.name == #"T-Mobile USA"#)
        #expect(CompanyIdentifier.tMobileUsa.description == #"T-Mobile USA"#)
    
        // tonies GmbH
        #expect(CompanyIdentifier.tonies.rawValue == 3213)
        #expect(CompanyIdentifier.tonies.name == #"tonies GmbH"#)
        #expect(CompanyIdentifier.tonies.description == #"tonies GmbH"#)
    
        // Technocon Engineering Ltd.
        #expect(CompanyIdentifier.technoconEngineering.rawValue == 3214)
        #expect(CompanyIdentifier.technoconEngineering.name == #"Technocon Engineering Ltd."#)
        #expect(CompanyIdentifier.technoconEngineering.description == #"Technocon Engineering Ltd."#)
    
        // Radar Automobile Sales(Shandong)Co.,Ltd.
        #expect(CompanyIdentifier.radarAutomobileSalesShandong.rawValue == 3215)
        #expect(CompanyIdentifier.radarAutomobileSalesShandong.name == #"Radar Automobile Sales(Shandong)Co.,Ltd."#)
        #expect(CompanyIdentifier.radarAutomobileSalesShandong.description == #"Radar Automobile Sales(Shandong)Co.,Ltd."#)
    
        // WESCO AG
        #expect(CompanyIdentifier.wesco.rawValue == 3216)
        #expect(CompanyIdentifier.wesco.name == #"WESCO AG"#)
        #expect(CompanyIdentifier.wesco.description == #"WESCO AG"#)
    
        // Yashu Systems
        #expect(CompanyIdentifier.yashuSystems.rawValue == 3217)
        #expect(CompanyIdentifier.yashuSystems.name == #"Yashu Systems"#)
        #expect(CompanyIdentifier.yashuSystems.description == #"Yashu Systems"#)
    
        // Kesseböhmer Ergonomietechnik GmbH
        #expect(CompanyIdentifier.kessebohmerErgonomietechnik.rawValue == 3218)
        #expect(CompanyIdentifier.kessebohmerErgonomietechnik.name == #"Kesseböhmer Ergonomietechnik GmbH"#)
        #expect(CompanyIdentifier.kessebohmerErgonomietechnik.description == #"Kesseböhmer Ergonomietechnik GmbH"#)
    
        // Movesense Oy
        #expect(CompanyIdentifier.movesense.rawValue == 3219)
        #expect(CompanyIdentifier.movesense.name == #"Movesense Oy"#)
        #expect(CompanyIdentifier.movesense.description == #"Movesense Oy"#)
    
        // Baxter Healthcare Corporation
        #expect(CompanyIdentifier.baxterHealthcare.rawValue == 3220)
        #expect(CompanyIdentifier.baxterHealthcare.name == #"Baxter Healthcare Corporation"#)
        #expect(CompanyIdentifier.baxterHealthcare.description == #"Baxter Healthcare Corporation"#)
    
        // Gemstone Lights Canada Ltd.
        #expect(CompanyIdentifier.gemstoneLightsCanada.rawValue == 3221)
        #expect(CompanyIdentifier.gemstoneLightsCanada.name == #"Gemstone Lights Canada Ltd."#)
        #expect(CompanyIdentifier.gemstoneLightsCanada.description == #"Gemstone Lights Canada Ltd."#)
    
        // H+B Hightech GmbH
        #expect(CompanyIdentifier.hBHightech.rawValue == 3222)
        #expect(CompanyIdentifier.hBHightech.name == #"H+B Hightech GmbH"#)
        #expect(CompanyIdentifier.hBHightech.description == #"H+B Hightech GmbH"#)
    
        // Deako
        #expect(CompanyIdentifier.deako.rawValue == 3223)
        #expect(CompanyIdentifier.deako.name == #"Deako"#)
        #expect(CompanyIdentifier.deako.description == #"Deako"#)
    
        // MiX Telematics International (PTY) LTD
        #expect(CompanyIdentifier.mixTelematicsInternationalPty.rawValue == 3224)
        #expect(CompanyIdentifier.mixTelematicsInternationalPty.name == #"MiX Telematics International (PTY) LTD"#)
        #expect(CompanyIdentifier.mixTelematicsInternationalPty.description == #"MiX Telematics International (PTY) LTD"#)
    
        // Vire Health Oy
        #expect(CompanyIdentifier.vireHealth.rawValue == 3225)
        #expect(CompanyIdentifier.vireHealth.name == #"Vire Health Oy"#)
        #expect(CompanyIdentifier.vireHealth.description == #"Vire Health Oy"#)
    
        // ALF Inc.
        #expect(CompanyIdentifier.alf.rawValue == 3226)
        #expect(CompanyIdentifier.alf.name == #"ALF Inc."#)
        #expect(CompanyIdentifier.alf.description == #"ALF Inc."#)
    
        // NTT sonority, Inc.
        #expect(CompanyIdentifier.nttSonority.rawValue == 3227)
        #expect(CompanyIdentifier.nttSonority.name == #"NTT sonority, Inc."#)
        #expect(CompanyIdentifier.nttSonority.description == #"NTT sonority, Inc."#)
    
        // Sunstone-RTLS Ipari Szolgaltato Korlatolt Felelossegu Tarsasag
        #expect(CompanyIdentifier.sunstoneRtlsIpariSzolgaltatoKorlatoltFelelosseguTarsasag.rawValue == 3228)
        #expect(CompanyIdentifier.sunstoneRtlsIpariSzolgaltatoKorlatoltFelelosseguTarsasag.name == #"Sunstone-RTLS Ipari Szolgaltato Korlatolt Felelossegu Tarsasag"#)
        #expect(CompanyIdentifier.sunstoneRtlsIpariSzolgaltatoKorlatoltFelelosseguTarsasag.description == #"Sunstone-RTLS Ipari Szolgaltato Korlatolt Felelossegu Tarsasag"#)
    
        // Ribbiot, INC.
        #expect(CompanyIdentifier.ribbiot.rawValue == 3229)
        #expect(CompanyIdentifier.ribbiot.name == #"Ribbiot, INC."#)
        #expect(CompanyIdentifier.ribbiot.description == #"Ribbiot, INC."#)
    
        // ECCEL CORPORATION SAS
        #expect(CompanyIdentifier.eccels.rawValue == 3230)
        #expect(CompanyIdentifier.eccels.name == #"ECCEL CORPORATION SAS"#)
        #expect(CompanyIdentifier.eccels.description == #"ECCEL CORPORATION SAS"#)
    
        // Dragonfly Energy Corp.
        #expect(CompanyIdentifier.dragonflyEnergy.rawValue == 3231)
        #expect(CompanyIdentifier.dragonflyEnergy.name == #"Dragonfly Energy Corp."#)
        #expect(CompanyIdentifier.dragonflyEnergy.description == #"Dragonfly Energy Corp."#)
    
        // BIGBEN
        #expect(CompanyIdentifier.bigben.rawValue == 3232)
        #expect(CompanyIdentifier.bigben.name == #"BIGBEN"#)
        #expect(CompanyIdentifier.bigben.description == #"BIGBEN"#)
    
        // YAMAHA MOTOR CO.,LTD.
        #expect(CompanyIdentifier.yamahaMotor.rawValue == 3233)
        #expect(CompanyIdentifier.yamahaMotor.name == #"YAMAHA MOTOR CO.,LTD."#)
        #expect(CompanyIdentifier.yamahaMotor.description == #"YAMAHA MOTOR CO.,LTD."#)
    
        // XSENSE LTD
        #expect(CompanyIdentifier.xsense.rawValue == 3234)
        #expect(CompanyIdentifier.xsense.name == #"XSENSE LTD"#)
        #expect(CompanyIdentifier.xsense.description == #"XSENSE LTD"#)
    
        // MAQUET GmbH
        #expect(CompanyIdentifier.maquet.rawValue == 3235)
        #expect(CompanyIdentifier.maquet.name == #"MAQUET GmbH"#)
        #expect(CompanyIdentifier.maquet.description == #"MAQUET GmbH"#)
    
        // MITSUBISHI ELECTRIC LIGHTING CO, LTD
        #expect(CompanyIdentifier.mitsubishiElectricLighting.rawValue == 3236)
        #expect(CompanyIdentifier.mitsubishiElectricLighting.name == #"MITSUBISHI ELECTRIC LIGHTING CO, LTD"#)
        #expect(CompanyIdentifier.mitsubishiElectricLighting.description == #"MITSUBISHI ELECTRIC LIGHTING CO, LTD"#)
    
        // Princess Cruise Lines, Ltd.
        #expect(CompanyIdentifier.princessCruiseLines.rawValue == 3237)
        #expect(CompanyIdentifier.princessCruiseLines.name == #"Princess Cruise Lines, Ltd."#)
        #expect(CompanyIdentifier.princessCruiseLines.description == #"Princess Cruise Lines, Ltd."#)
    
        // Megger Ltd
        #expect(CompanyIdentifier.megger.rawValue == 3238)
        #expect(CompanyIdentifier.megger.name == #"Megger Ltd"#)
        #expect(CompanyIdentifier.megger.description == #"Megger Ltd"#)
    
        // Verve InfoTec Pty Ltd
        #expect(CompanyIdentifier.verveInfotec.rawValue == 3239)
        #expect(CompanyIdentifier.verveInfotec.name == #"Verve InfoTec Pty Ltd"#)
        #expect(CompanyIdentifier.verveInfotec.description == #"Verve InfoTec Pty Ltd"#)
    
        // Sonas, Inc.
        #expect(CompanyIdentifier.sonas.rawValue == 3240)
        #expect(CompanyIdentifier.sonas.name == #"Sonas, Inc."#)
        #expect(CompanyIdentifier.sonas.description == #"Sonas, Inc."#)
    
        // Mievo Technologies Private Limited
        #expect(CompanyIdentifier.mievoTechnologies.rawValue == 3241)
        #expect(CompanyIdentifier.mievoTechnologies.name == #"Mievo Technologies Private Limited"#)
        #expect(CompanyIdentifier.mievoTechnologies.description == #"Mievo Technologies Private Limited"#)
    
        // Shenzhen Poseidon Network Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenPoseidonNetworkTechnology.rawValue == 3242)
        #expect(CompanyIdentifier.shenzhenPoseidonNetworkTechnology.name == #"Shenzhen Poseidon Network Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenPoseidonNetworkTechnology.description == #"Shenzhen Poseidon Network Technology Co., Ltd"#)
    
        // HERUTU ELECTRONICS CORPORATION
        #expect(CompanyIdentifier.herutuElectronics.rawValue == 3243)
        #expect(CompanyIdentifier.herutuElectronics.name == #"HERUTU ELECTRONICS CORPORATION"#)
        #expect(CompanyIdentifier.herutuElectronics.description == #"HERUTU ELECTRONICS CORPORATION"#)
    
        // Shenzhen Shokz Co.,Ltd.
        #expect(CompanyIdentifier.shenzhenShokz.rawValue == 3244)
        #expect(CompanyIdentifier.shenzhenShokz.name == #"Shenzhen Shokz Co.,Ltd."#)
        #expect(CompanyIdentifier.shenzhenShokz.description == #"Shenzhen Shokz Co.,Ltd."#)
    
        // Shenzhen Openhearing Tech CO., LTD .
        #expect(CompanyIdentifier.shenzhenOpenhearingTech.rawValue == 3245)
        #expect(CompanyIdentifier.shenzhenOpenhearingTech.name == #"Shenzhen Openhearing Tech CO., LTD ."#)
        #expect(CompanyIdentifier.shenzhenOpenhearingTech.description == #"Shenzhen Openhearing Tech CO., LTD ."#)
    
        // Evident Corporation
        #expect(CompanyIdentifier.evident.rawValue == 3246)
        #expect(CompanyIdentifier.evident.name == #"Evident Corporation"#)
        #expect(CompanyIdentifier.evident.description == #"Evident Corporation"#)
    
        // NEURINNOV
        #expect(CompanyIdentifier.neurinnov.rawValue == 3247)
        #expect(CompanyIdentifier.neurinnov.name == #"NEURINNOV"#)
        #expect(CompanyIdentifier.neurinnov.description == #"NEURINNOV"#)
    
        // SwipeSense, Inc.
        #expect(CompanyIdentifier.swipesense.rawValue == 3248)
        #expect(CompanyIdentifier.swipesense.name == #"SwipeSense, Inc."#)
        #expect(CompanyIdentifier.swipesense.description == #"SwipeSense, Inc."#)
    
        // RF Creations
        #expect(CompanyIdentifier.rfCreations.rawValue == 3249)
        #expect(CompanyIdentifier.rfCreations.name == #"RF Creations"#)
        #expect(CompanyIdentifier.rfCreations.description == #"RF Creations"#)
    
        // SHINKAWA Sensor Technology, Inc.
        #expect(CompanyIdentifier.shinkawaSensorTechnology.rawValue == 3250)
        #expect(CompanyIdentifier.shinkawaSensorTechnology.name == #"SHINKAWA Sensor Technology, Inc."#)
        #expect(CompanyIdentifier.shinkawaSensorTechnology.description == #"SHINKAWA Sensor Technology, Inc."#)
    
        // janova GmbH
        #expect(CompanyIdentifier.janova.rawValue == 3251)
        #expect(CompanyIdentifier.janova.name == #"janova GmbH"#)
        #expect(CompanyIdentifier.janova.description == #"janova GmbH"#)
    
        // Eberspaecher Climate Control Systems GmbH
        #expect(CompanyIdentifier.eberspaecherClimateControlSystems.rawValue == 3252)
        #expect(CompanyIdentifier.eberspaecherClimateControlSystems.name == #"Eberspaecher Climate Control Systems GmbH"#)
        #expect(CompanyIdentifier.eberspaecherClimateControlSystems.description == #"Eberspaecher Climate Control Systems GmbH"#)
    
        // Racketry, d. o. o.
        #expect(CompanyIdentifier.racketryDOO.rawValue == 3253)
        #expect(CompanyIdentifier.racketryDOO.name == #"Racketry, d. o. o."#)
        #expect(CompanyIdentifier.racketryDOO.description == #"Racketry, d. o. o."#)
    
        // THE EELECTRIC MACARON LLC
        #expect(CompanyIdentifier.eelectricMacaron.rawValue == 3254)
        #expect(CompanyIdentifier.eelectricMacaron.name == #"THE EELECTRIC MACARON LLC"#)
        #expect(CompanyIdentifier.eelectricMacaron.description == #"THE EELECTRIC MACARON LLC"#)
    
        // Cucumber Lighting Controls Limited
        #expect(CompanyIdentifier.cucumberLightingControls.rawValue == 3255)
        #expect(CompanyIdentifier.cucumberLightingControls.name == #"Cucumber Lighting Controls Limited"#)
        #expect(CompanyIdentifier.cucumberLightingControls.description == #"Cucumber Lighting Controls Limited"#)
    
        // Shanghai Proxy Network Technology Co., Ltd.
        #expect(CompanyIdentifier.shanghaiProxyNetworkTechnology.rawValue == 3256)
        #expect(CompanyIdentifier.shanghaiProxyNetworkTechnology.name == #"Shanghai Proxy Network Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shanghaiProxyNetworkTechnology.description == #"Shanghai Proxy Network Technology Co., Ltd."#)
    
        // seca GmbH & Co. KG
        #expect(CompanyIdentifier.seca.rawValue == 3257)
        #expect(CompanyIdentifier.seca.name == #"seca GmbH & Co. KG"#)
        #expect(CompanyIdentifier.seca.description == #"seca GmbH & Co. KG"#)
    
        // Ameso Tech (OPC) Private Limited
        #expect(CompanyIdentifier.amesoTechOpc.rawValue == 3258)
        #expect(CompanyIdentifier.amesoTechOpc.name == #"Ameso Tech (OPC) Private Limited"#)
        #expect(CompanyIdentifier.amesoTechOpc.description == #"Ameso Tech (OPC) Private Limited"#)
    
        // Emlid Tech Kft.
        #expect(CompanyIdentifier.emlidTech.rawValue == 3259)
        #expect(CompanyIdentifier.emlidTech.name == #"Emlid Tech Kft."#)
        #expect(CompanyIdentifier.emlidTech.description == #"Emlid Tech Kft."#)
    
        // TROX GmbH
        #expect(CompanyIdentifier.trox.rawValue == 3260)
        #expect(CompanyIdentifier.trox.name == #"TROX GmbH"#)
        #expect(CompanyIdentifier.trox.description == #"TROX GmbH"#)
    
        // Pricer AB
        #expect(CompanyIdentifier.pricer.rawValue == 3261)
        #expect(CompanyIdentifier.pricer.name == #"Pricer AB"#)
        #expect(CompanyIdentifier.pricer.description == #"Pricer AB"#)
    
        // Forward Thinking Systems LLC.
        #expect(CompanyIdentifier.forwardThinkingSystems.rawValue == 3263)
        #expect(CompanyIdentifier.forwardThinkingSystems.name == #"Forward Thinking Systems LLC."#)
        #expect(CompanyIdentifier.forwardThinkingSystems.description == #"Forward Thinking Systems LLC."#)
    
        // Garnet Instruments Ltd.
        #expect(CompanyIdentifier.garnetInstruments.rawValue == 3264)
        #expect(CompanyIdentifier.garnetInstruments.name == #"Garnet Instruments Ltd."#)
        #expect(CompanyIdentifier.garnetInstruments.description == #"Garnet Instruments Ltd."#)
    
        // CLEIO Inc.
        #expect(CompanyIdentifier.cleio.rawValue == 3265)
        #expect(CompanyIdentifier.cleio.name == #"CLEIO Inc."#)
        #expect(CompanyIdentifier.cleio.description == #"CLEIO Inc."#)
    
        // Anker Innovations Limited
        #expect(CompanyIdentifier.ankerInnovations.rawValue == 3266)
        #expect(CompanyIdentifier.ankerInnovations.name == #"Anker Innovations Limited"#)
        #expect(CompanyIdentifier.ankerInnovations.description == #"Anker Innovations Limited"#)
    
        // HMD Global Oy
        #expect(CompanyIdentifier.hmdGlobal.rawValue == 3267)
        #expect(CompanyIdentifier.hmdGlobal.name == #"HMD Global Oy"#)
        #expect(CompanyIdentifier.hmdGlobal.description == #"HMD Global Oy"#)
    
        // ABUS August Bremicker Soehne Kommanditgesellschaft
        #expect(CompanyIdentifier.abusAugustBremickerSoehneKommanditgesellschaft.rawValue == 3268)
        #expect(CompanyIdentifier.abusAugustBremickerSoehneKommanditgesellschaft.name == #"ABUS August Bremicker Soehne Kommanditgesellschaft"#)
        #expect(CompanyIdentifier.abusAugustBremickerSoehneKommanditgesellschaft.description == #"ABUS August Bremicker Soehne Kommanditgesellschaft"#)
    
        // Open Road Solutions, Inc.
        #expect(CompanyIdentifier.openRoadSolutions.rawValue == 3269)
        #expect(CompanyIdentifier.openRoadSolutions.name == #"Open Road Solutions, Inc."#)
        #expect(CompanyIdentifier.openRoadSolutions.description == #"Open Road Solutions, Inc."#)
    
        // Serial Technology Corporation
        #expect(CompanyIdentifier.serialTechnology.rawValue == 3270)
        #expect(CompanyIdentifier.serialTechnology.name == #"Serial Technology Corporation"#)
        #expect(CompanyIdentifier.serialTechnology.description == #"Serial Technology Corporation"#)
    
        // SB C&S Corp.
        #expect(CompanyIdentifier.sbCS.rawValue == 3271)
        #expect(CompanyIdentifier.sbCS.name == #"SB C&S Corp."#)
        #expect(CompanyIdentifier.sbCS.description == #"SB C&S Corp."#)
    
        // TrikThom
        #expect(CompanyIdentifier.trikthom.rawValue == 3272)
        #expect(CompanyIdentifier.trikthom.name == #"TrikThom"#)
        #expect(CompanyIdentifier.trikthom.description == #"TrikThom"#)
    
        // Innocent Technology Co., Ltd.
        #expect(CompanyIdentifier.innocentTechnology.rawValue == 3273)
        #expect(CompanyIdentifier.innocentTechnology.name == #"Innocent Technology Co., Ltd."#)
        #expect(CompanyIdentifier.innocentTechnology.description == #"Innocent Technology Co., Ltd."#)
    
        // Cyclops Marine Ltd
        #expect(CompanyIdentifier.cyclopsMarine.rawValue == 3274)
        #expect(CompanyIdentifier.cyclopsMarine.name == #"Cyclops Marine Ltd"#)
        #expect(CompanyIdentifier.cyclopsMarine.description == #"Cyclops Marine Ltd"#)
    
        // NOTHING TECHNOLOGY LIMITED
        #expect(CompanyIdentifier.nothingTechnology.rawValue == 3275)
        #expect(CompanyIdentifier.nothingTechnology.name == #"NOTHING TECHNOLOGY LIMITED"#)
        #expect(CompanyIdentifier.nothingTechnology.description == #"NOTHING TECHNOLOGY LIMITED"#)
    
        // Kord Defence Pty Ltd
        #expect(CompanyIdentifier.kordDefence.rawValue == 3276)
        #expect(CompanyIdentifier.kordDefence.name == #"Kord Defence Pty Ltd"#)
        #expect(CompanyIdentifier.kordDefence.description == #"Kord Defence Pty Ltd"#)
    
        // YanFeng Visteon(Chongqing) Automotive Electronic Co.,Ltd
        #expect(CompanyIdentifier.yanfengVisteonChongqingAutomotiveElectronic.rawValue == 3277)
        #expect(CompanyIdentifier.yanfengVisteonChongqingAutomotiveElectronic.name == #"YanFeng Visteon(Chongqing) Automotive Electronic Co.,Ltd"#)
        #expect(CompanyIdentifier.yanfengVisteonChongqingAutomotiveElectronic.description == #"YanFeng Visteon(Chongqing) Automotive Electronic Co.,Ltd"#)
    
        // SENOSPACE LLC
        #expect(CompanyIdentifier.senospace.rawValue == 3278)
        #expect(CompanyIdentifier.senospace.name == #"SENOSPACE LLC"#)
        #expect(CompanyIdentifier.senospace.description == #"SENOSPACE LLC"#)
    
        // Shenzhen CESI Information Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenCesiInformationTechnology.rawValue == 3279)
        #expect(CompanyIdentifier.shenzhenCesiInformationTechnology.name == #"Shenzhen CESI Information Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenCesiInformationTechnology.description == #"Shenzhen CESI Information Technology Co., Ltd."#)
    
        // MooreSilicon Semiconductor Technology (Shanghai) Co., LTD.
        #expect(CompanyIdentifier.mooresiliconSemiconductorTechnologyShanghai.rawValue == 3280)
        #expect(CompanyIdentifier.mooresiliconSemiconductorTechnologyShanghai.name == #"MooreSilicon Semiconductor Technology (Shanghai) Co., LTD."#)
        #expect(CompanyIdentifier.mooresiliconSemiconductorTechnologyShanghai.description == #"MooreSilicon Semiconductor Technology (Shanghai) Co., LTD."#)
    
        // Imagine Marketing Limited
        #expect(CompanyIdentifier.imagineMarketing.rawValue == 3281)
        #expect(CompanyIdentifier.imagineMarketing.name == #"Imagine Marketing Limited"#)
        #expect(CompanyIdentifier.imagineMarketing.description == #"Imagine Marketing Limited"#)
    
        // EQOM SSC B.V.
        #expect(CompanyIdentifier.eqomSsc.rawValue == 3282)
        #expect(CompanyIdentifier.eqomSsc.name == #"EQOM SSC B.V."#)
        #expect(CompanyIdentifier.eqomSsc.description == #"EQOM SSC B.V."#)
    
        // TechSwipe
        #expect(CompanyIdentifier.techswipe.rawValue == 3283)
        #expect(CompanyIdentifier.techswipe.name == #"TechSwipe"#)
        #expect(CompanyIdentifier.techswipe.description == #"TechSwipe"#)
    
        // Reoqoo IoT Technology Co., Ltd.
        #expect(CompanyIdentifier.reoqooIotTechnology.rawValue == 3284)
        #expect(CompanyIdentifier.reoqooIotTechnology.name == #"Reoqoo IoT Technology Co., Ltd."#)
        #expect(CompanyIdentifier.reoqooIotTechnology.description == #"Reoqoo IoT Technology Co., Ltd."#)
    
        // Numa Products, LLC
        #expect(CompanyIdentifier.numaProducts.rawValue == 3285)
        #expect(CompanyIdentifier.numaProducts.name == #"Numa Products, LLC"#)
        #expect(CompanyIdentifier.numaProducts.description == #"Numa Products, LLC"#)
    
        // HHO (Hangzhou) Digital Technology Co., Ltd.
        #expect(CompanyIdentifier.hhoHangzhouDigitalTechnology.rawValue == 3286)
        #expect(CompanyIdentifier.hhoHangzhouDigitalTechnology.name == #"HHO (Hangzhou) Digital Technology Co., Ltd."#)
        #expect(CompanyIdentifier.hhoHangzhouDigitalTechnology.description == #"HHO (Hangzhou) Digital Technology Co., Ltd."#)
    
        // Maztech Industries, LLC
        #expect(CompanyIdentifier.maztechIndustries.rawValue == 3287)
        #expect(CompanyIdentifier.maztechIndustries.name == #"Maztech Industries, LLC"#)
        #expect(CompanyIdentifier.maztechIndustries.description == #"Maztech Industries, LLC"#)
    
        // SIA Mesh Group
        #expect(CompanyIdentifier.siaMeshGroup.rawValue == 3288)
        #expect(CompanyIdentifier.siaMeshGroup.name == #"SIA Mesh Group"#)
        #expect(CompanyIdentifier.siaMeshGroup.description == #"SIA Mesh Group"#)
    
        // Minami acoustics Limited
        #expect(CompanyIdentifier.minamiAcoustics.rawValue == 3289)
        #expect(CompanyIdentifier.minamiAcoustics.name == #"Minami acoustics Limited"#)
        #expect(CompanyIdentifier.minamiAcoustics.description == #"Minami acoustics Limited"#)
    
        // Wolf Steel ltd
        #expect(CompanyIdentifier.wolfSteel.rawValue == 3290)
        #expect(CompanyIdentifier.wolfSteel.name == #"Wolf Steel ltd"#)
        #expect(CompanyIdentifier.wolfSteel.description == #"Wolf Steel ltd"#)
    
        // Circus World Displays Limited
        #expect(CompanyIdentifier.circusWorldDisplays.rawValue == 3291)
        #expect(CompanyIdentifier.circusWorldDisplays.name == #"Circus World Displays Limited"#)
        #expect(CompanyIdentifier.circusWorldDisplays.description == #"Circus World Displays Limited"#)
    
        // Ypsomed AG
        #expect(CompanyIdentifier.ypsomed.rawValue == 3292)
        #expect(CompanyIdentifier.ypsomed.name == #"Ypsomed AG"#)
        #expect(CompanyIdentifier.ypsomed.description == #"Ypsomed AG"#)
    
        // Alif Semiconductor, Inc.
        #expect(CompanyIdentifier.alifSemiconductor.rawValue == 3293)
        #expect(CompanyIdentifier.alifSemiconductor.name == #"Alif Semiconductor, Inc."#)
        #expect(CompanyIdentifier.alifSemiconductor.description == #"Alif Semiconductor, Inc."#)
    
        // RESPONSE TECHNOLOGIES, LTD.
        #expect(CompanyIdentifier.responseTechnologies.rawValue == 3294)
        #expect(CompanyIdentifier.responseTechnologies.name == #"RESPONSE TECHNOLOGIES, LTD."#)
        #expect(CompanyIdentifier.responseTechnologies.description == #"RESPONSE TECHNOLOGIES, LTD."#)
    
        // SHENZHEN CHENYUN ELECTRONICS  CO., LTD
        #expect(CompanyIdentifier.shenzhenChenyunElectronics.rawValue == 3295)
        #expect(CompanyIdentifier.shenzhenChenyunElectronics.name == #"SHENZHEN CHENYUN ELECTRONICS  CO., LTD"#)
        #expect(CompanyIdentifier.shenzhenChenyunElectronics.description == #"SHENZHEN CHENYUN ELECTRONICS  CO., LTD"#)
    
        // VODALOGIC PTY LTD
        #expect(CompanyIdentifier.vodalogic.rawValue == 3296)
        #expect(CompanyIdentifier.vodalogic.name == #"VODALOGIC PTY LTD"#)
        #expect(CompanyIdentifier.vodalogic.description == #"VODALOGIC PTY LTD"#)
    
        // Regal Beloit America, Inc.
        #expect(CompanyIdentifier.regalBeloitAmerica.rawValue == 3297)
        #expect(CompanyIdentifier.regalBeloitAmerica.name == #"Regal Beloit America, Inc."#)
        #expect(CompanyIdentifier.regalBeloitAmerica.description == #"Regal Beloit America, Inc."#)
    
        // CORVENT MEDICAL, INC.
        #expect(CompanyIdentifier.corventMedical.rawValue == 3298)
        #expect(CompanyIdentifier.corventMedical.name == #"CORVENT MEDICAL, INC."#)
        #expect(CompanyIdentifier.corventMedical.description == #"CORVENT MEDICAL, INC."#)
    
        // Taiwan Fuhsing
        #expect(CompanyIdentifier.taiwanFuhsing.rawValue == 3299)
        #expect(CompanyIdentifier.taiwanFuhsing.name == #"Taiwan Fuhsing"#)
        #expect(CompanyIdentifier.taiwanFuhsing.description == #"Taiwan Fuhsing"#)
    
        // Off-Highway Powertrain Services Germany GmbH
        #expect(CompanyIdentifier.offHighwayPowertrainServicesGermany.rawValue == 3300)
        #expect(CompanyIdentifier.offHighwayPowertrainServicesGermany.name == #"Off-Highway Powertrain Services Germany GmbH"#)
        #expect(CompanyIdentifier.offHighwayPowertrainServicesGermany.description == #"Off-Highway Powertrain Services Germany GmbH"#)
    
        // Amina Distribution AS
        #expect(CompanyIdentifier.aminaDistribution.rawValue == 3301)
        #expect(CompanyIdentifier.aminaDistribution.name == #"Amina Distribution AS"#)
        #expect(CompanyIdentifier.aminaDistribution.description == #"Amina Distribution AS"#)
    
        // McWong International, Inc.
        #expect(CompanyIdentifier.mcwongInternational.rawValue == 3302)
        #expect(CompanyIdentifier.mcwongInternational.name == #"McWong International, Inc."#)
        #expect(CompanyIdentifier.mcwongInternational.description == #"McWong International, Inc."#)
    
        // TAG HEUER SA
        #expect(CompanyIdentifier.tagHeuer.rawValue == 3303)
        #expect(CompanyIdentifier.tagHeuer.name == #"TAG HEUER SA"#)
        #expect(CompanyIdentifier.tagHeuer.description == #"TAG HEUER SA"#)
    
        // Dongguan Yougo Electronics Co.,Ltd.
        #expect(CompanyIdentifier.dongguanYougoElectronics.rawValue == 3304)
        #expect(CompanyIdentifier.dongguanYougoElectronics.name == #"Dongguan Yougo Electronics Co.,Ltd."#)
        #expect(CompanyIdentifier.dongguanYougoElectronics.description == #"Dongguan Yougo Electronics Co.,Ltd."#)
    
        // PEAG, LLC dba JLab Audio
        #expect(CompanyIdentifier.peagDbaJlabAudio.rawValue == 3305)
        #expect(CompanyIdentifier.peagDbaJlabAudio.name == #"PEAG, LLC dba JLab Audio"#)
        #expect(CompanyIdentifier.peagDbaJlabAudio.description == #"PEAG, LLC dba JLab Audio"#)
    
        // HAYWARD INDUSTRIES, INC.
        #expect(CompanyIdentifier.haywardIndustries.rawValue == 3306)
        #expect(CompanyIdentifier.haywardIndustries.name == #"HAYWARD INDUSTRIES, INC."#)
        #expect(CompanyIdentifier.haywardIndustries.description == #"HAYWARD INDUSTRIES, INC."#)
    
        // Shenzhen Tingting Technology Co. LTD
        #expect(CompanyIdentifier.shenzhenTingtingTechnology.rawValue == 3307)
        #expect(CompanyIdentifier.shenzhenTingtingTechnology.name == #"Shenzhen Tingting Technology Co. LTD"#)
        #expect(CompanyIdentifier.shenzhenTingtingTechnology.description == #"Shenzhen Tingting Technology Co. LTD"#)
    
        // Pacific Coast Fishery Services (2003) Inc.
        #expect(CompanyIdentifier.pacificCoastFisheryServices2003.rawValue == 3308)
        #expect(CompanyIdentifier.pacificCoastFisheryServices2003.name == #"Pacific Coast Fishery Services (2003) Inc."#)
        #expect(CompanyIdentifier.pacificCoastFisheryServices2003.description == #"Pacific Coast Fishery Services (2003) Inc."#)
    
        // CV. NURI TEKNIK
        #expect(CompanyIdentifier.cvNuriTeknik.rawValue == 3309)
        #expect(CompanyIdentifier.cvNuriTeknik.name == #"CV. NURI TEKNIK"#)
        #expect(CompanyIdentifier.cvNuriTeknik.description == #"CV. NURI TEKNIK"#)
    
        // MadgeTech, Inc
        #expect(CompanyIdentifier.madgetech.rawValue == 3310)
        #expect(CompanyIdentifier.madgetech.name == #"MadgeTech, Inc"#)
        #expect(CompanyIdentifier.madgetech.description == #"MadgeTech, Inc"#)
    
        // POGS B.V.
        #expect(CompanyIdentifier.pogs.rawValue == 3311)
        #expect(CompanyIdentifier.pogs.name == #"POGS B.V."#)
        #expect(CompanyIdentifier.pogs.description == #"POGS B.V."#)
    
        // THOTAKA TEKHNOLOGIES INDIA PRIVATE LIMITED
        #expect(CompanyIdentifier.thotakaTekhnologiesIndia.rawValue == 3312)
        #expect(CompanyIdentifier.thotakaTekhnologiesIndia.name == #"THOTAKA TEKHNOLOGIES INDIA PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.thotakaTekhnologiesIndia.description == #"THOTAKA TEKHNOLOGIES INDIA PRIVATE LIMITED"#)
    
        // Midmark
        #expect(CompanyIdentifier.midmark.rawValue == 3313)
        #expect(CompanyIdentifier.midmark.name == #"Midmark"#)
        #expect(CompanyIdentifier.midmark.description == #"Midmark"#)
    
        // BestSens AG
        #expect(CompanyIdentifier.bestsens.rawValue == 3314)
        #expect(CompanyIdentifier.bestsens.name == #"BestSens AG"#)
        #expect(CompanyIdentifier.bestsens.description == #"BestSens AG"#)
    
        // Radio Sound
        #expect(CompanyIdentifier.radioSound.rawValue == 3315)
        #expect(CompanyIdentifier.radioSound.name == #"Radio Sound"#)
        #expect(CompanyIdentifier.radioSound.description == #"Radio Sound"#)
    
        // SOLUX PTY LTD
        #expect(CompanyIdentifier.solux.rawValue == 3316)
        #expect(CompanyIdentifier.solux.name == #"SOLUX PTY LTD"#)
        #expect(CompanyIdentifier.solux.description == #"SOLUX PTY LTD"#)
    
        // BOS Balance of Storage Systems AG
        #expect(CompanyIdentifier.bosBalanceOfStorageSystems.rawValue == 3317)
        #expect(CompanyIdentifier.bosBalanceOfStorageSystems.name == #"BOS Balance of Storage Systems AG"#)
        #expect(CompanyIdentifier.bosBalanceOfStorageSystems.description == #"BOS Balance of Storage Systems AG"#)
    
        // OJ Electronics A/S
        #expect(CompanyIdentifier.ojElectronics.rawValue == 3318)
        #expect(CompanyIdentifier.ojElectronics.name == #"OJ Electronics A/S"#)
        #expect(CompanyIdentifier.ojElectronics.description == #"OJ Electronics A/S"#)
    
        // TVS Motor Company Ltd.
        #expect(CompanyIdentifier.tvsMotor.rawValue == 3319)
        #expect(CompanyIdentifier.tvsMotor.name == #"TVS Motor Company Ltd."#)
        #expect(CompanyIdentifier.tvsMotor.description == #"TVS Motor Company Ltd."#)
    
        // core sensing GmbH
        #expect(CompanyIdentifier.coreSensing.rawValue == 3320)
        #expect(CompanyIdentifier.coreSensing.name == #"core sensing GmbH"#)
        #expect(CompanyIdentifier.coreSensing.description == #"core sensing GmbH"#)
    
        // Tamblue Oy
        #expect(CompanyIdentifier.tamblue.rawValue == 3321)
        #expect(CompanyIdentifier.tamblue.name == #"Tamblue Oy"#)
        #expect(CompanyIdentifier.tamblue.description == #"Tamblue Oy"#)
    
        // Protect Animals With Satellites LLC
        #expect(CompanyIdentifier.protectAnimalsWithSatellites.rawValue == 3322)
        #expect(CompanyIdentifier.protectAnimalsWithSatellites.name == #"Protect Animals With Satellites LLC"#)
        #expect(CompanyIdentifier.protectAnimalsWithSatellites.description == #"Protect Animals With Satellites LLC"#)
    
        // Tyromotion GmbH
        #expect(CompanyIdentifier.tyromotion.rawValue == 3323)
        #expect(CompanyIdentifier.tyromotion.name == #"Tyromotion GmbH"#)
        #expect(CompanyIdentifier.tyromotion.description == #"Tyromotion GmbH"#)
    
        // ElectronX design
        #expect(CompanyIdentifier.electronxDesign.rawValue == 3324)
        #expect(CompanyIdentifier.electronxDesign.name == #"ElectronX design"#)
        #expect(CompanyIdentifier.electronxDesign.description == #"ElectronX design"#)
    
        // Wuhan Woncan Construction Technologies Co., Ltd.
        #expect(CompanyIdentifier.wuhanWoncanConstructionTechnologies.rawValue == 3325)
        #expect(CompanyIdentifier.wuhanWoncanConstructionTechnologies.name == #"Wuhan Woncan Construction Technologies Co., Ltd."#)
        #expect(CompanyIdentifier.wuhanWoncanConstructionTechnologies.description == #"Wuhan Woncan Construction Technologies Co., Ltd."#)
    
        // Thule Group AB
        #expect(CompanyIdentifier.thuleGroup.rawValue == 3326)
        #expect(CompanyIdentifier.thuleGroup.name == #"Thule Group AB"#)
        #expect(CompanyIdentifier.thuleGroup.description == #"Thule Group AB"#)
    
        // Ergodriven Inc
        #expect(CompanyIdentifier.ergodriven.rawValue == 3327)
        #expect(CompanyIdentifier.ergodriven.name == #"Ergodriven Inc"#)
        #expect(CompanyIdentifier.ergodriven.description == #"Ergodriven Inc"#)
    
        // Sparkpark AS
        #expect(CompanyIdentifier.sparkpark.rawValue == 3328)
        #expect(CompanyIdentifier.sparkpark.name == #"Sparkpark AS"#)
        #expect(CompanyIdentifier.sparkpark.description == #"Sparkpark AS"#)
    
        // KEEPEN
        #expect(CompanyIdentifier.keepen.rawValue == 3329)
        #expect(CompanyIdentifier.keepen.name == #"KEEPEN"#)
        #expect(CompanyIdentifier.keepen.description == #"KEEPEN"#)
    
        // Rocky Mountain ATV/MC Jake Wilson
        #expect(CompanyIdentifier.rockyMountainAtvMcJakeWilson.rawValue == 3330)
        #expect(CompanyIdentifier.rockyMountainAtvMcJakeWilson.name == #"Rocky Mountain ATV/MC Jake Wilson"#)
        #expect(CompanyIdentifier.rockyMountainAtvMcJakeWilson.description == #"Rocky Mountain ATV/MC Jake Wilson"#)
    
        // MakuSafe Corp
        #expect(CompanyIdentifier.makusafe.rawValue == 3331)
        #expect(CompanyIdentifier.makusafe.name == #"MakuSafe Corp"#)
        #expect(CompanyIdentifier.makusafe.description == #"MakuSafe Corp"#)
    
        // Bartec Auto Id Ltd
        #expect(CompanyIdentifier.bartecAutoId.rawValue == 3332)
        #expect(CompanyIdentifier.bartecAutoId.name == #"Bartec Auto Id Ltd"#)
        #expect(CompanyIdentifier.bartecAutoId.description == #"Bartec Auto Id Ltd"#)
    
        // Energy Technology and Control Limited
        #expect(CompanyIdentifier.energyTechnologyAndControl.rawValue == 3333)
        #expect(CompanyIdentifier.energyTechnologyAndControl.name == #"Energy Technology and Control Limited"#)
        #expect(CompanyIdentifier.energyTechnologyAndControl.description == #"Energy Technology and Control Limited"#)
    
        // doubleO Co., Ltd.
        #expect(CompanyIdentifier.doubleo.rawValue == 3334)
        #expect(CompanyIdentifier.doubleo.name == #"doubleO Co., Ltd."#)
        #expect(CompanyIdentifier.doubleo.description == #"doubleO Co., Ltd."#)
    
        // Datalogic S.r.l.
        #expect(CompanyIdentifier.datalogic.rawValue == 3335)
        #expect(CompanyIdentifier.datalogic.name == #"Datalogic S.r.l."#)
        #expect(CompanyIdentifier.datalogic.description == #"Datalogic S.r.l."#)
    
        // Datalogic USA, Inc.
        #expect(CompanyIdentifier.datalogic2.rawValue == 3336)
        #expect(CompanyIdentifier.datalogic2.name == #"Datalogic USA, Inc."#)
        #expect(CompanyIdentifier.datalogic2.description == #"Datalogic USA, Inc."#)
    
        // Leica Geosystems AG
        #expect(CompanyIdentifier.leicaGeosystems.rawValue == 3337)
        #expect(CompanyIdentifier.leicaGeosystems.name == #"Leica Geosystems AG"#)
        #expect(CompanyIdentifier.leicaGeosystems.description == #"Leica Geosystems AG"#)
    
        // CATEYE Co., Ltd.
        #expect(CompanyIdentifier.cateye.rawValue == 3338)
        #expect(CompanyIdentifier.cateye.name == #"CATEYE Co., Ltd."#)
        #expect(CompanyIdentifier.cateye.description == #"CATEYE Co., Ltd."#)
    
        // Research Products Corporation
        #expect(CompanyIdentifier.researchProducts.rawValue == 3339)
        #expect(CompanyIdentifier.researchProducts.name == #"Research Products Corporation"#)
        #expect(CompanyIdentifier.researchProducts.description == #"Research Products Corporation"#)
    
        // Planmeca Oy
        #expect(CompanyIdentifier.planmeca.rawValue == 3340)
        #expect(CompanyIdentifier.planmeca.name == #"Planmeca Oy"#)
        #expect(CompanyIdentifier.planmeca.description == #"Planmeca Oy"#)
    
        // C.Ed. Schulte GmbH Zylinderschlossfabrik
        #expect(CompanyIdentifier.cEdSchulteZylinderschlossfabrik.rawValue == 3341)
        #expect(CompanyIdentifier.cEdSchulteZylinderschlossfabrik.name == #"C.Ed. Schulte GmbH Zylinderschlossfabrik"#)
        #expect(CompanyIdentifier.cEdSchulteZylinderschlossfabrik.description == #"C.Ed. Schulte GmbH Zylinderschlossfabrik"#)
    
        // PetVoice Co., Ltd.
        #expect(CompanyIdentifier.petvoice.rawValue == 3342)
        #expect(CompanyIdentifier.petvoice.name == #"PetVoice Co., Ltd."#)
        #expect(CompanyIdentifier.petvoice.description == #"PetVoice Co., Ltd."#)
    
        // Timebirds Australia Pty Ltd
        #expect(CompanyIdentifier.timebirdsAustralia.rawValue == 3343)
        #expect(CompanyIdentifier.timebirdsAustralia.name == #"Timebirds Australia Pty Ltd"#)
        #expect(CompanyIdentifier.timebirdsAustralia.description == #"Timebirds Australia Pty Ltd"#)
    
        // JVC KENWOOD Corporation
        #expect(CompanyIdentifier.jvcKenwood.rawValue == 3344)
        #expect(CompanyIdentifier.jvcKenwood.name == #"JVC KENWOOD Corporation"#)
        #expect(CompanyIdentifier.jvcKenwood.description == #"JVC KENWOOD Corporation"#)
    
        // Great Dane LLC
        #expect(CompanyIdentifier.greatDane.rawValue == 3345)
        #expect(CompanyIdentifier.greatDane.name == #"Great Dane LLC"#)
        #expect(CompanyIdentifier.greatDane.description == #"Great Dane LLC"#)
    
        // Spartek Systems Inc.
        #expect(CompanyIdentifier.spartekSystems.rawValue == 3346)
        #expect(CompanyIdentifier.spartekSystems.name == #"Spartek Systems Inc."#)
        #expect(CompanyIdentifier.spartekSystems.description == #"Spartek Systems Inc."#)
    
        // MERRY ELECTRONICS CO., LTD.
        #expect(CompanyIdentifier.merryElectronics.rawValue == 3347)
        #expect(CompanyIdentifier.merryElectronics.name == #"MERRY ELECTRONICS CO., LTD."#)
        #expect(CompanyIdentifier.merryElectronics.description == #"MERRY ELECTRONICS CO., LTD."#)
    
        // Merry Electronics (S) Pte Ltd
        #expect(CompanyIdentifier.merryElectronicsSPte.rawValue == 3348)
        #expect(CompanyIdentifier.merryElectronicsSPte.name == #"Merry Electronics (S) Pte Ltd"#)
        #expect(CompanyIdentifier.merryElectronicsSPte.description == #"Merry Electronics (S) Pte Ltd"#)
    
        // Spark
        #expect(CompanyIdentifier.spark.rawValue == 3349)
        #expect(CompanyIdentifier.spark.name == #"Spark"#)
        #expect(CompanyIdentifier.spark.description == #"Spark"#)
    
        // Nations Technologies Inc.
        #expect(CompanyIdentifier.nationsTechnologies.rawValue == 3350)
        #expect(CompanyIdentifier.nationsTechnologies.name == #"Nations Technologies Inc."#)
        #expect(CompanyIdentifier.nationsTechnologies.description == #"Nations Technologies Inc."#)
    
        // Akix S.r.l.
        #expect(CompanyIdentifier.akix.rawValue == 3351)
        #expect(CompanyIdentifier.akix.name == #"Akix S.r.l."#)
        #expect(CompanyIdentifier.akix.description == #"Akix S.r.l."#)
    
        // Bioliberty Ltd
        #expect(CompanyIdentifier.bioliberty.rawValue == 3352)
        #expect(CompanyIdentifier.bioliberty.name == #"Bioliberty Ltd"#)
        #expect(CompanyIdentifier.bioliberty.description == #"Bioliberty Ltd"#)
    
        // C.G. Air Systemes Inc.
        #expect(CompanyIdentifier.cGAirSystemes.rawValue == 3353)
        #expect(CompanyIdentifier.cGAirSystemes.name == #"C.G. Air Systemes Inc."#)
        #expect(CompanyIdentifier.cGAirSystemes.description == #"C.G. Air Systemes Inc."#)
    
        // Maturix ApS
        #expect(CompanyIdentifier.maturix.rawValue == 3354)
        #expect(CompanyIdentifier.maturix.name == #"Maturix ApS"#)
        #expect(CompanyIdentifier.maturix.description == #"Maturix ApS"#)
    
        // RACHIO, INC.
        #expect(CompanyIdentifier.rachio.rawValue == 3355)
        #expect(CompanyIdentifier.rachio.name == #"RACHIO, INC."#)
        #expect(CompanyIdentifier.rachio.description == #"RACHIO, INC."#)
    
        // LIMBOID LLC
        #expect(CompanyIdentifier.limboid.rawValue == 3356)
        #expect(CompanyIdentifier.limboid.name == #"LIMBOID LLC"#)
        #expect(CompanyIdentifier.limboid.description == #"LIMBOID LLC"#)
    
        // Electronics4All Inc.
        #expect(CompanyIdentifier.electronics4All.rawValue == 3357)
        #expect(CompanyIdentifier.electronics4All.name == #"Electronics4All Inc."#)
        #expect(CompanyIdentifier.electronics4All.description == #"Electronics4All Inc."#)
    
        // FESTINA LOTUS SA
        #expect(CompanyIdentifier.festinaLotus.rawValue == 3358)
        #expect(CompanyIdentifier.festinaLotus.name == #"FESTINA LOTUS SA"#)
        #expect(CompanyIdentifier.festinaLotus.description == #"FESTINA LOTUS SA"#)
    
        // Synkopi, Inc.
        #expect(CompanyIdentifier.synkopi.rawValue == 3359)
        #expect(CompanyIdentifier.synkopi.name == #"Synkopi, Inc."#)
        #expect(CompanyIdentifier.synkopi.description == #"Synkopi, Inc."#)
    
        // SCIENTERRA LIMITED
        #expect(CompanyIdentifier.scienterra.rawValue == 3360)
        #expect(CompanyIdentifier.scienterra.name == #"SCIENTERRA LIMITED"#)
        #expect(CompanyIdentifier.scienterra.description == #"SCIENTERRA LIMITED"#)
    
        // Cennox Group Limited
        #expect(CompanyIdentifier.cennoxGroup.rawValue == 3361)
        #expect(CompanyIdentifier.cennoxGroup.name == #"Cennox Group Limited"#)
        #expect(CompanyIdentifier.cennoxGroup.description == #"Cennox Group Limited"#)
    
        // Cedarware, Corp.
        #expect(CompanyIdentifier.cedarware.rawValue == 3362)
        #expect(CompanyIdentifier.cedarware.name == #"Cedarware, Corp."#)
        #expect(CompanyIdentifier.cedarware.description == #"Cedarware, Corp."#)
    
        // GREE Electric Appliances, Inc. of Zhuhai
        #expect(CompanyIdentifier.greeElectricAppliancesOfZhuhai.rawValue == 3363)
        #expect(CompanyIdentifier.greeElectricAppliancesOfZhuhai.name == #"GREE Electric Appliances, Inc. of Zhuhai"#)
        #expect(CompanyIdentifier.greeElectricAppliancesOfZhuhai.description == #"GREE Electric Appliances, Inc. of Zhuhai"#)
    
        // Japan Display Inc.
        #expect(CompanyIdentifier.japanDisplay.rawValue == 3364)
        #expect(CompanyIdentifier.japanDisplay.name == #"Japan Display Inc."#)
        #expect(CompanyIdentifier.japanDisplay.description == #"Japan Display Inc."#)
    
        // System Elite Holdings Group Limited
        #expect(CompanyIdentifier.systemEliteHoldingsGroup.rawValue == 3365)
        #expect(CompanyIdentifier.systemEliteHoldingsGroup.name == #"System Elite Holdings Group Limited"#)
        #expect(CompanyIdentifier.systemEliteHoldingsGroup.description == #"System Elite Holdings Group Limited"#)
    
        // Burkert Werke GmbH & Co. KG
        #expect(CompanyIdentifier.burkertWerke.rawValue == 3366)
        #expect(CompanyIdentifier.burkertWerke.name == #"Burkert Werke GmbH & Co. KG"#)
        #expect(CompanyIdentifier.burkertWerke.description == #"Burkert Werke GmbH & Co. KG"#)
    
        // velocitux
        #expect(CompanyIdentifier.velocitux.rawValue == 3367)
        #expect(CompanyIdentifier.velocitux.name == #"velocitux"#)
        #expect(CompanyIdentifier.velocitux.description == #"velocitux"#)
    
        // FUJITSU COMPONENT LIMITED
        #expect(CompanyIdentifier.fujitsuComponent.rawValue == 3368)
        #expect(CompanyIdentifier.fujitsuComponent.name == #"FUJITSU COMPONENT LIMITED"#)
        #expect(CompanyIdentifier.fujitsuComponent.description == #"FUJITSU COMPONENT LIMITED"#)
    
        // MIYAKAWA ELECTRIC WORKS LTD.
        #expect(CompanyIdentifier.miyakawaElectricWorks.rawValue == 3369)
        #expect(CompanyIdentifier.miyakawaElectricWorks.name == #"MIYAKAWA ELECTRIC WORKS LTD."#)
        #expect(CompanyIdentifier.miyakawaElectricWorks.description == #"MIYAKAWA ELECTRIC WORKS LTD."#)
    
        // PhysioLogic Devices, Inc.
        #expect(CompanyIdentifier.physiologicDevices.rawValue == 3370)
        #expect(CompanyIdentifier.physiologicDevices.name == #"PhysioLogic Devices, Inc."#)
        #expect(CompanyIdentifier.physiologicDevices.description == #"PhysioLogic Devices, Inc."#)
    
        // Sensoryx AG
        #expect(CompanyIdentifier.sensoryx.rawValue == 3371)
        #expect(CompanyIdentifier.sensoryx.name == #"Sensoryx AG"#)
        #expect(CompanyIdentifier.sensoryx.description == #"Sensoryx AG"#)
    
        // SIL System Integration Laboratory GmbH
        #expect(CompanyIdentifier.silSystemIntegrationLaboratory.rawValue == 3372)
        #expect(CompanyIdentifier.silSystemIntegrationLaboratory.name == #"SIL System Integration Laboratory GmbH"#)
        #expect(CompanyIdentifier.silSystemIntegrationLaboratory.description == #"SIL System Integration Laboratory GmbH"#)
    
        // Cooler Pro, LLC
        #expect(CompanyIdentifier.coolerPro.rawValue == 3373)
        #expect(CompanyIdentifier.coolerPro.name == #"Cooler Pro, LLC"#)
        #expect(CompanyIdentifier.coolerPro.description == #"Cooler Pro, LLC"#)
    
        // Advanced Electronic Applications, Inc
        #expect(CompanyIdentifier.advancedElectronicApplications.rawValue == 3374)
        #expect(CompanyIdentifier.advancedElectronicApplications.name == #"Advanced Electronic Applications, Inc"#)
        #expect(CompanyIdentifier.advancedElectronicApplications.description == #"Advanced Electronic Applications, Inc"#)
    
        // Delta Development Team, Inc
        #expect(CompanyIdentifier.deltaDevelopmentTeam.rawValue == 3375)
        #expect(CompanyIdentifier.deltaDevelopmentTeam.name == #"Delta Development Team, Inc"#)
        #expect(CompanyIdentifier.deltaDevelopmentTeam.description == #"Delta Development Team, Inc"#)
    
        // Laxmi Therapeutic Devices, Inc.
        #expect(CompanyIdentifier.laxmiTherapeuticDevices.rawValue == 3376)
        #expect(CompanyIdentifier.laxmiTherapeuticDevices.name == #"Laxmi Therapeutic Devices, Inc."#)
        #expect(CompanyIdentifier.laxmiTherapeuticDevices.description == #"Laxmi Therapeutic Devices, Inc."#)
    
        // SYNCHRON, INC.
        #expect(CompanyIdentifier.synchron.rawValue == 3377)
        #expect(CompanyIdentifier.synchron.name == #"SYNCHRON, INC."#)
        #expect(CompanyIdentifier.synchron.description == #"SYNCHRON, INC."#)
    
        // Badger Meter
        #expect(CompanyIdentifier.badgerMeter.rawValue == 3378)
        #expect(CompanyIdentifier.badgerMeter.name == #"Badger Meter"#)
        #expect(CompanyIdentifier.badgerMeter.description == #"Badger Meter"#)
    
        // Micropower Group AB
        #expect(CompanyIdentifier.micropowerGroup.rawValue == 3379)
        #expect(CompanyIdentifier.micropowerGroup.name == #"Micropower Group AB"#)
        #expect(CompanyIdentifier.micropowerGroup.description == #"Micropower Group AB"#)
    
        // ZILLIOT TECHNOLOGIES PRIVATE LIMITED
        #expect(CompanyIdentifier.zilliotTechnologies.rawValue == 3380)
        #expect(CompanyIdentifier.zilliotTechnologies.name == #"ZILLIOT TECHNOLOGIES PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.zilliotTechnologies.description == #"ZILLIOT TECHNOLOGIES PRIVATE LIMITED"#)
    
        // Universidad Politecnica de Madrid
        #expect(CompanyIdentifier.universidadPolitecnicaDeMadrid.rawValue == 3381)
        #expect(CompanyIdentifier.universidadPolitecnicaDeMadrid.name == #"Universidad Politecnica de Madrid"#)
        #expect(CompanyIdentifier.universidadPolitecnicaDeMadrid.description == #"Universidad Politecnica de Madrid"#)
    
        // XIHAO INTELLIGENGT TECHNOLOGY CO., LTD
        #expect(CompanyIdentifier.xihaoIntelligengtTechnology.rawValue == 3382)
        #expect(CompanyIdentifier.xihaoIntelligengtTechnology.name == #"XIHAO INTELLIGENGT TECHNOLOGY CO., LTD"#)
        #expect(CompanyIdentifier.xihaoIntelligengtTechnology.description == #"XIHAO INTELLIGENGT TECHNOLOGY CO., LTD"#)
    
        // Zerene Inc.
        #expect(CompanyIdentifier.zerene.rawValue == 3383)
        #expect(CompanyIdentifier.zerene.name == #"Zerene Inc."#)
        #expect(CompanyIdentifier.zerene.description == #"Zerene Inc."#)
    
        // CycLock
        #expect(CompanyIdentifier.cyclock.rawValue == 3384)
        #expect(CompanyIdentifier.cyclock.name == #"CycLock"#)
        #expect(CompanyIdentifier.cyclock.description == #"CycLock"#)
    
        // Systemic Games, LLC
        #expect(CompanyIdentifier.systemicGames.rawValue == 3385)
        #expect(CompanyIdentifier.systemicGames.name == #"Systemic Games, LLC"#)
        #expect(CompanyIdentifier.systemicGames.description == #"Systemic Games, LLC"#)
    
        // Frost Solutions, LLC
        #expect(CompanyIdentifier.frostSolutions.rawValue == 3386)
        #expect(CompanyIdentifier.frostSolutions.name == #"Frost Solutions, LLC"#)
        #expect(CompanyIdentifier.frostSolutions.description == #"Frost Solutions, LLC"#)
    
        // Lone Star Marine Pty Ltd
        #expect(CompanyIdentifier.loneStarMarine.rawValue == 3387)
        #expect(CompanyIdentifier.loneStarMarine.name == #"Lone Star Marine Pty Ltd"#)
        #expect(CompanyIdentifier.loneStarMarine.description == #"Lone Star Marine Pty Ltd"#)
    
        // SIRONA Dental Systems GmbH
        #expect(CompanyIdentifier.sironaDentalSystems.rawValue == 3388)
        #expect(CompanyIdentifier.sironaDentalSystems.name == #"SIRONA Dental Systems GmbH"#)
        #expect(CompanyIdentifier.sironaDentalSystems.description == #"SIRONA Dental Systems GmbH"#)
    
        // bHaptics Inc.
        #expect(CompanyIdentifier.bhaptics.rawValue == 3389)
        #expect(CompanyIdentifier.bhaptics.name == #"bHaptics Inc."#)
        #expect(CompanyIdentifier.bhaptics.description == #"bHaptics Inc."#)
    
        // LUMINOAH, INC.
        #expect(CompanyIdentifier.luminoah.rawValue == 3390)
        #expect(CompanyIdentifier.luminoah.name == #"LUMINOAH, INC."#)
        #expect(CompanyIdentifier.luminoah.description == #"LUMINOAH, INC."#)
    
        // Vogels Products B.V.
        #expect(CompanyIdentifier.vogelsProducts.rawValue == 3391)
        #expect(CompanyIdentifier.vogelsProducts.name == #"Vogels Products B.V."#)
        #expect(CompanyIdentifier.vogelsProducts.description == #"Vogels Products B.V."#)
    
        // SignalFire Telemetry, Inc.
        #expect(CompanyIdentifier.signalfireTelemetry.rawValue == 3392)
        #expect(CompanyIdentifier.signalfireTelemetry.name == #"SignalFire Telemetry, Inc."#)
        #expect(CompanyIdentifier.signalfireTelemetry.description == #"SignalFire Telemetry, Inc."#)
    
        // CPAC Systems AB
        #expect(CompanyIdentifier.cpacSystems.rawValue == 3393)
        #expect(CompanyIdentifier.cpacSystems.name == #"CPAC Systems AB"#)
        #expect(CompanyIdentifier.cpacSystems.description == #"CPAC Systems AB"#)
    
        // TEKTRO TECHNOLOGY CORPORATION
        #expect(CompanyIdentifier.tektroTechnology.rawValue == 3394)
        #expect(CompanyIdentifier.tektroTechnology.name == #"TEKTRO TECHNOLOGY CORPORATION"#)
        #expect(CompanyIdentifier.tektroTechnology.description == #"TEKTRO TECHNOLOGY CORPORATION"#)
    
        // Gosuncn Technology Group Co., Ltd.
        #expect(CompanyIdentifier.gosuncnTechnologyGroup.rawValue == 3395)
        #expect(CompanyIdentifier.gosuncnTechnologyGroup.name == #"Gosuncn Technology Group Co., Ltd."#)
        #expect(CompanyIdentifier.gosuncnTechnologyGroup.description == #"Gosuncn Technology Group Co., Ltd."#)
    
        // Ex Makhina Inc.
        #expect(CompanyIdentifier.exMakhina.rawValue == 3396)
        #expect(CompanyIdentifier.exMakhina.name == #"Ex Makhina Inc."#)
        #expect(CompanyIdentifier.exMakhina.description == #"Ex Makhina Inc."#)
    
        // Odeon, Inc.
        #expect(CompanyIdentifier.odeon.rawValue == 3397)
        #expect(CompanyIdentifier.odeon.name == #"Odeon, Inc."#)
        #expect(CompanyIdentifier.odeon.description == #"Odeon, Inc."#)
    
        // Thales Simulation & Training AG
        #expect(CompanyIdentifier.thalesSimulationTraining.rawValue == 3398)
        #expect(CompanyIdentifier.thalesSimulationTraining.name == #"Thales Simulation & Training AG"#)
        #expect(CompanyIdentifier.thalesSimulationTraining.description == #"Thales Simulation & Training AG"#)
    
        // Shenzhen DOKE Electronic Co., Ltd
        #expect(CompanyIdentifier.shenzhenDokeElectronic.rawValue == 3399)
        #expect(CompanyIdentifier.shenzhenDokeElectronic.name == #"Shenzhen DOKE Electronic Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenDokeElectronic.description == #"Shenzhen DOKE Electronic Co., Ltd"#)
    
        // Vemcon GmbH
        #expect(CompanyIdentifier.vemcon.rawValue == 3400)
        #expect(CompanyIdentifier.vemcon.name == #"Vemcon GmbH"#)
        #expect(CompanyIdentifier.vemcon.description == #"Vemcon GmbH"#)
    
        // Refrigerated Transport Electronics, Inc.
        #expect(CompanyIdentifier.refrigeratedTransportElectronics.rawValue == 3401)
        #expect(CompanyIdentifier.refrigeratedTransportElectronics.name == #"Refrigerated Transport Electronics, Inc."#)
        #expect(CompanyIdentifier.refrigeratedTransportElectronics.description == #"Refrigerated Transport Electronics, Inc."#)
    
        // Rockpile Solutions, LLC
        #expect(CompanyIdentifier.rockpileSolutions.rawValue == 3402)
        #expect(CompanyIdentifier.rockpileSolutions.name == #"Rockpile Solutions, LLC"#)
        #expect(CompanyIdentifier.rockpileSolutions.description == #"Rockpile Solutions, LLC"#)
    
        // Soundwave Hearing, LLC
        #expect(CompanyIdentifier.soundwaveHearing.rawValue == 3403)
        #expect(CompanyIdentifier.soundwaveHearing.name == #"Soundwave Hearing, LLC"#)
        #expect(CompanyIdentifier.soundwaveHearing.description == #"Soundwave Hearing, LLC"#)
    
        // IotGizmo Corporation
        #expect(CompanyIdentifier.iotgizmo.rawValue == 3404)
        #expect(CompanyIdentifier.iotgizmo.name == #"IotGizmo Corporation"#)
        #expect(CompanyIdentifier.iotgizmo.description == #"IotGizmo Corporation"#)
    
        // Optec, LLC
        #expect(CompanyIdentifier.optec.rawValue == 3405)
        #expect(CompanyIdentifier.optec.name == #"Optec, LLC"#)
        #expect(CompanyIdentifier.optec.description == #"Optec, LLC"#)
    
        // NIKAT SOLUTIONS PRIVATE LIMITED
        #expect(CompanyIdentifier.nikatSolutions.rawValue == 3406)
        #expect(CompanyIdentifier.nikatSolutions.name == #"NIKAT SOLUTIONS PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.nikatSolutions.description == #"NIKAT SOLUTIONS PRIVATE LIMITED"#)
    
        // Movano Inc.
        #expect(CompanyIdentifier.movano.rawValue == 3407)
        #expect(CompanyIdentifier.movano.name == #"Movano Inc."#)
        #expect(CompanyIdentifier.movano.description == #"Movano Inc."#)
    
        // NINGBO FOTILE KITCHENWARE CO., LTD.
        #expect(CompanyIdentifier.ningboFotileKitchenware.rawValue == 3408)
        #expect(CompanyIdentifier.ningboFotileKitchenware.name == #"NINGBO FOTILE KITCHENWARE CO., LTD."#)
        #expect(CompanyIdentifier.ningboFotileKitchenware.description == #"NINGBO FOTILE KITCHENWARE CO., LTD."#)
    
        // Genetus inc.
        #expect(CompanyIdentifier.genetus.rawValue == 3409)
        #expect(CompanyIdentifier.genetus.name == #"Genetus inc."#)
        #expect(CompanyIdentifier.genetus.description == #"Genetus inc."#)
    
        // DIVAN TRADING CO., LTD.
        #expect(CompanyIdentifier.divanTrading.rawValue == 3410)
        #expect(CompanyIdentifier.divanTrading.name == #"DIVAN TRADING CO., LTD."#)
        #expect(CompanyIdentifier.divanTrading.description == #"DIVAN TRADING CO., LTD."#)
    
        // Luxottica Group S.p.A
        #expect(CompanyIdentifier.luxotticaGroupSPA.rawValue == 3411)
        #expect(CompanyIdentifier.luxotticaGroupSPA.name == #"Luxottica Group S.p.A"#)
        #expect(CompanyIdentifier.luxotticaGroupSPA.description == #"Luxottica Group S.p.A"#)
    
        // ISEKI FRANCE S.A.S
        #expect(CompanyIdentifier.isekiFrance.rawValue == 3412)
        #expect(CompanyIdentifier.isekiFrance.name == #"ISEKI FRANCE S.A.S"#)
        #expect(CompanyIdentifier.isekiFrance.description == #"ISEKI FRANCE S.A.S"#)
    
        // NO CLIMB PRODUCTS LTD
        #expect(CompanyIdentifier.noClimbProducts.rawValue == 3413)
        #expect(CompanyIdentifier.noClimbProducts.name == #"NO CLIMB PRODUCTS LTD"#)
        #expect(CompanyIdentifier.noClimbProducts.description == #"NO CLIMB PRODUCTS LTD"#)
    
        // Wellang.Co,.Ltd
        #expect(CompanyIdentifier.wellangCoLtd.rawValue == 3414)
        #expect(CompanyIdentifier.wellangCoLtd.name == #"Wellang.Co,.Ltd"#)
        #expect(CompanyIdentifier.wellangCoLtd.description == #"Wellang.Co,.Ltd"#)
    
        // Nanjing Xinxiangyuan Microelectronics Co., Ltd.
        #expect(CompanyIdentifier.nanjingXinxiangyuanMicroelectronics.rawValue == 3415)
        #expect(CompanyIdentifier.nanjingXinxiangyuanMicroelectronics.name == #"Nanjing Xinxiangyuan Microelectronics Co., Ltd."#)
        #expect(CompanyIdentifier.nanjingXinxiangyuanMicroelectronics.description == #"Nanjing Xinxiangyuan Microelectronics Co., Ltd."#)
    
        // ifm electronic gmbh
        #expect(CompanyIdentifier.ifmElectronic.rawValue == 3416)
        #expect(CompanyIdentifier.ifmElectronic.name == #"ifm electronic gmbh"#)
        #expect(CompanyIdentifier.ifmElectronic.description == #"ifm electronic gmbh"#)
    
        // HYUPSUNG MACHINERY ELECTRIC CO., LTD.
        #expect(CompanyIdentifier.hyupsungMachineryElectric.rawValue == 3417)
        #expect(CompanyIdentifier.hyupsungMachineryElectric.name == #"HYUPSUNG MACHINERY ELECTRIC CO., LTD."#)
        #expect(CompanyIdentifier.hyupsungMachineryElectric.description == #"HYUPSUNG MACHINERY ELECTRIC CO., LTD."#)
    
        // Gunnebo Aktiebolag
        #expect(CompanyIdentifier.gunneboAktiebolag.rawValue == 3418)
        #expect(CompanyIdentifier.gunneboAktiebolag.name == #"Gunnebo Aktiebolag"#)
        #expect(CompanyIdentifier.gunneboAktiebolag.description == #"Gunnebo Aktiebolag"#)
    
        // Axis Communications AB
        #expect(CompanyIdentifier.axisCommunications.rawValue == 3419)
        #expect(CompanyIdentifier.axisCommunications.name == #"Axis Communications AB"#)
        #expect(CompanyIdentifier.axisCommunications.description == #"Axis Communications AB"#)
    
        // Pison Technology, Inc.
        #expect(CompanyIdentifier.pisonTechnology.rawValue == 3420)
        #expect(CompanyIdentifier.pisonTechnology.name == #"Pison Technology, Inc."#)
        #expect(CompanyIdentifier.pisonTechnology.description == #"Pison Technology, Inc."#)
    
        // Stogger B.V.
        #expect(CompanyIdentifier.stogger.rawValue == 3421)
        #expect(CompanyIdentifier.stogger.name == #"Stogger B.V."#)
        #expect(CompanyIdentifier.stogger.description == #"Stogger B.V."#)
    
        // Pella Corp
        #expect(CompanyIdentifier.pella.rawValue == 3422)
        #expect(CompanyIdentifier.pella.name == #"Pella Corp"#)
        #expect(CompanyIdentifier.pella.description == #"Pella Corp"#)
    
        // SiChuan Homme Intelligent Technology co.,Ltd.
        #expect(CompanyIdentifier.sichuanHommeIntelligentTechnology.rawValue == 3423)
        #expect(CompanyIdentifier.sichuanHommeIntelligentTechnology.name == #"SiChuan Homme Intelligent Technology co.,Ltd."#)
        #expect(CompanyIdentifier.sichuanHommeIntelligentTechnology.description == #"SiChuan Homme Intelligent Technology co.,Ltd."#)
    
        // Smart Products Connection, S.A.
        #expect(CompanyIdentifier.smartProductsConnection.rawValue == 3424)
        #expect(CompanyIdentifier.smartProductsConnection.name == #"Smart Products Connection, S.A."#)
        #expect(CompanyIdentifier.smartProductsConnection.description == #"Smart Products Connection, S.A."#)
    
        // F.I.P. FORMATURA INIEZIONE POLIMERI - S.P.A.
        #expect(CompanyIdentifier.fIPFormaturaIniezionePolimeri.rawValue == 3425)
        #expect(CompanyIdentifier.fIPFormaturaIniezionePolimeri.name == #"F.I.P. FORMATURA INIEZIONE POLIMERI - S.P.A."#)
        #expect(CompanyIdentifier.fIPFormaturaIniezionePolimeri.description == #"F.I.P. FORMATURA INIEZIONE POLIMERI - S.P.A."#)
    
        // MEBSTER s.r.o.
        #expect(CompanyIdentifier.mebster.rawValue == 3426)
        #expect(CompanyIdentifier.mebster.name == #"MEBSTER s.r.o."#)
        #expect(CompanyIdentifier.mebster.description == #"MEBSTER s.r.o."#)
    
        // SKF France
        #expect(CompanyIdentifier.skfFrance.rawValue == 3427)
        #expect(CompanyIdentifier.skfFrance.name == #"SKF France"#)
        #expect(CompanyIdentifier.skfFrance.description == #"SKF France"#)
    
        // Southco
        #expect(CompanyIdentifier.southco.rawValue == 3428)
        #expect(CompanyIdentifier.southco.name == #"Southco"#)
        #expect(CompanyIdentifier.southco.description == #"Southco"#)
    
        // Molnlycke Health Care AB
        #expect(CompanyIdentifier.molnlyckeHealthCare.rawValue == 3429)
        #expect(CompanyIdentifier.molnlyckeHealthCare.name == #"Molnlycke Health Care AB"#)
        #expect(CompanyIdentifier.molnlyckeHealthCare.description == #"Molnlycke Health Care AB"#)
    
        // Hendrickson USA , L.L.C
        #expect(CompanyIdentifier.hendricksonUsaLLC.rawValue == 3430)
        #expect(CompanyIdentifier.hendricksonUsaLLC.name == #"Hendrickson USA , L.L.C"#)
        #expect(CompanyIdentifier.hendricksonUsaLLC.description == #"Hendrickson USA , L.L.C"#)
    
        // BLACK BOX NETWORK SERVICES INDIA PRIVATE LIMITED
        #expect(CompanyIdentifier.blackBoxNetworkServicesIndia.rawValue == 3431)
        #expect(CompanyIdentifier.blackBoxNetworkServicesIndia.name == #"BLACK BOX NETWORK SERVICES INDIA PRIVATE LIMITED"#)
        #expect(CompanyIdentifier.blackBoxNetworkServicesIndia.description == #"BLACK BOX NETWORK SERVICES INDIA PRIVATE LIMITED"#)
    
        // Status Audio LLC
        #expect(CompanyIdentifier.statusAudio.rawValue == 3432)
        #expect(CompanyIdentifier.statusAudio.name == #"Status Audio LLC"#)
        #expect(CompanyIdentifier.statusAudio.description == #"Status Audio LLC"#)
    
        // AIR AROMA INTERNATIONAL PTY LTD
        #expect(CompanyIdentifier.airAromaInternational.rawValue == 3433)
        #expect(CompanyIdentifier.airAromaInternational.name == #"AIR AROMA INTERNATIONAL PTY LTD"#)
        #expect(CompanyIdentifier.airAromaInternational.description == #"AIR AROMA INTERNATIONAL PTY LTD"#)
    
        // Helge Kaiser GmbH
        #expect(CompanyIdentifier.helgeKaiser.rawValue == 3434)
        #expect(CompanyIdentifier.helgeKaiser.name == #"Helge Kaiser GmbH"#)
        #expect(CompanyIdentifier.helgeKaiser.description == #"Helge Kaiser GmbH"#)
    
        // Crane Payment Innovations, Inc.
        #expect(CompanyIdentifier.cranePaymentInnovations.rawValue == 3435)
        #expect(CompanyIdentifier.cranePaymentInnovations.name == #"Crane Payment Innovations, Inc."#)
        #expect(CompanyIdentifier.cranePaymentInnovations.description == #"Crane Payment Innovations, Inc."#)
    
        // Ambient IoT Pty Ltd
        #expect(CompanyIdentifier.ambientIot.rawValue == 3436)
        #expect(CompanyIdentifier.ambientIot.name == #"Ambient IoT Pty Ltd"#)
        #expect(CompanyIdentifier.ambientIot.description == #"Ambient IoT Pty Ltd"#)
    
        // DYNAMOX S/A
        #expect(CompanyIdentifier.dynamoxSA.rawValue == 3437)
        #expect(CompanyIdentifier.dynamoxSA.name == #"DYNAMOX S/A"#)
        #expect(CompanyIdentifier.dynamoxSA.description == #"DYNAMOX S/A"#)
    
        // Look Cycle International
        #expect(CompanyIdentifier.lookCycleInternational.rawValue == 3438)
        #expect(CompanyIdentifier.lookCycleInternational.name == #"Look Cycle International"#)
        #expect(CompanyIdentifier.lookCycleInternational.description == #"Look Cycle International"#)
    
        // Closed Joint Stock Company NVP BOLID
        #expect(CompanyIdentifier.nvpBolid.rawValue == 3439)
        #expect(CompanyIdentifier.nvpBolid.name == #"Closed Joint Stock Company NVP BOLID"#)
        #expect(CompanyIdentifier.nvpBolid.description == #"Closed Joint Stock Company NVP BOLID"#)
    
        // Kindhome
        #expect(CompanyIdentifier.kindhome.rawValue == 3440)
        #expect(CompanyIdentifier.kindhome.name == #"Kindhome"#)
        #expect(CompanyIdentifier.kindhome.description == #"Kindhome"#)
    
        // Kiteras Inc.
        #expect(CompanyIdentifier.kiteras.rawValue == 3441)
        #expect(CompanyIdentifier.kiteras.name == #"Kiteras Inc."#)
        #expect(CompanyIdentifier.kiteras.description == #"Kiteras Inc."#)
    
        // Earfun Technology (HK) Limited
        #expect(CompanyIdentifier.earfunTechnology.rawValue == 3442)
        #expect(CompanyIdentifier.earfunTechnology.name == #"Earfun Technology (HK) Limited"#)
        #expect(CompanyIdentifier.earfunTechnology.description == #"Earfun Technology (HK) Limited"#)
    
        // iota Biosciences, Inc.
        #expect(CompanyIdentifier.iotaBiosciences.rawValue == 3443)
        #expect(CompanyIdentifier.iotaBiosciences.name == #"iota Biosciences, Inc."#)
        #expect(CompanyIdentifier.iotaBiosciences.description == #"iota Biosciences, Inc."#)
    
        // ANUME s.r.o.
        #expect(CompanyIdentifier.anume.rawValue == 3444)
        #expect(CompanyIdentifier.anume.name == #"ANUME s.r.o."#)
        #expect(CompanyIdentifier.anume.description == #"ANUME s.r.o."#)
    
        // Indistinguishable From Magic, Inc.
        #expect(CompanyIdentifier.indistinguishableFromMagic.rawValue == 3445)
        #expect(CompanyIdentifier.indistinguishableFromMagic.name == #"Indistinguishable From Magic, Inc."#)
        #expect(CompanyIdentifier.indistinguishableFromMagic.description == #"Indistinguishable From Magic, Inc."#)
    
        // i-focus Co.,Ltd
        #expect(CompanyIdentifier.iFocus.rawValue == 3446)
        #expect(CompanyIdentifier.iFocus.name == #"i-focus Co.,Ltd"#)
        #expect(CompanyIdentifier.iFocus.description == #"i-focus Co.,Ltd"#)
    
        // DualNetworks SA
        #expect(CompanyIdentifier.dualnetworks.rawValue == 3447)
        #expect(CompanyIdentifier.dualnetworks.name == #"DualNetworks SA"#)
        #expect(CompanyIdentifier.dualnetworks.description == #"DualNetworks SA"#)
    
        // MITACHI CO.,LTD.
        #expect(CompanyIdentifier.mitachi.rawValue == 3448)
        #expect(CompanyIdentifier.mitachi.name == #"MITACHI CO.,LTD."#)
        #expect(CompanyIdentifier.mitachi.description == #"MITACHI CO.,LTD."#)
    
        // VIVIWARE JAPAN, Inc.
        #expect(CompanyIdentifier.viviwareJapan.rawValue == 3449)
        #expect(CompanyIdentifier.viviwareJapan.name == #"VIVIWARE JAPAN, Inc."#)
        #expect(CompanyIdentifier.viviwareJapan.description == #"VIVIWARE JAPAN, Inc."#)
    
        // Xiamen Intretech Inc.
        #expect(CompanyIdentifier.xiamenIntretech.rawValue == 3450)
        #expect(CompanyIdentifier.xiamenIntretech.name == #"Xiamen Intretech Inc."#)
        #expect(CompanyIdentifier.xiamenIntretech.description == #"Xiamen Intretech Inc."#)
    
        // MindMaze SA
        #expect(CompanyIdentifier.mindmaze.rawValue == 3451)
        #expect(CompanyIdentifier.mindmaze.name == #"MindMaze SA"#)
        #expect(CompanyIdentifier.mindmaze.description == #"MindMaze SA"#)
    
        // BeiJing SmartChip Microelectronics Technology Co.,Ltd
        #expect(CompanyIdentifier.beijingSmartchipMicroelectronicsTechnology.rawValue == 3452)
        #expect(CompanyIdentifier.beijingSmartchipMicroelectronicsTechnology.name == #"BeiJing SmartChip Microelectronics Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.beijingSmartchipMicroelectronicsTechnology.description == #"BeiJing SmartChip Microelectronics Technology Co.,Ltd"#)
    
        // Taiko Audio B.V.
        #expect(CompanyIdentifier.taikoAudio.rawValue == 3453)
        #expect(CompanyIdentifier.taikoAudio.name == #"Taiko Audio B.V."#)
        #expect(CompanyIdentifier.taikoAudio.description == #"Taiko Audio B.V."#)
    
        // Daihatsu Motor Co., Ltd.
        #expect(CompanyIdentifier.daihatsuMotor.rawValue == 3454)
        #expect(CompanyIdentifier.daihatsuMotor.name == #"Daihatsu Motor Co., Ltd."#)
        #expect(CompanyIdentifier.daihatsuMotor.description == #"Daihatsu Motor Co., Ltd."#)
    
        // Konova
        #expect(CompanyIdentifier.konova.rawValue == 3455)
        #expect(CompanyIdentifier.konova.name == #"Konova"#)
        #expect(CompanyIdentifier.konova.description == #"Konova"#)
    
        // Gravaa B.V.
        #expect(CompanyIdentifier.gravaa.rawValue == 3456)
        #expect(CompanyIdentifier.gravaa.name == #"Gravaa B.V."#)
        #expect(CompanyIdentifier.gravaa.description == #"Gravaa B.V."#)
    
        // Beyerdynamic GmbH & Co. KG
        #expect(CompanyIdentifier.beyerdynamic.rawValue == 3457)
        #expect(CompanyIdentifier.beyerdynamic.name == #"Beyerdynamic GmbH & Co. KG"#)
        #expect(CompanyIdentifier.beyerdynamic.description == #"Beyerdynamic GmbH & Co. KG"#)
    
        // VELCO
        #expect(CompanyIdentifier.velco.rawValue == 3458)
        #expect(CompanyIdentifier.velco.name == #"VELCO"#)
        #expect(CompanyIdentifier.velco.description == #"VELCO"#)
    
        // ATLANTIC SOCIETE FRANCAISE DE DEVELOPPEMENT THERMIQUE
        #expect(CompanyIdentifier.atlanticSocieteFrancaiseDeDeveloppementThermique.rawValue == 3459)
        #expect(CompanyIdentifier.atlanticSocieteFrancaiseDeDeveloppementThermique.name == #"ATLANTIC SOCIETE FRANCAISE DE DEVELOPPEMENT THERMIQUE"#)
        #expect(CompanyIdentifier.atlanticSocieteFrancaiseDeDeveloppementThermique.description == #"ATLANTIC SOCIETE FRANCAISE DE DEVELOPPEMENT THERMIQUE"#)
    
        // Testo SE & Co. KGaA
        #expect(CompanyIdentifier.testoSeKgaa.rawValue == 3460)
        #expect(CompanyIdentifier.testoSeKgaa.name == #"Testo SE & Co. KGaA"#)
        #expect(CompanyIdentifier.testoSeKgaa.description == #"Testo SE & Co. KGaA"#)
    
        // SEW-EURODRIVE GmbH & Co KG
        #expect(CompanyIdentifier.sewEurodrive.rawValue == 3461)
        #expect(CompanyIdentifier.sewEurodrive.name == #"SEW-EURODRIVE GmbH & Co KG"#)
        #expect(CompanyIdentifier.sewEurodrive.description == #"SEW-EURODRIVE GmbH & Co KG"#)
    
        // ROCKWELL AUTOMATION, INC.
        #expect(CompanyIdentifier.rockwellAutomation.rawValue == 3462)
        #expect(CompanyIdentifier.rockwellAutomation.name == #"ROCKWELL AUTOMATION, INC."#)
        #expect(CompanyIdentifier.rockwellAutomation.description == #"ROCKWELL AUTOMATION, INC."#)
    
        // Quectel Wireless Solutions Co., Ltd.
        #expect(CompanyIdentifier.quectelWirelessSolutions.rawValue == 3463)
        #expect(CompanyIdentifier.quectelWirelessSolutions.name == #"Quectel Wireless Solutions Co., Ltd."#)
        #expect(CompanyIdentifier.quectelWirelessSolutions.description == #"Quectel Wireless Solutions Co., Ltd."#)
    
        // Geocene Inc.
        #expect(CompanyIdentifier.geocene.rawValue == 3464)
        #expect(CompanyIdentifier.geocene.name == #"Geocene Inc."#)
        #expect(CompanyIdentifier.geocene.description == #"Geocene Inc."#)
    
        // Nanohex Corp
        #expect(CompanyIdentifier.nanohex.rawValue == 3465)
        #expect(CompanyIdentifier.nanohex.name == #"Nanohex Corp"#)
        #expect(CompanyIdentifier.nanohex.description == #"Nanohex Corp"#)
    
        // Simply Embedded Inc.
        #expect(CompanyIdentifier.simplyEmbedded.rawValue == 3466)
        #expect(CompanyIdentifier.simplyEmbedded.name == #"Simply Embedded Inc."#)
        #expect(CompanyIdentifier.simplyEmbedded.description == #"Simply Embedded Inc."#)
    
        // Software Development, LLC
        #expect(CompanyIdentifier.softwareDevelopment.rawValue == 3467)
        #expect(CompanyIdentifier.softwareDevelopment.name == #"Software Development, LLC"#)
        #expect(CompanyIdentifier.softwareDevelopment.description == #"Software Development, LLC"#)
    
        // Ultimea Technology (Shenzhen) Limited
        #expect(CompanyIdentifier.ultimeaTechnologyShenzhen.rawValue == 3468)
        #expect(CompanyIdentifier.ultimeaTechnologyShenzhen.name == #"Ultimea Technology (Shenzhen) Limited"#)
        #expect(CompanyIdentifier.ultimeaTechnologyShenzhen.description == #"Ultimea Technology (Shenzhen) Limited"#)
    
        // RF Electronics Limited
        #expect(CompanyIdentifier.rfElectronics.rawValue == 3469)
        #expect(CompanyIdentifier.rfElectronics.name == #"RF Electronics Limited"#)
        #expect(CompanyIdentifier.rfElectronics.description == #"RF Electronics Limited"#)
    
        // Optivolt Labs, Inc.
        #expect(CompanyIdentifier.optivoltLabs.rawValue == 3470)
        #expect(CompanyIdentifier.optivoltLabs.name == #"Optivolt Labs, Inc."#)
        #expect(CompanyIdentifier.optivoltLabs.description == #"Optivolt Labs, Inc."#)
    
        // Canon Electronics Inc.
        #expect(CompanyIdentifier.canonElectronics.rawValue == 3471)
        #expect(CompanyIdentifier.canonElectronics.name == #"Canon Electronics Inc."#)
        #expect(CompanyIdentifier.canonElectronics.description == #"Canon Electronics Inc."#)
    
        // LAAS ApS
        #expect(CompanyIdentifier.laas.rawValue == 3472)
        #expect(CompanyIdentifier.laas.name == #"LAAS ApS"#)
        #expect(CompanyIdentifier.laas.description == #"LAAS ApS"#)
    
        // Beamex Oy Ab
        #expect(CompanyIdentifier.beamexAb.rawValue == 3473)
        #expect(CompanyIdentifier.beamexAb.name == #"Beamex Oy Ab"#)
        #expect(CompanyIdentifier.beamexAb.description == #"Beamex Oy Ab"#)
    
        // TACHIKAWA CORPORATION
        #expect(CompanyIdentifier.tachikawa.rawValue == 3474)
        #expect(CompanyIdentifier.tachikawa.name == #"TACHIKAWA CORPORATION"#)
        #expect(CompanyIdentifier.tachikawa.description == #"TACHIKAWA CORPORATION"#)
    
        // HagerEnergy GmbH
        #expect(CompanyIdentifier.hagerenergy.rawValue == 3475)
        #expect(CompanyIdentifier.hagerenergy.name == #"HagerEnergy GmbH"#)
        #expect(CompanyIdentifier.hagerenergy.description == #"HagerEnergy GmbH"#)
    
        // Shrooly Inc
        #expect(CompanyIdentifier.shrooly.rawValue == 3476)
        #expect(CompanyIdentifier.shrooly.name == #"Shrooly Inc"#)
        #expect(CompanyIdentifier.shrooly.description == #"Shrooly Inc"#)
    
        // Hunter Industries Incorporated
        #expect(CompanyIdentifier.hunterIndustries.rawValue == 3477)
        #expect(CompanyIdentifier.hunterIndustries.name == #"Hunter Industries Incorporated"#)
        #expect(CompanyIdentifier.hunterIndustries.description == #"Hunter Industries Incorporated"#)
    
        // NEOKOHM SISTEMAS ELETRONICOS LTDA
        #expect(CompanyIdentifier.neokohmSistemasEletronicos.rawValue == 3478)
        #expect(CompanyIdentifier.neokohmSistemasEletronicos.name == #"NEOKOHM SISTEMAS ELETRONICOS LTDA"#)
        #expect(CompanyIdentifier.neokohmSistemasEletronicos.description == #"NEOKOHM SISTEMAS ELETRONICOS LTDA"#)
    
        // Zhejiang Huanfu Technology Co., LTD
        #expect(CompanyIdentifier.zhejiangHuanfuTechnology.rawValue == 3479)
        #expect(CompanyIdentifier.zhejiangHuanfuTechnology.name == #"Zhejiang Huanfu Technology Co., LTD"#)
        #expect(CompanyIdentifier.zhejiangHuanfuTechnology.description == #"Zhejiang Huanfu Technology Co., LTD"#)
    
        // E.F. Johnson Company
        #expect(CompanyIdentifier.eFJohnson.rawValue == 3480)
        #expect(CompanyIdentifier.eFJohnson.name == #"E.F. Johnson Company"#)
        #expect(CompanyIdentifier.eFJohnson.description == #"E.F. Johnson Company"#)
    
        // Caire Inc.
        #expect(CompanyIdentifier.caire.rawValue == 3481)
        #expect(CompanyIdentifier.caire.name == #"Caire Inc."#)
        #expect(CompanyIdentifier.caire.description == #"Caire Inc."#)
    
        // Yeasound (Xiamen) Hearing Technology Co., Ltd
        #expect(CompanyIdentifier.yeasoundXiamenHearingTechnology.rawValue == 3482)
        #expect(CompanyIdentifier.yeasoundXiamenHearingTechnology.name == #"Yeasound (Xiamen) Hearing Technology Co., Ltd"#)
        #expect(CompanyIdentifier.yeasoundXiamenHearingTechnology.description == #"Yeasound (Xiamen) Hearing Technology Co., Ltd"#)
    
        // Boxyz, Inc.
        #expect(CompanyIdentifier.boxyz.rawValue == 3483)
        #expect(CompanyIdentifier.boxyz.name == #"Boxyz, Inc."#)
        #expect(CompanyIdentifier.boxyz.description == #"Boxyz, Inc."#)
    
        // Skytech Creations Limited
        #expect(CompanyIdentifier.skytechCreations.rawValue == 3484)
        #expect(CompanyIdentifier.skytechCreations.name == #"Skytech Creations Limited"#)
        #expect(CompanyIdentifier.skytechCreations.description == #"Skytech Creations Limited"#)
    
        // Cear, Inc.
        #expect(CompanyIdentifier.cear.rawValue == 3485)
        #expect(CompanyIdentifier.cear.name == #"Cear, Inc."#)
        #expect(CompanyIdentifier.cear.description == #"Cear, Inc."#)
    
        // Impulse Wellness LLC
        #expect(CompanyIdentifier.impulseWellness.rawValue == 3486)
        #expect(CompanyIdentifier.impulseWellness.name == #"Impulse Wellness LLC"#)
        #expect(CompanyIdentifier.impulseWellness.description == #"Impulse Wellness LLC"#)
    
        // MML US, Inc
        #expect(CompanyIdentifier.mmlUs.rawValue == 3487)
        #expect(CompanyIdentifier.mmlUs.name == #"MML US, Inc"#)
        #expect(CompanyIdentifier.mmlUs.description == #"MML US, Inc"#)
    
        // SICK AG
        #expect(CompanyIdentifier.sick.rawValue == 3488)
        #expect(CompanyIdentifier.sick.name == #"SICK AG"#)
        #expect(CompanyIdentifier.sick.description == #"SICK AG"#)
    
        // Fen Systems Ltd.
        #expect(CompanyIdentifier.fenSystems.rawValue == 3489)
        #expect(CompanyIdentifier.fenSystems.name == #"Fen Systems Ltd."#)
        #expect(CompanyIdentifier.fenSystems.description == #"Fen Systems Ltd."#)
    
        // KIWI.KI GmbH
        #expect(CompanyIdentifier.kiwiKi.rawValue == 3490)
        #expect(CompanyIdentifier.kiwiKi.name == #"KIWI.KI GmbH"#)
        #expect(CompanyIdentifier.kiwiKi.description == #"KIWI.KI GmbH"#)
    
        // Airgraft Inc.
        #expect(CompanyIdentifier.airgraft.rawValue == 3491)
        #expect(CompanyIdentifier.airgraft.name == #"Airgraft Inc."#)
        #expect(CompanyIdentifier.airgraft.description == #"Airgraft Inc."#)
    
        // HP Tuners
        #expect(CompanyIdentifier.hpTuners.rawValue == 3492)
        #expect(CompanyIdentifier.hpTuners.name == #"HP Tuners"#)
        #expect(CompanyIdentifier.hpTuners.description == #"HP Tuners"#)
    
        // PIXELA CORPORATION
        #expect(CompanyIdentifier.pixela.rawValue == 3493)
        #expect(CompanyIdentifier.pixela.name == #"PIXELA CORPORATION"#)
        #expect(CompanyIdentifier.pixela.description == #"PIXELA CORPORATION"#)
    
        // Generac Corporation
        #expect(CompanyIdentifier.generac.rawValue == 3494)
        #expect(CompanyIdentifier.generac.name == #"Generac Corporation"#)
        #expect(CompanyIdentifier.generac.description == #"Generac Corporation"#)
    
        // Novoferm tormatic GmbH
        #expect(CompanyIdentifier.novofermTormatic.rawValue == 3495)
        #expect(CompanyIdentifier.novofermTormatic.name == #"Novoferm tormatic GmbH"#)
        #expect(CompanyIdentifier.novofermTormatic.description == #"Novoferm tormatic GmbH"#)
    
        // Airwallet ApS
        #expect(CompanyIdentifier.airwallet.rawValue == 3496)
        #expect(CompanyIdentifier.airwallet.name == #"Airwallet ApS"#)
        #expect(CompanyIdentifier.airwallet.description == #"Airwallet ApS"#)
    
        // Inventronics GmbH
        #expect(CompanyIdentifier.inventronics.rawValue == 3497)
        #expect(CompanyIdentifier.inventronics.name == #"Inventronics GmbH"#)
        #expect(CompanyIdentifier.inventronics.description == #"Inventronics GmbH"#)
    
        // Shenzhen EBELONG Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenEbelongTechnology.rawValue == 3498)
        #expect(CompanyIdentifier.shenzhenEbelongTechnology.name == #"Shenzhen EBELONG Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenEbelongTechnology.description == #"Shenzhen EBELONG Technology Co., Ltd."#)
    
        // Efento
        #expect(CompanyIdentifier.efento.rawValue == 3499)
        #expect(CompanyIdentifier.efento.name == #"Efento"#)
        #expect(CompanyIdentifier.efento.description == #"Efento"#)
    
        // ITALTRACTOR ITM S.P.A.
        #expect(CompanyIdentifier.italtractorItm.rawValue == 3500)
        #expect(CompanyIdentifier.italtractorItm.name == #"ITALTRACTOR ITM S.P.A."#)
        #expect(CompanyIdentifier.italtractorItm.description == #"ITALTRACTOR ITM S.P.A."#)
    
        // linktop
        #expect(CompanyIdentifier.linktop.rawValue == 3501)
        #expect(CompanyIdentifier.linktop.name == #"linktop"#)
        #expect(CompanyIdentifier.linktop.description == #"linktop"#)
    
        // TITUM AUDIO, INC.
        #expect(CompanyIdentifier.titumAudio.rawValue == 3502)
        #expect(CompanyIdentifier.titumAudio.name == #"TITUM AUDIO, INC."#)
        #expect(CompanyIdentifier.titumAudio.description == #"TITUM AUDIO, INC."#)
    
        // Hexagon Aura Reality AG
        #expect(CompanyIdentifier.hexagonAuraReality.rawValue == 3503)
        #expect(CompanyIdentifier.hexagonAuraReality.name == #"Hexagon Aura Reality AG"#)
        #expect(CompanyIdentifier.hexagonAuraReality.description == #"Hexagon Aura Reality AG"#)
    
        // Invisalert Solutions, Inc.
        #expect(CompanyIdentifier.invisalertSolutions.rawValue == 3504)
        #expect(CompanyIdentifier.invisalertSolutions.name == #"Invisalert Solutions, Inc."#)
        #expect(CompanyIdentifier.invisalertSolutions.description == #"Invisalert Solutions, Inc."#)
    
        // TELE System Communications Pte. Ltd.
        #expect(CompanyIdentifier.teleSystemCommunicationsPte.rawValue == 3505)
        #expect(CompanyIdentifier.teleSystemCommunicationsPte.name == #"TELE System Communications Pte. Ltd."#)
        #expect(CompanyIdentifier.teleSystemCommunicationsPte.description == #"TELE System Communications Pte. Ltd."#)
    
        // Whirlpool
        #expect(CompanyIdentifier.whirlpool.rawValue == 3506)
        #expect(CompanyIdentifier.whirlpool.name == #"Whirlpool"#)
        #expect(CompanyIdentifier.whirlpool.description == #"Whirlpool"#)
    
        // SHENZHEN REFLYING ELECTRONIC CO., LTD
        #expect(CompanyIdentifier.shenzhenReflyingElectronic.rawValue == 3507)
        #expect(CompanyIdentifier.shenzhenReflyingElectronic.name == #"SHENZHEN REFLYING ELECTRONIC CO., LTD"#)
        #expect(CompanyIdentifier.shenzhenReflyingElectronic.description == #"SHENZHEN REFLYING ELECTRONIC CO., LTD"#)
    
        // Franklin Control Systems
        #expect(CompanyIdentifier.franklinControlSystems.rawValue == 3508)
        #expect(CompanyIdentifier.franklinControlSystems.name == #"Franklin Control Systems"#)
        #expect(CompanyIdentifier.franklinControlSystems.description == #"Franklin Control Systems"#)
    
        // Djup AB
        #expect(CompanyIdentifier.djup.rawValue == 3509)
        #expect(CompanyIdentifier.djup.name == #"Djup AB"#)
        #expect(CompanyIdentifier.djup.description == #"Djup AB"#)
    
        // SAFEGUARD EQUIPMENT, INC.
        #expect(CompanyIdentifier.safeguardEquipment.rawValue == 3510)
        #expect(CompanyIdentifier.safeguardEquipment.name == #"SAFEGUARD EQUIPMENT, INC."#)
        #expect(CompanyIdentifier.safeguardEquipment.description == #"SAFEGUARD EQUIPMENT, INC."#)
    
        // Morningstar Corporation
        #expect(CompanyIdentifier.morningstar.rawValue == 3511)
        #expect(CompanyIdentifier.morningstar.name == #"Morningstar Corporation"#)
        #expect(CompanyIdentifier.morningstar.description == #"Morningstar Corporation"#)
    
        // Shenzhen Chuangyuan Digital Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenChuangyuanDigitalTechnology.rawValue == 3512)
        #expect(CompanyIdentifier.shenzhenChuangyuanDigitalTechnology.name == #"Shenzhen Chuangyuan Digital Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenChuangyuanDigitalTechnology.description == #"Shenzhen Chuangyuan Digital Technology Co., Ltd"#)
    
        // CompanyDeep Ltd
        #expect(CompanyIdentifier.companydeep.rawValue == 3513)
        #expect(CompanyIdentifier.companydeep.name == #"CompanyDeep Ltd"#)
        #expect(CompanyIdentifier.companydeep.description == #"CompanyDeep Ltd"#)
    
        // Veo Technologies ApS
        #expect(CompanyIdentifier.veoTechnologies.rawValue == 3514)
        #expect(CompanyIdentifier.veoTechnologies.name == #"Veo Technologies ApS"#)
        #expect(CompanyIdentifier.veoTechnologies.description == #"Veo Technologies ApS"#)
    
        // Nexis Link Technology Co., Ltd.
        #expect(CompanyIdentifier.nexisLinkTechnology.rawValue == 3515)
        #expect(CompanyIdentifier.nexisLinkTechnology.name == #"Nexis Link Technology Co., Ltd."#)
        #expect(CompanyIdentifier.nexisLinkTechnology.description == #"Nexis Link Technology Co., Ltd."#)
    
        // Felion Technologies Company Limited
        #expect(CompanyIdentifier.felionTechnologies.rawValue == 3516)
        #expect(CompanyIdentifier.felionTechnologies.name == #"Felion Technologies Company Limited"#)
        #expect(CompanyIdentifier.felionTechnologies.description == #"Felion Technologies Company Limited"#)
    
        // MAATEL
        #expect(CompanyIdentifier.maatel.rawValue == 3517)
        #expect(CompanyIdentifier.maatel.name == #"MAATEL"#)
        #expect(CompanyIdentifier.maatel.description == #"MAATEL"#)
    
        // HELLA GmbH & Co. KGaA
        #expect(CompanyIdentifier.hellaAa.rawValue == 3518)
        #expect(CompanyIdentifier.hellaAa.name == #"HELLA GmbH & Co. KGaA"#)
        #expect(CompanyIdentifier.hellaAa.description == #"HELLA GmbH & Co. KGaA"#)
    
        // HWM-Water Limited
        #expect(CompanyIdentifier.hwmWater.rawValue == 3519)
        #expect(CompanyIdentifier.hwmWater.name == #"HWM-Water Limited"#)
        #expect(CompanyIdentifier.hwmWater.description == #"HWM-Water Limited"#)
    
        // Shenzhen Jahport Electronic Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenJahportElectronicTechnology.rawValue == 3520)
        #expect(CompanyIdentifier.shenzhenJahportElectronicTechnology.name == #"Shenzhen Jahport Electronic Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenJahportElectronicTechnology.description == #"Shenzhen Jahport Electronic Technology Co., Ltd."#)
    
        // NACHI-FUJIKOSHI CORP.
        #expect(CompanyIdentifier.nachiFujikoshi.rawValue == 3521)
        #expect(CompanyIdentifier.nachiFujikoshi.name == #"NACHI-FUJIKOSHI CORP."#)
        #expect(CompanyIdentifier.nachiFujikoshi.description == #"NACHI-FUJIKOSHI CORP."#)
    
        // Cirrus Research plc
        #expect(CompanyIdentifier.cirrusResearchPlc.rawValue == 3522)
        #expect(CompanyIdentifier.cirrusResearchPlc.name == #"Cirrus Research plc"#)
        #expect(CompanyIdentifier.cirrusResearchPlc.description == #"Cirrus Research plc"#)
    
        // GEARBAC TECHNOLOGIES INC.
        #expect(CompanyIdentifier.gearbacTechnologies.rawValue == 3523)
        #expect(CompanyIdentifier.gearbacTechnologies.name == #"GEARBAC TECHNOLOGIES INC."#)
        #expect(CompanyIdentifier.gearbacTechnologies.description == #"GEARBAC TECHNOLOGIES INC."#)
    
        // Hangzhou NationalChip Science & Technology Co.,Ltd
        #expect(CompanyIdentifier.hangzhouNationalchipScienceTechnology.rawValue == 3524)
        #expect(CompanyIdentifier.hangzhouNationalchipScienceTechnology.name == #"Hangzhou NationalChip Science & Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.hangzhouNationalchipScienceTechnology.description == #"Hangzhou NationalChip Science & Technology Co.,Ltd"#)
    
        // DHL
        #expect(CompanyIdentifier.dhl.rawValue == 3525)
        #expect(CompanyIdentifier.dhl.name == #"DHL"#)
        #expect(CompanyIdentifier.dhl.description == #"DHL"#)
    
        // Levita
        #expect(CompanyIdentifier.levita.rawValue == 3526)
        #expect(CompanyIdentifier.levita.name == #"Levita"#)
        #expect(CompanyIdentifier.levita.description == #"Levita"#)
    
        // MORNINGSTAR FX PTE. LTD.
        #expect(CompanyIdentifier.morningstarFxPte.rawValue == 3527)
        #expect(CompanyIdentifier.morningstarFxPte.name == #"MORNINGSTAR FX PTE. LTD."#)
        #expect(CompanyIdentifier.morningstarFxPte.description == #"MORNINGSTAR FX PTE. LTD."#)
    
        // ETO GRUPPE TECHNOLOGIES GmbH
        #expect(CompanyIdentifier.etoGruppeTechnologies.rawValue == 3528)
        #expect(CompanyIdentifier.etoGruppeTechnologies.name == #"ETO GRUPPE TECHNOLOGIES GmbH"#)
        #expect(CompanyIdentifier.etoGruppeTechnologies.description == #"ETO GRUPPE TECHNOLOGIES GmbH"#)
    
        // farmunited GmbH
        #expect(CompanyIdentifier.farmunited.rawValue == 3529)
        #expect(CompanyIdentifier.farmunited.name == #"farmunited GmbH"#)
        #expect(CompanyIdentifier.farmunited.description == #"farmunited GmbH"#)
    
        // Aptener Mechatronics Private Limited
        #expect(CompanyIdentifier.aptenerMechatronics.rawValue == 3530)
        #expect(CompanyIdentifier.aptenerMechatronics.name == #"Aptener Mechatronics Private Limited"#)
        #expect(CompanyIdentifier.aptenerMechatronics.description == #"Aptener Mechatronics Private Limited"#)
    
        // GEOPH, LLC
        #expect(CompanyIdentifier.geoph.rawValue == 3531)
        #expect(CompanyIdentifier.geoph.name == #"GEOPH, LLC"#)
        #expect(CompanyIdentifier.geoph.description == #"GEOPH, LLC"#)
    
        // Trotec GmbH
        #expect(CompanyIdentifier.trotec.rawValue == 3532)
        #expect(CompanyIdentifier.trotec.name == #"Trotec GmbH"#)
        #expect(CompanyIdentifier.trotec.description == #"Trotec GmbH"#)
    
        // Astra LED AG
        #expect(CompanyIdentifier.astraLed.rawValue == 3533)
        #expect(CompanyIdentifier.astraLed.name == #"Astra LED AG"#)
        #expect(CompanyIdentifier.astraLed.description == #"Astra LED AG"#)
    
        // NOVAFON - Electromedical devices limited liability company
        #expect(CompanyIdentifier.novafonElectromedicalDevicesLiability.rawValue == 3534)
        #expect(CompanyIdentifier.novafonElectromedicalDevicesLiability.name == #"NOVAFON - Electromedical devices limited liability company"#)
        #expect(CompanyIdentifier.novafonElectromedicalDevicesLiability.description == #"NOVAFON - Electromedical devices limited liability company"#)
    
        // KUBU SMART LIMITED
        #expect(CompanyIdentifier.kubuSmart.rawValue == 3535)
        #expect(CompanyIdentifier.kubuSmart.name == #"KUBU SMART LIMITED"#)
        #expect(CompanyIdentifier.kubuSmart.description == #"KUBU SMART LIMITED"#)
    
        // ESNAH
        #expect(CompanyIdentifier.esnah.rawValue == 3536)
        #expect(CompanyIdentifier.esnah.name == #"ESNAH"#)
        #expect(CompanyIdentifier.esnah.description == #"ESNAH"#)
    
        // OrangeMicro Limited
        #expect(CompanyIdentifier.orangemicro.rawValue == 3537)
        #expect(CompanyIdentifier.orangemicro.name == #"OrangeMicro Limited"#)
        #expect(CompanyIdentifier.orangemicro.description == #"OrangeMicro Limited"#)
    
        // Sitecom Europe B.V.
        #expect(CompanyIdentifier.sitecomEurope.rawValue == 3538)
        #expect(CompanyIdentifier.sitecomEurope.name == #"Sitecom Europe B.V."#)
        #expect(CompanyIdentifier.sitecomEurope.description == #"Sitecom Europe B.V."#)
    
        // Global Satellite Engineering
        #expect(CompanyIdentifier.globalSatelliteEngineering.rawValue == 3539)
        #expect(CompanyIdentifier.globalSatelliteEngineering.name == #"Global Satellite Engineering"#)
        #expect(CompanyIdentifier.globalSatelliteEngineering.description == #"Global Satellite Engineering"#)
    
        // KOQOON GmbH & Co.KG
        #expect(CompanyIdentifier.koqoonKg.rawValue == 3540)
        #expect(CompanyIdentifier.koqoonKg.name == #"KOQOON GmbH & Co.KG"#)
        #expect(CompanyIdentifier.koqoonKg.description == #"KOQOON GmbH & Co.KG"#)
    
        // BEEPINGS
        #expect(CompanyIdentifier.beepings.rawValue == 3541)
        #expect(CompanyIdentifier.beepings.name == #"BEEPINGS"#)
        #expect(CompanyIdentifier.beepings.description == #"BEEPINGS"#)
    
        // MODULAR MEDICAL, INC.
        #expect(CompanyIdentifier.modularMedical.rawValue == 3542)
        #expect(CompanyIdentifier.modularMedical.name == #"MODULAR MEDICAL, INC."#)
        #expect(CompanyIdentifier.modularMedical.description == #"MODULAR MEDICAL, INC."#)
    
        // Xiant Technologies, Inc.
        #expect(CompanyIdentifier.xiantTechnologies.rawValue == 3543)
        #expect(CompanyIdentifier.xiantTechnologies.name == #"Xiant Technologies, Inc."#)
        #expect(CompanyIdentifier.xiantTechnologies.description == #"Xiant Technologies, Inc."#)
    
        // Granchip IoT Technology (Guangzhou) Co.,Ltd
        #expect(CompanyIdentifier.granchipIotTechnologyGuangzhou.rawValue == 3544)
        #expect(CompanyIdentifier.granchipIotTechnologyGuangzhou.name == #"Granchip IoT Technology (Guangzhou) Co.,Ltd"#)
        #expect(CompanyIdentifier.granchipIotTechnologyGuangzhou.description == #"Granchip IoT Technology (Guangzhou) Co.,Ltd"#)
    
        // SCHELL GmbH & Co. KG
        #expect(CompanyIdentifier.schell.rawValue == 3545)
        #expect(CompanyIdentifier.schell.name == #"SCHELL GmbH & Co. KG"#)
        #expect(CompanyIdentifier.schell.description == #"SCHELL GmbH & Co. KG"#)
    
        // Minebea Intec GmbH
        #expect(CompanyIdentifier.minebeaIntec.rawValue == 3546)
        #expect(CompanyIdentifier.minebeaIntec.name == #"Minebea Intec GmbH"#)
        #expect(CompanyIdentifier.minebeaIntec.description == #"Minebea Intec GmbH"#)
    
        // KAGA FEI Co., Ltd.
        #expect(CompanyIdentifier.kagaFei.rawValue == 3547)
        #expect(CompanyIdentifier.kagaFei.name == #"KAGA FEI Co., Ltd."#)
        #expect(CompanyIdentifier.kagaFei.description == #"KAGA FEI Co., Ltd."#)
    
        // AUTHOR-ALARM, razvoj in prodaja avtomobilskih sistemov proti kraji, d.o.o.
        #expect(CompanyIdentifier.authorAlarmRazvojInProdajaAvtomobilskihSistemovProtiKraji.rawValue == 3548)
        #expect(CompanyIdentifier.authorAlarmRazvojInProdajaAvtomobilskihSistemovProtiKraji.name == #"AUTHOR-ALARM, razvoj in prodaja avtomobilskih sistemov proti kraji, d.o.o."#)
        #expect(CompanyIdentifier.authorAlarmRazvojInProdajaAvtomobilskihSistemovProtiKraji.description == #"AUTHOR-ALARM, razvoj in prodaja avtomobilskih sistemov proti kraji, d.o.o."#)
    
        // Tozoa LLC
        #expect(CompanyIdentifier.tozoa.rawValue == 3549)
        #expect(CompanyIdentifier.tozoa.name == #"Tozoa LLC"#)
        #expect(CompanyIdentifier.tozoa.description == #"Tozoa LLC"#)
    
        // SHENZHEN DNS INDUSTRIES CO., LTD.
        #expect(CompanyIdentifier.shenzhenDnsIndustries.rawValue == 3550)
        #expect(CompanyIdentifier.shenzhenDnsIndustries.name == #"SHENZHEN DNS INDUSTRIES CO., LTD."#)
        #expect(CompanyIdentifier.shenzhenDnsIndustries.description == #"SHENZHEN DNS INDUSTRIES CO., LTD."#)
    
        // Shenzhen Lunci Technology Co., Ltd
        #expect(CompanyIdentifier.shenzhenLunciTechnology.rawValue == 3551)
        #expect(CompanyIdentifier.shenzhenLunciTechnology.name == #"Shenzhen Lunci Technology Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenLunciTechnology.description == #"Shenzhen Lunci Technology Co., Ltd"#)
    
        // KNOG PTY. LTD.
        #expect(CompanyIdentifier.knog.rawValue == 3552)
        #expect(CompanyIdentifier.knog.name == #"KNOG PTY. LTD."#)
        #expect(CompanyIdentifier.knog.description == #"KNOG PTY. LTD."#)
    
        // Outshiny India Private Limited
        #expect(CompanyIdentifier.outshinyIndia.rawValue == 3553)
        #expect(CompanyIdentifier.outshinyIndia.name == #"Outshiny India Private Limited"#)
        #expect(CompanyIdentifier.outshinyIndia.description == #"Outshiny India Private Limited"#)
    
        // TAMADIC Co., Ltd.
        #expect(CompanyIdentifier.tamadic.rawValue == 3554)
        #expect(CompanyIdentifier.tamadic.name == #"TAMADIC Co., Ltd."#)
        #expect(CompanyIdentifier.tamadic.description == #"TAMADIC Co., Ltd."#)
    
        // Shenzhen MODSEMI Co., Ltd
        #expect(CompanyIdentifier.shenzhenModsemi.rawValue == 3555)
        #expect(CompanyIdentifier.shenzhenModsemi.name == #"Shenzhen MODSEMI Co., Ltd"#)
        #expect(CompanyIdentifier.shenzhenModsemi.description == #"Shenzhen MODSEMI Co., Ltd"#)
    
        // EMBEINT INC
        #expect(CompanyIdentifier.embeint.rawValue == 3556)
        #expect(CompanyIdentifier.embeint.name == #"EMBEINT INC"#)
        #expect(CompanyIdentifier.embeint.description == #"EMBEINT INC"#)
    
        // Ehong Technology Co.,Ltd
        #expect(CompanyIdentifier.ehongTechnology.rawValue == 3557)
        #expect(CompanyIdentifier.ehongTechnology.name == #"Ehong Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.ehongTechnology.description == #"Ehong Technology Co.,Ltd"#)
    
        // DEXATEK Technology LTD
        #expect(CompanyIdentifier.dexatekTechnology.rawValue == 3558)
        #expect(CompanyIdentifier.dexatekTechnology.name == #"DEXATEK Technology LTD"#)
        #expect(CompanyIdentifier.dexatekTechnology.description == #"DEXATEK Technology LTD"#)
    
        // Dendro Technologies, Inc.
        #expect(CompanyIdentifier.dendroTechnologies.rawValue == 3559)
        #expect(CompanyIdentifier.dendroTechnologies.name == #"Dendro Technologies, Inc."#)
        #expect(CompanyIdentifier.dendroTechnologies.description == #"Dendro Technologies, Inc."#)
    
        // Vivint, Inc.
        #expect(CompanyIdentifier.vivint.rawValue == 3560)
        #expect(CompanyIdentifier.vivint.name == #"Vivint, Inc."#)
        #expect(CompanyIdentifier.vivint.description == #"Vivint, Inc."#)
    
        // General Laser GmbH
        #expect(CompanyIdentifier.generalLaser.rawValue == 3561)
        #expect(CompanyIdentifier.generalLaser.name == #"General Laser GmbH"#)
        #expect(CompanyIdentifier.generalLaser.description == #"General Laser GmbH"#)
    
        // Kathrein Solutions GmbH
        #expect(CompanyIdentifier.kathreinSolutions.rawValue == 3562)
        #expect(CompanyIdentifier.kathreinSolutions.name == #"Kathrein Solutions GmbH"#)
        #expect(CompanyIdentifier.kathreinSolutions.description == #"Kathrein Solutions GmbH"#)
    
        // Fitz Inc.
        #expect(CompanyIdentifier.fitz.rawValue == 3563)
        #expect(CompanyIdentifier.fitz.name == #"Fitz Inc."#)
        #expect(CompanyIdentifier.fitz.description == #"Fitz Inc."#)
    
        // ATEGENOS PHARMACEUTICALS INC
        #expect(CompanyIdentifier.ategenosPharmaceuticals.rawValue == 3564)
        #expect(CompanyIdentifier.ategenosPharmaceuticals.name == #"ATEGENOS PHARMACEUTICALS INC"#)
        #expect(CompanyIdentifier.ategenosPharmaceuticals.description == #"ATEGENOS PHARMACEUTICALS INC"#)
    
        // Flextronic GmbH
        #expect(CompanyIdentifier.flextronic.rawValue == 3565)
        #expect(CompanyIdentifier.flextronic.name == #"Flextronic GmbH"#)
        #expect(CompanyIdentifier.flextronic.description == #"Flextronic GmbH"#)
    
        // Safety Swim LLC
        #expect(CompanyIdentifier.safetySwim.rawValue == 3566)
        #expect(CompanyIdentifier.safetySwim.name == #"Safety Swim LLC"#)
        #expect(CompanyIdentifier.safetySwim.description == #"Safety Swim LLC"#)
    
        // SING SUN TECHNOLOGY (INTERNATIONAL) LIMITED
        #expect(CompanyIdentifier.singSunTechnologyInternational.rawValue == 3567)
        #expect(CompanyIdentifier.singSunTechnologyInternational.name == #"SING SUN TECHNOLOGY (INTERNATIONAL) LIMITED"#)
        #expect(CompanyIdentifier.singSunTechnologyInternational.description == #"SING SUN TECHNOLOGY (INTERNATIONAL) LIMITED"#)
    
        // Woncan (Hong Kong) Limited
        #expect(CompanyIdentifier.woncanHongKong.rawValue == 3568)
        #expect(CompanyIdentifier.woncanHongKong.name == #"Woncan (Hong Kong) Limited"#)
        #expect(CompanyIdentifier.woncanHongKong.description == #"Woncan (Hong Kong) Limited"#)
    
        // iFLYTEK (Suzhou) Technology Co., Ltd.
        #expect(CompanyIdentifier.iflytekSuzhouTechnology.rawValue == 3569)
        #expect(CompanyIdentifier.iflytekSuzhouTechnology.name == #"iFLYTEK (Suzhou) Technology Co., Ltd."#)
        #expect(CompanyIdentifier.iflytekSuzhouTechnology.description == #"iFLYTEK (Suzhou) Technology Co., Ltd."#)
    
        // Weber-Stephen Products LLC
        #expect(CompanyIdentifier.weberStephenProducts.rawValue == 3570)
        #expect(CompanyIdentifier.weberStephenProducts.name == #"Weber-Stephen Products LLC"#)
        #expect(CompanyIdentifier.weberStephenProducts.description == #"Weber-Stephen Products LLC"#)
    
        // hDrop Technologies Inc.
        #expect(CompanyIdentifier.hdropTechnologies.rawValue == 3571)
        #expect(CompanyIdentifier.hdropTechnologies.name == #"hDrop Technologies Inc."#)
        #expect(CompanyIdentifier.hdropTechnologies.description == #"hDrop Technologies Inc."#)
    
        // REEKON TOOLS INC.
        #expect(CompanyIdentifier.reekonTools.rawValue == 3572)
        #expect(CompanyIdentifier.reekonTools.name == #"REEKON TOOLS INC."#)
        #expect(CompanyIdentifier.reekonTools.description == #"REEKON TOOLS INC."#)
    
        // Delta Faucet Company
        #expect(CompanyIdentifier.deltaFaucet.rawValue == 3573)
        #expect(CompanyIdentifier.deltaFaucet.name == #"Delta Faucet Company"#)
        #expect(CompanyIdentifier.deltaFaucet.description == #"Delta Faucet Company"#)
    
        // Mutrack Co., Ltd
        #expect(CompanyIdentifier.mutrack.rawValue == 3574)
        #expect(CompanyIdentifier.mutrack.name == #"Mutrack Co., Ltd"#)
        #expect(CompanyIdentifier.mutrack.description == #"Mutrack Co., Ltd"#)
    
        // Hangzhou Zhaotong Microelectronics Co., Ltd.
        #expect(CompanyIdentifier.hangzhouZhaotongMicroelectronics.rawValue == 3575)
        #expect(CompanyIdentifier.hangzhouZhaotongMicroelectronics.name == #"Hangzhou Zhaotong Microelectronics Co., Ltd."#)
        #expect(CompanyIdentifier.hangzhouZhaotongMicroelectronics.description == #"Hangzhou Zhaotong Microelectronics Co., Ltd."#)
    
        // Chengdu CSCT Microelectronics Co., Ltd.
        #expect(CompanyIdentifier.chengduCsctMicroelectronics.rawValue == 3576)
        #expect(CompanyIdentifier.chengduCsctMicroelectronics.name == #"Chengdu CSCT Microelectronics Co., Ltd."#)
        #expect(CompanyIdentifier.chengduCsctMicroelectronics.description == #"Chengdu CSCT Microelectronics Co., Ltd."#)
    
        // Belusun Technology Ltd.
        #expect(CompanyIdentifier.belusunTechnology.rawValue == 3577)
        #expect(CompanyIdentifier.belusunTechnology.name == #"Belusun Technology Ltd."#)
        #expect(CompanyIdentifier.belusunTechnology.description == #"Belusun Technology Ltd."#)
    
        // Shenzhen Matches IoT Technology Co., Ltd.
        #expect(CompanyIdentifier.shenzhenMatchesIotTechnology.rawValue == 3578)
        #expect(CompanyIdentifier.shenzhenMatchesIotTechnology.name == #"Shenzhen Matches IoT Technology Co., Ltd."#)
        #expect(CompanyIdentifier.shenzhenMatchesIotTechnology.description == #"Shenzhen Matches IoT Technology Co., Ltd."#)
    
        // Beidou Intelligent Connected Vehicle Technology Co., Ltd.
        #expect(CompanyIdentifier.beidouIntelligentConnectedVehicleTechnology.rawValue == 3579)
        #expect(CompanyIdentifier.beidouIntelligentConnectedVehicleTechnology.name == #"Beidou Intelligent Connected Vehicle Technology Co., Ltd."#)
        #expect(CompanyIdentifier.beidouIntelligentConnectedVehicleTechnology.description == #"Beidou Intelligent Connected Vehicle Technology Co., Ltd."#)
    
        // SOJI ELECTRONICS JOINT STOCK COMPANY
        #expect(CompanyIdentifier.sojiElectronics.rawValue == 3580)
        #expect(CompanyIdentifier.sojiElectronics.name == #"SOJI ELECTRONICS JOINT STOCK COMPANY"#)
        #expect(CompanyIdentifier.sojiElectronics.description == #"SOJI ELECTRONICS JOINT STOCK COMPANY"#)
    
        // BH Technologies
        #expect(CompanyIdentifier.bhTechnologies.rawValue == 3581)
        #expect(CompanyIdentifier.bhTechnologies.name == #"BH Technologies"#)
        #expect(CompanyIdentifier.bhTechnologies.description == #"BH Technologies"#)
    
        // Haptech, Inc.
        #expect(CompanyIdentifier.haptech.rawValue == 3582)
        #expect(CompanyIdentifier.haptech.name == #"Haptech, Inc."#)
        #expect(CompanyIdentifier.haptech.description == #"Haptech, Inc."#)
    
        // WaveRF, Corp.
        #expect(CompanyIdentifier.waverf.rawValue == 3583)
        #expect(CompanyIdentifier.waverf.name == #"WaveRF, Corp."#)
        #expect(CompanyIdentifier.waverf.description == #"WaveRF, Corp."#)
    
        // SHENZHEN SOUNDSOUL INFORMATION TECHNOLOGY CO.,LTD
        #expect(CompanyIdentifier.shenzhenSoundsoulInformationTechnology.rawValue == 3584)
        #expect(CompanyIdentifier.shenzhenSoundsoulInformationTechnology.name == #"SHENZHEN SOUNDSOUL INFORMATION TECHNOLOGY CO.,LTD"#)
        #expect(CompanyIdentifier.shenzhenSoundsoulInformationTechnology.description == #"SHENZHEN SOUNDSOUL INFORMATION TECHNOLOGY CO.,LTD"#)
    
        // Wuhu Mengbo Technology Co., Ltd.
        #expect(CompanyIdentifier.wuhuMengboTechnology.rawValue == 3585)
        #expect(CompanyIdentifier.wuhuMengboTechnology.name == #"Wuhu Mengbo Technology Co., Ltd."#)
        #expect(CompanyIdentifier.wuhuMengboTechnology.description == #"Wuhu Mengbo Technology Co., Ltd."#)
    
        // PROSYS DEV LIMITED
        #expect(CompanyIdentifier.prosysDev.rawValue == 3586)
        #expect(CompanyIdentifier.prosysDev.name == #"PROSYS DEV LIMITED"#)
        #expect(CompanyIdentifier.prosysDev.description == #"PROSYS DEV LIMITED"#)
    
        // Shenzhen eMeet technology Co.,Ltd
        #expect(CompanyIdentifier.shenzhenEmeetTechnology.rawValue == 3587)
        #expect(CompanyIdentifier.shenzhenEmeetTechnology.name == #"Shenzhen eMeet technology Co.,Ltd"#)
        #expect(CompanyIdentifier.shenzhenEmeetTechnology.description == #"Shenzhen eMeet technology Co.,Ltd"#)
    
        // Doro AB
        #expect(CompanyIdentifier.doro.rawValue == 3588)
        #expect(CompanyIdentifier.doro.name == #"Doro AB"#)
        #expect(CompanyIdentifier.doro.description == #"Doro AB"#)
    
        // SUREPULSE MEDICAL LIMITED
        #expect(CompanyIdentifier.surepulseMedical.rawValue == 3589)
        #expect(CompanyIdentifier.surepulseMedical.name == #"SUREPULSE MEDICAL LIMITED"#)
        #expect(CompanyIdentifier.surepulseMedical.description == #"SUREPULSE MEDICAL LIMITED"#)
    
        // iodyne, LLC
        #expect(CompanyIdentifier.iodyne.rawValue == 3590)
        #expect(CompanyIdentifier.iodyne.name == #"iodyne, LLC"#)
        #expect(CompanyIdentifier.iodyne.description == #"iodyne, LLC"#)
    
        // Pinpoint GmbH
        #expect(CompanyIdentifier.pinpoint.rawValue == 3591)
        #expect(CompanyIdentifier.pinpoint.name == #"Pinpoint GmbH"#)
        #expect(CompanyIdentifier.pinpoint.description == #"Pinpoint GmbH"#)
    
        // Heinrich Kopp GmbH
        #expect(CompanyIdentifier.heinrichKopp.rawValue == 3592)
        #expect(CompanyIdentifier.heinrichKopp.name == #"Heinrich Kopp GmbH"#)
        #expect(CompanyIdentifier.heinrichKopp.description == #"Heinrich Kopp GmbH"#)
    
        // Evolutive Systems SL
        #expect(CompanyIdentifier.evolutiveSystems.rawValue == 3593)
        #expect(CompanyIdentifier.evolutiveSystems.name == #"Evolutive Systems SL"#)
        #expect(CompanyIdentifier.evolutiveSystems.description == #"Evolutive Systems SL"#)
    
        // PRINT INTERNATIONAL LIMITED
        #expect(CompanyIdentifier.printInternational.rawValue == 3594)
        #expect(CompanyIdentifier.printInternational.name == #"PRINT INTERNATIONAL LIMITED"#)
        #expect(CompanyIdentifier.printInternational.description == #"PRINT INTERNATIONAL LIMITED"#)
    
        // Sounding Audio Industrial Ltd.
        #expect(CompanyIdentifier.soundingAudioIndustrial.rawValue == 3595)
        #expect(CompanyIdentifier.soundingAudioIndustrial.name == #"Sounding Audio Industrial Ltd."#)
        #expect(CompanyIdentifier.soundingAudioIndustrial.description == #"Sounding Audio Industrial Ltd."#)
    
        // Yuanfeng Technology Co., Ltd.
        #expect(CompanyIdentifier.yuanfengTechnology.rawValue == 3596)
        #expect(CompanyIdentifier.yuanfengTechnology.name == #"Yuanfeng Technology Co., Ltd."#)
        #expect(CompanyIdentifier.yuanfengTechnology.description == #"Yuanfeng Technology Co., Ltd."#)
    
        // FrontAct Co., Ltd.
        #expect(CompanyIdentifier.frontact.rawValue == 3597)
        #expect(CompanyIdentifier.frontact.name == #"FrontAct Co., Ltd."#)
        #expect(CompanyIdentifier.frontact.description == #"FrontAct Co., Ltd."#)
    
        // ALOGIC CORPORATION PTY LTD
        #expect(CompanyIdentifier.alogic.rawValue == 3598)
        #expect(CompanyIdentifier.alogic.name == #"ALOGIC CORPORATION PTY LTD"#)
        #expect(CompanyIdentifier.alogic.description == #"ALOGIC CORPORATION PTY LTD"#)
    
        // SenseWorks Tecnologia Ltda.
        #expect(CompanyIdentifier.senseworksTecnologia.rawValue == 3599)
        #expect(CompanyIdentifier.senseworksTecnologia.name == #"SenseWorks Tecnologia Ltda."#)
        #expect(CompanyIdentifier.senseworksTecnologia.description == #"SenseWorks Tecnologia Ltda."#)
    
        // Eko Health, Inc.
        #expect(CompanyIdentifier.ekoHealth.rawValue == 3600)
        #expect(CompanyIdentifier.ekoHealth.name == #"Eko Health, Inc."#)
        #expect(CompanyIdentifier.ekoHealth.description == #"Eko Health, Inc."#)
    
        // Wanzl GmbH & Co. KGaA
        #expect(CompanyIdentifier.wanzlAa.rawValue == 3601)
        #expect(CompanyIdentifier.wanzlAa.name == #"Wanzl GmbH & Co. KGaA"#)
        #expect(CompanyIdentifier.wanzlAa.description == #"Wanzl GmbH & Co. KGaA"#)
    
        // CLEVER LOGGER TECHNOLOGIES PTY LIMITED
        #expect(CompanyIdentifier.cleverLoggerTechnologies.rawValue == 3602)
        #expect(CompanyIdentifier.cleverLoggerTechnologies.name == #"CLEVER LOGGER TECHNOLOGIES PTY LIMITED"#)
        #expect(CompanyIdentifier.cleverLoggerTechnologies.description == #"CLEVER LOGGER TECHNOLOGIES PTY LIMITED"#)
    
        // ASYSTOM
        #expect(CompanyIdentifier.asystom.rawValue == 3603)
        #expect(CompanyIdentifier.asystom.name == #"ASYSTOM"#)
        #expect(CompanyIdentifier.asystom.description == #"ASYSTOM"#)
    
        // Heilongjiang Tianyouwei Electronics Co.,Ltd.
        #expect(CompanyIdentifier.heilongjiangTianyouweiElectronics.rawValue == 3604)
        #expect(CompanyIdentifier.heilongjiangTianyouweiElectronics.name == #"Heilongjiang Tianyouwei Electronics Co.,Ltd."#)
        #expect(CompanyIdentifier.heilongjiangTianyouweiElectronics.description == #"Heilongjiang Tianyouwei Electronics Co.,Ltd."#)
    
        // Eastern Partner Limited
        #expect(CompanyIdentifier.easternPartner.rawValue == 3605)
        #expect(CompanyIdentifier.easternPartner.name == #"Eastern Partner Limited"#)
        #expect(CompanyIdentifier.easternPartner.description == #"Eastern Partner Limited"#)
    
        // Xiamen RUI YI Da Electronic Technology Co.,Ltd
        #expect(CompanyIdentifier.xiamenRuiYiDaElectronicTechnology.rawValue == 3606)
        #expect(CompanyIdentifier.xiamenRuiYiDaElectronicTechnology.name == #"Xiamen RUI YI Da Electronic Technology Co.,Ltd"#)
        #expect(CompanyIdentifier.xiamenRuiYiDaElectronicTechnology.description == #"Xiamen RUI YI Da Electronic Technology Co.,Ltd"#)
    
        // Ad Hoc Electronics, llc.
        #expect(CompanyIdentifier.adHocElectronics.rawValue == 3607)
        #expect(CompanyIdentifier.adHocElectronics.name == #"Ad Hoc Electronics, llc."#)
        #expect(CompanyIdentifier.adHocElectronics.description == #"Ad Hoc Electronics, llc."#)
    
        // Hangzhou Microimage Software Co.,Ltd.
        #expect(CompanyIdentifier.hangzhouMicroimageSoftware.rawValue == 3608)
        #expect(CompanyIdentifier.hangzhouMicroimageSoftware.name == #"Hangzhou Microimage Software Co.,Ltd."#)
        #expect(CompanyIdentifier.hangzhouMicroimageSoftware.description == #"Hangzhou Microimage Software Co.,Ltd."#)
    
        // Hive-Zox International SA
        #expect(CompanyIdentifier.hiveZoxInternational.rawValue == 3609)
        #expect(CompanyIdentifier.hiveZoxInternational.name == #"Hive-Zox International SA"#)
        #expect(CompanyIdentifier.hiveZoxInternational.description == #"Hive-Zox International SA"#)
    
        // Sensovo GmbH
        #expect(CompanyIdentifier.sensovo.rawValue == 3610)
        #expect(CompanyIdentifier.sensovo.name == #"Sensovo GmbH"#)
        #expect(CompanyIdentifier.sensovo.description == #"Sensovo GmbH"#)
    
        // Time Location Systems AS
        #expect(CompanyIdentifier.timeLocationSystems.rawValue == 3611)
        #expect(CompanyIdentifier.timeLocationSystems.name == #"Time Location Systems AS"#)
        #expect(CompanyIdentifier.timeLocationSystems.description == #"Time Location Systems AS"#)
    
        // SHENZHEN DIGITECH CO., LTD
        #expect(CompanyIdentifier.shenzhenDigitech.rawValue == 3612)
        #expect(CompanyIdentifier.shenzhenDigitech.name == #"SHENZHEN DIGITECH CO., LTD"#)
        #expect(CompanyIdentifier.shenzhenDigitech.description == #"SHENZHEN DIGITECH CO., LTD"#)
    
        // Capte B.V.
        #expect(CompanyIdentifier.capte.rawValue == 3613)
        #expect(CompanyIdentifier.capte.name == #"Capte B.V."#)
        #expect(CompanyIdentifier.capte.description == #"Capte B.V."#)
    
        // 9512-5837 QUEBEC INC.
        #expect(CompanyIdentifier.company95125837Quebec.rawValue == 3614)
        #expect(CompanyIdentifier.company95125837Quebec.name == #"9512-5837 QUEBEC INC."#)
        #expect(CompanyIdentifier.company95125837Quebec.description == #"9512-5837 QUEBEC INC."#)
    
        // Blecon Ltd
        #expect(CompanyIdentifier.blecon.rawValue == 3615)
        #expect(CompanyIdentifier.blecon.name == #"Blecon Ltd"#)
        #expect(CompanyIdentifier.blecon.description == #"Blecon Ltd"#)
    
        // CFLAB TEKNOLOJI TICARET LIMITED SIRKETI
        #expect(CompanyIdentifier.cflabTeknolojiTicaretSirketi.rawValue == 3616)
        #expect(CompanyIdentifier.cflabTeknolojiTicaretSirketi.name == #"CFLAB TEKNOLOJI TICARET LIMITED SIRKETI"#)
        #expect(CompanyIdentifier.cflabTeknolojiTicaretSirketi.description == #"CFLAB TEKNOLOJI TICARET LIMITED SIRKETI"#)
    
        // FOGO
        #expect(CompanyIdentifier.fogo.rawValue == 3617)
        #expect(CompanyIdentifier.fogo.name == #"FOGO"#)
        #expect(CompanyIdentifier.fogo.description == #"FOGO"#)
    
        // HITO INC
        #expect(CompanyIdentifier.hito.rawValue == 3618)
        #expect(CompanyIdentifier.hito.name == #"HITO INC"#)
        #expect(CompanyIdentifier.hito.description == #"HITO INC"#)
    
        // MS kajak7 UG (limited liability)
        #expect(CompanyIdentifier.msKajak7UgLimitedLiability.rawValue == 3620)
        #expect(CompanyIdentifier.msKajak7UgLimitedLiability.name == #"MS kajak7 UG (limited liability)"#)
        #expect(CompanyIdentifier.msKajak7UgLimitedLiability.description == #"MS kajak7 UG (limited liability)"#)
    
        // Hangzhou Hikvision Digital Technology Co., Ltd.
        #expect(CompanyIdentifier.hangzhouHikvisionDigitalTechnology.rawValue == 3621)
        #expect(CompanyIdentifier.hangzhouHikvisionDigitalTechnology.name == #"Hangzhou Hikvision Digital Technology Co., Ltd."#)
        #expect(CompanyIdentifier.hangzhouHikvisionDigitalTechnology.description == #"Hangzhou Hikvision Digital Technology Co., Ltd."#)
    
        // LIHJOEN SPEED METER CO., LTD.
        #expect(CompanyIdentifier.lihjoenSpeedMeter.rawValue == 3622)
        #expect(CompanyIdentifier.lihjoenSpeedMeter.name == #"LIHJOEN SPEED METER CO., LTD."#)
        #expect(CompanyIdentifier.lihjoenSpeedMeter.description == #"LIHJOEN SPEED METER CO., LTD."#)
    
        // NextSense, Inc.
        #expect(CompanyIdentifier.nextsense.rawValue == 3623)
        #expect(CompanyIdentifier.nextsense.name == #"NextSense, Inc."#)
        #expect(CompanyIdentifier.nextsense.description == #"NextSense, Inc."#)
    
        // PatchRx, Inc.
        #expect(CompanyIdentifier.patchrx.rawValue == 3624)
        #expect(CompanyIdentifier.patchrx.name == #"PatchRx, Inc."#)
        #expect(CompanyIdentifier.patchrx.description == #"PatchRx, Inc."#)
    
        // Flipper Devices Inc.
        #expect(CompanyIdentifier.flipperDevices.rawValue == 3625)
        #expect(CompanyIdentifier.flipperDevices.name == #"Flipper Devices Inc."#)
        #expect(CompanyIdentifier.flipperDevices.description == #"Flipper Devices Inc."#)
    
        // Huizhou Foryou General Electronics Co., Ltd.
        #expect(CompanyIdentifier.huizhouForyouGeneralElectronics.rawValue == 3626)
        #expect(CompanyIdentifier.huizhouForyouGeneralElectronics.name == #"Huizhou Foryou General Electronics Co., Ltd."#)
        #expect(CompanyIdentifier.huizhouForyouGeneralElectronics.description == #"Huizhou Foryou General Electronics Co., Ltd."#)
    
        // JE electronic a/s
        #expect(CompanyIdentifier.jeElectronic.rawValue == 3627)
        #expect(CompanyIdentifier.jeElectronic.name == #"JE electronic a/s"#)
        #expect(CompanyIdentifier.jeElectronic.description == #"JE electronic a/s"#)
    
        // 9313-7263 Quebec inc.
        #expect(CompanyIdentifier.company93137263Quebec.rawValue == 3628)
        #expect(CompanyIdentifier.company93137263Quebec.name == #"9313-7263 Quebec inc."#)
        #expect(CompanyIdentifier.company93137263Quebec.description == #"9313-7263 Quebec inc."#)
    
        // ECARX (Hubei) Tech Co.,Ltd.
        #expect(CompanyIdentifier.ecarxHubeiTech.rawValue == 3629)
        #expect(CompanyIdentifier.ecarxHubeiTech.name == #"ECARX (Hubei) Tech Co.,Ltd."#)
        #expect(CompanyIdentifier.ecarxHubeiTech.description == #"ECARX (Hubei) Tech Co.,Ltd."#)
    
        // NIHON KOHDEN CORPORATION
        #expect(CompanyIdentifier.nihonKohden.rawValue == 3630)
        #expect(CompanyIdentifier.nihonKohden.name == #"NIHON KOHDEN CORPORATION"#)
        #expect(CompanyIdentifier.nihonKohden.description == #"NIHON KOHDEN CORPORATION"#)
    
        // ONWI
        #expect(CompanyIdentifier.onwi.rawValue == 3631)
        #expect(CompanyIdentifier.onwi.name == #"ONWI"#)
        #expect(CompanyIdentifier.onwi.description == #"ONWI"#)
    
        // Primax Electronics Ltd.
        #expect(CompanyIdentifier.primaxElectronics.rawValue == 3632)
        #expect(CompanyIdentifier.primaxElectronics.name == #"Primax Electronics Ltd."#)
        #expect(CompanyIdentifier.primaxElectronics.description == #"Primax Electronics Ltd."#)
    
        // AlphaTheta Corporation
        #expect(CompanyIdentifier.alphatheta.rawValue == 3633)
        #expect(CompanyIdentifier.alphatheta.name == #"AlphaTheta Corporation"#)
        #expect(CompanyIdentifier.alphatheta.description == #"AlphaTheta Corporation"#)
    
        // PACIFIC INDUSTRIAL CO., LTD.
        #expect(CompanyIdentifier.pacificIndustrial.rawValue == 3634)
        #expect(CompanyIdentifier.pacificIndustrial.name == #"PACIFIC INDUSTRIAL CO., LTD."#)
        #expect(CompanyIdentifier.pacificIndustrial.description == #"PACIFIC INDUSTRIAL CO., LTD."#)
    
        // Crescent NV
        #expect(CompanyIdentifier.crescent.rawValue == 3635)
        #expect(CompanyIdentifier.crescent.name == #"Crescent NV"#)
        #expect(CompanyIdentifier.crescent.description == #"Crescent NV"#)
    
        // Vermis, software solutions llc
        #expect(CompanyIdentifier.vermisSoftwareSolutions.rawValue == 3636)
        #expect(CompanyIdentifier.vermisSoftwareSolutions.name == #"Vermis, software solutions llc"#)
        #expect(CompanyIdentifier.vermisSoftwareSolutions.description == #"Vermis, software solutions llc"#)
    
        // SNAPPWISH LLC
        #expect(CompanyIdentifier.snappwish.rawValue == 3637)
        #expect(CompanyIdentifier.snappwish.name == #"SNAPPWISH LLC"#)
        #expect(CompanyIdentifier.snappwish.description == #"SNAPPWISH LLC"#)
    
        // Cousins and Sears LLC
        #expect(CompanyIdentifier.cousinsAndSears.rawValue == 3638)
        #expect(CompanyIdentifier.cousinsAndSears.name == #"Cousins and Sears LLC"#)
        #expect(CompanyIdentifier.cousinsAndSears.description == #"Cousins and Sears LLC"#)
    
        // CESYS Gesellschaft für angewandte Mikroelektronik mbH
        #expect(CompanyIdentifier.cesysGesellschaftFurAngewandteMikroelektronik.rawValue == 3639)
        #expect(CompanyIdentifier.cesysGesellschaftFurAngewandteMikroelektronik.name == #"CESYS Gesellschaft für angewandte Mikroelektronik mbH"#)
        #expect(CompanyIdentifier.cesysGesellschaftFurAngewandteMikroelektronik.description == #"CESYS Gesellschaft für angewandte Mikroelektronik mbH"#)
    
        // SLOC GmbH
        #expect(CompanyIdentifier.sloc.rawValue == 3640)
        #expect(CompanyIdentifier.sloc.name == #"SLOC GmbH"#)
        #expect(CompanyIdentifier.sloc.description == #"SLOC GmbH"#)
    
        // IRES Infrarot Energie Systeme GmbH
        #expect(CompanyIdentifier.iresInfrarotEnergieSysteme.rawValue == 3641)
        #expect(CompanyIdentifier.iresInfrarotEnergieSysteme.name == #"IRES Infrarot Energie Systeme GmbH"#)
        #expect(CompanyIdentifier.iresInfrarotEnergieSysteme.description == #"IRES Infrarot Energie Systeme GmbH"#)
    
        // OFIVE LIMITED
        #expect(CompanyIdentifier.ofive.rawValue == 3642)
        #expect(CompanyIdentifier.ofive.name == #"OFIVE LIMITED"#)
        #expect(CompanyIdentifier.ofive.description == #"OFIVE LIMITED"#)
    
        // Swift IOT Tech (Shenzhen) Co., LTD.
        #expect(CompanyIdentifier.swiftIotTechShenzhen.rawValue == 3643)
        #expect(CompanyIdentifier.swiftIotTechShenzhen.name == #"Swift IOT Tech (Shenzhen) Co., LTD."#)
        #expect(CompanyIdentifier.swiftIotTechShenzhen.description == #"Swift IOT Tech (Shenzhen) Co., LTD."#)
    
        // Viselabs
        #expect(CompanyIdentifier.viselabs.rawValue == 3644)
        #expect(CompanyIdentifier.viselabs.name == #"Viselabs"#)
        #expect(CompanyIdentifier.viselabs.description == #"Viselabs"#)
    
        // Walmart Inc.
        #expect(CompanyIdentifier.walmart.rawValue == 3645)
        #expect(CompanyIdentifier.walmart.name == #"Walmart Inc."#)
        #expect(CompanyIdentifier.walmart.description == #"Walmart Inc."#)
    
        // VANBOX
        #expect(CompanyIdentifier.vanbox.rawValue == 3646)
        #expect(CompanyIdentifier.vanbox.name == #"VANBOX"#)
        #expect(CompanyIdentifier.vanbox.description == #"VANBOX"#)
    
        // Wiser Devices, LLC
        #expect(CompanyIdentifier.wiserDevices.rawValue == 3647)
        #expect(CompanyIdentifier.wiserDevices.name == #"Wiser Devices, LLC"#)
        #expect(CompanyIdentifier.wiserDevices.description == #"Wiser Devices, LLC"#)
    
        // WKD Labs Ltd
        #expect(CompanyIdentifier.wkdLabs.rawValue == 3648)
        #expect(CompanyIdentifier.wkdLabs.name == #"WKD Labs Ltd"#)
        #expect(CompanyIdentifier.wkdLabs.description == #"WKD Labs Ltd"#)
    
        // Asustek Computer Inc.
        #expect(CompanyIdentifier.asustekComputer.rawValue == 3649)
        #expect(CompanyIdentifier.asustekComputer.name == #"Asustek Computer Inc."#)
        #expect(CompanyIdentifier.asustekComputer.description == #"Asustek Computer Inc."#)
    
        // Z-ONE Technology Co., Ltd.
        #expect(CompanyIdentifier.zOneTechnology.rawValue == 3650)
        #expect(CompanyIdentifier.zOneTechnology.name == #"Z-ONE Technology Co., Ltd."#)
        #expect(CompanyIdentifier.zOneTechnology.description == #"Z-ONE Technology Co., Ltd."#)
    
    }

}
#endif
// swiftlint:enable type_body_length
