--[[local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]


------------------------------------ Albania -------------------------------------------


--> Markers <--
local m1MarkerVorod = createMarker(2336.572265625 ,-1789.6875 ,13.546875, "cylinder", 0.7,0,0,0,0 )
local m1MarkerKhoroj = createMarker(1700.732421875 ,-1668.0361328125 ,20.21875, "cylinder", 0.7,0,0,0,0 )
setElementInterior ( m1MarkerKhoroj, 18)
setElementDimension(m1MarkerKhoroj, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m1MarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 10  then
			triggerClientEvent ( hitElement, "BiadPanelEnterm1", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		setElementPosition (ThePlayer, 1701.615234375 ,-1668.015625 ,20.21875)
		setElementInterior ( ThePlayer, 18 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,277.14, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroTom1",true)
addEventHandler("BoroTom1", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m1MarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitm1", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 10  then
			triggerClientEvent ( hitElement, "BiadPanelExitm1", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	setElementPosition (ThePlayer, 2336.572265625 ,-1789.6875 ,13.546875)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,178.53, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironm1",true)
addEventHandler("BiaBironm1", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 2336.572265625 ,-1789.6875 ,13.546875, 3, 1318, 0)
	PickupKhoroj = createPickup ( 1700.732421875 ,-1668.0361328125 ,20.21875, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 18)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)









------------------------------------ Avengers -------------------------------------------


--> Markers <--
local m2MarkerVorod = createMarker(987.498046875 ,-1624.5205078125 ,14.9296875, "cylinder", 0.7,0,0,0,0 )
local m2MarkerKhoroj = createMarker(965.33203125 ,-53.208984375 ,1001.1245727539, "cylinder", 0.7,0,0,0,0 )
setElementInterior ( m2MarkerKhoroj, 3)
setElementDimension(m2MarkerKhoroj, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m2MarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 11  then
			triggerClientEvent ( hitElement, "BiadPanelEnterm2", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		setElementPosition (ThePlayer, 964.32421875 ,-53.1826171875 ,1001.1245727539)
		setElementInterior ( ThePlayer, 3 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,92.14, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroTom2",true)
addEventHandler("BoroTom2", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m2MarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitm2", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 11  then
			triggerClientEvent ( hitElement, "BiadPanelExitm2", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	setElementPosition (ThePlayer, 987.498046875 ,-1624.5205078125 ,14.9296875)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,220.53, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironm2",true)
addEventHandler("BiaBironm2", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 987.498046875 ,-1624.5205078125 ,14.9296875, 3, 1318, 0)
	PickupKhoroj = createPickup ( 965.33203125 ,-53.208984375 ,1001.1245727539, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 3)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)












------------------------------------ Bloods -------------------------------------------


--> Markers <--
local m3MarkerVorod = createMarker(1122.7080078125 ,-2037.0146484375 ,69.894248962402, "cylinder", 0.7,0,0,0,0 )
local m3MarkerKhoroj = createMarker(141.71817016602 ,-106.53926086426 ,1218.5999755859, "cylinder", 0.7,0,0,0,0 )
setElementInterior ( m3MarkerKhoroj, 3)
setElementDimension(m3MarkerKhoroj, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m3MarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 12  then
			triggerClientEvent ( hitElement, "BiadPanelEnterm3", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang  Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		setElementPosition (ThePlayer, 141.69863891602 ,-105.62226867676 ,1218.5999755859)
		setElementInterior ( ThePlayer, 3 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,0.78, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroTom3",true)
addEventHandler("BoroTom3", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m3MarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitm3", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 12  then
			triggerClientEvent ( hitElement, "BiadPanelExitm3", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	setElementPosition (ThePlayer, 1124.271484375 ,-2037.0458984375 ,69.884635925293)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,269.53, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironm3",true)
addEventHandler("BiaBironm3", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 1122.7080078125 ,-2037.0146484375 ,69.894248962402, 3, 1318, 0)
	PickupKhoroj = createPickup ( 141.71817016602 ,-106.53926086426 ,1218.5999755859, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 3)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)


























------------------------------------ Virus -------------------------------------------


--> Markers <--
local m5MarkerVorod = createMarker(2745.544921875 ,-2089.4404296875 ,12.445066452026, "cylinder", 0.7,0,0,0,0 )
local m5MarkerKhoroj = createMarker(83.246101379395 ,-65.1376953125 ,1047.3000488281, "cylinder", 0.7,0,0,0,0 )
setElementInterior ( m5MarkerKhoroj, 6)
setElementDimension(m5MarkerKhoroj, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m5MarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 14  then
			triggerClientEvent ( hitElement, "BiadPanelEnterm5", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		setElementPosition (ThePlayer, 83.256843566895 ,-64.1318359375 ,1047.3000488281)
		setElementInterior ( ThePlayer, 6 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,359, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroTom5",true)
addEventHandler("BoroTom5", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m5MarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitm5", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 14  then
			triggerClientEvent ( hitElement, "BiadPanelExitm5", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	setElementPosition (ThePlayer, 2745.4287109375 ,-2089.51953125 ,12.445066452026)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,274, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironm5",true)
addEventHandler("BiaBironm5", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 2745.4287109375 ,-2089.51953125 ,12.445066452026, 3, 1318, 0)
	PickupKhoroj = createPickup ( 83.246101379395 ,-65.1376953125 ,1047.3000488281, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 6)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)























------------------------------------ Yakuza -------------------------------------------


--> Markers <--
local m6MarkerVorod = createMarker(738.56640625 ,-1261.5205078125 ,13.557945251465, "cylinder", 0.7,0,0,0,0 )
local m6MarkerKhoroj = createMarker(2519.1396484375 ,-1674.8560791016 ,1019.9879760742, "cylinder", 0.7,0,0,0,0 )
setElementInterior ( m6MarkerKhoroj, 3)
setElementDimension(m6MarkerKhoroj, 0)


---------^^^^^^---------||||--------***   Vorod   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m6MarkerVorod,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelEnterm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 15  then
			triggerClientEvent ( hitElement, "BiadPanelEnterm6", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end
end)

-- Bad Az Zadan ro Enter Mokhtasat Set She Dakhel --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
		local  posX, posY, posZ = getElementPosition(ThePlayer)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocX", posX)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocY", posY)
		setElementData(accSys:getPlayerAcc(ThePlayer), "pLocZ", posZ)
		setElementPosition (ThePlayer, 2519.0634765625 ,-1675.7965087891 ,1019.9879760742)
		setElementInterior ( ThePlayer, 3 )
		setElementDimension ( ThePlayer, 0 )
		setElementRotation( ThePlayer, 0 ,0 ,175, "default", true)
		fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BoroTom6",true)
addEventHandler("BoroTom6", root, FullSend)


---------^^^^^^---------||||--------***  Khoroj   ***-----||||||---------------^^^^^^--------

-- Omad To Marker Panel biad --
addEventHandler("onMarkerHit",m6MarkerKhoroj,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 1  then
		triggerClientEvent ( hitElement, "BiadPanelExitm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 2  then
		triggerClientEvent ( hitElement, "BiadPanelExitm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 3  then
		triggerClientEvent ( hitElement, "BiadPanelExitm6", hitElement)
		elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 15  then
			triggerClientEvent ( hitElement, "BiadPanelExitm6", hitElement)
		else
		outputChatBox("#ff0000✖️ #ffffffIn Dar Baraye Azaye Gang Mibashad!", hitElement, 255, 255, 255, true)
		end
	end

end)


-- Bad Az Zadan ro Exit Mokhtasat Set She Biron --
function FullSend ( ThePlayer, X, Y, Z, RotX, RotY, RotZ, Int, Dim)
	setElementPosition (ThePlayer, 738.56640625 ,-1261.5205078125 ,13.557945251465)
	setElementInterior ( ThePlayer, 0 )
	setElementDimension ( ThePlayer, 0 )
	setElementRotation( ThePlayer, 0 ,0 ,273, "default", true)
	fadeCamera ( ThePlayer, true, 1 )
end
addEvent("BiaBironm6",true)
addEventHandler("BiaBironm6", root, FullSend)

--> Pickups <--
function createDeathPickup ()
    PickupVorod = createPickup ( 738.56640625 ,-1261.5205078125 ,13.557945251465, 3, 1318, 0)
	PickupKhoroj = createPickup ( 2519.1396484375 ,-1674.8560791016 ,1019.9879760742, 3, 1318, 0)
	setElementInterior(PickupKhoroj, 3)
	setElementDimension(PickupKhoroj, 0)
end
createDeathPickup()

--> Bade Kill Panel Baste She <--
addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
triggerClientEvent("BasteSheBadeKill", source)
end)







]]