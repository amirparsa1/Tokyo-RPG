NowTune = 0 -- Noee Tune Entekhab Shode
NowTuneTest = 0 -- Noee Tune Entekhab Shode
TunePrice = 0
TunePay = 0 -- Dastmozde Mechanic
TuneSarjam = 0 -- Poli Ke Server Take Mikone Az Moshtari
Moshtari = nil -- Esme Moshtari
CarID = nil -- vID Car Moshtari Dar data Base

local font = guiCreateFont("Tunings/Data/GOTHIC.ttf", 11)
local font1 = guiCreateFont("Tunings/Data/GOTHIC.ttf", 11)
local font2 = guiCreateFont("Tunings/Data/GOTHIC.ttf", 9)

local screenW, screenH = guiGetScreenSize()

local idCarSpoilerTrue = {
[502]=true,[503]=true,[496]=true,[560]=true,
[541]=true,[562]=true,[550]=true,
}

local idCarPaintJobTrue = {
[534]=true,[535]=true,[536]=true,
[560]=true,[561]=true,
[567]=true,[575]=true,[576]=true,
}


TuneWindow = guiCreateWindow((screenW - 800) / 2, (screenH - 550) / 2, 800, 550, "Tune Panel", false)
guiSetProperty(TuneWindow, "Visible", "False")
bg = guiCreateStaticImage(0, 0, 800, 550,"Tunings/Data/bg.png",false, TuneWindow)
guiWindowSetSizable(TuneWindow, false)
--Custom = guiCreateStaticImage(0, 200, 80, 80,"Tunings/Data/Engine_Custom.jpg",false, bg)


bgmatn = guiCreateStaticImage(20, 270, 740, 210,"Tunings/Data/kadr.png",false, bg)

Nitrolabale = guiCreateLabel(292-9, 33+50+50, 150, 50, "Nitro:", false, bg)
guiSetFont(Nitrolabale, font2)
Nitro = guiCreateComboBox(350, 33+50+49, 110, 80, "Select", false, bg)
guiComboBoxAddItem ( Nitro, "2x")
guiComboBoxAddItem ( Nitro, "5x")
guiComboBoxAddItem ( Nitro, "10x")

RingLabal = guiCreateLabel(292-9, 33, 150, 50, "Ring:", false, bg)
guiSetFont(RingLabal, font2)
Ring = guiCreateComboBox(350, 32, 110, 150, "Select", false, bg)
guiComboBoxAddItem ( Ring, "1073")
guiComboBoxAddItem ( Ring, "1074")
guiComboBoxAddItem ( Ring, "1075")
guiComboBoxAddItem ( Ring, "1076")
guiComboBoxAddItem ( Ring, "1077")
guiComboBoxAddItem ( Ring, "1078")
guiComboBoxAddItem ( Ring, "1079")
guiComboBoxAddItem ( Ring, "1080")
guiComboBoxAddItem ( Ring, "1081")
guiComboBoxAddItem ( Ring, "1082")
guiComboBoxAddItem ( Ring, "1083")
guiComboBoxAddItem ( Ring, "1084")
guiComboBoxAddItem ( Ring, "1085")
guiComboBoxAddItem ( Ring, "1096")
guiComboBoxAddItem ( Ring, "1097")
guiComboBoxAddItem ( Ring, "1098")

ErtefaLabel2 = guiCreateLabel(7, 33+50+50+50, 150, 50, "Ertefa:", false, bg)
guiSetFont(ErtefaLabel2, font2)
Ertefa2 = guiCreateComboBox(126+6-20, 33+50+50+49, 110, 150, "Select", false, bg)
guiComboBoxAddItem ( Ertefa2, "+ 3")
guiComboBoxAddItem ( Ertefa2, "+ 2")
guiComboBoxAddItem ( Ertefa2, "+ 1")
guiComboBoxAddItem ( Ertefa2, "1 (Normal)")
guiComboBoxAddItem ( Ertefa2, "- 1")
guiComboBoxAddItem ( Ertefa2, "- 2")
guiComboBoxAddItem ( Ertefa2, "- 3")
guiComboBoxAddItem ( Ertefa2, "- 4")
guiComboBoxAddItem ( Ertefa2, "- 5")
guiComboBoxAddItem ( Ertefa2, "- 6")
guiComboBoxAddItem ( Ertefa2, "- 7")
guiComboBoxAddItem ( Ertefa2, "- 8")
guiComboBoxAddItem ( Ertefa2, "- 9")
guiComboBoxAddItem ( Ertefa2, "- 10")

CMassLabel = guiCreateLabel(7+500, 180, 150, 50, "Center Mass:", false, bg)
guiSetFont(CMassLabel, font2)
CMass = guiCreateComboBox(592+15, 179, 150, 150, "Select", false, bg)
guiComboBoxAddItem ( CMass, "-0.3 (Medium)")
guiComboBoxAddItem ( CMass, "-0.4 (High)")
guiComboBoxAddItem ( CMass, "-0.5 (Very High)")

SusForceLabel = guiCreateLabel(500-10, 180+50, 150, 50, "Suspension Force:", false, bg)
guiSetFont(SusForceLabel, font2)
SusForce = guiCreateComboBox(592+15, 179+50, 150, 150, "Select", false, bg)
guiComboBoxAddItem ( SusForce, "0.5")
guiComboBoxAddItem ( SusForce, "0.6")
guiComboBoxAddItem ( SusForce, "0.7")
guiComboBoxAddItem ( SusForce, "0.8")
guiComboBoxAddItem ( SusForce, "0.9")
guiComboBoxAddItem ( SusForce, "1")
guiComboBoxAddItem ( SusForce, "1.2")
guiComboBoxAddItem ( SusForce, "1.4")
guiComboBoxAddItem ( SusForce, "1.6")
guiComboBoxAddItem ( SusForce, "1.8")
guiComboBoxAddItem ( SusForce, "2")
guiComboBoxAddItem ( SusForce, "2.2")
guiComboBoxAddItem ( SusForce, "2.4")
guiComboBoxAddItem ( SusForce, "2.6")
guiComboBoxAddItem ( SusForce, "2.8")
guiComboBoxAddItem ( SusForce, "3")



SpoilerLabel = guiCreateLabel(7, 233, 150, 50, "Spoiler:", false, bg)
guiSetFont(SpoilerLabel, font2)
Spoiler = guiCreateComboBox(126+6-20, 233, 110, 150, "Select", false, bg)

