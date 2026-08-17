--[[ ===========================================================================
     [TN]VehControl -- client UI

     Design notes
     ------------
     * Pure dxDraw (no CEGUI): matches the look of the rest of this server and
       costs nothing when the panel is closed -- the render handler is only
       attached while the panel is visible.
     * Resolution independent: every coordinate is expressed against a 1600x900
       design space and multiplied by px/py, the same convention used by
       Accounts-System and Faction-System in this gamemode.
     * The render handler is added with a matching removeEventHandler first, and
       the panel force-closes when the player leaves the vehicle, dies or the
       resource stops -- the three ways a dx panel normally gets stuck on screen.
=========================================================================== ]]

local sX, sY = guiGetScreenSize()
local px, py = (sX / 1600), (sY / 900)

local OPEN_KEY = "F4"

-- ---------------------------------------------------------------- palette
local C = {
    bg        = tocolor(14, 16, 22, 238),
    bgSoft    = tocolor(22, 25, 34, 245),
    panelEdge = tocolor(0, 207, 255, 190),
    header    = tocolor(18, 21, 29, 255),
    accent    = tocolor(0, 207, 255, 255),
    accentDim = tocolor(0, 207, 255, 60),
    text      = tocolor(238, 242, 248, 255),
    textDim   = tocolor(140, 150, 166, 255),
    on        = tocolor(46, 204, 113, 255),
    onSoft    = tocolor(46, 204, 113, 45),
    off       = tocolor(231, 76, 60, 255),
    offSoft   = tocolor(231, 76, 60, 40),
    row       = tocolor(28, 32, 43, 255),
    rowHover  = tocolor(38, 44, 58, 255),
    shadow    = tocolor(0, 0, 0, 130),
}

-- ---------------------------------------------------------------- state
local visible      = false
local vehicle      = nil
local hoverId      = nil
local openedAt     = 0
local toastText    = nil
local toastUntil   = 0
local fonts        = {}

-- geometry (design space 1600x900)
local W, H = 470, 560
local X, Y = 1600 - W - 60, (900 - H) / 2

local function d(x, y, w, h)  -- design -> screen rect
    return x * px, y * py, w * px, h * py
end

local function inRect(cx, cy, x, y, w, h)
    return cx >= x and cx <= x + w and cy >= y and cy <= y + h
end

-- ---------------------------------------------------------------- fonts
addEventHandler("onClientResourceStart", resourceRoot, function()
    fonts.title = dxCreateFont("files/Rubik-Black.ttf", 15 * math.min(px, py) + 6) or "default-bold"
    fonts.body  = dxCreateFont("files/Rubik-Regular.ttf", 11 * math.min(px, py) + 5) or "default"
    fonts.small = dxCreateFont("files/Rubik-Regular.ttf", 9 * math.min(px, py) + 4) or "default-small"
end)

local function font(k) return fonts[k] or "default" end

-- ---------------------------------------------------------------- toast
local function toast(msg)
    toastText  = msg
    toastUntil = getTickCount() + 1600
end

-- ---------------------------------------------------------------- buttons
-- Each entry: id, label, sublabel, kind ("toggle"|"action"), state fn
local function seatRows()
    local rows = {}
    if not isElement(vehicle) then return rows end
    -- Show at most 4 seats so the row always fits the panel width. Vehicles
    -- with more than 4 seats (bus/coach) are rare and the extra seats are
    -- reachable normally; the panel covers the common 1/2/4-seat cases.
    local total  = math.min(VC.getSeatCount(vehicle), 4)
    local mySeat = getPedOccupiedVehicleSeat(localPlayer)
    for s = 0, total - 1 do
        local occupant = getVehicleOccupant(vehicle, s)
        local name = "Khali"
        if occupant and isElement(occupant) then
            name = (getElementType(occupant) == "player")
                   and getPlayerName(occupant):gsub("#%x%x%x%x%x%x", "")
                   or "Ped"
        end
        rows[#rows + 1] = {
            id    = "seat:" .. s,
            label = (s == 0 and "Ranande" or ("Sandali " .. s)),
            sub   = name,
            state = (s == mySeat) and "me" or (occupant and "busy" or "free"),
            act   = "seat",
            arg   = s,
        }
    end
    return rows
end

