local accSys = exports["Accounts-system"]
function enterfuryVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 14 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "fury1" or vehid == "fury2" or vehid == "fury3" or vehid == "fury4" or vehid == "fury5" or vehid == "fury6" or vehid == "fury7" or vehid == "fury8" or vehid == "fury9"
            or vehid == "fury10" or vehid == "fury11" or vehid == "fury12" or vehid == "fury13" or vehid == "fury14" or vehid == "fury15" or vehid == "fury16" or vehid == "fury17" or vehid == "fury18" or vehid == "fury19"	then
			cancelEvent()
			outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Fury Family Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "fury1" or vehid == "fury2" or vehid == "fury3" or vehid == "fury4" or vehid == "fury5" or vehid == "fury6" or vehid == "fury7" or vehid == "fury8" or vehid == "fury9"
            or vehid == "fury10" or vehid == "fury11" or vehid == "fury12" or vehid == "fury13" or vehid == "fury14" or vehid == "fury15" or vehid == "fury16" or vehid == "fury17" or vehid == "fury18" or vehid == "fury19" then
			cancelEvent()
			outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Fury Family Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterfuryVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, fury_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( fury_cars )
			if vehid == "fury1" or vehid == "fury2" or vehid == "fury3" or vehid == "fury4" or vehid == "fury5" or vehid == "fury6" or vehid == "fury7" or vehid == "fury8" or vehid == "fury9"
            or vehid == "fury10" or vehid == "fury11" or vehid == "fury12" or vehid == "fury13" or vehid == "fury14" or vehid == "fury15" or vehid == "fury16" or vehid == "fury17" or vehid == "fury18" or vehid == "fury19" then
				if not isVehicleOccupied(fury_cars) then
					respawnVehicle(fury_cars)
				end
			end
		end
		for index, fury_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(fury_members), "pMember")) == 14 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", fury_members, 255, 255, 255, true)
			end
		end
	end
end
)
