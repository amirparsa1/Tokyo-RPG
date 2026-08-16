
---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Enter Panel <--

local screenW, screenH = guiGetScreenSize()
windowMashrob = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Mashrob/MashrobInterior/bgpage.png", false)
--guiWindowSetSizable(windowMashrob, false)

--> Dokme Ha Va Matn Ha <--
Business = guiCreateLabel(76, 3, 410, 50, "Business", false, windowMashrob)
guiLabelSetColor(Business, 255, 255, 255)
guiSetFont(Business, "default-bold-small")
khat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowMashrob)
guiLabelSetColor(khat, 0, 255, 0)
Vorodi = guiCreateLabel(67, 62, 410, 50, "Vorodi: $50", false, windowMashrob)
guiLabelSetColor(Vorodi, 255, 255, 255)
guiSetFont(Vorodi, "default-bold-small")
Matn = guiCreateLabel(62, 35, 410, 50, "Mashrob Khori", false, windowMashrob)
guiLabelSetColor(Matn, 0, 255, 0)
guiSetFont(Matn, "default-bold-small")
		
Enterbtngso = guiCreateButton(10, 96, 180, 40, "Enter", false, windowMashrob)
guiSetProperty(Enterbtngso, "HoverTextColour", "FF00FF00" )

buybtngso = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowMashrob)
guiSetProperty(buybtngso, "HoverTextColour", "FF00FF00" )
closebtngso = guiCreateButton(114, 140, 76, 30, "Close", false, windowMashrob)
guiSetProperty(closebtngso, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowMashrob, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelEnterMashrob",true)
addEventHandler("BiadPanelEnterMashrob",getLocalPlayer(),function()
guiSetVisible(windowMashrob, true)
guiSetEnabled(buybtngso, false)
showCursor(true)
end )


--> Ba Click Roye Enter Bere To <--
addEventHandler ( "onClientGUIClick", Enterbtngso,function()
triggerServerEvent("BoroToMashrob", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowMashrob, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtngso,function()
guiSetVisible(windowMashrob, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Exit Panel <--
local screenW, screenH = guiGetScreenSize()
windowMashrob2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Mashrob/MashrobInterior/bgpage.png", false)
--guiWindowSetSizable(windowMashrob2, false)

--> Dokme Ha Va Matn Ha <--
Business2 = guiCreateLabel(76, 3, 410, 50, "Business", false, windowMashrob2)
guiLabelSetColor(Business2, 255, 255, 255)
guiSetFont(Business2, "default-bold-small")
khat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowMashrob2)
guiLabelSetColor(khat2, 0, 255, 0)
Matn2 = guiCreateLabel(62, 35, 410, 50, "Mashrob Khori", false, windowMashrob2)
guiLabelSetColor(Matn2, 0, 255, 0)
guiSetFont(Matn2, "default-bold-small")
		
Exitbtngso2 = guiCreateButton(10, 96, 180, 40, "Exit", false, windowMashrob2)
guiSetProperty(Exitbtngso2, "HoverTextColour", "FF00FF00" )

buybtngso2 = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowMashrob2)
guiSetProperty(buybtngso2, "HoverTextColour", "FF00FF00" )
closebtngso2 = guiCreateButton(114, 140, 76, 30, "Close", false, windowMashrob2)
guiSetProperty(closebtngso2, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowMashrob2, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelExitMashrob",true)
addEventHandler("BiadPanelExitMashrob",getLocalPlayer(),function()
guiSetVisible(windowMashrob2, true)
guiSetEnabled(buybtngso2, false)
showCursor(true)
end )

--> Ba Click Roye Exit Biad Biron <--
addEventHandler ( "onClientGUIClick", Exitbtngso2,function()
triggerServerEvent("BiaBironMashrob", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowMashrob2, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtngso2,function()
guiSetVisible(windowMashrob2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(windowMashrob, false)
guiSetVisible(windowMashrob2, false)
showCursor(false)
end, false)
