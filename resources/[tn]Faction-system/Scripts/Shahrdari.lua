--======== [[ Give Export Needed ]] ========--
local accSys = exports["Accounts-system"]     --
local globalSys = exports["Global"]   --
local mysqlSys = exports["mysql"]			--
dbpTime = 500								--
--==========================================--

addCommandHandler("all",
function(thePlayer, cmd,  ...)
	if  tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then
			if ... then
				local Message = table.concat({ ... }, " ")
				if #Message > 0 then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 7 then
						outputChatBox("#e400ff(( Dolat News )) #FFFFFF- #ff0000[Rahbar MoazamDarkCity ] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 6 then
						outputChatBox("#e400ff(( Dolat News )) #FFFFFF- #17a500[Raiis JomhorDarkCity ] #FFB233<< #ffffff"..Message.." #FFB233>>", getRootElement(), 212, 156, 49,true)
					end
				end
			else
				outputChatBox("#FF0000SYNTAX: /all [Message]", thePlayer, 212, 156, 49,true)
			end
		else
			outputChatBox("#ff0000Error: Baraye Inkar Bayad Rahbar Ya Raiis Jomhor Bashid!", thePlayer, 212, 156, 49,true)
		end
	else
		outputChatBox("#ff0000Error: Baraye Inkar Bayad Ozve Dolati Bashid!", thePlayer, 212, 156, 49,true)
	end
end)


--======= [[ /sadaghe | Scripts ]] =======--
addCommandHandler("sadaghe",
function (thePlayer, command, mablagh)
	if mablagh then
		else
			outputChatBox("#00ff00Bezan: /sadaghe [ mablagh ]", thePlayer, 255, 255, 255, true) 
		end
		---========== ( Fix Bug Money! ) ==========---
		local mablagh = tonumber(mablagh)
		if mablagh < 1 then	
			outputChatBox("#ff0000✖️ #ffffffBayad Hadaqal Sadaghe + 1 Toman Bashe!", thePlayer, 255, 255, 255, true) 
			return 
		end
		
			---========== ( Check Your Money! ) ==========---
			local money = getPlayerMoney(thePlayer)
			local price = tonumber(mablagh)
			if(money < price) then 
				outputChatBox("#ff0000✖️ #ffffffPol Shoma Kafi Nemibashad!", thePlayer, 255, 255, 255, true) 
				return 
			end
			---===========================================---
		if mablagh < 1000000 then
			if mablagh then
			local mablagh = tonumber(mablagh)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM mayor;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
						setGoldTaraf = row['cash'] + mablagh
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat "..mablagh.." Toman Sadaghe Dadi!" , 'success')
						outputChatBox("#00ff00(Kar-Kheyr):#ffffff Shoma Ensan Niko Kari Hastid:) Merci Az Inke #00ff00"..mablagh.."#ffffff Toman Sadaghe Dadi!!", thePlayer, 255, 255, 255, true) 
						takePlayerMoney(thePlayer, mablagh)
						triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
					end
				end
				dbFree(query)
			end
			local yek  = 0
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `mayor` SET `cash` = '"..setGoldTaraf.."' WHERE `name` = 'sadaghe'")
			dbFree(query)
			
			
		elseif mablagh > 999999 then
			if mablagh then
			local mablagh = tonumber(mablagh)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM mayor;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
						setGoldTaraf = row['cash'] + mablagh
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat "..mablagh.." Toman Sadaghe Dadi!" , 'success')
						outputChatBox("#00ff00(Kar-Kheyr):#ffffff Shoma Ensan Servat Mandi Hastid:) Merci Az Inke #00ff00"..mablagh.."#ffffff Toman Sadaghe Dadi!!", thePlayer, 255, 255, 255, true) 
						takePlayerMoney(thePlayer, mablagh)
						triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				outputChatBox("#00ff00[Tavajoh] #FF00FF"..getPlayerName(thePlayer).." Mablagh "..mablagh.." Sadaghe dad!#00ff00 ", hame_Playera, 255, 255, 255, true)
			end
		end
					end
				end
				dbFree(query)
			end
			local yek  = 0
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `mayor` SET `cash` = '"..setGoldTaraf.."' WHERE `name` = 'sadaghe'")
			dbFree(query)
			end



end)
--========================================--

--======= [[ GetPlayers Online | Scripts ]] =======--
function GetPlayerOnline()
	local Players = 0
	for index,playera in ipairs(getElementsByType("player")) do
		if getElementData(playera,"loggedIn") and getElementData(playera,"loggedIn") == true then
			Players = tonumber( Players ) + 1
		end
	end
	return Players
end
--=================================================--


--======= [[ /givetax | Scripts ]] =======--
addCommandHandler("givetax",
function (thePlayer, command, mablagh)
local ponline = tonumber(GetPlayerOnline())
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 then
		if mablagh then
		local mablagh = tonumber(mablagh)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM mayor;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local user = 'sadaghe'
				local pname = row['name']
				if pname == user then
					local cach = row['cash']
					local priz = tonumber(cach)
					local maxi = cach/tonumber(GetPlayerOnline())
					local yaraneh = tonumber(GetPlayerOnline())*tonumber(mablagh)
					local cleared = cach-yaraneh
						if(cach < yaraneh) then 
							outputChatBox("#ff0000✖️ #ffffffMablaghi Ke Vared Kardid Az Daraii Khazane Bishtar Ast!!", thePlayer, 255, 255, 255, true) 
							outputChatBox("#fff000Maximume ="..maxi.."",thePlayer, 255, 255, 255, true) 
								return false
						end
					for k, hame_Playera	in ipairs (getElementsByType("player")) do	
						if getElementData(hame_Playera, "loggedIn") == true then
							local mablagh = tonumber(mablagh)
							givePlayerMoney(hame_Playera, mablagh)
							outputChatBox("#00ff00[Tavajoh] #ffffff Shahrdar #FF00FF"..getPlayerName(thePlayer).." #00ff00Be Tamamie Player Haye Online Nafari #FF00FF"..mablagh.." Toman #00ff00Pool Dad!", hame_Playera, 255, 255, 255, true)
							local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `mayor` SET `cash` = '"..cleared.."' WHERE `name` = 'sadaghe'")
							dbFree(query)
						end
					end
						
				end
			end
		end
		dbFree(query)


	else
		outputChatBox("#00ff00 Bezan: #ffffff/givetax [ Mablagh ]", thePlayer, 255, 255, 255, true) 
	end
	else
		outputChatBox("#ff0000Error:#ffffff Shoma Shahrdar Nistid!", thePlayer, 255, 255, 255, true) 
	end
end)
--========================================--

--======= [[ /taketax | Scripts ]] =======--
addCommandHandler("taketax",
function (thePlayer, command, value)
local ponline = tonumber(GetPlayerOnline())
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 17 then
		if value then
		if tonumber(value) > 9 then
		if tonumber(value) < 101 then
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM mayor;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local user = 'sadaghe'
				local pname = row['name']
				if pname == user then
					local prize = row['cash']
					local Elements = ponline*value
					local SetMoneY = prize+Elements
					local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `mayor` SET `cash` = '"..SetMoneY.."' WHERE `name` = 'sadaghe'")
					dbFree(query)
				end

			end
		end
		dbFree(query)

		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local value = tonumber(value)
				takePlayerMoney(hame_Playera, value)
				outputChatBox("#00ff00[Tavajoh] #00ff00Shahrdar #FF00FF"..getPlayerName(thePlayer).."#00ff00 Az Tamamie Player Haye Online Nafari #FF00FF"..value.." Toman #00ff00Maliat Gereft!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#ff0000✖️ #ffffffMablagh'e Maliat Bayad Kamtar $100 Bashad!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffMablagh'e Maliat Bayad Balaye $10 Bashad!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /taketax <Meghdar>", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Error:#ffffff Shoma Shahrdar Nistid!", thePlayer, 255, 255, 255, true) 
	end
end)
--========================================--

local Factions = {

	{ "#FF00FF Dolat", 255,0,255, 294, 81, 114, 116, 186 },--17
}
addCommandHandler("setdolat",
function(thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 14 then return false end
setElementData(accSys:getPlayerAcc(thePlayer), "cSkin", Factions[1][5])
setElementModel(thePlayer, Factions[1][5])
setElementData(accSys:getPlayerAcc(thePlayer), "pRank", 7)
setElementData(accSys:getPlayerAcc(thePlayer), "pMember", 17)
accSys:setFacP(thePlayer,17)
setPlayerNametagColor ( thePlayer, Factions[1][2], Factions[1][3], Factions[1][4] )

end)

--======= [[ /getkhazane | Scripts ]] =======--
addCommandHandler("getkhazane",
function (thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 17 then return false end
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM mayor;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local user = 'sadaghe'
				local pname = row['name']
				if pname == user then
					local prize = row['cash']
						outputChatBox("#FF00FF(Khazane):#ffffff Mojodi Khazane = #FF00FF"..tonumber(prize).." Toman", thePlayer, 255, 255, 255, true)
				end
			end
		end
		dbFree(query)
end)
--==========================================--