local range = 30

addEventHandler ( "onClientPlayerVoiceStart", root, 
function() 
    if (source and isElement(source) and getElementType(source) == "player" and getElementData(source, "loggedIn") == true) then 
		if getElementData(source,"GV") then
			if isPlayerVoiceMuted ( source ) then
				cancelEvent()
			end
            voicePlayers[source] = true 
			return
		end
        local sX, sY, sZ = getElementPosition(localPlayer) 
        local rX, rY, rZ = getElementPosition(source) 
        local distance = getDistanceBetweenPoints3D(sX, sY, sZ, rX, rY, rZ) 
        if distance <= range then 
            voicePlayers[source] = true 
		elseif getElementData(localPlayer,"CallingTo") and getElementData(localPlayer,"CallingTo") == getPlayerName(source) then
			if isPlayerVoiceMuted ( source ) then
				cancelEvent()
				return
			end
            voicePlayers[source] = true 
		elseif getElementData(localPlayer,"InShonod") then
			if isPlayerVoiceMuted ( source ) then
				cancelEvent()
				return
			end
            voicePlayers[source] = true 
        else 
			cancelEvent()--This was the shit 
        end 
    end 
end 
) 