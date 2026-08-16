local accSys = exports["Accounts-system"] -- DarkCity RPG For Ever!
local miscSys = exports["Misc"] -- Telegram: @ExMmD
local gbsys = exports["Global"] -- Telegram: ExMmD

local Factions = {
  --{ "Faction Name", Color R, Color G, Color B, Skin1, Skin2, Skin3, Skin4, Skin5 },
	{ "#2b4c99 Police Department", 0, 85, 255, 281, 265, 267, 280, 298},--1
	{ "#2b4c99 Police Federal", 43, 76, 153, 278, 286, 165, 164, 298 },--2
	{ "#1749c5 National Guard", 23, 73, 197, 80, 285, 295, 287, 298},--3
	{ "#ff7700 Medic", 255, 119, 0, 70, 67, 274, 275, 233 },--4
	{ "#ad2300 Hitman", 173, 35, 0, 186, 294, 220, 277, 195 },--5
	{ "#2c94c4 School", 44, 148, 196, 183, 171, 172, 45 },--6
	{ "#c25857 News Reporter", 194, 88, 87, 306, 296, 188, 147, 55},--7
	{ "#649c9e Mechanic", 100, 156, 158, 305, 268, 7, 50, 69 },--8
	{ "#ffed21 Taxi", 255, 237, 33, 20, 98, 112, 161, 292 },--9
	{ "#babaff Hackers", 186, 186, 255, 290, 57, 58, 122, 38 },--10
	{ "#1e90ff RichMan", 30, 144, 255, 147, 306, 253, 240, 243 },--11
	{ "#018c01 Grove Street Family [ LS ]", 1, 140, 1, 107, 106, 105, 200, 195 },--12
	{ "#9400ff DarkSaints Family ( LS )", 148, 0, 255, 296, 248, 303, 83, 181 },--13
	{ "#ff0010 Gang Family ( LS )", 255, 0, 16, 114, 115, 162, 142, 292 },--14
	{ "#42f5c8 Azertoh Family ( LS )", 66, 245, 200, 45, 84, 249, 72, 154 },--15
	{ "#fec664 FaMouS Fmily ( LV )", 255,255,0, 64, 108, 297, 110, 263 },--16
	{ "#FF00FF Dolat", 255,0,255, 294, 81, 114, 116, 186 },--17
	{ "#191819 Daesh", 100,100,100, 112, 189, 301, 202, 151 },--18
}

local dbpTime = 500

