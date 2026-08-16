local accSys = exports["Accounts-system"]
function enterjefersonVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 13 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "jeferson1" or vehid == "jeferson2" or vehid == "jeferson3" or vehid == "jeferson4" or vehid == "jeferson5" or vehid == "jeferson6" or vehid == "jeferson7" or vehid == "jeferson8" or vehid == "jeferson9" 
			or vehid == "jeferson10" or vehid == "jeferson11" or vehid == "jeferson12" or vehid == "jeferson13" or vehid == "jeferson14" or vehid == "jeferson15" or vehid == "jeferson16" or vehid == "jeferson17" 
			or vehid == "jeferson18" or vehid == "jeferson19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Jefferson Family Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "jeferson1" or vehid == "jeferson2" or vehid == "jeferson3" or vehid == "jeferson4" or vehid == "jeferson5" or vehid == "jeferson6" or vehid == "jeferson7" or vehid == "jeferson8" or vehid == "jeferson9" 
			or vehid == "jeferson10" or vehid == "jeferson11" or vehid == "jeferson12" or vehid == "jeferson13" or vehid == "jeferson14" or vehid == "jeferson15" or vehid == "jeferson16" or vehid == "jeferson17" 
			or vehid == "jeferson18" or vehid == "jeferson19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Jefferson Family Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterjefersonVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, jeferson_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( jeferson_cars )
			if vehid == "jeferson1" or vehid == "jeferson2" or vehid == "jeferson3" or vehid == "jeferson4" or vehid == "jeferson5" or vehid == "jeferson6" or vehid == "jeferson7" or vehid == "jeferson8" or vehid == "jeferson9" 
			or vehid == "jeferson10" or vehid == "jeferson11" or vehid == "jeferson12" or vehid == "jeferson13" or vehid == "jeferson14" or vehid == "jeferson15" or vehid == "jeferson16" or vehid == "jeferson17" 
			or vehid == "jeferson18" or vehid == "jeferson19"  then
				if not isVehicleOccupied(jeferson_cars) then
					respawnVehicle(jeferson_cars)
				end
			end
		end
		for index, jeferson_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(jeferson_members), "pMember")) == 13 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", jeferson_members, 255, 255, 255, true)
			end
		end
	end
end
)
