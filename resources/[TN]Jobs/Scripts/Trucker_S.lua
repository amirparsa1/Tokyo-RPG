local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever
local rootElement = getRootElement()
local TruckerMarker = {}
local TruckerBlip = {}

local TruckerJobMarkerLs = createPickup(-76.8173828125 ,-1136.7080078125 ,1.078125 , 3,  1314, 0)
local TruckerJobMarkerLv = createPickup(1134.30078125 ,2040.8857421875 ,10.8203125 , 3,  1314, 0)
local TruckerJobMarkerSf = createPickup(-2039.9143066406 ,-2555.9260253906 ,31.049619674683 , 3,  1314, 0)
local TruckerLocations = {
	{-299.46875 ,-1401.861328125 ,13.2056016922},
	{-281.9619140625 ,-2187.466796875 ,28.690883636475},
	{-25.771484375 ,-2509.0712890625 ,36.6484375},
	{-1593.115234375 ,-2722.791015625 ,48.5390625},
	{-2257.544921875 ,-2552.919921875 ,31.907625198364},
	{-2101.0302734375 ,-2241.3125 ,30.625},
	{-577.5205078125 ,-1067.287109375 ,23.470083236694},
	{-417.7841796875 ,-1738.4599609375 ,7.8917818069458},
	{-1737.341796875 ,-130.529296875 ,3.5546875},
	{-1084.29296875 ,-1645.181640625 ,76.3671875},
	{-1898.53515625 ,-1722.7890625 ,21.75},
	{-1201.798828125 ,1820.90234375 ,41.71875},
	{-93.1923828125 ,1346.427734375 ,10.400615692139},
	{-332.1806640625 ,1836.3203125 ,42.2890625},
	{-1655.57421875 ,-2241.623046875 ,31.69751739502},
	{717.8876953125 ,-666.970703125 ,16.11625289917},
	{1076.572265625 ,-316.03125 ,73.9921875},
	{2773.3193359375 ,1348.5078125 ,10.688504219055},
	{2322.974609375 ,613.4794921875 ,10.8203125},
	{1703.8759765625 ,2351.40625 ,10.8203125},
	{1890.126953125 ,702.9248046875 ,10.8203125},
	{2467.2333984375 ,-2551.0048828125 ,13.65266418457},
	{1553.6611328125 ,53.240234375 ,25.378852844238},
	{1218.7314453125 ,300.8037109375 ,19.5546875},
	{1458.19140625 ,2825.9091796875 ,10.824650764465},
	{2787.3125 ,1977.41015625 ,10.8203125},
	{1581.171875 ,2199.73046875 ,10.8203125},
	{1309.505859375 ,2246.5224609375 ,10.8203125},
	{-1808.609375 ,2046.2314453125 ,9.0342893600464},
	{-2275.2490234375 ,2400.078125 ,4.9345946311951},
}

function GetTruckerJob(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 4 then

			triggerClientEvent("ShowTruckerPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end
addEventHandler("onPickupHit",TruckerJobMarkerLs,GetTruckerJob)
addEventHandler("onPickupHit",TruckerJobMarkerLv,GetTruckerJob)
addEventHandler("onPickupHit",TruckerJobMarkerSf,GetTruckerJob)
local randomposbar ={
	[1] = {-51.970703125 ,-1134.4921875 ,   2,0,0,65},
	[2] = {-53.173828125 ,-1141.5107421875 ,2,0,0,65},
	[3] = {-46.9755859375 ,-1150.8955078125,2,0,0,65},
	
}
local randompos = {
	[1] = {-78.8916015625 ,-1110.830078125 , 2,0,0,161},
	[2] = {-70.8388671875 ,-1110.830078125 , 2,0,0,161},
	[3] = {-67.2470703125  ,-1110.830078125 ,2,0,0,161},
}
local bar = {}
local mashin = {}
addEvent("GiveTruckerJob",true)
addEventHandler("GiveTruckerJob", root,
function (thePlayer)
	fadeCamera( thePlayer, false,0.5)
	setTimer(function()
		local c = math.random(1,3)
		local pname = getPlayerName(thePlayer)
		mashin[thePlayer] = createVehicle( 515, randompos[c][1], randompos[c][2], randompos[c][3], randompos[c][4], randompos[c][5], randompos[c][6] )
		bar[mashin[thePlayer]] = createVehicle( 584, randomposbar[c][1], randomposbar[c][2], randomposbar[c][3], randomposbar[c][4], randomposbar[c][5], randomposbar[c][6] )
		setVehicleDamageProof(bar[mashin[thePlayer]], true)
		setElementID( mashin[thePlayer], "Trucker["..pname.."]" )
		setElementData( mashin[thePlayer], "owner", "Trucker" )
		warpPedIntoVehicle(thePlayer,mashin[thePlayer],0)
		setElementInterior(thePlayer,0)
		fadeCamera(thePlayer, true,0.5)
	end,1000,1)
	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 4)
	outputChatBox("#00ff00[Trucker]: #ffffffTabrik, Shoma Trucker Shodid!", thePlayer, 255, 255, 0,true)
end)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got "..tostring(vehicle).."]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if getElementData(source,"owner") == "Trucker" then
		if vehid == "Trucker["..getPlayerName(thePlayer).."]" then
			if seat == 0 then
				if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 4 then
					cancelEvent()
					outputChatBox ( "#ff0000Error: Shoma Trucker Nistid!", thePlayer, 230,0,0 ,true)
				end
			end
		else
			cancelEvent()
			outputChatBox ("#ff0000Error: In Mashin Motalegh Be "..vehid.." Mi Bashad Va Shoma Hagh Estefade Az Anra Nadarid!.", thePlayer, 230,0,0 ,true)
		end
	end
