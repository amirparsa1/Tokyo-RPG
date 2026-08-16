
local accSys = exports["Accounts-System"]
addEventHandler( 
function (root)
	
	--getAccountData(acc,"settingGrafickPatch") and fromJSON(getAccountData(acc,"settingGrafickPatch")) or {}
	-- if tonumber(accSys:GetPlayerData(thePlayer,"pHdWater")) == 1 then
	-- 	triggerClientEvent("LoadWater",root) 
    -- end

    -- if tonumber(accSys:GetPlayerData(thePlayer,"pHdSky")) == 1 then
	-- 	triggerClientEvent("LoadSky",root)
    -- end

    -- if tonumber(accSys:GetPlayerData(thePlayer,"pHdWater")) == 1 then
	-- 	triggerClientEvent("LoadWeapon",root)
    -- end
    
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHdRoad")) == 1 then
		triggerClientEvent("LoadRoad",root)
    end
	
end)