--/leaders
addCommandHandler("leaders",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#00ff00ـــــــــــــــــــــــــList Leader Haye Online ـــــــــــــــــــــــــــ", thePlayer, 23100,100,100 ,true)
		for index, getLeaders in ipairs( getElementsByType("player") ) do 
			if getElementData(getLeaders, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pRank")) == 7 then
				if tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 1 then
					outputChatBox ( "#2b4c99"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Edare Police]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 2 then
					outputChatBox ( "#2b4c99"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Police Federal]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 3 then
					outputChatBox ( "#1749c5"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Gard Melli]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 4 then
					outputChatBox ( "#ff7700"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Pezeshk]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 5 then
					outputChatBox ( "#ad2300"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Hitman]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 6 then
					outputChatBox ( "#2c94c4"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Edare Amozesh Va Morabigari]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 7 then
					outputChatBox ( "#c25857"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Khabar Negar]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 8 then
					outputChatBox ( "#649c9e"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Sherkat Khadamat Khodro]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 9 then
					outputChatBox ( "#ffed21"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Taxi]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 10 then
					outputChatBox ( "#babaff"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Hackers]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 11 then
					outputChatBox ( "#1e90ff "..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Richman]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 12 then
					outputChatBox ( "#018c01"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Grove Street Family]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 13 then
					outputChatBox ( "#9400ff"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [DarkSaints Family]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 14 then
					outputChatBox ( "#ff0010"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Fury Family]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 15 then
					outputChatBox ( "#42f5c8"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Azeroth Family]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 16 then
					outputChatBox ( "#ffe100"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [FaMouS]", thePlayer, 23100,100,100 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getLeaders), "pMember")) == 18 then
					outputChatBox ( "#000000"..getPlayerName(getLeaders).." ("..getElementData(getLeaders, "TarafID")..") [Daesh]", thePlayer, 23100,100,100 ,true)
				end
			end
			end
		end
		outputChatBox ( "#ADFF5Cــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ", thePlayer, 23100,100,100 ,true)
	end
end)


function changeFactionColorSpawn()
	if getElementData(source, "loggedIn") == true then

	if getElementData(accSys:getPlayerAcc(source),"pMember") == 0 then
		setPlayerNametagColor ( source, 255, 255, 255 )
	else
		ID = getElementData(accSys:getPlayerAcc(source),"pMember")
		setPlayerNametagColor ( source, Factions[ID][2], Factions[ID][3], Factions[ID][4] )
	end
	fadeCamera(source, false, 0)
	setCameraTarget ( source )
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
			if tonumber(member) == 0 then
				faction = "#ffffffCivilian"
			else
				faction = Factions[member][1]
			end
			local color = getElementData(accSys:getPlayerAcc(find), "pMember")
			if tonumber(color) == 0 then
				fcolor = "#ffffff"
			elseif tonumber(color) == 1 then
				fcolor = "#70a6ff"
			elseif tonumber(color) == 2 then
				fcolor = "#2b4c99"
			elseif tonumber(color) == 3 then
				fcolor = "#1749c5"
			elseif tonumber(color) == 4 then
				fcolor = "#ff7700"
			elseif tonumber(color) == 5 then
				fcolor = "#ad2300"
			elseif tonumber(color) == 6 then
				fcolor = "#2c94c4"
			elseif tonumber(color) == 7 then
				fcolor = "#c25857"
			elseif tonumber(color) == 8 then
				fcolor = "#649c9e"
			elseif tonumber(color) == 9 then
				fcolor = "#ffed21"
			elseif tonumber(color) == 10 then
				fcolor = "#babaff"
			elseif tonumber(color) == 11 then
				fcolor = "#0000ff"
			elseif tonumber(color) == 12 then
				fcolor = "#018c01"
			elseif tonumber(color) == 13 then
				fcolor = "#9400ff"
			elseif tonumber(color) == 14 then
				fcolor = "#ff0010"
			elseif tonumber(color) == 15 then
				fcolor = "#42f5c8"
			elseif tonumber(color) == 16 then
				fcolor = "#ffe100"
			elseif tonumber(color) == 17 then
				fcolor = "#FF00FF"
			elseif tonumber(color) == 18 then
				fcolor = "#000000"
			end
			local frank = getElementData(accSys:getPlayerAcc(find), "pRank")
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
			elseif tonumber(frank) == 6 and getElementData(accSys:getPlayerAcc(find), "pMember") < 17  then
				rank = "(Sub-Leader)"
			elseif tonumber(frank) == 7 and getElementData(accSys:getPlayerAcc(find), "pMember") < 17 then
				rank = "(Leader)"
			else
				rank = ""
			end
				if getElementData(find, "inSleep") == true then
				Sleep = " [Sleep]"
			else
				Sleep = ""
			end
			
			if getElementData(find, "mining") == true then
				miner = " [Mining...]"
			else
				miner = ""
			end
			
			local ping = getPlayerPing(find)
			local wanteds = getPlayerWantedLevel(find)
			
			local VIP = getElementData(accSys:getPlayerAcc(find), "pAvip")
			if tonumber(VIP) == 0 then
				vipish = ""
			elseif tonumber(VIP) == 1 then
				vipish = "#C0C0C0| #fff000VIP #C0C0C0|"
			end
			
			
			if getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 7 then
				dolati = "#FF00FF[ = Rahbar = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 6 then
				dolati = "#FF00FF[ = Rais Jomhor = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 5 then
				dolati = "#FF00FF[ = Rais Ghove Ghazaie = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 4 then
				dolati = "#FF00FF[ = Vazir Ertebatat = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 3 then
				dolati = "#FF00FF[ = Vazir Omor Khareje = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 2 then
				dolati = "#FF00FF[ = Kdar = ]"
			elseif getElementData(accSys:getPlayerAcc(find), "pMember") == 17 and getElementData(accSys:getPlayerAcc(find), "pRank") == 1 then
				dolati = "#FF00FF[ = Karmand = ]"
			else
				dolati = ""
			end
			
			local tarafid = getElementData(find, "TarafID")
			local level = getElementData(accSys:getPlayerAcc(find), "pLevel")
			local levelID = getElementData(accSys:getPlayerAcc(find), "pID")
			outputChatBox("#C0C0C0ID: "..tarafid.." | Name: "..fcolor..""..getPlayerName(find).." #C0C0C0| Refferal: "..levelID.." | Age: "..level.." | Faction: "..fcolor..""..faction..""..rank.." "..dolati.."#ffffff Ping: "..ping.."#000000"..Sleep..""..vipish.." #fff000"..miner.."", thePlayer, 255, 255, 255, true)
		else
		outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	else
	outputChatBox("#C0C0C0Syntax: /id <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
	end
)




addCommandHandler("makemember",
	function ( thePlayer, command, player, factionID )
		local adminlevel = getElementData(thePlayer, "pAdmin")
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
			outputChatBox("[Error]: Shoma Rank Kafi Baraye Estefade Az In Dastoor Ra Nadarid!", thePlayer, 230, 0, 0, true)
			return false
		end

		local find = miscSys:findPlayer ( player )
		if find then
			factionID = tonumber( factionID)
				if factionID == 0 then
					setElementData(accSys:getPlayerAcc(find), "pMember", 0)
					setElementData(accSys:getPlayerAcc(find), "pRank", 0)
					setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "cSkin")))
					setPlayerNametagColor(find,255,255,255)
					outputChatBox("#00ff00[Done]: #ffffffShoma Player #ffff00"..getPlayerName(find).."#ffffff Ra ".."Civilian".." #ffffffKardid!.", thePlayer, 0, 255, 0, true)
					outputChatBox("#00ff00[Info]: #ffffffShoma Tavasot Admin #ffff00"..getPlayerName(thePlayer).."#ffffff Be ".."Civilian".." #ffffffTabdil Shodid.", find, 255, 0, 255, true)
					if getElementData(accSys:getPlayerAcc(find),"pTut") == 1 then
						setElementData(accSys:getPlayerAcc(find), "pTut", 0)
						exports["notf"]:addNotification(find, "Shoma Dige Faction Nadarid Pas Spawn Location Shoma Be Civilian Set Shod!" , 'info')
					end
				elseif factionID > 0 and factionID < 17 then
					setElementData(accSys:getPlayerAcc(find), "pMember", factionID)
					setPlayerNametagColor ( find, Factions[factionID][2], Factions[factionID][3], Factions[factionID][4] )
					outputChatBox("#00ff00[Done]: #ffffffShoma Player #ffff00"..getPlayerName(find).."#ffffff Ra "..Factions[factionID][1].." #ffffffKardid!.", thePlayer, 0, 255, 0, true)
					outputChatBox("#00ff00[Info]: #ffffffShoma Tavasot Admin #ffff00"..getPlayerName(thePlayer).."#ffffff Be "..Factions[factionID][1].." #ffffffTabdil Shodid.", find, 255, 0, 255, true)
					setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[factionID][5])
					setElementModel(find, Factions[factionID][5])
					setElementData(accSys:getPlayerAcc(find), "pRank", 1)
				else
					outputChatBox("#ff0000Invalid FactionID!", thePlayer, 255, 0, 0, true)
					outputChatBox("#ffff00Baraye Didan ID Faction Ha #00ff00/fi #ffff00Bezanid!", thePlayer, 255, 0, 255, true)
				end
		else
			outputChatBox("Player Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
	end
)

	function mleader ( thePlayer, command, player, factionID )
		local adminlevel = getElementData(thePlayer, "pAdmin")
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
			outputChatBox("[Error]: Shoma Rank Kafi Baraye Estefade Az In Dastoor Ra Nadarid!", thePlayer, 230, 0, 0, true)
			return false
		end

		local find = miscSys:findPlayer ( player )
		if find then
			factionID = tonumber( factionID)
				if factionID > 0 and factionID < 19 then
					setElementData(accSys:getPlayerAcc(find), "pMember", factionID)
					setPlayerNametagColor ( find, Factions[factionID][2], Factions[factionID][3], Factions[factionID][4] )
					outputChatBox("#00ff00[Done]: #ffffffShoma Player #ffff00"..getPlayerName(find).."#ffffff Ra Leadere "..Factions[factionID][1].." #ffffffKardid!.", thePlayer, 0, 255, 0, true)
					outputChatBox("#00ff00[Info]: #ffffffShoma Tavasot Admin #ffff00"..getPlayerName(thePlayer).."#ffffff Be Leadere "..Factions[factionID][1].." #ffffffTabdil Shodid.", find, 255, 0, 255, true)
					setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[factionID][5])
					setElementModel(find, Factions[factionID][5])
					setElementData(accSys:getPlayerAcc(find), "pRank", 7)
					accSys:setFacP(find,factionID)
				else
					outputChatBox("#ff0000Invalid FactionID!", thePlayer, 255, 0, 0, true)
					outputChatBox("#ffff00Baraye Didan ID Faction Ha #00ff00/fi #ffff00Bezanid!", thePlayer, 255, 0, 255, true)
				end
		else
			outputChatBox("Player Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
	end
addCommandHandler("ml", mleader)
addCommandHandler("makeleader", mleader)



function demoteLeaderFaction ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5  then
			outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 230, 0, 0, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pRank")) == 7 then
					local targetPlayer = getPlayerName ( find )
					setElementData(accSys:getPlayerAcc(find), "pMember", 0)
					setElementData(accSys:getPlayerAcc(find), "pRank", 0)
					setPlayerNametagColor ( find, 255, 255, 255 )
					accSys:setFacP(find,0)
					setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "cSkin")))
					outputChatBox("#00ff00[Done]: #ffffffShoma #00ff00"..targetPlayer.." #ffffffRa Be #00ff00Civilian #ffffffDavat Kardid!", thePlayer, 0, 255, 0, true)
					outputChatBox("#ffffffShoma Tavasote "..getPlayerName(thePlayer).." Be Civilian Davat Shodid!", find, 255, 0, 255, true)
				else
					outputChatBox("#ff0000[Error]: #ffffffIn Player Ke Leader Nist!", thePlayer, 255, 255, 255, true)
				end
				else
					outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 0, 0, true)
				end
		else
			outputChatBox("#C0C0C0Syntax: /ldemote <PartOfName/ID> <Faction-ID>", thePlayer, 255, 22, 22, true)
		end
	end
