local accSys = exports["Accounts-system"] -- Code By ExMmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD

addCommandHandler("contract",
	function ( thePlayer, command, player, offer )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 5 then
		local find = miscSys:findPlayer ( player )
		if find then
		if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) ~= 5 then
			local offer = tonumber(offer)
			if offer then
				if tonumber(offer) > 999 then
				 if tonumber(getElementData(accSys:getPlayerAcc(find), "pHeadValue")) == 0 then
				 local money = getPlayerMoney(thePlayer) 
				  if tonumber(money) > offer or tonumber(money) == offer then
					local targetPlayer = getPlayerName ( find )
					takePlayerMoney ( thePlayer, tonumber(offer) )
					setElementData(accSys:getPlayerAcc(find), "pHeadValue", tonumber(offer))
					outputChatBox("#00ff00[Done]:#ffffffShoma Mablaghe "..offer.."$ Baraye Sare Player "..targetPlayer.." Jayeze Gozashtid!", thePlayer, 0, 255, 0, true)
					else
					outputChatBox("Shoma In Meghdar Pol Ra Nadarid!", thePlayer, 255, 22, 22, true)
				  end
				 else
				 	outputChatBox("In Player Khodesh Contract Dare!", thePlayer, 255, 22, 22, true)
				 end
				 else
				 outputChatBox("Contract Hadaghal Bayad 1000$ Bashad!", thePlayer, 255, 22, 22, true)
				end
				else
				outputChatBox("Bezan /contract <id/partofname> meghdar", thePlayer, 255, 22, 22, true)
			end
			else
	            outputChatBox("#ff0000In Player Khodesh Hitmane!", thePlayer, 255, 22, 22, true)
			end
		else
			outputChatBox("Player Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
		else
		  outputChatBox("#ff0000Khodet Hitmani Nemitoni In Karo Bokoni ke!", thePlayer, 255, 22, 22, true)
	end
end
)

function contract(player)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 5 then
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if getElementData(accSys:getPlayerAcc(v), "pHeadValue") > 0 then
					outputChatBox("#ff0000"..getPlayerName(v)..": #ffffff"..getElementData(accSys:getPlayerAcc(v), "pHeadValue").."#00ff00$", player, 255, 22, 22, true)
				end
			end
		end
	end
end
addCommandHandler("contracts", contract)

addCommandHandler("setcontract",
function ( thePlayer, command, player, contract )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
    local find = miscSys:findPlayer ( player )
	local contract = tonumber(contract)
	local targetPlayer = getPlayerName ( find )
	setElementData(accSys:getPlayerAcc(find), "pHeadValue", contract)
	outputChatBox("#00ff00Shoma Ba Movafaghiat Contracte Player #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..contract.."$#00ff00 set kardid!", thePlayer, 255, 255, 255, true)
 else
 outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
 end
end)

function killcontract ( ammo, attacker, weapon, bodypart )
	if ( attacker ) then
		local MyAttackerType = getElementType ( attacker )
		if MyAttackerType ~= "vehicle" and MyAttackerType ~= "player" then
			return
		end
		if MyAttackerType == "vehicle" then
			attacker = getVehicleController ( attacker )
		end
	    if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 5 then
			if getElementData(attacker,"HitmanDuty") then
				local contract = getElementData(accSys:getPlayerAcc(source), "pHeadValue")
				if tonumber(contract) > 0 then
					givePlayerMoney ( attacker, tonumber(contract) )
					local targetPlayer = getPlayerName ( source )
					setElementData(accSys:getPlayerAcc(source), "pHeadValue", 0)
					outputChatBox("#00ff00Shoma Ba Movafaghiat Target #ff0000"..targetPlayer.."#00ff00 Ra Koshtid!", attacker, 255, 255, 255, true)
					outputChatBox("#00ff00Contract Be Mablaghe : #ff0000"..contract.."$#00ff00 Daryaft Kardid!", attacker, 255, 255, 255, true)
				end
			end
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), killcontract )

local hitmanduty = createPickup ( -280.22012329102 ,-649.3095703125 ,1290.8156738281 , 3, 1275, 0)
setElementInterior ( hitmanduty, 15 )
local hitmanorder = createPickup ( -284.28359985352 ,-628.6904296875 ,1290.8156738281 , 3, 1242, 0)
setElementInterior ( hitmanorder, 15 )
fasele = 2.5


