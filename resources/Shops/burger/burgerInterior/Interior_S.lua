---------------------------------
-------**Script By ExoPrim**-------
---------------------------------
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Markers <--
local pizzaMarkerVorod = createMarker(1199.28515625 ,-918.1396484375 ,43.223050689697, "cylinder", 0.7,0,0,0,0 )
local pizzaMarkerKhoroj = createMarker(362.9681640625 ,-75.1611328125 ,1001.5078125, "cylinder", 0.7,0,0,0,0 )
 setElementDimension ( pizzaMarkerKhoroj, 0 )
setElementInterior ( pizzaMarkerKhoroj, 10)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",pizzaMarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelEnterburger", hitElement)
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)

	local PlayerMoney = getPlayerMoney(ThePlayer)
	if ( PlayerMoney >= 5) then
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		outputChatBox("#ff0000 - $5", ThePlayer, 255, 255, 255, true)
		triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
		takePlayerMoney(ThePlayer,5)
		setElementPosition (ThePlayer, 363.2373046875 ,-74.8095703125 ,1001.5078125)
		setElementInterior ( ThePlayer, 10 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,317.2268371582, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
	else
		triggerClientEvent ( ThePlayer, "PlayError", ThePlayer)
		outputChatBox("#ff0000✖️ #ffffffBaraye Vorod Niaz Be $5 Darid!", ThePlayer, 255, 255, 255, true)
	end
end
addEvent("BoroToburger",true)
addEventHandler("BoroToburger", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",pizzaMarkerKhoroj,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelExitburger", hitElement)
	end
end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 1199.2578125 ,-918.673828125 ,43.119194030762)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,188.05859375, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironburger",true)
addEventHandler("BiaBironburger", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 1199.28515625 ,-918.1396484375 ,43.223050689697, 3, 1318, 0)
	PickupKhoroj = createPickup ( 362.9681640625 ,-75.1611328125 ,1001.5078125, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 10)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)