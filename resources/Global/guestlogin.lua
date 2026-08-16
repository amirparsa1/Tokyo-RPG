function denyPlayer(oldNick,newNick)
	cancelEvent()
end
addEventHandler("onPlayerChangeNick",getRootElement(),denyPlayer)

local ids = {}

addEventHandler("onPlayerJoin", root, function()
	for i=1,900000 do 
        if not ids[i] then 
			ids[i] = i
            setPlayerName(source,"TheNight@"..i)
			setElementData(source, "levelPlayer", "N/A")
            break 
        end
    end 
end)