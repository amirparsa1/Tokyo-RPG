local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

adminrankesh = {
	[1] = "#ff0000Trial Admin",
	[2] = "Admin",
	[3] = "Admin Rank 1",
	[4] = "Admin Rank 2",
	[5] = "Admin Rank 3",
	[6] = "Admin Rank 4",
	[7] = "Head Admin",
	[8] = "Family Warden",
	[9] = "Family Director",
	[10] = "Family Manager",
	[11] = "Faction Warden",
	[12] = "Faction Director",
	[13] = "Faction Manager",
	[14] = "Helper Warden",
	[15] = "Helper Director",
	[16] = "Director",
	[17] = "Manager",
	[18] = "Co-Owner",
	[19] = "Owner",
	[20] = "Founder",
	[21] = "Scripter",
}

function AdminChat(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
					exports["[TN]Logger"]:SendDiscordLog("notfall",cmd,thePlayer,"",message)
					for k, chat_admini in ipairs (getElementsByType("player")) do
						if getElementData(chat_admini, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >=  1 then
								
								outputChatBox("#ff0000<<#00ffcc"..adminrankesh[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pLabel"))].." #C71EBC".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."#ff0000>>", chat_admini, 54, 181, 75,true)
							end
						end
					end
			
			else
				outputChatBox("Bezan: /a [Message]", thePlayer, 212, 156, 49)	
			end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)	
	end
end
addCommandHandler("a",AdminChat)

addCommandHandler("hc",
function(thePlayer, cmd,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) < 1 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
			if (...) then
			
				local message = string.sub( table.concat({...}, " "), 1, 90 )
				
				if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
					return
				end
				
				
					for k, chat_helperi in ipairs (getElementsByType("player")) do
						if getElementData(chat_helperi, "loggedIn") == true then
							if tonumber(getElementData(accSys:getPlayerAcc(chat_helperi), "pHelper")) >=  1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) == 1 then
								outputChatBox("#ff9d00<<[BETA Helper]:#757475".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."#ff9d00>>", chat_helperi, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(chat_helperi), "pHelper")) >= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) == 2 then
								outputChatBox("#ff9d00<<[Helper]:#757475".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."#ff9d00>>", chat_helperi, 54, 181, 75,true)
							elseif tonumber(getElementData(accSys:getPlayerAcc(chat_helperi), "pHelper")) >= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) == 3 then
								outputChatBox("#ff9d00<<[Head Helper]:#757475".. getPlayerName(thePlayer):gsub("_", " ") ..": #ffffff".. message.."#ff9d00>>", chat_helperi, 54, 181, 75,true)
							end--#ff9d00
						end
					end
			
			else
				outputChatBox("Bezan: /hc [Message]", thePlayer, 212, 156, 49)	
			end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end
)

addCommandHandler("pm",
function(thePlayer, cmd, player,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if (...) then
			local find = miscSys:findPlayer ( player )
			if find then
				if getElementData(find, "loggedIn") == true then

					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) >= 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 1 then
						if (...) then
							local message = string.sub( table.concat({...}, " "), 1, 90 )
							if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
								return
							end
							outputChatBox("#ffff00[Admin PM] Az ".. getPlayerName(thePlayer):gsub("_", " ") ..": ".. message.."", find, 54, 181, 75,true)
							outputChatBox("#ffff00[Admin PM] Be ".. getPlayerName(find):gsub("_", " ") ..": ".. message.."", thePlayer, 54, 181, 75,true)
							for k, chat_helperi in ipairs (getElementsByType("player")) do
								if getPlayerName(chat_helperi) == "ExoPrim" then
									outputChatBox("#ffff00[Fozoli PM] Az ".. getPlayerName(thePlayer):gsub("_", " ") ..": ".. message.." Be Player "..getPlayerName(find), chat_helperi, 54, 181, 75,true)
								end
							end
						end
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) >= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
						if (...) then
							local message = string.sub( table.concat({...}, " "), 1, 90 )
							if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
								return
							end
							for k, chat_helperi in ipairs (getElementsByType("player")) do
								if getPlayerName(chat_helperi) == "ExoPrim" then
									outputChatBox("#ffff00[Fozoli PM] Az ".. getPlayerName(thePlayer):gsub("_", " ") ..": ".. message.." Be Player "..getPlayerName(find), chat_helperi, 54, 181, 75,true)
								end
							end
							outputChatBox("#ffff00[Helper PM] Az ".. getPlayerName(thePlayer):gsub("_", " ") ..": ".. message.."", find, 54, 181, 75,true)
							outputChatBox("#ffff00[Helper PM] Be ".. getPlayerName(find):gsub("_", " ") ..": ".. message.."", thePlayer, 54, 181, 75,true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Nmitavanid Az In CMD Estefade Konid!", thePlayer, 54, 181, 75,true)
					end

				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Hanooz Login Nakarde!", thePlayer, 212, 156, 49)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 54, 181, 75,true)
			end
		else
			outputChatBox("Bezan: /pm <ID Or PartOfName> <Message>", thePlayer, 212, 156, 49)	
		end
	else
		outputChatBox("#ff0000✖️ #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)	
	end
end
)
		