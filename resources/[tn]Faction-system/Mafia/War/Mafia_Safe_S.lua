local accSys = exports["Accounts-system"] -- Code By ExMohmD!

local FactionPos = {
	{ 139.9384765625 ,1378.642578125 ,1088.3671875, 5, 3 },--12 Yakouza
	{ 140.462890625 ,1378.359375 ,1088.3671875, 5, 4 },--13 DarkSaints
	{ 140.2265625 ,1378.6142578125 ,1088.3671875, 5, 2 },--14 Fury Family
	{ 1728.203125 ,-1667.8720703125 ,22.609375, 18, 2 },--15 Azeroth ( SF )
	{ 1728.18359375 ,-1668.0859375 ,22.609375, 18, 3 },--16 Famouse
}

function IsPlayerInTheHq( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 11 then 
			local Fitc = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) - 11
			local x,y,z = getElementPosition(thePlayer)
			if tonumber(getDistanceBetweenPoints3D(x,y,z,FactionPos[Fitc][1],FactionPos[Fitc][2],FactionPos[Fitc][3])) < 50 and tonumber(getElementInterior(thePlayer)) == FactionPos[Fitc][4] then
				return true
			else
				return false
			end
		end
	end
end

function OpenMafiaPanel( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 11 then 
			if IsPlayerInTheHq( thePlayer ) then
				triggerClientEvent("Mafia", thePlayer, thePlayer)
			else
				outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addEvent( "OpenMafiaPanel" , true )
addEventHandler( "OpenMafiaPanel", root, OpenMafiaPanel )

local dbpTime = 500
function MafiaRefresh( root )
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				mat, drug, tax = row['fMats'], row['fDrugs'], row['fBank']
				triggerClientEvent("upmafia", root, root, mat, drug, tax)
			end
		end
		dbFree(query)
	end
end
addEvent("MafiaRefresh",true)
addEventHandler("MafiaRefresh", root,MafiaRefresh)

addEvent("PutMat",true)
addEventHandler("PutMat", root,
function (root, hismat)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				mat = row['fMats']
			end
		end
		dbFree(query)
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pMats")) >= tonumber(hismat) then
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hismat.."gr Mat Dakhel Sandogh Mafia Gozashtid!" , 'success')
		mateghabli = getElementData(accSys:getPlayerAcc(root), "pMats")
		matebadi = mateghabli - hismat
		setElementData(accSys:getPlayerAcc(root),"pMats",matebadi)
		local totMat = mat + hismat
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fMats` = '"..totMat.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
		dbFree(query)
	else
		exports["notf"]:addNotification(root, "Shoma Inghadr Mat Nadarid!" , 'error')
	end
end)

addEvent("TakeMat",true)
addEventHandler("TakeMat", root,
function (root, hismat)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				mat = row['fMats']
			end
		end
		dbFree(query)
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")) > 6 then
		if tonumber(mat) >= tonumber(hismat) then
			exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hismat.."gr Mat Az Sandogh Mafia Bardashtid!" , 'success')
			mateghabli = getElementData(accSys:getPlayerAcc(root), "pMats")
			matebadi = mateghabli + hismat
			setElementData(accSys:getPlayerAcc(root),"pMats",matebadi)
			local totMat = mat - hismat
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fMats` = '"..totMat.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
			dbFree(query)
		else
			exports["notf"]:addNotification(root, "Inghadr Mat Dar Sandoghe Mafia Nist!" , 'error')
		end
	else
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Leader Bashid!" , 'error')
	end
end)

addEvent("PutDrug",true)
addEventHandler("PutDrug", root,
function (root, hisdrug)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				drug = row['fDrugs']
			end
		end
		dbFree(query)
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pDrugs")) >= tonumber(hisdrug) then
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hisdrug.."gr Drug Dakhel Sandogh Mafia Gozashtid!" , 'success')
		drugghabli = getElementData(accSys:getPlayerAcc(root), "pDrugs")
		drugebadi = drugghabli - hisdrug
		setElementData(accSys:getPlayerAcc(root),"pDrugs",drugebadi)
		local totdrug = drug + hisdrug
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fDrugs` = '"..totdrug.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
		dbFree(query)
	else
		exports["notf"]:addNotification(root, "Shoma Inghadr Drug Nadarid!" , 'error')
	end
end)

addEvent("TakeDrug",true)
addEventHandler("TakeDrug", root,
function (root, hisdrug)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				drug = row['fDrugs']
			end
		end
		dbFree(query)
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")) > 6 then
		if tonumber(drug) >= tonumber(hisdrug) then
			exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hisdrug.."gr Drug Az Sandogh Mafia Bardashtid!" , 'success')
			drugeghabli = getElementData(accSys:getPlayerAcc(root), "pDrugs")
			drugebadi = drugeghabli + hisdrug
			setElementData(accSys:getPlayerAcc(root),"pDrugs",drugebadi)
			local totdrug = drug - hisdrug
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fDrugs` = '"..totdrug.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
			dbFree(query)
		else
			exports["notf"]:addNotification(root, "Inghadr Drug Dar Sandoghe Mafia Nist!" , 'error')
		end
	else
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Leader Bashid!" , 'error')
	end
