--> Sedaye Vorod Va Khoroj <--
function EnterSound(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		sound = playSound("GunShop/interior/Enter.mp3",false)
		setSoundVolume(sound,0.4)
	end
end
addEvent("DoorSound",true)
addEventHandler("DoorSound", root, EnterSound)



---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
windowgunshop = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "GunShop/Interior/bgpage.png", false)
--guiWindowSetSizable(windowgunshop, false)

-- Dokme Ha Va Matn Ha --
Business = guiCreateLabel(76, 3, 410, 50, "Business", false, windowgunshop)
guiLabelSetColor(Business, 255, 255, 255)
guiSetFont(Business, "default-bold-small")
khat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowgunshop)
guiLabelSetColor(khat, 0, 255, 0)
Vorodi = guiCreateLabel(67, 62, 410, 50, "Vorodi: $100", false, windowgunshop)
guiLabelSetColor(Vorodi, 255, 255, 255)
guiSetFont(Vorodi, "default-bold-small")
Matn = guiCreateLabel(67, 35, 410, 50, "Gun Shop LS", false, windowgunshop)
guiLabelSetColor(Matn, 0, 255, 0)
guiSetFont(Matn, "default-bold-small")
		
Enterbtngs = guiCreateButton(10, 96, 180, 40, "Enter", false, windowgunshop)
guiSetProperty(Enterbtngs, "HoverTextColour", "FF00FF00" )

buybtngs = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowgunshop)
guiSetProperty(buybtngs, "HoverTextColour", "FF00FF00" )
closebtngs = guiCreateButton(114, 140, 76, 30, "Close", false, windowgunshop)
guiSetProperty(closebtngs, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowgunshop, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterGS",true)
addEventHandler("BiadPanelEnterGS",getLocalPlayer(),function()
guiSetVisible(windowgunshop, true)
guiSetEnabled(buybtngs, false)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", Enterbtngs,function()
triggerServerEvent("BoroToGunShop", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowgunshop, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", closebtngs,function()
guiSetVisible(windowgunshop, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
windowgs2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "GunShop/Interior/bgpage.png", false)
--guiWindowSetSizable(windowgs2, false)

-- Dokme Ha Va Matn Ha --
Business2 = guiCreateLabel(76, 3, 410, 50, "Business", false, windowgs2)
guiLabelSetColor(Business2, 255, 255, 255)
guiSetFont(Business2, "default-bold-small")
khat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, windowgs2)
guiLabelSetColor(khat2, 0, 255, 0)
Matn2 = guiCreateLabel(67, 35, 410, 50, "Gun Shop LS", false, windowgs2)
guiLabelSetColor(Matn2, 0, 255, 0)
guiSetFont(Matn2, "default-bold-small")
		
Exitbtngs = guiCreateButton(10, 96, 180, 40, "Exit", false, windowgs2)
guiSetProperty(Exitbtngs, "HoverTextColour", "FF00FF00" )

buybtngs2 = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, windowgs2)
guiSetProperty(buybtngs2, "HoverTextColour", "FF00FF00" )
closebtngs2 = guiCreateButton(114, 140, 76, 30, "Close", false, windowgs2)
guiSetProperty(closebtngs2, "HoverTextColour", "FFFE0000" )
guiSetVisible(windowgs2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitGS",true)
addEventHandler("BiadPanelExitGS",getLocalPlayer(),function()
guiSetVisible(windowgs2, true)
guiSetEnabled(buybtngs2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", Exitbtngs,function()
triggerServerEvent("BiaBironGunShop", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(windowgs2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", closebtngs2,function()
guiSetVisible(windowgs2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(windowgunshop, false)
guiSetVisible(windowgs2, false)
showCursor(false)
end, false)
