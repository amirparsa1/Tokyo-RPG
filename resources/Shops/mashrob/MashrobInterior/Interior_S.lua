
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Markers <--
local MashrobMarkerVorod = createMarker(2310.130859375 ,-1643.5791015625 ,14.8203125,  "cylinder", 0.7,0,0,0,0 )
local MashrobMarkerKhoroj = createMarker(501.916015625 ,-67.5673828125 ,998.7578125, "cylinder", 0.7,0,0,0,0 )
 setElementDimension ( MashrobMarkerKhoroj, 0 )
setElementInterior ( MashrobMarkerKhoroj, 11)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",MashrobMarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelEnterMashrob", hitElement)
	end
end)

--> Bad Az Zadan ro Enter Mokhtasat Set She Dakhel <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)

	local PlayerMoney = getPlayerMoney(ThePlayer)
	
		if ( PlayerMoney >= 50) then
			local  posX, posY, posZ = getElementPosition(ThePlayer)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
			outputChatBox("#ff0000 - $50", ThePlayer, 255, 255, 255, true)
			triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
			takePlayerMoney(ThePlayer,50)
			setElementPosition (ThePlayer, 501.9140625 ,-68.427734375 ,998.7578125)
			setElementInterior ( ThePlayer, 11 )
			setElementDimension ( ThePlayer, 0 )
			setElementRotation( ThePlayer, 0 ,0 ,182, "default", true)
			fadeCamera ( ThePlayer, true, 1 )
		else
			triggerClientEvent ( ThePlayer, "PlayError", ThePlayer)
			outputChatBox("#ff0000✖️ #ffffffBaraye Vorod Niaz Be $50 Darid!", ThePlayer, 255, 255, 255, true)
		end
	
end
addEvent("BoroToMashrob",true)
addEventHandler("BoroToMashrob", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",MashrobMarkerKhoroj,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelExitMashrob", hitElement)
	end
end)

--> Bad Az Zadan ro Exit Mokhtasat Set She Biron <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 2310.130859375 ,-1643.5791015625 ,14.8203125)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,227.50582885742, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironMashrob",true)
addEventHandler("BiaBironMashrob", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 2310.130859375 ,-1643.5791015625 ,14.8203125, 3, 1318, 0)
	PickupKhoroj = createPickup ( 501.916015625 ,-67.5673828125 ,998.7578125, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 11)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)