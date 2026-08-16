---------------------------------
-------**Script By zezaw**-------
---------------------------------

local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

--> Play Time Har 1 Saat Yeki Bede <--
setTimer (function()
	for k, v in ipairs(getElementsByType("player")) do
		if getElementData(v, "loggedIn") == true then
			local PlayTime = getElementData(accSys:getPlayerAcc(v), "pPlayTime")
			local BedePlayTime = tonumber(PlayTime) + 1
			setElementData(accSys:getPlayerAcc(v), "pPlayTime", tonumber(BedePlayTime))
		end
	end
end, 3600000, 0)