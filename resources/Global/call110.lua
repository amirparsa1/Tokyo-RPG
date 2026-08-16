local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]


-- Call Police --
function cpp ( ammo, attacker, weapon, bodypart )

	if ( attacker ) then
		if attacker ~= source then
			local diedPlayerName = getPlayerName ( source )
			if ( getElementType ( attacker ) == "player" ) then
				local attackerName = getPlayerName ( attacker )
				setElementData(attacker, "kikosht", attackerName)
				if getElementData(attacker, "inevente") ~= true then
					if getElementData(attacker, "inpaintball") ~= true then
						if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) >= 10 and tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) >= 10 then return false end
						if tonumber(getElementData(accSys:getPlayerAcc(source), "pJailTime")) < 1 then
							if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) > 3 then
								if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) > 3 then
									if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pFamiId")) ~= 0 and tonumber(getElementData(accSys:getPlayerAcc(source), "pFamiId")) ~= 0 then
									else
										if getElementData(attacker,"NameTagIsShow?") == true then
										else
											setElementData(source, "call_police", attackerName)
											setElementData(accSys:getPlayerAcc(source), "pCall110Time", 0)
											outputChatBox("#DEA71F[Tavajoh] #ffffffShoma Tavasote "..attackerName.." Koshte Shodid, Baraye Shekayat: /call 110", source, 54, 181, 75,true)
										end
									end
								end

							end

						end

					end

				end
			elseif ( getElementType ( attacker ) == "vehicle" ) then
				local ranandename = getPlayerName( getVehicleController ( attacker ) )
				local attackerped = miscSys:findPlayer(ranandename)
				setElementData(source, "kikosht", ranandename)
				if getElementData(source, "inevente") ~= true then
					if getElementData(source, "inpaintball") ~= true then
						if tonumber(getElementData(accSys:getPlayerAcc(source), "pJailTime")) < 1 then
							if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) > 3 then
								if tonumber(getElementData(accSys:getPlayerAcc(attackerped), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(attackerped), "pMember")) > 3 then
									if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) >= 10 and tonumber(getElementData(accSys:getPlayerAcc(attackerped), "pMember")) >= 10 then 
									return false end
									setElementData(source, "call_police", ranandename)
									setElementData(accSys:getPlayerAcc(source), "pCall110Time", 0)
									outputChatBox("#DEA71F[Tavajoh] #ffffffShoma Tavasote "..ranandename.." Koshte Shodid, Baraye Shekayat: /call 110", source, 54, 181, 75,true)
								end
							end
						end
					end

				end

			end

			
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), cpp )



local GotDalileMarg = {}


addEventHandler ( "onPlayerWasted", getRootElement(),
function ( ammo, attacker, weapon, bodypart )

	local DiedPlayer = miscSys:findPlayer ( getPlayerName(source) )
	if isElement(attacker) then
		if ( getElementType ( attacker ) == "player" ) then
			if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 6 and  getElementData(attacker,"NameTagIsShow?") == true then return end
			
				if ( bodypart == 9 ) then -- if he was shot in the head
            	 	KojaZad = "Sar"
            	elseif ( bodypart == 8 ) then
            	  	KojaZad = "Paye Rast"
				elseif ( bodypart == 7 ) then
            	  	KojaZad = "Paye Chap"
				elseif ( bodypart == 5 ) then
            	  	KojaZad = "Dast Chap"
				elseif ( bodypart == 6 ) then
            	  	KojaZad = "Dast Rast"
				elseif ( bodypart == 4 ) then
            	  	KojaZad = "Basan"
				elseif ( bodypart == 3 ) then
            	  	KojaZad = ""
            	end

				if getWeaponNameFromID ( weapon ) == "Fist" then
					local DeathString = tostring("Shoma Tavasote "..getPlayerName ( attacker ).." Ba Zarbe Mosht Va Koshte Shodid.")
					GotDalileMarg[DiedPlayer] = tostring(DeathString)
				else
					local DeathString = tostring("Tir " .. getWeaponNameFromID ( weapon ) .. " "..getPlayerName ( attacker ).." Be " .. KojaZad .. " Shoma Esabat Kard Va Koshte Shodid.")
					GotDalileMarg[DiedPlayer] = tostring(DeathString)
				end

				setTimer(function()
					GotDalileMarg[DiedPlayer] = nil
				end, 60000, 1)
		elseif ( getElementType ( attacker ) == "vehicle" ) then
			if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 6 and  getElementData(attacker,"NameTagIsShow?") == true then return end
				local DeathString = tostring("Shoma Tavasot Mashin "..getPlayerName(getVehicleController(attacker)).." Zir Gerefte Shodid.")
				GotDalileMarg[DiedPlayer] = tostring(DeathString)
			setTimer(function()
				GotDalileMarg[DiedPlayer] = nil
			end, 60000, 1)
		end
	else
		local DeathString = tostring("Shoma KhodKoshi Kardid.")
		GotDalileMarg[DiedPlayer] = tostring(DeathString)
		setTimer(function()
			GotDalileMarg[DiedPlayer] = nil
		end, 60000, 1)
	end
end)

addCommandHandler("dalilemarg",
function ( thePlayer )
	if GotDalileMarg[thePlayer] then
		outputChatBox("#f3bd84 "..GotDalileMarg[thePlayer].." ", thePlayer, 255, 255, 255, true)
		--exports["notf"]:addNotification(thePlayer, ""..GotDalileMarg[thePlayer].."" , 'info')
	else
		outputChatBox("#ff0000✖️ #ffffffDalile Margi Baraye Shoma Peyda Nashode Ast!", thePlayer, 255, 255, 255, true)
	end
end)


--[[
--> Time Call Bede #zezaw
setTimer ( function ()
	for i,m in ipairs ( getElementsByType("player") ) do
		if getElementData(m, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(m), "pCall110Time")) >= 40 then
						return false
			end
				local CallTimesh = getElementData(accSys:getPlayerAcc(m), "pCall110Time")
				local BedeCallTime = tonumber(CallTimesh) + 1
				setElementData(accSys:getPlayerAcc(m), "pCall110Time", tonumber(BedeCallTime))
			--end
		end
	end
end, 1000, 0)
--]]

function mashindozdid ( player, seat, jacked )
	if jacked then
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 3 then
			if tonumber(getElementData(accSys:getPlayerAcc(jacked), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(jacked), "pMember")) > 3 then
				setElementData(jacked, "call_police", getPlayerName(player))
				setElementData(accSys:getPlayerAcc(jacked), "pCall110Time", 0)
				outputChatBox("#DEA71F[Tavajoh] #ffffffMashin Shoma Ra "..getPlayerName(player).." Dozdid, Baraye Shekayat: /call 110", jacked, 54, 181, 75,true)
			end
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), mashindozdid )