local function mainRows()
    if not isElement(vehicle) then return {} end
    local seat     = getPedOccupiedVehicleSeat(localPlayer)
    local isDriver = (seat == 0)
    local engineOn = getVehicleEngineState(vehicle)
    local locked   = isVehicleLocked(vehicle)
    local lights   = getVehicleOverrideLights(vehicle) == 2
    local hazard   = getElementData(vehicle, "TN:hazard") == true
    local windows  = getElementData(vehicle, "TN:windows") == true

    return {
        { id = "engine",   label = "Motor",        sub = engineOn and "Roshan" or "Khamoosh",
          on = engineOn,  act = "engine",   need = isDriver },
        { id = "lock",     label = "Ghofl",        sub = locked and "Ghofl" or "Baz",
          on = locked,    act = "lock" },
        { id = "lights",   label = "Cheragh",      sub = lights and "Roshan" or "Khamoosh",
          on = lights,    act = "lights",   need = isDriver },
        { id = "hazard",   label = "Flasher",      sub = hazard and "Roshan" or "Khamoosh",
          on = hazard,    act = "hazard",   need = isDriver },
        { id = "windows",  label = "Shishe Ha",    sub = windows and "Paeen" or "Bala",
          on = windows,   act = "windows" },
        { id = "alldoors", label = "Hame Darha",   sub = "Baz / Baste",
          on = nil,       act = "alldoors" },
    }
end

-- ---------------------------------------------------------------- drawing
local function drawGlowLine(x, y, w, col)
    dxDrawRectangle(x, y, w, 2 * py, col)
end

local function drawToggle(x, y, w, h, isOn, hovered)
    local knobW = 34 * px
    local track = isOn and C.onSoft or C.offSoft
    dxDrawRectangle(x, y, w, h, track)
    local kx = isOn and (x + w - knobW) or x
    dxDrawRectangle(kx, y, knobW, h, isOn and C.on or C.off)
end

