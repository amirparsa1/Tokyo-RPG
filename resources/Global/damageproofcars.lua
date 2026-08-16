function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

function dmgcars()
	setTimer ( function()
	for _,veh in ipairs (getElementsByType("vehicle")) do
		if veh then
			if not isVehicleOccupied(veh) then
			setVehicleDamageProof( veh,true)
			else
			setVehicleDamageProof( veh,false)
			end
		end
	end
	end, 1000, 0 )
end

dmgcars()