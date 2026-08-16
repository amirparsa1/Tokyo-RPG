local miscSys = exports["misc"]
local accSys = exports["Accounts-System"]
local fasele = 2.5

addCommandHandler("heal",
function ( thePlayer, command, player, amount)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 4 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Pezeshk Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if find then
		if find ~= thePlayer then
			if amount then
				amount = tonumber( amount )
				if amount > 99 and amount < 301 then
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
									setElementData(find, "gheymathealmedic", amount)
									outputChatBox("#ff7700[Tavajoh]: #ffffffMedic #ff7700"..getPlayerName(thePlayer).." #ffffffMikhad Shoma Ro Darman Kone! | Hazine: #00ff00$"..amount.."", find, 0, 255, 0,true)
									outputChatBox("#FFFFFFBaraye Darman Shodan Bezan: /aheal", find, 0, 255, 0,true)
									outputChatBox("#00FFFF[Heal] Darkhast Baraye "..getPlayerName(find).." Ersal Shod.", thePlayer, 0, 255, 0,true)
									setTimer(
									function()
										if getElementData(find, "healer") ~= nil then
											setElementData(find , "healer", nil)
											--outputChatBox("#ff0000* Darkhast'e Darman Pas Az 15 Sanie Automatic Rad Shod! ", find, 0, 255, 0,true)
											--outputChatBox("#ff0000* Darkhast'e Darman Player "..getPlayerName(find).." Pas Az 15 Sanie Automatic Rad Shod! ", thePlayer, 0, 255, 0,true)
										end
									end , 30000, 1)
								else
									outputChatBox("#ff0000✖️ #ffffffShoma Az Ghabl Yek Darkhast Darman Be In Player Dadid!", thePlayer, 0, 255, 0,true)
								end
							else
								outputChatBox("#ff0000✖️ #ffffffIn Player Niaz Be Darman Nadarad!", thePlayer, 0, 255, 0,true)
							end
						else
							outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffMeghdar Heal Bayad Beyn $100 ta $300 Bashad!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /heal <PartOfName/ID> <Price>", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBe Khodet Nemitoni Heal Bedi!", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /heal <PartOfName/ID> <Price>", thePlayer, 0, 255, 0,true)
	end
end
)

