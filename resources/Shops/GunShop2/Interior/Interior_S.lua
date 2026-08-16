
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Markers <--
local OverMarkerVorod = createMarker(2333.1305859375 ,61.623 ,26.60578956604,  "cylinder", 0.7,0,0,0,0 )
local OverMarkerKhoroj = createMarker(316.4130859375 ,-170.185546875 ,999.59375, "cylinder", 0.7,0,0,0,0 )
 setElementDimension ( OverMarkerKhoroj, 0 )
setElementInterior ( OverMarkerKhoroj, 6)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",OverMarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelEnterOver", hitElement)
	end
end)

--> Bad Az Zadan ro Enter Mokhtasat Set She Dakhel <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)

	local PlayerMoney = getPlayerMoney(ThePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(ThePlayer), "pGoldPremium")) >= 1 then
		if ( PlayerMoney >= 2500) then
			local  posX, posY, posZ = getElementPosition(ThePlayer)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
			setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
			outputChatBox("#ff0000 - $2500", ThePlayer, 255, 255, 255, true)
			triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
			takePlayerMoney(ThePlayer,2500)
			setElementPosition (ThePlayer, 316.4228515625 ,-169.4658203125 ,999.60101318359)
			setElementInterior ( ThePlayer, 6 )
			setElementDimension ( ThePlayer, 0 )
			setElementRotation( ThePlayer, 0 ,0 ,357.28909301758, "default", true)
			fadeCamera ( ThePlayer, true, 1 )
		else
			triggerClientEvent ( ThePlayer, "PlayError", ThePlayer)
			outputChatBox("#ff0000✖️ #ffffffBaraye Vorod Niaz Be $2500 Darid!", ThePlayer, 255, 255, 255, true)
		end
	else
	triggerClientEvent ( ThePlayer, "PlayError", ThePlayer)
	outputChatBox("#ff0000✖️ #ffffffBaraye Vorod Bayad Gold Premium Bashid!", ThePlayer, 255, 255, 255, true)
	end
end
addEvent("BoroToOver",true)
addEventHandler("BoroToOver", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

--> Omad To Marker Panel biad <--
addEventHandler("onMarkerHit",OverMarkerKhoroj,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent ( hitElement, "BiadPanelExitOver", hitElement)
	end
end)

--> Bad Az Zadan ro Exit Mokhtasat Set She Biron <--
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 2333.7880859375 ,61.638671875 ,26.70578956604)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,274.50582885742, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironOver",true)
addEventHandler("BiaBironOver", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 2333.1305859375 ,61.623 ,26.850, 3, 1318, 0)
	PickupKhoroj = createPickup ( 316.4130859375 ,-170.185546875 ,999.59375, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 6)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)