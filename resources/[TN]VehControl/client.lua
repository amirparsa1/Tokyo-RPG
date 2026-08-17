--[[ ===========================================================================
     [TN]VehControl -- client (CEF / HTML front-end)

     The panel is an HTML document rendered by MTA's built-in browser, drawn to
     a full-screen dxDrawImage. Lua owns the truth: it pushes state into the
     page with VC.sync({...}) and receives clicks back through the 'vcAction'
     browser event.

     Two things that normally break CEF panels are handled explicitly:
       * the render handler is removed before it is added, and the panel is
         force-closed on vehicle exit / death / resource stop, so it can never
         be left drawn with the cursor locked;
       * the browser is created ONCE and reused, because createBrowser is
         expensive and leaking one per open would hurt FPS over a session.
=========================================================================== ]]

local sX, sY = guiGetScreenSize()

local OPEN_KEY = "F4"
local SYNC_MS  = 220        -- how often live values (speed/health) are pushed

local browser, browserReady = nil, false
local visible   = false
local vehicle   = nil
local syncTimer = nil
local lastPayload = nil

-- --------------------------------------------------------------------------
-- browser bootstrap
-- --------------------------------------------------------------------------
-- Forward declaration: buildBrowser() below references installAjax(), which is
-- defined further down. Without this the upvalue would resolve to a GLOBAL that
-- is still nil at call time, and the ajax endpoint would never be registered.
local installAjax

local function buildBrowser()
    if browser then return end
    -- FIX: the 4th argument is `transparent`. It was false, which makes CEF
    --      composite the page over an OPAQUE white surface -- that is why the
    --      whole screen turned white when the panel opened. It must be true so
    --      only the panel itself is drawn and the game shows through.
    browser = createBrowser(sX, sY, true, true)
    addEventHandler("onClientBrowserCreated", browser, function()
        -- the ajax endpoint must exist before the page loads and calls it
        installAjax()
        loadBrowserURL(source, "http://mta/local/ui/index.html")
    end)
    addEventHandler("onClientBrowserDocumentReady", browser, function()
        browserReady = true
    end)
end
addEventHandler("onClientResourceStart", resourceRoot, buildBrowser)

-- --------------------------------------------------------------------------
-- state -> page
-- --------------------------------------------------------------------------
local function jsonSafe(s)
    if s == nil then return "null" end
    s = tostring(s):gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", " ")
    return '"' .. s .. '"'
end

