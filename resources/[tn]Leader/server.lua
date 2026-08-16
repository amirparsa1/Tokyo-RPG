local accSys = exports["Accounts-system"] -- Script By ExMohmD 
local miscSys = exports["Misc"] 
local dbpTime = 500

addEvent("openFactionPanel",true)
addEventHandler("openFactionPanel", root,
function ( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
			triggerClientEvent("toggleFcPanel", thePlayer, thePlayer)
		end
	end
end)

addEvent("infoFaction",true)
addEventHandler("infoFaction", root,
function (root)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local myFac = tonumber(getElementData(accSys:getPlayerAcc(root), "pMember"))
		local factioneyaru = row['pMember']
		if tonumber(factioneyaru) == tonumber(myFac) then
			local name = row['pName']
			local rank = row['pRank']
			local lvl = tostring(row['pLevel'])
			local fmember = name
			triggerClientEvent("infoFactionPanel", root, fmember, lvl)
		end
	end
end)

addEvent("getPlayerFactionData",true)
addEventHandler("getPlayerFactionData",getRootElement(),function(client,finalName)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local pName = row["pName"]
		if pName == finalName then
			local pLevel = row["pLevel"]
			local pFWarn = row["pFwarn"]
			local pLastLogin = row["pLastLogin"]
			local pRank = row["pRank"]
			if pRank == 7 then
				finalRank = "Leader"
			elseif pRank == 6 then
				finalRank = "Sub-Leader"
			else
				finalRank = "Rank "..pRank..""
			end
			triggerClientEvent("SetPlayerDataOnGui",client,client,pLevel,pFWarn,pLastLogin,finalRank)
		end
	end
end)


addEvent("KickFromFaction",true)
addEventHandler("KickFromFaction",getRootElement(),function(client,fName,fFp)
	if tonumber(getElementData(accSys:getPlayerAcc(client),"pMember")) > 0 then
	if tonumber(fFp) <= 60 and 0 <= tonumber(fFp) then
		if getPlayerFromName(fName) then
			local Player = getPlayerFromName(fName)
			if tonumber(getElementData(accSys:getPlayerAcc(Player),"pRank")) ~= 7 then
				setPlayerNametagColor(Player,255,255,255)
				setElementModel(Player,getElementData(accSys:getPlayerAcc(Player),"cSkin"))
				setElementData(accSys:getPlayerAcc(Player), "pMember", 0)
				setElementData(accSys:getPlayerAcc(Player), "pFwarn", 0)
				setElementData(accSys:getPlayerAcc(Player), "pPunish", tonumber(fFp))
				setElementData(accSys:getPlayerAcc(Player), "pRank", 0)
				accSys:setFacP(Player,0)
				exports["notf"]:addNotification(Player,"Shoma Ba "..fFp.." Az Faction Kick Shodid!","info")
				outputDebugString("Player "..getPlayerName(client).." Yek Memeber Az Faction Kick Kard") 
				if tonumber(getElementData(accSys:getPlayerAcc(Player),"pTut")) == 2 then
					setElementData(accSys:getPlayerAcc(Player), "pTut", 0)
				end
			else
			exports["notf"]:addNotification(client," Leader Ro Ke Nemishe Kick Dad!","error")
			end
		else
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			for index, row in pairs(result) do
				local pName = row["pName"]
				if pName == fName then
					local pID = row["pID"]
					local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..pID.."'",0)
					dbFree( queryFw )
					local pTut = row["pTut"]
					if pTut == 2 then
						local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pTut` = ? WHERE `pID` = '"..pID.."'",0)
						dbFree( query2 )
					end
					local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = ?, `pRank` = ?, `pPunish` = ?, `fSkin` = ? WHERE `pID` = '"..pID.."'",0,0,tonumber(fFp),0)
					dbFree( query1 )
				end
			end
		end
		exports["notf"]:addNotification(client,"Player "..fName.." Ba Fp "..fFp.." Az Faction Ba Movafaqiat Kick Shod!","info")
				outputDebugString("Player "..getPlayerName(client).." Yek Memeber Az Faction Kick Kard") 

		triggerEvent("infoFaction",client,client)
		triggerClientEvent("reloadPageEvent",client,client)
	else
		exports["notf"]:addNotification(client,"Fp Bayad (0-60) Bashe","error")
	end
	else
		exports["notf"]:addNotification(client,"bug Miznid Ok Rahat Bashid  :D?!")
	end
end)

addEvent("GiveFW",true)
addEventHandler("GiveFW",getRootElement(),function(client,finalPlayerName)
	if tonumber(getElementData(accSys:getPlayerAcc(client),"pMember")) > 0 then

	if getPlayerFromName(finalPlayerName) then
		local Player = getPlayerFromName(finalPlayerName)
		if tonumber(getElementData(accSys:getPlayerAcc(Player),"pRank")) ~= 7 then
			local SarjamFw = tonumber(getElementData(accSys:getPlayerAcc(Player),"pFwarn"))+1
			setElementData( accSys:getPlayerAcc(Player),"pFwarn", tonumber(SarjamFw) )
			if SarjamFw == 3 then
				setPlayerNametagColor(Player,255,255,255)
				setElementModel( Player,getElementData(accSys:getPlayerAcc(Player),"cSkin") )
				setElementData( accSys:getPlayerAcc(Player), "pMember", 0 )
				setElementData( accSys:getPlayerAcc(Player), "pFwarn", 0 )
				setElementData( accSys:getPlayerAcc(Player), "pPunish", 60 )
				setElementData( accSys:getPlayerAcc(Player), "pRank", 0 )
				takeAllWeapons( Player )
				exports["notf"]:addNotification(client,"Player "..getPlayerName(Player).." Be Dalil Daryaft 3 Faction Warn, Az Faction Ba 60Fp Kick Shod! ","info")
				exports["notf"]:addNotification(Player,"Shoma Be Dalil Daryaft 3 Faction Warn, Az Faction Ba 60Fp Kick Shodid!","warning")
				outputDebugString("Player "..getPlayerName(client).." Yek Memeber Az Faction  Fw Kard") 
				if tonumber(getElementData(accSys:getPlayerAcc(Player),"pTut")) == 2 then
					setElementData(accSys:getPlayerAcc(Player), "pTut", 0)
					accSys:setFacP(Player)
				end
			else
				exports["notf"]:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid!","success")
			end
		else
			exports["notf"]:addNotification(client,"Be Leader Ke Nemishe Fw Dad!","error")
		end
	else
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		for index, row in pairs(result) do
			local pName = row["pName"]
			if pName == finalPlayerName then
				local pID = row["pID"]
				local pFwarns = row["pFwarn"]
				local pRank = row["pRank"]
				local NextFw = tonumber(pFwarns) + 1
				if NextFw == 3 then
					local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..pID.."'",0)
					dbFree( queryFw )
					local pTut = row["pTut"]
					if pTut == 2 then
						local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pTut` = ? WHERE `pID` = '"..pID.."'",0)
						dbFree( query2 )
					end
					local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = ?, `pRank` = ?, `pPunish` = ?, `fSkin` = ? WHERE `pID` = '"..pID.."'",0,0,60,0)
					dbFree( query1 )
				else
					local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..pID.."'",NextFw)
					dbFree( queryFw )
				end
			end
		end
	end
	triggerEvent("infoFaction",client,client)
	triggerClientEvent("reloadPageEvent",client,client)
	else
		exports["notf"]:addNotification(client,"bug Miznid Ok Rahat Bashid  :D?!","error")
		end
end)