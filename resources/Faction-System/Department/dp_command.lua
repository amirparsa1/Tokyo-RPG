local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

local pdarrest = createPickup ( 1560.5009765625, -1694.30859375, 5.8969912528992 , 3, 1247, 0)
local fbiarrest = createPickup ( 311.869140625 ,-1513.88671875 ,24.921875 , 3, 1247, 0)
local markaziarrest = createPickup ( -26.9150390625 ,-2517.658203125 ,36.628704071045 , 3, 1247, 0)
local fasele = 2.5

addCommandHandler("jarime",
function ( thePlayer, command, player, amount)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 8 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Police Department/Shahrdar/Admin Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0  then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) < 2 then
			outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
			return false 
		end
	end
	local find = miscSys:findPlayer ( player )
	if find then
		--if find ~= thePlayer then
			if amount then
				amount = tonumber( amount )
				if amount >= 1000  and amount <= 100000 then
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
							if tostring(getElementData(find, "JarimeRq")) ~= getPlayerName(thePlayer) then
								local JarimeKonande = getPlayerName(thePlayer)
								setElementData(find, "JarimeRq", tostring(JarimeKonande),false)
								setElementData(find, "MizanJarime", amount)
								if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
									outputChatBox("#006AC6[Tavajoh]: #ffffffPolice #006AC6"..getPlayerName(thePlayer).." #ffffffShomaro Be Mablaghe #FFFF00$"..amount.." #ffffffJarime Kard Baraye Pardakht Bezan #00ff00/pardakht #ffffffVa Agar Na Wanted Migiri!", find, 0, 255, 0,true)
								 elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
								 	outputChatBox("#006AC6[Tavajoh]: #ffffffShahrdar #FF00E7"..getPlayerName(thePlayer).." #ffffffShomaro Be Mablaghe #FFFF00$"..amount.." #ffffffJarime Kard Baraye Pardakht Bezan #00ff00/pardakht #ffffffVa Agar Na Wanted Migiri!", find, 0, 255, 0,true)
								 elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 3 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 8 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 1 then
									outputChatBox("#006AC6[Tavajoh]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffShomaro Be Mablaghe #FFFF00$"..amount.." #ffffffJarime Kard Baraye Pardakht Bezan #00ff00/pardakht #ffffffVa Agar Na Wanted Migiri!", find, 0, 255, 0,true)
								end
								outputChatBox("#006AC6[Jarime] #ffffffTicket Jarime Be Mablaghe #00ff00$"..amount.." #ffffffBaraye Player #00ff00"..getPlayerName(find).." #ffffffErsal Shod.", thePlayer, 0, 255, 0,true)
								setTimer(
								function()
									if getElementData(find, "JarimeRq") ~= nil then
										setElementData(find , "JarimeRq", nil)
										outputChatBox("#ff0000[Tavajoh]: #ffffffZamane Pardakht Jarime Be Etmam Resid Shod! ", find, 0, 255, 0,true)
										outputChatBox("#ff0000[Tavajoh]: #ffffffZamane Pardakht Jarime Player "..getPlayerName(find).." Be Etmam Resid! ", thePlayer, 0, 255, 0,true)
									end
								end , 60000*5, 1)
							else
								outputChatBox("#ff0000✖️ #ffffffShoma Az Ghabl Yek Ticket Jarime Be In Player Dadid!", thePlayer, 0, 255, 0,true)
							end
						else
							outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffMeghdar Jarime Bayad Beyn $1,000 Ta $100,000 Bashad!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /jarime <PartOfName/ID> <Price>", thePlayer, 0, 255, 0,true)
			end
		--else
			--outputChatBox("#ff0000✖️ #ffffffKhodeto Nemitoni Jarime Koni!", thePlayer, 0, 255, 0,true)
		--end
	else
		outputChatBox("#C0C0C0Bezan: /jarime <PartOfName/ID> <Price>", thePlayer, 0, 255, 0,true)
	end
end
)

