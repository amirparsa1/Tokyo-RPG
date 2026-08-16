local accSys = exports["Accounts-system"]
function enterfmssVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 16 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
	if vehid == "fms1" or vehid == "fms2" or vehid == "fms3" or vehid == "fms4" or vehid == "fms5" or vehid == "fms6" or vehid == "fms7" or vehid == "fms8" or vehid == "fms9" 
    or vehid == "fms10" or vehid == "fms11" or vehid == "fms12" or vehid == "fms13" or vehid == "fms14" or vehid == "fms15" or vehid == "fms16" or vehid == "fms17" 
	or vehid == "fms18" or vehid == "fms19"  then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia FMS Family Mibashad!", player, 230,0,0 ,true) 
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
	if vehid == "fms1" or vehid == "fms2" or vehid == "fms3" or vehid == "fms4" or vehid == "fms5" or vehid == "fms6" or vehid == "fms7" or vehid == "fms8" or vehid == "fms9" 
    or vehid == "fms10" or vehid == "fms11" or vehid == "fms12" or vehid == "fms13" or vehid == "fms14" or vehid == "fms15" or vehid == "fms16" or vehid == "fms17" 
	or vehid == "fms18" or vehid == "fms19" then
				cancelEvent()
				outputChatBox ( "#ff0000In Khodro Baraye Azaye Mafia FMS Family Mibashad!", player, 230,0,0 ,true) 
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterfmssVehicle ) 

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, fmss_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( fmss_cars )
			if vehid == "fms1" or vehid == "fms2" or vehid == "fms3" or vehid == "fms4" or vehid == "fms5" or vehid == "fms6" or vehid == "fms7" or vehid == "fms8" or vehid == "fms9" 
			or vehid == "fms10" or vehid == "fms11" or vehid == "fms12" or vehid == "fms13" or vehid == "fms14" or vehid == "fms15" or vehid == "fms16" or vehid == "fms17" 
			or vehid == "fms18" or vehid == "fms19" then
				if not isVehicleOccupied(fmss_cars) then
					respawnVehicle(fmss_cars)
				end
			end
		end
		for index, fmss_members in ipairs(getElementsByType("player")) do 
			if tonumber(getElementData(accSys:getPlayerAcc(fmss_members), "pMember")) == 16 then
				outputChatBox("#ff0000[Tavajoh] #ffffffTamamie Khodro Haye Faction Tavasote "..getPlayerName(thePlayer).." Respawn Shodand!", fmss_members, 255, 255, 255, true)
			end
		end
	end
end
)