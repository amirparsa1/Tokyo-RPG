local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local FamilySys = exports["[TN]Family"]


function cwanted (root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) >= 500 then
		setElementData(accSys:getPlayerAcc(root), "pClearWantedTime", 0)
		setElementData(accSys:getPlayerAcc(root), "pWanted", 0)
		local GoldePlayer = getElementData(accSys:getPlayerAcc(root), "pGold")
		local KamKonGold = tonumber(GoldePlayer) - 500
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(KamKonGold))
		setPlayerWantedLevel(root,0)
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Wanted Haye Khod Ra Clear Kardid! ." , 'success')
	else
		exports["notf"]:addNotification(root, "Golde Shoma Kafi Nist!" , 'error')
	end
end
addEvent("cwanted",true)
addEventHandler("cwanted", root, cwanted)
function SetPremiumGold90 (root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) >= 2500 then
		local GoldePlayer = getElementData(accSys:getPlayerAcc(root), "pGold")
		local KamKonGold = tonumber(GoldePlayer) - 2500
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(KamKonGold))
		local goldpermesh = tonumber(getElementData(accSys:getPlayerAcc(root), "pGoldPremium"))
		setElementData(accSys:getPlayerAcc(root), "pGoldPremium", 720 + goldpermesh)
		exports["notf"]:addNotification(root, "Mobarake! Shoma TheNight MemberShip 1 Mahe Kharidid ." , 'success')
	else
		exports["notf"]:addNotification(root, "Golde Shoma Kafi Nist!" , 'error')
	end
end
addEvent("PremiumKonGold30",true)
addEventHandler("PremiumKonGold30", root, SetPremiumGold90)

function deleteKonFP(root, thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) > 750 then
		
		local pGold = getElementData(accSys:getPlayerAcc(root), "pGold")
		setElementData(accSys:getPlayerAcc(root), "pPunish", 0)
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(pGold) - 750)
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat 'Clear FP' Kharidid!" , 'success')
		

	else
		exports["notf"]:addNotification(root, "Shoma Be 450 Gold Baraye 'Clear FP' Niaz Darid! Baraye Afzayesh Gold /shop" , 'error')
	end
end
addEvent("deleteKonFP",true)
addEventHandler("deleteKonFP", root, deleteKonFP)

