local accSys = exports["[Atis]Accounts"] -- Public By Arlixx 
local miscSys = exports["[Atis]Misc"] -- Telegram: @EnixGame
local globalSys = exports["[Atis]Global"]

function HelperWarn ( warn )
	for index,sendToHelper in ipairs(getElementsByType("player")) do
		if getElementData(sendToHelper, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(sendToHelper), "pHelper")) > 0 then
				outputChatBox(warn, sendToHelper, 255, 255, 255, true )
			end
		end
	end
end

addCommandHandler("helpme",
function (thePlayer, command, ...)
	if (...) then
		if getElementData(thePlayer, "needHelp") ~= true then
			local message = table.concat({ ... }, " ")
			outputChatBox("#00ff00[Helper-System]: #ffffffDarkhaste Komake Shoma Baraye Helper Ha Ferestade Shod!", thePlayer, 255, 255, 255, true)
			for index, sendToHelper in ipairs( getElementsByType("player") ) do 
				if getElementData(sendToHelper, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(sendToHelper), "pHelper")) > 0 then
						if #message > 0 then
							outputChatBox("#ffff00[Helper-System]: #ffffffPlayer #ffff00"..getPlayerName(thePlayer).." ("..getElementData(thePlayer, "TarafID")..") #ffffff Ba Reason: #ffff00"..message.." #ffffffDarkhast Komak Kard", sendToHelper, 255, 255, 255, true)
						end
					end
				end
			end
			setElementData(thePlayer, "needHelp", true, false)
			outputChatBox("#00ff00[Helper-System]: #ffffffDarkhaste Komake Shoma Baraye Helper Ha Ferestade Shod!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Error: Shoma Yek HelpMe Dadeid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ffff00SYNTAX: /helpme [Help Reason]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hl",
function (thePlayer, command, ...)
	if (...) then
		local message = table.concat({ ... }, " ")
		local onHelping = getElementData(thePlayer, "onHelping")
		if getElementData(thePlayer, "onHelping") ~= nil then
			for index, talkToHelper in ipairs( getElementsByType("player") ) do 
				if tostring(onHelping) == getPlayerName(talkToHelper) then
					if talkToHelper then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
							outputChatBox("#ffff00[Helper "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#ffff00[Helper "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
							globalSys:outputFozol( "#ffff00[FZ] "..getPlayerName(thePlayer).." /hl "..getPlayerName(talkToHelper).." : #ffffff"..message.."" )
						else
							outputChatBox("#ffff00[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#ffff00[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
							globalSys:outputFozol( "#ffff00[FZ] "..getPlayerName(thePlayer).." /hl "..getPlayerName(talkToHelper).." : #ffffff"..message.."" )
						end
					end
				end
			end
		else
			outputChatBox("#ff0000[Helper-System]: #ffffffShoma Darhal Help Nistid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ffff00SYNTAX: /hl [message]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("helps",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		for index, needHelps in ipairs( getElementsByType("player") ) do 
			if getElementData(needHelps, "needHelp") == true then
				outputChatBox("#ffff00[Helper-System]: #ffffffPlayer #ffff00"..getPlayerName(needHelps).." ("..getElementData(needHelps, "TarafID")..") #ffffffNiaz Be Komak Darad!", thePlayer, 255, 255, 255, true)
			end
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("openhelp",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needHelp") == true then
				setElementData(find, "needHelp", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				setElementData(find, "onHelping", tostring(myName), false)
				setElementData(thePlayer, "onHelping", tostring(yourName), false)
				outputChatBox("#00ff00[Helper-System]: #ffffffShoma Darkhaste Helpe Player "..yourName.." Ra Baz Kardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00[Helper-System]: #ffffffHelper "..myName.." Darkhaste Helpe Shoma Ra Baz Kard, Ba /hl <message> Sohbat Konid!", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#ff4300[Helper-Warn]: #ffffffHelper #ff4300"..myName.." #ffffffDarkhaste Helpe Player #ff4300"..yourName.." #ffffffRa Baz Kard!", sendToHelpers, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000[Helper-System]: #ffffffIn Player Darkhaste Helpi Nakarde Ast!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("closehelp",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needHelp") == true then
				setElementData(find, "needHelp", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#ff0000[Helper-System]: #ffffffShoma Darkhaste Helpe Player "..yourName.." Ra Bastid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000[Helper-System]: #ffffffHelper "..myName.." Darkhaste Helpe Shoma Ra Bast", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#ff4300[Helper-Warn]: #ffffffHelper #ff4300"..myName.." #ffffffDarkhaste Helpe Player #ff4300"..yourName.." #ffffffRa Bast!", sendToHelpers, 255, 255, 255, true)
							end
						end
					end
				end
			elseif getElementData(find, "onHelping") ~= nil then
				setElementData(find, "onHelping", nil, false)
				setElementData(thePlayer, "onHelping", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#ff0000[Helper-System]: #ffffffShoma Darkhaste Helpe Player "..yourName.." Ra Bastid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000[Helper-System]: #ffffffHelper "..myName.." Darkhaste Helpe Shoma Ra Bast", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#ff4300[Helper-Warn]: #ffffffHelper #ff4300"..myName.." #ffffffDarkhaste Helpe Player #ff4300"..yourName.." #ffffffRa Bast!", sendToHelpers, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000[Helper-System]: #ffffffIn Player Darkhaste Helpi Nakarde Ast!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hgoto",
function (thePlayer, command)
	local yaruKie = getElementData(thePlayer, "onHelping")
	if yaruKie ~= nil then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) ~= 0 then
			outputChatBox("#ff0000[Error]: #ff0000Akhe To Jail Mikhay Goto Koni?!", thePlayer, 255, 255, 255, true)
			return
		end
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
			for index, yaru in ipairs( getElementsByType("player") ) do 
				if tostring(yaruKie) == getPlayerName(yaru) then
					x , y , z = getElementPosition(yaru)
					int = getElementInterior(yaru)
					dim = getElementDimension(yaru)
					xx , yy, zz = getElementPosition(thePlayer)
					myint = getElementInterior(thePlayer)
					mydim = getElementDimension(thePlayer)
					setElementData(thePlayer, "canGoBack", true, false)
					setTimer(
					function ()
						setElementPosition(thePlayer, x + 2, y, z)
						setElementInterior(thePlayer, int)
						setElementDimension(thePlayer, dim)
						outputChatBox("#00ff00[Helper-System]: #ffffffHelper "..getPlayerName(thePlayer).." Be Shoma Goto Kard!", yaru, 255, 255, 255, true)
					end,100 ,1 )
				end
			end
		end
	end
end)

addCommandHandler("hback",
function (thePlayer, command)
	local canGoBack = getElementData(thePlayer, "canGoBack")
	if canGoBack == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) ~= 0 then
			outputChatBox("#ff0000[Error]: Bug Nazan Martike!", thePlayer, 255, 255, 255, true)
			return
		end
		setElementData(thePlayer, "canGoBack", nil, false)
		setElementPosition(thePlayer, xx, yy, zz)
		setElementInterior(thePlayer, myint)
		setElementDimension(thePlayer, mydim)
		outputChatBox("#00ff00[Helper-System]: #ffffffShoma Be Makan Avalie Khod Goto Kardid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hv",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if vehKardi == nil or not vehKardi then
			vehKardi = true
			local x, y, z = getElementPosition(thePlayer)
			local createdVehicle = createVehicle(551, x + 2, y, z)
			local myName = getPlayerName(thePlayer)
			setElementData(createdVehicle, "helper_owner", tostring(myName))
			setElementData(createdVehicle, "veh_ownere", tostring(helper_veh))
			setVehicleColor( createdVehicle, 62 , 82 , 95, 0, 255, 71 )
			outputChatBox("#00ff00[Helper-System]: #ffffffShoma Yek Mashin Helperi Veh Kardid!", thePlayer, 255, 255, 255, true)
			HelperWarn("#00ff00[Helper-System]: #ffffffHelper "..myName.." Yek Mashin Helperi #00ff00Sakht#ffffff!")
		elseif vehKardi == true then
			outputChatBox("#ff0000[Helper-System]: #ffffffShoma Yek Mashin Az Qabl Veh Karde Ied!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("dhv",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if vehKardi == true then
			vehKardi = nil
			local myName = getPlayerName(thePlayer)
			for index, mashinHelperi in ipairs( getElementsByType("vehicle") ) do 
				if getElementData(mashinHelperi, "helper_owner") == getPlayerName(thePlayer) then
					destroyElement(mashinHelperi)
				end
			end
			outputChatBox("#00ff00[Helper-System]: #ffffffShoma Yek Mashin Helperi Destroy Kardid!", thePlayer, 255, 255, 255, true)
			HelperWarn("#00ff00[Helper-System]: #ffffffHelper "..myName.." Mashin Helperi Ra #ff0000Destroy#ffffff Kard!")
		else
			outputChatBox("#ff0000[Helper-System]: #ffffffShoma Mashini Veh Nakarde Ied!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("dhvall",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 2 then
		for index, mashinHelperiHa in ipairs( getElementsByType("vehicle") ) do 
			if getElementData(mashinHelperiHa, "veh_ownere") == tostring(helper_veh) then
				destroyElement(mashinHelperiHa)
			end
		end
		outputChatBox("#00ff00[Helper-System]: #ffffffShoma Tamami Mashin Haye Helperi Ra Destroy Kardid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!(RANK 3 NEEDED)", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hhelp",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		outputChatBox("#717171[Helper-Helps]: #ffffff/hc #ffff00Chatkardan Dar Chate Helper, #ffffff/helps #ffff00Didan Helpme Ha", thePlayer, 255, 255, 255, true)
		outputChatBox("#717171[Helper-Helps]: #ffffff/openhelp #ffff00Baz Kardan Helpme, #ffffff/closehelp #ffff00Bastan Helpme", thePlayer, 255, 255, 255, true)
		outputChatBox("#717171[Helper-Helps]: #ffffff/hl #ffff00Chat Ba Helpme, #ffffff/hv #ffff00Veh Kardan Mashin Helperi", thePlayer, 255, 255, 255, true)
		outputChatBox("#717171[Helper-Helps]: #ffffff/dhv #ffff00Pak Kardan Mashin Helperi, #ffffff/dhvall #ffff00Pak Kardan Mashin Helperia", thePlayer, 255, 255, 255, true)
		outputChatBox("#717171[Helper-Helps]: #ffffff/hgoto #ffff00Goto Be Helpme, #ffffff/hback #ffff00Goto Be Jaye Qabli Khod", thePlayer, 255, 255, 255, true)
		outputChatBox("#717171[Helper-Helps]: #ffffff/pm #ffff00Pm Dadan Be Taraf", thePlayer, 255, 255, 255, true)
	end
end)

function savarHelperVehMishe ( thePlayer, seat, jacked ) 
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) < 1 then
		if seat == 0 then
			if jacked then
				local theVehicle = getPedOccupiedVehicle (jacked)
				if getElementData(theVehicle, "veh_ownere") == tostring(helper_veh) then
					cancelEvent()
					outputChatBox ( "#ff0000[Helper-System]: #ffffffIn Veh Motealegh Be Helperha Mibashad!", thePlayer, 230,0,0 ,true)
				end
			else
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				if getElementData(theVehicle, "veh_ownere") == tostring(helper_veh) then
					cancelEvent()
					outputChatBox ( "#ff0000[Helper-System]: #ffffffIn Veh Motealegh Be Helperha Mibashad!", thePlayer, 230,0,0 ,true)
				end
			end
		end
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), savarHelperVehMishe )