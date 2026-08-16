local screenW, screenH = guiGetScreenSize()
local whatsGender = nil

GUIEditor = {
    staticimage = {},
    edit = {},
    label = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
function()

	----------- Baraye Register Panel -------------
	local font0_font = guiCreateFont("Data/font.ttf", 14)
	local font2_font = guiCreateFont("Data/font.ttf", 21)
	local font1 = guiCreateFont("Data/font.ttf", 25)
	local font1_font = guiCreateFont("Data/font2.ttf", 23)

----------

	
        backgrounds = guiCreateStaticImage((screenW - 640) / 2, (screenH - 640) / 2, 640, 640, "Data/dPannel.png", false)
		guiSetProperty( backgrounds, "Visible", "False")
		---------------------- Dokme Ha -----------------------------
		ClosePanel = guiCreateStaticImage(580, 65, 60, 60, "Data/Click.png", false, backgrounds)
		paynows = guiCreateStaticImage(90, 450, 500, 100, "Data/Click.png", false, backgrounds)
		-------------------------------------------------------------
end)





------- Config Script ------------
addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == ClosePanel then
		guiSetProperty(backgrounds, "Visible", "False")
		showCursor ( false )
		guiSetInputEnabled( false )
	elseif source == paynows then
		triggerServerEvent("pardakhtdie", getLocalPlayer(), getLocalPlayer() ) --#Code By ExMohmD :D
    
    end
end)


addEvent("DadGaPannel",true)
addEventHandler("DadGaPannel",getLocalPlayer(),function()
if getElementData(getLocalPlayer(), "loggedIn") == true then
        local windowState = guiGetProperty(backgrounds, "Visible")
        if windowState == "False" then
            guiSetProperty(backgrounds, "Visible", "True")
            showCursor ( true )
			guiSetInputEnabled( true )
        end
    end
end)

addEvent("playBackup", true)
addEventHandler("playBackup", getLocalPlayer(), function(soundId)
	if soundId == 1 then 
		local sound = playSound("Data/backup.mp3") 
		setSoundVolume(sound, 0.2) 
	elseif soundId == 2 then 
		local sound = playSound("Data/enfejar.mp3") 
		setSoundVolume(sound, 0.5) 
	end 
end)