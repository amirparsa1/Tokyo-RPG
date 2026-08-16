local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever
local SfBDJobMarker = createMarker( -2589.4091796875 ,676.2529296875 ,27.8125, "cylinder", 1.0, 0, 221,221,211)
local SfBusMarker = {}
local SfBusMarkerID = {}
local SfBusBlip = {}
local SfBusLocations = {
	{-2567.74609375 ,705.9716796875 ,25.8125},
	{-2406.2529296875 ,706.0068359375 ,33.015625},
	{-2381.5947265625 ,520.6220703125 ,26.033180236816},
	{-2320.755859375 ,427.126953125 ,32.907096862793},
	{-2256.0986328125 ,341.16015625 ,31.856899261475},
	{-2254.8740234375 ,215.4794921875 ,33.171875},
	{-2257.384765625 ,63.341796875 ,33.171875},
	{-2260.4091796875 ,-55.6279296875 ,33.171875},
	{-2321.744140625 ,-68.0283203125 ,33.1640625},
	{-2407.880859375 ,-67.8037109375 ,33.1640625},
	{-2616.7392578125 ,-67.9873046875 ,2.1872425079346},
	{-2693.7958984375 ,-67.767578125 ,2.1796875},
	{-2704.0537109375 ,15.845703125 ,2.1839237213135},
	{-2704.1083984375 ,95.1220703125 ,2.1796875},
	{-2704.306640625 ,186.021484375 ,2.1796875},
	{-2704.193359375 ,262.6884765625 ,2.1796875},
	{-2704.162109375 ,322.716796875 ,2.1908626556396},
	{-2704.3515625 ,444.3408203125 ,2.1874809265137},
	{-2748.568359375 ,632.796875 ,25.765625},
	{-2730.8388671875 ,705.9140625 ,39.119094848633},
}

addEventHandler("onMarkerHit",SfBDJobMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 then
			triggerClientEvent("ShowBusPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)

addEvent("GiveBusJob",true)
addEventHandler("GiveBusJob", root,
function (thePlayer)
	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 1)
	outputChatBox("#00ff00[Bus-Driver]: #ffffffTabrik, Shoma Darhal Hazer Bus-Driver Hastid!", thePlayer, 255, 255, 0,true)
end)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"SfBus")) == "number") then
		if seat == 0 then
			if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 1 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Shoma Bus Driver Nistid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)

addEventHandler("onVehicleEnter", getRootElement(),
function( thePlayer, seat, jacked )
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"SfBus")) == "number") then
		if seat == 0 then
			outputChatBox("#00ff00[Bus-Driver]: #ffffffShoma Savar Bus Shodid Va Job Start Shod , Marker Ha Ra Donbal Konid ...", thePlayer, 255, 255, 0,true)
			SfBusMarkerID[thePlayer] = 1
			SfBusMarker[thePlayer] = createMarker( SfBusLocations[1][1] , SfBusLocations[1][2] , SfBusLocations[1][3] ,"checkpoint",3,255, 255, 0,200, thePlayer)
			SfBusBlip[thePlayer] = createBlipAttachedTo(SfBusMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
		end
	end
end)

addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 1 and isPedInVehicle(hitElement)) then
		if SfBusMarker[hitElement] == source then
			if SfBusMarkerID[hitElement] == 20 then
				destroyElement(source)
				destroyElement(SfBusBlip[hitElement])
				SfBusMarkerID[hitElement] = 1
				SfBusMarker[hitElement] = createMarker( SfBusLocations[1][1] , SfBusLocations[1][2] , SfBusLocations[1][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				SfBusBlip[hitElement] = createBlipAttachedTo(SfBusMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
				local NextBusSkill = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pBusdriverSkill")) + 1
				setElementData(accSys:getPlayerAcc(hitElement), "pBusdriverSkill",NextBusSkill)
				local BusRandomMoney = 0
				if tonumber(NextBusSkill) <= 50 then--skill 1
					BusRandomMoney = math.random(1000,1500)
				elseif tonumber(NextBusSkill) <= 100 then--skill 2
					BusRandomMoney = math.random(1500,2300)
				elseif tonumber(NextBusSkill) <= 200 then--skill 3
					BusRandomMoney = math.random(2300,3000)
				elseif tonumber(NextBusSkill) <= 300 then--skill 4
					BusRandomMoney = math.random(3000,4500)
				elseif tonumber(NextBusSkill) > 300 then--skill 5
					BusRandomMoney = math.random(5000,6000)
				end
				local BusExtraMoney = 0
				if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pVip")) > 0 then
					BusExtraMoney = math.floor( (tonumber(BusRandomMoney) / 100) * 10 )
				end
				if tonumber(NextBusSkill) <= 50 then--skill 1
					outputChatBox("#00ff00[Bus-Driver]: #ffffffDastmozd : "..BusRandomMoney.."#00ff00$ #ffffff+ "..BusExtraMoney.."#00ff00$ #ffae00(Skill 1 | " ..NextBusSkill.." / 50)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextBusSkill) <= 100 then--skill 2
					outputChatBox("#00ff00[Bus-Driver]: #ffffffDastmozd : "..BusRandomMoney.."#00ff00$ #ffffff+ "..BusExtraMoney.."#00ff00$ #ffae00(Skill 2 | " ..NextBusSkill.." / 100)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextBusSkill) <= 200 then--skill 3
					outputChatBox("#00ff00[Bus-Driver]: #ffffffDastmozd : "..BusRandomMoney.."#00ff00$ #ffffff+ "..BusExtraMoney.."#00ff00$ #ffae00(Skill 3 | " ..NextBusSkill.." / 200)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextBusSkill) <= 300 then--skill 4
					outputChatBox("#00ff00[Bus-Driver]: #ffffffDastmozd : "..BusRandomMoney.."#00ff00$ #ffffff+ "..BusExtraMoney.."#00ff00$ #ffae00(Skill 4 | " ..NextBusSkill.." / 300)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextBusSkill) > 300 then--skill 5
					outputChatBox("#00ff00[Bus-Driver]: #ffffffDastmozd : "..BusRandomMoney.."#00ff00$ #ffffff+ "..BusExtraMoney.."#00ff00$ #ffae00(Skill 5 | " ..NextBusSkill.." / Max)", hitElement, 255, 255, 0,true)
				end
				givePlayerMoney( hitElement, BusRandomMoney+BusExtraMoney )
			else
				destroyElement(source)
				destroyElement(SfBusBlip[hitElement])
				SfBusMarkerID[hitElement] = SfBusMarkerID[hitElement] + 1
				SfBusMarker[hitElement] = createMarker( SfBusLocations[SfBusMarkerID[hitElement]][1] , SfBusLocations[SfBusMarkerID[hitElement]][2] , SfBusLocations[SfBusMarkerID[hitElement]][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				SfBusBlip[hitElement] = createBlipAttachedTo(SfBusMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
			end
			exports["notf"]:addNotification(hitElement, "Sabr Kon Ta Mosafera Savar Shan ..." , 'info')
			setElementFrozen( getPedOccupiedVehicle(hitElement) ,true)
			setTimer(function()
				if hitElement then
					setElementFrozen( getPedOccupiedVehicle(hitElement) ,false)
				end
			end, 2000, 1)
		end
	end
end)

addEventHandler("onVehicleStartExit", getRootElement(),
function (thePlayer, seat, jacked)
	if SfBusMarker[thePlayer] then
		destroyElement( SfBusMarker[thePlayer] )
		destroyElement( SfBusBlip[thePlayer] )
		SfBusMarkerID[thePlayer] = nil
		SfBusMarker[thePlayer] = nil
		SfBusBlip[thePlayer] = nil
		setElementFrozen( source ,false)
		outputChatBox("#ffff00[Bus-Driver]: #ffffffShoma Az Bus Piade Shodid Va Kare Shoma Be Payan Resid!", thePlayer, 255, 255, 0,true)
	end
end)

addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	if SfBusMarker[source] then
		destroyElement( SfBusMarker[source] )
		destroyElement( SfBusBlip[source] )
		SfBusMarkerID[source] = nil
		SfBusMarker[source] = nil
		SfBusBlip[source] = nil
		if getPedOccupiedVehicle(source) then
			setElementFrozen( getPedOccupiedVehicle(source) ,false)
		end
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(),
function()
	if SfBusMarker[source] then
		destroyElement( SfBusMarker[source] )
		destroyElement( SfBusBlip[source] )
		SfBusMarkerID[source] = nil
		SfBusMarker[source] = nil
		SfBusBlip[source] = nil
		if getPedOccupiedVehicle(source) then
			setElementFrozen( getPedOccupiedVehicle(source) ,false)
		end
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"SfBus")) == "number") then
		local thePlayer = getVehicleController( source )
		if thePlayer then
			if SfBusMarker[thePlayer] then
				destroyElement( SfBusMarker[thePlayer] )
				destroyElement( SfBusBlip[thePlayer] )
				SfBusMarkerID[thePlayer] = nil
				SfBusMarker[thePlayer] = nil
				SfBusBlip[thePlayer] = nil
				setElementFrozen( source , false)
				outputChatBox("#ffff00[Bus-Driver]: #ffffffBuse Shoma Terekid Va Kare Shoma Be Etmam Resid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)