---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
Fbiwindow = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Interiors/interiorFBI/bgpage.png", false)
guiWindowSetSizable(Fbiwindow, false)

-- Dokme Ha Va Matn Ha --
nrBusiness = guiCreateLabel(76, 3, 410, 50, "Factions", false, Fbiwindow)
guiLabelSetColor(nrBusiness, 255, 255, 255)
guiSetFont(nrBusiness, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, Fbiwindow)
guiLabelSetColor(nrkhat, 0, 255, 0)

nrMatn = guiCreateLabel(90, 35, 410, 50, "FBi", false, Fbiwindow)
guiLabelSetColor(nrMatn, 0, 255, 0)
guiSetFont(nrMatn, "default-bold-small")
	
FbiEnterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, Fbiwindow)
guiSetProperty(FbiEnterbtn, "HoverTextColour", "FF00FF00" )


Fbiclosebtn = guiCreateButton(10, 130, 180, 40, "Close", false, Fbiwindow)
guiSetProperty(Fbiclosebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(Fbiwindow, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterFbi",true)
addEventHandler("BiadPanelEnterFbi",getLocalPlayer(),function()
guiSetVisible(Fbiwindow, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", FbiEnterbtn,function()
triggerServerEvent("BoroToFbi", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(Fbiwindow, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", Fbiclosebtn,function()
guiSetVisible(Fbiwindow, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
Fbiwindow2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Interiors/interiorFBI/bgpage.png", false)
guiWindowSetSizable(Fbiwindow2, false)

-- Dokme Ha Va Matn Ha --
nrBusiness2 = guiCreateLabel(76, 3, 410, 50, "Factions", false, Fbiwindow2)
guiLabelSetColor(nrBusiness2, 255, 255, 255)
guiSetFont(nrBusiness2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, Fbiwindow2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
nrMatn2 = guiCreateLabel(90, 35, 410, 50, "FBi", false, Fbiwindow2)
guiLabelSetColor(nrMatn2, 0, 255, 0)
guiSetFont(nrMatn2, "default-bold-small")
		

FbiExitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, Fbiwindow2)
guiSetProperty(FbiExitbtn2, "HoverTextColour", "FF00FF00" )


Fbiclosebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, Fbiwindow2)
guiSetProperty(Fbiclosebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(Fbiwindow2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitFbi",true)
addEventHandler("BiadPanelExitFbi",getLocalPlayer(),function()
guiSetVisible(Fbiwindow2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", FbiExitbtn2,function()
triggerServerEvent("BiaBironFbi", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(Fbiwindow2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", Fbiclosebtn2,function()
guiSetVisible(Fbiwindow2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(Fbiwindow, false)
guiSetVisible(Fbiwindow2, false)
showCursor(false)
end, false)







---------^^^^^^---------||||--------***   Vorod Poshte Boom  ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
FbiwindowH = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Interiors/interiorFBI/bgpage.png", false)
guiWindowSetSizable(FbiwindowH, false)

-- Dokme Ha Va Matn Ha --
nrBusinessH = guiCreateLabel(76, 3, 410, 50, "Factions", false, FbiwindowH)
guiLabelSetColor(nrBusinessH, 255, 255, 255)
guiSetFont(nrBusinessH, "default-bold-small")
nrkhatH = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, FbiwindowH)
guiLabelSetColor(nrkhatH, 0, 255, 0)

nrMatnH = guiCreateLabel(83, 35, 410, 50, "FBi (H)", false, FbiwindowH)
guiLabelSetColor(nrMatnH, 0, 255, 0)
guiSetFont(nrMatnH, "default-bold-small")
	
FbiEnterbtnH = guiCreateButton(10, 86, 180, 40, "Enter", false, FbiwindowH)
guiSetProperty(FbiEnterbtnH, "HoverTextColour", "FF00FF00" )


FbiclosebtnH = guiCreateButton(10, 130, 180, 40, "Close", false, FbiwindowH)
guiSetProperty(FbiclosebtnH, "HoverTextColour", "FFFE0000" )
guiSetVisible(FbiwindowH, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterFbiH",true)
addEventHandler("BiadPanelEnterFbiH",getLocalPlayer(),function()
guiSetVisible(FbiwindowH, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", FbiEnterbtnH,function()
triggerServerEvent("BoroToFbiH", getLocalPlayer(), getLocalPlayer() )
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
Fbiwindow2H = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "Interiors/interiorFBI/bgpage.png", false)
guiWindowSetSizable(Fbiwindow2H, false)

-- Dokme Ha Va Matn Ha --
nrBusiness2H = guiCreateLabel(76, 3, 410, 50, "Factions", false, Fbiwindow2H)
guiLabelSetColor(nrBusiness2H, 255, 255, 255)
guiSetFont(nrBusiness2H, "default-bold-small")
nrkhat2H = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, Fbiwindow2H)
guiLabelSetColor(nrkhat2H, 0, 255, 0)
nrMatn2H = guiCreateLabel(83, 35, 410, 50, "FBi (H)", false, Fbiwindow2H)
guiLabelSetColor(nrMatn2H, 0, 255, 0)
guiSetFont(nrMatn2H, "default-bold-small")
		

FbiExitbtn2H = guiCreateButton(10, 86, 180, 40, "Exit", false, Fbiwindow2H)
guiSetProperty(FbiExitbtn2H, "HoverTextColour", "FF00FF00" )


Fbiclosebtn2H = guiCreateButton(10, 130, 180, 40, "Close", false, Fbiwindow2H)
guiSetProperty(Fbiclosebtn2H, "HoverTextColour", "FFFE0000" )
guiSetVisible(Fbiwindow2H, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitFbiH",true)
addEventHandler("BiadPanelExitFbiH",getLocalPlayer(),function()
guiSetVisible(Fbiwindow2H, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", FbiExitbtn2H,function()
triggerServerEvent("BiaBironFbiH", getLocalPlayer(), getLocalPlayer() )
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
guiSetVisible(Fbiwindow, false)
guiSetVisible(Fbiwindow2H, false)
showCursor(false)
end, false)