
-------------------------
---- Phone Gui Codes ----
-------------------------
	local gunStats = {}
	local screenW, screenH = guiGetScreenSize()
	PhFont = guiCreateFont( "Files/Font/font.ttf", 10 )
	PhFont16 = guiCreateFont( "Files/Font/font.ttf", 16 )
	PhFont8 = guiCreateFont( "Files/Font/font.ttf", 8 )
	PhFont6 = guiCreateFont( "Files/Font/font.ttf", 6 )
	NowShowingPhoneGui = nil
	NowClockGui = nil
	local NowPlayingRingtone = nil
	local NowPlayingSms = nil
	local sec = 0
	local min = 0
	
	--[[
	ezez = guiCreateStaticImage(0, 0, screenW, screenH, "Files/Textures/Record.png", false)
	ezezLabel = guiCreateLabel((screenW - 550) / 2, screenH - 60, 550, 50, "Baraye Khorooj Az In Halat Dokme P Estefade Nemaeid!", false, ezez)
	guiSetFont(ezezLabel, PhFont16)
	guiLabelSetColor(ezezLabel, 251, 248, 3)]]
	-- Phone Main Gui --
	
	PhoneMainBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/IphoneX_Main.png", false)
	MainHomeButton = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, PhoneMainBg)
    MClock = guiCreateLabel(23, 22, 49, 15, "21:35", false, PhoneMainBg)
    guiSetFont(MClock, PhFont)
    MLabel2 = guiCreateLabel(175, 22, 49, 15, "Irancell", false, PhoneMainBg)
    guiSetFont(MLabel2, PhFont)
    MClick1 = guiCreateStaticImage(23, 78, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick2 = guiCreateStaticImage(88, 78, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick3 = guiCreateStaticImage(159, 78, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick4 = guiCreateStaticImage(23, 147, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick5 = guiCreateStaticImage(88, 147, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick6 = guiCreateStaticImage(159, 147, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)--Vote
    MClick7 = guiCreateStaticImage(23, 216, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick8 = guiCreateStaticImage(88, 216, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick9 = guiCreateStaticImage(159, 216, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick10 = guiCreateStaticImage(23, 285, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick11 = guiCreateStaticImage(88, 285, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick12 = guiCreateStaticImage(159, 285, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick13 = guiCreateStaticImage(23, 363, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick14 = guiCreateStaticImage(88, 363, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)
    MClick15 = guiCreateStaticImage(159, 363, 55, 59, "Files/Textures/Click.png", false, PhoneMainBg)    -- TiwT
	guiSetProperty(PhoneMainBg, "Visible", "false")
	
	-- Phone Stats Gui 1 --
	
	StatsPage1 = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Page1.png", false)
	StatsHomeButton = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, StatsPage1)
    Stats1Clock = guiCreateLabel(23, 22, 49, 15, "21:35", false, StatsPage1)
    guiSetFont(Stats1Clock, PhFont)
    Stats1Sv = guiCreateLabel(175, 22, 49, 15, " Irancell", false, StatsPage1)
    guiSetFont(Stats1Sv, PhFont)
	Stats1 = guiCreateLabel(28, 110,184, 335, "Loading... Please Wait..", false, StatsPage1)
    guiSetFont(Stats1, PhFont)
    guiLabelSetVerticalAlign(Stats1, "center")
    StatsNext = guiCreateStaticImage(183, 420, 31, 29, "Files/Textures/Click.png", false, StatsPage1)
	guiSetProperty(StatsPage1, "Visible", "false")
	
	-- Phone Options Gui --
	
    OptionsBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Settings.png", false)
	OptionsHomeButton = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, OptionsBg)
    OptionsLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, OptionsBg)
    guiSetFont(OptionsLabel1, PhFont)
    OptionsLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, OptionsBg)
    guiSetFont(OptionsLabel2, PhFont)
    OptionsLabel3 = guiCreateLabel(37, 162, 165, 15, "Select Your Spawn Location", false, OptionsBg)
    guiSetFont(OptionsLabel3, PhFont)
	guiLabelSetColor(OptionsLabel3, 51, 51, 51)
	SpawnHouse = guiCreateStaticImage(47, 182, 68, 29, "Files/Textures/House.png", false, OptionsBg)
	SpawnFaction = guiCreateStaticImage(117, 182, 68, 29, "Files/Textures/Faction.png", false, OptionsBg)
	SpawnClan = guiCreateStaticImage(47, 216, 68, 29, "Files/Textures/Clan.png", false, OptionsBg)
    SpawnCivilian = guiCreateStaticImage(117, 216, 68, 29, "Files/Textures/Civilian.png", false, OptionsBg)
    OptionsLabel4 = guiCreateLabel(92, 255, 165, 15, "Ringtone:", false, OptionsBg)
    guiSetFont(OptionsLabel4, PhFont)
    guiLabelSetColor(OptionsLabel4, 51, 51, 51)
	RingtoneCombo = guiCreateComboBox(47, 275, 140, 121, "", false, OptionsBg)
	for i=1, 11 do
		guiComboBoxAddItem(RingtoneCombo, "Ringtone "..i.."", i)
	end
	guiComboBoxAddItem(RingtoneCombo, "Silent", 12)
	guiComboBoxSetSelected(RingtoneCombo,0)
	RingtoneTest = guiCreateStaticImage(47, 300, 68, 29, "Files/Textures/Play.png", false, OptionsBg)
    RingtoneSet = guiCreateStaticImage(117, 300, 68, 29, "Files/Textures/Set.png", false, OptionsBg)
	OptionsLabel5 = guiCreateLabel(92, 335, 165, 15, "SMS Sound:", false, OptionsBg)
    guiSetFont(OptionsLabel5, PhFont)
    guiLabelSetColor(OptionsLabel5, 51, 51, 51)
	SmsCombo = guiCreateComboBox(47, 355, 140, 121, "", false, OptionsBg)
	for i=1, 5 do
		guiComboBoxAddItem(SmsCombo, "SMS Sound "..i.."", i)
	end
	guiComboBoxSetSelected(SmsCombo,0)
	SmsTest = guiCreateStaticImage(47, 380, 68, 29, "Files/Textures/Play.png", false, OptionsBg)
    SmsSet = guiCreateStaticImage(117, 380, 68, 29, "Files/Textures/Set.png", false, OptionsBg)
	guiSetProperty(OptionsBg, "Visible", "false")
	
	-- Phone Musics Gui --
	
	NowMusic = nil
	MusicBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Music.png", false)
	MusicHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, MusicBg)
    guiSetProperty(MusicHome, "ImageColours", "tl:FF000000 tr:FF000000 bl:FF000000 br:FF000000")
    MusicLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, MusicBg)
    guiSetFont(MusicLabel1, PhFont)
    guiLabelSetColor(MusicLabel1, 0, 0, 0)
    MusicLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, MusicBg)
    guiSetFont(MusicLabel2, PhFont)
    guiLabelSetColor(MusicLabel2, 0, 0, 0)
    RadioJavan = guiCreateStaticImage(18, 138, 102, 115, "Files/Textures/Click.png", false, MusicBg)
    VRock = guiCreateStaticImage(122, 138, 102, 115, "Files/Textures/Click.png", false, MusicBg)
    TrapFm = guiCreateStaticImage(18, 257, 102, 115, "Files/Textures/Click.png", false, MusicBg)
    ProFm = guiCreateStaticImage(120, 257, 102, 115, "Files/Textures/Click.png", false, MusicBg)
    VolumeDown = guiCreateStaticImage(39, 384, 52, 50, "Files/Textures/Click.png", false, MusicBg)	
    PausePlay = guiCreateStaticImage(97, 382, 52, 50, "Files/Textures/Click.png", false, MusicBg)
    VolumeUp = guiCreateStaticImage(149, 382, 52, 50, "Files/Textures/Click.png", false, MusicBg)    
	guiSetProperty(MusicBg, "Visible", "false")
	
	-- Phone Gps Gui --
	
local GpsLocationTable = {
	{ -2414.5361328125 ,331.1845703125 ,34.97550201416 ,"( SF ) - Civilian Spawn"},
	{ -1496.79296875 ,919.9072265625 ,7.1875 ,"( SF ) -Irancell Bank"},
	{ -2033.1865234375 ,-722.8486328125 ,32.309375762939 ,"( SF ) - Mosque"},
	{ -1986.794921875 ,1118.0419921875 ,53.995254516602 ,"( SF ) - Church"},
	{ -2126.3125 ,278.966796875 ,36.307811737061 ,"( SF ) - Job Center"},
	{ -2243.6083984375 ,128.5205078125 ,35.3203125 ,"( SF ) - Roxan Gaming Cafe"},
	{ -2160.275390625 ,128.734375 ,35.3203125 ,"( SF ) - Premium Skin Shop"},
	{ -2026.501953125 ,-99.982421875 ,35.1640625 ,"( SF ) - Driving School"},
	{ -1641.4345703125 ,1203.45703125 ,7.2459907531738 ,"( SF ) - Dealer Ship 1"},
	{ -1968.2041015625 ,293.8408203125 ,35.171875 ,"( SF ) - Dealer Ship 2"},
	{ -2181.5869140625 ,708.1513671875 ,53.890625 ,"( SF ) - Drug House"},
	{ -2747.724609375 ,202.9091796875 ,7.1324281692505 ,"( SF ) - Buy Material"},
	{ -1628.7978515625 ,1389.021484375 ,7.1875 ,"( SF ) - Sell Material"},
	{ -1951.7294921875 ,718.126953125 ,46.5625 ,"( SF ) - Pent House"},
	{ -2848.2314453125 ,450.6279296875 ,4.5 ,"( SF )- Mask Shop"},
	{ 1480.60546875 ,-1734.791015625 ,13.3828125 ,"( LS ) - Civilian Spawn"},
	{ 2166.583984375 ,-1671.8876953125 ,15.07447052002 ,"( LS ) - Drug House"},
	{ 1937.62109375 ,-1977.1689453125 ,13.546875 ,"( LS ) - Buy Material"},
	{ 687.3603515625 ,-473.1064453125 ,16.536296844482 ,"( LS ) - Sell Material"},
	{ 2194.77734375 ,1839.3359375 ,11 ,"( LV ) - Civilian Spawn"},
	{ 1696.9677734375 ,915.978515625 ,10.814748764038 ,"( LV ) - Drug House"},
	{ 1954.8642578125 ,2323.5341796875 ,10.8203125 ,"( LV ) - Buy Material"},
	{ -225.87109375 ,1076.53515625 ,19.7421875 ,"( LV ) - Sell Material"},
	{ -1605.263671875 ,720.8134765625 ,11.917189598083 ,"( SF ) - Police Department"},
	{ 1553.6337890625 ,-1675.6513671875 ,16.1953125 ,"( LS ) - Police Department"},
	{ 2290.1005859375 ,2427.583984375 ,10.8203125 ,"( LV ) - Police Department"},
	{ -2452.3671875 ,503.7890625 ,30.082160949707 ,"( SF ) - Federal Bureau of Investigation"},
	{ 1617.09375 ,-1321.11328125 ,17.474416732788 ,"( LS ) - Federal Bureau of Investigation"},
	{ 2442.4072265625 ,2376.146484375 ,11.60515499115 ,"( LV ) - Federal Bureau of Investigation"},
	{ -71.001953125 ,-353.6591796875 ,1.2876424789429 ,"( GL ) - National Guard"},
	{ -2655.0830078125 ,633.763671875 ,14.453125 ,"( SF ) - Hospital ( Medic )"},
	{ 1179.7001953125 ,-1323.201171875 ,14.18236541748 ,"( LS ) - Hospital ( Medic )"},
	{ 1607.1904296875 ,1827.806640625 ,10.8203125 ,"( LV ) - Hospital ( Medic )"},
	{ -489.1875 ,-568.779296875 ,23.710723876953 ,"( GL ) - Hitman HQ"},
	{ -2521.103515625 ,-623.4287109375 ,132.77085876465 ,"( SF ) - News Reporter"},
	{ 643.2724609375 ,-1357.1953125 ,13.569608688354 ,"( LS ) - News Reporter"},
	{ 1067.134765625 ,1364.935546875 ,10.743601799011 ,"( LV ) - News Reporter"},
	{ -2032.36328125 ,148.4130859375 ,28.8359375 ,"( SF ) - Mechanic HQ"},
	{ 2260.0126953125 ,-1770.1962890625 ,13.640625 ,"( LS ) - Mechanic HQ"},
	{ -2030.08203125 ,-127.5166015625 ,35.234153747559 ,"( SF ) - School HQ"},
	{ 1382.2158203125 ,-1671.7265625 ,13.484504699707 ,"( LS ) - School HQ"},
	{ 1147.689453125 ,1365.3818359375 ,10.735906600952 ,"( LV ) - School HQ"},
	{ -2581.0458984375 ,310.068359375 ,5.1855731010437 ,"( SF ) - Taxi HQ"},
	{ 1752.701171875 ,-1912.072265625 ,13.567472457886 ,"( LS ) - Taxi HQ"},
	{ 2261.6474609375 ,2036.0302734375 ,10.8203125 ,"( LV ) - Taxi HQ"},	
	{ -2726.9853515625 ,-314.861328125 ,7.1875 ,"( SF ) - Grove Street Family"},	
	{ -2182.8173828125 ,958.044921875 ,80 ,"( SF ) - Ballas Family"},	
	{ -2280.509765625 ,2288.4453125 ,4.962869644165 ,"( SF ) - Bloodz"},	
	{ -2624.1552734375 ,1411.6240234375 ,7.09375 ,"( SF ) - Los Aztecas"},	
	{ 944.41796875 ,1733.3330078125 ,8.8515625 ,"( LV ) - Crips"},	
	{ 1459.947265625 ,2773.40625 ,10.8203125 ,"( LV ) - Latino Kings"},	
	{ 2628.958984375 ,2346.8017578125 ,10.671875 ,"( LV ) - Rockers"},	
	{ 2659.6733398438 ,-1956.4921875 ,14.85000038147 ,"( LS ) - Arsenic Pinks"},
	{ 175.2080078125 ,-1309.30078125 ,69.941696166992 ,"( LS ) - Fast And Furious"},
	{ 948.2470703125 ,-1699.533203125 ,13.551179885864 ,"( LS ) - Vagos Family"},
}

	GpsBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/GPS.png", false)
	GpsHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, GpsBg)
    GpsLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, GpsBg)
    guiSetFont(GpsLabel1, PhFont)
    GpsLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, GpsBg)
    guiSetFont(GpsLabel2, PhFont)
    GpsCombo1 = guiCreateComboBox(33, 210, 174, 121, "", false, GpsBg)
	for i=1,#GpsLocationTable do 
		guiComboBoxAddItem(GpsCombo1, GpsLocationTable[i][4], i)
	end
	guiComboBoxSetSelected(GpsCombo1,0)
	GpsLocate = guiCreateStaticImage((238 - 150) / 2, 354, 150, 41, "Files/Textures/Locate.png", false, GpsBg)
	NowGpsMarker = nil
	NowGpsBlip = nil
	NowGpsCol = nil
	guiSetProperty(GpsBg, "Visible", "false")

	-- Phone Skills Gui --    
	
	SkillsBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Skills.png", false)
	SkillsHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, SkillsBg)
    SkillsLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, SkillsBg)
    guiSetFont(SkillsLabel1, PhFont)
	SkillsLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, SkillsBg)
    guiSetFont(SkillsLabel2, PhFont)
    SkillsLabel3 = guiCreateLabel(17, 100, 201, 53, "Skills", false, SkillsBg)
    guiSetFont(SkillsLabel3, PhFont16)
    guiLabelSetHorizontalAlign(SkillsLabel3, "center", false)
	guiLabelSetVerticalAlign(SkillsLabel3, "center")
    SkillsLabel4 = guiCreateLabel(18, 150, 200, 280, "Loading, Please Wait ...", false, SkillsBg)
    guiSetFont(SkillsLabel4, PhFont)
    guiLabelSetHorizontalAlign(SkillsLabel4, "center", false)
    guiLabelSetVerticalAlign(SkillsLabel4, "center")   
	guiSetProperty(SkillsBg, "Visible", "false")
	
	-- Phone Factions Gui --
    FactionsBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Factions.png", false)
    FactionsHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, FactionsBg)
    FactionsLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, FactionsBg)
    guiSetFont(FactionsLabel1, PhFont)
    FactionsLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, FactionsBg)
    guiSetFont(FactionsLabel2, PhFont)
    FactionsLabel3 = guiCreateLabel(21, 66, 193, 51, "Factions", false, FactionsBg)
    guiSetFont(FactionsLabel3, PhFont16)
    guiLabelSetHorizontalAlign(FactionsLabel3, "center", false)
    guiLabelSetVerticalAlign(FactionsLabel3, "center")
    FactionsLabel4 = guiCreateLabel(25, 119, 189, 310, "", false, FactionsBg)
    guiSetFont(FactionsLabel4, PhFont)
    guiLabelSetHorizontalAlign(FactionsLabel4, "center", false)
    guiLabelSetVerticalAlign(FactionsLabel4, "center")    
	guiSetProperty(FactionsBg, "Visible", "false")
	
	-- Phone Payment Gui --
	
    PaymentBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Payment.png", false)
	PaymentHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, PaymentBg)
	PaymentLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, PaymentBg)
	guiSetFont(PaymentLabel1, PhFont)
	PaymentLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, PaymentBg)
	guiSetFont(PaymentLabel2, PhFont)
	Balance = guiCreateStaticImage(42, 257, 155, 43, "Files/Textures/Click.png", false, PaymentBg)
	Transfer = guiCreateStaticImage(42, 304, 155, 43, "Files/Textures/Click.png", false, PaymentBg)
	BuyCredit = guiCreateStaticImage(42, 347, 155, 43, "Files/Textures/Click.png", false, PaymentBg)  
	guiSetProperty(PaymentBg, "Visible", "false")
	
	-- Phone Payment Balance Gui --
	
	BalanceBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Balance.png", false)
	BalanceHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, BalanceBg)
	BalanceLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, BalanceBg)
	guiSetFont(BalanceLabel1, PhFont)
	BalanceLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, BalanceBg)
	guiSetFont(BalanceLabel2, PhFont)
	BalanceLabel3 = guiCreateLabel(45, 297, 145, 28, "25000000$", false, BalanceBg)
	guiSetFont(BalanceLabel3, PhFont)
	guiLabelSetHorizontalAlign(BalanceLabel3, "center", false)
	guiLabelSetVerticalAlign(BalanceLabel3, "center")  
	guiSetProperty(BalanceBg, "Visible", "false")
	
	-- Phone Payment Transfer Gui --
	TransferBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Transfer.png", false)

	TransferHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, TransferBg)
	TransferLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, TransferBg)
	guiSetFont(TransferLabel1, PhFont)
	TransferLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, TransferBg)
	guiSetFont(TransferLabel2, PhFont)
	TransferEdit1 = guiCreateEdit(71, 270, 131, 27, "", false, TransferBg)
	TransferLabel3 = guiCreateLabel(28, 270, 39, 26, "To:", false, TransferBg)
	guiSetFont(TransferLabel3, PhFont)
	guiLabelSetHorizontalAlign(TransferLabel3, "right", false)
	guiLabelSetVerticalAlign(TransferLabel3, "center")
	TransferLabel4 = guiCreateLabel(32, 313, 57, 22, "Amount:", false, TransferBg)
	guiSetFont(TransferLabel4, PhFont)
	guiLabelSetHorizontalAlign(TransferLabel4, "right", false)
	guiLabelSetVerticalAlign(TransferLabel4, "center")
	TransferEdit2 = guiCreateEdit(95, 309, 92, 26, "", false, TransferBg)
	TransferDone = guiCreateStaticImage(35, 393, 172, 40, "Files/Textures/Click.png", false, TransferBg)  
	guiSetProperty(TransferBg, "Visible", "false")	
	
	-- Phone BuyCredit Gui --
	BuyCreditBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/BuyCredit.png", false)
	BuyCreditHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, BuyCreditBg)
	BuyCreditLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, BuyCreditBg)
	guiSetFont(BuyCreditLabel1, PhFont)
	BuyCreditLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, BuyCreditBg)
	guiSetFont(BuyCreditLabel2, PhFont)
	B2200 = guiCreateStaticImage(48, 262, 142, 40, "Files/Textures/Click.png", false, BuyCreditBg)
	B5500 = guiCreateStaticImage(48, 302, 142, 40, "Files/Textures/Click.png", false, BuyCreditBg)
    B11000 = guiCreateStaticImage(48, 342, 142, 40, "Files/Textures/Click.png", false, BuyCreditBg) 
	guiSetProperty(BuyCreditBg, "Visible", "false")	
	
	-- Phone Call Gui --
    CallBg = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Call.png", false)
    CallHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, CallBg)
    guiSetProperty(CallHome, "ImageColours", "tl:FF7F7F7F tr:FF7F7F7F bl:FF7F7F7F br:FF7F7F7F")
    CallLabel1 = guiCreateLabel(23, 22, 49, 15, "21:35", false, CallBg)
    guiSetFont(CallLabel1, PhFont)
    guiLabelSetColor(CallLabel1, 127, 127, 127)
    CallLabel2 = guiCreateLabel(175, 22, 49, 15, " Irancell", false, CallBg)
    guiSetFont(CallLabel2, PhFont)
    guiLabelSetColor(CallLabel2, 127, 127, 127)
	CallNumberLabel = guiCreateLabel(23, 83, 191, 48, "", false, CallBg)
    guiSetFont(CallNumberLabel, PhFont16)
    guiLabelSetColor(CallNumberLabel, 127, 127, 127)
    guiLabelSetHorizontalAlign(CallNumberLabel, "center", false)
    guiLabelSetVerticalAlign(CallNumberLabel, "center")
    CNum1 = guiCreateStaticImage(29, 154, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum2 = guiCreateStaticImage(92, 154, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum3 = guiCreateStaticImage(155, 154, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum4 = guiCreateStaticImage(33, 208, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum5 = guiCreateStaticImage(92, 208, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum6 = guiCreateStaticImage(155, 208, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum7 = guiCreateStaticImage(33, 263, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum8 = guiCreateStaticImage(92, 263, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum9 = guiCreateStaticImage(155, 263, 53, 50, "Files/Textures/Click.png", false, CallBg)
    Setare = guiCreateStaticImage(33, 319, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CNum0 = guiCreateStaticImage(92, 319, 53, 50, "Files/Textures/Click.png", false, CallBg)
    Moraba = guiCreateStaticImage(155, 319, 53, 50, "Files/Textures/Click.png", false, CallBg)
    Call = guiCreateStaticImage(92, 379, 53, 50, "Files/Textures/Click.png", false, CallBg)
    CallClear = guiCreateStaticImage(155, 379, 53, 50, "Files/Textures/Click.png", false, CallBg)    
	guiSetProperty(CallBg, "Visible", "false")	
	-- Phone in Call --
	
    inCallBG = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Calling.png", false)

    inCallLabelTime = guiCreateLabel(23, 22, 49, 15, "21:35", false, inCallBG)
    guiSetFont(inCallLabelTime, PhFont)
    inCallLabelEnix = guiCreateLabel(175, 22, 49, 15, " Irancell", false, inCallBG)
    guiSetFont(inCallLabelEnix, PhFont)
    inCallLabelShomare = guiCreateLabel(26, 75, 188, 48, "7808080", false, inCallBG)
    guiSetFont(inCallLabelShomare, PhFont16)
    guiLabelSetHorizontalAlign(inCallLabelShomare, "center", false)
    guiLabelSetVerticalAlign(inCallLabelShomare, "center")
    inCallLabelName = guiCreateLabel(26, 114, 188, 48, "ExoPrim", false, inCallBG)
    guiSetFont(inCallLabelName, PhFont16)
    guiLabelSetHorizontalAlign(inCallLabelName, "center", false)
    guiLabelSetVerticalAlign(inCallLabelName, "center")
    inCallLabel = guiCreateLabel(26, 134, 188, 48, "Calling...", false, inCallBG)
    guiSetFont(inCallLabel, PhFont)
    guiLabelSetHorizontalAlign(inCallLabel, "center", false)
    guiLabelSetVerticalAlign(inCallLabel, "center")
    dokme_ghat = guiCreateStaticImage(90, 379, 58, 49, "Files/Textures/Click.png", false, inCallBG)  
	guiSetProperty(inCallBG, "Visible", "false")	

	-------------- Accept or Reject Phone
		a_d_BG = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/A_D_Call.png", false)

        a_d_Time = guiCreateLabel(23, 22, 49, 15, "21:35", false, a_d_BG)
        guiSetFont(a_d_Time, PhFont)
        a_d_EniX = guiCreateLabel(175, 22, 49, 15, " Irancell", false, a_d_BG)
        guiSetFont(a_d_EniX, PhFont)
        a_d_Shomare = guiCreateLabel(26, 66, 188, 48, "7808080", false, a_d_BG)
        guiSetFont(a_d_Shomare, PhFont)
        guiLabelSetHorizontalAlign(a_d_Shomare, "center", false)
        guiLabelSetVerticalAlign(a_d_Shomare, "center")
        a_d_Name = guiCreateLabel(26, 114, 188, 48, "ExoPrim", false, a_d_BG)
        guiSetFont(a_d_Name, PhFont16)
        guiLabelSetHorizontalAlign(a_d_Name, "center", false)
        guiLabelSetVerticalAlign(a_d_Name, "center")
        a_d_Matn = guiCreateLabel(26, 134, 188, 48, "is Calling you..", false, a_d_BG)
        guiSetFont(a_d_Matn, PhFont)
        guiLabelSetHorizontalAlign(a_d_Matn, "center", false)
        guiLabelSetVerticalAlign(a_d_Matn, "center")
        Decline = guiCreateStaticImage(25, 382, 65, 67, "Files/Textures/Click.png", false, a_d_BG)
        Accept = guiCreateStaticImage(139, 382, 65, 67, "Files/Textures/Click.png", false, a_d_BG)    
		guiSetProperty(a_d_BG, "Visible", "false")	

		----------------- Calc
        CalcBackground = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Calculator.png", false)

        CalcHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, CalcBackground)
        CalcTime = guiCreateLabel(23, 22, 49, 15, "21:35", false, CalcBackground)
        guiSetFont(CalcTime, PhFont)
        CalcEnix = guiCreateLabel(175, 22, 49, 15, " Irancell", false, CalcBackground)
        guiSetFont(CalcEnix, PhFont)
        AC_Button = guiCreateStaticImage(26, 206, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Mosbat_Manfi_Button = guiCreateStaticImage(72, 206, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Darsad_Button = guiCreateStaticImage(119, 206, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Taghsim_Button = guiCreateStaticImage(165, 206, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a7 = guiCreateStaticImage(26, 254, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a8 = guiCreateStaticImage(73, 254, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a9 = guiCreateStaticImage(118, 254, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a4 = guiCreateStaticImage(26, 302, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a5 = guiCreateStaticImage(73, 302, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a6 = guiCreateStaticImage(118, 302, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a1 = guiCreateStaticImage(26, 350, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a2 = guiCreateStaticImage(73, 350, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a3 = guiCreateStaticImage(119, 350, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Noghte = guiCreateStaticImage(119, 398, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        a0 = guiCreateStaticImage(27, 398, 92, 43, "Files/Textures/Click.png", false, CalcBackground)
        IDK = guiCreateStaticImage(165, 206, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Zarb_Button = guiCreateStaticImage(165, 254, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Menha_Button = guiCreateStaticImage(165, 302, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Jame_Button = guiCreateStaticImage(165, 350, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        Mosavi = guiCreateStaticImage(165, 398, 46, 48, "Files/Textures/Click.png", false, CalcBackground)
        TextBox = guiCreateLabel(22, 131, 199, 75, "TextBox", false, CalcBackground)
        guiSetFont(TextBox, PhFont16)
        guiLabelSetHorizontalAlign(TextBox, "center", false)
        guiLabelSetVerticalAlign(TextBox, "center")  
		guiSetProperty(CalcBackground, "Visible", "false")	
		
	------- Shop Page 1 
		


	------- Tiwters
		
    TiwtMainBG = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/Twit.png", false)
    TiwtMainPageHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, TiwtMainBG)
    ShopMainPageTime = guiCreateLabel(23, 22, 49, 15, "21:35", false, TiwtMainBG)
    guiSetFont(ShopMainPageTime, PhFont)
    TiwtMaintPageEnix = guiCreateLabel(175, 22, 49, 15, " Irancell", false, TiwtMainBG)
    guiSetFont(TiwtMaintPageEnix, PhFont)
	guiSetProperty(TiwtMainBG, "Visible", "false")
	TwitText = guiCreateEdit(40, 210, 95, 80, "", false, TiwtMainBG)
	guiEditSetMaxLength ( TwitText, 70 )
	SendTwit = guiCreateStaticImage(91, 293, 60, 30, "Files/Textures/Click.png", false, TiwtMainBG)
	onNotf = guiCreateStaticImage(45, 362, 60, 30, "Files/Textures/Click.png", false, TiwtMainBG)
	offNotf = guiCreateStaticImage(134, 362, 60, 30, "Files/Textures/Click.png", false, TiwtMainBG)
			
	------- Vote Bet
		
    VoteMainBG = guiCreateStaticImage(screenW - 238 - 10, (screenH - 485) / 2, 238, 485, "Files/Textures/vote.png", false)
    VoteMainPageHome = guiCreateStaticImage(64, 451, 116, 8, "Files/Textures/HomeButton.png", false, VoteMainBG)
    ShopMainPageTime = guiCreateLabel(23, 22, 49, 15, "21:35", false, VoteMainBG)
    guiSetFont(ShopMainPageTime, PhFont)
    voteMaintPageEnix = guiCreateLabel(175, 22, 49, 15, " Irancell", false, VoteMainBG)
    guiSetFont(voteMaintPageEnix, PhFont)
	guiSetProperty(VoteMainBG, "Visible", "false")
	
	votepers = guiCreateStaticImage(40, 270, 30, 30, "Files/Textures/Click.png", false, VoteMainBG)-- Ray Be Perspolice
	voteest = guiCreateStaticImage(170, 270, 30, 30, "Files/Textures/Click.png", false, VoteMainBG)-- Ray Be Esteghlal
	
    Votes = guiCreateLabel(45, 402, 30, 30, "Loading...", false, VoteMainBG)
	guiLabelSetColor(Votes,255 , 0 , 0 )
    guiSetFont(Votes, PhFont)
    guiLabelSetHorizontalAlign(Votes, "center", false)
    guiLabelSetVerticalAlign(Votes, "center")
	
    Voterss = guiCreateLabel(163, 402, 30, 30, "Loading...", false, VoteMainBG)
	guiLabelSetColor(Voterss,0 , 0 , 255 )
    guiSetFont(Voterss, PhFont)
    guiLabelSetHorizontalAlign(Voterss, "center", false)
    guiLabelSetVerticalAlign(Voterss, "center")   
			


-------------------------
---- Phone Scripting ----
-------------------------

function UnHidePhone()
	local Alpha = guiGetAlpha( NowShowingPhoneGui )
	local NextAlpha = Alpha + 0.05
	guiSetAlpha( NowShowingPhoneGui , NextAlpha )
	if tonumber( NextAlpha ) > 1 then
		removeEventHandler("onClientRender", root, UnHidePhone)
	end
end

function HidePhone()
	local Alpha = guiGetAlpha( NowShowingPhoneGui )
	local NextAlpha = Alpha - 0.05
	guiSetAlpha( NowShowingPhoneGui , NextAlpha )
	if tonumber( NextAlpha ) < 0 then
		guiSetAlpha( NowShowingPhoneGui, 1 )
		guiSetProperty( NowShowingPhoneGui, "Visible", "false" )
		NowShowingPhoneGui = nil
		NowClockGui = nil
		removeEventHandler( "onClientRender", root, HidePhone )
	end
end

function DestroyMarked( theElement, matchingDimension )
	if ( theElement == localPlayer ) then
		exports["notf"]:addNotification( "Shoma Be Maghsad Residid." , 'success')
		removeEventHandler( "onClientColShapeHit", NowGpsCol, DestroyMarked )
		destroyElement(NowGpsMarker)
		destroyElement(NowGpsBlip)
		destroyElement(NowGpsCol)
		NowGpsMarker = nil
		NowGpsBlip = nil
		NowGpsCol = nil
	end
end

function deleteLastCharacter(str)
	return(str:gsub("[%z\1-\127\194-\244][\128-\191]*$", ""))
end

local supportedCharacters = {
	["q"] = true, ["w"] = true, ["x"] = true, ["4"] = true, ["T"] = true, ["Z"] = true, ["V"] = true,
	["e"] = true, ["r"] = true, ["c"] = true, ["5"] = true, ["U"] = true, ["I"] = true, ["B"] = true,
	["t"] = true, ["z"] = true, ["v"] = true, ["6"] = true, ["O"] = true, ["P"] = true, ["N"] = true,
	["u"] = true, ["i"] = true, ["b"] = true, ["7"] = true, ["A"] = true, ["S"] = true, ["M"] = true,
	["o"] = true, ["p"] = true, ["n"] = true, ["8"] = true, ["D"] = true, ["F"] = true, ["#"] = true,
	["a"] = true, ["s"] = true, ["m"] = true, ["9"] = true, ["G"] = true, ["H"] = true, ["@"] = true,
	["d"] = true, ["f"] = true, ["0"] = true, ["-"] = true, ["J"] = true, ["K"] = true, ["."] = true,
	["g"] = true, ["h"] = true, ["1"] = true, ["_"] = true, ["L"] = true, ["Y"] = true,
	["j"] = true, ["k"] = true, ["2"] = true, ["Q"] = true, ["W"] = true, ["X"] = true,
	["l"] = true, ["y"] = true, ["3"] = true, ["E"] = true, ["R"] = true, ["C"] = true,
}


addEventHandler("onClientGUIClick", root,
function ()
	if source == MainHomeButton then
		if not isEventHandlerAdded( 'onClientRender', root, HidePhone ) and not isEventHandlerAdded( 'onClientRender', root, UnHidePhone ) then
			playSound("Files/Sounds/Touch.ogg")
			addEventHandler ( "onClientRender", root, HidePhone )
			triggerServerEvent("onClientPhoneAnimStoped", resourceRoot)
			guiSetInputEnabled( false )
		end
	elseif	source == MClick1 then
		playSound("Files/Sounds/Touch.ogg")
		--if not getElementData(localPlayer,"Vip") then
			--exports["notf"]:addNotification( "** Baraye Estefade az in Application Bayad Shoma VIP Bashid **" , 'error')
			--return false
		--end
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( MusicBg, "Visible", "True" )
		NowShowingPhoneGui = MusicBg
		NowClockGui = MusicLabel1
	elseif	source == MClick3 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( OptionsBg, "Visible", "True" )
		NowShowingPhoneGui = OptionsBg
		NowClockGui = OptionsLabel1
	elseif	source == SendTwit then
		playSound("Files/Sounds/Touch.ogg")
		local TwitTexts = tostring(guiGetText(TwitText))
		triggerServerEvent("sendTwits",getLocalPlayer(),getLocalPlayer(), TwitTexts)
	elseif	source == onNotf then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("onNotF",getLocalPlayer(),getLocalPlayer())
	elseif	source == offNotf then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("offNotF",getLocalPlayer(),getLocalPlayer())
	elseif	source == MClick5 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( GpsBg, "Visible", "True" )
		NowShowingPhoneGui = GpsBg
		NowClockGui = GpsLabel1
	elseif	source == MClick11 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( FactionsBg, "Visible", "True" )
		NowShowingPhoneGui = FactionsBg
		NowClockGui = FactionsLabel1
		triggerServerEvent("RequestFactionMembers", localPlayer )
	elseif	source == MClick13 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( CallBg, "Visible", "True" )
		NowShowingPhoneGui = CallBg
		NowClockGui = CallLabel1
	elseif	source == MClick9 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( SkillsBg, "Visible", "True" )
		triggerServerEvent("onServerSkillPage", localPlayer)
		NowShowingPhoneGui = SkillsBg
		NowClockGui = SkillsLabel1
	elseif	source == votepers then 
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("votePerspolice",getLocalPlayer(),getLocalPlayer())
		triggerServerEvent("EstelVote", localPlayer )
		triggerServerEvent("PersVote", localPlayer )
	elseif	source == voteest then 
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("voteEsEs",getLocalPlayer(),getLocalPlayer())
		triggerServerEvent("EstelVote", localPlayer )
		triggerServerEvent("PersVote", localPlayer )
	elseif	source == MClick10 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( StatsPage1, "Visible", "True" )
		NowShowingPhoneGui = StatsPage1
		NowClockGui = Stats1Clock
		triggerServerEvent("RequestPlayerStats", localPlayer )
	elseif	source == MClick8 then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("ClientRequestPaymentLogin", localPlayer)
	elseif	source == StatsHomeButton then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( StatsPage1, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == CallHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( CallBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == OptionsHomeButton then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( OptionsBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == MusicHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( MusicBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == GpsHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( GpsBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == SkillsHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( SkillsBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		guiSetText( SkillsLabel4 , "Loading, Please Wait ...")
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == FactionsHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( FactionsBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == PaymentHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PaymentBg, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == CalcHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( CalcBackground, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == TiwtMainPageHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( TiwtMainBG, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == VoteMainPageHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( VoteMainBG, "Visible", "False" )
		guiSetProperty( PhoneMainBg, "Visible", "True" )
		NowShowingPhoneGui = PhoneMainBg
		NowClockGui = MClock
	elseif	source == Balance then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("ClientRequestBalance", localPlayer)
		
	elseif	source == Transfer then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PaymentBg, "Visible", "False" )
		guiSetProperty( TransferBg, "Visible", "True" )
		NowShowingPhoneGui = TransferBg
		NowClockGui = TransferLabel1
	elseif	source == BuyCredit then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PaymentBg, "Visible", "False" )
		guiSetProperty( BuyCreditBg, "Visible", "True" )
		NowShowingPhoneGui = BuyCreditBg
		NowClockGui = BuyCreditLabel1
	elseif	source == TransferHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( TransferBg, "Visible", "False" )
		guiSetProperty( PaymentBg, "Visible", "True" )
		NowShowingPhoneGui = PaymentBg
		NowClockGui = PaymentLabel1
	elseif	source == BalanceHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( BalanceBg, "Visible", "False" )
		guiSetProperty( PaymentBg, "Visible", "True" )
		NowShowingPhoneGui = PaymentBg
		NowClockGui = PaymentLabel1
	elseif	source == BuyCreditHome then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( BuyCreditBg, "Visible", "False" )
		guiSetProperty( PaymentBg, "Visible", "True" )
		NowShowingPhoneGui = PaymentBg
		NowClockGui = PaymentLabel1
	elseif	source == MClick2 then
		playSound("Files/Sounds/Touch.ogg")
		exports["notf"]:addNotification( "** Safari Darhal Sakht Mibashad! **" , 'info')
	elseif	source == MClick6 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( VoteMainBG, "Visible", "True" )
		NowShowingPhoneGui = VoteMainBG
		NowClockGui = ShopMainPageTime
		triggerServerEvent("EstelVote", localPlayer )
		triggerServerEvent("PersVote", localPlayer )
	
	elseif	source == MClick7 then
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( CalcBackground, "Visible", "True" )
		NowShowingPhoneGui = CalcBackground
		NowClockGui = CalcTime

	elseif	source == MClick15 then	
		playSound("Files/Sounds/Touch.ogg")
		guiSetProperty( PhoneMainBg, "Visible", "False" )
		guiSetProperty( TiwtMainBG, "Visible", "True" )
		NowShowingPhoneGui = TiwtMainBG
		NowClockGui = ShopMainPageTime
	elseif	source == MClick14 then
		playSound("Files/Sounds/Touch.ogg")
		exports["notf"]:addNotification( "** Application iMessage Darhal Hazer Ba Cmd /sms Mibashad! **" , 'info')
	elseif	source == RadioJavan then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			destroyElement( NowMusic )
			NowMusic = nil
		end
		NowMusic = playSound("http://radiofaaz.com:8000/radiofaaz")
		setSoundVolume(NowMusic, 0.5)
	elseif	source == VRock then
		playSound("Files/Sounds/Touch.ogg")
		exports["notf"]:addNotification( "** Coming Soon **" , 'info')
	elseif	source == ProFm then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			destroyElement( NowMusic )
			NowMusic = nil
		end
		NowMusic = playSound("http://198.178.123.11:7574/;stream/1")
		setSoundVolume(NowMusic, 0.5)
	elseif	source == TrapFm then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			destroyElement( NowMusic )
			NowMusic = nil
		end
		NowMusic = playSound("http://108.61.30.179:4010/;stream")
		setSoundVolume(NowMusic, 0.5)
	elseif	source == VolumeDown then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			if tonumber(getSoundVolume(NowMusic)) > 0.1 then
				setSoundVolume(NowMusic, tonumber(getSoundVolume(NowMusic))-0.1)
			end
		end
	elseif	source == VolumeUp then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			if tonumber(getSoundVolume(NowMusic)) < 0.9 then
				setSoundVolume(NowMusic, tonumber(getSoundVolume(NowMusic))+0.1)
			end
		end
	elseif	source == PausePlay then
		playSound("Files/Sounds/Touch.ogg")
		if NowMusic then
			if isSoundPaused(NowMusic) then
				setSoundPaused(NowMusic, false)
			else
				setSoundPaused(NowMusic, true)
			end
		end
	elseif	source == SpawnCivilian then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlayerSpawn", localPlayer, 0 )
	elseif	source == SpawnHouse then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlayerSpawn", localPlayer, 1 )
	elseif	source == SpawnFaction then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlayerSpawn", localPlayer, 2 )
	elseif	source == SpawnClan then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlayerSpawn", localPlayer, 3 )
	elseif source == TransferDone then
		if tonumber( guiGetText(TransferEdit2) ) > 4999 then
			playSound("Files/Sounds/Touch.ogg")
			triggerServerEvent( "RequestMobileTransfer", localPlayer , tonumber( guiGetText(TransferEdit2) ) , tonumber( guiGetText(TransferEdit1) ) )
		else
			exports["notf"]:addNotification( "Hadaghal Mablagh Baraye Enteghal 5000$ Ast!" , 'info' )
		end
	elseif source == B2200 then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent( "RequestPhoneBuyCredit", localPlayer , 2000 , 2200 )
	elseif source == B5500 then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent( "RequestPhoneBuyCredit", localPlayer , 5000 , 5500 )
	elseif source == B11000 then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent( "RequestPhoneBuyCredit", localPlayer , 10000 , 11000 )
	elseif source == GpsLocate then
		playSound("Files/Sounds/Touch.ogg")
		if NowGpsMarker then
			removeEventHandler( "onClientColShapeHit", NowGpsCol, DestroyMarked )
			destroyElement(NowGpsMarker)
			destroyElement(NowGpsBlip)
			destroyElement(NowGpsCol)
			NowGpsMarker = nil
			NowGpsBlip = nil
			NowGpsCol = nil
		end
		i = tonumber(guiComboBoxGetSelected(GpsCombo1)) + 1
		if i then
			NowGpsMarker = createMarker(GpsLocationTable[i][1],GpsLocationTable[i][2],GpsLocationTable[i][3]-2,"checkpoint",2,255, 255, 0,200)
			NowGpsBlip = createBlipAttachedTo( NowGpsMarker, 56, 2, 255, 0, 0, 255,  0 , 65535 )
			setBlipVisibleDistance(NowGpsBlip, 16383)
			NowGpsCol = createColCircle( GpsLocationTable[i][1],GpsLocationTable[i][2] ,50)
			addEventHandler("onClientColShapeHit", NowGpsCol, DestroyMarked )
			exports["notf"]:addNotification( "Location Ba Movafaghiat Baraye Shoma Mark Shod!" , 'success')
		else
			exports["notf"]:addNotification( "Moshkeli Pish Amade, Dobare Emtehan Konid!" , 'error')
		end
	elseif	source == RingtoneTest then
		playSound("Files/Sounds/Touch.ogg")
		if NowPlayingRingtone then
			stopSound(NowPlayingRingtone)
			NowPlayingRingtone = nil
		else
			i = tonumber(guiComboBoxGetSelected(RingtoneCombo)) + 1
			NowPlayingRingtone = playSound("Files/Sounds/Ringtune"..i..".mp3")
			local RingLength = math.floor(tonumber(getSoundLength(NowPlayingRingtone))) * 1000
			setTimer( function()
				if NowPlayingRingtone then
					NowPlayingRingtone = nil
				end
			end, RingLength, 1)
		end
	elseif source == SmsTest then
		playSound("Files/Sounds/Touch.ogg")
		if NowPlayingSms then
			stopSound(NowPlayingSms)
			NowPlayingSms = nil
		else
			i = tonumber(guiComboBoxGetSelected(SmsCombo)) + 1
			NowPlayingSms = playSound("Files/Sounds/Smstune"..i..".mp3")
			local RingLength = math.floor(tonumber(getSoundLength(NowPlayingSms))) * 1000
			setTimer( function()
				if NowPlayingSms then
					NowPlayingSms = nil
				end
			end, RingLength, 1)
		end
	elseif source == CallClear then
		playSound("Files/Sounds/Touch.ogg")
		if guiGetText(CallNumberLabel) ~= "" then
			guiSetText( CallNumberLabel , deleteLastCharacter(guiGetText(CallNumberLabel)))
		end
	elseif source == CNum0 then
		playSound("Files/Sounds/0.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."0" )
		end
	elseif source == CNum1 then
		playSound("Files/Sounds/1.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."1" )
		end
	elseif source == CNum2 then
		playSound("Files/Sounds/2.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."2" )
		end
	elseif source == CNum3 then
		playSound("Files/Sounds/3.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."3" )
		end
	elseif source == CNum4 then
		playSound("Files/Sounds/4.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."4" )
		end
	elseif source == CNum5 then
		playSound("Files/Sounds/5.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."5" )
		end
	elseif source == CNum6 then
		playSound("Files/Sounds/6.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."6" )
		end
	elseif source == CNum7 then
		playSound("Files/Sounds/7.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."7" )
		end
	elseif source == CNum8 then
		playSound("Files/Sounds/8.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."8" )
		end
	elseif source == CNum9 then
		playSound("Files/Sounds/9.mp3")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."9" )
		end
	elseif source == Setare then
		playSound("Files/Sounds/Touch.ogg")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."*" )
		end
	elseif source == Moraba then
		playSound("Files/Sounds/Touch.ogg")
		if #tostring(guiGetText(CallNumberLabel)) ~= 7 then
			local CallNumberLabelText = guiGetText(CallNumberLabel)
			guiSetText( CallNumberLabel , ""..CallNumberLabelText.."#" )
		end
	elseif source == Call then
		playSound("Files/Sounds/Touch.ogg")
		if guiGetText(CallNumberLabel) ~= "" then
			triggerServerEvent("ExecutePlayerCall", localPlayer , guiGetText(CallNumberLabel) )
			guiSetText( CallNumberLabel , "" )
			--[[if not isEventHandlerAdded( 'onClientRender', root, HidePhone ) and not isEventHandlerAdded( 'onClientRender', root, UnHidePhone ) then
				addEventHandler ( "onClientRender", root, HidePhone )
			end]]
		end
	elseif source == SmsSet then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlaySmsSound", localPlayer , tonumber(guiComboBoxGetSelected(SmsCombo)) + 1 )
	elseif source == RingtoneSet then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("SetPlayRingSound", localPlayer , tonumber(guiComboBoxGetSelected(RingtoneCombo)) + 1 )
	elseif source == Accept then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("onClientSeen", localPlayer, 2)
	elseif source == Decline then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("onClientSeen", localPlayer, 1)
	elseif source == dokme_ghat then
		playSound("Files/Sounds/Touch.ogg")
		triggerServerEvent("onClientSeen", localPlayer, 1)	

	end
end)

addEvent("OpenMobilePaymentPage",true)
addEventHandler("OpenMobilePaymentPage", root,
function ()
	guiSetProperty( PhoneMainBg, "Visible", "False" )
	guiSetProperty( PaymentBg, "Visible", "True" )
	NowShowingPhoneGui = PaymentBg
	NowClockGui = PaymentLabel1
end)

addEvent("SendMobileBalance",true)
addEventHandler("SendMobileBalance", root,
function (NowBalance)
	guiSetProperty( PaymentBg, "Visible", "False" )
	guiSetProperty( BalanceBg, "Visible", "True" )
	NowShowingPhoneGui = BalanceBg
	NowClockGui = BalanceLabel1
	guiSetText( BalanceLabel3 , ""..NowBalance.."$" )
end)

addEvent("SendStats",true)
addEventHandler("SendStats", root,
function (StatsString)
	guiSetText( Stats1 , ""..StatsString.."" )
end)

addEvent("SendFactions",true)
addEventHandler("SendFactions", root,
function (FactionsString)
	guiSetText( FactionsLabel4 , ""..FactionsString.."" )
end)


addEvent("SendVotes",true)
addEventHandler("SendVotes", root,
function (NowStrings)
	guiSetText( Voterss , ""..NowStrings.."" )
end)

addEvent("SendVote",true)
addEventHandler("SendVote", root,
function (NowString)
	guiSetText( Votes , ""..NowString.."" )
end)
--[[local pRingSound = {}
local pSmsSound = {}

addEvent("PlayRingtone", true)
addEventHandler("PlayRingtone", root, function(SoundId)
	local SoundId = tonumber(SoundId)
    local s2 = playSound("Files/Sounds/Ringtune"..SoundId..".mp3", true)
    setSoundVolume(s2, 0.5)
    pRingSound[localPlayer] = s2
end)

addEvent("PlaySmsSound", true)
addEventHandler("PlaySmsSound", root, function(SoundId)
    local s2 = playSound("Files/Sounds/Smstune"..SoundId..".mp3", false)
	setSoundVolume(s2, 0.5)
	pSmsSound[localPlayer] = s2
end)]]

local pRingSound = {}

addEvent("PlayRingtone", true)
addEventHandler("PlayRingtone", getRootElement(), function(player , SoundId)
    local s2 = playSound3D("Files/Sounds/Ringtune"..SoundId..".mp3", 0, 0, 0, true)
    setSoundMaxDistance(s2, 20)
	setSoundVolume(s2, 0.5)
    attachElements(s2, player)
    pRingSound[player] = s2
end)

addEvent("PlaySmsSound", true)
addEventHandler("PlaySmsSound", getRootElement(), function(player , SoundId)
    local s2 = playSound3D("Files/Sounds/Smstune"..SoundId..".mp3", 0, 0, 0)
    setSoundMaxDistance(s2, 20)
	setSoundVolume(s2, 0.5)
    attachElements(s2, player)
end)

addEvent("StopRingtone", true)
addEventHandler("StopRingtone", getRootElement(), function(player)
	if pRingSound[player] then
		if isElement(pRingSound[player]) then
			destroyElement (pRingSound[player])
			pRingSound[player] = nil
		end
	end
end)

addEventHandler ( "onClientRender", root,
function ()
	if NowClockGui then
		local time = getRealTime()
		local H, M = time.hour, time.minute
		if #tostring( H ) == 1 then
			H = "0"..tostring( H )
		end	
		if #tostring( M ) == 1 then
			M = "0"..tostring( M )
		end	
		guiSetText( NowClockGui, ""..H.." : "..M.."" )
	end
end)
	
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
end

addEventHandler( "onClientKey", root, function(button,press) 
	if getElementData(localPlayer, "loggedIn") == true then
		if (press) then
			if not isChatBoxInputActive() then
				if button == "b" then
					if not NowShowingPhoneGui then
						if not isEventHandlerAdded( 'onClientRender', root, HidePhone ) and not isEventHandlerAdded( 'onClientRender', root, UnHidePhone ) then
							if not getElementData(localPlayer,"offe") then--need to fix
								guiSetAlpha(PhoneMainBg, 0)
								guiSetProperty(PhoneMainBg, "Visible", "true")
								NowShowingPhoneGui = PhoneMainBg
								NowClockGui = MClock
								addEventHandler ( "onClientRender", root, UnHidePhone )
								triggerServerEvent("onClientPhoneAnimStarted", resourceRoot)

								guiSetInputEnabled( true )
							end
						end
					else
						if not isEventHandlerAdded( 'onClientRender', root, HidePhone ) and not isEventHandlerAdded( 'onClientRender', root, UnHidePhone ) then

							guiSetInputEnabled( false )
							addEventHandler ( "onClientRender", root, HidePhone )
							triggerServerEvent("onClientPhoneAnimStoped", resourceRoot)
						end
					end
				end
			end
		end
	end
end)

function refreshSkillPage(inp1, inp2, inp3, inp4, inp5, inp6, inp7)
	for i = 69 , 78 do
		gunStats[i] = getPedStat(localPlayer, i)
	end
	if inp1 and inp2 and inp3 and inp4 and inp5 and inp6 and inp7 then
		setTimer(function ()
			guiSetText( SkillsLabel4, "Pistol: "..gunStats[69].."/1000\nSilenced Pistol: "..gunStats[70].."/1000\nDesert Eagle: "..gunStats[71].."/1000\nShotgun: "..gunStats[72].."/1000\nSawn-off: "..gunStats[73].."/1000\nSpaz12: "..gunStats[74].."/1000\nUzi: "..gunStats[75].."/1000\nMP5: "..gunStats[76].."/1000\nAK47: "..gunStats[77].."/1000\nM4: "..gunStats[78].."/1000\n\nFisherMan: "..inp1.."\nBusDriver: "..inp2.."\nPizzaBoy: "..inp3.."\nSoda Delivery: "..inp4.."\nTrucker: "..inp5.."\nStreet Washer: "..inp6.."\n PostMan: "..inp7)
			gunStats = {}
		end, 1000, 1)
	end
end
addEvent("onClientSkillPage", true)
addEventHandler("onClientSkillPage", root, refreshSkillPage)

local inCallSound = nil
function isCalling(name, shomare, type)
	if name and shomare and type then
		if type == 1 then
			guiSetProperty(CallBg, "Visible", "false")
			guiSetProperty(a_d_BG, "Visible", "false")
			guiSetProperty(inCallBG, "Visible", "true")	
			guiSetText( inCallLabelName, name )
			guiSetText( inCallLabelShomare, shomare )
			NowClockGui = inCallLabelTime
			inCallSound = playSound("Files/Sounds/inCall.mp3", true)
		elseif type == 2 then
			guiSetProperty(CallBg, "Visible", "false")
			guiSetProperty(a_d_BG, "Visible", "true")	
			guiSetText( a_d_Name, name )
			guiSetText( a_d_Shomare, shomare )
			NowClockGui = a_d_Time
			triggerServerEvent("onClientPhoneAnimStarted", resourceRoot)
		elseif type == 3 then
			guiSetProperty(CallBg, "Visible", "false")
			guiSetProperty(a_d_BG, "Visible", "false")
			guiSetProperty(inCallBG, "Visible", "true")	
			guiSetText( inCallLabelName, name )
			guiSetText( inCallLabelShomare, shomare )
			NowClockGui = inCallLabelTime
		end
	end
end
addEvent("onClientCalling", true)
addEventHandler("onClientCalling", root, isCalling)

function stopCall()
	guiSetProperty(inCallBG, "Visible", "false")
	guiSetProperty(a_d_BG, "Visible", "false")
	sec = 0
	min = 0
	secound = 0
	minute = 0
	guiSetText(inCallLabel, "Calling...")
	if inCallSound then
		stopSound(inCallSound)
		inCallSound = nil
	end
	playSound("Files/Sounds/hangup.mp3", false)
	triggerServerEvent("onClientPhoneAnimStoped", resourceRoot)
end
addEvent("onClientStopCall", true)
addEventHandler("onClientStopCall", root, stopCall)

function acceptCall()
	guiSetProperty(a_d_BG, "Visible", "false")
	guiSetProperty(inCallBG, "Visible", "true")
end
addEvent("onClientAcceptCall", true)
addEventHandler("onClientAcceptCall", root, acceptCall)

addEvent("stopInCallSound", true)
addEventHandler("stopInCallSound", root, function()
	if inCallSound then
		stopSound(inCallSound)
		inCallSound = nil
	end
end)

addEvent("onClientTimerRefresh", true)
addEventHandler("onClientTimerRefresh", root, function()
	if sec < 60 then
		sec = sec + 1
	end
	if sec == 60 then
		sec = 0
		min = min + 1
	end
	if sec < 10 then
		secound = "0"..sec
	else
		secound = sec
	end
	if min < 10 then
		minute = "0"..min
	else
		minute = min
	end
	guiSetText(inCallLabel,minute..":"..secound)
end)

local txd = engineLoadTXD("Files/cellphone.txd")
engineImportTXD(txd, 330)
local dff = engineLoadDFF("Files/cellphone.dff")
engineReplaceModel(dff, 330)


function playss()
	playSound("Files/Sounds/twitt.mp3")
end
addEvent("playTwitt", true)
addEventHandler("playTwitt",getLocalPlayer(), playss)