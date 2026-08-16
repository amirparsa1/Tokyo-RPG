local miscSys = exports["misc"]
local accSys = exports["Accounts-System"]
local fasele = 2.5

addCommandHandler("fixcar",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 9 then
		outputChatBox("#ff0000Baraye Inkar Bayad Mechanic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if find then
	if find ~= thePlayer then
			local Veh = getPedOccupiedVehicle ( thePlayer )
			if (Veh) then outputChatBox("#ff0000Baraye Inkar Nabayad Savare Mashin Bashid!", thePlayer, 255, 255, 255, true) return false end
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
					if getElementHealth ( find ) ~= 1000 then
						local targetPlayer = getPlayerName ( find )
						if tostring(getElementData(find, "mechanicer")) ~= getPlayerName(thePlayer) then
							local Mechanicer = getPlayerName(thePlayer)
							setElementData(find, "mechanicer", tostring(Mechanicer),false)
							outputChatBox("#00ff00[Tavajoh]: #ffffffMechanic "..getPlayerName(thePlayer).." Mikhad Mashine Shomaro Fix Kone!", find, 0, 255, 0,true)
							outputChatBox("#00FFFF[CMD]: #ffffffBaraye Fix Shodane Mashinet Bezan: /afix", find, 0, 255, 0,true)
							outputChatBox("#00ff00Darkhast Fix Shodan Mashin Baraye "..getPlayerName(find).." Ferestade Shod!", thePlayer, 0, 255, 0,true)
						else
							outputChatBox("#ff0000 Shoma 1 Darkhast Accept Nashode Darid!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffIn Mashin Niyaz Be Fix Shodan Nadard!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffBe Khodet Nemitoni Darkhaste Fixe Mashin Bedi!", thePlayer, 0, 255, 0,true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /fixcar <PartOfName/ID>", thePlayer, 0, 255, 0,true)
		end
end
)


addCommandHandler("afix",
function(thePlayer, cmd)
	if getElementData(thePlayer, "mechanicer") == nil then
		outputChatBox("#ff0000Shoma Darkhast Tamir Mashin Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	
	if getElementData(thePlayer, "DarHaleTamir") == 1 then
		outputChatBox("#ff0000Mashin Shoma Dar Hale Tamir Ast!", thePlayer, 255, 255, 255, true)
		return false
	end


		
		local taraf = getElementData(thePlayer, "mechanicer")
		local find = miscSys:findPlayer(taraf)
		if find then
		
		
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
			if isPedInVehicle ( thePlayer ) then
			--if getPedOccupiedVehicleSeat ( thePlayer ) == 1 then
				local Veh = getPedOccupiedVehicle ( thePlayer )
					if getVehicleEngineState(Veh) == true then
						outputChatBox("#ff0000Baraye Tamir Mashin Bayad Motor Mashin Ra Khamosh Konid!", thePlayer, 255, 255, 255, true)
					return false
					end
					setElementFrozen ( find, true )
					setElementData(thePlayer, "DarHaleTamir", 1)
					outputChatBox("#00ff00Repairing: [10%]", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00Repairing: [10%]", find, 255, 255, 255, true)
					setTimer(
					function ()
						outputChatBox("#00ff00Repairing: [30%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Repairing: [30%]", find, 255, 255, 255, true)
					end, 3000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Repairing: [60%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Repairing: [60%]", find, 255, 255, 255, true)
					end, 6000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Repairing: [90%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Repairing: [90%]", find, 255, 255, 255, true)
					end, 8000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Repairing: [100%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Repairing: [100%]", find, 255, 255, 255, true)
						fixVehicle(Veh)
						playSoundFrontEnd ( thePlayer, 46 )
						setElementFrozen ( find, false )
						setElementData(thePlayer, "DarHaleTamir", nil)
						outputChatBox("#00ff00* Mashine Shoma Tavasot Mechanic #ff0000"..getElementData(thePlayer, "mechanicer").." #00ff00Tamir Shod!", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00[Tavajoh]: #ffffffShoma Ba Movafaghiat Mashine Player #00ff00"..getPlayerName(thePlayer).." #ffffffRa Tamir Kardid!", find, 255, 255, 255, true)
					end, 10000, 1)
					
					setTimer(function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
						setElementData(thePlayer ,"mechanicer", nil)
					end , 10500, 1)
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Mechanic Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Mechanic Nazdik Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
end
)

addCommandHandler("refill",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 9 then
		outputChatBox("#ff0000Baraye Inkar Bayad Mechanic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if find then
	if find ~= thePlayer then
			local Veh = getPedOccupiedVehicle ( thePlayer )
			if not (Veh) then outputChatBox("#ff0000Baraye Inkar Bayad Savare Mashin Bashid!", thePlayer, 255, 255, 255, true) return false end
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
						local targetPlayer = getPlayerName ( find )
						if tostring(getElementData(find, "mechanicer2")) ~= getPlayerName(thePlayer) then
							local mechanicer2 = getPlayerName(thePlayer)
							setElementData(find, "mechanicer2", tostring(mechanicer2),false)
							outputChatBox("#00ff00[Tavajoh]: #ffffffMechanic "..getPlayerName(thePlayer).." Mikhad Benzin Mashin Shomaro Por Kone!", find, 0, 255, 0,true)
							outputChatBox("#00FFFF[CMD]: #ffffffBaraye Accept Kardan Darkhast Bezan: /arefill", find, 0, 255, 0,true)
							outputChatBox("#00ff00Darkhast Por Kardane Benzin Mashin Baraye "..getPlayerName(find).." Ferestade Shod!", thePlayer, 0, 255, 0,true)
						else
							outputChatBox("#ff0000 Shoma 1 Darkhast Accept Nashode Darid!", thePlayer, 0, 255, 0,true)
						end
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000[Error]: #ffffffBe Khodet Nemitoni Darkhaste Por Kardan Benzin Mashin Bedi!", thePlayer, 0, 255, 0,true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /refill <PartOfName/ID>", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("arefill",
function(thePlayer, cmd)
	if getElementData(thePlayer, "mechanicer2") == nil then
		outputChatBox("#ff0000Shoma Darkhast Por Shodan Benzin Mashin Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	
	if getElementData(thePlayer, "DarHaleTamir2") == 1 then
		outputChatBox("#ff0000Mashin Shoma Dar Hale Benzin Zadan Ast!", thePlayer, 255, 255, 255, true)
		return false
	end


		
		local taraf = getElementData(thePlayer, "mechanicer2")
		local find = miscSys:findPlayer(taraf)
		if find then
		
		
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
			if isPedInVehicle ( thePlayer ) then
			--if getPedOccupiedVehicleSeat ( thePlayer ) == 1 then
				local Veh = getPedOccupiedVehicle ( thePlayer )
					if getVehicleEngineState(Veh) == true then
						outputChatBox("#ff0000Baraye Por Shodan Benzin Mashin Bayad Motor Mashin Ra Khamosh Konid!", thePlayer, 255, 255, 255, true)
					return false
					end
					setElementFrozen ( find, true )
					triggerClientEvent("fillsoundstart", thePlayer, thePlayer)
					triggerClientEvent("fillsoundstart", find, find)
					setElementData(thePlayer, "DarHaleTamir2", 1)
					outputChatBox("#00ff00Fueling: [10%]", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00Fueling: [10%]", find, 255, 255, 255, true)
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [20%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [20%]", find, 255, 255, 255, true)
					end, 3000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [30%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [30%]", find, 255, 255, 255, true)
					end, 6000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [40%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [40%]", find, 255, 255, 255, true)
					end, 8000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [60%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [60%]", find, 255, 255, 255, true)
					end, 10000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [75%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [75%]", find, 255, 255, 255, true)
					end, 12000, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [90%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [90%]", find, 255, 255, 255, true)
					end, 13500, 1)
					
					setTimer(
					function ()
						outputChatBox("#00ff00Fueling: [100%]", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00Fueling: [100%]", find, 255, 255, 255, true)
						triggerClientEvent("fillsoundstop", thePlayer, thePlayer)
						triggerClientEvent("fillsoundstop", find, find)
						setElementFrozen ( find, false )
						local veh = getPedOccupiedVehicle (thePlayer)
						setElementData(thePlayer, "DarHaleTamir2", nil)
						setElementData(veh,"fuel",100)
						outputChatBox("#00ff00* Benzin Mashine Shoma Tavasot Mechanic #ff0000"..getElementData(thePlayer, "mechanicer2").." #00ff00Por Shod!", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00[Tavajoh]: #ffffffShoma Ba Movafaghiat Benzin Mashin Player #00ff00"..getPlayerName(thePlayer).." #ffffffRa Por Kardid!", find, 255, 255, 255, true)
					end, 15000, 1)
					
					setTimer(function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
						setElementData(thePlayer ,"mechanicer2", nil)
					end , 15500, 1)
				else
					outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Mechanic Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
			else
				outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Mechanic Nazdik Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
end
)
--[[ In Ghesmat Raft To Medic 
addCommandHandler("service",
function(thePlayer, command, type)
	local type = tostring(type)
	if type == "mechanic" then
		if getElementData(thePlayer, "loggedIn") == true then
			if getElementData(thePlayer, "needmechanic") ~= true then
				setElementData(thePlayer, "needmechanic", true, false)
				for k, v in ipairs (getElementsByType("player")) do
					if getElementData(v, "loggedIn") == true then
						if getElementData(accSys:getPlayerAcc(v), "pMember") == 9 then 
							outputChatBox("#f46e42[Mechanic-Service]: #ffffffPlayer #f46e42"..getPlayerName(thePlayer).." ("..getElementData(thePlayer, "TarafID")..") #ffffffDarkhaste Service Kard!", v, 255, 255, 255, true)
						end
					end
				end
				outputChatBox("#00ff00[Mechanic-Service]: #ffffffDarkhaste Shoma Ba Movafaqiat Baraye Team Khadamate Khodro Ersal Shod!", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#ff0000[Service-Error]: #ffffffShoma Yek Darkhast Az Ghabl Darid!", thePlayer, 255, 255, 255, true)
			end
		end
	--else
		--outputChatBox("#C0C0C0Syntax: /service <mechanic>", thePlayer, 255, 255, 255, true)
	end
end)
--]]

addCommandHandler("services",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 9 then
			for k, v in ipairs (getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
					if getElementData(v, "needmechanic") == true then
						outputChatBox("#f46e42[Mechanic-Service]: #ffffffPlayer #f46e42"..getPlayerName(v).." ("..getElementData(v, "TarafID")..") #ffffffDarkhaste Service Darad!", thePlayer, 255, 255, 255, true)
					end
				end
			end
		end
	end
end)

addCommandHandler("aservice",
function(thePlayer, command, target)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 9 then
			local find = miscSys:findPlayer(target)
			if find then
				if getElementData(thePlayer, "DarHaleFindMec") ~= 13 then
					if getElementData(find, "needmechanic") == true then
						local myName = getPlayerName(thePlayer)
						local yourName = getPlayerName(find)
						setElementData(thePlayer, "DarHaleFindMec", 13)
						setElementData(find, "needmechanic", nil, false)
						setElementData(find, "onMechanic", tostring(myName), false)
						setElementData(thePlayer, "onMechanic", tostring(yourName), false)
						outputChatBox("#f46e42[Mechanic-Service]: #ffffffShoma Darkhaste Service Player #f46e42"..yourName.." #ffffffRa Qabool Kardid!", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00[Mechanic]: #ffffffIn Player Baraye Shoma Dar Map Moshakhas Shod!", thePlayer, 255, 255, 255, true)
						outputChatBox("#f46e42[Mechanic-Service]: #ffffffMechanic #f46e42"..myName.." #ffffffDarkhaste Service Shoma Ra Qabool Kard!", find, 255, 255, 255, true)
						local mechanicBlip = createBlipAttachedTo ( find )
						setElementData(mechanicBlip, "exclusiveBlip", true)
						setElementVisibleTo(mechanicBlip, getRootElement(), false)
						setElementVisibleTo(mechanicBlip, thePlayer, true)
						setElementData(thePlayer, "nowMechanicBlip", mechanicBlip)
						setElementData(thePlayer, "isMechanicBlip", true, false)
						for index, sendToMechanics in ipairs( getElementsByType("player") ) do 
							if getElementData(sendToMechanics, "loggedIn") == true then
								if sendToMechanics ~= thePlayer then
									if tonumber(getElementData(accSys:getPlayerAcc(sendToMechanics), "pMember")) == 9 then
										outputChatBox("#f46e42[Mechanic-Service]: #ffffffMechanic #f46e42"..myName.." #ffffffDarkhaste Service Player #f46e42"..yourName.." #ffffffRa Qabool Kard!", sendToMechanics, 255, 255, 255, true)
									end
								end
							end
						end
					else
						outputChatBox("#ff0000[Service-Error]: #ffffffIn Player Darkhaste Service'e Nakarde Ast!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Find Kardan Player Digari Hastid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#C0C0C0Syntax: /aservice <PartOfName/ID>", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)

addCommandHandler("cfind",
function(thePlayer, command, target, MedicBlipGunShop, medicBlip)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 9 then
		if getElementData(thePlayer, "DarHaleFindMec") == 13 then
			if getElementData(thePlayer, "loggedIn") ~= nil then
				setElementData(thePlayer, "DarHaleFindMec", 0)
				setElementData(thePlayer, "onMechanic", nil, false)
				outputChatBox("#ff0000[GPS]: #ffffffPlayer Find Shode cfind Shod.", thePlayer, 255, 255, 255, true)		
				destroyElement(getElementData(thePlayer, "nowMechanicBlip"))
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
end)