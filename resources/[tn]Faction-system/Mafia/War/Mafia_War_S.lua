--Pish Niaz Ha

local dbpTime = 500
local accSys = exports["Accounts-system"] -- Code By ExMohmD
local Gangs = {
	{ "#018c01"," Yakouza Family", 0, 100, 1 },--12
	{ "#9400ff","DarkSaints Family", 148, 0, 255},--13
	{ "#ff0010","Gang Family", 255, 0, 16 },--14
	{ "#42f5c8","Azertoh Family", 66, 245, 200 },--15
	{ "#fec664","FaMouS Fmily", 255,255,0 },--16
}

--Turf System

local IsTurf = {}
local IdTurf = {}
local TurfId = {}
local TurfWarID = {}
local TurfOwner = {}
local TurfWarBlips = {}
local TurfAttacker = {}
local TurfDefender = {}
local TurfRadarArea = {}
local TurfTableOwnerId = {}
local PlayerIsInTheTurf = {}
local IsTurfUnderAttack = {}
local TurfAttackerScore = {}
local TurfDefenderScore = {}

function UpDateTurf(Turf)
	if IsTurf[Turf] then
		Owner = TurfOwner[Turf]
		TOM = tonumber(Owner) - 11
		setRadarAreaColor ( TurfRadarArea[Turf], Gangs[TOM][3], Gangs[TOM][4], Gangs[TOM][5], 100 )
	end
end

function CreateTurf(Xmin, Ymin, Xmax, Ymax, Owner, Id)
	if(Xmin) and (Ymin) and (Xmax) and (Ymax) and (Owner) and (Id) then
		Turf = createColRectangle ( Xmin, Ymin, Xmax, Ymax )
		TurfRadarArea[Turf] = createRadarArea (Xmin, Ymin, Xmax, Ymax, 0, 0, 0, 255 )
		IsTurf[Turf] = true
		TurfId[Turf] = Id
		IdTurf[Id] = Turf
		TurfOwner[Turf] = Owner
		UpDateTurf(Turf)
	end	
end

addEventHandler ( "onColShapeHit", resourceRoot,
function ( thePlayer )
	if IsTurf[source] then
		if getElementType ( thePlayer ) == "player" then
			PlayerIsInTheTurf[thePlayer] = source
			if IsTurfUnderAttack[source] then
				if tonumber(TurfAttacker[source]) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
				or tonumber(TurfDefender[source]) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))	then
					local MF = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) - 11
					exports["notf"]:addNotification(thePlayer, "Shoma Be Turf Vared Shodid , Movafagh Bashid!" , 'info')
					TurfWarBlips[thePlayer] = createBlipAttachedTo(thePlayer, 0, 1, Gangs[MF][3], Gangs[MF][4], Gangs[MF][5], 255,  0 , 65535)
					setElementVisibleTo(TurfWarBlips[thePlayer],getRootElement(),false)
					for k, v in ipairs(getElementsByType("player")) do 
						if PlayerIsInTheTurf[v] and PlayerIsInTheTurf[v] == source then
							if tonumber(TurfAttacker[source]) == tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
							or tonumber(TurfDefender[source]) == tonumber(getElementData(accSys:getPlayerAcc(v), "pMember")) then
								setElementVisibleTo(TurfWarBlips[thePlayer],v,true)
								if PlayerIsInTheTurf[v] and PlayerIsInTheTurf[v] == source then
									setElementVisibleTo(TurfWarBlips[v],thePlayer,true)
								end
							end
						end
					end
				else
					exports["notf"]:addNotification(thePlayer, ""..Gangs[tonumber(TurfDefender[source])-11][2].." VS "..Gangs[tonumber(TurfAttacker[source])-11][2].."" , 'info')
				end
			end
		end
	end
end)

