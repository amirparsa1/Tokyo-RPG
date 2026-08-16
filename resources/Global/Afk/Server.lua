AFK_TIME = 30 -- Player Chand Dqiqe AFK Bashe Ta Kick Beshe?
AFK_TIMEWanted = 10 -- Player Age Wanted Dasht Chand Dqiqe AFK Bashe Ta Kick Beshe? #zezaw
AFK_TIMES = 1 -- Chand Bar Bas AFK Budane Player Tashkhis Dade Beshe Ta Kick She?
SHOW,AFK_MSG = true -- Be Player Message Bede Ke AFK Hastid?
msgs = true -- Hoshdare AFK Tu Chat Box Biad?
-----------

function startCheck()
	checkTimer = setTimer ( function()
		for i,m in ipairs ( getElementsByType("player") ) do
			if getElementData(m, "loggedIn") == true then
				local wantedDare = getPlayerWantedLevel(m)
				if tonumber(wantedDare) == 0 then
					local idle = getPlayerIdleTime(m)
					if tonumber(idle) >= AFK_TIME * 60 * 1000 then
						if not isPlayerAfk(m) then
							-- the player is afk
							triggerEvent("onPlayerAfk",m,m,idle)
						end
					else
						local afk = isPlayerAfk(m)
						if ( afk == true ) then
							triggerEvent("onPlayerAfkBack",m,m)
						end
					end
				else
					-- For Wanted --
					local idle = getPlayerIdleTime(m)
					if tonumber(idle) >= AFK_TIMEWanted * 60 * 1000 then --#zezaw
						if not isPlayerAfk(m) then
							-- the player is afk
							triggerEvent("onPlayerAfk",m,m,idle)
						end
					else
						local afk = isPlayerAfk(m)
						if ( afk == true ) then
							triggerEvent("onPlayerAfkBack",m,m)
						end
					end
				end
			end
		end
	end , 1000 , 0 )
end
addEventHandler("onResourceStart",resourceRoot,startCheck)

addEvent("onPlayerAfk",true)
addEventHandler("onPlayerAfk",root,function ( Player , Time )
	------
	if SHOW then
		if ( tostring ( AFK_MSG ) ) then
			showAfkMessage(Player,true)
		end
	end
	------
	setPlayerAfk(Player,true)
	------
	
end )

addEvent("onPlayerAfkBack",true)
addEventHandler("onPlayerAfkBack",root,function ( Player  )
	setPlayerAfk(source,false)
	------
	showAfkMessage(source,false)
	------
end )


function isPlayerAfk(Player)
	local afk = getElementData(Player,"State-AFK") or false
	return afk
end

function setPlayerAfk(Player,state)
	setElementData(Player,"State-AFK",state or false)
end

function showAfkMessage(Player,state)
		if state == true then ev = "YouAreAFK" else ev = "YouAreNotAFK" end
		triggerClientEvent(Player,tostring(ev) or "YouAreAFK",Player)
end

function onAfkEnd(Player)
	Player = Player or source
	if getElementData(source, "loggedIn") == true then -- Edward Gi Warning ** Fix The Bug ;D #Hosh-Siah 
		if getPlayerName(source) ~= "Edward" and getPlayerName(source) ~= "zezaw" then
			--
			if getElementData(source, "inSleep") ~= true then
			local wantedDare = getPlayerWantedLevel(source)
			local namesh = getPlayerName ( source )
			if tonumber(wantedDare) == 0 then
				setElementData(Player,"AFKtime",getElementData(Player,"AFKtime") + 30 )
				local afkTimes = getElementData(Player,"AFKtime")
				if ( afkTimes and afkTimes >= AFK_TIMES ) then
					kickPlayer(Player,"Shoma Bish Az "..tonumber(AFK_TIME).." Daghighe AFK Bodid!")
					--if msgs then
					outputChatBox("** [AFK Bot] #FFFF00Player ".. namesh .."#FFFF00 Pas Az "..afkTimes.." Daghighe AFK Kick Shod! #FF0000**",root,255,0,0,true)	end	
				--end
			else
				setElementData(Player,"AFKtime",getElementData(Player,"AFKtime") + 10 )
				local afkTimes = getElementData(Player,"AFKtime")
				if ( afkTimes and afkTimes >= AFK_TIMES ) then
					kickPlayer(Player,"Shoma Ba Wanted Bish Az "..tonumber(AFK_TIMEWanted).." Daghighe AFK Bodid!")
					--if msgs then
					outputChatBox("** [AFK Bot] #FFFF00Player ".. namesh .."#FFFF00 Pas Az "..afkTimes.." Daghighe AFK Ba Wanted Kick Shod! #FF0000**",player,255,0,0,true)	end	
				--end
			end
			end
		end
	end
end
addEvent("KillAFK",true)
addEventHandler("KillAFK",root,onAfkEnd)