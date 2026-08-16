local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]

sanazz = createPed( 195,1066.4931640625 ,2079.6359765625 ,10.82031,0)
sanazz2 = createPed( 195,1064.4619140625 ,2079.6337890625 ,10.8203,0)

setTimer(
function ()
	setPedArmor ( sanazz2, 100 )
	setElementHealth(sanazz2, 100)
		setPedArmor ( sanazz, 100 )
	setElementHealth(sanazz, 100)
end, 500, 0)

buyMat = createPed(  294,1809.87109375 ,-1690.4755859375 ,13.551843643188,90)
sellMat = createPed( 57,1065.669921875 ,2079.98046875 ,10.820312,0)


setElementFrozen(buyMat, true)
setElementFrozen(sellMat, true)



fasele = 2.5

function matanimtimer()
	setTimer ( function()
    setPedAnimation(buyMat,"cop_ambient","coplook_shake",1,true,false)
	setPedAnimation(sellMat,"INT_HOUSE","LOU_Loop",1,true,false)
    
	end, 1000, 0 )
end



-- Peda Namiran #ExoPrim
setTimer(
function ()
	setPedArmor ( sellMat, 100 )
	setElementHealth(sellMat, 100)
		setPedArmor ( buyMat, 100 )
	setElementHealth(buyMat, 100)
end, 500, 0)


matanimtimer()







addEvent("bekharMaterial",true)
addEventHandler("bekharMaterial", root,
function(thePlayer)
	local level = getElementData(accSys:getPlayerAcc(client), "pLevel")
	if tonumber(level) > 2 then
			local matSkill = getElementData(accSys:getPlayerAcc(client), "pMatsSkill")
			local inMat = getElementData(client, "inMat")
			if not inMat or inMat == false then
				if tonumber(matSkill) >= 0 and tonumber(matSkill) <= 70 then --skill level 0
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 600) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB600 Geram Jens Be Mablagh'e $600 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 600)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$600 #ffffffDari!", client, 255, 255, 255, true)
					end
				elseif tonumber(matSkill) > 70 and tonumber(matSkill) <= 150 then --skil level 1
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 850) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB850 Geram Jens Be Mablagh'e $850 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 850)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$850 #ffffffDari!", client, 255, 255, 255, true)
					end	
				elseif tonumber(matSkill) > 150 and tonumber(matSkill) <= 260 then --skill level 2
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 1200) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB1200 Geram Jens Be Mablagh'e $1,200 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 1200)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$1200 #ffffffDari!", client, 255, 255, 255, true)
					end	
				elseif tonumber(matSkill) > 260 and tonumber(matSkill) <= 380 then --skill level 3
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 1650) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB1650 Geram Jens Be Mablagh'e $1,650 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 1650)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$1650 #ffffffDari!", client, 255, 255, 255, true)
					end	
				elseif tonumber(matSkill) > 380 and tonumber(matSkill) <= 500 then --skill level 4
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 2200) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB2200 Geram Jens Be Mablagh'e $2,200 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 2200)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$2200 #ffffffDari!", client, 255, 255, 255, true)
					end
				elseif tonumber(matSkill) > 500 then --skill level 5(high skill level)
					local skillUp = tonumber(matSkill) + 1
					local PlayerMoney = getPlayerMoney(source)
					if ( PlayerMoney >= 2900) then
						setElementData(accSys:getPlayerAcc(client), "pMatsSkill", tonumber(skillUp))
						setElementData(client, "inMat", true)
						takePlayerMoney(client, 2900)
						outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CB2900 Geram Jens Be Mablagh'e $2,900 Kharidid, Bebar Abesh kon.", client, 255, 255, 255, true)
					else
						outputChatBox("#ff0000[Akbar Dastandaz]:#E9E0CB Polet Kame Haji Vase Kharid Jens Niaz Be #ff0000$2900 #ffffffDari!", client, 255, 255, 255, true)
					end
				end
			elseif inMat == true then
				outputChatBox("#ff0000[Akbar Dastandaz]: #E9E0CBAval Boro Jens Haye Ghablito Ab Kon!", client, 255, 255, 255, true)
			end
	else
		outputChatBox("#ff0000[Akbar Dastandaz]: #E9E0CBHanoz Bachei Dadach! Bozorg Tar Shodi Bia. #ff0000(Level+2)", client, 255, 255, 255, true)
	end