addEventHandler ( "onColShapeLeave", resourceRoot,
function ( thePlayer )
	if IsTurf[source] then
	   if getElementType ( thePlayer ) == "player" then
			if PlayerIsInTheTurf[thePlayer] then
				PlayerIsInTheTurf[thePlayer] = nil
				if TurfWarBlips[thePlayer] then
					destroyElement(TurfWarBlips[thePlayer])
					TurfWarBlips[thePlayer] = nil
					for k, v in ipairs(getElementsByType("player")) do 
						if PlayerIsInTheTurf[v] and PlayerIsInTheTurf[v] == source then
							if tonumber(TurfAttacker[source]) == tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
							or tonumber(TurfDefender[source]) == tonumber(getElementData(accSys:getPlayerAcc(v), "pMember")) then
								if PlayerIsInTheTurf[v] and PlayerIsInTheTurf[v] == source then
									setElementVisibleTo(TurfWarBlips[v],thePlayer,false)
								end
							end
						end
					end 
				end
			end
	   end
	end
end)

addCommandHandler("setturfowner",
function ( thePlayer, command, OwnerID )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return false
	end
	if PlayerIsInTheTurf[thePlayer] then
		if OwnerID then
			if tonumber(OwnerID) > 11 and tonumber(OwnerID) < 22 then
				local Turf = PlayerIsInTheTurf[thePlayer]
				local UpDateTurfQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..tonumber(OwnerID).."' WHERE `id` = '"..tonumber(TurfId[Turf]).."'")
				dbFree(UpDateTurfQuery)
				TurfOwner[Turf] = tonumber(OwnerID)
				UpDateTurf(Turf)
				outputChatBox("#00ff00Done: #ffffffShoma Owner In Turf Ra Be "..Gangs[tonumber(TurfOwner[Turf])-11][1]..""..Gangs[tonumber(TurfOwner[Turf])-11][2].." #ffffff Set Kardid!", thePlayer, 0, 255, 0,true)
			else
				outputChatBox("#ff0000Syntax: /setturfowner <12~21>", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000Syntax: /setturfowner <12~21>", thePlayer, 0, 255, 0,true)
		end
	else
		exports["notf"]:addNotification(thePlayer, "Baraye Inkar Bayad Dakhel Turf Bashi!" , 'error')
	end
end)

addCommandHandler("turfinfo",
function ( thePlayer, command )
	if PlayerIsInTheTurf[thePlayer] then
		local Turf = PlayerIsInTheTurf[thePlayer]
		outputChatBox("#ff0000[Turf] #ffffffTurf ID:#ff0000 "..TurfId[Turf].."#ffffff Turf Owner: "..Gangs[tonumber(TurfOwner[Turf])-11][1]..""..Gangs[tonumber(TurfOwner[Turf])-11][2].."", thePlayer, 212, 156, 49,true)
	else
		exports["notf"]:addNotification(thePlayer, "Baraye Inkar Bayad Dakhel Turf Bashi!" , 'error')
	end
end)

function StartTurfDataBase()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM turfs;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local Id = row['id']
			local Xmin, Ymin, Xmax, Ymax = row['zMinX'], row['zMinY'], row['zMaxX'], row['zMaxY']
			local Owner = row['zOwner']
			CreateTurf(Xmin,Ymin,Xmax,Ymax,Owner,Id)
		end
		dbFree(query)
	end
end

StartTurfDataBase()

--Baj System

