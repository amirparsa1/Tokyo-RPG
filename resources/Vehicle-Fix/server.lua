--[[function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

function mashinDarHalDamage()
    if not isVehicleOccupied(source) then
        setVehicleDamageProof(source, true)
        setTimer(
    else
        setVehicleDamageProof(source, false)
    end
end
addEventHandler("onVehicleDamage", root, mashinDarHalDamage)]]