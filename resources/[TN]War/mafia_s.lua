accSys = exports["Accounts-System"]
notfSys = exports["notf"]
function sendPlayerMessage(Str,player)
	outputChatBox(tostring(Str),player,255,255,255,true)
end
active = true
dbpTime = 500

-- colors
qermez = "#fc3800"
sabz = "#00ff00"

serverTurfs = {}
turfCol = {}
attachedTurf = {}

turfData = {}
isTurf = {}

myTurf = {} --Alien.so

settings = {
	["turfsAlpha"] = 150,
	["leaveTurf"] = 3,
	["inTurfScore"] = 3,
	["teamKillScore"] = 3,
}

local factions = {
{"Edare Police","#507dde",80,125,222, 265},-- 1
{"Police Federal","#2f64e1",47,100,225, 161},-- 2
{"National Gard","#1953e6",25,83,230, 159},-- 3
{"Pezeshk","#ff7700",255,119,0, 67},-- 4
{"Atash Neshani","#e22500",226, 37, 0, 277},-- 5
{"Shahrdar","#bf2abd",191, 24, 189, 153},-- 6
{"KhabarNegar","#cd5c5c",205,92,92, 306},-- 7
{"Edare Amoozesh","#2fa1d6",47,161,214, 254},-- 8
{"Edare Taxirani","#f0f000",240, 240, 0, 255},-- 9
{"Edare Taxirani","#f0f000",240, 240, 0, 255},-- 9

{"Ballas Family","#cf9c0a",207, 156, 10, 108},-- 11
{"Red Dragons Family","#00FFF7",0, 255, 255, 178},-- 12
{"Los Aztecas Family","#FF2D00",255,45,0, 255},-- 13
{"Grove Street Family","#9400FF",148, 0, 255, 223},-- 14
{"Vagos Family","#9400FF",148, 0, 255, 223},-- 15

{"Hackers","#686e9b",104,110,155, 210},-- 16
}

addEventHandler("onResourceStart",resourceRoot,function(resource)
	if resource == getThisResource() then
		if active == true then  --Alien.so
			local loadTurfQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM turfs;" )
			local result, numrows = dbPoll(loadTurfQuery, 500)
			if (result and numrows >= 0) then
				for index, row in pairs(result) do
					turfCol[tonumber(row["id"])] = createColRectangle(tonumber(row["zMinX"]),tonumber(row["zMinY"]),tonumber(row["zMaxX"]),tonumber(row["zMaxY"]))
					serverTurfs[tonumber(row["id"])] = createRadarArea(tonumber(row["zMinX"]),tonumber(row["zMinY"]),tonumber(row["zMaxX"]),tonumber(row["zMaxY"]))
				
					-- Data
					setRadarAreaColor(serverTurfs[tonumber(row["id"])],factions[tonumber(row["zOwner"])][3],factions[tonumber(row["zOwner"])][4],factions[tonumber(row["zOwner"])][5],settings["turfsAlpha"])
					
					-- Table
					
					turfData[turfCol[tonumber(row["id"])]] = {}
					turfData[turfCol[tonumber(row["id"])]]["Stable"] = tonumber(row["turfStable"])
					turfData[turfCol[tonumber(row["id"])]]["zOwner"] = tonumber(row["zOwner"])
					turfData[turfCol[tonumber(row["id"])]]["Attacked"] = tonumber(row["turfAttacked"])
					turfData[turfCol[tonumber(row["id"])]]["HQ"] = tonumber(row["turfHQ"])
					turfData[turfCol[tonumber(row["id"])]]["ID"] = tonumber(row["id"])
					
					isTurf[turfCol[tonumber(row["id"])]] = tonumber(row["id"])
					
					attachedTurf[turfCol[tonumber(row["id"])]] = serverTurfs[tonumber(row["id"])]
					
					print("Turf ID ("..tonumber(row["id"])..") Have Been Loaded Successfully!")
				end
			else
				print("*** Turfs Database Was Not Found ***")
				cancelEvent()
			end
			dbFree(loadTurfQuery)
		else
			print("*** War System Cannot Be Loaded ***")
			cancelEvent()
		end
	end
end)

addCommandHandler("turf",  --Alien.so
function ( thePlayer, command )
	if myTurf[thePlayer] then
		local occupiedTurf = myTurf[thePlayer]
		sendPlayerMessage("#00FF00[DATA]:#FFFFFF ID:#00FF00 "..turfData[occupiedTurf]["ID"].."#ffffff Owner: #00ff00"..factions[tonumber(turfData[occupiedTurf]["zOwner"])][1].."("..turfData[occupiedTurf]["zOwner"]..")#ffffff Stable: #00ff00"..factions[tonumber(turfData[occupiedTurf]["Stable"])][1].."("..turfData[occupiedTurf]["Stable"]..")", thePlayer, 212, 156, 49,true)
	end
end)


inTurfTimer = {}

blip = {}
isturfblip = {}

addEventHandler ( "onColShapeHit", getRootElement(),function(thePlayer)
	if isTurf[source] then
		if getElementType ( thePlayer ) == "player" then
			if getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 then
			myTurf[thePlayer] = source
			notfSys:addNotification(thePlayer,"(( Shoma Vared Turf ID "..turfData[source]["ID"].." Shodid! ))","warning")
			
			if inTurfTimer[thePlayer] then
				if isTimer(inTurfTimer[thePlayer]) then
					killTimer(inTurfTimer[thePlayer])
				end
				inTurfTimer[thePlayer] = nil
			end
			
			if isWar then  --Alien.so
				if warTurf == source then
					local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
					if fac == NAttacker then
						inTurfTimer[thePlayer] = setTimer(inTurfAsLongTime,60000,0,thePlayer)
						if blip[thePlayer] then
							destroyElement(blip[thePlayer])
							blip[thePlayer] = nil
						end
						blip[thePlayer] = createBlipAttachedTo(thePlayer,0)
						isturfblip[blip[thePlayer]] = true
						setBlipVisibleDistance(blip[thePlayer],16383)
						setElementData(blip[thePlayer],"blipSize",15)
						setBlipColor(blip[thePlayer],factions[fac][3],factions[fac][4],factions[fac][5],255)
						setElementVisibleTo(blip[thePlayer],getRootElement(),false)
						for mafia1,mafia2 in ipairs(getElementsByType("player")) do
							if myTurf[mafia2] and myTurf[mafia2] == warTurf then
								setElementVisibleTo(blip[thePlayer],mafia2,true)
							end
						end
						for blip1,blip2 in ipairs(getElementsByType("blip")) do
							if isturfblip[blip2] then
								setElementVisibleTo(blip2,thePlayer,true)
							end
						end
					elseif fac == NDefender then
						inTurfTimer[thePlayer] = setTimer(inTurfAsLongTime,60000,0,thePlayer)
						if blip[thePlayer] then
							destroyElement(blip[thePlayer])
							blip[thePlayer] = nil
						end
						blip[thePlayer] = createBlipAttachedTo(thePlayer,0)
						isturfblip[blip[thePlayer]] = true
						setBlipVisibleDistance(blip[thePlayer],16383)
						setElementData(blip[thePlayer],"blipSize",15)
						setBlipColor(blip[thePlayer],factions[fac][3],factions[fac][4],factions[fac][5],255)
						setElementVisibleTo(blip[thePlayer],getRootElement(),false)
						for mafia1,mafia2 in ipairs(getElementsByType("player")) do
							if myTurf[mafia2] and myTurf[mafia2] == warTurf then
								setElementVisibleTo(blip[thePlayer],mafia2,true)
							end
						end
						for blip1,blip2 in ipairs(getElementsByType("blip")) do
							if isturfblip[blip2] then
								setElementVisibleTo(blip2,thePlayer,true)
							end
						end
					end
				end
			end
			end
		end
	end
end)

