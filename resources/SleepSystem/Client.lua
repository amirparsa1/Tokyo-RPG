addEventHandler("onClientKey",root,function(button, press)
    if (press) and button ~= "t" and not isChatBoxInputActive() and not isConsoleActive() then
        if getElementData(getLocalPlayer(),"inSleep") == true then
            triggerServerEvent("doUnSleep",getLocalPlayer(),getLocalPlayer())
        end
    end
end)