addCommandHandler("pardakht",
function(thePlayer, cmd)
	if getElementData(thePlayer, "JarimeRq") == nil then
		outputChatBox("#ff0000✖️ #ffffffShoma Ticket Jarimei Baraye Pardakht Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	local MizanJarime = getElementData(thePlayer, "MizanJarime")
	if tonumber(money) >= MizanJarime then
		local taraf = getElementData(thePlayer, "JarimeRq")
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
					takePlayerMoney(thePlayer, MizanJarime)
					outputChatBox("#00ff00[Tavajoh]: #ffffffShoma Darkhast Ticket Jarime #006AC6"..getElementData(thePlayer, "JarimeRq").." #ffffff Ra Be Mablaghe #ff0000$"..MizanJarime.." #ffffffAccept Kardid.", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00[Tavajoh]: #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffTicket Jarime Shoma Ra Be Mablaghe #00ff00$"..MizanJarime.." #ffffffAccept Kard.", find, 255, 255, 255, true)
					givePlayerMoney (find , MizanJarime)
					setTimer(function()
						-- FIX (bugfix pass 4): the element can be gone by the time this timer
						--   fires (player quit / object destroyed). Without this guard MTA
						--   raises "Bad argument" and the rest of the callback never runs.
						if not isElement(thePlayer) then return end
						setElementData(thePlayer ,"JarimeRq", nil)
					end , 100, 1)
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Be $"..MizanJarime.." Pool Baraye Pardakht Jarime Niaz Darid!", thePlayer, 255, 255, 255, true)
	end
end
)




function exitVehicle ( thePlayer, seat, jacked )
	local seat = getPedOccupiedVehicleSeat (thePlayer)
	local vehicle = getPedOccupiedVehicle(thePlayer)
	local vaziatCuff = getElementData(thePlayer, "pCuffed?")
	if vaziatCuff == true then
		cancelEvent()
	end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle)

function defaultCuff()
	local vaziatCuff = getElementData(source, "pCuffed?")
	if vaziatCuff == true then
		setElementData(source, "pCuffed?", false)
	end
end
addEventHandler ( "onPlayerQuit", root, defaultCuff )


--/wanteds
function wanteds(player)
	local onDuty = getElementData(player, "OnDuty") or 0
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) < 4 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 6 then
	if tonumber(onDuty) == 1 then
		outputChatBox("#ff0000[Wanteds]:", player, 255, 255, 255, true)
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if getPlayerWantedLevel(v) > 0 then
					local wanted = getPlayerWantedLevel(v)
					local id = getElementData(v, "TarafID")
					outputChatBox("#001dffWanted: #ffffff"..getPlayerName(v).." ("..id..") #001dffTedad: #ffffff"..wanted, player, 255, 255, 255, true)
				end
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dar Hale Anjam Vazife Bashid!", player, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Police Bashid!", player, 255, 255, 255, true)
	end
end
addCommandHandler("wanteds", wanteds)

