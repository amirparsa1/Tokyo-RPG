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

-- =============================================================================
--  FIX (bugfix pass 4) -- /pay had three real bugs:
--
--  1. CRASH: typing "/pay john" with no amount left `amount` nil, and the very
--     next check did  tonumber(amount) > 999  ->
--     "attempt to compare nil with number", aborting the handler.
--
--  2. ELEMENT LEAK: a colsphere was created on every single /pay
--         local radius = createColSphere(x, y, z, 10)
--     and never destroyed. Every payment leaked one element for the lifetime of
--     the server; on a busy server this climbs into the thousands.
--
--  3. DEAD CODE / SILENT FAILURE: the outer guard required  level > 3  but the
--     inner branch tested  level < 3 . Those cannot both be true, so the
--     25,000 tier was unreachable, and a player at exactly level 3 fell through
--     every branch: no money moved and no message was shown.
--     Now: level 3 -> 25,000 cap, level 4+ -> 50,000 cap.
--
--  Also: the loop variable shadowed the `player` argument, and the amount is
--  now floored to a whole number so "/pay x 1000.9" cannot desync the totals.
-- =============================================================================

addCommandHandler("pay",
function(thePlayer, cmd, player, amount)
	if not player or not amount then
		outputChatBox("#C0C0C0Bezan: /pay <PartOfName/ID> <Meghdar>", thePlayer, 255, 255, 255, true)
		return
	end

	amount = tonumber(amount)
	if not amount or amount ~= amount then   -- nil or NaN
		outputChatBox("#ff0000X #ffffffMeghdar Bayad Adad Bashad!", thePlayer, 255, 255, 255, true)
		return
	end
	amount = math.floor(amount)
	if amount <= 0 then
		outputChatBox("#ff0000X #ffffffMeghdar Bayad Mosbat Bashad!", thePlayer, 255, 255, 255, true)
		return
	end

	local find = miscSys:findPlayer ( player )
	if not find or not isElement(find) then
		outputChatBox("#ff0000X #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		return
	end
	if thePlayer == find then
		outputChatBox("#ff0000X #ffffffBe Khodet Nemitoni Pool Pay Koni!", thePlayer, 255, 255, 255, true)
		return
	end

	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(find)
	if getDistanceBetweenPoints3D(x,y,z,mx,my,mz) >= fasele then
		outputChatBox("#ff0000X #ffffffBaraye Inkar Bayad Nazdik Player Bashid!", thePlayer, 255, 255, 255, true)
		return
	end

	local level = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pLevel")) or 0
	if level < 3 then
		outputChatBox("#ff0000X #ffffffBaraye Inkar Bayad Level +3 Dashte Bashid!", thePlayer, 255, 255, 255, true)
		return
	end

	if amount < 1000 then
		outputChatBox("#ff0000X #ffffffMablagh Bayad Balaye $1,000 Bashad!", thePlayer, 255, 255, 255, true)
		return
	end

	local money = getPlayerMoney(thePlayer)
	if amount > tonumber(money) then
		outputChatBox("#ff0000X #ffffffShoma Dar Jib Khod $"..convertNumber(amount).." Nadarid!", thePlayer, 255, 255, 255, true)
		return
	end

	-- level 3 -> 25k, level 4+ -> 50k
	local cap = (level > 3) and 50000 or 25000
	if amount > cap then
		outputChatBox("#ff0000X #ffffffShoma Ta $"..convertNumber(cap).." Mitonid Pool Pay Konid!", thePlayer, 255, 255, 255, true)
		return
	end

	local targetPlayer = getPlayerName ( find )
	takePlayerMoney(thePlayer, amount)
	givePlayerMoney(find, amount)

	-- FIX: the colsphere is destroyed right after the lookup instead of leaking.
	local radius = createColSphere(x, y, z, 10)
	local nearPlayers = getElementsWithinColShape(radius, "player")
	if isElement(radius) then destroyElement(radius) end

	for _, nearby in ipairs(nearPlayers) do
		outputChatBox("#2ba82b** "..getPlayerName(thePlayer).." Az Jibesh $"..convertNumber(amount).." DarAvord o Be "..targetPlayer.." Dad!", nearby, 255, 255, 255, true)
	end
	outputChatBox("#c2b636-$"..convertNumber(amount).." | Pardakht Be: "..targetPlayer, thePlayer, 255, 255, 255, true)
	outputChatBox("#36c2b6+$"..convertNumber(amount).." | Daryafti Az: "..getPlayerName(thePlayer), find, 255, 255, 255, true)
end
)
