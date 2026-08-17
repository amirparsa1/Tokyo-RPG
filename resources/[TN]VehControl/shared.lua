--[[ ===========================================================================
     [TN]VehControl -- shared definitions
     Kept in one place so client and server can never disagree about what an
     action is called or what it is allowed to do.
=========================================================================== ]]

VC = {}

-- How close the player must still be to the vehicle for a remote action.
VC.REMOTE_RANGE = 12

-- Anti-spam: minimum ms between two actions from the same player.
VC.ACTION_COOLDOWN = 250

-- Door indices used by MTA (setVehicleDoorOpenRatio / setVehicleDoorState)
VC.DOORS = {
    { id = 0, label = "Kapoot Aghab" },   -- boot / trunk
    { id = 1, label = "Kapoot Jolo" },    -- bonnet / hood
    { id = 2, label = "Dar Ranande" },    -- front left
    { id = 3, label = "Dar Shagerd" },    -- front right
    { id = 4, label = "Dar Aghab Chap" }, -- rear left
    { id = 5, label = "Dar Aghab Rast" }, -- rear right
}

-- Every action the client may ask the server to perform.
-- `driverOnly`  : must be sitting in seat 0
-- `needsOwner`  : must own the vehicle (or be staff / faction member)
VC.ACTIONS = {
    engine      = { driverOnly = true,  needsOwner = false },
    lock        = { driverOnly = false, needsOwner = true  },
    door        = { driverOnly = false, needsOwner = false },
    alldoors    = { driverOnly = false, needsOwner = false },
    lights      = { driverOnly = true,  needsOwner = false },
    seat        = { driverOnly = false, needsOwner = false },
    windows     = { driverOnly = false, needsOwner = false },
    hazard      = { driverOnly = true,  needsOwner = false },
    flip        = { driverOnly = true,  needsOwner = false },
}

function VC.isVehicleUsable(veh)
    return isElement(veh) and getElementType(veh) == "vehicle" and not isVehicleBlown(veh)
end

-- Seat count per vehicle, with sensible fallbacks for models MTA reports oddly.
function VC.getSeatCount(veh)
    if not isElement(veh) then return 1 end
    local n = getVehicleMaxPassengers(veh)
    if not n or n == false or n == 255 then return 1 end
    return n + 1 -- +1 for the driver
end
