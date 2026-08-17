--[[ ===========================================================================
     [TN]Inventory — CEF bridge  (XMP Default RPG UI)

     This file ONLY renders and forwards. It deliberately does not touch the
     existing inventory logic:

       * item data still comes from the server's ShowInventoryForPlayer event;
       * every action is forwarded to the SAME server events the old panel used
         (RequestUseItem / RequestDropItem / RequestSellItem /
          RequestSpllitGens / updateInventorySlot), so the server-side
         validation added in the earlier security passes still applies;
       * the legacy GUI is hidden rather than deleted, so nothing that
         references those elements breaks.

     Toggle with F2, exactly as before.
=========================================================================== ]]

local sW, sH = guiGetScreenSize()

local browser, ready = nil, false
local shown          = false
local cache          = nil     -- last payload, to avoid redundant pushes

-- --------------------------------------------------------------------------
-- item metadata: name + a coarse category for the detail pane
-- --------------------------------------------------------------------------
local CATEGORY = {
    [6]="utility",  [9]="utility",  [10]="consumable", [11]="equipment",
    [12]="vehicle", [15]="container",[16]="vehicle",   [17]="utility",
    [18]="consumable",[21]="consumable",[22]="utility",[23]="container",
    [24]="ammunition",[25]="ammunition",[26]="ammunition",
    [27]="equipment",[28]="equipment",
    [50]="mineral", [51]="mineral", [52]="mineral",
    [53]="mineral", [54]="mineral", [55]="mineral",
    [56]="gem", [57]="gem", [58]="gem", [59]="gem", [60]="gem", [61]="gem",
}

local function itemName(id)
    id = tonumber(id)
    if not id then return nil end
    -- ItemsTable / Focore are globals already defined in inventory_c.lua
    if type(ItemsTable) == "table" and ItemsTable[id] and ItemsTable[id][1] then
        return ItemsTable[id][1]
    end
    if type(Focore) == "table" and Focore[id] and Focore[id][1] then
        return Focore[id][1]
    end
    return "Item " .. id
end

-- --------------------------------------------------------------------------
-- json helpers (small, local — no library needed for this shape)
-- --------------------------------------------------------------------------
local function q(s)
    if s == nil then return "null" end
    s = tostring(s):gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("[\r\n]", " ")
    return '"' .. s .. '"'
end

