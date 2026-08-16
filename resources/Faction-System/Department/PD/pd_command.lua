local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

local pdduty = createPickup ( 255.384765625, 77.291015625, 1003.640625 , 3, 1275, 0)
setElementInterior ( pdduty, 6 )
local pdorder = createPickup ( 219.5810546875, 69.1435546875, 1005.0390625 , 3, 1242, 0)
setElementInterior ( pdorder, 6 )
fasele = 2.5

--/duty For PD
addCommandHandler("duty",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(pdduty)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
		if tonumber(getElementData(thePlayer, "OnDuty")) == 1 then
			setPedArmor(thePlayer, 0)
			takeAllWeapons(thePlayer)
			setElementData(thePlayer, "OnDuty", 0)
			outputChatBox("#ff0000[Tavajoh]: #ffffffShoma Az Halate Anjam Vazife Kharej Shodid.", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer, "OnDuty", 1)
			setPedArmor(thePlayer, 100)
			setElementHealth(thePlayer, 100)
			giveWeapon(thePlayer,23,10)
			outputChatBox("#00ff00[Tavajoh]: #ffffffShoma Dar Halate Anjam Vazife Hastid.", thePlayer, 255, 255, 255, true)
		end
		end
		end
end)

--/order
addCommandHandler("order",
function(thePlayer, cmd, orderID)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(pdorder)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local orderID = tonumber(orderID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			if tonumber(orderID) == 1 then
                takeWeapon(thePlayer, 30)
				takeWeapon(thePlayer, 24)
				takeWeapon(thePlayer, 29)
				giveWeapon(thePlayer,30,1000)
				giveWeapon(thePlayer,29,1000)
				giveWeapon(thePlayer,3,1)
				outputChatBox("#00ff00☑️ #ffffffOrder 1 Be Shoma Dade Shod.", thePlayer, 255, 255, 255, true)
			elseif tonumber(orderID) == 2 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 2 then
                    takeWeapon(thePlayer, 25)
					takeWeapon(thePlayer, 22)
					giveWeapon(thePlayer,25,2000)
					giveWeapon(thePlayer,31,2000)
					giveWeapon(thePlayer,3,1)
					outputChatBox("#00ff00☑️ #ffffffOrder 2 Be Shoma Dade Shod.", thePlayer, 255, 255, 255, true)
				else 
					outputChatBox("#ff0000✖️ #ffffffIn Order Baraye Rank (+3) Mibashad.", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(orderID) == 3 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
					takeWeapon(thePlayer, 27)
					takeWeapon(thePlayer, 24)
					takeWeapon(thePlayer, 17)
					giveWeapon(thePlayer,17,5)
					giveWeapon(thePlayer,31,3000)
					giveWeapon(thePlayer,28,3000)
					giveWeapon(thePlayer,27,1000)
					giveWeapon(thePlayer,3,1)
					outputChatBox("#00ff00☑️ #ffffffOrder 3 Be Shoma Dade Shod.", thePlayer, 255, 255, 255, true)
				else 
					outputChatBox("#ff0000✖️ #ffffffIn Order Baraye Rank (+5) Mibashad.", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffMeqdar Order Bayad <1~3> Bashad!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
)

--/find
function gps(thePlayer, cmd, name)
	if name then
		local find = miscSys:findPlayer(name)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
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
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
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