addEventHandler("onPlayerQuit",getRootElement(),function()
	if inTurfTimer[source] then  --Alien.so
		if isTimer(inTurfTimer[source]) then
			killTimer(inTurfTimer[source])
		end
		inTurfTimer[source] = nil
	end
end)

function inTurfAsLongTime(thePlayer)
	local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if fac == NAttacker then
		warAttackerScore = warAttackerScore + tonumber(settings["inTurfScore"])
		sendPlayerMessage(""..sabz.."[War]:#FFFFFF Shoma Be Dalile Paydari dar Turf "..sabz..""..tonumber(settings["inTurfScore"]).." Score#FFFFFF Daryaft Kardid!",thePlayer)
	elseif fac == NDefender then
		warDefenderScore = warDefenderScore + tonumber(settings["inTurfScore"])
		sendPlayerMessage(""..sabz.."[War]:#FFFFFF Shoma Be Dalile Paydari dar Turf "..sabz..""..tonumber(settings["inTurfScore"]).." Score#FFFFFF Daryaft Kardid!",thePlayer)
	end
end

havePanel = {}
killtedad = {}
margtedad = {}
infoTimer = {}


addEventHandler("onPlayerLoggedIn",getRootElement(),function(thePlayer)
	if isWar then
		local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
		
		if fac == NAttacker then
			sendPlayerMessage("#FF0000[War]:#FFFFFF Shoma Ba #FF0000"..factions[NDefender][1].."#ffffff War Darid!",thePlayer)
			infoTimer[thePlayer] = setTimer(refreshMyInfo,500,0,thePlayer)
		elseif fac == NDefender then
			sendPlayerMessage("#FF0000[War]:#FFFFFF Shoma Ba #FF0000"..factions[NAttacker][1].."#ffffff War Darid!",thePlayer)
			infoTimer[thePlayer] = setTimer(refreshMyInfo,500,0,thePlayer)
		end
	end
end)

addEventHandler("onPlayerQuit",getRootElement(),function()
	if infoTimer[source] then  --Alien.so
		if isTimer(infoTimer[source]) then
			killTimer(infoTimer[source])
		end
		infoTimer[source] = nil
	end
end)


function refreshMyInfo(thePlayer)
	if not havePanel[thePlayer] then
		triggerClientEvent("toggleWarInfo",thePlayer,thePlayer,true)
		havePanel[thePlayer] = true
	end
	
	if not killtedad[thePlayer] then
		killtedad[thePlayer] = 0
	end
	if not margtedad[thePlayer] then
		margtedad[thePlayer] = 0
	end
	
	local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	
	if fac == NAttacker then
		triggerClientEvent("setupWarInfo",thePlayer,thePlayer,"Total Score: "..warAttackerScore.."\nKills: "..killtedad[thePlayer].."\nDeaths: "..margtedad[thePlayer].."")
	elseif fac == NDefender then
		triggerClientEvent("setupWarInfo",thePlayer,thePlayer,"Total Score: "..warDefenderScore.."\nKills: "..killtedad[thePlayer].."\nDeaths: "..margtedad[thePlayer].."")
	end
end

addEventHandler ( "onColShapeLeave", getRootElement(),function(thePlayer)
	if isTurf[source] then
		if getElementType ( thePlayer ) == "player" then
			if myTurf[thePlayer] then
				myTurf[thePlayer] = nil
				notfSys:addNotification(thePlayer,"Shoma Az Turf Kharej Shodid!","warning")
				
				if inTurfTimer[thePlayer] then
					if isTimer(inTurfTimer[thePlayer]) then
						killTimer(inTurfTimer[thePlayer])
					end
					inTurfTimer[thePlayer] = nil
				end
				
				if isWar then
					local myfaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
					if myfaction == NAttacker or myfaction == NDefender then
						if blip[thePlayer] then
							destroyElement(blip[thePlayer])
							blip[thePlayer] = nil
						end
						for blip1,blip2 in ipairs(getElementsByType("blip")) do
							if isturfblip[blip2] then  --Alien.so
								setElementVisibleTo(blip2,thePlayer,false)
							end
						end
					end
				end
				
				if not morde[thePlayer] then
					if isWar then
						if source == warTurf then
							local myfaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
							if myfaction == NAttacker then
								warAttackerScore = warAttackerScore - tonumber(settings["leaveTurf"])
								sendPlayerMessage("#FF0000[War]:#FFFFFF Shoma Be Dalile Tarke Turf #ff0000"..tonumber(settings["leaveTurf"]).."#FFFFFF Score Az Dast Dadid!",thePlayer)
							elseif myfaction == NDefender then
								warDefenderScore = warDefenderScore - tonumber(settings["leaveTurf"])
								sendPlayerMessage("#FF0000[War]:#FFFFFF Shoma Be Dalile Tarke Turf #ff0000"..tonumber(settings["leaveTurf"]).."#FFFFFF Score Az Dast Dadid!",thePlayer)
							end
						end
					end
				end
			end
		end
	end
end)

morde = {}
margtimer = {}

addEventHandler("onPlayerWasted",getRootElement(),function()
	morde[source] = true  --Alien.so
end)

addEventHandler("onPlayerSpawn",getRootElement(),function()
	if margtimer[source] then
		if isTimer(margtimer[source]) then
			killTimer(margtimer[source])
		end
		margtimer[source] = nil
	end
	margtimer[source] = setTimer(function(thePlayer)
		margtimer[thePlayer] = nil
		
		if morde[thePlayer] then
			morde[thePlayer] = nil
		end
	end,1000,1,source)
end)


function thisMafiaAlreadyDefending(mafiaID)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["warDefender"]) == tonumber(mafiaID) then
				if tonumber(row["warNow"]) == 1 then
					return true  --Alien.so
				end
			end
		end
	end
	return false
