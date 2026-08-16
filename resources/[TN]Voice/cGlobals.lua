SETTINGS_REFRESH = 2000 -- Interval in which team channels are refreshed, in MS.
bShowChatIcons = true

voicePlayers = {}
globalMuted = {}

--[[
local nearbyPlayers = {} 
  
addEventHandler("onPlayerVoiceStart", root, 
    function() 
        local r = 40 
        local posX, posY, posZ = getElementPosition(source) 
        local chatSphere = createColSphere(posX, posY, posZ, r) 
        nearbyPlayers = getElementsWithinColShape(chatSphere, "player") 
        destroyElement(chatSphere) 
        local empty = exports.voice:getNextEmptyChannel() 
        exports.voice:setPlayerChannel(source, empty) 
        for index, player in ipairs(nearbyPlayers) do 
            exports.voice:setPlayerChannel(player, empty) 
        end 
    end 
) 

addEventHandler("onPlayerVoiceStop", root, 
    function() 
        exports.voice:setPlayerChannel(source) 
        for index, player in ipairs(nearbyPlayers) do 
            exports.voice:setPlayerChannel(player) 
        end 
        nearbyPlayers = {} 
    end 
) 
]]
local range = 15

-- and localPlayer ~= source 

addEventHandler ( "onClientPlayerVoiceStart", root, 
function() 
    if (source and isElement(source) and getElementType(source) == "player" and getElementData(source, "loggedIn") == true ) then 
		if getElementDimension(source) ~= getElementDimension(localPlayer) then
			cancelEvent()
			return
		end
		if getElementInterior(source) ~= getElementInterior(localPlayer) then
			cancelEvent()
			return
		end
		if getElementData(source,"eventMember") then
			if not getElementData(source,"organizer") then
				cancelEvent()
				return
			end
		end
    if (source and isElement(source) and getElementType(source) == "player") then 
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
			if isPlayerVoiceMuted ( source ) then
				cancelEvent()
				return
			end
				voicePlayers[source] = true 
			elseif getElementData(localPlayer,"CallingTo") and getElementData(localPlayer,"CallingTo") == getPlayerName(source) then
				if isPlayerVoiceMuted ( source ) then
					cancelEvent()
					return
				end
				voicePlayers[source] = true 
			elseif getElementData(localPlayer,"InShonod") and getElementData(localPlayer, "loggedIn") == true then
				if isPlayerVoiceMuted ( source ) then
					cancelEvent()
					return
				end
				voicePlayers[source] = true 
			else
				cancelEvent()--This was the shit 
			end 
			
		else
			local myBisim = tonumber(getElementData(localPlayer, "inBisim"))
			local orBisim = tonumber(getElementData(source, "inBisim"))
        	if orBisim > 1 and orBisim > 1 then 
        		if myBisim == orBisim then 
        		    voicePlayers[source] = true 
				else
					cancelEvent()--This was the shit 
        		end 
			else
				cancelEvent()
			end
		end

    end 
end 
) 

addEventHandler ( "onClientPlayerVoiceStop", root,
	function()
		voicePlayers[source] = nil
	end
)

addEventHandler ( "onClientPlayerQuit", root,
	function()
		voicePlayers[source] = nil
	end
)
---

function checkValidPlayer ( player )
	if not isElement(player) or getElementType(player) ~= "player" then
		outputDebugString ( "is/setPlayerVoiceMuted: Bad 'player' argument", 2 )
		return false
	end
	return true
end

---

setTimer ( 
	function()
		bShowChatIcons = getElementData ( resourceRoot, "show_chat_icon", show_chat_icon )
	end,
SETTINGS_REFRESH, 0 )