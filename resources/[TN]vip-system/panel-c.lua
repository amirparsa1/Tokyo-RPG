local myfont = guiCreateFont("font/myfont.ttf", 12)
bindKey("o", "down", "ovp")
local s = "10 day"
local screenW, screenH = guiGetScreenSize()
	vippanel = guiCreateStaticImage((screenW - 477) / 2, (screenH - 724) / 4, 477, 724, "bg1.png", false)
	guiSetProperty(vippanel, "Visible", "False")
	text1 = guiCreateLabel(85, 170, 80, 40, "Hide Me", false, vippanel)
	superlabal1 = guiCreateStaticImage(80, 123, 80, 40, "icons/hide.png", false, vippanel)

	text2 = guiCreateLabel(303, 170, 87, 40, "Veh Car", false, vippanel)
	superlabal2 = guiCreateStaticImage(296, 123, 87, 40, "icons/car.png", false, vippanel)


	text3 = guiCreateLabel(80, 347, 80, 50, "Give Gun", false, vippanel)
	superlabal4 = guiCreateStaticImage(80, 300, 80, 50, "icons/gun.png", false, vippanel)
	
	text4 = guiCreateLabel(301, 365, 87, 65, "VIP Skin", false, vippanel)
	superlabal5 = guiCreateStaticImage(296, 300, 87, 65, "icons/suit.png", false, vippanel)
    
	
	text5 = guiCreateLabel(80, 534, 80, 40, "jetPack", false, vippanel)
	superlabal3 = guiCreateStaticImage(80, 487, 80, 40, "icons/jetpack.png", false, vippanel)

	superclose = guiCreateStaticImage(400, 15, 60, 50, "icons/close.png", false, vippanel)
	--
	--
	guiSetFont(text1, myfont)
    guiSetProperty(text1 , "NormalTextColour", "dd00dd99" ) 
	
	guiSetFont(text2, myfont)
    guiSetProperty(text2 , "NormalTextColour", "dd00dd99" ) 

	guiSetFont(text3, myfont)
    guiSetProperty(text3 , "NormalTextColour", "dd00dd99" ) 

	guiSetFont(text4, myfont)
    guiSetProperty(text4 , "NormalTextColour", "dd00dd99" ) 

	guiSetFont(text5, myfont)
    guiSetProperty(text5 , "NormalTextColour", "dd00dd99" ) 

	guiSetProperty(vippanel, "Visible", "False")
	

---------------------------------
-------**Script By zezaw**-------
---------------------------------
function markerhitvip(thePlayer)
	if ( thePlayer == getLocalPlayer() ) then
		if tonumber(getElementData(thePlayer, "vipopenpanel")) == 0 then
			guiSetProperty(vippanel, "Visible", "False")
			showCursor(false)
			setElementData(thePlayer, "vipopenpanel", 1)
		else
			setElementData(thePlayer, "vipopenpanel", 0)
			guiSetProperty(vippanel, "Visible", "True")
			showCursor(true)
		end

	end
end
addEvent("showvippanel",true)
addEventHandler("showvippanel", root, markerhitvip)
---------------------------------
addEventHandler("onClientGUIClick", getRootElement(),
function ()
	if source == superclose then
		guiSetProperty(vippanel, "Visible", "False")
		showCursor(false)
		setSoundVolume(sound,0.9)
	elseif source == superlabal1 then
		triggerServerEvent( "hideshkon",localPlayer )
	elseif source == superlabal2 then
		triggerServerEvent( "vehcar",localPlayer )
	elseif source == superlabal3 then
		triggerServerEvent( "givejetpackvip",localPlayer )
	elseif source == superlabal4 then
	    triggerServerEvent( "givegunvip",localPlayer )
	elseif source == superlabal5 then
	    triggerServerEvent( "skinvipser",localPlayer )
	end
end)