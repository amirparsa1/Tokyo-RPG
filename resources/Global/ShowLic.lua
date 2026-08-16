local miscSys = exports["misc"]
addCommandHandler("sl",
	function ( thePlayer, command, player)
	local find = miscSys:findPlayer ( player )
	if find then
		local slMashin = getElementData(thePlayer, "pCarLic")
		local slMotor = getElementData(thePlayer, "pFishLic")
		local slMat = getElementData(thePlayer, "pMatsLic")
		local slDrug = getElementData(thePlayer, "pGunLic")
		local slQayeq = getElementData(thePlayer, "pBoatLic")
		local slHavapeyma = getElementData(thePlayer, "pFlyLic")
		local targetPlayer = getPlayerName ( find )
		outputChatBox("#00ff00(info): #717171About #00fff0"..getPlayerName(thePlayer).." #717171License:", find, 0, 255, 0, true)
		outputChatBox("#ffff00 Mashin: #ffffff"..slMashin.."   #00ff00    #ffff00Motor: #ffffff"..slMotor.."", find, 0, 255, 0, true)
		outputChatBox("#ffff00 Qayeq: #ffffff"..slQayeq.."   #00ff00    #ffff00Havapeyma: #ffffff"..slHavapeyma.."", find, 0, 255, 0 ,true)
		outputChatBox("#ffff00 Aslahe: #ffffff"..slMat.."   #00ff00    #ffff00Drug: #ffffff"..slDrug.."", find, 0, 255, 0 ,true)
	end		
end
)