addCommandHandler("aheal",
function(thePlayer, cmd)
	if getElementData(thePlayer, "healer") == nil then
		outputChatBox("#ff0000✖️ #ffffffShoma Darkhast Darman Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	local GheymatHeal = getElementData(thePlayer, "gheymathealmedic")
	if tonumber(money) > GheymatHeal then
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
					setElementHealth ( thePlayer, 100)--inja am fasele bayad ezafe beshe!
					takePlayerMoney(thePlayer, GheymatHeal)
					outputChatBox("#ff7700[Tavajoh]: #ffffffShoma Tavasot Medic #ff7700"..getElementData(thePlayer, "healer").." #ffffff Ba Hazine #ff0000$"..GheymatHeal.." #ffffffDarman Shodid.", thePlayer, 255, 255, 255, true)
					outputChatBox("#ff7700[Tavajoh]: #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffDarkhast Darman Ra Accept Kard. Dastmozd: #00ff00$"..GheymatHeal.."", find, 255, 255, 255, true)
					givePlayerMoney (find , GheymatHeal)
					setTimer(function()
						setElementData(thePlayer ,"healer", nil)
					end , 100, 1)
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Be $"..GheymatHeal.." Pool Baraye Darman Shodan Niaz Darid!", thePlayer, 255, 255, 255, true)
	end
end
)

addCommandHandler("service",
function(thePlayer, command, type)
	local type = tostring(type)
	if type == "medic" then
		if getElementData(thePlayer, "loggedIn") == true then
			if getElementData(thePlayer, "needMedic") ~= true then
				if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") ~= 4 then
					setElementData(thePlayer, "needMedic", true, false)
					for k, v in ipairs (getElementsByType("player")) do
						if getElementData(v, "loggedIn") == true then
							if getElementData(accSys:getPlayerAcc(v), "pMember") == 4 then 
								outputChatBox("#f46e42[Medic Service]: #ffffffPlayer #f46e42"..getPlayerName(thePlayer).." ("..getElementData(thePlayer, "TarafID")..") #ffffffDarkhaste Service Dad.", v, 255, 255, 255, true)
							end
						end
					end
						outputChatBox("#00ff00[Medic Service]: #ffffffDarkhast Shoma Baraye Team Pezeshki Ersal Shod.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#ff0000✖️ #ffffffShoma Khodeton Medic Hastid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffShoma Yek Darkhast Az Ghabl Darid!", thePlayer, 255, 255, 255, true)
			end
		end
	elseif type == "mechanic" then
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
	else
		outputChatBox("#C0C0C0Bezan: /service <mechanic>/<medic>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("services",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 4 then
		outputChatBox ( "#d5e3e3▬▬▬▬(#2BEC2B Medic Requests #d5e3e3)▬▬▬▬", thePlayer, 230,0,0 ,true)
			for k, v in ipairs (getElementsByType("player")) do
				if getElementData(v, "loggedIn") == true then
				   
					if getElementData(v, "needMedic") == true then
					
					outputChatBox ( "#ffffffID: #f46e42"..getElementData(v, "TarafID").." #ffffff| Name:  #f46e42"..getPlayerName(v).."", thePlayer, 230,0,0 ,true)
						
					end
					
				end
			end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		end
	end
end)

-- #zezaw
addCommandHandler("aservice",
function(thePlayer, command, name)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 4 then
			local find = miscSys:findPlayer(name)
			if find then
				if getElementData(thePlayer, "DarHaleFind") ~= 6 then
					if getElementData(find, "needMedic") == true then
						local myName = getPlayerName(thePlayer)
						local yourName = getPlayerName(find)
						setElementData(find, "needMedic", nil, false)
						setElementData(find, "onMedic", tostring(myName), false)
						setElementData(thePlayer, "onMedic", tostring(yourName), false)
						outputChatBox("#f46e42[Medic Service]: #ffffffShoma Darkhaste Service Player #f46e42"..yourName.." #ffffffRa Ghabol Kardid.", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00[GPS]: #ffffffIn Player Baraye Shoma Dar Map Moshakhas Shod.", thePlayer, 255, 255, 255, true)
						outputChatBox("#f46e42[Medic Service]: #ffffffMedic #f46e42"..myName.." #ffffffDarkhaste Service Shoma Ra Ghabol Kard.", find, 255, 255, 255, true)
							setElementData(thePlayer, "DarHaleFind", 6)
							if ( getElementInterior(find) >= 1 ) then
								setElementData(find, "VaziatInterior", 1)
							else
								setElementData(find, "VaziatInterior", 2)
							end
							local Yaru = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
							setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", Yaru)
							
							--function sd ()
								if tonumber(getElementData(accSys:getPlayerAcc(find), "pID")) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAvAd")) then
									if getElementData(thePlayer, "DarHaleFind") == 6 then
										if ( getElementInterior(find) >= 1 ) then
											if getElementData(find, "VaziatInterior") == 1 then
												local blipa = math.random(1,10)
												if tonumber(blipa) == 1 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInterior, getRootElement(), false)
													setElementData(BlipInterior, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 2 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior1 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInterior1, getRootElement(), false)
													setElementData(BlipInterior1, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior1, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior1)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 3 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior2 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInterior2, getRootElement(), false)
													setElementData(BlipInterior2, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior2, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior2)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 4 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior3 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInterior3, getRootElement(), false)
													setElementData(BlipInterior3, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior3, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior3)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 5 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior4 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInterior4, getRootElement(), false)
													setElementData(BlipInterior4, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior4, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior4)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 6 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior5 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInterior5, getRootElement(), false)
													setElementData(BlipInterior5, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior5, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior5)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 7 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior6 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInterior6, getRootElement(), false)
													setElementData(BlipInterior6, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior6, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior6)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 8 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior7 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInterior7, getRootElement(), false)
													setElementData(BlipInterior7, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior7, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior7)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 9 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior8 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInterior8, getRootElement(), false)
													setElementData(BlipInterior8, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior8, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior8)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												 elseif tonumber(blipa) == 10 then
													setElementData(find, "VaziatInterior", 2)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInterior9 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInterior9, getRootElement(), false)
													setElementData(BlipInterior9, "exclusiveBlip", true)
													setElementVisibleTo(BlipInterior9, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip", BlipInterior9)
													destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
												end
											end
											
										 elseif ( getElementInterior(find) == 0 ) then	
											if getElementData(find, "VaziatInterior") == 2 then
												local blipaInt = math.random(1,10)
												if tonumber(blipaInt) == 1 then
													setElementData(find, "VaziatInterior", 1)
													local Blip = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip, getRootElement(), false)
													setElementData(Blip, "exclusiveBlip", true)
													setElementVisibleTo(Blip, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 2 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip1 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip1, getRootElement(), false)
													setElementData(Blip1, "exclusiveBlip", true)
													setElementVisibleTo(Blip1, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip1)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 3 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip2 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip2, getRootElement(), false)
													setElementData(Blip2, "exclusiveBlip", true)
													setElementVisibleTo(Blip2, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip2)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 4 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip3 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip3, getRootElement(), false)
													setElementData(Blip3, "exclusiveBlip", true)
													setElementVisibleTo(Blip3, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip3)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 5 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip4 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip4, getRootElement(), false)
													setElementData(Blip4, "exclusiveBlip", true)
													setElementVisibleTo(Blip4, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip4)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 6 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip5 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip5, getRootElement(), false)
													setElementData(Blip5, "exclusiveBlip", true)
													setElementVisibleTo(Blip5, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip5)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 7 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip6 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip6, getRootElement(), false)
													setElementData(Blip6, "exclusiveBlip", true)
													setElementVisibleTo(Blip6, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip6)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 8 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip7 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip7, getRootElement(), false)
													setElementData(Blip7, "exclusiveBlip", true)
													setElementVisibleTo(Blip7, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip7)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 9 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip8 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip8, getRootElement(), false)
													setElementData(Blip8, "exclusiveBlip", true)
													setElementVisibleTo(Blip8, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip8)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												 elseif tonumber(blipaInt) == 10 then
												 	setElementData(find, "VaziatInterior", 1)
													local Blip9 = createBlipAttachedTo ( find )
													setElementVisibleTo(Blip9, getRootElement(), false)
													setElementData(Blip9, "exclusiveBlip", true)
													setElementVisibleTo(Blip9, thePlayer, true)
													setElementData(thePlayer, "nowMedicBlip2", Blip9)
													destroyElement(getElementData(thePlayer, "nowMedicBlip"))
												end
											end
										end
									end
								end
							--end
							--addEvent("RefreshkonFindMedic",true)
							--addEventHandler("RefreshkonFindMedic", root, sd)
						for index, sendToMedics in ipairs( getElementsByType("player") ) do 
							if getElementData(sendToMedics, "loggedIn") == true then
								if sendToMedics ~= thePlayer then
									if tonumber(getElementData(accSys:getPlayerAcc(sendToMedics), "pMember")) == 4 then
										outputChatBox("#f46e42[Medic-Service]: #ffffffMedic #f46e42"..myName.." #ffffffDarkhaste Service Player #f46e42"..yourName.." #ffffffRa Qabool Kard!", sendToMedics, 255, 255, 255, true)
									end
								end
							end
						end
					else
						outputChatBox("#ff0000✖️ #ffffffIn Player Darkhaste Service Nakarde Ast!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Find Kardan Player Digari Hastid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#C0C0C0Bezan: /aservice <PartOfName/ID>", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)


