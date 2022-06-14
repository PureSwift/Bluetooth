//
//  CompanyIdentifiers.swift
//  Bluetooth
//

#if swift(<5.6) || SWIFTPM_DISABLE_PLUGINS
public extension CompanyIdentifier {

    /// Ericsson Technology Licensing (`0`)
    @_alwaysEmitIntoClient
    static var ericssonTechnologyLicensing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 0)
    }

    /// Nokia Mobile Phones (`1`)
    @_alwaysEmitIntoClient
    static var nokiaMobilePhones: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1)
    }

    /// Intel Corp. (`2`)
    @_alwaysEmitIntoClient
    static var intel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2)
    }

    /// IBM Corp. (`3`)
    @_alwaysEmitIntoClient
    static var ibm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3)
    }

    /// Toshiba Corp. (`4`)
    @_alwaysEmitIntoClient
    static var toshiba: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 4)
    }

    /// 3Com (`5`)
    @_alwaysEmitIntoClient
    static var uuid3Com: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 5)
    }

    /// Microsoft (`6`)
    @_alwaysEmitIntoClient
    static var microsoft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 6)
    }

    /// Lucent (`7`)
    @_alwaysEmitIntoClient
    static var lucent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 7)
    }

    /// Motorola (`8`)
    @_alwaysEmitIntoClient
    static var motorola: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 8)
    }

    /// Infineon Technologies AG (`9`)
    @_alwaysEmitIntoClient
    static var infineonTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 9)
    }

    /// Qualcomm Technologies International, Ltd. (QTIL) (`10`)
    @_alwaysEmitIntoClient
    static var qualcommTechnologiesInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 10)
    }

    /// Silicon Wave (`11`)
    @_alwaysEmitIntoClient
    static var siliconWave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 11)
    }

    /// Digianswer A/S (`12`)
    @_alwaysEmitIntoClient
    static var digianswer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 12)
    }

    /// Texas Instruments Inc. (`13`)
    @_alwaysEmitIntoClient
    static var texasInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 13)
    }

    /// Ceva, Inc. (formerly Parthus Technologies, Inc.) (`14`)
    @_alwaysEmitIntoClient
    static var cevaFormerlyParthusTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 14)
    }

    /// Broadcom Corporation (`15`)
    @_alwaysEmitIntoClient
    static var broadcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 15)
    }

    /// Mitel Semiconductor (`16`)
    @_alwaysEmitIntoClient
    static var mitelSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 16)
    }

    /// Widcomm, Inc (`17`)
    @_alwaysEmitIntoClient
    static var widcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 17)
    }

    /// Zeevo, Inc. (`18`)
    @_alwaysEmitIntoClient
    static var zeevo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 18)
    }

    /// Atmel Corporation (`19`)
    @_alwaysEmitIntoClient
    static var atmel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 19)
    }

    /// Mitsubishi Electric Corporation (`20`)
    @_alwaysEmitIntoClient
    static var mitsubishiElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 20)
    }

    /// RTX Telecom A/S (`21`)
    @_alwaysEmitIntoClient
    static var rtxTelecom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 21)
    }

    /// KC Technology Inc. (`22`)
    @_alwaysEmitIntoClient
    static var kcTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 22)
    }

    /// NewLogic (`23`)
    @_alwaysEmitIntoClient
    static var newlogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 23)
    }

    /// Transilica, Inc. (`24`)
    @_alwaysEmitIntoClient
    static var transilica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 24)
    }

    /// Rohde & Schwarz GmbH & Co. KG (`25`)
    @_alwaysEmitIntoClient
    static var rohdeSchwarz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 25)
    }

    /// TTPCom Limited (`26`)
    @_alwaysEmitIntoClient
    static var ttpcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 26)
    }

    /// Signia Technologies, Inc. (`27`)
    @_alwaysEmitIntoClient
    static var signiaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 27)
    }

    /// Conexant Systems Inc. (`28`)
    @_alwaysEmitIntoClient
    static var conexantSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 28)
    }

    /// Qualcomm (`29`)
    @_alwaysEmitIntoClient
    static var qualcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 29)
    }

    /// Inventel (`30`)
    @_alwaysEmitIntoClient
    static var inventel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 30)
    }

    /// AVM Berlin (`31`)
    @_alwaysEmitIntoClient
    static var avmBerlin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 31)
    }

    /// BandSpeed, Inc. (`32`)
    @_alwaysEmitIntoClient
    static var bandspeed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 32)
    }

    /// Mansella Ltd (`33`)
    @_alwaysEmitIntoClient
    static var mansella: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 33)
    }

    /// NEC Corporation (`34`)
    @_alwaysEmitIntoClient
    static var nec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 34)
    }

    /// WavePlus Technology Co., Ltd. (`35`)
    @_alwaysEmitIntoClient
    static var waveplusTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 35)
    }

    /// Alcatel (`36`)
    @_alwaysEmitIntoClient
    static var alcatel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 36)
    }

    /// NXP Semiconductors (formerly Philips Semiconductors) (`37`)
    @_alwaysEmitIntoClient
    static var nxpSemiconductorsFormerlyPhilipsSemiconductors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 37)
    }

    /// C Technologies (`38`)
    @_alwaysEmitIntoClient
    static var cTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 38)
    }

    /// Open Interface (`39`)
    @_alwaysEmitIntoClient
    static var openInterface: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 39)
    }

    /// R F Micro Devices (`40`)
    @_alwaysEmitIntoClient
    static var rFMicroDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 40)
    }

    /// Hitachi Ltd (`41`)
    @_alwaysEmitIntoClient
    static var hitachi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 41)
    }

    /// Symbol Technologies, Inc. (`42`)
    @_alwaysEmitIntoClient
    static var symbolTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 42)
    }

    /// Tenovis (`43`)
    @_alwaysEmitIntoClient
    static var tenovis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 43)
    }

    /// Macronix International Co. Ltd. (`44`)
    @_alwaysEmitIntoClient
    static var macronixInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 44)
    }

    /// GCT Semiconductor (`45`)
    @_alwaysEmitIntoClient
    static var gctSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 45)
    }

    /// Norwood Systems (`46`)
    @_alwaysEmitIntoClient
    static var norwoodSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 46)
    }

    /// MewTel Technology Inc. (`47`)
    @_alwaysEmitIntoClient
    static var mewtelTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 47)
    }

    /// ST Microelectronics (`48`)
    @_alwaysEmitIntoClient
    static var stMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 48)
    }

    /// Synopsys, Inc. (`49`)
    @_alwaysEmitIntoClient
    static var synopsys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 49)
    }

    /// Red-M (Communications) Ltd (`50`)
    @_alwaysEmitIntoClient
    static var redMCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 50)
    }

    /// Commil Ltd (`51`)
    @_alwaysEmitIntoClient
    static var commil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 51)
    }

    /// Computer Access Technology Corporation (CATC) (`52`)
    @_alwaysEmitIntoClient
    static var computerAccessTechnologyCatc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 52)
    }

    /// Eclipse (HQ Espana) S.L. (`53`)
    @_alwaysEmitIntoClient
    static var eclipseHqEspana: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 53)
    }

    /// Renesas Electronics Corporation (`54`)
    @_alwaysEmitIntoClient
    static var renesasElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 54)
    }

    /// Mobilian Corporation (`55`)
    @_alwaysEmitIntoClient
    static var mobilian: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 55)
    }

    /// Syntronix Corporation (`56`)
    @_alwaysEmitIntoClient
    static var syntronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 56)
    }

    /// Integrated System Solution Corp. (`57`)
    @_alwaysEmitIntoClient
    static var integratedSystemSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 57)
    }

    /// Matsushita Electric Industrial Co., Ltd. (`58`)
    @_alwaysEmitIntoClient
    static var matsushitaElectricIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 58)
    }

    /// Gennum Corporation (`59`)
    @_alwaysEmitIntoClient
    static var gennum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 59)
    }

    /// BlackBerry Limited (formerly Research In Motion) (`60`)
    @_alwaysEmitIntoClient
    static var blackberryFormerlyResearchInMotion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 60)
    }

    /// IPextreme, Inc. (`61`)
    @_alwaysEmitIntoClient
    static var ipextreme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 61)
    }

    /// Systems and Chips, Inc. (`62`)
    @_alwaysEmitIntoClient
    static var systemsAndChips: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 62)
    }

    /// Bluetooth SIG, Inc. (`63`)
    @_alwaysEmitIntoClient
    static var bluetoothSig: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 63)
    }

    /// Seiko Epson Corporation (`64`)
    @_alwaysEmitIntoClient
    static var seikoEpson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 64)
    }

    /// Integrated Silicon Solution Taiwan, Inc. (`65`)
    @_alwaysEmitIntoClient
    static var integratedSiliconSolutionTaiwan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 65)
    }

    /// CONWISE Technology Corporation Ltd (`66`)
    @_alwaysEmitIntoClient
    static var conwiseTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 66)
    }

    /// PARROT AUTOMOTIVE SAS (`67`)
    @_alwaysEmitIntoClient
    static var parrotAutomotives: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 67)
    }

    /// Socket Mobile (`68`)
    @_alwaysEmitIntoClient
    static var socketMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 68)
    }

    /// Atheros Communications, Inc. (`69`)
    @_alwaysEmitIntoClient
    static var atherosCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 69)
    }

    /// MediaTek, Inc. (`70`)
    @_alwaysEmitIntoClient
    static var mediatek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 70)
    }

    /// Bluegiga (`71`)
    @_alwaysEmitIntoClient
    static var bluegiga: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 71)
    }

    /// Marvell Technology Group Ltd. (`72`)
    @_alwaysEmitIntoClient
    static var marvellTechnologyGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 72)
    }

    /// 3DSP Corporation (`73`)
    @_alwaysEmitIntoClient
    static var uuid3Dsp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 73)
    }

    /// Accel Semiconductor Ltd. (`74`)
    @_alwaysEmitIntoClient
    static var accelSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 74)
    }

    /// Continental Automotive Systems (`75`)
    @_alwaysEmitIntoClient
    static var continentalAutomotiveSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 75)
    }

    /// Apple, Inc. (`76`)
    @_alwaysEmitIntoClient
    static var apple: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 76)
    }

    /// Staccato Communications, Inc. (`77`)
    @_alwaysEmitIntoClient
    static var staccatoCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 77)
    }

    /// Avago Technologies (`78`)
    @_alwaysEmitIntoClient
    static var avagoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 78)
    }

    /// APT Licensing Ltd. (`79`)
    @_alwaysEmitIntoClient
    static var aptLicensing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 79)
    }

    /// SiRF Technology (`80`)
    @_alwaysEmitIntoClient
    static var sirfTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 80)
    }

    /// Tzero Technologies, Inc. (`81`)
    @_alwaysEmitIntoClient
    static var tzeroTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 81)
    }

    /// J&M Corporation (`82`)
    @_alwaysEmitIntoClient
    static var jM: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 82)
    }

    /// Free2move AB (`83`)
    @_alwaysEmitIntoClient
    static var free2Move: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 83)
    }

    /// 3DiJoy Corporation (`84`)
    @_alwaysEmitIntoClient
    static var uuid3Dijoy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 84)
    }

    /// Plantronics, Inc. (`85`)
    @_alwaysEmitIntoClient
    static var plantronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 85)
    }

    /// Sony Ericsson Mobile Communications (`86`)
    @_alwaysEmitIntoClient
    static var sonyEricssonMobileCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 86)
    }

    /// Harman International Industries, Inc. (`87`)
    @_alwaysEmitIntoClient
    static var harmanInternationalIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 87)
    }

    /// Vizio, Inc. (`88`)
    @_alwaysEmitIntoClient
    static var vizio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 88)
    }

    /// Nordic Semiconductor ASA (`89`)
    @_alwaysEmitIntoClient
    static var nordicSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 89)
    }

    /// EM Microelectronic-Marin SA (`90`)
    @_alwaysEmitIntoClient
    static var emMicroelectronicMarin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 90)
    }

    /// Ralink Technology Corporation (`91`)
    @_alwaysEmitIntoClient
    static var ralinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 91)
    }

    /// Belkin International, Inc. (`92`)
    @_alwaysEmitIntoClient
    static var belkinInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 92)
    }

    /// Realtek Semiconductor Corporation (`93`)
    @_alwaysEmitIntoClient
    static var realtekSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 93)
    }

    /// Stonestreet One, LLC (`94`)
    @_alwaysEmitIntoClient
    static var stonestreetOne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 94)
    }

    /// Wicentric, Inc. (`95`)
    @_alwaysEmitIntoClient
    static var wicentric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 95)
    }

    /// RivieraWaves S.A.S (`96`)
    @_alwaysEmitIntoClient
    static var rivierawaves: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 96)
    }

    /// RDA Microelectronics (`97`)
    @_alwaysEmitIntoClient
    static var rdaMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 97)
    }

    /// Gibson Guitars (`98`)
    @_alwaysEmitIntoClient
    static var gibsonGuitars: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 98)
    }

    /// MiCommand Inc. (`99`)
    @_alwaysEmitIntoClient
    static var micommand: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 99)
    }

    /// Band XI International, LLC (`100`)
    @_alwaysEmitIntoClient
    static var bandXiInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 100)
    }

    /// Hewlett-Packard Company (`101`)
    @_alwaysEmitIntoClient
    static var hewlettPackardCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 101)
    }

    /// 9Solutions Oy (`102`)
    @_alwaysEmitIntoClient
    static var uuid9Solutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 102)
    }

    /// GN Netcom A/S (`103`)
    @_alwaysEmitIntoClient
    static var gnNetcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 103)
    }

    /// General Motors (`104`)
    @_alwaysEmitIntoClient
    static var generalMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 104)
    }

    /// A&D Engineering, Inc. (`105`)
    @_alwaysEmitIntoClient
    static var aDEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 105)
    }

    /// MindTree Ltd. (`106`)
    @_alwaysEmitIntoClient
    static var mindtree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 106)
    }

    /// Polar Electro OY (`107`)
    @_alwaysEmitIntoClient
    static var polarElectro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 107)
    }

    /// Beautiful Enterprise Co., Ltd. (`108`)
    @_alwaysEmitIntoClient
    static var beautifulEnterprise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 108)
    }

    /// BriarTek, Inc. (`109`)
    @_alwaysEmitIntoClient
    static var briartek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 109)
    }

    /// Summit Data Communications, Inc. (`110`)
    @_alwaysEmitIntoClient
    static var summitDataCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 110)
    }

    /// Sound ID (`111`)
    @_alwaysEmitIntoClient
    static var soundId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 111)
    }

    /// Monster, LLC (`112`)
    @_alwaysEmitIntoClient
    static var monster: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 112)
    }

    /// connectBlue AB (`113`)
    @_alwaysEmitIntoClient
    static var connectblue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 113)
    }

    /// ShangHai Super Smart Electronics Co. Ltd. (`114`)
    @_alwaysEmitIntoClient
    static var shanghaiSuperSmartElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 114)
    }

    /// Group Sense Ltd. (`115`)
    @_alwaysEmitIntoClient
    static var groupSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 115)
    }

    /// Zomm, LLC (`116`)
    @_alwaysEmitIntoClient
    static var zomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 116)
    }

    /// Samsung Electronics Co. Ltd. (`117`)
    @_alwaysEmitIntoClient
    static var samsungElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 117)
    }

    /// Creative Technology Ltd. (`118`)
    @_alwaysEmitIntoClient
    static var creativeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 118)
    }

    /// Laird Technologies (`119`)
    @_alwaysEmitIntoClient
    static var lairdTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 119)
    }

    /// Nike, Inc. (`120`)
    @_alwaysEmitIntoClient
    static var nike: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 120)
    }

    /// lesswire AG (`121`)
    @_alwaysEmitIntoClient
    static var lesswire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 121)
    }

    /// MStar Semiconductor, Inc. (`122`)
    @_alwaysEmitIntoClient
    static var mstarSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 122)
    }

    /// Hanlynn Technologies (`123`)
    @_alwaysEmitIntoClient
    static var hanlynnTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 123)
    }

    /// A & R Cambridge (`124`)
    @_alwaysEmitIntoClient
    static var aRCambridge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 124)
    }

    /// Seers Technology Co. Ltd (`125`)
    @_alwaysEmitIntoClient
    static var seersTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 125)
    }

    /// Sports Tracking Technologies Ltd. (`126`)
    @_alwaysEmitIntoClient
    static var sportsTrackingTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 126)
    }

    /// Autonet Mobile (`127`)
    @_alwaysEmitIntoClient
    static var autonetMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 127)
    }

    /// DeLorme Publishing Company, Inc. (`128`)
    @_alwaysEmitIntoClient
    static var delormePublishingCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 128)
    }

    /// WuXi Vimicro (`129`)
    @_alwaysEmitIntoClient
    static var wuxiVimicro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 129)
    }

    /// Sennheiser Communications A/S (`130`)
    @_alwaysEmitIntoClient
    static var sennheiserCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 130)
    }

    /// TimeKeeping Systems, Inc. (`131`)
    @_alwaysEmitIntoClient
    static var timekeepingSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 131)
    }

    /// Ludus Helsinki Ltd. (`132`)
    @_alwaysEmitIntoClient
    static var ludusHelsinki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 132)
    }

    /// BlueRadios, Inc. (`133`)
    @_alwaysEmitIntoClient
    static var blueradios: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 133)
    }

    /// Equinox AG (`134`)
    @_alwaysEmitIntoClient
    static var equinox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 134)
    }

    /// Garmin International, Inc. (`135`)
    @_alwaysEmitIntoClient
    static var garminInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 135)
    }

    /// Ecotest (`136`)
    @_alwaysEmitIntoClient
    static var ecotest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 136)
    }

    /// GN ReSound A/S (`137`)
    @_alwaysEmitIntoClient
    static var gnResound: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 137)
    }

    /// Jawbone (`138`)
    @_alwaysEmitIntoClient
    static var jawbone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 138)
    }

    /// Topcon Positioning Systems, LLC (`139`)
    @_alwaysEmitIntoClient
    static var topconPositioningSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 139)
    }

    /// Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.) (`140`)
    @_alwaysEmitIntoClient
    static var gimbalFormerlyQualcommLabsAndQualcommRetailSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 140)
    }

    /// Zscan Software (`141`)
    @_alwaysEmitIntoClient
    static var zscanSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 141)
    }

    /// Quintic Corp. (`142`)
    @_alwaysEmitIntoClient
    static var quintic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 142)
    }

    /// Telit Wireless Solutions GmbH (Formerly Stollman E+V GmbH) (`143`)
    @_alwaysEmitIntoClient
    static var telitWirelessSolutionsFormerlyStollmanEV: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 143)
    }

    /// Funai Electric Co., Ltd. (`144`)
    @_alwaysEmitIntoClient
    static var funaiElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 144)
    }

    /// Advanced PANMOBIL Systems GmbH & Co. KG (`145`)
    @_alwaysEmitIntoClient
    static var advancedPanmobilSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 145)
    }

    /// ThinkOptics, Inc. (`146`)
    @_alwaysEmitIntoClient
    static var thinkoptics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 146)
    }

    /// Universal Electronics, Inc. (`147`)
    @_alwaysEmitIntoClient
    static var universalElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 147)
    }

    /// Airoha Technology Corp. (`148`)
    @_alwaysEmitIntoClient
    static var airohaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 148)
    }

    /// NEC Lighting, Ltd. (`149`)
    @_alwaysEmitIntoClient
    static var necLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 149)
    }

    /// ODM Technology, Inc. (`150`)
    @_alwaysEmitIntoClient
    static var odmTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 150)
    }

    /// ConnecteDevice Ltd. (`151`)
    @_alwaysEmitIntoClient
    static var connectedevice: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 151)
    }

    /// zer01.tv GmbH (`152`)
    @_alwaysEmitIntoClient
    static var zer01Tv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 152)
    }

    /// i.Tech Dynamic Global Distribution Ltd. (`153`)
    @_alwaysEmitIntoClient
    static var iTechDynamicGlobalDistribution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 153)
    }

    /// Alpwise (`154`)
    @_alwaysEmitIntoClient
    static var alpwise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 154)
    }

    /// Jiangsu Toppower Automotive Electronics Co., Ltd. (`155`)
    @_alwaysEmitIntoClient
    static var jiangsuToppowerAutomotiveElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 155)
    }

    /// Colorfy, Inc. (`156`)
    @_alwaysEmitIntoClient
    static var colorfy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 156)
    }

    /// Geoforce Inc. (`157`)
    @_alwaysEmitIntoClient
    static var geoforce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 157)
    }

    /// Bose Corporation (`158`)
    @_alwaysEmitIntoClient
    static var bose: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 158)
    }

    /// Suunto Oy (`159`)
    @_alwaysEmitIntoClient
    static var suunto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 159)
    }

    /// Kensington Computer Products Group (`160`)
    @_alwaysEmitIntoClient
    static var kensingtonComputerProductsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 160)
    }

    /// SR-Medizinelektronik (`161`)
    @_alwaysEmitIntoClient
    static var srMedizinelektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 161)
    }

    /// Vertu Corporation Limited (`162`)
    @_alwaysEmitIntoClient
    static var vertu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 162)
    }

    /// Meta Watch Ltd. (`163`)
    @_alwaysEmitIntoClient
    static var metaWatch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 163)
    }

    /// LINAK A/S (`164`)
    @_alwaysEmitIntoClient
    static var linak: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 164)
    }

    /// OTL Dynamics LLC (`165`)
    @_alwaysEmitIntoClient
    static var otlDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 165)
    }

    /// Panda Ocean Inc. (`166`)
    @_alwaysEmitIntoClient
    static var pandaOcean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 166)
    }

    /// Visteon Corporation (`167`)
    @_alwaysEmitIntoClient
    static var visteon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 167)
    }

    /// ARP Devices Limited (`168`)
    @_alwaysEmitIntoClient
    static var arpDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 168)
    }

    /// Magneti Marelli S.p.A (`169`)
    @_alwaysEmitIntoClient
    static var magnetiMarelliSPA: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 169)
    }

    /// CAEN RFID srl (`170`)
    @_alwaysEmitIntoClient
    static var caenRfid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 170)
    }

    /// Ingenieur-Systemgruppe Zahn GmbH (`171`)
    @_alwaysEmitIntoClient
    static var ingenieurSystemgruppeZahn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 171)
    }

    /// Green Throttle Games (`172`)
    @_alwaysEmitIntoClient
    static var greenThrottleGames: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 172)
    }

    /// Peter Systemtechnik GmbH (`173`)
    @_alwaysEmitIntoClient
    static var peterSystemtechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 173)
    }

    /// Omegawave Oy (`174`)
    @_alwaysEmitIntoClient
    static var omegawave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 174)
    }

    /// Cinetix (`175`)
    @_alwaysEmitIntoClient
    static var cinetix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 175)
    }

    /// Passif Semiconductor Corp (`176`)
    @_alwaysEmitIntoClient
    static var passifSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 176)
    }

    /// Saris Cycling Group, Inc (`177`)
    @_alwaysEmitIntoClient
    static var sarisCyclingGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 177)
    }

    /// Bekey A/S (`178`)
    @_alwaysEmitIntoClient
    static var bekey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 178)
    }

    /// Clarinox Technologies Pty. Ltd. (`179`)
    @_alwaysEmitIntoClient
    static var clarinoxTechnologiesPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 179)
    }

    /// BDE Technology Co., Ltd. (`180`)
    @_alwaysEmitIntoClient
    static var bdeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 180)
    }

    /// Swirl Networks (`181`)
    @_alwaysEmitIntoClient
    static var swirlNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 181)
    }

    /// Meso international (`182`)
    @_alwaysEmitIntoClient
    static var mesoInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 182)
    }

    /// TreLab Ltd (`183`)
    @_alwaysEmitIntoClient
    static var trelab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 183)
    }

    /// Qualcomm Innovation Center, Inc. (QuIC) (`184`)
    @_alwaysEmitIntoClient
    static var qualcommInnovationCenterQuic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 184)
    }

    /// Johnson Controls, Inc. (`185`)
    @_alwaysEmitIntoClient
    static var johnsonControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 185)
    }

    /// Starkey Laboratories Inc. (`186`)
    @_alwaysEmitIntoClient
    static var starkeyLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 186)
    }

    /// S-Power Electronics Limited (`187`)
    @_alwaysEmitIntoClient
    static var sPowerElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 187)
    }

    /// Ace Sensor Inc (`188`)
    @_alwaysEmitIntoClient
    static var aceSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 188)
    }

    /// Aplix Corporation (`189`)
    @_alwaysEmitIntoClient
    static var aplix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 189)
    }

    /// AAMP of America (`190`)
    @_alwaysEmitIntoClient
    static var aampOfAmerica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 190)
    }

    /// Stalmart Technology Limited (`191`)
    @_alwaysEmitIntoClient
    static var stalmartTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 191)
    }

    /// AMICCOM Electronics Corporation (`192`)
    @_alwaysEmitIntoClient
    static var amiccomElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 192)
    }

    /// Shenzhen Excelsecu Data Technology Co.,Ltd (`193`)
    @_alwaysEmitIntoClient
    static var shenzhenExcelsecuDataTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 193)
    }

    /// Geneq Inc. (`194`)
    @_alwaysEmitIntoClient
    static var geneq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 194)
    }

    /// adidas AG (`195`)
    @_alwaysEmitIntoClient
    static var adidas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 195)
    }

    /// LG Electronics (`196`)
    @_alwaysEmitIntoClient
    static var lgElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 196)
    }

    /// Onset Computer Corporation (`197`)
    @_alwaysEmitIntoClient
    static var onsetComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 197)
    }

    /// Selfly BV (`198`)
    @_alwaysEmitIntoClient
    static var selfly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 198)
    }

    /// Quuppa Oy. (`199`)
    @_alwaysEmitIntoClient
    static var quuppa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 199)
    }

    /// GeLo Inc (`200`)
    @_alwaysEmitIntoClient
    static var gelo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 200)
    }

    /// Evluma (`201`)
    @_alwaysEmitIntoClient
    static var evluma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 201)
    }

    /// MC10 (`202`)
    @_alwaysEmitIntoClient
    static var mc10: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 202)
    }

    /// Binauric SE (`203`)
    @_alwaysEmitIntoClient
    static var binauricSe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 203)
    }

    /// Beats Electronics (`204`)
    @_alwaysEmitIntoClient
    static var beatsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 204)
    }

    /// Microchip Technology Inc. (`205`)
    @_alwaysEmitIntoClient
    static var microchipTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 205)
    }

    /// Elgato Systems GmbH (`206`)
    @_alwaysEmitIntoClient
    static var elgatoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 206)
    }

    /// ARCHOS SA (`207`)
    @_alwaysEmitIntoClient
    static var archos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 207)
    }

    /// Dexcom, Inc. (`208`)
    @_alwaysEmitIntoClient
    static var dexcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 208)
    }

    /// Polar Electro Europe B.V. (`209`)
    @_alwaysEmitIntoClient
    static var polarElectroEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 209)
    }

    /// Dialog Semiconductor B.V. (`210`)
    @_alwaysEmitIntoClient
    static var dialogSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 210)
    }

    /// Taixingbang Technology (HK) Co,. LTD. (`211`)
    @_alwaysEmitIntoClient
    static var taixingbangTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 211)
    }

    /// Kawantech (`212`)
    @_alwaysEmitIntoClient
    static var kawantech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 212)
    }

    /// Austco Communication Systems (`213`)
    @_alwaysEmitIntoClient
    static var austcoCommunicationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 213)
    }

    /// Timex Group USA, Inc. (`214`)
    @_alwaysEmitIntoClient
    static var timexGroupUsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 214)
    }

    /// Qualcomm Technologies, Inc. (`215`)
    @_alwaysEmitIntoClient
    static var qualcommTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 215)
    }

    /// Qualcomm Connected Experiences, Inc. (`216`)
    @_alwaysEmitIntoClient
    static var qualcommConnectedExperiences: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 216)
    }

    /// Voyetra Turtle Beach (`217`)
    @_alwaysEmitIntoClient
    static var voyetraTurtleBeach: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 217)
    }

    /// txtr GmbH (`218`)
    @_alwaysEmitIntoClient
    static var txtr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 218)
    }

    /// Biosentronics (`219`)
    @_alwaysEmitIntoClient
    static var biosentronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 219)
    }

    /// Procter & Gamble (`220`)
    @_alwaysEmitIntoClient
    static var procterGamble: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 220)
    }

    /// Hosiden Corporation (`221`)
    @_alwaysEmitIntoClient
    static var hosiden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 221)
    }

    /// Muzik LLC (`222`)
    @_alwaysEmitIntoClient
    static var muzik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 222)
    }

    /// Misfit Wearables Corp (`223`)
    @_alwaysEmitIntoClient
    static var misfitWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 223)
    }

    /// Google (`224`)
    @_alwaysEmitIntoClient
    static var google: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 224)
    }

    /// Danlers Ltd (`225`)
    @_alwaysEmitIntoClient
    static var danlers: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 225)
    }

    /// Semilink Inc (`226`)
    @_alwaysEmitIntoClient
    static var semilink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 226)
    }

    /// inMusic Brands, Inc (`227`)
    @_alwaysEmitIntoClient
    static var inmusicBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 227)
    }

    /// L.S. Research Inc. (`228`)
    @_alwaysEmitIntoClient
    static var lSResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 228)
    }

    /// Eden Software Consultants Ltd. (`229`)
    @_alwaysEmitIntoClient
    static var edenSoftwareConsultants: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 229)
    }

    /// Freshtemp (`230`)
    @_alwaysEmitIntoClient
    static var freshtemp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 230)
    }

    /// KS Technologies (`231`)
    @_alwaysEmitIntoClient
    static var ksTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 231)
    }

    /// ACTS Technologies (`232`)
    @_alwaysEmitIntoClient
    static var actsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 232)
    }

    /// Vtrack Systems (`233`)
    @_alwaysEmitIntoClient
    static var vtrackSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 233)
    }

    /// Nielsen-Kellerman Company (`234`)
    @_alwaysEmitIntoClient
    static var nielsenKellermanCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 234)
    }

    /// Server Technology, Inc. (`235`)
    @_alwaysEmitIntoClient
    static var serverTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 235)
    }

    /// BioResearch Associates (`236`)
    @_alwaysEmitIntoClient
    static var bioresearchAssociates: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 236)
    }

    /// Jolly Logic, LLC (`237`)
    @_alwaysEmitIntoClient
    static var jollyLogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 237)
    }

    /// Above Average Outcomes, Inc. (`238`)
    @_alwaysEmitIntoClient
    static var aboveAverageOutcomes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 238)
    }

    /// Bitsplitters GmbH (`239`)
    @_alwaysEmitIntoClient
    static var bitsplitters: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 239)
    }

    /// PayPal, Inc. (`240`)
    @_alwaysEmitIntoClient
    static var paypal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 240)
    }

    /// Witron Technology Limited (`241`)
    @_alwaysEmitIntoClient
    static var witronTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 241)
    }

    /// Aether Things Inc. (formerly Morse Project Inc.) (`242`)
    @_alwaysEmitIntoClient
    static var aetherThingsFormerlyMorseProject: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 242)
    }

    /// Kent Displays Inc. (`243`)
    @_alwaysEmitIntoClient
    static var kentDisplays: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 243)
    }

    /// Nautilus Inc. (`244`)
    @_alwaysEmitIntoClient
    static var nautilus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 244)
    }

    /// Smartifier Oy (`245`)
    @_alwaysEmitIntoClient
    static var smartifier: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 245)
    }

    /// Elcometer Limited (`246`)
    @_alwaysEmitIntoClient
    static var elcometer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 246)
    }

    /// VSN Technologies Inc. (`247`)
    @_alwaysEmitIntoClient
    static var vsnTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 247)
    }

    /// AceUni Corp., Ltd. (`248`)
    @_alwaysEmitIntoClient
    static var aceuni: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 248)
    }

    /// StickNFind (`249`)
    @_alwaysEmitIntoClient
    static var sticknfind: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 249)
    }

    /// Crystal Code AB (`250`)
    @_alwaysEmitIntoClient
    static var crystalCode: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 250)
    }

    /// KOUKAAM a.s. (`251`)
    @_alwaysEmitIntoClient
    static var koukaam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 251)
    }

    /// Delphi Corporation (`252`)
    @_alwaysEmitIntoClient
    static var delphi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 252)
    }

    /// ValenceTech Limited (`253`)
    @_alwaysEmitIntoClient
    static var valencetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 253)
    }

    /// Stanley Black and Decker (`254`)
    @_alwaysEmitIntoClient
    static var stanleyBlackAndDecker: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 254)
    }

    /// Typo Products, LLC (`255`)
    @_alwaysEmitIntoClient
    static var typoProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 255)
    }

    /// TomTom International BV (`256`)
    @_alwaysEmitIntoClient
    static var tomtomInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 256)
    }

    /// Fugoo, Inc (`257`)
    @_alwaysEmitIntoClient
    static var fugoo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 257)
    }

    /// Keiser Corporation (`258`)
    @_alwaysEmitIntoClient
    static var keiser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 258)
    }

    /// Bang & Olufsen A/S (`259`)
    @_alwaysEmitIntoClient
    static var bangOlufsen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 259)
    }

    /// PLUS Locations Systems Pty Ltd (`260`)
    @_alwaysEmitIntoClient
    static var plusLocationsSystemsPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 260)
    }

    /// Ubiquitous Computing Technology Corporation (`261`)
    @_alwaysEmitIntoClient
    static var ubiquitousComputingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 261)
    }

    /// Innovative Yachtter Solutions (`262`)
    @_alwaysEmitIntoClient
    static var innovativeYachtterSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 262)
    }

    /// William Demant Holding A/S (`263`)
    @_alwaysEmitIntoClient
    static var williamDemantHolding: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 263)
    }

    /// Chicony Electronics Co., Ltd. (`264`)
    @_alwaysEmitIntoClient
    static var chiconyElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 264)
    }

    /// Atus BV (`265`)
    @_alwaysEmitIntoClient
    static var atus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 265)
    }

    /// Codegate Ltd. (`266`)
    @_alwaysEmitIntoClient
    static var codegate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 266)
    }

    /// ERi, Inc. (`267`)
    @_alwaysEmitIntoClient
    static var eri: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 267)
    }

    /// Transducers Direct, LLC (`268`)
    @_alwaysEmitIntoClient
    static var transducersDirect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 268)
    }

    /// Fujitsu Ten Limited (`269`)
    @_alwaysEmitIntoClient
    static var fujitsuTen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 269)
    }

    /// Audi AG (`270`)
    @_alwaysEmitIntoClient
    static var audi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 270)
    }

    /// HiSilicon Technologies Co., Ltd. (`271`)
    @_alwaysEmitIntoClient
    static var hisiliconTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 271)
    }

    /// Nippon Seiki Co., Ltd. (`272`)
    @_alwaysEmitIntoClient
    static var nipponSeiki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 272)
    }

    /// Steelseries ApS (`273`)
    @_alwaysEmitIntoClient
    static var steelseries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 273)
    }

    /// Visybl Inc. (`274`)
    @_alwaysEmitIntoClient
    static var visybl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 274)
    }

    /// Openbrain Technologies, Co., Ltd. (`275`)
    @_alwaysEmitIntoClient
    static var openbrainTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 275)
    }

    /// Xensr (`276`)
    @_alwaysEmitIntoClient
    static var xensr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 276)
    }

    /// e.solutions (`277`)
    @_alwaysEmitIntoClient
    static var eSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 277)
    }

    /// 1OAK Technologies (`278`)
    @_alwaysEmitIntoClient
    static var uuid1OakTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 278)
    }

    /// Wimoto Technologies Inc (`279`)
    @_alwaysEmitIntoClient
    static var wimotoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 279)
    }

    /// Radius Networks, Inc. (`280`)
    @_alwaysEmitIntoClient
    static var radiusNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 280)
    }

    /// Wize Technology Co., Ltd. (`281`)
    @_alwaysEmitIntoClient
    static var wizeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 281)
    }

    /// Qualcomm Labs, Inc. (`282`)
    @_alwaysEmitIntoClient
    static var qualcommLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 282)
    }

    /// Hewlett Packard Enterprise (`283`)
    @_alwaysEmitIntoClient
    static var hewlettPackardEnterprise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 283)
    }

    /// Baidu (`284`)
    @_alwaysEmitIntoClient
    static var baidu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 284)
    }

    /// Arendi AG (`285`)
    @_alwaysEmitIntoClient
    static var arendi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 285)
    }

    /// Skoda Auto a.s. (`286`)
    @_alwaysEmitIntoClient
    static var skodaAuto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 286)
    }

    /// Volkswagen AG (`287`)
    @_alwaysEmitIntoClient
    static var volkswagen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 287)
    }

    /// Porsche AG (`288`)
    @_alwaysEmitIntoClient
    static var porsche: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 288)
    }

    /// Sino Wealth Electronic Ltd. (`289`)
    @_alwaysEmitIntoClient
    static var sinoWealthElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 289)
    }

    /// AirTurn, Inc. (`290`)
    @_alwaysEmitIntoClient
    static var airturn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 290)
    }

    /// Kinsa, Inc. (`291`)
    @_alwaysEmitIntoClient
    static var kinsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 291)
    }

    /// HID Global (`292`)
    @_alwaysEmitIntoClient
    static var hidGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 292)
    }

    /// SEAT es (`293`)
    @_alwaysEmitIntoClient
    static var seatEs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 293)
    }

    /// Promethean Ltd. (`294`)
    @_alwaysEmitIntoClient
    static var promethean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 294)
    }

    /// Salutica Allied Solutions (`295`)
    @_alwaysEmitIntoClient
    static var saluticaAlliedSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 295)
    }

    /// GPSI Group Pty Ltd (`296`)
    @_alwaysEmitIntoClient
    static var gpsiGroupPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 296)
    }

    /// Nimble Devices Oy (`297`)
    @_alwaysEmitIntoClient
    static var nimbleDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 297)
    }

    /// Changzhou Yongse Infotech Co., Ltd (`298`)
    @_alwaysEmitIntoClient
    static var changzhouYongseInfotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 298)
    }

    /// SportIQ (`299`)
    @_alwaysEmitIntoClient
    static var sportiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 299)
    }

    /// TEMEC Instruments B.V. (`300`)
    @_alwaysEmitIntoClient
    static var temecInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 300)
    }

    /// Sony Corporation (`301`)
    @_alwaysEmitIntoClient
    static var sony: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 301)
    }

    /// ASSA ABLOY (`302`)
    @_alwaysEmitIntoClient
    static var assaAbloy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 302)
    }

    /// Clarion Co., Ltd. (`303`)
    @_alwaysEmitIntoClient
    static var clarion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 303)
    }

    /// Warehouse Innovations (`304`)
    @_alwaysEmitIntoClient
    static var warehouseInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 304)
    }

    /// Cypress Semiconductor Corporation (`305`)
    @_alwaysEmitIntoClient
    static var cypressSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 305)
    }

    /// MADS Inc (`306`)
    @_alwaysEmitIntoClient
    static var mads: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 306)
    }

    /// Blue Maestro Limited (`307`)
    @_alwaysEmitIntoClient
    static var blueMaestro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 307)
    }

    /// Resolution Products, Inc. (`308`)
    @_alwaysEmitIntoClient
    static var resolutionProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 308)
    }

    /// Airewear LLC (`309`)
    @_alwaysEmitIntoClient
    static var airewear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 309)
    }

    /// Silvair, Inc. (`310`)
    @_alwaysEmitIntoClient
    static var silvair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 310)
    }

    /// Prestigio Plaza Ltd. (`311`)
    @_alwaysEmitIntoClient
    static var prestigioPlaza: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 311)
    }

    /// NTEO Inc. (`312`)
    @_alwaysEmitIntoClient
    static var nteo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 312)
    }

    /// Focus Systems Corporation (`313`)
    @_alwaysEmitIntoClient
    static var focusSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 313)
    }

    /// Tencent Holdings Limited (`314`)
    @_alwaysEmitIntoClient
    static var tencentHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 314)
    }

    /// Allegion (`315`)
    @_alwaysEmitIntoClient
    static var allegion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 315)
    }

    /// Murata Manufacuring Co., Ltd. (`316`)
    @_alwaysEmitIntoClient
    static var murataManufacuring: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 316)
    }

    /// WirelessWERX (`317`)
    @_alwaysEmitIntoClient
    static var wirelesswerx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 317)
    }

    /// Nod, Inc. (`318`)
    @_alwaysEmitIntoClient
    static var nod: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 318)
    }

    /// B&B Manufacturing Company (`319`)
    @_alwaysEmitIntoClient
    static var bBManufacturingCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 319)
    }

    /// Alpine Electronics (China) Co., Ltd (`320`)
    @_alwaysEmitIntoClient
    static var alpineElectronicsChina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 320)
    }

    /// FedEx Services (`321`)
    @_alwaysEmitIntoClient
    static var fedexServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 321)
    }

    /// Grape Systems Inc. (`322`)
    @_alwaysEmitIntoClient
    static var grapeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 322)
    }

    /// Bkon Connect (`323`)
    @_alwaysEmitIntoClient
    static var bkonConnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 323)
    }

    /// Lintech GmbH (`324`)
    @_alwaysEmitIntoClient
    static var lintech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 324)
    }

    /// Novatel Wireless (`325`)
    @_alwaysEmitIntoClient
    static var novatelWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 325)
    }

    /// Ciright (`326`)
    @_alwaysEmitIntoClient
    static var ciright: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 326)
    }

    /// Mighty Cast, Inc. (`327`)
    @_alwaysEmitIntoClient
    static var mightyCast: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 327)
    }

    /// Ambimat Electronics (`328`)
    @_alwaysEmitIntoClient
    static var ambimatElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 328)
    }

    /// Perytons Ltd. (`329`)
    @_alwaysEmitIntoClient
    static var perytons: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 329)
    }

    /// Tivoli Audio, LLC (`330`)
    @_alwaysEmitIntoClient
    static var tivoliAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 330)
    }

    /// Master Lock (`331`)
    @_alwaysEmitIntoClient
    static var masterLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 331)
    }

    /// Mesh-Net Ltd (`332`)
    @_alwaysEmitIntoClient
    static var meshNet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 332)
    }

    /// Huizhou Desay SV Automotive CO., LTD. (`333`)
    @_alwaysEmitIntoClient
    static var huizhouDesaySvAutomotive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 333)
    }

    /// Tangerine, Inc. (`334`)
    @_alwaysEmitIntoClient
    static var tangerine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 334)
    }

    /// B&W Group Ltd. (`335`)
    @_alwaysEmitIntoClient
    static var bWGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 335)
    }

    /// Pioneer Corporation (`336`)
    @_alwaysEmitIntoClient
    static var pioneer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 336)
    }

    /// OnBeep (`337`)
    @_alwaysEmitIntoClient
    static var onbeep: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 337)
    }

    /// Vernier Software & Technology (`338`)
    @_alwaysEmitIntoClient
    static var vernierSoftwareTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 338)
    }

    /// ROL Ergo (`339`)
    @_alwaysEmitIntoClient
    static var rolErgo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 339)
    }

    /// Pebble Technology (`340`)
    @_alwaysEmitIntoClient
    static var pebbleTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 340)
    }

    /// NETATMO (`341`)
    @_alwaysEmitIntoClient
    static var netatmo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 341)
    }

    /// Accumulate AB (`342`)
    @_alwaysEmitIntoClient
    static var accumulate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 342)
    }

    /// Anhui Huami Information Technology Co., Ltd. (`343`)
    @_alwaysEmitIntoClient
    static var anhuiHuamiInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 343)
    }

    /// Inmite s.r.o. (`344`)
    @_alwaysEmitIntoClient
    static var inmite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 344)
    }

    /// ChefSteps, Inc. (`345`)
    @_alwaysEmitIntoClient
    static var chefsteps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 345)
    }

    /// micas AG (`346`)
    @_alwaysEmitIntoClient
    static var micas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 346)
    }

    /// Biomedical Research Ltd. (`347`)
    @_alwaysEmitIntoClient
    static var biomedicalResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 347)
    }

    /// Pitius Tec S.L. (`348`)
    @_alwaysEmitIntoClient
    static var pitiusTec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 348)
    }

    /// Estimote, Inc. (`349`)
    @_alwaysEmitIntoClient
    static var estimote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 349)
    }

    /// Unikey Technologies, Inc. (`350`)
    @_alwaysEmitIntoClient
    static var unikeyTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 350)
    }

    /// Timer Cap Co. (`351`)
    @_alwaysEmitIntoClient
    static var timerCap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 351)
    }

    /// AwoX (`352`)
    @_alwaysEmitIntoClient
    static var awox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 352)
    }

    /// yikes (`353`)
    @_alwaysEmitIntoClient
    static var yikes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 353)
    }

    /// MADSGlobal NZ Ltd. (`354`)
    @_alwaysEmitIntoClient
    static var madsglobalNz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 354)
    }

    /// PCH International (`355`)
    @_alwaysEmitIntoClient
    static var pchInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 355)
    }

    /// Qingdao Yeelink Information Technology Co., Ltd. (`356`)
    @_alwaysEmitIntoClient
    static var qingdaoYeelinkInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 356)
    }

    /// Milwaukee Tool (formerly Milwaukee Electric Tools) (`357`)
    @_alwaysEmitIntoClient
    static var milwaukeeToolFormerlyMilwaukeeElectricTools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 357)
    }

    /// MISHIK Pte Ltd (`358`)
    @_alwaysEmitIntoClient
    static var mishikPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 358)
    }

    /// Ascensia Diabetes Care US Inc. (`359`)
    @_alwaysEmitIntoClient
    static var ascensiaDiabetesCareUs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 359)
    }

    /// Spicebox LLC (`360`)
    @_alwaysEmitIntoClient
    static var spicebox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 360)
    }

    /// emberlight (`361`)
    @_alwaysEmitIntoClient
    static var emberlight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 361)
    }

    /// Cooper-Atkins Corporation (`362`)
    @_alwaysEmitIntoClient
    static var cooperAtkins: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 362)
    }

    /// Qblinks (`363`)
    @_alwaysEmitIntoClient
    static var qblinks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 363)
    }

    /// MYSPHERA (`364`)
    @_alwaysEmitIntoClient
    static var mysphera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 364)
    }

    /// LifeScan Inc (`365`)
    @_alwaysEmitIntoClient
    static var lifescan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 365)
    }

    /// Volantic AB (`366`)
    @_alwaysEmitIntoClient
    static var volantic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 366)
    }

    /// Podo Labs, Inc (`367`)
    @_alwaysEmitIntoClient
    static var podoLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 367)
    }

    /// Roche Diabetes Care AG (`368`)
    @_alwaysEmitIntoClient
    static var rocheDiabetesCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 368)
    }

    /// Amazon Fulfillment Service (`369`)
    @_alwaysEmitIntoClient
    static var amazonFulfillmentService: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 369)
    }

    /// Connovate Technology Private Limited (`370`)
    @_alwaysEmitIntoClient
    static var connovateTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 370)
    }

    /// Kocomojo, LLC (`371`)
    @_alwaysEmitIntoClient
    static var kocomojo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 371)
    }

    /// Everykey Inc. (`372`)
    @_alwaysEmitIntoClient
    static var everykey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 372)
    }

    /// Dynamic Controls (`373`)
    @_alwaysEmitIntoClient
    static var dynamicControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 373)
    }

    /// SentriLock (`374`)
    @_alwaysEmitIntoClient
    static var sentrilock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 374)
    }

    /// I-SYST inc. (`375`)
    @_alwaysEmitIntoClient
    static var iSyst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 375)
    }

    /// CASIO COMPUTER CO., LTD. (`376`)
    @_alwaysEmitIntoClient
    static var casioComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 376)
    }

    /// LAPIS Semiconductor Co., Ltd. (`377`)
    @_alwaysEmitIntoClient
    static var lapisSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 377)
    }

    /// Telemonitor, Inc. (`378`)
    @_alwaysEmitIntoClient
    static var telemonitor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 378)
    }

    /// taskit GmbH (`379`)
    @_alwaysEmitIntoClient
    static var taskit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 379)
    }

    /// Daimler AG (`380`)
    @_alwaysEmitIntoClient
    static var daimler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 380)
    }

    /// BatAndCat (`381`)
    @_alwaysEmitIntoClient
    static var batandcat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 381)
    }

    /// BluDotz Ltd (`382`)
    @_alwaysEmitIntoClient
    static var bludotz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 382)
    }

    /// XTel Wireless ApS (`383`)
    @_alwaysEmitIntoClient
    static var xtelWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 383)
    }

    /// Gigaset Communications GmbH (`384`)
    @_alwaysEmitIntoClient
    static var gigasetCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 384)
    }

    /// Gecko Health Innovations, Inc. (`385`)
    @_alwaysEmitIntoClient
    static var geckoHealthInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 385)
    }

    /// HOP Ubiquitous (`386`)
    @_alwaysEmitIntoClient
    static var hopUbiquitous: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 386)
    }

    /// Walt Disney (`387`)
    @_alwaysEmitIntoClient
    static var waltDisney: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 387)
    }

    /// Nectar (`388`)
    @_alwaysEmitIntoClient
    static var nectar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 388)
    }

    /// bel'apps LLC (`389`)
    @_alwaysEmitIntoClient
    static var belApps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 389)
    }

    /// CORE Lighting Ltd (`390`)
    @_alwaysEmitIntoClient
    static var coreLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 390)
    }

    /// Seraphim Sense Ltd (`391`)
    @_alwaysEmitIntoClient
    static var seraphimSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 391)
    }

    /// Unico RBC (`392`)
    @_alwaysEmitIntoClient
    static var unicoRbc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 392)
    }

    /// Physical Enterprises Inc. (`393`)
    @_alwaysEmitIntoClient
    static var physicalEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 393)
    }

    /// Able Trend Technology Limited (`394`)
    @_alwaysEmitIntoClient
    static var ableTrendTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 394)
    }

    /// Konica Minolta, Inc. (`395`)
    @_alwaysEmitIntoClient
    static var konicaMinolta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 395)
    }

    /// Wilo SE (`396`)
    @_alwaysEmitIntoClient
    static var wiloSe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 396)
    }

    /// Extron Design Services (`397`)
    @_alwaysEmitIntoClient
    static var extronDesignServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 397)
    }

    /// Fitbit, Inc. (`398`)
    @_alwaysEmitIntoClient
    static var fitbit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 398)
    }

    /// Fireflies Systems (`399`)
    @_alwaysEmitIntoClient
    static var firefliesSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 399)
    }

    /// Intelletto Technologies Inc. (`400`)
    @_alwaysEmitIntoClient
    static var intellettoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 400)
    }

    /// FDK CORPORATION (`401`)
    @_alwaysEmitIntoClient
    static var fdk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 401)
    }

    /// Cloudleaf, Inc (`402`)
    @_alwaysEmitIntoClient
    static var cloudleaf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 402)
    }

    /// Maveric Automation LLC (`403`)
    @_alwaysEmitIntoClient
    static var mavericAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 403)
    }

    /// Acoustic Stream Corporation (`404`)
    @_alwaysEmitIntoClient
    static var acousticStream: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 404)
    }

    /// Zuli (`405`)
    @_alwaysEmitIntoClient
    static var zuli: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 405)
    }

    /// Paxton Access Ltd (`406`)
    @_alwaysEmitIntoClient
    static var paxtonAccess: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 406)
    }

    /// WiSilica Inc (`407`)
    @_alwaysEmitIntoClient
    static var wisilica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 407)
    }

    /// VENGIT Korlátolt Felelősségű Társaság (`408`)
    @_alwaysEmitIntoClient
    static var vengitKorlátoltFelelősségűTársaság: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 408)
    }

    /// SALTO SYSTEMS S.L. (`409`)
    @_alwaysEmitIntoClient
    static var saltoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 409)
    }

    /// TRON Forum (formerly T-Engine Forum) (`410`)
    @_alwaysEmitIntoClient
    static var tronForumFormerlyTEngineForum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 410)
    }

    /// CUBETECH s.r.o. (`411`)
    @_alwaysEmitIntoClient
    static var cubetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 411)
    }

    /// Cokiya Incorporated (`412`)
    @_alwaysEmitIntoClient
    static var cokiya: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 412)
    }

    /// CVS Health (`413`)
    @_alwaysEmitIntoClient
    static var cvsHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 413)
    }

    /// Ceruus (`414`)
    @_alwaysEmitIntoClient
    static var ceruus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 414)
    }

    /// Strainstall Ltd (`415`)
    @_alwaysEmitIntoClient
    static var strainstall: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 415)
    }

    /// Channel Enterprises (HK) Ltd. (`416`)
    @_alwaysEmitIntoClient
    static var channelEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 416)
    }

    /// FIAMM (`417`)
    @_alwaysEmitIntoClient
    static var fiamm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 417)
    }

    /// GIGALANE.CO.,LTD (`418`)
    @_alwaysEmitIntoClient
    static var gigalane: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 418)
    }

    /// EROAD (`419`)
    @_alwaysEmitIntoClient
    static var eroad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 419)
    }

    /// Mine Safety Appliances (`420`)
    @_alwaysEmitIntoClient
    static var mineSafetyAppliances: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 420)
    }

    /// Icon Health and Fitness (`421`)
    @_alwaysEmitIntoClient
    static var iconHealthAndFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 421)
    }

    /// Asandoo GmbH (`422`)
    @_alwaysEmitIntoClient
    static var asandoo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 422)
    }

    /// ENERGOUS CORPORATION (`423`)
    @_alwaysEmitIntoClient
    static var energous: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 423)
    }

    /// Taobao (`424`)
    @_alwaysEmitIntoClient
    static var taobao: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 424)
    }

    /// Canon Inc. (`425`)
    @_alwaysEmitIntoClient
    static var canon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 425)
    }

    /// Geophysical Technology Inc. (`426`)
    @_alwaysEmitIntoClient
    static var geophysicalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 426)
    }

    /// Facebook, Inc. (`427`)
    @_alwaysEmitIntoClient
    static var facebook: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 427)
    }

    /// Trividia Health, Inc. (`428`)
    @_alwaysEmitIntoClient
    static var trividiaHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 428)
    }

    /// FlightSafety International (`429`)
    @_alwaysEmitIntoClient
    static var flightsafetyInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 429)
    }

    /// Earlens Corporation (`430`)
    @_alwaysEmitIntoClient
    static var earlens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 430)
    }

    /// Sunrise Micro Devices, Inc. (`431`)
    @_alwaysEmitIntoClient
    static var sunriseMicroDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 431)
    }

    /// Star Micronics Co., Ltd. (`432`)
    @_alwaysEmitIntoClient
    static var starMicronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 432)
    }

    /// Netizens Sp. z o.o. (`433`)
    @_alwaysEmitIntoClient
    static var netizens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 433)
    }

    /// Nymi Inc. (`434`)
    @_alwaysEmitIntoClient
    static var nymi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 434)
    }

    /// Nytec, Inc. (`435`)
    @_alwaysEmitIntoClient
    static var nytec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 435)
    }

    /// Trineo Sp. z o.o. (`436`)
    @_alwaysEmitIntoClient
    static var trineo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 436)
    }

    /// Nest Labs Inc. (`437`)
    @_alwaysEmitIntoClient
    static var nestLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 437)
    }

    /// LM Technologies Ltd (`438`)
    @_alwaysEmitIntoClient
    static var lmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 438)
    }

    /// General Electric Company (`439`)
    @_alwaysEmitIntoClient
    static var generalElectricCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 439)
    }

    /// i+D3 S.L. (`440`)
    @_alwaysEmitIntoClient
    static var iD3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 440)
    }

    /// HANA Micron (`441`)
    @_alwaysEmitIntoClient
    static var hanaMicron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 441)
    }

    /// Stages Cycling LLC (`442`)
    @_alwaysEmitIntoClient
    static var stagesCycling: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 442)
    }

    /// Cochlear Bone Anchored Solutions AB (`443`)
    @_alwaysEmitIntoClient
    static var cochlearBoneAnchoredSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 443)
    }

    /// SenionLab AB (`444`)
    @_alwaysEmitIntoClient
    static var senionlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 444)
    }

    /// Syszone Co., Ltd (`445`)
    @_alwaysEmitIntoClient
    static var syszone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 445)
    }

    /// Pulsate Mobile Ltd. (`446`)
    @_alwaysEmitIntoClient
    static var pulsateMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 446)
    }

    /// Hong Kong HunterSun Electronic Limited (`447`)
    @_alwaysEmitIntoClient
    static var hongKongHuntersunElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 447)
    }

    /// pironex GmbH (`448`)
    @_alwaysEmitIntoClient
    static var pironex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 448)
    }

    /// BRADATECH Corp. (`449`)
    @_alwaysEmitIntoClient
    static var bradatech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 449)
    }

    /// Transenergooil AG (`450`)
    @_alwaysEmitIntoClient
    static var transenergooil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 450)
    }

    /// Bunch (`451`)
    @_alwaysEmitIntoClient
    static var bunch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 451)
    }

    /// DME Microelectronics (`452`)
    @_alwaysEmitIntoClient
    static var dmeMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 452)
    }

    /// Bitcraze AB (`453`)
    @_alwaysEmitIntoClient
    static var bitcraze: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 453)
    }

    /// HASWARE Inc. (`454`)
    @_alwaysEmitIntoClient
    static var hasware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 454)
    }

    /// Abiogenix Inc. (`455`)
    @_alwaysEmitIntoClient
    static var abiogenix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 455)
    }

    /// Poly-Control ApS (`456`)
    @_alwaysEmitIntoClient
    static var polyControl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 456)
    }

    /// Avi-on (`457`)
    @_alwaysEmitIntoClient
    static var aviOn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 457)
    }

    /// Laerdal Medical AS (`458`)
    @_alwaysEmitIntoClient
    static var laerdalMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 458)
    }

    /// Fetch My Pet (`459`)
    @_alwaysEmitIntoClient
    static var fetchMyPet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 459)
    }

    /// Sam Labs Ltd. (`460`)
    @_alwaysEmitIntoClient
    static var samLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 460)
    }

    /// Chengdu Synwing Technology Ltd (`461`)
    @_alwaysEmitIntoClient
    static var chengduSynwingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 461)
    }

    /// HOUWA SYSTEM DESIGN, k.k. (`462`)
    @_alwaysEmitIntoClient
    static var houwaSystemDesignKK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 462)
    }

    /// BSH (`463`)
    @_alwaysEmitIntoClient
    static var bsh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 463)
    }

    /// Primus Inter Pares Ltd (`464`)
    @_alwaysEmitIntoClient
    static var primusInterPares: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 464)
    }

    /// August Home, Inc (`465`)
    @_alwaysEmitIntoClient
    static var augustHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 465)
    }

    /// Gill Electronics (`466`)
    @_alwaysEmitIntoClient
    static var gillElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 466)
    }

    /// Sky Wave Design (`467`)
    @_alwaysEmitIntoClient
    static var skyWaveDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 467)
    }

    /// Newlab S.r.l. (`468`)
    @_alwaysEmitIntoClient
    static var newlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 468)
    }

    /// ELAD srl (`469`)
    @_alwaysEmitIntoClient
    static var elad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 469)
    }

    /// G-wearables inc. (`470`)
    @_alwaysEmitIntoClient
    static var gWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 470)
    }

    /// Squadrone Systems Inc. (`471`)
    @_alwaysEmitIntoClient
    static var squadroneSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 471)
    }

    /// Code Corporation (`472`)
    @_alwaysEmitIntoClient
    static var code: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 472)
    }

    /// Savant Systems LLC (`473`)
    @_alwaysEmitIntoClient
    static var savantSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 473)
    }

    /// Logitech International SA (`474`)
    @_alwaysEmitIntoClient
    static var logitechInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 474)
    }

    /// Innblue Consulting (`475`)
    @_alwaysEmitIntoClient
    static var innblueConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 475)
    }

    /// iParking Ltd. (`476`)
    @_alwaysEmitIntoClient
    static var iparking: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 476)
    }

    /// Koninklijke Philips Electronics N.V. (`477`)
    @_alwaysEmitIntoClient
    static var koninklijkePhilipsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 477)
    }

    /// Minelab Electronics Pty Limited (`478`)
    @_alwaysEmitIntoClient
    static var minelabElectronicsPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 478)
    }

    /// Bison Group Ltd. (`479`)
    @_alwaysEmitIntoClient
    static var bisonGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 479)
    }

    /// Widex A/S (`480`)
    @_alwaysEmitIntoClient
    static var widex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 480)
    }

    /// Jolla Ltd (`481`)
    @_alwaysEmitIntoClient
    static var jolla: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 481)
    }

    /// Lectronix, Inc. (`482`)
    @_alwaysEmitIntoClient
    static var lectronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 482)
    }

    /// Caterpillar Inc (`483`)
    @_alwaysEmitIntoClient
    static var caterpillar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 483)
    }

    /// Freedom Innovations (`484`)
    @_alwaysEmitIntoClient
    static var freedomInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 484)
    }

    /// Dynamic Devices Ltd (`485`)
    @_alwaysEmitIntoClient
    static var dynamicDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 485)
    }

    /// Technology Solutions (UK) Ltd (`486`)
    @_alwaysEmitIntoClient
    static var technologySolutionsUk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 486)
    }

    /// IPS Group Inc. (`487`)
    @_alwaysEmitIntoClient
    static var ipsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 487)
    }

    /// STIR (`488`)
    @_alwaysEmitIntoClient
    static var stir: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 488)
    }

    /// Sano, Inc (`489`)
    @_alwaysEmitIntoClient
    static var sano: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 489)
    }

    /// Advanced Application Design, Inc. (`490`)
    @_alwaysEmitIntoClient
    static var advancedApplicationDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 490)
    }

    /// AutoMap LLC (`491`)
    @_alwaysEmitIntoClient
    static var automap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 491)
    }

    /// Spreadtrum Communications Shanghai Ltd (`492`)
    @_alwaysEmitIntoClient
    static var spreadtrumCommunicationsShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 492)
    }

    /// CuteCircuit LTD (`493`)
    @_alwaysEmitIntoClient
    static var cutecircuit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 493)
    }

    /// Valeo Service (`494`)
    @_alwaysEmitIntoClient
    static var valeoService: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 494)
    }

    /// Fullpower Technologies, Inc. (`495`)
    @_alwaysEmitIntoClient
    static var fullpowerTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 495)
    }

    /// KloudNation (`496`)
    @_alwaysEmitIntoClient
    static var kloudnation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 496)
    }

    /// Zebra Technologies Corporation (`497`)
    @_alwaysEmitIntoClient
    static var zebraTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 497)
    }

    /// Itron, Inc. (`498`)
    @_alwaysEmitIntoClient
    static var itron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 498)
    }

    /// The University of Tokyo (`499`)
    @_alwaysEmitIntoClient
    static var universityOfTokyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 499)
    }

    /// UTC Fire and Security (`500`)
    @_alwaysEmitIntoClient
    static var utcFireAndSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 500)
    }

    /// Cool Webthings Limited (`501`)
    @_alwaysEmitIntoClient
    static var coolWebthings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 501)
    }

    /// DJO Global (`502`)
    @_alwaysEmitIntoClient
    static var djoGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 502)
    }

    /// Gelliner Limited (`503`)
    @_alwaysEmitIntoClient
    static var gelliner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 503)
    }

    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD (`504`)
    @_alwaysEmitIntoClient
    static var anykaGuangzhouMicroelectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 504)
    }

    /// Medtronic, Inc. (`505`)
    @_alwaysEmitIntoClient
    static var medtronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 505)
    }

    /// Gozio, Inc. (`506`)
    @_alwaysEmitIntoClient
    static var gozio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 506)
    }

    /// Form Lifting, LLC (`507`)
    @_alwaysEmitIntoClient
    static var formLifting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 507)
    }

    /// Wahoo Fitness, LLC (`508`)
    @_alwaysEmitIntoClient
    static var wahooFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 508)
    }

    /// Kontakt Micro-Location Sp. z o.o. (`509`)
    @_alwaysEmitIntoClient
    static var kontaktMicroLocation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 509)
    }

    /// Radio System Corporation (`510`)
    @_alwaysEmitIntoClient
    static var radioSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 510)
    }

    /// Freescale Semiconductor, Inc. (`511`)
    @_alwaysEmitIntoClient
    static var freescaleSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 511)
    }

    /// Verifone Systems PTe Ltd. Taiwan Branch (`512`)
    @_alwaysEmitIntoClient
    static var verifoneSystemsPteTaiwanBranch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 512)
    }

    /// AR Timing (`513`)
    @_alwaysEmitIntoClient
    static var arTiming: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 513)
    }

    /// Rigado LLC (`514`)
    @_alwaysEmitIntoClient
    static var rigado: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 514)
    }

    /// Kemppi Oy (`515`)
    @_alwaysEmitIntoClient
    static var kemppi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 515)
    }

    /// Tapcentive Inc. (`516`)
    @_alwaysEmitIntoClient
    static var tapcentive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 516)
    }

    /// Smartbotics Inc. (`517`)
    @_alwaysEmitIntoClient
    static var smartbotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 517)
    }

    /// Otter Products, LLC (`518`)
    @_alwaysEmitIntoClient
    static var otterProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 518)
    }

    /// STEMP Inc. (`519`)
    @_alwaysEmitIntoClient
    static var stemp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 519)
    }

    /// LumiGeek LLC (`520`)
    @_alwaysEmitIntoClient
    static var lumigeek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 520)
    }

    /// InvisionHeart Inc. (`521`)
    @_alwaysEmitIntoClient
    static var invisionheart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 521)
    }

    /// Macnica Inc. (`522`)
    @_alwaysEmitIntoClient
    static var macnica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 522)
    }

    /// Jaguar Land Rover Limited (`523`)
    @_alwaysEmitIntoClient
    static var jaguarLandRover: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 523)
    }

    /// CoroWare Technologies, Inc (`524`)
    @_alwaysEmitIntoClient
    static var corowareTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 524)
    }

    /// Simplo Technology Co., LTD (`525`)
    @_alwaysEmitIntoClient
    static var simploTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 525)
    }

    /// Omron Healthcare Co., LTD (`526`)
    @_alwaysEmitIntoClient
    static var omronHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 526)
    }

    /// Comodule GMBH (`527`)
    @_alwaysEmitIntoClient
    static var comodule: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 527)
    }

    /// ikeGPS (`528`)
    @_alwaysEmitIntoClient
    static var ikegps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 528)
    }

    /// Telink Semiconductor Co. Ltd (`529`)
    @_alwaysEmitIntoClient
    static var telinkSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 529)
    }

    /// Interplan Co., Ltd (`530`)
    @_alwaysEmitIntoClient
    static var interplan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 530)
    }

    /// Wyler AG (`531`)
    @_alwaysEmitIntoClient
    static var wyler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 531)
    }

    /// IK Multimedia Production srl (`532`)
    @_alwaysEmitIntoClient
    static var ikMultimediaProduction: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 532)
    }

    /// Lukoton Experience Oy (`533`)
    @_alwaysEmitIntoClient
    static var lukotonExperience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 533)
    }

    /// MTI Ltd (`534`)
    @_alwaysEmitIntoClient
    static var mti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 534)
    }

    /// Tech4home, Lda (`535`)
    @_alwaysEmitIntoClient
    static var tech4HomeLda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 535)
    }

    /// Hiotech AB (`536`)
    @_alwaysEmitIntoClient
    static var hiotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 536)
    }

    /// DOTT Limited (`537`)
    @_alwaysEmitIntoClient
    static var dott: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 537)
    }

    /// Blue Speck Labs, LLC (`538`)
    @_alwaysEmitIntoClient
    static var blueSpeckLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 538)
    }

    /// Cisco Systems Inc (`539`)
    @_alwaysEmitIntoClient
    static var ciscoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 539)
    }

    /// Mobicomm Inc (`540`)
    @_alwaysEmitIntoClient
    static var mobicomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 540)
    }

    /// Edamic (`541`)
    @_alwaysEmitIntoClient
    static var edamic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 541)
    }

    /// Goodnet Ltd (`542`)
    @_alwaysEmitIntoClient
    static var goodnet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 542)
    }

    /// Luster Leaf Products Inc (`543`)
    @_alwaysEmitIntoClient
    static var lusterLeafProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 543)
    }

    /// Manus Machina BV (`544`)
    @_alwaysEmitIntoClient
    static var manusMachina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 544)
    }

    /// Mobiquity Networks Inc (`545`)
    @_alwaysEmitIntoClient
    static var mobiquityNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 545)
    }

    /// Praxis Dynamics (`546`)
    @_alwaysEmitIntoClient
    static var praxisDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 546)
    }

    /// Philip Morris Products S.A. (`547`)
    @_alwaysEmitIntoClient
    static var philipMorrisProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 547)
    }

    /// Comarch SA (`548`)
    @_alwaysEmitIntoClient
    static var comarch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 548)
    }

    /// Nestlé Nespresso S.A. (`549`)
    @_alwaysEmitIntoClient
    static var nestléNespresso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 549)
    }

    /// Merlinia A/S (`550`)
    @_alwaysEmitIntoClient
    static var merlinia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 550)
    }

    /// LifeBEAM Technologies (`551`)
    @_alwaysEmitIntoClient
    static var lifebeamTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 551)
    }

    /// Twocanoes Labs, LLC (`552`)
    @_alwaysEmitIntoClient
    static var twocanoesLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 552)
    }

    /// Muoverti Limited (`553`)
    @_alwaysEmitIntoClient
    static var muoverti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 553)
    }

    /// Stamer Musikanlagen GMBH (`554`)
    @_alwaysEmitIntoClient
    static var stamerMusikanlagen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 554)
    }

    /// Tesla Motors (`555`)
    @_alwaysEmitIntoClient
    static var teslaMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 555)
    }

    /// Pharynks Corporation (`556`)
    @_alwaysEmitIntoClient
    static var pharynks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 556)
    }

    /// Lupine (`557`)
    @_alwaysEmitIntoClient
    static var lupine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 557)
    }

    /// Siemens AG (`558`)
    @_alwaysEmitIntoClient
    static var siemens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 558)
    }

    /// Huami (Shanghai) Culture Communication CO., LTD (`559`)
    @_alwaysEmitIntoClient
    static var huamiShanghaiCultureCommunication: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 559)
    }

    /// Foster Electric Company, Ltd (`560`)
    @_alwaysEmitIntoClient
    static var fosterElectricCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 560)
    }

    /// ETA SA (`561`)
    @_alwaysEmitIntoClient
    static var eta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 561)
    }

    /// x-Senso Solutions Kft (`562`)
    @_alwaysEmitIntoClient
    static var xSensoSolutionsKft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 562)
    }

    /// Shenzhen SuLong Communication Ltd (`563`)
    @_alwaysEmitIntoClient
    static var shenzhenSulongCommunication: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 563)
    }

    /// FengFan (BeiJing) Technology Co, Ltd (`564`)
    @_alwaysEmitIntoClient
    static var fengfanBeijingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 564)
    }

    /// Qrio Inc (`565`)
    @_alwaysEmitIntoClient
    static var qrio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 565)
    }

    /// Pitpatpet Ltd (`566`)
    @_alwaysEmitIntoClient
    static var pitpatpet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 566)
    }

    /// MSHeli s.r.l. (`567`)
    @_alwaysEmitIntoClient
    static var msheli: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 567)
    }

    /// Trakm8 Ltd (`568`)
    @_alwaysEmitIntoClient
    static var trakm8: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 568)
    }

    /// JIN CO, Ltd (`569`)
    @_alwaysEmitIntoClient
    static var jin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 569)
    }

    /// Alatech Technology (`570`)
    @_alwaysEmitIntoClient
    static var alatechTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 570)
    }

    /// Beijing CarePulse Electronic Technology Co, Ltd (`571`)
    @_alwaysEmitIntoClient
    static var beijingCarepulseElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 571)
    }

    /// Awarepoint (`572`)
    @_alwaysEmitIntoClient
    static var awarepoint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 572)
    }

    /// ViCentra B.V. (`573`)
    @_alwaysEmitIntoClient
    static var vicentra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 573)
    }

    /// Raven Industries (`574`)
    @_alwaysEmitIntoClient
    static var ravenIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 574)
    }

    /// WaveWare Technologies (`575`)
    @_alwaysEmitIntoClient
    static var wavewareTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 575)
    }

    /// Argenox Technologies (`576`)
    @_alwaysEmitIntoClient
    static var argenoxTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 576)
    }

    /// Bragi GmbH (`577`)
    @_alwaysEmitIntoClient
    static var bragi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 577)
    }

    /// 16Lab Inc (`578`)
    @_alwaysEmitIntoClient
    static var uuid16Lab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 578)
    }

    /// Masimo Corp (`579`)
    @_alwaysEmitIntoClient
    static var masimo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 579)
    }

    /// Iotera Inc. (`580`)
    @_alwaysEmitIntoClient
    static var iotera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 580)
    }

    /// Endress+Hauser (`581`)
    @_alwaysEmitIntoClient
    static var endressHauser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 581)
    }

    /// ACKme Networks, Inc. (`582`)
    @_alwaysEmitIntoClient
    static var ackmeNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 582)
    }

    /// FiftyThree Inc. (`583`)
    @_alwaysEmitIntoClient
    static var fiftythree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 583)
    }

    /// Parker Hannifin Corp (`584`)
    @_alwaysEmitIntoClient
    static var parkerHannifin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 584)
    }

    /// Transcranial Ltd (`585`)
    @_alwaysEmitIntoClient
    static var transcranial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 585)
    }

    /// Uwatec AG (`586`)
    @_alwaysEmitIntoClient
    static var uwatec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 586)
    }

    /// Orlan LLC (`587`)
    @_alwaysEmitIntoClient
    static var orlan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 587)
    }

    /// Blue Clover Devices (`588`)
    @_alwaysEmitIntoClient
    static var blueCloverDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 588)
    }

    /// M-Way Solutions GmbH (`589`)
    @_alwaysEmitIntoClient
    static var mWaySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 589)
    }

    /// Microtronics Engineering GmbH (`590`)
    @_alwaysEmitIntoClient
    static var microtronicsEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 590)
    }

    /// Schneider Schreibgeräte GmbH (`591`)
    @_alwaysEmitIntoClient
    static var schneiderSchreibgeräte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 591)
    }

    /// Sapphire Circuits LLC (`592`)
    @_alwaysEmitIntoClient
    static var sapphireCircuits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 592)
    }

    /// Lumo Bodytech Inc. (`593`)
    @_alwaysEmitIntoClient
    static var lumoBodytech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 593)
    }

    /// UKC Technosolution (`594`)
    @_alwaysEmitIntoClient
    static var ukcTechnosolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 594)
    }

    /// Xicato Inc. (`595`)
    @_alwaysEmitIntoClient
    static var xicato: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 595)
    }

    /// Playbrush (`596`)
    @_alwaysEmitIntoClient
    static var playbrush: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 596)
    }

    /// Dai Nippon Printing Co., Ltd. (`597`)
    @_alwaysEmitIntoClient
    static var daiNipponPrinting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 597)
    }

    /// G24 Power Limited (`598`)
    @_alwaysEmitIntoClient
    static var g24Power: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 598)
    }

    /// AdBabble Local Commerce Inc. (`599`)
    @_alwaysEmitIntoClient
    static var adbabbleLocalCommerce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 599)
    }

    /// Devialet SA (`600`)
    @_alwaysEmitIntoClient
    static var devialet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 600)
    }

    /// ALTYOR (`601`)
    @_alwaysEmitIntoClient
    static var altyor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 601)
    }

    /// University of Applied Sciences Valais/Haute Ecole Valaisanne (`602`)
    @_alwaysEmitIntoClient
    static var universityOfAppliedSciencesValaisHauteEcoleValaisanne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 602)
    }

    /// Five Interactive, LLC dba Zendo (`603`)
    @_alwaysEmitIntoClient
    static var fiveInteractiveDbaZendo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 603)
    }

    /// NetEase (Hangzhou) Network co.Ltd. (`604`)
    @_alwaysEmitIntoClient
    static var neteaseHangzhouNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 604)
    }

    /// Lexmark International Inc. (`605`)
    @_alwaysEmitIntoClient
    static var lexmarkInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 605)
    }

    /// Fluke Corporation (`606`)
    @_alwaysEmitIntoClient
    static var fluke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 606)
    }

    /// Yardarm Technologies (`607`)
    @_alwaysEmitIntoClient
    static var yardarmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 607)
    }

    /// SensaRx (`608`)
    @_alwaysEmitIntoClient
    static var sensarx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 608)
    }

    /// SECVRE GmbH (`609`)
    @_alwaysEmitIntoClient
    static var secvre: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 609)
    }

    /// Glacial Ridge Technologies (`610`)
    @_alwaysEmitIntoClient
    static var glacialRidgeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 610)
    }

    /// Identiv, Inc. (`611`)
    @_alwaysEmitIntoClient
    static var identiv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 611)
    }

    /// DDS, Inc. (`612`)
    @_alwaysEmitIntoClient
    static var dds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 612)
    }

    /// SMK Corporation (`613`)
    @_alwaysEmitIntoClient
    static var smk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 613)
    }

    /// Schawbel Technologies LLC (`614`)
    @_alwaysEmitIntoClient
    static var schawbelTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 614)
    }

    /// XMI Systems SA (`615`)
    @_alwaysEmitIntoClient
    static var xmiSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 615)
    }

    /// Cerevo (`616`)
    @_alwaysEmitIntoClient
    static var cerevo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 616)
    }

    /// Torrox GmbH & Co KG (`617`)
    @_alwaysEmitIntoClient
    static var torrox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 617)
    }

    /// Gemalto (`618`)
    @_alwaysEmitIntoClient
    static var gemalto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 618)
    }

    /// DEKA Research & Development Corp. (`619`)
    @_alwaysEmitIntoClient
    static var dekaResearchDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 619)
    }

    /// Domster Tadeusz Szydlowski (`620`)
    @_alwaysEmitIntoClient
    static var domsterTadeuszSzydlowski: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 620)
    }

    /// Technogym SPA (`621`)
    @_alwaysEmitIntoClient
    static var technogymSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 621)
    }

    /// FLEURBAEY BVBA (`622`)
    @_alwaysEmitIntoClient
    static var fleurbaeyba: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 622)
    }

    /// Aptcode Solutions (`623`)
    @_alwaysEmitIntoClient
    static var aptcodeSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 623)
    }

    /// LSI ADL Technology (`624`)
    @_alwaysEmitIntoClient
    static var lsiAdlTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 624)
    }

    /// Animas Corp (`625`)
    @_alwaysEmitIntoClient
    static var animas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 625)
    }

    /// Alps Electric Co., Ltd. (`626`)
    @_alwaysEmitIntoClient
    static var alpsElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 626)
    }

    /// OCEASOFT (`627`)
    @_alwaysEmitIntoClient
    static var oceasoft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 627)
    }

    /// Motsai Research (`628`)
    @_alwaysEmitIntoClient
    static var motsaiResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 628)
    }

    /// Geotab (`629`)
    @_alwaysEmitIntoClient
    static var geotab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 629)
    }

    /// E.G.O. Elektro-Gerätebau GmbH (`630`)
    @_alwaysEmitIntoClient
    static var eGOElektroGerätebau: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 630)
    }

    /// bewhere inc (`631`)
    @_alwaysEmitIntoClient
    static var bewhere: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 631)
    }

    /// Johnson Outdoors Inc (`632`)
    @_alwaysEmitIntoClient
    static var johnsonOutdoors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 632)
    }

    /// steute Schaltgerate GmbH & Co. KG (`633`)
    @_alwaysEmitIntoClient
    static var steuteSchaltgerate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 633)
    }

    /// Ekomini inc. (`634`)
    @_alwaysEmitIntoClient
    static var ekomini: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 634)
    }

    /// DEFA AS (`635`)
    @_alwaysEmitIntoClient
    static var defa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 635)
    }

    /// Aseptika Ltd (`636`)
    @_alwaysEmitIntoClient
    static var aseptika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 636)
    }

    /// HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 ) (`637`)
    @_alwaysEmitIntoClient
    static var huaweiTechnologies华为技术有限公司: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 637)
    }

    /// HabitAware, LLC (`638`)
    @_alwaysEmitIntoClient
    static var habitaware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 638)
    }

    /// ruwido austria gmbh (`639`)
    @_alwaysEmitIntoClient
    static var ruwidoAustria: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 639)
    }

    /// ITEC corporation (`640`)
    @_alwaysEmitIntoClient
    static var itec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 640)
    }

    /// StoneL (`641`)
    @_alwaysEmitIntoClient
    static var stonel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 641)
    }

    /// Sonova AG (`642`)
    @_alwaysEmitIntoClient
    static var sonova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 642)
    }

    /// Maven Machines, Inc. (`643`)
    @_alwaysEmitIntoClient
    static var mavenMachines: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 643)
    }

    /// Synapse Electronics (`644`)
    @_alwaysEmitIntoClient
    static var synapseElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 644)
    }

    /// Standard Innovation Inc. (`645`)
    @_alwaysEmitIntoClient
    static var standardInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 645)
    }

    /// RF Code, Inc. (`646`)
    @_alwaysEmitIntoClient
    static var rfCode: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 646)
    }

    /// Wally Ventures S.L. (`647`)
    @_alwaysEmitIntoClient
    static var wallyVentures: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 647)
    }

    /// Willowbank Electronics Ltd (`648`)
    @_alwaysEmitIntoClient
    static var willowbankElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 648)
    }

    /// SK Telecom (`649`)
    @_alwaysEmitIntoClient
    static var skTelecom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 649)
    }

    /// Jetro AS (`650`)
    @_alwaysEmitIntoClient
    static var jetro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 650)
    }

    /// Code Gears LTD (`651`)
    @_alwaysEmitIntoClient
    static var codeGears: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 651)
    }

    /// NANOLINK APS (`652`)
    @_alwaysEmitIntoClient
    static var nanolink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 652)
    }

    /// IF, LLC (`653`)
    @_alwaysEmitIntoClient
    static var ifllc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 653)
    }

    /// RF Digital Corp (`654`)
    @_alwaysEmitIntoClient
    static var rfDigital: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 654)
    }

    /// Church & Dwight Co., Inc (`655`)
    @_alwaysEmitIntoClient
    static var churchDwight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 655)
    }

    /// Multibit Oy (`656`)
    @_alwaysEmitIntoClient
    static var multibit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 656)
    }

    /// CliniCloud Inc (`657`)
    @_alwaysEmitIntoClient
    static var clinicloud: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 657)
    }

    /// SwiftSensors (`658`)
    @_alwaysEmitIntoClient
    static var swiftsensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 658)
    }

    /// Blue Bite (`659`)
    @_alwaysEmitIntoClient
    static var blueBite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 659)
    }

    /// ELIAS GmbH (`660`)
    @_alwaysEmitIntoClient
    static var elias: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 660)
    }

    /// Sivantos GmbH (`661`)
    @_alwaysEmitIntoClient
    static var sivantos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 661)
    }

    /// Petzl (`662`)
    @_alwaysEmitIntoClient
    static var petzl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 662)
    }

    /// storm power ltd (`663`)
    @_alwaysEmitIntoClient
    static var stormPower: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 663)
    }

    /// EISST Ltd (`664`)
    @_alwaysEmitIntoClient
    static var eisst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 664)
    }

    /// Inexess Technology Simma KG (`665`)
    @_alwaysEmitIntoClient
    static var inexessTechnologySimmaKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 665)
    }

    /// Currant, Inc. (`666`)
    @_alwaysEmitIntoClient
    static var currant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 666)
    }

    /// C2 Development, Inc. (`667`)
    @_alwaysEmitIntoClient
    static var c2Development: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 667)
    }

    /// Blue Sky Scientific, LLC (`668`)
    @_alwaysEmitIntoClient
    static var blueSkyScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 668)
    }

    /// ALOTTAZS LABS, LLC (`669`)
    @_alwaysEmitIntoClient
    static var alottazsLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 669)
    }

    /// Kupson spol. s r.o. (`670`)
    @_alwaysEmitIntoClient
    static var kupsonSpolSRO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 670)
    }

    /// Areus Engineering GmbH (`671`)
    @_alwaysEmitIntoClient
    static var areusEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 671)
    }

    /// Impossible Camera GmbH (`672`)
    @_alwaysEmitIntoClient
    static var impossibleCamera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 672)
    }

    /// InventureTrack Systems (`673`)
    @_alwaysEmitIntoClient
    static var inventuretrackSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 673)
    }

    /// LockedUp (`674`)
    @_alwaysEmitIntoClient
    static var lockedup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 674)
    }

    /// Itude (`675`)
    @_alwaysEmitIntoClient
    static var itude: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 675)
    }

    /// Pacific Lock Company (`676`)
    @_alwaysEmitIntoClient
    static var pacificLockCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 676)
    }

    /// Tendyron Corporation ( 天地融科技股份有限公司 ) (`677`)
    @_alwaysEmitIntoClient
    static var tendyron天地融科技股份有限公司: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 677)
    }

    /// Robert Bosch GmbH (`678`)
    @_alwaysEmitIntoClient
    static var robertBosch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 678)
    }

    /// Illuxtron international B.V. (`679`)
    @_alwaysEmitIntoClient
    static var illuxtronInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 679)
    }

    /// miSport Ltd. (`680`)
    @_alwaysEmitIntoClient
    static var misport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 680)
    }

    /// Chargelib (`681`)
    @_alwaysEmitIntoClient
    static var chargelib: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 681)
    }

    /// Doppler Lab (`682`)
    @_alwaysEmitIntoClient
    static var dopplerLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 682)
    }

    /// BBPOS Limited (`683`)
    @_alwaysEmitIntoClient
    static var bbpos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 683)
    }

    /// RTB Elektronik GmbH & Co. KG (`684`)
    @_alwaysEmitIntoClient
    static var rtbElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 684)
    }

    /// Rx Networks, Inc. (`685`)
    @_alwaysEmitIntoClient
    static var rxNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 685)
    }

    /// WeatherFlow, Inc. (`686`)
    @_alwaysEmitIntoClient
    static var weatherflow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 686)
    }

    /// Technicolor USA Inc. (`687`)
    @_alwaysEmitIntoClient
    static var technicolorUsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 687)
    }

    /// Bestechnic(Shanghai),Ltd (`688`)
    @_alwaysEmitIntoClient
    static var bestechnicShanghaiLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 688)
    }

    /// Raden Inc (`689`)
    @_alwaysEmitIntoClient
    static var raden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 689)
    }

    /// JouZen Oy (`690`)
    @_alwaysEmitIntoClient
    static var jouzen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 690)
    }

    /// CLABER S.P.A. (`691`)
    @_alwaysEmitIntoClient
    static var claber: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 691)
    }

    /// Hyginex, Inc. (`692`)
    @_alwaysEmitIntoClient
    static var hyginex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 692)
    }

    /// HANSHIN ELECTRIC RAILWAY CO.,LTD. (`693`)
    @_alwaysEmitIntoClient
    static var hanshinElectricRailway: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 693)
    }

    /// Schneider Electric (`694`)
    @_alwaysEmitIntoClient
    static var schneiderElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 694)
    }

    /// Oort Technologies LLC (`695`)
    @_alwaysEmitIntoClient
    static var oortTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 695)
    }

    /// Chrono Therapeutics (`696`)
    @_alwaysEmitIntoClient
    static var chronoTherapeutics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 696)
    }

    /// Rinnai Corporation (`697`)
    @_alwaysEmitIntoClient
    static var rinnai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 697)
    }

    /// Swissprime Technologies AG (`698`)
    @_alwaysEmitIntoClient
    static var swissprimeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 698)
    }

    /// Koha.,Co.Ltd (`699`)
    @_alwaysEmitIntoClient
    static var koha: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 699)
    }

    /// Genevac Ltd (`700`)
    @_alwaysEmitIntoClient
    static var genevac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 700)
    }

    /// Chemtronics (`701`)
    @_alwaysEmitIntoClient
    static var chemtronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 701)
    }

    /// Seguro Technology Sp. z o.o. (`702`)
    @_alwaysEmitIntoClient
    static var seguroTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 702)
    }

    /// Redbird Flight Simulations (`703`)
    @_alwaysEmitIntoClient
    static var redbirdFlightSimulations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 703)
    }

    /// Dash Robotics (`704`)
    @_alwaysEmitIntoClient
    static var dashRobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 704)
    }

    /// LINE Corporation (`705`)
    @_alwaysEmitIntoClient
    static var line: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 705)
    }

    /// Guillemot Corporation (`706`)
    @_alwaysEmitIntoClient
    static var guillemot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 706)
    }

    /// Techtronic Power Tools Technology Limited (`707`)
    @_alwaysEmitIntoClient
    static var techtronicPowerToolsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 707)
    }

    /// Wilson Sporting Goods (`708`)
    @_alwaysEmitIntoClient
    static var wilsonSportingGoods: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 708)
    }

    /// Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） ) (`709`)
    @_alwaysEmitIntoClient
    static var lenovoSingaporePte联想新加坡: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 709)
    }

    /// Ayatan Sensors (`710`)
    @_alwaysEmitIntoClient
    static var ayatanSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 710)
    }

    /// Electronics Tomorrow Limited (`711`)
    @_alwaysEmitIntoClient
    static var electronicsTomorrow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 711)
    }

    /// VASCO Data Security International, Inc. (`712`)
    @_alwaysEmitIntoClient
    static var vascoDataSecurityInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 712)
    }

    /// PayRange Inc. (`713`)
    @_alwaysEmitIntoClient
    static var payrange: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 713)
    }

    /// ABOV Semiconductor (`714`)
    @_alwaysEmitIntoClient
    static var abovSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 714)
    }

    /// AINA-Wireless Inc. (`715`)
    @_alwaysEmitIntoClient
    static var ainaWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 715)
    }

    /// Eijkelkamp Soil & Water (`716`)
    @_alwaysEmitIntoClient
    static var eijkelkampSoilWater: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 716)
    }

    /// BMA ergonomics b.v. (`717`)
    @_alwaysEmitIntoClient
    static var bmaErgonomics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 717)
    }

    /// Teva Branded Pharmaceutical Products R&D, Inc. (`718`)
    @_alwaysEmitIntoClient
    static var tevaBrandedPharmaceuticalProductsRD: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 718)
    }

    /// Anima (`719`)
    @_alwaysEmitIntoClient
    static var anima: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 719)
    }

    /// 3M (`720`)
    @_alwaysEmitIntoClient
    static var uuid3M: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 720)
    }

    /// Empatica Srl (`721`)
    @_alwaysEmitIntoClient
    static var empatica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 721)
    }

    /// Afero, Inc. (`722`)
    @_alwaysEmitIntoClient
    static var afero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 722)
    }

    /// Powercast Corporation (`723`)
    @_alwaysEmitIntoClient
    static var powercast: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 723)
    }

    /// Secuyou ApS (`724`)
    @_alwaysEmitIntoClient
    static var secuyou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 724)
    }

    /// OMRON Corporation (`725`)
    @_alwaysEmitIntoClient
    static var omron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 725)
    }

    /// Send Solutions (`726`)
    @_alwaysEmitIntoClient
    static var sendSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 726)
    }

    /// NIPPON SYSTEMWARE CO.,LTD. (`727`)
    @_alwaysEmitIntoClient
    static var nipponSystemware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 727)
    }

    /// Neosfar (`728`)
    @_alwaysEmitIntoClient
    static var neosfar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 728)
    }

    /// Fliegl Agrartechnik GmbH (`729`)
    @_alwaysEmitIntoClient
    static var flieglAgrartechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 729)
    }

    /// Gilvader (`730`)
    @_alwaysEmitIntoClient
    static var gilvader: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 730)
    }

    /// Digi International Inc (R) (`731`)
    @_alwaysEmitIntoClient
    static var digiInternationalR: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 731)
    }

    /// DeWalch Technologies, Inc. (`732`)
    @_alwaysEmitIntoClient
    static var dewalchTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 732)
    }

    /// Flint Rehabilitation Devices, LLC (`733`)
    @_alwaysEmitIntoClient
    static var flintRehabilitationDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 733)
    }

    /// Samsung SDS Co., Ltd. (`734`)
    @_alwaysEmitIntoClient
    static var samsungSds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 734)
    }

    /// Blur Product Development (`735`)
    @_alwaysEmitIntoClient
    static var blurProductDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 735)
    }

    /// University of Michigan (`736`)
    @_alwaysEmitIntoClient
    static var universityOfMichigan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 736)
    }

    /// Victron Energy BV (`737`)
    @_alwaysEmitIntoClient
    static var victronEnergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 737)
    }

    /// NTT docomo (`738`)
    @_alwaysEmitIntoClient
    static var nttDocomo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 738)
    }

    /// Carmanah Technologies Corp. (`739`)
    @_alwaysEmitIntoClient
    static var carmanahTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 739)
    }

    /// Bytestorm Ltd. (`740`)
    @_alwaysEmitIntoClient
    static var bytestorm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 740)
    }

    /// Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 ) (`741`)
    @_alwaysEmitIntoClient
    static var espressif乐鑫信息科技上海有限公司: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 741)
    }

    /// Unwire (`742`)
    @_alwaysEmitIntoClient
    static var unwire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 742)
    }

    /// Connected Yard, Inc. (`743`)
    @_alwaysEmitIntoClient
    static var connectedYard: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 743)
    }

    /// American Music Environments (`744`)
    @_alwaysEmitIntoClient
    static var americanMusicEnvironments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 744)
    }

    /// Sensogram Technologies, Inc. (`745`)
    @_alwaysEmitIntoClient
    static var sensogramTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 745)
    }

    /// Fujitsu Limited (`746`)
    @_alwaysEmitIntoClient
    static var fujitsu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 746)
    }

    /// Ardic Technology (`747`)
    @_alwaysEmitIntoClient
    static var ardicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 747)
    }

    /// Delta Systems, Inc (`748`)
    @_alwaysEmitIntoClient
    static var deltaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 748)
    }

    /// HTC Corporation (`749`)
    @_alwaysEmitIntoClient
    static var htc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 749)
    }

    /// Citizen Holdings Co., Ltd. (`750`)
    @_alwaysEmitIntoClient
    static var citizenHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 750)
    }

    /// SMART-INNOVATION.inc (`751`)
    @_alwaysEmitIntoClient
    static var smartInnovationInc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 751)
    }

    /// Blackrat Software (`752`)
    @_alwaysEmitIntoClient
    static var blackratSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 752)
    }

    /// The Idea Cave, LLC (`753`)
    @_alwaysEmitIntoClient
    static var ideaCave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 753)
    }

    /// GoPro, Inc. (`754`)
    @_alwaysEmitIntoClient
    static var gopro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 754)
    }

    /// AuthAir, Inc (`755`)
    @_alwaysEmitIntoClient
    static var authair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 755)
    }

    /// Vensi, Inc. (`756`)
    @_alwaysEmitIntoClient
    static var vensi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 756)
    }

    /// Indagem Tech LLC (`757`)
    @_alwaysEmitIntoClient
    static var indagemTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 757)
    }

    /// Intemo Technologies (`758`)
    @_alwaysEmitIntoClient
    static var intemoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 758)
    }

    /// DreamVisions co., Ltd. (`759`)
    @_alwaysEmitIntoClient
    static var dreamvisions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 759)
    }

    /// Runteq Oy Ltd (`760`)
    @_alwaysEmitIntoClient
    static var runteq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 760)
    }

    /// IMAGINATION TECHNOLOGIES LTD (`761`)
    @_alwaysEmitIntoClient
    static var imaginationTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 761)
    }

    /// CoSTAR Technologies (`762`)
    @_alwaysEmitIntoClient
    static var costarTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 762)
    }

    /// Clarius Mobile Health Corp. (`763`)
    @_alwaysEmitIntoClient
    static var clariusMobileHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 763)
    }

    /// Shanghai Frequen Microelectronics Co., Ltd. (`764`)
    @_alwaysEmitIntoClient
    static var shanghaiFrequenMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 764)
    }

    /// Uwanna, Inc. (`765`)
    @_alwaysEmitIntoClient
    static var uwanna: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 765)
    }

    /// Lierda Science & Technology Group Co., Ltd. (`766`)
    @_alwaysEmitIntoClient
    static var lierdaScienceTechnologyGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 766)
    }

    /// Silicon Laboratories (`767`)
    @_alwaysEmitIntoClient
    static var siliconLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 767)
    }

    /// World Moto Inc. (`768`)
    @_alwaysEmitIntoClient
    static var worldMoto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 768)
    }

    /// Giatec Scientific Inc. (`769`)
    @_alwaysEmitIntoClient
    static var giatecScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 769)
    }

    /// Loop Devices, Inc (`770`)
    @_alwaysEmitIntoClient
    static var loopDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 770)
    }

    /// IACA electronique (`771`)
    @_alwaysEmitIntoClient
    static var iacaElectronique: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 771)
    }

    /// Martians Inc (`772`)
    @_alwaysEmitIntoClient
    static var martians: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 772)
    }

    /// Swipp ApS (`773`)
    @_alwaysEmitIntoClient
    static var swipp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 773)
    }

    /// Life Laboratory Inc. (`774`)
    @_alwaysEmitIntoClient
    static var lifeLaboratory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 774)
    }

    /// FUJI INDUSTRIAL CO.,LTD. (`775`)
    @_alwaysEmitIntoClient
    static var fujiIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 775)
    }

    /// Surefire, LLC (`776`)
    @_alwaysEmitIntoClient
    static var surefire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 776)
    }

    /// Dolby Labs (`777`)
    @_alwaysEmitIntoClient
    static var dolbyLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 777)
    }

    /// Ellisys (`778`)
    @_alwaysEmitIntoClient
    static var ellisys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 778)
    }

    /// Magnitude Lighting Converters (`779`)
    @_alwaysEmitIntoClient
    static var magnitudeLightingConverters: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 779)
    }

    /// Hilti AG (`780`)
    @_alwaysEmitIntoClient
    static var hilti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 780)
    }

    /// Devdata S.r.l. (`781`)
    @_alwaysEmitIntoClient
    static var devdata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 781)
    }

    /// Deviceworx (`782`)
    @_alwaysEmitIntoClient
    static var deviceworx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 782)
    }

    /// Shortcut Labs (`783`)
    @_alwaysEmitIntoClient
    static var shortcutLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 783)
    }

    /// SGL Italia S.r.l. (`784`)
    @_alwaysEmitIntoClient
    static var sglItalia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 784)
    }

    /// PEEQ DATA (`785`)
    @_alwaysEmitIntoClient
    static var peeqData: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 785)
    }

    /// Ducere Technologies Pvt Ltd (`786`)
    @_alwaysEmitIntoClient
    static var ducereTechnologiesPvt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 786)
    }

    /// DiveNav, Inc. (`787`)
    @_alwaysEmitIntoClient
    static var divenav: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 787)
    }

    /// RIIG AI Sp. z o.o. (`788`)
    @_alwaysEmitIntoClient
    static var riigAi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 788)
    }

    /// Thermo Fisher Scientific (`789`)
    @_alwaysEmitIntoClient
    static var thermoFisherScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 789)
    }

    /// AG Measurematics Pvt. Ltd. (`790`)
    @_alwaysEmitIntoClient
    static var agMeasurematics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 790)
    }

    /// CHUO Electronics CO., LTD. (`791`)
    @_alwaysEmitIntoClient
    static var chuoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 791)
    }

    /// Aspenta International (`792`)
    @_alwaysEmitIntoClient
    static var aspentaInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 792)
    }

    /// Eugster Frismag AG (`793`)
    @_alwaysEmitIntoClient
    static var eugsterFrismag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 793)
    }

    /// Amber wireless GmbH (`794`)
    @_alwaysEmitIntoClient
    static var amberWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 794)
    }

    /// HQ Inc (`795`)
    @_alwaysEmitIntoClient
    static var hq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 795)
    }

    /// Lab Sensor Solutions (`796`)
    @_alwaysEmitIntoClient
    static var labSensorSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 796)
    }

    /// Enterlab ApS (`797`)
    @_alwaysEmitIntoClient
    static var enterlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 797)
    }

    /// Eyefi, Inc. (`798`)
    @_alwaysEmitIntoClient
    static var eyefi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 798)
    }

    /// MetaSystem S.p.A (`799`)
    @_alwaysEmitIntoClient
    static var metasystemSPA: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 799)
    }

    /// SONO ELECTRONICS. CO., LTD (`800`)
    @_alwaysEmitIntoClient
    static var sonoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 800)
    }

    /// Jewelbots (`801`)
    @_alwaysEmitIntoClient
    static var jewelbots: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 801)
    }

    /// Compumedics Limited (`802`)
    @_alwaysEmitIntoClient
    static var compumedics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 802)
    }

    /// Rotor Bike Components (`803`)
    @_alwaysEmitIntoClient
    static var rotorBikeComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 803)
    }

    /// Astro, Inc. (`804`)
    @_alwaysEmitIntoClient
    static var astro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 804)
    }

    /// Amotus Solutions (`805`)
    @_alwaysEmitIntoClient
    static var amotusSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 805)
    }

    /// Healthwear Technologies (Changzhou)Ltd (`806`)
    @_alwaysEmitIntoClient
    static var healthwearTechnologiesChangzhouLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 806)
    }

    /// Essex Electronics (`807`)
    @_alwaysEmitIntoClient
    static var essexElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 807)
    }

    /// Grundfos A/S (`808`)
    @_alwaysEmitIntoClient
    static var grundfos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 808)
    }

    /// Eargo, Inc. (`809`)
    @_alwaysEmitIntoClient
    static var eargo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 809)
    }

    /// Electronic Design Lab (`810`)
    @_alwaysEmitIntoClient
    static var electronicDesignLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 810)
    }

    /// ESYLUX (`811`)
    @_alwaysEmitIntoClient
    static var esylux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 811)
    }

    /// NIPPON SMT.CO.,Ltd (`812`)
    @_alwaysEmitIntoClient
    static var nipponSmt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 812)
    }

    /// BM innovations GmbH (`813`)
    @_alwaysEmitIntoClient
    static var bmInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 813)
    }

    /// indoormap (`814`)
    @_alwaysEmitIntoClient
    static var indoormap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 814)
    }

    /// OttoQ Inc (`815`)
    @_alwaysEmitIntoClient
    static var ottoq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 815)
    }

    /// North Pole Engineering (`816`)
    @_alwaysEmitIntoClient
    static var northPoleEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 816)
    }

    /// 3flares Technologies Inc. (`817`)
    @_alwaysEmitIntoClient
    static var uuid3FlaresTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 817)
    }

    /// Electrocompaniet A.S. (`818`)
    @_alwaysEmitIntoClient
    static var electrocompaniet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 818)
    }

    /// Mul-T-Lock (`819`)
    @_alwaysEmitIntoClient
    static var mulTLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 819)
    }

    /// Corentium AS (`820`)
    @_alwaysEmitIntoClient
    static var corentium: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 820)
    }

    /// Enlighted Inc (`821`)
    @_alwaysEmitIntoClient
    static var enlighted: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 821)
    }

    /// GISTIC (`822`)
    @_alwaysEmitIntoClient
    static var gistic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 822)
    }

    /// AJP2 Holdings, LLC (`823`)
    @_alwaysEmitIntoClient
    static var ajp2Holdings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 823)
    }

    /// COBI GmbH (`824`)
    @_alwaysEmitIntoClient
    static var cobi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 824)
    }

    /// Blue Sky Scientific, LLC (`825`)
    @_alwaysEmitIntoClient
    static var blueSkyScientific2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 825)
    }

    /// Appception, Inc. (`826`)
    @_alwaysEmitIntoClient
    static var appception: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 826)
    }

    /// Courtney Thorne Limited (`827`)
    @_alwaysEmitIntoClient
    static var courtneyThorne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 827)
    }

    /// Virtuosys (`828`)
    @_alwaysEmitIntoClient
    static var virtuosys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 828)
    }

    /// TPV Technology Limited (`829`)
    @_alwaysEmitIntoClient
    static var tpvTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 829)
    }

    /// Monitra SA (`830`)
    @_alwaysEmitIntoClient
    static var monitra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 830)
    }

    /// Automation Components, Inc. (`831`)
    @_alwaysEmitIntoClient
    static var automationComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 831)
    }

    /// Letsense s.r.l. (`832`)
    @_alwaysEmitIntoClient
    static var letsense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 832)
    }

    /// Etesian Technologies LLC (`833`)
    @_alwaysEmitIntoClient
    static var etesianTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 833)
    }

    /// GERTEC BRASIL LTDA. (`834`)
    @_alwaysEmitIntoClient
    static var gertecBrasila: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 834)
    }

    /// Drekker Development Pty. Ltd. (`835`)
    @_alwaysEmitIntoClient
    static var drekkerDevelopmentPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 835)
    }

    /// Whirl Inc (`836`)
    @_alwaysEmitIntoClient
    static var whirl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 836)
    }

    /// Locus Positioning (`837`)
    @_alwaysEmitIntoClient
    static var locusPositioning: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 837)
    }

    /// Acuity Brands Lighting, Inc (`838`)
    @_alwaysEmitIntoClient
    static var acuityBrandsLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 838)
    }

    /// Prevent Biometrics (`839`)
    @_alwaysEmitIntoClient
    static var preventBiometrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 839)
    }

    /// Arioneo (`840`)
    @_alwaysEmitIntoClient
    static var arioneo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 840)
    }

    /// VersaMe (`841`)
    @_alwaysEmitIntoClient
    static var versame: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 841)
    }

    /// Vaddio (`842`)
    @_alwaysEmitIntoClient
    static var vaddio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 842)
    }

    /// Libratone A/S (`843`)
    @_alwaysEmitIntoClient
    static var libratone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 843)
    }

    /// HM Electronics, Inc. (`844`)
    @_alwaysEmitIntoClient
    static var hmElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 844)
    }

    /// TASER International, Inc. (`845`)
    @_alwaysEmitIntoClient
    static var taserInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 845)
    }

    /// Safe Trust Inc. (`846`)
    @_alwaysEmitIntoClient
    static var safeTrust: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 846)
    }

    /// Heartland Payment Systems (`847`)
    @_alwaysEmitIntoClient
    static var heartlandPaymentSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 847)
    }

    /// Bitstrata Systems Inc. (`848`)
    @_alwaysEmitIntoClient
    static var bitstrataSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 848)
    }

    /// Pieps GmbH (`849`)
    @_alwaysEmitIntoClient
    static var pieps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 849)
    }

    /// iRiding(Xiamen)Technology Co.,Ltd. (`850`)
    @_alwaysEmitIntoClient
    static var iridingXiamenTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 850)
    }

    /// Alpha Audiotronics, Inc. (`851`)
    @_alwaysEmitIntoClient
    static var alphaAudiotronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 851)
    }

    /// TOPPAN FORMS CO.,LTD. (`852`)
    @_alwaysEmitIntoClient
    static var toppanForms: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 852)
    }

    /// Sigma Designs, Inc. (`853`)
    @_alwaysEmitIntoClient
    static var sigmaDesigns: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 853)
    }

    /// Spectrum Brands, Inc. (`854`)
    @_alwaysEmitIntoClient
    static var spectrumBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 854)
    }

    /// Polymap Wireless (`855`)
    @_alwaysEmitIntoClient
    static var polymapWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 855)
    }

    /// MagniWare Ltd. (`856`)
    @_alwaysEmitIntoClient
    static var magniware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 856)
    }

    /// Novotec Medical GmbH (`857`)
    @_alwaysEmitIntoClient
    static var novotecMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 857)
    }

    /// Medicom Innovation Partner a/s (`858`)
    @_alwaysEmitIntoClient
    static var medicomInnovationPartner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 858)
    }

    /// Matrix Inc. (`859`)
    @_alwaysEmitIntoClient
    static var matrix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 859)
    }

    /// Eaton Corporation (`860`)
    @_alwaysEmitIntoClient
    static var eaton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 860)
    }

    /// KYS (`861`)
    @_alwaysEmitIntoClient
    static var kys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 861)
    }

    /// Naya Health, Inc. (`862`)
    @_alwaysEmitIntoClient
    static var nayaHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 862)
    }

    /// Acromag (`863`)
    @_alwaysEmitIntoClient
    static var acromag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 863)
    }

    /// Insulet Corporation (`864`)
    @_alwaysEmitIntoClient
    static var insulet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 864)
    }

    /// Wellinks Inc. (`865`)
    @_alwaysEmitIntoClient
    static var wellinks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 865)
    }

    /// ON Semiconductor (`866`)
    @_alwaysEmitIntoClient
    static var onSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 866)
    }

    /// FREELAP SA (`867`)
    @_alwaysEmitIntoClient
    static var freelap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 867)
    }

    /// Favero Electronics Srl (`868`)
    @_alwaysEmitIntoClient
    static var faveroElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 868)
    }

    /// BioMech Sensor LLC (`869`)
    @_alwaysEmitIntoClient
    static var biomechSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 869)
    }

    /// BOLTT Sports technologies Private limited (`870`)
    @_alwaysEmitIntoClient
    static var bolttSportsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 870)
    }

    /// Saphe International (`871`)
    @_alwaysEmitIntoClient
    static var sapheInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 871)
    }

    /// Metormote AB (`872`)
    @_alwaysEmitIntoClient
    static var metormote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 872)
    }

    /// littleBits (`873`)
    @_alwaysEmitIntoClient
    static var littlebits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 873)
    }

    /// SetPoint Medical (`874`)
    @_alwaysEmitIntoClient
    static var setpointMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 874)
    }

    /// BRControls Products BV (`875`)
    @_alwaysEmitIntoClient
    static var brcontrolsProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 875)
    }

    /// Zipcar (`876`)
    @_alwaysEmitIntoClient
    static var zipcar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 876)
    }

    /// AirBolt Pty Ltd (`877`)
    @_alwaysEmitIntoClient
    static var airboltPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 877)
    }

    /// KeepTruckin Inc (`878`)
    @_alwaysEmitIntoClient
    static var keeptruckin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 878)
    }

    /// Motiv, Inc. (`879`)
    @_alwaysEmitIntoClient
    static var motiv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 879)
    }

    /// Wazombi Labs OÜ (`880`)
    @_alwaysEmitIntoClient
    static var wazombiLabsOü: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 880)
    }

    /// ORBCOMM (`881`)
    @_alwaysEmitIntoClient
    static var orbcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 881)
    }

    /// Nixie Labs, Inc. (`882`)
    @_alwaysEmitIntoClient
    static var nixieLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 882)
    }

    /// AppNearMe Ltd (`883`)
    @_alwaysEmitIntoClient
    static var appnearme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 883)
    }

    /// Holman Industries (`884`)
    @_alwaysEmitIntoClient
    static var holmanIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 884)
    }

    /// Expain AS (`885`)
    @_alwaysEmitIntoClient
    static var expain: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 885)
    }

    /// Electronic Temperature Instruments Ltd (`886`)
    @_alwaysEmitIntoClient
    static var electronicTemperatureInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 886)
    }

    /// Plejd AB (`887`)
    @_alwaysEmitIntoClient
    static var plejd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 887)
    }

    /// Propeller Health (`888`)
    @_alwaysEmitIntoClient
    static var propellerHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 888)
    }

    /// Shenzhen iMCO Electronic Technology Co.,Ltd (`889`)
    @_alwaysEmitIntoClient
    static var shenzhenImcoElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 889)
    }

    /// Algoria (`890`)
    @_alwaysEmitIntoClient
    static var algoria: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 890)
    }

    /// Apption Labs Inc. (`891`)
    @_alwaysEmitIntoClient
    static var apptionLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 891)
    }

    /// Cronologics Corporation (`892`)
    @_alwaysEmitIntoClient
    static var cronologics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 892)
    }

    /// MICRODIA Ltd. (`893`)
    @_alwaysEmitIntoClient
    static var microdia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 893)
    }

    /// lulabytes S.L. (`894`)
    @_alwaysEmitIntoClient
    static var lulabytes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 894)
    }

    /// Nestec S.A. (`895`)
    @_alwaysEmitIntoClient
    static var nestec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 895)
    }

    /// LLC "MEGA-F service" (`896`)
    @_alwaysEmitIntoClient
    static var megaFService: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 896)
    }

    /// Sharp Corporation (`897`)
    @_alwaysEmitIntoClient
    static var sharp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 897)
    }

    /// Precision Outcomes Ltd (`898`)
    @_alwaysEmitIntoClient
    static var precisionOutcomes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 898)
    }

    /// Kronos Incorporated (`899`)
    @_alwaysEmitIntoClient
    static var kronos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 899)
    }

    /// OCOSMOS Co., Ltd. (`900`)
    @_alwaysEmitIntoClient
    static var ocosmos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 900)
    }

    /// Embedded Electronic Solutions Ltd. dba e2Solutions (`901`)
    @_alwaysEmitIntoClient
    static var embeddedElectronicSolutionsDbaE2Solutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 901)
    }

    /// Aterica Inc. (`902`)
    @_alwaysEmitIntoClient
    static var aterica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 902)
    }

    /// BluStor PMC, Inc. (`903`)
    @_alwaysEmitIntoClient
    static var blustorPmc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 903)
    }

    /// Kapsch TrafficCom AB (`904`)
    @_alwaysEmitIntoClient
    static var kapschTrafficcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 904)
    }

    /// ActiveBlu Corporation (`905`)
    @_alwaysEmitIntoClient
    static var activeblu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 905)
    }

    /// Kohler Mira Limited (`906`)
    @_alwaysEmitIntoClient
    static var kohlerMira: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 906)
    }

    /// Noke (`907`)
    @_alwaysEmitIntoClient
    static var noke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 907)
    }

    /// Appion Inc. (`908`)
    @_alwaysEmitIntoClient
    static var appion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 908)
    }

    /// Resmed Ltd (`909`)
    @_alwaysEmitIntoClient
    static var resmed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 909)
    }

    /// Crownstone B.V. (`910`)
    @_alwaysEmitIntoClient
    static var crownstone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 910)
    }

    /// Xiaomi Inc. (`911`)
    @_alwaysEmitIntoClient
    static var xiaomi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 911)
    }

    /// INFOTECH s.r.o. (`912`)
    @_alwaysEmitIntoClient
    static var infotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 912)
    }

    /// Thingsquare AB (`913`)
    @_alwaysEmitIntoClient
    static var thingsquare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 913)
    }

    /// T&D (`914`)
    @_alwaysEmitIntoClient
    static var tD: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 914)
    }

    /// LAVAZZA S.p.A. (`915`)
    @_alwaysEmitIntoClient
    static var lavazza: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 915)
    }

    /// Netclearance Systems, Inc. (`916`)
    @_alwaysEmitIntoClient
    static var netclearanceSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 916)
    }

    /// SDATAWAY (`917`)
    @_alwaysEmitIntoClient
    static var sdataway: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 917)
    }

    /// BLOKS GmbH (`918`)
    @_alwaysEmitIntoClient
    static var bloks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 918)
    }

    /// LEGO System A/S (`919`)
    @_alwaysEmitIntoClient
    static var legoSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 919)
    }

    /// Thetatronics Ltd (`920`)
    @_alwaysEmitIntoClient
    static var thetatronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 920)
    }

    /// Nikon Corporation (`921`)
    @_alwaysEmitIntoClient
    static var nikon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 921)
    }

    /// NeST (`922`)
    @_alwaysEmitIntoClient
    static var nest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 922)
    }

    /// South Silicon Valley Microelectronics (`923`)
    @_alwaysEmitIntoClient
    static var southSiliconValleyMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 923)
    }

    /// ALE International (`924`)
    @_alwaysEmitIntoClient
    static var aleInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 924)
    }

    /// CareView Communications, Inc. (`925`)
    @_alwaysEmitIntoClient
    static var careviewCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 925)
    }

    /// SchoolBoard Limited (`926`)
    @_alwaysEmitIntoClient
    static var schoolboard: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 926)
    }

    /// Molex Corporation (`927`)
    @_alwaysEmitIntoClient
    static var molex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 927)
    }

    /// IVT Wireless Limited (`928`)
    @_alwaysEmitIntoClient
    static var ivtWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 928)
    }

    /// Alpine Labs LLC (`929`)
    @_alwaysEmitIntoClient
    static var alpineLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 929)
    }

    /// Candura Instruments (`930`)
    @_alwaysEmitIntoClient
    static var canduraInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 930)
    }

    /// SmartMovt Technology Co., Ltd (`931`)
    @_alwaysEmitIntoClient
    static var smartmovtTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 931)
    }

    /// Token Zero Ltd (`932`)
    @_alwaysEmitIntoClient
    static var tokenZero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 932)
    }

    /// ACE CAD Enterprise Co., Ltd. (ACECAD) (`933`)
    @_alwaysEmitIntoClient
    static var aceCadEnterpriseAcecad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 933)
    }

    /// Medela, Inc (`934`)
    @_alwaysEmitIntoClient
    static var medela: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 934)
    }

    /// AeroScout (`935`)
    @_alwaysEmitIntoClient
    static var aeroscout: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 935)
    }

    /// Esrille Inc. (`936`)
    @_alwaysEmitIntoClient
    static var esrille: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 936)
    }

    /// THINKERLY SRL (`937`)
    @_alwaysEmitIntoClient
    static var thinkerly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 937)
    }

    /// Exon Sp. z o.o. (`938`)
    @_alwaysEmitIntoClient
    static var exon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 938)
    }

    /// Meizu Technology Co., Ltd. (`939`)
    @_alwaysEmitIntoClient
    static var meizuTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 939)
    }

    /// Smablo LTD (`940`)
    @_alwaysEmitIntoClient
    static var smablo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 940)
    }

    /// XiQ (`941`)
    @_alwaysEmitIntoClient
    static var xiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 941)
    }

    /// Allswell Inc. (`942`)
    @_alwaysEmitIntoClient
    static var allswell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 942)
    }

    /// Comm-N-Sense Corp DBA Verigo (`943`)
    @_alwaysEmitIntoClient
    static var commNSenseDbaVerigo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 943)
    }

    /// VIBRADORM GmbH (`944`)
    @_alwaysEmitIntoClient
    static var vibradorm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 944)
    }

    /// Otodata Wireless Network Inc. (`945`)
    @_alwaysEmitIntoClient
    static var otodataWirelessNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 945)
    }

    /// Propagation Systems Limited (`946`)
    @_alwaysEmitIntoClient
    static var propagationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 946)
    }

    /// Midwest Instruments & Controls (`947`)
    @_alwaysEmitIntoClient
    static var midwestInstrumentsControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 947)
    }

    /// Alpha Nodus, inc. (`948`)
    @_alwaysEmitIntoClient
    static var alphaNodus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 948)
    }

    /// petPOMM, Inc (`949`)
    @_alwaysEmitIntoClient
    static var petpomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 949)
    }

    /// Mattel (`950`)
    @_alwaysEmitIntoClient
    static var mattel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 950)
    }

    /// Airbly Inc. (`951`)
    @_alwaysEmitIntoClient
    static var airbly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 951)
    }

    /// A-Safe Limited (`952`)
    @_alwaysEmitIntoClient
    static var aSafe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 952)
    }

    /// FREDERIQUE CONSTANT SA (`953`)
    @_alwaysEmitIntoClient
    static var frederiqueConstant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 953)
    }

    /// Maxscend Microelectronics Company Limited (`954`)
    @_alwaysEmitIntoClient
    static var maxscendMicroelectronicsCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 954)
    }

    /// Abbott Diabetes Care (`955`)
    @_alwaysEmitIntoClient
    static var abbottDiabetesCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 955)
    }

    /// ASB Bank Ltd (`956`)
    @_alwaysEmitIntoClient
    static var asbBank: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 956)
    }

    /// amadas (`957`)
    @_alwaysEmitIntoClient
    static var amadas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 957)
    }

    /// Applied Science, Inc. (`958`)
    @_alwaysEmitIntoClient
    static var appliedScience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 958)
    }

    /// iLumi Solutions Inc. (`959`)
    @_alwaysEmitIntoClient
    static var ilumiSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 959)
    }

    /// Arch Systems Inc. (`960`)
    @_alwaysEmitIntoClient
    static var archSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 960)
    }

    /// Ember Technologies, Inc. (`961`)
    @_alwaysEmitIntoClient
    static var emberTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 961)
    }

    /// Snapchat Inc (`962`)
    @_alwaysEmitIntoClient
    static var snapchat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 962)
    }

    /// Casambi Technologies Oy (`963`)
    @_alwaysEmitIntoClient
    static var casambiTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 963)
    }

    /// Pico Technology Inc. (`964`)
    @_alwaysEmitIntoClient
    static var picoTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 964)
    }

    /// St. Jude Medical, Inc. (`965`)
    @_alwaysEmitIntoClient
    static var stJudeMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 965)
    }

    /// Intricon (`966`)
    @_alwaysEmitIntoClient
    static var intricon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 966)
    }

    /// Structural Health Systems, Inc. (`967`)
    @_alwaysEmitIntoClient
    static var structuralHealthSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 967)
    }

    /// Avvel International (`968`)
    @_alwaysEmitIntoClient
    static var avvelInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 968)
    }

    /// Gallagher Group (`969`)
    @_alwaysEmitIntoClient
    static var gallagherGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 969)
    }

    /// In2things Automation Pvt. Ltd. (`970`)
    @_alwaysEmitIntoClient
    static var in2ThingsAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 970)
    }

    /// SYSDEV Srl (`971`)
    @_alwaysEmitIntoClient
    static var sysdev: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 971)
    }

    /// Vonkil Technologies Ltd (`972`)
    @_alwaysEmitIntoClient
    static var vonkilTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 972)
    }

    /// Wynd Technologies, Inc. (`973`)
    @_alwaysEmitIntoClient
    static var wyndTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 973)
    }

    /// CONTRINEX S.A. (`974`)
    @_alwaysEmitIntoClient
    static var contrinex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 974)
    }

    /// MIRA, Inc. (`975`)
    @_alwaysEmitIntoClient
    static var mira: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 975)
    }

    /// Watteam Ltd (`976`)
    @_alwaysEmitIntoClient
    static var watteam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 976)
    }

    /// Density Inc. (`977`)
    @_alwaysEmitIntoClient
    static var density: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 977)
    }

    /// IOT Pot India Private Limited (`978`)
    @_alwaysEmitIntoClient
    static var iotPotIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 978)
    }

    /// Sigma Connectivity AB (`979`)
    @_alwaysEmitIntoClient
    static var sigmaConnectivity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 979)
    }

    /// PEG PEREGO SPA (`980`)
    @_alwaysEmitIntoClient
    static var pegPeregoSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 980)
    }

    /// Wyzelink Systems Inc. (`981`)
    @_alwaysEmitIntoClient
    static var wyzelinkSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 981)
    }

    /// Yota Devices LTD (`982`)
    @_alwaysEmitIntoClient
    static var yotaDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 982)
    }

    /// FINSECUR (`983`)
    @_alwaysEmitIntoClient
    static var finsecur: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 983)
    }

    /// Zen-Me Labs Ltd (`984`)
    @_alwaysEmitIntoClient
    static var zenMeLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 984)
    }

    /// 3IWare Co., Ltd. (`985`)
    @_alwaysEmitIntoClient
    static var uuid3Iware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 985)
    }

    /// EnOcean GmbH (`986`)
    @_alwaysEmitIntoClient
    static var enocean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 986)
    }

    /// Instabeat, Inc (`987`)
    @_alwaysEmitIntoClient
    static var instabeat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 987)
    }

    /// Nima Labs (`988`)
    @_alwaysEmitIntoClient
    static var nimaLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 988)
    }

    /// Andreas Stihl AG & Co. KG (`989`)
    @_alwaysEmitIntoClient
    static var andreasStihl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 989)
    }

    /// Nathan Rhoades LLC (`990`)
    @_alwaysEmitIntoClient
    static var nathanRhoades: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 990)
    }

    /// Grob Technologies, LLC (`991`)
    @_alwaysEmitIntoClient
    static var grobTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 991)
    }

    /// Actions (Zhuhai) Technology Co., Limited (`992`)
    @_alwaysEmitIntoClient
    static var actionsZhuhaiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 992)
    }

    /// SPD Development Company Ltd (`993`)
    @_alwaysEmitIntoClient
    static var spdDevelopmentCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 993)
    }

    /// Sensoan Oy (`994`)
    @_alwaysEmitIntoClient
    static var sensoan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 994)
    }

    /// Qualcomm Life Inc (`995`)
    @_alwaysEmitIntoClient
    static var qualcommLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 995)
    }

    /// Chip-ing AG (`996`)
    @_alwaysEmitIntoClient
    static var chipIng: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 996)
    }

    /// ffly4u (`997`)
    @_alwaysEmitIntoClient
    static var ffly4U: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 997)
    }

    /// IoT Instruments Oy (`998`)
    @_alwaysEmitIntoClient
    static var iotInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 998)
    }

    /// TRUE Fitness Technology (`999`)
    @_alwaysEmitIntoClient
    static var trueFitnessTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 999)
    }

    /// Reiner Kartengeraete GmbH & Co. KG. (`1000`)
    @_alwaysEmitIntoClient
    static var reinerKartengeraete: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1000)
    }

    /// SHENZHEN LEMONJOY TECHNOLOGY CO., LTD. (`1001`)
    @_alwaysEmitIntoClient
    static var shenzhenLemonjoyTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1001)
    }

    /// Hello Inc. (`1002`)
    @_alwaysEmitIntoClient
    static var hello: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1002)
    }

    /// Evollve Inc. (`1003`)
    @_alwaysEmitIntoClient
    static var evollve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1003)
    }

    /// Jigowatts Inc. (`1004`)
    @_alwaysEmitIntoClient
    static var jigowatts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1004)
    }

    /// BASIC MICRO.COM,INC. (`1005`)
    @_alwaysEmitIntoClient
    static var basicMicroCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1005)
    }

    /// CUBE TECHNOLOGIES (`1006`)
    @_alwaysEmitIntoClient
    static var cubeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1006)
    }

    /// foolography GmbH (`1007`)
    @_alwaysEmitIntoClient
    static var foolography: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1007)
    }

    /// CLINK (`1008`)
    @_alwaysEmitIntoClient
    static var clink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1008)
    }

    /// Hestan Smart Cooking Inc. (`1009`)
    @_alwaysEmitIntoClient
    static var hestanSmartCooking: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1009)
    }

    /// WindowMaster A/S (`1010`)
    @_alwaysEmitIntoClient
    static var windowmaster: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1010)
    }

    /// Flowscape AB (`1011`)
    @_alwaysEmitIntoClient
    static var flowscape: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1011)
    }

    /// PAL Technologies Ltd (`1012`)
    @_alwaysEmitIntoClient
    static var palTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1012)
    }

    /// WHERE, Inc. (`1013`)
    @_alwaysEmitIntoClient
    static var whereinc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1013)
    }

    /// Iton Technology Corp. (`1014`)
    @_alwaysEmitIntoClient
    static var itonTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1014)
    }

    /// Owl Labs Inc. (`1015`)
    @_alwaysEmitIntoClient
    static var owlLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1015)
    }

    /// Rockford Corp. (`1016`)
    @_alwaysEmitIntoClient
    static var rockford: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1016)
    }

    /// Becon Technologies Co.,Ltd. (`1017`)
    @_alwaysEmitIntoClient
    static var beconTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1017)
    }

    /// Vyassoft Technologies Inc (`1018`)
    @_alwaysEmitIntoClient
    static var vyassoftTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1018)
    }

    /// Nox Medical (`1019`)
    @_alwaysEmitIntoClient
    static var noxMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1019)
    }

    /// Kimberly-Clark (`1020`)
    @_alwaysEmitIntoClient
    static var kimberlyClark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1020)
    }

    /// Trimble Navigation Ltd. (`1021`)
    @_alwaysEmitIntoClient
    static var trimbleNavigation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1021)
    }

    /// Littelfuse (`1022`)
    @_alwaysEmitIntoClient
    static var littelfuse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1022)
    }

    /// Withings (`1023`)
    @_alwaysEmitIntoClient
    static var withings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1023)
    }

    /// i-developer IT Beratung UG (`1024`)
    @_alwaysEmitIntoClient
    static var iDeveloperItBeratungUg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1024)
    }

    /// リレーションズ株式会社 (`1025`)
    @_alwaysEmitIntoClient
    static var リレーションズ株式会社: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1025)
    }

    /// Sears Holdings Corporation (`1026`)
    @_alwaysEmitIntoClient
    static var searsHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1026)
    }

    /// Gantner Electronic GmbH (`1027`)
    @_alwaysEmitIntoClient
    static var gantnerElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1027)
    }

    /// Authomate Inc (`1028`)
    @_alwaysEmitIntoClient
    static var authomate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1028)
    }

    /// Vertex International, Inc. (`1029`)
    @_alwaysEmitIntoClient
    static var vertexInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1029)
    }

    /// Airtago (`1030`)
    @_alwaysEmitIntoClient
    static var airtago: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1030)
    }

    /// Swiss Audio SA (`1031`)
    @_alwaysEmitIntoClient
    static var swissAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1031)
    }

    /// ToGetHome Inc. (`1032`)
    @_alwaysEmitIntoClient
    static var togethome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1032)
    }

    /// AXIS (`1033`)
    @_alwaysEmitIntoClient
    static var axis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1033)
    }

    /// Openmatics (`1034`)
    @_alwaysEmitIntoClient
    static var openmatics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1034)
    }

    /// Jana Care Inc. (`1035`)
    @_alwaysEmitIntoClient
    static var janaCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1035)
    }

    /// Senix Corporation (`1036`)
    @_alwaysEmitIntoClient
    static var senix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1036)
    }

    /// NorthStar Battery Company, LLC (`1037`)
    @_alwaysEmitIntoClient
    static var northstarBatteryCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1037)
    }

    /// SKF (U.K.) Limited (`1038`)
    @_alwaysEmitIntoClient
    static var skfUK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1038)
    }

    /// CO-AX Technology, Inc. (`1039`)
    @_alwaysEmitIntoClient
    static var coAxTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1039)
    }

    /// Fender Musical Instruments (`1040`)
    @_alwaysEmitIntoClient
    static var fenderMusicalInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1040)
    }

    /// Luidia Inc (`1041`)
    @_alwaysEmitIntoClient
    static var luidia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1041)
    }

    /// SEFAM (`1042`)
    @_alwaysEmitIntoClient
    static var sefam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1042)
    }

    /// Wireless Cables Inc (`1043`)
    @_alwaysEmitIntoClient
    static var wirelessCables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1043)
    }

    /// Lightning Protection International Pty Ltd (`1044`)
    @_alwaysEmitIntoClient
    static var lightningProtectionInternationalPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1044)
    }

    /// Uber Technologies Inc (`1045`)
    @_alwaysEmitIntoClient
    static var uberTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1045)
    }

    /// SODA GmbH (`1046`)
    @_alwaysEmitIntoClient
    static var soda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1046)
    }

    /// Fatigue Science (`1047`)
    @_alwaysEmitIntoClient
    static var fatigueScience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1047)
    }

    /// Alpine Electronics Inc. (`1048`)
    @_alwaysEmitIntoClient
    static var alpineElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1048)
    }

    /// Novalogy LTD (`1049`)
    @_alwaysEmitIntoClient
    static var novalogy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1049)
    }

    /// Friday Labs Limited (`1050`)
    @_alwaysEmitIntoClient
    static var fridayLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1050)
    }

    /// OrthoAccel Technologies (`1051`)
    @_alwaysEmitIntoClient
    static var orthoaccelTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1051)
    }

    /// WaterGuru, Inc. (`1052`)
    @_alwaysEmitIntoClient
    static var waterguru: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1052)
    }

    /// Benning Elektrotechnik und Elektronik GmbH & Co. KG (`1053`)
    @_alwaysEmitIntoClient
    static var benningElektrotechnikUndElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1053)
    }

    /// Dell Computer Corporation (`1054`)
    @_alwaysEmitIntoClient
    static var dellComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1054)
    }

    /// Kopin Corporation (`1055`)
    @_alwaysEmitIntoClient
    static var kopin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1055)
    }

    /// TecBakery GmbH (`1056`)
    @_alwaysEmitIntoClient
    static var tecbakery: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1056)
    }

    /// Backbone Labs, Inc. (`1057`)
    @_alwaysEmitIntoClient
    static var backboneLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1057)
    }

    /// DELSEY SA (`1058`)
    @_alwaysEmitIntoClient
    static var delsey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1058)
    }

    /// Chargifi Limited (`1059`)
    @_alwaysEmitIntoClient
    static var chargifi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1059)
    }

    /// Trainesense Ltd. (`1060`)
    @_alwaysEmitIntoClient
    static var trainesense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1060)
    }

    /// Unify Software and Solutions GmbH & Co. KG (`1061`)
    @_alwaysEmitIntoClient
    static var unifySoftwareAndSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1061)
    }

    /// Husqvarna AB (`1062`)
    @_alwaysEmitIntoClient
    static var husqvarna: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1062)
    }

    /// Focus fleet and fuel management inc (`1063`)
    @_alwaysEmitIntoClient
    static var focusFleetAndFuelManagement: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1063)
    }

    /// SmallLoop, LLC (`1064`)
    @_alwaysEmitIntoClient
    static var smallloop: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1064)
    }

    /// Prolon Inc. (`1065`)
    @_alwaysEmitIntoClient
    static var prolon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1065)
    }

    /// BD Medical (`1066`)
    @_alwaysEmitIntoClient
    static var bdMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1066)
    }

    /// iMicroMed Incorporated (`1067`)
    @_alwaysEmitIntoClient
    static var imicromed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1067)
    }

    /// Ticto N.V. (`1068`)
    @_alwaysEmitIntoClient
    static var ticto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1068)
    }

    /// Meshtech AS (`1069`)
    @_alwaysEmitIntoClient
    static var meshtech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1069)
    }

    /// MemCachier Inc. (`1070`)
    @_alwaysEmitIntoClient
    static var memcachier: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1070)
    }

    /// Danfoss A/S (`1071`)
    @_alwaysEmitIntoClient
    static var danfoss: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1071)
    }

    /// SnapStyk Inc. (`1072`)
    @_alwaysEmitIntoClient
    static var snapstyk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1072)
    }

    /// Amway Corporation (`1073`)
    @_alwaysEmitIntoClient
    static var amway: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1073)
    }

    /// Silk Labs, Inc. (`1074`)
    @_alwaysEmitIntoClient
    static var silkLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1074)
    }

    /// Pillsy Inc. (`1075`)
    @_alwaysEmitIntoClient
    static var pillsy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1075)
    }

    /// Hatch Baby, Inc. (`1076`)
    @_alwaysEmitIntoClient
    static var hatchBaby: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1076)
    }

    /// Blocks Wearables Ltd. (`1077`)
    @_alwaysEmitIntoClient
    static var blocksWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1077)
    }

    /// Drayson Technologies (Europe) Limited (`1078`)
    @_alwaysEmitIntoClient
    static var draysonTechnologiesEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1078)
    }

    /// eBest IOT Inc. (`1079`)
    @_alwaysEmitIntoClient
    static var ebestIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1079)
    }

    /// Helvar Ltd (`1080`)
    @_alwaysEmitIntoClient
    static var helvar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1080)
    }

    /// Radiance Technologies (`1081`)
    @_alwaysEmitIntoClient
    static var radianceTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1081)
    }

    /// Nuheara Limited (`1082`)
    @_alwaysEmitIntoClient
    static var nuheara: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1082)
    }

    /// Appside co., ltd. (`1083`)
    @_alwaysEmitIntoClient
    static var appside: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1083)
    }

    /// DeLaval (`1084`)
    @_alwaysEmitIntoClient
    static var delaval: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1084)
    }

    /// Coiler Corporation (`1085`)
    @_alwaysEmitIntoClient
    static var coiler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1085)
    }

    /// Thermomedics, Inc. (`1086`)
    @_alwaysEmitIntoClient
    static var thermomedics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1086)
    }

    /// Tentacle Sync GmbH (`1087`)
    @_alwaysEmitIntoClient
    static var tentacleSync: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1087)
    }

    /// Valencell, Inc. (`1088`)
    @_alwaysEmitIntoClient
    static var valencell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1088)
    }

    /// iProtoXi Oy (`1089`)
    @_alwaysEmitIntoClient
    static var iprotoxi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1089)
    }

    /// SECOM CO., LTD. (`1090`)
    @_alwaysEmitIntoClient
    static var secom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1090)
    }

    /// Tucker International LLC (`1091`)
    @_alwaysEmitIntoClient
    static var tuckerInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1091)
    }

    /// Metanate Limited (`1092`)
    @_alwaysEmitIntoClient
    static var metanate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1092)
    }

    /// Kobian Canada Inc. (`1093`)
    @_alwaysEmitIntoClient
    static var kobianCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1093)
    }

    /// NETGEAR, Inc. (`1094`)
    @_alwaysEmitIntoClient
    static var netgear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1094)
    }

    /// Fabtronics Australia Pty Ltd (`1095`)
    @_alwaysEmitIntoClient
    static var fabtronicsAustraliaPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1095)
    }

    /// Grand Centrix GmbH (`1096`)
    @_alwaysEmitIntoClient
    static var grandCentrix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1096)
    }

    /// 1UP USA.com llc (`1097`)
    @_alwaysEmitIntoClient
    static var uuid1UpUsaCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1097)
    }

    /// SHIMANO INC. (`1098`)
    @_alwaysEmitIntoClient
    static var shimano: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1098)
    }

    /// Nain Inc. (`1099`)
    @_alwaysEmitIntoClient
    static var nain: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1099)
    }

    /// LifeStyle Lock, LLC (`1100`)
    @_alwaysEmitIntoClient
    static var lifestyleLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1100)
    }

    /// VEGA Grieshaber KG (`1101`)
    @_alwaysEmitIntoClient
    static var vegaGrieshaberKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1101)
    }

    /// Xtrava Inc. (`1102`)
    @_alwaysEmitIntoClient
    static var xtrava: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1102)
    }

    /// TTS Tooltechnic Systems AG & Co. KG (`1103`)
    @_alwaysEmitIntoClient
    static var ttsTooltechnicSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1103)
    }

    /// Teenage Engineering AB (`1104`)
    @_alwaysEmitIntoClient
    static var teenageEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1104)
    }

    /// Tunstall Nordic AB (`1105`)
    @_alwaysEmitIntoClient
    static var tunstallNordic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1105)
    }

    /// Svep Design Center AB (`1106`)
    @_alwaysEmitIntoClient
    static var svepDesignCenter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1106)
    }

    /// GreenPeak Technologies BV (`1107`)
    @_alwaysEmitIntoClient
    static var greenpeakTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1107)
    }

    /// Sphinx Electronics GmbH & Co KG (`1108`)
    @_alwaysEmitIntoClient
    static var sphinxElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1108)
    }

    /// Atomation (`1109`)
    @_alwaysEmitIntoClient
    static var atomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1109)
    }

    /// Nemik Consulting Inc (`1110`)
    @_alwaysEmitIntoClient
    static var nemikConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1110)
    }

    /// RF INNOVATION (`1111`)
    @_alwaysEmitIntoClient
    static var rfInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1111)
    }

    /// Mini Solution Co., Ltd. (`1112`)
    @_alwaysEmitIntoClient
    static var miniSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1112)
    }

    /// Lumenetix, Inc (`1113`)
    @_alwaysEmitIntoClient
    static var lumenetix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1113)
    }

    /// 2048450 Ontario Inc (`1114`)
    @_alwaysEmitIntoClient
    static var uuid2048450Ontario: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1114)
    }

    /// SPACEEK LTD (`1115`)
    @_alwaysEmitIntoClient
    static var spaceek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1115)
    }

    /// Delta T Corporation (`1116`)
    @_alwaysEmitIntoClient
    static var deltaT: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1116)
    }

    /// Boston Scientific Corporation (`1117`)
    @_alwaysEmitIntoClient
    static var bostonScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1117)
    }

    /// Nuviz, Inc. (`1118`)
    @_alwaysEmitIntoClient
    static var nuviz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1118)
    }

    /// Real Time Automation, Inc. (`1119`)
    @_alwaysEmitIntoClient
    static var realTimeAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1119)
    }

    /// Kolibree (`1120`)
    @_alwaysEmitIntoClient
    static var kolibree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1120)
    }

    /// vhf elektronik GmbH (`1121`)
    @_alwaysEmitIntoClient
    static var vhfElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1121)
    }

    /// Bonsai Systems GmbH (`1122`)
    @_alwaysEmitIntoClient
    static var bonsaiSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1122)
    }

    /// Fathom Systems Inc. (`1123`)
    @_alwaysEmitIntoClient
    static var fathomSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1123)
    }

    /// Bellman & Symfon (`1124`)
    @_alwaysEmitIntoClient
    static var bellmanSymfon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1124)
    }

    /// International Forte Group LLC (`1125`)
    @_alwaysEmitIntoClient
    static var internationalForteGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1125)
    }

    /// CycleLabs Solutions inc. (`1126`)
    @_alwaysEmitIntoClient
    static var cyclelabsSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1126)
    }

    /// Codenex Oy (`1127`)
    @_alwaysEmitIntoClient
    static var codenex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1127)
    }

    /// Kynesim Ltd (`1128`)
    @_alwaysEmitIntoClient
    static var kynesim: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1128)
    }

    /// Palago AB (`1129`)
    @_alwaysEmitIntoClient
    static var palago: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1129)
    }

    /// INSIGMA INC. (`1130`)
    @_alwaysEmitIntoClient
    static var insigma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1130)
    }

    /// PMD Solutions (`1131`)
    @_alwaysEmitIntoClient
    static var pmdSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1131)
    }

    /// Qingdao Realtime Technology Co., Ltd. (`1132`)
    @_alwaysEmitIntoClient
    static var qingdaoRealtimeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1132)
    }

    /// BEGA Gantenbrink-Leuchten KG (`1133`)
    @_alwaysEmitIntoClient
    static var begaGantenbrinkLeuchtenKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1133)
    }

    /// Pambor Ltd. (`1134`)
    @_alwaysEmitIntoClient
    static var pambor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1134)
    }

    /// Develco Products A/S (`1135`)
    @_alwaysEmitIntoClient
    static var develcoProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1135)
    }

    /// iDesign s.r.l. (`1136`)
    @_alwaysEmitIntoClient
    static var idesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1136)
    }

    /// TiVo Corp (`1137`)
    @_alwaysEmitIntoClient
    static var tivo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1137)
    }

    /// Control-J Pty Ltd (`1138`)
    @_alwaysEmitIntoClient
    static var controlJPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1138)
    }

    /// Steelcase, Inc. (`1139`)
    @_alwaysEmitIntoClient
    static var steelcase: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1139)
    }

    /// iApartment co., ltd. (`1140`)
    @_alwaysEmitIntoClient
    static var iapartment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1140)
    }

    /// Icom inc. (`1141`)
    @_alwaysEmitIntoClient
    static var icom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1141)
    }

    /// Oxstren Wearable Technologies Private Limited (`1142`)
    @_alwaysEmitIntoClient
    static var oxstrenWearableTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1142)
    }

    /// Blue Spark Technologies (`1143`)
    @_alwaysEmitIntoClient
    static var blueSparkTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1143)
    }

    /// FarSite Communications Limited (`1144`)
    @_alwaysEmitIntoClient
    static var farsiteCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1144)
    }

    /// mywerk system GmbH (`1145`)
    @_alwaysEmitIntoClient
    static var mywerkSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1145)
    }

    /// Sinosun Technology Co., Ltd. (`1146`)
    @_alwaysEmitIntoClient
    static var sinosunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1146)
    }

    /// MIYOSHI ELECTRONICS CORPORATION (`1147`)
    @_alwaysEmitIntoClient
    static var miyoshiElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1147)
    }

    /// POWERMAT LTD (`1148`)
    @_alwaysEmitIntoClient
    static var powermat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1148)
    }

    /// Occly LLC (`1149`)
    @_alwaysEmitIntoClient
    static var occly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1149)
    }

    /// OurHub Dev IvS (`1150`)
    @_alwaysEmitIntoClient
    static var ourhubDevIvs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1150)
    }

    /// Pro-Mark, Inc. (`1151`)
    @_alwaysEmitIntoClient
    static var proMark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1151)
    }

    /// Dynometrics Inc. (`1152`)
    @_alwaysEmitIntoClient
    static var dynometrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1152)
    }

    /// Quintrax Limited (`1153`)
    @_alwaysEmitIntoClient
    static var quintrax: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1153)
    }

    /// POS Tuning Udo Vosshenrich GmbH & Co. KG (`1154`)
    @_alwaysEmitIntoClient
    static var posTuningUdoVosshenrich: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1154)
    }

    /// Multi Care Systems B.V. (`1155`)
    @_alwaysEmitIntoClient
    static var multiCareSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1155)
    }

    /// Revol Technologies Inc (`1156`)
    @_alwaysEmitIntoClient
    static var revolTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1156)
    }

    /// SKIDATA AG (`1157`)
    @_alwaysEmitIntoClient
    static var skidata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1157)
    }

    /// DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME (`1158`)
    @_alwaysEmitIntoClient
    static var devTecnologiaIndustriaComercioEManutencaoDeEquipamentosaMe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1158)
    }

    /// Centrica Connected Home (`1159`)
    @_alwaysEmitIntoClient
    static var centricaConnectedHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1159)
    }

    /// Automotive Data Solutions Inc (`1160`)
    @_alwaysEmitIntoClient
    static var automotiveDataSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1160)
    }

    /// Igarashi Engineering (`1161`)
    @_alwaysEmitIntoClient
    static var igarashiEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1161)
    }

    /// Taelek Oy (`1162`)
    @_alwaysEmitIntoClient
    static var taelek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1162)
    }

    /// CP Electronics Limited (`1163`)
    @_alwaysEmitIntoClient
    static var cpElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1163)
    }

    /// Vectronix AG (`1164`)
    @_alwaysEmitIntoClient
    static var vectronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1164)
    }

    /// S-Labs Sp. z o.o. (`1165`)
    @_alwaysEmitIntoClient
    static var sLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1165)
    }

    /// Companion Medical, Inc. (`1166`)
    @_alwaysEmitIntoClient
    static var companionMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1166)
    }

    /// BlueKitchen GmbH (`1167`)
    @_alwaysEmitIntoClient
    static var bluekitchen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1167)
    }

    /// Matting AB (`1168`)
    @_alwaysEmitIntoClient
    static var matting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1168)
    }

    /// SOREX - Wireless Solutions GmbH (`1169`)
    @_alwaysEmitIntoClient
    static var sorexWirelessSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1169)
    }

    /// ADC Technology, Inc. (`1170`)
    @_alwaysEmitIntoClient
    static var adcTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1170)
    }

    /// Lynxemi Pte Ltd (`1171`)
    @_alwaysEmitIntoClient
    static var lynxemiPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1171)
    }

    /// SENNHEISER electronic GmbH & Co. KG (`1172`)
    @_alwaysEmitIntoClient
    static var sennheiserElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1172)
    }

    /// LMT Mercer Group, Inc (`1173`)
    @_alwaysEmitIntoClient
    static var lmtMercerGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1173)
    }

    /// Polymorphic Labs LLC (`1174`)
    @_alwaysEmitIntoClient
    static var polymorphicLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1174)
    }

    /// Cochlear Limited (`1175`)
    @_alwaysEmitIntoClient
    static var cochlear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1175)
    }

    /// METER Group, Inc. USA (`1176`)
    @_alwaysEmitIntoClient
    static var meterGroupUsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1176)
    }

    /// Ruuvi Innovations Ltd. (`1177`)
    @_alwaysEmitIntoClient
    static var ruuviInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1177)
    }

    /// Situne AS (`1178`)
    @_alwaysEmitIntoClient
    static var situne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1178)
    }

    /// nVisti, LLC (`1179`)
    @_alwaysEmitIntoClient
    static var nvisti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1179)
    }

    /// DyOcean (`1180`)
    @_alwaysEmitIntoClient
    static var dyocean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1180)
    }

    /// Uhlmann & Zacher GmbH (`1181`)
    @_alwaysEmitIntoClient
    static var uhlmannZacher: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1181)
    }

    /// AND!XOR LLC (`1182`)
    @_alwaysEmitIntoClient
    static var andXor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1182)
    }

    /// tictote AB (`1183`)
    @_alwaysEmitIntoClient
    static var tictote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1183)
    }

    /// Vypin, LLC (`1184`)
    @_alwaysEmitIntoClient
    static var vypin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1184)
    }

    /// PNI Sensor Corporation (`1185`)
    @_alwaysEmitIntoClient
    static var pniSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1185)
    }

    /// ovrEngineered, LLC (`1186`)
    @_alwaysEmitIntoClient
    static var ovrengineered: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1186)
    }

    /// GT-tronics HK Ltd (`1187`)
    @_alwaysEmitIntoClient
    static var gtTronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1187)
    }

    /// Herbert Waldmann GmbH & Co. KG (`1188`)
    @_alwaysEmitIntoClient
    static var herbertWaldmann: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1188)
    }

    /// Guangzhou FiiO Electronics Technology Co.,Ltd (`1189`)
    @_alwaysEmitIntoClient
    static var guangzhouFiioElectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1189)
    }

    /// Vinetech Co., Ltd (`1190`)
    @_alwaysEmitIntoClient
    static var vinetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1190)
    }

    /// Dallas Logic Corporation (`1191`)
    @_alwaysEmitIntoClient
    static var dallasLogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1191)
    }

    /// BioTex, Inc. (`1192`)
    @_alwaysEmitIntoClient
    static var biotex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1192)
    }

    /// DISCOVERY SOUND TECHNOLOGY, LLC (`1193`)
    @_alwaysEmitIntoClient
    static var discoverySoundTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1193)
    }

    /// LINKIO SAS (`1194`)
    @_alwaysEmitIntoClient
    static var linkios: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1194)
    }

    /// Harbortronics, Inc. (`1195`)
    @_alwaysEmitIntoClient
    static var harbortronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1195)
    }

    /// Undagrid B.V. (`1196`)
    @_alwaysEmitIntoClient
    static var undagrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1196)
    }

    /// Shure Inc (`1197`)
    @_alwaysEmitIntoClient
    static var shure: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1197)
    }

    /// ERM Electronic Systems LTD (`1198`)
    @_alwaysEmitIntoClient
    static var ermElectronicSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1198)
    }

    /// BIOROWER Handelsagentur GmbH (`1199`)
    @_alwaysEmitIntoClient
    static var biorowerHandelsagentur: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1199)
    }

    /// Weba Sport und Med. Artikel GmbH (`1200`)
    @_alwaysEmitIntoClient
    static var webaSportUndMedArtikel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1200)
    }

    /// Kartographers Technologies Pvt. Ltd. (`1201`)
    @_alwaysEmitIntoClient
    static var kartographersTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1201)
    }

    /// The Shadow on the Moon (`1202`)
    @_alwaysEmitIntoClient
    static var shadowOnMoon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1202)
    }

    /// mobike (Hong Kong) Limited (`1203`)
    @_alwaysEmitIntoClient
    static var mobikeHongKong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1203)
    }

    /// Inuheat Group AB (`1204`)
    @_alwaysEmitIntoClient
    static var inuheatGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1204)
    }

    /// Swiftronix AB (`1205`)
    @_alwaysEmitIntoClient
    static var swiftronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1205)
    }

    /// Diagnoptics Technologies (`1206`)
    @_alwaysEmitIntoClient
    static var diagnopticsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1206)
    }

    /// Analog Devices, Inc. (`1207`)
    @_alwaysEmitIntoClient
    static var analogDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1207)
    }

    /// Soraa Inc. (`1208`)
    @_alwaysEmitIntoClient
    static var soraa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1208)
    }

    /// CSR Building Products Limited (`1209`)
    @_alwaysEmitIntoClient
    static var csrBuildingProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1209)
    }

    /// Crestron Electronics, Inc. (`1210`)
    @_alwaysEmitIntoClient
    static var crestronElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1210)
    }

    /// Neatebox Ltd (`1211`)
    @_alwaysEmitIntoClient
    static var neatebox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1211)
    }

    /// Draegerwerk AG & Co. KGaA (`1212`)
    @_alwaysEmitIntoClient
    static var draegerwerk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1212)
    }

    /// AlbynMedical (`1213`)
    @_alwaysEmitIntoClient
    static var albynmedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1213)
    }

    /// Averos FZCO (`1214`)
    @_alwaysEmitIntoClient
    static var averos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1214)
    }

    /// VIT Initiative, LLC (`1215`)
    @_alwaysEmitIntoClient
    static var vitInitiative: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1215)
    }

    /// Statsports International (`1216`)
    @_alwaysEmitIntoClient
    static var statsportsInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1216)
    }

    /// Sospitas, s.r.o. (`1217`)
    @_alwaysEmitIntoClient
    static var sospitas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1217)
    }

    /// Dmet Products Corp. (`1218`)
    @_alwaysEmitIntoClient
    static var dmetProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1218)
    }

    /// Mantracourt Electronics Limited (`1219`)
    @_alwaysEmitIntoClient
    static var mantracourtElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1219)
    }

    /// TeAM Hutchins AB (`1220`)
    @_alwaysEmitIntoClient
    static var teamHutchins: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1220)
    }

    /// Seibert Williams Glass, LLC (`1221`)
    @_alwaysEmitIntoClient
    static var seibertWilliamsGlass: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1221)
    }

    /// Insta GmbH (`1222`)
    @_alwaysEmitIntoClient
    static var insta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1222)
    }

    /// Svantek Sp. z o.o. (`1223`)
    @_alwaysEmitIntoClient
    static var svantek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1223)
    }

    /// Shanghai Flyco Electrical Appliance Co., Ltd. (`1224`)
    @_alwaysEmitIntoClient
    static var shanghaiFlycoElectricalAppliance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1224)
    }

    /// Thornwave Labs Inc (`1225`)
    @_alwaysEmitIntoClient
    static var thornwaveLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1225)
    }

    /// Steiner-Optik GmbH (`1226`)
    @_alwaysEmitIntoClient
    static var steinerOptik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1226)
    }

    /// Novo Nordisk A/S (`1227`)
    @_alwaysEmitIntoClient
    static var novoNordisk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1227)
    }

    /// Enflux Inc. (`1228`)
    @_alwaysEmitIntoClient
    static var enflux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1228)
    }

    /// Safetech Products LLC (`1229`)
    @_alwaysEmitIntoClient
    static var safetechProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1229)
    }

    /// GOOOLED S.R.L. (`1230`)
    @_alwaysEmitIntoClient
    static var goooled: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1230)
    }

    /// DOM Sicherheitstechnik GmbH & Co. KG (`1231`)
    @_alwaysEmitIntoClient
    static var domSicherheitstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1231)
    }

    /// Olympus Corporation (`1232`)
    @_alwaysEmitIntoClient
    static var olympus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1232)
    }

    /// KTS GmbH (`1233`)
    @_alwaysEmitIntoClient
    static var kts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1233)
    }

    /// Anloq Technologies Inc. (`1234`)
    @_alwaysEmitIntoClient
    static var anloqTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1234)
    }

    /// Queercon, Inc (`1235`)
    @_alwaysEmitIntoClient
    static var queercon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1235)
    }

    /// 5th Element Ltd (`1236`)
    @_alwaysEmitIntoClient
    static var uuid5ThElement: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1236)
    }

    /// Gooee Limited (`1237`)
    @_alwaysEmitIntoClient
    static var gooee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1237)
    }

    /// LUGLOC LLC (`1238`)
    @_alwaysEmitIntoClient
    static var lugloc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1238)
    }

    /// Blincam, Inc. (`1239`)
    @_alwaysEmitIntoClient
    static var blincam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1239)
    }

    /// FUJIFILM Corporation (`1240`)
    @_alwaysEmitIntoClient
    static var fujifilm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1240)
    }

    /// RandMcNally (`1241`)
    @_alwaysEmitIntoClient
    static var randmcnally: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1241)
    }

    /// Franceschi Marina snc (`1242`)
    @_alwaysEmitIntoClient
    static var franceschiMarinaSnc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1242)
    }

    /// Engineered Audio, LLC. (`1243`)
    @_alwaysEmitIntoClient
    static var engineeredAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1243)
    }

    /// IOTTIVE (OPC) PRIVATE LIMITED (`1244`)
    @_alwaysEmitIntoClient
    static var iottiveOpc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1244)
    }

    /// 4MOD Technology (`1245`)
    @_alwaysEmitIntoClient
    static var uuid4ModTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1245)
    }

    /// Lutron Electronics Co., Inc. (`1246`)
    @_alwaysEmitIntoClient
    static var lutronElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1246)
    }

    /// Emerson (`1247`)
    @_alwaysEmitIntoClient
    static var emerson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1247)
    }

    /// Guardtec, Inc. (`1248`)
    @_alwaysEmitIntoClient
    static var guardtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1248)
    }

    /// REACTEC LIMITED (`1249`)
    @_alwaysEmitIntoClient
    static var reactec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1249)
    }

    /// EllieGrid (`1250`)
    @_alwaysEmitIntoClient
    static var elliegrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1250)
    }

    /// Under Armour (`1251`)
    @_alwaysEmitIntoClient
    static var underArmour: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1251)
    }

    /// Woodenshark (`1252`)
    @_alwaysEmitIntoClient
    static var woodenshark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1252)
    }

    /// Avack Oy (`1253`)
    @_alwaysEmitIntoClient
    static var avack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1253)
    }

    /// Smart Solution Technology, Inc. (`1254`)
    @_alwaysEmitIntoClient
    static var smartSolutionTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1254)
    }

    /// REHABTRONICS INC. (`1255`)
    @_alwaysEmitIntoClient
    static var rehabtronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1255)
    }

    /// STABILO International (`1256`)
    @_alwaysEmitIntoClient
    static var stabiloInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1256)
    }

    /// Busch Jaeger Elektro GmbH (`1257`)
    @_alwaysEmitIntoClient
    static var buschJaegerElektro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1257)
    }

    /// Pacific Bioscience Laboratories, Inc (`1258`)
    @_alwaysEmitIntoClient
    static var pacificBioscienceLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1258)
    }

    /// Bird Home Automation GmbH (`1259`)
    @_alwaysEmitIntoClient
    static var birdHomeAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1259)
    }

    /// Motorola Solutions (`1260`)
    @_alwaysEmitIntoClient
    static var motorolaSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1260)
    }

    /// R9 Technology, Inc. (`1261`)
    @_alwaysEmitIntoClient
    static var r9Technology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1261)
    }

    /// Auxivia (`1262`)
    @_alwaysEmitIntoClient
    static var auxivia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1262)
    }

    /// DaisyWorks, Inc (`1263`)
    @_alwaysEmitIntoClient
    static var daisyworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1263)
    }

    /// Kosi Limited (`1264`)
    @_alwaysEmitIntoClient
    static var kosi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1264)
    }

    /// Theben AG (`1265`)
    @_alwaysEmitIntoClient
    static var theben: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1265)
    }

    /// InDreamer Techsol Private Limited (`1266`)
    @_alwaysEmitIntoClient
    static var indreamerTechsol: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1266)
    }

    /// Cerevast Medical (`1267`)
    @_alwaysEmitIntoClient
    static var cerevastMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1267)
    }

    /// ZanCompute Inc. (`1268`)
    @_alwaysEmitIntoClient
    static var zancompute: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1268)
    }

    /// Pirelli Tyre S.P.A. (`1269`)
    @_alwaysEmitIntoClient
    static var pirelliTyre: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1269)
    }

    /// McLear Limited (`1270`)
    @_alwaysEmitIntoClient
    static var mclear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1270)
    }

    /// Shenzhen Huiding Technology Co.,Ltd. (`1271`)
    @_alwaysEmitIntoClient
    static var shenzhenHuidingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1271)
    }

    /// Convergence Systems Limited (`1272`)
    @_alwaysEmitIntoClient
    static var convergenceSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1272)
    }

    /// Interactio (`1273`)
    @_alwaysEmitIntoClient
    static var interactio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1273)
    }

    /// Androtec GmbH (`1274`)
    @_alwaysEmitIntoClient
    static var androtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1274)
    }

    /// Benchmark Drives GmbH & Co. KG (`1275`)
    @_alwaysEmitIntoClient
    static var benchmarkDrives: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1275)
    }

    /// SwingLync L. L. C. (`1276`)
    @_alwaysEmitIntoClient
    static var swinglyncLLC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1276)
    }

    /// Tapkey GmbH (`1277`)
    @_alwaysEmitIntoClient
    static var tapkey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1277)
    }

    /// Woosim Systems Inc. (`1278`)
    @_alwaysEmitIntoClient
    static var woosimSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1278)
    }

    /// Microsemi Corporation (`1279`)
    @_alwaysEmitIntoClient
    static var microsemi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1279)
    }

    /// Wiliot LTD. (`1280`)
    @_alwaysEmitIntoClient
    static var wiliot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1280)
    }

    /// Polaris IND (`1281`)
    @_alwaysEmitIntoClient
    static var polarisInd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1281)
    }

    /// Specifi-Kali LLC (`1282`)
    @_alwaysEmitIntoClient
    static var specifiKali: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1282)
    }

    /// Locoroll, Inc (`1283`)
    @_alwaysEmitIntoClient
    static var locoroll: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1283)
    }

    /// PHYPLUS Inc (`1284`)
    @_alwaysEmitIntoClient
    static var phyplus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1284)
    }

    /// Inplay Technologies LLC (`1285`)
    @_alwaysEmitIntoClient
    static var inplayTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1285)
    }

    /// Hager (`1286`)
    @_alwaysEmitIntoClient
    static var hager: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1286)
    }

    /// Yellowcog (`1287`)
    @_alwaysEmitIntoClient
    static var yellowcog: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1287)
    }

    /// Axes System sp. z o. o. (`1288`)
    @_alwaysEmitIntoClient
    static var axesSystemSpZOO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1288)
    }

    /// myLIFTER Inc. (`1289`)
    @_alwaysEmitIntoClient
    static var mylifter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1289)
    }

    /// Shake-on B.V. (`1290`)
    @_alwaysEmitIntoClient
    static var shakeOn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1290)
    }

    /// Vibrissa Inc. (`1291`)
    @_alwaysEmitIntoClient
    static var vibrissa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1291)
    }

    /// OSRAM GmbH (`1292`)
    @_alwaysEmitIntoClient
    static var osram: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1292)
    }

    /// TRSystems GmbH (`1293`)
    @_alwaysEmitIntoClient
    static var trsystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1293)
    }

    /// Yichip Microelectronics (Hangzhou) Co.,Ltd. (`1294`)
    @_alwaysEmitIntoClient
    static var yichipMicroelectronicsHangzhou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1294)
    }

    /// Foundation Engineering LLC (`1295`)
    @_alwaysEmitIntoClient
    static var foundationEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1295)
    }

    /// UNI-ELECTRONICS, INC. (`1296`)
    @_alwaysEmitIntoClient
    static var uniElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1296)
    }

    /// Brookfield Equinox LLC (`1297`)
    @_alwaysEmitIntoClient
    static var brookfieldEquinox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1297)
    }

    /// Soprod SA (`1298`)
    @_alwaysEmitIntoClient
    static var soprod: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1298)
    }

    /// 9974091 Canada Inc. (`1299`)
    @_alwaysEmitIntoClient
    static var uuid9974091Canada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1299)
    }

    /// FIBRO GmbH (`1300`)
    @_alwaysEmitIntoClient
    static var fibro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1300)
    }

    /// RB Controls Co., Ltd. (`1301`)
    @_alwaysEmitIntoClient
    static var rbControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1301)
    }

    /// Footmarks (`1302`)
    @_alwaysEmitIntoClient
    static var footmarks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1302)
    }

    /// Amcore AB (`1303`)
    @_alwaysEmitIntoClient
    static var amcore: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1303)
    }

    /// MAMORIO.inc (`1304`)
    @_alwaysEmitIntoClient
    static var mamorioInc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1304)
    }

    /// Tyto Life LLC (`1305`)
    @_alwaysEmitIntoClient
    static var tytoLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1305)
    }

    /// Leica Camera AG (`1306`)
    @_alwaysEmitIntoClient
    static var leicaCamera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1306)
    }

    /// Angee Technologies Ltd. (`1307`)
    @_alwaysEmitIntoClient
    static var angeeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1307)
    }

    /// EDPS (`1308`)
    @_alwaysEmitIntoClient
    static var edps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1308)
    }

    /// OFF Line Co., Ltd. (`1309`)
    @_alwaysEmitIntoClient
    static var offLine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1309)
    }

    /// Detect Blue Limited (`1310`)
    @_alwaysEmitIntoClient
    static var detectBlue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1310)
    }

    /// Setec Pty Ltd (`1311`)
    @_alwaysEmitIntoClient
    static var setecPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1311)
    }

    /// Target Corporation (`1312`)
    @_alwaysEmitIntoClient
    static var target: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1312)
    }

    /// IAI Corporation (`1313`)
    @_alwaysEmitIntoClient
    static var iai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1313)
    }

    /// NS Tech, Inc. (`1314`)
    @_alwaysEmitIntoClient
    static var nsTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1314)
    }

    /// MTG Co., Ltd. (`1315`)
    @_alwaysEmitIntoClient
    static var mtg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1315)
    }

    /// Hangzhou iMagic Technology Co., Ltd (`1316`)
    @_alwaysEmitIntoClient
    static var hangzhouImagicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1316)
    }

    /// HONGKONG NANO IC TECHNOLOGIES CO., LIMITED (`1317`)
    @_alwaysEmitIntoClient
    static var hongkongNanoIcTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1317)
    }

    /// Honeywell International Inc. (`1318`)
    @_alwaysEmitIntoClient
    static var honeywellInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1318)
    }

    /// Albrecht JUNG (`1319`)
    @_alwaysEmitIntoClient
    static var albrechtJung: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1319)
    }

    /// Lunera Lighting Inc. (`1320`)
    @_alwaysEmitIntoClient
    static var luneraLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1320)
    }

    /// Lumen UAB (`1321`)
    @_alwaysEmitIntoClient
    static var lumenUab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1321)
    }

    /// Keynes Controls Ltd (`1322`)
    @_alwaysEmitIntoClient
    static var keynesControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1322)
    }

    /// Novartis AG (`1323`)
    @_alwaysEmitIntoClient
    static var novartis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1323)
    }

    /// Geosatis SA (`1324`)
    @_alwaysEmitIntoClient
    static var geosatis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1324)
    }

    /// EXFO, Inc. (`1325`)
    @_alwaysEmitIntoClient
    static var exfo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1325)
    }

    /// LEDVANCE GmbH (`1326`)
    @_alwaysEmitIntoClient
    static var ledvance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1326)
    }

    /// Center ID Corp. (`1327`)
    @_alwaysEmitIntoClient
    static var centerId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1327)
    }

    /// Adolene, Inc. (`1328`)
    @_alwaysEmitIntoClient
    static var adolene: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1328)
    }

    /// D&M Holdings Inc. (`1329`)
    @_alwaysEmitIntoClient
    static var dMHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1329)
    }

    /// CRESCO Wireless, Inc. (`1330`)
    @_alwaysEmitIntoClient
    static var crescoWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1330)
    }

    /// Nura Operations Pty Ltd (`1331`)
    @_alwaysEmitIntoClient
    static var nuraOperationsPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1331)
    }

    /// Frontiergadget, Inc. (`1332`)
    @_alwaysEmitIntoClient
    static var frontiergadget: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1332)
    }

    /// Smart Component Technologies Limited (`1333`)
    @_alwaysEmitIntoClient
    static var smartComponentTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1333)
    }

    /// ZTR Control Systems LLC (`1334`)
    @_alwaysEmitIntoClient
    static var ztrControlSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1334)
    }

    /// MetaLogics Corporation (`1335`)
    @_alwaysEmitIntoClient
    static var metalogics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1335)
    }

    /// Medela AG (`1336`)
    @_alwaysEmitIntoClient
    static var medela2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1336)
    }

    /// OPPLE Lighting Co., Ltd (`1337`)
    @_alwaysEmitIntoClient
    static var oppleLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1337)
    }

    /// Savitech Corp., (`1338`)
    @_alwaysEmitIntoClient
    static var savitech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1338)
    }

    /// prodigy (`1339`)
    @_alwaysEmitIntoClient
    static var prodigy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1339)
    }

    /// Screenovate Technologies Ltd (`1340`)
    @_alwaysEmitIntoClient
    static var screenovateTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1340)
    }

    /// TESA SA (`1341`)
    @_alwaysEmitIntoClient
    static var tesa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1341)
    }

    /// CLIM8 LIMITED (`1342`)
    @_alwaysEmitIntoClient
    static var clim8: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1342)
    }

    /// Silergy Corp (`1343`)
    @_alwaysEmitIntoClient
    static var silergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1343)
    }

    /// SilverPlus, Inc (`1344`)
    @_alwaysEmitIntoClient
    static var silverplus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1344)
    }

    /// Sharknet srl (`1345`)
    @_alwaysEmitIntoClient
    static var sharknet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1345)
    }

    /// Mist Systems, Inc. (`1346`)
    @_alwaysEmitIntoClient
    static var mistSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1346)
    }

    /// MIWA LOCK CO.,Ltd (`1347`)
    @_alwaysEmitIntoClient
    static var miwaLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1347)
    }

    /// OrthoSensor, Inc. (`1348`)
    @_alwaysEmitIntoClient
    static var orthosensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1348)
    }

    /// Candy Hoover Group s.r.l (`1349`)
    @_alwaysEmitIntoClient
    static var candyHooverGroupSRL: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1349)
    }

    /// Apexar Technologies S.A. (`1350`)
    @_alwaysEmitIntoClient
    static var apexarTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1350)
    }

    /// LOGICDATA d.o.o. (`1351`)
    @_alwaysEmitIntoClient
    static var logicdata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1351)
    }

    /// Knick Elektronische Messgeraete GmbH & Co. KG (`1352`)
    @_alwaysEmitIntoClient
    static var knickElektronischeMessgeraete: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1352)
    }

    /// Smart Technologies and Investment Limited (`1353`)
    @_alwaysEmitIntoClient
    static var smartTechnologiesAndInvestment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1353)
    }

    /// Linough Inc. (`1354`)
    @_alwaysEmitIntoClient
    static var linough: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1354)
    }

    /// Advanced Electronic Designs, Inc. (`1355`)
    @_alwaysEmitIntoClient
    static var advancedElectronicDesigns: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1355)
    }

    /// Carefree Scott Fetzer Co Inc (`1356`)
    @_alwaysEmitIntoClient
    static var carefreeScottFetzerCo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1356)
    }

    /// Sensome (`1357`)
    @_alwaysEmitIntoClient
    static var sensome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1357)
    }

    /// FORTRONIK storitve d.o.o. (`1358`)
    @_alwaysEmitIntoClient
    static var fortronikStoritve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1358)
    }

    /// Sinnoz (`1359`)
    @_alwaysEmitIntoClient
    static var sinnoz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1359)
    }

    /// Versa Networks, Inc. (`1360`)
    @_alwaysEmitIntoClient
    static var versaNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1360)
    }

    /// Sylero (`1361`)
    @_alwaysEmitIntoClient
    static var sylero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1361)
    }

    /// Avempace SARL (`1362`)
    @_alwaysEmitIntoClient
    static var avempacerl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1362)
    }

    /// Nintendo Co., Ltd. (`1363`)
    @_alwaysEmitIntoClient
    static var nintendo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1363)
    }

    /// National Instruments (`1364`)
    @_alwaysEmitIntoClient
    static var nationalInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1364)
    }

    /// KROHNE Messtechnik GmbH (`1365`)
    @_alwaysEmitIntoClient
    static var krohneMesstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1365)
    }

    /// Otodynamics Ltd (`1366`)
    @_alwaysEmitIntoClient
    static var otodynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1366)
    }

    /// Arwin Technology Limited (`1367`)
    @_alwaysEmitIntoClient
    static var arwinTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1367)
    }

    /// benegear, inc. (`1368`)
    @_alwaysEmitIntoClient
    static var benegear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1368)
    }

    /// Newcon Optik (`1369`)
    @_alwaysEmitIntoClient
    static var newconOptik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1369)
    }

    /// CANDY HOUSE, Inc. (`1370`)
    @_alwaysEmitIntoClient
    static var candyHouse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1370)
    }

    /// FRANKLIN TECHNOLOGY INC (`1371`)
    @_alwaysEmitIntoClient
    static var franklinTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1371)
    }

    /// Lely (`1372`)
    @_alwaysEmitIntoClient
    static var lely: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1372)
    }

    /// Valve Corporation (`1373`)
    @_alwaysEmitIntoClient
    static var valve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1373)
    }

    /// Hekatron Vertriebs GmbH (`1374`)
    @_alwaysEmitIntoClient
    static var hekatronVertriebs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1374)
    }

    /// PROTECH S.A.S. DI GIRARDI ANDREA & C. (`1375`)
    @_alwaysEmitIntoClient
    static var protechDiGirardiAndreaC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1375)
    }

    /// Sarita CareTech IVS (`1376`)
    @_alwaysEmitIntoClient
    static var saritaCaretech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1376)
    }

    /// Finder S.p.A. (`1377`)
    @_alwaysEmitIntoClient
    static var finder: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1377)
    }

    /// Thalmic Labs Inc. (`1378`)
    @_alwaysEmitIntoClient
    static var thalmicLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1378)
    }

    /// Steinel Vertrieb GmbH (`1379`)
    @_alwaysEmitIntoClient
    static var steinelVertrieb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1379)
    }

    /// Beghelli Spa (`1380`)
    @_alwaysEmitIntoClient
    static var beghelliSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1380)
    }

    /// Beijing Smartspace Technologies Inc. (`1381`)
    @_alwaysEmitIntoClient
    static var beijingSmartspaceTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1381)
    }

    /// CORE TRANSPORT TECHNOLOGIES NZ LIMITED (`1382`)
    @_alwaysEmitIntoClient
    static var coreTransportTechnologiesNz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1382)
    }

    /// Xiamen Everesports Goods Co., Ltd (`1383`)
    @_alwaysEmitIntoClient
    static var xiamenEveresportsGoods: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1383)
    }

    /// Bodyport Inc. (`1384`)
    @_alwaysEmitIntoClient
    static var bodyport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1384)
    }

    /// Audionics System, INC. (`1385`)
    @_alwaysEmitIntoClient
    static var audionicsSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1385)
    }

    /// Flipnavi Co.,Ltd. (`1386`)
    @_alwaysEmitIntoClient
    static var flipnavi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1386)
    }

    /// Rion Co., Ltd. (`1387`)
    @_alwaysEmitIntoClient
    static var rion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1387)
    }

    /// Long Range Systems, LLC (`1388`)
    @_alwaysEmitIntoClient
    static var longRangeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1388)
    }

    /// Redmond Industrial Group LLC (`1389`)
    @_alwaysEmitIntoClient
    static var redmondIndustrialGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1389)
    }

    /// VIZPIN INC. (`1390`)
    @_alwaysEmitIntoClient
    static var vizpin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1390)
    }

    /// BikeFinder AS (`1391`)
    @_alwaysEmitIntoClient
    static var bikefinder: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1391)
    }

    /// Consumer Sleep Solutions LLC (`1392`)
    @_alwaysEmitIntoClient
    static var consumerSleepSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1392)
    }

    /// PSIKICK, INC. (`1393`)
    @_alwaysEmitIntoClient
    static var psikick: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1393)
    }

    /// AntTail.com (`1394`)
    @_alwaysEmitIntoClient
    static var anttailCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1394)
    }

    /// Lighting Science Group Corp. (`1395`)
    @_alwaysEmitIntoClient
    static var lightingScienceGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1395)
    }

    /// AFFORDABLE ELECTRONICS INC (`1396`)
    @_alwaysEmitIntoClient
    static var affordableElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1396)
    }

    /// Integral Memroy Plc (`1397`)
    @_alwaysEmitIntoClient
    static var integralMemroyPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1397)
    }

    /// Globalstar, Inc. (`1398`)
    @_alwaysEmitIntoClient
    static var globalstar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1398)
    }

    /// True Wearables, Inc. (`1399`)
    @_alwaysEmitIntoClient
    static var trueWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1399)
    }

    /// Wellington Drive Technologies Ltd (`1400`)
    @_alwaysEmitIntoClient
    static var wellingtonDriveTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1400)
    }

    /// Ensemble Tech Private Limited (`1401`)
    @_alwaysEmitIntoClient
    static var ensembleTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1401)
    }

    /// OMNI Remotes (`1402`)
    @_alwaysEmitIntoClient
    static var omniRemotes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1402)
    }

    /// Duracell U.S. Operations Inc. (`1403`)
    @_alwaysEmitIntoClient
    static var duracellUSOperations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1403)
    }

    /// Toor Technologies LLC (`1404`)
    @_alwaysEmitIntoClient
    static var toorTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1404)
    }

    /// Instinct Performance (`1405`)
    @_alwaysEmitIntoClient
    static var instinctPerformance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1405)
    }

    /// Beco, Inc (`1406`)
    @_alwaysEmitIntoClient
    static var beco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1406)
    }

    /// Scuf Gaming International, LLC (`1407`)
    @_alwaysEmitIntoClient
    static var scufGamingInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1407)
    }

    /// ARANZ Medical Limited (`1408`)
    @_alwaysEmitIntoClient
    static var aranzMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1408)
    }

    /// LYS TECHNOLOGIES LTD (`1409`)
    @_alwaysEmitIntoClient
    static var lysTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1409)
    }

    /// Breakwall Analytics, LLC (`1410`)
    @_alwaysEmitIntoClient
    static var breakwallAnalytics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1410)
    }

    /// Code Blue Communications (`1411`)
    @_alwaysEmitIntoClient
    static var codeBlueCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1411)
    }

    /// Gira Giersiepen GmbH & Co. KG (`1412`)
    @_alwaysEmitIntoClient
    static var giraGiersiepen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1412)
    }

    /// Hearing Lab Technology (`1413`)
    @_alwaysEmitIntoClient
    static var hearingLabTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1413)
    }

    /// LEGRAND (`1414`)
    @_alwaysEmitIntoClient
    static var legrand: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1414)
    }

    /// Derichs GmbH (`1415`)
    @_alwaysEmitIntoClient
    static var derichs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1415)
    }

    /// ALT-TEKNIK LLC (`1416`)
    @_alwaysEmitIntoClient
    static var altTeknik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1416)
    }

    /// Star Technologies (`1417`)
    @_alwaysEmitIntoClient
    static var starTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1417)
    }

    /// START TODAY CO.,LTD. (`1418`)
    @_alwaysEmitIntoClient
    static var startToday: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1418)
    }

    /// Maxim Integrated Products (`1419`)
    @_alwaysEmitIntoClient
    static var maximIntegratedProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1419)
    }

    /// MERCK Kommanditgesellschaft auf Aktien (`1420`)
    @_alwaysEmitIntoClient
    static var merckKommanditgesellschaftAufAktien: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1420)
    }

    /// Jungheinrich Aktiengesellschaft (`1421`)
    @_alwaysEmitIntoClient
    static var jungheinrichAktiengesellschaft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1421)
    }

    /// Oculus VR, LLC (`1422`)
    @_alwaysEmitIntoClient
    static var oculusVr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1422)
    }

    /// HENDON SEMICONDUCTORS PTY LTD (`1423`)
    @_alwaysEmitIntoClient
    static var hendonSemiconductorsPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1423)
    }

    /// Pur3 Ltd (`1424`)
    @_alwaysEmitIntoClient
    static var pur3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1424)
    }

    /// Viasat Group S.p.A. (`1425`)
    @_alwaysEmitIntoClient
    static var viasatGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1425)
    }

    /// IZITHERM (`1426`)
    @_alwaysEmitIntoClient
    static var izitherm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1426)
    }

    /// Spaulding Clinical Research (`1427`)
    @_alwaysEmitIntoClient
    static var spauldingClinicalResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1427)
    }

    /// Kohler Company (`1428`)
    @_alwaysEmitIntoClient
    static var kohlerCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1428)
    }

    /// Inor Process AB (`1429`)
    @_alwaysEmitIntoClient
    static var inorProcess: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1429)
    }

    /// My Smart Blinds (`1430`)
    @_alwaysEmitIntoClient
    static var mySmartBlinds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1430)
    }

    /// RadioPulse Inc (`1431`)
    @_alwaysEmitIntoClient
    static var radiopulse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1431)
    }

    /// rapitag GmbH (`1432`)
    @_alwaysEmitIntoClient
    static var rapitag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1432)
    }

    /// Lazlo326, LLC. (`1433`)
    @_alwaysEmitIntoClient
    static var lazlo326: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1433)
    }

    /// Teledyne Lecroy, Inc. (`1434`)
    @_alwaysEmitIntoClient
    static var teledyneLecroy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1434)
    }

    /// Dataflow Systems Limited (`1435`)
    @_alwaysEmitIntoClient
    static var dataflowSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1435)
    }

    /// Macrogiga Electronics (`1436`)
    @_alwaysEmitIntoClient
    static var macrogigaElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1436)
    }

    /// Tandem Diabetes Care (`1437`)
    @_alwaysEmitIntoClient
    static var tandemDiabetesCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1437)
    }

    /// Polycom, Inc. (`1438`)
    @_alwaysEmitIntoClient
    static var polycom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1438)
    }

    /// Fisher & Paykel Healthcare (`1439`)
    @_alwaysEmitIntoClient
    static var fisherPaykelHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1439)
    }

    /// RCP Software Oy (`1440`)
    @_alwaysEmitIntoClient
    static var rcpSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1440)
    }

    /// Shanghai Xiaoyi Technology Co.,Ltd. (`1441`)
    @_alwaysEmitIntoClient
    static var shanghaiXiaoyiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1441)
    }

    /// ADHERIUM(NZ) LIMITED (`1442`)
    @_alwaysEmitIntoClient
    static var adheriumNz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1442)
    }

    /// Axiomware Systems Incorporated (`1443`)
    @_alwaysEmitIntoClient
    static var axiomwareSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1443)
    }

    /// O. E. M. Controls, Inc. (`1444`)
    @_alwaysEmitIntoClient
    static var oEMControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1444)
    }

    /// Kiiroo BV (`1445`)
    @_alwaysEmitIntoClient
    static var kiiroo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1445)
    }

    /// Telecon Mobile Limited (`1446`)
    @_alwaysEmitIntoClient
    static var teleconMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1446)
    }

    /// Sonos Inc (`1447`)
    @_alwaysEmitIntoClient
    static var sonos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1447)
    }

    /// Tom Allebrandi Consulting (`1448`)
    @_alwaysEmitIntoClient
    static var tomAllebrandiConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1448)
    }

    /// Monidor (`1449`)
    @_alwaysEmitIntoClient
    static var monidor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1449)
    }

    /// Tramex Limited (`1450`)
    @_alwaysEmitIntoClient
    static var tramex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1450)
    }

    /// Nofence AS (`1451`)
    @_alwaysEmitIntoClient
    static var nofence: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1451)
    }

    /// GoerTek Dynaudio Co., Ltd. (`1452`)
    @_alwaysEmitIntoClient
    static var goertekDynaudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1452)
    }

    /// INIA (`1453`)
    @_alwaysEmitIntoClient
    static var inia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1453)
    }

    /// CARMATE MFG.CO.,LTD (`1454`)
    @_alwaysEmitIntoClient
    static var carmateMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1454)
    }

    /// ONvocal (`1455`)
    @_alwaysEmitIntoClient
    static var onvocal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1455)
    }

    /// NewTec GmbH (`1456`)
    @_alwaysEmitIntoClient
    static var newtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1456)
    }

    /// Medallion Instrumentation Systems (`1457`)
    @_alwaysEmitIntoClient
    static var medallionInstrumentationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1457)
    }

    /// CAREL INDUSTRIES S.P.A. (`1458`)
    @_alwaysEmitIntoClient
    static var carelIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1458)
    }

    /// Parabit Systems, Inc. (`1459`)
    @_alwaysEmitIntoClient
    static var parabitSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1459)
    }

    /// White Horse Scientific ltd (`1460`)
    @_alwaysEmitIntoClient
    static var whiteHorseScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1460)
    }

    /// verisilicon (`1461`)
    @_alwaysEmitIntoClient
    static var verisilicon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1461)
    }

    /// Elecs Industry Co.,Ltd. (`1462`)
    @_alwaysEmitIntoClient
    static var elecsIndustry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1462)
    }

    /// Beijing Pinecone Electronics Co.,Ltd. (`1463`)
    @_alwaysEmitIntoClient
    static var beijingPineconeElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1463)
    }

    /// Ambystoma Labs Inc. (`1464`)
    @_alwaysEmitIntoClient
    static var ambystomaLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1464)
    }

    /// Suzhou Pairlink Network Technology (`1465`)
    @_alwaysEmitIntoClient
    static var suzhouPairlinkNetworkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1465)
    }

    /// igloohome (`1466`)
    @_alwaysEmitIntoClient
    static var igloohome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1466)
    }

    /// Oxford Metrics plc (`1467`)
    @_alwaysEmitIntoClient
    static var oxfordMetricsPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1467)
    }

    /// Leviton Mfg. Co., Inc. (`1468`)
    @_alwaysEmitIntoClient
    static var levitonMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1468)
    }

    /// ULC Robotics Inc. (`1469`)
    @_alwaysEmitIntoClient
    static var ulcRobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1469)
    }

    /// RFID Global by Softwork SrL (`1470`)
    @_alwaysEmitIntoClient
    static var rfidGlobalBySoftwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1470)
    }

    /// Real-World-Systems Corporation (`1471`)
    @_alwaysEmitIntoClient
    static var realWorldSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1471)
    }

    /// Nalu Medical, Inc. (`1472`)
    @_alwaysEmitIntoClient
    static var naluMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1472)
    }

    /// P.I.Engineering (`1473`)
    @_alwaysEmitIntoClient
    static var pIEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1473)
    }

    /// Grote Industries (`1474`)
    @_alwaysEmitIntoClient
    static var groteIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1474)
    }

    /// Runtime, Inc. (`1475`)
    @_alwaysEmitIntoClient
    static var runtime: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1475)
    }

    /// Codecoup sp. z o.o. sp. k. (`1476`)
    @_alwaysEmitIntoClient
    static var codecoup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1476)
    }

    /// SELVE GmbH & Co. KG (`1477`)
    @_alwaysEmitIntoClient
    static var selve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1477)
    }

    /// Smart Animal Training Systems, LLC (`1478`)
    @_alwaysEmitIntoClient
    static var smartAnimalTrainingSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1478)
    }

    /// Lippert Components, INC (`1479`)
    @_alwaysEmitIntoClient
    static var lippertComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1479)
    }

    /// SOMFY SAS (`1480`)
    @_alwaysEmitIntoClient
    static var somfys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1480)
    }

    /// TBS Electronics B.V. (`1481`)
    @_alwaysEmitIntoClient
    static var tbsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1481)
    }

    /// MHL Custom Inc (`1482`)
    @_alwaysEmitIntoClient
    static var mhlCustom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1482)
    }

    /// LucentWear LLC (`1483`)
    @_alwaysEmitIntoClient
    static var lucentwear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1483)
    }

    /// WATTS ELECTRONICS (`1484`)
    @_alwaysEmitIntoClient
    static var wattsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1484)
    }

    /// RJ Brands LLC (`1485`)
    @_alwaysEmitIntoClient
    static var rjBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1485)
    }

    /// V-ZUG Ltd (`1486`)
    @_alwaysEmitIntoClient
    static var vZug: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1486)
    }

    /// Biowatch SA (`1487`)
    @_alwaysEmitIntoClient
    static var biowatch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1487)
    }

    /// Anova Applied Electronics (`1488`)
    @_alwaysEmitIntoClient
    static var anovaAppliedElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1488)
    }

    /// Lindab AB (`1489`)
    @_alwaysEmitIntoClient
    static var lindab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1489)
    }

    /// frogblue TECHNOLOGY GmbH (`1490`)
    @_alwaysEmitIntoClient
    static var frogblueTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1490)
    }

    /// Acurable Limited (`1491`)
    @_alwaysEmitIntoClient
    static var acurable: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1491)
    }

    /// LAMPLIGHT Co., Ltd. (`1492`)
    @_alwaysEmitIntoClient
    static var lamplight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1492)
    }

    /// TEGAM, Inc. (`1493`)
    @_alwaysEmitIntoClient
    static var tegam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1493)
    }

    /// Zhuhai Jieli technology Co.,Ltd (`1494`)
    @_alwaysEmitIntoClient
    static var zhuhaiJieliTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1494)
    }

    /// modum.io AG (`1495`)
    @_alwaysEmitIntoClient
    static var modumIo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1495)
    }

    /// Farm Jenny LLC (`1496`)
    @_alwaysEmitIntoClient
    static var farmJenny: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1496)
    }

    /// Toyo Electronics Corporation (`1497`)
    @_alwaysEmitIntoClient
    static var toyoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1497)
    }

    /// Applied Neural Research Corp (`1498`)
    @_alwaysEmitIntoClient
    static var appliedNeuralResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1498)
    }

    /// Avid Identification Systems, Inc. (`1499`)
    @_alwaysEmitIntoClient
    static var avidIdentificationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1499)
    }

    /// Petronics Inc. (`1500`)
    @_alwaysEmitIntoClient
    static var petronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1500)
    }

    /// essentim GmbH (`1501`)
    @_alwaysEmitIntoClient
    static var essentim: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1501)
    }

    /// QT Medical INC. (`1502`)
    @_alwaysEmitIntoClient
    static var qtMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1502)
    }

    /// VIRTUALCLINIC.DIRECT LIMITED (`1503`)
    @_alwaysEmitIntoClient
    static var virtualclinicDirect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1503)
    }

    /// Viper Design LLC (`1504`)
    @_alwaysEmitIntoClient
    static var viperDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1504)
    }

    /// Human, Incorporated (`1505`)
    @_alwaysEmitIntoClient
    static var human: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1505)
    }

    /// stAPPtronics GmbH (`1506`)
    @_alwaysEmitIntoClient
    static var stapptronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1506)
    }

    /// Elemental Machines, Inc. (`1507`)
    @_alwaysEmitIntoClient
    static var elementalMachines: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1507)
    }

    /// Taiyo Yuden Co., Ltd (`1508`)
    @_alwaysEmitIntoClient
    static var taiyoYuden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1508)
    }

    /// INEO ENERGY& SYSTEMS (`1509`)
    @_alwaysEmitIntoClient
    static var ineoEnergySystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1509)
    }

    /// Motion Instruments Inc. (`1510`)
    @_alwaysEmitIntoClient
    static var motionInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1510)
    }

    /// PressurePro (`1511`)
    @_alwaysEmitIntoClient
    static var pressurepro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1511)
    }

    /// COWBOY (`1512`)
    @_alwaysEmitIntoClient
    static var cowboy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1512)
    }

    /// iconmobile GmbH (`1513`)
    @_alwaysEmitIntoClient
    static var iconmobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1513)
    }

    /// ACS-Control-System GmbH (`1514`)
    @_alwaysEmitIntoClient
    static var acsControlSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1514)
    }

    /// Bayerische Motoren Werke AG (`1515`)
    @_alwaysEmitIntoClient
    static var bayerischeMotorenWerke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1515)
    }

    /// Gycom Svenska AB (`1516`)
    @_alwaysEmitIntoClient
    static var gycomSvenska: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1516)
    }

    /// Fuji Xerox Co., Ltd (`1517`)
    @_alwaysEmitIntoClient
    static var fujiXerox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1517)
    }

    /// Glide Inc. (`1518`)
    @_alwaysEmitIntoClient
    static var glide: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1518)
    }

    /// SIKOM AS (`1519`)
    @_alwaysEmitIntoClient
    static var sikom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1519)
    }

    /// beken (`1520`)
    @_alwaysEmitIntoClient
    static var beken: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1520)
    }

    /// The Linux Foundation (`1521`)
    @_alwaysEmitIntoClient
    static var linuxFoundation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1521)
    }

    /// Try and E CO.,LTD. (`1522`)
    @_alwaysEmitIntoClient
    static var tryAndE: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1522)
    }

    /// SeeScan (`1523`)
    @_alwaysEmitIntoClient
    static var seescan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1523)
    }

    /// Clearity, LLC (`1524`)
    @_alwaysEmitIntoClient
    static var clearity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1524)
    }

    /// GS TAG (`1525`)
    @_alwaysEmitIntoClient
    static var gsTag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1525)
    }

    /// DPTechnics (`1526`)
    @_alwaysEmitIntoClient
    static var dptechnics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1526)
    }

    /// TRACMO, INC. (`1527`)
    @_alwaysEmitIntoClient
    static var tracmo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1527)
    }

    /// Anki Inc. (`1528`)
    @_alwaysEmitIntoClient
    static var anki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1528)
    }

    /// Hagleitner Hygiene International GmbH (`1529`)
    @_alwaysEmitIntoClient
    static var hagleitnerHygieneInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1529)
    }

    /// Konami Sports Life Co., Ltd. (`1530`)
    @_alwaysEmitIntoClient
    static var konamiSportsLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1530)
    }

    /// Arblet Inc. (`1531`)
    @_alwaysEmitIntoClient
    static var arblet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1531)
    }

    /// Masbando GmbH (`1532`)
    @_alwaysEmitIntoClient
    static var masbando: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1532)
    }

    /// Innoseis (`1533`)
    @_alwaysEmitIntoClient
    static var innoseis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1533)
    }

    /// Niko (`1534`)
    @_alwaysEmitIntoClient
    static var niko: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1534)
    }

    /// Wellnomics Ltd (`1535`)
    @_alwaysEmitIntoClient
    static var wellnomics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1535)
    }

    /// iRobot Corporation (`1536`)
    @_alwaysEmitIntoClient
    static var irobot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1536)
    }

    /// Schrader Electronics (`1537`)
    @_alwaysEmitIntoClient
    static var schraderElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1537)
    }

    /// Geberit International AG (`1538`)
    @_alwaysEmitIntoClient
    static var geberitInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1538)
    }

    /// Fourth Evolution Inc (`1539`)
    @_alwaysEmitIntoClient
    static var fourthEvolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1539)
    }

    /// Cell2Jack LLC (`1540`)
    @_alwaysEmitIntoClient
    static var cell2Jack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1540)
    }

    /// FMW electronic Futterer u. Maier-Wolf OHG (`1541`)
    @_alwaysEmitIntoClient
    static var fmwElectronicFuttererUMaierWolfOhg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1541)
    }

    /// John Deere (`1542`)
    @_alwaysEmitIntoClient
    static var johnDeere: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1542)
    }

    /// Rookery Technology Ltd (`1543`)
    @_alwaysEmitIntoClient
    static var rookeryTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1543)
    }

    /// KeySafe-Cloud (`1544`)
    @_alwaysEmitIntoClient
    static var keysafeCloud: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1544)
    }

    /// BUCHI Labortechnik AG (`1545`)
    @_alwaysEmitIntoClient
    static var buchiLabortechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1545)
    }

    /// IQAir AG (`1546`)
    @_alwaysEmitIntoClient
    static var iqair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1546)
    }

    /// Triax Technologies Inc (`1547`)
    @_alwaysEmitIntoClient
    static var triaxTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1547)
    }

    /// Vuzix Corporation (`1548`)
    @_alwaysEmitIntoClient
    static var vuzix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1548)
    }

    /// TDK Corporation (`1549`)
    @_alwaysEmitIntoClient
    static var tdk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1549)
    }

    /// Blueair AB (`1550`)
    @_alwaysEmitIntoClient
    static var blueair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1550)
    }

    /// Signify Netherlands (`1551`)
    @_alwaysEmitIntoClient
    static var signifyNetherlands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1551)
    }

    /// ADH GUARDIAN USA LLC (`1552`)
    @_alwaysEmitIntoClient
    static var adhGuardianUsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1552)
    }

    /// Beurer GmbH (`1553`)
    @_alwaysEmitIntoClient
    static var beurer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1553)
    }

    /// Playfinity AS (`1554`)
    @_alwaysEmitIntoClient
    static var playfinity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1554)
    }

    /// Hans Dinslage GmbH (`1555`)
    @_alwaysEmitIntoClient
    static var hansDinslage: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1555)
    }

    /// OnAsset Intelligence, Inc. (`1556`)
    @_alwaysEmitIntoClient
    static var onassetIntelligence: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1556)
    }

    /// INTER ACTION Corporation (`1557`)
    @_alwaysEmitIntoClient
    static var interAction: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1557)
    }

    /// OS42 UG (haftungsbeschraenkt) (`1558`)
    @_alwaysEmitIntoClient
    static var os42UgHaftungsbeschraenkt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1558)
    }

    /// WIZCONNECTED COMPANY LIMITED (`1559`)
    @_alwaysEmitIntoClient
    static var wizconnectedCompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1559)
    }

    /// Audio-Technica Corporation (`1560`)
    @_alwaysEmitIntoClient
    static var audioTechnica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1560)
    }

    /// Six Guys Labs, s.r.o. (`1561`)
    @_alwaysEmitIntoClient
    static var sixGuysLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1561)
    }

    /// R.W. Beckett Corporation (`1562`)
    @_alwaysEmitIntoClient
    static var rWBeckett: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1562)
    }

    /// silex technology, inc. (`1563`)
    @_alwaysEmitIntoClient
    static var silexTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1563)
    }

    /// Univations Limited (`1564`)
    @_alwaysEmitIntoClient
    static var univations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1564)
    }

    /// SENS Innovation ApS (`1565`)
    @_alwaysEmitIntoClient
    static var sensInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1565)
    }

    /// Diamond Kinetics, Inc. (`1566`)
    @_alwaysEmitIntoClient
    static var diamondKinetics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1566)
    }

    /// Phrame Inc. (`1567`)
    @_alwaysEmitIntoClient
    static var phrame: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1567)
    }

    /// Forciot Oy (`1568`)
    @_alwaysEmitIntoClient
    static var forciot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1568)
    }

    /// Noordung d.o.o. (`1569`)
    @_alwaysEmitIntoClient
    static var noordung: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1569)
    }

    /// Beam Labs, LLC (`1570`)
    @_alwaysEmitIntoClient
    static var beamLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1570)
    }

    /// Philadelphia Scientific (U.K.) Limited (`1571`)
    @_alwaysEmitIntoClient
    static var philadelphiaScientificUK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1571)
    }

    /// Biovotion AG (`1572`)
    @_alwaysEmitIntoClient
    static var biovotion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1572)
    }

    /// Square Panda, Inc. (`1573`)
    @_alwaysEmitIntoClient
    static var squarePanda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1573)
    }

    /// Amplifico (`1574`)
    @_alwaysEmitIntoClient
    static var amplifico: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1574)
    }

    /// WEG S.A. (`1575`)
    @_alwaysEmitIntoClient
    static var weg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1575)
    }

    /// Ensto Oy (`1576`)
    @_alwaysEmitIntoClient
    static var ensto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1576)
    }

    /// PHONEPE PVT LTD (`1577`)
    @_alwaysEmitIntoClient
    static var phonepePvt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1577)
    }

    /// Lunatico Astronomia SL (`1578`)
    @_alwaysEmitIntoClient
    static var lunaticoAstronomiaSl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1578)
    }

    /// MinebeaMitsumi Inc. (`1579`)
    @_alwaysEmitIntoClient
    static var minebeamitsumi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1579)
    }

    /// ASPion GmbH (`1580`)
    @_alwaysEmitIntoClient
    static var aspion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1580)
    }

    /// Vossloh-Schwabe Deutschland GmbH (`1581`)
    @_alwaysEmitIntoClient
    static var vosslohSchwabeDeutschland: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1581)
    }

    /// Procept (`1582`)
    @_alwaysEmitIntoClient
    static var procept: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1582)
    }

    /// ONKYO Corporation (`1583`)
    @_alwaysEmitIntoClient
    static var onkyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1583)
    }

    /// Asthrea D.O.O. (`1584`)
    @_alwaysEmitIntoClient
    static var asthrea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1584)
    }

    /// Fortiori Design LLC (`1585`)
    @_alwaysEmitIntoClient
    static var fortioriDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1585)
    }

    /// Hugo Muller GmbH & Co KG (`1586`)
    @_alwaysEmitIntoClient
    static var hugoMuller: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1586)
    }

    /// Wangi Lai PLT (`1587`)
    @_alwaysEmitIntoClient
    static var wangiLaiPlt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1587)
    }

    /// Fanstel Corp (`1588`)
    @_alwaysEmitIntoClient
    static var fanstel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1588)
    }

    /// Crookwood (`1589`)
    @_alwaysEmitIntoClient
    static var crookwood: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1589)
    }

    /// ELECTRONICA INTEGRAL DE SONIDO S.A. (`1590`)
    @_alwaysEmitIntoClient
    static var electronicaIntegralDeSonido: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1590)
    }

    /// GiP Innovation Tools GmbH (`1591`)
    @_alwaysEmitIntoClient
    static var gipInnovationTools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1591)
    }

    /// LX SOLUTIONS PTY LIMITED (`1592`)
    @_alwaysEmitIntoClient
    static var lxSolutionsPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1592)
    }

    /// Shenzhen Minew Technologies Co., Ltd. (`1593`)
    @_alwaysEmitIntoClient
    static var shenzhenMinewTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1593)
    }

    /// Prolojik Limited (`1594`)
    @_alwaysEmitIntoClient
    static var prolojik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1594)
    }

    /// Kromek Group Plc (`1595`)
    @_alwaysEmitIntoClient
    static var kromekGroupPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1595)
    }

    /// Contec Medical Systems Co., Ltd. (`1596`)
    @_alwaysEmitIntoClient
    static var contecMedicalSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1596)
    }

    /// Xradio Technology Co.,Ltd. (`1597`)
    @_alwaysEmitIntoClient
    static var xradioTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1597)
    }

    /// The Indoor Lab, LLC (`1598`)
    @_alwaysEmitIntoClient
    static var indoorLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1598)
    }

    /// LDL TECHNOLOGY (`1599`)
    @_alwaysEmitIntoClient
    static var ldlTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1599)
    }

    /// Parkifi (`1600`)
    @_alwaysEmitIntoClient
    static var parkifi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1600)
    }

    /// Revenue Collection Systems FRANCE SAS (`1601`)
    @_alwaysEmitIntoClient
    static var revenueCollectionSystemsFrances: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1601)
    }

    /// Bluetrum Technology Co.,Ltd (`1602`)
    @_alwaysEmitIntoClient
    static var bluetrumTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1602)
    }

    /// makita corporation (`1603`)
    @_alwaysEmitIntoClient
    static var makita: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1603)
    }

    /// Apogee Instruments (`1604`)
    @_alwaysEmitIntoClient
    static var apogeeInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1604)
    }

    /// BM3 (`1605`)
    @_alwaysEmitIntoClient
    static var bm3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1605)
    }

    /// SGV Group Holding GmbH & Co. KG (`1606`)
    @_alwaysEmitIntoClient
    static var sgvGroupHolding: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1606)
    }

    /// MED-EL (`1607`)
    @_alwaysEmitIntoClient
    static var medEl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1607)
    }

    /// Ultune Technologies (`1608`)
    @_alwaysEmitIntoClient
    static var ultuneTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1608)
    }

    /// Ryeex Technology Co.,Ltd. (`1609`)
    @_alwaysEmitIntoClient
    static var ryeexTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1609)
    }

}
#endif
