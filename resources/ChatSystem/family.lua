local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local vehSys = exports["[TN]DS"]
local famSys = exports["[TN]Family"]

function RGBToHex(red, green, blue, alpha)
	if red == nil or red == false then red = 0 end 
	if green == nil or green == false then green = 0 end 
	if blue == nil or blue == false then blue = 0 end 

	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end
end
local rankid = {
	[0] = {"frank0"},
	[1] = {"frank1"},
	[2] = {"frank2"},
	[3] = {"frank3"},
	[4] = {"frank4"},
	[5] = {"frank5"},
	[6] = {"frank6"},
	[7] = {"frank7"},
	[8] = {"frank8"},
	[9] = {"frank9"},
	[10] = {"frank10"},
}
function FamilyChat(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) == 0 then
			return false
		end
		if (...) then
			local message = string.sub( table.concat({...}, " "), 1, 90 )
			if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
				return
			end
			for k, chat_admini in ipairs (getElementsByType("player")) do
				if getElementData(chat_admini, "loggedIn") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) == tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pFamiId")) then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime")) < 1 then
							local hex = RGBToHex(famSys:FamilyInfo(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"),"R"),famSys:FamilyInfo(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"),"G"),famSys:FamilyInfo(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"),"B"))
                        	outputChatBox(hex.."(( ["..famSys:FamilyInfo(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"),"frank"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))).."] "..getPlayerName(thePlayer)..":#FFFFFF "..message.." "..hex.."))", chat_admini, 255, 255, 255, true)
						else
							local cheghadMondMuteTime = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMuteTime"))				
							outputChatBox("#ff0000Shoma Ta "..cheghadMondMuteTime.." Daghighe Digar Mute Hastid!", thePlayer, 255, 255, 255, true)
							
						end
                    end
				end
			end
		
		else
			outputChatBox("Bezan: /fc [Message]", thePlayer, 212, 156, 49)	
		end

	end
end
addCommandHandler("fc",FamilyChat)
addCommandHandler("FamilyChat",FamilyChat)