addCommandHandler("cfind",
function(thePlayer, command, target, MedicBlipGunShop, medicBlip)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 4 then
		if getElementData(thePlayer, "DarHaleFind") == 6 then
			if getElementData(thePlayer, "loggedIn") ~= nil then
				setElementData(thePlayer, "DarHaleFind", 0)
				local myName = getPlayerName(thePlayer)
				outputChatBox("#ff0000[GPS]: #ffffffPlayer Find Shode cfind Shod.", thePlayer, 255, 255, 255, true)		
				destroyElement(getElementData(thePlayer, "nowMedicBlip"))
				destroyElement(getElementData(thePlayer, "nowMedicBlip2"))
				setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", 0)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
end)


--> Darman Shodane Player Az Interior Medic <--
function BindKonDarmanSho (hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		exports["notf"]:addNotification(hitElement, "Baraye Darman Shodan Ba Hazine $45 ( B ) Ra Feshar Dahid. " , 'info')
		triggerClientEvent ( hitElement, "Playinfo", hitElement)
		bindKey( hitElement, "B", "down", SetKonSkino )
	end
end

function UnBindKonSetSkin(hitElement,matchingDimension)
	if hitElement and getElementType(hitElement) == "player" then
		unbindKey( hitElement, "B", "down", SetKonSkino )
		unbindKey( hitElement, "B", "up", SetNakonSkin )
	end
end

-- fixe Kill Shodan Hengame Heal
addEventHandler( "onPlayerWasted", getRootElement( ),
function()
	unbindKey( source, "B", "down", SetKonSkino )
	unbindKey( source, "B", "up", SetNakonSkin )
end
)

function SetKonSkino( thePlayer )
local PlayerMoney = getPlayerMoney(thePlayer)
	if getElementHealth (thePlayer) >= 1 then
		if getElementHealth ( thePlayer ) ~= 100 then
			if ( PlayerMoney >= 45) then
				triggerClientEvent("PlayMovafagh", thePlayer, thePlayer)
				takePlayerMoney(thePlayer,45)
				setElementHealth ( thePlayer, 100)
				exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Darman Shodid." , 'success')
			else
				exports["notf"]:addNotification(thePlayer, "Pole Shoma Kafi Nemibashad!" , 'error')
				triggerClientEvent("PlayError", thePlayer, thePlayer)
			end
		else
			exports["notf"]:addNotification(thePlayer, "Shoma Niaz Be Darman Nadarid!" , 'error')
			triggerClientEvent("PlayError", thePlayer, thePlayer)
		end
	end
end

function createPomps ()
    Markeresh = createMarker(241.365234375 ,149.4990234375 ,1019.8000 , "cylinder",  1.2,237,170,15,60)
	setElementInterior ( Markeresh, 3 )
    addEventHandler("onMarkerHit",Markeresh, BindKonDarmanSho )
		addEventHandler( "onMarkerLeave", Markeresh, UnBindKonSetSkin )
end	
createPomps()

