local accSys = exports["Accounts-System"]
local miscSys = exports["Misc"]


local Pickuptamrin = createPickup(286.134765625 ,-30.2119140625 ,1001.515625, 3, 1239, 0)
setElementInterior ( Pickuptamrin, 1 )
setElementDimension ( Pickuptamrin, 0 )

-- DEBUG --
function shootingranch ( player )
---286.0791015625 ,-30.533203125 ,1001.515625
	local x, y, z = 286.1044921875 ,-30.404296875 ,1001.515625
	
    setElementInterior (x, y, z,1)
    setElementDimension (x, y, z, 0)
	setElementPosition ( player, x, y, z )
end
---addCommandHandler ( "tamrin", shootingranch )
-- DEBUG --

local curDimension = 1

shootingRanges = {}
 shootingRanges["x"] = {}
 shootingRanges["y"] = {}
 shootingRanges["z"] = {}
 shootingRanges["sx"] = {}
 shootingRanges["sy"] = {}
 shootingRanges["sz"] = {}
 shootingRanges["sr"] = {}
 
-- setElementInterior (shootingRanges["x"],1)
 --   setElementInterior (shootingRanges["y"],1)
 --   setElementInterior (shootingRanges["z"],1)
 --  setElementInterior (shootingRanges["sx"],1)
 --  setElementInterior (shootingRanges["sy"],1)
 --   setElementInterior (shootingRanges["sz"],1)
 --  setElementInterior (shootingRanges["sr"],1)
    
 local i = 0
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 2176.910, 924.81, 10.075
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2176.910, 922.68, 10.075, 180

  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 2282.265625, 2425.4760742188, 3.1257882118225, 0
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 270
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 90
  createObject ( 14819, -2616.5422363281, 206.02464294434, 4.8791799545288, 0, 0, 90 )
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 90
  
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 90
  i = i + 1
  shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i] = 1367.359375 ,-1279.7255859375 ,13.546875
  shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i] = 1367.359375 ,-1279.7255859375 ,13.546875, 180

for i, index in pairs ( shootingRanges["x"] ) do
 
	local x1, y1, z1 = shootingRanges["x"][i], shootingRanges["y"][i], shootingRanges["z"][i]
	local x2, y2, z2, r = shootingRanges["sx"][i], shootingRanges["sy"][i], shootingRanges["sz"][i], shootingRanges["sr"][i]
	
	
	local marker = createMarker ( 286.1044921875 ,-30.404296875 ,1001, "cylinder", 1, 150, 150, 150, 0 )
    setElementInterior (marker,1)
    setElementDimension (marker, 0)
	
	setElementData ( marker, "x", x2 )
	setElementData ( marker, "y", y2 )
	setElementData ( marker, "z", z2 )
	setElementData ( marker, "r", r )
	addEventHandler ( "onMarkerHit", marker,
		function ( hit )
			if getElementType ( hit ) == "player" then
				if not getPedOccupiedVehicle ( hit ) then
					triggerClientEvent ( hit, "showShootingRangeSelection", hit )
					local x, y, z, r = getElementData ( source, "x" ), getElementData ( source, "y" ), getElementData ( source, "z" ), getElementData ( source, "r" )
					setElementData ( hit, "shootingRangeX", x )
					setElementData ( hit, "shootingRangeY", y )
					setElementData ( hit, "shootingRangeZ", z )
					setElementData ( hit, "shootingRangeR", r )
				end
			end
		end
	)
end


--> Start She Tamrin Ak47 <--
function startAk47 ( gun )
local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 30, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestAk47", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ( "startShootingAk47", true )
addEventHandler ( "startShootingAk47", getRootElement(), startAk47 )

--> End She Tamrin Ak47 <--
function endAk47 ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pAk47Skill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pAk47Skill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pAk47Skill", tonumber(BedeSkill))
			
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Ak-47 Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Ak-47 Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestAk47", true )
addEventHandler ( "endShootingRanchTestAk47", getRootElement(), endAk47 )

