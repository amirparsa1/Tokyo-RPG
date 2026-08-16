local accSys = exports["Accounts-System"]

function LoadRecoilOnLogin(player)

	--> For Defult Recoil [Script By zezaw]
	if tonumber(getElementData(accSys:getPlayerAcc(player),"pRecoil")) == 0 then
		local meghdareRecoil = 1
		setElementData(accSys:getPlayerAcc(player), "pRecoil", tonumber(meghdareRecoil))
	end
	
	local myRecoil = tostring(getElementData(accSys:getPlayerAcc(player),"pRecoil"))
	triggerClientEvent("LoadMyRecoilNow",player,player,myRecoil)
end

addEvent("SaveMyRecoil",true)
addEventHandler("SaveMyRecoil",getRootElement(),function(thePlayer,fShod)
	setElementData(accSys:getPlayerAcc(thePlayer),"pRecoil",tonumber(fShod))
end)