HydraulicsLabal = guiCreateLabel(292-9, 233, 150, 50, "Hydraulic:", false, bg)
guiSetFont(HydraulicsLabal, font2)
Hydraulics = guiCreateComboBox(350, 233, 110, 80, "Select", false, bg)
guiComboBoxAddItem ( Hydraulics, "Active")
guiComboBoxAddItem ( Hydraulics, "inactive")

TractionLossLabal = guiCreateLabel(8, 33+50, 150, 50, "Trac Loss:", false, bg)
guiSetFont(TractionLossLabal, font2)
TractionLoss = guiCreateComboBox(126+6-20, 33+49, 110, 150, "Select", false, bg)
guiComboBoxAddItem ( TractionLoss, "1")
guiComboBoxAddItem ( TractionLoss, "1.1")
guiComboBoxAddItem ( TractionLoss, "1.2")
guiComboBoxAddItem ( TractionLoss, "1.3")
guiComboBoxAddItem ( TractionLoss, "1.4")
guiComboBoxAddItem ( TractionLoss, "1.5")
guiComboBoxAddItem ( TractionLoss, "1.6")
guiComboBoxAddItem ( TractionLoss, "1.7")


--140
TarhLabal = guiCreateLabel(292-9, 33+50, 150, 50, "Tarh:", false, bg)
guiSetFont(TarhLabal, font2)
Tarh = guiCreateComboBox(350, 33+49, 110, 100, "Select", false, bg)
guiComboBoxAddItem ( Tarh, "1")
guiComboBoxAddItem ( Tarh, "2")
guiComboBoxAddItem ( Tarh, "3")
guiComboBoxAddItem ( Tarh, "inactive")

TractionMultiplier12 = guiCreateLabel(8, 33+50+50, 150, 50, "Trac Multiplier:", false, bg)
guiSetFont(TractionMultiplier12, font2)
TractionMultiplier = guiCreateComboBox(126+6-20, 33+50+49, 110, 150, "Select", false, bg)
guiComboBoxAddItem ( TractionMultiplier, "1")
guiComboBoxAddItem ( TractionMultiplier, "1.1")
guiComboBoxAddItem ( TractionMultiplier, "1.2")
guiComboBoxAddItem ( TractionMultiplier, "1.3")
guiComboBoxAddItem ( TractionMultiplier, "1.4")
guiComboBoxAddItem ( TractionMultiplier, "1.5")

TormozLabal = guiCreateLabel(292-9, 33+50+50+50, 150, 50, "Tormoz:", false, bg)
guiSetFont(TormozLabal, font2)
Tormoz = guiCreateComboBox(350, 33+50+50+49, 110, 80, "Select", false, bg)
guiComboBoxAddItem ( Tormoz, "Low")
guiComboBoxAddItem ( Tormoz, "Medium")
guiComboBoxAddItem ( Tormoz, "High")


EngineTypeLabal = guiCreateLabel(8, 33, 150, 50, "Differential:", false, bg)
guiSetFont(EngineTypeLabal, font2)
EngineType = guiCreateComboBox(126+6-20, 32, 110, 80, "Select", false, bg)
guiComboBoxAddItem ( EngineType, "awd (Medium)")
guiComboBoxAddItem ( EngineType, "fwd (High)")



Confirm = guiCreateButton(10, 493, 95, 36, "Apply", false, bg)
guiSetFont(Confirm, font1)
guiSetProperty(Confirm, "HoverTextColour", "FF00FF00" )
Cancel = guiCreateButton(678, 493, 95, 36, "Close", false, bg)
guiSetFont(Cancel, font1)
guiSetProperty(Cancel, "HoverTextColour", "FFFE0000" )

Refresh = guiCreateButton(573, 493, 95, 36, "Refresh", false, bg)
guiSetFont(Refresh, font1)
guiSetProperty(Refresh, "HoverTextColour", "FFCCBB00" )

Test = guiCreateButton(113, 493, 95, 36, "Test", false, bg)
guiSetProperty(Test, "HoverTextColour", "FFCCBB00" )
guiSetFont(Test, font1)

LaghvTest = guiCreateButton(220, 493, 95, 36, "Laghv Test", false, bg)
guiSetProperty(LaghvTest, "HoverTextColour", "FFFE0000" )
guiSetFont(LaghvTest, font1)

Dastmozd = guiCreateEdit(420, 496, 127, 28, "Dastnozd", false, bg)
guiEditSetMaxLength ( Dastmozd, 6 )
DastmozdText = guiCreateLabel(345, 501, 150, 20, "Dastamozd:", false, bg)
guiSetFont(DastmozdText, font2)
guiLabelSetColor(DastmozdText, 255, 255, 255  )
 


------------------ Etelaate Car-----------------** 

TractionLossLabel = guiCreateLabel(15, 60-10, 250, 50, "Trac Loss:", false, bgmatn)
EtelaatTractionLossLabel = guiCreateLabel(105, 60-10, 100, 50, "", false, bgmatn)
guiSetFont(TractionLossLabel, font)
guiSetFont(EtelaatTractionLossLabel, font)
--guiLabelSetColor(TractionLossLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatTractionLossLabel, 0, 255, 0  )


TractionMultiplierLabel = guiCreateLabel(15, 10, 250, 50, "Trac Multiplier:", false, bgmatn)
EtelaatTractionMultiplierLabel = guiCreateLabel(145, 10, 100, 50, "", false, bgmatn)
guiSetFont(TractionMultiplierLabel, font)
guiSetFont(EtelaatTractionMultiplierLabel, font)
--guiLabelSetColor(TractionMultiplierLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatTractionMultiplierLabel, 0, 255, 0  )


TormozeLabel = guiCreateLabel(235+55, 10, 120, 50, "Tormoz:", false, bgmatn)
EtelaatTormozeLabel = guiCreateLabel(305+55, 10, 100, 50, "", false, bgmatn)
guiSetFont(TormozeLabel, font)
guiSetFont(EtelaatTormozeLabel, font)
guiLabelSetColor(EtelaatTormozeLabel, 0, 255, 0  )


DifferentialLabel = guiCreateLabel(15, 112-20, 120, 50, "Differential:", false, bgmatn)
EtelaatDifferentialLabel = guiCreateLabel(120, 112-20, 100, 50, "", false, bgmatn)
guiSetFont(DifferentialLabel, font)
guiSetFont(EtelaatDifferentialLabel, font)
guiLabelSetColor(EtelaatDifferentialLabel, 0, 255, 0  )

