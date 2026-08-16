local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local notfSys = exports["notf"]
local FamilySys = exports["[TN]Family"]
local disSys = exports["[TN]Logger"]
local fasele = 1
function tuFindNearestElement(to,elementType,maxDistance) 
    local x,y,z = getElementPosition(to)             
    local bestD = maxDistance + 1 
    local bv = nil 
    for _,av in pairs(getElementsByType(elementType)) do 
        if av ~= to then 
            local vx,vy,vz = getElementPosition(av) 
            local d = getDistanceBetweenPoints3D(x,y,z,vx,vy,vz) 
            if d < bestD and getElementInterior(to) == getElementInterior(av) and getElementDimension(to) == getElementDimension(av) then 
                bestD = d 
                bv = av 
            end 
        end 
    end 
    return bv,bestD  
end 

function findEmptyCarSeat(vehicle)
    local max = getVehicleMaxPassengers(vehicle)
    local pas = getVehicleOccupants(vehicle)
    for i=1, max do
        if not pas[i] then
            return i
        end
    end
    return false
end
--Admin Cmds For Faction-System
function getFactionData(thePlayer,id,type)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=?;",id)
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			if row[type] then
				return row[type]
			else
				SendSystemMasage("#FF0000 Type Not Found", thePlayer)
			end
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end
function DepartmentMessage(Message)
	for k, Bisim in ipairs (getElementsByType("player")) do
		if getElementData(Bisim , "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 4 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 5 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(Bisim), "pMember")) == 7 then
				outputChatBox("#97bbf4(( Bisim Markazi )) #4286f4(( "..Message.." ))", Bisim, 54, 181, 75,true)
				playSoundFrontEnd ( Bisim, 49 )
			end
		end
	end
end

function SendSystemMasage(matn,target)
	outputChatBox("#778899(Faction-System):#FFFFFF "..matn,target,255,255,255,true)
end
local factioninfo = {
	--factioninfo[id]={skinmember,Name,Hex,RC,GC,BC,SKINLEader,RankLeader,RankMember}
	[0]={1,"Civilian","#00ff00",255, 255, 255,1,0,0},
	[1]={164,"Police Department","#507dde",0, 85, 255,265,7,1},
	[2]={286,"FBI","#0072ff",10, 62, 170,127,7,1},
	[3]={287,"NG","#1953e6",0, 14, 170,282,7,1},
	[4]={275,"Medic","#ff7700",255,119,0,70,7,1},
	[5]={240,"ICA (RP)","#FFFFFF",255,255,255,44,7,1},
	[6]={240,"CIA (RP)","#000000",255,255,255,139,7,1},
	[7]={187,"News Reporter","#cd5c5c",205,92,92,147,7,1},
	[8]={83,"Dolat","#FF00FF",255,0,255,295,7,1},
	[9]={268,"Mechanic","#649c9e",100,156,158,50,7,1},
	[10]={268,"Vagos Mafia","#000000",100,156,158,78,7,1},
	[15]={268,"Ballas Mafia","#7901ba",100,156,158,79,7,1},
	
}
--/makeleader or /ml
function sakhtFactionLeader ( thePlayer, command, player, factionID )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			local TedadeFp = tonumber(getElementData(accSys:getPlayerAcc(find), "pPunish"))
			if TedadeFp < 1 then
				local targetPlayer = getPlayerName ( find )
				factionID = tonumber( factionID)
				if factionID >= 1 and factionID <= 15 then

						exports.Logs:newLog("StaffRank"," Admin ".. getPlayerName(thePlayer).." Player "..targetPlayer.." Ra Leader "..factionID.." Kard!")
					
				end
				if factionID == 1 or factionID == 2 or factionID == 3 or factionID == 4 or factionID == 5 or factionID == 6 or factionID == 7 or factionID == 8 or factionID == 9 or factionID == 10 or factionID == 15 then
					local Refresh = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
					dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = NOW() WHERE `pID` = ?", Refresh)
				end
				if factionID <= 15 and factionID >= 0 then
					if factionID == 0 then
						setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "cSkin")))
					end
					--factioninfo[id]={skinmember,Name,Hex,RC,GC,BC,SKINLEader,RankLeader,RankMember}
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pMember", factionID)
					setElementData(accSys:getPlayerAcc(find),"pFamiId",0)
					setElementData(accSys:getPlayerAcc(find), "pRank", factioninfo[factionID][8])
					setElementData(accSys:getPlayerAcc(find), "fSkin", factioninfo[factionID][7])
					setPlayerNametagColor ( find, factioninfo[factionID][4], factioninfo[factionID][5], factioninfo[factionID][6] )
					setElementModel(find, factioninfo[factionID][7])
					disSys:SendDiscordLog("adminchat",command,thePlayer,find,factionID)
					outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be "..factioninfo[factionID][3]..""..factioninfo[factionID][2].." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
					outputChatBox("#CCFFE5[Faction-System] #ffffffShoma Tavasote #00ff00"..getPlayerName(thePlayer).." #ffffffBe "..factioninfo[factionID][3]..factioninfo[factionID][2].." #ffffffDavat Shodid!", find, 255, 0, 255, true)
				else
					outputChatBox("#ff0000✖️ #ffffffFaction Id Eshtebah Ast. Baraye Didan List Faction Ha (/flis)!", thePlayer, 255, 0, 0, true)
				end
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player "..TedadeFp.." Fp Darad!", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /makeleader <PartOfName/ID> <Faction-ID>", thePlayer, 255, 22, 22, true)
		end
	end
