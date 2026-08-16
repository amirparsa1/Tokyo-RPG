--Pishniaz

local accSys = exports["Accounts-System"] -- Public By Arlixx 
local miscSys = exports["Misc"] -- Telegram: @EnixGame
local dbpTime = 500

--Tables

local AdminRanks = {
    { "Admin Level 1"},--1
    { "Admin Level 2"},--2
    { "Admin Level 3"},--3
    { "Supervisor"},--4
    { "Hoster"},--5
    { "Developer"},--6
    { "Manager"},--7
    { "Director"},--8
    { "Owner"},--9
    { "Founder"},--10
}

local HelperRanks = {
	{ "Beta Helper"},
	{ "Helper"},
	{ "Head Helper"},
}

local JailNames = {
    { "DepartMent Jail"},--1
    { "Federal Jail"},--2
    { "Centeral Jail"},--3
    { "Admin Jail"},--4
}

Words = { 
	".com",
	".org",
	".ir",
	".net",
	".me",
	"mta",
	"samp",
	"server",
	"vps",
	"ip",
	"gaming",
	"game",
	"enix",
	"iran mta",
	"stark",
	"infinity",
	"biaid in sv",
	"biaid in server",
	"TS",
	"Ts",
	"ts",
	".IR",
	".COM",
	"MTA",
	"SAMP",
	"Samp",
	":7777",
	"epicgaming",
	"epic",
	"sv",
	"teamspeak",
	"discord",
	"Discord",
	"irm",
}

--Exported Scripts

function getNearestPlayer(player,distance)
	local tempTable = {}
	local lastMinDis = distance-0.0001
	local nearestPlayer = false
	local px,py,pz = getElementPosition(player)
	local pint = getElementInterior(player)
	local pdim = getElementDimension(player)
	for _,v in pairs(getElementsByType("player")) do
		if v ~= player then
			local vint,vdim = getElementInterior(v),getElementDimension(v)
			if vint == pint and vdim == pdim then
				local vx,vy,vz = getElementPosition(v)
				local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
				if dis < distance then
					if dis < lastMinDis then 
						lastMinDis = dis
						nearestPlayer = v
					end
				end
			end
		end
	end
	return nearestPlayer
end

function GetPlayerAdminRank(level)
    local tempData = nil
    if level == nil then 
        tempData = "No Answer"
    else
        tempData = AdminRanks[tonumber(level)][1]
    end
    return tempData
end	

function GetPlayerHelperRank(level)
	if not level then return false end
	Rank = HelperRanks[tonumber(level)][1]
	return Rank
end

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(angle + 90)
    local dx = math.cos(a) * dist
    local dy = math.sin(a) * dist
    return x+dx, y+dy
end

function isVehicleEmpty( vehicle )
	if not isElement( vehicle ) or getElementType( vehicle ) ~= "vehicle" then
		return true
	end

	local passengers = getVehicleMaxPassengers( vehicle )
	if type( passengers ) == 'number' then
		for seat = 0, passengers do
			if getVehicleOccupant( vehicle, seat ) then
				return false
			end
		end
	end
	return true
end

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

function GetOnlineAdmins()
	local Admins = 0
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= 1 then
				Admins = tonumber( Admins ) + 1
			end
		end
	end
	return Admins
end

function GetOnlineHelpers()
	local Helpers = 0
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") == 0 then
				if getElementData(accSys:getPlayerAcc(modira),"pHelper") >= 1 then
					Helpers = tonumber( Helpers ) + 1
				end
			end
		end
	end
	return Helpers
end

function AdminWarn ( warn )
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= 1 then
				outputChatBox(warn, modira, 255, 255, 255, true )
			end
		end
	end
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

function SpecialAdminWarn ( warn , admin )
	outputDebugString ( ""..removeHex(warn).."" )
	local MyRank = getElementData(accSys:getPlayerAcc(admin),"pAdmin")
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= MyRank then
				outputChatBox(warn, modira, 255, 255, 255, true )
			end
		end
	end
end

function SendMessageToAll ( message )
	for index,allPlayers in ipairs(getElementsByType("player")) do
		if getElementData(allPlayers,"loggedIn") and getElementData(allPlayers,"loggedIn") == true then
			outputChatBox(message, allPlayers, 255, 255, 255, true )
		end
	end
end

--Scripts

