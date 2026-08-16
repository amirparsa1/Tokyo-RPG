local accSys = exports["Accounts-System"]
function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end
function enterhackVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 16 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "hacker1" or vehid == "hacker2" or vehid == "hacker3" or vehid == "hacker4" or vehid == "hacker5" or vehid == "hacker6" or vehid == "hacker7" or vehid == "hacker8" or vehid == "hacker9" 
			or vehid == "hacker10" or vehid == "hacker11" or vehid == "hacker12" or vehid == "hacker13" or vehid == "hacker14" or vehid == "hacker15" or vehid == "hacker16" or vehid == "hacker17" 
			or vehid == "hacker18" or vehid == "hacker19" or vehid == "hacker20"
			or vehid == "hacker21" or vehid == "hacker22"or vehid == "hacker23" or vehid == "hacker24" or vehid == "hacker25" then
			cancelEvent()
			outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "hacker1" or vehid == "hacker2" or vehid == "hacker3" or vehid == "hacker4" or vehid == "hacker5" or vehid == "hacker6" or vehid == "hacker7" or vehid == "hacker8" or vehid == "hacker9" 
			or vehid == "hacker10" or vehid == "hacker11" or vehid == "hacker12" or vehid == "hacker13" or vehid == "hacker14" or vehid == "hacker15" or vehid == "hacker16" or vehid == "hacker17" 
			or vehid == "hacker18" or vehid == "hacker19" or vehid == "hacker20"
			or vehid == "hacker21" or vehid == "hacker22"or vehid == "hacker23" or vehid == "hacker24" or vehid == "hacker25" then
			cancelEvent()
			outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterhackVehicle ) 


addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, hack_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( hack_cars )
			if vehid == "hacker1" or vehid == "hacker2" or vehid == "hacker3" or vehid == "hacker4" or vehid == "hacker5" or vehid == "hacker6" or vehid == "hacker7" or vehid == "hacker8" or vehid == "hacker9" 
			or vehid == "hacker10" or vehid == "hacker11" or vehid == "hacker12" or vehid == "hacker13" or vehid == "hacker14" or vehid == "hacker15" or vehid == "hacker16" or vehid == "hacker17" 
			or vehid == "hacker18" or vehid == "hacker19" or vehid == "hacker20"
			or vehid == "hacker21" or vehid == "hacker22"or vehid == "hacker23" or vehid == "hacker24" or vehid == "hacker25" then
				if not isVehicleOccupied(hack_cars) then
					respawnVehicle(hack_cars)
				end
			end
		end
		for index, hack_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(hack_members), "pMember")) == 16 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", hack_members, 255, 255, 255, true)
			end
		end
	end
end
)

--Gate1 hackers

hackersgate1 = createObject ( 980, 1131.1, -2080.8999, 70.6, 0, 0, 180 )
colhackersgate1 = createColCircle ( 1131.1, -2080.8999, 10.6)

function openhackersgate1(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
		moveObject(hackersgate1,3000,1131.1, -2080.8999, 60.6)
		setTimer(
		function()
			moveObject(hackersgate1,3000,1131.1, -2080.8999, 70.6)
		end, 30000, 1)
	end
end
addEventHandler( "onColShapeHit", colhackersgate1, openhackersgate1 )

function closehackersgate1(thePlayer)
	moveObject(hackersgate1,3000,1131.1, -2080.8999, 70.6)
end
addEventHandler( "onColShapeLeave", colhackersgate1, closehackersgate1 )

--Gate2 hackers

hackersgate2 = createObject ( 980, 1282.4, -2056.7, 60.6, 0, 0, 270 )
colhackersgate2 = createColCircle ( 1282.4 ,-2056.7 ,10.6)

function openhackersgate2(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
		moveObject(hackersgate2,3000,1282.4, -2056.7, 50.6)
		setTimer(
		function()
			moveObject(hackersgate2,3000,1282.4, -2056.7, 60.6)
		end, 30000, 1)
	end
end
addEventHandler( "onColShapeHit", colhackersgate2, openhackersgate2 )

function closehackersgate2(thePlayer)
	moveObject(hackersgate2,3000,1282.4, -2056.7, 60.6)
end
addEventHandler( "onColShapeLeave", colhackersgate2, closehackersgate2 )