addCommandHandler("makeleader", sakhtFactionLeader)
addCommandHandler("ml", sakhtFactionLeader)
--makemember
function sakhtmember( thePlayer, command, player, factionID )
	local adminlevel = getElementData(thePlayer, "pAdmin")
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
	if find then
		factionID = tonumber( factionID)
		local TedadeFp = tonumber(getElementData(accSys:getPlayerAcc(find), "pPunish"))
		if TedadeFp < 1 then
				-- set shodane tarikhe vorod be faction #ExoPrim
				if factionID == 1 or factionID == 2 or factionID == 3 or factionID == 4 or factionID == 6 or factionID == 7 or factionID == 8 or factionID == 9 or factionID == 10 or factionID == 15 then
					local Refresh = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
					dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = NOW() WHERE `pID` = ?", Refresh)
				end
			if factionID == 1 then --
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 1)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 0, 85, 255 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 164)
				setElementModel(find, 164)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #0072ffPolice Department #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Edare Police Davat Shodid!", find, 255, 0, 255, true)
			elseif factionID == 2 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 2)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 0, 62, 170 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 126)
				setElementModel(find, 126)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #0072ffPolice Federal #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Police Federal Davat Shodid!", find, 255, 0, 255, true)
			elseif factionID == 3 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 3)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 0, 14, 170 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 283)
				setElementModel(find, 283)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #0072ffNational Gard #ffffffKardid!.", thePlayer, 0, 255, 0, true)
									outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Gard Melli Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 4 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 4)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 255,119,0 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 276)
				setElementModel(find, 276)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #ff7700Pezeshk #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Pezeshk Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 5 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 5)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 255, 255, 255 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 196)
				setElementModel(find, 196)
				outputChatBox("#00ff00Shoma Faction Player "..targetPlayer.." Ra Be #ff00ffAzhanse Hitman #00ff00Taghir Dadid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00Faction Shoma Tavasot Admin "..getPlayerName(thePlayer).." Be #ff00ffAzhanse Hitman #00ff00Taghir Yaft.", find, 0, 255, 0, true)
			elseif factionID == 6 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 6)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 47,161,214 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 240)
				setElementModel(find, 240)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #2fa1d6Moalem #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Be Faction Edare Amozesh Va Morabigari Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 7 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 7)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 205,92,92 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 185)
				setElementModel(find, 185)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #cd5c5cKhabar Negar #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Be Faction Khabar Negar Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 8 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 8)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 205,92,92 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 206)
				setElementModel(find, 206)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #FF00FFShahr Dar #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Shahrdar Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 9 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 9)
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				setPlayerNametagColor ( find, 100,156,158 ) --
				setElementData(accSys:getPlayerAcc(find), "fSkin", 268)
				setElementModel(find, 268)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #00ff7bMechanic #ffffffKardid!.", thePlayer, 0, 255, 0, true)
                outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Sherkat Khadamat Khodro Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 10 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 10)
				setElementData(accSys:getPlayerAcc(find), "pRank", 5)
				setPlayerNametagColor ( find, 205,92,92 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 78)
				setElementModel(find, 78)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #000000Vagos Mafia #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Shahrdar Davat Shodid!", find, 0, 255, 0, true)
			elseif factionID == 15 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pMember", 15)
				setElementData(accSys:getPlayerAcc(find), "pRank", 5)
				setPlayerNametagColor ( find, 205,92,92 )
				setElementData(accSys:getPlayerAcc(find), "fSkin", 79)
				setElementModel(find, 79)
				outputChatBox("#00ff00☑️ #ffffffShoma Player #00ff00"..targetPlayer.."#ffffff Ra #7901baBalas Mafia #ffffffKardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#99fcaa[Tabrik]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Be Faction Shahrdar Davat Shodid!", find, 0, 255, 0, true)

			else
				outputChatBox("#ff0000✖️ #ffffffInvalid FactionID!", thePlayer, 255, 0, 0, true)
				outputChatBox("#ffff00Baraye Didan ID Faction Ha #00ff00/flist #ffff00Bezanid!", thePlayer, 255, 0, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffIn Player "..TedadeFp.." Fp Darad!", thePlayer, 255, 22, 22, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
	end
else
	outputChatBox("#C0C0C0Bezan: /makemember <PartOfName/ID> <Faction-ID>", thePlayer, 255, 22, 22, true)
end
end
addCommandHandler("makemember",sakhtmember)
addCommandHandler("mm",sakhtmember)
addCommandHandler("flist",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		return false
	end
	outputChatBox("#c68e43 *** Faction List ***", thePlayer, 255, 255, 255, true)
	outputChatBox("#c68e431: #e1c9a3Edare Police  ~  #c68e432:#e1c9a3Police Federal  ~  #c68e433: #e1c9a3Gard Melli", thePlayer, 255, 255, 255, true)
	outputChatBox("#c68e434: #e1c9a3Pezeshk ", thePlayer, 255, 255, 255, true)
	outputChatBox("#c68e437: #e1c9a3Khabar Negar ~  #c68e438:#e1c9a3Shahrdar  ~  #c68e439: #e1c9a3Sherkat Khadamat Khodro", thePlayer, 255, 255, 255, true)
end
)

--/asetfrank
addCommandHandler("asetfrank",
	function ( thePlayer, command, player, rankID )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
			return false
		end
		local find = miscSys:findPlayer ( player )
		if find then
			rankID = tonumber( rankID)
			if rankID == 1 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00"..rankID.." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000"..rankID.." #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 2 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 2)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00"..rankID.." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000"..rankID.." #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 3 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 3)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00"..rankID.." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000"..rankID.." #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 4 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 4)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00"..rankID.." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000"..rankID.." #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 5 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 5)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00"..rankID.." #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000"..rankID.." #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 6 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 6)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00Sub-Leader #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000Sub-Leader #00ff00Davat Kard!", find, 255, 0, 255, true)
			elseif rankID == 7 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", 7)
				outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be Faction Rank'e #00ff00Leader #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Shoma Ra Be Faction Rank'e #ff0000Leader #00ff00Davat Kard!", find, 255, 0, 255, true)
			else
				outputChatBox("#ff0000✖️ #ffffffRank ID Eshtebah Mibashad! (1~7)", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /asetfrank <PartOfName/ID> <1~7>", thePlayer, 255, 22, 22, true)
		end
	end
)

local dbpTime = 500

addCommandHandler("members",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 0 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Ozve Faction Bashid!", thePlayer, 255, 0, 0, true)
		return false
	end
	local factionid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	if factionid == 1 then Rang = "#507dde" elseif factionid == 2 then Rang = "#2f64e1" elseif factionid == 3 then Rang = "#1953e6" elseif factionid == 4 then Rang = "#ff7700" elseif factionid == 6 then Rang = "#2fa1d6" elseif factionid == 7 then Rang = "#cd5c5c" elseif factionid == 9 then Rang = "#649c9e" elseif factionid == 10 then Rang = "#ebe300" elseif factionid == 11 then Rang = "#39badb"  elseif factionid == 12 then Rang = "#dc0000" elseif factionid == 13 then Rang = "#878787"  elseif factionid == 14 then Rang = "#5a0160" elseif factionid == 15 then Rang = "#448d04" end 
	outputChatBox("#d5e3e3▬▬▬▬▬(#2BEC2B Faction Members #d5e3e3)▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"Members",1)
		for index, row in pairs(result) do
			local factioneyaru = row['pMember']
			if tonumber(factioneyaru) == tonumber(factionid) then
				local name = row['pName']
				local rank = row['pRank']
				local pref = row['pID']
				outputChatBox(""..Rang.."Name: #ffffff"..name.." "..Rang.."Referral: #ffffff"..pref.." "..Rang.."Rank: #ffffff"..rank.."", thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"Members")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"Members",chantabadi)
			end
		end
		setElementData(thePlayer,"Members",nil)
		dbFree(query)
	end
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
end)

--/seefp
addCommandHandler("seefp",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
		return false
	end
    local find = miscSys:findPlayer ( player )
	local sfp = getElementData(accSys:getPlayerAcc(find), "pPunish")
	local targetPlayer = getPlayerName ( find )
	if find then
		outputChatBox("#FF8C00Faction Punishe "..targetPlayer.." #ff0000"..sfp.."#FF8C00 Mibashad!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#C0C0C0Bezan: /seefp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

--/setfp
addCommandHandler("setfp",
function ( thePlayer, command, player, fp )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then

		return false
	end
	if fp and player then

	    local find = miscSys:findPlayer ( player )
		local fp = tonumber(fp)
		disSys:SendDiscordLog("setfp",command,thePlayer,find,fp)
		local targetPlayer = getPlayerName ( find )
		setElementData(accSys:getPlayerAcc(find), "pPunish", fp)
		outputChatBox("#00ff00☑️ #ffffffShoma Faction Punish #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..fp.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#ffff00[Tavajoh]: #ffffffAdmin #ffff00"..getPlayerName(thePlayer).." #ffffffFaction Punish Shoma Ra Be #ffff00"..fp.." #ffffffSet Kard!", find, 255, 255, 255, true)
	else
	    outputChatBox("#C0C0C0Bezan: /setfp <PartOfName/ID> <fPunish>", thePlayer, 255, 255, 255, true)
	end
end)


--/invite

addCommandHandler("invite",
function ( thePlayer, command, player )
	local rank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
	local member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
		if tonumber(member) < 1 then
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Ozv Faction Bashid!", thePlayer, 230, 0, 0, true)
			return false
		end
		if tonumber(rank) <= 5 then
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub Leader Ya Leader Bashid!", thePlayer, 230, 0, 0, true)
			return false
		end
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				if find ~= thePlayer then
					local x, y, z = getElementPosition( thePlayer )
					local fx, fy, fz = getElementPosition( find )
					local myInt = getElementInterior(thePlayer)
					local myDim = getElementDimension(thePlayer)
					local yourInt = getElementInterior(find)
					local yourDim = getElementDimension(find)
					local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
					if myInt == yourInt and myDim == yourDim and de < fasele then
						local playerMember = getElementData(accSys:getPlayerAcc(find), "pMember")
						if tonumber(playerMember) == 0  then
							if getElementData(find, "factionReq") == 0 or getElementData(find, "factionReq") == false then
								if getElementData("HaveSendFacRequest",thePlayer) == 1 or getElementData("HaveSendFacRequest",thePlayer) == false then
									if getElementData(accSys:getPlayerAcc(find), "pPunish") == 0 then
										if getElementData(accSys:getPlayerAcc(thePlayer), "pRank") == 7 then
											esmrankesh = "Leader"
										elseif getElementData(accSys:getPlayerAcc(thePlayer), "pRank") == 6 then
											esmrankesh = "Sub-Leader"
										end

										outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..getPlayerName(find).." #ffffffRa Be Faction "..factioninfo[tonumber(member)][2].." Davat Kardid.", thePlayer, 230, 0, 0, true)
										outputChatBox("#CCFFE5[Faction-System] #ffffffShoma Tavasote #00ff00"..esmrankesh.." "..getPlayerName(thePlayer).." #ffffffBe Faction "..factioninfo[tonumber(member)][3]..factioninfo[tonumber(member)][2].." #ffffffDavat Shodi Baraye Ghabol Kardan #00ff00('/join')#ffffff Va Barate Rad Kardan #ff0000('/rjoin')#ffffff.", find, 230, 0, 0, true)
										setElementData(find, "factionReq", tonumber(member))
										setElementData(thePlayer, "HaveSendFacRequest", find )
										setTimer(
											function()
												if tonumber(getElementData(find, "factionReq")) ~= 0 then
													setElementData(find, "factionReq", 0, false)
													setElementData(thePlayer, "HaveSendFacRequest", 1 )
													outputChatBox("#CCFFE5[Faction-System] #ffffffDarkhast Invite Shoma Be #00ff00"..getPlayerName(find).." #ffffffBad Az #ff000015 #ffffffSanie Laghv Shod", thePlayer, 230, 0, 0, true)
													outputChatBox("#CCFFE5[Faction-System] #ffffffDarkhast Invite Dade Shode Be Shoma  Bad Az #ff000015 #ffffffSanie Laghv Shod", find, 230, 0, 0, true)
												end
											end
										,20000,1)


									else
										outputChatBox("#ff0000✖️ #ffffffIn Player Faction Punish Darad!", thePlayer, 230, 0, 0, true)
									end
								else
									notfSys:addNotification(thePlayer, "Shoma yek Darkhast Ersal Shode Darid." , 'error')
								end
							else
								notfSys:addNotification(thePlayer, "In Player Yek Darkhast Bar'resi Nashode Darad." , 'error')
							end
						else
							outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Yek Faction Ozv Mibashad Va Shoma Nmitavanid Vey Ra Invite Dahid", thePlayer, 230, 0, 0, true)
						end
					else
						outputChatBox("#ff0000[Error] In Fard Bayad Nazdik Shoma Bashad!", thePlayer, 0, 255, 0,true)
					end

				else
					outputChatBox("#ff0000✖️ #ffffffKhodet Ra Ke Nemitoni Be Faction Khodet Davat Koni!", thePlayer, 255, 22, 22, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /invite <PartOfName/ID>", thePlayer, 255, 22, 22, true)
		end
end)



--factioninfo[id]={1skinmember,2Name,3Hex,4RC,5GC,6BC,7SKINLEader,8RankLeader,9RankMember}
--/afac
addCommandHandler("join",
	function ( thePlayer, command)
	local member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
	if tonumber(member) == 0 then
		if getElementData(accSys:getPlayerAcc(thePlayer), "pPunish") == 0 then
			local facreq = getElementData(thePlayer, "factionReq")
			if tonumber(facreq) ~= 0 then
				setElementData(thePlayer, "factionReq", 0, false)
				setElementData(accSys:getPlayerAcc(thePlayer), "fSkin", factioninfo[tonumber(facreq)][1])
				setElementModel(thePlayer, factioninfo[tonumber(facreq)][1])
				setElementData(accSys:getPlayerAcc(thePlayer), "pMember", tonumber(facreq))
				if tonumber(thePlayer) == 1 or tonumber(thePlayer) == 2 or tonumber(thePlayer) == 3 or tonumber(thePlayer) == 4 or tonumber(thePlayer) == 6 or tonumber(thePlayer) == 7 or tonumber(thePlayer) == 8 or tonumber(thePlayer) == 9 then
					local Refresh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
					dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = NOW() WHERE `pID` = ?", Refresh)
				end
				setElementData(accSys:getPlayerAcc(thePlayer), "pRank", 1)
				local nowMember = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
				changeFactionColor(thePlayer, tonumber(nowMember))
				outputChatBox("#00ff00☑️ #ffffffShoma Darkhast Ozviat Dar Faction "..factioninfo[tonumber(facreq)][3]..factioninfo[tonumber(facreq)][2].." #ffffffRa Paziroftid!", thePlayer, 230, 0, 0, true)

			else
				setElementData(thePlayer, "factionReq", 0, false)
				outputChatBox("#ff0000✖️ #ffffffShoma Darkhasti Baraye Ozviat Dar Faction Nadarid!", thePlayer, 230, 0, 0, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Fp Darid Va Nemitonid Be Faction Join Beshid!", thePlayer, 230, 0, 0, true)
			setElementData(thePlayer, "factionReq", 0, false)
		end
	else
		setElementData(thePlayer, "factionReq", 0, false)
		outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Factioni Ozv Hastid!", thePlayer, 230, 0, 0, true)
	end
end)

addCommandHandler("rjoin",
	function ( thePlayer, command)
	local member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
	if tonumber(member) == 0 then
		local facreq = getElementData(thePlayer, "factionReq")
		if tonumber(facreq) ~= 0 then
			setElementData(thePlayer, "factionReq", 0, false)
			setElementData(accSys:getPlayerAcc(thePlayer), "pRank", 1)
			local nowMember = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
			changeFactionColor(thePlayer, tonumber(nowMember))
			outputChatBox("#ff0000✖️ #ffffffShoma Darkhast Ozviat Dar Faction "..factioninfo[tonumber(facreq)][3]..factioninfo[tonumber(facreq)][2].." Ra Rad Kardid!", thePlayer, 230, 0, 0, true)
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darkhasti Baraye Ozviat Dar Faction Nadarid!", thePlayer, 230, 0, 0, true)
		end

	else
		outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Factioni Ozv Hastid!", thePlayer, 230, 0, 0, true)
	end
end)





--setfskin
addCommandHandler("setfskin",
function (thePlayer, command, target, skinID)
	local myRank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
	local myMember = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
	if tonumber(myMember) > 0 then
		if tonumber(myRank) >= 6 then
			local find = miscSys:findPlayer( target )
			if find then
				local skinID = tonumber(skinID)
				if skinID then
					local yourMember = getElementData(accSys:getPlayerAcc(find), "pMember")
					if tonumber(myMember) == tonumber(yourMember) then
						if tonumber(myMember) == 1 then 
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 163)
								setElementModel(find, 163)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 164)
								setElementModel(find, 164)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 190)
								setElementModel(find, 190)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 265)
								setElementModel(find, 265)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
                                setElementData(accSys:getPlayerAcc(find), "fSkin", 267)
								setElementModel(find, 267)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
							end
						elseif tonumber(myMember) == 2 then
							if getElementData(find, "incover") ~= true then
								if tonumber(skinID) == 1 then 
									setElementData(accSys:getPlayerAcc(find), "fSkin", 126)
									setElementModel(find, 126)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 2 then
									setElementData(accSys:getPlayerAcc(find), "fSkin", 285)
									setElementModel(find, 285)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 3 then
									setElementData(accSys:getPlayerAcc(find), "fSkin", 192)
									setElementModel(find, 192)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 4 then
									setElementData(accSys:getPlayerAcc(find), "fSkin", 286)
									setElementModel(find, 286)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 5 then
									setElementData(accSys:getPlayerAcc(find), "fSkin", 127)
									setElementModel(find, 127)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								end
							else
								outputChatBox("#ff0000[Department]: #ffffffInplayer Darhal Hazer Cover Ast!", thePlayer, 230, 0, 0, true)
							end
						elseif tonumber(myMember) == 3 then
	                        if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 280)
								setElementModel(find, 280)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 195)
								setElementModel(find, 195)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 282)
								setElementModel(find, 282)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 283)
								setElementModel(find, 283)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 284)
								setElementModel(find, 284)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
                            end
						elseif tonumber(myMember) == 4 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 275)
								setElementModel(find, 275)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 276)
								setElementModel(find, 276)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 191)
								setElementModel(find, 191)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 71)
								setElementModel(find, 71)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 70)
								setElementModel(find, 70)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
							end
						elseif tonumber(myMember) == 5 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin",44)
								setElementModel(find, 44)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 94)
								setElementModel(find, 94)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 95)
								setElementModel(find, 95)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 196)
								setElementModel(find, 196)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 197)
								setElementModel(find, 197)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 6 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 152)
								setElementModel(find, 152)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)

							end
							elseif tonumber(myMember) == 6 then
								if tonumber(skinID) == 1 then 
									setElementData(accSys:getPlayerAcc(find), "fSkin", 138)
									setElementModel(find, 138)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 2 then
									setElementData(accSys:getPlayerAcc(find), "fSkin", 139)
									setElementModel(find, 139)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 3 then
				            	    setElementData(accSys:getPlayerAcc(find), "fSkin", 140)
									setElementModel(find, 140)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 4 then
	                        	    setElementData(accSys:getPlayerAcc(find), "fSkin", 143)
									setElementModel(find, 143)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								elseif tonumber(skinID) == 5 then
	                        	    setElementData(accSys:getPlayerAcc(find), "fSkin", 195)
									setElementModel(find, 195)
									outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								end
							elseif tonumber(myMember) == 7 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 187)
								setElementModel(find, 187)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 193)
								setElementModel(find, 193)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 147)
								setElementModel(find, 147)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 185)
								setElementModel(find, 185)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
							
							end
							elseif tonumber(myMember) == 8 then
	                            if tonumber(skinID) == 1 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 111)
								setElementModel(find, 111)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 206)
								setElementModel(find, 206)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
                                setElementData(accSys:getPlayerAcc(find), "fSkin", 10)
								setElementModel(find, 10)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 295)
								setElementModel(find, 295)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 117)
								setElementModel(find, 117)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
						
                            end
							elseif tonumber(myMember) == 9 then
	                        	if tonumber(skinID) == 1 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 268)
								setElementModel(find, 268)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 308)
								setElementModel(find, 308)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 69)
								setElementModel(find, 69)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 34)
								setElementModel(find, 34)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
		                        setElementData(accSys:getPlayerAcc(find), "fSkin", 50)
								setElementModel(find, 50)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
                            end
							
							elseif tonumber(myMember) == 10 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 108)
								setElementModel(find, 108)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 109)
								setElementModel(find, 109)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 110)
								setElementModel(find, 110)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 37)
								setElementModel(find, 37)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							end
							
						elseif tonumber(myMember) == 11 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 177)
								setElementModel(find, 177)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 116)
								setElementModel(find, 116)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 173)
								setElementModel(find, 173)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 248)
								setElementModel(find, 248)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 247)
								setElementModel(find, 247)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							end
							
							elseif tonumber(myMember) == 12 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 180)
								setElementModel(find, 180)
								outputChatBox("#00ff00[Done]: #ffffffShoma Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Setskin Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 100)
								setElementModel(find, 100)
								outputChatBox("#00ff00[Done]: #ffffffShoma Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Setskin Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 144)
								setElementModel(find, 144)
								outputChatBox("#00ff00[Done]: #ffffffShoma Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Setskin Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 254)
								setElementModel(find, 254)
								outputChatBox("#00ff00[Done]: #ffffffShoma Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Setskin Kardid!", thePlayer, 230, 0, 0, true)
							
							end
							
							
							elseif tonumber(myMember) == 13 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 175)
								setElementModel(find, 175)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 47)
								setElementModel(find, 47)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 115)
								setElementModel(find, 115)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 174)
								setElementModel(find, 174)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							end
							
							
							elseif tonumber(myMember) == 14 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 60)
								setElementModel(find, 60)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
								
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 102)
								setElementModel(find, 102)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 103)
								setElementModel(find, 103)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 104)
								setElementModel(find, 104)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 5 then
                                setElementData(accSys:getPlayerAcc(find), "fSkin", 137)
								setElementModel(find, 137)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 6 then
                                setElementData(accSys:getPlayerAcc(find), "fSkin", 182)
								setElementModel(find, 182)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							
							
							end
							elseif tonumber(myMember) == 15 then
							if tonumber(skinID) == 1 then 
								setElementData(accSys:getPlayerAcc(find), "fSkin", 105)
								setElementModel(find, 105)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 2 then
								setElementData(accSys:getPlayerAcc(find), "fSkin", 106)
								setElementModel(find, 106)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 3 then
				                setElementData(accSys:getPlayerAcc(find), "fSkin", 270)
								setElementModel(find, 270)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							elseif tonumber(skinID) == 4 then
	                            setElementData(accSys:getPlayerAcc(find), "fSkin", 107)
								setElementModel(find, 107)
								outputChatBox("#00ff00☑️ #ffffffShoma Skine Player "..getPlayerName(find).." Ra Be SkinID "..skinID.." Set Kardid!", thePlayer, 230, 0, 0, true)
							end
						
						end
					else
						outputChatBox("#ff0000✖️ #ffffffIn Player Toye Faction Shoma Nist!", thePlayer, 230, 0, 0, true)
					end
				else
					outputChatBox("#C0C0C0Bezan: /setfskin <partofname> <SKINID>", thePlayer, 230, 0, 0, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 230, 0, 0, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Leader Ya Sub Leader Bashid!", thePlayer, 230, 0, 0, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dakhel Faction Bashid!", thePlayer, 230, 0, 0, true)
	end