end
)

addEvent("befroshMaterial",true)
addEventHandler("befroshMaterial", root,
function()
	local level = getElementData(accSys:getPlayerAcc(client), "pLevel")
	if tonumber(level) > 2 then
			local inMat = getElementData(client, "inMat")
			local matSkill = getElementData(accSys:getPlayerAcc(client), "pMatsSkill")
			if inMat == true then
				if tonumber(matSkill) >= 0 and tonumber(matSkill) <= 70 then --skill level 0
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB600 Geram Jens, Be Mablagh'e $780 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 1200 Geram Material Ham Porsantet, Jense bishtar Pole Bishtar.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 0  ["..matSkill.." / 70]", client, 255, 255, 255, true)
					givePlayerMoney(client, 680+100)
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 600*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
				elseif tonumber(matSkill) > 70 and tonumber(matSkill) <= 150 then --skil level 1
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 850*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB850 Geram Jens, Be Mablagh'e $1110 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 1700 Geram Material Ham Porsantet, Jense bishtar Pole Bishtar.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 1  ["..matSkill.." / 150]", client, 255, 255, 255, true)
					givePlayerMoney(client, 1010+100)
				elseif tonumber(matSkill) > 150 and tonumber(matSkill) <= 260 then --skil level 2
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 1200*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB1200 Geram Jens, Be Mablagh'e $1540 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 2400 Geram Material Ham Porsantet, Jense bishtar Pole Bishtar.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 2  ["..matSkill.." / 260]", client, 255, 255, 255, true)
					givePlayerMoney(client, 1440+100)
				elseif tonumber(matSkill) > 260 and tonumber(matSkill) <= 380 then --skil level 3
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 1650*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB1650 Geram Jens, Be Mablagh'e $2070 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 3300 Geram Material Ham Porsantet, Jense bishtar Pole Bishtar.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 3  ["..matSkill.." / 380]", client, 255, 255, 255, true)
					givePlayerMoney(client, 1970+100)
				elseif tonumber(matSkill) > 380 and tonumber(matSkill) <= 500 then --skil level 4
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 2200*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB2200 Geram Jens, Be Mablagh'e $2700 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 4400 Geram Material Ham Porsantet, Jense bishtar Pole Bishtar.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 4  ["..matSkill.." / 500]", client, 255, 255, 255, true)
					givePlayerMoney(client, 2600+100)
				elseif tonumber(matSkill) > 500 then --skil level 5
					setElementData(client, "inMat", false)
					local cheqadrMatDare = getElementData(accSys:getPlayerAcc(client), "pMats")
					local koleMat = tonumber(cheqadrMatDare) + 2900*2
					setElementData(accSys:getPlayerAcc(client), "pMats", tonumber(koleMat))
					outputChatBox("#ffff00[Mash Bibote]: #E9E0CB2900 Geram Jens, Be Mablagh'e $3500 Forokhtid!", client, 255, 255, 255, true)
					outputChatBox("#E9E0CB in 5800 Geram Material Ham Porsantet.", client, 255, 255, 255, true)
					outputChatBox("#4d95dfYour Skill: 5  ["..matSkill.." / Max]", client, 255, 255, 255, true)
					givePlayerMoney(client, 3400+100)
				end
			elseif not inMat or inMat == false then
				outputChatBox("#ff0000[Mash Bibote]: #E9E0CBJens Baraye Forosh Nadari!", client, 255, 255, 255, true)
			end
	else
		outputChatBox("#ff0000[Mash Bibote]: #E9E0CBZode Barat! Ba Javad Grobe Hamhang Kon. #ff0000(Level +2)", client, 255, 255, 255, true)
	end
	end
)

addCommandHandler("mymats",
function(thePlayer, cmd)
	local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
	outputChatBox("#7B8682Material Shoma: #E9E0CB"..cheqadrMatDare.." #7B8682Geram", thePlayer, 255, 255, 255, true)
end
)


