local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever
local LsBDJobMarker = createMarker( 2535.30859375 ,-2111.0380859375 ,12.6, "cylinder", 1.0, 0, 221,221,211)
local LsBusMarker = {}
local LsBusMarkerID = {}
local LsBusBlip = {}
local LsBusLocations = {
	{2416.28515625 ,-1949.732421875 ,13.01501083374},
	{2416.255859375 ,-1749.953125 ,13.016503334045},
	{2345.0703125 ,-1673.8173828125 ,12.97901058197},
	{2345.0703125 ,-1398.8935546875 ,23.445066452026},
	{2373.2333984375 ,-1190.1123046875 ,27.056308746338},
	{2247.7353515625 ,-1138.3623046875 ,25.71325302124},
	{1907.8115234375 ,-1018.7978515625 ,35.183200836182},
	{1427.73046875 ,-940.8671875 ,35.743621826172},
	{1186.720703125 ,-936.0419921875 ,42.380447387695},
	{1118.9375 ,-1138.6728515625 ,23.289487838745},
	{1052.4013671875 ,-1378.5048828125 ,13.091742515564},
	{1119.4111328125 ,-1574.7333984375 ,13.022164344788},
	{1294.626953125 ,-1826.71875 ,13.011985778809},
	{1591.6259765625 ,-1875.1259765625 ,13.012057304382},
	{1805.68359375 ,-1834.482421875 ,13.014877319336},
	{1943.609375 ,-1934.6943359375 ,13.014277458191},
	{2160.7724609375 ,-1896.353515625 ,13.00502204895},
	{2311.1298828125 ,-1923.7216796875 ,13.047472953796},
}

addEventHandler("onMarkerHit",LsBDJobMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 then
			triggerClientEvent("ShowBusPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"LsBus")) == "number") then
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
	if (type(string.find(vehid,"LsBus")) == "number") then
		if seat == 0 then
			outputChatBox("#00ff00[Bus-Driver]: #ffffffShoma Savar Bus Shodid Va Job Start Shod , Marker Ha Ra Donbal Konid ...", thePlayer, 255, 255, 0,true)
			LsBusMarkerID[thePlayer] = 1
			LsBusMarker[thePlayer] = createMarker( LsBusLocations[1][1] , LsBusLocations[1][2] , LsBusLocations[1][3] ,"checkpoint",3,255, 255, 0,200, thePlayer)
			LsBusBlip[thePlayer] = createBlipAttachedTo(LsBusMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
		end
	end
end)

addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 1 and isPedInVehicle(hitElement)) then
		if LsBusMarker[hitElement] == source then
			if LsBusMarkerID[hitElement] == 18 then
				destroyElement(source)
				destroyElement(LsBusBlip[hitElement])
				LsBusMarkerID[hitElement] = 1
				LsBusMarker[hitElement] = createMarker( LsBusLocations[1][1] , LsBusLocations[1][2] , LsBusLocations[1][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				LsBusBlip[hitElement] = createBlipAttachedTo(LsBusMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
				local NextBusSkill = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pBusdriverSkill")) + 1
				setElementData(accSys:getPlayerAcc(hitElement), "pBusdriverSkill",NextBusSkill)
				local BusRandomMoney = 0
				if tonumber(NextBusSkill) <= 50 then--skill 1
					BusRandomMoney = math.random(10000,15000)
				elseif tonumber(NextBusSkill) <= 100 then--skill 2
					BusRandomMoney = math.random(10500,23000)
				elseif tonumber(NextBusSkill) <= 200 then--skill 3
					BusRandomMoney = math.random(23000,30000)
				elseif tonumber(NextBusSkill) <= 300 then--skill 4
					BusRandomMoney = math.random(30000,45000)
				elseif tonumber(NextBusSkill) > 300 then--skill 5
					BusRandomMoney = math.random(50000,60000)
				end
				local BusExtraMoney = 0
				
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
				destroyElement(LsBusBlip[hitElement])
				LsBusMarkerID[hitElement] = LsBusMarkerID[hitElement] + 1
				LsBusMarker[hitElement] = createMarker( LsBusLocations[LsBusMarkerID[hitElement]][1] , LsBusLocations[LsBusMarkerID[hitElement]][2] , LsBusLocations[LsBusMarkerID[hitElement]][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				LsBusBlip[hitElement] = createBlipAttachedTo(LsBusMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
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
	if LsBusMarker[thePlayer] then
		destroyElement( LsBusMarker[thePlayer] )
		destroyElement( LsBusBlip[thePlayer] )
		LsBusMarkerID[thePlayer] = nil
		LsBusMarker[thePlayer] = nil
		LsBusBlip[thePlayer] = nil
		setElementFrozen( source ,false)
		outputChatBox("#ffff00[Bus-Driver]: #ffffffShoma Az Bus Piade Shodid Va Kare Shoma Be Payan Resid!", thePlayer, 255, 255, 0,true)
	end
end)

addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	if LsBusMarker[source] then
		destroyElement( LsBusMarker[source] )
		destroyElement( LsBusBlip[source] )
		LsBusMarkerID[source] = nil
		LsBusMarker[source] = nil
		LsBusBlip[source] = nil
		if getPedOccupiedVehicle(source) then
			setElementFrozen( getPedOccupiedVehicle(source) ,false)
		end
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(),
function()
	if LsBusMarker[source] then
		destroyElement( LsBusMarker[source] )
		destroyElement( LsBusBlip[source] )
		LsBusMarkerID[source] = nil
		LsBusMarker[source] = nil
		LsBusBlip[source] = nil
		if getPedOccupiedVehicle(source) then
			setElementFrozen( getPedOccupiedVehicle(source) ,false)
		end
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"LsBus")) == "number") then
		local thePlayer = getVehicleController( source )
		if thePlayer then
			if LsBusMarker[thePlayer] then
				destroyElement( LsBusMarker[thePlayer] )
				destroyElement( LsBusBlip[thePlayer] )
				LsBusMarkerID[thePlayer] = nil
				LsBusMarker[thePlayer] = nil
				LsBusBlip[thePlayer] = nil
				setElementFrozen( source , false)
				outputChatBox("#ffff00[Bus-Driver]: #ffffffBuse Shoma Terekid Va Kare Shoma Be Etmam Resid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)