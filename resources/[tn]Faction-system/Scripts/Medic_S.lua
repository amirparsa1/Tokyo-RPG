local accSys = exports["Accounts-system"] -- Code By ExMohmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD

fasele = 10

addCommandHandler("heal",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 4 then
		outputChatBox("#ff7700Baraye Inkar Bayad Ozv Faction Medic Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (player == nil) then
		outputChatBox("#ff7700Bezan: /heal <partOfName/ID>", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
		if find ~= thePlayer then 
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( find )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(find)
			local yourDim = getElementDimension(find)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			if de < fasele then
				if myInt == yourInt and myDim == yourDim then
					if getElementHealth ( find ) ~= 100 then
						local targetPlayer = getPlayerName ( find )
						if tostring(getElementData(find, "healer")) ~= getPlayerName(thePlayer) then
							local Medicer = getPlayerName(thePlayer)
							setElementData(find, "healer", tostring(Medicer),false)
							outputChatBox("#ff7700(Medic):#ffffff Pezeshk #ff7700"..getPlayerName(thePlayer).." #ffffffMikhahad Shoma Ra Darman Konad", find, 0, 255, 0,true)
							outputChatBox("#ff7700(Medic):#ffffff Baraye Darman Shodan Az #ff7700/aheal#ffffff Estefade Konid! #ff7700[Hazine: 8150$]", find, 0, 255, 0,true)
							outputChatBox("#00ff00(Medic):#ffffff Darkhast Darman Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
							setTimer(
							function()
								if getElementData(find, "healer") ~= nil then
									setElementData(find , "healer", nil)
									outputChatBox("#ff7700(Medic):#ffffff Darkhast Pas Az 15sec Tavasote Server Rad Shod! ", find, 0, 255, 0,true)
									outputChatBox("#ff7700(Medic):#ffffff Darkhast'e Heale Player "..getPlayerName(find).." Pas Az 15sec Tavasote Server Rad Shod! ", thePlayer, 0, 255, 0,true)
								end
							end , 15000, 1)
						else
							outputChatBox("#ff7700(Medic):#ffffff Darkhast Shoma Baraye In Player Ferestade Shode Ast, Montazer Bemanid Ta Accept Konad!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#ff7700(Medic):#ffffff In Player Joonesh Pore!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#ff7700(Medic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff7700(Medic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff7700(Medic):#ffffff  Player Yaft Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("aheal",
function(thePlayer, cmd)
	if getElementData(thePlayer, "healer") == nil then
		outputChatBox("#ff7700(Medic): #ffffffPezeshki Be Shoma Darkhast Darman Nadade Ast, #ff7700/service #ffffffBaraye Darkhast Service Pezeshki!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	if tonumber(money) > 8150 then
		local taraf = getElementData(thePlayer, "healer")
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
					setElementHealth ( thePlayer, 100)
					takePlayerMoney(thePlayer, 8150)
					outputChatBox("#00ff00(Medic): #ffffffShoma Tavasot Pezeshk #00ff00"..getElementData(thePlayer, "healer").." #ffffffDarman Shodid! (-8150$ Babat Darman Shodan)", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00(Medic): #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffDarkhast Darman Shoma Ra Qabool Kard Va Tavasot Shoma Darman Shod! #00ff00(+100$ Babat Darman Kardan)", find, 255, 255, 255, true)
					givePlayerMoney (find , 100)
					local hooqoqesh = getElementData(accSys:getPlayerAcc(find), "pMozd")
					setElementData(accSys:getPlayerAcc(find), "pMozd", tonumber(hooqoqesh) + 8150)
					setTimer(function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
						setElementData(thePlayer ,"healer", nil)
					end , 100, 1)
				else
					outputChatBox("#ff7700(Medic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff7700(Medic):#ffffff Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#ff7700(Medic): #ffffffShoma Pool Lazem Baraye Darman Shodan Nadarid ! (Meqdar Pool Lazem 100$)", thePlayer, 255, 255, 255, true)
	end
end
)


MedicDuty = createPickup ( 1135.2451171875 ,-1343.427734375 ,13.7812, 3, 1275, 0)
function MedicDuty(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
		local x,y,z = getElementPosition(thePlayer)
		if getDistanceBetweenPoints3D(x,y,z,1138.3466796875 ,-1350.88671875 ,13.984375) < 5 then
			if not getElementData(thePlayer, "onDuty") then
				setElementData(thePlayer, "onDuty", true)
				takeAllWeapons ( thePlayer )
				setPedArmor(thePlayer, 100)
				setElementHealth(thePlayer, 100)
				MedicPM("Doctor #00ff00"..getPlayerName ( thePlayer ).." #fff000Ham Aknon [ #00ff00On Duty #fff000] Shod.")
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 70)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 67)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 274)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 275)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 233)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 233)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 233)
						end 
			else
				setElementData(thePlayer, "onDuty", nil)
				setPedArmor(thePlayer, 0)
				takeAllWeapons ( thePlayer )
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
				MedicPM("Doctor #00ff00"..getPlayerName ( thePlayer ).." #fff000Ham Aknon [ #ff0000Off Duty #fff000] Shod.")
			end
			
		
			else
					outputChatBox("#ff7700(#ff0000Error#ff7700): #ffffffShoma Bayad dar Mahal Duty Bashid!", thePlayer, 255, 255, 255, true)
			end	
	end
	
end
function DutysBindKon( hitElement, matchingDimension )
if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) == 4 then
bindKey( hitElement, "Z", "down", MedicDuty )
else return false end
end
function DutysunBindKon( leaveElement, matchingDimension )
unbindKey( leaveElement, "Z", "down", MedicDuty )
end

addEventHandler ( "onPlayerWasted", getRootElement(), --Fixe (( Z )) Button
function ()
	if (isKeyBound ( source,"Z" , "down", MedicDuty )) then
		unbindKey( source, "Z", "down", MedicDuty )
	end
end)

local Markersdutys = {}
local MarkerDuty = {
	--{ X , Y , Z , Int , Dim },
	{ 1135.2451171875 ,-1343.427734375 ,13.7812 },
}

for i=1 , #MarkerDuty do
	Markersdutys[i] = createMarker(  MarkerDuty[i][1], MarkerDuty[i][2], MarkerDuty[i][3], "cylinder", 3.0,0,246,255,0)
	addEventHandler( "onMarkerHit", Markersdutys[i], DutysBindKon )
	addEventHandler( "onMarkerLeave", Markersdutys[i], DutysunBindKon )
end
--=================[Close Duty]================--

addCommandHandler("doctors",
function(thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
outputChatBox("#fff000ــــــــــــــــــــــــــــــــــ Medic Duty Listــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 0, 255, 0, true)
for index,medica in ipairs(getElementsByType("player")) do
		if getElementData(medica,"loggedIn") and getElementData(medica,"loggedIn") == true then
			if getElementData(medica, "onDuty") and tonumber(getElementData(accSys:getPlayerAcc(medica), "pMember")) == 4 then
					local timesh = getElementData(accSys:getPlayerAcc(medica), "pJailTime")
					outputChatBox("#fff000 Name: #ff0000"..getPlayerName(medica).." #fff000", thePlayer, 0, 255, 0, true)
			end
		end
	end
outputChatBox("#fff000ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 0, 255, 0, true)
else
	outputChatBox("#ff0000Error: Shoma Dastresi Be In CMD Ra Nadarid!!", thePlayer, 255, 255, 255, true)
end
end)