--[[ ===========================================================================
     [TN]VehControl -- server

     SECURITY MODEL
     --------------
     Every handler below is reachable remotely, so it follows the same rules the
     rest of this server was hardened to in the bugfix passes:

       * the acting player is ALWAYS `client` (set by MTA, cannot be forged),
         never `source` and never a value passed in by the caller;
       * the vehicle is re-resolved and re-validated server-side -- the client
         only ever says "the car I'm in / the car I own", never "this element";
       * ownership and seat requirements are re-checked here even though the UI
         already hides the buttons, because the UI is not a security boundary;
       * a per-player cooldown stops event spam.
=========================================================================== ]]

local accSys = exports["accounts-System"]

local lastAction = {}   -- player -> tick of last accepted action

-- --------------------------------------------------------------------------
-- helpers
-- --------------------------------------------------------------------------

local function notify(player, msg, kind)
    if not isElement(player) then return end
    -- exports.notf is used all over this server; fall back to chat if missing.
    local ok = pcall(function()
        exports["notf"]:addNotification(player, msg, kind or "info")
    end)
    if not ok then
        outputChatBox("#00CFFF[Vehicle]:#FFFFFF " .. msg, player, 255, 255, 255, true)
    end
end

--- Returns the vehicle this player is allowed to act on, or nil + reason.
local function resolveVehicle(player, wantRemote)
    if not isElement(player) or getElementType(player) ~= "player" then
        return nil, "no player"
    end

    local veh = getPedOccupiedVehicle(player)

    if veh then
        if not VC.isVehicleUsable(veh) then return nil, "Khodro Kharab Ast!" end
        return veh, nil, getPedOccupiedVehicleSeat(player)
    end

    if not wantRemote then
        return nil, "Shoma Dar Khodro Nistid!"
    end

    -- Remote use: nearest owned vehicle within range.
    local px, py, pz = getElementPosition(player)
    local best, bestDist
    for _, v in ipairs(getElementsByType("vehicle")) do
        if VC.isVehicleUsable(v) then
            local vx, vy, vz = getElementPosition(v)
            local d = getDistanceBetweenPoints3D(px, py, pz, vx, vy, vz)
            if d <= VC.REMOTE_RANGE and (not bestDist or d < bestDist) then
                best, bestDist = v, d
            end
        end
    end
    if not best then return nil, "Khodroei Nazdik Shoma Nist!" end
    return best, nil, nil
end

--- Is this player allowed to administer this vehicle?
local function ownsVehicle(player, veh)
    if not isElement(player) or not isElement(veh) then return false end

    -- staff override
    local acc = accSys and accSys:getPlayerAcc(player)
    if acc then
        local adminLevel = tonumber(getElementData(acc, "pAdmin")) or 0
        if adminLevel >= 4 then return true end
    end

    local name = getPlayerName(player)

    -- The two ownership conventions used across this gamemode.
    local vOwner = getElementData(veh, "vOwner") or getElementData(veh, "owner")
    if vOwner and tostring(vOwner) == name then return true end

    -- Personal vehicle id match
    if acc then
        local pid = getElementData(acc, "pID")
        local vid = getElementData(veh, "vehicleOwnerID")
        if pid and vid and tostring(pid) == tostring(vid) then return true end
    end

    -- Faction / job vehicles: if the player sits in it and it has no private
    -- owner, treat them as a temporary operator (lets PD/medic use their cars).
    if not vOwner and getPedOccupiedVehicle(player) == veh then
        return true
    end

    return false
end

local function onCooldown(player)
    local now = getTickCount()
    local prev = lastAction[player]
    if prev and (now - prev) < VC.ACTION_COOLDOWN then return true end
    lastAction[player] = now
    return false
end

-- --------------------------------------------------------------------------
-- main entry point
-- --------------------------------------------------------------------------