end)


local khazanepozation = {
	[1] = {252.4892578125 ,69.5810546875 ,1002.640625,6,0},
	[2] = {246.673828125 ,125.4521484375 ,1002.2193603516,10,0},
	[3] = {300.15234375 ,179.97265625 ,1006.171875,3,0},
	[4] = {261.9609375 ,191.8359375 ,1025,3,0},
	[5] = {214.38163757324 ,1397.1312255859 ,-16.834375762939,8,10},
	[6] = {246.673828125 ,125.4521484375 ,1002.2193603516,10,1},
	[7] = {2332.0012207031 ,-1147.5358886719 ,1066.4140625,12,0},
	[8] = {false,false,false,false,false},
	[9] = {-51.593360900879 ,1400.3654785156 ,1093,8,10},
}
--/hoqooq
addCommandHandler("hoqooq",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye In Kar Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) ~= tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) then
				outputChatBox("#ff0000✖️ #ffffffIn Player Ozve Faction Shoma Nist!!", thePlayer, 255, 255, 255, true)
				return false
			end

			if tedad then
				if tonumber(tedad) > 0 then
					local tedad = tonumber(tedad)
					local KhazaneHoghogh = tonumber(getFactionData(thePlayer,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")),"fKhazane"))
					if KhazaneHoghogh >= tedad then
						local factionesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
						if khazanepozation[factionesh] then
							local x,y,z = getElementPosition(thePlayer)
							if tonumber(getDistanceBetweenPoints3D(x,y,z,khazanepozation[factionesh][1],khazanepozation[factionesh][2],khazanepozation[factionesh][3] )) < 2 and getElementDimension(thePlayer) == khazanepozation[factionesh][5] and getElementInterior(thePlayer) == khazanepozation[factionesh][4] then
								local targetPlayer = getPlayerName ( find )
								givePlayerMoney ( find, tedad )
								local query2 = dbQuery(exports.mysql:getMySQLC(),"UPDATE `faction` SET `fKhazane`=? WHERE `fId`=? ;",tonumber(KhazaneHoghogh)-tonumber(tedad), tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")))
								dbPoll(query2, 500)
								dbFree(query2)
								outputChatBox("#00ff00☑️ #ffffff Shoma Be Member #00ff00"..getPlayerName(find).." #ffffffMeghdare #00ff00$"..tedad.." #ffffffhoqooq Dadid!", thePlayer, 255, 255, 255, true)
								outputChatBox("#00ff00[Tavajoh]: #ffffffLeader #00ff00"..getPlayerName(thePlayer).." #ffffffBe Shoma Meghdare #00ff00$"..tedad.." #ffffffhoqooq Dad!", find, 255, 255, 255, true)
								exports.Logs:newLog("hoqooq","Leader "..getPlayerName(thePlayer).." Be Member "..getPlayerName(find).." Meghdare $"..tedad.." hoqooq Dad")
							else
								outputChatBox("#ff0000✖️ #ffffffBaraye Dadan hoqooq Bayad Kenare Khazane Faction Khod Bashid!", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#ff0000✖️ #ffffffFaction Shoma Khazane Nadarad.", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffShoma In Meghdar Pol Dar Khazane Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffHoqooq Bayad Balatar Az#00FF00 0$ #FFFFFFBashad", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffMeghdare hoqooq Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /hoqooq <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
	end
end)

dbpTime = 500
addCommandHandler("hoqooqref",
function(thePlayer, cmd, preffe, Tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ Baraye Inkar Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (preffe) then
		if Tedad then
			local Khazane = tonumber(getFactionData(thePlayer,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")),"fKhazane"))
			local Factionesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
			if Khazane >= tonumber(Tedad) then
				if tonumber(Tedad) > 0 then
					local reffeyarukemikhaddemoteshe = tonumber(preffe)
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
					local result, numrows = dbPoll(query, dbpTime)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							local IDeYaru = row['pID']
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
								local pMember = row['pMember']
								local pBankPass = row['pBankPass']
								if Factionesh == tonumber(pMember) then
									local name = row['pName']
									local pMember = row['pMember']
									local pBankPass = row['pBankPass']
									local BedeHoghogh = row["pBank"]+tonumber(Tedad)
									if tonumber(pMember) >= 1 then
										if tonumber(pBankPass) > 0 then
											exports.Logs:newLog("hoqooq","Leader "..getPlayerName(thePlayer).." Be Member "..name.." Meghdare $"..Tedad.." hoqooq Dad (/hoqooqref)")
											notfSys:addNotification(thePlayer, "Shoma Be Member "..name.." Meghdare $"..tonumber(Tedad).." Hoghogh Dadid" , 'success')
											local sefr = 0
											local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBank` = '"..tonumber(BedeHoghogh).."' WHERE `pID` = '"..tonumber(preffe).."'")
											dbFree(query)
											triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
											local Khazane = tonumber(getFactionData(thePlayer,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")),"fKhazane"))

											local query2 = dbQuery(exports.mysql:getMySQLC(),"UPDATE `faction` SET `fKhazane`=? WHERE `fId`=? ;",Khazane - tonumber(Tedad), tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")))
											dbPoll(query2, 500)
											dbFree(query2)
										end
									end
									if Factionesh ~= tonumber(pMember) then
										notfSys:addNotification(thePlayer, "In Player Dar Faction Shoma Nist!" , 'error')
										triggerClientEvent ( thePlayer, "PlayError", thePlayer)
									end
									if tonumber(pBankPass) <= 0 then
										notfSys:addNotification(thePlayer, "In Player Hesabe Banki Nadarad!" , 'error')
										triggerClientEvent ( thePlayer, "PlayError", thePlayer)
									end
								end
							end
						end
						dbFree(query)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffHoqooq Bayad Balatar Az#00FF00 0$ #FFFFFFBashad", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffPole Shoma Kafi Nist!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffMeghdare hoqooq Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
	else
	outputChatBox("#C0C0C0Bezan: /hoqooqref <Referral-ID> <Meghdar>", thePlayer, 255, 0, 0, true)
	end
end)

-- Khazane PD --

Khazane1 = createObject(2634, 252.517578125 ,71.1 ,1004.500, 0, 0, 180)
setElementInterior(Khazane1, 6)
local KhazaneMarkerPD = createMarker(252.4892578125 ,69.5810546875 ,1002.640625 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerPD, 6 )

addEventHandler("onMarkerHit",KhazaneMarkerPD, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 1 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction Pd Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local HoghogheFacesh =  tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFacHoghogh"))
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=1 ;")
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)

-- Khazane FBI --

Khazane2 = createObject(2634, 246.708984375 ,126.9 ,1004.2193603516, 0, 0, 180)
setElementInterior(Khazane2, 10)
local KhazaneMarkerFBI = createMarker(246.673828125 ,125.4521484375 ,1002.2193603516 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerFBI, 10 )

addEventHandler("onMarkerHit",KhazaneMarkerFBI, function (thePlayer)
	if thePlayer then
		if getElementType(thePlayer) == "player" then
			if getElementInterior(thePlayer) == 10 and getElementDimension(thePlayer) == 0 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 2 then
					outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction FBI Mibashad!", thePlayer, 255, 255, 255, true)
				return false end
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
					outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
				return false end
				local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=2 ;" )
				local result, numrows = dbPoll(query, 500)
				if (result and numrows > 0) then
					for index, row in pairs(result) do
						outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
					end
				else
					SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
				end
			end
		end
	end
end)

-- Khazane CIA --
KhazaneCiaObject = createObject(2634, 246.708984375 ,126.9 ,1004.2193603516, 0, 0, 180)
setElementInterior(KhazaneCiaObject, 10)
setElementDimension ( KhazaneCiaObject, 1 )
local KhazaneCiaMarker = createMarker(246.673828125 ,125.4521484375 ,1002.2193603516 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneCiaMarker,10)
setElementDimension ( KhazaneCiaMarker,1)
addEventHandler("onMarkerHit",KhazaneCiaMarker, function (thePlayer)
	if thePlayer then
		if getElementType(thePlayer) == "player" then
			if getElementInterior(thePlayer) == 10 and getElementDimension(thePlayer) == 1 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 6 then
					outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction CIA Mibashad!", thePlayer, 255, 255, 255, true)
				return false end
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
					outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
				return false end
				local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=6 ;" )
				local result, numrows = dbPoll(query, 500)
				if (result and numrows > 0) then
					for index, row in pairs(result) do
						outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
					end
				else
					SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
				end
			end
		end
	end
end)


-- Khazane NG --

Khazane3 = createObject(2634, 302.2 ,179.9150390625 ,1008.171875, 0, 0, 90)
setElementInterior(Khazane3, 3)
local KhazaneMarkerNG = createMarker(300.15234375 ,179.97265625 ,1006.171875 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerNG, 3 )

addEventHandler("onMarkerHit",KhazaneMarkerNG, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 3 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction NG Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local HoghogheFacesh =  tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFacHoghogh"))
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=3 ;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)


-- Khazane Medic

Khazane4 = createObject(2634, 262.13671875 ,193.50 ,1027, 0, 0, 180)
setElementInterior(Khazane4, 3)
local KhazaneMarkerMedic = createMarker(261.9609375 ,191.8359375 ,1025 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerMedic, 3 )

addEventHandler("onMarkerHit",KhazaneMarkerMedic, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 4 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction Medic Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local HoghogheFacesh =  tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFacHoghogh"))
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=4;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)

--[[

-- Khazane School
Khazane6 = createObject(2634, -2022.5035400391 ,-112.6 ,1062, 0, 0, 180)
setElementInterior(Khazane6, 3)
local KhazaneMarkerSchool = createMarker(-2022.5191650391 ,-114.02011871338 ,1060.21875 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerSchool, 3 )

addEventHandler("onMarkerHit",KhazaneMarkerSchool, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 6 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction School Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local HoghogheFacesh =  tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFacHoghogh"))
	outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..HoghogheFacesh.."", thePlayer, 255, 255, 255, true)
end)

--]]

-- Khazane Nr

Khazane7 = createObject(2634, 2332.0139160156 ,-1148.6 ,1068.2, 0, 0, 362)
setElementInterior(Khazane7, 12)
local KhazaneMarkerNr = createMarker(2332.0012207031 ,-1147.5358886719 ,1066.4140625 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerNr, 12 )

addEventHandler("onMarkerHit",KhazaneMarkerNr, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction Nr Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=5 ;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)



-- Khazane Mechanic

Khazane9 = createObject(2634, -53.1 ,1400.3840332031 ,1095, 0, 0, 270)
setElementInterior(Khazane9, 8)
setElementDimension ( Khazane9, 10 )
local KhazaneMarkerMechanic = createMarker(-51.593360900879 ,1400.3654785156 ,1093 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneMarkerMechanic, 8 )
setElementDimension ( KhazaneMarkerMechanic, 10 )

addEventHandler("onMarkerHit",KhazaneMarkerMechanic, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 9 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction Mechanic Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=6 ;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)

-- Khazane ICA


local KhazaneICA = createMarker(214.38163757324 ,1397.1312255859 ,-16.834375762939 , "cylinder", 1.3,111,175,230,60 )
setElementInterior ( KhazaneICA, 8 )
setElementDimension ( KhazaneICA, 10 )

addEventHandler("onMarkerHit",KhazaneICA, function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 5 then
		outputChatBox("#ff0000✖️ #ffffffIn Khazane Motalegh Be Faction ICA Mibashad!", thePlayer, 255, 255, 255, true)
	return false end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Chek Kardan Khazane Faction Bayad Leader Bashid!", thePlayer, 255, 255, 255, true)
	return false end
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=5 ;" )
	local result, numrows = dbPoll(query, 500)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			outputChatBox("#FFE300[Khazane]:#ffffff Pole Mojod Dar Khazane Faction Shoma: #00ff00$"..row['fKhazane'], thePlayer, 255, 255, 255, true)
		end
	else
		SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
	end
end)

days ={
	[ 0 ] = 'Sunday',
	[ 1 ] = 'Monday',
	[ 2 ] = 'Tuesday',
	[ 3 ] = 'Wednesday',
	[ 4 ] = 'Thursday',
	[ 5 ] = 'Friday',
	[ 6 ] = 'Saturday',
	}
	
 rooz =  (days [getRealTime().weekday] )
 
 local dbpTime = 500
function GetDay2()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM server;" )
    local result, numrows = dbPoll(query, dbpTime)
    if (result and numrows > 0) then
		for index, row in pairs(result) do
			local Date2 = row['Day']
			Day2 = ( tonumber(Date2) )
		end
		dbFree(query)
	end
end

--/setfrank
addCommandHandler("setfrank",
	function ( thePlayer, command, player, rankID )
		rank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
		if tonumber(rank) <= 5 then
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub Leader Ya Leader Bashid!", thePlayer, 230, 0, 0, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		rankID = tonumber( rankID)
		playerMember = getElementData(accSys:getPlayerAcc(find), "pMember")
		member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
		playerRank = getElementData(accSys:getPlayerAcc(find), "pRank")
		name = getPlayerName(thePlayer)
		playerName = getPlayerName(find)
		if find then

				if tonumber(member) == tonumber(playerMember) then
					if tonumber(rank) >= tonumber(playerRank) then
						if rankID == 1 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 1)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Faction-Warn]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						elseif rankID == 2 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 2)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Tavajoh]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						elseif rankID == 3 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 3)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Tavajoh]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						elseif rankID == 4 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 4)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Tavajoh]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						elseif rankID == 5 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 5)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Tavajoh]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						elseif rankID == 6 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", 6)
							outputChatBox("#00ff00☑️ #ffffffShoma Be "..targetPlayer.." Rank #00ff00"..rankID.." #ffffffDadid.", thePlayer, 255, 0, 255, true)
							outputChatBox("#00ff00[Tavajoh]: #ffffffLeader "..getPlayerName(thePlayer).." Be Shoma Rank #00ff00"..rankID.." #ffffffDad.", find, 255, 0, 255, true)
						else
						outputChatBox("#ff0000✖️ #ffffffRank ID Eshtebah Mibashad!", thePlayer, 255, 0, 0, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Nemitavanid In Player Ra Set Rank Konid!", thePlayer, 255, 22, 22, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffIn Player Dar Faction Shoma Nist!", thePlayer, 255, 22, 22, true)
				end

		else
			outputChatBox("#C0C0C0Bezan: /setfrank <PartOfName/ID> <1~6>", thePlayer, 255, 22, 22, true)
		end
	end
)

function changeFactionColor(target, facID)
	local facID = tonumber(facID)
	if facID == 0 then
		setPlayerNametagColor ( target, 255,255,255 ) --#7a0707
	elseif facID == 1 then
		setPlayerNametagColor ( target, 0, 85, 255 ) --#507dde
	elseif facID == 2 then
		setPlayerNametagColor ( target, 0, 62, 170 ) --#2f64e1
	elseif facID == 3 then
		setPlayerNametagColor ( target, 0, 14, 170 ) --#1953e6
	elseif facID == 4 then
		setPlayerNametagColor ( target, 255,119,0 ) --#ff7700
	elseif facID == 5 then
		setPlayerNametagColor ( target, 255,255,255 ) --#7a0707
	
	elseif facID == 7 then
		setPlayerNametagColor ( target, 205,92,92 ) --#cd5c5c
	elseif facID == 8 then
		setPlayerNametagColor ( target, 255,0,255 ) --#FF00FF
	elseif facID == 9 then
		setPlayerNametagColor ( target, 100,156,158 ) --#649c9e
	elseif facID == 10 then
		setPlayerNametagColor ( target, 235 , 227 , 0 ) --#FFFF00
	elseif facID == 11 then
		setPlayerNametagColor ( target,  0 , 0 , 0) --#9400FF
	elseif facID == 12 then
		setPlayerNametagColor ( target, 0,239,255 ) --#ff0000
	elseif facID == 13 then
        setPlayerNametagColor ( target, 135, 135, 135 ) --#00CBFF
	elseif facID == 14 then
	    setPlayerNametagColor ( target, 51, 25, 0 ) --#008000
	elseif facID == 15 then
		setPlayerNametagColor ( target, 68, 141, 4 ) --#FFE100
	end
end

function changeFactionColorSpawn()
	if getElementData(accSys:getPlayerAcc(source),"pMember") == 0 then
		if tonumber(getElementData(accSys:getPlayerAcc(source), "pColorNameTime")) <= 0 then
			local colorname3 = tonumber(getElementData(accSys:getPlayerAcc(source), "pColorR"))
			local colorname2 = tonumber(getElementData(accSys:getPlayerAcc(source), "pColorG"))
			local colorname1 = tonumber(getElementData(accSys:getPlayerAcc(source), "pColorB"))
			setPlayerNametagColor(source,colorname3,colorname2,colorname1)
		else
			setPlayerNametagColor(source,255,255,255)
		end

	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 1 then
		setPlayerNametagColor ( source, 0, 85, 255 ) --#507dde
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 2 then
		setPlayerNametagColor ( source, 0, 62, 170 ) --#2f64e1
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 3 then
		setPlayerNametagColor ( source, 0, 14, 170 ) --#1953e6
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 4 then
		setPlayerNametagColor ( source, 255,119,0 ) --#ff7700
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 5 then
		setPlayerNametagColor ( source, 255,255,255 ) --#7a0707
	
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 6 then
		setPlayerNametagColor ( source, 255,255,255 ) --#2fa1d6
	
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 7 then
		setPlayerNametagColor ( source, 205,92,92 ) --#cd5c5c
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 8 then
		setPlayerNametagColor ( source, 255,0,255 ) --#FF00FF
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 9 then
		setPlayerNametagColor ( source, 100,156,158 ) --#649c9e
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 10 then
		setPlayerNametagColor ( source, 235 , 227 , 0 ) --#FFFF00
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 11 then
		setPlayerNametagColor ( source,  0 , 0 , 0 ) --#9400FF
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 12 then
		setPlayerNametagColor ( source, 0,239,255 ) --#ff0000
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 13 then
        setPlayerNametagColor ( source, 135, 135, 135 ) --#00CBFF
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 14 then
	    setPlayerNametagColor ( source, 51, 25, 0 ) --#008000
	elseif getElementData(accSys:getPlayerAcc(source),"pMember") == 15 then
		setPlayerNametagColor ( source, 68, 141, 4 ) --#FFE100
	end
end
addEventHandler("onPlayerSpawn",root, changeFactionColorSpawn)

--/id
addCommandHandler("id",
	function ( thePlayer, command, player )
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
			local member = getElementData(accSys:getPlayerAcc(find), "pMember")
			local pfam = getElementData(accSys:getPlayerAcc(find), "pFamiId")
			
			
			if tonumber(member) == 0 then
				if pfam > 0 then
					faction = FamilySys:FamilyInfo(pfam,"name").." ["..pfam.."]"
				else
					faction = "Civilian"
				end
			elseif tonumber(member) == 1 then
				faction = "Edare Police"
			elseif tonumber(member) == 2 then
				faction = "Police Federal"
			elseif tonumber(member) == 3 then
				faction = "Gard Melli"
			elseif tonumber(member) == 4 then
				faction = "Pezeshk"
			elseif tonumber(member) == 5 then
				faction = "Civilian"
			elseif tonumber(member) == 6 then
				faction = "Civilian"
			elseif tonumber(member) == 7 then
				faction = "Khabar Negar"
			elseif tonumber(member) == 8 then
				faction = "Shahrdar"
			elseif tonumber(member) == 9 then
				faction = "Sherkat Khadamat Khodro"
			elseif tonumber(member) == 10 then
				faction = "Night Winner Family"
			elseif tonumber(member) == 11 then
				faction = "Avengers Family"
			elseif tonumber(member) == 12 then
				faction = "One4One"
			elseif tonumber(member) == 13 then
				faction = "Ghost Family"
			elseif tonumber(member) == 14 then
				faction = "Terrorist"
			elseif tonumber(member) == 15 then
				faction = "Yakuza Family"
			end
			
			local frank = getElementData(accSys:getPlayerAcc(find), "pRank")

			if tonumber(member) > 0 and tonumber(member) ~= 5 and tonumber(member) ~= 6 then
				if tonumber(frank) == 0 then
					rank = ""
				elseif tonumber(frank) == 1 then
					rank = "(1)"
				elseif tonumber(frank) == 2 then
					rank = "(2)"
				elseif tonumber(frank) == 3 then
					rank = "(3)"
				elseif tonumber(frank) == 4 then
					rank = "(4)"
				elseif tonumber(frank) == 5 then
					rank = "(5)"
				elseif tonumber(frank) == 6 then
					rank = "(Sub Leader)"
				elseif tonumber(frank) == 7 then
					rank = "(Leader)"
				end
			elseif tonumber(pfam) > 0 then
				rank = FamilySys:FamilyInfo(pfam,"frank"..frank.."").."(R"..frank..")"
			else
				rank = "Shahrvand"
			end

			local tarafid = getElementData(find, "TarafID")
			local level = getElementData(accSys:getPlayerAcc(find), "pLevel")


			if getElementData(find, "inSleep") == true then
				Sleep = " [Sleep]"
			else
				Sleep = ""
			end
			local wantedesh = tonumber(getPlayerWantedLevel(find))
			if wantedesh == 0 then
				wantedash = "Nadarad"
			elseif wantedesh == 1 then
				wantedash = "#FFFF00★#FFFFFF★★★★★"
			elseif wantedesh == 2 then
				wantedash = "#FFFF00★★#FFFFFF★★★★"
			elseif wantedesh == 3 then
				wantedash = "#FFFF00★★★#FFFFFF★★★"
			elseif wantedesh == 4 then
				wantedash = "#FFFF00★★★★#FFFFFF★★"
			elseif wantedesh == 5 then
				wantedash = "#FFFF00★★★★★#FFFFFF★"
			elseif wantedesh == 6 then
				wantedash = "#FFFF00★★★★★★"
			end
			
			local Refresh = tonumber(getElementData(accSys:getPlayerAcc(find), "pID"))
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pFamiId")) > 0 then
				FamilyOrFaction = "Family"
			elseif tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) > 0 then
				FamilyOrFaction = "Faction"
			else
				FamilyOrFaction = "Faction/Family"
			end
			if getElementData(accSys:getPlayerAcc(find), "pMarriedTo") == "" then
				outputChatBox("#C0C0C0ID: "..tarafid.." | Name: "..getPlayerName(find).." | Level: "..level.." | "..FamilyOrFaction.." : "..faction.." "..rank..""..Sleep.." | Referral : "..Refresh.." | Vaziat ta'hol : Mojarad | Wanted : "..wantedash.."", thePlayer, 255, 255, 255, true)
			else
				local marby = getElementData(accSys:getPlayerAcc(find), "pMarriedTo")
				outputChatBox("#C0C0C0ID: "..tarafid.." | Name: "..getPlayerName(find).." | Level: "..level.." | "..FamilyOrFaction.." : "..faction.." "..rank..""..Sleep.." | Referral : "..Refresh.." | Vaziat ta'hol : Motahel("..marby..") | Wanted : "..wantedash..""  , thePlayer, 255, 255, 255, true)
			end		
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /id <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)


--/myfp
function myfp( thePlayer )
outputChatBox("#FF8C00Faction Punishe Shoma #ff0000"..getElementData(accSys:getPlayerAcc(thePlayer), "pPunish").." #FF8C00Mibashad!", thePlayer, 255, 255, 255, true)
end
addCommandHandler( "myfp", myfp )

--[[function panelemafiarobazkon( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 16 then 
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,1703.31640625 ,-1667.759765625 ,20.21875)) < 25 then
					triggerClientEvent("Mafia", thePlayer, thePlayer)
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,2809.51953125 ,-1166.4228515625 ,1025.5703125)) < 25 then
					if	getElementDimension ( thePlayer ) == 0 then
						triggerClientEvent("Mafia", thePlayer, thePlayer)
					else
						outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,140.443359375 ,1375.009765625 ,1086.451171875)) < 25 then
					if	getElementDimension ( thePlayer ) == 0 then
						triggerClientEvent("Mafia", thePlayer, thePlayer)
					else
						outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,2494.943359375 ,-1700.2158203125 ,1014.7421875)) < 25 then
					triggerClientEvent("Mafia", thePlayer, thePlayer)
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,1298.8310546875 ,-795.3369140625 ,1084.0078125)) < 25 then
					triggerClientEvent("Mafia", thePlayer, thePlayer)
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end
addEvent("openMafiaPanel",true)
addEventHandler("openMafiaPanel", root,panelemafiarobazkon)--]]

local dbpTime = 500
--[[function mafiaGetKon(root)
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
addEvent("mafiaRefresh",true)
addEventHandler("mafiaRefresh", root,mafiaGetKon)--]]

--[[function mafiaMatPut(root, hismat)
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
		notfSys:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hismat.."gr Mat Dakhel Sandogh Mafia Gozashtid!" , 'success')
		mateghabli = getElementData(accSys:getPlayerAcc(root), "pMats")
		matebadi = mateghabli - hismat
		setElementData(accSys:getPlayerAcc(root),"pMats",matebadi)
		local totMat = mat + hismat
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fMats` = '"..totMat.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
		dbFree(query)
	else
		notfSys:addNotification(root, "Shoma Inghadr Mat Nadarid!" , 'error')
	end
end
addEvent("mafiaPutMat",true)
addEventHandler("mafiaPutMat", root,mafiaMatPut)--]]

--[[function mafiaMattake(root, hismat)
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
			notfSys:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hismat.."gr Mat Az Sandogh Mafia Bardashtid!" , 'success')
			mateghabli = getElementData(accSys:getPlayerAcc(root), "pMats")
			matebadi = mateghabli + hismat
			setElementData(accSys:getPlayerAcc(root),"pMats",matebadi)
			local totMat = mat - hismat
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fMats` = '"..totMat.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
			dbFree(query)
		else
			notfSys:addNotification(root, "Inghadr Mat Dar Sandoghe Mafia Nist!" , 'error')
		end
	else
		notfSys:addNotification(root, "Baraye Inkar Bayad Leader Bashid!" , 'error')
	end
end
addEvent("mafiatakeMat",true)
addEventHandler("mafiatakeMat", root,mafiaMattake)--]]

--[[function mafiadrugPut(root, hisdrug)
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
		notfSys:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hisdrug.."gr Drug Dakhel Sandogh Mafia Gozashtid!" , 'success')
		drugghabli = getElementData(accSys:getPlayerAcc(root), "pDrugs")
		drugebadi = drugghabli - hisdrug
		setElementData(accSys:getPlayerAcc(root),"pDrugs",drugebadi)
		local totdrug = drug + hisdrug
		local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fDrugs` = '"..totdrug.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
		dbFree(query)
	else
		notfSys:addNotification(root, "Shoma Inghadr Drug Nadarid!" , 'error')
	end
end
addEvent("mafiadrugPut",true)
addEventHandler("mafiadrugPut", root,mafiadrugPut)--]]

--[[function mafiadrugtake(root, hisdrug)
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
			notfSys:addNotification(root, "Shoma Ba Movafaghiat Meghdare "..hisdrug.."gr Drug Az Sandogh Mafia Bardashtid!" , 'success')
			drugeghabli = getElementData(accSys:getPlayerAcc(root), "pDrugs")
			drugebadi = drugeghabli + hisdrug
			setElementData(accSys:getPlayerAcc(root),"pDrugs",drugebadi)
			local totdrug = drug - hisdrug
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factions` SET `fDrugs` = '"..totdrug.."' WHERE `id` = '"..getElementData(accSys:getPlayerAcc(root), "pMember").."'")
			dbFree(query)
		else
			notfSys:addNotification(root, "Inghadr Drug Dar Sandoghe Mafia Nist!" , 'error')
		end
	else
		notfSys:addNotification(root, "Baraye Inkar Bayad Leader Bashid!" , 'error')
	end
end
addEvent("mafiadrugtake",true)
addEventHandler("mafiadrugtake", root,mafiadrugtake)--]]

--[[addCommandHandler("gun",
function ( thePlayer, command)
if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 10 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 16 then 
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,1703.31640625 ,-1667.759765625 ,20.21875)) < 25 then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
						giveWeapon ( thePlayer, 24, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						giveWeapon ( thePlayer, 33, 40 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,2809.51953125 ,-1166.4228515625 ,1025.5703125)) < 25 then
					if	getElementDimension ( thePlayer ) == 0 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
							giveWeapon ( thePlayer, 24, 100 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							giveWeapon ( thePlayer, 27, 100 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							giveWeapon ( thePlayer, 27, 100 )
							giveWeapon ( thePlayer, 33, 40 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,140.443359375 ,1375.009765625 ,1086.451171875)) < 25 then
					if	getElementDimension ( thePlayer ) == 0 then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
							giveWeapon ( thePlayer, 24, 100 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							giveWeapon ( thePlayer, 27, 100 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
							giveWeapon ( thePlayer, 24, 100 )
							giveWeapon ( thePlayer, 30, 300 )
							giveWeapon ( thePlayer, 32, 300 )
							giveWeapon ( thePlayer, 27, 100 )
							giveWeapon ( thePlayer, 33, 40 )
							outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,2494.943359375 ,-1700.2158203125 ,1014.7421875)) < 25 then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
						giveWeapon ( thePlayer, 24, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						giveWeapon ( thePlayer, 33, 40 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
				local x,y,z = getElementPosition(thePlayer)
				if tonumber(getDistanceBetweenPoints3D(x,y,z,1298.8310546875 ,-795.3369140625 ,1084.0078125)) < 25 then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 1 then
						giveWeapon ( thePlayer, 24, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 2 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 3 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 4 then
						giveWeapon ( thePlayer, 24, 100 )
						giveWeapon ( thePlayer, 30, 300 )
						giveWeapon ( thePlayer, 32, 300 )
						giveWeapon ( thePlayer, 27, 100 )
						giveWeapon ( thePlayer, 33, 40 )
						outputChatBox("#00ff00[Mafia-System]: #ffffffShoma Ba Movafaghiat Az Hq Gun Daryaft Kardid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000[Mafia-System]: #ffffffBaraye Inkar Bayad Dar Hq Bashid!", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end)--]]

--/leaders
addCommandHandler("leaders",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬(#525252 Online Leaders #d5e3e3)▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, getLeaders in ipairs( getElementsByType("player") ) do 
			if getElementData(getLeaders, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pRank")) == 7 then
				if tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 1 then
				
					outputChatBox ( "#ffffffID: #507dde"..getElementData(getLeaders, "TarafID").." #ffffff| #507dde"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #507ddeEdare Police", thePlayer, 230,0,0 ,true)	
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 2 then
				
					outputChatBox ( "#ffffffID: #2f64e1"..getElementData(getLeaders, "TarafID").." #ffffff| #2f64e1"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #2f64e1Police Federal", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 3 then
				
					outputChatBox ( "#ffffffID: #1953e6"..getElementData(getLeaders, "TarafID").." #ffffff| #1953e6"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #1953e6National Gurd", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 4 then
				
				    outputChatBox ( "#ffffffID: #ff7700"..getElementData(getLeaders, "TarafID").." #ffffff| #ff7700"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #ff7700Pezeshk", thePlayer, 230,0,0 ,true)
				--elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 5 then
					--outputChatBox ( "#00FF7F(!): #ffffff"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") #00FF7FFaction: #ffffffHitman Agency", thePlayer, 230,0,0 ,true)
				--elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 6 then
				  --  outputChatBox ( "#ffffffID: #2fa1d6"..getElementData(getLeaders, "TarafID").." #ffffff| #2fa1d6"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #2fa1d6Edare Amozesh Va Morabigari", thePlayer, 230,0,0 ,true)
		
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 7 then
				    outputChatBox ( "#ffffffID: #cd5c5c"..getElementData(getLeaders, "TarafID").." #ffffff| #cd5c5c"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #cd5c5cKhabar Negar", thePlayer, 230,0,0 ,true)
					
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 8 then
				   outputChatBox ( "#ffffffID: #FF00FF"..getElementData(getLeaders, "TarafID").." #ffffff| #FF00FF"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #FF00FFShahrdar", thePlayer, 230,0,0 ,true)
					
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 9 then
				   outputChatBox ( "#ffffffID: #649c9e"..getElementData(getLeaders, "TarafID").." #ffffff| #649c9e"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #649c9eSherkat Khadamat Khodro", thePlayer, 230,0,0 ,true)
					
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 10 then
					 outputChatBox ( "#ffffffID: #ebe300"..getElementData(getLeaders, "TarafID").." #ffffff| #ebe300"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #ebe300Night Winner Family", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 11 then
					outputChatBox ( "#ffffffID: #39badb"..getElementData(getLeaders, "TarafID").." #ffffff| #39badb"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #39badbAvengers Family", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 12 then
					outputChatBox ( "#ffffffID: #00FFBB"..getElementData(getLeaders, "TarafID").." #ffffff| #00FFBB"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #00FFBB♛One4One♛", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 13 then
					outputChatBox ( "#ffffffID: #878787"..getElementData(getLeaders, "TarafID").." #ffffff| #878787"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #878787Ghost Family Family", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 14 then
					outputChatBox ( "#ffffffID: #5a0160"..getElementData(getLeaders, "TarafID").." #ffffff| #5a0160"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #33230CTerrorist", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 15 then
					outputChatBox ( "#ffffffID: #448d04"..getElementData(getLeaders, "TarafID").." #ffffff| #448d04"..getPlayerName(getLeaders).." #ffffff| #ffffffFaction: #448d04Yakuza Family", thePlayer, 230,0,0 ,true)
				
				end
			end
			end
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end)

--Faction Help
addCommandHandler("fhelp",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#507dde Dastorat PD #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/find #ffffffBaraye Peyda Kardane Kasi Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/cfind #ffffffBaray Cancel Kardane Find.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/cuff #ffffffBaraye Dastband Zadan Be Bazikoni Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/wanted #ffffffBaraye Dadan Wanted Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/d #ffffffBaraye Sohbat Dar Bisim Markazi.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/b #ffffffBaraye Sohbat Dar Bisim.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/m /m1 /m2 /m3 /m4 #ffffffMegaPhone Jahate Dadane Ekhtar Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/arrest #ffffffBaray Zendani Krdan Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/duty #ffffffHalate Anjam Vazife Va Amade Bash.", thePlayer, 255, 255, 255, true)
    outputChatBox("#507dde/Wanteds #ffffffBaray Didane List Mojrem Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/cwanted #ffffffBaray Pak Kardane Wanted Hay Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/rv #ffffffJahate Respawn Kardane Mashin Hay Faction.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/order #ffffffJahate Gereftan Tofang Az Jaye Moshakhas Shode.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/jarime #ffffffBaraye Jarime Kardan Player Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#507dde/getvowner #ffffffFaal Kardan Ghabeliate Peyda Kardan Saheb Mashin ba Clik Roye Mashin Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
    outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#2f64e1 Dastorat FBI #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
    outputChatBox("#2f64e1/find #ffffffBaraye Peyda Kardane Kasi Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/cfind #ffffffBaray Cancel Kardane Find.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/cuff #ffffffBaraye Dastband Zadan Be Bazikoni Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/wanted #ffffffBaraye Dadan Wanted Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/d #ffffffBaraye Sohbat Dar Bisim Markazi.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/b #ffffffBaraye Sohbat Dar Bisim.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/m /m1 /m2 /m3 /m4 #ffffffMegaPhone Jahate Dadane Ekhtar Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/arrest #ffffffBaray Zendani Krdan Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/duty #ffffffHalate Anjam Vazife Va Amade Bash.", thePlayer, 255, 255, 255, true)
    outputChatBox("#2f64e1/Wanteds #ffffffBaray Didane List Mojrem Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/cwanted #ffffffBaray Pak Kardane Wanted Hay Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/rv #ffffffJahate Respawn Kardane Mashin Hay Faction.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/order #ffffffJahate Gerftan Tofang Az Jaye Moshakhas Shode.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/take #ffffffBaray Take Kardane Mat,Drugs,Gun.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/cover #ffffffBaray Taghir Halat Be Police Makhfi.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/jarime #ffffffBaraye Jarime Kardan Player Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#2f64e1/getvowner #ffffffFaal Kardan Ghabeliate Peyda Kardan Saheb Mashin ba Clik Roye Mashin Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#1953e6 Dastorat NG #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
    outputChatBox("#1953e6/find #ffffffBaraye Peyda Kardane Kasi Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/cfind #ffffffBaray Cancel Kardane Find.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/cuff #ffffffBaraye Dastband Zadan Be Bazikoni Ke Wanted Dare.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/wanted #ffffffBaraye Dadan Wanted Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/d #ffffffBaraye Sohbat Dar Bisim Markazi.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/b #ffffffBaraye Sohbat Dar Bisim.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/m /m1 /m2 /m3 /m4 #ffffffMegaPhone Jahate Dadane Ekhtar Be Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/arrest #ffffffBaray Zendani Krdan Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/duty #ffffffHalate Anjam Vazife Va Amade Bash.", thePlayer, 255, 255, 255, true)
    outputChatBox("#1953e6/Wanteds #ffffffBaray Didane List Mojrem Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/cwanted #ffffffBaray Pak Kardane Wanted Hay Bazikon.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/rv #ffffffJahate Respawn Kardane Mashin Hay Faction.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/order #ffffffJahate Gerftan Tofang Az Jaye Moshakhas Shode.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/og #ffffffBaray Baz Kardan Dar Hay Zendan Markazi.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/jarime #ffffffBaraye Jarime Kardan Player Ha.", thePlayer, 255, 255, 255, true)
	outputChatBox("#1953e6/getvowner #ffffffFaal Kardan Ghabeliate Peyda Kardan Saheb Mashin ba Clik Roye Mashin Ha..", thePlayer, 255, 255, 255, true)
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
	    outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#ff7700 Dastorat Medic #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/heal #ffffffBaraye Heal Dadan.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/services #ffffffBaraye Didan List Service Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/aservice #ffffffBaraye Ghabol Kardane Service Digaran.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/aheal #ffffffBaraye Qabool Darkhast Heal.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/b #ffffffBaraye Sohbat Dar Bisim.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/d #ffffffBaraye Sohbat Dar Bisim Markazi.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/rv #ffffffBaraye Respawn Kardan Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff7700/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 5 then
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/contract #7a0707Baraye Contract Kardan Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/contracts #7a0707Baraye Didan List Contract Ha", thePlayer, 255, 255, 255, true)
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/duty #7a0707Baraye Duty Kardan", thePlayer, 255, 255, 255, true)
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/order #7a0707Baraye Daryaft Aslahe", thePlayer, 255, 255, 255, true)
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/f #7a0707Baraye Sohbat Dar Faction", thePlayer, 255, 255, 255, true)
		outputChatBox("#7a0707[Hitman-Help]: #ffffff/rv #7a0707Baraye Respawn Kardan Mashin Ha", thePlayer, 255, 255, 255, true)--]]
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then 
	    outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#2fa1d6 Dastorat School #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		outputChatBox("#2fa1d6/gl #ffffffBaraye Dadan Mojavez Be Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#2fa1d6/sl #ffffffBaraye Didan Mojavez Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#2fa1d6/f #ffffffBaraye Sohbat Dar Faction.", thePlayer, 255, 255, 255, true)
		outputChatBox("#2fa1d6/rv #ffffffBaraye Respawn Kardan Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#2fa1d6/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬(#cd5c5c Dastorat Khabar Negari #d5e3e3)▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/live #ffffffBaraye Starte Live.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/mh #ffffffBaraye Sohbat kardan Dar Live.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/imh #ffffffBaraye Davat Player Be Live.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/stoplive #ffffffBaraye Stop Kardan Live.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/news #ffffffBaraye Ersal Khabar.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/f #ffffffBaraye Sohbat Dar Faction.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/rv #ffffffBaraye Respawn Kardan Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#cd5c5c/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
	outputChatBox("#d5e3e3▬▬▬▬▬▬▬(#FF00FF Dastorat Shahrdari #d5e3e3)▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/givetax #ffffffBaraye Komak Kardan Be Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/taketax #ffffffBaraye Daryaft Maliat Az Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/rv #ffffffBaraye Respawn Kardan Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/gov #ffffffBaraye Dadan News Shahrdari.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/find #ffffffBaraye Peyda Kardan Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/jarime #ffffffBaraye Jarime Kardan Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF/getvowner #ffffffFaal Kardan Ghabeliate Peyda Kardan Saheb Mashin ba Clik Roye Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then
		
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬(#649c9e Dastorat Mechanic #d5e3e3)▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/fixcar #ffffffBaraye Fix Kardan Car Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/refill #ffffffBaraye Benzin Zadan Car Player Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/f #ffffffBaraye Sohbat Dar Faction.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/tune #ffffffBaraye Tuning Kardane Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/rv #ffffffBaraye Respawn Kardan Mashin Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/aservice #ffffffBaraye Accept Kardan Service Ha.", thePlayer, 255, 255, 255, true)
		outputChatBox("#649c9e/members #ffffffJahate Didane Liste Member Haye Faction Khod.", thePlayer, 255, 255, 255, true)
		outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
		
	--[[elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 10 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 11 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 12 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 13 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 14 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 15 then
	elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 then
		outputChatBox("#686e9b[Hackers-Help]: #ffffff/myhackpoints #686e9bDidan Tedad Hack Points Ha", thePlayer, 255, 255, 255, true)
		outputChatBox("#686e9b[Hackers-Help]: #ffffff/unfind #686e9bUnFind Kardan Player Ha", thePlayer, 255, 255, 255, true)
		outputChatBox("#686e9b[Hackers-Help]: #ffffff/hackalljail #686e9bHack Dar Haye Zendan Markazi", thePlayer, 255, 255, 255, true)
		outputChatBox("#686e9b[Hackers-Help]: #ffffff/f #686e9bBaraye Sohbat Dar Faction", thePlayer, 255, 255, 255, true)
		outputChatBox("#686e9b[Hackers-Help]: #ffffff/rv #686e9bBaraye Respawn Kardan Mashin Ha", thePlayer, 255, 255, 255, true)--]]
	end
end)

--Faction Government
function govForMayor ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 8 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#FF00FF((Shahrdar News: #FFFFFF".. message.."#FF00FF))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForMayor)

function govForPD ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#507dde((Edare Police News: #FFFFFF".. message.."#507dde))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForPD)

function govForFBI ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#2f64e1((Police Federal News: #FFFFFF".. message.."#2f64e1))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForFBI)

function govForNG ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#1953e6((Gard Melli News: #FFFFFF".. message.."#1953e6))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForNG)

function govForMedic ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#ff7700((Pezeshk News: #FFFFFF".. message.."#ff7700))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForMedic)



--[[
function govForSI ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 6 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#2fa1d6((Edare Amozesh News: #FFFFFF".. message.."#2fa1d6))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForSI)
--]]


function govForNR ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#cd5c5c((KhabarNegar News: #FFFFFF".. message.."#cd5c5c))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForNR)


function govForMechanic ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 9 then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#649c9e((Mechanic News: #FFFFFF".. message.."#649c9e))",  allpl,255, 255, 255, true )
      end
    else
		outputChatBox ("#C0C0C0Bezan: /gov <Matn>", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub-Leader/Leader Bashid!", thePlayer, 255, 255, 255, true)
	end
	end
end
addCommandHandler ("gov", govForMechanic)
--[[ Server Side Manage Faction Panel ]]--

function openFactionPanel( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		local rankeshbamikonepanel = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) 
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 then
			if rankeshbamikonepanel > 5 and rankeshbamikonepanel < 8 then
				setElementData( thePlayer, "mitoneyana", 1)
			elseif rankeshbamikonepanel <= 5 then
				setElementData( thePlayer, "mitoneyana", 0)
			end
			triggerClientEvent("toggleFcPanel", thePlayer, thePlayer)
		end
	end
end
addEvent("openFactionPanel",true)
addEventHandler("openFactionPanel", root,openFactionPanel)


local rankname = {
	[1] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[2] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[3] = {"(R 1) Sotvan","(R 2) Sarvan","(R 3) Sargord","(R 4) Sarhang","(R 5) Sartip","(R 6) SarLashgar","(R 7) Sepahbod"},
	[4] = {"(R 1) Parastar","(R 2) Sar Parastar","(R 3) Pezeshk","(R 4) Pezeshk Motekhases","(R 5) Pezeshk Jarah","(R 6) Moaven Bimarestan","(R 7) Raeis Bimarestan"},
	[5] = {"(R 1) Agent","(R 2) Hitman","(R 3) Oppressive","(R 4) Handler","(R 5) Board Of Director","(R 6) Director","(R 7) Constant"},
	[6] = {"(R 1) CIA Agent","(R 2) CIA Special Agent","(R 3) CIA Officer","(R 4) CIA Special Officer","(R 5) CIA Commender","(R 6) CIA Chief","(R 7) Constant"},
	[7] = {"(R 1) TazeVared","(R 2) Akas","(R 3) Rozname Negar","(R 4) GozareshGar","(R 5) Mojri","(R 6) Moaven KhabarNegar","(R 7) Raeis KhabarNegar"},
	[8] = {"(R 1) Bodyguard","(R 2) Vazire Farhang Va Refah","(R 3) Sokhango Va Dabire Dolat","(R 4) Vazire Rah Va Shar Sazi","(R 5) Vazir","(R 6) Moaven Rais Jomhor","(R 7) Rais Jomhor"},
	[9] = {"(R 1) Kar Amooz","(R 2) Taze Kar","(R 3) Achar Be Das","(R 4) Achar Frace","(R 5) Kar Balad","(R 6) Dast Yar Osta","(R 7) Osta"},

}







function infoFacSetKon(root)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local myFac = tonumber(getElementData(accSys:getPlayerAcc(root), "pMember"))
		local factioneyaru = row['pMember']
		if tonumber(factioneyaru) == tonumber(myFac) then
			local name = row['pName']
			local rank = row['pRank']
			local pFwarn = row['pFwarn'].."/3"
			local lvl = tostring(row['pLevel'])
			local pJoinFaction = row["pJoinFaction"]
			local pLastLogin = row["pLastLogin"]


			local finalrank = rankname[factioneyaru][rank]
			if getPlayerFromName(name) then
				local yaruOnlineHast = getPlayerFromName(name)
				local onDuty = tonumber(getElementData(yaruOnlineHast, "OnDuty")) or 0
				R,G,B = 0,255,0
				if onDuty == 1 then
					pDuty = "On"
				else
					pDuty = "Off"
				end
			else
				R,G,B = 255,0,0
				pDuty = "Off"
			end

			local fmember = name
			triggerClientEvent("infoFactionPanel", root, fmember, finalrank,pFwarn,pJoinFaction,pLastLogin,pDuty,R,G,B)
				
		end
	end
end
addEvent("infoFaction",true)
addEventHandler("infoFaction", root,infoFacSetKon)




addEvent("getPlayerFactionData",true)
addEventHandler("getPlayerFactionData",getRootElement(),function(client,finalName)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local pName = row["pName"]
		if pName == finalName then

			local pFWarn = row["pFwarn"]
			local pLastLogin = row["pLastLogin"]
			local pJoinFaction = row["pJoinFaction"]
			local pRank = row["pRank"]
			if pRank == 7 then
				finalRank = "Leader"
			elseif pRank == 6 then
				finalRank = "Sub-Leader"
			else
				finalRank = "Rank "..pRank..""
			end
			triggerClientEvent("SetPlayerDataOnGui",client,client,pFWarn,pLastLogin,pJoinFaction,finalRank)
		end
	end
end)


addEvent("KickeshKonAzToFac",true)
addEventHandler("KickeshKonAzToFac",getRootElement(),function(client,fName,fFp)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local pName = row["pName"]
		if pName == fName then
			if getPlayerName(client) ~= fName then
				local pRank = row["pRank"]
				if pRank ~= 7 then
					local myID = row["pID"]
					local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = ?, `pRank` = ?, `pPunish` = ?, `fSkin` = ? WHERE `pID` = '"..myID.."'",0,0,tonumber(fFp),0)
					
					local pTut = row["pTut"]
					if pTut == 2 then
						local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pTut` = ? WHERE `pID` = '"..myID.."'",0)
						dbFree(query2)
					end
					dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = 0 WHERE `pID` = ?", myID)
					if getPlayerFromName(fName) then
						local yaruOnlineHast = getPlayerFromName(fName)
						setPlayerNametagColor(yaruOnlineHast,255,255,255)
						setElementModel(yaruOnlineHast,getElementData(accSys:getPlayerAcc(yaruOnlineHast),"cSkin"))
						takeAllWeapons(yaruOnlineHast)
						
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pMember",0)
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pPunish",tonumber(fFp))
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pRank",0)
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"fSkin",0)
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pTut",0)
						setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pFwarn",0)
						takeAllWeapons ( yaruOnlineHast )
						setPedArmor(yaruOnlineHast, 0)
						removePedFromVehicle( yaruOnlineHast )
						local x,y,z = getElementPosition(yaruOnlineHast)
						setElementPosition ( yaruOnlineHast, x,y,z+2 )
						local esmeesh = getPlayerName(client)
						local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
						if rankesh == 6 then  magham = "Sub-Leader" elseif rankesh == 7 then  magham = "Leader" end
						notfSys:addNotification(yaruOnlineHast,""..magham.." "..esmeesh.." Shoma Ra Ba "..fFp.." Fp Az Faction Kick Kard!","info")
						triggerClientEvent ( yaruOnlineHast, "Playinfo", yaruOnlineHast )
						dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = 0 WHERE `pID` = ?", myID)
					end
					notfSys:addNotification(client,"Player "..fName.." Ba Fp "..fFp.." Az Faction Ba Movafaqiat Kick Shod.","success")
					triggerClientEvent ( client, "PlayMovafagh", client )
					dbFree(query1)
					
					triggerClientEvent("infoFaction",client,client)
					triggerClientEvent("reloadPageEvent",client,client)
				else
					notfSys:addNotification(client,"Leader Ro Ke Nemishe Kick Kard!","error")
					triggerClientEvent ( client, "PlayError", client )
				end
			else
				notfSys:addNotification(client,"Khodeto Nemitooni Kick Bedi!","error")
				triggerClientEvent ( client, "PlayError", client )
				
			end
		end
	end
end)


addEvent("poromoteshkonfaction",true)
addEventHandler("poromoteshkonfaction",getRootElement(),function(player,taraf)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > 5 then
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == taraf then
                    local tarafrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                    local taraffamilyid = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pMember"))
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == taraffamilyid then
                            if tarafrank < 6 then
                                if tarafrank ~= 10 then
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pRank",tarafrank+1 )

                                    local tarafnowrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                                    local esmnowrank = rankname[taraffamilyid][tarafrank]

                                    notfSys:addNotification(player, "Player "..getPlayerName(hame_Playera).." Ba Movafaghiat Be Rank "..esmnowrank.." Demote Shod!" , 'warning')
                                    if hame_Playera ~= player then
                                        notfSys:addNotification(hame_Playera, "Shoma Tavasote "..rankname[tonumber(getElementData(accSys:getPlayerAcc(player), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(player), "pRank"))].."( "..getPlayerName(player).." ) Be Rank "..rankname[tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))].." Promot Shodid!" , 'warning')
                                    end
                                    return true
                                else
                                    notfSys:addNotification(player, "Leader Ra Nemishe Demote Kard." , 'error')
                                    return true
                                end
                            else
                                notfSys:addNotification(player, "In Player Rankesh Sub-Leader Va Nemishe Sefresh Krad!" , 'error')
                                return true
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Faction Shoma Nist", player, 230, 0, 0, true)
                            return true
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Demot Konid.", player, 230, 0, 0, true)
                        return true
                    end
                end
            end
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pName = ?",taraf)
            local result, numrows = dbPoll(AllFamilys, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local tarafrank = row['pRank']
                    local taraffamilyid = row['pMember']
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == taraffamilyid then
                            if tarafrank < 6 then
                                local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pRank` = ? WHERE pName = ? AND pID = ?",tarafrank+1,taraf,row['pID'])
                                dbPoll(query3, 500)
                                notfSys:addNotification(player, "Player "..taraf.." Ba Movafaghiat Be Rank "..rankname[taraffamilyid][tarafrank+1].." Promote Shod!" , 'success')
                                dbFree(query3)
                                dbFree(AllFamilys)
                            else
                                notfSys:addNotification(player, "In Player Rankesh Sub-Leader Va Nemishe Sefresh Krad!" , 'error')
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Faction Shoma Nist", player, 230, 0, 0, true)
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promote Konid.", player, 230, 0, 0, true)
                    end
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Rank Kafi Baraye Anjam In Kar Ra Nadarid!", player, 230, 0, 0, true)
        end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Faction Ozv Nistid!", player, 230, 0, 0, true)
    end
end)

addEvent("demoteshkonfaction",true)
addEventHandler("demoteshkonfaction",getRootElement(),function(player,taraf)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > 5 then
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == taraf then
                    local tarafrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                    local taraffamilyid = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pMember"))
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == taraffamilyid then
                            if tarafrank > 1 then
                                if tarafrank ~= 10 then
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pRank",tarafrank-1 )

                                    local tarafnowrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                                    local esmnowrank = rankname[taraffamilyid][tarafrank]

                                    notfSys:addNotification(player, "Player "..getPlayerName(hame_Playera).." Ba Movafaghiat Be Rank "..esmnowrank.." Demote Shod!" , 'warning')
                                    if hame_Playera ~= player then
                                        notfSys:addNotification(hame_Playera, "Shoma Tavasote "..rankname[tonumber(getElementData(accSys:getPlayerAcc(player), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(player), "pRank"))].."( "..getPlayerName(player).." ) Be Rank "..rankname[tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pMember"))][tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))].." Demote Shodid!" , 'warning')
                                    end
                                    return true
                                else
                                    notfSys:addNotification(player, "Leader Ra Nemishe Demote Kard." , 'error')
                                    return true
                                end
                            else
                                notfSys:addNotification(player, "In Player Rankesh Yeke Va Nemishe Sefresh Krad(Baraye Ekhraj Az Gozine kick Estefade Konid)!" , 'error')
                                return true
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Faction Shoma Nist", player, 230, 0, 0, true)
                            return true
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Demot Konid.", player, 230, 0, 0, true)
                        return true
                    end
                end
            end
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pName = ?",taraf)
            local result, numrows = dbPoll(AllFamilys, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local tarafrank = row['pRank']
                    local taraffamilyid = row['pMember']
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == taraffamilyid then
                            if tarafrank > 1 then
                                local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pRank` = ? WHERE pName = ? AND pID = ?",tarafrank-1,taraf,row['pID'])
                                dbPoll(query3, 500)
                                notfSys:addNotification(player, "Player "..taraf.." Ba Movafaghiat Be Rank "..rankname[taraffamilyid][tarafrank-1].." Demote Shod!" , 'success')
                                dbFree(query3)
                                dbFree(AllFamilys)
                            else
                                notfSys:addNotification(player, "In Player Rankesh Yeke Va Nemishe Sefresh Krad(Baraye Ekhraj Az Gozine kick Estefade Konid)!" , 'error')
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Demote Konid.", player, 230, 0, 0, true)
                    end
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Rank Kafi Baraye Anjam In Kar Ra Nadarid!", player, 230, 0, 0, true)
        end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Faction Ozv Nistid!", player, 230, 0, 0, true)
    end

end)

addEvent("removeFw",true)
addEventHandler("removeFw",getRootElement(),function(client,finalPlayerName)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local pName = row["pName"]
		if pName == finalPlayerName then
			if getPlayerName(client) ~= finalPlayerName then
				local pRank = row["pRank"]
				if pRank ~= 7 then
					local pFwarns = row["pFwarn"]
					if pFwarns > 0 then
						if pFwarns == 1 then
							if getPlayerFromName(finalPlayerName) then
								setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pFwarn',0)
								notfSys:addNotification(client,"Shoma 1 Faction Warn Member "..finalPlayerName.." Ra Pak Kardid!","success")
								triggerClientEvent ( client, "PlayMovafagh", client )
								local esmeesh = getPlayerName(client)
								local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
								if rankesh == 6 then  magham = "Sub-Leader" elseif rankesh == 7 then  magham = "Leader" end
								notfSys:addNotification(getPlayerFromName(finalPlayerName),""..magham.." "..esmeesh.." 1 Faction Warn Shoma Ra Pak Kard!","info")
								triggerClientEvent ( getPlayerFromName(finalPlayerName), "Playinfo", getPlayerFromName(finalPlayerName) )
							else
								notfSys:addNotification(client,"Shoma 1 Faction Warn Member "..finalPlayerName.." Ra Pak Kardid!","success")
								triggerClientEvent ( client, "PlayMovafagh", client )
								local theID = row["pID"]
								local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..theID.."'",0)
								dbFree(queryFw)
							end
						elseif pFwarns == 2 then
							if getPlayerFromName(finalPlayerName) then
								setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pFwarn',1)
								notfSys:addNotification(client,"Shoma 1 Faction Warn Member "..finalPlayerName.." Ra Pak Kardid!","success")
								triggerClientEvent ( client, "PlayMovafagh", client )
								
								
								local esmeesh = getPlayerName(client)
								local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
								if rankesh == 6 then  magham = "Sub-Leader" elseif rankesh == 7 then  magham = "Leader" end
								notfSys:addNotification(getPlayerFromName(finalPlayerName),""..magham.." "..esmeesh.." 1 Faction Warn Shoma Ra Pak Kard!","success")
							else
								notfSys:addNotification(client,"Shoma 1 Faction Warn Member "..finalPlayerName.." Ra Pak Kardid!","info")
								triggerClientEvent ( getPlayerFromName(finalPlayerName), "Playinfo", getPlayerFromName(finalPlayerName) )
								triggerClientEvent ( client, "PlayMovafagh", client )
								local theID = row["pID"]
								local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..theID.."'",1)
								dbFree(queryFw)
							end
						end
					else
						notfSys:addNotification(client,"In Player Faction Warn Nadarad!","error")
						triggerClientEvent ( client, "PlayError", client )
					end
				else
					notfSys:addNotification(client,"Leader Faction Warn Nadarad!","error")
					triggerClientEvent ( client, "PlayError", client )
				end
			else
				notfSys:addNotification(client,"Shoma Ejaze Remove Kardane Faction Warn Khod Ra Nadarid!","error")
				triggerClientEvent ( client, "PlayError", client )
			end
		end
	end
end)

addEvent("bedeFw",true)
addEventHandler("bedeFw",getRootElement(),function(client,finalPlayerName)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	for index, row in pairs(result) do
		local pName = row["pName"]
		if pName == finalPlayerName then
			if getPlayerName(client) ~= finalPlayerName then
				local pRank = row["pRank"]
				if pRank ~= 7 then
					local pFwarns = row["pFwarn"]
					if pFwarns == 0 then
						if getPlayerFromName(finalPlayerName) then
							setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pFwarn',1)
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							local esmeesh = getPlayerName(client)
							local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
							if rankesh == 6 then  magham = "Sub-Leader" elseif rankesh == 7 then  magham = "Leader" end
							notfSys:addNotification(getPlayerFromName(finalPlayerName),""..magham.." "..esmeesh.." Be Shoma 1 Faction Warn Dad!","info")
							triggerClientEvent ( getPlayerFromName(finalPlayerName), "Playinfo", getPlayerFromName(finalPlayerName) )
						else
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							local theID = row["pID"]
							local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..theID.."'",1)
							dbFree(queryFw)
						end
					elseif pFwarns == 1 then
						if getPlayerFromName(finalPlayerName) then
							setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pFwarn',2)
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							local esmeesh = getPlayerName(client)
							local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
							if rankesh == 6 then  magham = "Sub-Leader" elseif rankesh == 7 then  magham = "Leader" end
							notfSys:addNotification(getPlayerFromName(finalPlayerName),""..magham.." "..esmeesh.." Be Shoma 1 Faction Warn Dad!","info")
							triggerClientEvent ( getPlayerFromName(finalPlayerName), "Playinfo", getPlayerFromName(finalPlayerName) )
						else
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							local theID = row["pID"]
							local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..theID.."'",2)
							dbFree(queryFw)
						end
					elseif pFwarns == 2 then
						if getPlayerFromName(finalPlayerName) then
							local theID = row["pID"]
							setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pFwarn',0)
							setElementData(accSys:getPlayerAcc(getPlayerFromName(finalPlayerName)),'pPunish',60)
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid Va Az Faction Kick Shod!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = 0 WHERE `pID` = ?", theID)
							local esmeesh = getPlayerName(client)
							local rankesh = tonumber(getElementData(accSys:getPlayerAcc(client),'pRank'))
							if rankesh == 6 then local magham = "Sub-Leader" elseif rankesh == 7 then local magham = "Leader" end
							notfSys:addNotification(getPlayerFromName(finalPlayerName),""..magham.." "..esmeesh.." Be Shoma 1 Faction Warn Dad [3/3] Va Az Faction Kick Shodid!","info")
							triggerClientEvent ( getPlayerFromName(finalPlayerName), "Playinfo", getPlayerFromName(finalPlayerName) )
						else
							notfSys:addNotification(client,"Shoma Be Member "..finalPlayerName.." Meqdare 1 Faction Warn Dadid Va Az Faction Kick Shod!","success")
							triggerClientEvent ( client, "PlayMovafagh", client )
							local theID = row["pID"]
							local queryFw = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFwarn` = ? WHERE `pID` = '"..theID.."'",0)
							dbFree(queryFw)
							dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = 0 WHERE `pID` = ?", theID)
						end

						local myID = row["pID"]
						local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = ?, `pRank` = ?, `pPunish` = ?, `fSkin` = ? WHERE `pID` = '"..myID.."'",0,0,60,0)
						
						local pTut = row["pTut"]
						if pTut == 2 then
							local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pTut` = ? WHERE `pID` = '"..myID.."'",0)
						end
						if getPlayerFromName(finalPlayerName) then
							local yaruOnlineHast = getPlayerFromName(finalPlayerName)
							setPlayerNametagColor(yaruOnlineHast,255,255,255)
							setElementModel(yaruOnlineHast,getElementData(accSys:getPlayerAcc(yaruOnlineHast),"cSkin"))
							takeAllWeapons(yaruOnlineHast)
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pMember",0)
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pPunish",60)
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pRank",0)
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"fSkin",0)
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pFwarn",0)
							
							setElementData(accSys:getPlayerAcc(yaruOnlineHast),"pTut",0)
							takeAllWeapons ( yaruOnlineHast )
							setPedArmor(yaruOnlineHast, 0)
							removePedFromVehicle( yaruOnlineHast )
							local x,y,z = getElementPosition(yaruOnlineHast)
							setElementPosition ( yaruOnlineHast, x,y,z+2 )
						end
						triggerClientEvent("infoFaction",client,client)
						triggerClientEvent("reloadPageEvent",client,client)
					end
				else
					notfSys:addNotification(client,"Be Leader Mikhay Fw Bedi ?!","error")
					triggerClientEvent ( client, "PlayError", client )
				end
			else
				notfSys:addNotification(client,"Be Khodet Nemituni Fw Bedi!","error")
				triggerClientEvent ( client, "PlayError", client )
			end
		end
	end
