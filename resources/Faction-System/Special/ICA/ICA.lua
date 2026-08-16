local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
function SendSystemMasage(matn,target)
	outputChatBox("#778899(Faction-System):#FFFFFF "..matn,target,255,255,255,true)
end

function ICAMassege(systemname,Message)
	for index, getAdmins in ipairs( getElementsByType("player") ) do 
		if getElementData(getAdmins, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(getAdmins), "pMember")) == 5 then
				outputChatBox ("#000000("..systemname.."):#FFFFFF "..Message , getAdmins, 255,255,255 ,true)
			end
		end
	end
end

markerteleporter = createMarker( 3530 ,-2064,-3,"cylinder", 5, 100, 0, 0, 255 )
markerteleporter2 = createMarker( 2854.162109375 ,-2067.966796875 ,7,"cylinder", 5, 100, 0, 0, 255 )
addCommandHandler("tp",function(thePlayer)
	if isElement( thePlayer ) then

		if isPedInVehicle(thePlayer) then
			local thecar = getPedOccupiedVehicle(thePlayer)
			local x, y, z = getElementPosition( thePlayer )
			local fx, fy, fz = getElementPosition( markerteleporter )
			local myInt = getElementInterior(thePlayer)
			local myDim = getElementDimension(thePlayer)
			local yourInt = getElementInterior(markerteleporter)
			local yourDim = getElementDimension(markerteleporter)
			local fx2, fy2, fz2 = getElementPosition( markerteleporter2 )
			local yourInt2 = getElementInterior(markerteleporter2)
			local yourDim2 = getElementDimension(markerteleporter2)
			local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
			local de2 = getDistanceBetweenPoints3D(x,y,z,fx2, fy2, fz2)
			if myInt == yourInt and myDim == yourDim and de < 7 then
				setElementPosition(thecar,fx2, fy2, fz2+4)
			elseif myInt == yourInt2 and myDim == yourDim2 and de2 < 7 then
				setElementPosition(thecar,fx, fy, fz+4)

			end
		end
		
	end
end)
function TimerContract(players,target,NameTarget)
	setTimer(function()
		if getElementData(target, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(target), "pHeadValue")) > 1 and tostring(getElementData(accSys:getPlayerAcc(target), "pContractBy")) == player then
				for _,player in ipairs (getElementsByType("player")) do
					if getPlayerName(player) == players then
						outputChatBox("#00ff00[X]: #ffffffShoma Mablaghe $"..(tonumber(getElementData(accSys:getPlayerAcc(target), "pHeadValue"))/2).." Baraye Laghv Shodan Contract Be Shoma Bragasht Dade Shod!", target, 0, 255, 0, true)
						givePlayerMoney(player,(tonumber(getElementData(accSys:getPlayerAcc(target), "pHeadValue"))/2))
						setElementData(accSys:getPlayerAcc(target), "pHeadValue",0)
						setElementData(accSys:getPlayerAcc(target), "pContractBy","no-one")
						setElementData(accSys:getPlayerAcc(target), "pHowContract",0)
						return true
					end
				end
				local LastFamily = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pName` = ? ",players)
				local result, numrows = dbPoll(LastFamily, 500)
				if (result and numrows > 0) then
					for index, row in pairs(result) do
						local queryupdatecash = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET `pCash` = ? WHERE `pName` = ?", row['pCash']+(tonumber(getElementData(accSys:getPlayerAcc(target), "pHeadValue"))/2),players)
						dbFree(LastFamily)
						dbFree(queryupdatecash)
					end
				end
			end
		else
			local PeydaKon = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pName` = ? AND `pContractBy` = ? AND `pHeadValue` > 1",NameTarget,players)
			local result, numrows = dbPoll(PeydaKon, 500)
			if (result and numrows > 0) then
				for index, row in pairs(result) do

					for _,player in ipairs (getElementsByType("player")) do
						if getPlayerName(player) == players then
							outputChatBox("#00ff00[X]: #ffffffShoma Mablaghe $"..(tonumber(getElementData(accSys:getPlayerAcc(target), "pHeadValue"))/2).." Baraye Laghv Shodan Contract Be Shoma Bragasht Dade Shod!", target, 0, 255, 0, true)
							givePlayerMoney(player,(tonumber(row['pHeadValue'])/2))
							local queryupdatecash = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET  `pHeadValue` = 0, `pContractBy` = '' WHERE `pID` = ?",row['pID'])
							dbFree(queryupdatecash)
							return true
						end
					end

					local LastFamily = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pName` = ? ",players)
					local result2, numrows2 = dbPoll(LastFamily, 500)
					if (result2 and numrows2 > 0) then
						for index, row2 in pairs(result2) do
							local queryupdatecash = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET `pCash` = ? WHERE `pName` = ?", row2['pCash']+row['pHeadValue'],players)
							dbFree(LastFamily)
							local queryupdatecash = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET  `pHeadValue` = 0, `pContractBy` = '' WHERE `pID` = ?",row['pID'])
							dbFree(queryupdatecash)
						end
					end
					

				end
			end
			dbFree(PeydaKon)
		end
	end,5400000,1)
end

local noecont = "Koshtan"
function SetConnteract( thePlayer, player, offer,noecon )
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			local offer = tonumber(offer)
			if offer then
				if tonumber(offer) > 999 then
					if tonumber(getElementData(accSys:getPlayerAcc(find), "pHeadValue")) == 0 then
						if tonumber(getPlayerMoney(thePlayer) ) >= offer then
							local targetPlayer = getPlayerName ( find )
							takePlayerMoney ( thePlayer, tonumber(offer) )
							setElementData(accSys:getPlayerAcc(find), "pHeadValue", tonumber(offer))
							setElementData(accSys:getPlayerAcc(find), "pHowContract", tonumber(noecon))
							setElementData(accSys:getPlayerAcc(find), "pContractBy", getPlayerName(thePlayer))
							TimerContract(getPlayerName(thePlayer),player,getPlayerName(player))
							if tonumber(getElementData(accSys:getPlayerAcc(find),"pHowContract"))  == 1 then
								noecont = "Koshtan"
							elseif tonumber(getElementData(accSys:getPlayerAcc(find),"pHowContract")) == 2 then
								noecont = "Gerogan Gerefrane"
							elseif tonumber(getElementData(accSys:getPlayerAcc(find),"pHowContract"))  == 3 then
								noecont = "Azab Dadan"
							end
							outputChatBox("#00ff00[Done]: #ffffffShoma Mablaghe $"..offer.." Baraye ["..noecont.."] Player "..targetPlayer.." Jayeze Gozashtid!", thePlayer, 0, 255, 0, true)
						else
							outputChatBox("#ff0000[Error]: #ffffffShoma In Meghdar Pol Nadarid!", thePlayer, 255, 22, 22, true)
						end
					else
					 	outputChatBox("#ff0000[Error]: #ffffffIn Player Az Ghabl Contract Darad!", thePlayer, 255, 22, 22, true)
					end
				else
				    outputChatBox("#ff0000[Error]: #ffffffGheymat Contract Bayad Balaye $1,000 Bashad!", thePlayer, 255, 22, 22, true)
				end
			else
				outputChatBox("#ff0000[Error]: #ffffffPrice Contract Ra Vared Konid!", thePlayer, 255, 22, 22, true)
			end

		else
            outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
	else
		outputChatBox("#C0C0C0Syntax: /contract <PartOfName/ID> <Price>", thePlayer, 255, 22, 22, true)
	end
end
addEvent("SetConnteract",true)
addEventHandler("SetConnteract", root, SetConnteract)

function contract(player)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 6 then
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if getElementData(accSys:getPlayerAcc(v), "pHeadValue") > 0 then
					if tonumber(getElementData(accSys:getPlayerAcc(v),"pHowContract"))  == 1 then
						noecont = "Koshtan"
					elseif tonumber(getElementData(accSys:getPlayerAcc(v),"pHowContract")) == 2 then
						noecont = "Gerogan Gerefrane"
					elseif tonumber(getElementData(accSys:getPlayerAcc(v),"pHowContract"))  == 3 then
						noecont = "Azab Dadan"
					end
					outputChatBox("#ff0000"..getPlayerName(v)..": #ffffff"..getElementData(accSys:getPlayerAcc(v), "pHeadValue").."#00ff00$ #000000Tavasot: #FF0000[ #FFFFFF"..getElementData(accSys:getPlayerAcc(v), "pContractBy").." #FF0000] #FFFFFFNoeContract: #FF0000"..noecont, player, 255, 22, 22, true)
				end
			end
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad ICA/CIA Bashid!", player, 255, 22, 22, true)
	end
end
addCommandHandler("contracts", contract)

addCommandHandler("setcontract",
function ( thePlayer, command, player, contract )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
		if contract then
			local find = miscSys:findPlayer ( player )
			local contract = tonumber(contract)
			local targetPlayer = getPlayerName ( find )
			setElementData(accSys:getPlayerAcc(find), "pHeadValue", contract)
			outputChatBox("#00ff00[Done]: #ffffffShoma Contract'e #00ff00"..targetPlayer.." #ffffffRa Be #00ff00$"..contract.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#C0C0C0Syntax: /setcontract <PartOfName/ID> <Price>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)

function killcontract ( ammo, attacker, weapon, bodypart )
	if ( attacker ) then
	    if tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember")) == 5 then
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
addEventHandler ( "onPlayerWasted", getRootElement(), killcontract )

local hitmanduty = createPickup ( 243.88945007324 ,1392.78515625 ,-15.933300018311 , 3, 1275, 0)
setElementInterior ( hitmanduty, 8 )
setElementDimension ( hitmanduty, 10 )
local hitmanorder = createPickup ( 238.20195007324 ,1392.8720703125 ,-15.933300018311 , 3, 1242, 0)
setElementInterior ( hitmanorder, 8 )
setElementDimension ( hitmanorder, 10 )
fasele = 2.5
addCommandHandler("duty",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(hitmanduty)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if de < fasele then
		if tonumber(getElementData(thePlayer, "OnDuty")) == 1 then
			setPedArmor(thePlayer, 0)
			takeAllWeapons(thePlayer)
			setElementData(thePlayer, "OnDuty", 0)
			outputChatBox("#ff0000[Faction-System]: #ffffffShoma Alan Kharej Az Anjam Vazife Shodid!", thePlayer, 255, 255, 255, true)
		else
			setElementHealth(thePlayer, 100)
			setPedArmor(thePlayer, 100)
			setElementData(thePlayer, "OnDuty", 1)
			outputChatBox("#00ff00[Faction-System]: #ffffffShoma Alan Dar Hale Anjam Vazife Hastid!", thePlayer, 255, 255, 255, true)
		end
		end
		end
end)

addCommandHandler("order",
function(thePlayer, cmd, orderID)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(hitmanorder)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local orderID = tonumber(orderID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
	if de < fasele then
    if tonumber(getElementData(thePlayer, "OnDuty")) == 1 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 0 then
    if orderID == 1 then
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



addCommandHandler("hide",function(thePlayer,CMD,Target)

	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then
			if Target then
				local find = miscSys:findPlayer ( Target )
				if find then
					if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) then
						if getElementData(find,"NameTagIsShow?") == false then
							setPlayerNametagShowing( find, false )
							setElementData(find,"NameTagIsShow?", true )
							ICAMassege("ICA-Radio","#FFFF00Tavajoh #FFFFFF: #000000"..getPlayerName(find).." #FFFFFFTavasot #000000"..getPlayerName(thePlayer).." #FFFFFFBe Sorat Hide Dar Amad .")
						else
							setElementData(find,"NameTagIsShow?",false)
							setPlayerNametagShowing( find, true )
							ICAMassege("ICA-Radio","#FFFF00Tavajoh #FFFFFF: #000000"..getPlayerName(find).." #FFFFFFTavasot #000000"..getPlayerName(thePlayer).." #FFFFFFAz Hide Dar Amad .")
						end
					else
						SendSystemMasage("#FF0000In Fard Ozv ICA Nist",thePlayer)
					end
				else
    		        outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
				end
			else
				outputChatBox("#C0C0C0Syntax: /"..CMD.." <PartOfName/ID>", thePlayer, 255, 255, 255, true)
			end
		else
			SendSystemMasage("#FF0000Baraye Inkar Bayad Leader Bashid",thePlayer)
		end
	end
	
end)

--/find
function gps(thePlayer, cmd, name)
	if name then
		local find = miscSys:findPlayer(name)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
			if find then

					if getElementData(find, "inevente") == true then
						outputChatBox("#ff0000✖️ #ffffffEmkane Find Player Haye Dakehel Event Nist!", thePlayer, 255, 255, 255, true)
						return
					end
					if getElementData(find, "inpaintball") == true then
						outputChatBox("#ff0000✖️ #ffffffEmkane Find Player Haye Dakehel GameNet Nist", thePlayer, 255, 255, 255, true)
						return
					end
					if tonumber(getElementData(thePlayer, "DarHaleFindePd")) ~= 3 then
						if getPlayerName(thePlayer) ~= getPlayerName(find) then
							setElementData(thePlayer, "DarHaleFindePd", 3)
								if ( getElementInterior(find) >= 1 ) then
									setElementData(find, "VaziatInteriorPd", 1)
								else
									setElementData(find, "VaziatInteriorPd", 2)
								end
								local Yaru = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
								setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", Yaru)

								--function pd ()
									--if tonumber(getElementData(accSys:getPlayerAcc(find), "pID")) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAvAd")) then
										if getElementData(thePlayer, "DarHaleFindePd") == 3 then
											if ( getElementInterior(find) >= 1 ) then
												if getElementData(find, "VaziatInteriorPd") == 1 then
													local blipPd = math.random(1,10)
													if tonumber(blipPd) == 1 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
														setElementVisibleTo(BlipInteriorPd, getRootElement(), false)
														setElementData(BlipInteriorPd, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 2 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd1 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd1, getRootElement(), false)
														setElementData(BlipInteriorPd1, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd1, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd1)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 3 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd2 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd2, getRootElement(), false)
														setElementData(BlipInteriorPd2, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd2, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd2)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 4 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd3 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd3, getRootElement(), false)
														setElementData(BlipInteriorPd3, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd3, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd3)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 5 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd4 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd4, getRootElement(), false)
														setElementData(BlipInteriorPd4, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd4, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd4)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 6 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd5 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd5, getRootElement(), false)
														setElementData(BlipInteriorPd5, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd5, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd5)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 7 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd6 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
														setElementVisibleTo(BlipInteriorPd6, getRootElement(), false)
														setElementData(BlipInteriorPd6, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd6, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd6)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 8 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd7 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd7, getRootElement(), false)
														setElementData(BlipInteriorPd7, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd7, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd7)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 9 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd8 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
														setElementVisibleTo(BlipInteriorPd8, getRootElement(), false)
														setElementData(BlipInteriorPd8, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd8, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd8)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													 elseif tonumber(blipPd) == 10 then
														setElementData(find, "VaziatInteriorPd", 2)
														local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
														local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
														local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
														local BlipInteriorPd9 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
														setElementVisibleTo(BlipInteriorPd9, getRootElement(), false)
														setElementData(BlipInteriorPd9, "exclusiveBlip", true)
														setElementVisibleTo(BlipInteriorPd9, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip", BlipInteriorPd9)
														destroyElement(getElementData(thePlayer, "nowPdBlip2"))
													end
												end

											 elseif ( getElementInterior(find) == 0 ) then	
												if getElementData(find, "VaziatInteriorPd") == 2 then
													local blipaIntPd = math.random(1,10)
													if tonumber(blipaIntPd) == 1 then
														setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd, getRootElement(), false)
														setElementData(BlipPd, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 2 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd1 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd1, getRootElement(), false)
														setElementData(BlipPd1, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd1, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd1)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 3 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd2 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd2, getRootElement(), false)
														setElementData(BlipPd2, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd2, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd2)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 4 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd3 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd3, getRootElement(), false)
														setElementData(BlipPd3, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd3, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd3)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 5 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd4 = createBlipAttachedTo ( find)
														setElementVisibleTo(BlipPd4, getRootElement(), false)
														setElementData(BlipPd4, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd4, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd4)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 6 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd5 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd5, getRootElement(), false)
														setElementData(BlipPd5, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd5, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd5)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 7 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd6 = createBlipAttachedTo ( find)
														setElementVisibleTo(BlipPd6, getRootElement(), false)
														setElementData(BlipPd6, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd6, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd6)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 8 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd7 = createBlipAttachedTo ( find)
														setElementVisibleTo(BlipPd7, getRootElement(), false)
														setElementData(BlipPd7, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd7, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd7)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 9 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd8 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd8, getRootElement(), false)
														setElementData(BlipPd8, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd8, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd8)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													 elseif tonumber(blipaIntPd) == 10 then
													 	setElementData(find, "VaziatInteriorPd", 1)
														local BlipPd9 = createBlipAttachedTo ( find )
														setElementVisibleTo(BlipPd9, getRootElement(), false)
														setElementData(BlipPd9, "exclusiveBlip", true)
														setElementVisibleTo(BlipPd9, thePlayer, true)
														setElementData(thePlayer, "nowPdBlip2", BlipPd9)
														destroyElement(getElementData(thePlayer, "nowPdBlip"))
													end

												end

											end
										end
									--end
								--end
								--addEvent("RefreshkonFindPd",true)
								--addEventHandler("RefreshkonFindPd", root, pd)
						outputChatBox("#00ff00In Player Ba Movafaghiat Find Shod!", thePlayer, 255, 255, 255, true)
						outputChatBox("Baraye Cancel Kardan: /cfind", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffKhodeto Nemitoni Find Koni!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Find Hastid Ebteda /cfind Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /find <PartOfName/ID>", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("find", gps)

--/cfind
function cfind(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		if getElementData(thePlayer, "DarHaleFindePd") == 3 then
			destroyElement(getElementData(thePlayer, "nowPdBlip"))
			destroyElement(getElementData(thePlayer, "nowPdBlip2"))
			outputChatBox("#ff0000Shoma Find Ra Cancel Kardid!", thePlayer, 255, 255, 255, true)
			setElementData(thePlayer, "DarHaleFindePd", 0)
			--setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", 0)
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
 end
addCommandHandler("cfind", cfind)

function randomroyarucontractsetkon()
	local thePlayer = getRandomPlayer()
	if getElementData(thePlayer, "loggedIn") ~= true then
		randomroyarucontractsetkon()
		return
	end
	
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 5 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 3 then
			local money = math.random(1000,5000)
			local contract = getElementData(accSys:getPlayerAcc(thePlayer), "pHeadValue")
			local nextcontract = tonumber(contract) + tonumber(money)
			setElementData(accSys:getPlayerAcc(thePlayer), "pHeadValue",nextcontract)
			setElementData(accSys:getPlayerAcc(thePlayer), "pContractBy", "ICA-Radio")

			setElementData(accSys:getPlayerAcc(thePlayer),"pHowContract",1)
			setTimer( randomroyarucontractsetkon(), math.random( 900000, 1800000 ), 1 )
		else
			randomroyarucontractsetkon()
		end
end
setTimer( randomroyarucontractsetkon(), math.random( 900000, 1800000 ), 1 )