addCommandHandler("duty",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(hitmanduty)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if de < fasele then
			if not getElementData(thePlayer, "HitmanDuty") then
				setElementData(thePlayer, "HitmanDuty", true)
				setElementHealth(thePlayer, 100)
				outputChatBox("#ffff00Info: #ffffffShoma #00ff00On Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then -- Leader
							setElementModel(thePlayer, 186)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then -- Sub-Leader
							setElementModel(thePlayer, 294)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 5 then -- Rank5
							setElementModel(thePlayer, 220)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then -- Rank4
							setElementModel(thePlayer, 277)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then -- Rank3
							setElementModel(thePlayer, 195)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then -- Rank2
							setElementModel(thePlayer, 195)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then -- Rank1
							setElementModel(thePlayer, 195)
				end
			else
				setElementData(thePlayer, "HitmanDuty", nil)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
				outputChatBox("#ffff00Info: #ffffffShoma #ff0000Off Duty #ffffffShodid!", thePlayer, 255, 255, 255, true)
			end
		else
			--outputChatBox("fasele", thePlayer, 255, 255, 255, true)
		end
	end
end
)

addEventHandler("onPlayerWasted", root, 
function ()
	if getElementData(source, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 5 then
			if getElementData(source,"HitmanDuty") then
				outputChatBox("#ffff00Info: #ffffffShoma #ff0000Off Duty #ffffffShodid!", source, 255, 255, 255, true)
				setElementData(source,"HitmanDuty",nil)
			end
		end
	end
end)


addCommandHandler("order",
function(thePlayer, cmd, orderID)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(hitmanorder)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local level = getElementData(thePlayer, "pLevel")
	local factionMember = getElementData(thePlayer, "pMember")
	local rank = getElementData(thePlayer, "pRank")
	local orderID = tonumber(orderID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if de < fasele then
        if getElementData(thePlayer, "HitmanDuty") and getElementData(thePlayer, "HitmanDuty") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 0 then
                       if tonumber(orderID) == 1 then
				takeWeapon(thePlayer, 29)
				takeWeapon(thePlayer, 31)
				takeWeapon(thePlayer, 24)
				takeWeapon(thePlayer, 30)
				takeWeapon(thePlayer, 27)
				takeWeapon(thePlayer, 17)
				giveWeapon(thePlayer,4,1000)
				giveWeapon(thePlayer,29,1000)
				giveWeapon(thePlayer,30,1000)
				giveWeapon(thePlayer,34,500)
				outputChatBox("#ffff00(!): #00ff00Order 1 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
			elseif tonumber(orderID) == 2 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 2 then
					takeWeapon(thePlayer, 29)
					takeWeapon(thePlayer, 31)
					takeWeapon(thePlayer, 24)
					takeWeapon(thePlayer, 30)
					takeWeapon(thePlayer, 27)
					takeWeapon(thePlayer, 17)
				giveWeapon(thePlayer,4,1000)
				giveWeapon(thePlayer,29,1000)
				giveWeapon(thePlayer,31,1000)
				giveWeapon(thePlayer,37,1000)
				giveWeapon(thePlayer,34,500)
					outputChatBox("#ffff00(!): #00ff00Order 2 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
				else 
					outputChatBox("#ffff00(!): #ff0000In Order Baraye Rank (+3) Emkan Pazir Ast!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(orderID) == 3 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
					takeWeapon(thePlayer, 29)
					takeWeapon(thePlayer, 31)
					takeWeapon(thePlayer, 24)
					takeWeapon(thePlayer, 30)
					takeWeapon(thePlayer, 27)
					takeWeapon(thePlayer, 17)
				    giveWeapon(thePlayer,4,1000)
				    giveWeapon(thePlayer,29,1000)
					giveWeapon(thePlayer,31,1000)
					giveWeapon(thePlayer,37,1000)
					giveWeapon(thePlayer,34,500)
					giveWeapon(thePlayer,39,20)
					outputChatBox("#ffff00(!): #00ff00Order 3 Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
				else 
					outputChatBox("#ffff00(!): #ff0000In Order Baraye Rank (+5) Emkan Pazir Ast!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ffff00(!): #ff0000Meqdar Order Bayad <1~3> Bashad!", thePlayer, 255, 255, 255, true)
                            end
			end
                    end
		end
	end
end
)