-- Scripte Etelaate player --
function statsetkon(root)
	local Tamrin = tonumber(getElementData(accSys:getPlayerAcc(root), "pTamrin"))
	local NameFard = getElementData(accSys:getPlayerAcc(root), "pName")
	local levelesh = getElementData(accSys:getPlayerAcc(root), "pLevel")
	local Warn = getElementData(accSys:getPlayerAcc(root), "pWarns")
	local Punish = getElementData(accSys:getPlayerAcc(root), "pPunish")
	local Rob = getElementData(accSys:getPlayerAcc(root), "pRob")
	local MemberShip = getElementData(accSys:getPlayerAcc(root), "pGoldPremium")

	local Goldesh = getElementData(accSys:getPlayerAcc(root), "pGold")
	local respectash = getElementData(accSys:getPlayerAcc(root), "pExp")
	local mail = getElementData(accSys:getPlayerAcc(root), "pEmail")
	local ref = getElementData(accSys:getPlayerAcc(root), "pID")
	local bankaParasi = getElementData(accSys:getPlayerAcc(source), "pBank")
	local faction = tonumber(getElementData(accSys:getPlayerAcc(root), "pMember"))
	local facid = tonumber(getElementData(accSys:getPlayerAcc(root), "pMember"))
	local neededEx = tonumber((levelesh)+1) * 3
	local pip = getPlayerIP(root)

	local dbpTime = 500
	local ptut = tonumber(getElementData(accSys:getPlayerAcc(root), "pTut"))
	if ptut == 0 then --civilian
		Spawnesh = "Civilian"
	elseif ptut == 1 then --house
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local owner = row['OWNER']
				local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
				if owner == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House ("..id..")"
				elseif rent1 == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House (ID:"..id..")"
				elseif rent2 == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House (ID:"..id..")"
				elseif rent3 == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House (ID:"..id..")"
				elseif rent4 == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House (ID:"..id..")"
				elseif rent5 == getPlayerName(root) then
					local id = row['ID']
					Spawnesh = "House (ID:"..id..")"
				end
			end
		  dbFree(query)
		end
	elseif ptut == 2 then --faction
		Spawnesh = "Faction / Family"
	elseif ptut == 3 then --faction
		Spawnesh = "Last Location"
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")) > 0 then
		faction = FamilySys:FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")),"name").." ["..tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")).."]"
		logoidish = FamilySys:FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")),"logoid")
		FamOrFac = "family"
	else
		logoidish = faction
		FamOrFac = "faction"
		if faction == 0 then
			faction = "Civilian"
		elseif faction == 1 then
			faction = "Police Department"
		elseif faction == 2 then
			faction = "Police Federal"
		elseif faction == 3 then
			faction = "National Guard"
		elseif faction == 4 then
			faction = "Medic"
		elseif faction == 5 then
			faction = "ICA"
		elseif faction == 6 then
			faction = "CIA"
		elseif faction == 7 then
			faction = "Seda Va Sima"
		elseif faction == 8 then
			faction = "Shahrdar"
		elseif faction == 9 then
			faction = "Mechanic"
		elseif faction == 10 then
			faction = "Night Winner Family"
		elseif faction == 11 then
			faction = "Avengers Family"
		elseif faction == 12 then
			faction = "One4One Family"
		elseif faction == 13 then
			faction = "Ghost Family"
		elseif faction == 14 then
			faction = "Terrorist Family"
		elseif faction == 15 then
			faction = "Yakuza Family"
		elseif faction == 16 then
			faction = ""
		elseif faction == 17 then
			faction = ""
		elseif faction == 18 then
			faction = ""
		elseif faction == 19 then
			faction = ""
		end
	end
	local number = miscSys:FormatPN(getElementData(accSys:getPlayerAcc(root), "pPnumber"))
	local LevEx = 3
	local NexLev = getElementData(accSys:getPlayerAcc(root), "pLevel") + 1
	local EveryExForLevUp = NexLev * LevEx;
	local registerArq = getElementData(accSys:getPlayerAcc(root), "pRegistredDate")
	local lastArq = getElementData(accSys:getPlayerAcc(root), "pLastLogin")
	local preArq1 = tonumber(getElementData(accSys:getPlayerAcc(root), "pGoldPremium"))
	local preArq2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pSilverPremium"))
	local preArq3 = tonumber(getElementData(accSys:getPlayerAcc(root), "pBronzePremium"))
	if preArq1 == 0 and preArq2 == 0 and  preArq3 == 0 then
		preArq = "Gheyre Faal"
	elseif preArq1 >= 1 or preArq2 >= 1 or preArq3 >= 1  then
		preArq = "Faal"
	end
	local hisJob = tonumber(getElementData(accSys:getPlayerAcc(root), "pJob"))
	if hisJob == 0 then
		hisJob = "Bikar"
	elseif hisJob == 1 then
		hisJob = "Bus Driver"
	elseif hisJob == 2 then
		hisJob = "Street Washer"
	elseif hisJob == 3 then
		hisJob = "Pilot"
	elseif hisJob == 4 then
		hisJob = "Trucker"
	elseif hisJob == 5 then
		hisJob = "Unknown"
	elseif hisJob == 6 then
		hisJob = "Fisher Man"
	elseif hisJob == 17 then
		hisJob = "Soda Delivery"
	end
	local genderesh = tonumber(getElementData(accSys:getPlayerAcc(root), "pSex"))
	if tonumber(genderesh) == 1 then
		genderesh = "Male"
	elseif tonumber(genderesh) == 2 then
		genderesh = "Female"
	else
		genderesh = "Unknown"
	end
	
	local slotesh = tonumber(getElementData(accSys:getPlayerAcc(root), "pSlot"))
	if tonumber(slotesh) == 0 then
		slotesh = "0"
	end
	
	local namesh = getElementData(accSys:getPlayerAcc(root), "pReal") -- For Name --
	local agesh = tonumber(getElementData(accSys:getPlayerAcc(root), "pAge")) -- For Age --
	local carlic = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLic")) -- For Car Lic --
	local motorlic = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLicS")) -- For Motor Lic --
	local flylic = tonumber(getElementData(accSys:getPlayerAcc(root), "pFlyLic")) -- For Fly Lic --
	local boatlic = tonumber(getElementData(accSys:getPlayerAcc(root), "pBoatLic")) -- For Boat Lic --
	local matlic = tonumber(getElementData(accSys:getPlayerAcc(root), "pMatsLic")) -- For Mat Lic --
	local gunlic = tonumber(getElementData(accSys:getPlayerAcc(root), "pGunLic")) -- For Gun Lic --
	local materialskill = tonumber(getElementData(accSys:getPlayerAcc(root), "pMatsSkill")) -- For Mat Skill -
	local BusSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pbusdriverSkill")) -- For Bus Skill --
	local SudaSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pSodaSkill")) -- For Suda Skill --
	local pilotskill = tonumber(getElementData(accSys:getPlayerAcc(root), "pPilotSkill")) -- For Pilot Skill --
	local TrcukerSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pTruckerSkill")) -- For Trcuker Skill --
	local StSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pSwSkill")) -- For Trcuker Skill --
	local PlayTimePlayer = tonumber(getElementData(accSys:getPlayerAcc(root), "pPlayTime")) -- For Play Time --
	local seriallock = tonumber(getElementData(accSys:getPlayerAcc(root), "pSeriallock"))
	

	local Ak47GSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pAk47Skill")) -- For Ak Skill -
	local DesertGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pDeagleSkill")) -- For Desert Skill -
	local M4GSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pM4Skill")) -- For M4 Skill -
	local MP5GSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pMp5Skill")) -- For Mp5 Skill -
	local PistolsGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pColt47Skill")) -- For Pistol Skill -
	local SawensGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pSawnoffSkill")) -- For Sawnoff Skill -
	local ShotgunGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pShotgunSkill")) -- For Shotgun Skill -

	local SniperGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pRifleSkill")) -- For Sniper Skill -
	local Spaz12GSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pSpasSkill")) -- For Spaz12 Skill -
	local UziGSkill = tonumber(getElementData(accSys:getPlayerAcc(root), "pUziSkill")) -- For Uzi Skill -

	local mared = getElementData(accSys:getPlayerAcc(root), "pMarriedTo")
	
	-- For Gheyre Faal Car Lic --
	local carlicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLic"))
	if carlicV == 0 then
		carlicV = "Gheyre Faal"
	elseif carlicV >= 1 then
		carlicV = ""
	end
	---------------------
	-- For faal Car Lic --
	local carlicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLic"))
	if carlicV2 == 0 then
		carlicV2 = ""
	elseif carlicV2 >= 1 then
		carlicV2 = "Faal"
	end
	----------------------
	
	
	-- For (Gheyre Faal) Motor Lic --
	local motorlicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLicS"))
	if motorlicV == 0 then
		motorlicV = "Gheyre Faal"
	elseif motorlicV >= 1 then
		motorlicV = ""
	end
	---------------------
	-- For (faal) Motor Lic --
	local motorlicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pCarLicS"))
	if motorlicV2 == 0 then
		motorlicV2 = ""
	elseif motorlicV2 >= 1 then
		motorlicV2 = "Faal"
	end
	----------------------
	
	-- For (Gheyre Faal) Fly Lic --
	local flylicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pFlyLic"))
	if flylicV == 0 then
		flylicV = "Gheyre Faal"
	elseif flylicV >= 1 then
		flylicV = ""
	end
	---------------------
	-- For (faal) Boat Lic --
	local flylicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pFlyLic"))
	if flylicV2 == 0 then
		flylicV2 = ""
	elseif flylicV2 >= 1 then
		flylicV2 = "Faal"
	end
	---------------------
		-- For (Gheyre Faal) Boat Lic --
	local boatlicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pBoatLic"))
	if boatlicV == 0 then
		boatlicV = "Gheyre Faal"
	elseif boatlicV >= 1 then
		boatlicV = ""
	end
	---------------------
		-- For (faal) Boat Lic --
	local boatlicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pBoatLic"))
	if boatlicV2 == 0 then
		boatlicV2 = ""
	elseif boatlicV2 >= 1 then
		boatlicV2 = "Faal"
	end
	---------------------
		-- For (Gheyre Faal) Mat Lic --
	local matlicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pMatsLic"))
	if matlicV == 0 then
		matlicV = "Gheyre Faal"
	elseif matlicV >= 1 then
		matlicV = ""
	end
	---------------------
		-- For (faal) Mat Lic --
	local matlicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pMatsLic"))
	if matlicV2 == 0 then
		matlicV2 = ""
	elseif matlicV2 >= 1 then
		matlicV2 = "Faal"
	end
	---------------------
		-- For (Gheyre Faal) Gun Lic --
	local gunlicV = tonumber(getElementData(accSys:getPlayerAcc(root), "pGunLic"))
	if gunlicV == 0 then
		gunlicV = "Gheyre Faal"
	elseif gunlicV >= 1 then
		gunlicV = ""
	end
	---------------------
		-- For (faal) Gun Lic --
	local gunlicV2 = tonumber(getElementData(accSys:getPlayerAcc(root), "pGunLic"))
	if gunlicV2 == 0 then
		gunlicV2 = ""
	elseif gunlicV2 >= 1 then
		gunlicV2 = "Faal"
	end
	---------------------
	-- Faction Tab

	local fw = tonumber(getElementData(accSys:getPlayerAcc(root), "pFwarn"))
	local rankesh = tonumber(getElementData(accSys:getPlayerAcc(root), "pRank"))
	if rankesh == 1 then
		rankesh = "( Rank 1 )"
	elseif rankesh == 2 then
		rankesh = "( Rank 2 )"
	elseif rankesh == 3 then
		rankesh = "( Rank 3 )"
	elseif rankesh == 4 then
		rankesh = "( Rank 4 )"
	elseif rankesh == 5 then
		rankesh = "( Rank 5 )"
	elseif rankesh == 6 then
		rankesh = "( Sub-Leader )"
	elseif rankesh == 7 then
		rankesh = "( Leader )"
	elseif rankesh == 0 and tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
		rankesh = "Shahrvand"
	elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")) > 0 then
		rankesh = FamilySys:FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")),"frank"..tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")).."").." (R"..tonumber(getElementData(accSys:getPlayerAcc(root), "pRank"))..")"
	else
		rankesh = "Shahrvand"
	end
	local tarikhesh = getElementData(accSys:getPlayerAcc(root), "pJoinFaction")
	if rankesh == 0 then
		tarikhesh = "0"
	end
	NameFard = tostring(NameFard)
	if seriallock == 1 then
		seriallock = "(Locked)"
	else
		seriallock = "(Unlocked)"
	end
	triggerClientEvent("upstats", root, root , NameFard, Tamrin, levelesh, Warn, Punish, Rob , respectash,Goldesh,MemberShip, mail, ref, faction, number, EveryExForLevUp, registerArq, lastArq, preArq, hisJob, genderesh, namesh, agesh, bankaParasi, slotesh, carlic, carlicV, carlicV2, motorlic, motorlicV, motorlicV2 , flylic, flylicV, flylicV2, boatlic, boatlicV, boatlicV2, matlic, matlicV, matlicV2, gunlic, gunlicV, gunlicV2, materialskill, BusSkill, SudaSkill, pilotskill, TrcukerSkill, StSkill, PlayTimePlayer,Ak47GSkill,DesertGSkill,M4GSkill,MP5GSkill,PistolsGSkill,SawensGSkill,ShotgunGSkill,SniperGSkill,Spaz12GSkill,UziGSkill,rankesh,tarikhesh,fw,facid,neededEx,mared,Spawnesh,seriallock,pip,logoidish,FamOrFac)