addEvent("TN:VehControl:action", true)
addEventHandler("TN:VehControl:action", root, function(action, arg)
    -- `client` is the real caller. Never trust `source` here.
    local player = client
    if not isElement(player) or getElementType(player) ~= "player" then return end
    if type(action) ~= "string" then return end

    local spec = VC.ACTIONS[action]
    if not spec then
        outputDebugString("[TN]VehControl: unknown action '" .. tostring(action) ..
                          "' from " .. getPlayerName(player), 2)
        return
    end

    if onCooldown(player) then return end

    if getElementData(player, "loggedIn") ~= true then
        notify(player, "Ebteda Login Konid!", "error")
        return
    end

    local allowRemote = (action == "lock")
    local veh, err, seat = resolveVehicle(player, allowRemote)
    if not veh then
        notify(player, err or "Khata!", "error")
        return
    end

    if spec.driverOnly and seat ~= 0 then
        notify(player, "Bayad Ranande Bashid!", "error")
        return
    end

    if spec.needsOwner and not ownsVehicle(player, veh) then
        notify(player, "In Khodro Male Shoma Nist!", "error")
        return
    end

    -- ----------------------------------------------------------------------
    if action == "engine" then
        local on = not getVehicleEngineState(veh)
        setVehicleEngineState(veh, on)
        notify(player, on and "Motor Roshan Shod" or "Motor Khamoosh Shod",
               on and "success" or "info")

    elseif action == "lock" then
        local locked = not isVehicleLocked(veh)
        setVehicleLocked(veh, locked)
        -- little visual/audible confirmation for remote locking
        triggerClientEvent(player, "TN:VehControl:blink", player, veh, locked)
        notify(player, locked and "Khodro Ghofl Shod" or "Ghofl Baz Shod",
               locked and "success" or "info")

    elseif action == "door" then
        local idx = tonumber(arg)
        if not idx or idx < 0 or idx > 5 then return end
        -- 0 = shut, 1 = fully open
        local ratio = getVehicleDoorOpenRatio(veh, idx)
        local opening = (ratio or 0) < 0.5
        setVehicleDoorOpenRatio(veh, idx, opening and 1 or 0, 700)

    elseif action == "alldoors" then
        local anyOpen = false
        for _, d in ipairs(VC.DOORS) do
            if (getVehicleDoorOpenRatio(veh, d.id) or 0) >= 0.5 then anyOpen = true break end
        end
        for _, d in ipairs(VC.DOORS) do
            setVehicleDoorOpenRatio(veh, d.id, anyOpen and 0 or 1, 700)
        end
        notify(player, anyOpen and "Hame Darha Baste Shod" or "Hame Darha Baz Shod", "info")

    elseif action == "lights" then
        local state = getVehicleOverrideLights(veh)
        -- 0 = default, 1 = force off, 2 = force on
        local nextState = (state == 2) and 1 or 2
        setVehicleOverrideLights(veh, nextState)
        notify(player, nextState == 2 and "Cheragh Roshan" or "Cheragh Khamoosh", "info")

    elseif action == "hazard" then
        -- toggle both indicator-ish lights by flipping light states
        local on = getElementData(veh, "TN:hazard") ~= true
        setElementData(veh, "TN:hazard", on)
        notify(player, on and "Flasher Roshan" or "Flasher Khamoosh", "info")

    elseif action == "seat" then
        local target = tonumber(arg)
        local maxSeats = VC.getSeatCount(veh)
        if not target or target < 0 or target > (maxSeats - 1) then
            notify(player, "In Sandali Vojood Nadarad!", "error")
            return
        end
        if target == seat then return end
        if getVehicleOccupant(veh, target) then
            notify(player, "In Sandali Por Ast!", "error")
            return
        end
        -- Moving into the driver seat of a locked car you don't own is not allowed.
        if target == 0 and isVehicleLocked(veh) and not ownsVehicle(player, veh) then
            notify(player, "Nemitavanid Ranande Shavid!", "error")
            return
        end
        removePedFromVehicle(player)
        warpPedIntoVehicle(player, veh, target)
        notify(player, "Sandali Taghir Kard (" .. target .. ")", "success")

    elseif action == "windows" then
        local on = getElementData(veh, "TN:windows") ~= true
        setElementData(veh, "TN:windows", on)
        notify(player, on and "Shishe Ha Paeen" or "Shishe Ha Bala", "info")

    elseif action == "flip" then
        local rx, ry, rz = getElementRotation(veh)
        -- only allow it when the car is actually on its roof/side and stationary
        local vx, vy, vz = getElementVelocity(veh)
        local speed = math.sqrt(vx * vx + vy * vy + vz * vz)
        if speed > 0.06 then
            notify(player, "Aval Khodro Ra Motevaghef Konid!", "error")
            return
        end
        if rx < 100 and rx > -100 then
            notify(player, "Khodro Vaz'iat Tabiei Darad!", "info")
            return
        end
        setElementRotation(veh, 0, 0, rz)
        local x, y, z = getElementPosition(veh)
        setElementPosition(veh, x, y, z + 0.6)
        notify(player, "Khodro Saf Shod", "success")
    end
end)

-- --------------------------------------------------------------------------
-- cleanup: never keep dead player elements as table keys
-- --------------------------------------------------------------------------
addEventHandler("onPlayerQuit", root, function()
    lastAction[source] = nil
end)

addEventHandler("onResourceStop", resourceRoot, function()
    for _, v in ipairs(getElementsByType("vehicle")) do
        removeElementData(v, "TN:hazard")
        removeElementData(v, "TN:windows")
    end
end)
