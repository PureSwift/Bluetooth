//
//  CompanyIdentifierNames.swift
//  Bluetooth
//

#if swift(<5.6)
internal let companyIdentifiers: [UInt16: String] = {

    var companyIdentifiers = [UInt16: String]()
    companyIdentifiers.reserveCapacity(1610)

    /// Ericsson Technology Licensing (`0`)
    companyIdentifiers[0] = #"Ericsson Technology Licensing"#

    /// Nokia Mobile Phones (`1`)
    companyIdentifiers[1] = #"Nokia Mobile Phones"#

    /// Intel Corp. (`2`)
    companyIdentifiers[2] = #"Intel Corp."#

    /// IBM Corp. (`3`)
    companyIdentifiers[3] = #"IBM Corp."#

    /// Toshiba Corp. (`4`)
    companyIdentifiers[4] = #"Toshiba Corp."#

    /// 3Com (`5`)
    companyIdentifiers[5] = #"3Com"#

    /// Microsoft (`6`)
    companyIdentifiers[6] = #"Microsoft"#

    /// Lucent (`7`)
    companyIdentifiers[7] = #"Lucent"#

    /// Motorola (`8`)
    companyIdentifiers[8] = #"Motorola"#

    /// Infineon Technologies AG (`9`)
    companyIdentifiers[9] = #"Infineon Technologies AG"#

    /// Qualcomm Technologies International, Ltd. (QTIL) (`10`)
    companyIdentifiers[10] = #"Qualcomm Technologies International, Ltd. (QTIL)"#

    /// Silicon Wave (`11`)
    companyIdentifiers[11] = #"Silicon Wave"#

    /// Digianswer A/S (`12`)
    companyIdentifiers[12] = #"Digianswer A/S"#

    /// Texas Instruments Inc. (`13`)
    companyIdentifiers[13] = #"Texas Instruments Inc."#

    /// Ceva, Inc. (formerly Parthus Technologies, Inc.) (`14`)
    companyIdentifiers[14] = #"Ceva, Inc. (formerly Parthus Technologies, Inc.)"#

    /// Broadcom Corporation (`15`)
    companyIdentifiers[15] = #"Broadcom Corporation"#

    /// Mitel Semiconductor (`16`)
    companyIdentifiers[16] = #"Mitel Semiconductor"#

    /// Widcomm, Inc (`17`)
    companyIdentifiers[17] = #"Widcomm, Inc"#

    /// Zeevo, Inc. (`18`)
    companyIdentifiers[18] = #"Zeevo, Inc."#

    /// Atmel Corporation (`19`)
    companyIdentifiers[19] = #"Atmel Corporation"#

    /// Mitsubishi Electric Corporation (`20`)
    companyIdentifiers[20] = #"Mitsubishi Electric Corporation"#

    /// RTX Telecom A/S (`21`)
    companyIdentifiers[21] = #"RTX Telecom A/S"#

    /// KC Technology Inc. (`22`)
    companyIdentifiers[22] = #"KC Technology Inc."#

    /// NewLogic (`23`)
    companyIdentifiers[23] = #"NewLogic"#

    /// Transilica, Inc. (`24`)
    companyIdentifiers[24] = #"Transilica, Inc."#

    /// Rohde & Schwarz GmbH & Co. KG (`25`)
    companyIdentifiers[25] = #"Rohde & Schwarz GmbH & Co. KG"#

    /// TTPCom Limited (`26`)
    companyIdentifiers[26] = #"TTPCom Limited"#

    /// Signia Technologies, Inc. (`27`)
    companyIdentifiers[27] = #"Signia Technologies, Inc."#

    /// Conexant Systems Inc. (`28`)
    companyIdentifiers[28] = #"Conexant Systems Inc."#

    /// Qualcomm (`29`)
    companyIdentifiers[29] = #"Qualcomm"#

    /// Inventel (`30`)
    companyIdentifiers[30] = #"Inventel"#

    /// AVM Berlin (`31`)
    companyIdentifiers[31] = #"AVM Berlin"#

    /// BandSpeed, Inc. (`32`)
    companyIdentifiers[32] = #"BandSpeed, Inc."#

    /// Mansella Ltd (`33`)
    companyIdentifiers[33] = #"Mansella Ltd"#

    /// NEC Corporation (`34`)
    companyIdentifiers[34] = #"NEC Corporation"#

    /// WavePlus Technology Co., Ltd. (`35`)
    companyIdentifiers[35] = #"WavePlus Technology Co., Ltd."#

    /// Alcatel (`36`)
    companyIdentifiers[36] = #"Alcatel"#

    /// NXP Semiconductors (formerly Philips Semiconductors) (`37`)
    companyIdentifiers[37] = #"NXP Semiconductors (formerly Philips Semiconductors)"#

    /// C Technologies (`38`)
    companyIdentifiers[38] = #"C Technologies"#

    /// Open Interface (`39`)
    companyIdentifiers[39] = #"Open Interface"#

    /// R F Micro Devices (`40`)
    companyIdentifiers[40] = #"R F Micro Devices"#

    /// Hitachi Ltd (`41`)
    companyIdentifiers[41] = #"Hitachi Ltd"#

    /// Symbol Technologies, Inc. (`42`)
    companyIdentifiers[42] = #"Symbol Technologies, Inc."#

    /// Tenovis (`43`)
    companyIdentifiers[43] = #"Tenovis"#

    /// Macronix International Co. Ltd. (`44`)
    companyIdentifiers[44] = #"Macronix International Co. Ltd."#

    /// GCT Semiconductor (`45`)
    companyIdentifiers[45] = #"GCT Semiconductor"#

    /// Norwood Systems (`46`)
    companyIdentifiers[46] = #"Norwood Systems"#

    /// MewTel Technology Inc. (`47`)
    companyIdentifiers[47] = #"MewTel Technology Inc."#

    /// ST Microelectronics (`48`)
    companyIdentifiers[48] = #"ST Microelectronics"#

    /// Synopsys, Inc. (`49`)
    companyIdentifiers[49] = #"Synopsys, Inc."#

    /// Red-M (Communications) Ltd (`50`)
    companyIdentifiers[50] = #"Red-M (Communications) Ltd"#

    /// Commil Ltd (`51`)
    companyIdentifiers[51] = #"Commil Ltd"#

    /// Computer Access Technology Corporation (CATC) (`52`)
    companyIdentifiers[52] = #"Computer Access Technology Corporation (CATC)"#

    /// Eclipse (HQ Espana) S.L. (`53`)
    companyIdentifiers[53] = #"Eclipse (HQ Espana) S.L."#

    /// Renesas Electronics Corporation (`54`)
    companyIdentifiers[54] = #"Renesas Electronics Corporation"#

    /// Mobilian Corporation (`55`)
    companyIdentifiers[55] = #"Mobilian Corporation"#

    /// Syntronix Corporation (`56`)
    companyIdentifiers[56] = #"Syntronix Corporation"#

    /// Integrated System Solution Corp. (`57`)
    companyIdentifiers[57] = #"Integrated System Solution Corp."#

    /// Matsushita Electric Industrial Co., Ltd. (`58`)
    companyIdentifiers[58] = #"Matsushita Electric Industrial Co., Ltd."#

    /// Gennum Corporation (`59`)
    companyIdentifiers[59] = #"Gennum Corporation"#

    /// BlackBerry Limited (formerly Research In Motion) (`60`)
    companyIdentifiers[60] = #"BlackBerry Limited (formerly Research In Motion)"#

    /// IPextreme, Inc. (`61`)
    companyIdentifiers[61] = #"IPextreme, Inc."#

    /// Systems and Chips, Inc. (`62`)
    companyIdentifiers[62] = #"Systems and Chips, Inc."#

    /// Bluetooth SIG, Inc. (`63`)
    companyIdentifiers[63] = #"Bluetooth SIG, Inc."#

    /// Seiko Epson Corporation (`64`)
    companyIdentifiers[64] = #"Seiko Epson Corporation"#

    /// Integrated Silicon Solution Taiwan, Inc. (`65`)
    companyIdentifiers[65] = #"Integrated Silicon Solution Taiwan, Inc."#

    /// CONWISE Technology Corporation Ltd (`66`)
    companyIdentifiers[66] = #"CONWISE Technology Corporation Ltd"#

    /// PARROT AUTOMOTIVE SAS (`67`)
    companyIdentifiers[67] = #"PARROT AUTOMOTIVE SAS"#

    /// Socket Mobile (`68`)
    companyIdentifiers[68] = #"Socket Mobile"#

    /// Atheros Communications, Inc. (`69`)
    companyIdentifiers[69] = #"Atheros Communications, Inc."#

    /// MediaTek, Inc. (`70`)
    companyIdentifiers[70] = #"MediaTek, Inc."#

    /// Bluegiga (`71`)
    companyIdentifiers[71] = #"Bluegiga"#

    /// Marvell Technology Group Ltd. (`72`)
    companyIdentifiers[72] = #"Marvell Technology Group Ltd."#

    /// 3DSP Corporation (`73`)
    companyIdentifiers[73] = #"3DSP Corporation"#

    /// Accel Semiconductor Ltd. (`74`)
    companyIdentifiers[74] = #"Accel Semiconductor Ltd."#

    /// Continental Automotive Systems (`75`)
    companyIdentifiers[75] = #"Continental Automotive Systems"#

    /// Apple, Inc. (`76`)
    companyIdentifiers[76] = #"Apple, Inc."#

    /// Staccato Communications, Inc. (`77`)
    companyIdentifiers[77] = #"Staccato Communications, Inc."#

    /// Avago Technologies (`78`)
    companyIdentifiers[78] = #"Avago Technologies"#

    /// APT Licensing Ltd. (`79`)
    companyIdentifiers[79] = #"APT Licensing Ltd."#

    /// SiRF Technology (`80`)
    companyIdentifiers[80] = #"SiRF Technology"#

    /// Tzero Technologies, Inc. (`81`)
    companyIdentifiers[81] = #"Tzero Technologies, Inc."#

    /// J&M Corporation (`82`)
    companyIdentifiers[82] = #"J&M Corporation"#

    /// Free2move AB (`83`)
    companyIdentifiers[83] = #"Free2move AB"#

    /// 3DiJoy Corporation (`84`)
    companyIdentifiers[84] = #"3DiJoy Corporation"#

    /// Plantronics, Inc. (`85`)
    companyIdentifiers[85] = #"Plantronics, Inc."#

    /// Sony Ericsson Mobile Communications (`86`)
    companyIdentifiers[86] = #"Sony Ericsson Mobile Communications"#

    /// Harman International Industries, Inc. (`87`)
    companyIdentifiers[87] = #"Harman International Industries, Inc."#

    /// Vizio, Inc. (`88`)
    companyIdentifiers[88] = #"Vizio, Inc."#

    /// Nordic Semiconductor ASA (`89`)
    companyIdentifiers[89] = #"Nordic Semiconductor ASA"#

    /// EM Microelectronic-Marin SA (`90`)
    companyIdentifiers[90] = #"EM Microelectronic-Marin SA"#

    /// Ralink Technology Corporation (`91`)
    companyIdentifiers[91] = #"Ralink Technology Corporation"#

    /// Belkin International, Inc. (`92`)
    companyIdentifiers[92] = #"Belkin International, Inc."#

    /// Realtek Semiconductor Corporation (`93`)
    companyIdentifiers[93] = #"Realtek Semiconductor Corporation"#

    /// Stonestreet One, LLC (`94`)
    companyIdentifiers[94] = #"Stonestreet One, LLC"#

    /// Wicentric, Inc. (`95`)
    companyIdentifiers[95] = #"Wicentric, Inc."#

    /// RivieraWaves S.A.S (`96`)
    companyIdentifiers[96] = #"RivieraWaves S.A.S"#

    /// RDA Microelectronics (`97`)
    companyIdentifiers[97] = #"RDA Microelectronics"#

    /// Gibson Guitars (`98`)
    companyIdentifiers[98] = #"Gibson Guitars"#

    /// MiCommand Inc. (`99`)
    companyIdentifiers[99] = #"MiCommand Inc."#

    /// Band XI International, LLC (`100`)
    companyIdentifiers[100] = #"Band XI International, LLC"#

    /// Hewlett-Packard Company (`101`)
    companyIdentifiers[101] = #"Hewlett-Packard Company"#

    /// 9Solutions Oy (`102`)
    companyIdentifiers[102] = #"9Solutions Oy"#

    /// GN Netcom A/S (`103`)
    companyIdentifiers[103] = #"GN Netcom A/S"#

    /// General Motors (`104`)
    companyIdentifiers[104] = #"General Motors"#

    /// A&D Engineering, Inc. (`105`)
    companyIdentifiers[105] = #"A&D Engineering, Inc."#

    /// MindTree Ltd. (`106`)
    companyIdentifiers[106] = #"MindTree Ltd."#

    /// Polar Electro OY (`107`)
    companyIdentifiers[107] = #"Polar Electro OY"#

    /// Beautiful Enterprise Co., Ltd. (`108`)
    companyIdentifiers[108] = #"Beautiful Enterprise Co., Ltd."#

    /// BriarTek, Inc. (`109`)
    companyIdentifiers[109] = #"BriarTek, Inc."#

    /// Summit Data Communications, Inc. (`110`)
    companyIdentifiers[110] = #"Summit Data Communications, Inc."#

    /// Sound ID (`111`)
    companyIdentifiers[111] = #"Sound ID"#

    /// Monster, LLC (`112`)
    companyIdentifiers[112] = #"Monster, LLC"#

    /// connectBlue AB (`113`)
    companyIdentifiers[113] = #"connectBlue AB"#

    /// ShangHai Super Smart Electronics Co. Ltd. (`114`)
    companyIdentifiers[114] = #"ShangHai Super Smart Electronics Co. Ltd."#

    /// Group Sense Ltd. (`115`)
    companyIdentifiers[115] = #"Group Sense Ltd."#

    /// Zomm, LLC (`116`)
    companyIdentifiers[116] = #"Zomm, LLC"#

    /// Samsung Electronics Co. Ltd. (`117`)
    companyIdentifiers[117] = #"Samsung Electronics Co. Ltd."#

    /// Creative Technology Ltd. (`118`)
    companyIdentifiers[118] = #"Creative Technology Ltd."#

    /// Laird Technologies (`119`)
    companyIdentifiers[119] = #"Laird Technologies"#

    /// Nike, Inc. (`120`)
    companyIdentifiers[120] = #"Nike, Inc."#

    /// lesswire AG (`121`)
    companyIdentifiers[121] = #"lesswire AG"#

    /// MStar Semiconductor, Inc. (`122`)
    companyIdentifiers[122] = #"MStar Semiconductor, Inc."#

    /// Hanlynn Technologies (`123`)
    companyIdentifiers[123] = #"Hanlynn Technologies"#

    /// A & R Cambridge (`124`)
    companyIdentifiers[124] = #"A & R Cambridge"#

    /// Seers Technology Co. Ltd (`125`)
    companyIdentifiers[125] = #"Seers Technology Co. Ltd"#

    /// Sports Tracking Technologies Ltd. (`126`)
    companyIdentifiers[126] = #"Sports Tracking Technologies Ltd."#

    /// Autonet Mobile (`127`)
    companyIdentifiers[127] = #"Autonet Mobile"#

    /// DeLorme Publishing Company, Inc. (`128`)
    companyIdentifiers[128] = #"DeLorme Publishing Company, Inc."#

    /// WuXi Vimicro (`129`)
    companyIdentifiers[129] = #"WuXi Vimicro"#

    /// Sennheiser Communications A/S (`130`)
    companyIdentifiers[130] = #"Sennheiser Communications A/S"#

    /// TimeKeeping Systems, Inc. (`131`)
    companyIdentifiers[131] = #"TimeKeeping Systems, Inc."#

    /// Ludus Helsinki Ltd. (`132`)
    companyIdentifiers[132] = #"Ludus Helsinki Ltd."#

    /// BlueRadios, Inc. (`133`)
    companyIdentifiers[133] = #"BlueRadios, Inc."#

    /// Equinox AG (`134`)
    companyIdentifiers[134] = #"Equinox AG"#

    /// Garmin International, Inc. (`135`)
    companyIdentifiers[135] = #"Garmin International, Inc."#

    /// Ecotest (`136`)
    companyIdentifiers[136] = #"Ecotest"#

    /// GN ReSound A/S (`137`)
    companyIdentifiers[137] = #"GN ReSound A/S"#

    /// Jawbone (`138`)
    companyIdentifiers[138] = #"Jawbone"#

    /// Topcon Positioning Systems, LLC (`139`)
    companyIdentifiers[139] = #"Topcon Positioning Systems, LLC"#

    /// Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.) (`140`)
    companyIdentifiers[140] = #"Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)"#

    /// Zscan Software (`141`)
    companyIdentifiers[141] = #"Zscan Software"#

    /// Quintic Corp. (`142`)
    companyIdentifiers[142] = #"Quintic Corp."#

    /// Telit Wireless Solutions GmbH (Formerly Stollman E+V GmbH) (`143`)
    companyIdentifiers[143] = #"Telit Wireless Solutions GmbH (Formerly Stollman E+V GmbH)"#

    /// Funai Electric Co., Ltd. (`144`)
    companyIdentifiers[144] = #"Funai Electric Co., Ltd."#

    /// Advanced PANMOBIL Systems GmbH & Co. KG (`145`)
    companyIdentifiers[145] = #"Advanced PANMOBIL Systems GmbH & Co. KG"#

    /// ThinkOptics, Inc. (`146`)
    companyIdentifiers[146] = #"ThinkOptics, Inc."#

    /// Universal Electronics, Inc. (`147`)
    companyIdentifiers[147] = #"Universal Electronics, Inc."#

    /// Airoha Technology Corp. (`148`)
    companyIdentifiers[148] = #"Airoha Technology Corp."#

    /// NEC Lighting, Ltd. (`149`)
    companyIdentifiers[149] = #"NEC Lighting, Ltd."#

    /// ODM Technology, Inc. (`150`)
    companyIdentifiers[150] = #"ODM Technology, Inc."#

    /// ConnecteDevice Ltd. (`151`)
    companyIdentifiers[151] = #"ConnecteDevice Ltd."#

    /// zer01.tv GmbH (`152`)
    companyIdentifiers[152] = #"zer01.tv GmbH"#

    /// i.Tech Dynamic Global Distribution Ltd. (`153`)
    companyIdentifiers[153] = #"i.Tech Dynamic Global Distribution Ltd."#

    /// Alpwise (`154`)
    companyIdentifiers[154] = #"Alpwise"#

    /// Jiangsu Toppower Automotive Electronics Co., Ltd. (`155`)
    companyIdentifiers[155] = #"Jiangsu Toppower Automotive Electronics Co., Ltd."#

    /// Colorfy, Inc. (`156`)
    companyIdentifiers[156] = #"Colorfy, Inc."#

    /// Geoforce Inc. (`157`)
    companyIdentifiers[157] = #"Geoforce Inc."#

    /// Bose Corporation (`158`)
    companyIdentifiers[158] = #"Bose Corporation"#

    /// Suunto Oy (`159`)
    companyIdentifiers[159] = #"Suunto Oy"#

    /// Kensington Computer Products Group (`160`)
    companyIdentifiers[160] = #"Kensington Computer Products Group"#

    /// SR-Medizinelektronik (`161`)
    companyIdentifiers[161] = #"SR-Medizinelektronik"#

    /// Vertu Corporation Limited (`162`)
    companyIdentifiers[162] = #"Vertu Corporation Limited"#

    /// Meta Watch Ltd. (`163`)
    companyIdentifiers[163] = #"Meta Watch Ltd."#

    /// LINAK A/S (`164`)
    companyIdentifiers[164] = #"LINAK A/S"#

    /// OTL Dynamics LLC (`165`)
    companyIdentifiers[165] = #"OTL Dynamics LLC"#

    /// Panda Ocean Inc. (`166`)
    companyIdentifiers[166] = #"Panda Ocean Inc."#

    /// Visteon Corporation (`167`)
    companyIdentifiers[167] = #"Visteon Corporation"#

    /// ARP Devices Limited (`168`)
    companyIdentifiers[168] = #"ARP Devices Limited"#

    /// Magneti Marelli S.p.A (`169`)
    companyIdentifiers[169] = #"Magneti Marelli S.p.A"#

    /// CAEN RFID srl (`170`)
    companyIdentifiers[170] = #"CAEN RFID srl"#

    /// Ingenieur-Systemgruppe Zahn GmbH (`171`)
    companyIdentifiers[171] = #"Ingenieur-Systemgruppe Zahn GmbH"#

    /// Green Throttle Games (`172`)
    companyIdentifiers[172] = #"Green Throttle Games"#

    /// Peter Systemtechnik GmbH (`173`)
    companyIdentifiers[173] = #"Peter Systemtechnik GmbH"#

    /// Omegawave Oy (`174`)
    companyIdentifiers[174] = #"Omegawave Oy"#

    /// Cinetix (`175`)
    companyIdentifiers[175] = #"Cinetix"#

    /// Passif Semiconductor Corp (`176`)
    companyIdentifiers[176] = #"Passif Semiconductor Corp"#

    /// Saris Cycling Group, Inc (`177`)
    companyIdentifiers[177] = #"Saris Cycling Group, Inc"#

    /// Bekey A/S (`178`)
    companyIdentifiers[178] = #"Bekey A/S"#

    /// Clarinox Technologies Pty. Ltd. (`179`)
    companyIdentifiers[179] = #"Clarinox Technologies Pty. Ltd."#

    /// BDE Technology Co., Ltd. (`180`)
    companyIdentifiers[180] = #"BDE Technology Co., Ltd."#

    /// Swirl Networks (`181`)
    companyIdentifiers[181] = #"Swirl Networks"#

    /// Meso international (`182`)
    companyIdentifiers[182] = #"Meso international"#

    /// TreLab Ltd (`183`)
    companyIdentifiers[183] = #"TreLab Ltd"#

    /// Qualcomm Innovation Center, Inc. (QuIC) (`184`)
    companyIdentifiers[184] = #"Qualcomm Innovation Center, Inc. (QuIC)"#

    /// Johnson Controls, Inc. (`185`)
    companyIdentifiers[185] = #"Johnson Controls, Inc."#

    /// Starkey Laboratories Inc. (`186`)
    companyIdentifiers[186] = #"Starkey Laboratories Inc."#

    /// S-Power Electronics Limited (`187`)
    companyIdentifiers[187] = #"S-Power Electronics Limited"#

    /// Ace Sensor Inc (`188`)
    companyIdentifiers[188] = #"Ace Sensor Inc"#

    /// Aplix Corporation (`189`)
    companyIdentifiers[189] = #"Aplix Corporation"#

    /// AAMP of America (`190`)
    companyIdentifiers[190] = #"AAMP of America"#

    /// Stalmart Technology Limited (`191`)
    companyIdentifiers[191] = #"Stalmart Technology Limited"#

    /// AMICCOM Electronics Corporation (`192`)
    companyIdentifiers[192] = #"AMICCOM Electronics Corporation"#

    /// Shenzhen Excelsecu Data Technology Co.,Ltd (`193`)
    companyIdentifiers[193] = #"Shenzhen Excelsecu Data Technology Co.,Ltd"#

    /// Geneq Inc. (`194`)
    companyIdentifiers[194] = #"Geneq Inc."#

    /// adidas AG (`195`)
    companyIdentifiers[195] = #"adidas AG"#

    /// LG Electronics (`196`)
    companyIdentifiers[196] = #"LG Electronics"#

    /// Onset Computer Corporation (`197`)
    companyIdentifiers[197] = #"Onset Computer Corporation"#

    /// Selfly BV (`198`)
    companyIdentifiers[198] = #"Selfly BV"#

    /// Quuppa Oy. (`199`)
    companyIdentifiers[199] = #"Quuppa Oy."#

    /// GeLo Inc (`200`)
    companyIdentifiers[200] = #"GeLo Inc"#

    /// Evluma (`201`)
    companyIdentifiers[201] = #"Evluma"#

    /// MC10 (`202`)
    companyIdentifiers[202] = #"MC10"#

    /// Binauric SE (`203`)
    companyIdentifiers[203] = #"Binauric SE"#

    /// Beats Electronics (`204`)
    companyIdentifiers[204] = #"Beats Electronics"#

    /// Microchip Technology Inc. (`205`)
    companyIdentifiers[205] = #"Microchip Technology Inc."#

    /// Elgato Systems GmbH (`206`)
    companyIdentifiers[206] = #"Elgato Systems GmbH"#

    /// ARCHOS SA (`207`)
    companyIdentifiers[207] = #"ARCHOS SA"#

    /// Dexcom, Inc. (`208`)
    companyIdentifiers[208] = #"Dexcom, Inc."#

    /// Polar Electro Europe B.V. (`209`)
    companyIdentifiers[209] = #"Polar Electro Europe B.V."#

    /// Dialog Semiconductor B.V. (`210`)
    companyIdentifiers[210] = #"Dialog Semiconductor B.V."#

    /// Taixingbang Technology (HK) Co,. LTD. (`211`)
    companyIdentifiers[211] = #"Taixingbang Technology (HK) Co,. LTD."#

    /// Kawantech (`212`)
    companyIdentifiers[212] = #"Kawantech"#

    /// Austco Communication Systems (`213`)
    companyIdentifiers[213] = #"Austco Communication Systems"#

    /// Timex Group USA, Inc. (`214`)
    companyIdentifiers[214] = #"Timex Group USA, Inc."#

    /// Qualcomm Technologies, Inc. (`215`)
    companyIdentifiers[215] = #"Qualcomm Technologies, Inc."#

    /// Qualcomm Connected Experiences, Inc. (`216`)
    companyIdentifiers[216] = #"Qualcomm Connected Experiences, Inc."#

    /// Voyetra Turtle Beach (`217`)
    companyIdentifiers[217] = #"Voyetra Turtle Beach"#

    /// txtr GmbH (`218`)
    companyIdentifiers[218] = #"txtr GmbH"#

    /// Biosentronics (`219`)
    companyIdentifiers[219] = #"Biosentronics"#

    /// Procter & Gamble (`220`)
    companyIdentifiers[220] = #"Procter & Gamble"#

    /// Hosiden Corporation (`221`)
    companyIdentifiers[221] = #"Hosiden Corporation"#

    /// Muzik LLC (`222`)
    companyIdentifiers[222] = #"Muzik LLC"#

    /// Misfit Wearables Corp (`223`)
    companyIdentifiers[223] = #"Misfit Wearables Corp"#

    /// Google (`224`)
    companyIdentifiers[224] = #"Google"#

    /// Danlers Ltd (`225`)
    companyIdentifiers[225] = #"Danlers Ltd"#

    /// Semilink Inc (`226`)
    companyIdentifiers[226] = #"Semilink Inc"#

    /// inMusic Brands, Inc (`227`)
    companyIdentifiers[227] = #"inMusic Brands, Inc"#

    /// L.S. Research Inc. (`228`)
    companyIdentifiers[228] = #"L.S. Research Inc."#

    /// Eden Software Consultants Ltd. (`229`)
    companyIdentifiers[229] = #"Eden Software Consultants Ltd."#

    /// Freshtemp (`230`)
    companyIdentifiers[230] = #"Freshtemp"#

    /// KS Technologies (`231`)
    companyIdentifiers[231] = #"KS Technologies"#

    /// ACTS Technologies (`232`)
    companyIdentifiers[232] = #"ACTS Technologies"#

    /// Vtrack Systems (`233`)
    companyIdentifiers[233] = #"Vtrack Systems"#

    /// Nielsen-Kellerman Company (`234`)
    companyIdentifiers[234] = #"Nielsen-Kellerman Company"#

    /// Server Technology, Inc. (`235`)
    companyIdentifiers[235] = #"Server Technology, Inc."#

    /// BioResearch Associates (`236`)
    companyIdentifiers[236] = #"BioResearch Associates"#

    /// Jolly Logic, LLC (`237`)
    companyIdentifiers[237] = #"Jolly Logic, LLC"#

    /// Above Average Outcomes, Inc. (`238`)
    companyIdentifiers[238] = #"Above Average Outcomes, Inc."#

    /// Bitsplitters GmbH (`239`)
    companyIdentifiers[239] = #"Bitsplitters GmbH"#

    /// PayPal, Inc. (`240`)
    companyIdentifiers[240] = #"PayPal, Inc."#

    /// Witron Technology Limited (`241`)
    companyIdentifiers[241] = #"Witron Technology Limited"#

    /// Aether Things Inc. (formerly Morse Project Inc.) (`242`)
    companyIdentifiers[242] = #"Aether Things Inc. (formerly Morse Project Inc.)"#

    /// Kent Displays Inc. (`243`)
    companyIdentifiers[243] = #"Kent Displays Inc."#

    /// Nautilus Inc. (`244`)
    companyIdentifiers[244] = #"Nautilus Inc."#

    /// Smartifier Oy (`245`)
    companyIdentifiers[245] = #"Smartifier Oy"#

    /// Elcometer Limited (`246`)
    companyIdentifiers[246] = #"Elcometer Limited"#

    /// VSN Technologies Inc. (`247`)
    companyIdentifiers[247] = #"VSN Technologies Inc."#

    /// AceUni Corp., Ltd. (`248`)
    companyIdentifiers[248] = #"AceUni Corp., Ltd."#

    /// StickNFind (`249`)
    companyIdentifiers[249] = #"StickNFind"#

    /// Crystal Code AB (`250`)
    companyIdentifiers[250] = #"Crystal Code AB"#

    /// KOUKAAM a.s. (`251`)
    companyIdentifiers[251] = #"KOUKAAM a.s."#

    /// Delphi Corporation (`252`)
    companyIdentifiers[252] = #"Delphi Corporation"#

    /// ValenceTech Limited (`253`)
    companyIdentifiers[253] = #"ValenceTech Limited"#

    /// Stanley Black and Decker (`254`)
    companyIdentifiers[254] = #"Stanley Black and Decker"#

    /// Typo Products, LLC (`255`)
    companyIdentifiers[255] = #"Typo Products, LLC"#

    /// TomTom International BV (`256`)
    companyIdentifiers[256] = #"TomTom International BV"#

    /// Fugoo, Inc (`257`)
    companyIdentifiers[257] = #"Fugoo, Inc"#

    /// Keiser Corporation (`258`)
    companyIdentifiers[258] = #"Keiser Corporation"#

    /// Bang & Olufsen A/S (`259`)
    companyIdentifiers[259] = #"Bang & Olufsen A/S"#

    /// PLUS Locations Systems Pty Ltd (`260`)
    companyIdentifiers[260] = #"PLUS Locations Systems Pty Ltd"#

    /// Ubiquitous Computing Technology Corporation (`261`)
    companyIdentifiers[261] = #"Ubiquitous Computing Technology Corporation"#

    /// Innovative Yachtter Solutions (`262`)
    companyIdentifiers[262] = #"Innovative Yachtter Solutions"#

    /// William Demant Holding A/S (`263`)
    companyIdentifiers[263] = #"William Demant Holding A/S"#

    /// Chicony Electronics Co., Ltd. (`264`)
    companyIdentifiers[264] = #"Chicony Electronics Co., Ltd."#

    /// Atus BV (`265`)
    companyIdentifiers[265] = #"Atus BV"#

    /// Codegate Ltd. (`266`)
    companyIdentifiers[266] = #"Codegate Ltd."#

    /// ERi, Inc. (`267`)
    companyIdentifiers[267] = #"ERi, Inc."#

    /// Transducers Direct, LLC (`268`)
    companyIdentifiers[268] = #"Transducers Direct, LLC"#

    /// Fujitsu Ten Limited (`269`)
    companyIdentifiers[269] = #"Fujitsu Ten Limited"#

    /// Audi AG (`270`)
    companyIdentifiers[270] = #"Audi AG"#

    /// HiSilicon Technologies Co., Ltd. (`271`)
    companyIdentifiers[271] = #"HiSilicon Technologies Co., Ltd."#

    /// Nippon Seiki Co., Ltd. (`272`)
    companyIdentifiers[272] = #"Nippon Seiki Co., Ltd."#

    /// Steelseries ApS (`273`)
    companyIdentifiers[273] = #"Steelseries ApS"#

    /// Visybl Inc. (`274`)
    companyIdentifiers[274] = #"Visybl Inc."#

    /// Openbrain Technologies, Co., Ltd. (`275`)
    companyIdentifiers[275] = #"Openbrain Technologies, Co., Ltd."#

    /// Xensr (`276`)
    companyIdentifiers[276] = #"Xensr"#

    /// e.solutions (`277`)
    companyIdentifiers[277] = #"e.solutions"#

    /// 1OAK Technologies (`278`)
    companyIdentifiers[278] = #"1OAK Technologies"#

    /// Wimoto Technologies Inc (`279`)
    companyIdentifiers[279] = #"Wimoto Technologies Inc"#

    /// Radius Networks, Inc. (`280`)
    companyIdentifiers[280] = #"Radius Networks, Inc."#

    /// Wize Technology Co., Ltd. (`281`)
    companyIdentifiers[281] = #"Wize Technology Co., Ltd."#

    /// Qualcomm Labs, Inc. (`282`)
    companyIdentifiers[282] = #"Qualcomm Labs, Inc."#

    /// Hewlett Packard Enterprise (`283`)
    companyIdentifiers[283] = #"Hewlett Packard Enterprise"#

    /// Baidu (`284`)
    companyIdentifiers[284] = #"Baidu"#

    /// Arendi AG (`285`)
    companyIdentifiers[285] = #"Arendi AG"#

    /// Skoda Auto a.s. (`286`)
    companyIdentifiers[286] = #"Skoda Auto a.s."#

    /// Volkswagen AG (`287`)
    companyIdentifiers[287] = #"Volkswagen AG"#

    /// Porsche AG (`288`)
    companyIdentifiers[288] = #"Porsche AG"#

    /// Sino Wealth Electronic Ltd. (`289`)
    companyIdentifiers[289] = #"Sino Wealth Electronic Ltd."#

    /// AirTurn, Inc. (`290`)
    companyIdentifiers[290] = #"AirTurn, Inc."#

    /// Kinsa, Inc. (`291`)
    companyIdentifiers[291] = #"Kinsa, Inc."#

    /// HID Global (`292`)
    companyIdentifiers[292] = #"HID Global"#

    /// SEAT es (`293`)
    companyIdentifiers[293] = #"SEAT es"#

    /// Promethean Ltd. (`294`)
    companyIdentifiers[294] = #"Promethean Ltd."#

    /// Salutica Allied Solutions (`295`)
    companyIdentifiers[295] = #"Salutica Allied Solutions"#

    /// GPSI Group Pty Ltd (`296`)
    companyIdentifiers[296] = #"GPSI Group Pty Ltd"#

    /// Nimble Devices Oy (`297`)
    companyIdentifiers[297] = #"Nimble Devices Oy"#

    /// Changzhou Yongse Infotech Co., Ltd (`298`)
    companyIdentifiers[298] = #"Changzhou Yongse Infotech Co., Ltd"#

    /// SportIQ (`299`)
    companyIdentifiers[299] = #"SportIQ"#

    /// TEMEC Instruments B.V. (`300`)
    companyIdentifiers[300] = #"TEMEC Instruments B.V."#

    /// Sony Corporation (`301`)
    companyIdentifiers[301] = #"Sony Corporation"#

    /// ASSA ABLOY (`302`)
    companyIdentifiers[302] = #"ASSA ABLOY"#

    /// Clarion Co., Ltd. (`303`)
    companyIdentifiers[303] = #"Clarion Co., Ltd."#

    /// Warehouse Innovations (`304`)
    companyIdentifiers[304] = #"Warehouse Innovations"#

    /// Cypress Semiconductor Corporation (`305`)
    companyIdentifiers[305] = #"Cypress Semiconductor Corporation"#

    /// MADS Inc (`306`)
    companyIdentifiers[306] = #"MADS Inc"#

    /// Blue Maestro Limited (`307`)
    companyIdentifiers[307] = #"Blue Maestro Limited"#

    /// Resolution Products, Inc. (`308`)
    companyIdentifiers[308] = #"Resolution Products, Inc."#

    /// Airewear LLC (`309`)
    companyIdentifiers[309] = #"Airewear LLC"#

    /// Silvair, Inc. (`310`)
    companyIdentifiers[310] = #"Silvair, Inc."#

    /// Prestigio Plaza Ltd. (`311`)
    companyIdentifiers[311] = #"Prestigio Plaza Ltd."#

    /// NTEO Inc. (`312`)
    companyIdentifiers[312] = #"NTEO Inc."#

    /// Focus Systems Corporation (`313`)
    companyIdentifiers[313] = #"Focus Systems Corporation"#

    /// Tencent Holdings Limited (`314`)
    companyIdentifiers[314] = #"Tencent Holdings Limited"#

    /// Allegion (`315`)
    companyIdentifiers[315] = #"Allegion"#

    /// Murata Manufacuring Co., Ltd. (`316`)
    companyIdentifiers[316] = #"Murata Manufacuring Co., Ltd."#

    /// WirelessWERX (`317`)
    companyIdentifiers[317] = #"WirelessWERX"#

    /// Nod, Inc. (`318`)
    companyIdentifiers[318] = #"Nod, Inc."#

    /// B&B Manufacturing Company (`319`)
    companyIdentifiers[319] = #"B&B Manufacturing Company"#

    /// Alpine Electronics (China) Co., Ltd (`320`)
    companyIdentifiers[320] = #"Alpine Electronics (China) Co., Ltd"#

    /// FedEx Services (`321`)
    companyIdentifiers[321] = #"FedEx Services"#

    /// Grape Systems Inc. (`322`)
    companyIdentifiers[322] = #"Grape Systems Inc."#

    /// Bkon Connect (`323`)
    companyIdentifiers[323] = #"Bkon Connect"#

    /// Lintech GmbH (`324`)
    companyIdentifiers[324] = #"Lintech GmbH"#

    /// Novatel Wireless (`325`)
    companyIdentifiers[325] = #"Novatel Wireless"#

    /// Ciright (`326`)
    companyIdentifiers[326] = #"Ciright"#

    /// Mighty Cast, Inc. (`327`)
    companyIdentifiers[327] = #"Mighty Cast, Inc."#

    /// Ambimat Electronics (`328`)
    companyIdentifiers[328] = #"Ambimat Electronics"#

    /// Perytons Ltd. (`329`)
    companyIdentifiers[329] = #"Perytons Ltd."#

    /// Tivoli Audio, LLC (`330`)
    companyIdentifiers[330] = #"Tivoli Audio, LLC"#

    /// Master Lock (`331`)
    companyIdentifiers[331] = #"Master Lock"#

    /// Mesh-Net Ltd (`332`)
    companyIdentifiers[332] = #"Mesh-Net Ltd"#

    /// Huizhou Desay SV Automotive CO., LTD. (`333`)
    companyIdentifiers[333] = #"Huizhou Desay SV Automotive CO., LTD."#

    /// Tangerine, Inc. (`334`)
    companyIdentifiers[334] = #"Tangerine, Inc."#

    /// B&W Group Ltd. (`335`)
    companyIdentifiers[335] = #"B&W Group Ltd."#

    /// Pioneer Corporation (`336`)
    companyIdentifiers[336] = #"Pioneer Corporation"#

    /// OnBeep (`337`)
    companyIdentifiers[337] = #"OnBeep"#

    /// Vernier Software & Technology (`338`)
    companyIdentifiers[338] = #"Vernier Software & Technology"#

    /// ROL Ergo (`339`)
    companyIdentifiers[339] = #"ROL Ergo"#

    /// Pebble Technology (`340`)
    companyIdentifiers[340] = #"Pebble Technology"#

    /// NETATMO (`341`)
    companyIdentifiers[341] = #"NETATMO"#

    /// Accumulate AB (`342`)
    companyIdentifiers[342] = #"Accumulate AB"#

    /// Anhui Huami Information Technology Co., Ltd. (`343`)
    companyIdentifiers[343] = #"Anhui Huami Information Technology Co., Ltd."#

    /// Inmite s.r.o. (`344`)
    companyIdentifiers[344] = #"Inmite s.r.o."#

    /// ChefSteps, Inc. (`345`)
    companyIdentifiers[345] = #"ChefSteps, Inc."#

    /// micas AG (`346`)
    companyIdentifiers[346] = #"micas AG"#

    /// Biomedical Research Ltd. (`347`)
    companyIdentifiers[347] = #"Biomedical Research Ltd."#

    /// Pitius Tec S.L. (`348`)
    companyIdentifiers[348] = #"Pitius Tec S.L."#

    /// Estimote, Inc. (`349`)
    companyIdentifiers[349] = #"Estimote, Inc."#

    /// Unikey Technologies, Inc. (`350`)
    companyIdentifiers[350] = #"Unikey Technologies, Inc."#

    /// Timer Cap Co. (`351`)
    companyIdentifiers[351] = #"Timer Cap Co."#

    /// AwoX (`352`)
    companyIdentifiers[352] = #"AwoX"#

    /// yikes (`353`)
    companyIdentifiers[353] = #"yikes"#

    /// MADSGlobal NZ Ltd. (`354`)
    companyIdentifiers[354] = #"MADSGlobal NZ Ltd."#

    /// PCH International (`355`)
    companyIdentifiers[355] = #"PCH International"#

    /// Qingdao Yeelink Information Technology Co., Ltd. (`356`)
    companyIdentifiers[356] = #"Qingdao Yeelink Information Technology Co., Ltd."#

    /// Milwaukee Tool (formerly Milwaukee Electric Tools) (`357`)
    companyIdentifiers[357] = #"Milwaukee Tool (formerly Milwaukee Electric Tools)"#

    /// MISHIK Pte Ltd (`358`)
    companyIdentifiers[358] = #"MISHIK Pte Ltd"#

    /// Ascensia Diabetes Care US Inc. (`359`)
    companyIdentifiers[359] = #"Ascensia Diabetes Care US Inc."#

    /// Spicebox LLC (`360`)
    companyIdentifiers[360] = #"Spicebox LLC"#

    /// emberlight (`361`)
    companyIdentifiers[361] = #"emberlight"#

    /// Cooper-Atkins Corporation (`362`)
    companyIdentifiers[362] = #"Cooper-Atkins Corporation"#

    /// Qblinks (`363`)
    companyIdentifiers[363] = #"Qblinks"#

    /// MYSPHERA (`364`)
    companyIdentifiers[364] = #"MYSPHERA"#

    /// LifeScan Inc (`365`)
    companyIdentifiers[365] = #"LifeScan Inc"#

    /// Volantic AB (`366`)
    companyIdentifiers[366] = #"Volantic AB"#

    /// Podo Labs, Inc (`367`)
    companyIdentifiers[367] = #"Podo Labs, Inc"#

    /// Roche Diabetes Care AG (`368`)
    companyIdentifiers[368] = #"Roche Diabetes Care AG"#

    /// Amazon Fulfillment Service (`369`)
    companyIdentifiers[369] = #"Amazon Fulfillment Service"#

    /// Connovate Technology Private Limited (`370`)
    companyIdentifiers[370] = #"Connovate Technology Private Limited"#

    /// Kocomojo, LLC (`371`)
    companyIdentifiers[371] = #"Kocomojo, LLC"#

    /// Everykey Inc. (`372`)
    companyIdentifiers[372] = #"Everykey Inc."#

    /// Dynamic Controls (`373`)
    companyIdentifiers[373] = #"Dynamic Controls"#

    /// SentriLock (`374`)
    companyIdentifiers[374] = #"SentriLock"#

    /// I-SYST inc. (`375`)
    companyIdentifiers[375] = #"I-SYST inc."#

    /// CASIO COMPUTER CO., LTD. (`376`)
    companyIdentifiers[376] = #"CASIO COMPUTER CO., LTD."#

    /// LAPIS Semiconductor Co., Ltd. (`377`)
    companyIdentifiers[377] = #"LAPIS Semiconductor Co., Ltd."#

    /// Telemonitor, Inc. (`378`)
    companyIdentifiers[378] = #"Telemonitor, Inc."#

    /// taskit GmbH (`379`)
    companyIdentifiers[379] = #"taskit GmbH"#

    /// Daimler AG (`380`)
    companyIdentifiers[380] = #"Daimler AG"#

    /// BatAndCat (`381`)
    companyIdentifiers[381] = #"BatAndCat"#

    /// BluDotz Ltd (`382`)
    companyIdentifiers[382] = #"BluDotz Ltd"#

    /// XTel Wireless ApS (`383`)
    companyIdentifiers[383] = #"XTel Wireless ApS"#

    /// Gigaset Communications GmbH (`384`)
    companyIdentifiers[384] = #"Gigaset Communications GmbH"#

    /// Gecko Health Innovations, Inc. (`385`)
    companyIdentifiers[385] = #"Gecko Health Innovations, Inc."#

    /// HOP Ubiquitous (`386`)
    companyIdentifiers[386] = #"HOP Ubiquitous"#

    /// Walt Disney (`387`)
    companyIdentifiers[387] = #"Walt Disney"#

    /// Nectar (`388`)
    companyIdentifiers[388] = #"Nectar"#

    /// bel'apps LLC (`389`)
    companyIdentifiers[389] = #"bel'apps LLC"#

    /// CORE Lighting Ltd (`390`)
    companyIdentifiers[390] = #"CORE Lighting Ltd"#

    /// Seraphim Sense Ltd (`391`)
    companyIdentifiers[391] = #"Seraphim Sense Ltd"#

    /// Unico RBC (`392`)
    companyIdentifiers[392] = #"Unico RBC"#

    /// Physical Enterprises Inc. (`393`)
    companyIdentifiers[393] = #"Physical Enterprises Inc."#

    /// Able Trend Technology Limited (`394`)
    companyIdentifiers[394] = #"Able Trend Technology Limited"#

    /// Konica Minolta, Inc. (`395`)
    companyIdentifiers[395] = #"Konica Minolta, Inc."#

    /// Wilo SE (`396`)
    companyIdentifiers[396] = #"Wilo SE"#

    /// Extron Design Services (`397`)
    companyIdentifiers[397] = #"Extron Design Services"#

    /// Fitbit, Inc. (`398`)
    companyIdentifiers[398] = #"Fitbit, Inc."#

    /// Fireflies Systems (`399`)
    companyIdentifiers[399] = #"Fireflies Systems"#

    /// Intelletto Technologies Inc. (`400`)
    companyIdentifiers[400] = #"Intelletto Technologies Inc."#

    /// FDK CORPORATION (`401`)
    companyIdentifiers[401] = #"FDK CORPORATION"#

    /// Cloudleaf, Inc (`402`)
    companyIdentifiers[402] = #"Cloudleaf, Inc"#

    /// Maveric Automation LLC (`403`)
    companyIdentifiers[403] = #"Maveric Automation LLC"#

    /// Acoustic Stream Corporation (`404`)
    companyIdentifiers[404] = #"Acoustic Stream Corporation"#

    /// Zuli (`405`)
    companyIdentifiers[405] = #"Zuli"#

    /// Paxton Access Ltd (`406`)
    companyIdentifiers[406] = #"Paxton Access Ltd"#

    /// WiSilica Inc (`407`)
    companyIdentifiers[407] = #"WiSilica Inc"#

    /// VENGIT Korlátolt Felelősségű Társaság (`408`)
    companyIdentifiers[408] = #"VENGIT Korlátolt Felelősségű Társaság"#

    /// SALTO SYSTEMS S.L. (`409`)
    companyIdentifiers[409] = #"SALTO SYSTEMS S.L."#

    /// TRON Forum (formerly T-Engine Forum) (`410`)
    companyIdentifiers[410] = #"TRON Forum (formerly T-Engine Forum)"#

    /// CUBETECH s.r.o. (`411`)
    companyIdentifiers[411] = #"CUBETECH s.r.o."#

    /// Cokiya Incorporated (`412`)
    companyIdentifiers[412] = #"Cokiya Incorporated"#

    /// CVS Health (`413`)
    companyIdentifiers[413] = #"CVS Health"#

    /// Ceruus (`414`)
    companyIdentifiers[414] = #"Ceruus"#

    /// Strainstall Ltd (`415`)
    companyIdentifiers[415] = #"Strainstall Ltd"#

    /// Channel Enterprises (HK) Ltd. (`416`)
    companyIdentifiers[416] = #"Channel Enterprises (HK) Ltd."#

    /// FIAMM (`417`)
    companyIdentifiers[417] = #"FIAMM"#

    /// GIGALANE.CO.,LTD (`418`)
    companyIdentifiers[418] = #"GIGALANE.CO.,LTD"#

    /// EROAD (`419`)
    companyIdentifiers[419] = #"EROAD"#

    /// Mine Safety Appliances (`420`)
    companyIdentifiers[420] = #"Mine Safety Appliances"#

    /// Icon Health and Fitness (`421`)
    companyIdentifiers[421] = #"Icon Health and Fitness"#

    /// Asandoo GmbH (`422`)
    companyIdentifiers[422] = #"Asandoo GmbH"#

    /// ENERGOUS CORPORATION (`423`)
    companyIdentifiers[423] = #"ENERGOUS CORPORATION"#

    /// Taobao (`424`)
    companyIdentifiers[424] = #"Taobao"#

    /// Canon Inc. (`425`)
    companyIdentifiers[425] = #"Canon Inc."#

    /// Geophysical Technology Inc. (`426`)
    companyIdentifiers[426] = #"Geophysical Technology Inc."#

    /// Facebook, Inc. (`427`)
    companyIdentifiers[427] = #"Facebook, Inc."#

    /// Trividia Health, Inc. (`428`)
    companyIdentifiers[428] = #"Trividia Health, Inc."#

    /// FlightSafety International (`429`)
    companyIdentifiers[429] = #"FlightSafety International"#

    /// Earlens Corporation (`430`)
    companyIdentifiers[430] = #"Earlens Corporation"#

    /// Sunrise Micro Devices, Inc. (`431`)
    companyIdentifiers[431] = #"Sunrise Micro Devices, Inc."#

    /// Star Micronics Co., Ltd. (`432`)
    companyIdentifiers[432] = #"Star Micronics Co., Ltd."#

    /// Netizens Sp. z o.o. (`433`)
    companyIdentifiers[433] = #"Netizens Sp. z o.o."#

    /// Nymi Inc. (`434`)
    companyIdentifiers[434] = #"Nymi Inc."#

    /// Nytec, Inc. (`435`)
    companyIdentifiers[435] = #"Nytec, Inc."#

    /// Trineo Sp. z o.o. (`436`)
    companyIdentifiers[436] = #"Trineo Sp. z o.o."#

    /// Nest Labs Inc. (`437`)
    companyIdentifiers[437] = #"Nest Labs Inc."#

    /// LM Technologies Ltd (`438`)
    companyIdentifiers[438] = #"LM Technologies Ltd"#

    /// General Electric Company (`439`)
    companyIdentifiers[439] = #"General Electric Company"#

    /// i+D3 S.L. (`440`)
    companyIdentifiers[440] = #"i+D3 S.L."#

    /// HANA Micron (`441`)
    companyIdentifiers[441] = #"HANA Micron"#

    /// Stages Cycling LLC (`442`)
    companyIdentifiers[442] = #"Stages Cycling LLC"#

    /// Cochlear Bone Anchored Solutions AB (`443`)
    companyIdentifiers[443] = #"Cochlear Bone Anchored Solutions AB"#

    /// SenionLab AB (`444`)
    companyIdentifiers[444] = #"SenionLab AB"#

    /// Syszone Co., Ltd (`445`)
    companyIdentifiers[445] = #"Syszone Co., Ltd"#

    /// Pulsate Mobile Ltd. (`446`)
    companyIdentifiers[446] = #"Pulsate Mobile Ltd."#

    /// Hong Kong HunterSun Electronic Limited (`447`)
    companyIdentifiers[447] = #"Hong Kong HunterSun Electronic Limited"#

    /// pironex GmbH (`448`)
    companyIdentifiers[448] = #"pironex GmbH"#

    /// BRADATECH Corp. (`449`)
    companyIdentifiers[449] = #"BRADATECH Corp."#

    /// Transenergooil AG (`450`)
    companyIdentifiers[450] = #"Transenergooil AG"#

    /// Bunch (`451`)
    companyIdentifiers[451] = #"Bunch"#

    /// DME Microelectronics (`452`)
    companyIdentifiers[452] = #"DME Microelectronics"#

    /// Bitcraze AB (`453`)
    companyIdentifiers[453] = #"Bitcraze AB"#

    /// HASWARE Inc. (`454`)
    companyIdentifiers[454] = #"HASWARE Inc."#

    /// Abiogenix Inc. (`455`)
    companyIdentifiers[455] = #"Abiogenix Inc."#

    /// Poly-Control ApS (`456`)
    companyIdentifiers[456] = #"Poly-Control ApS"#

    /// Avi-on (`457`)
    companyIdentifiers[457] = #"Avi-on"#

    /// Laerdal Medical AS (`458`)
    companyIdentifiers[458] = #"Laerdal Medical AS"#

    /// Fetch My Pet (`459`)
    companyIdentifiers[459] = #"Fetch My Pet"#

    /// Sam Labs Ltd. (`460`)
    companyIdentifiers[460] = #"Sam Labs Ltd."#

    /// Chengdu Synwing Technology Ltd (`461`)
    companyIdentifiers[461] = #"Chengdu Synwing Technology Ltd"#

    /// HOUWA SYSTEM DESIGN, k.k. (`462`)
    companyIdentifiers[462] = #"HOUWA SYSTEM DESIGN, k.k."#

    /// BSH (`463`)
    companyIdentifiers[463] = #"BSH"#

    /// Primus Inter Pares Ltd (`464`)
    companyIdentifiers[464] = #"Primus Inter Pares Ltd"#

    /// August Home, Inc (`465`)
    companyIdentifiers[465] = #"August Home, Inc"#

    /// Gill Electronics (`466`)
    companyIdentifiers[466] = #"Gill Electronics"#

    /// Sky Wave Design (`467`)
    companyIdentifiers[467] = #"Sky Wave Design"#

    /// Newlab S.r.l. (`468`)
    companyIdentifiers[468] = #"Newlab S.r.l."#

    /// ELAD srl (`469`)
    companyIdentifiers[469] = #"ELAD srl"#

    /// G-wearables inc. (`470`)
    companyIdentifiers[470] = #"G-wearables inc."#

    /// Squadrone Systems Inc. (`471`)
    companyIdentifiers[471] = #"Squadrone Systems Inc."#

    /// Code Corporation (`472`)
    companyIdentifiers[472] = #"Code Corporation"#

    /// Savant Systems LLC (`473`)
    companyIdentifiers[473] = #"Savant Systems LLC"#

    /// Logitech International SA (`474`)
    companyIdentifiers[474] = #"Logitech International SA"#

    /// Innblue Consulting (`475`)
    companyIdentifiers[475] = #"Innblue Consulting"#

    /// iParking Ltd. (`476`)
    companyIdentifiers[476] = #"iParking Ltd."#

    /// Koninklijke Philips Electronics N.V. (`477`)
    companyIdentifiers[477] = #"Koninklijke Philips Electronics N.V."#

    /// Minelab Electronics Pty Limited (`478`)
    companyIdentifiers[478] = #"Minelab Electronics Pty Limited"#

    /// Bison Group Ltd. (`479`)
    companyIdentifiers[479] = #"Bison Group Ltd."#

    /// Widex A/S (`480`)
    companyIdentifiers[480] = #"Widex A/S"#

    /// Jolla Ltd (`481`)
    companyIdentifiers[481] = #"Jolla Ltd"#

    /// Lectronix, Inc. (`482`)
    companyIdentifiers[482] = #"Lectronix, Inc."#

    /// Caterpillar Inc (`483`)
    companyIdentifiers[483] = #"Caterpillar Inc"#

    /// Freedom Innovations (`484`)
    companyIdentifiers[484] = #"Freedom Innovations"#

    /// Dynamic Devices Ltd (`485`)
    companyIdentifiers[485] = #"Dynamic Devices Ltd"#

    /// Technology Solutions (UK) Ltd (`486`)
    companyIdentifiers[486] = #"Technology Solutions (UK) Ltd"#

    /// IPS Group Inc. (`487`)
    companyIdentifiers[487] = #"IPS Group Inc."#

    /// STIR (`488`)
    companyIdentifiers[488] = #"STIR"#

    /// Sano, Inc (`489`)
    companyIdentifiers[489] = #"Sano, Inc"#

    /// Advanced Application Design, Inc. (`490`)
    companyIdentifiers[490] = #"Advanced Application Design, Inc."#

    /// AutoMap LLC (`491`)
    companyIdentifiers[491] = #"AutoMap LLC"#

    /// Spreadtrum Communications Shanghai Ltd (`492`)
    companyIdentifiers[492] = #"Spreadtrum Communications Shanghai Ltd"#

    /// CuteCircuit LTD (`493`)
    companyIdentifiers[493] = #"CuteCircuit LTD"#

    /// Valeo Service (`494`)
    companyIdentifiers[494] = #"Valeo Service"#

    /// Fullpower Technologies, Inc. (`495`)
    companyIdentifiers[495] = #"Fullpower Technologies, Inc."#

    /// KloudNation (`496`)
    companyIdentifiers[496] = #"KloudNation"#

    /// Zebra Technologies Corporation (`497`)
    companyIdentifiers[497] = #"Zebra Technologies Corporation"#

    /// Itron, Inc. (`498`)
    companyIdentifiers[498] = #"Itron, Inc."#

    /// The University of Tokyo (`499`)
    companyIdentifiers[499] = #"The University of Tokyo"#

    /// UTC Fire and Security (`500`)
    companyIdentifiers[500] = #"UTC Fire and Security"#

    /// Cool Webthings Limited (`501`)
    companyIdentifiers[501] = #"Cool Webthings Limited"#

    /// DJO Global (`502`)
    companyIdentifiers[502] = #"DJO Global"#

    /// Gelliner Limited (`503`)
    companyIdentifiers[503] = #"Gelliner Limited"#

    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD (`504`)
    companyIdentifiers[504] = #"Anyka (Guangzhou) Microelectronics Technology Co, LTD"#

    /// Medtronic, Inc. (`505`)
    companyIdentifiers[505] = #"Medtronic, Inc."#

    /// Gozio, Inc. (`506`)
    companyIdentifiers[506] = #"Gozio, Inc."#

    /// Form Lifting, LLC (`507`)
    companyIdentifiers[507] = #"Form Lifting, LLC"#

    /// Wahoo Fitness, LLC (`508`)
    companyIdentifiers[508] = #"Wahoo Fitness, LLC"#

    /// Kontakt Micro-Location Sp. z o.o. (`509`)
    companyIdentifiers[509] = #"Kontakt Micro-Location Sp. z o.o."#

    /// Radio System Corporation (`510`)
    companyIdentifiers[510] = #"Radio System Corporation"#

    /// Freescale Semiconductor, Inc. (`511`)
    companyIdentifiers[511] = #"Freescale Semiconductor, Inc."#

    /// Verifone Systems PTe Ltd. Taiwan Branch (`512`)
    companyIdentifiers[512] = #"Verifone Systems PTe Ltd. Taiwan Branch"#

    /// AR Timing (`513`)
    companyIdentifiers[513] = #"AR Timing"#

    /// Rigado LLC (`514`)
    companyIdentifiers[514] = #"Rigado LLC"#

    /// Kemppi Oy (`515`)
    companyIdentifiers[515] = #"Kemppi Oy"#

    /// Tapcentive Inc. (`516`)
    companyIdentifiers[516] = #"Tapcentive Inc."#

    /// Smartbotics Inc. (`517`)
    companyIdentifiers[517] = #"Smartbotics Inc."#

    /// Otter Products, LLC (`518`)
    companyIdentifiers[518] = #"Otter Products, LLC"#

    /// STEMP Inc. (`519`)
    companyIdentifiers[519] = #"STEMP Inc."#

    /// LumiGeek LLC (`520`)
    companyIdentifiers[520] = #"LumiGeek LLC"#

    /// InvisionHeart Inc. (`521`)
    companyIdentifiers[521] = #"InvisionHeart Inc."#

    /// Macnica Inc. (`522`)
    companyIdentifiers[522] = #"Macnica Inc."#

    /// Jaguar Land Rover Limited (`523`)
    companyIdentifiers[523] = #"Jaguar Land Rover Limited"#

    /// CoroWare Technologies, Inc (`524`)
    companyIdentifiers[524] = #"CoroWare Technologies, Inc"#

    /// Simplo Technology Co., LTD (`525`)
    companyIdentifiers[525] = #"Simplo Technology Co., LTD"#

    /// Omron Healthcare Co., LTD (`526`)
    companyIdentifiers[526] = #"Omron Healthcare Co., LTD"#

    /// Comodule GMBH (`527`)
    companyIdentifiers[527] = #"Comodule GMBH"#

    /// ikeGPS (`528`)
    companyIdentifiers[528] = #"ikeGPS"#

    /// Telink Semiconductor Co. Ltd (`529`)
    companyIdentifiers[529] = #"Telink Semiconductor Co. Ltd"#

    /// Interplan Co., Ltd (`530`)
    companyIdentifiers[530] = #"Interplan Co., Ltd"#

    /// Wyler AG (`531`)
    companyIdentifiers[531] = #"Wyler AG"#

    /// IK Multimedia Production srl (`532`)
    companyIdentifiers[532] = #"IK Multimedia Production srl"#

    /// Lukoton Experience Oy (`533`)
    companyIdentifiers[533] = #"Lukoton Experience Oy"#

    /// MTI Ltd (`534`)
    companyIdentifiers[534] = #"MTI Ltd"#

    /// Tech4home, Lda (`535`)
    companyIdentifiers[535] = #"Tech4home, Lda"#

    /// Hiotech AB (`536`)
    companyIdentifiers[536] = #"Hiotech AB"#

    /// DOTT Limited (`537`)
    companyIdentifiers[537] = #"DOTT Limited"#

    /// Blue Speck Labs, LLC (`538`)
    companyIdentifiers[538] = #"Blue Speck Labs, LLC"#

    /// Cisco Systems Inc (`539`)
    companyIdentifiers[539] = #"Cisco Systems Inc"#

    /// Mobicomm Inc (`540`)
    companyIdentifiers[540] = #"Mobicomm Inc"#

    /// Edamic (`541`)
    companyIdentifiers[541] = #"Edamic"#

    /// Goodnet Ltd (`542`)
    companyIdentifiers[542] = #"Goodnet Ltd"#

    /// Luster Leaf Products Inc (`543`)
    companyIdentifiers[543] = #"Luster Leaf Products Inc"#

    /// Manus Machina BV (`544`)
    companyIdentifiers[544] = #"Manus Machina BV"#

    /// Mobiquity Networks Inc (`545`)
    companyIdentifiers[545] = #"Mobiquity Networks Inc"#

    /// Praxis Dynamics (`546`)
    companyIdentifiers[546] = #"Praxis Dynamics"#

    /// Philip Morris Products S.A. (`547`)
    companyIdentifiers[547] = #"Philip Morris Products S.A."#

    /// Comarch SA (`548`)
    companyIdentifiers[548] = #"Comarch SA"#

    /// Nestlé Nespresso S.A. (`549`)
    companyIdentifiers[549] = #"Nestlé Nespresso S.A."#

    /// Merlinia A/S (`550`)
    companyIdentifiers[550] = #"Merlinia A/S"#

    /// LifeBEAM Technologies (`551`)
    companyIdentifiers[551] = #"LifeBEAM Technologies"#

    /// Twocanoes Labs, LLC (`552`)
    companyIdentifiers[552] = #"Twocanoes Labs, LLC"#

    /// Muoverti Limited (`553`)
    companyIdentifiers[553] = #"Muoverti Limited"#

    /// Stamer Musikanlagen GMBH (`554`)
    companyIdentifiers[554] = #"Stamer Musikanlagen GMBH"#

    /// Tesla Motors (`555`)
    companyIdentifiers[555] = #"Tesla Motors"#

    /// Pharynks Corporation (`556`)
    companyIdentifiers[556] = #"Pharynks Corporation"#

    /// Lupine (`557`)
    companyIdentifiers[557] = #"Lupine"#

    /// Siemens AG (`558`)
    companyIdentifiers[558] = #"Siemens AG"#

    /// Huami (Shanghai) Culture Communication CO., LTD (`559`)
    companyIdentifiers[559] = #"Huami (Shanghai) Culture Communication CO., LTD"#

    /// Foster Electric Company, Ltd (`560`)
    companyIdentifiers[560] = #"Foster Electric Company, Ltd"#

    /// ETA SA (`561`)
    companyIdentifiers[561] = #"ETA SA"#

    /// x-Senso Solutions Kft (`562`)
    companyIdentifiers[562] = #"x-Senso Solutions Kft"#

    /// Shenzhen SuLong Communication Ltd (`563`)
    companyIdentifiers[563] = #"Shenzhen SuLong Communication Ltd"#

    /// FengFan (BeiJing) Technology Co, Ltd (`564`)
    companyIdentifiers[564] = #"FengFan (BeiJing) Technology Co, Ltd"#

    /// Qrio Inc (`565`)
    companyIdentifiers[565] = #"Qrio Inc"#

    /// Pitpatpet Ltd (`566`)
    companyIdentifiers[566] = #"Pitpatpet Ltd"#

    /// MSHeli s.r.l. (`567`)
    companyIdentifiers[567] = #"MSHeli s.r.l."#

    /// Trakm8 Ltd (`568`)
    companyIdentifiers[568] = #"Trakm8 Ltd"#

    /// JIN CO, Ltd (`569`)
    companyIdentifiers[569] = #"JIN CO, Ltd"#

    /// Alatech Technology (`570`)
    companyIdentifiers[570] = #"Alatech Technology"#

    /// Beijing CarePulse Electronic Technology Co, Ltd (`571`)
    companyIdentifiers[571] = #"Beijing CarePulse Electronic Technology Co, Ltd"#

    /// Awarepoint (`572`)
    companyIdentifiers[572] = #"Awarepoint"#

    /// ViCentra B.V. (`573`)
    companyIdentifiers[573] = #"ViCentra B.V."#

    /// Raven Industries (`574`)
    companyIdentifiers[574] = #"Raven Industries"#

    /// WaveWare Technologies (`575`)
    companyIdentifiers[575] = #"WaveWare Technologies"#

    /// Argenox Technologies (`576`)
    companyIdentifiers[576] = #"Argenox Technologies"#

    /// Bragi GmbH (`577`)
    companyIdentifiers[577] = #"Bragi GmbH"#

    /// 16Lab Inc (`578`)
    companyIdentifiers[578] = #"16Lab Inc"#

    /// Masimo Corp (`579`)
    companyIdentifiers[579] = #"Masimo Corp"#

    /// Iotera Inc. (`580`)
    companyIdentifiers[580] = #"Iotera Inc."#

    /// Endress+Hauser (`581`)
    companyIdentifiers[581] = #"Endress+Hauser"#

    /// ACKme Networks, Inc. (`582`)
    companyIdentifiers[582] = #"ACKme Networks, Inc."#

    /// FiftyThree Inc. (`583`)
    companyIdentifiers[583] = #"FiftyThree Inc."#

    /// Parker Hannifin Corp (`584`)
    companyIdentifiers[584] = #"Parker Hannifin Corp"#

    /// Transcranial Ltd (`585`)
    companyIdentifiers[585] = #"Transcranial Ltd"#

    /// Uwatec AG (`586`)
    companyIdentifiers[586] = #"Uwatec AG"#

    /// Orlan LLC (`587`)
    companyIdentifiers[587] = #"Orlan LLC"#

    /// Blue Clover Devices (`588`)
    companyIdentifiers[588] = #"Blue Clover Devices"#

    /// M-Way Solutions GmbH (`589`)
    companyIdentifiers[589] = #"M-Way Solutions GmbH"#

    /// Microtronics Engineering GmbH (`590`)
    companyIdentifiers[590] = #"Microtronics Engineering GmbH"#

    /// Schneider Schreibgeräte GmbH (`591`)
    companyIdentifiers[591] = #"Schneider Schreibgeräte GmbH"#

    /// Sapphire Circuits LLC (`592`)
    companyIdentifiers[592] = #"Sapphire Circuits LLC"#

    /// Lumo Bodytech Inc. (`593`)
    companyIdentifiers[593] = #"Lumo Bodytech Inc."#

    /// UKC Technosolution (`594`)
    companyIdentifiers[594] = #"UKC Technosolution"#

    /// Xicato Inc. (`595`)
    companyIdentifiers[595] = #"Xicato Inc."#

    /// Playbrush (`596`)
    companyIdentifiers[596] = #"Playbrush"#

    /// Dai Nippon Printing Co., Ltd. (`597`)
    companyIdentifiers[597] = #"Dai Nippon Printing Co., Ltd."#

    /// G24 Power Limited (`598`)
    companyIdentifiers[598] = #"G24 Power Limited"#

    /// AdBabble Local Commerce Inc. (`599`)
    companyIdentifiers[599] = #"AdBabble Local Commerce Inc."#

    /// Devialet SA (`600`)
    companyIdentifiers[600] = #"Devialet SA"#

    /// ALTYOR (`601`)
    companyIdentifiers[601] = #"ALTYOR"#

    /// University of Applied Sciences Valais/Haute Ecole Valaisanne (`602`)
    companyIdentifiers[602] = #"University of Applied Sciences Valais/Haute Ecole Valaisanne"#

    /// Five Interactive, LLC dba Zendo (`603`)
    companyIdentifiers[603] = #"Five Interactive, LLC dba Zendo"#

    /// NetEase (Hangzhou) Network co.Ltd. (`604`)
    companyIdentifiers[604] = #"NetEase (Hangzhou) Network co.Ltd."#

    /// Lexmark International Inc. (`605`)
    companyIdentifiers[605] = #"Lexmark International Inc."#

    /// Fluke Corporation (`606`)
    companyIdentifiers[606] = #"Fluke Corporation"#

    /// Yardarm Technologies (`607`)
    companyIdentifiers[607] = #"Yardarm Technologies"#

    /// SensaRx (`608`)
    companyIdentifiers[608] = #"SensaRx"#

    /// SECVRE GmbH (`609`)
    companyIdentifiers[609] = #"SECVRE GmbH"#

    /// Glacial Ridge Technologies (`610`)
    companyIdentifiers[610] = #"Glacial Ridge Technologies"#

    /// Identiv, Inc. (`611`)
    companyIdentifiers[611] = #"Identiv, Inc."#

    /// DDS, Inc. (`612`)
    companyIdentifiers[612] = #"DDS, Inc."#

    /// SMK Corporation (`613`)
    companyIdentifiers[613] = #"SMK Corporation"#

    /// Schawbel Technologies LLC (`614`)
    companyIdentifiers[614] = #"Schawbel Technologies LLC"#

    /// XMI Systems SA (`615`)
    companyIdentifiers[615] = #"XMI Systems SA"#

    /// Cerevo (`616`)
    companyIdentifiers[616] = #"Cerevo"#

    /// Torrox GmbH & Co KG (`617`)
    companyIdentifiers[617] = #"Torrox GmbH & Co KG"#

    /// Gemalto (`618`)
    companyIdentifiers[618] = #"Gemalto"#

    /// DEKA Research & Development Corp. (`619`)
    companyIdentifiers[619] = #"DEKA Research & Development Corp."#

    /// Domster Tadeusz Szydlowski (`620`)
    companyIdentifiers[620] = #"Domster Tadeusz Szydlowski"#

    /// Technogym SPA (`621`)
    companyIdentifiers[621] = #"Technogym SPA"#

    /// FLEURBAEY BVBA (`622`)
    companyIdentifiers[622] = #"FLEURBAEY BVBA"#

    /// Aptcode Solutions (`623`)
    companyIdentifiers[623] = #"Aptcode Solutions"#

    /// LSI ADL Technology (`624`)
    companyIdentifiers[624] = #"LSI ADL Technology"#

    /// Animas Corp (`625`)
    companyIdentifiers[625] = #"Animas Corp"#

    /// Alps Electric Co., Ltd. (`626`)
    companyIdentifiers[626] = #"Alps Electric Co., Ltd."#

    /// OCEASOFT (`627`)
    companyIdentifiers[627] = #"OCEASOFT"#

    /// Motsai Research (`628`)
    companyIdentifiers[628] = #"Motsai Research"#

    /// Geotab (`629`)
    companyIdentifiers[629] = #"Geotab"#

    /// E.G.O. Elektro-Gerätebau GmbH (`630`)
    companyIdentifiers[630] = #"E.G.O. Elektro-Gerätebau GmbH"#

    /// bewhere inc (`631`)
    companyIdentifiers[631] = #"bewhere inc"#

    /// Johnson Outdoors Inc (`632`)
    companyIdentifiers[632] = #"Johnson Outdoors Inc"#

    /// steute Schaltgerate GmbH & Co. KG (`633`)
    companyIdentifiers[633] = #"steute Schaltgerate GmbH & Co. KG"#

    /// Ekomini inc. (`634`)
    companyIdentifiers[634] = #"Ekomini inc."#

    /// DEFA AS (`635`)
    companyIdentifiers[635] = #"DEFA AS"#

    /// Aseptika Ltd (`636`)
    companyIdentifiers[636] = #"Aseptika Ltd"#

    /// HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 ) (`637`)
    companyIdentifiers[637] = #"HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 )"#

    /// HabitAware, LLC (`638`)
    companyIdentifiers[638] = #"HabitAware, LLC"#

    /// ruwido austria gmbh (`639`)
    companyIdentifiers[639] = #"ruwido austria gmbh"#

    /// ITEC corporation (`640`)
    companyIdentifiers[640] = #"ITEC corporation"#

    /// StoneL (`641`)
    companyIdentifiers[641] = #"StoneL"#

    /// Sonova AG (`642`)
    companyIdentifiers[642] = #"Sonova AG"#

    /// Maven Machines, Inc. (`643`)
    companyIdentifiers[643] = #"Maven Machines, Inc."#

    /// Synapse Electronics (`644`)
    companyIdentifiers[644] = #"Synapse Electronics"#

    /// Standard Innovation Inc. (`645`)
    companyIdentifiers[645] = #"Standard Innovation Inc."#

    /// RF Code, Inc. (`646`)
    companyIdentifiers[646] = #"RF Code, Inc."#

    /// Wally Ventures S.L. (`647`)
    companyIdentifiers[647] = #"Wally Ventures S.L."#

    /// Willowbank Electronics Ltd (`648`)
    companyIdentifiers[648] = #"Willowbank Electronics Ltd"#

    /// SK Telecom (`649`)
    companyIdentifiers[649] = #"SK Telecom"#

    /// Jetro AS (`650`)
    companyIdentifiers[650] = #"Jetro AS"#

    /// Code Gears LTD (`651`)
    companyIdentifiers[651] = #"Code Gears LTD"#

    /// NANOLINK APS (`652`)
    companyIdentifiers[652] = #"NANOLINK APS"#

    /// IF, LLC (`653`)
    companyIdentifiers[653] = #"IF, LLC"#

    /// RF Digital Corp (`654`)
    companyIdentifiers[654] = #"RF Digital Corp"#

    /// Church & Dwight Co., Inc (`655`)
    companyIdentifiers[655] = #"Church & Dwight Co., Inc"#

    /// Multibit Oy (`656`)
    companyIdentifiers[656] = #"Multibit Oy"#

    /// CliniCloud Inc (`657`)
    companyIdentifiers[657] = #"CliniCloud Inc"#

    /// SwiftSensors (`658`)
    companyIdentifiers[658] = #"SwiftSensors"#

    /// Blue Bite (`659`)
    companyIdentifiers[659] = #"Blue Bite"#

    /// ELIAS GmbH (`660`)
    companyIdentifiers[660] = #"ELIAS GmbH"#

    /// Sivantos GmbH (`661`)
    companyIdentifiers[661] = #"Sivantos GmbH"#

    /// Petzl (`662`)
    companyIdentifiers[662] = #"Petzl"#

    /// storm power ltd (`663`)
    companyIdentifiers[663] = #"storm power ltd"#

    /// EISST Ltd (`664`)
    companyIdentifiers[664] = #"EISST Ltd"#

    /// Inexess Technology Simma KG (`665`)
    companyIdentifiers[665] = #"Inexess Technology Simma KG"#

    /// Currant, Inc. (`666`)
    companyIdentifiers[666] = #"Currant, Inc."#

    /// C2 Development, Inc. (`667`)
    companyIdentifiers[667] = #"C2 Development, Inc."#

    /// Blue Sky Scientific, LLC (`668`)
    companyIdentifiers[668] = #"Blue Sky Scientific, LLC"#

    /// ALOTTAZS LABS, LLC (`669`)
    companyIdentifiers[669] = #"ALOTTAZS LABS, LLC"#

    /// Kupson spol. s r.o. (`670`)
    companyIdentifiers[670] = #"Kupson spol. s r.o."#

    /// Areus Engineering GmbH (`671`)
    companyIdentifiers[671] = #"Areus Engineering GmbH"#

    /// Impossible Camera GmbH (`672`)
    companyIdentifiers[672] = #"Impossible Camera GmbH"#

    /// InventureTrack Systems (`673`)
    companyIdentifiers[673] = #"InventureTrack Systems"#

    /// LockedUp (`674`)
    companyIdentifiers[674] = #"LockedUp"#

    /// Itude (`675`)
    companyIdentifiers[675] = #"Itude"#

    /// Pacific Lock Company (`676`)
    companyIdentifiers[676] = #"Pacific Lock Company"#

    /// Tendyron Corporation ( 天地融科技股份有限公司 ) (`677`)
    companyIdentifiers[677] = #"Tendyron Corporation ( 天地融科技股份有限公司 )"#

    /// Robert Bosch GmbH (`678`)
    companyIdentifiers[678] = #"Robert Bosch GmbH"#

    /// Illuxtron international B.V. (`679`)
    companyIdentifiers[679] = #"Illuxtron international B.V."#

    /// miSport Ltd. (`680`)
    companyIdentifiers[680] = #"miSport Ltd."#

    /// Chargelib (`681`)
    companyIdentifiers[681] = #"Chargelib"#

    /// Doppler Lab (`682`)
    companyIdentifiers[682] = #"Doppler Lab"#

    /// BBPOS Limited (`683`)
    companyIdentifiers[683] = #"BBPOS Limited"#

    /// RTB Elektronik GmbH & Co. KG (`684`)
    companyIdentifiers[684] = #"RTB Elektronik GmbH & Co. KG"#

    /// Rx Networks, Inc. (`685`)
    companyIdentifiers[685] = #"Rx Networks, Inc."#

    /// WeatherFlow, Inc. (`686`)
    companyIdentifiers[686] = #"WeatherFlow, Inc."#

    /// Technicolor USA Inc. (`687`)
    companyIdentifiers[687] = #"Technicolor USA Inc."#

    /// Bestechnic(Shanghai),Ltd (`688`)
    companyIdentifiers[688] = #"Bestechnic(Shanghai),Ltd"#

    /// Raden Inc (`689`)
    companyIdentifiers[689] = #"Raden Inc"#

    /// JouZen Oy (`690`)
    companyIdentifiers[690] = #"JouZen Oy"#

    /// CLABER S.P.A. (`691`)
    companyIdentifiers[691] = #"CLABER S.P.A."#

    /// Hyginex, Inc. (`692`)
    companyIdentifiers[692] = #"Hyginex, Inc."#

    /// HANSHIN ELECTRIC RAILWAY CO.,LTD. (`693`)
    companyIdentifiers[693] = #"HANSHIN ELECTRIC RAILWAY CO.,LTD."#

    /// Schneider Electric (`694`)
    companyIdentifiers[694] = #"Schneider Electric"#

    /// Oort Technologies LLC (`695`)
    companyIdentifiers[695] = #"Oort Technologies LLC"#

    /// Chrono Therapeutics (`696`)
    companyIdentifiers[696] = #"Chrono Therapeutics"#

    /// Rinnai Corporation (`697`)
    companyIdentifiers[697] = #"Rinnai Corporation"#

    /// Swissprime Technologies AG (`698`)
    companyIdentifiers[698] = #"Swissprime Technologies AG"#

    /// Koha.,Co.Ltd (`699`)
    companyIdentifiers[699] = #"Koha.,Co.Ltd"#

    /// Genevac Ltd (`700`)
    companyIdentifiers[700] = #"Genevac Ltd"#

    /// Chemtronics (`701`)
    companyIdentifiers[701] = #"Chemtronics"#

    /// Seguro Technology Sp. z o.o. (`702`)
    companyIdentifiers[702] = #"Seguro Technology Sp. z o.o."#

    /// Redbird Flight Simulations (`703`)
    companyIdentifiers[703] = #"Redbird Flight Simulations"#

    /// Dash Robotics (`704`)
    companyIdentifiers[704] = #"Dash Robotics"#

    /// LINE Corporation (`705`)
    companyIdentifiers[705] = #"LINE Corporation"#

    /// Guillemot Corporation (`706`)
    companyIdentifiers[706] = #"Guillemot Corporation"#

    /// Techtronic Power Tools Technology Limited (`707`)
    companyIdentifiers[707] = #"Techtronic Power Tools Technology Limited"#

    /// Wilson Sporting Goods (`708`)
    companyIdentifiers[708] = #"Wilson Sporting Goods"#

    /// Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） ) (`709`)
    companyIdentifiers[709] = #"Lenovo (Singapore) Pte Ltd. ( 联想（新加坡） )"#

    /// Ayatan Sensors (`710`)
    companyIdentifiers[710] = #"Ayatan Sensors"#

    /// Electronics Tomorrow Limited (`711`)
    companyIdentifiers[711] = #"Electronics Tomorrow Limited"#

    /// VASCO Data Security International, Inc. (`712`)
    companyIdentifiers[712] = #"VASCO Data Security International, Inc."#

    /// PayRange Inc. (`713`)
    companyIdentifiers[713] = #"PayRange Inc."#

    /// ABOV Semiconductor (`714`)
    companyIdentifiers[714] = #"ABOV Semiconductor"#

    /// AINA-Wireless Inc. (`715`)
    companyIdentifiers[715] = #"AINA-Wireless Inc."#

    /// Eijkelkamp Soil & Water (`716`)
    companyIdentifiers[716] = #"Eijkelkamp Soil & Water"#

    /// BMA ergonomics b.v. (`717`)
    companyIdentifiers[717] = #"BMA ergonomics b.v."#

    /// Teva Branded Pharmaceutical Products R&D, Inc. (`718`)
    companyIdentifiers[718] = #"Teva Branded Pharmaceutical Products R&D, Inc."#

    /// Anima (`719`)
    companyIdentifiers[719] = #"Anima"#

    /// 3M (`720`)
    companyIdentifiers[720] = #"3M"#

    /// Empatica Srl (`721`)
    companyIdentifiers[721] = #"Empatica Srl"#

    /// Afero, Inc. (`722`)
    companyIdentifiers[722] = #"Afero, Inc."#

    /// Powercast Corporation (`723`)
    companyIdentifiers[723] = #"Powercast Corporation"#

    /// Secuyou ApS (`724`)
    companyIdentifiers[724] = #"Secuyou ApS"#

    /// OMRON Corporation (`725`)
    companyIdentifiers[725] = #"OMRON Corporation"#

    /// Send Solutions (`726`)
    companyIdentifiers[726] = #"Send Solutions"#

    /// NIPPON SYSTEMWARE CO.,LTD. (`727`)
    companyIdentifiers[727] = #"NIPPON SYSTEMWARE CO.,LTD."#

    /// Neosfar (`728`)
    companyIdentifiers[728] = #"Neosfar"#

    /// Fliegl Agrartechnik GmbH (`729`)
    companyIdentifiers[729] = #"Fliegl Agrartechnik GmbH"#

    /// Gilvader (`730`)
    companyIdentifiers[730] = #"Gilvader"#

    /// Digi International Inc (R) (`731`)
    companyIdentifiers[731] = #"Digi International Inc (R)"#

    /// DeWalch Technologies, Inc. (`732`)
    companyIdentifiers[732] = #"DeWalch Technologies, Inc."#

    /// Flint Rehabilitation Devices, LLC (`733`)
    companyIdentifiers[733] = #"Flint Rehabilitation Devices, LLC"#

    /// Samsung SDS Co., Ltd. (`734`)
    companyIdentifiers[734] = #"Samsung SDS Co., Ltd."#

    /// Blur Product Development (`735`)
    companyIdentifiers[735] = #"Blur Product Development"#

    /// University of Michigan (`736`)
    companyIdentifiers[736] = #"University of Michigan"#

    /// Victron Energy BV (`737`)
    companyIdentifiers[737] = #"Victron Energy BV"#

    /// NTT docomo (`738`)
    companyIdentifiers[738] = #"NTT docomo"#

    /// Carmanah Technologies Corp. (`739`)
    companyIdentifiers[739] = #"Carmanah Technologies Corp."#

    /// Bytestorm Ltd. (`740`)
    companyIdentifiers[740] = #"Bytestorm Ltd."#

    /// Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 ) (`741`)
    companyIdentifiers[741] = #"Espressif Incorporated ( 乐鑫信息科技(上海)有限公司 )"#

    /// Unwire (`742`)
    companyIdentifiers[742] = #"Unwire"#

    /// Connected Yard, Inc. (`743`)
    companyIdentifiers[743] = #"Connected Yard, Inc."#

    /// American Music Environments (`744`)
    companyIdentifiers[744] = #"American Music Environments"#

    /// Sensogram Technologies, Inc. (`745`)
    companyIdentifiers[745] = #"Sensogram Technologies, Inc."#

    /// Fujitsu Limited (`746`)
    companyIdentifiers[746] = #"Fujitsu Limited"#

    /// Ardic Technology (`747`)
    companyIdentifiers[747] = #"Ardic Technology"#

    /// Delta Systems, Inc (`748`)
    companyIdentifiers[748] = #"Delta Systems, Inc"#

    /// HTC Corporation (`749`)
    companyIdentifiers[749] = #"HTC Corporation"#

    /// Citizen Holdings Co., Ltd. (`750`)
    companyIdentifiers[750] = #"Citizen Holdings Co., Ltd."#

    /// SMART-INNOVATION.inc (`751`)
    companyIdentifiers[751] = #"SMART-INNOVATION.inc"#

    /// Blackrat Software (`752`)
    companyIdentifiers[752] = #"Blackrat Software"#

    /// The Idea Cave, LLC (`753`)
    companyIdentifiers[753] = #"The Idea Cave, LLC"#

    /// GoPro, Inc. (`754`)
    companyIdentifiers[754] = #"GoPro, Inc."#

    /// AuthAir, Inc (`755`)
    companyIdentifiers[755] = #"AuthAir, Inc"#

    /// Vensi, Inc. (`756`)
    companyIdentifiers[756] = #"Vensi, Inc."#

    /// Indagem Tech LLC (`757`)
    companyIdentifiers[757] = #"Indagem Tech LLC"#

    /// Intemo Technologies (`758`)
    companyIdentifiers[758] = #"Intemo Technologies"#

    /// DreamVisions co., Ltd. (`759`)
    companyIdentifiers[759] = #"DreamVisions co., Ltd."#

    /// Runteq Oy Ltd (`760`)
    companyIdentifiers[760] = #"Runteq Oy Ltd"#

    /// IMAGINATION TECHNOLOGIES LTD (`761`)
    companyIdentifiers[761] = #"IMAGINATION TECHNOLOGIES LTD"#

    /// CoSTAR Technologies (`762`)
    companyIdentifiers[762] = #"CoSTAR Technologies"#

    /// Clarius Mobile Health Corp. (`763`)
    companyIdentifiers[763] = #"Clarius Mobile Health Corp."#

    /// Shanghai Frequen Microelectronics Co., Ltd. (`764`)
    companyIdentifiers[764] = #"Shanghai Frequen Microelectronics Co., Ltd."#

    /// Uwanna, Inc. (`765`)
    companyIdentifiers[765] = #"Uwanna, Inc."#

    /// Lierda Science & Technology Group Co., Ltd. (`766`)
    companyIdentifiers[766] = #"Lierda Science & Technology Group Co., Ltd."#

    /// Silicon Laboratories (`767`)
    companyIdentifiers[767] = #"Silicon Laboratories"#

    /// World Moto Inc. (`768`)
    companyIdentifiers[768] = #"World Moto Inc."#

    /// Giatec Scientific Inc. (`769`)
    companyIdentifiers[769] = #"Giatec Scientific Inc."#

    /// Loop Devices, Inc (`770`)
    companyIdentifiers[770] = #"Loop Devices, Inc"#

    /// IACA electronique (`771`)
    companyIdentifiers[771] = #"IACA electronique"#

    /// Martians Inc (`772`)
    companyIdentifiers[772] = #"Martians Inc"#

    /// Swipp ApS (`773`)
    companyIdentifiers[773] = #"Swipp ApS"#

    /// Life Laboratory Inc. (`774`)
    companyIdentifiers[774] = #"Life Laboratory Inc."#

    /// FUJI INDUSTRIAL CO.,LTD. (`775`)
    companyIdentifiers[775] = #"FUJI INDUSTRIAL CO.,LTD."#

    /// Surefire, LLC (`776`)
    companyIdentifiers[776] = #"Surefire, LLC"#

    /// Dolby Labs (`777`)
    companyIdentifiers[777] = #"Dolby Labs"#

    /// Ellisys (`778`)
    companyIdentifiers[778] = #"Ellisys"#

    /// Magnitude Lighting Converters (`779`)
    companyIdentifiers[779] = #"Magnitude Lighting Converters"#

    /// Hilti AG (`780`)
    companyIdentifiers[780] = #"Hilti AG"#

    /// Devdata S.r.l. (`781`)
    companyIdentifiers[781] = #"Devdata S.r.l."#

    /// Deviceworx (`782`)
    companyIdentifiers[782] = #"Deviceworx"#

    /// Shortcut Labs (`783`)
    companyIdentifiers[783] = #"Shortcut Labs"#

    /// SGL Italia S.r.l. (`784`)
    companyIdentifiers[784] = #"SGL Italia S.r.l."#

    /// PEEQ DATA (`785`)
    companyIdentifiers[785] = #"PEEQ DATA"#

    /// Ducere Technologies Pvt Ltd (`786`)
    companyIdentifiers[786] = #"Ducere Technologies Pvt Ltd"#

    /// DiveNav, Inc. (`787`)
    companyIdentifiers[787] = #"DiveNav, Inc."#

    /// RIIG AI Sp. z o.o. (`788`)
    companyIdentifiers[788] = #"RIIG AI Sp. z o.o."#

    /// Thermo Fisher Scientific (`789`)
    companyIdentifiers[789] = #"Thermo Fisher Scientific"#

    /// AG Measurematics Pvt. Ltd. (`790`)
    companyIdentifiers[790] = #"AG Measurematics Pvt. Ltd."#

    /// CHUO Electronics CO., LTD. (`791`)
    companyIdentifiers[791] = #"CHUO Electronics CO., LTD."#

    /// Aspenta International (`792`)
    companyIdentifiers[792] = #"Aspenta International"#

    /// Eugster Frismag AG (`793`)
    companyIdentifiers[793] = #"Eugster Frismag AG"#

    /// Amber wireless GmbH (`794`)
    companyIdentifiers[794] = #"Amber wireless GmbH"#

    /// HQ Inc (`795`)
    companyIdentifiers[795] = #"HQ Inc"#

    /// Lab Sensor Solutions (`796`)
    companyIdentifiers[796] = #"Lab Sensor Solutions"#

    /// Enterlab ApS (`797`)
    companyIdentifiers[797] = #"Enterlab ApS"#

    /// Eyefi, Inc. (`798`)
    companyIdentifiers[798] = #"Eyefi, Inc."#

    /// MetaSystem S.p.A (`799`)
    companyIdentifiers[799] = #"MetaSystem S.p.A"#

    /// SONO ELECTRONICS. CO., LTD (`800`)
    companyIdentifiers[800] = #"SONO ELECTRONICS. CO., LTD"#

    /// Jewelbots (`801`)
    companyIdentifiers[801] = #"Jewelbots"#

    /// Compumedics Limited (`802`)
    companyIdentifiers[802] = #"Compumedics Limited"#

    /// Rotor Bike Components (`803`)
    companyIdentifiers[803] = #"Rotor Bike Components"#

    /// Astro, Inc. (`804`)
    companyIdentifiers[804] = #"Astro, Inc."#

    /// Amotus Solutions (`805`)
    companyIdentifiers[805] = #"Amotus Solutions"#

    /// Healthwear Technologies (Changzhou)Ltd (`806`)
    companyIdentifiers[806] = #"Healthwear Technologies (Changzhou)Ltd"#

    /// Essex Electronics (`807`)
    companyIdentifiers[807] = #"Essex Electronics"#

    /// Grundfos A/S (`808`)
    companyIdentifiers[808] = #"Grundfos A/S"#

    /// Eargo, Inc. (`809`)
    companyIdentifiers[809] = #"Eargo, Inc."#

    /// Electronic Design Lab (`810`)
    companyIdentifiers[810] = #"Electronic Design Lab"#

    /// ESYLUX (`811`)
    companyIdentifiers[811] = #"ESYLUX"#

    /// NIPPON SMT.CO.,Ltd (`812`)
    companyIdentifiers[812] = #"NIPPON SMT.CO.,Ltd"#

    /// BM innovations GmbH (`813`)
    companyIdentifiers[813] = #"BM innovations GmbH"#

    /// indoormap (`814`)
    companyIdentifiers[814] = #"indoormap"#

    /// OttoQ Inc (`815`)
    companyIdentifiers[815] = #"OttoQ Inc"#

    /// North Pole Engineering (`816`)
    companyIdentifiers[816] = #"North Pole Engineering"#

    /// 3flares Technologies Inc. (`817`)
    companyIdentifiers[817] = #"3flares Technologies Inc."#

    /// Electrocompaniet A.S. (`818`)
    companyIdentifiers[818] = #"Electrocompaniet A.S."#

    /// Mul-T-Lock (`819`)
    companyIdentifiers[819] = #"Mul-T-Lock"#

    /// Corentium AS (`820`)
    companyIdentifiers[820] = #"Corentium AS"#

    /// Enlighted Inc (`821`)
    companyIdentifiers[821] = #"Enlighted Inc"#

    /// GISTIC (`822`)
    companyIdentifiers[822] = #"GISTIC"#

    /// AJP2 Holdings, LLC (`823`)
    companyIdentifiers[823] = #"AJP2 Holdings, LLC"#

    /// COBI GmbH (`824`)
    companyIdentifiers[824] = #"COBI GmbH"#

    /// Blue Sky Scientific, LLC (`825`)
    companyIdentifiers[825] = #"Blue Sky Scientific, LLC"#

    /// Appception, Inc. (`826`)
    companyIdentifiers[826] = #"Appception, Inc."#

    /// Courtney Thorne Limited (`827`)
    companyIdentifiers[827] = #"Courtney Thorne Limited"#

    /// Virtuosys (`828`)
    companyIdentifiers[828] = #"Virtuosys"#

    /// TPV Technology Limited (`829`)
    companyIdentifiers[829] = #"TPV Technology Limited"#

    /// Monitra SA (`830`)
    companyIdentifiers[830] = #"Monitra SA"#

    /// Automation Components, Inc. (`831`)
    companyIdentifiers[831] = #"Automation Components, Inc."#

    /// Letsense s.r.l. (`832`)
    companyIdentifiers[832] = #"Letsense s.r.l."#

    /// Etesian Technologies LLC (`833`)
    companyIdentifiers[833] = #"Etesian Technologies LLC"#

    /// GERTEC BRASIL LTDA. (`834`)
    companyIdentifiers[834] = #"GERTEC BRASIL LTDA."#

    /// Drekker Development Pty. Ltd. (`835`)
    companyIdentifiers[835] = #"Drekker Development Pty. Ltd."#

    /// Whirl Inc (`836`)
    companyIdentifiers[836] = #"Whirl Inc"#

    /// Locus Positioning (`837`)
    companyIdentifiers[837] = #"Locus Positioning"#

    /// Acuity Brands Lighting, Inc (`838`)
    companyIdentifiers[838] = #"Acuity Brands Lighting, Inc"#

    /// Prevent Biometrics (`839`)
    companyIdentifiers[839] = #"Prevent Biometrics"#

    /// Arioneo (`840`)
    companyIdentifiers[840] = #"Arioneo"#

    /// VersaMe (`841`)
    companyIdentifiers[841] = #"VersaMe"#

    /// Vaddio (`842`)
    companyIdentifiers[842] = #"Vaddio"#

    /// Libratone A/S (`843`)
    companyIdentifiers[843] = #"Libratone A/S"#

    /// HM Electronics, Inc. (`844`)
    companyIdentifiers[844] = #"HM Electronics, Inc."#

    /// TASER International, Inc. (`845`)
    companyIdentifiers[845] = #"TASER International, Inc."#

    /// Safe Trust Inc. (`846`)
    companyIdentifiers[846] = #"Safe Trust Inc."#

    /// Heartland Payment Systems (`847`)
    companyIdentifiers[847] = #"Heartland Payment Systems"#

    /// Bitstrata Systems Inc. (`848`)
    companyIdentifiers[848] = #"Bitstrata Systems Inc."#

    /// Pieps GmbH (`849`)
    companyIdentifiers[849] = #"Pieps GmbH"#

    /// iRiding(Xiamen)Technology Co.,Ltd. (`850`)
    companyIdentifiers[850] = #"iRiding(Xiamen)Technology Co.,Ltd."#

    /// Alpha Audiotronics, Inc. (`851`)
    companyIdentifiers[851] = #"Alpha Audiotronics, Inc."#

    /// TOPPAN FORMS CO.,LTD. (`852`)
    companyIdentifiers[852] = #"TOPPAN FORMS CO.,LTD."#

    /// Sigma Designs, Inc. (`853`)
    companyIdentifiers[853] = #"Sigma Designs, Inc."#

    /// Spectrum Brands, Inc. (`854`)
    companyIdentifiers[854] = #"Spectrum Brands, Inc."#

    /// Polymap Wireless (`855`)
    companyIdentifiers[855] = #"Polymap Wireless"#

    /// MagniWare Ltd. (`856`)
    companyIdentifiers[856] = #"MagniWare Ltd."#

    /// Novotec Medical GmbH (`857`)
    companyIdentifiers[857] = #"Novotec Medical GmbH"#

    /// Medicom Innovation Partner a/s (`858`)
    companyIdentifiers[858] = #"Medicom Innovation Partner a/s"#

    /// Matrix Inc. (`859`)
    companyIdentifiers[859] = #"Matrix Inc."#

    /// Eaton Corporation (`860`)
    companyIdentifiers[860] = #"Eaton Corporation"#

    /// KYS (`861`)
    companyIdentifiers[861] = #"KYS"#

    /// Naya Health, Inc. (`862`)
    companyIdentifiers[862] = #"Naya Health, Inc."#

    /// Acromag (`863`)
    companyIdentifiers[863] = #"Acromag"#

    /// Insulet Corporation (`864`)
    companyIdentifiers[864] = #"Insulet Corporation"#

    /// Wellinks Inc. (`865`)
    companyIdentifiers[865] = #"Wellinks Inc."#

    /// ON Semiconductor (`866`)
    companyIdentifiers[866] = #"ON Semiconductor"#

    /// FREELAP SA (`867`)
    companyIdentifiers[867] = #"FREELAP SA"#

    /// Favero Electronics Srl (`868`)
    companyIdentifiers[868] = #"Favero Electronics Srl"#

    /// BioMech Sensor LLC (`869`)
    companyIdentifiers[869] = #"BioMech Sensor LLC"#

    /// BOLTT Sports technologies Private limited (`870`)
    companyIdentifiers[870] = #"BOLTT Sports technologies Private limited"#

    /// Saphe International (`871`)
    companyIdentifiers[871] = #"Saphe International"#

    /// Metormote AB (`872`)
    companyIdentifiers[872] = #"Metormote AB"#

    /// littleBits (`873`)
    companyIdentifiers[873] = #"littleBits"#

    /// SetPoint Medical (`874`)
    companyIdentifiers[874] = #"SetPoint Medical"#

    /// BRControls Products BV (`875`)
    companyIdentifiers[875] = #"BRControls Products BV"#

    /// Zipcar (`876`)
    companyIdentifiers[876] = #"Zipcar"#

    /// AirBolt Pty Ltd (`877`)
    companyIdentifiers[877] = #"AirBolt Pty Ltd"#

    /// KeepTruckin Inc (`878`)
    companyIdentifiers[878] = #"KeepTruckin Inc"#

    /// Motiv, Inc. (`879`)
    companyIdentifiers[879] = #"Motiv, Inc."#

    /// Wazombi Labs OÜ (`880`)
    companyIdentifiers[880] = #"Wazombi Labs OÜ"#

    /// ORBCOMM (`881`)
    companyIdentifiers[881] = #"ORBCOMM"#

    /// Nixie Labs, Inc. (`882`)
    companyIdentifiers[882] = #"Nixie Labs, Inc."#

    /// AppNearMe Ltd (`883`)
    companyIdentifiers[883] = #"AppNearMe Ltd"#

    /// Holman Industries (`884`)
    companyIdentifiers[884] = #"Holman Industries"#

    /// Expain AS (`885`)
    companyIdentifiers[885] = #"Expain AS"#

    /// Electronic Temperature Instruments Ltd (`886`)
    companyIdentifiers[886] = #"Electronic Temperature Instruments Ltd"#

    /// Plejd AB (`887`)
    companyIdentifiers[887] = #"Plejd AB"#

    /// Propeller Health (`888`)
    companyIdentifiers[888] = #"Propeller Health"#

    /// Shenzhen iMCO Electronic Technology Co.,Ltd (`889`)
    companyIdentifiers[889] = #"Shenzhen iMCO Electronic Technology Co.,Ltd"#

    /// Algoria (`890`)
    companyIdentifiers[890] = #"Algoria"#

    /// Apption Labs Inc. (`891`)
    companyIdentifiers[891] = #"Apption Labs Inc."#

    /// Cronologics Corporation (`892`)
    companyIdentifiers[892] = #"Cronologics Corporation"#

    /// MICRODIA Ltd. (`893`)
    companyIdentifiers[893] = #"MICRODIA Ltd."#

    /// lulabytes S.L. (`894`)
    companyIdentifiers[894] = #"lulabytes S.L."#

    /// Nestec S.A. (`895`)
    companyIdentifiers[895] = #"Nestec S.A."#

    /// LLC "MEGA-F service" (`896`)
    companyIdentifiers[896] = #"LLC "MEGA-F service""#

    /// Sharp Corporation (`897`)
    companyIdentifiers[897] = #"Sharp Corporation"#

    /// Precision Outcomes Ltd (`898`)
    companyIdentifiers[898] = #"Precision Outcomes Ltd"#

    /// Kronos Incorporated (`899`)
    companyIdentifiers[899] = #"Kronos Incorporated"#

    /// OCOSMOS Co., Ltd. (`900`)
    companyIdentifiers[900] = #"OCOSMOS Co., Ltd."#

    /// Embedded Electronic Solutions Ltd. dba e2Solutions (`901`)
    companyIdentifiers[901] = #"Embedded Electronic Solutions Ltd. dba e2Solutions"#

    /// Aterica Inc. (`902`)
    companyIdentifiers[902] = #"Aterica Inc."#

    /// BluStor PMC, Inc. (`903`)
    companyIdentifiers[903] = #"BluStor PMC, Inc."#

    /// Kapsch TrafficCom AB (`904`)
    companyIdentifiers[904] = #"Kapsch TrafficCom AB"#

    /// ActiveBlu Corporation (`905`)
    companyIdentifiers[905] = #"ActiveBlu Corporation"#

    /// Kohler Mira Limited (`906`)
    companyIdentifiers[906] = #"Kohler Mira Limited"#

    /// Noke (`907`)
    companyIdentifiers[907] = #"Noke"#

    /// Appion Inc. (`908`)
    companyIdentifiers[908] = #"Appion Inc."#

    /// Resmed Ltd (`909`)
    companyIdentifiers[909] = #"Resmed Ltd"#

    /// Crownstone B.V. (`910`)
    companyIdentifiers[910] = #"Crownstone B.V."#

    /// Xiaomi Inc. (`911`)
    companyIdentifiers[911] = #"Xiaomi Inc."#

    /// INFOTECH s.r.o. (`912`)
    companyIdentifiers[912] = #"INFOTECH s.r.o."#

    /// Thingsquare AB (`913`)
    companyIdentifiers[913] = #"Thingsquare AB"#

    /// T&D (`914`)
    companyIdentifiers[914] = #"T&D"#

    /// LAVAZZA S.p.A. (`915`)
    companyIdentifiers[915] = #"LAVAZZA S.p.A."#

    /// Netclearance Systems, Inc. (`916`)
    companyIdentifiers[916] = #"Netclearance Systems, Inc."#

    /// SDATAWAY (`917`)
    companyIdentifiers[917] = #"SDATAWAY"#

    /// BLOKS GmbH (`918`)
    companyIdentifiers[918] = #"BLOKS GmbH"#

    /// LEGO System A/S (`919`)
    companyIdentifiers[919] = #"LEGO System A/S"#

    /// Thetatronics Ltd (`920`)
    companyIdentifiers[920] = #"Thetatronics Ltd"#

    /// Nikon Corporation (`921`)
    companyIdentifiers[921] = #"Nikon Corporation"#

    /// NeST (`922`)
    companyIdentifiers[922] = #"NeST"#

    /// South Silicon Valley Microelectronics (`923`)
    companyIdentifiers[923] = #"South Silicon Valley Microelectronics"#

    /// ALE International (`924`)
    companyIdentifiers[924] = #"ALE International"#

    /// CareView Communications, Inc. (`925`)
    companyIdentifiers[925] = #"CareView Communications, Inc."#

    /// SchoolBoard Limited (`926`)
    companyIdentifiers[926] = #"SchoolBoard Limited"#

    /// Molex Corporation (`927`)
    companyIdentifiers[927] = #"Molex Corporation"#

    /// IVT Wireless Limited (`928`)
    companyIdentifiers[928] = #"IVT Wireless Limited"#

    /// Alpine Labs LLC (`929`)
    companyIdentifiers[929] = #"Alpine Labs LLC"#

    /// Candura Instruments (`930`)
    companyIdentifiers[930] = #"Candura Instruments"#

    /// SmartMovt Technology Co., Ltd (`931`)
    companyIdentifiers[931] = #"SmartMovt Technology Co., Ltd"#

    /// Token Zero Ltd (`932`)
    companyIdentifiers[932] = #"Token Zero Ltd"#

    /// ACE CAD Enterprise Co., Ltd. (ACECAD) (`933`)
    companyIdentifiers[933] = #"ACE CAD Enterprise Co., Ltd. (ACECAD)"#

    /// Medela, Inc (`934`)
    companyIdentifiers[934] = #"Medela, Inc"#

    /// AeroScout (`935`)
    companyIdentifiers[935] = #"AeroScout"#

    /// Esrille Inc. (`936`)
    companyIdentifiers[936] = #"Esrille Inc."#

    /// THINKERLY SRL (`937`)
    companyIdentifiers[937] = #"THINKERLY SRL"#

    /// Exon Sp. z o.o. (`938`)
    companyIdentifiers[938] = #"Exon Sp. z o.o."#

    /// Meizu Technology Co., Ltd. (`939`)
    companyIdentifiers[939] = #"Meizu Technology Co., Ltd."#

    /// Smablo LTD (`940`)
    companyIdentifiers[940] = #"Smablo LTD"#

    /// XiQ (`941`)
    companyIdentifiers[941] = #"XiQ"#

    /// Allswell Inc. (`942`)
    companyIdentifiers[942] = #"Allswell Inc."#

    /// Comm-N-Sense Corp DBA Verigo (`943`)
    companyIdentifiers[943] = #"Comm-N-Sense Corp DBA Verigo"#

    /// VIBRADORM GmbH (`944`)
    companyIdentifiers[944] = #"VIBRADORM GmbH"#

    /// Otodata Wireless Network Inc. (`945`)
    companyIdentifiers[945] = #"Otodata Wireless Network Inc."#

    /// Propagation Systems Limited (`946`)
    companyIdentifiers[946] = #"Propagation Systems Limited"#

    /// Midwest Instruments & Controls (`947`)
    companyIdentifiers[947] = #"Midwest Instruments & Controls"#

    /// Alpha Nodus, inc. (`948`)
    companyIdentifiers[948] = #"Alpha Nodus, inc."#

    /// petPOMM, Inc (`949`)
    companyIdentifiers[949] = #"petPOMM, Inc"#

    /// Mattel (`950`)
    companyIdentifiers[950] = #"Mattel"#

    /// Airbly Inc. (`951`)
    companyIdentifiers[951] = #"Airbly Inc."#

    /// A-Safe Limited (`952`)
    companyIdentifiers[952] = #"A-Safe Limited"#

    /// FREDERIQUE CONSTANT SA (`953`)
    companyIdentifiers[953] = #"FREDERIQUE CONSTANT SA"#

    /// Maxscend Microelectronics Company Limited (`954`)
    companyIdentifiers[954] = #"Maxscend Microelectronics Company Limited"#

    /// Abbott Diabetes Care (`955`)
    companyIdentifiers[955] = #"Abbott Diabetes Care"#

    /// ASB Bank Ltd (`956`)
    companyIdentifiers[956] = #"ASB Bank Ltd"#

    /// amadas (`957`)
    companyIdentifiers[957] = #"amadas"#

    /// Applied Science, Inc. (`958`)
    companyIdentifiers[958] = #"Applied Science, Inc."#

    /// iLumi Solutions Inc. (`959`)
    companyIdentifiers[959] = #"iLumi Solutions Inc."#

    /// Arch Systems Inc. (`960`)
    companyIdentifiers[960] = #"Arch Systems Inc."#

    /// Ember Technologies, Inc. (`961`)
    companyIdentifiers[961] = #"Ember Technologies, Inc."#

    /// Snapchat Inc (`962`)
    companyIdentifiers[962] = #"Snapchat Inc"#

    /// Casambi Technologies Oy (`963`)
    companyIdentifiers[963] = #"Casambi Technologies Oy"#

    /// Pico Technology Inc. (`964`)
    companyIdentifiers[964] = #"Pico Technology Inc."#

    /// St. Jude Medical, Inc. (`965`)
    companyIdentifiers[965] = #"St. Jude Medical, Inc."#

    /// Intricon (`966`)
    companyIdentifiers[966] = #"Intricon"#

    /// Structural Health Systems, Inc. (`967`)
    companyIdentifiers[967] = #"Structural Health Systems, Inc."#

    /// Avvel International (`968`)
    companyIdentifiers[968] = #"Avvel International"#

    /// Gallagher Group (`969`)
    companyIdentifiers[969] = #"Gallagher Group"#

    /// In2things Automation Pvt. Ltd. (`970`)
    companyIdentifiers[970] = #"In2things Automation Pvt. Ltd."#

    /// SYSDEV Srl (`971`)
    companyIdentifiers[971] = #"SYSDEV Srl"#

    /// Vonkil Technologies Ltd (`972`)
    companyIdentifiers[972] = #"Vonkil Technologies Ltd"#

    /// Wynd Technologies, Inc. (`973`)
    companyIdentifiers[973] = #"Wynd Technologies, Inc."#

    /// CONTRINEX S.A. (`974`)
    companyIdentifiers[974] = #"CONTRINEX S.A."#

    /// MIRA, Inc. (`975`)
    companyIdentifiers[975] = #"MIRA, Inc."#

    /// Watteam Ltd (`976`)
    companyIdentifiers[976] = #"Watteam Ltd"#

    /// Density Inc. (`977`)
    companyIdentifiers[977] = #"Density Inc."#

    /// IOT Pot India Private Limited (`978`)
    companyIdentifiers[978] = #"IOT Pot India Private Limited"#

    /// Sigma Connectivity AB (`979`)
    companyIdentifiers[979] = #"Sigma Connectivity AB"#

    /// PEG PEREGO SPA (`980`)
    companyIdentifiers[980] = #"PEG PEREGO SPA"#

    /// Wyzelink Systems Inc. (`981`)
    companyIdentifiers[981] = #"Wyzelink Systems Inc."#

    /// Yota Devices LTD (`982`)
    companyIdentifiers[982] = #"Yota Devices LTD"#

    /// FINSECUR (`983`)
    companyIdentifiers[983] = #"FINSECUR"#

    /// Zen-Me Labs Ltd (`984`)
    companyIdentifiers[984] = #"Zen-Me Labs Ltd"#

    /// 3IWare Co., Ltd. (`985`)
    companyIdentifiers[985] = #"3IWare Co., Ltd."#

    /// EnOcean GmbH (`986`)
    companyIdentifiers[986] = #"EnOcean GmbH"#

    /// Instabeat, Inc (`987`)
    companyIdentifiers[987] = #"Instabeat, Inc"#

    /// Nima Labs (`988`)
    companyIdentifiers[988] = #"Nima Labs"#

    /// Andreas Stihl AG & Co. KG (`989`)
    companyIdentifiers[989] = #"Andreas Stihl AG & Co. KG"#

    /// Nathan Rhoades LLC (`990`)
    companyIdentifiers[990] = #"Nathan Rhoades LLC"#

    /// Grob Technologies, LLC (`991`)
    companyIdentifiers[991] = #"Grob Technologies, LLC"#

    /// Actions (Zhuhai) Technology Co., Limited (`992`)
    companyIdentifiers[992] = #"Actions (Zhuhai) Technology Co., Limited"#

    /// SPD Development Company Ltd (`993`)
    companyIdentifiers[993] = #"SPD Development Company Ltd"#

    /// Sensoan Oy (`994`)
    companyIdentifiers[994] = #"Sensoan Oy"#

    /// Qualcomm Life Inc (`995`)
    companyIdentifiers[995] = #"Qualcomm Life Inc"#

    /// Chip-ing AG (`996`)
    companyIdentifiers[996] = #"Chip-ing AG"#

    /// ffly4u (`997`)
    companyIdentifiers[997] = #"ffly4u"#

    /// IoT Instruments Oy (`998`)
    companyIdentifiers[998] = #"IoT Instruments Oy"#

    /// TRUE Fitness Technology (`999`)
    companyIdentifiers[999] = #"TRUE Fitness Technology"#

    /// Reiner Kartengeraete GmbH & Co. KG. (`1000`)
    companyIdentifiers[1000] = #"Reiner Kartengeraete GmbH & Co. KG."#

    /// SHENZHEN LEMONJOY TECHNOLOGY CO., LTD. (`1001`)
    companyIdentifiers[1001] = #"SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."#

    /// Hello Inc. (`1002`)
    companyIdentifiers[1002] = #"Hello Inc."#

    /// Evollve Inc. (`1003`)
    companyIdentifiers[1003] = #"Evollve Inc."#

    /// Jigowatts Inc. (`1004`)
    companyIdentifiers[1004] = #"Jigowatts Inc."#

    /// BASIC MICRO.COM,INC. (`1005`)
    companyIdentifiers[1005] = #"BASIC MICRO.COM,INC."#

    /// CUBE TECHNOLOGIES (`1006`)
    companyIdentifiers[1006] = #"CUBE TECHNOLOGIES"#

    /// foolography GmbH (`1007`)
    companyIdentifiers[1007] = #"foolography GmbH"#

    /// CLINK (`1008`)
    companyIdentifiers[1008] = #"CLINK"#

    /// Hestan Smart Cooking Inc. (`1009`)
    companyIdentifiers[1009] = #"Hestan Smart Cooking Inc."#

    /// WindowMaster A/S (`1010`)
    companyIdentifiers[1010] = #"WindowMaster A/S"#

    /// Flowscape AB (`1011`)
    companyIdentifiers[1011] = #"Flowscape AB"#

    /// PAL Technologies Ltd (`1012`)
    companyIdentifiers[1012] = #"PAL Technologies Ltd"#

    /// WHERE, Inc. (`1013`)
    companyIdentifiers[1013] = #"WHERE, Inc."#

    /// Iton Technology Corp. (`1014`)
    companyIdentifiers[1014] = #"Iton Technology Corp."#

    /// Owl Labs Inc. (`1015`)
    companyIdentifiers[1015] = #"Owl Labs Inc."#

    /// Rockford Corp. (`1016`)
    companyIdentifiers[1016] = #"Rockford Corp."#

    /// Becon Technologies Co.,Ltd. (`1017`)
    companyIdentifiers[1017] = #"Becon Technologies Co.,Ltd."#

    /// Vyassoft Technologies Inc (`1018`)
    companyIdentifiers[1018] = #"Vyassoft Technologies Inc"#

    /// Nox Medical (`1019`)
    companyIdentifiers[1019] = #"Nox Medical"#

    /// Kimberly-Clark (`1020`)
    companyIdentifiers[1020] = #"Kimberly-Clark"#

    /// Trimble Navigation Ltd. (`1021`)
    companyIdentifiers[1021] = #"Trimble Navigation Ltd."#

    /// Littelfuse (`1022`)
    companyIdentifiers[1022] = #"Littelfuse"#

    /// Withings (`1023`)
    companyIdentifiers[1023] = #"Withings"#

    /// i-developer IT Beratung UG (`1024`)
    companyIdentifiers[1024] = #"i-developer IT Beratung UG"#

    /// リレーションズ株式会社 (`1025`)
    companyIdentifiers[1025] = #"リレーションズ株式会社"#

    /// Sears Holdings Corporation (`1026`)
    companyIdentifiers[1026] = #"Sears Holdings Corporation"#

    /// Gantner Electronic GmbH (`1027`)
    companyIdentifiers[1027] = #"Gantner Electronic GmbH"#

    /// Authomate Inc (`1028`)
    companyIdentifiers[1028] = #"Authomate Inc"#

    /// Vertex International, Inc. (`1029`)
    companyIdentifiers[1029] = #"Vertex International, Inc."#

    /// Airtago (`1030`)
    companyIdentifiers[1030] = #"Airtago"#

    /// Swiss Audio SA (`1031`)
    companyIdentifiers[1031] = #"Swiss Audio SA"#

    /// ToGetHome Inc. (`1032`)
    companyIdentifiers[1032] = #"ToGetHome Inc."#

    /// AXIS (`1033`)
    companyIdentifiers[1033] = #"AXIS"#

    /// Openmatics (`1034`)
    companyIdentifiers[1034] = #"Openmatics"#

    /// Jana Care Inc. (`1035`)
    companyIdentifiers[1035] = #"Jana Care Inc."#

    /// Senix Corporation (`1036`)
    companyIdentifiers[1036] = #"Senix Corporation"#

    /// NorthStar Battery Company, LLC (`1037`)
    companyIdentifiers[1037] = #"NorthStar Battery Company, LLC"#

    /// SKF (U.K.) Limited (`1038`)
    companyIdentifiers[1038] = #"SKF (U.K.) Limited"#

    /// CO-AX Technology, Inc. (`1039`)
    companyIdentifiers[1039] = #"CO-AX Technology, Inc."#

    /// Fender Musical Instruments (`1040`)
    companyIdentifiers[1040] = #"Fender Musical Instruments"#

    /// Luidia Inc (`1041`)
    companyIdentifiers[1041] = #"Luidia Inc"#

    /// SEFAM (`1042`)
    companyIdentifiers[1042] = #"SEFAM"#

    /// Wireless Cables Inc (`1043`)
    companyIdentifiers[1043] = #"Wireless Cables Inc"#

    /// Lightning Protection International Pty Ltd (`1044`)
    companyIdentifiers[1044] = #"Lightning Protection International Pty Ltd"#

    /// Uber Technologies Inc (`1045`)
    companyIdentifiers[1045] = #"Uber Technologies Inc"#

    /// SODA GmbH (`1046`)
    companyIdentifiers[1046] = #"SODA GmbH"#

    /// Fatigue Science (`1047`)
    companyIdentifiers[1047] = #"Fatigue Science"#

    /// Alpine Electronics Inc. (`1048`)
    companyIdentifiers[1048] = #"Alpine Electronics Inc."#

    /// Novalogy LTD (`1049`)
    companyIdentifiers[1049] = #"Novalogy LTD"#

    /// Friday Labs Limited (`1050`)
    companyIdentifiers[1050] = #"Friday Labs Limited"#

    /// OrthoAccel Technologies (`1051`)
    companyIdentifiers[1051] = #"OrthoAccel Technologies"#

    /// WaterGuru, Inc. (`1052`)
    companyIdentifiers[1052] = #"WaterGuru, Inc."#

    /// Benning Elektrotechnik und Elektronik GmbH & Co. KG (`1053`)
    companyIdentifiers[1053] = #"Benning Elektrotechnik und Elektronik GmbH & Co. KG"#

    /// Dell Computer Corporation (`1054`)
    companyIdentifiers[1054] = #"Dell Computer Corporation"#

    /// Kopin Corporation (`1055`)
    companyIdentifiers[1055] = #"Kopin Corporation"#

    /// TecBakery GmbH (`1056`)
    companyIdentifiers[1056] = #"TecBakery GmbH"#

    /// Backbone Labs, Inc. (`1057`)
    companyIdentifiers[1057] = #"Backbone Labs, Inc."#

    /// DELSEY SA (`1058`)
    companyIdentifiers[1058] = #"DELSEY SA"#

    /// Chargifi Limited (`1059`)
    companyIdentifiers[1059] = #"Chargifi Limited"#

    /// Trainesense Ltd. (`1060`)
    companyIdentifiers[1060] = #"Trainesense Ltd."#

    /// Unify Software and Solutions GmbH & Co. KG (`1061`)
    companyIdentifiers[1061] = #"Unify Software and Solutions GmbH & Co. KG"#

    /// Husqvarna AB (`1062`)
    companyIdentifiers[1062] = #"Husqvarna AB"#

    /// Focus fleet and fuel management inc (`1063`)
    companyIdentifiers[1063] = #"Focus fleet and fuel management inc"#

    /// SmallLoop, LLC (`1064`)
    companyIdentifiers[1064] = #"SmallLoop, LLC"#

    /// Prolon Inc. (`1065`)
    companyIdentifiers[1065] = #"Prolon Inc."#

    /// BD Medical (`1066`)
    companyIdentifiers[1066] = #"BD Medical"#

    /// iMicroMed Incorporated (`1067`)
    companyIdentifiers[1067] = #"iMicroMed Incorporated"#

    /// Ticto N.V. (`1068`)
    companyIdentifiers[1068] = #"Ticto N.V."#

    /// Meshtech AS (`1069`)
    companyIdentifiers[1069] = #"Meshtech AS"#

    /// MemCachier Inc. (`1070`)
    companyIdentifiers[1070] = #"MemCachier Inc."#

    /// Danfoss A/S (`1071`)
    companyIdentifiers[1071] = #"Danfoss A/S"#

    /// SnapStyk Inc. (`1072`)
    companyIdentifiers[1072] = #"SnapStyk Inc."#

    /// Amway Corporation (`1073`)
    companyIdentifiers[1073] = #"Amway Corporation"#

    /// Silk Labs, Inc. (`1074`)
    companyIdentifiers[1074] = #"Silk Labs, Inc."#

    /// Pillsy Inc. (`1075`)
    companyIdentifiers[1075] = #"Pillsy Inc."#

    /// Hatch Baby, Inc. (`1076`)
    companyIdentifiers[1076] = #"Hatch Baby, Inc."#

    /// Blocks Wearables Ltd. (`1077`)
    companyIdentifiers[1077] = #"Blocks Wearables Ltd."#

    /// Drayson Technologies (Europe) Limited (`1078`)
    companyIdentifiers[1078] = #"Drayson Technologies (Europe) Limited"#

    /// eBest IOT Inc. (`1079`)
    companyIdentifiers[1079] = #"eBest IOT Inc."#

    /// Helvar Ltd (`1080`)
    companyIdentifiers[1080] = #"Helvar Ltd"#

    /// Radiance Technologies (`1081`)
    companyIdentifiers[1081] = #"Radiance Technologies"#

    /// Nuheara Limited (`1082`)
    companyIdentifiers[1082] = #"Nuheara Limited"#

    /// Appside co., ltd. (`1083`)
    companyIdentifiers[1083] = #"Appside co., ltd."#

    /// DeLaval (`1084`)
    companyIdentifiers[1084] = #"DeLaval"#

    /// Coiler Corporation (`1085`)
    companyIdentifiers[1085] = #"Coiler Corporation"#

    /// Thermomedics, Inc. (`1086`)
    companyIdentifiers[1086] = #"Thermomedics, Inc."#

    /// Tentacle Sync GmbH (`1087`)
    companyIdentifiers[1087] = #"Tentacle Sync GmbH"#

    /// Valencell, Inc. (`1088`)
    companyIdentifiers[1088] = #"Valencell, Inc."#

    /// iProtoXi Oy (`1089`)
    companyIdentifiers[1089] = #"iProtoXi Oy"#

    /// SECOM CO., LTD. (`1090`)
    companyIdentifiers[1090] = #"SECOM CO., LTD."#

    /// Tucker International LLC (`1091`)
    companyIdentifiers[1091] = #"Tucker International LLC"#

    /// Metanate Limited (`1092`)
    companyIdentifiers[1092] = #"Metanate Limited"#

    /// Kobian Canada Inc. (`1093`)
    companyIdentifiers[1093] = #"Kobian Canada Inc."#

    /// NETGEAR, Inc. (`1094`)
    companyIdentifiers[1094] = #"NETGEAR, Inc."#

    /// Fabtronics Australia Pty Ltd (`1095`)
    companyIdentifiers[1095] = #"Fabtronics Australia Pty Ltd"#

    /// Grand Centrix GmbH (`1096`)
    companyIdentifiers[1096] = #"Grand Centrix GmbH"#

    /// 1UP USA.com llc (`1097`)
    companyIdentifiers[1097] = #"1UP USA.com llc"#

    /// SHIMANO INC. (`1098`)
    companyIdentifiers[1098] = #"SHIMANO INC."#

    /// Nain Inc. (`1099`)
    companyIdentifiers[1099] = #"Nain Inc."#

    /// LifeStyle Lock, LLC (`1100`)
    companyIdentifiers[1100] = #"LifeStyle Lock, LLC"#

    /// VEGA Grieshaber KG (`1101`)
    companyIdentifiers[1101] = #"VEGA Grieshaber KG"#

    /// Xtrava Inc. (`1102`)
    companyIdentifiers[1102] = #"Xtrava Inc."#

    /// TTS Tooltechnic Systems AG & Co. KG (`1103`)
    companyIdentifiers[1103] = #"TTS Tooltechnic Systems AG & Co. KG"#

    /// Teenage Engineering AB (`1104`)
    companyIdentifiers[1104] = #"Teenage Engineering AB"#

    /// Tunstall Nordic AB (`1105`)
    companyIdentifiers[1105] = #"Tunstall Nordic AB"#

    /// Svep Design Center AB (`1106`)
    companyIdentifiers[1106] = #"Svep Design Center AB"#

    /// GreenPeak Technologies BV (`1107`)
    companyIdentifiers[1107] = #"GreenPeak Technologies BV"#

    /// Sphinx Electronics GmbH & Co KG (`1108`)
    companyIdentifiers[1108] = #"Sphinx Electronics GmbH & Co KG"#

    /// Atomation (`1109`)
    companyIdentifiers[1109] = #"Atomation"#

    /// Nemik Consulting Inc (`1110`)
    companyIdentifiers[1110] = #"Nemik Consulting Inc"#

    /// RF INNOVATION (`1111`)
    companyIdentifiers[1111] = #"RF INNOVATION"#

    /// Mini Solution Co., Ltd. (`1112`)
    companyIdentifiers[1112] = #"Mini Solution Co., Ltd."#

    /// Lumenetix, Inc (`1113`)
    companyIdentifiers[1113] = #"Lumenetix, Inc"#

    /// 2048450 Ontario Inc (`1114`)
    companyIdentifiers[1114] = #"2048450 Ontario Inc"#

    /// SPACEEK LTD (`1115`)
    companyIdentifiers[1115] = #"SPACEEK LTD"#

    /// Delta T Corporation (`1116`)
    companyIdentifiers[1116] = #"Delta T Corporation"#

    /// Boston Scientific Corporation (`1117`)
    companyIdentifiers[1117] = #"Boston Scientific Corporation"#

    /// Nuviz, Inc. (`1118`)
    companyIdentifiers[1118] = #"Nuviz, Inc."#

    /// Real Time Automation, Inc. (`1119`)
    companyIdentifiers[1119] = #"Real Time Automation, Inc."#

    /// Kolibree (`1120`)
    companyIdentifiers[1120] = #"Kolibree"#

    /// vhf elektronik GmbH (`1121`)
    companyIdentifiers[1121] = #"vhf elektronik GmbH"#

    /// Bonsai Systems GmbH (`1122`)
    companyIdentifiers[1122] = #"Bonsai Systems GmbH"#

    /// Fathom Systems Inc. (`1123`)
    companyIdentifiers[1123] = #"Fathom Systems Inc."#

    /// Bellman & Symfon (`1124`)
    companyIdentifiers[1124] = #"Bellman & Symfon"#

    /// International Forte Group LLC (`1125`)
    companyIdentifiers[1125] = #"International Forte Group LLC"#

    /// CycleLabs Solutions inc. (`1126`)
    companyIdentifiers[1126] = #"CycleLabs Solutions inc."#

    /// Codenex Oy (`1127`)
    companyIdentifiers[1127] = #"Codenex Oy"#

    /// Kynesim Ltd (`1128`)
    companyIdentifiers[1128] = #"Kynesim Ltd"#

    /// Palago AB (`1129`)
    companyIdentifiers[1129] = #"Palago AB"#

    /// INSIGMA INC. (`1130`)
    companyIdentifiers[1130] = #"INSIGMA INC."#

    /// PMD Solutions (`1131`)
    companyIdentifiers[1131] = #"PMD Solutions"#

    /// Qingdao Realtime Technology Co., Ltd. (`1132`)
    companyIdentifiers[1132] = #"Qingdao Realtime Technology Co., Ltd."#

    /// BEGA Gantenbrink-Leuchten KG (`1133`)
    companyIdentifiers[1133] = #"BEGA Gantenbrink-Leuchten KG"#

    /// Pambor Ltd. (`1134`)
    companyIdentifiers[1134] = #"Pambor Ltd."#

    /// Develco Products A/S (`1135`)
    companyIdentifiers[1135] = #"Develco Products A/S"#

    /// iDesign s.r.l. (`1136`)
    companyIdentifiers[1136] = #"iDesign s.r.l."#

    /// TiVo Corp (`1137`)
    companyIdentifiers[1137] = #"TiVo Corp"#

    /// Control-J Pty Ltd (`1138`)
    companyIdentifiers[1138] = #"Control-J Pty Ltd"#

    /// Steelcase, Inc. (`1139`)
    companyIdentifiers[1139] = #"Steelcase, Inc."#

    /// iApartment co., ltd. (`1140`)
    companyIdentifiers[1140] = #"iApartment co., ltd."#

    /// Icom inc. (`1141`)
    companyIdentifiers[1141] = #"Icom inc."#

    /// Oxstren Wearable Technologies Private Limited (`1142`)
    companyIdentifiers[1142] = #"Oxstren Wearable Technologies Private Limited"#

    /// Blue Spark Technologies (`1143`)
    companyIdentifiers[1143] = #"Blue Spark Technologies"#

    /// FarSite Communications Limited (`1144`)
    companyIdentifiers[1144] = #"FarSite Communications Limited"#

    /// mywerk system GmbH (`1145`)
    companyIdentifiers[1145] = #"mywerk system GmbH"#

    /// Sinosun Technology Co., Ltd. (`1146`)
    companyIdentifiers[1146] = #"Sinosun Technology Co., Ltd."#

    /// MIYOSHI ELECTRONICS CORPORATION (`1147`)
    companyIdentifiers[1147] = #"MIYOSHI ELECTRONICS CORPORATION"#

    /// POWERMAT LTD (`1148`)
    companyIdentifiers[1148] = #"POWERMAT LTD"#

    /// Occly LLC (`1149`)
    companyIdentifiers[1149] = #"Occly LLC"#

    /// OurHub Dev IvS (`1150`)
    companyIdentifiers[1150] = #"OurHub Dev IvS"#

    /// Pro-Mark, Inc. (`1151`)
    companyIdentifiers[1151] = #"Pro-Mark, Inc."#

    /// Dynometrics Inc. (`1152`)
    companyIdentifiers[1152] = #"Dynometrics Inc."#

    /// Quintrax Limited (`1153`)
    companyIdentifiers[1153] = #"Quintrax Limited"#

    /// POS Tuning Udo Vosshenrich GmbH & Co. KG (`1154`)
    companyIdentifiers[1154] = #"POS Tuning Udo Vosshenrich GmbH & Co. KG"#

    /// Multi Care Systems B.V. (`1155`)
    companyIdentifiers[1155] = #"Multi Care Systems B.V."#

    /// Revol Technologies Inc (`1156`)
    companyIdentifiers[1156] = #"Revol Technologies Inc"#

    /// SKIDATA AG (`1157`)
    companyIdentifiers[1157] = #"SKIDATA AG"#

    /// DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME (`1158`)
    companyIdentifiers[1158] = #"DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"#

    /// Centrica Connected Home (`1159`)
    companyIdentifiers[1159] = #"Centrica Connected Home"#

    /// Automotive Data Solutions Inc (`1160`)
    companyIdentifiers[1160] = #"Automotive Data Solutions Inc"#

    /// Igarashi Engineering (`1161`)
    companyIdentifiers[1161] = #"Igarashi Engineering"#

    /// Taelek Oy (`1162`)
    companyIdentifiers[1162] = #"Taelek Oy"#

    /// CP Electronics Limited (`1163`)
    companyIdentifiers[1163] = #"CP Electronics Limited"#

    /// Vectronix AG (`1164`)
    companyIdentifiers[1164] = #"Vectronix AG"#

    /// S-Labs Sp. z o.o. (`1165`)
    companyIdentifiers[1165] = #"S-Labs Sp. z o.o."#

    /// Companion Medical, Inc. (`1166`)
    companyIdentifiers[1166] = #"Companion Medical, Inc."#

    /// BlueKitchen GmbH (`1167`)
    companyIdentifiers[1167] = #"BlueKitchen GmbH"#

    /// Matting AB (`1168`)
    companyIdentifiers[1168] = #"Matting AB"#

    /// SOREX - Wireless Solutions GmbH (`1169`)
    companyIdentifiers[1169] = #"SOREX - Wireless Solutions GmbH"#

    /// ADC Technology, Inc. (`1170`)
    companyIdentifiers[1170] = #"ADC Technology, Inc."#

    /// Lynxemi Pte Ltd (`1171`)
    companyIdentifiers[1171] = #"Lynxemi Pte Ltd"#

    /// SENNHEISER electronic GmbH & Co. KG (`1172`)
    companyIdentifiers[1172] = #"SENNHEISER electronic GmbH & Co. KG"#

    /// LMT Mercer Group, Inc (`1173`)
    companyIdentifiers[1173] = #"LMT Mercer Group, Inc"#

    /// Polymorphic Labs LLC (`1174`)
    companyIdentifiers[1174] = #"Polymorphic Labs LLC"#

    /// Cochlear Limited (`1175`)
    companyIdentifiers[1175] = #"Cochlear Limited"#

    /// METER Group, Inc. USA (`1176`)
    companyIdentifiers[1176] = #"METER Group, Inc. USA"#

    /// Ruuvi Innovations Ltd. (`1177`)
    companyIdentifiers[1177] = #"Ruuvi Innovations Ltd."#

    /// Situne AS (`1178`)
    companyIdentifiers[1178] = #"Situne AS"#

    /// nVisti, LLC (`1179`)
    companyIdentifiers[1179] = #"nVisti, LLC"#

    /// DyOcean (`1180`)
    companyIdentifiers[1180] = #"DyOcean"#

    /// Uhlmann & Zacher GmbH (`1181`)
    companyIdentifiers[1181] = #"Uhlmann & Zacher GmbH"#

    /// AND!XOR LLC (`1182`)
    companyIdentifiers[1182] = #"AND!XOR LLC"#

    /// tictote AB (`1183`)
    companyIdentifiers[1183] = #"tictote AB"#

    /// Vypin, LLC (`1184`)
    companyIdentifiers[1184] = #"Vypin, LLC"#

    /// PNI Sensor Corporation (`1185`)
    companyIdentifiers[1185] = #"PNI Sensor Corporation"#

    /// ovrEngineered, LLC (`1186`)
    companyIdentifiers[1186] = #"ovrEngineered, LLC"#

    /// GT-tronics HK Ltd (`1187`)
    companyIdentifiers[1187] = #"GT-tronics HK Ltd"#

    /// Herbert Waldmann GmbH & Co. KG (`1188`)
    companyIdentifiers[1188] = #"Herbert Waldmann GmbH & Co. KG"#

    /// Guangzhou FiiO Electronics Technology Co.,Ltd (`1189`)
    companyIdentifiers[1189] = #"Guangzhou FiiO Electronics Technology Co.,Ltd"#

    /// Vinetech Co., Ltd (`1190`)
    companyIdentifiers[1190] = #"Vinetech Co., Ltd"#

    /// Dallas Logic Corporation (`1191`)
    companyIdentifiers[1191] = #"Dallas Logic Corporation"#

    /// BioTex, Inc. (`1192`)
    companyIdentifiers[1192] = #"BioTex, Inc."#

    /// DISCOVERY SOUND TECHNOLOGY, LLC (`1193`)
    companyIdentifiers[1193] = #"DISCOVERY SOUND TECHNOLOGY, LLC"#

    /// LINKIO SAS (`1194`)
    companyIdentifiers[1194] = #"LINKIO SAS"#

    /// Harbortronics, Inc. (`1195`)
    companyIdentifiers[1195] = #"Harbortronics, Inc."#

    /// Undagrid B.V. (`1196`)
    companyIdentifiers[1196] = #"Undagrid B.V."#

    /// Shure Inc (`1197`)
    companyIdentifiers[1197] = #"Shure Inc"#

    /// ERM Electronic Systems LTD (`1198`)
    companyIdentifiers[1198] = #"ERM Electronic Systems LTD"#

    /// BIOROWER Handelsagentur GmbH (`1199`)
    companyIdentifiers[1199] = #"BIOROWER Handelsagentur GmbH"#

    /// Weba Sport und Med. Artikel GmbH (`1200`)
    companyIdentifiers[1200] = #"Weba Sport und Med. Artikel GmbH"#

    /// Kartographers Technologies Pvt. Ltd. (`1201`)
    companyIdentifiers[1201] = #"Kartographers Technologies Pvt. Ltd."#

    /// The Shadow on the Moon (`1202`)
    companyIdentifiers[1202] = #"The Shadow on the Moon"#

    /// mobike (Hong Kong) Limited (`1203`)
    companyIdentifiers[1203] = #"mobike (Hong Kong) Limited"#

    /// Inuheat Group AB (`1204`)
    companyIdentifiers[1204] = #"Inuheat Group AB"#

    /// Swiftronix AB (`1205`)
    companyIdentifiers[1205] = #"Swiftronix AB"#

    /// Diagnoptics Technologies (`1206`)
    companyIdentifiers[1206] = #"Diagnoptics Technologies"#

    /// Analog Devices, Inc. (`1207`)
    companyIdentifiers[1207] = #"Analog Devices, Inc."#

    /// Soraa Inc. (`1208`)
    companyIdentifiers[1208] = #"Soraa Inc."#

    /// CSR Building Products Limited (`1209`)
    companyIdentifiers[1209] = #"CSR Building Products Limited"#

    /// Crestron Electronics, Inc. (`1210`)
    companyIdentifiers[1210] = #"Crestron Electronics, Inc."#

    /// Neatebox Ltd (`1211`)
    companyIdentifiers[1211] = #"Neatebox Ltd"#

    /// Draegerwerk AG & Co. KGaA (`1212`)
    companyIdentifiers[1212] = #"Draegerwerk AG & Co. KGaA"#

    /// AlbynMedical (`1213`)
    companyIdentifiers[1213] = #"AlbynMedical"#

    /// Averos FZCO (`1214`)
    companyIdentifiers[1214] = #"Averos FZCO"#

    /// VIT Initiative, LLC (`1215`)
    companyIdentifiers[1215] = #"VIT Initiative, LLC"#

    /// Statsports International (`1216`)
    companyIdentifiers[1216] = #"Statsports International"#

    /// Sospitas, s.r.o. (`1217`)
    companyIdentifiers[1217] = #"Sospitas, s.r.o."#

    /// Dmet Products Corp. (`1218`)
    companyIdentifiers[1218] = #"Dmet Products Corp."#

    /// Mantracourt Electronics Limited (`1219`)
    companyIdentifiers[1219] = #"Mantracourt Electronics Limited"#

    /// TeAM Hutchins AB (`1220`)
    companyIdentifiers[1220] = #"TeAM Hutchins AB"#

    /// Seibert Williams Glass, LLC (`1221`)
    companyIdentifiers[1221] = #"Seibert Williams Glass, LLC"#

    /// Insta GmbH (`1222`)
    companyIdentifiers[1222] = #"Insta GmbH"#

    /// Svantek Sp. z o.o. (`1223`)
    companyIdentifiers[1223] = #"Svantek Sp. z o.o."#

    /// Shanghai Flyco Electrical Appliance Co., Ltd. (`1224`)
    companyIdentifiers[1224] = #"Shanghai Flyco Electrical Appliance Co., Ltd."#

    /// Thornwave Labs Inc (`1225`)
    companyIdentifiers[1225] = #"Thornwave Labs Inc"#

    /// Steiner-Optik GmbH (`1226`)
    companyIdentifiers[1226] = #"Steiner-Optik GmbH"#

    /// Novo Nordisk A/S (`1227`)
    companyIdentifiers[1227] = #"Novo Nordisk A/S"#

    /// Enflux Inc. (`1228`)
    companyIdentifiers[1228] = #"Enflux Inc."#

    /// Safetech Products LLC (`1229`)
    companyIdentifiers[1229] = #"Safetech Products LLC"#

    /// GOOOLED S.R.L. (`1230`)
    companyIdentifiers[1230] = #"GOOOLED S.R.L."#

    /// DOM Sicherheitstechnik GmbH & Co. KG (`1231`)
    companyIdentifiers[1231] = #"DOM Sicherheitstechnik GmbH & Co. KG"#

    /// Olympus Corporation (`1232`)
    companyIdentifiers[1232] = #"Olympus Corporation"#

    /// KTS GmbH (`1233`)
    companyIdentifiers[1233] = #"KTS GmbH"#

    /// Anloq Technologies Inc. (`1234`)
    companyIdentifiers[1234] = #"Anloq Technologies Inc."#

    /// Queercon, Inc (`1235`)
    companyIdentifiers[1235] = #"Queercon, Inc"#

    /// 5th Element Ltd (`1236`)
    companyIdentifiers[1236] = #"5th Element Ltd"#

    /// Gooee Limited (`1237`)
    companyIdentifiers[1237] = #"Gooee Limited"#

    /// LUGLOC LLC (`1238`)
    companyIdentifiers[1238] = #"LUGLOC LLC"#

    /// Blincam, Inc. (`1239`)
    companyIdentifiers[1239] = #"Blincam, Inc."#

    /// FUJIFILM Corporation (`1240`)
    companyIdentifiers[1240] = #"FUJIFILM Corporation"#

    /// RandMcNally (`1241`)
    companyIdentifiers[1241] = #"RandMcNally"#

    /// Franceschi Marina snc (`1242`)
    companyIdentifiers[1242] = #"Franceschi Marina snc"#

    /// Engineered Audio, LLC. (`1243`)
    companyIdentifiers[1243] = #"Engineered Audio, LLC."#

    /// IOTTIVE (OPC) PRIVATE LIMITED (`1244`)
    companyIdentifiers[1244] = #"IOTTIVE (OPC) PRIVATE LIMITED"#

    /// 4MOD Technology (`1245`)
    companyIdentifiers[1245] = #"4MOD Technology"#

    /// Lutron Electronics Co., Inc. (`1246`)
    companyIdentifiers[1246] = #"Lutron Electronics Co., Inc."#

    /// Emerson (`1247`)
    companyIdentifiers[1247] = #"Emerson"#

    /// Guardtec, Inc. (`1248`)
    companyIdentifiers[1248] = #"Guardtec, Inc."#

    /// REACTEC LIMITED (`1249`)
    companyIdentifiers[1249] = #"REACTEC LIMITED"#

    /// EllieGrid (`1250`)
    companyIdentifiers[1250] = #"EllieGrid"#

    /// Under Armour (`1251`)
    companyIdentifiers[1251] = #"Under Armour"#

    /// Woodenshark (`1252`)
    companyIdentifiers[1252] = #"Woodenshark"#

    /// Avack Oy (`1253`)
    companyIdentifiers[1253] = #"Avack Oy"#

    /// Smart Solution Technology, Inc. (`1254`)
    companyIdentifiers[1254] = #"Smart Solution Technology, Inc."#

    /// REHABTRONICS INC. (`1255`)
    companyIdentifiers[1255] = #"REHABTRONICS INC."#

    /// STABILO International (`1256`)
    companyIdentifiers[1256] = #"STABILO International"#

    /// Busch Jaeger Elektro GmbH (`1257`)
    companyIdentifiers[1257] = #"Busch Jaeger Elektro GmbH"#

    /// Pacific Bioscience Laboratories, Inc (`1258`)
    companyIdentifiers[1258] = #"Pacific Bioscience Laboratories, Inc"#

    /// Bird Home Automation GmbH (`1259`)
    companyIdentifiers[1259] = #"Bird Home Automation GmbH"#

    /// Motorola Solutions (`1260`)
    companyIdentifiers[1260] = #"Motorola Solutions"#

    /// R9 Technology, Inc. (`1261`)
    companyIdentifiers[1261] = #"R9 Technology, Inc."#

    /// Auxivia (`1262`)
    companyIdentifiers[1262] = #"Auxivia"#

    /// DaisyWorks, Inc (`1263`)
    companyIdentifiers[1263] = #"DaisyWorks, Inc"#

    /// Kosi Limited (`1264`)
    companyIdentifiers[1264] = #"Kosi Limited"#

    /// Theben AG (`1265`)
    companyIdentifiers[1265] = #"Theben AG"#

    /// InDreamer Techsol Private Limited (`1266`)
    companyIdentifiers[1266] = #"InDreamer Techsol Private Limited"#

    /// Cerevast Medical (`1267`)
    companyIdentifiers[1267] = #"Cerevast Medical"#

    /// ZanCompute Inc. (`1268`)
    companyIdentifiers[1268] = #"ZanCompute Inc."#

    /// Pirelli Tyre S.P.A. (`1269`)
    companyIdentifiers[1269] = #"Pirelli Tyre S.P.A."#

    /// McLear Limited (`1270`)
    companyIdentifiers[1270] = #"McLear Limited"#

    /// Shenzhen Huiding Technology Co.,Ltd. (`1271`)
    companyIdentifiers[1271] = #"Shenzhen Huiding Technology Co.,Ltd."#

    /// Convergence Systems Limited (`1272`)
    companyIdentifiers[1272] = #"Convergence Systems Limited"#

    /// Interactio (`1273`)
    companyIdentifiers[1273] = #"Interactio"#

    /// Androtec GmbH (`1274`)
    companyIdentifiers[1274] = #"Androtec GmbH"#

    /// Benchmark Drives GmbH & Co. KG (`1275`)
    companyIdentifiers[1275] = #"Benchmark Drives GmbH & Co. KG"#

    /// SwingLync L. L. C. (`1276`)
    companyIdentifiers[1276] = #"SwingLync L. L. C."#

    /// Tapkey GmbH (`1277`)
    companyIdentifiers[1277] = #"Tapkey GmbH"#

    /// Woosim Systems Inc. (`1278`)
    companyIdentifiers[1278] = #"Woosim Systems Inc."#

    /// Microsemi Corporation (`1279`)
    companyIdentifiers[1279] = #"Microsemi Corporation"#

    /// Wiliot LTD. (`1280`)
    companyIdentifiers[1280] = #"Wiliot LTD."#

    /// Polaris IND (`1281`)
    companyIdentifiers[1281] = #"Polaris IND"#

    /// Specifi-Kali LLC (`1282`)
    companyIdentifiers[1282] = #"Specifi-Kali LLC"#

    /// Locoroll, Inc (`1283`)
    companyIdentifiers[1283] = #"Locoroll, Inc"#

    /// PHYPLUS Inc (`1284`)
    companyIdentifiers[1284] = #"PHYPLUS Inc"#

    /// Inplay Technologies LLC (`1285`)
    companyIdentifiers[1285] = #"Inplay Technologies LLC"#

    /// Hager (`1286`)
    companyIdentifiers[1286] = #"Hager"#

    /// Yellowcog (`1287`)
    companyIdentifiers[1287] = #"Yellowcog"#

    /// Axes System sp. z o. o. (`1288`)
    companyIdentifiers[1288] = #"Axes System sp. z o. o."#

    /// myLIFTER Inc. (`1289`)
    companyIdentifiers[1289] = #"myLIFTER Inc."#

    /// Shake-on B.V. (`1290`)
    companyIdentifiers[1290] = #"Shake-on B.V."#

    /// Vibrissa Inc. (`1291`)
    companyIdentifiers[1291] = #"Vibrissa Inc."#

    /// OSRAM GmbH (`1292`)
    companyIdentifiers[1292] = #"OSRAM GmbH"#

    /// TRSystems GmbH (`1293`)
    companyIdentifiers[1293] = #"TRSystems GmbH"#

    /// Yichip Microelectronics (Hangzhou) Co.,Ltd. (`1294`)
    companyIdentifiers[1294] = #"Yichip Microelectronics (Hangzhou) Co.,Ltd."#

    /// Foundation Engineering LLC (`1295`)
    companyIdentifiers[1295] = #"Foundation Engineering LLC"#

    /// UNI-ELECTRONICS, INC. (`1296`)
    companyIdentifiers[1296] = #"UNI-ELECTRONICS, INC."#

    /// Brookfield Equinox LLC (`1297`)
    companyIdentifiers[1297] = #"Brookfield Equinox LLC"#

    /// Soprod SA (`1298`)
    companyIdentifiers[1298] = #"Soprod SA"#

    /// 9974091 Canada Inc. (`1299`)
    companyIdentifiers[1299] = #"9974091 Canada Inc."#

    /// FIBRO GmbH (`1300`)
    companyIdentifiers[1300] = #"FIBRO GmbH"#

    /// RB Controls Co., Ltd. (`1301`)
    companyIdentifiers[1301] = #"RB Controls Co., Ltd."#

    /// Footmarks (`1302`)
    companyIdentifiers[1302] = #"Footmarks"#

    /// Amcore AB (`1303`)
    companyIdentifiers[1303] = #"Amcore AB"#

    /// MAMORIO.inc (`1304`)
    companyIdentifiers[1304] = #"MAMORIO.inc"#

    /// Tyto Life LLC (`1305`)
    companyIdentifiers[1305] = #"Tyto Life LLC"#

    /// Leica Camera AG (`1306`)
    companyIdentifiers[1306] = #"Leica Camera AG"#

    /// Angee Technologies Ltd. (`1307`)
    companyIdentifiers[1307] = #"Angee Technologies Ltd."#

    /// EDPS (`1308`)
    companyIdentifiers[1308] = #"EDPS"#

    /// OFF Line Co., Ltd. (`1309`)
    companyIdentifiers[1309] = #"OFF Line Co., Ltd."#

    /// Detect Blue Limited (`1310`)
    companyIdentifiers[1310] = #"Detect Blue Limited"#

    /// Setec Pty Ltd (`1311`)
    companyIdentifiers[1311] = #"Setec Pty Ltd"#

    /// Target Corporation (`1312`)
    companyIdentifiers[1312] = #"Target Corporation"#

    /// IAI Corporation (`1313`)
    companyIdentifiers[1313] = #"IAI Corporation"#

    /// NS Tech, Inc. (`1314`)
    companyIdentifiers[1314] = #"NS Tech, Inc."#

    /// MTG Co., Ltd. (`1315`)
    companyIdentifiers[1315] = #"MTG Co., Ltd."#

    /// Hangzhou iMagic Technology Co., Ltd (`1316`)
    companyIdentifiers[1316] = #"Hangzhou iMagic Technology Co., Ltd"#

    /// HONGKONG NANO IC TECHNOLOGIES CO., LIMITED (`1317`)
    companyIdentifiers[1317] = #"HONGKONG NANO IC TECHNOLOGIES CO., LIMITED"#

    /// Honeywell International Inc. (`1318`)
    companyIdentifiers[1318] = #"Honeywell International Inc."#

    /// Albrecht JUNG (`1319`)
    companyIdentifiers[1319] = #"Albrecht JUNG"#

    /// Lunera Lighting Inc. (`1320`)
    companyIdentifiers[1320] = #"Lunera Lighting Inc."#

    /// Lumen UAB (`1321`)
    companyIdentifiers[1321] = #"Lumen UAB"#

    /// Keynes Controls Ltd (`1322`)
    companyIdentifiers[1322] = #"Keynes Controls Ltd"#

    /// Novartis AG (`1323`)
    companyIdentifiers[1323] = #"Novartis AG"#

    /// Geosatis SA (`1324`)
    companyIdentifiers[1324] = #"Geosatis SA"#

    /// EXFO, Inc. (`1325`)
    companyIdentifiers[1325] = #"EXFO, Inc."#

    /// LEDVANCE GmbH (`1326`)
    companyIdentifiers[1326] = #"LEDVANCE GmbH"#

    /// Center ID Corp. (`1327`)
    companyIdentifiers[1327] = #"Center ID Corp."#

    /// Adolene, Inc. (`1328`)
    companyIdentifiers[1328] = #"Adolene, Inc."#

    /// D&M Holdings Inc. (`1329`)
    companyIdentifiers[1329] = #"D&M Holdings Inc."#

    /// CRESCO Wireless, Inc. (`1330`)
    companyIdentifiers[1330] = #"CRESCO Wireless, Inc."#

    /// Nura Operations Pty Ltd (`1331`)
    companyIdentifiers[1331] = #"Nura Operations Pty Ltd"#

    /// Frontiergadget, Inc. (`1332`)
    companyIdentifiers[1332] = #"Frontiergadget, Inc."#

    /// Smart Component Technologies Limited (`1333`)
    companyIdentifiers[1333] = #"Smart Component Technologies Limited"#

    /// ZTR Control Systems LLC (`1334`)
    companyIdentifiers[1334] = #"ZTR Control Systems LLC"#

    /// MetaLogics Corporation (`1335`)
    companyIdentifiers[1335] = #"MetaLogics Corporation"#

    /// Medela AG (`1336`)
    companyIdentifiers[1336] = #"Medela AG"#

    /// OPPLE Lighting Co., Ltd (`1337`)
    companyIdentifiers[1337] = #"OPPLE Lighting Co., Ltd"#

    /// Savitech Corp., (`1338`)
    companyIdentifiers[1338] = #"Savitech Corp.,"#

    /// prodigy (`1339`)
    companyIdentifiers[1339] = #"prodigy"#

    /// Screenovate Technologies Ltd (`1340`)
    companyIdentifiers[1340] = #"Screenovate Technologies Ltd"#

    /// TESA SA (`1341`)
    companyIdentifiers[1341] = #"TESA SA"#

    /// CLIM8 LIMITED (`1342`)
    companyIdentifiers[1342] = #"CLIM8 LIMITED"#

    /// Silergy Corp (`1343`)
    companyIdentifiers[1343] = #"Silergy Corp"#

    /// SilverPlus, Inc (`1344`)
    companyIdentifiers[1344] = #"SilverPlus, Inc"#

    /// Sharknet srl (`1345`)
    companyIdentifiers[1345] = #"Sharknet srl"#

    /// Mist Systems, Inc. (`1346`)
    companyIdentifiers[1346] = #"Mist Systems, Inc."#

    /// MIWA LOCK CO.,Ltd (`1347`)
    companyIdentifiers[1347] = #"MIWA LOCK CO.,Ltd"#

    /// OrthoSensor, Inc. (`1348`)
    companyIdentifiers[1348] = #"OrthoSensor, Inc."#

    /// Candy Hoover Group s.r.l (`1349`)
    companyIdentifiers[1349] = #"Candy Hoover Group s.r.l"#

    /// Apexar Technologies S.A. (`1350`)
    companyIdentifiers[1350] = #"Apexar Technologies S.A."#

    /// LOGICDATA d.o.o. (`1351`)
    companyIdentifiers[1351] = #"LOGICDATA d.o.o."#

    /// Knick Elektronische Messgeraete GmbH & Co. KG (`1352`)
    companyIdentifiers[1352] = #"Knick Elektronische Messgeraete GmbH & Co. KG"#

    /// Smart Technologies and Investment Limited (`1353`)
    companyIdentifiers[1353] = #"Smart Technologies and Investment Limited"#

    /// Linough Inc. (`1354`)
    companyIdentifiers[1354] = #"Linough Inc."#

    /// Advanced Electronic Designs, Inc. (`1355`)
    companyIdentifiers[1355] = #"Advanced Electronic Designs, Inc."#

    /// Carefree Scott Fetzer Co Inc (`1356`)
    companyIdentifiers[1356] = #"Carefree Scott Fetzer Co Inc"#

    /// Sensome (`1357`)
    companyIdentifiers[1357] = #"Sensome"#

    /// FORTRONIK storitve d.o.o. (`1358`)
    companyIdentifiers[1358] = #"FORTRONIK storitve d.o.o."#

    /// Sinnoz (`1359`)
    companyIdentifiers[1359] = #"Sinnoz"#

    /// Versa Networks, Inc. (`1360`)
    companyIdentifiers[1360] = #"Versa Networks, Inc."#

    /// Sylero (`1361`)
    companyIdentifiers[1361] = #"Sylero"#

    /// Avempace SARL (`1362`)
    companyIdentifiers[1362] = #"Avempace SARL"#

    /// Nintendo Co., Ltd. (`1363`)
    companyIdentifiers[1363] = #"Nintendo Co., Ltd."#

    /// National Instruments (`1364`)
    companyIdentifiers[1364] = #"National Instruments"#

    /// KROHNE Messtechnik GmbH (`1365`)
    companyIdentifiers[1365] = #"KROHNE Messtechnik GmbH"#

    /// Otodynamics Ltd (`1366`)
    companyIdentifiers[1366] = #"Otodynamics Ltd"#

    /// Arwin Technology Limited (`1367`)
    companyIdentifiers[1367] = #"Arwin Technology Limited"#

    /// benegear, inc. (`1368`)
    companyIdentifiers[1368] = #"benegear, inc."#

    /// Newcon Optik (`1369`)
    companyIdentifiers[1369] = #"Newcon Optik"#

    /// CANDY HOUSE, Inc. (`1370`)
    companyIdentifiers[1370] = #"CANDY HOUSE, Inc."#

    /// FRANKLIN TECHNOLOGY INC (`1371`)
    companyIdentifiers[1371] = #"FRANKLIN TECHNOLOGY INC"#

    /// Lely (`1372`)
    companyIdentifiers[1372] = #"Lely"#

    /// Valve Corporation (`1373`)
    companyIdentifiers[1373] = #"Valve Corporation"#

    /// Hekatron Vertriebs GmbH (`1374`)
    companyIdentifiers[1374] = #"Hekatron Vertriebs GmbH"#

    /// PROTECH S.A.S. DI GIRARDI ANDREA & C. (`1375`)
    companyIdentifiers[1375] = #"PROTECH S.A.S. DI GIRARDI ANDREA & C."#

    /// Sarita CareTech IVS (`1376`)
    companyIdentifiers[1376] = #"Sarita CareTech IVS"#

    /// Finder S.p.A. (`1377`)
    companyIdentifiers[1377] = #"Finder S.p.A."#

    /// Thalmic Labs Inc. (`1378`)
    companyIdentifiers[1378] = #"Thalmic Labs Inc."#

    /// Steinel Vertrieb GmbH (`1379`)
    companyIdentifiers[1379] = #"Steinel Vertrieb GmbH"#

    /// Beghelli Spa (`1380`)
    companyIdentifiers[1380] = #"Beghelli Spa"#

    /// Beijing Smartspace Technologies Inc. (`1381`)
    companyIdentifiers[1381] = #"Beijing Smartspace Technologies Inc."#

    /// CORE TRANSPORT TECHNOLOGIES NZ LIMITED (`1382`)
    companyIdentifiers[1382] = #"CORE TRANSPORT TECHNOLOGIES NZ LIMITED"#

    /// Xiamen Everesports Goods Co., Ltd (`1383`)
    companyIdentifiers[1383] = #"Xiamen Everesports Goods Co., Ltd"#

    /// Bodyport Inc. (`1384`)
    companyIdentifiers[1384] = #"Bodyport Inc."#

    /// Audionics System, INC. (`1385`)
    companyIdentifiers[1385] = #"Audionics System, INC."#

    /// Flipnavi Co.,Ltd. (`1386`)
    companyIdentifiers[1386] = #"Flipnavi Co.,Ltd."#

    /// Rion Co., Ltd. (`1387`)
    companyIdentifiers[1387] = #"Rion Co., Ltd."#

    /// Long Range Systems, LLC (`1388`)
    companyIdentifiers[1388] = #"Long Range Systems, LLC"#

    /// Redmond Industrial Group LLC (`1389`)
    companyIdentifiers[1389] = #"Redmond Industrial Group LLC"#

    /// VIZPIN INC. (`1390`)
    companyIdentifiers[1390] = #"VIZPIN INC."#

    /// BikeFinder AS (`1391`)
    companyIdentifiers[1391] = #"BikeFinder AS"#

    /// Consumer Sleep Solutions LLC (`1392`)
    companyIdentifiers[1392] = #"Consumer Sleep Solutions LLC"#

    /// PSIKICK, INC. (`1393`)
    companyIdentifiers[1393] = #"PSIKICK, INC."#

    /// AntTail.com (`1394`)
    companyIdentifiers[1394] = #"AntTail.com"#

    /// Lighting Science Group Corp. (`1395`)
    companyIdentifiers[1395] = #"Lighting Science Group Corp."#

    /// AFFORDABLE ELECTRONICS INC (`1396`)
    companyIdentifiers[1396] = #"AFFORDABLE ELECTRONICS INC"#

    /// Integral Memroy Plc (`1397`)
    companyIdentifiers[1397] = #"Integral Memroy Plc"#

    /// Globalstar, Inc. (`1398`)
    companyIdentifiers[1398] = #"Globalstar, Inc."#

    /// True Wearables, Inc. (`1399`)
    companyIdentifiers[1399] = #"True Wearables, Inc."#

    /// Wellington Drive Technologies Ltd (`1400`)
    companyIdentifiers[1400] = #"Wellington Drive Technologies Ltd"#

    /// Ensemble Tech Private Limited (`1401`)
    companyIdentifiers[1401] = #"Ensemble Tech Private Limited"#

    /// OMNI Remotes (`1402`)
    companyIdentifiers[1402] = #"OMNI Remotes"#

    /// Duracell U.S. Operations Inc. (`1403`)
    companyIdentifiers[1403] = #"Duracell U.S. Operations Inc."#

    /// Toor Technologies LLC (`1404`)
    companyIdentifiers[1404] = #"Toor Technologies LLC"#

    /// Instinct Performance (`1405`)
    companyIdentifiers[1405] = #"Instinct Performance"#

    /// Beco, Inc (`1406`)
    companyIdentifiers[1406] = #"Beco, Inc"#

    /// Scuf Gaming International, LLC (`1407`)
    companyIdentifiers[1407] = #"Scuf Gaming International, LLC"#

    /// ARANZ Medical Limited (`1408`)
    companyIdentifiers[1408] = #"ARANZ Medical Limited"#

    /// LYS TECHNOLOGIES LTD (`1409`)
    companyIdentifiers[1409] = #"LYS TECHNOLOGIES LTD"#

    /// Breakwall Analytics, LLC (`1410`)
    companyIdentifiers[1410] = #"Breakwall Analytics, LLC"#

    /// Code Blue Communications (`1411`)
    companyIdentifiers[1411] = #"Code Blue Communications"#

    /// Gira Giersiepen GmbH & Co. KG (`1412`)
    companyIdentifiers[1412] = #"Gira Giersiepen GmbH & Co. KG"#

    /// Hearing Lab Technology (`1413`)
    companyIdentifiers[1413] = #"Hearing Lab Technology"#

    /// LEGRAND (`1414`)
    companyIdentifiers[1414] = #"LEGRAND"#

    /// Derichs GmbH (`1415`)
    companyIdentifiers[1415] = #"Derichs GmbH"#

    /// ALT-TEKNIK LLC (`1416`)
    companyIdentifiers[1416] = #"ALT-TEKNIK LLC"#

    /// Star Technologies (`1417`)
    companyIdentifiers[1417] = #"Star Technologies"#

    /// START TODAY CO.,LTD. (`1418`)
    companyIdentifiers[1418] = #"START TODAY CO.,LTD."#

    /// Maxim Integrated Products (`1419`)
    companyIdentifiers[1419] = #"Maxim Integrated Products"#

    /// MERCK Kommanditgesellschaft auf Aktien (`1420`)
    companyIdentifiers[1420] = #"MERCK Kommanditgesellschaft auf Aktien"#

    /// Jungheinrich Aktiengesellschaft (`1421`)
    companyIdentifiers[1421] = #"Jungheinrich Aktiengesellschaft"#

    /// Oculus VR, LLC (`1422`)
    companyIdentifiers[1422] = #"Oculus VR, LLC"#

    /// HENDON SEMICONDUCTORS PTY LTD (`1423`)
    companyIdentifiers[1423] = #"HENDON SEMICONDUCTORS PTY LTD"#

    /// Pur3 Ltd (`1424`)
    companyIdentifiers[1424] = #"Pur3 Ltd"#

    /// Viasat Group S.p.A. (`1425`)
    companyIdentifiers[1425] = #"Viasat Group S.p.A."#

    /// IZITHERM (`1426`)
    companyIdentifiers[1426] = #"IZITHERM"#

    /// Spaulding Clinical Research (`1427`)
    companyIdentifiers[1427] = #"Spaulding Clinical Research"#

    /// Kohler Company (`1428`)
    companyIdentifiers[1428] = #"Kohler Company"#

    /// Inor Process AB (`1429`)
    companyIdentifiers[1429] = #"Inor Process AB"#

    /// My Smart Blinds (`1430`)
    companyIdentifiers[1430] = #"My Smart Blinds"#

    /// RadioPulse Inc (`1431`)
    companyIdentifiers[1431] = #"RadioPulse Inc"#

    /// rapitag GmbH (`1432`)
    companyIdentifiers[1432] = #"rapitag GmbH"#

    /// Lazlo326, LLC. (`1433`)
    companyIdentifiers[1433] = #"Lazlo326, LLC."#

    /// Teledyne Lecroy, Inc. (`1434`)
    companyIdentifiers[1434] = #"Teledyne Lecroy, Inc."#

    /// Dataflow Systems Limited (`1435`)
    companyIdentifiers[1435] = #"Dataflow Systems Limited"#

    /// Macrogiga Electronics (`1436`)
    companyIdentifiers[1436] = #"Macrogiga Electronics"#

    /// Tandem Diabetes Care (`1437`)
    companyIdentifiers[1437] = #"Tandem Diabetes Care"#

    /// Polycom, Inc. (`1438`)
    companyIdentifiers[1438] = #"Polycom, Inc."#

    /// Fisher & Paykel Healthcare (`1439`)
    companyIdentifiers[1439] = #"Fisher & Paykel Healthcare"#

    /// RCP Software Oy (`1440`)
    companyIdentifiers[1440] = #"RCP Software Oy"#

    /// Shanghai Xiaoyi Technology Co.,Ltd. (`1441`)
    companyIdentifiers[1441] = #"Shanghai Xiaoyi Technology Co.,Ltd."#

    /// ADHERIUM(NZ) LIMITED (`1442`)
    companyIdentifiers[1442] = #"ADHERIUM(NZ) LIMITED"#

    /// Axiomware Systems Incorporated (`1443`)
    companyIdentifiers[1443] = #"Axiomware Systems Incorporated"#

    /// O. E. M. Controls, Inc. (`1444`)
    companyIdentifiers[1444] = #"O. E. M. Controls, Inc."#

    /// Kiiroo BV (`1445`)
    companyIdentifiers[1445] = #"Kiiroo BV"#

    /// Telecon Mobile Limited (`1446`)
    companyIdentifiers[1446] = #"Telecon Mobile Limited"#

    /// Sonos Inc (`1447`)
    companyIdentifiers[1447] = #"Sonos Inc"#

    /// Tom Allebrandi Consulting (`1448`)
    companyIdentifiers[1448] = #"Tom Allebrandi Consulting"#

    /// Monidor (`1449`)
    companyIdentifiers[1449] = #"Monidor"#

    /// Tramex Limited (`1450`)
    companyIdentifiers[1450] = #"Tramex Limited"#

    /// Nofence AS (`1451`)
    companyIdentifiers[1451] = #"Nofence AS"#

    /// GoerTek Dynaudio Co., Ltd. (`1452`)
    companyIdentifiers[1452] = #"GoerTek Dynaudio Co., Ltd."#

    /// INIA (`1453`)
    companyIdentifiers[1453] = #"INIA"#

    /// CARMATE MFG.CO.,LTD (`1454`)
    companyIdentifiers[1454] = #"CARMATE MFG.CO.,LTD"#

    /// ONvocal (`1455`)
    companyIdentifiers[1455] = #"ONvocal"#

    /// NewTec GmbH (`1456`)
    companyIdentifiers[1456] = #"NewTec GmbH"#

    /// Medallion Instrumentation Systems (`1457`)
    companyIdentifiers[1457] = #"Medallion Instrumentation Systems"#

    /// CAREL INDUSTRIES S.P.A. (`1458`)
    companyIdentifiers[1458] = #"CAREL INDUSTRIES S.P.A."#

    /// Parabit Systems, Inc. (`1459`)
    companyIdentifiers[1459] = #"Parabit Systems, Inc."#

    /// White Horse Scientific ltd (`1460`)
    companyIdentifiers[1460] = #"White Horse Scientific ltd"#

    /// verisilicon (`1461`)
    companyIdentifiers[1461] = #"verisilicon"#

    /// Elecs Industry Co.,Ltd. (`1462`)
    companyIdentifiers[1462] = #"Elecs Industry Co.,Ltd."#

    /// Beijing Pinecone Electronics Co.,Ltd. (`1463`)
    companyIdentifiers[1463] = #"Beijing Pinecone Electronics Co.,Ltd."#

    /// Ambystoma Labs Inc. (`1464`)
    companyIdentifiers[1464] = #"Ambystoma Labs Inc."#

    /// Suzhou Pairlink Network Technology (`1465`)
    companyIdentifiers[1465] = #"Suzhou Pairlink Network Technology"#

    /// igloohome (`1466`)
    companyIdentifiers[1466] = #"igloohome"#

    /// Oxford Metrics plc (`1467`)
    companyIdentifiers[1467] = #"Oxford Metrics plc"#

    /// Leviton Mfg. Co., Inc. (`1468`)
    companyIdentifiers[1468] = #"Leviton Mfg. Co., Inc."#

    /// ULC Robotics Inc. (`1469`)
    companyIdentifiers[1469] = #"ULC Robotics Inc."#

    /// RFID Global by Softwork SrL (`1470`)
    companyIdentifiers[1470] = #"RFID Global by Softwork SrL"#

    /// Real-World-Systems Corporation (`1471`)
    companyIdentifiers[1471] = #"Real-World-Systems Corporation"#

    /// Nalu Medical, Inc. (`1472`)
    companyIdentifiers[1472] = #"Nalu Medical, Inc."#

    /// P.I.Engineering (`1473`)
    companyIdentifiers[1473] = #"P.I.Engineering"#

    /// Grote Industries (`1474`)
    companyIdentifiers[1474] = #"Grote Industries"#

    /// Runtime, Inc. (`1475`)
    companyIdentifiers[1475] = #"Runtime, Inc."#

    /// Codecoup sp. z o.o. sp. k. (`1476`)
    companyIdentifiers[1476] = #"Codecoup sp. z o.o. sp. k."#

    /// SELVE GmbH & Co. KG (`1477`)
    companyIdentifiers[1477] = #"SELVE GmbH & Co. KG"#

    /// Smart Animal Training Systems, LLC (`1478`)
    companyIdentifiers[1478] = #"Smart Animal Training Systems, LLC"#

    /// Lippert Components, INC (`1479`)
    companyIdentifiers[1479] = #"Lippert Components, INC"#

    /// SOMFY SAS (`1480`)
    companyIdentifiers[1480] = #"SOMFY SAS"#

    /// TBS Electronics B.V. (`1481`)
    companyIdentifiers[1481] = #"TBS Electronics B.V."#

    /// MHL Custom Inc (`1482`)
    companyIdentifiers[1482] = #"MHL Custom Inc"#

    /// LucentWear LLC (`1483`)
    companyIdentifiers[1483] = #"LucentWear LLC"#

    /// WATTS ELECTRONICS (`1484`)
    companyIdentifiers[1484] = #"WATTS ELECTRONICS"#

    /// RJ Brands LLC (`1485`)
    companyIdentifiers[1485] = #"RJ Brands LLC"#

    /// V-ZUG Ltd (`1486`)
    companyIdentifiers[1486] = #"V-ZUG Ltd"#

    /// Biowatch SA (`1487`)
    companyIdentifiers[1487] = #"Biowatch SA"#

    /// Anova Applied Electronics (`1488`)
    companyIdentifiers[1488] = #"Anova Applied Electronics"#

    /// Lindab AB (`1489`)
    companyIdentifiers[1489] = #"Lindab AB"#

    /// frogblue TECHNOLOGY GmbH (`1490`)
    companyIdentifiers[1490] = #"frogblue TECHNOLOGY GmbH"#

    /// Acurable Limited (`1491`)
    companyIdentifiers[1491] = #"Acurable Limited"#

    /// LAMPLIGHT Co., Ltd. (`1492`)
    companyIdentifiers[1492] = #"LAMPLIGHT Co., Ltd."#

    /// TEGAM, Inc. (`1493`)
    companyIdentifiers[1493] = #"TEGAM, Inc."#

    /// Zhuhai Jieli technology Co.,Ltd (`1494`)
    companyIdentifiers[1494] = #"Zhuhai Jieli technology Co.,Ltd"#

    /// modum.io AG (`1495`)
    companyIdentifiers[1495] = #"modum.io AG"#

    /// Farm Jenny LLC (`1496`)
    companyIdentifiers[1496] = #"Farm Jenny LLC"#

    /// Toyo Electronics Corporation (`1497`)
    companyIdentifiers[1497] = #"Toyo Electronics Corporation"#

    /// Applied Neural Research Corp (`1498`)
    companyIdentifiers[1498] = #"Applied Neural Research Corp"#

    /// Avid Identification Systems, Inc. (`1499`)
    companyIdentifiers[1499] = #"Avid Identification Systems, Inc."#

    /// Petronics Inc. (`1500`)
    companyIdentifiers[1500] = #"Petronics Inc."#

    /// essentim GmbH (`1501`)
    companyIdentifiers[1501] = #"essentim GmbH"#

    /// QT Medical INC. (`1502`)
    companyIdentifiers[1502] = #"QT Medical INC."#

    /// VIRTUALCLINIC.DIRECT LIMITED (`1503`)
    companyIdentifiers[1503] = #"VIRTUALCLINIC.DIRECT LIMITED"#

    /// Viper Design LLC (`1504`)
    companyIdentifiers[1504] = #"Viper Design LLC"#

    /// Human, Incorporated (`1505`)
    companyIdentifiers[1505] = #"Human, Incorporated"#

    /// stAPPtronics GmbH (`1506`)
    companyIdentifiers[1506] = #"stAPPtronics GmbH"#

    /// Elemental Machines, Inc. (`1507`)
    companyIdentifiers[1507] = #"Elemental Machines, Inc."#

    /// Taiyo Yuden Co., Ltd (`1508`)
    companyIdentifiers[1508] = #"Taiyo Yuden Co., Ltd"#

    /// INEO ENERGY& SYSTEMS (`1509`)
    companyIdentifiers[1509] = #"INEO ENERGY& SYSTEMS"#

    /// Motion Instruments Inc. (`1510`)
    companyIdentifiers[1510] = #"Motion Instruments Inc."#

    /// PressurePro (`1511`)
    companyIdentifiers[1511] = #"PressurePro"#

    /// COWBOY (`1512`)
    companyIdentifiers[1512] = #"COWBOY"#

    /// iconmobile GmbH (`1513`)
    companyIdentifiers[1513] = #"iconmobile GmbH"#

    /// ACS-Control-System GmbH (`1514`)
    companyIdentifiers[1514] = #"ACS-Control-System GmbH"#

    /// Bayerische Motoren Werke AG (`1515`)
    companyIdentifiers[1515] = #"Bayerische Motoren Werke AG"#

    /// Gycom Svenska AB (`1516`)
    companyIdentifiers[1516] = #"Gycom Svenska AB"#

    /// Fuji Xerox Co., Ltd (`1517`)
    companyIdentifiers[1517] = #"Fuji Xerox Co., Ltd"#

    /// Glide Inc. (`1518`)
    companyIdentifiers[1518] = #"Glide Inc."#

    /// SIKOM AS (`1519`)
    companyIdentifiers[1519] = #"SIKOM AS"#

    /// beken (`1520`)
    companyIdentifiers[1520] = #"beken"#

    /// The Linux Foundation (`1521`)
    companyIdentifiers[1521] = #"The Linux Foundation"#

    /// Try and E CO.,LTD. (`1522`)
    companyIdentifiers[1522] = #"Try and E CO.,LTD."#

    /// SeeScan (`1523`)
    companyIdentifiers[1523] = #"SeeScan"#

    /// Clearity, LLC (`1524`)
    companyIdentifiers[1524] = #"Clearity, LLC"#

    /// GS TAG (`1525`)
    companyIdentifiers[1525] = #"GS TAG"#

    /// DPTechnics (`1526`)
    companyIdentifiers[1526] = #"DPTechnics"#

    /// TRACMO, INC. (`1527`)
    companyIdentifiers[1527] = #"TRACMO, INC."#

    /// Anki Inc. (`1528`)
    companyIdentifiers[1528] = #"Anki Inc."#

    /// Hagleitner Hygiene International GmbH (`1529`)
    companyIdentifiers[1529] = #"Hagleitner Hygiene International GmbH"#

    /// Konami Sports Life Co., Ltd. (`1530`)
    companyIdentifiers[1530] = #"Konami Sports Life Co., Ltd."#

    /// Arblet Inc. (`1531`)
    companyIdentifiers[1531] = #"Arblet Inc."#

    /// Masbando GmbH (`1532`)
    companyIdentifiers[1532] = #"Masbando GmbH"#

    /// Innoseis (`1533`)
    companyIdentifiers[1533] = #"Innoseis"#

    /// Niko (`1534`)
    companyIdentifiers[1534] = #"Niko"#

    /// Wellnomics Ltd (`1535`)
    companyIdentifiers[1535] = #"Wellnomics Ltd"#

    /// iRobot Corporation (`1536`)
    companyIdentifiers[1536] = #"iRobot Corporation"#

    /// Schrader Electronics (`1537`)
    companyIdentifiers[1537] = #"Schrader Electronics"#

    /// Geberit International AG (`1538`)
    companyIdentifiers[1538] = #"Geberit International AG"#

    /// Fourth Evolution Inc (`1539`)
    companyIdentifiers[1539] = #"Fourth Evolution Inc"#

    /// Cell2Jack LLC (`1540`)
    companyIdentifiers[1540] = #"Cell2Jack LLC"#

    /// FMW electronic Futterer u. Maier-Wolf OHG (`1541`)
    companyIdentifiers[1541] = #"FMW electronic Futterer u. Maier-Wolf OHG"#

    /// John Deere (`1542`)
    companyIdentifiers[1542] = #"John Deere"#

    /// Rookery Technology Ltd (`1543`)
    companyIdentifiers[1543] = #"Rookery Technology Ltd"#

    /// KeySafe-Cloud (`1544`)
    companyIdentifiers[1544] = #"KeySafe-Cloud"#

    /// BUCHI Labortechnik AG (`1545`)
    companyIdentifiers[1545] = #"BUCHI Labortechnik AG"#

    /// IQAir AG (`1546`)
    companyIdentifiers[1546] = #"IQAir AG"#

    /// Triax Technologies Inc (`1547`)
    companyIdentifiers[1547] = #"Triax Technologies Inc"#

    /// Vuzix Corporation (`1548`)
    companyIdentifiers[1548] = #"Vuzix Corporation"#

    /// TDK Corporation (`1549`)
    companyIdentifiers[1549] = #"TDK Corporation"#

    /// Blueair AB (`1550`)
    companyIdentifiers[1550] = #"Blueair AB"#

    /// Signify Netherlands (`1551`)
    companyIdentifiers[1551] = #"Signify Netherlands"#

    /// ADH GUARDIAN USA LLC (`1552`)
    companyIdentifiers[1552] = #"ADH GUARDIAN USA LLC"#

    /// Beurer GmbH (`1553`)
    companyIdentifiers[1553] = #"Beurer GmbH"#

    /// Playfinity AS (`1554`)
    companyIdentifiers[1554] = #"Playfinity AS"#

    /// Hans Dinslage GmbH (`1555`)
    companyIdentifiers[1555] = #"Hans Dinslage GmbH"#

    /// OnAsset Intelligence, Inc. (`1556`)
    companyIdentifiers[1556] = #"OnAsset Intelligence, Inc."#

    /// INTER ACTION Corporation (`1557`)
    companyIdentifiers[1557] = #"INTER ACTION Corporation"#

    /// OS42 UG (haftungsbeschraenkt) (`1558`)
    companyIdentifiers[1558] = #"OS42 UG (haftungsbeschraenkt)"#

    /// WIZCONNECTED COMPANY LIMITED (`1559`)
    companyIdentifiers[1559] = #"WIZCONNECTED COMPANY LIMITED"#

    /// Audio-Technica Corporation (`1560`)
    companyIdentifiers[1560] = #"Audio-Technica Corporation"#

    /// Six Guys Labs, s.r.o. (`1561`)
    companyIdentifiers[1561] = #"Six Guys Labs, s.r.o."#

    /// R.W. Beckett Corporation (`1562`)
    companyIdentifiers[1562] = #"R.W. Beckett Corporation"#

    /// silex technology, inc. (`1563`)
    companyIdentifiers[1563] = #"silex technology, inc."#

    /// Univations Limited (`1564`)
    companyIdentifiers[1564] = #"Univations Limited"#

    /// SENS Innovation ApS (`1565`)
    companyIdentifiers[1565] = #"SENS Innovation ApS"#

    /// Diamond Kinetics, Inc. (`1566`)
    companyIdentifiers[1566] = #"Diamond Kinetics, Inc."#

    /// Phrame Inc. (`1567`)
    companyIdentifiers[1567] = #"Phrame Inc."#

    /// Forciot Oy (`1568`)
    companyIdentifiers[1568] = #"Forciot Oy"#

    /// Noordung d.o.o. (`1569`)
    companyIdentifiers[1569] = #"Noordung d.o.o."#

    /// Beam Labs, LLC (`1570`)
    companyIdentifiers[1570] = #"Beam Labs, LLC"#

    /// Philadelphia Scientific (U.K.) Limited (`1571`)
    companyIdentifiers[1571] = #"Philadelphia Scientific (U.K.) Limited"#

    /// Biovotion AG (`1572`)
    companyIdentifiers[1572] = #"Biovotion AG"#

    /// Square Panda, Inc. (`1573`)
    companyIdentifiers[1573] = #"Square Panda, Inc."#

    /// Amplifico (`1574`)
    companyIdentifiers[1574] = #"Amplifico"#

    /// WEG S.A. (`1575`)
    companyIdentifiers[1575] = #"WEG S.A."#

    /// Ensto Oy (`1576`)
    companyIdentifiers[1576] = #"Ensto Oy"#

    /// PHONEPE PVT LTD (`1577`)
    companyIdentifiers[1577] = #"PHONEPE PVT LTD"#

    /// Lunatico Astronomia SL (`1578`)
    companyIdentifiers[1578] = #"Lunatico Astronomia SL"#

    /// MinebeaMitsumi Inc. (`1579`)
    companyIdentifiers[1579] = #"MinebeaMitsumi Inc."#

    /// ASPion GmbH (`1580`)
    companyIdentifiers[1580] = #"ASPion GmbH"#

    /// Vossloh-Schwabe Deutschland GmbH (`1581`)
    companyIdentifiers[1581] = #"Vossloh-Schwabe Deutschland GmbH"#

    /// Procept (`1582`)
    companyIdentifiers[1582] = #"Procept"#

    /// ONKYO Corporation (`1583`)
    companyIdentifiers[1583] = #"ONKYO Corporation"#

    /// Asthrea D.O.O. (`1584`)
    companyIdentifiers[1584] = #"Asthrea D.O.O."#

    /// Fortiori Design LLC (`1585`)
    companyIdentifiers[1585] = #"Fortiori Design LLC"#

    /// Hugo Muller GmbH & Co KG (`1586`)
    companyIdentifiers[1586] = #"Hugo Muller GmbH & Co KG"#

    /// Wangi Lai PLT (`1587`)
    companyIdentifiers[1587] = #"Wangi Lai PLT"#

    /// Fanstel Corp (`1588`)
    companyIdentifiers[1588] = #"Fanstel Corp"#

    /// Crookwood (`1589`)
    companyIdentifiers[1589] = #"Crookwood"#

    /// ELECTRONICA INTEGRAL DE SONIDO S.A. (`1590`)
    companyIdentifiers[1590] = #"ELECTRONICA INTEGRAL DE SONIDO S.A."#

    /// GiP Innovation Tools GmbH (`1591`)
    companyIdentifiers[1591] = #"GiP Innovation Tools GmbH"#

    /// LX SOLUTIONS PTY LIMITED (`1592`)
    companyIdentifiers[1592] = #"LX SOLUTIONS PTY LIMITED"#

    /// Shenzhen Minew Technologies Co., Ltd. (`1593`)
    companyIdentifiers[1593] = #"Shenzhen Minew Technologies Co., Ltd."#

    /// Prolojik Limited (`1594`)
    companyIdentifiers[1594] = #"Prolojik Limited"#

    /// Kromek Group Plc (`1595`)
    companyIdentifiers[1595] = #"Kromek Group Plc"#

    /// Contec Medical Systems Co., Ltd. (`1596`)
    companyIdentifiers[1596] = #"Contec Medical Systems Co., Ltd."#

    /// Xradio Technology Co.,Ltd. (`1597`)
    companyIdentifiers[1597] = #"Xradio Technology Co.,Ltd."#

    /// The Indoor Lab, LLC (`1598`)
    companyIdentifiers[1598] = #"The Indoor Lab, LLC"#

    /// LDL TECHNOLOGY (`1599`)
    companyIdentifiers[1599] = #"LDL TECHNOLOGY"#

    /// Parkifi (`1600`)
    companyIdentifiers[1600] = #"Parkifi"#

    /// Revenue Collection Systems FRANCE SAS (`1601`)
    companyIdentifiers[1601] = #"Revenue Collection Systems FRANCE SAS"#

    /// Bluetrum Technology Co.,Ltd (`1602`)
    companyIdentifiers[1602] = #"Bluetrum Technology Co.,Ltd"#

    /// makita corporation (`1603`)
    companyIdentifiers[1603] = #"makita corporation"#

    /// Apogee Instruments (`1604`)
    companyIdentifiers[1604] = #"Apogee Instruments"#

    /// BM3 (`1605`)
    companyIdentifiers[1605] = #"BM3"#

    /// SGV Group Holding GmbH & Co. KG (`1606`)
    companyIdentifiers[1606] = #"SGV Group Holding GmbH & Co. KG"#

    /// MED-EL (`1607`)
    companyIdentifiers[1607] = #"MED-EL"#

    /// Ultune Technologies (`1608`)
    companyIdentifiers[1608] = #"Ultune Technologies"#

    /// Ryeex Technology Co.,Ltd. (`1609`)
    companyIdentifiers[1609] = #"Ryeex Technology Co.,Ltd."#

    return companyIdentifiers
}()
#endif
