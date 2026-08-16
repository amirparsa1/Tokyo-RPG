local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local dbpTime = 500

function whenPlayerDeath()
	if getElementData(source, "inpaintball") == true then
		return false
	end
	setTimer(respawnPlayerAfterDeath, 3000, 1, source)
end
addEventHandler("onPlayerWasted", root, whenPlayerDeath)

function respawnPlayerAfterDeath( thePlayer )
if getElementData(thePlayer, "inpaintball") == true then
setElementData(thePlayer,"inpaintball",nil)
end
-- Spawning	
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) == 0 then --civilian
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 3 then --civilian
		local spawnX, spawnY, spawnZ = 1173.00390625 ,-1323.328125 ,15.39771270752
		spawnPlayer(thePlayer, spawnX, spawnY, spawnZ, 273)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 1 then --house
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local owner = row['OWNER']
				local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
				if owner == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				elseif rent1 == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				elseif rent2 == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				elseif rent3 == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				elseif rent4 == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				elseif rent5 == getPlayerName(thePlayer) then
					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				end
			end
	  		dbFree(query)
		else
			spawnPlayer(root,1173.00390625 ,-1323.328125 ,15.39771270752,270)
		end

------------------------------------------------------------------------------
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 2 then --faction
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses WHERE Linked = ?",getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId") )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local Linked = row['Linked']
					local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']


					local id = row['ID']
					local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
					spawnPlayer(thePlayer, x, y, z)
					setElementInterior ( thePlayer, int )
					setElementDimension ( thePlayer, id )
				end

			else
				spawnPlayer(thePlayer, 0, 0, 3)
				setElementInterior ( thePlayer, 0 )
				setElementDimension ( thePlayer, 0 )
				
			end

		else
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
				
				local spawnX, spawnY, spawnZ = 1742.9033203125 ,-1862.322265625 ,13.576436996468
				spawnPlayer(thePlayer, spawnX, spawnY, spawnZ, 90)
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then --Edare Police
				spawnPlayer(thePlayer, 254.3876953125 ,76.8623046875 ,1003.640625)
				setElementInterior ( thePlayer, 6 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then --Police Federal
				spawnPlayer(thePlayer, 246.6171875 ,115.0224609375 ,1003.21875)
				setElementInterior ( thePlayer, 10 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then --Gard Melli
				spawnPlayer(thePlayer, 288.8798828125 ,176.85546875 ,1007.1794433594)
				setElementInterior ( thePlayer, 3 )
				setElementDimension ( thePlayer, 0 )
				setElementRotation( thePlayer, 0 ,0 ,182.0160369873, "default", true)
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then --Pezeshk
				spawnPlayer(thePlayer,  238.2978515625 ,147.775390625 ,1020.8515625)
				setElementInterior ( thePlayer, 3 )
				setElementDimension ( thePlayer, 0 )
				setElementRotation( thePlayer, 0 ,0 ,180, "default", true)
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then --Hitman Agency
				spawnPlayer(thePlayer, 173.19602966309 ,1422.8918457031 ,-15.89218711853)
				setElementInterior ( thePlayer, 8 )
				setElementDimension ( thePlayer, 10 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then --Edare Amozesh Va Morabigari

				spawnPlayer(thePlayer, 245.9921875 ,111.7265625 ,1003.21875)
				setElementRotation( thePlayer, 0 ,0 ,3, "default", true)
				setElementInterior ( thePlayer, 10 )
				setElementDimension ( thePlayer, 1 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then --Khabar Negar
				spawnPlayer(thePlayer, 2325.3898925781 ,-1144.3298339844 ,1067.4210205078)
				setElementRotation( thePlayer, 0 ,0 ,180.95056152344, "default", true)
				setElementInterior ( thePlayer, 12 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then --Shahrdar
				spawnPlayer(thePlayer, 369.146484375 ,173.7060546875 ,1008.3893432617)
				setElementRotation( thePlayer, 0 ,0 ,272, "default", true)
				setElementInterior ( thePlayer, 3 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then --Sherkat Khadamat Khodro
				spawnPlayer(thePlayer, -42.806251525879 ,1409.0451660156 ,1094)
				setElementRotation( thePlayer, 0 ,0 ,180, "default", true)
				setElementInterior ( thePlayer, 8 )
				setElementDimension ( thePlayer, 10 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then --Edare Taxirani
				spawnPlayer(thePlayer, 1495.969726, 1307.056152, 1093.289062)
				setElementInterior ( thePlayer, 3 )
				setElementDimension ( thePlayer, 9090 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then --Ballas Family
				spawnPlayer(thePlayer, 140.42578125 ,1379.7900390625 ,1088.3671875)
				setElementInterior ( thePlayer, 5 )
				setElementDimension ( thePlayer, 200 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then --Red Dragons Family
				spawnPlayer(thePlayer, 2808.212890625 ,-1169.390625 ,1025.570312)
				setElementInterior ( thePlayer, 8 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then --Los Aztecs Family
				spawnPlayer(thePlayer, 140.2763671875 ,1379.2841796875 ,1088.3671875)
				setElementInterior ( thePlayer, 5 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then --Grove Street Family
				spawnPlayer(thePlayer, 2543.158203125 ,-1318.1748046875 ,1031.42187)
				setElementInterior ( thePlayer, 2 )
				setElementDimension ( thePlayer, 0 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then --Vagos Family
				spawnPlayer(thePlayer, 140.4931640625 ,1379.9404296875 ,1088.367187)
				setElementInterior ( thePlayer, 5 )
				setElementDimension ( thePlayer, 100 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 then --Hackers
				spawnPlayer(thePlayer, 958.451171875, 2109.30859375, 1011.0234375)
				setElementInterior ( thePlayer, 1 )
				setElementDimension ( thePlayer, 23 )--]]
			end
			--[[elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pTut")) == 3 then --clan
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClan")) == 0 then
				local spawnX, spawnY, spawnZ = 1642.37109375 ,-2238.5927734375 ,13.497321128845
				spawnPlayer(thePlayer, spawnX, spawnY, spawnZ, 180)
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClan")) == 1 then
				spawnPlayer(thePlayer, 1265.8193359375 ,-784.2978515625 ,1091.90625)
				setElementInterior ( thePlayer, 5 )
				setElementDimension ( thePlayer, 1 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClan")) == 2 then
				spawnPlayer(thePlayer, 1719.876953125 ,-1665.59765625 ,20.226896286011)
				setElementInterior ( thePlayer, 18 )
				setElementDimension ( thePlayer, 7 )
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClan")) == 3 then
				spawnPlayer(thePlayer, 1265.8193359375 ,-784.2978515625 ,1091.90625)
				setElementInterior ( thePlayer, 5 )
				setElementDimension ( thePlayer, 3 )
			end--]]
		end
	end

------------------------------------------------------------------------------

	local totalMoney = getPlayerMoney(thePlayer)
	setElementData(accSys:getPlayerAcc(thePlayer), "pCash", totalMoney)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime") > 0 then
	if getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed") == 1 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
		setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
	else
		setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
	end

------------------------------------------------------------------------------

	elseif getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed") == 2 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
		setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
	else
		setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
	end

------------------------------------------------------------------------------

	elseif getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed") == 3 then
		if skinesh == 1 then
			setElementModel(thePlayer, 210)
		elseif skinesh == 2 then
			setElementModel(thePlayer, 297)
		elseif skinesh == 3 then
			setElementModel(thePlayer, 291)
		elseif skinesh == 4 then
			setElementModel(thePlayer, 304)
		end

------------------------------------------------------------------------------

	elseif getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed") == 4 then
		if skinesh == 1 then
			setElementModel(thePlayer, 210)
		elseif skinesh == 2 then
			setElementModel(thePlayer, 297)
		elseif skinesh == 3 then
			setElementModel(thePlayer, 291)
		elseif skinesh == 4 then
			setElementModel(thePlayer, 304)
		end
	end
	else
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
	setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
	else
	setElementModel(thePlayer, tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
	end
	end
else 

spawnPlayer(thePlayer, 0 ,0 ,0)


------------------------------------------------------------------------------

  if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed")) == 1 then
   local skintaraf = getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")
   setElementModel(thePlayer, skintaraf)
	local selol = math.random(1,6)
	if selol == 1 then
		setElementPosition (thePlayer, 264.3505859375 ,77.869140625 ,1001.0390625)
		setElementInterior ( thePlayer, 3 )
		setElementDimension ( thePlayer, 0 )
	elseif selol == 2 then
		setElementPosition (thePlayer, 264.2314453125 ,82.1806640625 ,1001.0390625)
		setElementInterior ( thePlayer, 3 )
		setElementDimension ( thePlayer, 0 )
	elseif selol == 3 then
		setElementPosition (thePlayer, 264.0888671875 ,86.701171875 ,1001.0390625)
		setElementInterior ( thePlayer, 3 )
		setElementDimension ( thePlayer, 0 )
	end

------------------------------------------------------------------------------

	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed")) == 2 then
	local skintaraf = getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")
    setElementModel(thePlayer, skintaraf)
  	local selolefbi = math.random(1,3)
	if selolefbi == 1 then
	   setElementPosition (thePlayer, 215.068359375 ,108.33203125 ,999.015625)
	   setElementInterior ( thePlayer, 10 )
	   setElementDimension ( thePlayer, 0 )
	elseif selolefbi == 2 then
	   setElementPosition (thePlayer, 219.076171875 ,108.4873046875 ,999.015625)
	   setElementInterior ( thePlayer, 10 )
	   setElementDimension ( thePlayer, 0 )
	elseif selolefbi == 3 then
	   setElementPosition (thePlayer, 222.9990234375 ,108.6025390625 ,999.015625)
	   setElementInterior ( thePlayer, 10 )
	   setElementDimension ( thePlayer, 0 )
	end
	

------------------------------------------------------------------------------

	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed")) == 3 then
	
local Skinfemale = getElementData(accSys:getPlayerAcc(thePlayer), "pSex")
	local skinesh = math.random(1,3)
	
	if Skinfemale == 2 then
		setElementModel(thePlayer, 304)
	else
		if skinesh == 1 then
			setElementModel(thePlayer, 210)
		 elseif skinesh == 2 then
			setElementModel(thePlayer, 297)
		 elseif skinesh == 3 then
			setElementModel(thePlayer, 291)
		end
	end
		
	local seloleng = math.random(1,6)
 	if seloleng == 1 then
		setElementPosition (thePlayer, 88.356452941895 ,182.06640625 ,998.85931396484)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
	
	elseif seloleng == 2 then
		setElementPosition (thePlayer, 92.9267578125 ,181.76171875 ,998.85931396484)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
	elseif seloleng == 3 then
		setElementPosition (thePlayer, 97.23828125 ,181.984375 ,998.86010742188)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
    elseif seloleng == 4 then
		setElementPosition (thePlayer, 97.203125 ,193.8095703125 ,998.8535766601)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
	elseif seloleng == 5 then
		setElementPosition (thePlayer, 93.3974609375 ,193.8056640625 ,998.85357666016)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
	elseif seloleng == 6 then
		setElementPosition (thePlayer, 89.064453125 ,193.76211547852 ,998.85931396484)
		setElementDimension(thePlayer,0)
		setElementInterior(thePlayer,3)
    end

  
  
------------------------------------------------------------------------------

  	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAJailed")) == 4 then
	
	
local Skinfemale = getElementData(accSys:getPlayerAcc(thePlayer), "pSex")
	local skinesh = math.random(1,3)
	if Skinfemale == 2 then
		setElementModel(thePlayer, 304)
	else
		if skinesh == 1 then
			setElementModel(thePlayer, 210)
		 elseif skinesh == 2 then
			setElementModel(thePlayer, 297)
		 elseif skinesh == 3 then
			setElementModel(thePlayer, 291)
		end
	end
	local seloleajail = math.random(1,2)
	if seloleajail == 1 then
		setElementPosition (thePlayer, 116.9462890625 ,204.6943359375 ,998.86138916016)
		setElementDimension(thePlayer, 0)
		setElementInterior(thePlayer, 3)
	elseif seloleajail == 2 then
		setElementPosition (thePlayer, 110.26171875 ,204.6357421875 ,998.86138916016)
		setElementDimension(thePlayer, 0)
		setElementInterior(thePlayer, 3)
	end
    	
end
end
	fadeCamera(thePlayer, true)
end

------------------------------------------------------------------------------

addCommandHandler("respawn",
function ( Player, command, yaru)
if tonumber(getElementData(accSys:getPlayerAcc(Player), "pAdmin")) < 1 then
	outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", Player, 255, 255, 255, true)
	return false
end
if yaru then
local thePlayer = miscSys:findPlayer ( yaru )
if thePlayer then
local find = miscSys:findPlayer ( yaru )
exports["[TN]Logger"]:SendDiscordLog("respawn",command,thePlayer,find)
respawnPlayerAfterDeath( thePlayer )
outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..getPlayerName(thePlayer).." #ffffffRa Respawn Kardid!", Player, 255, 255, 255, true)
outputChatBox("#00ff00Admin #ffffff"..getPlayerName(Player).." #00ff00Shoma Ra #ffffffRespawn #00ff00Kard!", thePlayer, 255, 255, 255, true)
else
outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", Player, 255, 255, 255, true)
end
else
outputChatBox("#C0C0C0Bezan: /respawn <PartOfName/ID>", Player, 255, 255, 255, true)
end
end)