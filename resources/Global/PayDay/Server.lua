---------------------------------
-------**Script By ExoPrim**-------
---------------------------------
local dbpTime = 500
local iLastHour = 0
local accSys = exports["Accounts-System"]
local InvSys = exports["[TN]Inventory"]
local FamilySys = exports["[TN]Family"]
function payday(client)
    --|||----@@@@---******** For Premium  ********-----@@@@--|||--
	if getElementData(client, "loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(client), "pVip") then
				vipesh = getElementData(accSys:getPlayerAcc(client), "pVip")
				setElementData(accSys:getPlayerAcc(client), "pVip", vipesh - 1)
			end
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 0 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 1)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 1 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 2)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 2 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 3)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 3 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 4)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 4 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 5)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 5 then
				setElementData(accSys:getPlayerAcc(client), "pJayizeBox", 6)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pJayizeBox")) == 6 then
			end
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 0 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 1)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 1 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 2)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 2 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 3)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 3 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 4)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 4 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 5)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 5 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 6)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 6 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 7)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 7 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 8)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 8 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 9)
			elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pRpBiz")) == 9 then
				setElementData(accSys:getPlayerAcc(client), "pRpBiz", 10)
			end
		if tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(client), "pVip")) >= 1 then
		
			triggerClientEvent("paychecksound", client, client)
			local level = getElementData(accSys:getPlayerAcc(client), "pLevel")
			local playTime = getElementData(accSys:getPlayerAcc(client), "pConnectTime")
			local newPlayTime = tonumber(playTime) + 1
			
			setElementData(accSys:getPlayerAcc(client), "pConnectTime", newPlayTime)
			local respecta = getElementData(accSys:getPlayerAcc(client), "pExp")
			
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pRob")) < 40 then
				local rpha = getElementData(accSys:getPlayerAcc(client), "pRob")
				local nextrpha = tonumber(rpha) + 1
				setElementData(accSys:getPlayerAcc(client), "pRob", tonumber(nextrpha))
			end
			
			-- Gold bede
				local rpha = getElementData(accSys:getPlayerAcc(client), "pGold")
				local nextrpha = tonumber(rpha) + 2
				setElementData(accSys:getPlayerAcc(client), "pGold", tonumber(nextrpha))
			
			--lic
			local Flylic = getElementData(accSys:getPlayerAcc(client), "pFlyLic")
			if tonumber(Flylic) > 0 then
				local totFlylic = tonumber(Flylic) - 1
				setElementData(accSys:getPlayerAcc(client), "pFlyLic", tonumber(totFlylic))
			end
			local Boatlic = getElementData(accSys:getPlayerAcc(client), "pBoatLic")
			if tonumber(Boatlic) > 0 then
				local totBoatlic = tonumber(Boatlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pBoatLic", tonumber(totBoatlic))
			end
			local Matlic = getElementData(accSys:getPlayerAcc(client), "pMatsLic")
			if tonumber(Matlic) > 0 then
				local totmatlic = tonumber(Matlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pMatsLic", tonumber(totmatlic))
			end
			local gunlic = getElementData(accSys:getPlayerAcc(client), "pGunLic")
			if tonumber(gunlic) > 0 then
				local totgunlic = tonumber(gunlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pGunLic", tonumber(totgunlic))
			end
			local carlic = getElementData(accSys:getPlayerAcc(client), "pCarLic")
			if tonumber(carlic) > 0 then
				local totcarlic = tonumber(carlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pCarLic", tonumber(totcarlic))
			end
			local bikelic = getElementData(accSys:getPlayerAcc(client), "pCarLicS")
			if tonumber(bikelic) > 0 then
				local totbikelic = tonumber(bikelic) - 1
				setElementData(accSys:getPlayerAcc(client), "pCarLicS", tonumber(totbikelic))
			end
			local myPunish = getElementData(accSys:getPlayerAcc(client), "pPunish")
			if tonumber(myPunish) > 0 then
				local totPunish = tonumber(myPunish) - 1
				setElementData(accSys:getPlayerAcc(client), "pPunish", tonumber(totPunish))
			end
			local TamrinPoint = getElementData(accSys:getPlayerAcc(client), "pTamrin")
			if tonumber(TamrinPoint) < 20 then
				local totTamrinPoint = tonumber(TamrinPoint) + 5
				setElementData(accSys:getPlayerAcc(client), "pTamrin", tonumber(totTamrinPoint))
			end
			local time = getRealTime()
			local hours = time.hour
			local minutes = time.minute
			local seconds = time.second
			
			
			outputChatBox("#ffffff———————[ Pay Check Time ]———————", client, 191, 192, 194, true)
			outputChatBox(" ", client, 191, 192, 194, true)
			-- PayChek
			if hours >= 19 and hours <= 23 then
				local PayChek = math.random(150,250)*3
				givePlayerMoney(client, tonumber(PayChek))
				outputChatBox("#ffffff Shoma Mablagh #00ff00$"..PayChek.." #ffffffDaryaft Kardid!", client, 191, 192, 194, true)

			else
				local PayChek = math.random(150,250)
				givePlayerMoney(client, tonumber(PayChek))
				outputChatBox("#ffffff Shoma Mablagh #00ff00$"..PayChek.." #ffffffDaryaft Kardid!", client, 191, 192, 194, true)
			end
			--Sod Banki Gold Premium
			local HesabBanki = tonumber(getElementData(accSys:getPlayerAcc(client), "pBankPass"))
			if (HesabBanki ~= 0) then
				local poletobank = tonumber(getElementData(accSys:getPlayerAcc(client), "pBank"))
				if (poletobank <= 7000) then
					if (poletobank > 0) then
						local amaliatepol1 = (poletobank) +2
						local setkonpolo2 = (amaliatepol1) + (poletobank)
						setElementData(accSys:getPlayerAcc(client), "pBank", (setkonpolo2))
						outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $2 Sode Banki #EBC212(2 Barabar) #ffffffDaryaft Kardid.", client, 191, 192, 194, true)
					else
						outputChatBox("#00ff00 [Bank]: #ffffffShoma Dar Hesabe Banki Poli Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
					end
				else
					local amaliatepol = (poletobank) /100*0.015*2
					local setkonpolo = (amaliatepol) + (poletobank)
					setElementData(accSys:getPlayerAcc(client), "pBank", math.floor(setkonpolo))
					outputChatBox("#00ff00 [Bank]: #ffffffSoode Banki In Saate Shoma #00ff00"..math.floor(poletobank/100*0.015*2).."$ #ffffffBood!", client, 191, 192, 194, true)
				end
			else
				outputChatBox("#00ff00 [Bank]: #ffffffShoma Hesabe Banki Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
			end
			
				
			-- Maliat
			local poletobank = getElementData(accSys:getPlayerAcc(client), "pBank")
			if tonumber(poletobank) >= 100 then
				local maliat = math.random(10,35)
				local kamkonmaliat = tonumber(poletobank) - tonumber(maliat)
				setElementData(accSys:getPlayerAcc(client), "pBank", tonumber(kamkonmaliat))
				outputChatBox(" #ffffffMablaghe #ff1010"..maliat.."$#ffffff Niz Be Onvan Maliyat #C0C0C0(Shahrvandi + Amval)#ffffff Kasr Gardid.", client, 191, 192, 194, true)
			else
				outputChatBox(" #ffffffShoma Poli Dar Bank Nadarid Va Maliat Kasr Nmishavad!", client, 191, 192, 194, true)
			end
				
			
			-- Respect
			local prespecta = getElementData(accSys:getPlayerAcc(client), "pExp")+2
			local ptotrespecta = tonumber(prespecta)
			local nrespecta = getElementData(accSys:getPlayerAcc(client), "pExp")+1
			local ntotrespecta = tonumber(nrespecta)
			if hours >= 19 and hours < 23 then
				setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(ptotrespecta), false)
				outputChatBox("#EBC212 [Premium]: #ffffffShoma 1 Respect Ezafe Daryaft Kardid", client, 191, 192, 194, true)
				outputChatBox("#ffffff Shoma Ham Aknoon #C0C0C0"..ptotrespecta.."#ffffff Respect Darid. #00ff00(+1 Respect)", client, 191, 192, 194, true)
				outputChatBox(" ",client, 191, 192, 194, true)
				outputChatBox("#ffffff——————————————————————————", client, 191, 192, 194, true)
				
			else
				setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(ntotrespecta), false)
				outputChatBox("#ffffff Shoma Ham Aknoon #C0C0C0"..ptotrespecta.."#ffffff Respect Darid. #00ff00(+1 Respect)", client, 191, 192, 194, true)
				outputChatBox(" ",client, 191, 192, 194, true)
				outputChatBox("#ffffff——————————————————————————", client, 191, 192, 194, true)
			end

		else
		
			--|||----@@@@---******** For Not Premium  ********-----@@@@--|||--
		

			triggerClientEvent("paychecksound", client, client)
			local level = getElementData(accSys:getPlayerAcc(client), "pLevel")
			local playTime = getElementData(accSys:getPlayerAcc(client), "pConnectTime")
			local newPlayTime = tonumber(playTime) + 1
			setElementData(accSys:getPlayerAcc(client), "pConnectTime", newPlayTime)
			local respecta = getElementData(accSys:getPlayerAcc(client), "pExp")+1
			local totRespect = tonumber(respecta)

			
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) >= 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(client), "pRob")) < 40 then
					local rpha = getElementData(accSys:getPlayerAcc(client), "pRob")
					local nextrpha = tonumber(rpha) + 1
					setElementData(accSys:getPlayerAcc(client), "pRob", tonumber(nextrpha))
				end
			 elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
				if tonumber(getElementData(accSys:getPlayerAcc(client), "pRob")) < 20 then
					local rpha = getElementData(accSys:getPlayerAcc(client), "pRob")
					local nextrpha = tonumber(rpha) + 1
					setElementData(accSys:getPlayerAcc(client), "pRob", tonumber(nextrpha))
				end
			end
			--lic
			local Flylic = getElementData(accSys:getPlayerAcc(client), "pFlyLic")
			if tonumber(Flylic) > 0 then
				local totFlylic = tonumber(Flylic) - 1
				setElementData(accSys:getPlayerAcc(client), "pFlyLic", tonumber(totFlylic))
			end
			local Boatlic = getElementData(accSys:getPlayerAcc(client), "pBoatLic")
			if tonumber(Boatlic) > 0 then
				local totBoatlic = tonumber(Boatlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pBoatLic", tonumber(totBoatlic))
			end
			local Matlic = getElementData(accSys:getPlayerAcc(client), "pMatsLic")
			if tonumber(Matlic) > 0 then
				local totmatlic = tonumber(Matlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pMatsLic", tonumber(totmatlic))
			end
			local gunlic = getElementData(accSys:getPlayerAcc(client), "pGunLic")
			if tonumber(gunlic) > 0 then
				local totgunlic = tonumber(gunlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pGunLic", tonumber(totgunlic))
			end
			local carlic = getElementData(accSys:getPlayerAcc(client), "pCarLic")
			if tonumber(carlic) > 0 then
				local totcarlic = tonumber(carlic) - 1
				setElementData(accSys:getPlayerAcc(client), "pCarLic", tonumber(totcarlic))
			end
			local bikelic = getElementData(accSys:getPlayerAcc(client), "pCarLicS")
			if tonumber(bikelic) > 0 then
				local totbikelic = tonumber(bikelic) - 1
				setElementData(accSys:getPlayerAcc(client), "pCarLicS", tonumber(totbikelic))
			end
			local myPunish = getElementData(accSys:getPlayerAcc(client), "pPunish")
			if tonumber(myPunish) > 0 then
				local totPunish = tonumber(myPunish) - 1
				setElementData(accSys:getPlayerAcc(client), "pPunish", tonumber(totPunish))
			end
			-- Gold bede
				local rpha = getElementData(accSys:getPlayerAcc(client), "pGold")
				local nextrpha = tonumber(rpha) + 1
				setElementData(accSys:getPlayerAcc(client), "pGold", tonumber(nextrpha))
			local TamrinPoint = getElementData(accSys:getPlayerAcc(client), "pTamrin")
			-- Dadan Shooting Point Baraye Silver Va Gheyre Premium --
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(client), "pTamrin")) < 20 then
					local TamrinPoint = getElementData(accSys:getPlayerAcc(client), "pTamrin")
					local totTamrinPoint = tonumber(TamrinPoint) + 5
					setElementData(accSys:getPlayerAcc(client), "pTamrin", tonumber(totTamrinPoint))
				end
			 elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
				if tonumber(getElementData(accSys:getPlayerAcc(client), "pTamrin")) < 10 then
					local TamrinPoint = getElementData(accSys:getPlayerAcc(client), "pTamrin")
					local totTamrinPoint = tonumber(TamrinPoint) + 5
					setElementData(accSys:getPlayerAcc(client), "pTamrin", tonumber(totTamrinPoint))
				end
			end
			
			
			outputChatBox("#ffffff———————[ Pay Check Time ]———————", client, 191, 192, 194, true)
				
							--Sod Banki Silver Premium
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 then
				local HesabBanki = tonumber(getElementData(accSys:getPlayerAcc(client), "pBankPass"))
				if (HesabBanki ~= 0) then
					local poletobank = tonumber(getElementData(accSys:getPlayerAcc(client), "pBank"))
					if (poletobank <= 7000) then
						if (poletobank > 0) then
							local amaliatepol1 = (poletobank) +2
							local setkonpolo2 = (amaliatepol1) + (poletobank)
							setElementData(accSys:getPlayerAcc(client), "pBank", (setkonpolo2))
							outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $2 Sode Banki #ADADAD(2 Barabar) #ffffffDaryaft Kardid.", client, 191, 192, 194, true)
						else
							outputChatBox("#ffff00 [Bank]: #ffffffShoma Dar Hesabe Banki Poli Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
						end
					else
						local amaliatepol = (poletobank) /100*0.015*2
						local setkonpolo = (amaliatepol) + (poletobank)
						setElementData(accSys:getPlayerAcc(client), "pBank", math.floor(setkonpolo))
						outputChatBox("#00ff00 [Bank]: #ffffffSoode Banki In Saate Shoma#ff1010$"..math.floor(poletobank/100*0.015*2).." #ffffffBood.", client, 191, 192, 194, true)
					end
				else
					outputChatBox("#ffff00 [Bank]: #ffffffShoma Hesabe Banki Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
				end
			end
							--Sod Banki Bronze Premium
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) >= 1 then
				local HesabBanki = tonumber(getElementData(accSys:getPlayerAcc(client), "pBankPass"))
				if (HesabBanki ~= 0) then
					local poletobank = tonumber(getElementData(accSys:getPlayerAcc(client), "pBank"))
					if (poletobank <= 7000) then
						if (poletobank > 0) then
							local amaliatepol1 = (poletobank) +2
							local setkonpolo2 = (amaliatepol1) + (poletobank)
							setElementData(accSys:getPlayerAcc(client), "pBank", (setkonpolo2))
							outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $2 Sode Banki #BE7A7A(2 Barabar) #ffffffDaryaft Kardid.", client, 191, 192, 194, true)
						else
							outputChatBox("#ffff00 [Bank]: #ffffffShoma Dar Hesabe Banki Poli Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
						end
					else
						local amaliatepol = (poletobank) /100*0.015*2
						local setkonpolo = (amaliatepol) + (poletobank)
						setElementData(accSys:getPlayerAcc(client), "pBank", math.floor(setkonpolo))
						outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $"..math.floor(poletobank/100*0.015*2).." Sode Banki #BE7A7A(2 Barabar) #ffffffDaryaft Kardid.", client, 191, 192, 194, true)
					end
				else
					outputChatBox("#ffff00 [Bank]: #ffffffShoma Hesabe Banki Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
				end
			end
								--Sod Banki Not Premium
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
				local HesabBanki = tonumber(getElementData(accSys:getPlayerAcc(client), "pBankPass"))
				if (HesabBanki ~= 0) then
					local poletobank = getElementData(accSys:getPlayerAcc(client), "pBank")
					if (poletobank <= 7000) then
						if (poletobank > 0) then
							local amaliatepol1 = (poletobank) +1
							local setkonpolo2 = (amaliatepol1) + (poletobank)
							setElementData(accSys:getPlayerAcc(client), "pBank", (setkonpolo2))
							outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $1 Sode Banki Be Hesabe Shoma Variz shod.", client, 191, 192, 194, true)
						else
							outputChatBox("#ffff00 [Bank]: #ffffffShoma Dar Hesabe Banki Poli Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
						end
					else
						local amaliatepol = tonumber(poletobank) /100*0.015
						local setkonpolo = (amaliatepol) + tonumber(poletobank)
						setElementData(accSys:getPlayerAcc(client), "pBank", math.floor(setkonpolo))
						outputChatBox("#00ff00 [Bank]: #ffffffMablaghe $"..math.floor(poletobank/100*0.015).." Sode Banki Be Hesabe Shoma Variz shod.", client, 191, 192, 194, true)
					end
				else
					outputChatBox("#ffff00 [Bank]: #ffffffShoma Hesabe Banki Nadarid Va Sode Banki Daryaft Nakardid.", client, 191, 192, 194, true)
				end
			end
			local poletobank = getElementData(accSys:getPlayerAcc(client), "pBank")
				
									-- Maliat
			if tonumber(poletobank) >= 100 then
				local maliat = math.random(10,35)
				local kamkonmaliat = (poletobank) - tonumber(maliat)
				setElementData(accSys:getPlayerAcc(client), "pBank", tonumber(kamkonmaliat))
				outputChatBox("#ff0000 Maliat: #ffffffMablaghe#ff1010"..maliat.."$#ffffff Niz Be Onvan Maliyat (Shahrvandi + Amval) Kasr Gardid.", client, 191, 192, 194, true)
			else
				outputChatBox("#ff0000 Maliat: #ffffff-$0", client, 191, 192, 194, true)
			end
			
			local time = getRealTime()
			local hours = time.hour
			
			
			-- PayChek Premium Silver And Bronze --
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) >= 1 then
				if hours >= 19 and hours <= 23 then
					local PayChek = math.random(150,250)*2
					givePlayerMoney(client, tonumber(PayChek))
					outputChatBox("#1FAA2A PayChek: $"..PayChek, client, 191, 192, 194, true)
				else
					local PayChek = math.random(150,250)
					givePlayerMoney(client, tonumber(PayChek))
					outputChatBox("#1FAA2A PayChek: $"..PayChek, client, 191, 192, 194, true)
					outputChatBox("#ffffff——————————————————————————", client, 191, 192, 194, true)
				end
			end
			-- PayChek Not Premium -
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
				local PayChek = math.random(150,250)
				givePlayerMoney(client, tonumber(PayChek))
				outputChatBox("#1FAA2A PayChek: $"..PayChek, client, 191, 192, 194, true)
				outputChatBox("#ffffff——————————————————————————", client, 191, 192, 194, true)
			end
			
			
			-- Respect Not Premium --
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
				setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(totRespect), false)
				outputChatBox("#C0C0C0 Shoma Alan "..respecta.." Respect Darid", client, 191, 192, 194, true)
			end
			
			-- Respect Silver And Bronze --
			if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) >= 1 then
				local prespecta = getElementData(accSys:getPlayerAcc(client), "pExp")+2
				local ptotrespecta = tonumber(prespecta)
				local nrespecta = getElementData(accSys:getPlayerAcc(client), "pExp")+1
				local ntotrespecta = tonumber(nrespecta)
				if hours >= 19 and hours < 23 then
					setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(ptotrespecta), false)
					if tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) >= 1 then
						outputChatBox("#ADADAD [Premium]: #ffffffShoma 1 Respect Ezafe Daryaft Kardid", client, 191, 192, 194, true)
					 elseif tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) >= 1 then
						outputChatBox("#BE7A7A [Premium]: #ffffffShoma 1 Respect Ezafe Daryaft Kardid", client, 191, 192, 194, true)
					end
					outputChatBox("#ffffff Shoma Ham Aknoon #C0C0C0"..ptotrespecta.." #ffffff. (+1 Respect)", client, 191, 192, 194, true)
					outputChatBox("#ffffff——————————————————————————", client, 191, 192, 194, true)
				else
					setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(ntotrespecta), false)
					outputChatBox("#C0C0C0 Shoma Alan "..ntotrespecta.." Respect Darid", client, 191, 192, 194, true)
				end
				if tonumber(getElementData(accSys:getPlayerAcc(client), "pBronzePremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pSilverPremium")) <= 0 and tonumber(getElementData(accSys:getPlayerAcc(client), "pGoldPremium")) <= 0 then
					setElementData(accSys:getPlayerAcc(client), "pExp", tonumber(ntotrespecta), false)
					outputChatBox("#ffffff Shoma Ham Aknoon #C0C0C0"..ptotrespecta.." #ffffff. (+1 Respect)", client, 191, 192, 194, true)
					outputChatBox("#cb0e0e▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", client, 191, 192, 194, true)
				end
			end
		end
	end
	
	
end
addCommandHandler("payday",function(thePlayer,cmd,agr)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin") > 9 then
		if agr then
			if agr == "me" then
				payday(thePlayer)
				FamilySys:paycheckfamilys(iLastHour)
			elseif agr == "all" then
				for k, v in ipairs(getElementsByType("player")) do 
					payday(v)
					FamilySys:paycheckfamilys(iLastHour)
				end
			else
				outputChatBox("[Syntax]: /payday <all/me>", client, 191, 192, 194, true)
			end
		else
			outputChatBox("[Syntax]: /payday <all/me>", client, 191, 192, 194, true)
		end
	end
end)
addEventHandler("onResourceStart", getResourceRootElement(), function (rs)
	iLastHour = getRealTime().hour
end)

	-- Time Respect --
addEventHandler("OnGlobalTimer", root, function ()
	
	if (getRealTime().hour ~= iLastHour) then
		iLastHour = getRealTime().hour
		FamilySys:paycheckfamilys(iLastHour)
		InvSys:createmile()
		for k, v in ipairs(getElementsByType("player")) do 
			payday(v)


		end
		
	end
end)