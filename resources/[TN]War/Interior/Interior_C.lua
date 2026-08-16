


---------------------------------------- Albania -------------------------------------




---------^^^^^^---------||||--------***   Vorod    ***-----||||||---------------^^^^^^--------

-- Enter Panel --

local screenW, screenH = guiGetScreenSize()
m1window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
----guiWindowSetSizable(m1window, false)

-- Dokme Ha Va Matn Ha --
nrBusiness = guiCreateLabel(81, 3, 410, 50, "Gang", false, m1window)
guiLabelSetColor(nrBusiness, 255, 255, 255)
guiSetFont(nrBusiness, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m1window)
guiLabelSetColor(nrkhat, 0, 255, 0)

nrMatn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m1window)
guiLabelSetColor(nrMatn, 0, 255, 0)
guiSetFont(nrMatn, "default-bold-small")
	
nrEnterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m1window)
guiSetProperty(nrEnterbtn, "HoverTextColour", "FF00FF00" )


nrclosebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m1window)
guiSetProperty(nrclosebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m1window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm1",true)
addEventHandler("BiadPanelEnterm1",getLocalPlayer(),function()
guiSetVisible(m1window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", nrEnterbtn,function()
triggerServerEvent("BoroTom1", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m1window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", nrclosebtn,function()
guiSetVisible(m1window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m1window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
----guiWindowSetSizable(m1window2, false)

-- Dokme Ha Va Matn Ha --
nrBusiness2 = guiCreateLabel(81, 3, 410, 50, "Gang", false, m1window2)
guiLabelSetColor(nrBusiness2, 255, 255, 255)
guiSetFont(nrBusiness2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m1window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
nrMatn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m1window2)
guiLabelSetColor(nrMatn2, 0, 255, 0)
guiSetFont(nrMatn2, "default-bold-small")
		

nrExitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m1window2)
guiSetProperty(nrExitbtn2, "HoverTextColour", "FF00FF00" )


nrclosebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m1window2)
guiSetProperty(nrclosebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m1window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm1",true)
addEventHandler("BiadPanelExitm1",getLocalPlayer(),function()
guiSetVisible(m1window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", nrExitbtn2,function()
triggerServerEvent("BiaBironm1", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m1window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", nrclosebtn2,function()
guiSetVisible(m1window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m1window, false)
guiSetVisible(m1window2, false)
showCursor(false)
end, false)

























----------------- mafia Avengers --------------------






m2window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
----guiWindowSetSizable(m2window, false)

-- Dokme Ha Va Matn Ha --
m2Business = guiCreateLabel(86, 3, 410, 50, "Gang", false, m2window)
guiLabelSetColor(m2Business, 255, 255, 255)
guiSetFont(m2Business, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m2window)
guiLabelSetColor(nrkhat, 0, 255, 0)

m2Matn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m2window)
guiLabelSetColor(m2Matn, 0, 255, 0)
guiSetFont(m2Matn, "default-bold-small")
	
m2Enterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m2window)
guiSetProperty(m2Enterbtn, "HoverTextColour", "FF00FF00" )


m2closebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m2window)
guiSetProperty(m2closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m2window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm2",true)
addEventHandler("BiadPanelEnterm2",getLocalPlayer(),function()
guiSetVisible(m2window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", m2Enterbtn,function()
triggerServerEvent("BoroTom2", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m2window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m2closebtn,function()
guiSetVisible(m2window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m2window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m2window2, false)

-- Dokme Ha Va Matn Ha --
m2Business2 = guiCreateLabel(86, 3, 410, 50, "Gang", false, m2window2)
guiLabelSetColor(m2Business2, 255, 255, 255)
guiSetFont(m2Business2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m2window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
m2Matn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m2window2)
guiLabelSetColor(m2Matn2, 0, 255, 0)
guiSetFont(m2Matn2, "default-bold-small")
		

m2Exitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m2window2)
guiSetProperty(m2Exitbtn2, "HoverTextColour", "FF00FF00" )


m2closebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m2window2)
guiSetProperty(m2closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m2window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm2",true)
addEventHandler("BiadPanelExitm2",getLocalPlayer(),function()
guiSetVisible(m2window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", m2Exitbtn2,function()
triggerServerEvent("BiaBironm2", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m2window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m2closebtn2,function()
guiSetVisible(m2window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m2window, false)
guiSetVisible(m2window2, false)
showCursor(false)
end, false)

-------------------------------------------------------------------------------------





















----------------- mafia Bloods --------------------






m3window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m3window, false)

-- Dokme Ha Va Matn Ha --
m3Business = guiCreateLabel(86, 3, 410, 50, "Gang", false, m3window)
guiLabelSetColor(m3Business, 255, 255, 255)
guiSetFont(m3Business, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m3window)
guiLabelSetColor(nrkhat, 0, 255, 0)

m3Matn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m3window)
guiLabelSetColor(m3Matn, 0, 255, 0)
guiSetFont(m3Matn, "default-bold-small")
	
m3Enterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m3window)
guiSetProperty(m3Enterbtn, "HoverTextColour", "FF00FF00" )


m3closebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m3window)
guiSetProperty(m3closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m3window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm3",true)
addEventHandler("BiadPanelEnterm3",getLocalPlayer(),function()
guiSetVisible(m3window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", m3Enterbtn,function()
triggerServerEvent("BoroTom3", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m3window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m3closebtn,function()
guiSetVisible(m3window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m3window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m3window2, false)

-- Dokme Ha Va Matn Ha --
m3Business2 = guiCreateLabel(86, 3, 410, 50, "Gang", false, m3window2)
guiLabelSetColor(m3Business2, 255, 255, 255)
guiSetFont(m3Business2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m3window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
m3Matn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m3window2)
guiLabelSetColor(m3Matn2, 0, 255, 0)
guiSetFont(m3Matn2, "default-bold-small")
		

m3Exitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m3window2)
guiSetProperty(m3Exitbtn2, "HoverTextColour", "FF00FF00" )


m3closebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m3window2)
guiSetProperty(m3closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m3window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm3",true)
addEventHandler("BiadPanelExitm3",getLocalPlayer(),function()
guiSetVisible(m3window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", m3Exitbtn2,function()
triggerServerEvent("BiaBironm3", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m3window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m3closebtn2,function()
guiSetVisible(m3window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m3window, false)
guiSetVisible(m3window2, false)
showCursor(false)
end, false)

-------------------------------------------------------------------------------------


















----------------- mafia iNFiNiTy --------------------






m4window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m4window, false)

-- Dokme Ha Va Matn Ha --
m4Business = guiCreateLabel(86, 3, 410, 50, "Gang", false, m4window)
guiLabelSetColor(m4Business, 255, 255, 255)
guiSetFont(m4Business, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m4window)
guiLabelSetColor(nrkhat, 0, 255, 0)

m4Matn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m4window)
guiLabelSetColor(m4Matn, 0, 255, 0)
guiSetFont(m4Matn, "default-bold-small")
	
m4Enterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m4window)
guiSetProperty(m4Enterbtn, "HoverTextColour", "FF00FF00" )


m4closebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m4window)
guiSetProperty(m4closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m4window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm4",true)
addEventHandler("BiadPanelEnterm4",getLocalPlayer(),function()
guiSetVisible(m4window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", m4Enterbtn,function()
triggerServerEvent("BoroTom4", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m4window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m4closebtn,function()
guiSetVisible(m4window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m4window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m4window2, false)

-- Dokme Ha Va Matn Ha --
m4Business2 = guiCreateLabel(86, 3, 410, 50, "Gang", false, m4window2)
guiLabelSetColor(m4Business2, 255, 255, 255)
guiSetFont(m4Business2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m4window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
m4Matn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m4window2)
guiLabelSetColor(m4Matn2, 0, 255, 0)
guiSetFont(m4Matn2, "default-bold-small")
		

m4Exitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m4window2)
guiSetProperty(m4Exitbtn2, "HoverTextColour", "FF00FF00" )


m4closebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m4window2)
guiSetProperty(m4closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m4window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm4",true)
addEventHandler("BiadPanelExitm4",getLocalPlayer(),function()
guiSetVisible(m4window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", m4Exitbtn2,function()
triggerServerEvent("BiaBironm4", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m4window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m4closebtn2,function()
guiSetVisible(m4window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m4window, false)
guiSetVisible(m4window2, false)
showCursor(false)
end, false)

-------------------------------------------------------------------------------------




















----------------- mafia Virus --------------------






m5window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m5window, false)

-- Dokme Ha Va Matn Ha --
m5Business = guiCreateLabel(86, 3, 410, 50, "Gang", false, m5window)
guiLabelSetColor(m5Business, 255, 255, 255)
guiSetFont(m5Business, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m5window)
guiLabelSetColor(nrkhat, 0, 255, 0)

m5Matn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m5window)
guiLabelSetColor(m5Matn, 0, 255, 0)
guiSetFont(m5Matn, "default-bold-small")
	
m5Enterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m5window)
guiSetProperty(m5Enterbtn, "HoverTextColour", "FF00FF00" )


m5closebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m5window)
guiSetProperty(m5closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m5window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm5",true)
addEventHandler("BiadPanelEnterm5",getLocalPlayer(),function()
guiSetVisible(m5window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", m5Enterbtn,function()
triggerServerEvent("BoroTom5", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m5window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m5closebtn,function()
guiSetVisible(m5window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m5window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m5window2, false)

-- Dokme Ha Va Matn Ha --
m5Business2 = guiCreateLabel(86, 3, 410, 50, "Gang", false, m5window2)
guiLabelSetColor(m5Business2, 255, 255, 255)
guiSetFont(m5Business2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m5window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
m5Matn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m5window2)
guiLabelSetColor(m5Matn2, 0, 255, 0)
guiSetFont(m5Matn2, "default-bold-small")
		

m5Exitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m5window2)
guiSetProperty(m5Exitbtn2, "HoverTextColour", "FF00FF00" )


m5closebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m5window2)
guiSetProperty(m5closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m5window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm5",true)
addEventHandler("BiadPanelExitm5",getLocalPlayer(),function()
guiSetVisible(m5window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", m5Exitbtn2,function()
triggerServerEvent("BiaBironm5", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m5window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m5closebtn2,function()
guiSetVisible(m5window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m5window, false)
guiSetVisible(m5window2, false)
showCursor(false)
end, false)

-------------------------------------------------------------------------------------



















----------------- mafia Yakuza --------------------






m6window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m6window, false)

-- Dokme Ha Va Matn Ha --
m6Business = guiCreateLabel(86, 3, 410, 50, "Gang", false, m6window)
guiLabelSetColor(m6Business, 255, 255, 255)
guiSetFont(m6Business, "default-bold-small")
nrkhat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m6window)
guiLabelSetColor(nrkhat, 0, 255, 0)

m6Matn = guiCreateLabel(65, 35, 410, 50, "Gang", false, m6window)
guiLabelSetColor(m6Matn, 0, 255, 0)
guiSetFont(m6Matn, "default-bold-small")
	
m6Enterbtn = guiCreateButton(10, 86, 180, 40, "Enter", false, m6window)
guiSetProperty(m6Enterbtn, "HoverTextColour", "FF00FF00" )


m6closebtn = guiCreateButton(10, 130, 180, 40, "Close", false, m6window)
guiSetProperty(m6closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(m6window, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelEnterm6",true)
addEventHandler("BiadPanelEnterm6",getLocalPlayer(),function()
guiSetVisible(m6window, true)
showCursor(true)
end )


-- Ba Click Roye Enter Bere To --
addEventHandler ( "onClientGUIClick", m6Enterbtn,function()
triggerServerEvent("BoroTom6", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m6window, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m6closebtn,function()
guiSetVisible(m6window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Exit Panel --
local screenW, screenH = guiGetScreenSize()
m6window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
--guiWindowSetSizable(m6window2, false)

-- Dokme Ha Va Matn Ha --
m6Business2 = guiCreateLabel(86, 3, 410, 50, "Gang", false, m6window2)
guiLabelSetColor(m6Business2, 255, 255, 255)
guiSetFont(m6Business2, "default-bold-small")
nrkhat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, m6window2)
guiLabelSetColor(nrkhat2, 0, 255, 0)
m6Matn2 = guiCreateLabel(65, 35, 410, 50, "Gang", false, m6window2)
guiLabelSetColor(m6Matn2, 0, 255, 0)
guiSetFont(m6Matn2, "default-bold-small")
		

m6Exitbtn2 = guiCreateButton(10, 86, 180, 40, "Exit", false, m6window2)
guiSetProperty(m6Exitbtn2, "HoverTextColour", "FF00FF00" )


m6closebtn2 = guiCreateButton(10, 130, 180, 40, "Close", false, m6window2)
guiSetProperty(m6closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(m6window2, false)


--Raft Ro Marker Panel Baid --
addEvent("BiadPanelExitm6",true)
addEventHandler("BiadPanelExitm6",getLocalPlayer(),function()
guiSetVisible(m6window2, true)
--guiSetEnabled(buybtn2, false)
showCursor(true)
end )


-- Ba Click Roye Exit Biad Biron --
addEventHandler ( "onClientGUIClick", m6Exitbtn2,function()
triggerServerEvent("BiaBironm6", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(m6window2, false)
showCursor(false)
end, false )

-- Ba Click Roye Close Baste She --
addEventHandler ( "onClientGUIClick", m6closebtn2,function()
guiSetVisible(m6window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(m6window, false)
guiSetVisible(m6window2, false)
showCursor(false)
end, false)

-------------------------------------------------------------------------------------