end)

addEventHandler("onVehicleEnter",getRootElement(),
function( thePlayer, seat, jacked )
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"LvTruck")) == "number") or (type(string.find(vehid,"SfTruck")) == "number") or (type(string.find(vehid,"LsTruck")) == "number") then
		if seat == 0 then
			outputChatBox("#00ff00[Trucker]: #ffffffShoma Savar Truck Shodid, Ebteda Yek Bar Be Truck Vasl Konid!", thePlayer, 255, 255, 0,true)
		end
	end
end)

addEventHandler("onTrailerAttach", getRootElement(),
function (theTruck)
	local thePlayer = getVehicleController ( theTruck )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) == 4 then
		local vehid = getElementID ( theTruck )
		if getElementData(theTruck,"owner") == "Trucker" then
			if vehid == "Trucker["..getPlayerName(thePlayer).."]" then
				local TrailerModel = getElementModel ( source )
				if TrailerModel == 584 or TrailerModel == 608  or TrailerModel == 435 or TrailerModel == 450 or TrailerModel == 591 then
					if not TruckerMarker[thePlayer] then
						local Shansi = math.random( #TruckerLocations )
						outputChatBox("#00ff00[Trucker]: #ffffffBar Vasl Shod! Bar Ra Be Maghsad Beresanid!", thePlayer, 255, 255, 0,true)
						TruckerMarker[thePlayer] = createMarker( TruckerLocations[Shansi][1] , TruckerLocations[Shansi][2] , TruckerLocations[Shansi][3] ,"checkpoint",3,35, 119, 255,200, thePlayer)
						TruckerBlip[thePlayer] = createBlipAttachedTo(TruckerMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
					end
				end
			end
		end
	end
end)

addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 4 and isPedInVehicle(hitElement))  then
		if TruckerMarker[hitElement] and TruckerMarker[hitElement] == source then
			local vehicle = getPedOccupiedVehicle(hitElement)
			local trailer = getVehicleTowedByVehicle ( vehicle )
			if trailer then
				--detachTrailerFromVehicle ( vehicle )
				local randomMoneyFortrucker = 0
				if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 50 then--skill 1
					randomMoneyFortrucker = math.random(60000,150000)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 100 then--skill 2
					randomMoneyFortrucker = math.random(150000,170000)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 200 then--skill 3
					randomMoneyFortrucker = math.random(170000,190000)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 300 then--skill 4
					randomMoneyFortrucker = math.random(190000,200000)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) > 300 then--skill 5
					randomMoneyFortrucker = math.random(200000,210000)
				end
				local skilleshtrucker = getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")
				local skillebaditrucker = tonumber(skilleshtrucker) + 1
				setElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill",skillebaditrucker)
				outputChatBox("#00ff00[Trucker]: #ffffffShoma Ba Movafaghiat Bar Ro Tahvil Dadid!", hitElement, 255, 255, 0,true)
				if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 50 then--skill 1
					outputChatBox("#00ff00[Trucker]: #ffffffDastmozd : "..randomMoneyFortrucker.."#00ff00$ #ffae00(Skill 1 | " ..skillebaditrucker.." / 50)", hitElement, 255, 255, 0,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 100 then--skill 2
					outputChatBox("#00ff00[Trucker]: #ffffffDastmozd : "..randomMoneyFortrucker.."#00ff00$ #ffae00(Skill 2 | " ..skillebaditrucker.." / 100)", hitElement, 255, 255, 0,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 200 then--skill 3
					outputChatBox("#00ff00[Trucker]: #ffffffDastmozd : "..randomMoneyFortrucker.."#00ff00$ #ffae00(Skill 3 | " ..skillebaditrucker.." / 150)", hitElement, 255, 255, 0,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) <= 300 then--skill 4
					outputChatBox("#00ff00[Trucker]: #ffffffDastmozd : "..randomMoneyFortrucker.."#00ff00$ #ffae00(Skill 4 | " ..skillebaditrucker.." / 200)", hitElement, 255, 255, 0,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pTruckerSkill")) > 300 then--skill 5
					outputChatBox("#00ff00[Trucker]: #ffffffDastmozd : "..randomMoneyFortrucker.."#00ff00$ #ffae00(Skill 5 | " ..skillebaditrucker.." / Max)", hitElement, 255, 255, 0,true)
				end
				givePlayerMoney(hitElement, randomMoneyFortrucker)
				respawnVehicle( trailer )
				matchpay = math.random(90000,250000)
				givePlayerMoney (hitElement , tonumber(matchpay))
				outputChatBox("#00ff00 +"..matchpay.."Toman", hitElement, 255, 255, 0,true)
				if TruckerMarker[hitElement] then
					destroyElement(TruckerMarker[hitElement])
					destroyElement(TruckerBlip[hitElement])
					TruckerMarker[hitElement] = nil
					TruckerBlip[hitElement] = nil
				end
			else
				outputChatBox("#ff0000[Trucker]: #ffffffBaret Kojas Pa?! Maskhare Kardi?!", hitElement, 255, 255, 0,true)
			end
		end
	end
end)

addEventHandler("onVehicleStartExit", rootElement,
function (thePlayer, seat, jacked)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) == 4 then
		local vehid = getElementID ( source )
		if getElementData(source,"owner") == "Trucker" then
			if vehid == "Trucker["..getPlayerName(thePlayer).."]" then
				local vehicle = getPedOccupiedVehicle(thePlayer)

				destroyElement(source)
				destroyElement(bar[source])
				TruckerMarker[thePlayer] = nil
				TruckerBlip[thePlayer] = nil
				outputChatBox("#ffff00[Trucker]: #ffffffShoma Az Truck Piade Shodid Va Kare Shoma Be Payan Resid!", thePlayer, 255, 255, 0,true)
			end
		end
	end
end)

addEventHandler( "onPlayerWasted", getRootElement(),function()
	

	if tonumber(getElementData(accSys:getPlayerAcc(source), "pJob")) == 4 then
		local vehicle = mashin[source]
		local vehid = getElementID ( vehicle )

		if getElementData(vehicle,"owner") == "Trucker" then
			if vehid == "Trucker["..getPlayerName(source).."]" then
				destroyElement( TruckerBlip[source] )
				destroyElement(vehicle)
				destroyElement(bar[vehicle])
				TruckerMarker[source] = nil
				TruckerBlip[source] = nil
				outputChatBox("#ffff00[Trucker]: #ffffffShoma Koshte Shodid Va Kare Shoma Be Payan Resid!.", source, 255, 255, 0,true)
			end
		end
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(),
function()
	if mashin[source] then

		destroyElement( mashin[source] )
		destroyElement(bar[mashin[source]])
		destroyElement( TruckerBlip[source] )
		TruckerMarker[source] = nil
		TruckerBlip[source] = nil
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pJob")) == 4 then
		local vehicle = mashin[source]
		local vehid = getElementID ( vehicle )
		if getElementData(vehicle,"owner") == "Trucker" then
			if vehid == "Trucker["..getPlayerName(source).."]" then
				local thePlayer = getVehicleController( source )
				if thePlayer then
					if TruckerMarker[thePlayer] then
						destroyElement( TruckerMarker[thePlayer] )
						destroyElement( TruckerBlip[thePlayer] )
						TruckerMarker[thePlayer] = nil
						TruckerBlip[thePlayer] = nil
						outputChatBox("#ffff00[Trucker]: #ffffffTruck Shoma Terekid Va Kare Shoma Be Etmam Resid!", thePlayer, 255, 255, 255, true)
					end
				end
			end
		end

	end
end)
