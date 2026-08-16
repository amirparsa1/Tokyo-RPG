gChatting = false
 
function chatCheckPulse()
    local chatState = isChatBoxInputActive() or isConsoleActive()
 
    if chatState ~= gChatting then
        if chatState then
            triggerServerEvent("playerChatting", getLocalPlayer())
        else
            triggerServerEvent("playerNotChatting", getLocalPlayer())
        end
        gChatting = chatState
    end
    setTimer( chatCheckPulse, 250, 1)
end
addEventHandler ( "onClientResourceStart", getRootElement(), chatCheckPulse )
addEventHandler ( "onClientPlayerJoin", getRootElement(), chatCheckPulse )