local BajTable = {
	{ -88.847267150879 ,-1554.98046875 ,3.4184436798096 , 1},
	{ -38.1689453125 ,-1559.6435546875 ,2.1120500564575 , 1},
	{ -45.892578125 ,-1542.7646484375 ,2.4653301239014 , 1},

--Turf 2 [Fixed Turf]
	{ 670.8271484375 ,-1275.19140625 ,13.63324832916 , 2},
	{ 691.5732421875 ,-1275.990234375 ,13.56073570251 , 2},
	{ 705.615234375 ,-1306.583984375 ,13.577867507935 , 2},

--Turf 3 [Fixed Turf]
	{ 862.0419921875 ,-1633.8515625 ,14.929687 , 3},
	{ 906.5517578125 ,-1676.9521484375 ,13.546875 , 3},
	{ 855.57421875 ,-1630.5849609375 ,13.554687 , 3},

--Turf 4 [Fixed Turf]
	{ 2796.0048828125 ,-1619.2421875 ,10.921875 , 4},
	{ 2766 ,-1618.3818359375 ,10.92187 , 4},
	{ 2789.591796875 ,-1628.794921875 ,10.92715549469 , 4},

--Turf 5 [Fixed Turf]
	{ 2209.1298828125 ,-1142.728515625 ,25.804992675781 , 5},
	{ 2202.962890625 ,-1180.150390625 ,25.890625 , 5},
	{ 2201.3505859375 ,-1143.78515625 ,33.53125 , 3},

--Turf 6 [Turf FixeD]
	{ 1876.28125 ,657.908203125 ,10.26757621765, 6},
	{ 1956.3173828125 ,665.8232421875 ,10.278159141541, 6},
	{ 2119.9853515625 ,762.0400390625 ,10.2884931564331, 6},
--Turf 7 [Turf FixeD]
	{ 2333.6630859375 ,704.2119140625 ,10.56281566619, 7},
	{ 2412.771484375 ,750.931640625 ,10.276892662048, 7},
	{ 2328.375 ,746.8388671875 ,10.158335685, 7},

--Turf 8 [Tutf FixeD]
	{ 2380.83203125 ,1543.1953125 ,10.2771100997, 8},
	{ 2436.3310546875 ,1386.955078125 ,10.27834129333, 8},
	{ 2561.3466796875 ,1382.1923828125 ,10.2747249603, 8},

--Turf 9 [Turf FixeD]
	{ 1855.3232421875 ,1262.3837890625 ,10.830760955811, 9},
	{ 1918.3662109375 ,1310.5078125 ,8.814990997314, 9},
	{ 2120.6298828125 ,1486.775390625 ,10.27543258, 9},
	{ 2007.1015625 ,1545.4052734375 ,12.61257648468, 9},
--Turf 10 [Turf FixeD]
	{ 2350.2763671875 ,1881.28515625 ,10.130816459656, 10},
	{ 2334.51953125 ,2168.8701171875 ,10.29418945312, 10},
	{ 2366.328125 ,2090.001953125 ,10.27420616149, 10},
	{ 2366.328125 ,2090.001953125 ,10.27420616149, 10},
	{ 2560.8076171875 ,2125.0390625 ,10.27234840393, 10},

--Turf 11 [Turf FixeD]
	{ 1970.705078125 ,2121.94921875 ,10.27413749694, 11},
	{ 1967.025390625 ,2144.439453125 ,10.27580738067, 11},
	{ 1631.3935546875 ,2199.66796875 ,10.272400856018, 11},
	{ 1716.3115234375 ,1927.919921875 ,10.275226593, 11},

--Turf 12 [Turf FixeD]
	{ -2465.6240234375 ,1065.9267578125 ,55.7265625, 12},
	{ 1077.111328125 ,1961.8896484375 ,10.26894664764, 12},
	{ 1016.33984375 ,1679.9619140625 ,10.36915111541, 12},
	{ 1021.990234375 ,1559.935546875 ,5.597865104675, 12},

--Turf 13 [Turf FixeD]
	{ 1732.0576171875 ,2700.4375 ,10.2751369476, 13},
	{ 1661.625 ,2717.69921875 ,10.27700614929, 13},
	{ 1553.2099609375 ,2697.765625 ,10.27532482147, 13},
	{ 1854.244140625 ,2722.3486328125 ,10.2783651351, 13},

--Turf 14 [Turf FixeD]
	{ -288.1572265625 ,1184.6943359375 ,19.196512222, 14},
	{ -247.7275390625 ,1139.884765625 ,19.410821914673, 14},
	{ -182.25390625 ,1069.8935546875 ,19.19652366638, 14},

--Turf 15 [Turf Fixed]
	{ -1432.8837890625 ,2589.4287109375 ,55.19364929199, 15},
	{ -1395.013671875 ,2644.470703125 ,55.228553771973, 15},
	{ -1467.2490234375 ,2592.658203125 ,55.2912406921393, 15},
	{ -1514.6923828125 ,2609.54296875 ,55.291477203369, 15},

--Turf 16 [Fixed Turf]
	{ 220.84765625 ,-226.4287109375 ,1.77861881256, 16},
	{ 255.470703125 ,-157.912109375 ,1.5703220367432, 16},
	{ 308.158203125 ,-190.724609375 ,1.57812, 16},
	{ 144.931640625 ,-155.693359375 ,1.57812, 16},
	{ 273.1708984375 ,-195.6904296875 ,1.5704516172409, 16},

--Turf 17 [FixeD Turf]
	{ 1416.8154296875 ,261.064453125 ,19.544202804565, 17},
	{ 1311.0419921875 ,227.919921875 ,19.56282806396, 17},
	{ 1335.341796875 ,376.484375 ,19.56246376037, 17},
	{ 1411.5615234375 ,388.8232421875 ,19.534814834595, 17},
	{ 1411.5615234375 ,388.8232421875 ,19.534814834595, 17},
	{ 1227.4755859375 ,312.513671875 ,19.7578125, 17},

--Turf 18 [Turf FixeD]
	{ -2664.251953125 ,-10.1142578125 ,6.1328125, 18},
	{ -2507.25390625 ,50.794921875 ,25.623983383179, 18},
	{ -2664.0517578125 ,239.236328125 ,4.3359375, 18},
	{ -2715.5595703125 ,181.6083984375 ,4.328125, 18},
	{ -2694.9677734375 ,139.7041015625 ,4.3359375, 18},
	{ -2588.107421875 ,59.978515625 ,4.3531141281128, 18},

--Turf 19 [Turf FixeD]
	{ -2331.09765625 ,945.205078125 ,53.1726417541, 19},
	{ -2356.5166015625 ,1016.2568359375 ,50.35865402221, 19},
	{ -2501.0458984375 ,920.6123046875 ,64.608901977539, 19},
	{ -2539.751953125 ,972.1201171875 ,75.406608581543, 19},
	{ -2318.3125 ,987.1953125 ,50.149326324463, 19},

--Turf 20 [Turf FixeD]
	{ -1772.0439453125 ,888.8271484375 ,24.538553237915, 20},
	{ -1869.7919921875 ,906.9580078125 ,34.625705718994, 20},
	{ -1979.7724609375 ,957.251953125 ,44.865840911865, 20},
	{ -1701.013671875 ,959.044921875 ,24.890625, 20},
--Turf 21 [Turf FixeD]
	{ 2494.7373046875 ,2827.2412109375 ,10.274629592896, 21},
	{ 22753.6533203125 ,2840.2880859375 ,10.274141311646, 21},
	{ 2752.0068359375 ,2703.078125 ,10.27547168731, 21},

--Turf 22 [Turf FixeD]
	{ 1558.4521484375 ,672.23046875 ,10.2725448608, 22},
	{ 1439.0302734375 ,674.8759765625 ,10.369609832764, 22},
	{ 1555.8837890625 ,754.873046875 ,10.411588668823, 22},
--Turf 23 [Turf FixeD]
	{ 1652.7470703125 ,1081.572265625 ,10.2761812210, 23},
	{ 1707.3662109375 ,995.0078125 ,10.24661636352, 23},
	{ 1595.1025390625 ,954.369140625 ,10.186758995056, 23},

--Turf 24 [Turf FixeD]
	{-1378.66796875 ,-355.11328125 ,14.1484375, 24},
	{-1409.16796875 ,-432.09375 ,6, 24},
	{-1464.7880859375 ,-369.3408203125 ,14.885058403015, 24},

--Turf [Turf FixeD]
	{ -329.1865234375 ,2642.291015625 ,63.2129707336, 25},
	{ -185.64453125 ,2771.677734375 ,61.120300292969, 25},
	{ -145.48046875 ,2690.029296875 ,61.73673248291, 25},

}

