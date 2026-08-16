local accSys = exports["accounts-system"]
local miscSys = exports["misc"]


function showKonGohNakhor(thePlayer)

if getElementData(thePlayer,"loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) == 0 then
		if getElementData(thePlayer, "needHelp") ~= true then
		      
			  triggerClientEvent("OpenHelpPanel",thePlayer,thePlayer)
		else
		   triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
		   exports["notf"]:addNotification(thePlayer, "Shoma Az Ghabl Yek Darkhast Pasokh Nadade Darid." , 'error')
		end
	else
		   triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
		   exports["notf"]:addNotification(thePlayer, "Shoma Khodeton Helper Hastid." , 'error')	
	end
end
end
addCommandHandler("helpme",showKonGohNakhor)

addEvent("sendHelpToHelpers",true)
addEventHandler("sendHelpToHelpers",getRootElement(),function(root,payam,onvann)
	setElementData(root,"reportDade",true)
	setElementData(root,"helppText",tostring(payam))
	setElementData(root,"helpoText",tostring(onvann))
	setElementData(root, "needHelp", true, false)

	for index,allpl in ipairs(getElementsByType("player")) do
		if getElementData(allpl,"loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pHelper")) > 0 then
			outputChatBox ("#d5e3e3▬▬▬▬( #2BEC2BNew Help Request #d5e3e3)▬▬▬▬", allpl, 230,0,0 ,true)
			outputChatBox("#ffffffName: #f1eead"..getPlayerName(root).." ("..getElementData(root, "TarafID")..")", allpl, 255, 255, 255, true)
			outputChatBox ("#ffffffOnvan: #f1eead"..tostring(onvann).."#ffffffTozihat: #f1eead"..tostring(payam).."#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", allpl, 230,0,0 ,true)
	
			
			end
		end
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
							outputChatBox("#4e95bc[Helper "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#4e95bc[Helper "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
						else
							outputChatBox("#8DE197[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#8DE197[Player "..getPlayerName(thePlayer).."]: #ffffff"..message, thePlayer, 255, 255, 255, true)
						end
					end
				end
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Dar hal Help Nistid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /hl [message]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("helps",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
	outputChatBox ( "#d5e3e3▬▬▬▬(#2BEC2B Help Requests #d5e3e3)▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, needHelps in ipairs( getElementsByType("player") ) do 
		
			if getElementData(needHelps, "needHelp") == true then
			    
				outputChatBox ( "#ffffffID: #8DE197"..getElementData(needHelps, "TarafID").." #ffffff| Name:  #8DE197"..getPlayerName(needHelps).."", thePlayer, 230,0,0 ,true)
			
		    end
		
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	else
		--outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
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
				outputChatBox("#00ff00☑️ #ffffffShoma Darkhaste Helpe Player #8DE197"..yourName.." #ffffffRa Baz Kardid.", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00[Tavajoh]: #ffffffHelper #4e95bc"..myName.." #ffffffDarkhaste Helpe Shoma Ra Baz Kard, Ba /hl <message> Sohbat Konid!", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#4e95bc[Helper Team]:#ffffff Helper#4e95bc " ..myName.."#ffffff Darkhaste Helpe Player #8DE197"..yourName.."#ffffff Ra Baz kard!", sendToHelpers, 255, 255, 255, true)
							end
						end
					end
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Darkhaste Helpi Nadade Ast!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 255, 255, true)
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
				outputChatBox("#00ff00☑️ #ffffffShoma Darkhaste Helpe Player #8DE197"..yourName.."#ffffff Ra Bastid.", thePlayer, 255, 255, 255, true)
				outputChatBox("#ffff00[Tavajoh]: #ffffffHelper #4e95bc"..myName.."#ffffff Darkhaste Helpe Shoma Ra Bast.", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#4e95bc[Helper Team]:#ffffff Helper#4e95bc " ..myName.."#ffffff Darkhaste Helpe Player #8DE197"..yourName.."#ffffff Ra Bast!", sendToHelpers, 255, 255, 255, true)
							end
						end
					end
				end
			elseif getElementData(find, "onHelping") ~= nil then
				setElementData(find, "onHelping", nil, false)
				setElementData(thePlayer, "onHelping", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#00ff00☑️ #ffffffShoma Darkhaste Helpe Player #8DE197"..yourName.."#ffffff Ra Bastid.", thePlayer, 255, 255, 255, true)
				outputChatBox("#ffff00[Tavajoh]: #ffffffHelper #4e95bc"..myName.."#ffffff Darkhaste Helpe Shoma Ra Bast.", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							if tonumber(getElementData(accSys:getPlayerAcc(sendToHelpers), "pHelper")) > 0 then
								outputChatBox("#4e95bc[Helper Team]:#ffffff Helper#4e95bc " ..myName.."#ffffff Darkhaste Helpe Player #8DE197"..yourName.."#ffffff Ra Bast!", sendToHelpers, 255, 255, 255, true)
							
							end
						end
					end
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Darkhaste Helpi Nakarde Ast!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hgoto",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) < 0 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local levelsh = tonumber(getElementData(accSys:getPlayerAcc(find), "pLevel")) 		
		if levelsh < 5 then
			local int =  getElementInterior(find)
			local dim = getElementDimension ( find )
			local x , y , z = getElementPosition(find)
			local r = getPedRotation ( find )
			x = x - math.sin ( math.rad ( r ) ) * 2
			y = y + math.cos ( math.rad ( r ) ) * 2

			if isPedInVehicle (thePlayer) then
				local theVehicle = getPedOccupiedVehicle ( thePlayer )
					--Hale Bug Bus--
					if getElementData(thePlayer, "onbusMarkerMake") then
					destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
					destroyElement(getElementData(thePlayer, "onbusBlipMake"))
					end
					--Hale Bug Pilot --
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
					destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
					destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
					end					
					--Hale Bug Trucker--
					if getElementData(thePlayer, "makedTrucker") == true then
					destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
					destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
					end
					--Hale Bug StreetWasher--
					if getElementData(thePlayer, "onMarkerMake") then
					destroyElement(getElementData(thePlayer, "onMarkerMake"))
					destroyElement(getElementData(thePlayer, "onBlipMake"))
					end
				setElementDimension(theVehicle,dim)
				setElementInterior(theVehicle,int)
				setElementPosition ( theVehicle, x + 3, y, z )
				outputChatBox("#00ff00☑️ #ffffffShoma Goto Kardid Be Player #ff1010"..getPlayerName(find), thePlayer, 208, 0, 15,true)
				outputChatBox("#00ff00☑️ Helper #ff1010"..getPlayerName(thePlayer).." #ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
			else
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				setElementPosition ( thePlayer, x + 3, y, z )
				outputChatBox("#00ff00[Done]:#ffffffShoma Goto Kardid Be Player #ff1010"..getPlayerName(find), thePlayer , 208, 0, 15,true)
				outputChatBox("#ff1010[Tavajoh]:#ffffffHelper #ff1010"..getPlayerName(thePlayer).."#ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
			end
			end


				
		else

		end
		else

		end	
	end
)

addCommandHandler("hgoto",
function (thePlayer, command)
	local yaruKie = getElementData(thePlayer, "onHelping")
	if yaruKie ~= nil then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) ~= 0 then
			outputChatBox("#ff0000✖️ #ffffffAkhe To Jail Mikhay Goto Koni?!", thePlayer, 255, 255, 255, true)
			return
		end
		if not isPedInVehicle(thePlayer) then
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
							outputChatBox("#8DE197Helper #4e95bc"..getPlayerName(thePlayer).." #8DE197Be Shoma Goto Kard.", yaru, 255, 255, 255, true)
						end,100 ,1 )
					end
				end
			end
		else
			outputChatBox("#ff0000✖️ #ffffffTo Mashin Nemishe Tp Dad!", thePlayer, 255, 255, 255, true)
		end
	end
end)



addCommandHandler("hback",
function (thePlayer, command)
	local canGoBack = getElementData(thePlayer, "canGoBack")
	if canGoBack == true then
		setElementData(thePlayer, "canGoBack", nil, false)
		setElementPosition(thePlayer, xx, yy, zz)
		setElementInterior(thePlayer, myint)
		setElementDimension(thePlayer, mydim)
		outputChatBox("#00ff00☑️ #ffffffShoma Be Makan Avalie Khod Goto Kardid.", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hv",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if vehKardi == nil or not vehKardi then
			vehKardi = true
			local x, y, z = getElementPosition(thePlayer)
			local createdVehicle = createVehicle(479, x + 2, y, z)
			local myName = getPlayerName(thePlayer)
			setElementData(createdVehicle, "helper_owner", tostring(myName))
			setElementData(createdVehicle, "veh_ownere", tostring(helper_veh))		
            setVehicleHandling(createdVehicle, "tractionMultiplier", 1)
            setVehicleHandling(createdVehicle, "tractionLoss", 1.1)
            setVehicleHandling(createdVehicle, "brakeBias", 0.7)
            setVehicleHandling(createdVehicle, "maxVelocity", 200.0)
		    setVehicleHandling(createdVehicle, "driveType", "rwd")
	     	setVehicleHandling(createdVehicle, "dragCoeff", 1.9 )
            setVehicleHandling(createdVehicle, "brakeDeceleration", 20.0)
            setVehicleHandling(createdVehicle, "engineAcceleration", 14.0 )
			setVehicleColor( createdVehicle, 65, 110, 196, 65, 110, 196 )
			outputChatBox("#00ff00☑️ #ffffffShoma Yek Mashin Helperi Add Kardid.", thePlayer, 255, 255, 255, true)
		elseif vehKardi == true then
			outputChatBox("#ff0000✖️ #ffffffShoma Az Ghabl Yek Mashin Add Shode Darid!", thePlayer, 255, 255, 255, true)
		end
	else
		--outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("dhv",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
		if vehKardi == true then
			vehKardi = nil
			for index, mashinHelperi in ipairs( getElementsByType("vehicle") ) do 
				if getElementData(mashinHelperi, "helper_owner") == getPlayerName(thePlayer) then
					destroyElement(mashinHelperi)
					outputChatBox("#00ff00☑️ #ffffffShoma Yek Mashin Helperi Destroy Kardid.", thePlayer, 255, 255, 255, true)
				end
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Mashini Add Nakarde Ied!", thePlayer, 255, 255, 255, true)
		end
	else
		--outputChatBox("#ff0000[Helper-System]: #ffffffBaraye Inkar Bayad Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("dhvall",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 2 then
		for index, mashinHelperiHa in ipairs( getElementsByType("vehicle") ) do 
			if getElementData(mashinHelperiHa, "veh_ownere") == tostring(helper_veh) then
				destroyElement(mashinHelperiHa)
				pakKardi = true
			end
			setTimer(
			function()
				if pakKardi == true then
					pakKardi = nil
					outputChatBox("#00ff00☑️ #ffffffShoma Tamami Mashin Haye Helperi Ra Destroy Kardid!", thePlayer, 255, 255, 255, true)
				end
			end, 100, 1)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Head Helper Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("hhelp",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) > 0 then
	outputChatBox ( "#d5e3e3▬▬▬▬▬(#db8646 Dastorat Helperi #d5e3e3)▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		outputChatBox("#db8646/hc : #ffffffChat kardan Dar Chate Helperi, #db8646/helps : #ffffffDidan Helpme Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#db8646/openhelp : #ffffffBaz Kardan Helpme, #db8646/closehelp : #ffffffBastan Helpme.", thePlayer, 255, 255, 255, true)
		outputChatBox("#db8646/hl : #ffffffChat Ba Helpme, #db8646/hv : #ffffffAdd Kardan Mashin Helperi.", thePlayer, 255, 255, 255, true)
		outputChatBox("#db8646/dhv : #ffffffPak Kardan Mashin Helperi, #db8646/pm : #ffffffPm Dadan Be Taraf.", thePlayer, 255, 255, 255, true)
		outputChatBox("#db8646/hgoto : #ffffffGoto Be Helpme, #db8646/hback : #ffffffGoto Be Jaye Qabli Khod.", thePlayer, 255, 255, 255, true)
		outputChatBox("#db8646/dhvall : #ffffffPak Kardan Mashin Hay Helperi.", thePlayer, 255, 255, 255, true)
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end)

function savarHelperVehMishe ( thePlayer, seat, jacked ) 
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper")) < 1 then
		if seat == 0 then
			if jacked then
				local theVehicle = getPedOccupiedVehicle (jacked)
				if getElementData(theVehicle, "veh_ownere") == tostring(helper_veh) then
					cancelEvent()
					outputChatBox ( "#ff0000✖️ #ffffffIn Mashin Motealegh Be Helper Ha Mibashad!", thePlayer, 230,0,0 ,true)
				end
			else
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				if getElementData(theVehicle, "veh_ownere") == tostring(helper_veh) then
					cancelEvent()
					outputChatBox ( "#ff0000✖️ #ffffffIn Mashin Motealegh Be Helper Ha Mibashad!", thePlayer, 230,0,0 ,true)
				end
			end
		end
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), savarHelperVehMishe )

--#2D75A2
addCommandHandler("helpers",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#d5e3e3▬▬▬▬(#2BEC2B Online Helpers #d5e3e3)▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, getAdmins in ipairs( getElementsByType("player") ) do 
			if getElementData(getAdmins, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pHelper")) == 1 then
					outputChatBox ( "#ffffffID: #4e95bc"..getElementData(getAdmins, "TarafID").." #ffffff| #4e95bc"..getPlayerName(getAdmins).." #ffffff| Rank: #4e95bcBeta Helper", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pHelper")) == 2 then
				outputChatBox ( "#ffffffID: #4e95bc"..getElementData(getAdmins, "TarafID").." #ffffff| #4e95bc"..getPlayerName(getAdmins).." #ffffff| Rank: #4e95bc Helper", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pHelper")) == 3 then
				outputChatBox ( "#ffffffID: #4e95bc"..getElementData(getAdmins, "TarafID").." #ffffff| #4e95bc"..getPlayerName(getAdmins).." #ffffff| Rank: #4e95bc Head Helper", thePlayer, 230,0,0,true)
				end
			end
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end)