addCommandHandler("creategun",
function(thePlayer, cmd, gunID, tir)
if getElementData(thePlayer, "inpaintball") == true then
	outputChatBox("#ff0000✖️ #ffffffTo PaintBall Ejaze Sakht,e Aslahe Nadari !", thePlayer, 255, 255, 255, true)
	return
end

if isPedInVehicle( thePlayer ) then
	outputChatBox("#ff0000✖️ #ffffffShoma Nemitavanid Dar Mashin Gun Create Konid!", thePlayer, 255, 255, 255, true)
	return
end


if ( getElementInterior(thePlayer) == 7 ) then
	outputChatBox("#ff0000✖️ #ffffffMoghe Tamrin Nemishe Create Gun Kard!", thePlayer, 255, 255, 255, true)
	return
end


if getElementData(thePlayer, "inevente") == true then
	outputChatBox("#ff0000✖️ #ffffffTo Event Ejaze Sakht,e Aslahe Nadari !", thePlayer, 255, 255, 255, true)
	return
end
if getElementData(thePlayer, "inairplane") == true then
	outputChatBox("#ff0000✖️ #ffffffTo Havapeyma Ejaze Sakht,e Aslahe Nadari !", thePlayer, 255, 255, 255, true)
	return
end
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) < 4 then
	outputChatBox("#ff0000✖️ #ffffffPolice Nemotone Create Gun Kone !", thePlayer, 255, 255, 255, true)
	return
end

if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 4 then
	outputChatBox("#ff0000✖️ #ffffffMedic Nemotone Create Gun Kone !", thePlayer, 255, 255, 255, true)
	return
end
											
	local gunID = tonumber(gunID)
	local tir = tonumber(tir)
	local esmGun = getWeaponNameFromID(gunID)
	if gunID then
		if tir then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) == 0 then
			if tonumber(gunID) == 22 then
				local koleMeqdarTir = tonumber(tir)
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,22,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..koleMeqdarTir.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 24 then
				local koleMeqdarTir = tonumber(tir)
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,24,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..koleMeqdarTir.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
						else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 25 then
				local koleMeqdarTir = tonumber(tir)*2
				local koleMeqdarTir2 = tonumber(tir)*1
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						local matkamshod2 = tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,25,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod2.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir2.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end

			elseif tonumber(gunID) == 29 then
				local koleMeqdarTir = tonumber(tir)*1
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir4 = tonumber(tir)*1
				local matkamshod4 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,29,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod4.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir4.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 30 then
				local koleMeqdarTir = tonumber(tir)*2
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir5 = tonumber(tir)*1
				local matkamshod5 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,30,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod5.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir5.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 31 then
				local koleMeqdarTir = tonumber(tir)*2
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir6 = tonumber(tir)*1
				local matkamshod6 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,31,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod6.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir6.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 32 then
				local koleMeqdarTir = tonumber(tir)*1
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir7 = tonumber(tir)*1
				local matkamshod7 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,32,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod7.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir7.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 33 then
				local koleMeqdarTir = tonumber(tir)*2
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir8 = tonumber(tir)*1
				local matkamshod8 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,33,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod8.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir8.." Tir Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			elseif tonumber(gunID) == 41 then
				local koleMeqdarTir = tonumber(tir)*1
				local cheqadrMatDare = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
				local koleMeqdarTir7 = tonumber(tir)*1
				local matkamshod7 = tonumber(koleMeqdarTir)
				if koleMeqdarTir > 0 then
					if tonumber(cheqadrMatDare) >= tonumber(koleMeqdarTir) then
						local kamkon = tonumber(cheqadrMatDare) - tonumber(koleMeqdarTir)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats", tonumber(kamkon))
						giveWeapon(thePlayer,41,tonumber(tir),true )
						outputChatBox("#00ff00☑️ #EBC651 Shoma Ba "..matkamshod7.." Geram Material #E6B006["..esmGun.."] #EBC651Ba "..koleMeqdarTir7.." Material Sakhtid!", thePlayer, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffShoma Material Kafi Nadarid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffTedad Tir Bayad Hadaghal 1 Bashad!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffIn Aslahe Ra Nemishe Sakht!", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#ff0000✖️ #ffffffTo Jail Ejaze Sakht,e Aslahe Nadari !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffTedad Tir Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /creategun  [ID]  [ Meghdar Tir]", thePlayer, 255, 255, 255, true)
	end
