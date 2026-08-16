-- PuB By @KhodeOxYGeM : )
local accSys = exports["Accounts-System"]
local miscSys = exports["Misc"]

addCommandHandler("report",
function (thePlayer, command, ...)
	if (...) then
	if getElementData(thePlayer, "needReport") ~= true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTicketBan")) < 1 then
			local message = table.concat({ ... }, " ")
			outputChatBox("#00FF7FServer: Darkhaste Komak'e Shoma Baraye Ma Ersal Shod.", thePlayer, 255, 255, 255, true)

			for index, sendToAdmin in ipairs( getElementsByType("player") ) do 
				if getElementData(sendToAdmin, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(sendToAdmin), "pAdmin")) > 0 then

						if #message > 0 then
							outputChatBox("#FF3399╔═════════════◤ NEW REPORT ◥═════════════╗", sendToAdmin, 255, 255, 255, true)
							outputChatBox("Name Player "..getPlayerName(thePlayer).." ("..getElementData(thePlayer,"TarafID").." )", sendToAdmin, 255, 255, 255, true)
							outputChatBox("Moshkel Player: "..message.." ", sendToAdmin, 255, 255, 255, true)
							outputChatBox("Jahat Didan Report Haye Baz Az #FF3399/reports#ffffff Estefade Konid.", sendToAdmin, 255, 255, 255, true)
							outputChatBox("#FF3399╚═══════════════◣          ◢═════════════╝", sendToAdmin, 255, 255, 255, true)
							setElementData(thePlayer, "needReport", true, false)
						end
					end
				end
			end
		else
			outputChatBox("#99FFFF(Ticket-System): #FFFFFFShoma Be Modat #FF0000"..tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTicketBan")).." #FFFFFFDaghighe Az Ersal Hargone Report/HelpMe Mahrom Shodid", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Sabr Konid Ta Report Ghabli Pasokh Dade Shavad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Syntax: /report <Reason>", thePlayer, 255, 255, 255, true)
	end
end)
addCommandHandler("al",
function (thePlayer, command, ...)
	if getElementData(thePlayer, "loggedIn") == true then
	if (...) then
		local message = table.concat({ ... }, " ")
		local onReporting = getElementData(thePlayer, "onReporting")
		if getElementData(thePlayer, "onReporting") ~= nil then
			for index, talkToAdmin in ipairs( getElementsByType("player") ) do 
				if tostring(onReporting) == getPlayerName(talkToAdmin) then
					if talkToAdmin then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
							outputChatBox("#339DFF[Admin "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToAdmin, 255, 255, 255, true)
							outputChatBox("#339DFF[Admin "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
						else
							outputChatBox("#339DFF[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToAdmin, 255, 255, 255, true)
							outputChatBox("#339DFF[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
						end
					end
				end
			end
		else
			outputChatBox("#339DFF[Error]: #ffffffShoma Dar Hal Report Nistid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /al <Message>", thePlayer, 255, 255, 255, true)
	end
	end
end)

addCommandHandler("reports",
function (thePlayer, command)
if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		outputChatBox("#FF3399╔═════════════◤ ALL REPORT ◥═════════════╗", thePlayer, 255, 255, 255, true)
		for index, needReports in ipairs( getElementsByType("player") ) do 
			if getElementData(needReports, "needReport") == true then
				outputChatBox("#ffff00[Report-System]: #ffffffPlayer #ffff00"..getPlayerName(needReports).." ("..getElementData(needReports, "TarafID")..") #ffffffReport Dade Ast!", thePlayer, 255, 255, 255, true)
				
			end
		end
		outputChatBox("#FF3399╚═══════════════◣             ◢═══════════════╝", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Admin Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end)

addCommandHandler("openreport",
function (thePlayer, command, player)
if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needReport") == true then
				setElementData(find, "needReport", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				setElementData(find, "onReporting", tostring(myName), false)
				setElementData(thePlayer, "onReporting", tostring(yourName), false)
				outputChatBox("#00ff00[Report-System]: #ffffffShoma Report'e Player "..yourName.." Ra Baz Kardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00Admin "..myName.." Report'e Shoma Ra Baz Kard!", find, 255, 255, 255, true)
				outputChatBox("#00FFFFBaraye Sohbat Ba Admin (Bezan: /al <Message>)", find, 255, 255, 255, true)
				for index, sendToAdmins in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToAdmins, "loggedIn") == true then
						if sendToAdmins ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToAdmins), "pAdmin")) > 0 then
								outputChatBox("#ff4300[Admin-Warn]: #ffffffAdmin #ff4300"..myName.." #ffffffReport'e Player #ff4300"..yourName.." #ffffffRa Baz Kard!", sendToAdmins, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffIn Player Darkhaste Komaki Nadarad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Admin Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end)

addCommandHandler("closereport",
function (thePlayer, command, player)
if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needReport") == true then
				setElementData(find, "needReport", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#ff0000[Report-System]: #ffffffShoma Report'e Player "..yourName.." Ra Bastid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#8B0000Admin "..myName.." Report'e Shoma Ra Bast!", find, 255, 255, 255, true)
				for index, sendToAdmins in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToAdmins, "loggedIn") == true then
						if sendToAdmins ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToAdmins), "pAdmin")) > 0 then
								outputChatBox("#ff4300[Admin-Warn]: #ffffffAdmin #ff4300"..myName.." #ffffffReport'e Player #ff4300"..yourName.." #ffffffRa Bast!", sendToAdmins, 255, 255, 255, true)
							end
						end
					end
				end
			elseif getElementData(find, "onReporting") ~= nil then
				setElementData(find, "onReporting", nil, false)
				setElementData(thePlayer, "onReporting", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#ff0000[Report-System]: #ffffffShoma Darkhaste Komak'e Player "..yourName.." Ra Bastid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#8B0000Admin "..myName.." Report'e Shoma Ra Bast!", find, 255, 255, 255, true)
				for index, sendToAdmins in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToAdmins, "loggedIn") == true then
						if sendToAdmins ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToAdmins), "pAdmin")) > 0 then
								outputChatBox("#ff4300[Admin-Warn]: #ffffffAdmin #ff4300"..myName.." #ffffffReport'e Player #ff4300"..yourName.." #ffffffRa Bast!", sendToAdmins, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffIn Player Darkhaste Komaki Nadarad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Admin Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end)
