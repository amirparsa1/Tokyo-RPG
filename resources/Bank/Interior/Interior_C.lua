---------------------------------
-------**Script By zezaw**-------
---------------------------------

---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Enter Panel <--

local screenW, screenH = guiGetScreenSize()
window = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
guiWindowSetSizable(window, false)

--> Dokme Ha Va Matn Ha <--
Business = guiCreateLabel(76, 3, 410, 50, "Business", false, window)
guiLabelSetColor(Business, 255, 255, 255)
guiSetFont(Business, "default-bold-small")
khat = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, window)
guiLabelSetColor(khat, 0, 255, 0)
Vorodi = guiCreateLabel(67, 62, 410, 50, "Vorodi: $20", false, window)
guiLabelSetColor(Vorodi, 255, 255, 255)
guiSetFont(Vorodi, "default-bold-small")
Matn = guiCreateLabel(77, 35, 410, 50, "Bank LS", false, window)
guiLabelSetColor(Matn, 0, 255, 0)
guiSetFont(Matn, "default-bold-small")
		
Enterbtn = guiCreateButton(10, 96, 180, 40, "Enter", false, window)
guiSetProperty(Enterbtn, "HoverTextColour", "FF00FF00" )

buybtn = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, window)
guiSetProperty(buybtn, "HoverTextColour", "FF00FF00" )
closebtn = guiCreateButton(114, 140, 76, 30, "Close", false, window)
guiSetProperty(closebtn, "HoverTextColour", "FFFE0000" )
guiSetVisible(window, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelEnterBank",true)
addEventHandler("BiadPanelEnterBank",getLocalPlayer(),function()
guiSetVisible(window, true)
guiSetEnabled(buybtn, false)
showCursor(true)
end )


--> Ba Click Roye Enter Bere To <--
addEventHandler ( "onClientGUIClick", Enterbtn,function()
triggerServerEvent("BoroToBank", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(window, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtn,function()
guiSetVisible(window, false)
showCursor(false)
end, false )


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Exit Panel <--
local screenW, screenH = guiGetScreenSize()
window2 = guiCreateStaticImage((screenW - 200) / 2, (screenH - 180) / 2, 200, 180, "interior/bgpage.png", false)
guiWindowSetSizable(window2, false)

--> Dokme Ha Va Matn Ha <--
Business2 = guiCreateLabel(76, 3, 410, 50, "Business", false, window2)
guiLabelSetColor(Business2, 255, 255, 255)
guiSetFont(Business2, "default-bold-small")
khat2 = guiCreateLabel(6, 10, 410, 200, "ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", false, window2)
guiLabelSetColor(khat2, 0, 255, 0)
Matn2 = guiCreateLabel(77, 35, 410, 50, "Bank LS", false, window2)
guiLabelSetColor(Matn2, 0, 255, 0)
guiSetFont(Matn2, "default-bold-small")
		
Exitbtn = guiCreateButton(10, 96, 180, 40, "Exit", false, window2)
guiSetProperty(Exitbtn, "HoverTextColour", "FF00FF00" )

buybtn2 = guiCreateButton(10, 140, 100, 30, "Buy This Biz", false, window2)
guiSetProperty(buybtn2, "HoverTextColour", "FF00FF00" )
closebtn2 = guiCreateButton(114, 140, 76, 30, "Close", false, window2)
guiSetProperty(closebtn2, "HoverTextColour", "FFFE0000" )
guiSetVisible(window2, false)


--> Raft Ro Marker Panel Baid <--
addEvent("BiadPanelExitBank",true)
addEventHandler("BiadPanelExitBank",getLocalPlayer(),function()
guiSetVisible(window2, true)
guiSetEnabled(buybtn2, false)
showCursor(true)
end )

--> Ba Click Roye Exit Biad Biron <--
addEventHandler ( "onClientGUIClick", Exitbtn,function()
triggerServerEvent("BiaBironBank", getLocalPlayer(), getLocalPlayer() )
guiSetVisible(window2, false)
showCursor(false)
end, false )

--> Ba Click Roye Close Baste She <--
addEventHandler ( "onClientGUIClick", closebtn2,function()
guiSetVisible(window2, false)
showCursor(false)
end, false )

--> Bade Kill Panel Baste She <--
addEvent("BasteSheBadeKill",true)
addEventHandler("BasteSheBadeKill",getLocalPlayer(), function()
guiSetVisible(window, false)
guiSetVisible(window2, false)
showCursor(false)
end, false)