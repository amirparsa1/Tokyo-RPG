--[[ For Addres #zezaw
local screenWidth3, screenHeight3 = guiGetScreenSize()
local font = guiCreateFont("Addres/GOTHIC.ttf", 11)
local font2 = guiCreateFont("Addres/GOTHIC.ttf", 8)
local windowWidth3, windowHeight3 = 350, 280
local left3 = screenWidth3/2 - windowWidth3/2
local top3 = screenHeight3/2 - windowHeight3/2
WindowChange3 = guiCreateWindow(left3,top3,windowWidth3,windowHeight3,"Mega",false)
guiWindowSetSizable(WindowChange3,false)
guiSetVisible ( WindowChange3, false )

Copy = guiCreateButton(248,60,60,28,"Copy Link",false,WindowChange3)
guiSetProperty(Copy, "HoverTextColour", "FF00FF00")
guiSetEnabled(Copy,false)

Copy2 = guiCreateButton(265,146,60,28,"Copy Link",false,WindowChange3)
guiSetProperty(Copy2, "HoverTextColour", "FF00FF00")

Close = guiCreateButton(320,20,23,18,"X",false,WindowChange3)
guiSetProperty(Close, "HoverTextColour", "FFFE0000")

EditHex3 = guiCreateEdit(80,60,167,28,"Coming Soon",false,WindowChange3)
guiEditSetReadOnly(EditHex3,true)
guiEditSetMaxLength(EditHex3,40)

EditHex4 = guiCreateEdit(65,146,200,28,"https://discord.gg/t325YmD2SZ",false,WindowChange3)
guiEditSetReadOnly(EditHex4,true)
guiEditSetMaxLength(EditHex4,40)
guiLabelSetColor(EditHex4, 65 , 190 , 218  )

labal1 = guiCreateLabel(33,35,330,25,"Addres Site Mega City",false,WindowChange3)
guiLabelSetColor(labal1, 65 , 190 , 218  )
guiSetFont(labal1, font)

labal12 = guiCreateLabel(13,95,330,25,"__________________________________________",false,WindowChange3)
guiLabelSetColor(labal12, 255 , 255 , 255  )
guiSetFont(labal12, font)

labal2 = guiCreateLabel(12,125,330,25,"Addres Discord Server Mega City",false,WindowChange3)
guiLabelSetColor(labal2, 251 , 255 , 127  )
guiSetFont(labal2, font2)

labal3 = guiCreateLabel(12,200,330,25,"Ghavanin Server Va Factions Dar Site Server Mibashad",false,WindowChange3)
guiLabelSetColor(labal3, 251 , 255 , 255  )
guiSetFont(labal3, font2)

labal4 = guiCreateLabel(12,220,330,25,"Shop Server Dar Site Server Mibashad",false,WindowChange3)
guiLabelSetColor(labal4, 251 , 255 , 255  )
guiSetFont(labal4, font2)

function Click()
	if source == Copy then
		Hexs3 = tostring(guiGetText(EditHex3)) -- #zezaw
		setClipboard(Hexs3)
		triggerServerEvent("BiadNotfBarayeCopy2", getLocalPlayer(), getLocalPlayer() )
	 elseif source == Close then
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
		guiSetVisible ( WindowChange3, false )
		showCursor(false)
		guiSetInputEnabled( false )		
	 elseif source == Copy2 then
	 	Hexs4 = tostring(guiGetText(EditHex4))
		setClipboard(Hexs4)
		triggerServerEvent("BiadNotfBarayeCopy1", getLocalPlayer(), getLocalPlayer() )
	end
end
addEventHandler("onClientGUIClick", root, Click)

--addCommandHandler("link",
bindKey("F9","down",
function()
	guiSetVisible ( WindowChange3, true )
	showCursor(true)
	guiSetInputEnabled( true )
end)





-- For Shop --

local screenWidth4, screenHeight4 = guiGetScreenSize()
local font = guiCreateFont("Addres/GOTHIC.ttf", 11)
local windowWidth4, windowHeight4 = 320, 120
local left4 = screenWidth4/2 - windowWidth4/2
local top4 = screenHeight4/2 - windowHeight4/2
WindowChange4 = guiCreateWindow(left4,top4,windowWidth4,windowHeight4,"Shop",false)
guiWindowSetSizable(WindowChange4,false)
guiSetVisible ( WindowChange4, false )

Copy3 = guiCreateButton(240,60,60,28,"Copy Link",false,WindowChange4)
guiSetProperty(Copy3, "HoverTextColour", "FF00FF00")

Close2 = guiCreateButton(290,20,25,20,"X",false,WindowChange4)
guiSetProperty(Close2, "HoverTextColour", "FFFE0000")

EditHex5 = guiCreateEdit(49,60,190,28,"Coming Soon..",false,WindowChange4)
guiEditSetReadOnly(EditHex5,true)
guiEditSetMaxLength(EditHex5,40)

labal3 = guiCreateLabel(45,35,330,25,"Addres Foroshgah PersianRPG",false,WindowChange4)
guiLabelSetColor(labal3, 0 , 255 , 0  )
guiSetFont(labal3, font)

function Click()
	if source == Copy3 then
		Hexs5 = tostring(guiGetText(EditHex5)) -- #zezaw
		setClipboard(Hexs5)
		triggerServerEvent("BiadNotfBarayeCopy3", getLocalPlayer(), getLocalPlayer() )
	 elseif source == Close2 then
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
		guiSetVisible ( WindowChange4, false )
		showCursor(false)
		guiSetInputEnabled( false )		
	end
end
addEventHandler("onClientGUIClick", root, Click)

addCommandHandler("shop213313123113",
function()
	guiSetVisible ( WindowChange4, true )
	showCursor(true)
	guiSetInputEnabled( true )
end)