--/wanted
function setWanted(thePlayer, command, player, wanted, ...)
	if player then
		local find = miscSys:findPlayer ( player )
		local factionMember = getElementData(thePlayer, "pMember")
		local toCheFactioniHast = getElementData(find, "pMember")
		local wantedDare = getPlayerWantedLevel(find)
		local toJaile = getElementData(find, "pJailTime") or 0
		local reffThePlayer = getElementData(thePlayer, "pID")
		local reffName = getElementData(find, "pID")
		local haveWanted = getElementData(find, "pWanted")
		local wanted = tonumber(wanted)
		local onDuty = getElementData(thePlayer, "OnDuty") or 0
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if find then
		if wanted then
		if ... then
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) < 1 or tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) > 3 then
				if tonumber(onDuty) == 1 then
					if tonumber(toJaile) < 1 then
					if tonumber(wanted) > 0 and tonumber(wanted) < 7 then
						local koleWanted = tonumber(wantedDare) + tonumber(wanted)
						local message = table.concat({ ... }, " ")
						if #message > 0 then
							if tonumber(koleWanted) <= 6 then
								setPlayerWantedLevel(find,tonumber(koleWanted))
							else
								setPlayerWantedLevel(find,6)
							end
								local targetPlayer = getPlayerName ( find )
								sendDepartmentMessage(thePlayer, targetPlayer, wanted, message)
								outputChatBox("#0000ff** Information Wanted System **", thePlayer, 0, 255, 0, true)
								outputChatBox("#717171 Wanted Be:#ff0000 "..targetPlayer.."#717171 | Tedad Wanted :#ff0000 "..wanted.."", thePlayer, 0, 255, 0, true)
								outputChatBox("#717171 Reason : #ff0000" .. message .."", thePlayer, 0, 255, 0, true)
								outputChatBox("#0000ff** Information Wanted System **", find, 0, 255, 0, true)
								outputChatBox("#717171 Wanted Az:#ff0000 "..getPlayerName(thePlayer).."#717171 | Tedad Wanted :#ff0000 "..wanted.."", find, 255, 0, 255, true)
								outputChatBox("#717171 Reason : #ff0000" .. message .."", find, 0, 255, 0, true)
							--end
						--else
							--outputChatBox("#ff0000✖️ #ffffffMax Wanted : 6", thePlayer, 0, 255, 0, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffTedad Wanted Ra Sahih Vared Konid! 1~6", thePlayer, 0, 255, 0, true)
					end
					else
					outputChatBox("#ff0000✖️ #ffffffBe Zendani Nemitonid Wanted Bedid!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dar Hale Anjam Vazife Bashid!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Khodesh Police Ast!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffDalil Wanted Ra Vared Konid!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Wanted Ra Vared Konid!", thePlayer, 0, 255, 0, true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /wanted <PartOfName/ID> <Tedad> <Dalil>", thePlayer, 0, 255, 0, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Police Bashid!", thePlayer, 0, 255, 0, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /wanted <PartOfName/ID> <Tedad> <Dalil>", thePlayer, 0, 255, 0, true)
	end
end
addCommandHandler("wanted",setWanted)

--Department Warn
function sendDepartmentMessage(root, mojremName, mojremWanted, Reason)
	local Reason = tostring(Reason)
	local mojremName = tostring(mojremName)
	local mojremWanted = tonumber(mojremWanted)
	if getElementData(root, "loggedIn") == true then
		for k, v in ipairs (getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if v ~= root then
					local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
					if hisFac > 0 and hisFac < 4 then
						outputChatBox("#1e47ff[DP-Warn]:#ffffff Police "..getPlayerName(root).." Be Player #1e47ff"..mojremName.."#ffffff Tedad #1e47ff"..mojremWanted.." Wanted #ffffffDad!", v, 255, 255, 255, true)
						outputChatBox("#1e47ff[DP-Warn]:#ffffff Reason: #1e47ff"..Reason, v, 255, 255, 255, true)
					end
				end
			end
		end
	end
end

--/cwanted
function cWanted(thePlayer, command, player, wanted, ...)
		local find = miscSys:findPlayer ( player )
		local factionMember = getElementData(thePlayer, "pMember")
		local toCheFactioniHast = getElementData(find, "pMember")
		local wantedDare = getPlayerWantedLevel(find)
		local toJaile = getElementData(find, "pJailTime")
		local reffThePlayer = getElementData(thePlayer, "pID")
		local reffName = getElementData(find, "pID")
		local haveWanted = getElementData(find, "pWanted")
		local onDuty = getElementData(thePlayer, "OnDuty") or 0
		local wanted = tonumber(wanted)
		local rank = getElementData(thePlayer,"pRank")
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) >= 3 then
			if find then
			if wanted then
			if ... then
			if tonumber(onDuty) == 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) < 1 or tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) > 3 then
					  if tonumber(wanted) > 0 then
						local kamkon = tonumber(wantedDare) - tonumber(wanted)
						if tonumber(kamkon) >= 0 then
							local message = table.concat({ ... }, " ")
							if #message > 0 then
								setPlayerWantedLevel(find,tonumber(kamkon))
								setElementData(find, "pWanted", tonumber(kamkon))
								local targetPlayer = getPlayerName ( find )
								outputChatBox("#0000ff** Information Wanted System **", thePlayer, 0, 255, 0, true)
								outputChatBox("#717171 Wanted Be:#ff0000 "..targetPlayer.."#717171 | Tedad Wanted :#ff0000 -"..wanted.."", thePlayer, 0, 255, 0, true)
								outputChatBox("#717171 Reason : #ff0000" .. message .."", thePlayer, 0, 255, 0, true)
								outputChatBox("#0000ff** Information Wanted System **", find, 0, 255, 0, true)
								outputChatBox("#717171 Wanted Az:#ff0000 "..getPlayerName(thePlayer).."#717171 | Tedad Wanted :#ff0000 -"..wanted.."", find, 255, 0, 255, true)
								outputChatBox("#717171 Reason : #ff0000" .. message .."", find, 0, 255, 0, true)
								
								for i, policaa in pairs( getElementsByType 'player' ) do
			                        if tonumber(getElementData(accSys:getPlayerAcc(policaa), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(policaa), "pMember")) < 4 then
									
			                        outputChatBox("#0000ff[Wanted System]: #ffffffPolice #0000ff"..getPlayerName(thePlayer).." #ffffffTedad #0000ff"..wanted.." #ffffffWanted Az #0000ff"..getPlayerName(find).." #ffffff Kam Kard. #717171 Reason : #ff0000" .. message .."", policaa, 255, 255, 255, true)
									
			                        end
		                        end
								
							end
						else
							outputChatBox("#ff0000✖️ #ffffffIn Player Wanted Nadarad!", thePlayer, 0, 255, 0, true)
						end
					  else
						  outputChatBox("#ff0000✖️ #ffffffMeqdar Vared Shode Baraye cWanted Bayad Beyne <1~6> Bashad!", thePlayer, 0, 255, 0, true)
					  end
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Khodesh Police Ast!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dar Hale Anjam Vazife Bashid!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffDalil cWanted Ra Vared Konid!", thePlayer, 0, 255, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Ra Vared Konid!", thePlayer, 0, 255, 0, true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /cwanted <PartOfName/ID> <Tedad> <Dalil>", thePlayer, 0, 255, 0, true)
			end
			else
				outputChatBox("#ff0000✖️ #ffffffBaraye Anjam Inkar Rank (+3) Niaz Ast!", thePlayer, 0, 255, 0, true)
			end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Police Bashid!", thePlayer, 0, 255, 0, true)
	end