local function pushState(force)
    if not (browser and browserReady and visible and isElement(vehicle)) then return end

    local seat     = getPedOccupiedVehicleSeat(localPlayer)
    local isDriver = (seat == 0)

    -- health 250..1000 -> 0..100
    local hp = math.max(0, math.min(100, math.floor((getElementHealth(vehicle) - 250) / 7.5)))
    local vx, vy, vz = getElementVelocity(vehicle)
    local speed = math.floor(math.sqrt(vx*vx + vy*vy + vz*vz) * 180)

    local doors = {}
    for i = 0, 5 do
        doors[#doors + 1] = ((getVehicleDoorOpenRatio(vehicle, i) or 0) >= 0.5) and "true" or "false"
    end

    local nSeats = math.min(VC.getSeatCount(vehicle), 4)
    local seats = {}
    for s = 0, nSeats - 1 do
        local occ = getVehicleOccupant(vehicle, s)
        if occ and isElement(occ) then
            local who = (getElementType(occ) == "player")
                        and getPlayerName(occ):gsub("#%x%x%x%x%x%x", "") or "PED"
            if utfLen(who) > 10 then who = utfSub(who, 0, 9) .. "." end
            seats[#seats + 1] = jsonSafe(who)
        else
            seats[#seats + 1] = "null"
        end
    end

    local payload = table.concat({
        "{",
        'name:',    jsonSafe((getVehicleName(vehicle) or "VEHICLE"):upper()), ",",
        'plate:',   jsonSafe(getVehiclePlateText(vehicle) or "---"), ",",
        'health:',  hp, ",",
        'speed:',   speed, ",",
        'engine:',  tostring(getVehicleEngineState(vehicle) == true), ",",
        'lock:',    tostring(isVehicleLocked(vehicle) == true), ",",
        'lights:',  tostring(getVehicleOverrideLights(vehicle) == 2), ",",
        'hazard:',  tostring(getElementData(vehicle, "TN:hazard") == true), ",",
        'windows:', tostring(getElementData(vehicle, "TN:windows") == true), ",",
        'driver:',  tostring(isDriver), ",",
        'mySeat:',  seat or 0, ",",
        'doors:[',  table.concat(doors, ","), "],",
        'seats:[',  table.concat(seats, ","), "]",
        "}",
    })

    -- Only push when something actually changed, except for the periodic tick
    -- that carries speed/health.
    if not force and payload == lastPayload then return end
    lastPayload = payload
    executeBrowserJavascript(browser, "VC.sync(" .. payload .. ")")
end

-- --------------------------------------------------------------------------
-- open / close
-- --------------------------------------------------------------------------
local function drawBrowser()
    if not (browser and visible) then return end
    dxDrawImage(0, 0, sX, sY, browser, 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

-- --------------------------------------------------------------------------
-- mouse injection
--
-- A browser rendered through dxDrawImage is just a texture: CEF never sees the
-- cursor. Without these three handlers the page renders correctly but is
-- completely dead to clicks, which is exactly how this resource first shipped.
-- --------------------------------------------------------------------------
function onCursorMove(_, _, ax, ay)
    if not (browser and visible) then return end
    injectBrowserMouseMove(browser, ax, ay)
end

function onBrowserClick(button, state, ax, ay)
    if not (browser and visible) then return end
    if button ~= "left" then return end
    if state == "down" then
        injectBrowserMouseDown(browser, "left")
    else
        injectBrowserMouseUp(browser, "left")
    end
end

function VC_close()
    if not visible then return end
    visible = false
    if browser and browserReady then
        executeBrowserJavascript(browser, "VC.hide()")
    end
    removeEventHandler("onClientRender", root, drawBrowser)
    removeEventHandler("onClientCursorMove", root, onCursorMove)
    removeEventHandler("onClientClick", root, onBrowserClick)
    if isTimer(syncTimer) then killTimer(syncTimer) end
    syncTimer = nil
    showCursor(false)
    if browser then focusBrowser(nil) end
    vehicle, lastPayload = nil, nil
end

local function VC_open(veh)
    if visible then return end
    if not (browser and browserReady) then
        exports["notf"]:addNotification("Panel Dar Hale Load Ast...", "info")
        return
    end
    vehicle, visible = veh, true

    removeEventHandler("onClientRender", root, drawBrowser)   -- never stack
    addEventHandler("onClientRender", root, drawBrowser)

    showCursor(true)
    focusBrowser(browser)
    executeBrowserJavascript(browser, "VC.show()")
    pushState(true)

    -- FIX: focusBrowser() alone only routes the KEYBOARD. A browser drawn with
    --      dxDrawImage receives no mouse input at all, so every click was
    --      silently dropped -- the panel rendered but nothing was clickable.
    --      Cursor movement and clicks must be injected manually (see below).
    addEventHandler("onClientCursorMove", root, onCursorMove)
    addEventHandler("onClientClick", root, onBrowserClick)

    if isTimer(syncTimer) then killTimer(syncTimer) end
    syncTimer = setTimer(function() pushState(false) end, SYNC_MS, 0)
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
-- NOTE: "/veh" is already taken by [TN]Admin (admin vehicle spawn) and
--       [TN]Taraghe, so this resource uses "/vc" instead to avoid shadowing
--       an admin command.
addCommandHandler("vc", toggle)

-- --------------------------------------------------------------------------
-- page -> Lua
-- --------------------------------------------------------------------------
--[[ FIX: the page used to call mta.triggerEvent('vcAction', ...) and Lua
     listened with addEvent("vcAction", true). That is the SERVER event system;
     it is not the CEF bridge, so nothing ever arrived and every button was
     dead. The supported channel for page -> Lua is an ajax handler, which the
     page reaches with a plain fetch(). ]]
local function handleAction(id, arg)
    if not visible then return "" end
    if id == "close" then VC_close() return "" end

    if id == "door" or id == "seat" then
        triggerServerEvent("TN:VehControl:action", localPlayer, id, tonumber(arg))
    else
        triggerServerEvent("TN:VehControl:action", localPlayer, id)
    end
    playSoundFrontEnd(4)
    -- refresh shortly after so the page shows the result of the action
    setTimer(function() pushState(true) end, 90, 1)
    return ""
end

--[[ The ajax handler is called with two TABLES (GET params, POST params), not
     loose arguments, and it must return a string that becomes the response
     body. It is registered once, right after the browser element exists. ]]
installAjax = function()
    if not browser then return end
    setBrowserAjaxHandler(browser, "vcAction", function(get, post)
        local p = post or {}
        local g = get or {}
        handleAction(p.id or g.id, p.arg or g.arg)
        return "ok"
    end)
end

-- --------------------------------------------------------------------------
-- auto-close
-- --------------------------------------------------------------------------
addEventHandler("onClientPlayerVehicleExit", localPlayer, function() VC_close() end)
addEventHandler("onClientPlayerWasted",      localPlayer, function() VC_close() end)
addEventHandler("onClientResourceStop",      resourceRoot, function()
    VC_close()
    if isElement(browser) then destroyElement(browser) end
end)

-- --------------------------------------------------------------------------
-- effects
-- --------------------------------------------------------------------------
addEvent("TN:VehControl:blink", true)
addEventHandler("TN:VehControl:blink", localPlayer, function(veh, locked)
    if not isElement(veh) then return end
    playSoundFrontEnd(locked and 4 or 5)
    if browser and browserReady and visible then
        executeBrowserJavascript(browser,
            'VC.toast("' .. (locked and "KHODRO GHOFL SHOD" or "GHOFL BAZ SHOD") .. '")')
    end
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