end

function thisMafiaAlreadyAttacking(mafiaID)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["warAttacker"]) == tonumber(mafiaID) then
				if tonumber(row["warNow"]) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function thisHQCanBeAttacked(mafiaID)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM turfs;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["zOwner"]) == tonumber(mafiaID) and tonumber(row["turfHQ"]) == 0 then
				return false
			end
		end
	end
	return true
end

addCommandHandler("attack",function(thePlayer,cmd)
	if myTurf[thePlayer] then
		local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
		local rank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank"))
		if fac >= 10 and fac <= 15 then
			if rank >= 7 then
				local turf = myTurf[thePlayer]
				if tonumber(turfData[turf]["Attacked"]) == 0 then
					if tonumber(turfData[turf]["zOwner"]) ~= fac then
						local saheb = tonumber(turfData[turf]["zOwner"])
						if not thisMafiaAlreadyDefending(saheb) then
							if not thisMafiaAlreadyAttacking(fac) then	
								if tonumber(turfData[turf]["HQ"]) == 1 then
									if not thisHQCanBeAttacked(saheb) then
										sendPlayerMessage(""..qermez.."[Error]:#FFFFFF In Mafia Turf Dare Nemitoonid Be HQ Attack Bedid!",thePlayer)
										return   --Alien.so
									end
								end
								local nowday = tonumber(getRealTime().weekday)
								if nowday == 1 or nowday == 3 or nowday == 6 or nowday == 5 then
									if tonumber(nowday) == 1 then
										local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
										local result, numrows = dbPoll(query, dbpTime)
										if (result and numrows > 0) then
											for index, row in pairs(result) do
												if tonumber(row["warDay"]) == 2 then
													if tonumber(row["warNow"]) == 0 then
														local NewWarQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '1', `warAttacker` = '"..fac.."', `warDefender` = '"..tonumber(turfData[turf]["zOwner"]).."', `warTurf` = '"..tonumber(turfData[turf]["ID"]).."' WHERE `warID` = '"..row["warID"].."'")
														dbFree(NewWarQuery)
														
														local NewWarQuery2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `turfAttacked` = '"..fac.."' WHERE `id` = '"..tonumber(turfData[turf]["ID"]).."'")
														dbFree(NewWarQuery2)
														turfData[turf]["Attacked"] = tonumber(fac)
														sendPlayerMessage(""..sabz.."[Attack]:#FFFFFF War Baraye #ff0000"..days[2].."(Saat "..row["warHour"]..")#ffffff Sabt Shod!",thePlayer,255,255,255,true)
														return
													end
												end
											end
											sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Tamamie War Haye #ff0000"..days[2].."#ffffff Az Ghabl Sabt Shodan!",thePlayer,255,255,255,true)
											return
										end
									elseif tonumber(nowday) == 3 then --2
										local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
										local result, numrows = dbPoll(query, dbpTime)
										if (result and numrows > 0) then
											for index, row in pairs(result) do
												if tonumber(row["warDay"]) == 4 then
													if tonumber(row["warNow"]) == 0 then
														local NewWarQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '1', `warAttacker` = '"..fac.."', `warDefender` = '"..tonumber(turfData[turf]["zOwner"]).."', `warTurf` = '"..tonumber(turfData[turf]["ID"]).."' WHERE `warID` = '"..row["warID"].."'")
														dbFree(NewWarQuery)
														
														local NewWarQuery2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `turfAttacked` = '"..fac.."' WHERE `id` = '"..tonumber(turfData[turf]["ID"]).."'")
														dbFree(NewWarQuery2)
														turfData[turf]["Attacked"] = tonumber(fac)
														sendPlayerMessage(""..sabz.."[Attack]:#FFFFFF War Baraye #ff0000"..days[4].."(Saat "..row["warHour"]..")#ffffff Sabt Shod!",thePlayer,255,255,255,true)
														return
													end
												end
											end
												outputChatBox("#ff0000[Error]:#FFFFFF Tamamie War Haye #ff0000"..days[4].."#ffffff Az Ghabl Sabt Shodan!",thePlayer,255,255,255,true)
											return
										end
									elseif tonumber(nowday) == 6 or tonumber(nowday) == 5 then
										local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
										local result, numrows = dbPoll(query, dbpTime)
										if (result and numrows > 0) then
											for index, row in pairs(result) do
												if tonumber(row["warDay"]) == 0 then
													if tonumber(row["warNow"]) == 0 then
														local NewWarQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '1', `warAttacker` = '"..fac.."', `warDefender` = '"..tonumber(turfData[turf]["zOwner"]).."', `warTurf` = '"..tonumber(turfData[turf]["ID"]).."' WHERE `warID` = '"..row["warID"].."'")
														dbFree(NewWarQuery)
														
														local NewWarQuery2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `turfAttacked` = '"..fac.."' WHERE `id` = '"..tonumber(turfData[turf]["ID"]).."'")
														dbFree(NewWarQuery2)
														turfData[turf]["Attacked"] = tonumber(fac)
														sendPlayerMessage(""..sabz.."[Attack]:#FFFFFF War Baraye #ff0000"..days[0].."(Saat "..row["warHour"]..")#ffffff Sabt Shod!",thePlayer,255,255,255,true)
														return
													end
												end
											end
												outputChatBox("#ff0000[Error]:#FFFFFF Tamamie War Haye #ff0000"..days[0].."#ffffff Az Ghabl Sabt Shodan!",thePlayer,255,255,255,true)
												return
										end
									end
								else
									sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Rooz Haye Attack: "..days[1].." , "..days[3].." , "..days[6].."",thePlayer)
								end
							else
								sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Shoma Az Ghabl be yek Mafia Attack Dade Boodid!",thePlayer)
							end
						else
							sendPlayerMessage(""..qermez.."[Error]:#FFFFFF In Mafia Az Ghabl Attack Khorde Bood!",thePlayer)
						end
					else
						sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Be Turfe Khodetoon Nemitoonid Attack Bedid!",thePlayer)
					end
				else
					sendPlayerMessage(""..qermez.."[Error]:#FFFFFF In Turf Az Ghabl Attack Khorde Bood!",thePlayer)
				end
			else
				sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Ranke Shoma Baraye Attack Kafi Nemibashad!",thePlayer)
			end
		else
			sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Shoma Nemitooni Attack Bedi!",thePlayer)
		end
	else
		sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Baraye Attack Dadan Bayad Dakhele Turf Bashid!",thePlayer)
	end
end)

days ={
	[ 6 ] = 'Shanbe',-- attack Time
	[ 0 ] = '1 Shanbe',-- war
	[ 1 ] = '2 Shanbe',-- attack Time
	[ 2 ] = '3 Shanbe',-- war
	[ 3 ] = '4 Shanbe',-- attack Time
	[ 4 ] = '5 Shanbe',-- war
	[ 5 ] = 'Jome', -- esterahat :D
}