end
addCommandHandler("cwanted",cWanted)

local MetrazhBolandgoo = 25

--/m
addCommandHandler("m",
function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if isPedInVehicle( thePlayer ) then
			if player and ... then
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				local vehid = getElementID ( theVehicle )
				if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
					or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
					or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
					or vehid == "helifbi4" or vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	    		    or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13" or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	    		    or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	    		    or vehid == "NgMoto7" or vehid == "NgMoto8" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				    or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
					or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
					or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					if ... then
						local posX, posY, posZ = getElementPosition( theVehicle )
						local chatSphere = createColSphere( posX, posY, posZ, MetrazhBolandgoo )
						local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
						destroyElement( chatSphere )
						local message = table.concat({ ... }, " ")
						for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
							if #message > 0 then

								outputChatBox("#0085ff<Police " .. getPlayerName(thePlayer) .. ">: " .. message .." >", nearbyPlayer, 255, 255, 255, true)
							end
						end
					else
						outputChatBox("#A9C4E4Bezan: /m <Payam>", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#A9C4E4Bezan: /"..cmd.." <Mojrem> <Payam>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

--/m1
addCommandHandler("m1",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if isPedInVehicle( thePlayer ) then
			local theVehicle = getPedOccupiedVehicle (thePlayer)
			local vehid = getElementID ( theVehicle )
			if player then
				if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
					or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
					or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
					or vehid == "helifbi4" or vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	    		    or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13" or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	    		    or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	    		    or vehid == "NgMoto7" or vehid == "NgMoto8" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				    or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
					or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
					or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					local posX, posY, posZ = getElementPosition( theVehicle )
					local chatSphere = createColSphere( posX, posY, posZ, MetrazhBolandgoo )
					local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
					local find = miscSys:findPlayer( player )
					destroyElement( chatSphere )
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						outputChatBox("#0085ff<Police " .. getPlayerName(thePlayer) .. ">: #d2b48c"..getPlayerName(find).."#0085ff Lotfan Beist, Va Agar Na Wanted Migiri! STOP!", nearbyPlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#A9C4E4Bezan: /"..cmd.." <Mojrem>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

--/m2
addCommandHandler("m2",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if isPedInVehicle(thePlayer) then
			local theVehicle = getPedOccupiedVehicle (thePlayer)
			local vehid = getElementID ( theVehicle )
			if player then
				if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
					or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
					or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
					or vehid == "helifbi4" or vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	        		or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13" or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	        		or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	        		or vehid == "NgMoto7" or vehid == "NgMoto8" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
		    		or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
					or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
					or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					local posX, posY, posZ = getElementPosition( theVehicle )
					local chatSphere = createColSphere( posX, posY, posZ, MetrazhBolandgoo )
					local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
					local find = miscSys:findPlayer( player )
					destroyElement( chatSphere )
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						outputChatBox("#0085ff<Police " .. getPlayerName(thePlayer) .. ">: #d2b48c"..getPlayerName(find).."#0085ff Lotfan Az Mashin Piade Sho!", nearbyPlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#A9C4E4Bezan: /"..cmd.." <Mojrem>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

--/m3
addCommandHandler("m3",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if isPedInVehicle(thePlayer) then
			if player then
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				local vehid = getElementID ( theVehicle )

				if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
					or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
					or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
					or vehid == "helifbi4" or vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	    		    or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13" or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	    		    or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	    		    or vehid == "NgMoto7" or vehid == "NgMoto8" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				    or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
					or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
					or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					
					local posX, posY, posZ = getElementPosition( theVehicle )
					local chatSphere = createColSphere( posX, posY, posZ, MetrazhBolandgoo )
					local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
					local find = miscSys:findPlayer( player )
					destroyElement( chatSphere )
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						outputChatBox("#0085ff<Police " .. getPlayerName(thePlayer) .. ">: #d2b48c"..getPlayerName(find).."#0085ff Lotfan Nakoob Be Mashin Va Agar Na Wanted Migiri!", nearbyPlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#A9C4E4Bezan: /"..cmd.." <Mojrem>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

--/m4
addCommandHandler("m4",
function(thePlayer, cmd, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if isPedInVehicle(thePlayer) then
			if player then
				local theVehicle = getPedOccupiedVehicle (thePlayer)
				local vehid = getElementID ( theVehicle )

				if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
					or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
					or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
					or vehid == "helifbi4" or vehid == "NgHeli1" or vehid == "NgHeli2" or vehid == "NgHeli3" or vehid == "NgCar1" or vehid == "NgCar3" or vehid == "NgCar4" or vehid == "NgCar5" or vehid == "NgCar6" or vehid == "NgCar7" or vehid == "NgCar8" 
	    		    or vehid == "NgCar9" or vehid == "NgCar10" or vehid == "NgCar11" or vehid == "NgCar12" or vehid == "NgCar13" or vehid == "NgCar14" or vehid == "NgCar15" or vehid == "NgCar16" or vehid == "NgTank1" or vehid == "NgTank2"
	    		    or vehid == "NgTank3" or vehid == "NgJet1" or vehid == "NgJet2" or vehid == "NgJet3" or vehid == "NgMoto1" or vehid == "NgMoto2" or vehid == "NgMoto3" or vehid == "NgMoto4" or vehid == "NgMoto5" or vehid == "NgMoto6" 
	    		    or vehid == "NgMoto7" or vehid == "NgMoto8" or vehid == "carpd1" or vehid == "carpd2" or vehid == "carpd3" or vehid == "carpd4" or vehid == "carpd5" or vehid == "carpd6" or vehid == "carpd7" or vehid == "carpd8" or vehid == "carpd9" or vehid == "carpd10" 
				    or vehid == "carpd11" or vehid == "carpd12" or vehid == "carpd13" or vehid == "carpd14" or vehid == "carpd15" or vehid == "carpd16" or vehid == "carpd17" or vehid == "carpd18" or vehid == "carpd19" or vehid == "carpd20" or vehid == "carpd21" 
					or vehid == "carpd22" or vehid == "carpd23" or vehid == "carpd24" or vehid == "motopd1" or vehid == "motopd2" or vehid == "motopd3" or vehid == "motopd4" or vehid == "motopd5" or vehid == "motopd6" or vehid == "motopd7" or vehid == "motopd8" or vehid == "motopd9" 
					or vehid == "motopd10" or vehid == "motopd11" or vehid == "motopd12" or vehid == "motopd13" or vehid == "helipd1" or vehid == "helipd2" or vehid == "helipd3" or vehid == "helipd4" then
					
					local posX, posY, posZ = getElementPosition( theVehicle )
					local chatSphere = createColSphere( posX, posY, posZ, MetrazhBolandgoo )
					local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
					local find = miscSys:findPlayer( player )
					destroyElement( chatSphere )
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
						outputChatBox("#0085ff<Police " .. getPlayerName(thePlayer) .. ">: #d2b48c"..getPlayerName(find).."#0085ff Lotfan g Bezan Va Savare Mashin Sho Va Agar Na Wanted Migiri!", nearbyPlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#A9C4E4Bezan: /"..cmd.." <Mojrem>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Dar Mashin Police Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Police Bashid!", thePlayer, 255, 255, 255, true)
	end
end)
controlTable2 = { "fire", "aim_weapon", "next_weapon", "previous_weapon", "forwards", "backwards", "left", "right", "zoom_in", "zoom_out",
"change_camera", "jump", "sprint", "look_behind", "crouch", "action", "walk", "conversation_yes", "conversation_no",
"group_control_forwards", "group_control_back", "enter_exit", "vehicle_fire", "vehicle_secondary_fire", "vehicle_left", "vehicle_right",
"steer_forward", "steer_back", "accelerate", "brake_reverse", "radio_next", "radio_previous", "radio_user_track_skip", "horn", "sub_mission",
"handbrake", "vehicle_look_left", "vehicle_look_right", "vehicle_look_behind", "vehicle_mouse_look", "special_control_left", "special_control_right",
"special_control_down", "special_control_up" }
--/arrest For PD
addCommandHandler("arrest",
function(thePlayer, cmd, player)
	local find = miscSys:findPlayer(player)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(pdarrest)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
	local playerVehicle = getPedOccupiedVehicle(find)
	local targetPlayer = getPlayerName ( find )
	local wanted = getPlayerWantedLevel(find)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if find then
		  	if de < fasele then
				if thePlayerVehicle then
					if thePlayerVehicle == playerVehicle then
						if tonumber(wanted) == 1 then
			                sendMojremMessage(thePlayer, targetPlayer, 1)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $30,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 300)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 1)
							outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 30000)
							setElementData(find, "pCuffe", 0)
							takeAllWeapons ( find )
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end
							local selol = math.random(1,3)
	               			if selol == 1 then
		                    	setElementPosition (find, 264.3505859375 ,77.869140625 ,1001.0390625)
		                   	 	setElementInterior ( find, 6 )
	               			elseif selol == 2 then
		                    	setElementPosition (find, 264.2314453125 ,82.1806640625 ,1001.0390625)
		                    	setElementInterior ( find, 6 )
	               			elseif selol == 3 then
		                     	setElementPosition (find, 264.0888671875 ,86.701171875 ,1001.0390625)
		                     	setElementInterior ( find, 6 )
	                		end
------------------------------------------------------------------------------
		    			elseif tonumber(wanted) == 2 then
			                sendMojremMessage(thePlayer, targetPlayer, 2)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $60,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 450)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 1)
		                    outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 60000)
							setElementData(find, "pCuffe", 0)
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end
							takeAllWeapons ( find )
							local selol = math.random(1,3)
	               			if selol == 1 then
		                    	setElementPosition (find, 264.3505859375 ,77.869140625 ,1001.0390625)
		                    	setElementInterior ( find, 6 )
	               			elseif selol == 2 then
		                    	setElementPosition (find, 264.2314453125 ,82.1806640625 ,1001.0390625)
		                    	setElementInterior ( find, 6 )
	               			elseif selol == 3 then
		                     	setElementPosition (find, 264.0888671875 ,86.701171875 ,1001.0390625)
		                     	setElementInterior ( find, 6 )
	                		end
						end
					else
						outputChatBox("#ff0000Error: Baraye Inkar Mojrem Bayad Dakhel Mashin Shoma Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 255, 255, true)
				end
			end
			else
					outputChatBox("#C0C0C0Syntax: /arrest <PartOfName/ID>", thePlayer, 255, 255, 255, true)
			end
	end
end)

--/arrest For FBI
addCommandHandler("arrest",
function(thePlayer, cmd, player)
	local find = miscSys:findPlayer(player)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(fbiarrest)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
	local playerVehicle = getPedOccupiedVehicle(find)
	local targetPlayer = getPlayerName ( find )
	local wanted = getPlayerWantedLevel(find)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if find then
			if de < fasele then
				if thePlayerVehicle then
					if thePlayerVehicle == playerVehicle then
						if tonumber(wanted) == 3 then
							sendMojremMessage(thePlayer, targetPlayer, 3)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $90,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 600)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 2)
							outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 90000)
							setElementData(find, "pCuffe", 0)
							takeAllWeapons ( find )
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end

							local selol = math.random(1,3)
	        				if selol == 1 then
		              		 	setElementPosition (find, 215.068359375 ,108.33203125 ,999.015625)
		                   		setElementInterior ( find, 10 )
	         				elseif selol == 2 then
		         		   		setElementPosition (find, 219.076171875 ,108.4873046875 ,999.015625)
		                		setElementInterior ( find, 10 )
	           				elseif selol == 3 then
		                     	setElementPosition (find, 222.9990234375 ,108.6025390625 ,999.015625)
		                     	setElementInterior ( find, 10 )
	                		end
							
------------------------------------------------------------------------------

		    			elseif tonumber(wanted) == 4 then
			                sendMojremMessage(thePlayer, targetPlayer, 4)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $120,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 750)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 2)
		                    outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 120000)
							setElementData(find, "pCuffe", 0)
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end
							takeAllWeapons ( find )
							local selol = math.random(1,3)
							if selol == 1 then
		                    	setElementPosition (find, 215.068359375 ,108.33203125 ,999.015625)
		                    	setElementInterior ( find, 10 )
	               			elseif selol == 2 then
		                    	setElementPosition (find, 219.076171875 ,108.4873046875 ,999.015625)
		                    	setElementInterior ( find, 10 )
	               			elseif selol == 3 then
		                     	setElementPosition (find, 222.9990234375 ,108.6025390625 ,999.015625)
		                     	setElementInterior ( find, 10 )
	            			end
						end
					end
				end
			end
			end
	end
