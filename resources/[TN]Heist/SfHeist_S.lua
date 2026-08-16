local accSys = exports["Accounts-System"] -- Public Shode Dar @PublicMTA
local miscSys = exports["Misc"] -- Telegram: @PublicMTA

addCommandHandler("myrp",
function(thePlayer, cmd)
	local cheqadrrpDare = getElementData(accSys:getPlayerAcc(thePlayer), "pRobPoint")
	outputChatBox("#ff0000[Heist-System]:#ffffff Shoma #ff0000"..cheqadrrpDare.."/40 #ffffffRp Darid!", thePlayer, 255, 255, 255, true)
end)

addCommandHandler("showrp",
function ( ppl, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pAdmin")) > 1 then
		local find = miscSys:findPlayer(player)
		local targetPlayer = getPlayerName ( find )
		getElementData(accSys:getPlayerAcc(find), "pRobPoint")
		outputChatBox("#ff0000[Rob-Points]: #00ff00RP #ff0000"..targetPlayer.."#00ff00 Meghdare #ff0000"..getElementData(accSys:getPlayerAcc(find), "pRobPoint").."#00ff00 Ast!", ppl, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", ppl, 255, 255, 255, true)
	end
end)

addCommandHandler("setrp",
function ( ppl, command, player, number )
	if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pAdmin")) > 4 then
		local find = miscSys:findPlayer(player)
		local number = tonumber(number)
		local targetPlayer = getPlayerName ( find )
		setElementData(accSys:getPlayerAcc(find), "pRobPoint", number)
		outputChatBox("#00ff00Shoma RP #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..miscSys:FormatPN(number).."#00ff00 set kardid!", ppl, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", ppl, 255, 255, 255, true)
	end
end)

-- Marker Scripting

local HeistPartyMarker = createMarker(  1820.8112792969 ,543.66583251953 ,1579.0078125, "cylinder", 2,200,0,0,0)
setElementInterior ( HeistPartyMarker, 14 )
local MoneyMarker1 = nil
local MoneyMarker2 = nil
local HeistState = 0
local HeistVan = nil

function ShowHeistGui( thePlayer )
	triggerClientEvent( "ShowHeistGui", thePlayer, thePlayer )
	unbindKey( thePlayer, "Z", "down", ShowHeistGui )
end

addEventHandler( "onMarkerHit", HeistPartyMarker,
function ( hitElement, matchingDimension )
	if (hitElement and getElementType(hitElement) == "player") then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pMember")) < 4 then
			exports["notf"]:addNotification(hitElement, "Sherkat Dar Heist Baraye Azaye Department Momken Nist!", 'error')
			return
		end
			if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pLevel")) < 5 then
			exports["notf"]:addNotification(hitElement, "Baraye Sherkat Dar Heist Bayad Level +5 Bashid!", 'error')
			return
		end
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pRob")) < 20 then
			exports["notf"]:addNotification(hitElement, "Baraye Sherkat Dar Heist Bayad 20 Rp Dashte Bashid! Az Dastoor /myrp Estefade Konid!", 'error')
			return
		end
		if getPlayerWantedLevel(hitElement) == 0 then
			exports["notf"]:addNotification(hitElement, "Baraye Baz Kardan Safhe Heist Az Dokme ( Z ) Estefade Konid!", 'info')
			bindKey( hitElement, "Z", "down", ShowHeistGui )
		else
			exports["notf"]:addNotification(hitElement, "Sherkat Dar Heist Ba Wanted Momken Nist!", 'error')
			return
		end
	end
end)

addEventHandler( "onMarkerLeave", HeistPartyMarker,
function ( leaveElement, matchingDimension )
	if (leaveElement and getElementType(leaveElement) == "player") then
		unbindKey( leaveElement, "Z", "down", ShowHeistGui )
	end
end)

--Heist Party System


local HeistNowMarker = nil
local HeistNowMarkerBlip = nil
local IsSfHeistActive = false
local IsHeistStarted = false
local MyHeistRoleIs = {}
local ImInHeistNumber = {}
local HeistNumberIsPlayer = {}
local GunShopMarkers = {}
local MoneyBag = {}

function OutPutForHeistParty( Message )
	for i=1, 4 do
		if HeistNumberIsPlayer[i] then
			outputChatBox(Message, HeistNumberIsPlayer[i], 0, 255, 0,true)
		end
	end
end

--[[ Heist Roles
	1 Gunner
	2 Driver
	3 Audience Guard
]]

local NextHeistRoles = {
	{ 1 },
	{ 2 },
	{ 3 },
	{ 1 },
}

local DefaultHeistRoles = {
	{ 1 },
	{ 1 },
	{ 3 },
	{ 2 },
}

function UpdateHeistSfBoard()
	local Player1Name = "No-One"
	local Player1Role = 1
	local Player2Name = "No-One"
	local Player2Role = 1
	local Player3Name = "No-One"
	local Player3Role = 3
	local Player4Name = "No-One"
	local Player4Role = 2
	if HeistNumberIsPlayer[1] then
		Player1Name = ""..getPlayerName(HeistNumberIsPlayer[1])..""
		Player1Role = MyHeistRoleIs[HeistNumberIsPlayer[1]]
	end
	if HeistNumberIsPlayer[2] then
		Player2Name = ""..getPlayerName(HeistNumberIsPlayer[2])..""
		Player2Role = MyHeistRoleIs[HeistNumberIsPlayer[2]]
	end
	if HeistNumberIsPlayer[3] then
		Player3Name = ""..getPlayerName(HeistNumberIsPlayer[3])..""
		Player3Role = MyHeistRoleIs[HeistNumberIsPlayer[3]]
	end
	if HeistNumberIsPlayer[4] then
		Player4Name = ""..getPlayerName(HeistNumberIsPlayer[4])..""
		Player4Role = MyHeistRoleIs[HeistNumberIsPlayer[4]]
	end
	triggerClientEvent( "UpdateHeistBoard", resourceRoot, Player1Name, Player1Role, Player2Name, Player2Role, Player3Name, Player3Role, Player4Name, Player4Role )
end

addEvent("CreateHeistSf",true)
addEventHandler("CreateHeistSf", root,
function ( root )
	if IsSfHeistActive then
		exports["notf"]:addNotification(root, "Dar Hale Hazer 1 Heist Digar Active Ast!", 'warning')
		return
	end
	IsSfHeistActive = true
	MyHeistRoleIs[root] = 1
	ImInHeistNumber[root] = 1 --Heist Leader
	HeistNumberIsPlayer[1] = root
	triggerClientEvent( "StartHeistBoard", root, root )
	UpdateHeistSfBoard()
end)

addEvent("JoinHeistSf",true)
addEventHandler("JoinHeistSf", root,
function ( root )
	if not IsSfHeistActive then
		exports["notf"]:addNotification(root, "Dar Hale Hazer Heist Active Vojod Nadarad, Ba Create Yek Heist Besazid!", 'warning')
		return
	end
	for i=1, 4 do
		if not HeistNumberIsPlayer[i] then
			ImInHeistNumber[root] = i
			HeistNumberIsPlayer[i] = root
			MyHeistRoleIs[root] = DefaultHeistRoles[i][1]
			triggerClientEvent( "StartHeistBoard", root, root )
			UpdateHeistSfBoard()
			return
		end
	end
	exports["notf"]:addNotification(root, "In Heist Dar Hale Hazer Full Ast!", 'error')
end)

addEvent("ChangeRoleSfHeist",true)
addEventHandler("ChangeRoleSfHeist", root,
function ( root , HeistNumber )
	if ImInHeistNumber[root] ~= 1 then
		exports["notf"]:addNotification(root, "Faghat Leader Mitone Role Haro Avaz Kone!", 'error')
		return
	end
	if not HeistNumberIsPlayer[HeistNumber] then
		exports["notf"]:addNotification(root, "Playeri Dar In Slot Vojod Nadarad!", 'error')
		return
	end
	local NowHeistRole = NextHeistRoles[MyHeistRoleIs[HeistNumberIsPlayer[HeistNumber]]+1][1]
	MyHeistRoleIs[HeistNumberIsPlayer[HeistNumber]] = NowHeistRole
	triggerClientEvent( "UpdateHeistRole", resourceRoot, root, HeistNumber, NowHeistRole )
end)

addEvent("ILeftSfHeist",true)
addEventHandler("ILeftSfHeist", root,
function ( root )
	if ImInHeistNumber[root] then
		if ImInHeistNumber[root] == 1 then
			for i=1, 4 do
				if HeistNumberIsPlayer[i] then
					MyHeistRoleIs[HeistNumberIsPlayer[i]] = nil
					ImInHeistNumber[HeistNumberIsPlayer[i]] = nil
					HeistNumberIsPlayer[i] = nil
				end
			end
			IsSfHeistActive = false
			triggerClientEvent( "StopSfHeistBoard", resourceRoot, getPlayerName(root) )
		else
			MyHeistRoleIs[root] = nil
			HeistNumberIsPlayer[ImInHeistNumber[root]] = nil
			ImInHeistNumber[root] = nil
			exports["notf"]:addNotification(root, "Shoma Az Heist Left Dadid!", 'info')
			UpdateHeistSfBoard()
		end
	end
end)

addEventHandler("onPlayerQuit", getRootElement(),
function ()  
	if not IsHeistStarted then
		if ImInHeistNumber[source] then
			if ImInHeistNumber[source] == 1 then
				for i=1, 4 do
					if HeistNumberIsPlayer[i] then
						MyHeistRoleIs[HeistNumberIsPlayer[i]] = nil
						ImInHeistNumber[HeistNumberIsPlayer[i]] = nil
						HeistNumberIsPlayer[i] = nil
					end
				end
				IsSfHeistActive = false
				triggerClientEvent( "StopSfHeistBoard", resourceRoot, getPlayerName(source) )
			else
				MyHeistRoleIs[source] = nil
				HeistNumberIsPlayer[ImInHeistNumber[source]] = nil
				ImInHeistNumber[source] = nil
				UpdateHeistSfBoard()
			end
		end
	end
end)

local HeistSpawns = {
	--{ X, Y, Z, Rotz },
	{ -2720.3095703125 ,75.6162109375 ,4.3359375, 355 },
	{ -2722.4365234375 ,76.419921875 ,4.3359375, 355 },
	{ -2724.154296875 ,76.3818359375 ,4.3359375, 355 },
	{ -2726.0439453125 ,76.3876953125 ,4.3359375, 355 },
}

function SpawnPlayersForHeist( thePlayer , i )
	setTimer( function()
		-- FIX (bugfix pass 4): the element can be gone by the time this timer
		--   fires (player quit / object destroyed). Without this guard MTA
		--   raises "Bad argument" and the rest of the callback never runs.
		if not isElement(thePlayer) then return end
		triggerClientEvent( "ShowHeistText", thePlayer, thePlayer, "San Fierro Bank Heist Started" )
		spawnPlayer(thePlayer, HeistSpawns[i][1], HeistSpawns[i][2], HeistSpawns[i][3])
		setElementInterior ( thePlayer, 0 )
		setElementDimension ( thePlayer, 0 )
		setElementRotation( thePlayer, 0, 0, 355, "default", true)
		local RHS = math.random( 1 , 4 )
		if RHS == 1 then
			setElementModel(thePlayer, 265)
		elseif RHS == 2 then
			setElementModel(thePlayer, 266)
		elseif RHS == 3 then
			setElementModel(thePlayer, 244)
		elseif RHS == 4 then
			setElementModel(thePlayer, 267)
		end
		giveWeapon ( thePlayer, 24, 40 )
		giveWeapon ( thePlayer, 31, 240, true )
		setPedArmor ( thePlayer, 100 )
		fadeCamera(thePlayer, true, 2,0,0,0)
	end, 3000, 1)
end

addEvent("StartSfHeist",true)
addEventHandler("StartSfHeist", root,
function ( root )
	if ImInHeistNumber[root] ~= 1 then
		exports["notf"]:addNotification(root, "Faghat Leader Mitone Heist Ro Start Kone!", 'error')
		return
	end
	local Gunner = 0
	local AudienceGuard = 0
	local Driver = 0
	for i=1, 4 do
		--if not HeistNumberIsPlayer[i] then
		--	exports["notf"]:addNotification(root, "Baraye Start Heist Bayad 4 Nafar Dar Heist Bashan!", 'error')
		--	return
		--else
			local MyRole = MyHeistRoleIs[HeistNumberIsPlayer[i]]
			if MyRole == 1 then
				Gunner = Gunner + 1
			elseif MyRole == 2 then
				Driver = Driver + 1
			else
				AudienceGuard = AudienceGuard + 1
			end
		--end
	end
	--if Gunner == 2 
	--and AudienceGuard == 1
	--and Driver == 1 then
		IsHeistStarted = true
		triggerClientEvent( "StopSfHeistBoard", resourceRoot )
		HeistNowMarker = createMarker(-1524.76953125 ,920.2568359375 ,3.0390625,"checkpoint",3,255, 255, 0,200)
		setElementVisibleTo(HeistNowMarker,getRootElement(),false)
		HeistNowMarkerBlip = createBlipAttachedTo(HeistNowMarker, 56, 2, 255, 0, 0, 255,  0 , 65535)
		setElementVisibleTo(HeistNowMarkerBlip,getRootElement(),false)
		for i=1, 4 do
			if HeistNumberIsPlayer[i] then
				setElementVisibleTo(HeistNowMarker,HeistNumberIsPlayer[i],true)
				setElementVisibleTo(HeistNowMarkerBlip,HeistNumberIsPlayer[i],true)
				fadeCamera(HeistNumberIsPlayer[i], false, 2,0,0,0)
				SpawnPlayersForHeist( HeistNumberIsPlayer[i] , i )
			end
		end
		HeistVan = createVehicle( 482, -2728.65234375 ,84.10546875 ,4.0383830070496 , 0 , 0 , 270 )
		setVehicleColor( HeistVan, 0, 0, 0 )
		MoneyMarker1 = createMarker( 438.37109375 ,241.7236328125 ,973.84829101562, "cylinder", 1.0,0,255,0,120)
		setElementInterior( MoneyMarker1 , 3 )
		MoneyMarker2 = createMarker( 443.228515625 ,245.6767578125 ,973.84829101562, "cylinder", 1.0,0,255,0,120)
		setElementInterior( MoneyMarker2 , 3 )
		CreateSfBankGuards()
	--else
	--	exports["notf"]:addNotification(root, "Baraye Start Heist Be: 2 Gunner , 1 Driver , 1 AudienceGuard Niaz Darid!", 'error')
	--end
end)

addEventHandler ( "onVehicleStartExit", getRootElement(),
function ( thePlayer, seat, jacked ) 
	if source == HeistVan then
		if HeistState == 1 or HeistState == 5 then
			cancelEvent()
			exports["notf"]:addNotification(thePlayer, "Alan Nemitoni Az Van Piade Beshi!", 'error')
		end
	end
end)

addEventHandler ( "onVehicleStartEnter", getRootElement(),
function ( player, seat, jacked )
	if HeistVan and source == HeistVan then
		if ImInHeistNumber[player] then
			--if seat == 0 and MyHeistRoleIs[player] ~= 2 then
			--	outputChatBox ( "#ff0000Error: Faghat Drivere Team Mitone Ranande Van Heist Beshe!", player, 230,0,0 ,true) 
			--	cancelEvent()
			--end
		else
			outputChatBox ( "#ff0000Error: Faghat Azaye Heist Mitonan Savare In Van Beshan!", player, 230,0,0 ,true) 
			cancelEvent()
		end
	end
end)

local HeistTahvilPoints = {
	--{ X, Y, Z, Rotz },
	{ -1945.8544921875 ,-1085.68359375 ,28.7734375 },
	{ -2107.666015625 ,-2401.587890625 ,29.387399673462 },
	{ -1911.001953125 ,-1672.34765625 ,21.015625 },
	{ -2431.7392578125 ,2292.876953125 ,2.984375 },
	{ -156.65234375 ,1130.7294921875 ,17.7421875 },
	{ 209.7138671875 ,-7.5146484375 ,0.5739617347717 },
}

addEventHandler ( "onVehicleEnter", getRootElement(),
function ( player, seat, jacked )
	if HeistVan and source == HeistVan then
		--for i=1, 4 do
		--	if not isPedInVehicle( HeistNumberIsPlayer[i] ) or getPedOccupiedVehicle ( HeistNumberIsPlayer[i] ) ~= HeistVan then
		--		return
		--	end
		--end
		if HeistState == 0 then
			OutPutForHeistParty( "#00ff00[Heist]: #ffffffHala Ke Hame Savar Shodan Be Samte Bank Harekat Konid!" )
			HeistState = 1
		elseif HeistState == 4 then
			HeistState = 5
			setElementFrozen( HeistVan , false )
			OutPutForHeistParty( "#00ff00[Heist]: #ffffffKhob Hala Be Samte Mantaghe Tahvil Pool Berid!" )
			local RTP = math.random( 1 , 6 )
			HeistNowMarker = createMarker(HeistTahvilPoints[RTP][1] , HeistTahvilPoints[RTP][2] , HeistTahvilPoints[RTP][3] ,"checkpoint",3,255, 255, 0,200)
			setElementVisibleTo(HeistNowMarker,getRootElement(),false)
			HeistNowMarkerBlip = createBlipAttachedTo(HeistNowMarker, 56, 2, 255, 0, 0, 255,  0 , 65535)
			setElementVisibleTo(HeistNowMarkerBlip,getRootElement(),false)
			for i=1, 4 do
				if HeistNumberIsPlayer[i] then
					setElementVisibleTo(HeistNowMarker,HeistNumberIsPlayer[i],true)
					setElementVisibleTo(HeistNowMarkerBlip,HeistNumberIsPlayer[i],true)
				end
			end
		end
	end
end)


--Breakable Bank Doors

local HsFD = {
	--{ Model , X1 , Y1 , Z1 , RotX1 , RotY1 , RotZ1, X2 , Y2 , Z2 , RotX2 , RotY2 , RotZ2 , Type , MarkerX , MarkerY , MarkerZ },
	{ 3089, 436.390625, 273.900390625, 987.59997558594 , 0 , 0 , 0, 436.39999389648 , 275.79998779297 , 986.40002441406 , 90 , 0 , 0 , 1 , 437.099609375 ,274.033203125 ,987.33282470703 },
	{ 3089, 439.5, 272.2998046875, 975 , 0 , 0 , 0 , 439.5 , 271 , 973.77001953125 , 90 , 0 , 0 , 1 , 440.2509765625 ,272.1142578125 ,974.8603515625 },
	{ 2634, 440.75, 251.900390625, 975.41998291016 , 0 , 0 , 0, 440.70001220703 , 250 , 973.90002441406 , 90 , 0 , 0 , 2 , 440.5595703125 ,252.0029296875 ,974.93981933594 },
}

local ImInDoorId = {}
local HeistSfDoors = {}
local HeistSfDoorsID = {}
local IsHeistDoorOpened = {}
local HeistSfDoorsMarkers = {}
local HeistSfMarkersDoors = {}

function HitTheDoor( thePlayer )
	if ImInDoorId[thePlayer] then
		if MyHeistRoleIs[thePlayer] ~= 1 then
			exports["notf"]:addNotification(hitElement, "Baraye Baz Kardan In Dar Bayad Role Gunner Bashid!" , 'error')
			return
		end
		local DoorId = ImInDoorId[thePlayer]
		if IsHeistDoorOpened[DoorId] then
			exports["notf"]:addNotification(thePlayer, "In Dar Ghablan Baz Shode!" , 'error')
			return
		end
		if HsFD[DoorId][14] == 1 then
			if HeistState == 2 then
				HeistState = 3
				OutPutForHeistParty( "#ffff00[Info]: #ffffffGunner Ha Dargiri Ro Shoro Kardan, Ta On Moghe Nabayad Azhir Be Seda Dar Biad!" )
				triggerClientEvent( "StartAlarmeSf", resourceRoot )
			end
			setPedAnimation( thePlayer, "police", "door_kick", -1, false, false )
			setTimer( function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
				setPedAnimation ( thePlayer )
				moveObject(HeistSfDoors[DoorId], 100, HsFD[DoorId][8], HsFD[DoorId][9], HsFD[DoorId][10], HsFD[DoorId][11], HsFD[DoorId][12], HsFD[DoorId][13])
			end, 700, 1)
		else
			setPedAnimation( thePlayer, "bomber", "bom_plant", -1, false, false )
			setTimer( function()
				-- FIX (bugfix pass 4): the element can be gone by the time this timer
				--   fires (player quit / object destroyed). Without this guard MTA
				--   raises "Bad argument" and the rest of the callback never runs.
				if not isElement(thePlayer) then return end
				setPedAnimation ( thePlayer )
				setTimer( function()
					moveObject(HeistSfDoors[DoorId], 2000, HsFD[DoorId][8], HsFD[DoorId][9], HsFD[DoorId][10], HsFD[DoorId][11], HsFD[DoorId][12], HsFD[DoorId][13])
					createExplosion ( HsFD[DoorId][15], HsFD[DoorId][16], HsFD[DoorId][17], 0 )
				end, 5000, 1)
			end, 2000, 1)
		end
		IsHeistDoorOpened[DoorId] = true
	end
end

addEventHandler("onMarkerHit",resourceRoot,
function (hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if HeistSfMarkersDoors[source] then
			ImInDoorId[hitElement] = HeistSfDoorsID[HeistSfMarkersDoors[source]]
			bindKey( hitElement, "Z", "down", HitTheDoor )
			exports["notf"]:addNotification(hitElement, "Baraye Baz Kardane In Dar Dokme ( Z ) Ra Bezanid!" , 'info')
		end
	end
end)

addEventHandler("onMarkerLeave",resourceRoot,
function (leaveElement,matchingDimension)
	if (leaveElement and getElementType(leaveElement) == "player" and not isPedInVehicle(leaveElement)) then
		if HeistSfMarkersDoors[source] then
			ImInDoorId[leaveElement] = nil
			unbindKey( leaveElement, "Z", "down", HitTheDoor )
		end
	end
end)

for i=1 , #HsFD do
	HeistSfDoors[i] = createObject ( HsFD[i][1], HsFD[i][2], HsFD[i][3], HsFD[i][4] )
	HeistSfDoorsID[HeistSfDoors[i]] = i
	setElementRotation(HeistSfDoors[i], HsFD[i][5], HsFD[i][6], HsFD[i][7])
	setElementInterior ( HeistSfDoors[i], 3	)
	HeistSfDoorsMarkers[HeistSfDoors[i]] = createMarker( HsFD[i][15], HsFD[i][16], HsFD[i][17], "cylinder", 2.0,0,246,255,0)
	HeistSfMarkersDoors[HeistSfDoorsMarkers[HeistSfDoors[i]]] = HeistSfDoors[i]
	setElementInterior ( HeistSfDoorsMarkers[HeistSfDoors[i]], 3 )
end

-- Karmandan 

local BankKarmand = {}
local IsBankKarmand = {}
local KarmandSeconds = {}

local KarmandTable = {
	{ 57, 430.2822265625 ,258.005859375 ,987.33935546875, 270, "playidles", "time"},
	{ 17, 426.8662109375 ,253.6953125 ,987.32623291016, 270, "playidles", "shift"},
	{ 76, 426.8662109375 ,245.0947265625 ,987.32623291016, 270, "playidles", "shldr"},
	{ 187, 426.880859375 ,267.03125 ,987.326171875, 270, "cop_ambient", "coplook_shake"},
}

local RandomMessageTable = {
	{ "Ay Ayohanas Komak In Daran Banko Khali Mikonan!" },
	{ "Khejalat Nemikeshid Darid Poole BeytolMalo Midozdid?!" },
	{ "Fekr Kardi Inja Bi Sahebe?! Police Haye Inja Haletono Ja Miaran!" },
	{ "Dozdi Mikonid?! Jaton Balaye Tanabe Dare!" },
	{ "Az Khoda Nemitarsi Az National Guard Betars!" },
	{ "Rafti Zendan Salame Mano Be Hamed Ghame Bereson!" },
	{ "Mardom In Poolaro Ba Zahmat Be Dast Ovordan Fek Kardi Mitarsam?!" },
	{ "Mashti Moli Jat To Enferadie Zendan Markazie!" },
	{ "Man Joloye In Dozdaye Bi Vojdan Sokot Nemikonam!" },
	{ "Elahi Ba In Polayi Ke Midozdi Be Zamine Garm Bokhorid!" },
}

for i=1 , #KarmandTable do
    BankKarmand[i] = createPed( KarmandTable[i][1], KarmandTable[i][2], KarmandTable[i][3], KarmandTable[i][4])
	IsBankKarmand[BankKarmand[i]] = true
	setElementRotation ( BankKarmand[i], 0, 0, 270 )
	setElementInterior ( BankKarmand[i], 3 )
	setElementFrozen(BankKarmand[i], true)
end

local IsHeistFucked = false

addEventHandler("OnGlobalTimer", root, 
function()
	if IsHeistStarted then
		if not IsHeistFucked then
			if HeistState == 3 then
				for i=1 , #KarmandTable do
					if BankKarmand[i] then
						if KarmandSeconds[BankKarmand[i]] > 0 then
							setPedAnimation( BankKarmand[i], "ped", "handsup", 0, false, false, false, true )
							KarmandSeconds[BankKarmand[i]] = KarmandSeconds[BankKarmand[i]] - 1
						else
							if not IsHeistFucked then
								IsHeistFucked = true
								setPedAnimation( BankKarmand[i], "on_lookers", "shout_in", 0, false, false, false, true )
								local RandomMessage = math.random(1,10)
								exports["[Atis]Global"]:outputMessage(BankKarmand[i], ""..RandomMessageTable[RandomMessage][1].."")
								for i=1, 4 do
									if HeistNumberIsPlayer[i] then
										if getPlayerWantedLevel( HeistNumberIsPlayer[i] ) ~= 6 then
											setPlayerWantedLevel(HeistNumberIsPlayer[i],6)
											exports["[Atis]Factions"]:DepartmentMessage("Player "..getPlayerName ( HeistNumberIsPlayer[i] ).." +6 Wanted Daryaft Kard! Dalil: Rob")
										end
									end
								end
								OutPutForHeistParty( "#ffff00[Heist]: #ffffffOh Oh Heist Lo Rafte Sari Tar Karo Tamom Konid!" )
							end
						end
					end
				end
			else
				for i=1 , #KarmandTable do
					if BankKarmand[i] then
						setPedAnimation( BankKarmand[i], KarmandTable[i][6], KarmandTable[i][7], 0, false, false, false, true )
						KarmandSeconds[BankKarmand[i]] = 20
					end
				end
			end
		else
			for i=1 , #KarmandTable do
				if BankKarmand[i] then
					setPedAnimation( BankKarmand[i], "on_lookers", "shout_in", 0, false, false, false, true )
				end
			end
		end
	else
		for i=1 , #KarmandTable do
			if BankKarmand[i] then
				setPedAnimation( BankKarmand[i], KarmandTable[i][6], KarmandTable[i][7], 0, false, false, false, true )
			end
		end
	end
end)

local RandomTars = {
	{ "Bashe Bashe Bebakhshid!" },
	{ "Mano Nazan Kari Nadaram!" },
	{ "Mano Nazan Man Zano Bache Daram!" },
	{ "Torokhoda Mano Nazan Man Zano Bache Daram!" },
	{ "Torokhoda Mano Nazan Man Az Marg Mitarsam!" },
}

addEventHandler("OnGlobalTimer", root, 
function()
	if IsHeistStarted then
		if HeistState == 3 then
			for i, thePlayer in ipairs ( getElementsByType("player") ) do
				if getElementData(thePlayer, "loggedIn") == true then
					if getPedWeapon(thePlayer) ~= 0 then
						if ImInHeistNumber[thePlayer] then
							local target = getPedTarget ( thePlayer )
							if ( target ) then
								if getElementType ( target ) == "ped" and IsBankKarmand[target] then
									KarmandSeconds[target] = 20
									local RandomMessage = math.random(1,5)
									exports["[Atis]Global"]:outputMessage(target, ""..RandomTars[RandomMessage][1].."")
								end
							end
						end
					end
				end
			end
		end
	end
end)



-- Attacking Guards Scripting

local AttackerGuardTable = {
	--{ PedID, X, Y, Z, Rotz, WeaponID, Range, Int , Dim },
	{ 280, 440.99609375 ,281.58984375 ,985.13983154297, 140, 24, 8, 3 , 0 },
	{ 282, 440.46875 ,281.4052734375 ,980.93981933594, 134, 24, 8, 3 , 0 },
	{ 285, 441.125 ,274.4306640625 ,974.74053955078, 0, 29, 8, 3 , 0 },
	{ 163, 445.4482421875 ,255.7099609375 ,974.8603515625, 25, 31, 20, 3 , 0 },
	{ 164, 437.419921875 ,261.025390625 ,974.8603515625, 342, 31, 20, 3 , 0 },
	{ 163, 446.1005859375 ,266.45703125 ,974.8603515625, 47, 31, 20, 3 , 0 },
	{ 164, 438.4365234375 ,256.15625 ,974.8603515625, 325, 31, 20, 3 , 0 },
	{ 163, 438.732421875 ,238.400390625 ,974.74829101562, 347.19250488281, 29, 10, 3 , 0 },
	{ 164, 442.7373046875 ,244.2314453125 ,974.74829101562, 12.977783203125, 29, 10, 3 , 0 },
	{ 163, 438.44921875 ,248.44140625 ,974.74829101562, 307.06430053711, 29, 10, 3 , 0 },
}

local AttackerGuard = {}
local AttackerGuardMarker = {}
local MarkerBelongsToGuard = {}
local IsGuardMarker = {}

function CreateSfBankGuards()
	for i=1 , #AttackerGuardTable do
		AttackerGuard[i] = createPed( AttackerGuardTable[i][1], AttackerGuardTable[i][2] ,AttackerGuardTable[i][3] ,AttackerGuardTable[i][4])
		setElementData( AttackerGuard[i] , "HeistNpc" , true )
		setElementRotation ( AttackerGuard[i], 0, 0, AttackerGuardTable[i][5] )
		setElementInterior ( AttackerGuard[i], AttackerGuardTable[i][8] )
		setElementDimension ( AttackerGuard[i], AttackerGuardTable[i][9] )
		setTimer(giveWeapon, 1000, 1, AttackerGuard[i], AttackerGuardTable[i][6], 99999, true)
		if AttackerGuardTable[i][7] > 10 then
			AttackerGuardMarker[i] = createMarker(  AttackerGuardTable[i][2] ,AttackerGuardTable[i][3] ,AttackerGuardTable[i][4]-11, "cylinder", AttackerGuardTable[i][7],200,0,0,0)
		else
			AttackerGuardMarker[i] = createMarker(  AttackerGuardTable[i][2] ,AttackerGuardTable[i][3] ,AttackerGuardTable[i][4], "cylinder", AttackerGuardTable[i][7],200,0,0,0)
		end
		--setElementFrozen(AttackerGuard[i], true)
		IsGuardMarker[AttackerGuardMarker[i]] = true
		setElementInterior ( AttackerGuardMarker[i], AttackerGuardTable[i][8] )
		setElementDimension ( AttackerGuardMarker[i], AttackerGuardTable[i][9] )
		MarkerBelongsToGuard[AttackerGuardMarker[i]] = AttackerGuard[i]
	end
end

function DestroySfBankGuards()
	for i=1 , #AttackerGuardTable do
		if AttackerGuard[i] then
			destroyElement(AttackerGuard[i])
			AttackerGuard[i] = nil
			MarkerBelongsToGuard[AttackerGuardMarker[i]] = nil
			IsGuardMarker[AttackerGuardMarker[i]] = nil
			destroyElement(AttackerGuardMarker[i])
			AttackerGuardMarker[i] = nil
		end
	end
end

addEventHandler( "onMarkerHit", resourceRoot,
function ( hitElement, matchingDimension )
	if (hitElement and getElementType(hitElement) == "player") then
		if IsGuardMarker[source] then
			if ImInHeistNumber[hitElement] then
				triggerClientEvent("SetGuardAttacking", resourceRoot, MarkerBelongsToGuard[source], hitElement)
			end
		end
	end
end)

function EndSfHeist()
	DestroySfBankGuards()
	triggerClientEvent( "StopAlarmeSf", resourceRoot )
	for i=1, 4 do
		if HeistNumberIsPlayer[i] then
			if tonumber(getElementData(accSys:getPlayerAcc(HeistNumberIsPlayer[i]), "pMember")) == 0 then
				setElementModel(HeistNumberIsPlayer[i], tonumber(getElementData(accSys:getPlayerAcc(HeistNumberIsPlayer[i]), "cSkin")))
			else
				setElementModel(HeistNumberIsPlayer[i], tonumber(getElementData(accSys:getPlayerAcc(HeistNumberIsPlayer[i]), "fSkin")))
			end
			if MoneyBag[HeistNumberIsPlayer[i]] then
				destroyElement(MoneyBag[HeistNumberIsPlayer[i]])
				MoneyBag[HeistNumberIsPlayer[i]] = nil
			end
			setPedArmor(HeistNumberIsPlayer[i],0)
			MyHeistRoleIs[HeistNumberIsPlayer[i]] = nil
			ImInHeistNumber[HeistNumberIsPlayer[i]] = nil
			HeistNumberIsPlayer[i] = nil
		end
	end
	for i=1 , #HsFD do
		setElementPosition( HeistSfDoors[i], HsFD[i][2], HsFD[i][3], HsFD[i][4] )
		setElementRotation(HeistSfDoors[i], HsFD[i][5], HsFD[i][6], HsFD[i][7])
		IsHeistDoorOpened[i] = nil
	end
	MoneyMarker1 = nil
	MoneyMarker2 = nil
	HeistState = 0
	destroyElement(HeistVan)
	HeistVan = nil
	if HeistNowMarker then
		destroyElement(HeistNowMarker)
		destroyElement(HeistNowMarkerBlip)
	end
	HeistNowMarker = nil
	HeistNowMarkerBlip = nil
	HeistNowMarker = nil
	HeistNowMarkerBlip = nil
	IsSfHeistActive = false
	IsHeistStarted = false	
	IsHeistFucked = false
end

addEventHandler("onMarkerHit",resourceRoot,
function (hitElement,matchingDimension)
	if source == HeistNowMarker then
		if (hitElement and getElementType(hitElement) == "vehicle" and hitElement == HeistVan) then
			if HeistState == 1 then
				setElementFrozen(hitElement,true)
				HeistState = 2
				OutPutForHeistParty( "#00ff00[Heist]: #ffffffShoma Be Bank Residid, Yek Bare Digar Vazife Haro Tozih Midam:" )
				OutPutForHeistParty( "#ffff00Gunner: #ffffffVazife In 2 Nafar Baz Kardan Dar , Koshtan Guard Ha , Va Bardashte Poole!" )
				OutPutForHeistParty( "#ffff00Driver: #ffffffVazife Driver Amade Bodan Baraye Farari Dadan Azaye Goroh Baad Az Bardashte Poole!" )
				OutPutForHeistParty( "#ffff00AudienceGuard: #ffffffVazife In Fard Moraghebat Az Karmand Haye Banke Ta Ye Vaght Gozaresh Nadan!" )
				destroyElement(HeistNowMarker)
				destroyElement(HeistNowMarkerBlip)
				HeistNowMarker = nil
				HeistNowMarkerBlip = nil
			elseif HeistState == 5 then
				local RandomHeistMoney = math.random( 80000,100000 )
				OutPutForHeistParty( "#00ff00[Heist]: #ffffffHeist Ba Movafaghiat Anjam Shod! #00ff00+"..RandomHeistMoney.."$" )
				for i=1, 4 do
					if HeistNumberIsPlayer[i] then
						givePlayerMoney( HeistNumberIsPlayer[i], tonumber( RandomHeistMoney ) )
						setElementData(accSys:getPlayerAcc(HeistNumberIsPlayer[i]), "pRobPoint", tonumber(getElementData(accSys:getPlayerAcc(HeistNumberIsPlayer[i]), "pRobPoint"))-20)
						if getPlayerWantedLevel( HeistNumberIsPlayer[i] ) ~= 6 then
							setPlayerWantedLevel(HeistNumberIsPlayer[i],6)
							exports["[Atis]Factions"]:DepartmentMessage("Player "..getPlayerName ( HeistNumberIsPlayer[i] ).." +6 Wanted Daryaft Kard! Dalil: Rob")
						end
						triggerClientEvent( "ShowHeistText", HeistNumberIsPlayer[i], HeistNumberIsPlayer[i], "San Fierro Heist Completed \n+"..RandomHeistMoney.."$" )
					end
				end
				EndSfHeist()
			end
		end
	elseif source == MoneyMarker1 then
		if MyHeistRoleIs[hitElement] == 1 then
			destroyElement(MoneyMarker1)
			MoneyMarker1 = nil
			setPedAnimation( hitElement, "rob_bank", "cat_safe_rob", -1, false, false )
			setTimer( function()
				setPedAnimation ( hitElement )
				if not MoneyBag[hitElement] then
					MoneyBag[hitElement] = createObject(1550, 0,0,0)
					setElementInterior(MoneyBag[hitElement],getElementInterior(hitElement))
					exports.bone_attach:attachElementToBone(MoneyBag[hitElement],hitElement,3,0,-0.27,0.1,0,0,0)
				end
			end, 5000, 1)
			MoneyMarker1 = true
			if MoneyMarker2 == true then
				OutPutForHeistParty( "#00ff00[Heist]: #ffffffHale! Gunnera Poolaro Bardashtan Hala Savar Van Beshid!" )
				HeistState = 4
			end
		end
	elseif source == MoneyMarker2 then
		if MyHeistRoleIs[hitElement] == 1 then
			destroyElement(MoneyMarker2)
			MoneyMarker2 = nil
			setPedAnimation( hitElement, "rob_bank", "cat_safe_rob", -1, false, false )
			setTimer( function()
				setPedAnimation ( hitElement )
				if not MoneyBag[hitElement] then
					MoneyBag[hitElement] = createObject(1550, 0,0,0)
					setElementInterior(MoneyBag[hitElement],getElementInterior(hitElement))
					exports.bone_attach:attachElementToBone(MoneyBag[hitElement],hitElement,3,0,-0.27,0.1,0,0,0)
				end
			end, 5000, 1)
			MoneyMarker2 = true
			if MoneyMarker1 == true then
				OutPutForHeistParty( "#00ff00[Heist]: #ffffffHale! Gunnera Poolaro Bardashtan Hala Savar Van Beshid!" )
				HeistState = 4
			end
		end
	end
end)

local HeistSpawnsFaild = {
	--{ X, Y, Z, Rotz },
	{ -1495.30078125 ,917.8720703125 ,7.1875, 90 },
	{ -1495.3349609375 ,919.5146484375 ,7.1875, 90 },
	{ -1495.2431640625 ,921.4248046875 ,7.1875, 90 },
	{ -1495.1787109375 ,923.2861328125 ,7.1875, 90 },
}

function MoveHeistersToFaild()
	for i=1, 4 do
		if HeistNumberIsPlayer[i] then
			if not isPedDead ( HeistNumberIsPlayer[i] ) then
				if not isPedInVehicle( HeistNumberIsPlayer[i] ) then
					setElementDimension( HeistNumberIsPlayer[i] , 0 )
					setElementInterior( HeistNumberIsPlayer[i] , 0 )
					setElementPosition ( HeistNumberIsPlayer[i] , HeistSpawnsFaild[i][1],HeistSpawnsFaild[i][2],HeistSpawnsFaild[i][3] )
					setElementRotation ( HeistNumberIsPlayer[i] , 0, 0, HeistSpawnsFaild[i][4], "default", true )
				end
			end
		end
	end
end

addEventHandler ( "onPlayerQuit", root,
function ()
	if IsHeistStarted then
		if ImInHeistNumber[source] then
			MyHeistRoleIs[source] = nil
			HeistNumberIsPlayer[ImInHeistNumber[source]] = nil
			ImInHeistNumber[source] = nil
			OutPutForHeistParty( "#ff0000[Heist]: Player "..getPlayerName(source).." Az Server Left Dad Va Heist Faild Shod!" )
			for i=1, 4 do
				if HeistNumberIsPlayer[i] then
					triggerClientEvent( "ShowHeistText", HeistNumberIsPlayer[i], HeistNumberIsPlayer[i], "San Fierro Heist Faild" )
				end
			end
			if HeistState == 3 or HeistState == 4 then
				MoveHeistersToFaild()
			end
			EndSfHeist()
		end
	end
end)

addEventHandler("onVehicleExplode", getRootElement(),
function ()
	if source == HeistVan then
		OutPutForHeistParty( "#ff0000[Heist]: Vane Heist Terekid Va Heist Cancel Shod!" )
		for i=1, 4 do
			if HeistNumberIsPlayer[i] then
				triggerClientEvent( "ShowHeistText", HeistNumberIsPlayer[i], HeistNumberIsPlayer[i], "San Fierro Heist Faild" )
			end
		end
		if HeistState == 3 or HeistState == 4 then
			MoveHeistersToFaild()
		end
		EndSfHeist()
	end
end)

addEventHandler ( "onPlayerWasted", getRootElement(),
function ()
	if ImInHeistNumber[source] then
		MyHeistRoleIs[source] = nil
		HeistNumberIsPlayer[ImInHeistNumber[source]] = nil
		ImInHeistNumber[source] = nil
		OutPutForHeistParty( "#ff0000[Heist]: Player "..getPlayerName(source).." Koshte Shod Va Heist Faild Shod!" )
		for i=1, 4 do
			if HeistNumberIsPlayer[i] then
				triggerClientEvent( "ShowHeistText", HeistNumberIsPlayer[i], HeistNumberIsPlayer[i], "San Fierro Heist Faild" )
			end
		end
		if HeistState == 3 or HeistState == 4 then
			MoveHeistersToFaild()
		end
		EndSfHeist()
	end
end)