addCommandHandler("checkdate",function(thePlayer,cmd)
	--outputChatBox(days[getRealTime().weekday].." ("..getRealTime().weekday..")")
	--outputChatBox(getRealTime().hour) --Alien.so
	
end)


addCommandHandler("resetall",function(thePlayer,cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
	for i=1,9 do
		local resetwars = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '0', `warAttacker` = '0', `warDefender` = '0', `warAttackerScore` = '0', `warDefenderScore` = '0', `warTurf` = '0' WHERE `warID` = '"..i.."'")
		dbFree(resetwars)
	end
	
	for i=1,16 do
		local reset_turfs = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `turfAttacked` = '0' WHERE `id` = '"..i.."'")
		dbFree(reset_turfs)
	end
	
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM turfs;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			--local NewWarQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..row["turfStable"].."' WHERE `id` = '"..row["id"].."'")
			--dbFree(NewWarQuery)
		end
	end
	
	sendPlayerMessage("#00ff00ok",thePlayer)--Alien.so
	end
end)


addCommandHandler("resetwar",function(thePlayer,cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
	for i=1,9 do
		local resetwars = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '0', `warAttacker` = '0', `warDefender` = '0', `warAttackerScore` = '0', `warDefenderScore` = '0', `warTurf` = '0' WHERE `warID` = '"..i.."'")
		dbFree(resetwars)
	end
	
	for i=1,16 do
		local reset_turfs = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `turfAttacked` = '0' WHERE `id` = '"..i.."'")
		dbFree(reset_turfs)
	end
	--[[
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM turfs;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local NewWarQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..row["turfStable"].."' WHERE `id` = '"..row["id"].."'")
			dbFree(NewWarQuery)
		end
	end--]]
	
	sendPlayerMessage("#00ff00ok",thePlayer)
	end
end)

function refreshTurf(turf)
	local radarArea = attachedTurf[turf]
	
	setRadarAreaColor(radarArea,factions[tonumber(turfData[turf]["zOwner"])][3],factions[tonumber(turfData[turf]["zOwner"])][4],factions[tonumber(turfData[turf]["zOwner"])][5],settings["turfsAlpha"])
end


isWar = nil
NAttacker = 0
NDefender = 0
warAttackerScore = 0
warDefenderScore = 0
warTurf = false
NID = 0


warInTurfScoreTimer = false
warStopTimer = false


myKills = {}
myDeaths = {}

lastHour = 0
lastMinute = 0

function checkServerWars()
	local nDay = tonumber(getRealTime().weekday)
	local nHour = tonumber(getRealTime().hour)
	local nMinute = tonumber(getRealTime().minute)
	
	local MQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
	local result, numrows = dbPoll(MQuery, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["warNow"]) == 1 then
				if nDay == tonumber(row["warDay"]) then
					if tonumber(row["warHour"]) == nHour then
						for index,turf_ in ipairs(getElementsByType("colshape")) do
							if isTurf[turf_] and tonumber(turfData[turf_]["ID"]) == tonumber(row["warTurf"]) then
								setRadarAreaFlashing(attachedTurf[turf_],true)
								warTurf = turf_
							end
						end
						
						NAttacker = tonumber(row["warAttacker"])
						NDefender = tonumber(row["warDefender"])
						
						isWar = true
						NID = tonumber(row["warID"])
						warAttackerScore = 0
						warDefenderScore = 0

						warStopTimer = setTimer(stopFunction,1800000,1) -- 1800000

						local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '2' WHERE `warID` = '"..row["warID"].."'")
						dbFree(myQH)
						
						
						for index,allMafia in ipairs(getElementsByType("player")) do
							if getElementData(allMafia,"loggedIn") == true then
								local fac = tonumber(getElementData(accSys:getPlayerAcc(allMafia), "pMember"))
								if fac == NAttacker then
									sendPlayerMessage("#FF0000[War]:#FFFFFF Ware Shoma Ba #FF0000"..factions[NDefender][1].."#ffffff Shoroo Shod!",allMafia)
									infoTimer[allMafia] = setTimer(refreshMyInfo,500,0,allMafia)
									
									if myTurf[allMafia] and myTurf[allMafia] == warTurf then
										if blip[allMafia] then
											destroyElement(blip[allMafia])
											blip[allMafia] = nil
										end
										blip[allMafia] = createBlipAttachedTo(allMafia,0)
										isturfblip[blip[allMafia]] = true
										setBlipVisibleDistance(blip[allMafia],16383)
										setElementData(blip[allMafia],"blipSize",15)
										setBlipColor(blip[allMafia],factions[fac][3],factions[fac][4],factions[fac][5],255)
										setElementVisibleTo(blip[allMafia],getRootElement(),false)
										for mafia1,mafia2 in ipairs(getElementsByType("player")) do
											if myTurf[mafia2] and myTurf[mafia2] == warTurf then
												setElementVisibleTo(blip[allMafia],mafia2,true)
											end
										end
										for blip1,blip2 in ipairs(getElementsByType("blip")) do
											if isturfblip[blip2] then
												setElementVisibleTo(blip2,allMafia,true)
											end
										end
									end
								elseif fac == NDefender then
									sendPlayerMessage("#FF0000[War]:#FFFFFF Ware Shoma Ba #FF0000"..factions[NAttacker][1].."#ffffff Shoroo Shod!",allMafia)
									infoTimer[allMafia] = setTimer(refreshMyInfo,500,0,allMafia)
									
									if myTurf[allMafia] and myTurf[allMafia] == warTurf then
										if blip[allMafia] then
											destroyElement(blip[allMafia])
											blip[allMafia] = nil
										end
										blip[allMafia] = createBlipAttachedTo(allMafia,0)
										isturfblip[blip[allMafia]] = true
										setBlipVisibleDistance(blip[allMafia],16383)
										setElementData(blip[allMafia],"blipSize",15)
										setBlipColor(blip[allMafia],factions[fac][3],factions[fac][4],factions[fac][5],255)
										setElementVisibleTo(blip[allMafia],getRootElement(),false)
										for mafia1,mafia2 in ipairs(getElementsByType("player")) do
											if myTurf[mafia2] and myTurf[mafia2] == warTurf then
												setElementVisibleTo(blip[allMafia],mafia2,true)
											end
										end
										for blip1,blip2 in ipairs(getElementsByType("blip")) do
											if isturfblip[blip2] then
												setElementVisibleTo(blip2,allMafia,true)
											end
										end
									end
								end
							end
						end
						
						return
					end
				end
			end
		end
		return
	end
	dbFree(MQuery)
end

winner = 0