end)

--/arrest For Jail Markazi
addCommandHandler("arrest",
function(thePlayer, cmd, player)
	local find = miscSys:findPlayer(player)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(markaziarrest)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local factionMember = getElementData(thePlayer, "pMember")
	local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
	local playerVehicle = getPedOccupiedVehicle(find)
	local targetPlayer = getPlayerName ( find )
	local wanted = getPlayerWantedLevel(find)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if find then
		 	if de < fasele then
				if thePlayerVehicle then
					if thePlayerVehicle == playerVehicle then
						if tonumber(wanted) == 5 then
			                sendMojremMessage(thePlayer, targetPlayer, 5)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $150,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 900)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 3)
							outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 150000)
							setElementData(find, "pCuffe", 0)
							takeAllWeapons ( find )
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end
							local Skinfemale = getElementData(accSys:getPlayerAcc(find), "pSex")
							local skinesh = math.random(1,3)
							if Skinfemale == 2 then
								setElementModel(find, 304)
		                    else
								if skinesh == 1 then
									setElementModel(find, 210)
								 elseif skinesh == 2 then
									setElementModel(find, 297)
								 elseif skinesh == 3 then
									setElementModel(find, 291)
								end
							end

							local selol = math.random(1,5)
	               			if selol == 1 then
		                    	setElementPosition (find, 3082.0498046875 ,-691.7705078125 ,9.5532503128052)
		                    	
	               			elseif selol == 2 then
		                    	setElementPosition (find, 3077.978515625 ,-691.5927734375 ,9.5532503128052)
		                    	
	               			elseif selol == 3 then
		                    	setElementPosition (find, 3073.916015625 ,-691.2939453125 ,9.5532503128052)
		                     	
                   			elseif selol == 4 then
		                     	setElementPosition (find, 3069.7998046875 ,-691.615234375 ,9.5532503128052)
		                     	
		            		elseif selol == 5 then
		                     	setElementPosition (find, 3065.619140625 ,-691.333984375 ,9.5532503128052)
		                     	
	                		end
				
