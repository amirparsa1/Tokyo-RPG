--[[antiSpam = {} 

function antiChatSpam() 
	if isTimer(antiSpam[source]) then
		cancelEvent()  
		outputChatBox("#00ff00Player "..getPlayerName(source).." Be Dalile Spam Tavasot Anti Spam Mute Shod!", source, 255, 255, 0,true) 
		setPlayerMuted(source, true)
		setTimer ( autoUnmute, 5000, 1, source)
	else
		antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 5000, 1, source) 
	end
end
addEventHandler("onPlayerChat", root, antiChatSpam)


function autoUnmute ( player )
	if ( isElement ( player ) and isPlayerMuted ( player ) ) then
		setPlayerMuted ( player, false )
		outputChatBox ("#ff6600"..getPlayerName ( player ).."  #00ff00 Shoma UnMute Shodid! Lotfan Dige Spam Nade",player, 255, 255, 0,true )
	end
end

addCommandHandler("unsp",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		return false
	end
		
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			setPlayerMuted ( find, false )
			outputChatBox ("#ff6600"..getPlayerName ( find ).."  #00ff00 Shoma UnMute Shodid! Lotfan Dige Spam Nade",find, 255, 255, 0,true )
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /unmutespam <PartOfName/ID> ", thePlayer, 0, 255, 0,true)
	end
end)]]