local Baj = {}
local IsBaj = {}
local BajValue = {}
local BajInTurf = {}

function Bajsaz()
    for i=1,#BajTable do 
        Baj[i] = createPickup ( BajTable[i][1],BajTable[i][2],BajTable[i][3], 3, 1212 , 0)
		IsBaj[Baj[i]] = true
		BajInTurf[Baj[i]] = BajTable[i][4]
		BajValue[Baj[i]] = 0
    end
end

Bajsaz()

setTimer( function()
	for i=1,#BajTable do 
		if Baj[i] then
			if tonumber(BajValue[Baj[i]]) < 10000 then
				BajValue[Baj[i]] = tonumber(BajValue[Baj[i]]) + 5
			end
		end
    end
end, 60000, 0) 

addEventHandler( "onPickupHit", resourceRoot,
function ( thePlayer )
    if IsBaj[source] then
		if tonumber(BajValue[source]) > 0 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 10 then
				TurfOwnerID = TurfOwner[IdTurf[BajInTurf[source]]]
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == tonumber(TurfOwnerID) then
					MeghdarBaj = BajValue[source]
					if getElementData(thePlayer,"Baj") then
						setElementData(thePlayer,"Baj",tonumber(getElementData(thePlayer,"Baj"))+MeghdarBaj)
					else
						setElementData(thePlayer,"Baj",MeghdarBaj)
					end
					outputChatBox("#00ff00[Baj]: #ffffffShoma Az In Makan #00ff00"..MeghdarBaj.."$ #ffffffBaj Gereftid, Meghdar Baje Hamrahe Shoma #00ff00"..getElementData(thePlayer,"Baj").."$ #ffffffAst!", thePlayer, 255, 255, 255, true)
					BajValue[source] = 0
				else
					exports["notf"]:addNotification(thePlayer, "In Baj Dar Turfe Shoma Nist!" , 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Baraye Gereftan Baj Bayad Ozve Mafia Bashid!" , 'error')
			end
		end
	end
end)

--Drop The Baj
addEventHandler ( "onPlayerWasted", getRootElement(),
function ( ammo, attacker, weapon, bodypart )
	if source then
		if getElementData(source,"Baj") and tonumber(getElementData(source,"Baj")) > 0 then
			local x,y,z = getElementPosition(source)
			local int = getElementInterior(source)
			local dim = getElementDimension(source)
			local MeghdarBaj = tonumber(getElementData(source,"Baj"))
			setElementData(source,"Baj",nil)
			outputChatBox("#ff0000[Baj]: #ffffffShoma Koshte Shodid Va Mablaghe #ff0000"..MeghdarBaj.."$ #ffffffBaj Drop Kardid!", source, 255, 255, 255, true)
			setTimer( function()
				local DropedBaj = createPickup ( x,y,z, 3, 1212 , 0)
				setElementInterior(DropedBaj, int)
				setElementDimension(DropedBaj, dim)
				setElementData(DropedBaj,"Baj",MeghdarBaj)
				addEventHandler( "onPickupHit", DropedBaj,
				function ( thePlayer )
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 10 then
						if getElementData(thePlayer,"Baj") then
							setElementData(thePlayer,"Baj",tonumber(getElementData(thePlayer,"Baj"))+getElementData(source,"Baj"))
						else
							setElementData(thePlayer,"Baj",getElementData(source,"Baj"))
						end
						outputChatBox("#00ff00[Baj]: #ffffffShoma Az In Makan #00ff00"..MeghdarBaj.."$ #ffffffBaj Gereftid, Meghdar Baje Hamrahe Shoma #00ff00"..getElementData(thePlayer,"Baj").."$ #ffffffAst!", thePlayer, 255, 255, 255, true)
						destroyElement(source)
					end
				end)
			end, 7000, 1)
		end
	end
end)

--War System

local NextDayTable = {
	[2] = 3, [4] = 5, [7] = 1, [6] = 1,
}

local DayNames = {
	{ "Shanbe" },--1
	{ "1 Shanbe" },--2
	{ "2 Shanbe" },--3
	{ "3 Shanbe" },--4
	{ "4 Shanbe" },--5
	{ "5 Shanbe" },--6
	{ "Jome" },--7
}

local Day = 0

function GetDay()
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

addCommandHandler( "attack",
function ( thePlayer )
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") > 10 then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pRank") > 5 then
			if PlayerIsInTheTurf[thePlayer] then
				GetDay()
				if not NextDayTable[Day] then
					outputChatBox("#ff0000Error: Faghat Dar Roz Haye ( 1Shanbe, 3Shanbe , 5Shanbe , Jome ) Mishe Attack Dad!", thePlayer, 255, 255, 0,true)
					return
				end
				local Turf = PlayerIsInTheTurf[thePlayer]
				local TOwner = TurfOwner[Turf]
				local Saat17 = true
				if tonumber(TurfOwner[Turf]) ~= tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) then
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
					local result, numrows = dbPoll(query, dbpTime)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							local TurfID = row['wTurfID']
							if TurfID ~= 0 then
								local Defender = row['wDefender']
								local Attacker = row['wAttacker']
								if tonumber(Defender) == tonumber(TOwner) then
									outputChatBox("#ff0000Error: Ghablan Be In Mafia Baraye Roze War Attack Dade Shode!", thePlayer, 255, 255, 0,true)
									return
								elseif tonumber(Attacker) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) then
									outputChatBox("#ff0000Error: Ghablan Shoma Be Yek Mafia Attack Dadeid!", thePlayer, 255, 255, 0,true)
									return
								end
								if tonumber(TOwner) == tonumber(Attacker) or tonumber(TOwner) == tonumber(Defender) then
									Saat17 = nil
								elseif tonumber(TOwner) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) or tonumber(TOwner) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) then
									Saat17 = nil
								end
							end
						end
					end
					if Saat17 and Saat17 == true then
						local CreateWarQuery = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `war` SET `wTurfID` = ?, `wAttacker` = ?, `wDefender` = ?, `wTime` = ?, `wDate` = ?", tonumber(TurfId[Turf]),tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")),tonumber(TOwner),17,NextDayTable[Day] )
						dbFree(CreateWarQuery)
						outputChatBox("#00ff00Done: In Attack Baraye Saat 17 Roz "..DayNames[NextDayTable[Day]][1].." Sabt Shod!", thePlayer, 255, 255, 0,true)
					else
						local CreateWarQuery = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `war` SET `wTurfID` = ?, `wAttacker` = ?, `wDefender` = ?, `wTime` = ?, `wDate` = ?", tonumber(TurfId[Turf]),tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")),tonumber(TOwner),18,NextDayTable[Day] )
						dbFree(CreateWarQuery)
						outputChatBox("#00ff00Done: In Attack Baraye Saat 18 Roz "..DayNames[NextDayTable[Day]][1].." Sabt Shod!", thePlayer, 255, 255, 0,true)
					end
				else
					outputChatBox("#ff0000Error: Be Turf Khodeton Ke Nemitoni Attack Bedi!", thePlayer, 255, 255, 0,true)
				end
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad Dakhel Turf Bashi!", thePlayer, 255, 255, 0,true)
			end
		else
			outputChatBox("#ff0000Error: Faghat Leader Ya Co_Leader Mitonan Attack Bedan!", thePlayer, 255, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Mafia Bashid", thePlayer, 255, 255, 0,true)
	end
end)

	--[[ Inja War Shoro Mishe ]]--
	
	