addCommandHandler("ldemote", demoteLeaderFaction)




addCommandHandler("asetfrank",
	function ( thePlayer, command, player, rankID )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
			outputChatBox("[Error]: Shoma Rank Kafi Baraye Estefade Az In Dastoor Ra Nadarid!", thePlayer, 230, 0, 0, true)
			return false
		end
		
		local find = miscSys:findPlayer ( player )
		if find then
			rankID = tonumber( rankID)
			if rankID > 0 and rankID < 8 then
				local targetPlayer = getPlayerName ( find )
				setElementData(accSys:getPlayerAcc(find), "pRank", rankID)
				outputChatBox("#00ff00Shoma Player "..targetPlayer.." Ra #ff00ffFaction Ranke "..rankID.." #00ff00Kardid!.", thePlayer, 0, 255, 0, true)
				outputChatBox("#00ff00Shoma Tavasot Admin "..getPlayerName(thePlayer).." Be #ff00ffFaction Ranke "..rankID.." #00ff00Tabdil Shodid.", find, 255, 0, 255, true)
			else
				outputChatBox("#ff0000Invalid RankID! #ffff00(RankID : <1~7>", thePlayer, 255, 0, 0, true)
				
			end
		else
			outputChatBox("Player Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
	end
)

--setfSkin
addCommandHandler("setfskin",
function (thePlayer, command, target, skinID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) >= 6 then
			local find = miscSys:findPlayer( target )
			if find then
				local skinID = tonumber(skinID)
				if skinID then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) then
						if skinID == 1 then
							setElementModel(find, Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][5])
							setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][5])
							exports["notf"]:addNotification(find, "Skin Shoma Tavasot "..getPlayerName(thePlayer).." Be (1) Taghir Yaft!" , 'success')
							exports["notf"]:addNotification(thePlayer, "Skin "..getPlayerName(find).." Be (1) Taghir Yaft!" , 'info')
						elseif skinID == 2 then
							setElementModel(find, Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][6])
							setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][6])
							exports["notf"]:addNotification(find, "Skin Shoma Tavasot "..getPlayerName(thePlayer).." Be (2) Taghir Yaft!" , 'success')
							exports["notf"]:addNotification(thePlayer, "Skin "..getPlayerName(find).." Be (2) Taghir Yaft!" , 'info')
						elseif skinID == 3 then
							setElementModel(find, Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][7])
							setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][7])
							exports["notf"]:addNotification(find, "Skin Shoma Tavasot "..getPlayerName(thePlayer).." Be (3) Taghir Yaft!" , 'success')
							exports["notf"]:addNotification(thePlayer, "Skin "..getPlayerName(find).." Be (3) Taghir Yaft!" , 'info')
						elseif skinID == 4 then
							setElementModel(find, Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][8])
							setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][8])
							exports["notf"]:addNotification(find, "Skin Shoma Tavasot "..getPlayerName(thePlayer).." Be (4) Taghir Yaft!" , 'success')
							exports["notf"]:addNotification(thePlayer, "Skin "..getPlayerName(find).." Be (4) Taghir Yaft!" , 'info')
						elseif skinID == 5 then
							setElementModel(find, Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][9])
							setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[getElementData(accSys:getPlayerAcc(thePlayer), "pMember")][9])
							exports["notf"]:addNotification(find, "Skin Shoma Tavasot "..getPlayerName(thePlayer).." Be (5) Taghir Yaft!" , 'success')
							exports["notf"]:addNotification(thePlayer, "Skin "..getPlayerName(find).." Be (5) Taghir Yaft!" , 'info')
						else
							outputChatBox("#ff0000Error: Skin ID < 1 - 5 >", thePlayer, 230, 0, 0, true)
						end
					else
						outputChatBox("#ff0000Error: In Player To Faction Shoma Nist!", thePlayer, 230, 0, 0, true)
					end
				else
					outputChatBox("#ff0000Error: Bezan /setfskin <partofname> <SKINID>", thePlayer, 230, 0, 0, true)
				end
			else
				outputChatBox("#ff0000Error: Player Peyda Nashod!", thePlayer, 230, 0, 0, true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Lazem Ast Leader/Co-Leader Bashid!", thePlayer, 230, 0, 0, true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Inkar Lazem Ast Dar Faction Bashid!", thePlayer, 230, 0, 0, true)
	end