ErtefaLbl2 = guiCreateLabel(15, 112-20+42, 200, 50, "Ertefa:", false, bgmatn)
EtelaatErtefaLabel2 = guiCreateLabel(80, 112-20+42, 100, 50, "", false, bgmatn)
guiSetFont(ErtefaLbl2, font)
guiSetFont(EtelaatErtefaLabel2, font)
guiLabelSetColor(EtelaatErtefaLabel2, 0, 255, 0  )

SpoilerLabel = guiCreateLabel(15, 112-20+42+40, 200, 50, "Spoiler:", false, bgmatn)
EtelaatSpoilerLabel = guiCreateLabel(80, 112-20+42+40, 100, 50, "", false, bgmatn)
guiSetFont(SpoilerLabel, font)
guiSetFont(EtelaatSpoilerLabel, font)
guiLabelSetColor(EtelaatSpoilerLabel, 0, 255, 0  )

CMasslbl = guiCreateLabel(399+130-30, 112-20, 200, 50, "Center Mass:", false, bgmatn)
EtelaatCMasslbl = guiCreateLabel(500+130-25, 112-20, 200, 50, "", false, bgmatn)
guiSetFont(CMasslbl, font)
guiSetFont(EtelaatCMasslbl, font)
guiLabelSetColor(EtelaatCMasslbl, 0, 255, 0  )

SusForcelbl = guiCreateLabel(399+130-30, 112-20+42, 200, 50, "Suspension Force:", false, bgmatn)
EtelaatSusForcelbl = guiCreateLabel(500+150, 135, 200, 50, "", false, bgmatn)
guiSetFont(SusForcelbl, font)
guiSetFont(EtelaatSusForcelbl, font)
guiLabelSetColor(EtelaatSusForcelbl, 0, 255, 0  )


NitroLabel = guiCreateLabel(235+55, 60-10, 120, 50, "Nitro:", false, bgmatn)
EtelaatNitroLabel = guiCreateLabel(288+55, 60-10, 100, 50, "", false, bgmatn)
guiSetFont(NitroLabel, font)
guiSetFont(EtelaatNitroLabel, font)
--guiLabelSetColor(TormozeLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatNitroLabel, 0, 255, 0  )


HydraulicLabel = guiCreateLabel(235+55, 112-20+42, 120, 50, "Hydraulic:", false, bgmatn)
EtelaatHydraulicLabel = guiCreateLabel(375, 134, 100, 50, "", false, bgmatn)
guiSetFont(HydraulicLabel, font)
guiSetFont(EtelaatHydraulicLabel, font)
--guiLabelSetColor(TormozeLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatHydraulicLabel, 0, 255, 0  )


DragLabel = guiCreateLabel(399+130-30, 10, 120, 50, "Engine Drag:", false, bgmatn)
EtelaatDragLabel = guiCreateLabel(510+130-30, 10, 100, 50, "", false, bgmatn)
guiSetFont(DragLabel, font)
guiSetFont(EtelaatDragLabel, font)
--guiLabelSetColor(TormozeLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatDragLabel, 0, 255, 0  )


UltraLabel = guiCreateLabel(399+130-30, 60-10, 120, 50, "Engine Ultra:", false, bgmatn)
EtelaatUltraLabel = guiCreateLabel(510+130-30, 60-10, 100, 50, "", false, bgmatn)
guiSetFont(UltraLabel, font)
guiSetFont(EtelaatUltraLabel, font)
--guiLabelSetColor(TormozeLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatUltraLabel, 0, 255, 0  )

RingLabel = guiCreateLabel(235+55, 112-20, 120, 50, "Ring:", false, bgmatn)
EtelaatRingLabel = guiCreateLabel(285+55, 112-20, 100, 50, "", false, bgmatn)
guiSetFont(RingLabel, font)
guiSetFont(EtelaatRingLabel, font)
--guiLabelSetColor(TormozeLabel, 204, 153, 0  )
guiLabelSetColor(EtelaatRingLabel, 0, 255, 0  )

-- Etelaate Car To Panel
function updateTune ( root, Dragsh, ultrash, TractionLossesh, TractionMultiplieresh, Tormozesh,Ringesh,Hydraulicsh,Nitrosh,Differentialesh, LowerLimit, CMassDb, Spoileresh1, SusForceNumber)
	if root == getLocalPlayer() then
	
	
		Dragsh = tostring(Dragsh)
		if tostring(Dragsh) == "Active" then
        guiSetText ( EtelaatDragLabel, ""..Dragsh)
		guiLabelSetColor(EtelaatDragLabel, 0, 255, 0  )
		else
		guiSetText ( EtelaatDragLabel, ""..Dragsh)
		guiLabelSetColor(EtelaatDragLabel, 255, 0, 0  )
		end
		-------------------------------------------------
		ultrash = tostring(ultrash)
		if tostring(ultrash) == "Active" then
        guiSetText ( EtelaatUltraLabel, ""..ultrash)
		guiLabelSetColor(EtelaatUltraLabel, 0, 255, 0  )
		else
		guiSetText ( EtelaatUltraLabel, ""..ultrash)
		guiLabelSetColor(EtelaatUltraLabel, 255, 0, 0  )
		end
        
		
		TractionLossesh = tostring(TractionLossesh)
        guiSetText ( EtelaatTractionLossLabel, ""..TractionLossesh)
		
		TractionMultiplieresh = tostring(TractionMultiplieresh)
        guiSetText ( EtelaatTractionMultiplierLabel, ""..TractionMultiplieresh)
		
		Tormozesh = tostring(Tormozesh)
        guiSetText ( EtelaatTormozeLabel, ""..Tormozesh)
		
		
		if tostring(Ringesh) == "0" then
        guiSetText ( EtelaatRingLabel, "Default")
		guiLabelSetColor(EtelaatRingLabel, 255, 0, 0  )
		else
		guiSetText ( EtelaatRingLabel, ""..Ringesh)
		guiLabelSetColor(EtelaatRingLabel, 0, 255, 0  )
		end
		
		
		Differentialesh = tostring(Differentialesh)
        guiSetText ( EtelaatDifferentialLabel, ""..Differentialesh)
		
		LowerLimit = tostring(LowerLimit)
        guiSetText ( EtelaatErtefaLabel2, ""..LowerLimit)
		
		Spoileresh1 = tostring(Spoileresh1)
        guiSetText ( EtelaatSpoilerLabel, ""..Spoileresh1)
		
		CMassDb = tostring(CMassDb)
        guiSetText ( EtelaatCMasslbl, ""..CMassDb)
		
		SusForceNumber = tostring(SusForceNumber)
        guiSetText ( EtelaatSusForcelbl, ""..SusForceNumber)
		
		
		Hydraulicsh = tostring(Hydraulicsh)
		if tostring(Hydraulicsh) == "Active" then
        guiSetText ( EtelaatHydraulicLabel, ""..Hydraulicsh)
		guiLabelSetColor(EtelaatHydraulicLabel, 0, 255, 0  )
		else
		guiSetText ( EtelaatHydraulicLabel, ""..Hydraulicsh)
		guiLabelSetColor(EtelaatHydraulicLabel, 255, 0, 0  )
		end
		
		Nitrosh = tostring(Nitrosh)
		if tostring(Nitrosh) == "2x" then
        guiSetText ( EtelaatNitroLabel, ""..Nitrosh)
		guiLabelSetColor(EtelaatNitroLabel, 0, 255, 0  )
		elseif tostring(Nitrosh) == "5x" then
        guiSetText ( EtelaatNitroLabel, ""..Nitrosh)
		guiLabelSetColor(EtelaatNitroLabel, 0, 255, 0  )
		elseif tostring(Nitrosh) == "10x" then
        guiSetText ( EtelaatNitroLabel, ""..Nitrosh)
		guiLabelSetColor(EtelaatNitroLabel, 0, 255, 0  )
		elseif tostring(Nitrosh) == "inactive" then
		guiSetText ( EtelaatNitroLabel, ""..Nitrosh)
		guiLabelSetColor(EtelaatNitroLabel, 255, 0, 0  )
		end
		
	end
