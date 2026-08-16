local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
Dhack = false
DBomber = false

local pcrob = createPickup ( -1376.2578125 ,1493.7666015625 ,11.203125 , 3, 1239, 0)

StartMarker = createMarker (-1376.2578125 ,1493.7666015625 ,11.203125 , "cylinder", 0.8,111,175,230,0 )
setElementInterior ( StartMarker, 0 )
addEventHandler("onMarkerHit",StartMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		exports["notf"]:addNotification(hitElement, "Baraye Shoro /hackdrug Bezanid" , 'info')
	end
end)



local ttDrug = createObject(2634,-1378.9119921875 ,1491.333984375 ,11.603125, 0, 0, 270)

	
local pcRdrug = StartMarker

fasele = 0.7

addCommandHandler("hackdrug",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(pcRdrug)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if de < fasele then
		if Dhack == false then
			local mmeber = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
				if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
						Dhack = true
						setElementFrozen( thePlayer, true )
						toggleAllControls(thePlayer, false)
						setPlayerWantedLevel(thePlayer,6)
						setElementRotation( thePlayer, 0, 0, 0, "default", true)
						setElementPosition ( thePlayer, -1376.2138671875 ,1493.7666015625 ,11.203125 )
						setPedAnimation(thePlayer, "int_shop", "shop_cashier", 30000, true, false, false, false)
						exports["notf"]:addNotification(thePlayer, "Dar Hal Crack Kardan Computer...!!" , 'warning')
						setTimer(function()
							--DepartmentMessages("Rob Javaheri Zade Shode Zod Be Javaheri Berid!!")
							--setTimer(function()
							--DepartmentMessages("Rob Javaheri Zade Shode Zod Be Javaheri Berid!!")
							--end,3000,4)
							--triggerClientEvent( "playAjir", resourceRoot )
								--[[setTimer(function()
									setElementRotation( thePlayer, 0, 0, 90, "default", true)
									setElementPosition ( thePlayer,1144.814453125 ,-1100.443359375 ,19.42028808593 )
									setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
								end,40000,1)
								setTimer(function()
									setElementRotation( thePlayer, 0, 0, 90, "default", true)
									setElementPosition ( thePlayer,1144.7568359375 ,-1099.251953125 ,19.42028808593 )
									setPedAnimation( thePlayer, "police", "door_kick", -1, false, false )
								end,61000,1)]]
								setTimer(function()
									setElementFrozen( thePlayer, false )
									toggleAllControls(thePlayer, true)
									setPedAnimation(thePlayer)
									moveObject(ttDrug, 500, 99999999999999.10, -999999999999999.09, 0.90)
									exports["notf"]:addNotification(thePlayer, "Dar Aval Baz Shod" , 'info')
								end,22050,1)
								--[[setTimer(function()
									moveObject(tresortuer, 500, 479.10, -1552.09, 25.90)
								end,500500,1)]]
						end,1000,1)
				else
					exports["notf"]:addNotification(thePlayer, "Faghat Mafia Mitone Hack Kone" , 'error')
				end
		else
			exports["notf"]:addNotification(thePlayer, "Computer Drug Ro Hack Kardan" , 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Shoma Dar Mahale Drug Nistid" , 'error')
	end
end)





bombEzars = createMarker (-1378.5703125 ,1494.17578125 ,2.125916481018 , "cylinder", 0.8,111,175,230,0 )
setElementInterior ( bombEzars, 0 )
addEventHandler("onMarkerHit",bombEzars,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		exports["notf"]:addNotification(hitElement, "Baraye Baz Kardan Dar /bomb Bezanid" , 'info')
	end
end)

local Bombers = createObject(2634,-1378.5703125 ,1494.17578125 ,2.425916481018, 0, 0, 270)
	
local sssebomb = bombEzars

faseleTaBombDrug = 100
fasele = 0.7

addCommandHandler("bomb",
function(thePlayer, cmd, ...)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(sssebomb)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if de < faseleTaBombDrug then
		if de < fasele then
			if Dhack == true then
				if DBomber == false then
					local mmeber = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
					if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
						setElementFrozen( thePlayer, true )
						toggleAllControls(thePlayer, false)
						DBomber = true
						setPlayerWantedLevel(thePlayer,6)
						setElementRotation( thePlayer, 0, 0, 90, "default", true)
						setElementPosition ( thePlayer, -1378.041015625 ,1494.1904296875 ,1.851562 )
						setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
						setTimer(function()
								setTimer(function()
									setElementFrozen( thePlayer, false )
									toggleAllControls(thePlayer, true)
									setPedAnimation(thePlayer)
									triggerClientEvent ( root, "Bomb", root)
									exports["notf"]:addNotification(thePlayer, "Zood Az Bomb Dor Sho!!!!!!!!" , 'error')
								end,10050,1)
								setTimer(function()
									createExplosion(-1378.041015625 ,1494.1904296875 ,1.851562, 7)
									moveObject(Bombers, 500, 479.10, -1552.09, 0.90)
										
									Box1D1 = false
									Box2D1 = false
									Box3D1 = false
									Box4D1 = false
									Box5D1 = false

									local Box1Geraft = createObject(1221,-1436.3525390625 ,1498.048828125 ,1.567187)
									local Box2Geraft = createObject(1221,-1438.345703125 ,1490.9580078125 ,1.567187)
									local Box3Geraft = createObject(1221,-1435.4716796875 ,1480.13671875 ,1.567187)
									local Box4Geraft = createObject(1221,-1405.7275390625 ,1479.974609375 ,1.5671875)
									local Box5Geraft = createObject(1221,-1390.1318359375 ,1482.1923828125 ,1.567187)

									setTimer(function ()
										restartResource(getThisResource())
									end, 600000*4, 1)
									function DrugPNL( button, state, player )
										if button == "left" and state == "down" then
											if getElementType( source ) == "object" then
												local x, y, z = getElementPosition( player )
												local x1, y1, z1 = getElementPosition( source ) 
												local fasele22 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
												if fasele22 < 5.2 then
													if source == Box1Geraft then
														local mmeber = getElementData(accSys:getPlayerAcc(player), "pMember")
														if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
															if Box1D1 == false then
																outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 500 Geram Drug Daryaft Kardid", player, 255, 255, 255, true)
																local buyermats = getElementData(accSys:getPlayerAcc(player), "pDrugs")
																local buyernextmats = tonumber(buyermats) + 500
																setElementData(accSys:getPlayerAcc(player), "pDrugs",tonumber(buyernextmats))
																setPlayerWantedLevel(player,6)
																Box1D1 = true
																destroyElement(Box1Geraft)
															end
														else
															exports["notf"]:addNotification(player, "Faghat Mafia Mitone Drug Baradere" , 'error')
														end
													elseif source == Box2Geraft then
														local mmeber = getElementData(accSys:getPlayerAcc(player), "pMember")
														if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
															if Box2D1 == false then
																outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 500 Geram Drug Daryaft Kardid", player, 255, 255, 255, true)
																local buyermats = getElementData(accSys:getPlayerAcc(player), "pDrugs")
																local buyernextmats = tonumber(buyermats) + 500
																setElementData(accSys:getPlayerAcc(player), "pDrugs",tonumber(buyernextmats))
																setPlayerWantedLevel(player,6)
																Box2D1 = true
																destroyElement(Box2Geraft)
															end
														else
															exports["notf"]:addNotification(player, "Faghat Mafia Mitone Drug Baradere" , 'error')
														end
													elseif source == Box3Geraft then
														local mmeber = getElementData(accSys:getPlayerAcc(player), "pMember")
														if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
															if Box3D1 == false then
																outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 500 Geram Drug Daryaft Kardid", player, 255, 255, 255, true)
																local buyermats = getElementData(accSys:getPlayerAcc(player), "pDrugs")
																local buyernextmats = tonumber(buyermats) + 500
																setElementData(accSys:getPlayerAcc(player), "pDrugs",tonumber(buyernextmats))
																setPlayerWantedLevel(player,6)
																Box3D1 = true
																destroyElement(Box3Geraft)
															end
														else
															exports["notf"]:addNotification(player, "Faghat Mafia Mitone Drug Baradere" , 'error')
														end
													elseif source == Box4Geraft then
														local mmeber = getElementData(accSys:getPlayerAcc(player), "pMember")
														if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
															if Box4D1 == false then
																outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 500 Geram Drug Daryaft Kardid", player, 255, 255, 255, true)
																local buyermats = getElementData(accSys:getPlayerAcc(player), "pDrugs")
																local buyernextmats = tonumber(buyermats) + 500
																setElementData(accSys:getPlayerAcc(player), "pDrugs",tonumber(buyernextmats))
																setPlayerWantedLevel(player,6)
																Box4D1 = true
																destroyElement(Box4Geraft)
															end
														else
															exports["notf"]:addNotification(player, "Faghat Mafia Mitone Drug Baradere" , 'error')
														end
													elseif source == Box5Geraft then
														local mmeber = getElementData(accSys:getPlayerAcc(player), "pMember")
														if mmeber == 11 or mmeber == 12 or mmeber == 13 or mmeber == 14 or mmeber == 15 then 
															if Box5D1 == false then
																outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 500 Geram Drug Daryaft Kardid", player, 255, 255, 255, true)
																local buyermats = getElementData(accSys:getPlayerAcc(player), "pDrugs")
																local buyernextmats = tonumber(buyermats) + 500
																setElementData(accSys:getPlayerAcc(player), "pDrugs",tonumber(buyernextmats))
																setPlayerWantedLevel(player,6)
																Box5D1 = true
																destroyElement(Box5Geraft)
															end
														else
															exports["notf"]:addNotification(player, "Faghat Mafia Mitone Drug Baradere" , 'error')
														end
													end
												end
											end
										end
									end 
									addEventHandler( "onElementClicked", getRootElement( ), DrugPNL )
								end,16800,1)
						end,1000,1)
					else
						exports["notf"]:addNotification(thePlayer, "Faghat Mafia Mitone Bomb Bezare" , 'error')
					end
				else
					exports["notf"]:addNotification(thePlayer, "In Dar Ro Az Ghabl Baz Shode" , 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Dar Aval Baz Nist!" , 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Shoma Dar Mahale Bomb Nistid" , 'error')
		end
	end
end)









