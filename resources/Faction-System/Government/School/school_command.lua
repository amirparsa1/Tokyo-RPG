local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

addCommandHandler("gl",
function ( thePlayer, command, player, licarg)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 6 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Moalem Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
	if find then
		if licarg then
			local targetPlayer = getPlayerName ( find )
				local Moalem = getPlayerName(thePlayer)
				if licarg == "fly" then
				if getElementData(accSys:getPlayerAcc(find), "pFlyLic") < 50 then
					outputChatBox("#00ff00☑️ #ffffffShoma Be "..getPlayerName(find).." Mojavez Khalabani Dadid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00FFFFMoalem "..Moalem.." Be Shoma Mojavez Khalabani Dad!", find, 0, 255, 0,true)
					setElementData(accSys:getPlayerAcc(find), "pFlyLic", 200)
				else
					outputChatBox("#ff0000✖️ #ffffffMojavez Khalabani In Player Bishtar Az 50 Saat Mibashad!", thePlayer, 255, 255, 255, true)
				end
				elseif licarg == "sail" then
				if getElementData(accSys:getPlayerAcc(find), "pBoatLic") < 50 then
					outputChatBox("#00ff00☑️ #ffffffShoma Be "..getPlayerName(find).." Mojavez Ghayegh Rani Dadid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00FFFFMoalem "..Moalem.." Be Shoma Mojavez Ghayegh Rani Dad!", find, 0, 255, 0,true)
					setElementData(accSys:getPlayerAcc(find), "pBoatLic", 200)
				else
					outputChatBox("#ff0000✖️ #ffffffMojavez Ghayegh Rani In Player Bishtar Az 50 Saat Mibashad!", thePlayer, 255, 255, 255, true)
				end
				elseif licarg == "mat" then
				if getElementData(accSys:getPlayerAcc(find), "pMatsLic") < 50 then
					outputChatBox("#00ff00☑️ #ffffffShoma Be "..getPlayerName(find).." Mojavez Material Dadid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00FFFFMoalem "..Moalem.." Be Shoma Mojavez Material Dad!", find, 0, 255, 0,true)
					setElementData(accSys:getPlayerAcc(find), "pMatsLic", 200)
				else
					outputChatBox("#ff0000✖️ #ffffffMojavez Material In Player Bishtar Az 50 Saat Mibashad!", thePlayer, 255, 255, 255, true)
				end
				elseif licarg == "gun" then
				if getElementData(accSys:getPlayerAcc(find), "pGunLic") < 50 then
					outputChatBox("#00ff00☑️ #ffffffShoma Be "..getPlayerName(find).." Mojavez Hamle Aslahe Dadid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00FFFFMoalem "..Moalem.." Be Shoma Mojavez Hamle Aslahe Dad!", find, 0, 255, 0,true)
					setElementData(accSys:getPlayerAcc(find), "pGunLic", 200)
				else
					outputChatBox("#ff0000✖️ #ffffffMojavez Hamle Aslahe In Player Bishtar Az 50 Saat Mibashad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffNoe Mojavez Eshtebah Mibashad!", thePlayer, 0, 255, 0,true)
			end
			else
				outputChatBox("#ff0000✖️ #ffffffNoe Mojavez Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#C0C0C0Bezan: /gl <PartOfName/ID> <fly~sail~mat~gun>", thePlayer, 255, 255, 255, true)
			end
end
)












addCommandHandler("sl",
function(thePlayer, cmd, player)
	local find = miscSys:findPlayer ( player )
		if find then
			local x,y,z = getElementPosition(thePlayer)
			local mx,my,mz = getElementPosition(find)
			local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
			if de < fasele then
			    local myname = getPlayerName ( thePlayer )
				local targetPlayer = getPlayerName ( find )
				outputChatBox("#00FFFFShoma Govahiname Haye Khod Ra Be "..targetPlayer.." Neshoon Dadid!", thePlayer, 255, 255, 255, true)
				local fly = getElementData(accSys:getPlayerAcc(thePlayer), "pFlyLic")
				local car = getElementData(accSys:getPlayerAcc(thePlayer), "pCarLic")
				local bike = getElementData(accSys:getPlayerAcc(thePlayer), "pCarLicS")
				local boat = getElementData(accSys:getPlayerAcc(thePlayer), "pBoatLic")
				local mat = getElementData(accSys:getPlayerAcc(thePlayer), "pMatsLic")
				local gun = getElementData(accSys:getPlayerAcc(thePlayer), "pGunLic")
				outputChatBox("#00FFFF▬▬▬▬▬ Govahiname Haye "..myname.." ▬▬▬▬▬", find, 255, 255, 255, true)
				outputChatBox("#ffffff Ranandegi: "..car.." Saat / Motor: "..bike.." Saat ", find, 255, 255, 255, true)
				outputChatBox("#ffffff Khalabani: "..fly.." Saat / Ghayegh: "..boat.." Saat ", find, 255, 255, 255, true)
				outputChatBox("#ffffff Material: "..mat.." Saat / Weapon: "..gun.." Saat ", find, 255, 255, 255, true)
				outputChatBox("#00FFFF▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", find, 255, 255, 255, true)
			else
				outputChatBox("#ff0000✖️ #ffffffIn Player Az Shoma Fasele Darad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /sl <PartOfName/ID>", thePlayer, 255, 255, 255, true)
		end
end
)






addCommandHandler("moalemha",
function(thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		outputChatBox ( "#d5e3e3▬▬▬▬(#2BEC2B Moalem Hay Online #d5e3e3)▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, getmoalema in ipairs( getElementsByType("player") ) do 
			if getElementData(getmoalema, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 1 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Rank 1)", thePlayer, 230,0,0 ,true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 2 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Rank 2)", thePlayer, 230,0,0 ,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 3 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Rank 3)", thePlayer, 230,0,0 ,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 4 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Rank 4)", thePlayer, 230,0,0 ,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 5 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Rank 5)", thePlayer, 230,0,0 ,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 6 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Sub Leader)", thePlayer, 230,0,0 ,true)
					elseif tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pMember")) == 6 and  tonumber(getElementData(accSys:getPlayerAcc(getmoalema), "pRank")) == 7 then
					outputChatBox ( "#ffffffID: #00FFFF"..getElementData(getmoalema, "TarafID").." #ffffff| Name: #00FFFF "..getPlayerName(getmoalema).." #ffffff(Leader)", thePlayer, 230,0,0 ,true)
				end
			end
		end
		outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	end
end)