end
)


addCommandHandler("sellmat",
function ( thePlayer, command, player, meghdar, gheymat )
if (player) then
local yaru = miscSys:findPlayer ( player )
if yaru then
local x1,y1,z1 = getElementPosition(thePlayer)
local x2,y2,z2 = getElementPosition(yaru)
local fasele = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
if tonumber(fasele) < 1.2 then
	local meghdar = (meghdar)
	if meghdar then
		if tonumber(meghdar) > 250 then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMats")) >= tonumber(meghdar) then
				local gheymat = (gheymat)
				if gheymat then
					if tonumber(gheymat) > 99 then
						setElementData(yaru,"matreq",true,false)
						setElementData(yaru,"buymatgheymat",gheymat,false)
						setElementData(yaru,"buymatmeghdar",meghdar,false)
						setElementData(yaru,"matseller",getPlayerName(thePlayer),false)
						outputChatBox("#00ff00☑️ #ffffffShoma Be #ffff00"..getPlayerName(yaru).." #ffffffPishnahade Foroshe Material Dadid!", thePlayer, 255, 255, 255, true)
						outputChatBox("#ffff00[Tavajoh]: #ffffffPlayer #ffff00"..getPlayerName(thePlayer).."#ffffff Be Shoma Pishnahade Foroshe #ffff00"..meghdar.." #ffffffGeram Material Be Gheymat #ffff00$"..gheymat.." #ffffffDad!", yaru, 255, 255, 255, true)
						outputChatBox("#ffffffBaraye Ghabol Kardan Pishnahad #00ff00/amat #ffffffVa Baraye Rad Kardan #ff0000/rmat", yaru, 255, 255, 255, true)
					else
						outputChatBox("#ff0000✖️ #ffffffGheymat Foroosh'e Material Bayad Balaye $100 Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffGheymat Foroosh'e Material Ra Vared Konid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffMaterial'e Shoma Kamtar Az Meghdare Vared Shode Mibashad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffMeghdar Foroosh Material Bayad Balaye 250 Bashad!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffMeghdar Material Ra Vared Konid!", thePlayer, 255, 255, 255, true)
	end
else
	outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Be Player Nazdik Bashid!", thePlayer, 255, 255, 255, true)
end
else
	outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
end
else
	outputChatBox("#C0C0C0Bezan: /sellmat  [PartOfName/ID]  [Meghdar]  [Gheymat]", thePlayer, 255, 255, 255, true)
end
end
)

