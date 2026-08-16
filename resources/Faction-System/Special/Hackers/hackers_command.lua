local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

addCommandHandler("myhackpoints",
function ( thePlayer, command )
	local faction = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
	if tonumber(faction) == 16 then
	local points = getElementData(accSys:getPlayerAcc(thePlayer), "pCanistra")
	outputChatBox("#00ff00Hack Point Haye Shoma #ff0000"..points.."/40#00ff00 Mibashad!", thePlayer, 255, 255, 255, true)	
	else
	outputChatBox("#ff0000Baraye Inkar Bayad Hacker Bashid!", thePlayer, 255, 255, 255, true)	
	end
end)

addCommandHandler("sethackpoints",
function ( thePlayer, command, player, point )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
    local find = miscSys:findPlayer ( player )
	local points = tonumber(point)
	local targetPlayer = getPlayerName ( find )
	setElementData(accSys:getPlayerAcc(find), "pCanistra", points)
	outputChatBox("#00ff00shoma Hack Pointe #ff0000"..targetPlayer.."#00ff00 Ra Be : #ff0000"..points.."#00ff00 set kardid!", thePlayer, 255, 255, 255, true)
 else
 outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
 end
end)

addCommandHandler("unfind",
function ( thePlayer, command, player )
local faction = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
if tonumber(faction) == 16 then
if player then
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pCanistra")) > 1 then
 local find = miscSys:findPlayer ( player )
if getElementData(find,"unfind") ~= true then
if tonumber(getElementData(accSys:getPlayerAcc(find), "pMember")) ~= 16 then
	local points = getElementData(accSys:getPlayerAcc(thePlayer), "pCanistra")
	local pointsbadi = tonumber(points)-2
	setElementData(accSys:getPlayerAcc(thePlayer), "pCanistra", pointsbadi)
	outputChatBox("#00ff00[Hackers]:#ffffff Shoma Player #ff0000"..getPlayerName(find).."#ffffff Ra Baraye #00ff0015 Daghighe #ffffffUnfind Kardid!", thePlayer, 255, 255, 255, true)
	outputChatBox("#00ff00[Hackers]:#ffffff Meghdar #ff00002 Hack Points#ffffff Az Shoma Kam Shod!", thePlayer, 255, 255, 255, true)
	outputChatBox("#00ff00[Hackers]:#ffffff Shoma Tavasot Hacker #ff0000"..getPlayerName(thePlayer).."#ffffff Baraye #00ff0015 Daghighe #ffffffUnfind Shodid!", find, 255, 255, 255, true)
	setElementData(find,"unfind",true)
	setTimer(
		function()
			setElementData(find,"unfind",nil)
			outputChatBox("#ff0000[Hackers]:#ffffff 15 Daghighe Tamom Shod Va Shoma Dige Unfind Nisti!", find, 255, 255, 255, true)
	end, 900000, 1)
else
outputChatBox("#ff0000Error: In Player Khodesh Hacker Ast!", thePlayer, 255, 255, 255, true)
end
else
outputChatBox("#ff0000Error: In Player Khodesh UnFind Ast!", find, 255, 255, 255, true)
end
 else
 outputChatBox("#ff0000Error: Shoma Hack Point Kafi Nadarid!", thePlayer, 255, 255, 255, true)
 end
  else
 outputChatBox("#C0C0C0Syntax: /unfind <PartOfName/ID>", thePlayer, 255, 255, 255, true)
 end
  else
 outputChatBox("#ff0000Baraye Inkar Bayad Hacker Bashid!", thePlayer, 255, 255, 255, true)
 end
end)

addCommandHandler("gun",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	if tonumber(getDistanceBetweenPoints3D(x,y,z,141.927734375 ,102.51523590088 ,999.67071533203)) < 30 then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 16 then
			giveWeapon(thePlayer,3,1,true)
			giveWeapon(thePlayer,23,100,true)
			outputChatBox("#ffff00(!): #00ff00Gun Haye Hackers Be Shoma Dade Shod!", thePlayer, 255, 255, 255, true)
		end
	end
end
)