addCommandHandler("setfp",
function ( thePlayer, command, player, fp )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
		if player and fp then
			local find = miscSys:findPlayer ( player )
			if find then
				local fp = tonumber(fp)
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pPunish", fp)
				outputChatBox("#00ff00shoma FP #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..fp.."#00ff00 set kardid!", thePlayer, 255, 255, 255, true)
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Fp Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..fp.." Saat#ffffff Set Kard!" , thePlayer )
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /setfp <PartOfName/ID> <FP>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("setvip",
function ( thePlayer, command, player, fp )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 6 then
		if player and fp then
			local find = miscSys:findPlayer ( player )
			if find then
				local fp = tonumber(fp)
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pVip", fp)
				outputChatBox("#00ff00shoma Vip Day #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..fp.." Days#00ff00 set kardid!", thePlayer, 255, 255, 255, true)
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Vip Days Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..fp.."Days#ffffff Set Kard!" , thePlayer )
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /setvip <PartOfName/ID> <Days>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("sendTo",
function (thePlayer, command, posX, posY, posZ, intID, dimID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local posX, posY, posZ, intID , dimID = tonumber(posX), tonumber(posY), tonumber(posZ), tonumber(intID), tonumber(dimID)
	if posX and posY and posZ and intID and dimID then
		setElementPosition(thePlayer, posX, posY, posZ)
		setElementInterior(thePlayer, intID)
		setElementDimension(thePlayer, dimID)
	else
		outputChatBox("error", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("givemoney",
function ( thePlayer, _, player, amount )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		-- FIX (bugfix pass 4): a negative amount here handed out a money DRAIN
		--   ("/givemoney x -50000" removed cash), and a fractional amount
		--   desynced the client money counter. Floor it and require > 0.
		local amount = tonumber(amount)
		if amount then amount = math.floor(amount) end
		if amount and amount > 0 and amount < 100000000 then
			local targetName = getPlayerName ( find )
			givePlayerMoney( find, tonumber( amount ) )
			local totalMoney = getPlayerMoney ( find )
			outputChatBox("Mablaghe $"..convertNumber( amount ).." Baraye "..targetName.." Ferestade shod.", thePlayer, 0, 255, 0)
			outputChatBox("Mojoodie hamrahe "..targetName.." Dar hale hazer $"..convertNumber ( totalMoney ).." Mibashad.", thePlayer, 0, 255, 0)
			outputChatBox("Mablaghe $"..convertNumber( amount ).." Az "..getPlayerName(thePlayer).." Baraye Shoma Ersal shod.", find, 0, 255, 0) -- 11
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Be Player#fc9803 "..targetPlayer.." #ffffffMablaghe #fc9803"..amount.."$#ffffff Pool Dad!" , thePlayer )
			setElementData(accSys:getPlayerAcc(find), "pCash", totalMoney)
		else
			outputChatBox("#A9C4E4Syntax: /givemoney <PartOfName> <Amount Of Money>", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000Error: Playere Morede Nazar Yaft Nashod.", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("setpskin",
function ( thePlayer, command, player, skinid )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		skinid = tonumber( skinid )
		if skinid >= 0 or skinid <= 312 then
			if skinid == 3 or skinid == 4 or skinid == 5 or skinid == 6 or skinid == 8 or skinid == 42 or skinid == 65 or skinid == 74 or skinid == 86 or skinid == 119 or skinid ==149 or skinid == 208 or skinid == 273 or skinid == 289 then
				outputChatBox("Motasefane Skin ID haye 3, 4, 5, 6, 8, 42, 65, 74, 86, 119, 149, 208, 273, 289, Dar Dastres nist.", thePlayer, 255, 0, 0)
				return
			end
			local targetPlayer = getPlayerName ( find )
			setElementModel( find, skinid )
			setElementData(accSys:getPlayerAcc(find), "cSkin", skinid)
			setElementData(accSys:getPlayerAcc(find), "fSkin", skinid)
			outputChatBox("Skin ID'e "..targetPlayer.." be "..skinid.." taghir yaft.", thePlayer, 0, 255, 0)
			outputChatBox("Skin ID'e shoma tavasote "..getPlayerName(thePlayer).." be "..skinid.." taghir yaft.", find, 0, 255, 0)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Skine Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..skinid.."#ffffff Set Kard!" , thePlayer )
		else
			outputChatBox("#A9C4E4Syntax: /setskin <PartOfName> <Skin ID>", thePlayer, 255, 0, 0, true)
			outputChatBox("#A9C4E4Skin ID's are started from '0' to '312'.", thePlayer, 255, 0, 0, true)
		end
	end		
end)

addCommandHandler("getpos",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	outputChatBox("#ff0000|--------------------- Mokhtasat , Rotation ---------------------|", thePlayer, 100, 100, 100,true)
	local x, y, z = getElementPosition(thePlayer)
	outputChatBox("#ffffffMokhtasat Shoma #ff0000("..x.." ,"..y.." ,"..z..")", thePlayer, 150, 150 , 150,true)
	if ( isElement(thePlayer) and getElementType (thePlayer) == "player" ) then
        local x, y, z = getElementRotation ( thePlayer )        
        outputChatBox("#ffffffRotation Shoma #ff0000("..x.." ,"..y.." ,"..z..")", thePlayer, 150, 150 , 150,true)
    end
	outputChatBox("#ff0000|-------------------------------------------------------------|", thePlayer, 100, 100, 100,true)
end	)

addCommandHandler("dep",
function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
    local message = table.concat({ ... }, " ")
	if #message > 0 then
        exports["[Atis]Factions"]:DepartmentMessage(message)
	else
		outputChatBox("Bezan: /dep [Matn]", thePlayer)
	end
end)

addCommandHandler("o",
function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
    local message = table.concat({ ... }, " ")
	if #message > 0 then
        outputChatBox("#b520e3**[Staff] " .. getPlayerName(thePlayer) .. ": #ffffff" .. message .." #b520e3**", v, 255, 255, 255, true)
	else
		outputChatBox("Bezan: /o [Matn]", thePlayer)
	end
end)

addCommandHandler("adv",
function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
    local message = table.concat({ ... }, " ")
	if #message > 0 then
        outputChatBox("#ff0000**[ADV]: #FFFFFF" .. message .." #ff0000**", v, 255, 255, 255, true)
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffIn Adv Ra Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Dad!" , thePlayer )
	else
		outputChatBox("Bezan: /adv [Matn]", thePlayer)
	end
end)
	
addCommandHandler("notf",
function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
    local message = table.concat({ ... }, " ")
	if #message > 0 then
    	exports["notf"]:addNotification(root, "** "..message.." **" , 'info')
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffIn notf Ra Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Dad!" , thePlayer )
	else
		outputChatBox("Bezan: /notf [Matn]", thePlayer)
	end
end)
	

function cc(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for i=1, 50 do
		outputChatBox(" ")
	end
	clearChatBox (getRootElement())
	outputChatBox("#ff0000[ADM]: #ffffffChat Haye Server Tavasot Admin #ff0000"..getPlayerName(thePlayer).." #ffffffPak Shodand!", root, 208, 0, 15,true)
end
addCommandHandler("clearchat", cc)
addCommandHandler("cc", cc)

addCommandHandler("makeadmin",
function ( thePlayer, command, player, AdminID )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if player and AdminID then
		local find = miscSys:findPlayer ( player )
		if find then
			AdminID = tonumber( AdminID )
			if AdminID >= 0 and AdminID <= 10 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pAdmin", AdminID)
				outputChatBox("#00ff00[Done]: #ffffffShoma Player #FFFF00"..targetPlayer.." #FFFFFFRa Be Ranke #FFFF00"..AdminID.."#FFFFFF MakeAdmin Kardid!", thePlayer, 0, 255, 0,true)
				outputChatBox("#00ff00[Info]:#ffffffShoma Tavasot Player #FFFF00"..getPlayerName(thePlayer).." Be Ranke #FFFF00"..AdminID.."#FFFFFF MakeAdmin Shodid!", find, 0, 255, 0, true)
				exports["[Atis]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Player "..getPlayerName(find).." Ra Admin Level "..AdminID.." Kard!")
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Admin Rank Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..AdminID.."#ffffff Set Kard!" , thePlayer )
			else
				outputChatBox("#ff0000[Error]:#ffffffDadan In Ranke Admini Emkan Pazir Nis!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Syntax: /makeadmin <PartOfName/ID> <1~10>", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("sethp",
function ( thePlayer, command, taraf, hp )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if not taraf or not hp then
		outputChatBox("#ff0000Bezan: /sethp <PartOfName/ID> <value>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			setElementHealth(find, tonumber(hp))
			outputChatBox("#00ff00[Done]: #ffffffShoma Hp Player #00ff00"..targetPlayer.." #FFFFFFRa Be Meghdar #00ff00("..hp.." HP) #ffffffTaghir Dadid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#00ff00[Info]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffMeghdar Hp Shomara Be #00ff00("..hp.." HP) #ffffffTaghir Dad!", find, 0, 255, 0, true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Hp Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..hp.."#ffffff Set Kard" , thePlayer )
		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end)

addCommandHandler("takegun",
function ( thePlayer, command, taraf )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if not taraf then
		outputChatBox("#ff0000Bezan: /takegun <PartOfName/ID>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			takeAllWeapons ( getRootElement( find ) )
			outputChatBox("#00ff00[Done]: #fff	fffShoma Tamami Aslahe Haye "..targetPlayer.." Ra Take Kardid! ", thePlayer, 0, 255, 0,true)
			outputChatBox("#ff0000[Info]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffTamami Aslahe Haye Shomaro Take Kard!", find, 0, 255, 0, true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Aslahe Haye Player#fc9803 "..targetPlayer.." #ffffffRa Take Kard!" , thePlayer )
		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end)

addCommandHandler("gg",
function ( thePlayer, command, taraf, weapon, value )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if not taraf or not weapon or not value then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID> <Weapon> <Value>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			giveWeapon ( find, weapon, value )
			wname = getWeaponNameFromID ( weapon ) 
			outputChatBox("#00ff00[Done]: #ffffffShoma Be #00ff00"..targetPlayer.."#ffffff Aslahe #00ff00("..wname..")#ffffff Ba Mizan #00ff00("..value..")#ffffff Tir Dadid! ", thePlayer, 0, 255, 0,true)
			outputChatBox("#ff0000[Info]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Shoma Aslahe #ff0000("..wname..")#ffffff Ba Mizan #ff0000("..value..")#ffffff Tir Dad! ", find, 0, 255, 0, true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Be Player#fc9803 "..targetPlayer.." #ffffffGun ID #fc9803"..weapon.."#ffffff Dad!" , thePlayer )
		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end)

addCommandHandler("rec",
function ( thePlayer, command, taraf )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if not taraf then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID>", thePlayer, 0, 255, 0,true)
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			redirectPlayer(find, "", 22003) 
			outputChatBox("#00ff00[Done]: #ffffffShoma Player #00ff00"..targetPlayer.." #ffffffRa Reconnect Dadid! ", thePlayer, 0, 255, 0,true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Player#fc9803 "..targetPlayer.." #ffffffRa Reconnect Dad!" , thePlayer )
		else
			outputChatBox("#ff0000[Error]: #ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	end
end)

addCommandHandler("i",
function (thePlayer,command,arg)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if arg then
		if not tonumber(arg) or tonumber(arg) < 1 then
			outputChatBox("#ff0000Error: Number Bezan Kioni Khan, Next Mikonamet!", thePlayer, 255, 255, 255, true)
			return
		end
		setElementAlpha ( thePlayer, tonumber(arg) )
		if tonumber(arg) ~= 255 then
			setElementData(thePlayer, "invis", true)
		end
		return
	end
	if getElementAlpha( thePlayer ) == 0 then
		setPlayerNametagShowing ( thePlayer, true )
		setElementAlpha ( thePlayer, 255 ) 
		setElementData(thePlayer, "invis", nil)
	else
		setPlayerNametagShowing ( thePlayer, false )
		setElementAlpha ( thePlayer, 0 )
		setElementData(thePlayer, "invis", true)
	end
end)

addCommandHandler("makehelper",
function ( thePlayer, command, player, helperID )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		helperID = tonumber( helperID )
		if helperID >= 0 and helperID <= 3 then
			local targetPlayer = getPlayerName ( find )
			setElementData(accSys:getPlayerAcc(find), "pHelper", helperID)
			outputChatBox("#00ff00[Done]: #ffffffShoma Player #FFFF00"..targetPlayer.." #FFFFFFRa Be Ranke #FFFF00"..helperID.."#FFFFFF MakeHelper Kardid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#00ff00[Info]:#ffffffShoma Tavasot Admin #FFFF00"..getPlayerName(thePlayer).."#FFFFFF Be Ranke #FFFF00"..helperID.."#FFFFFF MakeHelper Shodid!", find, 0, 255, 0, true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Ranke Helperi Player#fc9803 "..targetPlayer.." #ffffffRa Be #fc9803"..helperID.."#ffffff Set Kard" , thePlayer )
		else
			outputChatBox("#ff0000[Error]:#ffffffDadan In Ranke Helperi Emkan Pazir Nis!", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
	end
end)

-- Admin Vehicle Scripts --

addCommandHandler("veh",
function ( thePlayer, command, vehID, red, green, blue )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if vehID == nil then
		outputChatBox("#ff0000Bezan: /"..command.." <Vehicle-ID> <r/g/b>", thePlayer, 212, 156, 49,true)
		return
	end
	local x, y, z = getElementPosition(thePlayer)
	local createdVehicle = createVehicle(tonumber(vehID), x + 2, y, z)
	setElementData(createdVehicle, "veh_owner", tostring(admin_veh))
	if not createdVehicle then
		outputChatBox("#ff0000Vehicle Sakhte Nashod!", thePlayer, 320, 320, 320, true)
	else
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Yek Veh Ba Id#fc9803 "..vehID.." #ffffffSakht!" , thePlayer )
		setVehiclePlateText( createdVehicle, "ADM-VEH" ) 
		setVehicleColor( createdVehicle, r, g, b)
	end
end)

addCommandHandler("davall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setVehicleEngineState(admincar, false)
			setTimer(
			function ()
				destroyElement( admincar )
			end , 100, 1)
		end
	end
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Az #fc9803/davall #ffffffEstefade Kard!" , thePlayer )
end)

addCommandHandler("dv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
	if thePlayerVehicle then
		setVehicleEngineState(thePlayerVehicle, false)
		setTimer(
		function ()
			destroyElement( thePlayerVehicle )
			outputChatBox("#00ff00[Done]: #FFFFFFIn Mashin Tavasot Shoma Destroy Shod!", thePlayer, 255, 255, 255, true)
			SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Az #fc9803/dv #ffffffEstefade Kard!" , thePlayer )
		end , 100, 1)
	else
		outputChatBox("#ff0000[Error]:#FFFFFFBaraye Inkar Lazem Ast Savar Mashini Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("dav",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
	if thePlayerVehicle then
		local veh_owneri = getElementData(thePlayerVehicle, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setVehicleEngineState(thePlayerVehicle, false)
			setTimer(
			function ()
				destroyElement( thePlayerVehicle )
				outputChatBox("#00ff00[Done]: #FFFFFFIn Mashin Admini Tavasot Shoma Destroy Shod!", thePlayer, 255, 255, 255, true)
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Az #fc9803/dav #ffffffEstefade Kard!" , thePlayer )
			end , 100, 1)
		else
			outputChatBox("#ff0000[Error]:#FFFFFFMoteasefane In Mashin, Mashin Admini Nist!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]:#FFFFFFBaraye Inkar Lazem Ast Savar Mashini Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("fixall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, allveh in ipairs(getElementsByType("vehicle")) do 
	   fixVehicle(allveh)
	end
	outputChatBox("#00ff00[Done]: #ffffff Shoma Tamami Mashin Haye Server Ra Fix Kardid!", thePlayer, 255, 255, 255, true)
	outputChatBox("#ff0000[Staff]:#ffffff Tamami Mashin Haye Server Tavasot #ff0000"..getPlayerName(thePlayer).." #ffffffFix Shodand!", all, 255, 255, 255, true)
end)

addCommandHandler("fix",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		local targetPlayer = getPlayerName ( find )
		local hisVeh = getPedOccupiedVehicle(find)
		if hisVeh then
			fixVehicle(hisVeh)
			local x,y,z = getElementRotation ( hisVeh )
			setElementRotation(hisVeh,0,0,z,"default",true)
			outputChatBox("#00ff00[Done]: #ffffff Shoma Mashine #00ff00"..targetPlayer.." #ffffffRa Fix Kardid!", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffff00[Info]:#ffffff Admin #ffff00"..getPlayerName(thePlayer).." #ffffffMashin Shoma Ra Fix Kard!", find, 255, 255, 255, true)
		else
			outputChatBox("#ff0000[Error]:#FFFFFFBaraye Inkar Lazem Ast Player Savar Mashini Bashad!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("afreezecars",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, true)
		end	
	end
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Mashin Haye Admini Ra #fc9803Freeze #ffffffKard!" , thePlayer )
end
)

addCommandHandler("aunfreezecars",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, false)
		end
	end
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Mashin Haye Admini Ra #fc9803UnFreeze #ffffffKard!" , thePlayer )
end)

addCommandHandler("arespawncars",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			respawnVehicle(admincar)
		end
	end
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Mashin Haye Admini Ra #fc9803Respawn #ffffffKard!" , thePlayer )
end)

addCommandHandler("cgodmode",
function ( thePlayer, command, player, score )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if isPedInVehicle(thePlayer) then
		local vehesh = getPedOccupiedVehicle(thePlayer)
		if isVehicleDamageProof(vehesh) then
			outputChatBox("#ff0000[Car-God-Mode]:#ffffff Halate God Mode Baraye Mashine Shoma #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
			setVehicleDamageProof(vehesh, false)
		else
			outputChatBox("#ff0000[Car-God-Mode]:#ffffff Halate God Mode Baraye Mashine Shoma  #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
			setVehicleDamageProof(vehesh, true)
		end
	end
end)


addCommandHandler("svrv",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index,vehs in ipairs (getElementsByType("vehicle")) do
		if vehs then
			if not isVehicleLocked ( vehs ) then  
				if isVehicleEmpty(vehs) then
					respawnVehicle(vehs)
				end
			end
		end
	end
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Mashin Haye Server Ra #fc9803Respawn #ffffffKard!" , thePlayer )
end)

addCommandHandler("derbymode",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return
	end
	if getElementData(thePlayer,"derbymode") == true then
		outputChatBox("#70a6ff[Special]:#ffffff Halate Derby #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",nil)
	else
		outputChatBox("#70a6ff[Special]:#ffffff Halate Derby #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",true)
	end
end)

--Player Scripts

addCommandHandler("changepass",
function ( thePlayer, command, player, pass )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return false
	end
	if player and pass then
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#00ff00[Done]: #ffffffShoma Player #FFFF00"..targetPlayer.." #FFFFFFRa Be #FFFF00"..pass.."#FFFFFF Change Pass Kardid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#00ff00[Info]:#ffffffShoma Tavasot Admin #FFFF00"..getPlayerName(thePlayer).."#FFFFFF Be Passe (#FFFF00"..pass..")#FFFFFF Change Pass Shodid!", find, 0, 255, 0, true)
			pass = tostring( pass )
			setElementData(accSys:getPlayerAcc(find), "pKey", pass)
			exports["[EniX]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Password Player "..getPlayerName(find).." Ra Be "..pass.." Taghir Dad!")
		else
			outputChatBox("#ff0000Error: Chenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Syntax: /changepass <PartOfName/ID> <NewPassWord>", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("respectall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return false
		end
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pExp", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pExp")) + tonumber(tedad))
				outputChatBox("#ff0000[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Tamami Player Ha Tedad #ff0000"..tedad.." #ffffffRespect Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Be Player Haye Online #fc9803"..tedad.." Respect #ffffffDad!" , thePlayer )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("moneyall",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return false
		end
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local value = tonumber(value)
				givePlayerMoney(hame_Playera, value)
				ShowMoney = convertNumber(value)
				outputChatBox("#ff0000[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Tamami Player Ha Meqdar #00ff00"..ShowMoney.."$ #ffffffPool Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Be Player Haye Online #fc9803"..value.."$ Money #ffffffDad!" , thePlayer )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("respect",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if find then
		local targetPlayer = getPlayerName ( find )
		local tedad = tonumber(tedad)
		local respectPlayer = getElementData(accSys:getPlayerAcc(find), "pExp")
		setElementData(accSys:getPlayerAcc(find), "pExp", tonumber(respectPlayer) + tonumber(tedad))
		outputChatBox("#ff0000[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Shoma Tedad "..tedad.." Respect Dad!", find, 255, 255, 255, true)
		outputChatBox("#00ff00[Done]: #ffffff Shoma Be #ff0000"..getPlayerName(find).." #ffffff Tedad "..tedad.." Respect Dadid!", thePlayer, 255, 255, 255, true)
		outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Respect Dad!")
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Be Player #fc9803"..targetPlayer.."#ffffff Tedad #fc9803"..tedad.." Respect #ffffffDad!" , thePlayer )
	else
		outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("execute",
function ( thePlayer, command, player, cmd, arg1, arg2 ,arg3 ,arg4)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		local cmd = cmd
		if cmd then
			local arg1 = arg1
			if arg1 then
				local arg2 = arg2
				if arg2 then
					local arg3 = arg3
					if arg3 then
						local arg4 = arg4
						if arg4 then
							executeCommandHandler ( cmd, find,arg1,arg2,arg3,arg4 )
						else
							executeCommandHandler ( cmd, find,arg1,arg2,arg3 )
						end
					else
						executeCommandHandler ( cmd, find,arg1,arg2 )
					end
				else
					executeCommandHandler ( cmd, find,arg1 )
				end
			else
				executeCommandHandler ( cmd, find )
			end
		end
	end	
end)

addCommandHandler("goto",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		local int =  getElementInterior(find)
		local dim = getElementDimension ( find )
		local x , y , z = getElementPosition(find)
		local rx, ry, rz = getElementRotation(thePlayer)
		local x2, y2 = getPointFromDistanceRotation(x, y, 1.0, rz)
		if isPedInVehicle (thePlayer) then
			local theVehicle = getPedOccupiedVehicle ( thePlayer )
			setElementDimension(theVehicle,dim)
			setElementInterior(theVehicle,int)
			setElementPosition ( theVehicle, x2, y2, z )
			outputChatBox("#ff0000**[Staff]:#ffffff Shoma Be Player #ff0000"..getPlayerName(find).."#ffffff Goto Shodid!", thePlayer, 208, 0, 15,true)	
			outputChatBox("#ff0000**[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).."#ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
		else
			setElementDimension(thePlayer,dim)
			setElementInterior(thePlayer,int)
			setElementPosition ( thePlayer, x2, y2, z )
			outputChatBox("#ff0000**[Staff]:#ffffff Shoma Be Player #ff0000"..getPlayerName(find).."#ffffff Goto Shodid!", thePlayer, 208, 0, 15,true)
			outputChatBox("#ff0000**[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).."#ffffff Be Shoma Goto Kard!", find, 208, 0, 15,true)
		end
		if isPedInVehicle (find) then
      		if ( isPedInVehicle ( find ) ) then
      		  	local vehicle = getPedOccupiedVehicle ( find )
				if find == thePlayer then
					return
				end
				local seats = getVehicleMaxPassengers ( vehicle ) + 1
				local i = 0
				while ( i < seats ) do
					if ( not getVehicleOccupant ( vehicle, i ) ) then
   						setTimer ( warpPedIntoVehicle, 1000, 1, thePlayer, vehicle, i )
						break
					end
					i = i + 1
				end
			end
		end
	else
		outputChatBox("#A9C4E4Syntax: /goto <ID/PartOfName>", thePlayer, 255, 0, 0, true)
	end	
end)

addCommandHandler("gethere",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find then
		local dim = getElementDimension ( thePlayer )
		local int =  getElementInterior(thePlayer)
		local x , y , z = getElementPosition(thePlayer)
		local r = getPedRotation ( thePlayer )
		x = x - math.sin ( math.rad ( r ) ) * 2
		y = y + math.cos ( math.rad ( r ) ) * 2
		if isPedInVehicle (find) then
			local theVehicle = getPedOccupiedVehicle ( find )
			setElementDimension(theVehicle,dim)
			setElementInterior(theVehicle,int)
			setElementPosition ( theVehicle, x, y, z )
			for index, toMashine in ipairs( getElementsByType("player") ) do
				if isPedInVehicle (toMashine) then
					local yourVehicle = getPedOccupiedVehicle(toMashine)
					if yourVehicle == theVehicle then
						setElementDimension(toMashine,dim)
						setElementInterior(toMashine,int)
					end
				end
			end
		else
			setElementDimension(find,dim)
			setElementInterior(find,int)
			setElementPosition ( find, x , y, z )
		end
		outputChatBox("#ff0000**[Staff]:#ffffff Shoma Player #ff0000"..getPlayerName(find).."#ffffff Ra GetHere Kardid!", thePlayer, 208, 0, 15,true)		
		outputChatBox("#ff0000**[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).."#ffffff Shoma Ra GetHere Kard!", find, 208, 0, 15,true)	
	else
		outputChatBox("#A9C4E4Syntax: /gethere <ID/PartOfName>", thePlayer, 255, 0, 0, true)
	end	
end)

addCommandHandler("respawnall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
		executeCommandHandler ( "respawn", thePlayer, getPlayerName(hame_Playera) )
	end
	outputChatBox("#ff0000[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffHame Player Haye Dakhel Server Ra #ff0000Respawn #ffffffKard!", hame_Playera, 255, 255, 255, true)
	SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Hame Player Haye Online Ra #ff0000Respawn #ffffffKard!" , thePlayer )
end)

addCommandHandler("ertefa",
function ( thePlayer, command ,value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if value then
		local value = tonumber(value)
		local myVehicle = getPedOccupiedVehicle ( thePlayer )
		if myVehicle then
			setVehicleHandling(myVehicle, "suspensionLowerLimit", value)
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Mashin Bashid!", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000Syntax: /ertefa <Value>", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("setwanted",
function ( thePlayer, command , player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer(player)
	if find then
		local value = tonumber(value)
		if value then
			if value <= 6 and value >= 0 then
				setPlayerWantedLevel(find, value)
				outputChatBox("#ff0000[Staff]:#ffffff Shoma Player #ff0000"..getPlayerName(find).."#ffffff Ra Be "..value.." SetWanted Kardid!", thePlayer, 208, 0, 15,true)	
				outputChatBox("#ff0000[Staff]:#ffffff Admin #ff0000"..getPlayerName(thePlayer).." #ffffffShoma Ra Be "..value.." SetWanted Kard!", find, 255, 255, 255, true)
				exports["[Atis]Factions"]:DepartmentMessage("Wanted Haye Player "..getPlayerName ( find ).." Tavasot Admin "..getPlayerName(thePlayer).." Be "..value.." Taghir Kard!")
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Wanted Haye Player #fc9803"..targetPlayer.."#ffffff Ra Be Tedad #fc9803"..value.."#ffffff Set Kard!" , thePlayer )
			else
				outputChatBox("#ff0000[Error]: #ffffffTedad Setare Ha Bayad (0~6) Bashad!", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#A9C4E4Syntax: /setwanted <ID Or PartOfName> <Value>", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("getcarhere",
function ( thePlayer, command, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if (...) then
		local plate = string.sub( table.concat({...}, " "), 1, 90 )
		if ( string.find( string.sub ( plate, 1, 1 ), " " ) ) then 
			return
		end
		for _,cars in ipairs (getElementsByType("vehicle")) do
			if cars then
				if getVehiclePlateText ( cars ) == plate then
					local x , y , z = getElementPosition(thePlayer)
					setElementPosition ( cars, x, tonumber(y)+2, z )
				end
			end
		end
	else
		outputChatBox("#A9C4E4Syntax: /getcarhere <Plate>", thePlayer, 255, 0, 0, true)
	end
end)

addCommandHandler("shonod",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if getElementData(thePlayer,"InShonod") == true then
		outputChatBox("#ff0000[Shonod]:#ffffff Halate Shonod #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",nil)
	else
		outputChatBox("#ff0000[Shonod]:#ffffff Halate Shonod #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",true)
	end
end)

addCommandHandler("godmode",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if getElementData(thePlayer,"HealFactor") == true then
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate HealingFactor #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"HealFactor",nil)
	else
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate HealingFactor #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"HealFactor",true)
	end
end)


addCommandHandler("pmembers",
function(thePlayer, cmd, facid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if (facid) then
		local factionid = tonumber(facid)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		outputChatBox(""..facdata[factionid][2].."[Data-Base-System]:#ffffff Liste Azaye Faction "..facdata[factionid][2]..""..facdata[factionid][1].."#ffffff:", thePlayer, 255, 255, 255, true)
		if (result and numrows > 0) then
			setElementData(thePlayer,"Members",1)
			for index, row in pairs(result) do
				local factioneyaru = row['pMember']
				if tonumber(factioneyaru) == tonumber(factionid) then
					local name = row['pName']
					local rank = row['pRank']
					local lvl = row['pLevel']
					local pref = row['pID']
					outputChatBox(""..facdata[factionid][2].."["..getElementData(thePlayer,"Members").."] Player Name: #ffffff"..name..""..facdata[factionid][2].." Player Rank: #ffffff"..rank..""..facdata[factionid][2].." Player Level: #ffffff"..lvl..""..facdata[factionid][2].." Player Reff: #ffffff"..pref, thePlayer, 255, 255, 255, true)
					local chanta = getElementData(thePlayer,"Members")
					local chantabadi = tonumber(chanta) + 1
					setElementData(thePlayer,"Members",chantabadi)
				end
			end
			setElementData(thePlayer,"Members",nil)
		end
		dbFree(query)
	else
		outputChatBox("#ff0000Bezan: /pmembers <ID>", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("fdemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					local name = row['pName']
					exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Player "..name.." Ra Az Faction Demote Kardid!" , 'success')
				end
			end
		end
		dbFree(query)
		SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Player #fc9803"..name.."#ffffff Ra #fc9803fdemote#ffffff Kard!" , thePlayer )
		local sefr = 0
		local shasd = 60
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
		dbFree(query)
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pPunish` = '"..tonumber(shasd).."' WHERE `pID` = '"..tonumber(preffe).."'")
		dbFree(query)
	else
		outputChatBox("#ff0000Bezan: /fdemote <pID>", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("puser",
function(thePlayer, cmd, username)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if (username) then
		local user = username
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local pname = row['pName']
				if pname == user then
					local pw = row['pKey']
					local lvl = row['pLevel']
					local pref = row['pID']
					local mail = row['pEmail']
					local serial = row['pSerial']
					outputChatBox("#ff0000[Data-Base-System] Name: #ffffff"..pname.." #ff0000PassWord: #ffffff"..pw.." #ff0000Preff: #ffffff"..pref.." #ff0000Email: #ffffff"..mail.." #ff0000Serial: #ffffff"..serial.."", thePlayer, 255, 255, 255, true)
				end
			end
		end
		dbFree(query)
	else
		outputChatBox("#ff0000Bezan: /puser <username>", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("pserial",
function(thePlayer, cmd, serial)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if (serial) then
		local s = serial
		--if tonumber(factionid) == 0 and tonumber(factionid) <= 19 then --Police Department
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local serial = row['pSerial']
					if s == serial then
						local pw = row['pKey']
						local lvl = row['pLevel']
						local pref = row['pID']
						local mail = row['pEmail']
						local pname = row['pName']
						outputChatBox("#ff0000[Data-Base-System] Name: #ffffff"..pname.." #ff0000PassWord: #ffffff"..pw.." #ff0000Preff: #ffffff"..pref.." #ff0000Email: #ffffff"..mail.." #ff0000Serial: #ffffff"..serial.."", thePlayer, 255, 255, 255, true)
					end
				end
			end
			dbFree(query)
		--end
	else
		outputChatBox("#ff0000Bezan: /pserial <serial>", thePlayer, 0, 255, 0,true)
	end
end)

addEventHandler( "onElementClicked", root,
function ( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 4 then
				if getElementData(player,"ingetownermode") == true then
					if getElementData(source,"owner") then
						outputChatBox("#ff0000[Get-Car-Owner]: #ffffff Owner In Veh #ff0000"..getElementData(source,"owner").."#ffffff Mibashad! ", player, 255, 255, 255, true)
					end
				end
            end
        end
    end
end)

addEventHandler( "onElementClicked", root,
function ( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" or getElementType( source ) == "player" 
		or getElementType( source ) == "ped" or getElementType( source ) == "object" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 10 then
				if getElementData(player,"inshowmeidmode") == true then
					outputChatBox("#ff0000[Show-Me-Id]: #ffffff ID In Element #ff0000"..getElementID(source).."#ffffff Mibashad! ", player, 255, 255, 255, true)
				end
            end
        end
    end
end)

addCommandHandler("showmeid",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 2 then
		if getElementData(thePlayer,"inshowmeidmode") == true then
			setElementData(thePlayer,"inshowmeidmode",nil)
			outputChatBox("#ff0000[Show-Me-Id]: #ffffffShoma Ba Movafaghiat Halate ShowMeId Ro Off Kardid!", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer,"inshowmeidmode",true)
			outputChatBox("#ff0000[Show-Me-Id]: #ffffffShoma Ba Movafaghiat Halate ShowMeId Ro On Kardid!", thePlayer, 255, 255, 255, true)
		end
	end
end)

addCommandHandler("getcarowner",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 2 then
		if getElementData(thePlayer,"ingetownermode") == true then
			setElementData(thePlayer,"ingetownermode",nil)
			outputChatBox("#ff0000[Get-Car-ID]: #ffffffShoma Ba Movafaghiat Halate GetCarOwner Ro Off Kardid!", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer,"ingetownermode",true)
			outputChatBox("#ff0000[Get-Car-ID]: #ffffffShoma Ba Movafaghiat Halate GetCarOwner Ro On Kardid!", thePlayer, 255, 255, 255, true)
		end
	end
end)

addCommandHandler("awanteds",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		outputChatBox("#97bbf4((________________Wanteds________________))", thePlayer, 255, 255, 255, true)
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				if getPlayerWantedLevel(v) > 0 then
					outputChatBox("#97bbf4Player : #ffffff"..getPlayerName(v).." (".. getElementData(v, "TarafID")..") #97bbf4Tedad Wanted: #ffffff"..getPlayerWantedLevel(v), thePlayer, 255, 255, 255, true)
				end
			end
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("ijs",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		outputChatBox("#ff0000((#ffff00________________#ffff00Jailed Players#ffff00________________#ff0000))", thePlayer, 255, 255, 255, true)
		for i, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "loggedIn") == true then
				local JailTime = getElementData(accSys:getPlayerAcc(v), "pJailTime")
				if JailTime > 0 then
					local JailJa = getElementData(accSys:getPlayerAcc(v), "pAJailed")
					outputChatBox("#ffff00Player: #ff0000"..getPlayerName(v).." ("..getElementData(v,"TarafID")..")#ffff00 | Jail: #ff0000"..JailNames[JailJa][1].."#ffff00 | Time: #ff0000"..JailTime.."", thePlayer, 255, 255, 255, true)
				end
			end
		end
		outputChatBox("#ff0000((#ffff00_____________________________________________#ff0000))", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("unjail",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local taraf = miscSys:findPlayer(player)
	if taraf then 
		if getElementData(taraf, "loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(taraf), "pJailTime") > 0 then
				setElementData(accSys:getPlayerAcc(taraf), "pJailTime", 1)
				outputChatBox("#00ff00Done: #ffffffPlayer #00ff00"..getPlayerName(taraf).." #ffffffBa Movafaghiat Unjail Shod!", thePlayer, 255, 255, 255, true)
				SpecialAdminWarn ( "#fc9803[Admins]: #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff Player #fc9803"..getPlayerName(taraf).."#ffffff Ra Az Zendan #fc9803Unjail #ffffffKard!" , thePlayer )
			else
				outputChatBox("#ff0000Error: In Player To Jail Nist!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Error: Inke Login Nist :|", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Player Find Nashod!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("setfood",
function ( thePlayer, command, player, Meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		if player and Meghdar then
			local find = miscSys:findPlayer ( player )
			if find then
				local Meghdar = tonumber(Meghdar)
				local targetPlayer = getPlayerName ( find )
				setElementData(find, "Food", Meghdar)
				outputChatBox("#00ff00Done: #ffffffMeghdare Foode #00ff00"..getPlayerName (find).." #ffffffBe #00ff00"..Meghdar.."% #ffffffTaghir Kard!", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#ff0000Error: Player Find Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /setwater <PartOfName/ID> <Value>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("setwater",
function ( thePlayer, command, player, Meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		if player and Meghdar then
			local find = miscSys:findPlayer ( player )
			if find then
				local Meghdar = tonumber(Meghdar)
				local targetPlayer = getPlayerName ( find )
				setElementData(find, "Water", Meghdar)
				outputChatBox("#00ff00Done: #ffffffMeghdare Watere #00ff00"..getPlayerName (find).." #ffffffBe #00ff00"..Meghdar.."% #ffffffTaghir Kard!", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#ff0000Error: Player Find Nashod!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Syntax: /setwater <PartOfName/ID> <Value>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("showvip",
function ( ppl, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pAdmin")) > 0 then
		if player then
			local find = miscSys:findPlayer(player)
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#ff0000[Vip]: #00ff00Player #ff0000"..targetPlayer.."#00ff00 Tedad #ff0000"..getElementData(accSys:getPlayerAcc(find), "pVip").."#00ff00 Roz Vip Ast!", ppl, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Syntax: /showvip <PartOfName/ID>", ppl, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", ppl, 255, 255, 255, true)
	end
end)

x,y,z,fwp,bl = false,false,false,false,false
addCommandHandler("fwmf",
function (p)
    if not isElement(fwp) and x then destroyElement(bl) fwp,x,y,z,bl = false,false,false,false,false end
     if not x then
        x,y,z = getElementPosition(p)
        fwp = p
		exports["notf"]:addNotification(p, "Fire Works Mother Fucker Sakhte Shod!" , 'warning')
     elseif fwp == p then
        triggerClientEvent("makeFireworks", root, p,x,y,z)
        setTimer(destroyElement,10000,1,bl)
        bl,fwp,x,y,z = false,false,false,false,false
		exports["notf"]:addNotification(p, "Fire Works Mother Fucker Partab Shod!" , 'success')
     end
end)

addCommandHandler("rko",
function ( thePlayer, command, player, score )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local root = thePlayer
	local taraf = getNearestPlayer(root,10)
	if taraf then 
		x,y,z = getElementPosition(thePlayer)
		local myint = getElementInterior( thePlayer )
		local mydim = getElementDimension( thePlayer )
		setElementPosition(thePlayer,x,y,z)
		x = x - math.sin ( math.rad ( 0 ) ) * -0.5
		y = y + math.cos ( math.rad ( 0 ) ) * -0.5
		setElementPosition(taraf,x,y,z)
		setElementInterior( taraf, myint )
		setElementDimension( taraf, mydim )
		setElementRotation( thePlayer, 0, 0, 180, "default", true)
		setElementRotation( taraf, 0, 0, 180, "default", true)
		exports["[Atis]Anims"]:SetPedRKOAnimation(thePlayer,"RKO1",-1,true,false,false,false)
		exports["[Atis]Anims"]:SetPedRKOAnimation(taraf,"RKO2",-1,true,false,false,false)
		triggerClientEvent("RkoSound", resourceRoot, thePlayer)
		toggleAllControls ( taraf, false, true, false)
		toggleAllControls ( thePlayer, false, true, false)
		setTimer( function()
			-- FIX (bugfix pass 4): the element can be gone by the time this timer
			--   fires (player quit / object destroyed). Without this guard MTA
			--   raises "Bad argument" and the rest of the callback never runs.
			if not isElement(thePlayer) then return end
			setPedAnimation ( thePlayer )
			setPedAnimation ( taraf )
			toggleAllControls ( thePlayer, true )
			toggleAllControls ( taraf, true )
			if not getElementData(taraf,"HealFactor") then
				killPed ( taraf, thePlayer , 0 , 9 )
			end
		end, 2000, 1)
	end
end)

addCommandHandler("showfp",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if player then
		local taraf = miscSys:findPlayer(player)
		if taraf then 
			local KhamireYaro = getElementData(accSys:getPlayerAcc(taraf), "pPunish")
			outputChatBox("#ff0000[FP]: #ffffffMeghdar Fp Player "..getPlayerName(taraf).." : #ff0000"..KhamireYaro.."", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Error: Player Find Nashod Chaghal!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Syntax: /showfp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("showslot",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 0 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if player then
		local taraf = miscSys:findPlayer(player)
		if taraf then 
			local KhamireYaro = getElementData(accSys:getPlayerAcc(taraf), "pSlot")
			outputChatBox("#ff0000[Slot]: #ffffffTedad Car Slot Player "..getPlayerName(taraf).." : #ff0000"..KhamireYaro.."", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Error: Player Find Nashod Chaghal!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Syntax: /showfp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler ( "xmastree",
function ( thePlayer )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 5 then
		local x,y,z = getElementPosition( thePlayer )
		o = createObject ( 771, x + 2, y, z - 2 )
		o1 = createMarker ( x + 2, y, z + 8, "corona", 5, 200, 100, 0, 150 )
		o2 = createMarker ( x + 2, y, z + 9, "corona", 5, 0, 100, 100, 150 )
		o3 = createMarker ( x + 2, y, z + 10, "corona", 5, 0, 0, 50, 150 )
		o4 = createMarker ( x + 2, y, z + 10.5, "corona", 5, 150, 140, 130, 150 )
		o5 = createMarker ( x + 2, y, z + 11, "corona", 5, 250, 150, 50, 150 )
		o6 = createMarker ( x + 2, y, z + 12, "corona", 5, 0, 100, 100, 150 )
		o7 = createMarker ( x + 2, y, z + 13, "corona", 5, 200, 0, 200, 150 )
		o8 = createMarker ( x + 2, y, z + 14, "corona", 5, 100, 150, 255, 150 )
		o9 = createMarker ( x + 2, y, z + 14, "corona", 5, 120, 50, 0, 150 )
		o10 = createMarker ( x + 2, y, z + 14, "corona", 5, 100, 100, 0, 150 )
		o11 = createMarker ( x + 2, y, z + 15, "corona", 5, 0, 100, 50, 150 )
		o12 = createMarker ( x + 2, y, z + 16, "corona", 5, 200, 0, 50, 150 )
		o13 = createMarker ( x + 2, y, z + 17.5, "corona", 5, 0, 100, 0, 150 )
		o14 = createMarker ( x + 2, y, z + 18, "corona", 5, 2, 1, 21, 150 )
		o15 = createMarker ( x + 2, y, z + 18, "corona", 5, 20, 10, 110, 150 )
		o16 = createMarker ( x + 2, y, z + 19, "corona", 5, 10, 50, 100, 150 )
		o17 = createMarker ( x + 2, y, z + 20, "corona", 5, 0, 100, 100, 150 )
		o18 = createMarker ( x + 2, y, z + 22, "corona", 5, 200, 100, 10, 255 )
		o19 = createMarker ( x + 2, y, z + 4, "corona", 5, 200, 100, 0, 150 )
		o20 = createMarker ( x + 2, y, z + 5, "corona", 5, 0, 100, 100, 150 )
		o21 = createMarker ( x + 2, y, z + 6, "corona", 5, 0, 0, 50, 150 )
		o22 = createMarker ( x + 2, y, z + 6.5, "corona", 5, 150, 140, 130, 150 )
		o23 = createMarker ( x + 2, y, z + 6, "corona", 5, 250, 150, 50, 150 )
		o24 = createMarker ( x + 2, y, z + 10, "corona", 5, 0, 100, 100, 150 )
		o25 = createMarker ( x + 2, y, z + 13, "corona", 15, 200, 0, 200, 150 )
		o26 = createMarker ( x + 2, y, z + 15, "corona", 5, 100, 150, 255, 150 )
		o27 = createMarker ( x + 2, y, z + 23, "corona", 15, 120, 50, 0, 150 )
		o28 = createMarker ( x + 2, y, z + 23, "corona", 5, 100, 100, 0, 150 )
		o29 = createMarker ( x + 2, y, z + 24, "corona", 15, 0, 100, 50, 150 )
		o30 = createMarker ( x + 2, y, z + 25, "corona", 5, 200, 0, 50, 150 )
		o31 = createMarker ( x + 2, y, z + 25.5, "corona", 5, 0, 100, 0, 150 )
		o32 = createMarker ( x + 2, y, z + 26, "corona", 5, 2, 1, 21, 150 )
		o33 = createMarker ( x + 2, y, z + 26, "corona", 5, 20, 10, 110, 150 )
		o34 = createMarker ( x + 2, y, z + 25, "corona", 15, 10, 50, 100, 150 )
		o35 = createMarker ( x + 2, y, z + 4, "corona", 15, 0, 100, 100, 150 )
		o36 = createMarker ( x + 2, y, z + 6, "corona", 15, 200, 100, 10, 255 )
	end
end)

local chair = nil
addCommandHandler("blowme",
function (thePlayer,command,pname)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
		return
	end
	if pname then
		local taraf = miscSys:findPlayer ( pname )
		if taraf then
			if chair then
				destroyElement(chair)
				chair = nil
			end
			x,y,z = getElementPosition(thePlayer)
			local myint = getElementInterior( thePlayer )
			local mydim = getElementDimension( thePlayer )
			chair = createObject(1755,x+2,y+1.4,z-1,0,0,0)
			setElementInterior( chair, myint )
			setElementDimension( chair, mydim )
			setElementPosition(thePlayer,x+2.5,y+0.5,z)
			setElementPosition(taraf,x+2.5,y-0.5,z)
			setElementRotation( thePlayer, 0, 0, 180, "default", true)
			setElementRotation( taraf, 0, 0, 0, "default", true)
			setElementInterior( taraf, myint )
			setElementDimension( taraf, mydim )
			setPedAnimation(thePlayer,"blowjobz","BJ_couch_loop_p",1,true,false)
			setPedAnimation(taraf,"blowjobz","BJ_couch_loop_W",1,true,false)
			toggleAllControls ( taraf, false, true, false)
			toggleAllControls ( thePlayer, false, true, false)
			setTimer( function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
				destroyElement(chair)
				chair = nil
				setPedAnimation ( thePlayer )
				setPedAnimation ( taraf )
				toggleAllControls ( thePlayer, true )
				toggleAllControls ( taraf, true )
			end, 30000, 1)
		end
	end
end)

addCommandHandler("fuck",
function (thePlayer,command,pname)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
		return
	end
	if pname then
		local taraf = miscSys:findPlayer ( pname )
		if taraf then
			x,y,z = getElementPosition(thePlayer)
			local myint = getElementInterior( thePlayer )
			local mydim = getElementDimension( thePlayer )
			setElementPosition(thePlayer,x,y,z)
			x = x - math.sin ( math.rad ( 0 ) ) * -1
			y = y + math.cos ( math.rad ( 0 ) ) * -1
			setElementPosition(taraf,x,y,z)
			setElementInterior( taraf, myint )
			setElementDimension( taraf, mydim )
			setElementRotation( thePlayer, 0, 0, 180, "default", true)
			setElementRotation( taraf, 0, 0, 0, "default", true)
			setPedAnimation ( thePlayer, "sex", "sex_1_cum_p", -1, true, false, false )
			setPedAnimation ( taraf, "sex", "sex_1_cum_w", -1, true, false, false )
			toggleAllControls ( taraf, false, true, false)
			toggleAllControls ( thePlayer, false, true, false)
			setTimer( function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
				setPedAnimation ( thePlayer )
				setPedAnimation ( taraf )
				toggleAllControls ( thePlayer, true )
				toggleAllControls ( taraf, true )
			end, 30000, 1)
		end
	end
end)

addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),
function (slot, vehicle, x, y, z, rotX, rotY, rotZ)
	attachElements(source, vehicle, x, y, z, rotX, rotY, rotZ)
	setPedWeaponSlot(source, slot)
end)

addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),
function ()
	detachElements(source)
end)

addCommandHandler("cfly",
function ( thePlayer, command )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return
		end
		triggerClientEvent( "CFly", thePlayer, thePlayer )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("gv",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return
		end
		if not getElementData(thePlayer, "GV") then
			setElementData(thePlayer, "GV",true)
			outputChatBox("#00ff00Done: Shoma Global Voice Ra Active Kardid!", thePlayer, 255, 255, 255, true)
		else
			setElementData(thePlayer, "GV",nil)
			outputChatBox("#ff0000Done: Shoma Global Voice Ra DeActive Kardid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("cnpc",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local x, y, z = getElementPosition(thePlayer)
	local rotx, roty, rotz = getElementRotation ( thePlayer )        
	outputChatBox("#ff0000{ 0 , "..x.." , "..y.." , "..z.." , "..rotz.." , AnimGroup , Anim , "..getElementInterior( thePlayer ).." , "..getElementDimension( thePlayer ).." },", thePlayer, 150, 150 , 150,true)
end)

addCommandHandler("getfastpos",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local x, y, z = getElementPosition(thePlayer)
	local rotx, roty, rotz = getElementRotation ( thePlayer )        
	outputChatBox("#ff0000{ "..x.." , "..y.." , "..z.." , "..rotz.." },", thePlayer, 150, 150 , 150,true)
end)

addEventHandler("onPlayerCommand",root,
function(command)
	if not getElementData(source,"loggedIn") or getElementData(source,"loggedIn") ~= true then
	    cancelEvent()
	end
end)

addCommandHandler("setcontractall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return false
		end
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pHeadValue", tedad)
				exports["[Atis]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Be Tamami Player ha "..tedad.." Respect Dad!")
			end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("ghorekeshi",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
			outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
			return
		end
		outputChatBox("#c4ff00[GhoreKeshi]: #ffffffAdmin #c4ff00"..getPlayerName(thePlayer).." #ffffffGhore Keshi Ra Shoro Kard!", getRootElement(), 255, 255, 255, true)
		setTimer ( function()
			local Random = getRandomPlayer()
			outputChatBox("#c4ff00[GhoreKeshi]: #ffffffMomkene #c4ff00"..getPlayerName(Random).."("..getElementData(Random,"TarafID")..") #ffffffBarande In Ghore Keshi Bashe!", getRootElement(), 255, 255, 255, true)
		end, 10000, 3 )
		setTimer ( function()
			outputChatBox("#c4ff00[GhoreKeshi]: #ffffffBarande In Ghore Keshi Kasi Nist Joz ...", getRootElement(), 255, 255, 255, true)
			setTimer ( function()
				local Random = getRandomPlayer()
				outputChatBox("#c4ff00[GhoreKeshi]: #ffffffBarande In Ghore Keshi Kasi Nist Joz #c4ff00"..getPlayerName(Random).."("..getElementData(Random,"TarafID")..")#ffffff! Mobarakesh Bashe :)", getRootElement(), 255, 255, 255, true)
			end, 5000, 1 )
		end, 35000, 1 )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

antiSpam = {} 
function autoUnmute ( player )
	if ( isElement ( player ) and isPlayerMuted ( player ) ) then
		setPlayerMuted ( player, false )
		outputChatBox ("#00ff00[Anti-Spam]:#ffffffShoma UnMute Shodid!",player, 255, 255, 0,true )
	end
end

addEventHandler("onPlayerChat", root,
function () 
	if isTimer(antiSpam[source]) then
		cancelEvent()  
		outputChatBox("#ff0000[Anti-Spam]:#ffffff Player #ff0000"..getPlayerName(source).."#ffffff 5 Daghighe Mute Shod, #ff0000Reason: Anti-Spam!", getRootElement(), 255, 255, 0,true) 
		setPlayerMuted(source, true)
		setTimer ( autoUnmute, 300000, 1, source)
	else
		antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 500, 1, source) 
	end
end)

addCommandHandler("refferalslist",
function(thePlayer, cmd)
	local reffetaraf = getElementData(accSys:getPlayerAcc(thePlayer), "pID")
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	outputChatBox("#ff0000[Refferal-System]:#ffffff Liste Kasani Ke Id Refferal Shoma Ra Vared Kardan:", thePlayer, 255, 255, 255, true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"reffsnumber",1)
		for index, row in pairs(result) do
			local id = row['pReferral']
			if id == reffetaraf then
				local name = row['pName']
				outputChatBox("#ff0000["..getElementData(thePlayer,"reffsnumber").."]:#00ff00 "..name, thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"reffsnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"reffsnumber",chantabadi)
			end
		end
		setElementData(thePlayer,"reffsnumber",nil)
		dbFree(query)
	end
end)

addCommandHandler("refferals",
function(thePlayer, cmd)
	local reffetaraf = getElementData(accSys:getPlayerAcc(thePlayer), "pID")
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		setElementData(thePlayer,"reffsnumber",0)
		for index, row in pairs(result) do
			local id = row['pReferral']
			if id == reffetaraf then
				local chanta = getElementData(thePlayer,"reffsnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"reffsnumber",chantabadi)
			end
		end
		outputChatBox("#ff0000[Refferal-System]:#ffffff Tedad #ff0000"..getElementData(thePlayer,"reffsnumber").."#ffffff Player Id Refferal Shoma Ra Vared Kardan!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00[Refferal-System]:#ffffff Baraye Didan List Player Hayi Ke Refferal Shoma Ra Vared Kardan Mitavanid Az #00ff00/refferalslist #ffffffEstefade Konid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"reffsnumber",nil)
		dbFree(query)
	end
end)

addCommandHandler("bankvalue",
function ( thePlayer, command, Value)
	if getElementData(thePlayer, "loggedIn") == true then
		if Value then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 6 then
				outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
				return false
			end
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM bankaccounts;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					Money, Owner, Number = row['bMoney'], row['bOwner'], row['bNumber']
					if tonumber(Money) > tonumber(Value) then
						outputChatBox("#ff0000[Bank-Warn] #ffffffOwner: #ff0000"..Owner.." #ffffffBalance: #ff0000"..convertNumber ( Money ).."$ #ffffffCardNumber: #ff0000"..Number.."", thePlayer, 212, 156, 49,true)
					end
				end
				dbFree(query)
			end
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)

addCommandHandler("admins",
function ( thePlayer, command)
	if tonumber(GetOnlineAdmins()) > 0 then
		outputChatBox("#ffffff((   Tedad #ff0000Admin #FFFFFFHaye Online #ff0000["..GetOnlineAdmins().."]#FFFFFF   ))", thePlayer, 150, 150 , 150,true)
		outputChatBox("#ff0000-----------------------------------------------", thePlayer, 150, 150 , 150,true)
		for index,modira in ipairs(getElementsByType("player")) do
			if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
				if getElementData(accSys:getPlayerAcc(modira),"pAdmin") > 0 then
					outputChatBox("#FFFFFF[ID: "..getElementData(modira,"TarafID").."] "..getPlayerName(modira)..": #ff0000[ "..GetPlayerAdminRank(getElementData(accSys:getPlayerAcc(modira),"pAdmin")).." ]", thePlayer, 150, 150 , 150,true)
				end
			end
		end
		outputChatBox("#ff0000-----------------------------------------------", thePlayer, 150, 150 , 150,true)
	else
		outputChatBox("#ff0000Darhal Hazer Hich Admin i Online Nist!", thePlayer, 150, 150 , 150,true)
	end
end)

addCommandHandler("helpers",
function ( thePlayer, command)
	if tonumber(GetOnlineHelpers()) > 0 then
		outputChatBox("#ffffff((   Tedad #ff0000Helper #FFFFFFHaye Online #ff0000["..GetOnlineHelpers().."]#FFFFFF   ))", thePlayer, 150, 150 , 150,true)
		outputChatBox("#ff0000-----------------------------------------------", thePlayer, 150, 150 , 150,true)
		for index,modira in ipairs(getElementsByType("player")) do
			if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
				if getElementData(accSys:getPlayerAcc(modira),"pHelper") > 0 and getElementData(accSys:getPlayerAcc(modira),"pAdmin") == 0 then
					outputChatBox("#FFFFFF[ID: "..getElementData(modira,"TarafID").."] "..getPlayerName(modira)..": #ff0000[ "..GetPlayerHelperRank(getElementData(accSys:getPlayerAcc(modira),"pHelper")).." ]", thePlayer, 150, 150 , 150,true)
				end
			end
		end
		outputChatBox("#ff0000-----------------------------------------------", thePlayer, 150, 150 , 150,true)
	else
		outputChatBox("#ff0000Darhal Hazer Hich Helper i Online Nist!", thePlayer, 150, 150 , 150,true)
	end
end)

addCommandHandler("jetpack",
function ( player, command )
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) < 1 then
		return
	end
	if not isPedInVehicle (player) then
		setPedWearingJetpack ( player, not isPedWearingJetpack ( player ) )
	end
end)

function GivePlayerJP ( player, command )
	if not getElementData(player,"loggedIn") then
		return
	end	
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) < 1 then
		return
	end
	if not isPedInVehicle (player) then
		setPedWearingJetpack ( player, not isPedWearingJetpack ( player ) )
	end
end
addCommandHandler("jetpack", GivePlayerJP)

addEventHandler("onPlayerJoin",root,
function ()
   bindKey(source,"j","down",GivePlayerJP)	
end)

addEventHandler("onPlayerChat", root, function ( message ) 
	for _, word in ipairs(Words) do
		if( message:find( word ) )then
			AdminWarn("#ff0000[ADM-Warn]: #ffffff" ..getPlayerName(source).. " Chat Kard: " ..message)
		end
	end
end)

addCommandHandler("getcarpos",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return
	end
	local veh = getPedOccupiedVehicle (thePlayer)
	local x,y,z = getElementPosition( veh )
	local rotx,roty,rotz = getElementRotation ( veh )
	outputChatBox("#ff0000[Staff]: #ffffffMokhtasat Car Shoma ("..x.." ,"..y .." ,"..z..")", thePlayer, 150, 150 , 150,true)
	outputChatBox("#ff0000[Staff]: #ffffffRotation Car Shoma ("..rotx.." ,"..roty.." ,"..rotz..")", thePlayer, 150, 150 , 150,true)
end)

addCommandHandler("setbenzin",
function ( thePlayer, command, benzin)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if isPedInVehicle (thePlayer) then
		local veh = getPedOccupiedVehicle (thePlayer)
		local plate = getVehiclePlateText ( veh )
		outputChatBox("#00ff00[Done]: #ffffffShoma Benzin in Mashin Ra Be #00ff00["..benzin.."]#ffffff Taghir Dadid!", thePlayer, 0, 255, 0,true)
		exports["[Atis]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Benzin Mashin ["..plate.."] Ra Be ("..benzin..") Taghir Dad!")
		setElementData(veh,"fuel",benzin)		
	else
		outputChatBox("#ff0000Error: Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("afill",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	if isPedInVehicle (thePlayer) then
		local veh = getPedOccupiedVehicle (thePlayer)
		local benzin = 100
		setElementData(veh,"fuel",benzin)
		outputChatBox("#00ff00[Done]: #ffffffShoma Makhzan Benzin in Mashin ra Por Kardid! ", thePlayer, 0, 255, 0,true)
	else
		outputChatBox("#ff0000Error: Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler ( "getpelak",
function ( thePlayer, command)
	if isPedInVehicle (thePlayer) then
		local veh = getPedOccupiedVehicle (thePlayer)
		local plate = getVehiclePlateText ( veh )
		outputChatBox("#F0F000Pelak Khodro: #FFFFFF["..plate.."]", thePlayer, 0, 255, 0,true)
	else
		outputChatBox("#ff0000Error: Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler ( "setpelak",
function ( thePlayer, command, plate)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return false
	end
	if isPedInVehicle (thePlayer) then
		if (plate == nil) then
			outputChatBox("#ff0000Bezan: /"..command.." <Pelak>", thePlayer, 255, 255, 255, true)
		else
			local veh = getPedOccupiedVehicle (thePlayer)
			local oldplate = getVehiclePlateText ( veh )
			setVehiclePlateText( veh, plate )
			outputChatBox("#00ff00[Done]: #ffffffPelak Khodro Be #00ff00("..plate..") #ffffffTaghir Yaft! ", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Error: Baraye inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

function thisCommandHandlersExist (commandNameString)
	local Rvalue = false
	if commandNameString and type(commandNameString == "string") then
		for _, subtable in pairs( getCommandHandlers() ) do
			local commandName = subtable[1]
			if commandName == commandNameString then
				Rvalue = true
			end
		end
	end
	return Rvalue
end

addEventHandler( "onPlayerCommand" , root , function(command)
	if command ~= "Toggle" and command ~= "admin" and command ~= "freecam" and command ~= "firstperson" and command ~= "fp" and command ~= "say" and command ~= "teamsay" and command ~= "crosshair" and command ~= "next" and command ~= "start" and command ~= "refresh" and command ~= "stop" and command ~= "jobs" and command ~= "fps" and command ~= "refreshall" and command ~= "recoil" and command ~= "restart"  and command ~= "debugscript" and command ~= "cleardebug" and command ~= "cmdhelp" and command ~= "chasb" and command ~= "unchasb" and command ~= "snow" and command ~= "snowball" and command ~= "inventory" and command ~= "report"then
		if thisCommandHandlersExist(command) ~= true then
			outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", source, 255, 255, 255, true)
		end
	end
	if (command == "whois") then
		cancelEvent()
	elseif (command == "msg") then
		cancelEvent()
	end
end)

addCommandHandler("ggun",
function (player)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 7 then
		local on = not exports.gravity_gun:isGravityGunEnabled(player)
		exports.gravity_gun:togglePlayerGravityGun(player,on)
		outputChatBox("#70a6ff[Special]: #ffffffGravity Gun "..(on and "#00ff00On" or "#ff0000Off").."#ffffff Shod",player, 150, 150 , 150,true)
	end
end)

--Admin Help

local ahelpdata = {
	{ "#00ff00/goto <PartOfName/Id> #ffff00-- #ff0000Teleport Be Player" , 1 },
	{ "#00ff00/gethere <PartOfName/Id> #ffff00-- #ff0000Teleporte Player Be Shoma" , 2 },
	{ "#00ff00/sendTo <X> <Y> <Z> <Int> <Dim> #ffff00-- #ff0000 Teleport Be Mokhtasat" , 2 },
	{ "#00ff00/respawn <PartOfName/Id> #ffff00-- #ff0000Spawne Dobare Player" , 4 },
	{ "#00ff00/respawnall #ffff00-- #ff0000Respawne Tamami Player Ha" , 8 },
	{ "#00ff00/takegun <PartOfName/Id> #ffff00-- #ff0000Gereftane Aslahe Haye Player" , 5 },
	{ "#00ff00/setfp <PartOfName/Id> <FP> #ffff00-- #ff0000Set Kardane Faction Punishe Player" , 4 },
	{ "#00ff00/setvip <PartOfName/Id> <Days> #ffff00-- #ff0000Set Kardane Roz Haye Vip Player" , 6 },
	{ "#00ff00/setpskin <PartOfName/Id> <SkinID> #ffff00-- #ff0000Set Kardane Skine Player" , 7 },
	{ "#00ff00/sethp <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardan Healthe Taraf" , 1 },
	{ "#00ff00/setwanted <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Wantede Player" , 3 },
	{ "#00ff00/givemoney <PartOfName/Id> <Value> #ffff00-- #ff0000Dadane Pool Be Player" , 8 },
	{ "#00ff00/getpos #ffff00-- #ff0000Gereftane Mokhtasate Khod" , 8 },
	{ "#00ff00/dep <Message> #ffff00-- #ff0000Dadane Chat Dar Bisim Markazi" , 4 },
	{ "#00ff00/o <Message>#ffff00-- #ff0000Chate Hameganie Staff" , 2 },
	{ "#00ff00/adv <Message>#ffff00-- #ff0000Chate Hameganie Staff ((Anonymous))" , 2 },
	{ "#00ff00/notf <Message>#ffff00-- #ff0000Not Baraye Hame ((Anonymous))" , 7 },
	{ "#00ff00/cc #ffff00-- #ff0000Pak Kardane Chate Server" , 1 },
	{ "#00ff00/clearchat #ffff00-- #ff0000Pak Kardane Chate Server" , 1 },
	{ "#00ff00/gg <PartOfName/Id> <GunID> <Bullet> #ffff00-- #ff0000Dadane Aslahe Be Player" , 2 },
	{ "#00ff00/rec <PartOfName/Id> #ffff00-- #ff0000Reconnect Dadane Player" , 7 },
	{ "#00ff00/i #ffff00-- #ff0000Invisible Shodan" , 6 },
	{ "#00ff00/makehelper #ffff00-- #ff0000Set Kardane Ranke Helperi" , 3 },
	{ "#00ff00/veh <Vehicle-ID>#ffff00-- #ff0000Spawn Kardan Mashine Admini" , 2 },
	{ "#00ff00/afreezecars #ffff00-- #ff0000Freeze Kardane Tamame Mashin Haye Admini" , 2 },
	{ "#00ff00/aunfreezecars #ffff00-- #ff0000UnFreeze Kardane Tamame Mashin Haye Admini" , 2 },
	{ "#00ff00/arespawncars #ffff00-- #ff0000Respawn Kardane Tamami Mashin Haye Admini" , 2 },
	{ "#00ff00/davall #ffff00-- #ff0000Pak Kardane Tamam Mashin Haye Admini" , 2 },
	{ "#00ff00/dav #ffff00-- #ff0000Pak Kardane Mashine Admini Ke Savareshid" , 2 },
	{ "#00ff00/dv #ffff00-- #ff0000Pak Kardane Mashini Ke Savareshid" , 2 },
	{ "#00ff00/fixall #ffff00-- #ff0000Fix Kardane Tamam Mashin Haye Server" , 6 },
	{ "#00ff00/fix <PartOfName/Id> #ffff00-- #ff0000Fix Kardane Mashine Player" , 1 },
	{ "#00ff00/cgodmode #ffff00-- #ff0000GodMode Kardane Mashini Ke Savareshid" , 6 },
	{ "#00ff00/svrv #ffff00-- #ff0000Respawn Kardane Tamami Mashin Haye Server" , 8 },
	{ "#00ff00/derbymode #ffff00-- #ff0000Faal Kardane Halate Derby" , 6 },
	{ "#00ff00/changepass <PartOfName/Id> #ffff00-- #ff0000Taghiire Passworde Accounte Player" , 8 },
	{ "#00ff00/respectall <Value> #ffff00-- #ff0000Respect Dadan Be Tamami Playera" , 8 },
	{ "#00ff00/respect <PartOfName/Id> <Value>#ffff00-- #ff0000Respect Dadan Be Player" , 9 },
	{ "#00ff00/moneyall <Value> #ffff00-- #ff0000Dadane Pool Be Kole Server" , 9 },
	{ "#00ff00/execute <PartOfName/Id> <CMD>#ffff00-- #ff0000Ejra Kardane Cmd Roye Player" , 9 },
	{ "#00ff00/ertefa <Value> #ffff00-- #ff0000Taghiire Ertefae Mashin" , 3 },
	{ "#00ff00/getcarhere <Plate> #ffff00-- #ff0000Get Kardane Mashin Ba Pelak" , 4 },
	{ "#00ff00/shonod #ffff00-- #ff0000Shenidane Kole Voice Chat Haye Server" , 1 },
	{ "#00ff00/godmode #ffff00-- #ff0000Faal Kardane Godmode Baraye Khod" , 2 },
	{ "#00ff00/pmembers <FactionID> #ffff00-- #ff0000Didane Liste Member Haye Faction" , 6 },
	{ "#00ff00/fdemote <Refferal> #ffff00-- #ff0000Offline Demote Kardane Player Az Faction" , 6 },
	{ "#00ff00/puser <Name>#ffff00-- #ff0000Didane Accounte Player Dar Database" , 9 },
	{ "#00ff00/pserial <Serial> #ffff00-- #ff0000Didane Accounte Player Dar Database" , 9 },
	{ "#00ff00/showmeid #ffff00-- #ff0000Faal Kardane Show Me Id Mode" , 2 },
	{ "#00ff00/getcarowner #ffff00-- #ff0000Faal Kardane Get Car Owner Mode" , 2 },
	{ "#00ff00/awanteds #ffff00-- #ff0000Didane Liste Wanted Haye Server" , 1 },
	{ "#00ff00/ijs #ffff00-- #ff0000Didane Liste Zendani Haye Server" , 1 },
	{ "#00ff00/unjail #ffff00-- #ff0000Azad Kardane Player Az Zendan" , 1 },
	{ "#00ff00/setfood <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Goshnegi Player" , 2 },
	{ "#00ff00/setwater <PartOfName/Id> <Value> #ffff00-- #ff0000Set Kardane Teshnegi Player" , 2 },
	{ "#00ff00/showvip <PartOfName/Id>#ffff00-- #ff0000Didane Roz Haye Vip Player" , 1 },
	{ "#00ff00/showfp <PartOfName/Id>#ffff00-- #ff0000Didane Saat Haye Fp Player" , 1 },
	{ "#00ff00/showslot <PartOfName/Id>#ffff00-- #ff0000Didane Slote Mashine Player" , 1 },
	{ "#00ff00/gv #ffff00-- #ff0000Baz Kardane Global Voice" , 8 },
	{ "#00ff00/getfastpos #ffff00-- #ff0000Gereftane Position Tablei" , 8 },
	{ "#00ff00/setcontractall <Value>#ffff00-- #ff0000Set Kardane Contract Baraye Kole Server" , 9 },
	{ "#00ff00/ghorekeshi #ffff00-- #ff0000Bargozari GhoreKeshi Dar Server" , 6 },
	{ "#00ff00/jetpack #ffff00-- #ff0000Faal Kardane jetpack" , 1 },
	{ "#00ff00/getcarpos #ffff00-- #ff0000Gereftane Positione Mashini Ke Savareshid" , 9 },
	{ "#00ff00/setbenzin <Value> #ffff00-- #ff0000Set Kardane Benzine Mashini Ke Savareshid" , 9 },
	{ "#00ff00/afill #ffff00-- #ff0000Por Kardane Benzine Mashini Ke Savareshid" , 1 },
	{ "#00ff00/setpelak <Pelak> #ffff00-- #ff0000Set Kardane Pelake Mashin" , 8 },
	{ "#00ff00/ggun #ffff00-- #ff0000Faal Kardane Gravity Gun" , 7 },
}

addCommandHandler ( "ahelp",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
		local MyAdminRank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
		for i=1,#ahelpdata do 
			if MyAdminRank >= ahelpdata[i][2] then
				outputChatBox(""..ahelpdata[i][1].."", thePlayer, 0, 255, 0,true)
			end
		end
	else
		outputChatBox("#ff0000Error: Shoma Be In Dastoor Dastresi Nadarid!", thePlayer, 255, 255, 255, true)
	end
end)