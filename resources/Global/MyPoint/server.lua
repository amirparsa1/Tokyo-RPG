local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]


addCommandHandler("mypoint",
function(thePlayer, cmd)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#d5e3e3▬▬▬▬(#2BEC2B My Point #d5e3e3)▬▬▬▬", thePlayer, 230,0,0 ,true)
		local CheghadrRpDare = getElementData(accSys:getPlayerAcc(thePlayer), "pRob")
		local CheghadrSHpDare = getElementData(accSys:getPlayerAcc(thePlayer), "pTamrin")
		-- Rob Point
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSilverPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pBronzePremium")) >= 1 then
			outputChatBox("#F8F888Rob Point: #ffffff["..CheghadrRpDare.."/40]", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#F8F888Rob Point: #ffffff["..CheghadrRpDare.."/20]", thePlayer, 255, 255, 255, true)
		end
		-- Shooting Point
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGoldPremium")) >= 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSilverPremium")) >= 1 then
			outputChatBox("#F8F888Shooting Point: #ffffff["..CheghadrSHpDare.."/20]", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#F8F888Shooting Point: #ffffff["..CheghadrSHpDare.."/10]", thePlayer, 255, 255, 255, true)
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end
)