--> Start She Tamrin Deagle <--
function startDeagle ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 24, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestDeagle", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingDeagle", true )
addEventHandler ("startShootingDeagle", getRootElement(), startDeagle )

--> End She Tamrin Deagle <--
function endDeagle ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pDeagleSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pDeagleSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pDeagleSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Deagle Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Deagle Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestDeagle", true )
addEventHandler ( "endShootingRanchTestDeagle", getRootElement(), endDeagle )

--> Start She Tamrin M4 <--
function startM4 ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 31, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestM4", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingM4", true )
addEventHandler ("startShootingM4", getRootElement(), startM4 )

--> End She Tamrin M4 <--
function endM4 ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pM4Skill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pM4Skill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pM4Skill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille M4 Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille M4 Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestM4", true )
addEventHandler ( "endShootingRanchTestM4", getRootElement(), endM4 )

--> Start She Tamrin Shutgun <--
function startShutgun ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 25, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestShutgun", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingShutgun", true )
addEventHandler ("startShootingShutgun", getRootElement(), startShutgun )


--> End She Tamrin Shutgun <--
function endShutgun ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pShotgunSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pShotgunSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pShotgunSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Shutgun Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Shutgun Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestShutgun", true )
addEventHandler ( "endShootingRanchTestShutgun", getRootElement(), endShutgun )

--> Start She Tamrin Spaz12 <--
function startSpaz12 ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 27, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestSpaz12", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingSpaz12", true )
addEventHandler ("startShootingSpaz12", getRootElement(), startSpaz12 )

--> End She Tamrin Spaz12 <--
function endSpaz12 ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pSpasSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pSpasSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pSpasSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Spaz12 Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Spaz12 Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestSpaz12", true )
addEventHandler ( "endShootingRanchTestSpaz12", getRootElement(), endSpaz12 )

--> Start She Tamrin MP5 <--
function startMP5 ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 29, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestMP5", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingMP5", true )
addEventHandler ("startShootingMP5", getRootElement(), startMP5 )

--> End She Tamrin MP5 <--
function endMP5 ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pMp5Skill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pMp5Skill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pMp5Skill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille MP5 Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille MP5 Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestMP5", true )
addEventHandler ( "endShootingRanchTestMP5", getRootElement(), endMP5 )

--> Start She Tamrin Pistol <--
function startPistol ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 22, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestPistol", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingPistol", true )
addEventHandler ("startShootingPistol", getRootElement(), startPistol )

--> End She Tamrin Pistol <--
function endPistol ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pColt47Skill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pColt47Skill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pColt47Skill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Pistol Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Pistol Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestPistol", true )
addEventHandler ( "endShootingRanchTestPistol", getRootElement(), endPistol )



--> End She Tamrin Silenced <--
function endSilenced ( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pSpistolSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pSpistolSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pSpistolSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Silenced Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Silenced Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestSilenced", true )
addEventHandler ( "endShootingRanchTestSilenced", getRootElement(), endSilenced )

--> Start She Tamrin Rifle <--
function startRifle ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 33, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestRifle", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingRifle", true )
addEventHandler ("startShootingRifle", getRootElement(), startRifle )

--> End She Tamrin Rifle <--
function endRifle( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pRifleSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pRifleSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pRifleSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Rifle Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Rifle Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestRifle", true )
addEventHandler ( "endShootingRanchTestRifle", getRootElement(), endRifle )

--> Start She Tamrin Sawed <--
function startSawed ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 26, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestSawed", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingSawed", true )
addEventHandler ("startShootingSawed", getRootElement(), startSawed )


