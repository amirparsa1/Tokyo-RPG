local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local nowLive = false

addCommandHandler("news",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Khabar Negar Bashid!", thePlayer, 255, 255, 255, true)
			return false
		end
		
		local theVehicle = getPedOccupiedVehicle (thePlayer)
		if theVehicle then
			local vehid = getElementID ( theVehicle )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
				local message = table.concat({ ... }, " ")
				for k, hame_Playera	in ipairs (getElementsByType("player")) do	
					if #message > 0 then
						if getElementData(hame_Playera, "loggedIn") == true then
							outputChatBox("#FF4500[KhabarNegar " .. getPlayerName(thePlayer) .. "]: #ffffff" .. message, hame_Playera, 255, 255, 255, true)
						end
					end
				end 
			else
				outputChatBox("#ff0000✖️ Baraye Inkar Bayad Dakhel Khodro Haye Faction Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
)

addCommandHandler("live",
function(thePlayer, cmd, ...)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
			if nowLive ~= false then
				outputChatBox("#ff0000✖️ Dar Hal Hazer Yek Live Dar Hal Pakhsh Ast, Sabr Konid Ta Tamam Shavad!", thePlayer, 255, 255, 255, true)
				return false
			end
			if ... then
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				if theVehicle then
					local vehid = getElementID ( theVehicle )
					if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
						local message = table.concat({ ... }, " ")
						for k, hame_Playera	in ipairs (getElementsByType("player")) do	
							if #message > 0 then
								if getElementData(hame_Playera, "loggedIn") == true then
									nowLive = true
									outputChatBox("#00FFF3[LIVE]: #ffffffLive Az Khabar Negar #00FFF3" .. getPlayerName(thePlayer) .. " #ffffff, Live Name: #00FFF3" .. message .."", hame_Playera, 255, 255, 255, true)
									setElementData(thePlayer, "inLive", true, false)
								end		
							end
						end
					else
						outputChatBox("#ff0000✖️ Baraye Inkar Bayad Dakhel Khodro Haye Faction Bashid!", thePlayer, 255, 255, 255, true)
					end
				end
			else
				outputChatBox("#C0C0C0Bezan: /live <Live-Name>", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Khabar Negar Bashid!", thePlayer, 255, 255, 255, true)
		end
	end
end)

addCommandHandler("stoplive",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Khabar Negar Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end

	if nowLive == false then
		outputChatBox("#ff0000✖️ Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		return false
	end

	nowLive = false
	outputChatBox("#00FFF3[LIVE]: #ffffffLive Tavasot #00FFF3"..getPlayerName(thePlayer).." #ffffffBe Payan Resid, Rooz Khoobi Dashte Bashid!", hame, 255, 255, 255, true)
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
		if getElementData(hame_Playera, "loggedIn") == true then
			setElementData(hame_Playera, "inLive", false, false)
		end
	end
	
end
)

addEventHandler ( "onPlayerQuit", root, 
function(quitType)
	if getElementData(source, "inLive") == true then
		setElementData(source, "inLive", false, false)
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 7 then
					outputChatBox("#00FFF3[LIVE]: #ffffffKhabar Negar #00FFF3"..getPlayerName(source).." #ffffffAz Server Kharej Shod! ( "..quitType.." )", hame_Playera, 255, 255, 255, true)
				else
					outputChatBox("#00FFF3[LIVE]: #ffffffMehman #00FFF3"..getPlayerName(source).." #ffffffAz Server Kharej Shod! ( "..quitType.." )", hame_Playera, 255, 255, 255, true)
				end
			end
		end
	end
end
)

addCommandHandler("mh",
function(thePlayer, cmd, ...)
	if nowLive == false then
		outputChatBox("#ff0000✖️ Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		return false
	end

	if getElementData(thePlayer, "inLive") == true then
		
		local theVehicle = getPedOccupiedVehicle (thePlayer)
		if theVehicle then
			local vehid = getElementID ( theVehicle )
			if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
				local message = table.concat({ ... }, " ")
				for k, hame_Playera	in ipairs (getElementsByType("player")) do	
					if getElementData(hame_Playera, "loggedIn") == true then
						if #message > 0 then
							if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
								outputChatBox("#FF4500[Gozareshgar "..getPlayerName(thePlayer).."]: #ffffff" .. message, hame_Playera, 255, 255, 255, true)
							else
								outputChatBox("#FF4500[Mehman "..getPlayerName(thePlayer).."]: #ffffff" .. message, hame_Playera, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000✖️ Baraye Inkar Bayad Dakhel Khodro Haye Faction Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
	else
		outputChatBox("#ff0000✖️ Shoma Dar Barname Zende Nistid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("imh",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Khabar Negar Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end

	if nowLive == false then
		outputChatBox("#ff0000✖️ Dar Hal Hazer Hich Live'e Darhal Pakhsh Nist!", thePlayer, 255, 255, 255, true)
		return false
	end

	local theVehicle = getPedOccupiedVehicle (thePlayer)
	if theVehicle then
		local vehid = getElementID ( theVehicle )
		if vehid == "Nrcar1" or vehid == "Nrcar2" or vehid == "Nrcar3" or vehid == "Nrcar4" or vehid == "Nrcar5" or vehid == "Nrcar6" or vehid == "Nrcar7" or vehid == "Nrheli1" or vehid == "Nrheli2" then
			local find = miscSys:findPlayer ( player )
			if find then
				local findVehicle = getPedOccupiedVehicle (find)
				if findVehicle == theVehicle then
					local targetPlayer = getPlayerName ( find )
					if getElementData(find, "inLive") ~= true then
						setElementData(find, "inLive", true, false)
						for k, hame_Playera	in ipairs (getElementsByType("player")) do
							if getElementData(hame_Playera, "loggedIn") == true then
								if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == 7 then
									outputChatBox("#00FFF3[LIVE]: #ffffffKhabar Negar #00FFF3"..getPlayerName(find).." #ffffffBe LIVE Vared Shod!", hame_Playera, 255, 255, 255, true)
								else
									outputChatBox("#00FFF3[LIVE]: #ffffffMehman #00FFF3"..getPlayerName(find).." #ffffffBe LIVE Vared Shod!", hame_Playera, 255, 255, 255, true)
								end
							end
						end
					else
						outputChatBox("#ff0000✖️ In Player Dar Barname Zende Mibashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ In Player To Khodro'e Shoma Nist!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000✖️ Invite Anjam Nashod!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000✖️ Baraye Inkar Bayad Dakhel Khodro Haye Faction Bashid!", thePlayer, 255, 255, 255, true)
		end
	end
end
)