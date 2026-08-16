GUIEditor = {
    button = {},
    window = {},
    staticimage = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
	local screenW, screenH = guiGetScreenSize()
	    GUIEditor.window[1] = guiCreateWindow((screenW - 604) / 2, (screenH - 340) / 2.5, 604, 340, "Kharid Aslahe", false)
    
        guiWindowSetSizable(GUIEditor.window[1], false)
		guiSetVisible(GUIEditor.window[1], false)
		-- Button
        GUIEditor.button[1] = guiCreateButton(250, 296, 100, 34, "Close", false, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(41, 118, 77, 34, "Pistol\n8000$", false, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(131, 118, 77, 34, "Deagle\n10000$", false, GUIEditor.window[1])
        GUIEditor.button[4] = guiCreateButton(221, 118, 77, 34, "Sawn-Off\n13000$", false, GUIEditor.window[1])
        GUIEditor.button[5] = guiCreateButton(311, 118, 77, 34, "Shotgun\n15000$", false, GUIEditor.window[1])
        GUIEditor.button[6] = guiCreateButton(401, 118, 77, 34, "SPAZ-12\n15000$", false, GUIEditor.window[1])
        GUIEditor.button[7] = guiCreateButton(491, 118, 74, 34, "Tec-9\n12000$", false, GUIEditor.window[1])
        GUIEditor.button[8] = guiCreateButton(41, 243, 77, 34, "Uzi\n12000$", false, GUIEditor.window[1])
        GUIEditor.button[9] = guiCreateButton(131, 243, 77, 34, "MP5\n13000$", false, GUIEditor.window[1])
        GUIEditor.button[10] = guiCreateButton(221, 243, 77, 34, "M4\n25000$", false, GUIEditor.window[1])
        GUIEditor.button[11] = guiCreateButton(311, 243, 77, 34, "Ak-47\n25000$", false, GUIEditor.window[1])
		GUIEditor.button[12] = guiCreateButton(401, 243, 77, 34, "Rifle\n15000$", false, GUIEditor.window[1])

		guiSetProperty(GUIEditor.button[1], "HoverTextColour", "FFFE0000" )
		guiSetProperty(GUIEditor.button[2], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[3], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[4], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[5], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[6], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[7], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[8], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[9], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[10], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[11], "HoverTextColour", "FF00FF00" )
		guiSetProperty(GUIEditor.button[12], "HoverTextColour", "FF00FF00" )

	
		
		
		
		-- Images
        GUIEditor.staticimage[1] = guiCreateStaticImage(41, 40, 80, 80, "GunShop/Data/Pistol.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[2] = guiCreateStaticImage(131, 40, 80, 80, "GunShop/Data/Deagle.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[3] = guiCreateStaticImage(221, 40, 80, 80, "GunShop/Data/Sawn-Off.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[4] = guiCreateStaticImage(311, 40, 80, 80, "GunShop/Data/Shotgun.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[5] = guiCreateStaticImage(401, 40, 80, 80, "GunShop/Data/Spaz.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[6] = guiCreateStaticImage(490, 40, 80, 80, "GunShop/Data/Tec.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[7] = guiCreateStaticImage(41, 165, 80, 80, "GunShop/Data/Uzi.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[8] = guiCreateStaticImage(131, 165, 80, 80, "GunShop/Data/Mp5.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[9] = guiCreateStaticImage(221, 165, 80, 80, "GunShop/Data/M4.png", false, GUIEditor.window[1])
        GUIEditor.staticimage[10] = guiCreateStaticImage(311, 165, 80, 80, "GunShop/Data/Ak.png", false, GUIEditor.window[1])
		GUIEditor.staticimage[11] = guiCreateStaticImage(401, 165, 80, 80, "GunShop/Data/Rifle.png", false, GUIEditor.window[1])

		
		
		
		
		-- Font
        guiSetFont(GUIEditor.button[1], "default-bold-small")
        guiSetFont(GUIEditor.button[2], "default-bold-small")
        guiSetFont(GUIEditor.button[3], "default-bold-small")
        guiSetFont(GUIEditor.button[4], "default-bold-small")
        guiSetFont(GUIEditor.button[5], "default-bold-small")
        guiSetFont(GUIEditor.button[6], "default-bold-small")
        guiSetFont(GUIEditor.button[7], "default-bold-small")
        guiSetFont(GUIEditor.button[8], "default-bold-small")
        guiSetFont(GUIEditor.button[9], "default-bold-small")
        guiSetFont(GUIEditor.button[10], "default-bold-small")
        guiSetFont(GUIEditor.button[11], "default-bold-small")
        guiSetFont(GUIEditor.button[12], "default-bold-small")
  		
    end
)

--if you want add Marker# {},
Mark = {
{296.03515625 ,-38.5146484375 ,1001.515625},
}
--Marker
--local Marker1 = createMarker(296.03515625 ,-38.5146484375 ,1000.615625, "cylinder", 1, 255 , 40 , 40 )
--setElementInterior (Marker1,1)
--setElementDimension (Marker1, 0)


for k,v in ipairs (Mark) do
z = v[3] -1
--Marker = createMarker ( v[1], v[2], z, "cylinder", 0.8, 255 , 40 , 40 )
addEventHandler('onClientMarkerHit', Marker,
    function ( hitPlayer )
        if ( hitPlayer == localPlayer ) then
            guiSetVisible (GUIEditor.window[1], true )
            showCursor( true )
			guiSetInputEnabled( true )
			setElementFrozen(localPlayer,true)
        end
    end
)
end


------ped
gunshopped = createPed( 179, 296.0048828125 ,-40.2158203125 ,1001.515625)
setElementRotation ( gunshopped, 0, 0 , 0 )
setElementInterior ( gunshopped, 1 )
setElementDimension (createPed, 0)
setElementFrozen(gunshopped, true)


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", gunshopped, cancelPedDamage)


function gunnpc()
	setTimer ( function()
		setPedAnimation(gunshopped,"playidles","shift",1,true,false)
		
	end, 1000, 0 )
end
gunnpc()



addEventHandler ("onClientGUIClick", getRootElement(), 
function(button, state, absoluteX, absoluteY)
if ( source == GUIEditor.button[1] ) then
guiSetVisible ( GUIEditor.window[1] , false)
showCursor ( false )
setElementFrozen(localPlayer,false) 
guiSetVisible ( GUIEditor.window[1] , false)
guiSetInputEnabled( false )
showCursor ( false ) 
elseif ( source ==  GUIEditor.button[2] ) then 
triggerServerEvent("Pistol",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[3] ) then 
triggerServerEvent("Deagle",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[4] ) then 
triggerServerEvent("Sawn-Off",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[5] ) then 
triggerServerEvent("Shotgun",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[6] ) then  
triggerServerEvent("Spaz",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[7] ) then 
triggerServerEvent("Tec",getLocalPlayer())
elseif ( source ==  GUIEditor.button[8] ) then 
triggerServerEvent("Uzi",getLocalPlayer())
elseif ( source ==  GUIEditor.button[9] ) then 
triggerServerEvent("Mp5",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[10] ) then 
triggerServerEvent("M4",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[11] ) then 
triggerServerEvent("AK",getLocalPlayer()) 
elseif ( source ==  GUIEditor.button[12] ) then 
triggerServerEvent("Rifle",getLocalPlayer())  

end
end)


createBlip ( 1368, -1279, 14 , 6 )



addEvent("BasteSheBadeKillPanelGunShop",true)
addEventHandler("BasteSheBadeKillPanelGunShop",getLocalPlayer(), function()
guiSetVisible(GUIEditor.window[1], false)
showCursor ( false )
guiSetInputEnabled( false )
end, false)

addCommandHandler("gotoevent",function()
guiSetVisible(GUIEditor.window[1], false)
showCursor ( false )
guiSetInputEnabled( false )
end)