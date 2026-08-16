local accSys = exports["Accounts-system"] -- Code By ExMohmD!
local miscSys = exports["Misc"] -- Telegram: @ExMohmD

fasele = 2

addCommandHandler("fixveh",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 8 then
		outputChatBox("#649c9eBaraye Inkar Bayad Ozv Faction Mechanic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (player == nil) then
		outputChatBox("#649c9eBezan: /fixveh <partOfName/ID>", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
		if find then 
			if find == thePlayer then
				return false
			end
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
					if isPedInVehicle(find) then
						local targetPlayer = getPlayerName ( find )
						if tostring(getElementData(find, "Mechanic")) ~= getPlayerName(thePlayer) then
							local Mechanicer = getPlayerName(thePlayer)
							setElementData(find, "Mechanic", tostring(Mechanicer),false)
							outputChatBox("#649c9e(Mechanic):#ffffff Mechanic #649c9e"..getPlayerName(thePlayer).." #ffffffMikhahad Mashin Shomaro Tamir Konad", find, 0, 255, 0,true)
							outputChatBox("#649c9e(Mechanic):#ffffff Baraye Tamir Khodroo Az #649c9e/afix #ffffff Estefade Konid! #649c9e[Hazine: 100$]", find, 0, 255, 0,true)
							outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Repair Baraye #649c9e"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
							setTimer(
							function()
								if getElementData(find, "Mechanic") ~= nil then
									setElementData(find , "Mechanic", nil)
									outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Pas Az 15sec Tavasote Server Rad Shod! ", find, 0, 255, 0,true)
									outputChatBox("#649c9e(Mechanic):#ffffff Darkhast'e Repair Player "..getPlayerName(find).." Pas Az 15sec Tavasote Server Rad Shod! ", thePlayer, 0, 255, 0,true)
								end
							end , 15000, 1)
						else
							outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Shoma Baraye In Player Ferestade Shode Ast, Montazer Bemanid Ta Accept Konad!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#649c9e(Mechanic):#ffffff In Player Savar Mashin Nist!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#649c9e(Mechanic):#ffffff  Player Yaft Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("afix",
function(thePlayer, cmd)
	if getElementData(thePlayer, "Mechanic") == nil then
		outputChatBox("#649c9e(Mechanic): #ffffffHich Mechanici Be Shoma Darkhast Tamir Nadade Ast!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	if tonumber(money) > 100 then
		local taraf = getElementData(thePlayer, "Mechanic")
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
					if not isPedInVehicle(thePlayer) then
						outputChatBox("#649c9e(Mechanic):#ffffff Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 0, 255, 0,true)
						return false
					end
					local hisVeh = getPedOccupiedVehicle(thePlayer)
					fixVehicle(hisVeh)
					local hooqoqesh = getElementData(accSys:getPlayerAcc(find), "pMozd")
					setElementData(accSys:getPlayerAcc(find), "pMozd", tonumber(hooqoqesh) + 4000)
					playSoundFrontEnd ( find, 46 )
					playSoundFrontEnd ( thePlayer, 46 )
					takePlayerMoney(thePlayer, 100)
					outputChatBox("#649c9e(Mechanic): #ffffffMashin Shoma Tavasot Mechanic #649c9e"..getElementData(thePlayer, "Mechanic").." #ffffffTamir Shod! (-100$ Babat Tamir Shodan)", thePlayer, 255, 255, 255, true)
					outputChatBox("#649c9e(Mechanic): #ffffffPlayer #649c9e"..getPlayerName(thePlayer).." #ffffffDarkhast Tamir Shoma Ra Qabool Kard Va Mashin Ash Tamir Shod! #649c9e(+100$ Babat Tamir Kardan)", find, 255, 255, 255, true)
					givePlayerMoney (find , 100)
					setTimer(function()
						setElementData(thePlayer ,"Mechanic", nil)
					end , 100, 1)
				else
					outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#649c9e(Mechanic): #ffffffShoma Pool Lazem Baraye Tamir Shodan Mashin Khod Ra Nadarid ! (Meqdar Pool Lazem 100$)", thePlayer, 255, 255, 255, true)
	end
end
)



addCommandHandler("refill",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 8 then
		outputChatBox("#649c9eBaraye Inkar Bayad Ozv Faction Mechanic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (player == nil) then
		outputChatBox("#649c9eBezan: /refill <partOfName/ID>", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
		if find then 
			if find == thePlayer then
				return false
			end
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
					if isPedInVehicle(find) then
						local targetPlayer = getPlayerName ( find )
						if tostring(getElementData(find, "Mechanic2")) ~= getPlayerName(thePlayer) then
							local Mechanicer = getPlayerName(thePlayer)
							setElementData(find, "Mechanic2", tostring(Mechanicer),false)
							outputChatBox("#649c9e(Mechanic):#ffffff Mechanic #649c9e"..getPlayerName(thePlayer).." #ffffffMikhahad Bak Benzin Shomaro Por Konad", find, 0, 255, 0,true)
							outputChatBox("#649c9e(Mechanic):#ffffff Baraye Por Shodan Bak Benzin Az #649c9e/arefill#ffffff Estefade Konid! #649c9e[Hazine: 2000$]", find, 0, 255, 0,true)
							outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Por Kardan Bak Benzin Baraye #649c9e"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
							setTimer(
							function()
								if getElementData(find, "Mechanic2") ~= nil then
									setElementData(find , "Mechanic2", nil)
									outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Pas Az 15sec Tavasote Server Rad Shod! ", find, 0, 255, 0,true)
									outputChatBox("#649c9e(Mechanic):#ffffff Darkhast'e Por Kardan Bak Benzin Baraye Player "..getPlayerName(find).." Pas Az 15sec Tavasote Server Rad Shod! ", thePlayer, 0, 255, 0,true)
								end
							end , 15000, 1)
						else
							outputChatBox("#649c9e(Mechanic):#ffffff Darkhast Shoma Baraye In Player Ferestade Shode Ast, Montazer Bemanid Ta Accept Konad!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#649c9e(Mechanic):#ffffff In Player Savar Mashin Nist!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#649c9e(Mechanic):#ffffff  Player Yaft Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("arefill",
function(thePlayer, cmd)
	if getElementData(thePlayer, "Mechanic2") == nil then
		outputChatBox("#649c9e(Mechanic): #ffffffHich Mechanici Be Shoma Darkhast Tamir Nadade Ast!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	if tonumber(money) > 2000 then
		local taraf = getElementData(thePlayer, "Mechanic2")
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
					if not isPedInVehicle(thePlayer) then
						outputChatBox("#649c9e(Mechanic):#ffffff Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 0, 255, 0,true)
						return false
					end
					local hisVeh = getPedOccupiedVehicle(thePlayer)
					setElementData(hisVeh,"fuel",100)
					takePlayerMoney(thePlayer, 2000)
					local hooqoqesh = getElementData(accSys:getPlayerAcc(find), "pMozd")
					setElementData(accSys:getPlayerAcc(find), "pMozd", tonumber(hooqoqesh) + 4000)
					outputChatBox("#649c9e(Mechanic): #ffffffBak Benzin Mashin Shoma Tavasot Mechanic #649c9e"..getElementData(thePlayer, "Mechanic2").." #ffffffPor Shod! (-2000$ Babat Por Kardan Bak Benzin)", thePlayer, 255, 255, 255, true)
					outputChatBox("#649c9e(Mechanic): #ffffffPlayer #649c9e"..getPlayerName(thePlayer).." #ffffffDarkhast Tamir Shoma Ra Qabool Kard Va Bak Benzin Mashin Ash Por Shod! #649c9e(+2000$ Babat Por Kardan Bak Benzin)", find, 255, 255, 255, true)
					givePlayerMoney (find , 2000)
					setTimer(function()
						setElementData(thePlayer ,"Mechanic2", nil)
					end , 100, 1)
				else
					outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#649c9e(Mechanic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#649c9e(Mechanic): #ffffffShoma Pool Lazem Baraye Tamir Shodan Mashin Khod Ra Nadarid ! (Meqdar Pool Lazem 2000$)", thePlayer, 255, 255, 255, true)
	end
end
)
		------------------
-------------- Lift --------------
		------------------
local root = getRootElement()

lifts = {
	{Ax = -2052.5,Ay = 153.69999694824,Az = 26.89999961853,Bx = -2052.5,By = 153.69999694824,Bz = 24.200000762939,Brx = 0,Bry = 0,Brz = 0,Arx = 0,Ary = 0,Arz = 0},
	{Ax = -2041.9000244141,Ay = 170.39999389648,Az = 26.299999237061,Bx = -2041.9000244141,By = 170.5,Bz = 24.200000762939,Brx = 0,Bry = 0,Brz = 90,Arx = 0,Ary = 0,Arz = 90},
	{Ax = -2035.8000488281,Ay = 170.30000305176,Az = 27.89999961853,Bx = -2035.8000488281,By = 170.30000305176,Bz = 24.299999237061,Brx = 0,Bry = 0,Brz = 90,Arx = 0,Ary = 0,Arz = 90},
}

distance = 6
data = {}

for i,l in pairs(lifts) do
	table.insert(data,{Arm = createObject(2597,l.Ax,l.Ay,l.Az,l.Arx,l.Ary,l.Arz),Base = createObject(2231,l.Bx,l.By,l.Bz,l.Brx,l.Bry,l.Brz)})
end

for i,s in pairs(data) do
	local x,y,z = getElementPosition(s.Base)
	setElementData(s.Base,"state","down")
	setElementData(s.Base,"reset",z)
	setElementData(s.Base,"reset2",z+2.371852874756)
end

addCommandHandler("lift",function(player,cmd,percent)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= 8 then
		outputChatBox("#649c9eBaraye Inkar Bayad Ozv Faction Mechanic Bashid!", player, 255, 255, 255, true)
		return false
	end
	for i,d in pairs(data) do
		local x,y,z = getElementPosition(player)
		local vx,vy,vz = getElementPosition(d.Base)
		local sx = getElementData(d.Base,"reset")
		local sy = getElementData(d.Base,"reset2")
		local de = getDistanceBetweenPoints3D(x,y,z,vx,vy,vz)
		if de < distance then
			if (getElementData(d.Base,"state") == "up") then
				if percent then
					if tonumber(percent) > -1 and tonumber(percent) < 101 then
						local state = vz-((tonumber(percent)/100)*2.371852874756)
						if state < sy-2.371852874756 then
							outputChatBox("Error: Lotfan Yek Darsad% Pain Tar Vared Konid!",player,255,0,0)
							return
						else
							moveObject(d.Base,((tonumber(percent)/100)*5000),vx,vy,state)
							setElementData(d.Base,"state","down")
						end
					else
						outputChatBox("Error: Lotfan Yek Darsad% Vared Konid!",player,255,0,0)
					end
				else
					moveObject(d.Base,5000,vx,vy,sx)
					setElementData(d.Base,"state","down")
				end
			elseif (getElementData(d.Base,"state") == "down") then
				if percent then
					if tonumber(percent) > -1 and tonumber(percent) < 101 then
						local state = vz+((tonumber(percent)/100)*2.371852874756)
						if state > sx+2.371852874756 then
							outputChatBox("Error: Lotfan Yek Darsad Pain Tar Vared Konid!",player,255,0,0)
							return
						else
							moveObject(d.Base,((tonumber(percent)/100)*5000),vx,vy,state)
							setElementData(d.Base,"state","up")
						end
					else
						outputChatBox("Error: Lotfan Yek Darsad% Vared Konid!",player,255,0,0)
					end
				else
					moveObject(d.Base,5000,vx,vy,sy)
					setElementData(d.Base,"state","up")
				end
			end
		end
	end
end)


MechanicmcDuty = createPickup ( 1233.2353515625 ,-1455.162109375 ,13.54687, 3, 1275, 0)
function MechanicmcDuty(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,1233.2353515625 ,-1455.162109375 ,13.54687) < 5 then
			if not getElementData(thePlayer, "onDuty") then
				setElementData(thePlayer, "onDuty", true)
				takeAllWeapons ( thePlayer )
				setPedArmor(thePlayer, 100)
				setElementHealth(thePlayer, 100)
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 305)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 268)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 7)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 50)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 69)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 69)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 69)
						end 
				outputChatBox("#ff7700(#00ff00Duty-System#ff7700): #00ff00 Shoma OnDuty Duty Shodid!", thePlayer, 255, 255, 255, true)
			else
				setElementData(thePlayer, "onDuty", nil)
				setPedArmor(thePlayer, 0)
				takeAllWeapons ( thePlayer )
				outputChatBox("#ff7700(#00ff00Duty-System#ff7700): #ff0000 Shoma Off Duty Shodid!", thePlayer, 255, 255, 255, true)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
			end
			
		
			else
					outputChatBox("#ff7700(#ff0000Error#ff7700): #ffffffShoma Bayad dar Mahal Duty Bashid!", thePlayer, 255, 255, 255, true)
			end	
	end
	
end
function mcDutysBindKon( hitElement, matchingDimension )
if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 8 then
bindKey( hitElement, "Z", "down", MechanicmcDuty )
else return false end
end
function mcDutysunBindKon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", MechanicmcDuty )
end

addEventHandler ( "onPlayerWasted", getRootElement(), --Fixe (( Z )) Button
function ()
	if (isKeyBound ( source,"Z" , "down", MechanicmcDuty )) then
		unbindKey( source, "Z", "down", MechanicmcDuty )
	end
end)

local MarkersmcDutys = {}
local MarkermcDuty = {
	--{ X , Y , Z , Int , Dim },
	{ 1233.2353515625 ,-1455.162109375 ,13.54687 },
}

for i=1 , #MarkermcDuty do
	MarkersmcDutys[i] = createMarker(  MarkermcDuty[i][1], MarkermcDuty[i][2], MarkermcDuty[i][3], "cylinder", 3.0,0,246,255,0)
	addEventHandler( "onMarkerHit", MarkersmcDutys[i], mcDutysBindKon )
	addEventHandler( "onMarkerLeave", MarkersmcDutys[i], mcDutysunBindKon )
end