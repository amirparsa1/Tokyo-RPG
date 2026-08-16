local accSys = exports["Accounts-System"] -- Code By ExMmD | FearZone For Ever
local rootElement = getRootElement()
local SfPilotJobMarker = createMarker( -1831.9375 ,59.5634765625 ,1055.2204589844, "cylinder", 1.0, 0, 221,221,211)
setElementInterior(SfPilotJobMarker, 14)
local SfPilotMarker = {}
local SfPilotMarkerID = {}
local SfPilotBlip = {}
local SfPilotLocations = {
	{-1835.109375 ,-119.1904296875 ,4.4975328445435},
	{-1796.8505859375 ,-73.0361328125 ,9.6968126297},
	{-1807.2578125 ,158.9306640625 ,13.9609375},
}

addEventHandler("onMarkerHit",SfPilotJobMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pJob")) == 0 then
			triggerClientEvent("ShowPilotPanel", hitElement, hitElement)
		else
			outputChatBox("#ff0000[Error]: #ffffffShoma Darhal Hazer Shoghl Darid, #ffff00/estefa #ffffffBaraye Estefa Dadan!", hitElement,100,100,100, true)
		end
	end
end)

addEvent("GivePilotJob",true)
addEventHandler("GivePilotJob", root,
function (thePlayer)
	setElementData(accSys:getPlayerAcc(thePlayer), "pJob", 3)
	outputChatBox("#00ff00[Pilot]: #ffffffTabrik, Shoma Pilot Shodid!", thePlayer, 255, 255, 0,true)
end)

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"SfPilot")) == "number") then
		if seat == 0 then
			if jacked then outputChatBox ( "#ff0000Error: Bande Khoda Dare Kar Mikone Azar Dari Mage!", thePlayer, 230,0,0 ,true) cancelEvent() return false end
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJob")) ~= 3 then
				cancelEvent()
				outputChatBox ( "#ff0000Error: Shoma Pilot Nistid!", thePlayer, 230,0,0 ,true)
			end
		end
	end
end)

addEventHandler("onVehicleEnter",getRootElement(),
function( thePlayer, seat, jacked )
	local vehid = getElementID ( source )
	if (type(string.find(vehid,"SfPilot")) == "number") then
		if seat == 0 then
			outputChatBox("#00ff00[Pilot]: #ffffffShoma Savar Havapeyma Shodid, Parvaz Ra Shoro Konid Khalaban!", thePlayer, 255, 255, 0,true)
			SfPilotMarkerID[thePlayer] = 1
			SfPilotMarker[thePlayer] = createMarker( SfPilotLocations[1][1] , SfPilotLocations[1][2] , SfPilotLocations[1][3] ,"checkpoint",3,255, 255, 0,200, thePlayer)
			SfPilotBlip[thePlayer] = createBlipAttachedTo(SfPilotMarker[thePlayer], 56, 2, 255, 0, 0, 255,  0 , 65535,thePlayer)
		end
	end
end)