end
addEvent("StatPlayer",true)
addEventHandler("StatPlayer", root,statsetkon)

spawnlimit = {}
addEvent("setPlayerSpawn",true)
addEventHandler("setPlayerSpawn",getRootElement(),function(thePlayer,SpawnID)
	if not spawnlimit[thePlayer] then
		if tonumber(SpawnID) == 2 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pPhousekey")) == 1 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 1)
				exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be House Set Kardid" , 'success')
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRented")) == 1 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 1)
				exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be House Set Kardid" , 'success')
			else
				exports["notf"]:addNotification(thePlayer, "Shoma House Nadarid!" , 'error')
			end
		elseif tonumber(SpawnID) == 1 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0  then
				setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 2)
				exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Faction/Family Set Kardid" , 'success')

			else
				exports["notf"]:addNotification(thePlayer, "Shoma Faction Nadarid!" , 'error')
			end
		elseif tonumber(SpawnID) == 3 then

			setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 3)
			exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Last Location Set Kardid" , 'success')


		elseif tonumber(SpawnID) == 0 then
			--if tonumber(accSys:GetPlayerData(thePlayer,"pFaction")) >= 1 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pTut", 0)
				exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Spawn Location Khod Ra Be Civilian Spawn Set Kardid" , 'success')
				spawnlimit[thePlayer] = setTimer(function(thePlayer)
					spawnlimit[thePlayer] = nil
				end,2000,1,thePlayer)
			--else
				--exports["notf"]:addNotification(thePlayer,"Shoma Faction Nadarid!","error")
			--end
		end
	else
		exports["notf"]:addNotification(thePlayer,"Lotfan Spam Nakonid!","error")
	end
