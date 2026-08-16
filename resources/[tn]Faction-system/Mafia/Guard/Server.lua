local funWarTurf = createRadarArea (1054.7431640625 ,2074.861328125, 100, 100, 0, 0, 0, 255 )
setRadarAreaColor ( funWarTurf, 0, 255, 0, 100 )
local accSys = exports["Accounts-system"] -- Code By ExMohmD
local miscSys = exports["misc"] -- Code By ExMohmD

function GetOnlineAzeroth() -- Azeroth Players
	local Azeroth = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 15 then
				Azeroth = tonumber( Azeroth ) + 1
			end
		end
	end
	return Azeroth
end
function GetOnlineFMS() -- FMS Players
	local FMS = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 16 then
				FMS = tonumber( FMS ) + 1
			end
		end
	end
	return FMS
end
function GetOnlineFury() -- Fury Players
	local Fury = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 14 then
				Fury = tonumber( Fury ) + 1
			end
		end
	end
	return Fury
end
function GetOnlineGroveStreet() -- Grove Street Players
	local GroveStreet = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 12 then
				GroveStreet = tonumber( GroveStreet ) + 1
			end
		end
	end
	return GroveStreet
end
function GetOnlineGardMeli() -- Grove Street Players
	local NatinalGuard = 0
	for index,Playerash in ipairs(getElementsByType("player")) do
		if getElementData(Playerash,"loggedIn") and getElementData(Playerash,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(Playerash),"pMember") == 12 then
				NatinalGuard = tonumber( NatinalGuard ) + 1
			end
		end
	end
	return NatinalGuard
end
local System = createObject(980, 0, 0, -999, 0, 0, 0)
setElementData(System, "funWarStats", false)


local Marker100 = createMarker(1070.6771240234 ,2139.2329101562 ,10.982352256775-1.5, "cylinder", 1.5, 10, 244, 23, 200)
local Marker200 = createMarker(1070.6282958984 ,2129.6665039062 ,10.982352256775-1.5, "cylinder", 1.5, 10, 244, 23, 200)
local Marker300 = createMarker(1080.2414550781 ,2139.4331054688 ,10.982352256775-1.5, "cylinder", 1.5, 10, 244, 23, 200)
local Marker400 = createMarker(1080.1574707031 ,2129.6669921875 ,10.982352256775-1.5, "cylinder", 1.5, 10, 244, 23, 200)
setElementInterior(Marker100, 55)
setElementDimension(Marker100, 55)
setElementInterior(Marker200, 55)
setElementDimension(Marker200, 55)
setElementInterior(Marker300, 55)
setElementDimension(Marker300, 55)
setElementInterior(Marker400, 55)
setElementDimension(Marker400, 55)

function greetPlayer ( ) -- Set Data Need
setElementData(source, "funWarPlayer", false)
end
addEventHandler ( "onPlayerJoin", root, greetPlayer )

function StartRobs(hitElement)
if getElementData(System, "funWarStats") == false then return false end
if tonumber(getElementData(accSys:getPlayerAcc(MafiaTeams), "pMember")) > 10 then
setElementData(hitElement, "funWarPlayer", true)
setElementInterior(Marker100, 55)
setElementDimension(Marker100, 55)
setElementInterior(Marker200, 55)
setElementDimension(Marker200, 55)
setElementInterior(Marker300, 55)
setElementDimension(Marker300, 55)
setElementInterior(Marker400, 55)
setElementDimension(Marker400, 55)
setPedAnimation(hitElement, "rob_bank", "cat_safe_rob", 300000, true, false, false, false)
exports["notf"]:addNotification(hitElement, "Ham Teami Haye Shoma Az Alan 5 Min Vaght Darand Az Shoma Mohafezat Konand!" , 'warning')
setRadarAreaColor ( funWarTurf, 0, 0, 255, 100 )
	for k, HamTeami in ipairs (getElementsByType("player")) do
		if getElementData(HamTeami , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(HamTeami), "pMember")) == tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember"))  then
					outputChatBox( "#ffff00[Fight-War] #ffffffHam Teami Shoma "..getPlayerName(hitElement).." Dar Check Point War Gharar Gerefte 5 Min Vaght Darid Azash Mohafezat Konid!", HamTeami, 255, 255, 255, true)
			end
		end
	end
setElementFrozen(hitElement, true)
setTimer(
function(hitElement)
if getElementData(hitElement, "funWarPlayer") == false then return false end
setElementFrozen(hitElement, false)
for k, HamTeami in ipairs (getElementsByType("player")) do
		if getElementData(HamTeami , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(HamTeami), "pMember")) == tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember"))  then
					outputChatBox( "#00ff00[Fight-War] #ffffffHam Teami Shoma "..getPlayerName(hitElement).." Check Point War Ra Clear Kard!!", HamTeami, 255, 255, 255, true)
					outputChatBox( "#00ff00+ 150,000K", HamTeami, 255, 255, 255, true)
					givePlayerMoney(HamTeami, 150000)
			end
		end
