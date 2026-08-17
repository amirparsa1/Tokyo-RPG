--[[ ===========================================================================
     [TN]VehControl -- client UI  (v3)

     LAYOUT CONTRACT
     ---------------
     v1 laid the panel out with ad-hoc `y = y + ...` arithmetic against a fixed
     height. The content summed to 676 design px inside a 560 px panel, so the
     seats and the flip button were drawn past the bottom edge and the click
     boxes no longer matched the pixels. v2 added a hand-drawn top-down car that
     simply did not read as a car.

     v3 fixes both properly:
       * every section height is a named constant, and PH is COMPUTED from them,
         so the panel can never be shorter than its own contents;
       * hitboxes are written into `boxes` during the draw pass and hit-tested
         from that same table, so visuals and clicks cannot drift apart;
       * no bitmap/vector car -- a real status strip (health / fuel / speed) and
         labelled door pills carry the information instead.

     Design space is 1600x900, scaled by px/py -- the same convention used by
     Accounts-System and Faction-System in this gamemode.
=========================================================================== ]]

local sX, sY = guiGetScreenSize()
local px, py = (sX / 1600), (sY / 900)
local scale  = math.min(px, py)

local OPEN_KEY = "F4"

-- ---------------------------------------------------------------- palette
local COL = {
    body     = tocolor(12, 14, 19, 247),
    header   = tocolor(17, 20, 27, 255),
    strip    = tocolor(15, 18, 25, 255),
    tile     = tocolor(24, 28, 37, 255),
    tileHot  = tocolor(33, 39, 51, 255),
    line     = tocolor(38, 44, 56, 255),
    accent   = tocolor(0, 194, 255, 255),
    text     = tocolor(233, 239, 247, 255),
    dim      = tocolor(122, 134, 152, 255),
    dimmer   = tocolor(74, 84, 100, 255),
    ok       = tocolor(52, 211, 130, 255),
    okSoft   = tocolor(52, 211, 130, 42),
    bad      = tocolor(236, 92, 84, 255),
    warn     = tocolor(240, 180, 60, 255),
    grey     = tocolor(92, 100, 116, 255),
    seatMine = tocolor(0, 194, 255, 46),
}

-- ---------------------------------------------------------------- layout
local PW     = 460
local PAD    = 18
local HEADER = 74
local STATUS = 92
local TILE_H, TILE_G = 66, 8
local DOOR_H = 44
local SEAT_H = 54
local FOOT   = 34
local ROWS, COLS = 2, 3
local CAPTION = 16

-- Panel height is DERIVED, never hand-typed.
local PH = HEADER + STATUS + PAD
         + ROWS * TILE_H + (ROWS - 1) * TILE_G + PAD
         + CAPTION + DOOR_H + PAD
         + CAPTION + SEAT_H + 14
         + FOOT

local PX0 = 1600 - PW - 54
local PY0 = (900 - PH) / 2

-- ---------------------------------------------------------------- state
local visible  = false
local vehicle  = nil
local openedAt = 0
local hot      = nil
local boxes    = {}
local fonts    = {}
local toastMsg, toastTill = nil, 0

addEventHandler("onClientResourceStart", resourceRoot, function()
    fonts.xl = dxCreateFont("files/Rubik-Black.ttf",   20 * scale + 6) or "default-bold"
    fonts.h1 = dxCreateFont("files/Rubik-Black.ttf",   13 * scale + 5) or "default-bold"
    fonts.md = dxCreateFont("files/Rubik-Regular.ttf", 10 * scale + 4) or "default"
    fonts.sm = dxCreateFont("files/Rubik-Regular.ttf",  8 * scale + 3) or "default-small"
end)
local function F(k) return fonts[k] or "default" end

local function toast(t) toastMsg, toastTill = t, getTickCount() + 1700 end

-- ---------------------------------------------------------------- helpers
local function S(x, y, w, h) return x * px, y * py, w * px, h * py end
local function inside(cx, cy, b)
    return b and cx >= b[1] and cx <= b[1] + b[3] and cy >= b[2] and cy <= b[2] + b[4]
end
local function fade(c, a)
    local r = bitExtract(c, 16, 8); local g = bitExtract(c, 8, 8)
    local b = bitExtract(c, 0, 8);  local al = bitExtract(c, 24, 8)
    return tocolor(r, g, b, al * a)
end

local DOORS = {
    { id = 0, name = "SANDOGH" },
    { id = 1, name = "KAPOOT"  },
    { id = 2, name = "RANANDE" },
    { id = 3, name = "SHAGERD" },
    { id = 4, name = "AGHAB-C" },
    { id = 5, name = "AGHAB-R" },
}

