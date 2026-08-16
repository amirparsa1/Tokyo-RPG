function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

local accSys = exports["accounts-System"]
local miscSys = exports["misc"]
fasele = 6
addCommandHandler("pay",
function(thePlayer, cmd, player, amount)
	local find = miscSys:findPlayer ( player )
	local amount = tonumber(amount)
	local level = getElementData(accSys:getPlayerAcc(thePlayer), "pLevel")
	if player then
	if find then
	if thePlayer ~= find then
		local x,y,z = getElementPosition(thePlayer)
		local mx,my,mz = getElementPosition(find)
		local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
		if de < fasele then
			local targetPlayer = getPlayerName ( find )
			local money = getPlayerMoney(thePlayer)
			local findMoney = getPlayerMoney(find)
			local radius = createColSphere(x, y, z, 10)--near
			local nearPlayers = getElementsWithinColShape(radius, "player")--near
			if tonumber(level) > 3 then
			if tonumber(amount) > 999 then
				if tonumber(amount) <= tonumber(money) then
					if tonumber(level) < 3 then
						if tonumber(amount) <= 25000 then
							givePlayerMoney(find, amount)
							takePlayerMoney(thePlayer, amount)
							for _, player in ipairs(nearPlayers) do
								outputChatBox("#2ba82b** "..getPlayerName(thePlayer).." Az Jibesh $"..convertNumber(amount).." DarAvord o Be "..targetPlayer.." Dad!", player, 255, 255, 255, true)
							end 
							outputChatBox("#c2b636-$"..convertNumber(amount).." | Pardakht Be: "..targetPlayer, thePlayer, 255, 255, 255, true)
							outputChatBox("#36c2b6+$"..convertNumber(amount).." | Daryafti Az: "..getPlayerName(thePlayer), find, 255, 255, 255, true)
						else
							outputChatBox("#ff0000✖️ #ffffffShoma Ta $25,000 Mitonid Pool Pay Konid!", thePlayer, 255, 255, 255, true)
						end
					elseif tonumber(level) > 3 then
						if tonumber(amount) <= 50000 then
							givePlayerMoney( find, tonumber(amount) )
							takePlayerMoney(thePlayer, tonumber(amount))
							for _, player in ipairs(nearPlayers) do
								outputChatBox("#2ba82b** "..getPlayerName(thePlayer).." Az Jibesh $"..convertNumber(amount).." DarAvord o Be "..targetPlayer.." Dad!", player, 255, 255, 255, true)
							end 
							outputChatBox("#c2b636-$"..convertNumber(amount).." | Pardakht Be: "..targetPlayer, thePlayer, 255, 255, 255, true)
							outputChatBox("#36c2b6+$"..convertNumber(amount).." | Daryafti Az: "..getPlayerName(thePlayer), find, 255, 255, 255, true)
						else
							outputChatBox("#ff0000✖️ #ffffffShoma Ta $50,000 Mitonid Pool Pay Konid!", thePlayer, 255, 255, 255, true)
						end
					end
				else
					outputChatBox("#ff0000✖️ #ffffffShoma Dar Jib Khod $"..amount.." Nadarid!", thePlayer, 255, 255, 255, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffMablagh Bayad Balaye $1,000 Bashad!", thePlayer, 255, 255, 255, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Level +3 Dashte Bashid!", thePlayer, 255, 255, 255, true)
				end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Nazdik Player Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBe Khodet Nemitoni Pool Pay Koni!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Bezan: /pay <PartOfName/ID> <Meghdar>", thePlayer, 255, 255, 255, true)
	end
end
)