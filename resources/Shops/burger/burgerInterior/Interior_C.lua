---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
window3 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "burger/burgerInterior/bgpage.png", false)
--guiWindowSetSizable(window3, false)

-- Dokme Ha Va Matn Ha --
Business = guiCreateLabel(76, 3, 410, 50, "Business", false, window3)
guiLabelSetColor(Business, 255, 255, 255)
guiSetFont(Business, "default-bold-small")
khat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, window3)
guiLabelSetColor(khat, 0, 255, 0)
Vorodi = guiCreateLabel(72, 62, 410, 50, "Vorodi: $5", false, window3)
guiLabelSetColor(Vorodi, 255, 255, 255)
guiSetFont(Vorodi, "default-bold-small")
Matn = guiCreateLabel(67, 35, 410, 50, "burger Shop", false, window3)
guiLabelSetColor(Matn, 0, 255, 0)
guiSetFont(Matn, "default-bold-small")
		
Enterbtn = guiCreateButton(10, 96, 180, 40, "Enter", false, window3)
guiSetProperty(Enterbtn, "HoverTextColour", "FF00FF00" )

buybtn = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, window3)
guiSetProperty(buybtn, "HoverTextColour", "FF00FF00" )
closebtn = guiCreateButton(114, 140, 76, 30, "Close", false, window3)
guiSetProperty(closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(window3, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterburger",true)
addEventHandler("BiadPanelEnterburger",getLocalPlayer(),function()
guiSetVisible(window3, true)
guiSetEnabled(buybtn, false)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", Enterbtn,function()
triggerServerEvent("BoroToburger", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(window3, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", closebtn,function()
guiSetVisible(window3, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
window4 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "burger/burgerInterior/bgpage.png", false)
--guiWindowSetSizable(window4, false)

-- Dokme Ha Va Matn Ha --
Business2 = guiCreateLabel(76, 3, 410, 50, "Business", false, window4)
guiLabelSetColor(Business2, 255, 255, 255)
guiSetFont(Business2, "default-bold-small")
khat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, window4)
guiLabelSetColor(khat2, 0, 255, 0)
Matn2 = guiCreateLabel(67, 35, 410, 50, "burger Shop", false, window4)
guiLabelSetColor(Matn2, 0, 255, 0)
guiSetFont(Matn2, "default-bold-small")
		
Exitbtn = guiCreateButton(10, 96, 180, 40, "Exit", false, window4)
guiSetProperty(Exitbtn, "HoverTextColour", "FF00FF00" )

buybtn2 = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, window4)
guiSetProperty(buybtn2, "HoverTextColour", "FF00FF00" )
closebtn2 = guiCreateButton(114, 140, 76, 30, "Close", false, window4)
guiSetProperty(closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(window4, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitburger",true)
addEventHandler("BiadPanelExitburger",getLocalPlayer(),function()
guiSetVisible(window4, true)
guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", Exitbtn,function()
triggerServerEvent("BiaBironburger", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(window4, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", closebtn2,function()
guiSetVisible(window4, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(window3, false)
guiSetVisible(window4, false)
showCursor(false)
end, false)