local function seatCount()
    if not isElement(vehicle) then return 1 end
    return math.min(VC.getSeatCount(vehicle), 4)
end

local function tiles()
    if not isElement(vehicle) then return {} end
    local isDriver = (getPedOccupiedVehicleSeat(localPlayer) == 0)
    return {
        { id = "engine",  name = "MOTOR",   on = getVehicleEngineState(vehicle),
          onTxt = "ROSHAN", offTxt = "KHAMOOSH", lock = not isDriver },
        { id = "lock",    name = "GHOFL",   on = isVehicleLocked(vehicle),
          onTxt = "GHOFL",  offTxt = "BAZ" },
        { id = "lights",  name = "CHERAGH", on = getVehicleOverrideLights(vehicle) == 2,
          onTxt = "ROSHAN", offTxt = "KHAMOOSH", lock = not isDriver },
        { id = "hazard",  name = "FLASHER", on = getElementData(vehicle, "TN:hazard") == true,
          onTxt = "ROSHAN", offTxt = "KHAMOOSH", lock = not isDriver },
        { id = "windows", name = "SHISHE",  on = getElementData(vehicle, "TN:windows") == true,
          onTxt = "PAEEN",  offTxt = "BALA" },
        { id = "flip",    name = "SAF KARDAN", bare = true, lock = not isDriver },
    }
end

