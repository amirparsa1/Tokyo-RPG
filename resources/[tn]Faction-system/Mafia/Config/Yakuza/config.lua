local accSys = exports["Accounts-system"]
function enteryakuzaVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 12 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "yakuza1" or vehid == "yakuza2" or vehid == "yakuza3" or vehid == "yakuza4" or vehid == "yakuza5" or vehid == "yakuza6" or vehid == "yakuza7" or vehid == "yakuza8" or vehid == "yakuza9" 
			or vehid == "yakuza10" or vehid == "yakuza11" or vehid == "yakuza12" or vehid == "yakuza13" or vehid == "yakuza14" or vehid == "yakuza15" or vehid == "yakuza16" or vehid == "yakuza17" 
			or vehid == "yakuza18" or vehid == "yakuza19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Grove Street Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "yakuza1" or vehid == "yakuza2" or vehid == "yakuza3" or vehid == "yakuza4" or vehid == "yakuza5" or vehid == "yakuza6" or vehid == "yakuza7" or vehid == "yakuza8" or vehid == "yakuza9" 
			or vehid == "yakuza10" or vehid == "yakuza11" or vehid == "yakuza12" or vehid == "yakuza13" or vehid == "yakuza14" or vehid == "yakuza15" or vehid == "yakuza16" or vehid == "yakuza17" 
			or vehid == "yakuza18" or vehid == "yakuza19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Grove Street Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enteryakuzaVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, yakuza_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( yakuza_cars )
			if vehid == "yakuza1" or vehid == "yakuza2" or vehid == "yakuza3" or vehid == "yakuza4" or vehid == "yakuza5" or vehid == "yakuza6" or vehid == "yakuza7" or vehid == "yakuza8" or vehid == "yakuza9" 
			or vehid == "yakuza10" or vehid == "yakuza11" or vehid == "yakuza12" or vehid == "yakuza13" or vehid == "yakuza14" or vehid == "yakuza15" or vehid == "yakuza16" or vehid == "yakuza17" 
			or vehid == "yakuza18" or vehid == "yakuza19"  then
				if not isVehicleOccupied(yakuza_cars) then
					respawnVehicle(yakuza_cars)
				end
			end
		end
		for index, yakuza_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(yakuza_members), "pMember")) == 12 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", yakuza_members, 255, 255, 255, true)
			end
		end
	end
end
)