local function render()
    if not visible then return end

    -- Vehicle vanished (exploded, streamed out, resource restart) -> close.
    if not isElement(vehicle) then
        VC_close()
        return
    end

    local cx, cy = getCursorPosition()
    if cx then cx, cy = cx * sX, cy * sY else cx, cy = -1, -1 end
    hoverId = nil

    -- entry animation (140ms slide + fade)
    local t = math.min((getTickCount() - openedAt) / 140, 1)
    local ease = 1 - (1 - t) * (1 - t)
    local offX = (1 - ease) * 40 * px
    local alpha = ease

    local bx, by, bw, bh = d(X, Y, W, H)
    bx = bx + offX

    -- shadow + body
    dxDrawRectangle(bx + 5 * px, by + 6 * py, bw, bh, tocolor(0, 0, 0, 110 * alpha))
    dxDrawRectangle(bx, by, bw, bh, tocolor(14, 16, 22, 238 * alpha))

    -- header
    local hh = 58 * py
    dxDrawRectangle(bx, by, bw, hh, tocolor(18, 21, 29, 255 * alpha))
    drawGlowLine(bx, by + hh, bw, tocolor(0, 207, 255, 190 * alpha))
    -- left accent bar
    dxDrawRectangle(bx, by, 4 * px, hh, tocolor(0, 207, 255, 255 * alpha))

    local vehName = getVehicleName(vehicle) or "Vehicle"
    dxDrawText("VEHICLE CONTROL", bx + 20 * px, by, bw, hh,
               tocolor(238, 242, 248, 255 * alpha), 1, font("title"), "left", "center")
    dxDrawText(vehName:upper(), bx, by, bw - 20 * px, hh,
               tocolor(0, 207, 255, 220 * alpha), 1, font("small"), "right", "center")

    local yy = by + hh + 14 * py

    -- ---------------- main toggles
    local rowH  = 46 * py
    local gap   = 8 * py
    local padX  = 16 * px

    for _, r in ipairs(mainRows()) do
        local rx, rw = bx + padX, bw - padX * 2
        local hovered = inRect(cx, cy, rx, yy, rw, rowH)
        local disabled = (r.need == false)

        if hovered and not disabled then hoverId = r.id end

        dxDrawRectangle(rx, yy, rw, rowH,
            hovered and not disabled and tocolor(38, 44, 58, 255 * alpha)
                                     or tocolor(28, 32, 43, 255 * alpha))

        -- status stripe
        if r.on ~= nil then
            dxDrawRectangle(rx, yy, 3 * px, rowH,
                r.on and tocolor(46, 204, 113, 255 * alpha) or tocolor(231, 76, 60, 255 * alpha))
        else
            dxDrawRectangle(rx, yy, 3 * px, rowH, tocolor(0, 207, 255, 200 * alpha))
        end

        local textCol = disabled and tocolor(90, 96, 108, 255 * alpha)
                                  or tocolor(238, 242, 248, 255 * alpha)
        dxDrawText(r.label, rx + 16 * px, yy, rw, rowH * 0.62,
                   textCol, 1, font("body"), "left", "center")
        dxDrawText(disabled and "Faghat Ranande" or r.sub,
                   rx + 16 * px, yy + rowH * 0.40, rw, rowH * 0.5,
                   tocolor(140, 150, 166, 255 * alpha), 1, font("small"), "left", "center")

        if r.on ~= nil then
            local tw, th = 62 * px, 22 * py
            drawToggle(rx + rw - tw - 14 * px, yy + (rowH - th) / 2, tw, th, r.on, hovered)
        else
            dxDrawText(">", rx + rw - 26 * px, yy, 20 * px, rowH,
                       tocolor(0, 207, 255, 220 * alpha), 1, font("body"), "left", "center")
        end

        yy = yy + rowH + gap
    end

    -- ---------------- doors grid
    yy = yy + 6 * py
    dxDrawText("DARHA", bx + padX, yy, bw, 20 * py,
               tocolor(0, 207, 255, 200 * alpha), 1, font("small"), "left", "top")
    yy = yy + 22 * py

    local cols, cw, chh = 3, (W - 32 - 2 * 8) / 3, 40
    for i, dr in ipairs(VC.DOORS) do
        local col = (i - 1) % cols
        local row = math.floor((i - 1) / cols)
        local dx0 = bx + padX + col * (cw + 8) * px
        local dy0 = yy + row * (chh + 8) * py
        local dw0, dh0 = cw * px, chh * py

        local ratio = getVehicleDoorOpenRatio(vehicle, dr.id) or 0
        local isOpen = ratio >= 0.5
        local hovered = inRect(cx, cy, dx0, dy0, dw0, dh0)
        if hovered then hoverId = "door:" .. dr.id end

        dxDrawRectangle(dx0, dy0, dw0, dh0,
            hovered and tocolor(38, 44, 58, 255 * alpha) or tocolor(28, 32, 43, 255 * alpha))
        dxDrawRectangle(dx0, dy0 + dh0 - 3 * py, dw0, 3 * py,
            isOpen and tocolor(46, 204, 113, 255 * alpha) or tocolor(70, 78, 94, 255 * alpha))
        dxDrawText(dr.label, dx0, dy0, dw0, dh0 - 4 * py,
                   isOpen and tocolor(46, 204, 113, 255 * alpha)
                           or tocolor(180, 188, 200, 255 * alpha),
                   1, font("small"), "center", "center", true)
    end
    yy = yy + 2 * (chh + 8) * py + 6 * py

    -- ---------------- seats
    dxDrawText("SANDALI HA", bx + padX, yy, bw, 20 * py,
               tocolor(0, 207, 255, 200 * alpha), 1, font("small"), "left", "top")
    yy = yy + 22 * py

    local srows = seatRows()
    local sw = (W - 32 - (#srows - 1) * 8) / math.max(#srows, 1)
    for i, s in ipairs(srows) do
        local sx0 = bx + padX + (i - 1) * (sw + 8) * px
        local sw0, sh0 = sw * px, 46 * py
        local hovered = inRect(cx, cy, sx0, yy, sw0, sh0)
        if hovered and s.state ~= "me" then hoverId = s.id end

        local base = tocolor(28, 32, 43, 255 * alpha)
        if s.state == "me" then base = tocolor(0, 207, 255, 55 * alpha)
        elseif hovered then base = tocolor(38, 44, 58, 255 * alpha) end
        dxDrawRectangle(sx0, yy, sw0, sh0, base)

        if s.state == "me" then
            dxDrawRectangle(sx0, yy, sw0, 2 * py, tocolor(0, 207, 255, 255 * alpha))
        end

        dxDrawText(s.label, sx0, yy + 4 * py, sw0, sh0 * 0.5,
                   tocolor(238, 242, 248, 255 * alpha), 1, font("small"), "center", "center")
        dxDrawText(s.sub, sx0, yy + sh0 * 0.45, sw0, sh0 * 0.5,
                   s.state == "free" and tocolor(46, 204, 113, 220 * alpha)
                                      or tocolor(140, 150, 166, 255 * alpha),
                   1, font("small"), "center", "center")
    end
    yy = yy + 46 * py + 14 * py

    -- ---------------- flip (only useful when upside down)
    local rx, rw = bx + padX, bw - padX * 2
    local fh = 42 * py
    local hovered = inRect(cx, cy, rx, yy, rw, fh)
    if hovered then hoverId = "flip" end
    dxDrawRectangle(rx, yy, rw, fh,
        hovered and tocolor(231, 76, 60, 190 * alpha) or tocolor(231, 76, 60, 70 * alpha))
    dxDrawText("SAF KARDAN KHODRO", rx, yy, rw, fh,
               tocolor(255, 255, 255, 255 * alpha), 1, font("body"), "center", "center")

    -- ---------------- footer hint
    dxDrawText(OPEN_KEY .. " = Bastan   |   Klik = Entekhab",
               bx, by + bh - 26 * py, bw, 20 * py,
               tocolor(110, 118, 132, 255 * alpha), 1, font("small"), "center", "center")

    -- ---------------- toast
    if toastText and getTickCount() < toastUntil then
        local tw, th = 320 * px, 40 * py
        local tx, ty = bx + (bw - tw) / 2, by - th - 10 * py
        dxDrawRectangle(tx, ty, tw, th, tocolor(0, 207, 255, 235))
        dxDrawText(toastText, tx, ty, tx + tw, ty + th,
                   tocolor(8, 12, 18, 255), 1, font("small"), "center", "center")
    end

    -- cursor hint
    if hoverId then
        dxDrawRectangle(cx - 1, cy - 8 * py, 2, 16 * py, tocolor(0, 207, 255, 120))
    end
end

-- ---------------------------------------------------------------- open/close
function VC_close()
    if not visible then return end
    visible = false
    removeEventHandler("onClientRender", root, render)
    showCursor(false)
    vehicle = nil
    hoverId = nil
end

local function VC_open(veh)
    if visible then return end
    vehicle  = veh
    visible  = true
    openedAt = getTickCount()
    -- FIX-style guard: never stack two render handlers.
    removeEventHandler("onClientRender", root, render)
    addEventHandler("onClientRender", root, render)
    showCursor(true)
end

local function toggle()
    if visible then VC_close() return end

    if getElementData(localPlayer, "loggedIn") ~= true then return end

    -- Don't steal the cursor from chat, the console or another panel.
    if isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() then return end
    -- F1 dashboard / F2 inventory own the cursor while they are open.
    if isCursorShowing() then return end

    local veh = getPedOccupiedVehicle(localPlayer)
    if not veh then
        exports["notf"]:addNotification("Shoma Dar Khodro Nistid!", "error")
        return
    end
    VC_open(veh)
end

bindKey(OPEN_KEY, "down", toggle)
addCommandHandler("veh", toggle)

-- ---------------------------------------------------------------- input
addEventHandler("onClientClick", root, function(button, state)
    if button ~= "left" or state ~= "down" or not visible or not hoverId then return end

    local id = hoverId
    if id == "flip" then
        triggerServerEvent("TN:VehControl:action", localPlayer, "flip")
    elseif id:sub(1, 5) == "door:" then
        triggerServerEvent("TN:VehControl:action", localPlayer, "door", tonumber(id:sub(6)))
    elseif id:sub(1, 5) == "seat:" then
        triggerServerEvent("TN:VehControl:action", localPlayer, "seat", tonumber(id:sub(6)))
    else
        triggerServerEvent("TN:VehControl:action", localPlayer, id)
    end
    playSoundFrontEnd(4)
end)

-- ---------------------------------------------------------------- auto-close
addEventHandler("onClientPlayerVehicleExit", localPlayer, function() VC_close() end)
addEventHandler("onClientPlayerWasted", localPlayer, function() VC_close() end)
addEventHandler("onClientResourceStop", resourceRoot, function() VC_close() end)

-- ---------------------------------------------------------------- effects
addEvent("TN:VehControl:blink", true)
addEventHandler("TN:VehControl:blink", localPlayer, function(veh, locked)
    if not isElement(veh) then return end
    playSoundFrontEnd(locked and 4 or 5)
    toast(locked and "Khodro Ghofl Shod" or "Ghofl Baz Shod")
end)

--[[ Hazard blinking.

     NOTE: [TN]Speedo already drives setVehicleOverrideLights server-side (the
     "cheraq" event), and [TN]DS does too. Running an unconditional per-frame
     loop over every streamed vehicle would fight those resources and flicker.

     So this only touches vehicles that this resource explicitly flagged, it
     ticks on a timer rather than every frame, and it restores the lights to
     "default" as soon as the flag is cleared -- so the moment hazard is turned
     off, [TN]Speedo is back in charge of that vehicle.                       ]]
local hazardPhase = false
setTimer(function()
    hazardPhase = not hazardPhase
    for _, v in ipairs(getElementsByType("vehicle", root, true)) do
        if isElement(v) then
            if getElementData(v, "TN:hazard") == true then
                setVehicleOverrideLights(v, hazardPhase and 2 or 1)
            elseif getElementData(v, "TN:hazardRestore") == true then
                setVehicleOverrideLights(v, 0) -- 0 = engine default
                removeElementData(v, "TN:hazardRestore")
            end
        end
    end
end, 450, 0)

addEventHandler("onClientElementDataChange", root, function(key, oldValue)
    if key == "TN:hazard" and getElementType(source) == "vehicle" then
        if oldValue == true and getElementData(source, "TN:hazard") ~= true then
            setElementData(source, "TN:hazardRestore", true, false)
        end
    end
end)