end)



addCommandHandler("lhelp", function(thePlayer)
	--if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pClanRank")) == 4 then
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬(#525252 Dastorat Leaderi #d5e3e3)▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
		outputChatBox("#e5ce8e/lc: #ffffffSohbat Kardan Dar Chat Leaderi.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/rv: #ffffffRespawn Kardan Mashin Ha.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/invite: #ffffffDavat Kardan Player Be Faction.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/setfskin: #ffffffSet kardan Skin Player Hay Dakhel Faction.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/setfrank: #ffffffSet kardan Rank Player Hay Dakhel Faction.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/hoqooq: #ffffffDadan hoqooq Be Member Haye Online.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8e/hoqooqref: #ffffffDadane hoqooq Be Member Haye Offline Az Tarighe Id Refrerral.", thePlayer, 0, 255, 255,true)
		outputChatBox("#e5ce8eDokme [f5]: #ffffffBaz Kardan Panel Modiriat Faction.", thePlayer, 0, 255, 255,true)
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)

end)

------==============KhazaneHoghogh-------------
addCommandHandler("sharjkhazane",
function(thePlayer, cmd,FactionID , tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In CMD Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (tedad) and (FactionID) then
		local query1 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `faction` WHERE `fId`=? ;",FactionID )
		local result, numrows = dbPoll(query1, 500)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local query2 = dbQuery(exports.mysql:getMySQLC(),"UPDATE `faction` SET `fKhazane`=? WHERE `fId`=? ;",tonumber(row['fKhazane'])+tonumber(tedad),row['fId'])
				dbPoll(query2, 500)
				SendSystemMasage("Meghdar "..tedad.." Be Khazane Faction "..row['fName'].." Afzode Shod. Zakhire Feli Faction "..row['fName']..": "..tonumber(row['fKhazane'])+tonumber(tedad),thePlayer)
				dbFree(query1)
				dbFree(query2)
			end
		else
			SendSystemMasage("#FF0000 Faction Not Found", thePlayer)
		end
	else
		SendSystemMasage("#C0C0C0Bezan: /sharjkhazane <faction> <Meghdar>", thePlayer)
	end
end)

controlTable = { "fire", "aim_weapon", "next_weapon", "previous_weapon", "zoom_in", "zoom_out",
 "sprint", "look_behind", "crouch", "action", "conversation_yes", "conversation_no",
"group_control_forwards", "group_control_back", "enter_exit", "vehicle_fire", "vehicle_secondary_fire", "vehicle_left", "vehicle_right",
"steer_forward", "steer_back", "accelerate", "brake_reverse", "radio_next", "radio_previous", "radio_user_track_skip", "horn", "sub_mission",
"handbrake", "vehicle_look_left", "vehicle_look_right", "vehicle_look_behind", "vehicle_mouse_look", "special_control_left", "special_control_right",
"special_control_down", "special_control_up" }

controlTable2 = { "fire", "aim_weapon", "next_weapon", "previous_weapon", "forwards", "backwards", "left", "right", "zoom_in", "zoom_out",
"change_camera", "jump", "sprint", "look_behind", "crouch", "action", "walk", "conversation_yes", "conversation_no",
"group_control_forwards", "group_control_back", "enter_exit", "vehicle_fire", "vehicle_secondary_fire", "vehicle_left", "vehicle_right",
"steer_forward", "steer_back", "accelerate", "brake_reverse", "radio_next", "radio_previous", "radio_user_track_skip", "horn", "sub_mission",
"handbrake", "vehicle_look_left", "vehicle_look_right", "vehicle_look_behind", "vehicle_mouse_look", "special_control_left", "special_control_right",
"special_control_down", "special_control_up" }


addCommandHandler("cuff",function(thePlayer,CMD,player)
	local pFaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if pFaction == 1 or pFaction == 2 or pFaction == 3 or pFaction == 5 or pFaction == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		local onDuty = getElementData(thePlayer, "OnDuty") or 0
		if tonumber(onDuty) == 1 then
			if player then
				local find = miscSys:findPlayer ( player )
				if find then
					local x, y, z = getElementPosition( thePlayer )
					local fx, fy, fz = getElementPosition( find )
					local myInt = getElementInterior(thePlayer)
					local myDim = getElementDimension(thePlayer)
					local yourInt = getElementInterior(find)
					local yourDim = getElementDimension(find)
					local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
					if myInt == yourInt and myDim == yourDim and de < 3 then
						if thePlayer ~= find then
							local pFaction = tonumber(getElementData(accSys:getPlayerAcc(find), "pMember"))
							if pFaction ~= 1 or pFaction ~= 2 or pFaction ~= 3 then
								if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) == 0  then
									cuffed = getElementData(find, "pCuffed?") or false

									if cuffed == false then
										setElementData(find,"pCuffed?",true)
										for i=1, #controlTable do
											toggleControl (find, controlTable[i], false)
										end
										triggerClientEvent("PlaySoundForPlayer",find,find,"Data/Cuff/Cuff.mp3")

									elseif cuffed == true then
										for i=1, #controlTable2 do
											setPedAnimation(find,"ped","FLOOR_hit_f",-1,false, false, false, true)
											toggleControl (find, controlTable2[i], false)
										end
										setElementData(player, "pCuffed2?",true)
										triggerClientEvent("PlaySoundForPlayer",find,find,"Data/Cuff/Cuff.mp3")
									end
								else
									notfSys:addNotification(thePlayer, "Admin Ra Nemitavanid Dast Band Bezanid." , 'error')
								end
							else
								notfSys:addNotification(thePlayer, "Shoma Nemitavanid Police Ra Dastband Bezanid." , 'error')
							end
						else
							notfSys:addNotification(thePlayer, "Shoma Nemitavanid Khod Ra Cuff Konid." , 'error')
						end
					end
				end

			end
		else
			notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Dar Halat Anjam Vazife Bashid." , 'error')
		end
	else
		notfSys:addNotification(thePlayer, "Shoma Dastbandi Nadarid!" , 'error')
	end
end)