end

end, 300000, 0)
else
	outputChatBox( "#ff0000[Fight-War] #ff0000 Faqad Afrad Mafia Mitonan Az In War Estefade Konand", hitElement, 255, 255, 255, true)
end
end
addEventHandler("onMarkerHit", Marker100, StartRobs)
addEventHandler("onMarkerHit", Marker200, StartRobs)
addEventHandler("onMarkerHit", Marker300, StartRobs)
addEventHandler("onMarkerHit", Marker400, StartRobs)





function funWar()
	if tonumber(GetOnlineAzeroth()) > 5 or tonumber(GetOnlineFMS()) > 5 or tonumber(GetOnlineFury()) > 5 or tonumber(GetOnlineGroveStreet()) > 5 and tonumber(GetOnlineGardMeli()) > 6 then
		if getElementData(System, "funWarStats") == true then return false end
			setElementData(System, "funWarStats", true)
			local MarkerID = math.random(1,4)
			if MarkerID == 1 then
				setElementInterior(Marker100, 0)
				setElementDimension(Marker100, 0)
			elseif MarkerID == 2 then
				setElementInterior(Marker200, 0)
				setElementDimension(Marker200, 0)
			elseif MarkerID == 3 then
				setElementInterior(Marker300, 0)
				setElementDimension(Marker300, 0)
			elseif MarkerID == 4 then
				setElementInterior(Marker400, 0)
				setElementDimension(Marker400, 0)
			end
			setRadarAreaColor ( funWarTurf, 255, 0, 0, 100 )
		for k, MafiaTeams in ipairs (getElementsByType("player")) do
				if getElementData(MafiaTeams , "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(MafiaTeams), "pMember")) > 10 then
						outputChatBox( "#ffff00[Fight-War] #ffffff War Start Shod", MafiaTeams, 255, 255, 255, true)
					end
				end
			end
		
	setTimer(function ()
		for k, CopsTeama in ipairs (getElementsByType("player")) do
				if getElementData(CopsTeama , "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(CopsTeama), "pMember")) == 3 then
						outputChatBox( "#ffff00[Fight-War] #ffffff War Start Shod", CopsTeama, 255, 255, 255, true)
					end
				end
			end
		end,6000, 1)
		
		
		setTimer(function ()
			if getElementData(System, "funWarStats") == false then return false end
				setElementInterior(Marker100, 55)
				setElementDimension(Marker100, 55)
				setElementInterior(Marker200, 55)
				setElementDimension(Marker200, 55)
				setElementInterior(Marker300, 55)
				setElementDimension(Marker300, 55)
				setElementInterior(Marker400, 55)
				setElementDimension(Marker400, 55)
				setRadarAreaColor ( funWarTurf, 0, 255, 0, 100 )
		end,1200000, 1)
	end
end



function FailedWasted ( ammo, attacker, weapon, bodypart )
if getElementData( source, "funWarPlayer" ) == false then return false end
setElementInterior(Marker100, 55)
setElementDimension(Marker100, 55)
setElementInterior(Marker200, 55)
setElementDimension(Marker200, 55)
setElementInterior(Marker300, 55)
setElementDimension(Marker300, 55)
setElementInterior(Marker400, 55)
setElementDimension(Marker400, 55)
setRadarAreaColor ( funWarTurf, 0, 255, 0, 100 )
setElementData(source, "funWarPlayer", false)
setElementData(System, "funWarStats", false)
for k, HamTeami in ipairs (getElementsByType("player")) do
		if getElementData(HamTeami , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(HamTeami), "pMember")) == tonumber(getElementData(accSys:getPlayerAcc(source), "pMember"))  then
					outputChatBox( "#ff0000[Fight-War] #ffffffHam Teami Shoma "..getPlayerName(source).." Dar Check Point Kill Shod War Filed Shod!", HamTeami, 255, 255, 255, true)
			end
		end
	end
	exports["notf"]:addNotification(source, "War Filed Shod Shoma Mordid!!" , 'error')
for k, CopsTeam in ipairs (getElementsByType("player")) do
		if getElementData(CopsTeam , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(CopsTeam), "pMember")) == 3 then
					outputChatBox( "#ffff00[Fight-War] #ffffffWanted "..getPlayerName(source).." Dar Check Point Kill Shod War Filed Shod!", CopsTeam, 255, 255, 255, true)
					outputChatBox( "#00ff00[Fight-War] #ffffffTamam Azaye National Guard Be Onvan Jayze 165,000K Be Onvan Jayze Daryaft Kardand!!", CopsTeam, 255, 255, 255, true)
					givePlayerMoney(CopsTeam, 165000)
			end
		end
	end
end
addEventHandler ( "onPlayerWasted", root, FailedWasted )

addCommandHandler("startwar",
function (thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 15 then
funWar()
outputChatBox( "#00ff00[Admin-Fight-War] #ffffffStarted!!!", thePlayer, 255, 255, 255, true)
end
end)