------------------------------------------------------------------------------

		    			elseif tonumber(wanted) == 6 then
			                sendMojremMessage(thePlayer, targetPlayer, 6)
							outputChatBox("#00ff00[Department]:#ffffff Dastmozd :#00ff00 $180,000", thePlayer, 255, 255, 255, true)
							setPlayerWantedLevel(find,0)
							setElementData(accSys:getPlayerAcc(find), "pJailTime", 1050)
							setElementData(accSys:getPlayerAcc(find), "pAJailed", 3)
		                    outputChatBox("#ff0000[Arrest]: #fffffFShoma Tavasot "..getPlayerName(thePlayer).." Ba Tedad "..wanted.." Wanted Arrest Shodid!", find, 255, 255, 255, true)
							removePedFromVehicle ( find )
							givePlayerMoney(thePlayer, 180000)
							setElementData(find, "pCuffe", 0)
							takeAllWeapons ( find )
							
							setElementData(find, "pCuffed?",false)
							setElementData(find, "pCuffed2?",false)
							setElementFrozen(find,false)
							for i=1, #controlTable2 do

								toggleControl (find, controlTable2[i], true)
							end
							local Skinfemale = getElementData(accSys:getPlayerAcc(find), "pSex")
							local skinesh = math.random(1,3)
							
							if Skinfemale == 2 then
								setElementModel(find, 304)
		                    else
								if skinesh == 1 then
									setElementModel(find, 210)
								 elseif skinesh == 2 then
									setElementModel(find, 297)
								 elseif skinesh == 3 then
									setElementModel(find, 291)
								end
							end

							
							local selol = math.random(1,5)
	               			if selol == 1 then
		                    	setElementPosition (find, 3082.0498046875 ,-691.7705078125 ,9.5532503128052)
		                    	
	               			elseif selol == 2 then
		                    	setElementPosition (find, 3077.978515625 ,-691.5927734375 ,9.5532503128052)
		                    	
	               			elseif selol == 3 then
		                    	setElementPosition (find, 3073.916015625 ,-691.2939453125 ,9.5532503128052)
		                     	
                   			elseif selol == 4 then
		                     	setElementPosition (find, 3069.7998046875 ,-691.615234375 ,9.5532503128052)
		                     	
		            		elseif selol == 5 then
		                     	setElementPosition (find, 3065.619140625 ,-691.333984375 ,9.5532503128052)
							end
						end
					end
				end
			end
		end
	end