addCommandHandler("uncuff",function(thePlayer,CMD,player)
	local pFaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if pFaction == 1 or pFaction == 2 or pFaction == 3 or pFaction == 5 or pFaction == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		local onDuty = getElementData(thePlayer, "OnDuty") or 0
		if tonumber(onDuty) == 1 then
			if player then
				local find = miscSys:findPlayer ( player )
				if find then
					if thePlayer ~= find then
						cuffed = getElementData(find, "pCuffed?") or false
						if cuffed == true then
							for i=1, #controlTable2 do
								toggleControl (find, controlTable2[i], true)
							end
							setPedAnimation ( find )
							setElementFrozen(find,false)
							setElementData(find,"pCuffed?",false)
							setElementData(find,"pCuffed2?",false)
							triggerClientEvent("PlaySoundForPlayer",find,find,"Data/Cuff/unCuff.mp3")
						else
							notfSys:addNotification(thePlayer, "In Player Dast Band Nakhorde." , 'error')
						end
					else
						notfSys:addNotification(thePlayer, "Shoma Nemitavanid Khod Ra Un Cuff Konid." , 'error')
					end
				end
			end
		else
			notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Dar Halat Anjam Vazife Bashid." , 'error')
		end
	else
		notfSys:addNotification(thePlayer, "Shoma Klid Dastband Ra Nadarid!" , 'error')
	end
end)

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	cuffed = getElementData(thePlayer, "pCuffed?") or false
	if cuffed == true then
		cancelEvent()
	end