end)

addEvent("PutBaj",true)
addEventHandler("PutBaj", root,
function (root, HisBaj)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				Bank = row['fBank']
			end
		end
		dbFree(query)
	end
	if getElementData(root,"Baj") and tonumber(getElementData(root, "Baj")) >= tonumber(HisBaj) then
		exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..HisBaj.."$ Baj Dakhel Sandogh Mafia Gozashtid!" , 'success')
		BajeGhabli = getElementData(root, "Baj")
		BajBadi = tonumber(BajeGhabli) - (HisBaj)
		setElementData(root,"Baj",BajBadi)
		local TotBaj = Bank + HisBaj
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fBank` = '"..TotBaj.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
		dbFree(query)
	else
		exports["notf"]:addNotification(root, "Shoma Inghadr Baj Nadarid!" , 'error')
	end
end)

local Day = 0

function GetDayForMafia()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM server;" )
    local result, numrows = dbPoll(query, dbpTime)
    if (result and numrows > 0) then
		for index, row in pairs(result) do
			local Date = row['sDate']
			Day = ( tonumber(Date) )
		end
		dbFree(query)
	end
end

addEvent("TakeBaj",true)
addEventHandler("TakeBaj", root,
function (root, hisbaj)
	if not IsPlayerInTheHq( root ) then
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Dakhel Hq Bashid!" , 'error')
		return
	end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == id then
				baj = row['fBank']
			end
		end
		dbFree(query)
	end
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")) == 7 then
		GetDayForMafia()
		if tonumber(Day) == 6 or tonumber(Day) == 7 then
			if tonumber(baj) >= tonumber(hisbaj) then
				exports["notf"]:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hisbaj.."$ Baj Az Sandogh Mafia Bardashtid!" , 'success')
				givePlayerMoney ( root, hisbaj )
				local totbaj = baj - hisbaj
				local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fBank` = '"..totbaj.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
				dbFree(query)
			else
				exports["notf"]:addNotification(root, "Inghadr Baj Dar Sandoghe Mafia Nist!" , 'error')
			end
		else
			exports["notf"]:addNotification(root, "Faghat Dar 5shanbe & Jome Mishe Az Baj Haye Faction Ra Bardasht!" , 'error')
		end
	else
		exports["notf"]:addNotification(root, "Baraye Inkar Bayad Leader Bashid Va Admin Bashid!" , 'error')
	end
end)

addCommandHandler( "gun",
function ( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 11 then 
			if IsPlayerInTheHq( thePlayer ) then
				local mat = 0
				local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
				local result, numrows = dbPoll(query, dbpTime)
				if (result and numrows > 0) then
					for index, row in pairs(result) do
						local id = row['id']
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == id then
							mat = row['fMats']
						end
					end
					dbFree(query)
				end
				if tonumber(mat) >= tonumber(100) then
					local TotMat = tonumber(mat)-100
					local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fMats` = '"..TotMat.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(thePlayer), "pMember").."'")
					dbFree(query)
					local PlayerFacRank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))
					if PlayerFacRank == 1 or PlayerFacRank == 2 then
						giveWeapon ( thePlayer, 41, 10000 )
						giveWeapon ( thePlayer, 41, 10000 )
						giveWeapon ( thePlayer, 24, 100 )
					elseif PlayerFacRank == 3 then
						giveWeapon ( thePlayer, 41, 10000 )
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
					elseif PlayerFacRank == 4 or PlayerFacRank > 4 then
						giveWeapon ( thePlayer, 41, 10000 )
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						giveWeapon ( thePlayer, 33, 40 )
					elseif PlayerFacRank > 4 then
						giveWeapon ( thePlayer, 41, 10000 )
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						giveWeapon ( thePlayer, 33, 40 )
					end
					outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffDar Sandoghe Mafia Shoma Mate Kafi Nist!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end)