end)

function sendMojremMessage(root, mojremName, mojremWanted)
	local mojremName = tostring(mojremName)
	local mojremWanted = tonumber(mojremWanted)
	if getElementData(root, "loggedIn") == true then
		for k, v in ipairs (getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
				if hisFac > 0 and hisFac < 4 then
					outputChatBox("#1e47ff[DP-Warn]:#ffffff Police "..getPlayerName(root).." Mojrem #1e47ff"..mojremName.."#ffffff Ra Ba #1e47ff"..mojremWanted.." Wanted #ffffffArrest Kard!", v, 255, 255, 255, true)
				end
			end
		end
	end
end
local skinlebas = {
	{7,26,27,28,32,40,64,75},
}
addCommandHandler("lebas",function(thePlayer,cmd,id)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if id then
			local id = tonumber(id)
			if skinlebas[1][id] then
				setElementModel(thePlayer,skinlebas[1][id])
				tonumber(getElementData(accSys:getPlayerAcc(v), "fSkin"))
			else
				outputChatBox("#C0C0C0Syntax: /"..cmd.." <Az 1 ~ "..#skinlebas[1]..">", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /"..cmd.." <LebasId>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#FF0000[Error]: Shoma Dastresi Be In Cmd Ra Nadarid", thePlayer, 255, 255, 255, true)
	end
end)