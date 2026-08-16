local accSys = exports["Accounts-System"]
function enterballasVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 10 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "ballas1" or vehid == "ballas2" or vehid == "ballas3" or vehid == "ballas4" or vehid == "ballas5" or vehid == "ballas6" or vehid == "ballas7" or vehid == "ballas8" or vehid == "ballas9" 
			or vehid == "ballas10" or vehid == "ballas11" or vehid == "ballas12" or vehid == "ballas13" or vehid == "ballas14" or vehid == "ballas15" or vehid == "ballas16" or vehid == "ballas17" 
			or vehid == "ballas18" or vehid == "ballas19" or vehid == "ballas20" or vehid == "ballas21" or vehid == "ballas22"or vehid == "ballas23" or vehid == "ballas24" or vehid == "ballas25" then
				cancelEvent()
				outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "ballas1" or vehid == "ballas2" or vehid == "ballas3" or vehid == "ballas4" or vehid == "ballas5" or vehid == "ballas6" or vehid == "ballas7" or vehid == "ballas8" or vehid == "ballas9" 
			or vehid == "ballas10" or vehid == "ballas11" or vehid == "ballas12" or vehid == "ballas13" or vehid == "ballas14" or vehid == "ballas15" or vehid == "ballas16" or vehid == "ballas17" 
			or vehid == "ballas18" or vehid == "ballas19" or vehid == "ballas20" or vehid == "ballas21" or vehid == "ballas22"or vehid == "ballas23" or vehid == "ballas24" or vehid == "ballas25" then
				cancelEvent()
				outputChatBox ( "#ff0000Shoma Nemitavanid Savar In Khodro Shavid!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterballasVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, ballas_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( ballas_cars )
			if vehid == "ballas1" or vehid == "ballas2" or vehid == "ballas3" or vehid == "ballas4" or vehid == "ballas5" or vehid == "ballas6" or vehid == "ballas7" or vehid == "ballas8" or vehid == "ballas9" 
			or vehid == "ballas10" or vehid == "ballas11" or vehid == "ballas12" or vehid == "ballas13" or vehid == "ballas14" or vehid == "ballas15" or vehid == "ballas16" or vehid == "ballas17" 
			or vehid == "ballas18" or vehid == "ballas19" or vehid == "ballas20" or vehid == "ballas21" or vehid == "ballas22"or vehid == "ballas23" or vehid == "ballas24" or vehid == "ballas25" then
				if not isVehicleOccupied(ballas_cars) then
					respawnVehicle(ballas_cars)
				end
			end
		end
		for index, ballas_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(ballas_members), "pMember")) == 1 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", ballas_members, 255, 255, 255, true)
			end
		end
	end
end
)

ballasgate = createObject ( 980, 2704.1001, -1970.2, 12.9, 0, 90, 90 )
colballasgate = createColCircle ( 2704.1001 ,-1970.2 ,12.9)

function openballasgate(thePlayer)
	if getElementType(thePlayer) == "player" then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
			moveObject(ballasgate,3000,2704.1001, -1970.2, 2.9)
			setTimer(
			function()
				moveObject(ballasgate,3000,2704.1001, -1970.2, 12.9)
			end, 30000, 1)
		end
	end
end
addEventHandler( "onColShapeHit", colballasgate, openballasgate )

function closeballasgate(thePlayer)
	if getElementType(thePlayer) == "player" then
		moveObject(ballasgate,3000,2704.1001, -1970.2, 12.9)
	end
end
addEventHandler( "onColShapeLeave", colballasgate, closeballasgate )
