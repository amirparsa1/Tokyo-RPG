
-- ============================================================================
--  SECURITY FIX (bugfix pass 1)
--  The previous version of this file exposed a remote-command backdoor:
--
--      addEvent("executeCommand", true)
--      addEventHandler("executeCommand", getRootElement(), function(cmd, ...)
--          executeCommandHandler(cmd, client, ...)   -- ANY command, no filter
--      end)
--
--  Any client could trigger it and run ANY server command as themselves --
--  including admin commands (ban / setmoney / giveweapon / ...).
--  It is now replaced by a strict allow-list.
-- ============================================================================

-- Only these commands may be invoked remotely by the radar UI.
local ALLOWED_COMMANDS = {
    ["toghud"] = true,
}

addEvent("executeCommand", true)
addEventHandler("executeCommand", root, function(cmd, ...)
    -- 'client' is nil when the event was triggered server-side; reject those.
    if not client or not isElement(client) then return end
    if type(cmd) ~= "string" then return end

    if not ALLOWED_COMMANDS[cmd:lower()] then
        outputDebugString(
            ("[TN]Radar: blocked remote command '%s' from %s")
                :format(tostring(cmd), getPlayerName(client)), 2)
        return
    end

    executeCommandHandler(cmd, client, ...)
end)

addEventHandler("onPlayerJoin", root, function()
    toggleControl(source, "radar", false)
    unbindKey(source, "F11")
end)
