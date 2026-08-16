GUIEditor = {
    button = {},
    window = {},
    staticimage = {}
}


addEventHandler("onClientResourceStart", resourceRoot,
    function()
	
	--- Window ---
	local screenW, screenH = guiGetScreenSize()
        overwindow = guiCreateStaticImage((screenW - 600) / 2, (screenH - 241) / 2.5, 600, 241,"GunShop2/Data/bg.png", false)
       -- guiWindowSetSizable(overwindow, false)
		guiSetVisible(overwindow, false)


     ---btns ---
        bastan = guiCreateButton(250, 197, 100, 34, "Close", false, overwindow)
        btn1 = guiCreateButton(70, 122, 77, 34, "Satchel\n1700G", false, overwindow)
        btn2 = guiCreateButton(160, 122, 77, 34, "Molotov\n1200G", false, overwindow)
        btn3 = guiCreateButton(250, 122, 77, 34, "Bomb\n1200G", false, overwindow)
        btn4 = guiCreateButton(340, 122, 106, 34, "Rocked Launcher\n20000G", false, overwindow)
        btn5 = guiCreateButton(460, 122, 77, 34, "Parachute\n1000G", false, overwindow)
		-----------------------------------------------------------------------------
		guiSetProperty(bastan, "HoverTextColour", "FFFE0000" )
		guiSetProperty(btn1, "HoverTextColour", "FF00FF00" )
		guiSetProperty(btn2, "HoverTextColour", "FF00FF00" )
		guiSetProperty(btn3, "HoverTextColour", "FF00FF00" )
		guiSetProperty(btn4, "HoverTextColour", "FF00FF00" )
		guiSetProperty(btn5, "HoverTextColour", "FF00FF00" )
		------------------------------------------------------------------------------
		
	
		-- Images --
        img1 = guiCreateStaticImage(70, 47, 78, 74, "GunShop2/Data/satchelicon.png", false, overwindow)
        img2 = guiCreateStaticImage(160, 47, 78, 74, "GunShop2/Data/molotovicon.png", false, overwindow)
        img3 = guiCreateStaticImage(250, 47, 78, 74, "GunShop2/Data/grenadeicon.png", false, overwindow)
        img4 = guiCreateStaticImage(352, 47, 78, 74, "GunShop2/Data/rocketlaicon.png", false, overwindow)
        img5 = guiCreateStaticImage(460, 47, 78, 74, "GunShop2/Data/gun_paraicon.png", false, overwindow)
		
		
			
		-- Font --
        guiSetFont(bastan, "default-bold-small")
        guiSetFont(btn1, "default-bold-small")
        guiSetFont(btn2, "default-bold-small")
        guiSetFont(btn3, "default-bold-small")
        guiSetFont(btn4, "default-bold-small")
  		guiSetFont(btn5, "default-bold-small")
    end
)



--if you want add Marker# {},
Mark = {
{311.96875 ,-165.3076171875 ,998.2},
}


--Marker
local Marker1 = createMarker(311.96875 ,-165.3076171875 ,998.2, "cylinder", 1.3,   42 , 48 , 8  )
setElementInterior (Marker1,6)
setElementDimension (Marker1, 0)



for k,v in ipairs (Mark) do
z = v[3] -1
Marker = createMarker ( v[1], v[2], z, "cylinder", 0.9,  255, 255, 0, 255 )
addEventHandler('onClientMarkerHit', Marker,
    function ( hitPlayer )
        if ( hitPlayer == localPlayer ) then
            guiSetVisible (overwindow, true )
            showCursor( true )
        end
    end
)
end


------ped
gunshopped = createPed( 179, 311.955078125 ,-167.763671875 ,999.59375)
setElementRotation ( gunshopped, 0, 0 , 0 )
setElementInterior ( gunshopped, 6 )
setElementFrozen(gunshopped, true)

function cancelPedDamage()
	cancelEvent()
end
addEventHandler("onClientPedDamage", gunshopped, cancelPedDamage)


function gunnpc()
	setTimer ( function()
		setPedAnimation(gunshopped,"GANGS","smkcig_prtl",1,true,false)
		
	end, 1000, 0 )
end
gunnpc()





addEventHandler ("onClientGUIClick", getRootElement(), 
function(button, state, absoluteX, absoluteY)
if ( source == bastan ) then
guiSetVisible ( overwindow , false)
showCursor ( false ) 
elseif ( source ==  btn1 ) then 
triggerServerEvent("satchel",getLocalPlayer()) 
elseif ( source ==  btn2 ) then 
triggerServerEvent("molotov",getLocalPlayer()) 
elseif ( source ==  btn3 ) then 
triggerServerEvent("Grenade",getLocalPlayer()) 
elseif ( source ==  btn4 ) then 
triggerServerEvent("Rockedlauncher",getLocalPlayer()) 
elseif ( source ==  btn5 ) then 
triggerServerEvent("Parachute",getLocalPlayer()) 
end
end)


createBlip ( 2334.1259765625 ,61.271484375 ,14, 18 )