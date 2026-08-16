local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

fasele = 6.5
local fbicover = createPickup ( 237.171875 ,111.1318359375 ,1003.21875 , 3, 1581, 0)
setElementInterior ( fbicover, 10 )
local fbiorder = createPickup ( 233.8046875 ,123.41796875 ,1003.21875 , 3, 1242, 0)
setElementInterior ( fbiorder, 10 )
local fbiduty = createPickup ( 237.9697265625 ,122.853515625 ,1003.21875 , 3, 1275, 0)
setElementInterior ( fbiduty, 10 )


addCommandHandler("duty",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(fbiduty)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
		if de < fasele and getElementDimension(thePlayer) == 0 and getElementInterior(thePlayer) == 10 then
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




--/frisk For FBI
addCommandHandler("frisk",
function(thePlayer, cmd, player)
	local find = miscSys:findPlayer ( player )
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(find)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		if find then
			if de < fasele then
				local targetPlayer = getPlayerName ( find )
				local haveMat = getElementData(accSys:getPlayerAcc(find), "pMats")
				local haveDrug = getElementData(accSys:getPlayerAcc(find), "pDrugs")
				outputChatBox("#ffff00[Info]:#ffffff Natije Bazresi Badani Player#ffff00 "..targetPlayer.."#ffffff:", thePlayer, 255, 255, 255, true)
				outputChatBox("#ba3e00Mavad AslaheSazi: #ffffff"..haveMat.."gr", thePlayer, 255, 255, 255, true)
				outputChatBox("#ba3e00Mavad Mokhader: #ffffff"..haveDrug.."gr", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Az Shoma Fasele Darad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Anjam Inkar Bayad Ozve Factione FBI Bashid", thePlayer, 255, 255, 255, true)
	end
end
)





--/take For FBI
addCommandHandler("take",
function(thePlayer, cmd, player, arg)
	local find = miscSys:findPlayer ( player )
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(find)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
		if find then
			if de < fasele then
				if (arg) then
					if (arg) == "guns" then
						takeAllWeapons ( find )
						outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Gun Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
						outputChatBox("#ff0000[Take]: #ffffffGun Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
					elseif (arg) == "mats" then
						local hisFac = getElementData(accSys:getPlayerAcc(find), "pMember")
						if tonumber(hisFac) > 0 and tonumber(hisFac) < 4 then
							outputChatBox("#ff0000✖️ #ffffffIn Player Khodesh Police Ast!", thePlayer, 255, 255, 255, true)
							return false
						else
							local myFac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
							if myFac == 1 or myFac == 3 then
								outputChatBox("#ff0000✖️ #ffffffInkar Faqat Az Pas FBI Bar Miayad!", thePlayer, 255, 255, 255, true)
								return false
							end
							setElementData(accSys:getPlayerAcc(find), "pMats",0)
							outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Mat Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
							outputChatBox("#ff0000[Take]: #ffffffMat Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
						end
					elseif (arg) == "drugs" then
						local hisFac = getElementData(accSys:getPlayerAcc(find), "pMember")
						if tonumber(hisFac) > 0 and tonumber(hisFac) < 4 then
							outputChatBox("#ff0000✖️ #ffffffIn Player Khodesh Police Ast!", thePlayer, 255, 255, 255, true)
							return false
						else
							local myFac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
							if myFac == 1 or myFac == 3 then
								outputChatBox("#ff0000✖️ #ffffffInkar Faqat Az Pas FBI Bar Miayad!", thePlayer, 255, 255, 255, true)
								return false
							end
							setElementData(accSys:getPlayerAcc(find), "pDrugs",0)
							outputChatBox("#00ff00[Take]: #ffffffShoma Ba Movafaghiat Tamami Drug Haye Player "..getPlayerName( find ).." Ra Take Kardid!", thePlayer, 255, 255, 255, true)
							outputChatBox("#ff0000[Take]: #ffffffDrug Haye Shoma Tavasote Police "..getPlayerName( thePlayer ).." Take Shod!", find, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffMorede Take Ra Eshtebah Vared Kardid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffMorede Take Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Az Shoma Fasele Darad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /take <PartOfName/ID> <guns/mats/drugs>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Police FBI Bashid!", thePlayer, 255, 255, 255, true)
	end
end

)
addCommandHandler("cover",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(fbicover)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		if de < fasele and getElementDimension(thePlayer) == 0 and getElementInterior(thePlayer) == 10 then
			if not getElementData(thePlayer,"incover") == true then
				setPlayerNametagColor ( thePlayer, 255, 255, 255 )
				outputChatBox("#00ff00[Department]: #717171Shoma #00ff00Cover #717171Shodid!", thePlayer, 255, 255, 255, true)
				setElementData(thePlayer,"incover",true,false)
				local yeSkinShansi = math.random(1,11)
				if tonumber(yeSkinShansi) == 1 then
					setElementModel(thePlayer,27)
				elseif tonumber(yeSkinShansi) == 2 then
					setElementModel(thePlayer, 52)
				elseif tonumber(yeSkinShansi) == 3 then
					setElementModel(thePlayer, 51)
				elseif tonumber(yeSkinShansi) == 4 then
					setElementModel(thePlayer, 48)
				elseif tonumber(yeSkinShansi) == 5 then
					setElementModel(thePlayer, 15)
				elseif tonumber(yeSkinShansi) == 6 then
					setElementModel(thePlayer, 18)
				elseif tonumber(yeSkinShansi) == 7 then
					setElementModel(thePlayer, 19)
				elseif tonumber(yeSkinShansi) == 8 then
					setElementModel(thePlayer, 137)
				elseif tonumber(yeSkinShansi) == 9 then
					setElementModel(thePlayer, 136)
				elseif tonumber(yeSkinShansi) == 10 then
					setElementModel(thePlayer, 135)
				elseif tonumber(yeSkinShansi) == 11 then
					setElementModel(thePlayer, 134)
				end
			else
				setPlayerNametagColor ( thePlayer, 0, 62, 170 )
				setElementData(thePlayer,"incover",nil)
				outputChatBox("#ffff00[Department]: #717171Shoma #ff0000UnCover #717171Shodid!", thePlayer, 255, 255, 255, true)
				setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))

			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dar Ghesmate Cover Bashid!", thePlayer, 255, 255, 255, true)
		end
	end
end
)

function bacovermord()
	if getElementData(source, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")) == 2 then
			if getElementData(source,"incover") == true then
				outputChatBox("#ffff00[Department]: #717171Shoma #ff0000UnCover #717171Shodid!", source, 255, 255, 255, true)
				setElementData(thePlayer,"incover",nil, false)
			end
		end
	end
end
addEventHandler("onPlayerWasted", root, bacovermord)

--/order 
addCommandHandler("order",
function(thePlayer, cmd, orderID)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(fbiorder)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	local orderID = tonumber(orderID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele and getElementDimension(thePlayer) == 0 and getElementInterior(thePlayer) == 10 then
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
					giveWeapon(thePlayer,24,3000)
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
function gpsfbi (thePlayer, cmd, name)
	local find = miscSys:findPlayer(name)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
		if find then
			if tonumber(getElementData(thePlayer, "DarHaleFindeFBI")) ~= 8 then
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
						setElementData(thePlayer, "DarHaleFindeFBI", 8)
							if ( getElementInterior(find) >= 1 ) then
								setElementData(find, "VaziatInteriorFBI", 11)
							else
								setElementData(find, "VaziatInteriorFBI", 22)
							end
							--local Yaru = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
							--setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", Yaru)
							
							--function fbi ()
								--if tonumber(getElementData(accSys:getPlayerAcc(find), "pID")) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAvAd")) then
									if getElementData(thePlayer, "DarHaleFindeFBI") == 8 then
										if ( getElementInterior(find) >= 1 ) then
											if getElementData(find, "VaziatInteriorFBI") == 11 then
												local blipFbi = math.random(1,10)
												if tonumber(blipFbi) == 1 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorfbi, getRootElement(), false)
													setElementData(BlipInteriorfbi, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 2 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorFbi1 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorFbi1, getRootElement(), false)
													setElementData(BlipInteriorFbi1, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorFbi1, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorFbi1)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 3 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi2 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi2, getRootElement(), false)
													setElementData(BlipInteriorfbi2, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi2, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi2)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 4 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi3 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi3, getRootElement(), false)
													setElementData(BlipInteriorfbi3, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi3, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi3)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 5 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi4 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorfbi4, getRootElement(), false)
													setElementData(BlipInteriorfbi4, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi4, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi4)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 6 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi5 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi5, getRootElement(), false)
													setElementData(BlipInteriorfbi5, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi5, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi5)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 7 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi6 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi6, getRootElement(), false)
													setElementData(BlipInteriorfbi6, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi6, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi6)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 8 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi7 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi7, getRootElement(), false)
													setElementData(BlipInteriorfbi7, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi7, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi7)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 9 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi8 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX) )
													setElementVisibleTo(BlipInteriorfbi8, getRootElement(), false)
													setElementData(BlipInteriorfbi8, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi8, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi8)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												 elseif tonumber(blipFbi) == 10 then
													setElementData(find, "VaziatInteriorFBI", 22)
													local locX = getElementData(accSys:getPlayerAcc(find), "pLocX")
													local locY = getElementData(accSys:getPlayerAcc(find), "pLocY")
													local locZ = getElementData(accSys:getPlayerAcc(find), "pLocZ")
													local BlipInteriorfbi9 = createBlip( tonumber(locX) ,tonumber(locY) ,tonumber(locX))
													setElementVisibleTo(BlipInteriorfbi9, getRootElement(), false)
													setElementData(BlipInteriorfbi9, "exclusiveBlip", true)
													setElementVisibleTo(BlipInteriorfbi9, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip", BlipInteriorfbi9)
													destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
												end
											end
											
										 elseif ( getElementInterior(find) == 0 ) then	
											if getElementData(find, "VaziatInteriorFBI") == 22 then
												local blipaIntFBI = math.random(1,10)
												if tonumber(blipaIntFBI) == 1 then
													setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi = createBlipAttachedTo ( find)
													setElementVisibleTo(blipFbi, getRootElement(), false)
													setElementData(blipFbi, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 2 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi1 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi1, getRootElement(), false)
													setElementData(blipFbi1, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi1, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi1)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 3 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi2 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi2, getRootElement(), false)
													setElementData(blipFbi2, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi2, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi2)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 4 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi3 = createBlipAttachedTo ( find)
													setElementVisibleTo(blipFbi3, getRootElement(), false)
													setElementData(blipFbi3, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi3, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi3)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 5 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi4 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi4, getRootElement(), false)
													setElementData(blipFbi4, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi4, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi4)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 6 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi5 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi5, getRootElement(), false)
													setElementData(blipFbi5, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi5, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi5)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 7 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi6 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi6, getRootElement(), false)
													setElementData(blipFbi6, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi6, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi6)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 8 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi7 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi7, getRootElement(), false)
													setElementData(blipFbi7, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi7, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi7)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 9 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi8 = createBlipAttachedTo ( find)
													setElementVisibleTo(blipFbi8, getRootElement(), false)
													setElementData(blipFbi8, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi8, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi8)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												 elseif tonumber(blipaIntFBI) == 10 then
												 	setElementData(find, "VaziatInteriorFBI", 11)
													local blipFbi9 = createBlipAttachedTo ( find )
													setElementVisibleTo(blipFbi9, getRootElement(), false)
													setElementData(blipFbi9, "exclusiveBlip", true)
													setElementVisibleTo(blipFbi9, thePlayer, true)
													setElementData(thePlayer, "nowFbiBlip2", blipFbi9)
													destroyElement(getElementData(thePlayer, "nowFbiBlip"))
												end

											end
												
										end
									end
								--end
							--end
							--addEvent("RefreshkonFindFbi",true)
							--addEventHandler("RefreshkonFindFbi", root, fbi)
					outputChatBox("#00ff00In Player Ba Movafaghiat Find Shod!", thePlayer, 255, 255, 255, true)
					outputChatBox("Baraye Cancel Kardan: /cfind", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#ff0000✖️ #ffffffKhodeto Nemitoni Find Koni!", thePlayer, 255, 255, 255, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffUnknown Error!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Find Hastid Ebteda /cfind Konid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /find <PartOfName/ID>", thePlayer, 255, 255, 255, true)
		end
	end
end
addCommandHandler("find", gpsfbi)

--/cfind
function cfindfbi (thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2  then
		if getElementData(thePlayer, "DarHaleFindeFBI") == 8 then
			destroyElement(getElementData(thePlayer, "nowFbiBlip"))
			destroyElement(getElementData(thePlayer, "nowFbiBlip2"))
			outputChatBox("#ff0000Shoma Find Ra Cancel Kardid!", thePlayer, 255, 255, 255, true)
			setElementData(thePlayer, "DarHaleFindeFBI", 0)
			--setElementData(accSys:getPlayerAcc(thePlayer), "pAvAd", 0)
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darhal Find Nistid!", thePlayer, 255, 255, 255, true)
		end
	end
 end
addCommandHandler("cfind", cfindfbi)