function stopFunction()
	if isWar then
		setRadarAreaFlashing(attachedTurf[warTurf],false)
		local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `war` SET `warNow` = '3', `warAttackerScore` = '"..warAttackerScore.."', `warDefenderScore` = '"..warDefenderScore.."' WHERE `warID` = '"..NID.."'")
		dbFree(myQH)
		if warAttackerScore > warDefenderScore then
			local setUpTurf = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..tonumber(NAttacker).."', `turfAttacked` = '0' WHERE `id` = '"..turfData[warTurf]["ID"].."'")
			dbFree(setUpTurf)
			turfData[warTurf]["zOwner"] = tonumber(NAttacker)
			winner = tonumber(NAttacker)
			print("[War-Log]: War Saate "..getRealTime().hour.." Dar Rooze "..days[getRealTime().weekday].." Be Etmam Resid , Winner: "..factions[NAttacker][1].."")
		else
			local setUpTurf = dbQuery(exports.mysql:getMySQLC(), "UPDATE `turfs` SET `zOwner` = '"..tonumber(NDefender).."', `turfAttacked` = '0' WHERE `id` = '"..turfData[warTurf]["ID"].."'")
			dbFree(setUpTurf)
			turfData[warTurf]["zOwner"] = tonumber(NDefender)
			winner = tonumber(NDefender)
			print("[War-Log]: War Saate "..getRealTime().hour.." Dar Rooze "..days[getRealTime().weekday].." Be Etmam Resid , Winner: "..factions[NDefender][1].."")
		end
		
		for hamemafia,hamemafia2 in ipairs(getElementsByType("player")) do
			if getElementData(hamemafia2,"loggedIn") == true then
				local fac = tonumber(getElementData(accSys:getPlayerAcc(hamemafia2), "pMember"))
				if fac == NAttacker or fac == NDefender then
					sendPlayerMessage("#00FF00[Natije]:#FFFFFF Winnere War: "..factions[winner][2]..""..factions[winner][1].."",hamemafia2)
				end
			end
		end
		
		refreshTurf(warTurf)
		NAttacker = 0
		NDefender = 0
		isWar = nil
		warAttackerScore = 0
		warDefenderScore = 0
		NID = 0
		if isTimer(warStopTimer) then
			killTimer(warStopTimer)
		end
		
		for index,allplayers in ipairs(getElementsByType("player")) do
			if infoTimer[allplayers] then
				if isTimer(infoTimer[allplayers]) then
					killTimer(infoTimer[allplayers])
				end
				infoTimer[allplayers] = nil
			end
			if havePanel[allplayers] then
				havePanel[allplayers] = nil
			end
			killtedad[allplayers] = 1
			margtedad[allplayers] = 1
			triggerClientEvent("toggleWarInfo",allplayers,allplayers,false)
		end
		
		for gang1,gang2 in ipairs(getElementsByType("player")) do
			if blip[gang2] then
				destroyElement(blip[gang2])
				blip[gang2] = nil
			end
		end
	end
end


addEventHandler("OnGlobalTimer", root, function ()
	if (getRealTime().hour ~= lastHour) then
		lastHour = tonumber(getRealTime().hour)
		if not isWar then
			checkServerWars()
		end
	end
end)


addEventHandler("onPlayerWasted",getRootElement(),function(ammo,killer,weapon,bodypart)
	if isWar then
		if getElementData(source,"loggedIn") == true then
			if killer and isElement(killer) and getElementType(killer) == "player" then
				if getElementData(killer,"loggedIn") == true then
					if myTurf[source] and myTurf[killer] and myTurf[source] == myTurf[killer] and myTurf[source] == warTurf and myTurf[killer] == warTurf then
						local diedFac,diedRank = tonumber(getElementData(accSys:getPlayerAcc(source), "pMember")),tonumber(getElementData(accSys:getPlayerAcc(source), "pRank"))
						local killerFac,killerRank = tonumber(getElementData(accSys:getPlayerAcc(killer), "pMember")),tonumber(getElementData(accSys:getPlayerAcc(killer),"pRank"))
						if killerFac == NAttacker or killerFac == NDefender and diedFac == NAttacker or diedFac == NDefender then
							if diedFac == killerFac then
								outputDebugString("check 1")
								if killerFac == NAttacker then
									outputDebugString("check 2")
									sendPlayerMessage(""..qermez.."Khodi Zadi -"..settings["teamKillScore"].."",killer)
									warAttackerScore = warAttackerScore - tonumber(settings["teamKillScore"])
									
									killtedad[killer] = killtedad[killer] + 1
									margtedad[source] = margtedad[source] - 1
									
								elseif killerFac == NDefender then
									outputDebugString("check 3")
									sendPlayerMessage(""..qermez.."Khodi Zadi -"..settings["teamKillScore"].."",killer)
									warDefenderScore = warDefenderScore - tonumber(settings["teamKillScore"])
									
									killtedad[killer] = killtedad[killer] + 1
									margtedad[source] = margtedad[source] - 1
									
								end
							else
								if killerFac == NAttacker then
									sendPlayerMessage(""..sabz.."Kill Gerefti +"..killerRank.."",killer)
									warAttackerScore = warAttackerScore + tonumber(killerRank)
									
									sendPlayerMessage(""..qermez.."Kill Shodi -"..diedRank.."",source)
									warDefenderScore = warDefenderScore - tonumber(diedRank)
									
									killtedad[killer] = killtedad[killer] + 1
									margtedad[source] = margtedad[source] - 1
								elseif killerFac == NDefender then
									sendPlayerMessage(""..sabz.."Kill Gerefti +"..killerRank.."",killer)
									warDefenderScore = warDefenderScore + tonumber(killerRank)
									
									sendPlayerMessage(""..qermez.."Kill Shodi -"..diedRank.."",source)
									warAttackerScore = warAttackerScore - tonumber(diedRank)
									
									killtedad[killer] = killtedad[killer] + 1
									margtedad[source] = margtedad[source] - 1
								end
							end
						end
					end
				end
			end
		end
	end
end)

warsSpam = {}

addCommandHandler("wars",function(thePlayer,cmd)
	if not warsSpam[thePlayer] then
		warsSpam[thePlayer] = setTimer(function(thePlayer)
			warsSpam[thePlayer] = nil
		end,5000,1,thePlayer)
		triggerClientEvent("warspanel",thePlayer,thePlayer,true)
		
		local warsQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM war;" )
		local result, numrows = dbPoll(warsQuery, 500)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				triggerClientEvent("addNewWar",thePlayer,thePlayer,row["warAttacker"],row["warDefender"],row["warHour"],row["warDay"],row["warNow"],row["warAttackerScore"],row["warDefenderScore"])
			end
		end
		dbFree(warsQuery)
	end
end)