end)

addCommandHandler("cuffnear",function(thePlayer,cmd)
	local pFaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if pFaction == 1 or pFaction == 2 or pFaction == 3 or pFaction == 5 or pFaction == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		player,fasele = tuFindNearestElement(thePlayer,"player",2)
		local onDuty = getElementData(thePlayer, "OnDuty") or 0
		if tonumber(onDuty) == 1 then
			if player then
				local pFaction = tonumber(getElementData(accSys:getPlayerAcc(player), "pMember"))
				if pFaction ~= 1 or pFaction ~= 2 or pFaction ~= 3 then
					if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) == 0  then
						cuffed = getElementData(player, "pCuffed?") or false
						if cuffed == false then
							setElementData(player,"pCuffed?",true)
							triggerClientEvent("PlaySoundForPlayer",player,player,"Data/Cuff/Cuff.mp3")
							for i=1, #controlTable do
								toggleControl (player, controlTable[i], false)
							end
						elseif cuffed == true then
						
							for i=1, #controlTable2 do
								setPedAnimation(player,"ped","FLOOR_hit_f",-1,false, false, false, true)
								toggleControl (player, controlTable2[i], false)

							end
							triggerClientEvent("PlaySoundForPlayer",player,player,"Data/Cuff/Cuff.mp3")
							setElementData(player, "pCuffed2?",true)
						end
					else
						notfSys:addNotification(thePlayer, "Admin Ra Nemitavanid Dast Band Bezanid." , 'error')
					end
				else
					notfSys:addNotification(thePlayer, "Shoma Nemitavanid Police Ra Dastband Bezanid." , 'error')
				end
			end
		else
			notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Dar Halat Anjam Vazife Bashid." , 'error')
		end
	end