local LastHour = 0
local IsWarTime = false

function StartWars()
	IsWarTime = true
	outputChatBox("#ff0000☠#fcba03-=[ #ff5959War Haye Saat "..LastHour.." Ham Aknon Shoro Shod #fcba03]=-#ff0000☠", getRootElement(), 255, 255, 0,true)
	GetDay()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local wTurfID = row['wTurfID']
			if tonumber( Turf ) ~= 0 then
				local wTime = row['wTime']
				if tonumber(wTime) == tonumber(LastHour) then
					local Date = row['wDate']
					if tonumber(Day) == tonumber(Date) then
						local Defender = row['wDefender']
						local Attacker = row['wAttacker']
						Turf = IdTurf[wTurfID]
						IsTurfUnderAttack[Turf] = true
						TurfAttacker[Turf] = Attacker
						TurfDefender[Turf] = Defender
						TurfAttackerScore[Turf] = 0
						TurfDefenderScore[Turf] = 0
						setRadarAreaColor ( TurfRadarArea[Turf], 156, 0, 0, 150 ) 
						setRadarAreaFlashing ( TurfRadarArea[Turf], true )
						outputChatBox(""..Gangs[tonumber(Defender)-11][1].."( "..Gangs[tonumber(Defender)-11][2].." )#ffffff ⚔ "..Gangs[tonumber(Attacker)-11][1].."( "..Gangs[tonumber(Attacker)-11][2].." )", getRootElement(), 255, 255, 0,true)
					end
				end
			end
		end
	end
