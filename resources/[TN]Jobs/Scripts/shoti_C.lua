local screenW, screenH = guiGetScreenSize()
ShotiBg = guiCreateStaticImage((screenW - 482) / 2, (screenH - 230) / 2, 482, 270, "Files/Bg.png", false)
ShotiLabel1 = guiCreateLabel(126, 0, 222, 49, "Job : Shoti Savar", false, ShotiBg)
font = guiCreateFont("Files/Font.ttf", 17)
guiSetFont(ShotiLabel1, font)
guiLabelSetHorizontalAlign(ShotiLabel1, "center", true)
guiLabelSetVerticalAlign(ShotiLabel1, "center")
ShotiLabel2 = guiCreateLabel(11, 80, 461, 180, "----------------------------------------------------------------------", false, ShotiBg)
local comboxshoti = guiCreateComboBox(112, 45, 250, 120, "Noe Mahmole Khod Ra Entekhab Konid", false, ShotiBg)
guiComboBoxAddItem ( comboxshoti, "Material")
guiComboBoxAddItem ( comboxshoti, "Money")
guiLabelSetHorizontalAlign(ShotiLabel2, "center", true)
ShotiReject = guiCreateStaticImage(250, 200, 123, 47, "Files/Reject.png", false, ShotiBg)
ShotiAccept = guiCreateStaticImage(110, 200, 123, 47, "Files/Accept.png", false , ShotiBg )
guiSetProperty(ShotiBg, "Visible", "false")

addEvent("ShowShotiPanel",true)
addEventHandler("ShowShotiPanel", root,
function (thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		guiSetProperty(ShotiBg, "Visible", "True")
		showCursor(true)
	end
end)



addEventHandler("onClientGUIClick", getRootElement(),
function ()
	local selected = guiComboBoxGetSelected ( comboxshoti )
	if source == ShotiReject then
		guiSetProperty(ShotiBg, "Visible", "False")
		showCursor(false)
	elseif source == ShotiAccept then
		local blip = createBlip(-1457.9013671875 ,2591.212890625 ,12,38)
		setElementData(blip,'blipName',"Tahvil Mahmole")

		if noemahomale == nil then
			noemahomale = 0
		end
		triggerServerEvent("GiveShotiJob", getLocalPlayer(), getLocalPlayer(), noemahomale)
		guiSetProperty(ShotiBg, "Visible", "False")
		showCursor(false)
	elseif selected == 0 then
		noemahomale = 0
	elseif selected == 1 then
		noemahomale = 1
	end
end)
---------------------------------------------------------------------------------------
local screenW, screenH = guiGetScreenSize()

--[[ Panel Baraye Kharid Material ]]--
daryaftwindow = guiCreateWindow((screenW - 224) / 2, (screenH - 171) / 2, 224, 171, "Mash-Hasan", false)
guiWindowSetSizable(daryaftwindow, false)
guiSetVisible(daryaftwindow, false)
guiSetProperty(daryaftwindow, "CaptionColour", "FF00FFFF")
getbtn = guiCreateButton(32, 38, 162, 40, "Daryaft Jens", false, daryaftwindow)
guiSetProperty(getbtn, "NormalTextColour", "FF00FF00")
exitbuy = guiCreateButton(32, 109, 162, 40, "Exit", false, daryaftwindow)
guiSetProperty(exitbuy, "NormalTextColour", "FFFF0000")

--[[ Panel Baraye Foroosh Material ]]--
tahvilwindow = guiCreateWindow((screenW - 224) / 2, (screenH - 171) / 2, 224, 171, "Ahmad-Sibilo", false)
guiWindowSetSizable(tahvilwindow, false)
guiSetVisible(tahvilwindow, false)
guiSetProperty(tahvilwindow, "CaptionColour", "FF00FFFF")
givebtn = guiCreateButton(32, 38, 162, 40, "Tahvil Jens", false, tahvilwindow)
guiSetProperty(givebtn, "NormalTextColour", "FF00FF00")
exitsell = guiCreateButton(32, 109, 162, 40, "Exit", false, tahvilwindow)
guiSetProperty(exitsell, "NormalTextColour", "FFFF0000")

addEvent("getPanel",true)
addEventHandler("getPanel",getLocalPlayer(),function()
	guiSetVisible(daryaftwindow, true)
	showCursor(true)
end)

addEvent("givePanel",true)
addEventHandler("givePanel",getLocalPlayer(),function()
	guiSetVisible(tahvilwindow, true)
	showCursor(true)
end)

addEventHandler("onClientGUIClick",root,
function ()
	if source == exitbuy then
		guiSetVisible(daryaftwindow, false)
	    showCursor(false)
	elseif source == exitsell then
		guiSetVisible(tahvilwindow, false)
	    showCursor(false)
    elseif source == getbtn then
		triggerServerEvent("getjens",getLocalPlayer())
		guiSetVisible(daryaftwindow, false)
	    showCursor(false)
	elseif source == givebtn then

		destroyElement( blip )
	 	triggerServerEvent("givejens",getLocalPlayer())
		guiSetVisible(tahvilwindow, false)
	    showCursor(false)
	end
end)