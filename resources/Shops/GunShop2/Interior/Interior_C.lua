

---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Enter Panel <--

local screenW, screenH = guiGetScreenSize()
windowgsover = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "GunShop2/interior/bgpage.png", false)
--guiWindowSetSizable(windowgsover, false)

--> Dokme Ha Va Matn Ha <--
Business = guiCreateLabel(76, 3, 410, 50, "Business", false, windowgsover)
guiLabelSetColor(Business, 255, 255, 255)
guiSetFont(Business, "default-bold-small")
khat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowgsover)
guiLabelSetColor(khat, 0, 255, 0)
Vorodi = guiCreateLabel(67, 62, 410, 50, "Vorodi: $2500", false, windowgsover)
guiLabelSetColor(Vorodi, 255, 255, 255)
guiSetFont(Vorodi, "default-bold-small")
Matn = guiCreateLabel(65, 35, 410, 50, "Gun Shop Over", false, windowgsover)
guiLabelSetColor(Matn, 0, 255, 0)
guiSetFont(Matn, "default-bold-small")
		
Enterbtngso = guiCreateButton(10, 96, 180, 40, "Enter", false, windowgsover)
guiSetProperty(Enterbtngso, "HoverTextColour", "FF00FF00" )

buybtngso = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowgsover)
guiSetProperty(buybtngso, "HoverTextColour", "FF00FF00" )
closebtngso = guiCreateButton(114, 140, 76, 30, "Close", false, windowgsover)
guiSetProperty(closebtngso, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowgsover, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelEnterOver",true)
addEventHandler("BiadPanelEnterOver",getLocalPlayer(),function()
guiSetVisible(windowgsover, true)
guiSetEnabled(buybtngso, false)
showCursor(true)
end )


--> Ba Click Roye Enter Bere To <--
addEventHandler ( "onClientGUIClick", Enterbtngso,function()
triggerServerEvent("BoroToOver", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowgsover, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtngso,function()
guiSetVisible(windowgsover, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Exit Panel <--
local screenW, screenH = guiGetScreenSize()
windowgsover2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "GunShop2/interior/bgpage.png", false)
--guiWindowSetSizable(windowgsover2, false)

--> Dokme Ha Va Matn Ha <--
Business2 = guiCreateLabel(76, 3, 410, 50, "Business", false, windowgsover2)
guiLabelSetColor(Business2, 255, 255, 255)
guiSetFont(Business2, "default-bold-small")
khat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowgsover2)
guiLabelSetColor(khat2, 0, 255, 0)
Matn2 = guiCreateLabel(67, 35, 410, 50, "Gun Shop Over", false, windowgsover2)
guiLabelSetColor(Matn2, 0, 255, 0)
guiSetFont(Matn2, "default-bold-small")
		
Exitbtngso2 = guiCreateButton(10, 96, 180, 40, "Exit", false, windowgsover2)
guiSetProperty(Exitbtngso2, "HoverTextColour", "FF00FF00" )

buybtngso2 = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowgsover2)
guiSetProperty(buybtngso2, "HoverTextColour", "FF00FF00" )
closebtngso2 = guiCreateButton(114, 140, 76, 30, "Close", false, windowgsover2)
guiSetProperty(closebtngso2, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowgsover2, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelExitOver",true)
addEventHandler("BiadPanelExitOver",getLocalPlayer(),function()
guiSetVisible(windowgsover2, true)
guiSetEnabled(buybtngso2, false)
showCursor(true)
end )

--> Ba Click Roye Exit Biad Biron <--
addEventHandler ( "onClientGUIClick", Exitbtngso2,function()
triggerServerEvent("BiaBironOver", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowgsover2, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtngso2,function()
guiSetVisible(windowgsover2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(windowgsover, false)
guiSetVisible(windowgsover2, false)
showCursor(false)
end, false)