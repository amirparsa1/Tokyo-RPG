local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

local mehrie = 50000

function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

addCommandHandler("ezdevaj",
function (thePlayer, command, player)
	local find = miscSys:findPlayer(player)
	local x,y,z = getElementPosition(thePlayer)
	local xx,yy,zz = getElementPosition(find)
	local fasele = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
	if player then
	if find then
	if fasele < 6 then
	if thePlayer ~= find then
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSex") == 1 then
	if getElementData(accSys:getPlayerAcc(find), "pSex") == 2 then
	if getPlayerWantedLevel(thePlayer) == 0 then
	if getElementData(thePlayer, "haveMarried") ~= true then
	if getElementData(find, "marriedReq") ~= true then
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMarriedTo") == "" then
	if getElementData(accSys:getPlayerAcc(find), "pMarriedTo") == "" then
		setElementData(thePlayer, "haveMarried", true)
		setElementData(find, "marriedReq", true)
		setElementData(find, "Damad", getPlayerName(thePlayer))
		outputChatBox("#FF00FFDarkhast'e #ffffffEzdevaj #FF00FFShoma Baraye Khanom'e #ffffff"..getPlayerName(find).." #FF00FFFerestade Shod!", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FF[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #FF00FFDarkhast'e #ffffffEzdevaj #FF00FFBe Shoma Dade!", find, 255, 255, 255, true)
		outputChatBox("#FF00FFBaraye Qabul Kardan Az #ffffff/aezdevaj #FF00FFEstefade Konid!", find, 255, 255, 255, true)
		outputChatBox("#FF00FFBaraye Rad Kardan Az #ffffff/rezdevaj #FF00FFEstefade Konid!", find, 255, 255, 255, true)
	else
		outputChatBox("#ff0000Khejalat Nemikeshi ? In Khanom Shohar Dare!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000Khejalat Nemikeshi ? Zan o Bache Dari!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffIn Player Az Qabl Darkhast Ezdevaj Darad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Be Yek Nafar Darkhast Ezdevaj Dadid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Ezdevaj Nabayad Wanted Dashte Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Player Khanom Bashad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Mard Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBa Khodet Ke Nemitooni Ezdevaj Koni!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Syntax: /ezdevaj <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("aezdevaj",
function (thePlayer, command)
	local shohar = miscSys:findPlayer(getElementData(thePlayer, "Damad"))
	local x,y,z = getElementPosition(thePlayer)
	local xx,yy,zz = getElementPosition(shohar)
	local fasele = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSex") == 2 then
	if getElementData(thePlayer, "marriedReq") == true then
	if getElementData(accSys:getPlayerAcc(shohar), "pMarriedTo") == "" then
	if fasele < 6 then
		outputChatBox("#FF00FFMobarake! Shoma Ba Damad #ffffff"..getPlayerName(shohar).." #FF00FFEzdevaj Kardid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#FF00FFMobarake! Khanom'e #ffffff"..getPlayerName(thePlayer).." #FF00FFDarkhast Ezdevaj'e Shoma Ra Qabul Kard!", shohar, 255, 255, 255, true)
		setElementData(accSys:getPlayerAcc(thePlayer), "pMarriedTo", getPlayerName(shohar))
		setElementData(accSys:getPlayerAcc(shohar), "pMarriedTo", getPlayerName(thePlayer))
		setElementModel(thePlayer, 13)
		setElementModel(shohar, 1)
		setElementData(shohar, "haveMarried", nil)
		setElementData(thePlayer, "Damad", nil)
		setElementData(thePlayer, "marriedReq", nil)
	else
		outputChatBox("#ff0000[Error]: #ffffffIn Player Zan Darad!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffBaraye Inkar Bayad Be Damad Nazdik Bashid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Darkhast'e Ezdevaj'i Nadarid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Female Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("rezdevaj",
function (thePlayer, command)
	local shohar = miscSys:findPlayer(getElementData(thePlayer, "Damad"))
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSex") == 2 then
	if getElementData(thePlayer, "marriedReq") == true then
		outputChatBox("#ff0000Shoma Darkhast'e Ezdevaj "..getPlayerName(shohar).." Ra Rad Kardid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff0000Moteasefane "..getPlayerName(thePlayer).." Darkhast'e Ezdevaj Ra Rad Kard!", shohar, 255, 255, 255, true)
		setElementData(shohar, "haveMarried", nil)
		setElementData(thePlayer, "Damad", nil)
		setElementData(thePlayer, "marriedReq", nil)
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Darkhast'e Ezdevaj'i Nadarid!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Female Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("talagh",
function (thePlayer, command, player)
	local find = miscSys:findPlayer(player)
	if player then
	if find then
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMarriedTo") ~= "" then
	if thePlayer ~= find then
	if getPlayerName(thePlayer) == getElementData(accSys:getPlayerAcc(find), "pMarriedTo") then
	if getElementData(accSys:getPlayerAcc(thePlayer), "pSex") == 1 then
		setElementData(accSys:getPlayerAcc(thePlayer), "pMarriedTo", "")
		setElementData(accSys:getPlayerAcc(find), "pMarriedTo", "")
		outputChatBox("#ff0000Shoma Ba Movafaghiat Az Khanome "..getPlayerName(find).." Talagh Gereftid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff0000[Tavajoh] #ffffffAghaye "..getPlayerName(thePlayer).." Az Shoma #ff0000Talagh #ffffffGereft!", find, 255, 255, 255, true)
		if getPlayerMoney(thePlayer) > mehrie then
			takePlayerMoney(thePlayer, mehrie)
			outputChatBox("#ff0000Az Jibe Shoma Mablagh'e #ffffff$"..convertNumber(mehrie).." #ff0000Baraye Mehrie Kasr Shod!", thePlayer, 255, 255, 255, true)
		else
			setPlayerWantedLevel(thePlayer, 6)
			outputChatBox("#ff0000Shoma Be Dalil Nadashtan Mablagh'e #ffffff$"..convertNumber(mehrie).." #ff0000Baraye Mehrie #ffffff6 Wanted #ff0000Daryaft Kardid!", thePlayer, 255, 255, 255, true)
		end
	elseif getElementData(accSys:getPlayerAcc(thePlayer), "pSex") == 2 then
		setElementData(accSys:getPlayerAcc(thePlayer), "pMarriedTo", "")
		setElementData(accSys:getPlayerAcc(find), "pMarriedTo", "")
		givePlayerMoney(thePlayer, mehrie)
		outputChatBox("#ff0000Shoma Ba Movafaghiat Az Aghaye "..getPlayerName(find).." Talagh Gereftid!", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Mehrie Daryafti: +$"..convertNumber(mehrie), thePlayer, 255, 255, 255, true)
		outputChatBox("#ff0000[Tavajoh] #ffffffKhanome "..getPlayerName(thePlayer).." Az Shoma #ff0000Talagh #ffffffGereft!", find, 255, 255, 255, true)
		if getPlayerMoney(find) > mehrie then
			takePlayerMoney(find, mehrie)
			outputChatBox("#ff0000Az Jibe Shoma Mablagh'e #ffffff$"..convertNumber(mehrie).." #ff0000Baraye Mehrie Kasr Shod!", find, 255, 255, 255, true)
		else
			setPlayerWantedLevel(find, 6)
			outputChatBox("#ff0000Shoma Be Dalil Nadashtan Mablagh'e #ffffff$"..convertNumber(mehrie).." #ff0000Baraye Mehrie #ffffff6 Wanted #ff0000Daryaft Kardid!", find, 255, 255, 255, true)
		end
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffIn Player Hamsar Shoma Nist!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffAz Khodet Nemitooni Talagh Begiri!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffShoma Hamsar Nadari!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#C0C0C0Syntax: /talagh <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
