local accSys = exports["Accounts-system"] -- Code By ExMohmD
local miscSys = exports["Misc"] -- Telegram: @ExMohmD

function taxiCarry(thePlayer,cmd,target,price)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pMember") == 9 then
		if isPedInVehicle(thePlayer) then
			local khodro = getPedOccupiedVehicle(thePlayer)
			local vehid = getElementID(khodro)
			if vehid == "LsTaxi1" or vehid == "LsTaxi2" or vehid == "LsTaxi3" or vehid == "LsTaxi4" or vehid == "LsTaxi5" 
			or vehid == "LsTaxi6" or vehid == "LsTaxi7" or vehid == "LsTaxi8" or vehid == "LsTaxi9" or vehid == "LsTaxi10"
			or vehid == "LsTaxi11" or vehid == "LsTaxi12" or vehid == "LsTaxi13" or vehid == "LsTaxi14" or vehid == "LsTaxi15" 
			or vehid == "LsTaxi16" or vehid == "LsTaxi17" or vehid == "LsTaxi18" or vehid == "LsTaxi19" or vehid == "LsTaxi20" then
				if getVehicleController(khodro) == thePlayer then
					if target then
						local taraf = miscSys:findPlayer(target)
						if taraf then
							if getElementData(accSys:getPlayerAcc(taraf),"pMember") == 9 then
								outputChatBox("#ffed21(Taxi): #FFFFFFIn Player Khodesh Ranande Taxi Hast!",thePlayer,255,255,255,true)
							return false
							end
							if isPedInVehicle(taraf) then
								if getPedOccupiedVehicle(taraf) == khodro then
									if price then
										local priceNum = tonumber(price)
										if priceNum then
											local money = getPlayerMoney(taraf)
											if (money < priceNum) then
												outputChatBox("#ffed21(Taxi): #FFFFFFPlayer Pool Kafi Baraye Safar Nadare!",thePlayer,255,255,255,true)
											else
												if (priceNum < 250) or (priceNum > 50000) then
													outputChatBox("#ffed21(Taxi): #FFFFFFMablaq Keraye Bayad Beyn #ffed21250$#FFFFFF ta #ffed2150000$#FFFFFF Bashad!",thePlayer,255,255,255,true)
												return false
												end
												setElementData(taraf,"inTaxiRequest",true)
												setElementData(taraf,"inTaxiRequestBy",getPlayerName(thePlayer))
												setElementData(taraf,"TaxiCar",khodro)
												setElementData(taraf,"TaxiPrice",priceNum)
												outputChatBox("#ffed21(Taxi):#FFFFFF Hazine Safar Shoma #ffed21".. priceNum+4550 .."$#FFFFFF Mibashad! Baraye Safar #ffed21/travel #FFFFFFEstefade Konid!",taraf,255,255,255,true)
												outputChatBox("#ffed21(Taxi):#FFFFFF Shoma Darkhast Safar Ra Be #ffed21"..getPlayerName(taraf).."#FFFFFF Ersal Kardid! #ffed21[Hazine: "..priceNum.."$] ",thePlayer,255,255,255,true)
											end
										else
											outputChatBox("#ffed21(Taxi): Dadash Hazine Yadet Rafta!!",thePlayer,255,255,255,true)
										end
									else
										outputChatBox("#ffed21Bezan: /carry <PartOfName/ID> <Price>",thePlayer,205,205,205,true)
									end
								else
									outputChatBox("#ffed21(Taxi): #FFFFFFPlayer Bayad dar Khodroo Bashad!",thePlayer,255,255,255,true)
								end
							else
								outputChatBox("#ffed21(Taxi): #FFFFFFPlayer Bayad dar Khodroo Bashad!",thePlayer,255,255,255,true)
							end
						else
							outputChatBox("#ffed21(Taxi): #FFFFFFPlayer Yaft Nashod!",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#ffed21Bezan: /carry <PartOfName/ID> <Price>",thePlayer,205,205,205,true)
					end
				else
					outputChatBox("#ffed21(Taxi): #FFFFFFShoma Bayad Rannde Bashid!",thePlayer,255,255,255,true)
				end
			else
				outputChatBox("#ffed21(Taxi): #FFFFFFBayad Mashin Shoma Baraye Taxi Bashad!",thePlayer,255,255,255,true)
			end
		else
			outputChatBox("#ffed21(Taxi): #FFFFFFAval Savar Mashin Sho!",thePlayer,255,255,255,true)
		end
	else
		outputChatBox("#ffed21(Taxi): #FFFFFFShoma Ozv Faction Taxi Nistid!",thePlayer,255,255,255,true)
	end
end
addCommandHandler("carry",taxiCarry)

function travel(thePlayer)
	if isPedInVehicle(thePlayer) then
		local khodro = getPedOccupiedVehicle(thePlayer)
		local vehid = getElementID(khodro)
		if vehid == "LsTaxi1" or vehid == "LsTaxi2" or vehid == "LsTaxi3" or vehid == "LsTaxi4" or vehid == "LsTaxi5" 
		or vehid == "LsTaxi6" or vehid == "LsTaxi7" or vehid == "LsTaxi8" or vehid == "LsTaxi9" or vehid == "LsTaxi10"
		or vehid == "LsTaxi11" or vehid == "LsTaxi12" or vehid == "LsTaxi13" or vehid == "LsTaxi14" or vehid == "LsTaxi15" 
		or vehid == "LsTaxi16" or vehid == "LsTaxi17" or vehid == "LsTaxi18" or vehid == "LsTaxi19" or vehid == "LsTaxi20" then
			if getElementData(thePlayer,"inTaxiRequest") == true then
				local tarafHesabesh = getPlayerFromName(getElementData((thePlayer),"inTaxiRequestBy"))
				local money = getPlayerMoney(thePlayer)
				local taxiPrice = getElementData(thePlayer,"TaxiPrice")+4550
				if (money < taxiPrice) then
					outputChatBox("#ffed21(Taxi): #FFFFFFShoma Pool Kafi Nadarid!",thePlayer,255,255,255,true)
				else
				
					local hooqoqesh = getElementData(accSys:getPlayerAcc(tarafHesabesh), "pMozd")
					setElementData(accSys:getPlayerAcc(tarafHesabesh), "pMozd", tonumber(hooqoqesh) + 4550)
					
					setElementData(thePlayer,"inTaxiRequest",false)
					setElementData(thePlayer,"inTaxiRequestBy",false)
					givePlayerMoney(tarafHesabesh,getElementData(thePlayer,"TaxiPrice"))
					takePlayerMoney(thePlayer,getElementData(thePlayer,"TaxiPrice")+4550)
					outputChatBox("#ffed21(Taxi): #FFFFFFSafar Khoobi Dar Pish Dashte Bashid!",thePlayer,255,255,255,true)
					outputChatBox("#ffed21(Taxi): #FFFFFFDarkhast Taxi Accept Shod , Hala Player Ra Beresoon!#ffed21 [Hazine: ".. taxiPrice-4550 .."$]",tarafHesabesh,255,255,255,true)
				end
			else
				outputChatBox("#ffed21(Taxi): #FFFFFFDarkhasti Baraye Shoma Ersal Nashode Ast!",thePlayer,255,255,255,true)
			end
		else
			outputChatBox("#ffed21(Taxi): #FFFFFFShoma Dar Khodro Nistid!",thePlayer,255,255,255,true)
		end
	else
		outputChatBox("#ffed21(Taxi): #FFFFFFShoma Dar Khodro Nistid!",thePlayer,255,255,255,true)
	end
end
addCommandHandler("travel",travel)