end
addEvent("UpstatTunePlayer",true)
addEventHandler("UpstatTunePlayer", getRootElement(), updateTune)


addEventHandler("onClientGUIClick", getRootElement(),
function (paintjobID)
	local selectedNitro = guiComboBoxGetSelected ( Nitro )
	local selectedRing = guiComboBoxGetSelected ( Ring )
	local selectedHydraulics = guiComboBoxGetSelected ( Hydraulics )
	local selectedTarh = guiComboBoxGetSelected ( Tarh )
	local selectedTractionLoss = guiComboBoxGetSelected ( TractionLoss )
	local selectedTractionMultiplier = guiComboBoxGetSelected ( TractionMultiplier )
	local selectedTormoz = guiComboBoxGetSelected ( Tormoz )
	local selectedEngineType = guiComboBoxGetSelected ( EngineType )
	local selectedErtefa2 = guiComboBoxGetSelected ( Ertefa2 )
	local selectedCMass = guiComboBoxGetSelected ( CMass )
	local selectedSpoiler = guiComboBoxGetSelected ( Spoiler )
	local selectedSusForce = guiComboBoxGetSelected ( SusForce )
	
	-- Default Shodan Baghie Box Ha
	if source == Ring then
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Nitro then
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Hydraulics then
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Tarh then
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Ultra then
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 1)
		guiSetVisible(Ultra1, true)
		guiSetVisible(Ultra, false)
		guiSetVisible(drag1, false)
		guiSetVisible(drag, true)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		--guiSetVisible(drag, true)
		--guiSetVisible(drag1, false)
	 elseif source == drag then
		setElementData(getLocalPlayer(), "SelectDrag", 1)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		guiSetVisible(drag1, true)
		guiSetVisible(drag, false)
		guiSetVisible(Ultra1, false)
		guiSetVisible(Ultra, true)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
	 elseif source == TractionLoss then
	    guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
	 elseif source == TractionMultiplier then
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Tormoz then
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == EngineType then
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	 elseif source == Ertefa2 then	
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	elseif source == CMass then	
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	elseif source == Spoiler then	
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (SusForce, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	elseif source == SusForce then	
	 	setElementData(getLocalPlayer(), "SelectDrag", 0)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
	 	guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiSetVisible(drag, true)
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra, true)
		guiSetVisible(Ultra1, false)
	elseif source == Dastmozd then	
		guiSetText ( Dastmozd, "" )
		
	end
		
	-- #Test1
	if source == Ring then
		if selectedRing == 0 then NowTuneTest = 1
		 elseif selectedRing == 1 then NowTuneTest = 2
		 elseif selectedRing == 2 then NowTuneTest = 3
		 elseif selectedRing == 3 then NowTuneTest = 4
		 elseif selectedRing == 4 then NowTuneTest = 5
		 elseif selectedRing == 5 then NowTuneTest = 6
		 elseif selectedRing == 6 then NowTuneTest = 7
		 elseif selectedRing == 7 then NowTuneTest = 8
		 elseif selectedRing == 8 then NowTuneTest = 9
		 elseif selectedRing == 9 then NowTuneTest = 10
		 elseif selectedRing == 10 then NowTuneTest = 11
		 elseif selectedRing == 11 then NowTuneTest = 12
		 elseif selectedRing == 12 then NowTuneTest = 13
		 elseif selectedRing == 13 then NowTuneTest = 14
		 elseif selectedRing == 14 then NowTuneTest = 15
		 elseif selectedRing == 15 then NowTuneTest = 16 end
		 triggerServerEvent("TestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, NowTuneTest )
	 elseif source == Hydraulics then
		if selectedHydraulics == 0 then NowTuneTest = 17
		 elseif selectedHydraulics == 1 then NowTuneTest = 18 end
		 triggerServerEvent("TestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, NowTuneTest )
	 elseif source == Tarh then
		if selectedTarh == 0 then NowTuneTest = 19
		elseif selectedTarh == 1 then NowTuneTest = 20
		elseif selectedTarh == 2 then NowTuneTest = 21
		elseif selectedTarh == 3 then NowTuneTest = 22 end
		triggerServerEvent("TestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, NowTuneTest )
	 elseif source == Ertefa2 then
		if  selectedErtefa2 == 0 then NowTuneTest = 23
		elseif selectedErtefa2 == 1 then NowTuneTest = 24
		elseif selectedErtefa2 == 2 then NowTuneTest = 25
		elseif selectedErtefa2 == 3 then NowTuneTest = 26
		elseif selectedErtefa2 == 4 then NowTuneTest = 27
		elseif selectedErtefa2 == 5 then NowTuneTest = 28
		elseif selectedErtefa2 == 6 then NowTuneTest = 29
		elseif selectedErtefa2 == 7 then NowTuneTest = 30
		elseif selectedErtefa2 == 8 then NowTuneTest = 31
		elseif selectedErtefa2 == 9 then NowTuneTest = 32
		elseif selectedErtefa2 == 10 then NowTuneTest = 33
		elseif selectedErtefa2 == 11 then NowTuneTest = 34
		elseif selectedErtefa2 == 12 then NowTuneTest = 35
		elseif selectedErtefa2 == 13 then NowTuneTest = 36  end
		triggerServerEvent("TestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, NowTuneTest )
	elseif source == Spoiler then
		
		if selectedSpoiler == 0 then NowTuneTest = 37
		elseif selectedSpoiler == 1 then NowTuneTest = 38
		elseif selectedSpoiler == 2 then NowTuneTest = 39
		elseif selectedSpoiler == 3 then NowTuneTest = 40
		elseif selectedSpoiler == 4 then NowTuneTest = 41
		elseif selectedSpoiler == 5 then NowTuneTest = 42
		elseif selectedSpoiler == 6 then NowTuneTest = 43
		elseif selectedSpoiler == 7 then NowTuneTest = 44
		elseif selectedSpoiler == 8 then NowTuneTest = 45
		elseif selectedSpoiler == 9 then NowTuneTest = 46
		elseif selectedSpoiler == 10 then NowTuneTest = 47
		elseif selectedSpoiler == 11 then NowTuneTest = 48
		elseif selectedSpoiler == 12 then NowTuneTest = 49
		elseif selectedSpoiler == 13 then NowTuneTest = 50
		elseif selectedSpoiler == 14 then NowTuneTest = 51
		elseif selectedSpoiler == 15 then NowTuneTest = 52
		elseif selectedSpoiler == 16 then NowTuneTest = 53
		elseif selectedSpoiler == 17 then NowTuneTest = 54
		elseif selectedSpoiler == 18 then NowTuneTest = 55
		elseif selectedSpoiler == 19 then NowTuneTest = 56  end
		triggerServerEvent("TestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, NowTuneTest )
	end
		

		
	-- Set Shodan Tune
	if source == Confirm then
		-- Nitro
		Hexs3 = tostring(guiGetText(Dastmozd))
		local MatneDastmozd = guiGetText ( Dastmozd )
        if MatneDastmozd == "" or MatneDastmozd == "Dastmozd: $" then
			exports["notf"]:addNotification("Lotfan Fielde Dastmoz Ra Por Konid!", 'error')
			sound = playSound("Tunings/Data/errorp.mp3",false)
            setSoundVolume(sound,0.3)
			return false
		end
		
		if tonumber(MatneDastmozd) < 1000 or tonumber(MatneDastmozd) > 100000 then
			exports["notf"]:addNotification("Mablaghe Dastmozd Bayad Beyne $10,000 Ta $100,000 Bashad!", 'error')
			sound = playSound("Tunings/Data/errorp.mp3",false)
            setSoundVolume(sound,0.3)
			return false
		end
		
		if selectedRing == -1 and selectedNitro == -1 and selectedHydraulics == -1 and selectedTarh == -1 and selectedTractionLoss == -1 and selectedTractionMultiplier == -1 and selectedTormoz == -1 and selectedEngineType == -1 and getElementData(getLocalPlayer(), "SelectUltra") == 0 and getElementData(getLocalPlayer(), "SelectDrag") == 0 and selectedErtefa2 == -1 and selectedCMass == -1 and selectedSpoiler == -1 and selectedSusForce == -1  then
			exports["notf"]:addNotification("Ebteda Yek Tune Entekhab Konid!", 'error')
			sound = playSound("Tunings/Data/errorp.mp3",false)
            setSoundVolume(sound,0.3)
			return false
		end
		
			

		if ( string.find ( MatneDastmozd, '0' ) ) or ( string.find ( MatneDastmozd, '1' ) ) or ( string.find ( MatneDastmozd, '2' ) ) or ( string.find ( MatneDastmozd, '3' ) ) or ( string.find ( MatneDastmozd, '4' ) ) or ( string.find ( MatneDastmozd, '5' ) ) or ( string.find ( MatneDastmozd, '6' ) ) or ( string.find ( MatneDastmozd, '7' ) ) or ( string.find ( MatneDastmozd, '8' ) ) or ( string.find ( MatneDastmozd, '9' ) ) then
		
		
			--[[ Nitro ]] if selectedNitro == 0 then NowTune = 1 TunePay = 100000
			 elseif selectedNitro == 1 then NowTune = 2 TunePay = 150000
			 elseif selectedNitro == 2 then NowTune = 3 TunePay = 200000
			 
			--[[ Ring ]] elseif selectedRing == 0 then NowTune = 4 TunePay = 150000
			 elseif selectedRing == 1 then NowTune = 5 TunePay = 155000
			 elseif selectedRing == 2 then NowTune = 6 TunePay = 130000
			 elseif selectedRing == 3 then NowTune = 7 TunePay = 120000
			 elseif selectedRing == 4 then NowTune = 8 TunePay = 115000
			 elseif selectedRing == 5 then NowTune = 9 TunePay = 100000
			 elseif selectedRing == 6 then NowTune = 10 TunePay = 175000
			 elseif selectedRing == 7 then NowTune = 11 TunePay = 80000
			 elseif selectedRing == 8 then NowTune = 12 TunePay = 95000
			 elseif selectedRing == 9 then NowTune = 13 TunePay = 80000
			 elseif selectedRing == 10 then NowTune = 14 TunePay = 115000
			 elseif selectedRing == 11 then NowTune = 15 TunePay = 125000
			 elseif selectedRing == 12 then NowTune = 16 TunePay = 130000
			 elseif selectedRing == 13 then NowTune = 17 TunePay = 135000
			 elseif selectedRing == 14 then NowTune = 18 TunePay = 170000
			 elseif selectedRing == 15 then NowTune = 19 TunePay = 140000

			--[[ Hydraulics ]] elseif selectedHydraulics == 0 then NowTune = 20 TunePay = 50000
			 elseif selectedHydraulics == 1 then NowTune = 21 TunePay = 30000

			--[[ Tarh ]] elseif selectedTarh == 0 then NowTune = 22 TunePay = 15000
			 elseif selectedTarh == 1 then NowTune = 23 TunePay = 15000
			 elseif selectedTarh == 2 then NowTune = 24 TunePay = 15000
			 elseif selectedTarh == 3 then NowTune = 25 TunePay = 10000
				
			--[[ Ultra ]] elseif getElementData(getLocalPlayer(), "SelectUltra") == 1 then NowTune = 26 TunePay = 960000
			--[[ Drag ]] elseif getElementData(getLocalPlayer(), "SelectDrag") == 1 then NowTune = 27 TunePay = 200000
			
			--[[ Traction Loss ]] elseif selectedTractionLoss == 0 then NowTune = 28 TunePay = 100000
			 elseif selectedTractionLoss == 1 then NowTune = 29  TunePay = 110000
			 elseif selectedTractionLoss == 2 then NowTune = 30 TunePay = 120000
			 elseif selectedTractionLoss == 3 then NowTune = 31 TunePay = 130000
			 elseif selectedTractionLoss == 4 then NowTune = 32 TunePay = 140000
			 elseif selectedTractionLoss == 5 then NowTune = 33 TunePay = 150000
			 elseif selectedTractionLoss == 6 then NowTune = 34 TunePay = 160000
			 elseif selectedTractionLoss == 7 then NowTune = 35 TunePay = 170000
					
			--[[ Traction Multiplier ]] elseif selectedTractionMultiplier == 0 then NowTune = 36 TunePay = 80000
			 elseif selectedTractionMultiplier == 1 then NowTune = 37 TunePay = 90000
			 elseif selectedTractionMultiplier == 2 then NowTune = 38 TunePay = 100000
			 elseif selectedTractionMultiplier == 3 then NowTune = 39 TunePay = 110000
			 elseif selectedTractionMultiplier == 4 then NowTune = 40 TunePay = 120000
			 elseif selectedTractionMultiplier == 5 then NowTune = 41 TunePay = 130000
					
			--[[ Tormoz ]] elseif selectedTormoz == 0 then NowTune = 42 TunePay = 80000
			 elseif selectedTormoz == 1 then NowTune = 43 TunePay = 110000
			 elseif selectedTormoz == 2 then NowTune = 44 TunePay = 150000
					
			--[[ Engine Type ]] elseif selectedEngineType == 0 then NowTune = 45 TunePay = 300000
			 elseif selectedEngineType == 1 then NowTune = 46 TunePay = 500000
				 
			--[[  Lower Limit ]]  elseif selectedErtefa2 == 0 then NowTune = 47 TunePay = 50000
			 elseif selectedErtefa2 == 1 then NowTune = 48 TunePay = 50000
			 elseif selectedErtefa2 == 2 then NowTune = 49 TunePay = 50000
			 elseif selectedErtefa2 == 3 then NowTune = 50 TunePay = 50000
			 elseif selectedErtefa2 == 4 then NowTune = 51 TunePay = 50000
			 elseif selectedErtefa2 == 5 then NowTune = 52 TunePay = 50000
			 elseif selectedErtefa2 == 6 then NowTune = 53 TunePay = 50000
			 elseif selectedErtefa2 == 7 then NowTune = 54  TunePay = 50000
			 elseif selectedErtefa2 == 8 then NowTune = 55 TunePay = 50000
			 elseif selectedErtefa2 == 9 then NowTune = 56 TunePay = 50000
			 elseif selectedErtefa2 == 10 then NowTune = 57 TunePay = 50000
			 elseif selectedErtefa2 == 11 then NowTune = 58 TunePay = 50000
			 elseif selectedErtefa2 == 12 then NowTune = 59 TunePay = 50000
			 elseif selectedErtefa2 == 13 then NowTune = 60 TunePay = 50000
		
			--[[  Center Mass ]] elseif selectedCMass == 0 then NowTune = 61 TunePay = 65000
			 elseif selectedCMass == 1 then NowTune = 62 TunePay = 65000
			 elseif selectedCMass == 2 then NowTune = 63 TunePay = 65000
					
			--[[  Spoiler ]] elseif selectedSpoiler == 0 then NowTune = 64 TunePay = 55000
			 elseif selectedSpoiler == 1 then NowTune = 65 TunePay = 55000
			 elseif selectedSpoiler == 2 then NowTune = 66 TunePay = 55000
			 elseif selectedSpoiler == 3 then NowTune = 67 TunePay = 55000
			 elseif selectedSpoiler == 4 then NowTune = 68 TunePay = 55000
			 elseif selectedSpoiler == 5 then NowTune = 69 TunePay = 55000
			 elseif selectedSpoiler == 6 then NowTune = 70 TunePay = 55000
			 elseif selectedSpoiler == 7 then NowTune = 71 TunePay = 55000
			 elseif selectedSpoiler == 8 then NowTune = 72 TunePay = 55000
			 elseif selectedSpoiler == 9 then NowTune = 73 TunePay = 55000
			 elseif selectedSpoiler == 10 then NowTune = 74 TunePay = 55000
			 elseif selectedSpoiler == 11 then NowTune = 75 TunePay = 55000
			 elseif selectedSpoiler == 12 then NowTune = 76 TunePay = 55000
			 elseif selectedSpoiler == 13 then NowTune = 77 TunePay = 55000
			 elseif selectedSpoiler == 14 then NowTune = 78 TunePay = 55000
			 elseif selectedSpoiler == 15 then NowTune = 79 TunePay = 55000
			 elseif selectedSpoiler == 16 then NowTune = 80 TunePay = 55000
			 elseif selectedSpoiler == 17 then NowTune = 81 TunePay = 55000
			 elseif selectedSpoiler == 18 then NowTune = 82 TunePay = 55000
			 elseif selectedSpoiler == 19 then NowTune = 83 TunePay = 55000
				
			--[[  Spoiler ]] elseif selectedSusForce == 0 then NowTune = 84 TunePay = 60000
			 elseif selectedSusForce == 1 then NowTune = 85 TunePay = 60000
			 elseif selectedSusForce == 2 then NowTune = 86 TunePay = 60000
			 elseif selectedSusForce == 3 then NowTune = 87 TunePay = 60000
			 elseif selectedSusForce == 4 then NowTune = 88 TunePay = 60000
			 elseif selectedSusForce == 5 then NowTune = 89 TunePay = 60000
			 elseif selectedSusForce == 6 then NowTune = 90 TunePay = 60000
			 elseif selectedSusForce == 7 then NowTune = 91 TunePay = 60000
			 elseif selectedSusForce == 8 then NowTune = 92 TunePay = 60000
			 elseif selectedSusForce == 9 then NowTune = 93 TunePay = 60000
			 elseif selectedSusForce == 10 then NowTune = 94 TunePay = 60000
			 elseif selectedSusForce == 11 then NowTune = 95 TunePay = 60000
			 elseif selectedSusForce == 12 then NowTune = 96 TunePay = 60000
			 elseif selectedSusForce == 13 then NowTune = 97 TunePay = 60000
			 elseif selectedSusForce == 14 then NowTune = 98 TunePay = 60000
			 elseif selectedSusForce == 15 then NowTune = 99 TunePay = 60000 end
			 triggerServerEvent("TuneKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, TuneSarjam, TunePay, NowTune, Hexs3 )
		else
			exports["notf"]:addNotification("Dastmozd Bayad Shamel Adad Bashad!", "error")
			sound = playSound("Tunings/Data/errorp.mp3",false) setSoundVolume(sound,0.3)
		end
	elseif source  == Cancel then
		guiSetVisible(TuneWindow, false)
		showCursor(false)
		guiSetInputEnabled(false)
	elseif source  == Refresh then
		guiSetVisible(TuneWindow, false)
		guiSetVisible(TuneWindow, true)
		RefreshPanels ()
		triggerServerEvent("UpdateSheTuneCarMechanic", getLocalPlayer(), getLocalPlayer(), Dragsh )
		
		-- #Test2
	elseif source == Test then
		if selectedTractionLoss == -1 and selectedTractionMultiplier == -1 and selectedTormoz == -1 and selectedEngineType == -1 and selectedErtefa2 == -1 and selectedCMass == -1 and selectedSusForce == -1 and getElementData(getLocalPlayer(), "SelectUltra") == 0 and getElementData(getLocalPlayer(), "SelectDrag") == 0  then
			exports["notf"]:addNotification("Ebteda Yek Tune Entekhab Konid!", 'error')
			sound = playSound("Tunings/Data/errorp.mp3",false)
            setSoundVolume(sound,0.3)
			return false
		end

		if getElementData(getLocalPlayer(), "SelectUltra") == 1 then TimerTest = 1
		elseif getElementData(getLocalPlayer(), "SelectDrag") == 1 then TimerTest = 2
		elseif selectedEngineType == 0 then TimerTest = 3
		elseif selectedEngineType == 1 then TimerTest = 4
		elseif selectedTormoz == 0 then TimerTest = 5
		elseif selectedTormoz == 1 then TimerTest = 6
		elseif selectedTormoz == 2 then TimerTest = 7
		elseif selectedTractionLoss == 0 then TimerTest = 28
		elseif selectedTractionLoss == 1 then TimerTest = 29
		elseif selectedTractionLoss == 2 then TimerTest = 30
		elseif selectedTractionLoss == 3 then TimerTest = 31
		elseif selectedTractionLoss == 4 then TimerTest = 32
		elseif selectedTractionLoss == 5 then TimerTest = 33
		elseif selectedTractionLoss == 6 then TimerTest = 34
		elseif selectedTractionLoss == 7 then TimerTest = 35
		elseif selectedTractionMultiplier == 0 then TimerTest = 36
		elseif selectedTractionMultiplier == 1 then TimerTest = 37
		elseif selectedTractionMultiplier == 2 then TimerTest = 38
		elseif selectedTractionMultiplier == 3 then TimerTest = 39
		elseif selectedTractionMultiplier == 4 then TimerTest = 40
		elseif selectedTractionMultiplier == 5 then TimerTest = 41
		elseif selectedErtefa2 == 0 then TimerTest = 42 elseif selectedErtefa2 == 1 then TimerTest = 43
		elseif selectedErtefa2 == 2 then TimerTest = 44 elseif selectedErtefa2 == 3 then TimerTest = 45
		elseif selectedErtefa2 == 4 then TimerTest = 46 elseif selectedErtefa2 == 5 then TimerTest = 47
		elseif selectedErtefa2 == 6 then TimerTest = 48 elseif selectedErtefa2 == 7 then TimerTest = 49
		elseif selectedErtefa2 == 8 then TimerTest = 50 elseif selectedErtefa2 == 9 then TimerTest = 51
		elseif selectedErtefa2 == 10 then TimerTest = 52 elseif selectedErtefa2 == 11 then TimerTest = 53
		elseif selectedErtefa2 == 12 then TimerTest = 54 elseif selectedErtefa2 == 13 then TimerTest = 55
		
		elseif selectedCMass == 0 then TimerTest = 56 elseif selectedCMass == 1 then TimerTest = 57 elseif selectedCMass == 2 then TimerTest = 58
		
		elseif selectedSusForce == 0 then TimerTest = 59
		elseif selectedSusForce == 1 then TimerTest = 60
		elseif selectedSusForce == 2 then TimerTest = 61
		elseif selectedSusForce == 3 then TimerTest = 62
		elseif selectedSusForce == 4 then TimerTest = 63
		elseif selectedSusForce == 5 then TimerTest = 64
		elseif selectedSusForce == 6 then TimerTest = 65
		elseif selectedSusForce == 7 then TimerTest = 66
		elseif selectedSusForce == 8 then TimerTest = 67
		elseif selectedSusForce == 9 then TimerTest = 68
		elseif selectedSusForce == 10 then TimerTest = 69
		elseif selectedSusForce == 11 then TimerTest = 70
		elseif selectedSusForce == 12 then TimerTest = 71
		elseif selectedSusForce == 13 then TimerTest = 72
		elseif selectedSusForce == 14 then TimerTest = 73
		elseif selectedSusForce == 15 then TimerTest = 74

		end
		triggerServerEvent("TimerTestKon", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, TimerTest )
	 elseif source == LaghvTest then
		triggerServerEvent("KillTimerTune", getLocalPlayer(), getLocalPlayer(), Moshtari,CarID, TimerTest )
	end
end)


function OpenTunePanel (thePlayer, MoshtariName, CarIDD)
	if getLocalPlayer() == thePlayer then
	dragLabal = guiCreateLabel(658+11, 30, 150, 50, "Engine Drag", false, bg)
	guiSetFont(dragLabal, font2)
	drag = guiCreateStaticImage(645+5, 55, 120, 80,"Tunings/Data/drag.png",false, bg)
	drag1 = guiCreateStaticImage(645+5, 55, 120, 80,"Tunings/Data/drag1.png",false, bg)
	UltraLabal = guiCreateLabel(528+7, 30, 150, 50, "Engine Ultra", false, bg)
	guiSetFont(UltraLabal, font2)
	Ultra = guiCreateStaticImage(510+5, 55, 120, 80,"Tunings/Data/ultra.png",false, bg)
	Ultra1 = guiCreateStaticImage(510+5, 55, 120, 80,"Tunings/Data/ultra1.png",false, bg)
		guiSetVisible(TuneWindow, true)
		showCursor(true)
		ResetSelected ()
		triggerServerEvent("UpdateSheTuneCarMechanic", getLocalPlayer(), getLocalPlayer(), Dragsh )
		Moshtari = MoshtariName
		if CarIDD then
			--exports["notf"]:addNotification("Car ID :"..CarIDD.." Ast!", 'info')
			CarID = CarIDD
		end
	end
end
addEvent("OpenTunePanel",true)
addEventHandler("OpenTunePanel", getRootElement(), OpenTunePanel)



function RefreshPanel (thePlayer, MoshtariName, CarIDD)
triggerServerEvent("UpdateSheTuneCarMechanic", getLocalPlayer(), getLocalPlayer(), Dragsh )
end
addEvent("RefreshTunePanel",true)
addEventHandler("RefreshTunePanel", getRootElement(), RefreshPanel)

function RefreshPanels ()
		guiSetText ( Dastmozd, "10000" )
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra1, false)
		guiSetVisible(drag, true)
		guiSetVisible(Ultra, true)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		guiComboBoxSetSelected (Ring, -1)
		guiComboBoxSetSelected (Nitro, -1)
		guiComboBoxSetSelected (Hydraulics, -1)
		guiComboBoxSetSelected (Tarh, -1)
		guiComboBoxSetSelected (TractionLoss, -1)
		guiComboBoxSetSelected (Tormoz, -1)
		guiComboBoxSetSelected (TractionMultiplier, -1)
		guiComboBoxSetSelected (EngineType, -1)
		guiComboBoxSetSelected (Ertefa2, -1)
		guiComboBoxSetSelected (CMass, -1)
		guiComboBoxSetSelected (Spoiler, -1)
		guiComboBoxSetSelected (SusForce, -1)
		local IddCaresh = tonumber(getElementData(getLocalPlayer(),"ModelCarMc"))
		if idCarSpoilerTrue[IddCaresh] then
			guiComboBoxClear ( Spoiler )
			guiComboBoxAddItem ( Spoiler, "1")
			guiComboBoxAddItem ( Spoiler, "2")
			guiComboBoxAddItem ( Spoiler, "3")
			guiComboBoxAddItem ( Spoiler, "4")
			guiComboBoxAddItem ( Spoiler, "5")
			guiComboBoxAddItem ( Spoiler, "6")
			guiComboBoxAddItem ( Spoiler, "7")
			guiComboBoxAddItem ( Spoiler, "8")
			guiComboBoxAddItem ( Spoiler, "9")
			guiComboBoxAddItem ( Spoiler, "10")
			guiComboBoxAddItem ( Spoiler, "11")
			guiComboBoxAddItem ( Spoiler, "12")
			guiComboBoxAddItem ( Spoiler, "13")
			guiComboBoxAddItem ( Spoiler, "14")
			guiComboBoxAddItem ( Spoiler, "15")
			guiComboBoxAddItem ( Spoiler, "16")
			guiComboBoxAddItem ( Spoiler, "17")
			guiComboBoxAddItem ( Spoiler, "18")
			guiComboBoxAddItem ( Spoiler, "19")
			guiComboBoxAddItem ( Spoiler, "20")
		else
			guiComboBoxClear ( Spoiler )
		end
		
		local IddCaresh = tonumber(getElementData(getLocalPlayer(),"ModelCarMc"))
		if idCarPaintJobTrue[IddCaresh] then
			guiComboBoxClear ( Tarh )
			guiComboBoxAddItem ( Tarh, "1")
			guiComboBoxAddItem ( Tarh, "2")
			guiComboBoxAddItem ( Tarh, "3")
			guiComboBoxAddItem ( Tarh, "inactive")
		else
			guiComboBoxClear ( Tarh )
		end
		triggerServerEvent("UpdateSheTuneCarMechanic", getLocalPlayer(), getLocalPlayer(), Dragsh )
end

addCommandHandler("boro",
function ()
	guiSetVisible(drag, false)
end)

addCommandHandler("bia",
function ()
	guiSetVisible(drag, true)
end)

addCommandHandler("bia1",
function ()
	guiSetVisible(drag1, true)
end)

addCommandHandler("boro1",
function ()
	guiSetVisible(drag1, false)
end)

function ResetSelected ()
		guiSetText ( Dastmozd, "10000" )
		guiSetVisible(drag1, false)
		guiSetVisible(Ultra1, false)
		guiSetVisible(drag, true)
		guiSetVisible(Ultra, true)
		setElementData(getLocalPlayer(), "SelectUltra", 0)
		setElementData(getLocalPlayer(), "SelectDrag", 0)
		local IddCaresh = tonumber(getElementData(getLocalPlayer(),"ModelCarMc"))
		if idCarSpoilerTrue[IddCaresh] then
			guiComboBoxClear ( Spoiler )
			guiComboBoxAddItem ( Spoiler, "1")
			guiComboBoxAddItem ( Spoiler, "2")
			guiComboBoxAddItem ( Spoiler, "3")
			guiComboBoxAddItem ( Spoiler, "4")
			guiComboBoxAddItem ( Spoiler, "5")
			guiComboBoxAddItem ( Spoiler, "6")
			guiComboBoxAddItem ( Spoiler, "7")
			guiComboBoxAddItem ( Spoiler, "8")
			guiComboBoxAddItem ( Spoiler, "9")
			guiComboBoxAddItem ( Spoiler, "10")
			guiComboBoxAddItem ( Spoiler, "11")
			guiComboBoxAddItem ( Spoiler, "12")
			guiComboBoxAddItem ( Spoiler, "13")
			guiComboBoxAddItem ( Spoiler, "14")
			guiComboBoxAddItem ( Spoiler, "15")
			guiComboBoxAddItem ( Spoiler, "16")
			guiComboBoxAddItem ( Spoiler, "17")
			guiComboBoxAddItem ( Spoiler, "18")
			guiComboBoxAddItem ( Spoiler, "19")
			guiComboBoxAddItem ( Spoiler, "20")
		else
			guiComboBoxClear ( Spoiler )
		end
		
		local IddCaresh = tonumber(getElementData(getLocalPlayer(),"ModelCarMc"))
		if idCarPaintJobTrue[IddCaresh] then
			guiComboBoxClear ( Tarh )
			guiComboBoxAddItem ( Tarh, "1")
			guiComboBoxAddItem ( Tarh, "2")
			guiComboBoxAddItem ( Tarh, "3")
			guiComboBoxAddItem ( Tarh, "inactive")
		else
			guiComboBoxClear ( Tarh )
		end
		triggerServerEvent("UpdateSheTuneCarMechanic", getLocalPlayer(), getLocalPlayer(), Dragsh )
end