-- ---------------------------------------------------------------- render
local function render()
    if not visible then return end
    if not isElement(vehicle) or getPedOccupiedVehicle(localPlayer) ~= vehicle then
        VC_close(); return
    end

    boxes = {}
    local cx, cy = getCursorPosition()
    if cx then cx, cy = cx * sX, cy * sY else cx, cy = -1, -1 end

    local t = math.min((getTickCount() - openedAt) / 160, 1)
    local e = 1 - (1 - t) * (1 - t)
    local a = e
    local bx, by, bw, bh = S(PX0, PY0, PW, PH)
    bx = bx + (1 - e) * 46 * px

    -- shell
    dxDrawRectangle(bx + 6 * px, by + 8 * py, bw, bh, tocolor(0, 0, 0, 120 * a))
    dxDrawRectangle(bx, by, bw, bh, fade(COL.body, a))
    dxDrawRectangle(bx, by, 3 * px, bh, fade(COL.accent, a))

    -- ---------------- header
    dxDrawRectangle(bx, by, bw, HEADER * py, fade(COL.header, a))
    dxDrawRectangle(bx, by + HEADER * py - 1, bw, 1, fade(COL.line, a))

    local vname = getVehicleName(vehicle) or "VEHICLE"
    dxDrawText(vname:upper(), bx + PAD * px, by + 12 * py, bx + bw, by + 44 * py,
               fade(COL.text, a), 1, F("h1"), "left", "center")
    local plate = getVehiclePlateText(vehicle)
    dxDrawText((plate and plate ~= "") and plate or "---",
               bx + PAD * px, by + 42 * py, bx + bw, by + 64 * py,
               fade(COL.dim, a), 1, F("sm"), "left", "center")

    local cbs = 30 * px
    local cb = { bx + bw - cbs - 10 * px, by + (HEADER * py - cbs) / 2, cbs, cbs }
    boxes["close"] = cb
    dxDrawRectangle(cb[1], cb[2], cb[3], cb[4],
        hot == "close" and fade(COL.bad, a) or fade(tocolor(30, 35, 45, 255), a))
    dxDrawText("X", cb[1], cb[2], cb[1] + cb[3], cb[2] + cb[4],
               fade(COL.text, a), 1, F("md"), "center", "center")

    -- ---------------- status strip
    local stY = by + HEADER * py
    dxDrawRectangle(bx, stY, bw, STATUS * py, fade(COL.strip, a))

    local hp    = math.max(0, math.floor((getElementHealth(vehicle) - 250) / 7.5))
    local speed = 0
    local vx, vy, vz = getElementVelocity(vehicle)
    speed = math.floor(math.sqrt(vx*vx + vy*vy + vz*vz) * 180)

    local hpCol = (hp > 60 and COL.ok) or (hp > 25 and COL.warn) or COL.bad
    local stats = {
        { v = hp .. "%",  l = "SALAMAT", c = hpCol },
        { v = tostring(speed), l = "SOR'AT", c = COL.accent },
        { v = getVehicleEngineState(vehicle) and "ON" or "OFF", l = "MOTOR",
          c = getVehicleEngineState(vehicle) and COL.ok or COL.grey },
    }
    local cw = (PW - PAD * 2) / 3
    for i, s in ipairs(stats) do
        local x = bx + PAD * px + (i - 1) * cw * px
        dxDrawText(s.v, x, stY + 18 * py, x + cw * px, stY + 52 * py,
                   fade(s.c, a), 1, F("xl"), "center", "center")
        dxDrawText(s.l, x, stY + 54 * py, x + cw * px, stY + 72 * py,
                   fade(COL.dim, a), 1, F("sm"), "center", "center")
        if i < 3 then
            dxDrawRectangle(x + cw * px - 1, stY + 22 * py, 1, 48 * py, fade(COL.line, a))
        end
    end
    dxDrawRectangle(bx, stY + STATUS * py - 1, bw, 1, fade(COL.line, a))

    -- ---------------- tile grid
    local innerW = PW - PAD * 2
    local gY = stY + STATUS * py + PAD * py
    local tw = (innerW - (COLS - 1) * TILE_G) / COLS

    for i, tl in ipairs(tiles()) do
        local c = (i - 1) % COLS
        local r = math.floor((i - 1) / COLS)
        local x = bx + PAD * px + c * (tw + TILE_G) * px
        local y = gY + r * (TILE_H + TILE_G) * py
        local w, h = tw * px, TILE_H * py

        if not tl.lock then boxes[tl.id] = { x, y, w, h } end
        local hov = (hot == tl.id)

        local base = COL.tile
        if tl.lock then base = tocolor(18, 21, 28, 255)
        elseif hov then base = COL.tileHot end
        dxDrawRectangle(x, y, w, h, fade(base, a))

        local stripe = COL.accent
        if tl.on == true then stripe = COL.ok
        elseif tl.on == false then stripe = COL.grey end
        dxDrawRectangle(x, y, 3 * px, h, fade(stripe, a))

        if tl.bare then
            dxDrawText(tl.name, x, y, x + w, y + h,
                       fade(tl.lock and COL.dimmer or COL.accent, a),
                       1, F("md"), "center", "center")
        else
            dxDrawText(tl.name, x, y + 11 * py, x + w, y + h * 0.44 + 11 * py,
                       fade(tl.lock and COL.dimmer or COL.text, a),
                       1, F("md"), "center", "center")
            dxDrawText(tl.lock and "RANANDE" or (tl.on and tl.onTxt or tl.offTxt),
                       x, y + h * 0.53, x + w, y + h - 6 * py,
                       fade(tl.on and COL.ok or COL.dim, a), 1, F("sm"), "center", "center")
        end
    end

    -- ---------------- doors
    local dY = gY + ROWS * TILE_H * py + (ROWS - 1) * TILE_G * py + PAD * py
    dxDrawText("DARHA", bx + PAD * px, dY, bx + bw, dY + CAPTION * py,
               fade(COL.accent, a), 1, F("sm"), "left", "top")
    dY = dY + CAPTION * py

    local dw = (innerW - 5 * 6) / 6
    for i, dr in ipairs(DOORS) do
        local x = bx + PAD * px + (i - 1) * (dw + 6) * px
        local w, h = dw * px, DOOR_H * py
        local isOpen = (getVehicleDoorOpenRatio(vehicle, dr.id) or 0) >= 0.5
        boxes["door:" .. dr.id] = { x, dY, w, h }
        local hov = (hot == "door:" .. dr.id)

        dxDrawRectangle(x, dY, w, h,
            isOpen and fade(COL.okSoft, a) or fade(hov and COL.tileHot or COL.tile, a))
        dxDrawRectangle(x, dY + h - 3 * py, w, 3 * py,
            fade(isOpen and COL.ok or tocolor(66, 74, 90, 255), a))
        dxDrawText(dr.name, x, dY + 4 * py, x + w, dY + h * 0.5,
                   fade(isOpen and COL.text or COL.dim, a), 1, F("sm"), "center", "center")
        dxDrawText(isOpen and "BAZ" or "BASTE", x, dY + h * 0.48, x + w, dY + h - 4 * py,
                   fade(isOpen and COL.ok or COL.dimmer, a), 1, F("sm"), "center", "center")
    end

    -- ---------------- seats
    local tY = dY + DOOR_H * py + PAD * py
    dxDrawText("SANDALI", bx + PAD * px, tY, bx + bw, tY + CAPTION * py,
               fade(COL.accent, a), 1, F("sm"), "left", "top")
    tY = tY + CAPTION * py

    local n = seatCount()
    local sw = (innerW - (n - 1) * TILE_G) / n
    local mySeat = getPedOccupiedVehicleSeat(localPlayer)
    for s = 0, n - 1 do
        local x = bx + PAD * px + s * (sw + TILE_G) * px
        local w, h = sw * px, SEAT_H * py
        local occ  = getVehicleOccupant(vehicle, s)
        local mine = (s == mySeat)

        if not mine and not occ then boxes["seat:" .. s] = { x, tY, w, h } end
        local hov = (hot == "seat:" .. s)

        dxDrawRectangle(x, tY, w, h,
            mine and fade(COL.seatMine, a) or fade(hov and COL.tileHot or COL.tile, a))
        if mine then dxDrawRectangle(x, tY, w, 2 * py, fade(COL.accent, a)) end

        local who = "KHALI"
        if occ and isElement(occ) then
            who = (getElementType(occ) == "player")
                  and getPlayerName(occ):gsub("#%x%x%x%x%x%x", "") or "PED"
            if utfLen(who) > 9 then who = utfSub(who, 0, 8) .. "." end
        end
        dxDrawText(s == 0 and "RANANDE" or ("S" .. s), x, tY + 8 * py, x + w, tY + h * 0.45,
                   fade(COL.text, a), 1, F("sm"), "center", "center")
        dxDrawText(who, x, tY + h * 0.46, x + w, tY + h - 5 * py,
                   fade(mine and COL.accent or (occ and COL.dim or COL.ok), a),
                   1, F("sm"), "center", "center")
    end

    -- ---------------- footer
    local fY = by + bh - FOOT * py
    dxDrawRectangle(bx, fY, bw, 1, fade(COL.line, a))
    dxDrawText("KLIK = TAGHIR", bx + PAD * px, fY, bx + bw, fY + FOOT * py,
               fade(COL.dimmer, a), 1, F("sm"), "left", "center")
    dxDrawText(OPEN_KEY .. " BASTAN", bx, fY, bx + bw - PAD * px, fY + FOOT * py,
               fade(COL.dimmer, a), 1, F("sm"), "right", "center")

    -- ---------------- hover (resolved after boxes are built)
    hot = nil
    for id, b in pairs(boxes) do
        if inside(cx, cy, b) then hot = id break end
    end

    -- ---------------- toast
    if toastMsg and getTickCount() < toastTill then
        local tw2, th2 = 260 * px, 34 * py
        local tx, ty = bx + (bw - tw2) / 2, by - th2 - 8 * py
        dxDrawRectangle(tx, ty, tw2, th2, tocolor(0, 194, 255, 235))
        dxDrawText(toastMsg, tx, ty, tx + tw2, ty + th2,
                   tocolor(6, 10, 16, 255), 1, F("sm"), "center", "center")
    end