function getFactionData(facID,data)
	local data = tostring(data)
	local CheckQuery = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factions;" )
	local result, numrows = dbPoll(CheckQuery, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if tonumber(row["id"]) == tonumber(facID) then
				if row[data] then
					return row[data]
				end
			end
		end
	end
	dbFree(CheckQuery)
	return false
end

-- FIX: `value` and `facID` were concatenated straight into the SQL string
--      (injection risk + breaks on quotes). They are bound as parameters now.
--      The column name cannot be a parameter in SQL, so it is validated
--      against an allow-list instead of being interpolated blindly.
--      Also removed the unreachable `return false` after the if/else.
local FACTION_COLUMNS = {
	fBank = true, fMats = true, fDrugs = true, fName = true,
	fMoney = true, fPoint = true, fWeapon = true,
}

function setFactionData(facID, data, value)
	data = tostring(data)
	if not FACTION_COLUMNS[data] then
		outputDebugString("setFactionData: rejected unknown column '"..data.."'", 1)
		return false
	end
	facID = tonumber(facID)
	if not facID then return false end

	local myQH = dbQuery(exports.mysql:getMySQLC(),
		"UPDATE `factions` SET `"..data.."` = ? WHERE `id` = ?", value, facID)
	if myQH then
		dbFree(myQH)
		return true
	end
	return false
end

-- baj

addCommandHandler("gp2",function(thePlayer,cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		--if isPedInVehicle(thePlayer) then
			local x,y,z = getElementPosition(thePlayer)
			local xx,yy,zz = getElementRotation(thePlayer)
			sendPlayerMessage("#ffffff{"..x.."#00ff00,#ffffff"..y.."#00ff00,#FFFFFF"..z..",0,"..turfData[myTurf[thePlayer]]["ID"].."},",thePlayer,255,255,255,true)
			--OutPutChat("#ffffff"..xx.."#00ff00,#ffffff"..yy.."#00ff00,#FFFFFF"..zz.."",thePlayer,255,255,255,true)
		--end
	else
		sendPlayerMessage("#ff0000[Error] Shoma Dastresi Be in CMD nadarid!",thePlayer,255,255,255,true)
	end
end)

bajLocations = {
{2199.595703125 ,986.037109375 ,10.824999809265,0,1},
{2199.5537109375 ,988.015625 ,10.824999809265,0,1},
{2199.576171875 ,989.267578125 ,10.824999809265,0,1},
{1882.8359375 ,1397.1572265625 ,9.2500972747803,0,2},
{1885.5087890625 ,1397.1884765625 ,9.2500972747803,0,2},
{1904.203125 ,1396.974609375 ,9.2578125,0,2},
{2855.201171875 ,1229.2926025391 ,11.057926177979,0,3},
{2852.8466796875 ,1235.7467041016 ,11.02499961853,0,3},
{2855.4482421875 ,1234.6441650391 ,11.02499961853,0,3},
{1938.001953125 ,1943.7867431641 ,10.236386299133,0,4},
{1945.7783203125 ,1945.4722900391 ,10.229687690735,0,4},
{1942.5869140625 ,1943.7252197266 ,10.229687690735,0,4},
{1708.6953125 ,772.38671875 ,10.823437690735,0,5},
{1705.0751953125 ,772.78125 ,10.830769538879,0,5},
{1696.68359375 ,770.7607421875 ,10.823437690735,0,5},
{2405.3271484375 ,2326.919921875 ,8.140625,0,6},
{2405.583984375 ,2322.4775390625 ,8.1407690048218,0,6},
{2405.6796875 ,2316.1552734375 ,8.1407690048218,0,6},
{2353.2578125 ,2791.447265625 ,10.984868049622,0,7},
{2361.5078125 ,2791.298828125 ,10.984868049622,0,7},
{2361.0300292969 ,2773.4768066406 ,10.984868049622,0,7},
{1155.6396484375 ,1721.34375 ,10.88413143158,0,8},
{1155.544921875 ,1718.94140625 ,10.88413143158,0,8},
{1148.0703125 ,1721.6015625 ,10.88413143158,0,8},
{1426.8916015625,1999.5771484375,10.823437690735,0,10},
{1432.7900390625,2000.357421875,10.830769538879,0,10},
{1435.751953125,1997.4599609375,10.830769538879,0,10},
{1547.904296875,2334.3359375,10.893982887268,0,9},
{1548.9267578125,2334.3134765625,10.893982887268,0,9},
{1550.23828125,2334.28515625,10.893982887268,0,9},





}



baj = {}

cantake = {}

bajData = {
	["pickup"] = {},
	["cash"] = {},
	["turf"] = {},
}

function getzOwnerFromID(ID)

end

function makeBaj()
	for i=1,#bajLocations do
		baj[i] = createPickup(bajLocations[i][1],bajLocations[i][2],bajLocations[i][3],3, 1212 , 0)
		bajData[baj[i]] = {}
		bajData[baj[i]]["pickup"] = baj[i]
		bajData[baj[i]]["cash"] = tonumber(bajLocations[i][4])
		bajData[baj[i]]["turf"] = tonumber(bajLocations[i][5])
		
		
		addEventHandler("onPickupHit",baj[i],function(thePlayer)
			if getElementType(thePlayer) == "player" then
				if getElementData(thePlayer,"loggedIn") == true then
					cantake[thePlayer] = source
				end
			end
		end)
		
		addEventHandler("onPickupLeave",baj[i],function(thePlayer)
			if cantake[thePlayer] then
				cantake[thePlayer] = nil
			end
		end)
	end
	
	setTimer( function()
		for i=1,#bajLocations do 
			if baj[i] then
				if tonumber(bajData[baj[i]]["cash"]) < maxbaj then
					bajData[baj[i]]["cash"] = tonumber(bajData[baj[i]]["cash"]) + math.random(10,15)
					
					if tonumber(bajData[baj[i]]["cash"]) >= maxbaj then
						bajData[baj[i]]["cash"] = tonumber(maxbaj)
					end
				end
			end
		end
	end, 60000, 0) 
end

maxbaj = 12000

makeBaj()




 

addCommandHandler("baj",function(thePlayer,cmd)
	if cantake[thePlayer] then
		if myTurf[thePlayer] then
			local turf = myTurf[thePlayer]
			if tonumber(turfData[turf]["ID"]) == tonumber(bajData[cantake[thePlayer]]["turf"]) then
				local owner = tonumber(turfData[turf]["zOwner"])
				local faction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
				if faction == owner then
					if bajData[cantake[thePlayer]]["cash"] >= 1 then
						if not getElementData(thePlayer,"bajam") then
							setElementData(thePlayer,"bajam",tonumber(bajData[cantake[thePlayer]]["cash"]))
						else
							setElementData(thePlayer,"bajam",tonumber(getElementData(thePlayer,"bajam")) + tonumber(bajData[cantake[thePlayer]]["cash"]))
						end
						
						local x = bajData[cantake[thePlayer]]["cash"]
						bajData[cantake[thePlayer]]["cash"] = 0
						
						sendPlayerMessage(""..sabz.."* Shoma Az Inja $"..x.." Bardashti ...",thePlayer)
					else
						sendPlayerMessage(""..qermez.."[Error]:#FFFFFF In Baj Khalie!",thePlayer)
					end
				else
					sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Shoma Nemitooni Az In Baj Pool Bardari!",thePlayer)
				end
			else
				sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Moshkeli Pish Oomade , Lotfan /report Bedid!",thePlayer)
			end
		else
			sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Shoma Dar Turf Nistid!",thePlayer)
		end
	else
		sendPlayerMessage(""..qermez.."[Error]:#FFFFFF Shoma Pishe Baj Nistid!",thePlayer)
	end
end,false,false)
	addCommandHandler("mybaj",
	function (thePlayer, command)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 9 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 16 then
		if getElementData(thePlayer, "loggedIn") == true then
			if getElementData(thePlayer,"bajam") == nil or getElementData(thePlayer,"bajam") == false then outputChatBox("Shoma Baji Nadarid",thePlayer,255,0,0,true) return end
			outputChatBox("#ffffffShoma Meghdar #00ff00"..getElementData(thePlayer,"bajam").."$ #ffffffBaj Darid!", thePlayer, 0, 255, 0,true)
		end
			else
			outputChatBox("#ff0000[Error] #ffffffShoma Ozv Mafia Nistin!", thePlayer, 255, 255, 255, true)
		end
	end)


addCommandHandler("putbaj",function(thePlayer,cmd)
	local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if MafiaHQ[fac] then
		local playerX,playerY,playerZ = getElementPosition(thePlayer)
		local mafiaX,mafiaY,mafiaZ = MafiaHQ[fac][1],MafiaHQ[fac][2],MafiaHQ[fac][3]
		if getDistanceBetweenPoints3D(playerX,playerY,playerZ,mafiaX,mafiaY,mafiaZ) <= 10 then
			local mybaj = getElementData(thePlayer,"bajam")
			if mybaj and tonumber(mybaj) and tonumber(mybaj) >= 1 then
				if not isPedDead(thePlayer) then
					local hqAmount = tonumber(getFactionData(fac,"fBank"))
					setFactionData(fac,"fBank",hqAmount + mybaj)
					setElementData(thePlayer,"bajam",0)
					sendPlayerMessage("#00FF00Shoma #00CC00$"..mybaj.."#00FF00 Baj dar HQ Gozashtid!",thePlayer)
				else
					sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Mordid!",thePlayer)
				end
			else
				sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Hamratoon Baj Nadarid!",thePlayer)
			end
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFF Baraye Gozashtane Baj Bayad Dar HQ Bashid!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000[Error]:#FFFFFF Shoma Nemitavanid az in Dastoor Estefade Konid!",thePlayer)
	end
end,false,false)

dropobject = {}
dropvalue = {}
dropmarker = {}
dropid = {}
taking = {}

addEventHandler("onPlayerWasted",getRootElement(),function()
	local thePlayer = source
	if getElementData(thePlayer,"bajam") and tonumber(getElementData(thePlayer,"bajam")) and tonumber(getElementData(thePlayer,"bajam")) >= 1 then
		local value = tonumber(getElementData(thePlayer,"bajam"))
		local x,y,z = getElementPosition(thePlayer)
		outputChatBox("#ffffffShoma Koshte Shodin Va Meghdar #ff0000"..value.."$ #ffffffBaj Az Dast Dadin!", source, 255, 255, 255, true)
		setElementData(thePlayer,"bajam",0)
		local KolID = #dropmarker + 5
		for i=1,KolID do
			if not dropmarker[i] then
				dropmarker[i] = createMarker(x,y,z,"cylinder",1.00,255,255,255,0)
				dropobject[dropmarker[i]] = createObject(2912,x,y,z-0.99)
				setElementCollisionsEnabled(dropobject[dropmarker[i]],false)
				dropvalue[dropmarker[i]] = tonumber(value)
				dropid[dropmarker[i]] = i
				
				setElementInterior(dropobject[dropmarker[i]],getElementInterior(thePlayer))
				setElementDimension(dropobject[dropmarker[i]],getElementDimension(thePlayer))
				
				setElementInterior(dropmarker[i],getElementInterior(thePlayer))
				setElementDimension(dropmarker[i],getElementDimension(thePlayer))
				
				return true
			end
		end
	end
end)

mydrop = {}

addEventHandler("onMarkerHit",getRootElement(),function(thePlayer,matchingDimension)
	if isElement(thePlayer) then
		if getElementType(thePlayer) == "player" then
			if dropobject[source] then
				if not taking[dropid[source]] then
					mydrop[thePlayer] = tonumber(dropid[source])
					bindKey(thePlayer,"Z","down",takeDroppedBaj)
					notfSys:addNotification(thePlayer,"Baraye Daryafte Baj Az Dokme 'Z' Estefade Konid!","info")
				end
			end
		end
	end
end)

addEventHandler("onMarkerLeave",getRootElement(),function(thePlayer,matchingDimension)
	if isElement(thePlayer) then
		if getElementType(thePlayer) == "player" then
			if mydrop[thePlayer] then
				mydrop[thePlayer] = nil
				unbindKey(thePlayer,"Z","down",takeDroppedBaj)
			end
		end
	end
end)

taketimer = {}

function takeDroppedBaj(thePlayer)
	if mydrop[thePlayer] then
		local id = tonumber(mydrop[thePlayer])
		if not taking[id] then
			taking[id] = thePlayer
			setPedAnimation(thePlayer,"bomber","bom_plant",-1, false, false, false, false)
			
			taketimer[id] = setTimer(function(thePlayer,id)
				taketimer[id] = nil
				local nowvalue = tonumber(dropvalue[dropmarker[id]])
				givePlayerMoney(thePlayer,nowvalue)
				
				destroyElement(dropmarker[id])
				destroyElement(dropobject[dropmarker[id]])
				
				dropobject[dropmarker[id]] = nil
				dropvalue[dropmarker[id]] = nil
				
				dropid[dropmarker[id]] = nil
				taking[id] = nil
				
				if not getElementData(thePlayer,"bajam") then
					setElementData(thePlayer,"bajam",tonumber(nowvalue))
				else
					setElementData(thePlayer,"bajam",tonumber(getElementData(thePlayer,"bajam")) + tonumber(nowvalue))
				end
				
				dropmarker[id] = nil
				sendPlayerMessage("#00FF00Shoma #00CC00$"..nowvalue.." #00FF00Az Rooye Zamin Bardashtid!",thePlayer)
			end,3000,1,thePlayer,id)
		end
	end
end


MafiaHQ = {
	[12] = {141.71817016602 ,-106.53926086426 ,1218.5999755859}, 
	[11] = {965.33203125 ,-53.208984375 ,1001.1245727539},  
	[10] = {1700.732421875 ,-1668.0361328125 ,20.21875},  
	[14] = {83.246101379395 ,-65.1376953125 ,1047.3000488281}, 
	[15] = {2519.1396484375 ,-1674.8560791016 ,1019.9879760742}, 
}
function sendPlayerMessage(Str,player)
	outputChatBox(tostring(Str),player,255,255,255,true)
end

addCommandHandler("hq",function(thePlayer,cmd)
	local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pMember"))
	if MafiaHQ[fac] then
		local playerX,playerY,playerZ = getElementPosition(thePlayer)
		local mafiaX,mafiaY,mafiaZ = MafiaHQ[fac][1],MafiaHQ[fac][2],MafiaHQ[fac][3]
		if getDistanceBetweenPoints3D(playerX,playerY,playerZ,mafiaX,mafiaY,mafiaZ) <= 5 then
			local myRank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pRank"))
			local AdminRank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin"))
			triggerClientEvent("showHQ",thePlayer,thePlayer,myRank,fac,AdminRank)
			triggerClientEvent("loadFactionData",thePlayer,thePlayer,getFactionData(fac,"fMats"),getFactionData(fac,"fDrugs"),getFactionData(fac,"fBank"))
			
		else
			sendPlayerMessage("#FF0000[Error]:#FFFFFFShoma Bayad Dakhele HQ Bashi!",thePlayer)
		end
	else
		sendPlayerMessage("#FF0000[Error]:#FFFFFFShoma Nemitooni Az In CMD Estefade Koni!",thePlayer)
	end
end)

MafiaItems = {
	[1] = {"fBank","Bank","pCash"},
	[2] = {"fDrugs","Drug","pDrugs"},
	[3] = {"fMats","Material","pMats"},
}



function outputHQLog(Message)
	local time = getRealTime()
	local year = time.year
	local month = time.month + 1
	local monthday = time.monthday
	Tarikh = nil
	if month < 10 then
		if monthday <= 9 then
			Tarikh = ""..(tonumber(year)+1900).."/0"..(tonumber(month)).."/0"..(tonumber(monthday)).."" 
		else
			Tarikh = ""..(tonumber(year)+1900).."/0"..(tonumber(month)).."/"..(tonumber(monthday)).."" 
		end
	else
		if monthday <= 9 then
			Tarikh = ""..(tonumber(year)+1900).."/"..(tonumber(month)).."/0"..(tonumber(monthday)).."" 
		else
			Tarikh = ""..(tonumber(year)+1900).."/"..(tonumber(month)).."/"..(tonumber(monthday)).."" 
		end
	end
	local Hour = time.hour
	local Minute = time.minute
	local Second = time.second
	if Hour < 10 then
		Hour = "0"..Hour
	end
	if Minute < 10 then
		Minute = "0"..Minute
	end
	if Second < 10 then
		Second = "0"..Second
	end
	local Times = ""..Hour..":"..Minute..":"..Second..""
	local loadedXML = xmlLoadFile("HQ.xml")
	local createdChildForLog2 = xmlCreateChild ( loadedXML, "HQ" )
	xmlNodeSetAttribute ( createdChildForLog2, "Message", tostring(Message))
	xmlNodeSetAttribute ( createdChildForLog2, "Date", tostring(Tarikh))
	xmlNodeSetAttribute ( createdChildForLog2, "Time", tostring(Times))
	xmlSaveFile(loadedXML)
	xmlUnloadFile(loadedXML)
end

addEvent("hqActions",true)
addEventHandler("hqActions",getRootElement(),function(thePlayer,Wish,whatToDo,Selected)
	local wish = math.floor(tonumber(Wish))
	local x = tonumber(Selected)
	local fac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),"pMember"))
	if whatToDo == "take" then
		local hqAmount = tonumber(getFactionData(fac,MafiaItems[x][1]))
		if hqAmount >= tonumber(wish) then
			setFactionData(fac,MafiaItems[x][1],hqAmount - wish)
			
			local myaddad = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),MafiaItems[x][3]))
			setElementData(accSys:getPlayerAcc(thePlayer),MafiaItems[x][3],myaddad + wish)
			
			triggerClientEvent("closeHQ",thePlayer,thePlayer)
			
			sendPlayerMessage("#FF0000[Mafia]:#FFFFFF Shoma #FF0000"..wish.." "..MafiaItems[x][2].." #FFFFFFAz HQ Bardashtid!",thePlayer)
			outputHQLog(""..getPlayerName(thePlayer).." Have Taken "..wish.." "..MafiaItems[x][2].."s From HQ (Faction: "..getElementData(accSys:getPlayerAcc(thePlayer),"pMember")..")")
		else
			notfSys:addNotification(thePlayer,"In Meghdar "..MafiaItems[x][2].." Dar HQ Nist!","error")
		end
	elseif whatToDo == "put" then
		local hqAmount = tonumber(getFactionData(fac,MafiaItems[x][1]))
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer),MafiaItems[x][3])) >= tonumber(wish) then
			setFactionData(fac,MafiaItems[x][1],hqAmount + wish)
			
			local myaddad = tonumber(getElementData(accSys:getPlayerAcc(thePlayer),MafiaItems[x][3]))
			setElementData(accSys:getPlayerAcc(thePlayer),MafiaItems[x][3],myaddad - wish)
			
			triggerClientEvent("closeHQ",thePlayer,thePlayer)
			
			sendPlayerMessage("#FF0000[Mafia]:#FFFFFF Shoma #FF0000"..wish.." "..MafiaItems[x][2].." #FFFFFFDar HQ Gozashtid!",thePlayer)
			outputHQLog(""..getPlayerName(thePlayer).." Have Puted "..wish.." "..MafiaItems[x][2].."s To HQ (Faction: "..getElementData(accSys:getPlayerAcc(thePlayer),"pMember")..")")
		else
			notfSys:addNotification(thePlayer,"Shoma In Meghdar "..MafiaItems[x][2].." Ra Nadarid!","error")
		end
	end
end)

-- FIX (bugfix pass 4): the per-player gate tables below were never cleared when
--   a player disconnected. Each is tested as `if not <tbl>[thePlayer]`, so a
--   flag left set (or a timer that fires after the quit) leaves the feature
--   dead for that player and keeps the dead element referenced.
addEventHandler("onPlayerQuit", root, function()
	for _, tbl in ipairs({ havePanel, killtedad, margtedad, morde, warsSpam }) do
		if type(tbl) == "table" and tbl[source] ~= nil then
			if isTimer(tbl[source]) then killTimer(tbl[source]) end
			if isElement(tbl[source]) then destroyElement(tbl[source]) end
			tbl[source] = nil
		end
	end
end)
