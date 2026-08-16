-- CountDown Server Script --

local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

local LimitOfUse = 1 -- A required delay (in seconds) between uses of countdown (default is 40)
local RadiusOfPlayersInvolved = 30 -- Players who are under this radius (distance from countdown triggerer) will be involved in countdown (default is 30)
local MinCountdownSeconds = 3 -- Minimum countdown seconds (default is 3)
local MaxCountdownSeconds = 20 -- Maximum countdown seconds (default is 12)

function startCountdown(Player, Command, Seconds)
	-- #zezaw
	if getElementData(Player,"eventorganizer") == true or tonumber(getElementData(accSys:getPlayerAcc(Player), "pAdmin")) > 8 then
		if (getElementData(Player, "cdn.countdownSource")) then
			outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Hazer Dar Shomaresh Makos Hastid! Baraye Laghv Bezan: /cstop", Player, 245, 15, 0, true)
		else
			local lastUsed = getElementData(Player, "cdn.lastUsed")
			local currentUse = getRealTime().timestamp
			if (lastUsed) then
				local delayOfUse = currentUse - lastUsed
				if (delayOfUse >= LimitOfUse) then
					initiateCountdown(Player, Command, tonumber(Seconds), currentUse)
				else
					outputChatBox("Bad Az " .. tostring(LimitOfUse - delayOfUse) .. " Sanie Mitavanid Az Shomaresh Estefade Konid!", Player, 255, 215, 0)
				end
			else
				initiateCountdown(Player, Command, tonumber(Seconds), currentUse)
			end
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Event Organizer Nistid!", Player, 255, 215, 0, true)
	end
end
addCommandHandler("etimer", startCountdown)


function stopCountdown(Player)
	local countdownSource = getElementData(Player, "cdn.countdownSource")
	if (countdownSource) then
		setElementData(Player, "cdn.countdownSource", false)
		outputChatBox(getPlayerName(Player) .. "#FFFFFF left your countdown event", countdownSource, 255, 255, 255, true)
	end
end
addCommandHandler("cstop", stopCountdown)

function initiateCountdown(Player, Command, Seconds, currentUse)
	if (Seconds) then
		if ((Seconds >= MinCountdownSeconds) and (Seconds <= MaxCountdownSeconds)) then
			setElementData(Player, "cdn.lastUsed", currentUse)
			setElementData(Player, "cdn.countdownTime", Seconds)
			local Participants = 0
			for _, v in pairs(getElementsByType("player")) do
				local x1, y1, z1 = getElementPosition(Player)
				local x2, y2, z2 = getElementPosition(v)
				if (getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) <= RadiusOfPlayersInvolved) then
					if not (getElementData(v, "cdn.countdownSource")) then
						triggerClientEvent(v, "cdn.countdown_set", resourceRoot, Player)
						Participants = Participants + 1
					end
				end
			end
			outputChatBox("#4BD700☑️ #4BD700Shomaresh Makos Ba " .. tostring(Participants) .. " Sherkat Konande Start Shod!", Player, 75, 215, 0, true)
			setTimer(doCountdown, 1000, Seconds, Player)
		else
			outputChatBox("#ff0000✖️ #ffffffMeghdare Shomaresh Bayad Beyne " .. tostring(MinCountdownSeconds) .. " Ta " .. tostring(MaxCountdownSeconds) .. " Sanie Bashad!", Player, 245, 25, 0, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /".. Command .." <Seconds>", Player, 255, 0, 0, true)
	end
end

function doCountdown(Player)
	local Timer = tonumber(getElementData(Player, "cdn.countdownTime"))
	if (Timer) then
		Timer = Timer - 1
		setElementData(Player, "cdn.countdownTime", Timer)
	end
end