local miscSys = exports["misc"]
local accSys = exports["Accounts-System"]
local ngduty = createPickup ( 299.2802734375 ,187.359375 ,1007.171875 , 3, 1275, 0)
setElementInterior ( ngduty, 3 )
local ngorder = createPickup ( 275.83203125 ,186.5830078125 ,1007.171875 , 3, 1242, 0)
setElementInterior ( ngorder, 3 )

--/duty For NG
addCommandHandler("duty",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(ngduty)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6  then
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


--/order For NG
addCommandHandler("order",
function(thePlayer, cmd, orderID)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(ngorder)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local orderID = tonumber(orderID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			if tonumber(orderID) == 1 then
                    takeWeapon(thePlayer, 30)
					takeWeapon(thePlayer, 24)
					takeWeapon(thePlayer, 29)
				giveWeapon(thePlayer,30,1000)
				giveWeapon(thePlayer,24,1000)
				giveWeapon(thePlayer,29,1000)
				giveWeapon(thePlayer,3,1)
				outputChatBox("#00ff00☑️ #ffffffOrder 1 Be Shoma Dade Shod.", thePlayer, 255, 255, 255, true)
			elseif tonumber(orderID) == 2 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 2 then
                    takeWeapon(thePlayer, 25)
					takeWeapon(thePlayer, 31)
					takeWeapon(thePlayer, 22)
					giveWeapon(thePlayer,25,2000)
					giveWeapon(thePlayer,31,2000)
					giveWeapon(thePlayer,22,2000)
					giveWeapon(thePlayer,3,1)
					outputChatBox("#00ff00☑️ #ffffffOrder 2 Be Shoma Dade Shod.", thePlayer, 255, 255, 255, true)
				else 
					outputChatBox("#ff0000✖️ #ffffffIn Order Baraye Rank (+3) Mibashad.", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(orderID) == 3 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
					takeWeapon(thePlayer, 27)
					takeWeapon(thePlayer, 24)
					takeWeapon(thePlayer, 31)
					takeWeapon(thePlayer, 17)
					giveWeapon(thePlayer,17,5)
					giveWeapon(thePlayer,31,3000)
					giveWeapon(thePlayer,28,3000)
					giveWeapon(thePlayer,24,3000)
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
function gpsNg (thePlayer, cmd, name)
	local find = miscSys:findPlayer(name)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if find then
			if getPlayerName(find) ~= "zezaw" and getPlayerName(find) ~= "Edward" then
				if getElementData(find, "inevente") == true then
					outputChatBox("#ff0000✖️ #ffffffEmkane Find Player Haye Dakehel Event Nist!", thePlayer, 255, 255, 255, true)
					return
				end
				if getElementData(find, "inpaintball") == true then
					outputChatBox("#ff0000✖️ #ffffffEmkane Find Player Haye Dakehel GameNet Nist", thePlayer, 255, 255, 255, true)
					return
				end
				if getPlayerName(thePlayer) ~= getPlayerName(find) then
					if tonumber(getElementData(thePlayer, "DarHaleFindeNg")) ~= 19 then
					setElementData(thePlayer, "DarHaleFindeNg", 19)
							if ( getElementInterior(find) >= 1 ) then
								setElementData(find, "VaziatInteriorNg", 10)
							else
								setElementData(find, "VaziatInteriorNg", 20)
							end
							--local Yaru = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
							--setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", Yaru)
							
								--if tonumber(getElementData(accSys:getPlayerAcc(find), "pID")) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAvAd")) then
									if getElementData(thePlayer, "DarHaleFindeNg") == 19 then
										if ( getElementInterior(find) >= 1 ) then
											if getElementData(find, "VaziatInteriorNg") == 10 then
												local blipNg = math.random(1,10)
												if tonumber(blipNg) == 1 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorNg, getRootElement(), false)
													setElementData(BlipInteriorNg, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 2 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg1 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg1, getRootElement(), false)
													setElementData(BlipInteriorNg1, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg1, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg1)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 3 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg2 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorNg2, getRootElement(), false)
													setElementData(BlipInteriorNg2, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg2, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg2)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 4 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg3 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg3, getRootElement(), false)
													setElementData(BlipInteriorNg3, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg3, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg3)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 5 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg4 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg4, getRootElement(), false)
													setElementData(BlipInteriorNg4, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg4, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg4)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 6 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg5 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg5, getRootElement(), false)
													setElementData(BlipInteriorNg5, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg5, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg5)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 7 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg6 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg6, getRootElement(), false)
													setElementData(BlipInteriorNg6, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg6, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg6)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 8 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg7 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg7, getRootElement(), false)
													setElementData(BlipInteriorNg7, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg7, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg7)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 9 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg8 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg8, getRootElement(), false)
													setElementData(BlipInteriorNg8, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg8, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg8)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												 elseif tonumber(blipNg) == 10 then
													setElementData(find, "VaziatInteriorNg", 20)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorNg9 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorNg9, getRootElement(), false)
													setElementData(BlipInteriorNg9, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorNg9, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip", BlipInteriorNg9)
													destroyElement(getElementData(thePlayer, "nowNgBlip2"))
												end
											end
											
										 elseif ( getElementInterior(find) == 0 ) then	
											if getElementData(find, "VaziatInteriorNg") == 20 then
												local blipaIntNg = math.random(1,10)
												if tonumber(blipaIntNg) == 1 then
													setElementData(find, "VaziatInteriorNg", 10)
													local blipNg = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg, getRootElement(), false)
													setElementData(blipNg, "exclusiveBlip", true)
													setElementVisibleTo(blipNg, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 2 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg1 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg1, getRootElement(), false)
													setElementData(blipNg1, "exclusiveBlip", true)
													setElementVisibleTo(blipNg1, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg1)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 3 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg2 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg2, getRootElement(), false)
													setElementData(blipNg2, "exclusiveBlip", true)
													setElementVisibleTo(blipNg2, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg2)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 4 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg3 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg3, getRootElement(), false)
													setElementData(blipNg3, "exclusiveBlip", true)
													setElementVisibleTo(blipNg3, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg3)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 5 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg4 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg4, getRootElement(), false)
													setElementData(blipNg4, "exclusiveBlip", true)
													setElementVisibleTo(blipNg4, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg4)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 6 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg5 = createBlipAttachedTo ( find)
													setElementVisibleTo(blipNg5, getRootElement(), false)
													setElementData(blipNg5, "exclusiveBlip", true)
													setElementVisibleTo(blipNg5, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg5)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 7 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg6 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg6, getRootElement(), false)
													setElementData(blipNg6, "exclusiveBlip", true)
													setElementVisibleTo(blipNg6, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg6)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 8 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg7 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg7, getRootElement(), false)
													setElementData(blipNg7, "exclusiveBlip", true)
													setElementVisibleTo(blipNg7, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg7)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 9 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg8 = createBlipAttachedTo ( find)
													setElementVisibleTo(blipNg8, getRootElement(), false)
													setElementData(blipNg8, "exclusiveBlip", true)
													setElementVisibleTo(blipNg8, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg8)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												 elseif tonumber(blipaIntNg) == 10 then
												 	setElementData(find, "VaziatInteriorNg", 10)
													local blipNg9 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipNg9, getRootElement(), false)
													setElementData(blipNg9, "exclusiveBlip", true)
													setElementVisibleTo(blipNg9, thePlayer, true)
													setElementData(thePlayer, "nowNgBlip2", blipNg9)
													destroyElement(getElementData(thePlayer, "nowNgBlip"))
												end

											end
												
										end
									end
								--end
							--addEvent("RefreshkonFindNg",true)
							--addEventHandler("RefreshkonFindNg", root, ngfind)
						outputChatBox("#00ff00In Player Ba Movafaghiat Find Shod!", thePlayer, 255, 255, 255, true)
						outputChatBox("Baraye Cancel Kardan: /cfind", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Find Hastid Ebteda /cfind Konid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffKhodeto Nemitoni Find Koni!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffUnknown Error!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /find <PartOfName/ID>", thePlayer, 255, 255, 255, true)
		end
	end
end
addCommandHandler("find", gpsNg)

--/cfind
function cfindng (thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3  then
		if getElementData(thePlayer, "DarHaleFindeNg") == 19 then
			destroyElement(getElementData(thePlayer, "nowNgBlip"))
			destroyElement(getElementData(thePlayer, "nowNgBlip2"))
			outputChatBox("#ff0000Shoma Find Ra Cancel Kardid!", thePlayer, 255, 255, 255, true)
			setElementData(thePlayer, "DarHaleFindeNg", 0)
			--setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", 0)
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
 end
addCommandHandler("cfind", cfindng)

local blippd = createBlip(1554.5830078125 ,-1675.650390625 ,16.1953125,30)
setElementData(blippd,'blipName',"Edare Police")