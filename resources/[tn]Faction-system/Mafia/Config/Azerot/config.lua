local accSys = exports["Accounts-system"]
function enterazerotVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 15 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "azerot1" or vehid == "azerot2" or vehid == "azerot3" or vehid == "azerot4" or vehid == "azerot5" or vehid == "azerot6" or vehid == "azerot7" or vehid == "azerot8" or vehid == "azerot9" 
			or vehid == "azerot10" or vehid == "azerot11" or vehid == "azerot12" or vehid == "azerot13" or vehid == "azerot14" or vehid == "azerot15" or vehid == "azerot16" or vehid == "azerot17"
			or vehid == "azerot18" or vehid == "azerot19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Azerot Family Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "azerot1" or vehid == "azerot2" or vehid == "azerot3" or vehid == "azerot4" or vehid == "azerot5" or vehid == "azerot6" or vehid == "azerot7" or vehid == "azerot8" or vehid == "azerot9" 
			or vehid == "azerot10" or vehid == "azerot11" or vehid == "azerot12" or vehid == "azerot13" or vehid == "azerot14" or vehid == "azerot15" or vehid == "azerot16" or vehid == "azerot17"
			or vehid == "azerot18" or vehid == "azerot19"  then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia Azerot Family Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterazerotVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, azerot_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( azerot_cars )
			if vehid == "azerot1" or vehid == "azerot2" or vehid == "azerot3" or vehid == "azerot4" or vehid == "azerot5" or vehid == "azerot6" or vehid == "azerot7" or vehid == "azerot8" or vehid == "azerot9" 
			or vehid == "azerot10" or vehid == "azerot11" or vehid == "azerot12" or vehid == "azerot13" or vehid == "azerot14" or vehid == "azerot15" or vehid == "azerot16" or vehid == "azerot17"
			or vehid == "azerot18" or vehid == "azerot19" then
				if not isVehicleOccupied(azerot_cars) then
					respawnVehicle(azerot_cars)
				end
			end
		end
		for index, azerot_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(azerot_members), "pMember")) == 15 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", azerot_members, 255, 255, 255, true)
			end
		end
	end
end
)