end)

addCommandHandler("getcuff",function(thePlayer,cmd,player)
	local pFaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if pFaction == 1 or pFaction == 2 or pFaction == 3 or pFaction == 5 or pFaction == 6 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		if player then
			local find = miscSys:findPlayer ( player )
			if find then
				local onDuty = getElementData(thePlayer, "OnDuty") or 0
				if tonumber(onDuty) == 1 then
					local x, y, z = getElementPosition( thePlayer )
					local fx, fy, fz = getElementPosition( find )
					local myInt = getElementInterior(thePlayer)
					local myDim = getElementDimension(thePlayer)
					local yourInt = getElementInterior(find)
					local yourDim = getElementDimension(find)
					local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
					if myInt == yourInt and myDim == yourDim and de < 3 then
						if thePlayer ~= find then
							if getElementData(find, "pCuffed?") == true then
								local car = getPedOccupiedVehicle(thePlayer)
								if findEmptyCarSeat(car) then
									warpPedIntoVehicle(find,car,findEmptyCarSeat(car))

								end
							else

								notfSys:addNotification(thePlayer, "In Player Dast Band Nakhorde." , 'error')
							end
						else
							notfSys:addNotification(thePlayer, "Shoma Nemitavanid Khod Ra Un Cuff Konid." , 'error')
						end
					else
						notfSys:addNotification(thePlayer, "In Player Az Shoma Kheyli Door Ast." , 'error')
					end
				else
					notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Dar Halat Anjam Vazife Bashid." , 'error')
				end
			end
		end
	end
end)
function uncuffeshkonbadmordan()
	if getElementType(source) == "player" then
		cuffed = getElementData(source, "pCuffed?") or false
		if cuffed == true then
			for i=1, #controlTable2 do
				toggleControl (source, controlTable2[i], true)
			end
			setPedAnimation ( source )
			setElementFrozen(source,false)
			setElementData(source,"pCuffed?",false)
			setElementData(source,"pCuffed2?",false)
		end
	end
end
addEventHandler("onPlayerWasted",root, uncuffeshkonbadmordan)
addEventHandler("onPlayerQuit",root, uncuffeshkonbadmordan)
addEventHandler("onPlayerSpawn",root, uncuffeshkonbadmordan)