end

-- ---------------------------------------------------------------- open/close
function VC_close()
    if not visible then return end
    visible = false
    removeEventHandler("onClientRender", root, render)
    showCursor(false)
    vehicle, hot, boxes = nil, nil, {}
end

local function VC_open(veh)
    if visible then return end
    vehicle, visible, openedAt = veh, true, getTickCount()
    removeEventHandler("onClientRender", root, render)   -- never stack
    addEventHandler("onClientRender", root, render)
    showCursor(true)
end

local function toggle()
    if visible then VC_close() return end
    if getElementData(localPlayer, "loggedIn") ~= true then return end
    if isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() then return end
    if isCursorShowing() then return end   -- F1 / F2 already own the cursor

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
    if button ~= "left" or state ~= "down" or not visible or not hot then return end
    local id = hot
    if id == "close" then
        VC_close()
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
addEventHandler("onClientPlayerWasted",      localPlayer, function() VC_close() end)
addEventHandler("onClientResourceStop",      resourceRoot, function() VC_close() end)

-- ---------------------------------------------------------------- effects
addEvent("TN:VehControl:blink", true)
addEventHandler("TN:VehControl:blink", localPlayer, function(veh, locked)
    if not isElement(veh) then return end
    playSoundFrontEnd(locked and 4 or 5)
    toast(locked and "KHODRO GHOFL SHOD" or "GHOFL BAZ SHOD")
end)

--[[ Hazard blinking.
     [TN]Speedo and [TN]DS also drive setVehicleOverrideLights, so this must not
     run unconditionally every frame or the resources fight and the lights
     flicker. It only touches vehicles this resource flagged, ticks on a timer,
     and hands control back (state 0 = engine default) as soon as hazard is off. ]]
local hazPhase = false
setTimer(function()
    hazPhase = not hazPhase
    for _, v in ipairs(getElementsByType("vehicle", root, true)) do
        if isElement(v) then
            if getElementData(v, "TN:hazard") == true then
                setVehicleOverrideLights(v, hazPhase and 2 or 1)
            elseif getElementData(v, "TN:hazardRestore") == true then
                setVehicleOverrideLights(v, 0)
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
