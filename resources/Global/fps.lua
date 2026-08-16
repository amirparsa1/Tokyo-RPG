local function updateFPS(msSinceLastFrame)
    fps = (1 / msSinceLastFrame) * 1000
end
addEventHandler("onClientPreRender", root, updateFPS)
    
addCommandHandler("fps",
function (thePlayer, command)
    exports["notf"]:addNotification("FPS Shoma : ("..math.ceil(fps)..")" , 'info')
end)