-- --------------------------------------------------------------------------
-- state -> page
-- --------------------------------------------------------------------------
local function buildPayload()
    local acc = exports["accounts-System"]:getPlayerAcc(localPlayer)

    local parts = {}
    -- LoadPlayerInventory() in inventory_c.lua stores the last dataset it
    -- received in the globals ClientTable / TPlayer. Reuse those rather than
    -- duplicating the network path.
    local tbl = (type(ClientTable) == "table" and TPlayer) and ClientTable[TPlayer] or nil
    if tbl then
        for slot = 1, 55 do
            local row = tbl[slot]
            if row and tonumber(row["Item"]) and tonumber(row["Item"]) > 0 then
                local id  = tonumber(row["Item"])
                local qty = tonumber(row["Amount"]) or 1
                parts[#parts+1] = table.concat({
                    "{slot:", slot,
                    ",id:", id,
                    ",qty:", qty,
                    ",name:", q(itemName(id)),
                    ",cat:", q(CATEGORY[id] or "general"),
                    ",value:0}"
                })
            end
        end
    end

    local hp = math.floor(getElementHealth(localPlayer) or 100)
    local ar = math.floor(getPedArmor(localPlayer) or 0)
    local cash = getPlayerMoney(localPlayer) or 0
    local pid  = acc and getElementData(acc, "pID") or 0

    return table.concat({
        "{name:", q(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", "")),
        ",id:", q(pid),
        ",cash:", cash,
        ",hp:", hp,
        ",armor:", ar,
        ",equipped:[null,null,null,null]",
        ",items:[", table.concat(parts, ","), "]}"
    })
end

local function push(force)
    if not (browser and ready and shown) then return end
    local p = buildPayload()
    if not force and p == cache then return end
    cache = p
    executeBrowserJavascript(browser, "INV.sync(" .. p .. ")")
end

-- --------------------------------------------------------------------------
-- action -> existing server events
-- --------------------------------------------------------------------------
local function onAction(act, a, b)
    a, b = tonumber(a), tonumber(b)

    if act == "close" then
        UI_hide()

    elseif act == "use" and a then
        triggerServerEvent("RequestUseItem", localPlayer, localPlayer, a)

    elseif act == "drop" and a then
        triggerServerEvent("RequestDropItem", localPlayer, localPlayer, a)

    elseif act == "sell" and a then
        triggerServerEvent("RequestSellItem", localPlayer, localPlayer, a)

    elseif act == "split" and a and b then
        triggerServerEvent("RequestSpllitGens", localPlayer, localPlayer, a, b)

    elseif act == "move" and a and b then
        -- the legacy event expects (player, prevSlot, nextSlot, prevItem, nextItem)
        local tbl  = (type(ClientTable) == "table" and TPlayer) and ClientTable[TPlayer] or nil
        local from = tbl and tbl[a]
        local to   = tbl and tbl[b]
        triggerServerEvent("updateInventorySlot", localPlayer, localPlayer,
            a, b,
            from and tonumber(from["Item"]) or 0,
            to   and tonumber(to["Item"])   or 0)
    end

    -- reflect the result shortly after the server answers
    setTimer(function() push(true) end, 140, 1)
end

-- --------------------------------------------------------------------------
-- browser
-- --------------------------------------------------------------------------
local installAjax   -- forward declaration: used before it is defined below

local function build()
    if browser then return end
    -- transparent = true, otherwise CEF paints an opaque white full-screen quad
    browser = createBrowser(sW, sH, true, true)

    addEventHandler("onClientBrowserCreated", browser, function()
        installAjax()
        loadBrowserURL(source, "http://mta/local/ui/index.html")
    end)
    addEventHandler("onClientBrowserDocumentReady", browser, function()
        ready = true
    end)
end
addEventHandler("onClientResourceStart", resourceRoot, build)

installAjax = function()
    if not browser then return end
    setBrowserAjaxHandler(browser, "invAction", function(get, post)
        local p = post or {}
        local g = get or {}
        onAction(p.act or g.act, p.a or g.a, p.b or g.b)
        return "ok"
    end)
end

local function render()
    if not (browser and shown) then return end
    dxDrawImage(0, 0, sW, sH, browser, 0, 0, 0, tocolor(255,255,255,255), true)
end

-- CEF gets no cursor from a dxDrawImage surface; it has to be injected.
local function onMove(_, _, ax, ay)
    if browser and shown then injectBrowserMouseMove(browser, ax, ay) end
end
local function onClick(button, state)
    if not (browser and shown) then return end
    local b = (button == "left" and "left") or (button == "right" and "right") or nil
    if not b then return end
    if state == "down" then injectBrowserMouseDown(browser, b)
    else injectBrowserMouseUp(browser, b) end
end

-- --------------------------------------------------------------------------
-- show / hide
-- --------------------------------------------------------------------------
--- Lets inventory_c.lua know the CEF panel owns the screen, so it will not
--- also reveal the legacy GUI when the server answers RequestShowInventory.
function XMP_UI_ACTIVE() return shown end

function UI_show()
    if shown or not (browser and ready) then return end
    shown = true
    removeEventHandler("onClientRender", root, render)
    addEventHandler("onClientRender", root, render)
    addEventHandler("onClientCursorMove", root, onMove)
    addEventHandler("onClientClick", root, onClick)
    showCursor(true)
    focusBrowser(browser)
    executeBrowserJavascript(browser, "INV.show()")
    push(true)
end

function UI_hide()
    if not shown then return end
    shown = false
    if browser and ready then executeBrowserJavascript(browser, "INV.hide()") end
    removeEventHandler("onClientRender", root, render)
    removeEventHandler("onClientCursorMove", root, onMove)
    removeEventHandler("onClientClick", root, onClick)
    showCursor(false)
    if browser then focusBrowser(nil) end
    cache = nil
end

function UI_toggle()
    if shown then UI_hide() else
        if getElementData(localPlayer, "loggedIn") ~= true then return end
        if isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() then return end
        UI_show()
    end
end

-- refresh whenever the server sends new inventory data
setTimer(function() if shown then push(false) end end, 400, 0)

addEventHandler("onClientResourceStop", resourceRoot, function()
    UI_hide()
    if isElement(browser) then destroyElement(browser) end
end)
