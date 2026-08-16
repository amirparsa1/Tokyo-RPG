---------------------------------
-------**Script By zezaw**-------
---------------------------------
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Markers <--
local BankMarkerVorod = createMarker(1467.146484375 ,-1009.919921875 ,26.84375,  "cylinder", 0.7,0,0,0,0 )
local BankMarkerKhoroj = createMarker(321.642578125 ,160.283203125 ,1095.6328125, "cylinder", 0.7,0,0,0,0 )
 setElementDimension ( BankMarkerKhoroj, 0 )
setElementInterior ( BankMarkerKhoroj, 3)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",BankMarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelEnterBank", hitElement)
	end
end)

--> Bad Az Zadan ro Enter Mokhtasat Set She Dakhel <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	local PlayerMoney = getPlayerMoney(ThePlayer)
	if ( PlayerMoney >= 20) then
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		outputChatBox("#ff0000 - $20", ThePlayer, 255, 255, 255, true)
		takePlayerMoney(ThePlayer,20)
		triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
		setElementPosition (ThePlayer, 321.59765625 ,161.095703125 ,1095.6328125)
		setElementInterior ( ThePlayer, 3 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,359.96978759766, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
	else
		triggerClientEvent ( ThePlayer, "PlayError", ThePlayer)
		outputChatBox("#ff0000✖️ #ffffffBaraye Vorod Niaz Be $20 Darid!", ThePlayer, 255, 255, 255, true)
	end
end
addEvent("BoroToBank",true)
addEventHandler("BoroToBank", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",BankMarkerKhoroj,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelExitBank", hitElement)
	end
end)

--> Bad Az Zadan ro Exit Mokhtasat Set She Biron <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 1467.146484375 ,-1009.919921875 ,26.84375)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,360.208984375, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironBank",true)
addEventHandler("BiaBironBank", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 1467.146484375 ,-1009.919921875 ,26.84375, 3, 1318, 0)
	PickupKhoroj = createPickup ( 321.642578125 ,160.283203125 ,1095.6328125, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 3)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)