addCommandHandler("amat",
function(thePlayer, cmd)
	if getElementData(thePlayer, "matreq") ~= true then
		outputChatBox("#ff0000✖️ #ffffffShoma Pishnahade Kharid'e Material Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local money = getPlayerMoney (thePlayer)
		if tonumber(money) >= tonumber(getElementData(thePlayer,"buymatgheymat")) then
			local taraf = miscSys:findPlayer ( getElementData(thePlayer,"matseller") )
			if taraf then
				local x1,y1,z1 = getElementPosition(thePlayer)
				local x2,y2,z2 = getElementPosition(taraf)
				local fasele = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
				if tonumber(fasele) < 1.3 then
					local meghdar = getElementData(thePlayer,"buymatmeghdar")
					if tonumber(getElementData(accSys:getPlayerAcc(taraf), "pMats")) >= tonumber(meghdar) then
						local gheymat = getElementData(thePlayer,"buymatgheymat")
						givePlayerMoney (taraf , tonumber(gheymat))
						takePlayerMoney(thePlayer, tonumber(gheymat))
						local sellermats = getElementData(accSys:getPlayerAcc(taraf), "pMats")
						local nextmats = tonumber(sellermats) - tonumber(meghdar)
						setElementData(accSys:getPlayerAcc(taraf), "pMats",tonumber(nextmats))
						local buyermats = getElementData(accSys:getPlayerAcc(thePlayer), "pMats")
						local buyernextmats = tonumber(buyermats) + tonumber(meghdar)
						setElementData(accSys:getPlayerAcc(thePlayer), "pMats",tonumber(buyernextmats))
						setElementData(thePlayer,"matreq", nil,false)
						setElementData(thePlayer,"buymatgheymat", nil,false)
						setElementData(thePlayer,"matseller", nil,false)
						setElementData(thePlayer,"buymatmeghdar", nil,false)
						outputChatBox("#00ff00☑️ #ffffffShoma Pishnahad Forosh Material #00ff00"..getPlayerName(taraf).."#ffffff Ra Ghabol Kardid!", thePlayer, 255, 255, 255, true)
						outputChatBox("#00ff00[Tavajoh]: #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffPishnahade Kharid Material Shoma Ra Ghabol Kard!", taraf, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Nazdike Player Bashid!", thePlayer, 255, 255, 255, true)
				end
			end
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Poole Kafi Nadarid!", thePlayer, 255, 255, 255, true)
		end
end
)

addCommandHandler("rmat",
function(thePlayer, cmd)
	if getElementData(thePlayer, "matreq") ~= true then
		outputChatBox("#ff0000✖️ #ffffffShoma Pishnahade Kharid'e Material Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end

	local taraf = miscSys:findPlayer ( getElementData(thePlayer,"matseller") )
	if taraf then
		local x1,y1,z1 = getElementPosition(thePlayer)
		local x2,y2,z2 = getElementPosition(taraf)
		local fasele = getDistanceBetweenPoints3D(x1,y1,z1,x2,y2,z2)
		if tonumber(fasele) < 2 then
				setElementData(thePlayer,"matreq", nil,false)
				setElementData(thePlayer,"buymatgheymat", nil,false)
				setElementData(thePlayer,"matseller", nil,false)
				setElementData(thePlayer,"buymatmeghdar", nil,false)
				outputChatBox("#00ff00☑️ #ffffffShoma Pishnahad Forosh Material #00ff00"..getPlayerName(taraf).."#ffffff Ra Rad Kardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000[Tavajoh]: #ffffffPlayer #ff0000"..getPlayerName(thePlayer).." #ffffffPishnahade Kharid Material Shoma Ra Rad Kard!", taraf, 255, 255, 255, true)
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Nazdike Player Bashid!", thePlayer, 255, 255, 255, true)
		end
	end

end
)


---------------------------------
------**Script By ExoPrim**------
---------------------------------
function materialPanel( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 5.2 then
				if source == buyMat then
					triggerClientEvent("buyPanel", player)
					elseif source == sellMat then
					triggerClientEvent("sellPanel", player)
				end
            end
			if fasele > 5.2 and fasele < 10 then
				if source == buyMat then
					outputChatBox("#ffff00[Akbar Dastandaz]: #E9E0CBBia Jelo Tar Dadach!", player, 255, 255, 255, true)
				end
				if fasele > 5.2 and fasele < 10 then
					if source == sellMat then
						outputChatBox("#ffff00[Mash Bibote]: #E9E0CBBia Jelo Tar Dadach!", player, 255, 255, 255, true)
					end
				end
			end
			if fasele > 10 and fasele < 23 then
				if source == sellMat then
					outputChatBox("#ffff00[Mash Bibote] #50F0D9Dad zad : #E9E0CBBia Nazdik Tar Dadach! Mikhay Lomon Bedi?", player, 255, 255, 255, true)
				end
			end
			if fasele > 10 and fasele < 23 then
				if source == buyMat then
					outputChatBox("#ffff00[Akbar Dastandaz] #50F0D9Dad zad : #E9E0CBBia Nazdik Tar Dadach! Mikhay Lomon Bedi?", player, 255, 255, 255, true)
				end
			end
        end
    end
end 

addEventHandler( "onElementClicked", getRootElement( ), materialPanel )



----- blips ----
createBlip (1809.87109375 ,-1690.4755859375 ,13.551843643188, 23 )
createBlip ( 1065.669921875 ,2079.98046875 ,10.820312, 23 )




--function materialPanel2 (  button, state, thePlayer )
    --if getElementType( source ) == "ped" then
		--local x, y, z = getElementPosition( thePlayer )
		--local x1, y1, z1 = getElementPosition( source ) 
		--local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
		--if fasele > 4 and fasele < 23 then
			--outputChatBox("#ff0000✖️ #ffffffBia NAzdik Tar", thePlayer, 255, 255, 255, true)
       -- end
   -- end
--end
--addEventHandler( "onElementClicked", getRootElement( ), materialPanel2 )
