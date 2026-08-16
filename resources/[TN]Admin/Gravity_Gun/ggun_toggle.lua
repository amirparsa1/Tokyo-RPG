local accSys = exports["Accounts-System"]
local adminSys = exports["[tn]Admin"]

function toggleGGun(player)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) < 10 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", player, 255, 255, 255, true)
		return false
	end
	local on = not adminSys:isGravityGunEnabled(player)
	adminSys:togglePlayerGravityGun(player,on)
	outputChatBox((on and "#00ff00Gravity Gun Faal Shod!" or "#ff0000Gravity Gun Qeyre Faal Shod!"),player, 255, 255, 255, true)
end
addCommandHandler("ggun",toggleGGun)