local dbpTime = 500
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

addCommandHandler("id",
function (thePlayer,cmd,player)
local find = miscSys:findPlayer ( player )
	if find then
		local name = getPlayerName(find)
		local register = getElementData(accSys:getPlayerAcc(find),"pRegistredDate")
		local codmeli = getElementData(accSys:getPlayerAcc(find),"pID")
		local gun = getElementData(accSys:getPlayerAcc(find),"pGunLicS")
		local car = getElementData(accSys:getPlayerAcc(find),"pCarLic")
		local bike = getElementData(accSys:getPlayerAcc(find),"pCarLicS")
		local ghayegh = getElementData(accSys:getPlayerAcc(find),"pBoatLic")
		local heli = getElementData(accSys:getPlayerAcc(find),"pFlyLic")
		local skin = getElementModel(find)
		triggerClientEvent("updateEtelatCartMeli", thePlayer, thePlayer, name,register,codmeli,gun,car,bike,ghayegh,heli,skin)
		triggerClientEvent("showCartMeli", thePlayer, thePlayer)
		
		setTimer(function()
			triggerClientEvent("hideCartMeli", thePlayer, thePlayer)
		end,5000,1)
	else
	outputChatBox("#0f00ffSyntax: /sl [ID]",thePlayer,255,255,255,true)
	end
	
end)