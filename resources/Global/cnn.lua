local accSys = exports["Accounts-System"]
local adMarker = createMarker ( 1210.1376953125, -1750.841796875, 13.593784332275 +.8, "cylinder", 1.0, 0, 0, 0, 0 )
local pickupad = createPickup (	1210.1376953125, -1750.841796875, 13.593784332275 +.3, 3, 1239, 0)
local miscSys = exports["misc"]
adtimer = {}

fasele = 2
addCommandHandler("ad",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(adMarker)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local level = getElementData(accSys:getPlayerAcc(thePlayer), "pLevel")
	local BanAdTime = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pBanAdTime"))
	local time = getRealTime()
	local hours = time.hour
	if tonumber(level) >= 3 then
		if de < fasele then
		if hours >= 2 and hours < 23 then
			local message = table.concat({ ... }, " ")
			if #message > 0 then
				if #message < 70 then
					local randomValue = math.random(25,30)
					local finalValue = randomValue*#message
					local money = getPlayerMoney( thePlayer)
					if tonumber(money) > tonumber(finalValue) then
						if getElementData(thePlayer, "haveAd") ~= true then
							if getElementData(accSys:getPlayerAcc(thePlayer), "pPnumber") ~= 0 then
								setElementData(thePlayer, "rad", false)
								if BanAdTime == 0 then
									if getElementData(thePlayer, "rad") == false then
										takePlayerMoney(thePlayer, tonumber(finalValue))
										setElementData(thePlayer, "haveAd", true)
										outputChatBox("#00ff00[Done]: #ffffffTabligh Shoma Bad Az 1 Daghighe Gozashte Mishavad!", thePlayer, 255, 255, 255, true)
										outputChatBox("#00ff00[CNN]: #ffffffMablaq "..finalValue.."$ Az Shoma Babat Tabliq Kam Shod!", thePlayer, 255, 255, 255, true)
										for _, player in pairs( getElementsByType 'player' ) do
											if getElementData(player, "loggedIn") == true then
												if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 0 then
													outputChatBox("#ff0000[CNN-Warn]: #ffffffFerestande: #ff0000"..getPlayerName(thePlayer).."("..getElementData(thePlayer, "TarafID")..") #ffffffMatn: #ff0000"..message, player, 255, 22, 22, true)
												end
											end
										end
										setTimer(function()
											-- FIX (bugfix pass 4): the element can be gone by the time this timer
											--   fires (player quit / object destroyed). Without this guard MTA
											--   raises "Bad argument" and the rest of the callback never runs.
											if not isElement(thePlayer) then return end
										if getElementData(thePlayer, "haveAd") == true and getElementData(thePlayer, "rad") == false then
											setElementData(thePlayer, "haveAd", nil)
											outputChatBox("#00ff00Tabligh Az " .. getPlayerName(thePlayer) .. " ["..miscSys:FormatPN(getElementData(accSys:getPlayerAcc(thePlayer), "pPnumber")).."]: #ffffff" .. message, v, 255, 255, 255, true)
										end 
										end, 60000, 1)
									end
								else
									outputChatBox("#ff0000[Error]: #ffffffShoma Be Modat "..BanAdTime.." Daghighe Ban Ad Hastid",thePlayer,255,255,255,true)
								end
							else
								outputChatBox("#ff0000[Error]: #ffffffBaraye Ersal Tabligh Bayad Sim Card Dashte Bashid!",thePlayer,255,255,255,true)
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffShoma Yek Tabligh Pakhsh Nashode Darid!",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#ff0000[Error]: #ffffffShoma Baraye Tabliq Niaz Be $"..finalValue.." Darid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Error]: #ffffffTabliqe Shoma Bayad Kamtar Az 70Harf Bashad!", thePlayer, 255, 255, 255, true)
				end
				else
					outputChatBox("#C0C0C0Syntax: /ad <Tabligh>", thePlayer, 212, 156, 49, true)
				end
				else
					outputChatBox("#ff0000In Makan Az Saate 12:00 PM Ta 23:00 PM Baz Mibashad!", thePlayer, 212, 156, 49, true)
				end
			else
			outputChatBox("#ff0000Shoma Dar Mahale Makhsoose Sefareshe Tabligh Nistid!", thePlayer, 212, 156, 49, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Anjam In Kar Level (+7) Niaz Ast!", thePlayer, 255, 255, 255, true)
	end
end)


addCommandHandler("cad",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
		if find then
			if getElementData(find, "rad") == false then
				setElementData(find, "rad", true)
				for _, player in pairs( getElementsByType 'player' ) do
					if getElementData(player, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 0 then
							outputChatBox("#00ff00☑️ #ffffff[ADM-Warn]:Admin#00ff00"..getPlayerName(thePlayer).." #ffffffTabligh'e #00ff00"..getPlayerName(find).." #ffffffRa #ff0000Reject #ffffffKard!", player, 255, 255, 255, true)
						end
					end
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Tabligh Nadarad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /cad <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)