addEventHandler("onMarkerHit", resourceRoot,
function (hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and tonumber(getElementData(accSys:getPlayerAcc(hitElement),"pJob")) == 2 and isPedInVehicle(hitElement)) then
		if SfPilotMarker[hitElement] == source then
			if SfPilotMarkerID[hitElement] == 12 then
				destroyElement(source)
				destroyElement(SfPilotBlip[hitElement])
				SfPilotMarkerID[hitElement] = 1
				SfPilotMarker[hitElement] = createMarker( SfPilotLocations[1][1] , SfPilotLocations[1][2] , SfPilotLocations[1][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				SfPilotBlip[hitElement] = createBlipAttachedTo(SfPilotMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
				local NextPilotSkill = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pSwSkill")) + 1
				setElementData(accSys:getPlayerAcc(hitElement), "pSwSkill",NextSwSkill)
				if tonumber(NextSwSkill) <= 50 then--skill 1
					outputChatBox("#00ff00[Street-Washer]: #ffffffShoma 1 Dor Kamel Zadid Skill Shoma Bala Raft! #ffae00(Skill 1 | " ..NextSwSkill.." / 50)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextSwSkill) <= 100 then--skill 2
					outputChatBox("#00ff00[Street-Washer]: #ffffffShoma 1 Dor Kamel Zadid Skill Shoma Bala Raft! #ffae00(Skill 2 | " ..NextSwSkill.." / 100)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextSwSkill) <= 200 then--skill 3
					outputChatBox("#00ff00[Street-Washer]: #ffffffShoma 1 Dor Kamel Zadid Skill Shoma Bala Raft! #ffae00(Skill 3 | " ..NextSwSkill.." / 200)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextSwSkill) <= 300 then--skill 4
					outputChatBox("#00ff00[Street-Washer]: #ffffffShoma 1 Dor Kamel Zadid Skill Shoma Bala Raft! #ffae00(Skill 4 | " ..NextSwSkill.." / 300)", hitElement, 255, 255, 0,true)
				elseif tonumber(NextSwSkill) > 300 then--skill 5
					outputChatBox("#00ff00[Street-Washer]: #ffffffShoma 1 Dor Kamel Zadid Skill Shoma Bala Raft! #ffae00(Skill 5 | " ..NextSwSkill.." / Max)", hitElement, 255, 255, 0,true)
				end
				local SwRandomMoney = 0
				if tonumber(NextSwSkill) <= 50 then--skill 1
					SwRandomMoney = math.random(700,900)
				elseif tonumber(NextSwSkill) <= 100 then--skill 2
					SwRandomMoney = math.random(900,1100)
				elseif tonumber(NextSwSkill) <= 200 then--skill 3
					SwRandomMoney = math.random(1100,1250)
				elseif tonumber(NextSwSkill) <= 300 then--skill 4
					SwRandomMoney = math.random(1250,1500)
				elseif tonumber(NextSwSkill) > 300 then--skill 5
					SwRandomMoney = math.random(1500,2000)
				end
				givePlayerMoney(hitElement, SwRandomMoney)
				outputChatBox("#00ff00[Street-Washer]: #ffffffDastmozde Shoma : "..SwRandomMoney.."$ Ast!", hitElement, 255, 255, 0,true)
			else
				destroyElement(source)
				destroyElement(SfSwBlip[hitElement])
				SfSwMarkerID[hitElement] = SfSwMarkerID[hitElement] + 1
				SfSwMarker[hitElement] = createMarker( SfSwLocations[SfSwMarkerID[hitElement]][1] , SfSwLocations[SfSwMarkerID[hitElement]][2] , SfSwLocations[SfSwMarkerID[hitElement]][3] ,"checkpoint",3,255, 255, 0,200, hitElement)
				SfSwBlip[hitElement] = createBlipAttachedTo(SfSwMarker[hitElement], 56, 2, 255, 0, 0, 255,  0 , 65535,hitElement)
			end
		end
	end
end)

addEventHandler("onVehicleStartExit", rootElement,
function (thePlayer, seat, jacked)
	if SfSwMarker[thePlayer] then
		destroyElement( SfSwMarker[thePlayer] )
		destroyElement( SfSwBlip[thePlayer] )
		SfSwMarkerID[thePlayer] = nil
		SfSwMarker[thePlayer] = nil
		SfSwBlip[thePlayer] = nil
		outputChatBox("#ffff00[Street-Washer]: #ffffffShoma Az Sweeper Piade Shodid Va Kare Shoma Be Payan Resid!", thePlayer, 255, 255, 0,true)
	end
end)

addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	if SfSwMarker[source] then
		destroyElement( SfSwMarker[source] )
		destroyElement( SfSwBlip[source] )
		SfSwMarkerID[source] = nil
		SfSwMarker[source] = nil
		SfSwBlip[source] = nil
	end
end)

addEventHandler ( "onPlayerQuit", getRootElement(),
function()
	if SfSwMarker[source] then
		destroyElement( SfSwMarker[source] )
		destroyElement( SfSwBlip[source] )
		SfSwMarkerID[source] = nil
		SfSwMarker[source] = nil
		SfSwBlip[source] = nil
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
	if vehid == "SW1" or vehid == "SW2" or vehid == "SW3" or vehid == "SW4" or vehid == "SW5" or vehid == "SW6" 
	or vehid == "SW7" or vehid == "SW8" or vehid == "SW9" or vehid == "SW10" or vehid == "SW11" or vehid == "SW12" then
		local thePlayer = getVehicleController( source )
		if thePlayer then
			if SfSwMarker[thePlayer] then
				destroyElement( SfSwMarker[thePlayer] )
				destroyElement( SfSwBlip[thePlayer] )
				SfSwMarkerID[thePlayer] = nil
				SfSwMarker[thePlayer] = nil
				SfSwBlip[thePlayer] = nil
				outputChatBox("#ffff00[Street-Washer]: #ffffffSweeper Shoma Terekid Va Kare Shoma Be Etmam Resid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)