--> End She Tamrin Sawed <--
function endSawed( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pSawnoffSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pSawnoffSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pSawnoffSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Sawed-Off Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Sawed-Off Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestSawed", true )
addEventHandler ( "endShootingRanchTestSawed", getRootElement(), endSawed )

--> Start She Tamrin Uzi <--
function startUzi ( gun )
	local player = client
	local TamrinPoint = getElementData(accSys:getPlayerAcc(player), "pTamrin")
	if tonumber(TamrinPoint) >= 10 then
		local totTamrinPoint = tonumber(TamrinPoint) - 10
		setElementData(accSys:getPlayerAcc(player), "pTamrin", tonumber(totTamrinPoint))
		local id = shootingRangeGunIDs[gun]
		setElementDimension ( player, getFreeDimension () )
		takeAllWeapons ( player )
		giveWeapon ( player, 28, 50, true )
		setElementPosition ( player, 300.22164916992, -132.56831359863, 1003.711730957 )
		setPedRotation ( player, 90 )
		setElementInterior ( player, 7 )
		triggerClientEvent ( player, "startShootingRanchTestUzi", player )
		setElementData ( player, "shootingRanchGun", id )
		exports["notf"]:addNotification(player, "Shoma Ba 10 Shooting Point Vared Tamrin Shodid, Ba Shelik Be Sibl Emtiaz Daryaft Konid. (50 Tir)" , 'success')
		triggerClientEvent ( player, "PlayMovafagh", player )
	else
		exports["notf"]:addNotification(player, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid!" , 'error')
		triggerClientEvent ( player, "PlayError", player )
	end
end
addEvent ("startShootingUzi", true )
addEventHandler ("startShootingUzi", getRootElement(), startUzi )

--> End She Tamrin Uzi <--
function endUzi( percent, totalShootingRangeHitTargets ,hit)
	local id = shootingRangeGunIDs[gun]
	local player = client
		local pname = getPlayerName ( player )
		takeAllWeapons ( player )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pUziSkill")) < 1000 then
			local SkillePlayer = getElementData(accSys:getPlayerAcc(player), "pUziSkill")
			local BedeSkill = tonumber(SkillePlayer) + (totalShootingRangeHitTargets)
			setElementData(accSys:getPlayerAcc(player), "pUziSkill", tonumber(BedeSkill))
			if totalShootingRangeHitTargets >= 1 then
				outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Uzi & Tec-9 Shoma #00ff00+"..totalShootingRangeHitTargets.." #ffffffShod.", player, 255, 255, 255, true)
			else
				outputChatBox("#ffff00[Tavajoh]: #FFFFFFMotasefane Shoma Tiri Be Hadaf Nazadid. ", player, 255, 255, 255, true)
			end
		else	
			outputChatBox("#00ff00[Tavajoh]: #FFFFFFSkille Uzi & Tec-9 Shoma Max Ast! ", player, 255, 255, 255, true)
		end
		setElementPosition ( player, 286.0283203125 ,-31.53515625 ,1001.515625 )
		setPedRotation ( player, 175.369140625 )
		setElementInterior ( player, 1 )
		setElementDimension ( player, 0 )
		local x, y, z, r = getElementData ( player, "shootingRangeX" ), getElementData ( player, "shootingRangeY" ), getElementData ( player, "shootingRangeZ" ), getElementData ( player, "shootingRangeR" )
		setElementData ( player, "shootingRanchGun", nil )
end
addEvent ("endShootingRanchTestUzi", true )
addEventHandler ( "endShootingRanchTestUzi", getRootElement(), endUzi )

--hamin bere acc system #zezaw
--> Skill Ha Bade Tamrin Set She <--
function endShootingRanchTest_func2 (sot)
local SkillePlayerAk47 = tonumber(getElementData(accSys:getPlayerAcc(source), "pAk47Skill"))
	if (SkillePlayerAk47) >= 1000 then
		setPedStat (sot, 77, 1000)
	else
		setPedStat (sot, 77, SkillePlayerAk47)
	end
	
	local SkillePlayerDeagle = tonumber(getElementData(accSys:getPlayerAcc(source), "pDeagleSkill"))
	if (SkillePlayerDeagle) >= 1000 then
		setPedStat (sot, 71, 1000)
	else
		setPedStat (sot, 71, SkillePlayerDeagle)
	end
	
	local SkillePlayerM4 = tonumber(getElementData(accSys:getPlayerAcc(source), "pM4Skill"))
	if (SkillePlayerM4) >= 1000 then
		setPedStat (sot, 78, 1000)
	else
		setPedStat (sot, 78, SkillePlayerM4)
	end
	
	local SkillePlayerShutgun = tonumber(getElementData(accSys:getPlayerAcc(source), "pShotgunSkill"))
	if (SkillePlayerShutgun) >= 1000 then
		setPedStat (sot, 72, 1000)
	else
		setPedStat (sot, 72, SkillePlayerShutgun)
	end
	
	local SkillePlayerSpaz12 = tonumber(getElementData(accSys:getPlayerAcc(source), "pSpasSkill"))
	if (SkillePlayerSpaz12) >= 1000 then
		setPedStat (sot, 74, 1000)
	else
		setPedStat (sot, 74, SkillePlayerSpaz12)
	end
	
	local SkillePlayerPistol = tonumber(getElementData(accSys:getPlayerAcc(source), "pColt47Skill"))
	if (SkillePlayerPistol) >= 1000 then
		setPedStat (sot, 69, 1000)
	else
		setPedStat (sot, 69, SkillePlayerPistol)
	end
	
	local SkillePlayerSilenced = tonumber(getElementData(accSys:getPlayerAcc(source), "pSpistolSkill"))
	if (SkillePlayerSilenced) >= 1000 then
		setPedStat (sot, 70, 1000)
	else
		setPedStat (sot, 70, SkillePlayerSilenced)
	end
	
	local SkillePlayerRifle = tonumber(getElementData(accSys:getPlayerAcc(source), "pRifleSkill"))
	if (SkillePlayerRifle) >= 1000 then
		setPedStat (sot, 79, 1000)
	else
		setPedStat (sot, 79, SkillePlayerRifle)
	end
	
	local SkillePlayerSawed = tonumber(getElementData(accSys:getPlayerAcc(source), "pSawnoffSkill"))
	if (SkillePlayerSawed) >= 1000 then
		setPedStat (sot, 73, 1000)
	else
		setPedStat (sot, 73, SkillePlayerSawed)
	end
	
	local SkillePlayerUzi = tonumber(getElementData(accSys:getPlayerAcc(source), "pUziSkill"))
	if (SkillePlayerUzi) >= 1000 then
		setPedStat (sot, 75, 1000)
	else
		setPedStat (sot, 75, SkillePlayerUzi)
	end
	
	local SkillePlayerMp5 = tonumber(getElementData(accSys:getPlayerAcc(source), "pMp5Skill"))
	if (SkillePlayerMp5) >= 1000 then
		setPedStat (sot, 76, 1000)
	else
		setPedStat (sot, 76, SkillePlayerMp5)
	end
end
addEvent ("SetSheSkillHaBadeTamrin", true )
addEventHandler ("SetSheSkillHaBadeTamrin", getRootElement(), endShootingRanchTest_func2 )


TamrinMarker = createMarker (286.1484375 ,-30.255859375 ,1001.1 , "cylinder", 0.7,111,175,230,0 )
setElementInterior ( TamrinMarker, 1 )
addEventHandler("onMarkerHit",TamrinMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getPlayerWantedLevel (hitElement)) == 0 then
			local TamrinPoint = getElementData(accSys:getPlayerAcc(hitElement), "pTamrin")
			if tonumber(TamrinPoint) >= 10 then
				triggerClientEvent("TamrinShowPanel", hitElement, hitElement)
				exports["notf"]:addNotification(hitElement, "Baraye Tamrin Ebteda Yek Aslahe Entekhab Konid." , 'info')
				triggerClientEvent ( hitElement, "Playinfo", hitElement )
			else
				exports["notf"]:addNotification(hitElement, "Baraye Tamrin Tir Andazi Niaz Be 10 Shooting Point Darid! /mypoint" , 'error')
				triggerClientEvent ( hitElement, "PlayError", hitElement )
			end
		else
			exports["notf"]:addNotification(hitElement, "Ba Wanted Nemishe Vared Tamrin Tir Andazi Shod!" , 'error')
			triggerClientEvent ( hitElement, "PlayError", hitElement )
		end
	end
end)


function getFreeDimension ()

	curDimension = curDimension + 1
	return curDimension
end



------------------------------- Kharid Skill ---------------------------------




function Skillak47()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pAk47Skill")) ~= 1000 then
		    setPedStat (source, 77, 1000)
			setElementData(accSys:getPlayerAcc(source), "pAk47Skill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Ak47 Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Ak47 Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "Skillak47",true)
addEventHandler( "Skillak47",root,Skillak47 )



function SkillDeagle()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pDeagleSkill")) ~= 1000 then
		    setPedStat (source, 71, 1000)
			setElementData(accSys:getPlayerAcc(source), "pDeagleSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Deagle Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Deagle Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillDeagle",true)
addEventHandler( "SkillDeagle",root,SkillDeagle )



function SkillM4()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pM4Skill")) ~= 1000 then
		    setPedStat (source, 78, 1000)
			setElementData(accSys:getPlayerAcc(source), "pM4Skill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill M4 Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill M4 Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillM4",true)
addEventHandler( "SkillM4",root,SkillM4 )



function SkillMp5()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 900 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pMp5Skill")) ~= 1000 then
		    setPedStat (source, 76, 1000)
			setElementData(accSys:getPlayerAcc(source), "pMp5Skill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 900)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Mp5 Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Mp5 Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillMp5",true)
addEventHandler( "SkillMp5",root,SkillMp5 )





function SkillUzi()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pUziSkill")) ~= 1000 then
		    setPedStat (source, 75, 1000)
			setElementData(accSys:getPlayerAcc(source), "pUziSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Uzi & Tec-9 Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Uzi & Tec-9 Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillUzi",true)
addEventHandler( "SkillUzi",root,SkillUzi )




function Skillspaz12()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pSpasSkill")) ~= 1000 then
		    setPedStat (source, 74, 1000)
			setElementData(accSys:getPlayerAcc(source), "pSpasSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Spaz12 Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Spaz12 Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "Skillspaz12",true)
addEventHandler( "Skillspaz12",root,Skillspaz12 )




function SkillSawed()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pSawnoffSkill")) ~= 1000 then
		    setPedStat (source, 73, 1000)
			setElementData(accSys:getPlayerAcc(source), "pSawnoffSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Sawed Off Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Sawed Off Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillSawed",true)
addEventHandler( "SkillSawed",root,SkillSawed )



function SkillShutgun()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1000 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pShotgunSkill")) ~= 1000 then
		    setPedStat (source, 72, 1000)
			setElementData(accSys:getPlayerAcc(source), "pShotgunSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1000)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Shutgun Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Shutgun Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "SkillShutgun",true)
addEventHandler( "SkillShutgun",root,SkillShutgun )




function Skillpistol()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 800 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pColt47Skill")) ~= 1000 then
		    setPedStat (source, 69, 1000)
			setElementData(accSys:getPlayerAcc(source), "pColt47Skill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 800)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Pistol Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Pistol Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "Skillpistol",true)
addEventHandler( "Skillpistol",root,Skillpistol )





function Skillsniper()
	local Goldesh = getElementData(accSys:getPlayerAcc(source), "pGold")
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pGold")) >= 1100 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pRifleSkill")) ~= 1000 then
		    setPedStat (source, 79, 1000)
			setElementData(accSys:getPlayerAcc(source), "pRifleSkill", 1000)
			setElementData(accSys:getPlayerAcc(source), "pGold", tonumber(Goldesh) - 1100)
			outputChatBox ( "#00ff00[Tabrik] #ffffffSkill Sniper Shoma Max Shod.", client, 230,0,0 ,true)
			triggerClientEvent ( client, "PlayMovafagh", client)
		else
			triggerClientEvent ( client, "PlayError", client)
			exports["notf"]:addNotification(client, "Skill Sniper Shoma Max Mibashad!" , 'error')
		end
	else
		triggerClientEvent ( client, "PlayError", client)
		exports["notf"]:addNotification(client, "Gold Shoma Kafi Nemibashad!" , 'error')
	end
end
addEvent( "Skillsniper",true)
addEventHandler( "Skillsniper",root,Skillsniper )