end

function StopWars()
	GetDay()
	outputChatBox("#ff0000☠#fcba03-=[ #ff5959War Haye Saat "..LastHour.." Be Payan Resid #fcba03]=-#ff0000☠", getRootElement(), 255, 255, 0,true)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local wTurfID = row['wTurfID']
			if tonumber( Turf ) ~= 0 then
				local wTime = row['wTime']
				if tonumber(wTime) == tonumber(LastHour) then
					local Date = row['wDate']
					if tonumber(Day) == tonumber(Date) then
						local Defender = row['wDefender']
						local Attacker = row['wAttacker']
						local WarID = row['wID']
						Turf = IdTurf[wTurfID]
						IsTurfUnderAttack[Turf] = nil
						TurfAttacker[Turf] = nil
						TurfDefender[Turf] = nil
						setRadarAreaFlashing ( TurfRadarArea[Turf], false )
						outputChatBox(""..Gangs[tonumber(Defender)-11][1]..""..Gangs[tonumber(Defender)-11][2].."( "..TurfDefenderScore[Turf].." )#ffffff vs "..Gangs[tonumber(Attacker)-11][1]..""..Gangs[tonumber(Attacker)-11][2].."( "..TurfAttackerScore[Turf].." )", getRootElement(), 255, 255, 0,true)
						if tonumber(TurfDefenderScore[Turf]) <= tonumber(TurfAttackerScore[Turf]) then
							TurfOwner[Turf] = Attacker
							outputChatBox("Winner: "..Gangs[tonumber(Attacker)-11][1]..""..Gangs[tonumber(Attacker)-11][2].."#ffffff Ba Ekhtelafe "..tonumber(TurfAttackerScore[Turf]) - tonumber(TurfDefenderScore[Turf]).." Score!" , getRootElement(), 255, 255, 0,true)
							local UpDateTurfQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..tonumber(Attacker).."' WHERE `id` = '"..tonumber(wTurfID).."'")
							dbFree(UpDateTurfQuery)
						else
							TurfOwner[Turf] = Defender
							outputChatBox("Winner: "..Gangs[tonumber(Defender)-11][1]..""..Gangs[tonumber(Defender)-11][2].."#ffffff Ba Ekhtelafe "..tonumber(TurfDefenderScore[Turf]) - tonumber(TurfAttackerScore[Turf]).." Score!" , getRootElement(), 255, 255, 0,true)
							local UpDateTurfQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..tonumber(Defender).."' WHERE `id` = '"..tonumber(wTurfID).."'")
							dbFree(UpDateTurfQuery)
						end
						UpDateTurf(Turf)
						TurfAttackerScore[Turf] = nil
						TurfDefenderScore[Turf] = nil
						local DeleteWarQuery = dbQuery(exports.mysql:getMySQLC(), "DELETE FROM war WHERE wID = '"..WarID.."';")
						dbFree(DeleteWarQuery)
					end
				end
			end
		end
	end
	IsWarTime = false
