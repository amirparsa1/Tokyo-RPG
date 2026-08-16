
---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
FbiwindowH = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)

-- Dokme Ha Va Matn Ha --
nrBusinessH = guiCreateLabel(76, 3, 410, 50, "Factions", false, FbiwindowH)
guiLabelSetColor(nrBusinessH, 255, 255, 255)
guiSetFont(nrBusinessH, "default-bold-small")
nrkhatH = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, FbiwindowH)
guiLabelSetColor(nrkhatH, 0, 255, 0)

nrMatnH = guiCreateLabel(55, 35, 410, 50, "Zendan Markazi", false, FbiwindowH)
guiLabelSetColor(nrMatnH, 0, 255, 0)
guiSetFont(nrMatnH, "default-bold-small")
	
FbiEnterbtnH = guiCreateButton(10, 86, 180, 40, "Enter", false, FbiwindowH)
guiSetProperty(FbiEnterbtnH, "HoverTextColour", "FF00FF00" )


FbiclosebtnH = guiCreateButton(10, 130, 180, 40, "Close", false, FbiwindowH)
guiSetProperty(FbiclosebtnH, "HoverTextColour", "FFFE0000" )
guiSetVisible(FbiwindowH, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterJail",true)
addEventHandler("BiadPanelEnterJail",getLocalPlayer(),function()
guiSetVisible(FbiwindowH, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", FbiEnterbtnH,function()
triggerServerEvent("BoroToJail", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(FbiwindowH, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", FbiclosebtnH,function()
guiSetVisible(FbiwindowH, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
Fbiwindow2H = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)

-- Dokme Ha Va Matn Ha --
nrBusiness2H = guiCreateLabel(76, 3, 410, 50, "Factions", false, Fbiwindow2H)
guiLabelSetColor(nrBusiness2H, 255, 255, 255)
guiSetFont(nrBusiness2H, "default-bold-small")
nrkhat2H = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, Fbiwindow2H)
guiLabelSetColor(nrkhat2H, 0, 255, 0)
nrMatn2H = guiCreateLabel(55, 35, 410, 50, "Zendan Markazi", false, Fbiwindow2H)
guiLabelSetColor(nrMatn2H, 0, 255, 0)
guiSetFont(nrMatn2H, "default-bold-small")
		

FbiExitbtn2H = guiCreateButton(10, 86, 180, 40, "Exit", false, Fbiwindow2H)
guiSetProperty(FbiExitbtn2H, "HoverTextColour", "FF00FF00" )


Fbiclosebtn2H = guiCreateButton(10, 130, 180, 40, "Close", false, Fbiwindow2H)
guiSetProperty(Fbiclosebtn2H, "HoverTextColour", "FFFE0000" )
guiSetVisible(Fbiwindow2H, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitJail",true)
addEventHandler("BiadPanelExitJail",getLocalPlayer(),function()
guiSetVisible(Fbiwindow2H, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", FbiExitbtn2H,function()
triggerServerEvent("BiaBironJail", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(Fbiwindow2H, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", Fbiclosebtn2H,function()
guiSetVisible(Fbiwindow2H, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(Fbiwindow2H, false)
showCursor(false)
end, false)