end)

--gov Chat /gov
addCommandHandler("gov",
function(thePlayer, cmd,  ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then
			if ... then
				local Message = table.concat({ ... }, " ")
				if #Message > 0 then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 then
						outputChatBox("#FFB233(( Government )) #FFFFFF- #FFB233[Police Department] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2	then
						outputChatBox("#FFB233(( Government )) #FFFFFF- #FFB233[Police Federal] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
						outputChatBox("#FFB233(( Government )) #FFFFFF- #FFB233[National Guard] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
						outputChatBox("#FFB233(( Government )) #FFFFFF- #FFB233[Medic] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 7 then
						outputChatBox("#FFB233(( Government )) #FFFFFF- #FFB233[News Reporter] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					end
				end
			else
				outputChatBox("#FF0000SYNTAX: /gov [Message]", thePlayer, 212, 156, 49,true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Leader Ya Co-Leader Bashid!", thePlayer, 212, 156, 49,true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Faction Haye Dolati Bashid!", thePlayer, 212, 156, 49,true)
	end
end)



addCommandHandler("fi",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		outputChatBox("#FFFFFF---------------------------------------------------", thePlayer, 255, 255, 255, true)
		for i=1,21 do
			outputChatBox(" "..Factions[i][1].." - "..i.." ", thePlayer, 255, 255, 255, true)
		end
		outputChatBox("#FFFFFF---------------------------------------------------", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
	end
end)
function ShowFactionHelp(thePlayer, command)
	factionID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if factionID == 0 then
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Yek Faction Bashid!", thePlayer, 212, 156, 49,true)
		return false
	end
	if factionID > 0 then
		factionName = Factions[factionID][1]
		r = Factions[factionID][2]
		g = Factions[factionID][3]
		b = Factions[factionID][4]
		outputChatBox("-------------------------------------------------------------- ", thePlayer, r, g, b, true)
		outputChatBox("                Faction:  "..factionName.."", thePlayer, r, g, b, true)
	end
	
	if factionID == 1 or factionID == 2 or factionID == 3 then
		outputChatBox("#bababa /wanteds #ffffff Moshahede List Wanted Ha", thePlayer, 255, 255, 255, true)	
		outputChatBox("#bababa /cuff #ffffff Dastgir Kardan Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /arrest #ffffff Ferestadan Player Be Zendan", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa [Z] Dar Location Duty #ffffff Halat Anjam Vazife", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa [Z] Dar Location Order #ffffff Gereftn Aslahe Az HQ", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /take #ffffff Gereftn Chizi Az Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /ram #ffffff Vorood Be Khane", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /b #ffffff Sohbat Dar Bisim Dakheli", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /d #ffffff Sohbat Dar Bisim Markazi", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /find #ffffff Peyda Kardan Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /m #ffffff Sohbat Dar Bolandgoo", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /pelak #ffffff Faal Kardan Halat Didan Pelak Ha Ba Click", thePlayer, 255, 255, 255, true)
	elseif factionID == 4 then
		outputChatBox("#bababa /heal#ffffff Heal Dadan Be Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /duty#ffffff Halat Anjam Vazife", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /aservice#ffffff Qabool Kardan Service", thePlayer, 255, 255, 255, true)
	elseif factionID == 5 then
		outputChatBox("#bababa /contracts#ffffff Moshahede List Player Hai Ke Bayad Koshte Shavand", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /duty#ffffff Halat Anjam Vazife", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /order#ffffff Gereftan Gun Az Hq", thePlayer, 255, 255, 255, true)
	elseif factionID == 6 then
		outputChatBox("#bababa Agar in Matn Ra Mibnid /report Dahid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /gl <PartOfName/ID> <fly~sail~mat~gun>", thePlayer, 255, 255, 255, true)
	elseif factionID == 7 then
		outputChatBox("#bababa /camera#ffffff Gereftn Doorbin Akasi", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /news#ffffff Gozashtan Tabliqat", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /topic#ffffff Gozashtan Akhbar", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /startlive#ffffff Gozashtan Pakhsh Zende", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /stoplive#ffffff Payan Pakhsh Zende", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /cl#ffffff Chat Dakhel Live", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /invitelive#ffffff Invite Dadan Player Be Live ", thePlayer, 255, 255, 255, true)
	elseif factionID == 8 then
		outputChatBox("#bababa /tune#ffffff Sport Kardan Mashin", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /aservice#ffffff Qabool Kardan Dakhast", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /refill#ffffff Benzin Zadan Mashin", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /fixveh ID#ffffff Fix Kardan Mashin", thePlayer, 255, 255, 255, true)
	elseif factionID == 9 then
		outputChatBox("#bababa /aservice#ffffff Qabool Kardan Darkhast", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /carry#ffffff Darkhast Keraye Taxi", thePlayer, 255, 255, 255, true)
	elseif factionID == 10 then
		outputChatBox("#bababa Agar in Matn Ra Mibnid /report Dahid!", thePlayer, 255, 255, 255, true)
	elseif factionID == 11 or factionID == 12 or factionID == 13 or factionID == 14 or factionID == 15  then
		outputChatBox("#bababa Dokme F4#ffffff Baz Kardan Menu Mafia", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /order#ffffff Gereftan Gun Az Hq", thePlayer, 255, 255, 255, true)
	elseif factionID == 22 then
		outputChatBox("#bababa /givetax [Mablagh] #ffffff Dadane Yarane Be Player Haye Online", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /taketax [Mablagh] #ffffff Gereftan Maliat Az Player", thePlayer, 255, 255, 255, true)
		outputChatBox("#bababa /getkhazane #ffffff Namayesh Vaziat Khazane", thePlayer, 255, 255, 255, true)
	end
	
	if factionID == 3 then
		outputChatBox("#bababa /og #ffffff Baz Kardan Dar Selool", thePlayer, 255, 255, 255, true)
	end
	
	if factionID > 3 then
		outputChatBox("#bababa /f #ffffff Sohbat Dar Chat Faction", thePlayer, 255, 255, 255, true)
	end
	outputChatBox("#bababa /invite #ffffff Invite Dadan Be Player", thePlayer, 255, 255, 255, true)
	outputChatBox("#bababa /setfrank #ffffff Avaz Kardan Rank Player", thePlayer, 255, 255, 255, true)
	outputChatBox("#bababa /rv #ffffff Respawn Kardan Mashin Haye Faction", thePlayer, 255, 255, 255, true)
	outputChatBox("#bababa /uninvite #ffffff Ekhraj Player Az Faction", thePlayer, 255, 255, 255, true)
	outputChatBox("#bababa Dokme F2  #ffffff Baz Shodan Panel Modiriyat Faction [ Leader/Co Leader]", thePlayer, 255, 255, 255, true)
	if factionID > 0 then
		r = Factions[factionID][2]
		g = Factions[factionID][3]
		b = Factions[factionID][4]
		outputChatBox("-------------------------------------------------------------- ", thePlayer, r, g, b, true)
	end
end
addCommandHandler("fhelp", ShowFactionHelp)




function InvitePlayer( thePlayer, command, player)
	local rank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
	local faction = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
	if tonumber(faction) == 0 then
		outputChatBox("#ff0000Shoma Dar Factioni Nistid!", thePlayer, 212, 156, 49,true)
		return false
	end
	if tonumber(rank) <= 5 then
		outputChatBox("#ff0000Shoma Baraye inkar Bayad Leader Ya Co-Leader Bashid!", thePlayer, 212, 156, 49,true)
		return false
	end
	if player == nil then
		outputChatBox("#ff0000Bezan: /"..command.." <PartOfName/ID>", thePlayer, 212, 156, 49,true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if not find then
		outputChatBox("#ff0000Player Mored Nazar Yaft Nashod!", thePlayer, 212, 156, 49,true)
		return false
	end
	if find == thePlayer then
		outputChatBox("#ff0000Khodeto ke Nmitooni Invite Bedi!", thePlayer, 212, 156, 49,true)
		return false
	end
	local inFaction = getElementData(accSys:getPlayerAcc(find), "pMember")
	local factionPunish = getElementData(accSys:getPlayerAcc(find), "pPunish")
	if tonumber(inFaction) > 0 then
		outputChatBox("#ff0000Player Mored Nazar Dakhel Faction Hast!", thePlayer, 212, 156, 49,true)
		return false
	end
	if tonumber(factionPunish) > 0 then
		outputChatBox("#ff0000Player Mored Nazar Faction Punish Darad!", thePlayer, 212, 156, 49,true)
		return false
	end
	setElementData(accSys:getPlayerAcc(find), "pMember", tonumber(faction))
	setElementData(accSys:getPlayerAcc(find), "pRank", 1)
	outputChatBox("#00ff00(Faction-System): #ffFFffShoma Player #d1d3d6"..getPlayerName(find).." #ffFFffRa Be Faction Khod Davat Kardid!", thePlayer, 212, 156, 49,true)
	outputChatBox("#00ff00(Faction-System): #ffFFffTabrik!! Shoma Tavasot #d1d3d6"..getPlayerName(thePlayer).." #ffFFffBe Faction "..Factions[tonumber(faction)][1].." #ffFFff Davat Shodid!!", find, 212, 156, 49,true)
	setElementData(accSys:getPlayerAcc(find), "fSkin", Factions[tonumber(faction)][5])
	setElementModel(find, Factions[tonumber(faction)][5])
	setPlayerNametagColor ( find, Factions[tonumber(faction)][2], Factions[tonumber(faction)][3], Factions[tonumber(faction)][4] )
	accSys:setFacP(find,tonumber(faction))
end
addCommandHandler("invite",InvitePlayer)



addCommandHandler("setfrank",
	function ( thePlayer, command, player, rankID )
		rank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
		local faction = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
		if tonumber(faction) == 0 then
			outputChatBox("#ff0000Shoma Dar Factioni Nistid!", thePlayer, 212, 156, 49,true)
			return false
		end
		if tonumber(rank) < 6 then
			outputChatBox("#ff0000Shoma Baraye inkar Bayad Leader Ya Co-Leader Bashid!", thePlayer, 212, 156, 49,true)
			return false
		end
		if not player then
			outputChatBox("#ff0000Bezan: /setfrank <PartOfName/ID> <1~6>", thePlayer, 255, 0, 0, true)
			return false
		end
		local find = miscSys:findPlayer ( player )
		if not find or find == thePlayer then
			outputChatBox("#ff0000Player Peyda Nashod!", thePlayer, 212, 156, 49,true)
			return false
		end
		rankID = tonumber( rankID)
		playerMember = getElementData(accSys:getPlayerAcc(find), "pMember")
		member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
		playerRank = getElementData(accSys:getPlayerAcc(find), "pRank")
		name = getPlayerName(thePlayer)
		playerName = getPlayerName(find)
			if find then
				if tonumber(member) == tonumber(playerMember) then 
					if tonumber(rank) > tonumber(playerRank) then 
						if rankID > 0 and rankID < 7 then
							local targetPlayer = getPlayerName ( find )
							setElementData(accSys:getPlayerAcc(find), "pRank", rankID)
							outputChatBox("#00ff00(Faction-System): #ffFFffShoma Rank Player #d1d3d6"..getPlayerName(find).." #ffFFffRa Be #d1d3d6("..rankID..") #ffffffTaghir Dadid! ", thePlayer, 212, 156, 49,true)
							outputChatBox("#00ff00(Faction-System): #ffFFffRank Shoma Tavasot #d1d3d6"..getPlayerName(thePlayer).." #ffFFffBe #d1d3d6("..rankID..") #ffffffTaghir Kard! ", find, 212, 156, 49,true)
						else
							outputChatBox("#ff0000Bezan: /setfrank <PartOfName/ID> <1~6>", thePlayer, 255, 0, 0, true)
						end
					else
						outputChatBox("Shoma Nemitavanid In Player Ra Set Rank Konid!", thePlayer, 255, 22, 22, true)
					end
				else
					outputChatBox("#ff0000In Player Dakhel Faction Shoma Nmibashad!", thePlayer, 212, 156, 49,true)
				end
			else
				outputChatBox("#ff0000Player Mored Nazar Yaft Nashod!", thePlayer, 212, 156, 49,true)
			end

	end
)




-- SellKit
--[[
local accSys = exports["[Atis]Accounts"] -- Public By Arlixx 
local miscSys = exports["[Atis]Misc"] -- Telegram: @EnixGame
local InvSys = exports["[Atis]Inventory"]

addCommandHandler("sellkit",
function ( thePlayer, command, player)
	local MyFaction = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
	if MyFaction ~= 3 and MyFaction ~= 4 and MyFaction ~= 8 then
		outputChatBox("#ff7700Baraye Inkar Bayad Ozv Faction NationalGuard/Medic/Mechanic Bashid!", thePlayer, 255, 255, 255, true)
		return
	end
	if not player then
		outputChatBox("#ff7700Bezan: /sellkit <partOfName/ID>", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer ( player )
	if find ~= thePlayer then 
		local x, y, z = getElementPosition( thePlayer )
		local fx, fy, fz = getElementPosition( find )
		local myInt = getElementInterior(thePlayer)
		local myDim = getElementDimension(thePlayer)
		local yourInt = getElementInterior(find)
		local yourDim = getElementDimension(find)
		local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
		if de < 10 then
			if myInt == yourInt and myDim == yourDim then
				local targetPlayer = getPlayerName ( find )
				if tostring(getElementData(find, "InKitReq")) ~= getPlayerName(thePlayer) then
					local KitSeller = getPlayerName(thePlayer)
					setElementData(find, "InKitReq", tostring(KitSeller),false)
					outputChatBox("#03adfc[Kit]:#ffffff Player #03adfc"..getPlayerName(thePlayer).." #ffffffMikhahad Be Shoma Kit Befroshad!", find, 0, 255, 0,true)
					if MyFaction == 3 then
						outputChatBox("#03adfc[Kit]:#ffffff Baraye Accept Kardan Approval Az #03adfc/akit#ffffff Estefade Konid! #03adfc[Hazine: 20,000$]", find, 0, 255, 0,true)
					elseif MyFaction == 4 then
						outputChatBox("#03adfc[Kit]:#ffffff Baraye Accept Kardan Medic Kit Az #03adfc/akit#ffffff Estefade Konid! #03adfc[Hazine: 1,000$]", find, 0, 255, 0,true)
					elseif MyFaction == 8 then
						outputChatBox("#03adfc[Kit]:#ffffff Baraye Accept Kardan Repair Kit Az #03adfc/akit#ffffff Estefade Konid! #03adfc[Hazine: 5,000$]", find, 0, 255, 0,true)
					end
						outputChatBox("#03adfc[Kit]:#ffffff Darkhaste Foroshe Kit Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
					setTimer(
					function()
						if getElementData(find, "InKitReq") ~= nil then
							setElementData(find , "InKitReq", nil)
							outputChatBox("#03adfc[Kit]:#ffffff Darkhast Pas Az 15sec Tavasote Server Rad Shod! ", find, 0, 255, 0,true)
							outputChatBox("#03adfc[Kit]:#ffffff Darkhast'e Heale Player "..getPlayerName(find).." Pas Az 15sec Tavasote Server Rad Shod! ", thePlayer, 0, 255, 0,true)
						end
					end , 15000, 1)
				else
					outputChatBox("#ff0000Error: Darkhast Shoma Baraye In Player Ferestade Shode Ast, Montazer Bemanid Ta Accept Konad!", thePlayer, 0, 255, 0,true)
				end
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#ff0000Error: Player Yaft Nashod!", thePlayer, 0, 255, 0,true)
	end
end)

addCommandHandler("akit",
function(thePlayer, cmd)
	if getElementData(thePlayer, "InKitReq") == nil then
		outputChatBox("#03adfc[Kit]: #ffffffShoma Darkhaste Kit Nadarid!, #03adfc/service #ffffffBaraye Darkhast Service!", thePlayer, 255, 255, 255, true)
		return
	end
	local taraf = getElementData(thePlayer, "InKitReq")
	local find = miscSys:findPlayer(taraf)
	if find then
		local x, y, z = getElementPosition( thePlayer )
		local fx, fy, fz = getElementPosition( find )
		local myInt = getElementInterior(thePlayer)
		local myDim = getElementDimension(thePlayer)
		local yourInt = getElementInterior(find)
		local yourDim = getElementDimension(find)
		local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
		if de < fasele then
			if myInt == yourInt and myDim == yourDim then
				local money = getPlayerMoney (thePlayer)
				local Faction = tonumber(getElementData(accSys:getPlayerAcc(find), "pMember"))
				local ReqMoney = 0
				local Item = 0
				if Faction == 3 then
					ReqMoney = 20000
					if tonumber(money) < ReqMoney then
						outputChatBox("#03adfc[Kit]: #ffffffShoma Pool Lazem Baraye In Kit Ra Nadarid! ( 20,000$ )", thePlayer, 255, 255, 255, true)
						return
					else
						Item = 38
					end
				elseif Faction == 4 then
					ReqMoney = 1000
					if tonumber(money) < ReqMoney then
						outputChatBox("#03adfc[Kit]: #ffffffShoma Pool Lazem Baraye In Kit Ra Nadarid! ( 1,000$ )", thePlayer, 255, 255, 255, true)
						return
					else
						Item = 21
					end
				elseif Faction == 8 then
					ReqMoney = 5000
					if tonumber(money) < ReqMoney then
						outputChatBox("#03adfc[Kit]: #ffffffShoma Pool Lazem Baraye In Kit Ra Nadarid! ( 5,000$ )", thePlayer, 255, 255, 255, true)
						return
					else
						Item = 22
					end
				end
				local GaveItem = InvSys:GivePlayerItem( thePlayer , Item )
				if GaveItem then
					local NexterMoney = ReqMoney / 2
					outputChatBox("#03adfc[Kit]: #ffffffShoma Darkhast Kharid Kit Ra Accept Kardid! -"..ReqMoney.."$", thePlayer, 255, 255, 255, true)
					outputChatBox("#03adfc[Kit]: #ffffffPlayer "..getPlayerName(thePlayer).." Darkhast Kite Shoma Ra Accept Kard! +"..NexterMoney.."$", find, 255, 255, 255, true)
					takePlayerMoney( thePlayer, ReqMoney )
					givePlayerMoney( find , NexterMoney )
				else	
					outputChatBox("#ff0000Error: Inventory Shoma Slot Khali Nadarad!", thePlayer, 255, 255, 255, true)
				end
				setElementData(thePlayer ,"InKitReq", nil)
			else
				outputChatBox("#ff0000Error: Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 0, 255, 0,true)
		end
	end
end)
--]]
