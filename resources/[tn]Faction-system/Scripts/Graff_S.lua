local accSys = exports["Accounts-system"] -- Code By ExMohmD



addEvent("CheckMyFacForSpray",true)
addEventHandler("CheckMyFacForSpray", root,
function ( root , Data )
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) > 11 and tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) < 17 then
		local ShanseGraffiti = math.random(1,3)
		local MyFaction = getElementData(accSys:getPlayerAcc(root), "pMember")
		triggerClientEvent( "CreateGraffiti", resourceRoot, root , ""..MyFaction.."_"..ShanseGraffiti.."", Data )
	end
end)