end)

local ArryLevel={
    {10,250000,300},
    {15,300000,350},
    {20,350000,400},
    {25,1000000,1000},
    {30,1200000,1200},
    {35,1500000,1500},
    {40,2000000,2000},
    {45,2500000,3000},
    {50,3000000,3000},
    {55,3200000,3500},
    {60,3500000,4000},
    {70,5000000,5000},
    {75,5500000,5000},
    {80,6000000,6000},
    {90,7000000,7500},
    {100,8000000,10000},
    {120,9000000,12000},
    {135,10000000,15000},
    {150,12000000,20000},
}
------------------------------------------------------
local dbpTime = 500
-- Buylevel System --
local kolaanEx = 3
function buyNewLevel( thePlayer, command )
	local playerLevel = getElementData(accSys:getPlayerAcc(thePlayer), "pLevel")
	local NexLev = tonumber(playerLevel) + 1
	local neededEx = tonumber(NexLev) * tonumber(kolaanEx)
	local niazeLevel = tonumber(neededEx) - getElementData(accSys:getPlayerAcc(thePlayer), "pExp")

	if getElementData(accSys:getPlayerAcc(thePlayer), "pExp") < tonumber(neededEx) then
		return exports["notf"]:addNotification(thePlayer, "Shoma Be "..tonumber(niazeLevel).." Respect Baraye Afzayesh Level Niaz Darid!" , 'error')
	end

	local newLevel = tonumber(playerLevel) + 1
	setElementData(accSys:getPlayerAcc(thePlayer), "pLevel", tonumber(newLevel))
	setElementData(thePlayer, "levelPlayer", tonumber(newLevel))	
	local RefiKeZadam = getElementData(accSys:getPlayerAcc(thePlayer), "pReferral")
	local Premium = getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		setElementData(thePlayer,"refnumberorg",0)
		for index, row in pairs(result) do
			local id = row['pID']
			if RefiKeZadam == id then
				local Name = row['pName']
				local NameKeBayadResBede = Name
				if Premium >= 1 then ChandTaRpBde = 2 elseif Premium == 0 then ChandTaRpBde = 1 end
				if getPlayerFromName(NameKeBayadResBede) then
					outputChatBox("#00ff00[Referral]: #ffffffShoma Ba Level Up Kardan Player #00ff00"..getPlayerName(thePlayer).." #ffffffTedade #00ff00"..ChandTaRpBde.." #ffffffRespect Jayeze Gereftid.", getPlayerFromName(NameKeBayadResBede), 255, 255, 255, true)
					local Respectesh = getElementData(accSys:getPlayerAcc(getPlayerFromName(NameKeBayadResBede)), "pExp")
					local BedeRespect = tonumber(Respectesh) + ChandTaRpBde
					setElementData(accSys:getPlayerAcc(getPlayerFromName(NameKeBayadResBede)), "pExp", tonumber(BedeRespect))
				else
					local Respecta = row['pExp'] + ChandTaRpBde
					local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pExp` = '"..tonumber(Respecta).."' WHERE `pName` = '"..Name.."'")
					dbFree(query)
				end
			end
		end
		dbFree(query)
	end
-- For Pak Nashodan Respect Baraye Premium --
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSilverPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pBronzePremium")) >= 1 then
		local ExpHayePlayer = getElementData(accSys:getPlayerAcc(thePlayer), "pExp")
		local nowTotal = tonumber(ExpHayePlayer) - tonumber(neededEx)
		setElementData(accSys:getPlayerAcc(thePlayer), "pExp", nowTotal)
	else
		setElementData(accSys:getPlayerAcc(thePlayer), "pExp", tonumber(0))
	end
	local finally = getElementData(accSys:getPlayerAcc(thePlayer), "pExp")
	setElementData(accSys:getPlayerAcc(thePlayer), "pExp", finally)
	for i = 1,#ArryLevel do
		if ArryLevel[i][1] == NexLev then
			givePlayerMoney(thePlayer, tonumber(ArryLevel[i][2]))
			setElementData(accSys:getPlayerAcc(thePlayer), "pGold", tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))+tonumber(ArryLevel[i][3]))
			outputChatBox("(Dashboard-System):Shoma Be Sath #FF0000"..NexLev.." #FFFFFFErtegha Yaftid. Gift: #00FF00"..ArryLevel[i][2].."$ #FFFFFFVa Meghdar #FFFF00"..ArryLevel[i][3].."g #FFFFFFRa Daryaft Kardid.",thePlayer,255,255,255,true)
			-- FIX (bugfix pass 3): refresh cached F1 panel values after the purchase.
			statsetkon(thePlayer)
			return false
		end
	end
	outputChatBox("(Dashboard-System):Tabrik. Shoma Be Sath #FF0000"..NexLev.." #FFFFFFErtegha Yaftid.",thePlayer,255,255,255,true)
	-- FIX (bugfix pass 3): refresh cached F1 panel values after the purchase.
	statsetkon(thePlayer)

end
addEvent("bekharleveloo",true)
addEventHandler("bekharleveloo", root, buyNewLevel)
addCommandHandler("buylevel",buyNewLevel)


-- Bade Click Roye Color Name Panel Entekhab Biad
function BiadPanelColorNCC(root) 
	exports["notf"]:addNotification(root, "Lotfan Range Jadide Esm Khod Ra Entekhab Konid." , 'info')
	end
addEvent("BiadPanelColorNCC",true)
addEventHandler("BiadPanelColorNCC", root, BiadPanelColorNCC)


function bekharSlot(root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) > 1250 then
		local pSlot = getElementData(accSys:getPlayerAcc(root), "pSlot")
		local pGold = getElementData(accSys:getPlayerAcc(root), "pGold")
		setElementData(accSys:getPlayerAcc(root), "pSlot", tonumber(pSlot) + 1)
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(pGold) - 1250)
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat (1) 'Slot Car' Kharidid!" , 'success')
		-- FIX (bugfix pass 3): the F1 panel caches gold/slot in locals that are
		--   only refreshed by the "upstats" event. Without this call the numbers
		--   on screen stayed at their pre-purchase values until the panel was
		--   closed and reopened.
		statsetkon(root)
	else
		exports["notf"]:addNotification(root, "Shoma Be 1250 Gold Baraye Kharid (1) 'Slot Car' Niaz Darid! Baraye Afzayesh Gold /shop" , 'error')
	end
end
addEvent("bekharSlot",true)
addEventHandler("bekharSlot", root, bekharSlot)

function bekharlifeSlot(root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) > 200000 then
		
		local pGold = getElementData(accSys:getPlayerAcc(root), "pGold")
		setElementData(accSys:getPlayerAcc(root), "pSspeakerLife",  1)
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(pGold) - 200000)
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Item 'Speaker Life Time' Ra Kharidari Kardid" , 'success')
		-- FIX (bugfix pass 3): the F1 panel caches gold/slot in locals that are
		--   only refreshed by the "upstats" event. Without this call the numbers
		--   on screen stayed at their pre-purchase values until the panel was
		--   closed and reopened.
		statsetkon(root)

	else
		exports["notf"]:addNotification(root, "Shoma Be 200,000 Gold Baraye Kharid Niaz Darid ." , 'error')
	end
end
addEvent("bekharlifeSlot",true)
addEventHandler("bekharlifeSlot", root, bekharlifeSlot)

function speacker1m(root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) > 2500 then
		local pSpeackerTime = getElementData(accSys:getPlayerAcc(root), "pSspeaker")
		local pGold = getElementData(accSys:getPlayerAcc(root), "pGold")
		setElementData(accSys:getPlayerAcc(root), "pSspeaker", tonumber(pSpeackerTime) + 720)
		setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(pGold) - 2500)
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat 1 Mah Speacker Time Kharidid!" , 'success')
		triggerClientEvent ( root, "PlayMovafagh", root )
		triggerClientEvent ( root, "BasteSheKoleTablet", root )
	else
		exports["notf"]:addNotification(root, "Shoma Be 2500 Gold Niaz Darid" , 'error')
	end
end
addEvent("speacker1m",true)
addEventHandler("speacker1m", root, speacker1m)


-- Bad Az Entekhabe Rang Va Click Roye Ok Panel Baste She Va Vaghte Set Va Test Beshe
function setColorName(root,hex,r,g,b)
	setElementData(root,"colornamep",hex)
	setElementData(root,"colornamepr",r)
	setElementData(root,"colornamepg",g)
	setElementData(root,"colornamepb",g)
	exports["notf"]:addNotification(root, "Baraye Test Va Kharid Nahai Be Chat Deghat Konid." , 'info')
	outputChatBox("#ffff00[Tavajoh]: #e9ffa2Range Esme Shoma Entekhab Shod Baraye Sabte Nahai Va Kharid Az Dastor #83f23f/setcolorname #e9ffa2Va Baraye Teste Rang Az Dastor #ebe63a/testcolorname #e9ffa2Estefade Konid.", root, 255, 255, 255, true)
end
addEvent("setColorName",true)
addEventHandler("setColorName", root, setColorName)


-- Teste Color Name
function TestColorName (root,hex)
	if getElementData(root,"colornamep") ~= false then
		local coloresh = getElementData(root,"colornamep")
		outputChatBox(""..coloresh..""..getPlayerName(root)..": #ffffffSalam Man Dar Hale Entekhabe Esm Hastam!", root, 255, 255, 255, true)
	else
		outputChatBox("#ff0000✖️ #ffffffRange Esmi Entekhab Nakardi Baraye Kharid Esm Rangi Be [F1] Morajee Konid!", root, 255, 255, 255, true)
	end
end
addCommandHandler("testcolorname", TestColorName)


-- Set Color Name
function setNahayColorName(root,hex)
	if getElementData(root,"colornamep") ~= false then
		if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) > 500 then
			local pGold = getElementData(accSys:getPlayerAcc(root), "pGold")
			local coloresh = getElementData(root,"colornamep")

			setElementData(accSys:getPlayerAcc(root), "pColorName", coloresh)
			setElementData(accSys:getPlayerAcc(root), "pColorNameTime", 720)
			setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(pGold) - 500)
			exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Range Esm Khod Ra Avaz Kardid." , 'success')
			outputChatBox("#00ff00[Tavajoh]: #ffffffRange Esme Shoma Be ["..coloresh..""..getPlayerName(root).."#ffffff] Taghir Yaft.", root, 255, 255, 255, true)
			-- FIX (bugfix pass 3): refresh cached F1 panel values after the purchase.
			statsetkon(root)
		end
	end

end
addCommandHandler("setcolorname", setNahayColorName)


-- Ba Click Roye No Cansel She
function CanselColorName(root)
	exports["notf"]:addNotification(root, "Kharide Esme Rangi Cansel Shod." , 'info')
	setElementData(root,"colornamep", false)
end
addEvent("CanselColorName",true)
addEventHandler("CanselColorName", root, CanselColorName)


-- FIX (bugfix pass 4): spawnlimit is keyed by player and gates the spawn
--   selector ("if not spawnlimit[thePlayer]"). It was never cleared, so the
--   table grew for the life of the server and kept dead player elements
--   referenced. [TN]Dashboard had no onPlayerQuit handler at all.
addEventHandler("onPlayerQuit", root, function()
	if spawnlimit and spawnlimit[source] ~= nil then
		if isTimer(spawnlimit[source]) then killTimer(spawnlimit[source]) end
		spawnlimit[source] = nil
	end
end)