end

addEventHandler("OnGlobalTimer", root, function ()
	if (getRealTime().hour ~= LastHour) then
		LastHour = getRealTime().hour
		if tonumber(LastHour) == 17 or tonumber(LastHour) == 18 then
			GetDay()
			if tonumber(Day) == 1 
			or tonumber(Day) == 3
			or tonumber(Day) == 5 then
				setTimer(function ()
					StartWars()		
					for k, v in ipairs(getElementsByType("player")) do 
						triggerClientEvent("WarTime",v,v)
					end 
					setTimer(function ()
						StopWars()
					end, 1800000, 1)
				end, 30000, 1)
			end
		end
	end
end)

addEventHandler ( "onPlayerWasted", getRootElement(),
function ( ammo, attacker, weapon, bodypart )
	if IsWarTime == true then
		if ( attacker ) then
			if PlayerIsInTheTurf[source] and PlayerIsInTheTurf[attacker] and PlayerIsInTheTurf[attacker] == PlayerIsInTheTurf[source] then
				local Turf = PlayerIsInTheTurf[source]
				local AttackerFac = tonumber(getElementData(accSys:getPlayerAcc(attacker), "pMember"))
				local SourceFac = tonumber(getElementData(accSys:getPlayerAcc(source), "pMember"))
				if tonumber(SourceFac) == tonumber(TurfAttacker[Turf]) or SourceFac == tonumber(TurfDefender[Turf]) then
					if tonumber(AttackerFac) == tonumber(TurfAttacker[Turf]) or AttackerFac == tonumber(TurfDefender[Turf]) then
						local SourceIsAttacker = nil
						if tonumber(SourceFac) == tonumber(TurfAttacker[Turf]) then
							SourceIsAttacker = false
						else
							SourceIsAttacker = true 
						end
						if AttackerFac == SourceFac then
							outputChatBox("#ff0000War: Khodi Koshti! -1 Score", attacker, 255, 255, 0,true)
							if SourceIsAttacker == true then
								TurfDefenderScore[Turf] = tonumber(TurfDefenderScore[Turf]) - 1
							else
								TurfAttackerScore[Turf] = tonumber(TurfAttackerScore[Turf]) - 1
							end
						elseif AttackerFac ~= SourceFac then
							if tonumber(getElementData(accSys:getPlayerAcc(source), "pRank")) == 7 then
								outputChatBox("#00ff00War: Shoma Leader Koshti! +5 Score", attacker, 255, 255, 0,true)
								if SourceIsAttacker == true then
									TurfAttackerScore[Turf] = tonumber(TurfAttackerScore[Turf]) + 5
								else
									TurfDefenderScore[Turf] = tonumber(TurfDefenderScore[Turf]) + 5
								end
							else
								outputChatBox("#00ff00War: Shoma Kill Gerefti! +2 Score", attacker, 255, 255, 0,true)
								if SourceIsAttacker == true then
									TurfAttackerScore[Turf] = tonumber(TurfAttackerScore[Turf]) + 2
								else
									TurfDefenderScore[Turf] = tonumber(TurfDefenderScore[Turf]) + 2
								end
							end
						end
					end
				end
			end
		end
	end
end)

addCommandHandler( "wars",
function ( thePlayer )
	outputChatBox("#ff0000☠#fcba03-=[ #ff5959List War Haye Sabt Shode ]=-#ff0000☠", thePlayer, 255, 255, 0,true)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local wTurfID = row['wTurfID']
			if tonumber( wTurfID ) ~= 0 then
				local WT = row['wTime']
				local WD = row['wDate']
				local WDef = row['wDefender']
				local WAtt = row['wAttacker']
				outputChatBox(""..Gangs[tonumber(WDef)-11][1].."( "..Gangs[tonumber(WDef)-11][2].." )#ffffff ⚔ "..Gangs[tonumber(WAtt)-11][1].."( "..Gangs[tonumber(WAtt)-11][2].." ) | #ffffff Roz: #ff0000"..DayNames[tonumber(WD)][1].." | #ffffffSaat: #ff0000"..WT..":00", thePlayer, 255, 255, 0,true)
			end
		end
	end
	dbFree(query)
end)