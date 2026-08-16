---------------------------------
-------**Script By zezaw**-------
---------------------------------

local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Clear Wanted 40 Min <--
setTimer (function(wanted)
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "loggedIn") == true then
			--> Dar Sorate Dashtane Wanted 1 Time Bede <--
			local wantedDare = getPlayerWantedLevel(v)
				if tonumber(wantedDare) > 0 then
					local ConnectTime = getElementData(accSys:getPlayerAcc(v), "pClearWantedTime")
					local BedeConnectTime = tonumber(ConnectTime) + 1
					setElementData(accSys:getPlayerAcc(v), "pClearWantedTime", tonumber(BedeConnectTime))
				end
			--> Resid Be 42 Daghighe Time 0 She <--
			local ConnectTime = getElementData(accSys:getPlayerAcc(v), "pClearWantedTime")
			if tonumber(ConnectTime) >= 42 then
				setElementData(accSys:getPlayerAcc(v), "pClearWantedTime", 0)
			end
			--> Resid Be 40 Daghighe 1 Wanted Pak She <--
			if tonumber(ConnectTime) == 40 then
				local wantedDare = getPlayerWantedLevel(v)
				local wanted = 1
				if wanted then
					if tonumber(wanted) > 0 then
					local kamkon = tonumber(wantedDare) - tonumber(wanted)
						if tonumber(kamkon) >= 0 then
							setPlayerWantedLevel(v,tonumber(kamkon))
							setElementData(accSys:getPlayerAcc(v), "pWanted", tonumber(kamkon))
							outputChatBox("#00ff00[Tavajoh]: #E9E0CBMamora Daran Gomet Mikonan Yek Wantedet Pak Shod!", v, 191, 192, 194, true)
						end
					end
				end
			end
		end
	end
end, 60000, 0)