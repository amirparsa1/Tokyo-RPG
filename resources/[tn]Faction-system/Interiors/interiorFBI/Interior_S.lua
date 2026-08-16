local accSys = exports["Accounts-system"]
local miscSys = exports["misc"]




--> Markers <--
local FBiMarkerVorod = createMarker(327.67578125 ,-1512.1103515625 ,36.032508850098, "cylinder", 0.7,0,0,0,0 )
local FBiMarkerKhoroj = createMarker(246.4642578125 ,107.2998046875 ,1003.21875, "cylinder", 0.7,0,0,0,0 )
setElementDimension ( FBiMarkerKhoroj, 4527 )
setElementInterior ( FBiMarkerKhoroj, 10)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbi", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbi", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbi", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye FBi Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
		setElementPosition (ThePlayer, 246.3583984375 ,108.0771484375 ,1003.21875)
		setElementInterior ( ThePlayer, 10 )
		setElementDimension ( ThePlayer, 4527 )
		setElementRotation( ThePlayer, 0 ,0 ,359, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroToFbi",true)
addEventHandler("BoroToFbi", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if getElementDimension(hitElement) == 4527 then
		triggerClientEvent ( hitElement, "BiadPanelExitFbi", hitElement)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 328.3203125 ,-1512.607421875 ,36.0390625)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,232, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironFbi",true)
addEventHandler("BiaBironFbi", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 327.67578125 ,-1512.05 ,36.032508850098, 3, 1318, 0)
	PickupKhoroj = createPickup ( 246.4642578125 ,107.2998046875 ,1003.21875, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 10)
	setElementInterior(PickupKhoroj, 4527)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)















--> Panele Poshte Bom (H) <--

--> Markers <--
local FBiMarkerVorodH = createMarker(315.14890625 ,-1515.55609375 ,24.921875, "cylinder", 0.7,0,0,0,0 )
local FBiMarkerKhorojH = createMarker(349.5 ,-1485.7203125 ,76.5390625, "cylinder", 0.7,0,0,0,0 )
setElementDimension ( FBiMarkerKhorojH, 0 )
setElementInterior ( FBiMarkerKhorojH, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerVorodH,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbiH", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbiH", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterFbiH", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye FBi Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
		setElementPosition (ThePlayer, 348.4912109375 ,-1486.2275390625 ,76.5390625)
		setElementInterior ( ThePlayer, 0 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,121, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroToFbiH",true)
addEventHandler("BoroToFbiH", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",FBiMarkerKhorojH,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitFbiH", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitFbiH", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitFbiH", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye FBi  Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	triggerClientEvent("DoorSound", ThePlayer, ThePlayer)
	setElementPosition (ThePlayer, 314.3505859375 ,-1515.01953125 ,24.921875)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,55, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironFbiH",true)
addEventHandler("BiaBironFbiH", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 315.14890625 ,-1515.55609375 ,24.921875, 3, 1318, 0)
	PickupKhoroj = createPickup ( 349.5 ,-1485.7203125 ,76.5390625, 3, 1318, 0)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)