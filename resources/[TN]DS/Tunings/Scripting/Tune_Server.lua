local miscSys = exports["Misc"]
local accSys = exports["Accounts-System"]
local vehSys = exports["[tn]DS"]

function GetHandlingProperty(VehID,Property)
	for k,h in pairs(getModelHandling(tonumber(VehID))) do
		if tostring(k) == Property then
			return h
		end
	end
end

-- function kk(p)
-- local Veh = getPedOccupiedVehicle (p)
-- local CarID = getElementData(Veh,"vehicleID")
-- vehSys:setVehicleData(CarID, "vLowerLimit", 1)
-- outputChatBox("Okb !", p, 255, 255, 255, true)
-- end
-- addCommandHandler("kk",kk)

addCommandHandler("tune",
function ( thePlayer, command)
	if getElementData(accSys:getPlayerAcc(thePlayer), "pMember") == 9 then
		if isPedInVehicle ( thePlayer ) then
			--if getPedOccupiedVehicleSeat ( thePlayer ) == 1 then
			local x,y,z = getElementPosition(thePlayer)
			if tonumber(getDistanceBetweenPoints3D(x,y,z,914.5947265 ,-1170.4882 ,16.976)) < 5 or tonumber(getDistanceBetweenPoints3D(x,y,z,906.1367 ,-1169.9247 ,16.976)) < 5 then
				local Veh = getPedOccupiedVehicle ( thePlayer )
				local id = getElementModel(Veh)
				if id ~= 581 and  id ~= 509 and id ~= 481 and id ~= 462 and id ~= 521 and id ~= 463 and id ~= 510 and id ~= 522 and id ~= 461 and id ~= 448 and id ~= 468 and id ~= 586 then
					if getVehicleController ( Veh ) then
						local Moshtari = getVehicleController(Veh)
						local MoshtariName = getPlayerName(Moshtari)
						if getElementData(Veh, "owner") == MoshtariName then
							setElementData(thePlayer,"ModelCarMc", id)
							local CarID = getElementData(Veh,"vehicleID")
							triggerClientEvent("OpenTunePanel", thePlayer, thePlayer, MoshtariName, CarID)
						else
							outputChatBox("#ff0000✖️ #ffffffIn Mashin Motealegh Be Ranande Nemibashad!", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Saheb Mashin Savar Bashad!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000✖️ #ffffffDo Charkhe Ya Motoro Nemishe Tune Kard!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dar Garage Bashid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Mechanic Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

function TuneKon(thePlayer, Moshtari, CarID, TuneSarjam, TunePay, NowTune, Hexs3 )
	local find = miscSys:findPlayer(Moshtari)
	if find then
		local x,y,z = getElementPosition(thePlayer)
		--if tonumber(getDistanceBetweenPoints3D(x,y,z,914.5947265 ,-1170.4882 ,16.976)) < 5 or tonumber(getDistanceBetweenPoints3D(x,y,z,906.1367 ,-1169.9247 ,16.976)) < 5 then
			local veh = getPedOccupiedVehicle(find)
			local id = getElementModel(veh)
			if getElementData(find, "NowTune") == nil or getElementData(find, "NowTune") == false  then
				if tonumber(NowTune) == 20 then
					if id == 412 then
					exports["notf"]:addNotification(thePlayer, "In Mashin Hydraulics Ra Support Nemikonad!" , 'error') triggerClientEvent ( thePlayer, "PlayError", thePlayer) return false end
				 elseif tonumber(NowTune) == 26 then
					if getElementData(veh,"engineultra") == 1 then
					exports["notf"]:addNotification(thePlayer, "In Mashin Engine Ultra Darad!" , 'error') triggerClientEvent ( thePlayer, "PlayError", thePlayer) return false end
				 elseif tonumber(NowTune) == 27 then
					if getElementData(veh,"enginedrag") == 1 then
					exports["notf"]:addNotification(thePlayer, "In Mashin Engine Drag Darad!" , 'error') triggerClientEvent ( thePlayer, "PlayError", thePlayer) return false end
				 elseif getElementData(find, "NowTestTimer") == 1 then
					exports["notf"]:addNotification(thePlayer, "Shoma Dar Hal Test Hastid, Baraye Tune Bad Az Etmam Time Test Emtehan Konid!" , 'error') triggerClientEvent ( thePlayer, "PlayError", thePlayer) return false
				end
				setElementData(find, "NowTune", NowTune)
				setElementData(find, "CarID", CarID)
				setElementData(find, "MeghdarFarman", MeghdarFarman)
				setElementData(find, "TuneSarjam", Hexs3) -- Dastmozd
				setElementData(find, "TunePay", TunePay) -- Pole Server
				setElementData(find, "MechanicName", getPlayerName(thePlayer))
				JameKolHazine = Hexs3 + TunePay
				-- #Name
				if tonumber(NowTune) == 1 then setElementData(find, "KodomTune", "Nitro 2X")
				elseif tonumber(NowTune) == 2 then setElementData(find, "KodomTune", "Nitro 5X")
				elseif tonumber(NowTune) == 3 then setElementData(find, "KodomTune", "Nitro 10X")
				elseif tonumber(NowTune) == 4 or tonumber(NowTune) == 5 or tonumber(NowTune) == 6 or tonumber(NowTune) == 7 or tonumber(NowTune) == 8 or tonumber(NowTune) == 9 or tonumber(NowTune) == 10 or tonumber(NowTune) == 11 or tonumber(NowTune) == 12 or tonumber(NowTune) == 13 or tonumber(NowTune) == 14 or tonumber(NowTune) == 15 or tonumber(NowTune) == 16 or tonumber(NowTune) == 17 or tonumber(NowTune) == 18 or tonumber(NowTune) == 19 then setElementData(find, "KodomTune", "Ring")
				elseif tonumber(NowTune) == 20 then setElementData(find, "KodomTune", "Hydraulic")
				elseif tonumber(NowTune) == 21 then setElementData(find, "KodomTune", "Default Hydraulic")
				elseif tonumber(NowTune) == 22  or tonumber(NowTune) == 23 or tonumber(NowTune) == 24 then setElementData(find, "KodomTune", "Paintjob")
				elseif tonumber(NowTune) == 25 then setElementData(find, "KodomTune", "Default Paintjob")
				elseif tonumber(NowTune) == 26 then setElementData(find, "KodomTune", "Engine Ultra")	
				elseif tonumber(NowTune) == 27 then setElementData(find, "KodomTune", "Engine Drag")
				elseif tonumber(NowTune) == 28 or tonumber(NowTune) == 29 or tonumber(NowTune) == 30 or tonumber(NowTune) == 31 or tonumber(NowTune) == 32 or tonumber(NowTune) == 33 or tonumber(NowTune) == 34 or tonumber(NowTune) == 35 then setElementData(find, "KodomTune", "Traction Loss")	
				elseif tonumber(NowTune) == 36 or tonumber(NowTune) == 37 or tonumber(NowTune) == 38 or tonumber(NowTune) == 39 or tonumber(NowTune) == 40 or tonumber(NowTune) == 41 then setElementData(find, "KodomTune", "Traction Multiplier")
				elseif tonumber(NowTune) == 42 or tonumber(NowTune) == 43 or tonumber(NowTune) == 44 then setElementData(find, "KodomTune", "Tormoz")	
				elseif tonumber(NowTune) == 45 then setElementData(find, "KodomTune", "Differential awd")
				elseif tonumber(NowTune) == 46 then setElementData(find, "KodomTune", "Differential fwd") 
				elseif tonumber(NowTune) == 47 or tonumber(NowTune) == 48 or tonumber(NowTune) == 49 or tonumber(NowTune) == 50 or tonumber(NowTune) == 51 or tonumber(NowTune) == 52 or tonumber(NowTune) == 53 or tonumber(NowTune) == 54 or tonumber(NowTune) == 55 or tonumber(NowTune) == 56 or tonumber(NowTune) == 57 or tonumber(NowTune) == 58 or tonumber(NowTune) == 59 or tonumber(NowTune) == 60 then setElementData(find, "KodomTune", "Ertefa")
				elseif tonumber(NowTune) == 61 or tonumber(NowTune) == 62 or tonumber(NowTune) == 63 then setElementData(find, "KodomTune", "Center Mass")
				elseif tonumber(NowTune) == 64 or tonumber(NowTune) == 65 or tonumber(NowTune) == 66 or tonumber(NowTune) == 67 or tonumber(NowTune) == 68 or tonumber(NowTune) == 69 or tonumber(NowTune) == 70 or tonumber(NowTune) == 71 or tonumber(NowTune) == 72 or tonumber(NowTune) == 73 or tonumber(NowTune) == 74 or tonumber(NowTune) == 75 or tonumber(NowTune) == 76 or tonumber(NowTune) == 77 or tonumber(NowTune) == 78 or tonumber(NowTune) == 79 or tonumber(NowTune) == 80 or tonumber(NowTune) == 81 or tonumber(NowTune) == 82 or tonumber(NowTune) == 83 then setElementData(find, "KodomTune", "Spoiler")
				elseif tonumber(NowTune) == 84 or tonumber(NowTune) == 85 or tonumber(NowTune) == 86 or tonumber(NowTune) == 87 or tonumber(NowTune) == 88 or tonumber(NowTune) == 89 or tonumber(NowTune) == 90 or tonumber(NowTune) == 91 or tonumber(NowTune) == 92 or tonumber(NowTune) == 93 or tonumber(NowTune) == 94 or tonumber(NowTune) == 95 or tonumber(NowTune) == 96 or tonumber(NowTune) == 97 or tonumber(NowTune) == 98 or tonumber(NowTune) == 99 then setElementData(find, "KodomTune", "Suspension Force") end
				
				local KodomTune =  getElementData(find, "KodomTune")
				outputChatBox("#00ff00☑️ #ffffffShoma Darkhast Tune #00ff00("..KodomTune..") #ffffffRa Ba Dastmozde #00ff00$"..math.floor(Hexs3).." #ffffffBe Player #00ff00"..getPlayerName(find).." #ffffffDadid.", thePlayer, 255, 255, 255, true)
				outputChatBox("#ffffffMechanic #649c9e"..getPlayerName(thePlayer).." #ffffffGhasd Darad Tune #649c9e("..KodomTune..") #ffffffRa Roye Mashin Shoma Nasb Konad.", find, 255, 255, 255, true)
				outputChatBox("#ffffffHazine Ghataat: #00ff00$"..TunePay.." #ffffff+ #ffffffDastmozd: #00ff00$"..math.floor(Hexs3).." #ffffff= #00ff00$"..math.floor(JameKolHazine).."", find, 255, 255, 255, true)
				outputChatBox("#ffffffBaraye Ghabol Kardan #649c9e/atune #ffffffVa Baraye Rad Kardan Az #649c9e/rtune #ffffffEstefade Konid.", find, 255, 255, 255, true)
			else
				outputChatBox("#ff0000In Player Yek Darkhste Tune Accept/Rad Nashode Darad!", thePlayer, 255, 255, 255, true)
			end
		--end
	end
end
addEvent("TuneKon",true)
addEventHandler("TuneKon", root, TuneKon)

addCommandHandler("rtune",
function ( thePlayer, command)
	if getElementData(thePlayer,"NowTune") and getElementData(thePlayer,"NowTune") ~= 0 then
		local find = miscSys:findPlayer(getElementData(thePlayer, "MechanicName"))
		outputChatBox("#ff0000Player "..getPlayerName(thePlayer).." Darkhast Tune Shoma Ra Rad Kard!", find, 255, 255, 255, true)
		outputChatBox("#ff0000Shoma Darkhast Tune Ra Rad Kardid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "NowTune", nil)
		setElementData(thePlayer, "CarID", nil)
		setElementData(thePlayer, "TuneSarjam", nil)
		setElementData(thePlayer, "TunePay", nil)
		setElementData(thePlayer, "MechanicName", nil)
	end
end)

addCommandHandler("atune",
function ( thePlayer, command)
	local x,y,z = getElementPosition(thePlayer)
	if tonumber(getDistanceBetweenPoints3D(x,y,z,914.5947265 ,-1170.4882 ,16.976)) < 5 or tonumber(getDistanceBetweenPoints3D(x,y,z,906.1367 ,-1169.9247 ,16.976)) < 5 then
		if getElementData(thePlayer,"NowTune") and getElementData(thePlayer,"NowTune") ~= nil then
			local theVehicle = getPedOccupiedVehicle ( thePlayer )
			if theVehicle then
				if getPlayerName(thePlayer) == getElementData(theVehicle, "owner") then
					if getElementData(thePlayer, "CarID") == getElementData(theVehicle, "vehicleID") then
						local find = miscSys:findPlayer(getElementData(thePlayer, "MechanicName"))
						if find then
							if getPlayerMoney( thePlayer ) < JameKolHazine then
								outputChatBox("#ff0000Shoma Poole Kafi Nadarid!", thePlayer, 255, 255, 255, true)
								setElementData(thePlayer, "NowTune", nil)
								setElementData(thePlayer, "CarID", nil)
								setElementData(thePlayer, "TuneSarjam", nil)
								setElementData(thePlayer, "TunePay", nil)
								setElementData(thePlayer, "MechanicName", nil)
							else
								outputChatBox("#00ff00Player "..getPlayerName(thePlayer).." Darkhast Tune Shoma Ra Accept Kard! + "..math.floor(getElementData(thePlayer,"TuneSarjam")).."$ Dastmozd", find, 255, 255, 255, true)
								outputChatBox("#00ff00Shoma Darkhast Tune Ra Accept Kardid ", thePlayer, 255, 255, 255, true)
								playSoundFrontEnd ( find, 46 )
								playSoundFrontEnd ( thePlayer, 46 )
								TuneCar(	getElementData(thePlayer,"CarID"),	getElementData(thePlayer,"NowTune"))
								takePlayerMoney ( thePlayer, math.floor(JameKolHazine) )
								givePlayerMoney ( find, tonumber(math.floor(getElementData(thePlayer,"TuneSarjam"))))
								setElementData(thePlayer, "NowTune", nil)
								setElementData(thePlayer, "CarID", nil)
								setElementData(thePlayer, "TuneSarjam", nil)
								setElementData(thePlayer, "TunePay", nil)
								setElementData(thePlayer, "TestCarID", nil)
								setElementData(thePlayer, "MechanicName", nil)
								triggerClientEvent ( find, "RefreshTunePanel", find)
							end
						end
					else
						outputChatBox("#ff0000Baraaye Darkhast Accept Bayad Dar Khodroi Ke Darkhast Dade Shode Ast Bashid!", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#ff0000In Mashin Shoma Nist!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#ff0000Baraye Inkar Bayad To Mashin Bashi!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Shoma Darkhaste Tune Nadarid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#ff0000Baraye Inkar Bayad Dar Garage Bashid!", thePlayer, 255, 255, 255, true)
	end
end)


function TuneCar( CarID, NowTune) -- #VeCtoR
	for index, Mashin in ipairs( getElementsByType("vehicle") ) do
		if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
		--#Tune2
			if tonumber(getElementData(Mashin, "NowTestTimer")) == 1 or tonumber(getElementData(Mashin, "NowTestTimer")) == 15 then
				local Soratesh = getElementData(Mashin,"maxspeed") setVehicleHandling(Mashin, "maxVelocity", Soratesh)
				local Shetabeesh = getElementData(Mashin,"shetab") setVehicleHandling(Mashin, "engineAcceleration", Shetabeesh)
				local Dragesh = getElementData(Mashin,"drag") setVehicleHandling(Mashin, "dragCoeff", Dragesh )
				local DrviveTypesh = getElementData(Mashin,"drivetype") setVehicleHandling(Mashin, "driveType", DrviveTypesh )
				local Tormozesh = getElementData(Mashin,"tormoz") setVehicleHandling(Mashin, "brakeDeceleration", Tormozesh )
				local Farmonesh = getElementData(Mashin,"farmon") setVehicleHandling(Mashin, "tractionMultiplier", Farmonesh )
				local Farmonesh1 = getElementData(Mashin,"farmon1") setVehicleHandling(Mashin, "tractionLoss", Farmonesh1 )
				local lowerlimitesh = tonumber(getElementData(Mashin,"lowerlimit"))
				if lowerlimitesh == 0 then setVehicleHandling(Mashin, "suspensionLowerLimit", nil)
				 elseif lowerlimitesh == 14 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30)
				 elseif lowerlimitesh == 13 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25)
				 elseif lowerlimitesh == 12 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20)
				 elseif lowerlimitesh == 11 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15)
				 elseif lowerlimitesh == 10 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10)
				 elseif lowerlimitesh == 9 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09)
				 elseif lowerlimitesh == 8 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08)
				 elseif lowerlimitesh == 7 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07)
				 elseif lowerlimitesh == 6 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06)
				 elseif lowerlimitesh == 5 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05)
				 elseif lowerlimitesh == 4 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04)
				 elseif lowerlimitesh == 3 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03)
				 elseif lowerlimitesh == 2 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02)
				 elseif lowerlimitesh == 1 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01)
				end
				local centermassesh = tonumber(getElementData(Mashin,"centermass"))
				if centermassesh == 0 then setVehicleHandling(Mashin, "centerOfMass", nil)
				 elseif centermassesh == 1 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.3} )
				 elseif centermassesh == 2 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.4} )
				 elseif centermassesh == 3 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.5} )
				end	
				local susforceshn = getElementData(Mashin,"susforce") 
				if tonumber(susforceshn) == nil then
					setVehicleHandling(Mashin, "suspensionForceLevel", nil )
				else
					setVehicleHandling(Mashin, "suspensionForceLevel", tonumber(susforceshn) )
				end
				setElementData(Mashin, "NowTestTimer", 0)
				setElementData(Mashin, "NowTestTimerDrag", 0)
				setElementData(Mashin, "NowTestTimerU", 0)
				killTimer (TimereTestMC)
			end

				-->> -->> Nitro <<-- <<--
			if tonumber(NowTune) == 1 then
				addVehicleUpgrade ( Mashin, 1009 )
				vehSys:setVehicleData(CarID, "vNitro", 1)
				setElementData(Mashin,"nitro", 1)
			elseif tonumber(NowTune) == 2 then
				addVehicleUpgrade ( Mashin, 1008 )
				vehSys:setVehicleData(CarID, "vNitro", 2)
				setElementData(Mashin,"nitro", 2)
			elseif tonumber(NowTune) == 3 then
				addVehicleUpgrade ( Mashin, 1010 )
				vehSys:setVehicleData(CarID, "vNitro",3)
				setElementData(Mashin,"nitro", 3)
				
				-->> -->> Ring <<-- <<--
			elseif tonumber(NowTune) == 4 then
				addVehicleUpgrade ( Mashin, 1073 )
				vehSys:setVehicleData(CarID, "vWheels", 1073)
				setElementData(Mashin,"ring", 1073)
			elseif tonumber(NowTune) == 5 then
				addVehicleUpgrade ( Mashin, 1074 )
				vehSys:setVehicleData(CarID, "vWheels", 1074)
				setElementData(Mashin,"ring", 1074)
			elseif tonumber(NowTune) == 6 then
				addVehicleUpgrade ( Mashin, 1075 )
				vehSys:setVehicleData(CarID, "vWheels", 1075)
				setElementData(Mashin,"ring", 1075)
			elseif tonumber(NowTune) == 7 then
				addVehicleUpgrade ( Mashin, 1076 )
				vehSys:setVehicleData(CarID, "vWheels", 1076)
				setElementData(Mashin,"ring", 1076)
			elseif tonumber(NowTune) == 8 then
				addVehicleUpgrade ( Mashin, 1077 )
				vehSys:setVehicleData(CarID, "vWheels", 1077)
				setElementData(Mashin,"ring", 1077)
			elseif tonumber(NowTune) == 9 then
				addVehicleUpgrade ( Mashin, 1078 )
				vehSys:setVehicleData(CarID, "vWheels", 1078)
				setElementData(Mashin,"ring", 1078)
			elseif tonumber(NowTune) == 10 then
				addVehicleUpgrade ( Mashin, 1079 )
				vehSys:setVehicleData(CarID, "vWheels", 1079)
				setElementData(Mashin,"ring", 1079)
			elseif tonumber(NowTune) == 11 then
				addVehicleUpgrade ( Mashin, 1080 )
				vehSys:setVehicleData(CarID, "vWheels", 1080)
				setElementData(Mashin,"ring", 1080)
			elseif tonumber(NowTune) == 12 then
				addVehicleUpgrade ( Mashin, 1081 )
				vehSys:setVehicleData(CarID, "vWheels", 1081)
				setElementData(Mashin,"ring", 1081)
			elseif tonumber(NowTune) == 13 then
				addVehicleUpgrade ( Mashin, 1082 )
				vehSys:setVehicleData(CarID, "vWheels", 1082)
				setElementData(Mashin,"ring", 1082)
			elseif tonumber(NowTune) == 14 then
				addVehicleUpgrade ( Mashin, 1083 )
				vehSys:setVehicleData(CarID, "vWheels", 1083)
				setElementData(Mashin,"ring", 1083)
			elseif tonumber(NowTune) == 15 then
				addVehicleUpgrade ( Mashin, 1084 )
				vehSys:setVehicleData(CarID, "vWheels", 1084)
				setElementData(Mashin,"ring", 1084)
			elseif tonumber(NowTune) == 16 then
				addVehicleUpgrade ( Mashin, 1085 )
				vehSys:setVehicleData(CarID, "vWheels", 1085)
				setElementData(Mashin,"ring", 1085)
			elseif tonumber(NowTune) == 17 then
				addVehicleUpgrade ( Mashin, 1096 )
				vehSys:setVehicleData(CarID, "vWheels", 1096)
				setElementData(Mashin,"ring", 1096)
			elseif tonumber(NowTune) == 18 then
				addVehicleUpgrade ( Mashin, 1097 )
				vehSys:setVehicleData(CarID, "vWheels", 1097)
				setElementData(Mashin,"ring", 1097)
			elseif tonumber(NowTune) == 19 then
				addVehicleUpgrade ( Mashin, 1098 )
				vehSys:setVehicleData(CarID, "vWheels", 1098)
				setElementData(Mashin,"ring", 1098)
			elseif tonumber(NowTune) == 20 then
				addVehicleUpgrade ( Mashin, 1087 )
				vehSys:setVehicleData(CarID, "vHydraulics", 1)
				setElementData(Mashin,"hydraulic", 1)
			elseif tonumber(NowTune) == 21 then
				removeVehicleUpgrade (Mashin,1087)
				vehSys:setVehicleData(CarID, "vHydraulics", 0)
				setElementData(Mashin,"hydraulic", 0)
			elseif tonumber(NowTune) == 22 then
				setVehiclePaintjob (Mashin, 0)
				vehSys:setVehicleData(CarID, "vPaintjob", 1)
			elseif tonumber(NowTune) == 23 then
				setVehiclePaintjob (Mashin, 1)
				vehSys:setVehicleData(CarID, "vPaintjob", 2)
			elseif tonumber(NowTune) == 24 then
				setVehiclePaintjob (Mashin, 2)
				vehSys:setVehicleData(CarID, "vPaintjob", 3)
			elseif tonumber(NowTune) == 25 then
				setVehiclePaintjob (Mashin, 3)
				vehSys:setVehicleData(CarID, "vPaintjob", 0)
				
					-->> -->> Engine Ultra <<-- <<--
			elseif tonumber(NowTune) == 26 then 
				local Soratesh = getElementData(Mashin,"maxspeed")
				local MaxSpeedBede = tonumber(Soratesh) + 80
				vehSys:setVehicleData(CarID, "vSorat", MaxSpeedBede)
				setVehicleHandling(Mashin, "maxVelocity", MaxSpeedBede)
				setElementData(Mashin,"maxspeed", MaxSpeedBede)
				vehSys:setVehicleData(CarID, "vEngineUltra", 1 )
				setElementData(Mashin,"engineultra", 1)
				
					-->> -->> Engine Drag <<-- <<--
			elseif tonumber(NowTune) == 27 then
				if getElementModel(Mashin) == 494 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.4)
					setVehicleHandling(Mashin, "dragCoeff", 1.4)
					setElementData(Mashin,"drag", 1.4)
				 elseif getElementModel(Mashin) == 491 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.25)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
					setElementData(Mashin,"drag", 1.25)
				 elseif getElementModel(Mashin) == 502 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.98)
					setVehicleHandling(Mashin, "dragCoeff", 0.98)
					setElementData(Mashin,"drag", 0.98)
				 elseif getElementModel(Mashin) == 527 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.15)
					setVehicleHandling(Mashin, "dragCoeff", 1.15)
					setElementData(Mashin,"drag", 1.15)
				 elseif getElementModel(Mashin) == 503 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.14)
					setVehicleHandling(Mashin, "dragCoeff", 1.14)
					setElementData(Mashin,"drag", 1.14)
				 elseif getElementModel(Mashin) == 602 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.15)
					setVehicleHandling(Mashin, "dragCoeff", 1.15)
					setElementData(Mashin,"drag", 1.15)
				elseif getElementModel(Mashin) == 400 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.32)
					setVehicleHandling(Mashin, "dragCoeff", 1.32)
					setElementData(Mashin,"drag", 1.32)
				elseif getElementModel(Mashin) == 535 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.8)
					setVehicleHandling(Mashin, "dragCoeff", 1.8)
					setElementData(Mashin,"drag", 1.8)
				elseif getElementModel(Mashin) == 429 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.3)
					setVehicleHandling(Mashin, "dragCoeff", 1.3)
					setElementData(Mashin,"drag", 1.3)
				elseif getElementModel(Mashin) == 475 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.16)
					setVehicleHandling(Mashin, "dragCoeff", 1.16)
					setElementData(Mashin,"drag", 1.16)
				elseif getElementModel(Mashin) == 480 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.1)
					setVehicleHandling(Mashin, "dragCoeff", 1.1)
					setElementData(Mashin,"drag", 1.1)
				elseif getElementModel(Mashin) == 436 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.95)
					setVehicleHandling(Mashin, "dragCoeff", 1.95)
					setElementData(Mashin,"drag", 1.95)
				elseif getElementModel(Mashin) == 415 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.24)
					setVehicleHandling(Mashin, "dragCoeff", 1.24)
					setElementData(Mashin,"drag", 1.24)
				elseif getElementModel(Mashin) == 558 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.08)
					setVehicleHandling(Mashin, "dragCoeff", 1.08)
					setElementData(Mashin,"drag", 1.08)
				elseif getElementModel(Mashin) == 529 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.08)
					setVehicleHandling(Mashin, "dragCoeff", 1.08)
					setElementData(Mashin,"drag", 1.08)
				elseif getElementModel(Mashin) == 506 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.97)
					setVehicleHandling(Mashin, "dragCoeff", 0.97)
					setElementData(Mashin,"drag", 0.97)
				elseif getElementModel(Mashin) == 567 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.02)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
					setElementData(Mashin,"drag", 1.02)
				elseif getElementModel(Mashin) == 534 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.94)
					setVehicleHandling(Mashin, "dragCoeff", 0.94)
					setElementData(Mashin,"drag", 0.94)
				elseif getElementModel(Mashin) == 575 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.87)
					setVehicleHandling(Mashin, "dragCoeff", 0.87)
					setElementData(Mashin,"drag", 0.87)
				elseif getElementModel(Mashin) == 560 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.8)
					setVehicleHandling(Mashin, "dragCoeff", 0.8)
					setElementData(Mashin,"drag", 0.8)
				elseif getElementModel(Mashin) == 554 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.28)
					setVehicleHandling(Mashin, "dragCoeff", 1.28)
					setElementData(Mashin,"drag", 1.28)
				elseif getElementModel(Mashin) == 404 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.96)
					setVehicleHandling(Mashin, "dragCoeff", 0.96)
					setElementData(Mashin,"drag", 0.96)
					--- Mashin Hay Ke dar Pain Miad Test Nashode Dragesh **
				elseif getElementModel(Mashin) == 496 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.75)
					setVehicleHandling(Mashin, "dragCoeff", 0.75)
					setElementData(Mashin,"drag", 0.75)
				elseif getElementModel(Mashin) == 424 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1)
					setVehicleHandling(Mashin, "dragCoeff", 1)
					setElementData(Mashin,"drag", 1)
				elseif getElementModel(Mashin) == 536 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.02)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
					setElementData(Mashin,"drag", 1.02)
				elseif getElementModel(Mashin) == 467 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.67)
					setVehicleHandling(Mashin, "dragCoeff", 1.67)
					setElementData(Mashin,"drag", 1.67)
				elseif getElementModel(Mashin) == 545 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.95)
					setVehicleHandling(Mashin, "dragCoeff", 0.95)
					setElementData(Mashin,"drag", 0.95)
				elseif getElementModel(Mashin) == 540 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.17)
					setVehicleHandling(Mashin, "dragCoeff", 1.17)
					setElementData(Mashin,"drag", 1.17)
				elseif getElementModel(Mashin) == 482 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.05)
					setVehicleHandling(Mashin, "dragCoeff", 1.05)
					setElementData(Mashin,"drag", 1.05)
				elseif getElementModel(Mashin) == 565 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.18)
					setVehicleHandling(Mashin, "dragCoeff", 1.18)
					setElementData(Mashin,"drag", 1.18)
				elseif getElementModel(Mashin) == 585 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.73)
					setVehicleHandling(Mashin, "dragCoeff", 1.73)
					setElementData(Mashin,"drag", 1.73)
				elseif getElementModel(Mashin) == 500 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.02)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
					setElementData(Mashin,"drag", 1.02)
				elseif getElementModel(Mashin) == 550 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.8)
					setVehicleHandling(Mashin, "dragCoeff", 0.8)
					setElementData(Mashin,"drag", 0.8)
				elseif getElementModel(Mashin) == 504 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.25)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
					setElementData(Mashin,"drag", 1.25)
				elseif getElementModel(Mashin) == 555 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.38)
					setVehicleHandling(Mashin, "dragCoeff", 1.38)
					setElementData(Mashin,"drag", 1.38)
				elseif getElementModel(Mashin) == 477 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.2)
					setVehicleHandling(Mashin, "dragCoeff", 1.2)
					setElementData(Mashin,"drag", 1.2)
				elseif getElementModel(Mashin) == 412 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.17)
					setVehicleHandling(Mashin, "dragCoeff", 1.17)
					setElementData(Mashin,"drag", 1.17)
				elseif getElementModel(Mashin) == 580 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.25)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
					setElementData(Mashin,"drag", 1.25)
				elseif getElementModel(Mashin) == 542 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.2)
					setVehicleHandling(Mashin, "dragCoeff",1.2)
					setElementData(Mashin,"drag", 1.2)
				elseif getElementModel(Mashin) == 411 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.19 )
					setVehicleHandling(Mashin, "dragCoeff",1.19)
					setElementData(Mashin,"drag", 1.19)
				elseif getElementModel(Mashin) == 490 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.85 )
					setVehicleHandling(Mashin, "dragCoeff", 0.85)
					setElementData(Mashin,"drag", 0.85)
				elseif getElementModel(Mashin) == 562 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.1 )
					setVehicleHandling(Mashin, "dragCoeff", 1.1)
					setElementData(Mashin,"drag", 1.1)
				elseif getElementModel(Mashin) == 541 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.2 )
					setVehicleHandling(Mashin, "dragCoeff",1.2)
					setElementData(Mashin,"drag", 1.2)
				elseif getElementModel(Mashin) == 445 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.25 )
					setVehicleHandling(Mashin, "dragCoeff",1.25)
					setElementData(Mashin,"drag", 1.25)
				elseif getElementModel(Mashin) == 439 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1 )
					setVehicleHandling(Mashin, "dragCoeff",1)
					setElementData(Mashin,"drag", 1)
				elseif getElementModel(Mashin) == 526 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.15 )
					setVehicleHandling(Mashin, "dragCoeff",1.15)
					setElementData(Mashin,"drag", 1.15)
				elseif getElementModel(Mashin) == 587 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.45 )
					setVehicleHandling(Mashin, "dragCoeff", 1.45)
					setElementData(Mashin,"drag", 1.45)
				elseif getElementModel(Mashin) == 589 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 0.9 )
					setVehicleHandling(Mashin, "dragCoeff", 0.9)
					setElementData(Mashin,"drag", 0.9)
					
				elseif getElementModel(Mashin) == 422 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.3 )
					setVehicleHandling(Mashin, "dragCoeff", 1.3)
					setElementData(Mashin,"drag", 1.3)
				elseif getElementModel(Mashin) == 402 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.27 )
					setVehicleHandling(Mashin, "dragCoeff", 1.27)
					setElementData(Mashin,"drag", 1.27)
				elseif getElementModel(Mashin) == 451 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.09 )
					setVehicleHandling(Mashin, "dragCoeff", 1.09)
					setElementData(Mashin,"drag", 1.09)
				elseif getElementModel(Mashin) == 579 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.27 )
					setVehicleHandling(Mashin, "dragCoeff", 1.27)
					setElementData(Mashin,"drag", 1.27)
					
				-----------------------------------------------	
				elseif getElementModel(Mashin) == 551 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.34 )
					setVehicleHandling(Mashin, "dragCoeff", 1.34)
					setElementData(Mashin,"drag", 1.34)
					
				elseif getElementModel(Mashin) == 517 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.24 )
					setVehicleHandling(Mashin, "dragCoeff", 1.24)
					setElementData(Mashin,"drag", 1.24)
					
				elseif getElementModel(Mashin) == 426 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					vehSys:setVehicleData(CarID, "vShetab", ShetabBede)
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setElementData(Mashin,"shetab", ShetabBede)
					vehSys:setVehicleData(CarID, "vDrag", 1.12 )
					setVehicleHandling(Mashin, "dragCoeff", 1.12)
					setElementData(Mashin,"drag", 1.12)
				--------------------------------------------------------
				
				end
					vehSys:setVehicleData(CarID, "vEngineDrag", 1 )
					setElementData(Mashin,"enginedrag", 1)
				
				-->> -->> Traction Loss <<-- <<--
			elseif tonumber(NowTune) == 28 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1)
					setVehicleHandling(Mashin, "tractionLoss", 1)
					setElementData(Mashin,"farmon1", 1)
			elseif tonumber(NowTune) == 29 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.1)
					setVehicleHandling(Mashin, "tractionLoss", 1.1)
					setElementData(Mashin,"farmon1", 1.1)
			elseif tonumber(NowTune) == 30 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.2)
					setVehicleHandling(Mashin, "tractionLoss", 1.2)
					setElementData(Mashin,"farmon1", 1.2)
			elseif tonumber(NowTune) == 31 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.3)
					setVehicleHandling(Mashin, "tractionLoss", 1.3)
					setElementData(Mashin,"farmon1", 1.3)
			elseif tonumber(NowTune) == 32 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.4)
					setVehicleHandling(Mashin, "tractionLoss", 1.4)
					setElementData(Mashin,"farmon1", 1.4)
			elseif tonumber(NowTune) == 33 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.5)
					setVehicleHandling(Mashin, "tractionLoss", 1.5)
					setElementData(Mashin,"farmon1", 1.5)
			elseif tonumber(NowTune) == 34 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.6)
					setVehicleHandling(Mashin, "tractionLoss", 1.6)
					setElementData(Mashin,"farmon1", 1.6)
			elseif tonumber(NowTune) == 35 then
					vehSys:setVehicleData(CarID, "vFarmon1", 1.7)
					setVehicleHandling(Mashin, "tractionLoss", 1.7)
					setElementData(Mashin,"farmon1", 1.7)
					
				-->> -->> Traction Multiplier <<-- <<--
			elseif tonumber(NowTune) == 36 then
					vehSys:setVehicleData(CarID, "vFarmon", 1)
					setVehicleHandling(Mashin, "tractionMultiplier", 1)
					setElementData(Mashin,"farmon", 1)
			elseif tonumber(NowTune) == 37 then
					vehSys:setVehicleData(CarID, "vFarmon", 1.1)
					setVehicleHandling(Mashin, "tractionMultiplier", 1.1)
					setElementData(Mashin,"farmon", 1.1)
			elseif tonumber(NowTune) == 38 then
					vehSys:setVehicleData(CarID, "vFarmon", 1.2)
					setVehicleHandling(Mashin, "tractionMultiplier", 1.2)
					setElementData(Mashin,"farmon", 1.2)
			elseif tonumber(NowTune) == 39 then
					vehSys:setVehicleData(CarID, "vFarmon", 1.3)
					setVehicleHandling(Mashin, "tractionMultiplier", 1.3)
					setElementData(Mashin,"farmon", 1.3)
			elseif tonumber(NowTune) == 40 then
					vehSys:setVehicleData(CarID, "vFarmon", 1.4)
					setVehicleHandling(Mashin, "tractionMultiplier", 1.4)
					setElementData(Mashin,"farmon", 1.4)
			elseif tonumber(NowTune) == 41 then
					vehSys:setVehicleData(CarID, "vFarmon", 1.5)
					setVehicleHandling(Mashin, "tractionMultiplier", 1.5)
					setElementData(Mashin,"farmon", 1.5)
					
					-->> -->> Tormoz <<-- <<--
			elseif tonumber(NowTune) == 42 then
					vehSys:setVehicleData(CarID, "vTormoz", 15)
					setVehicleHandling(Mashin, "brakeDeceleration", 15)
					setElementData(Mashin,"tormoz", 15)
			elseif tonumber(NowTune) == 43 then
					vehSys:setVehicleData(CarID, "vTormoz", 30)
					setVehicleHandling(Mashin, "brakeDeceleration", 30)
					setElementData(Mashin,"tormoz", 30)
			elseif tonumber(NowTune) == 44 then
					vehSys:setVehicleData(CarID, "vTormoz", 45)
					setVehicleHandling(Mashin, "brakeDeceleration", 45)
					setElementData(Mashin,"tormoz", 45)
					
					-->> -->> Engine Type <<-- <<--
			elseif tonumber(NowTune) == 45 then
					vehSys:setVehicleData(CarID, "vDriveType", "awd")
					setVehicleHandling(Mashin, "driveType", "awd")
					setElementData(Mashin,"drivetype", "awd")
			elseif tonumber(NowTune) == 46 then
					vehSys:setVehicleData(CarID, "vDriveType", "fwd")
					setVehicleHandling(Mashin, "driveType", "fwd")
					setElementData(Mashin,"drivetype", "fwd")
					

					-->> -->> Lower Limit (KafKhab) <<-- <<--
			elseif tonumber(NowTune) == 47 then 
					vehSys:setVehicleData(CarID, "vLowerLimit", 14)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30)
					setElementData(Mashin,"lowerlimit", 14)
			elseif tonumber(NowTune) == 48 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 13)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25)
					setElementData(Mashin,"lowerlimit", 13)
			elseif tonumber(NowTune) == 49 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 12)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20)
					setElementData(Mashin,"lowerlimit", 12)
			elseif tonumber(NowTune) == 50 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 11)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15)
					setElementData(Mashin,"lowerlimit", 11)
			elseif tonumber(NowTune) == 51 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 10)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10)
					setElementData(Mashin,"lowerlimit", 10)
			elseif tonumber(NowTune) == 52 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 9)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09)
					setElementData(Mashin,"lowerlimit", 9)
			elseif tonumber(NowTune) == 53 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 8)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08)
					setElementData(Mashin,"lowerlimit", 8)
			elseif tonumber(NowTune) == 54 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 7)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07)
					setElementData(Mashin,"lowerlimit", 7)
			elseif tonumber(NowTune) == 55 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 6)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06)
					setElementData(Mashin,"lowerlimit", 6)
			elseif tonumber(NowTune) == 56 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 5)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05)
					setElementData(Mashin,"lowerlimit", 5)
			elseif tonumber(NowTune) == 57 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 4)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04)
					setElementData(Mashin,"lowerlimit", 4)
			elseif tonumber(NowTune) == 58 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 3)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03)
					setElementData(Mashin,"lowerlimit", 3)
			elseif tonumber(NowTune) == 59 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 2)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02)
					setElementData(Mashin,"lowerlimit", 2)
			elseif tonumber(NowTune) == 60 then
					vehSys:setVehicleData(CarID, "vLowerLimit", 1)
					setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01)
					setElementData(Mashin,"lowerlimit", 1)
					
					-->> -->> Center Mass <<-- <<--
			elseif tonumber(NowTune) == 61 then
					vehSys:setVehicleData(CarID, "vCenterMass", 1)
					setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.3} )
					setElementData(Mashin,"centermass", 1)
			elseif tonumber(NowTune) == 62 then
					vehSys:setVehicleData(CarID, "vCenterMass", 2)
					setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.4} )
					setElementData(Mashin,"centermass", 2)
			elseif tonumber(NowTune) == 63 then
					vehSys:setVehicleData(CarID, "vCenterMass", 3)
					setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.5} )
					setElementData(Mashin,"centermass", 3)
					
					-->> -->> Spoiler <<-- <<--
			elseif tonumber(NowTune) == 64 then
				addVehicleUpgrade ( Mashin, 1000 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1000)
				setElementData(Mashin,"spoiler", 1000)
			elseif tonumber(NowTune) == 65 then
				addVehicleUpgrade ( Mashin, 1001 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1001)
				setElementData(Mashin,"spoiler", 1001)
			elseif tonumber(NowTune) == 66 then
				addVehicleUpgrade ( Mashin, 1002 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1002)
				setElementData(Mashin,"spoiler", 1002)
			elseif tonumber(NowTune) == 67 then
				addVehicleUpgrade ( Mashin, 1003 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1003)
				setElementData(Mashin,"spoiler", 1003)
			elseif tonumber(NowTune) == 68 then
				addVehicleUpgrade ( Mashin, 1014 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1014)
				setElementData(Mashin,"spoiler", 1014)
			elseif tonumber(NowTune) == 69 then
				addVehicleUpgrade ( Mashin, 1015 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1015)
				setElementData(Mashin,"spoiler", 1015)
			elseif tonumber(NowTune) == 70 then
				addVehicleUpgrade ( Mashin, 1016 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1016)
				setElementData(Mashin,"spoiler", 1016)
			elseif tonumber(NowTune) == 71 then
				addVehicleUpgrade ( Mashin, 1023 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1023)
				setElementData(Mashin,"spoiler", 1023)
			elseif tonumber(NowTune) == 72 then
				addVehicleUpgrade ( Mashin, 1049 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1049)
				setElementData(Mashin,"spoiler", 1049)
			elseif tonumber(NowTune) == 73 then
				addVehicleUpgrade ( Mashin, 1050 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1050)
				setElementData(Mashin,"spoiler", 1050)
			elseif tonumber(NowTune) == 74 then
				addVehicleUpgrade ( Mashin, 1058 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1058)
				setElementData(Mashin,"spoiler", 1058)
			elseif tonumber(NowTune) == 75 then
				addVehicleUpgrade ( Mashin, 1060 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1060)
				setElementData(Mashin,"spoiler", 1060)
			elseif tonumber(NowTune) == 76 then
				addVehicleUpgrade ( Mashin, 1138 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1138)
				setElementData(Mashin,"spoiler", 1138)
			elseif tonumber(NowTune) == 77 then
				addVehicleUpgrade ( Mashin, 1139 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1139)
				setElementData(Mashin,"spoiler", 1139)
			elseif tonumber(NowTune) == 78 then
				addVehicleUpgrade ( Mashin, 1146 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1146)
				setElementData(Mashin,"spoiler", 1146)
			elseif tonumber(NowTune) == 79 then
				addVehicleUpgrade ( Mashin, 1147 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1147)
				setElementData(Mashin,"spoiler", 1147)
			elseif tonumber(NowTune) == 80 then
				addVehicleUpgrade ( Mashin, 1158 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1158)
				setElementData(Mashin,"spoiler", 1158)
			elseif tonumber(NowTune) == 81 then
				addVehicleUpgrade ( Mashin, 1162 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1162)
				setElementData(Mashin,"spoiler", 1162)
			elseif tonumber(NowTune) == 82 then
				addVehicleUpgrade ( Mashin, 1163 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1163)
				setElementData(Mashin,"spoiler", 1163)
			elseif tonumber(NowTune) == 83 then
				addVehicleUpgrade ( Mashin, 1164 )
				vehSys:setVehicleData(CarID, "vSpoiler", 1164)
				setElementData(Mashin,"spoiler", 1164)

				-->> -->> Sus Force <<-- <<--
			elseif tonumber(NowTune) == 84 then	
				vehSys:setVehicleData(CarID, "vSusForce", 0.5)
				setVehicleHandling(Mashin, "suspensionForceLevel", 0.5)
				setElementData(Mashin,"susforce", 0.5)
			elseif tonumber(NowTune) == 85 then	
				vehSys:setVehicleData(CarID, "vSusForce", 0.6)
				setVehicleHandling(Mashin, "suspensionForceLevel", 0.6)
				setElementData(Mashin,"susforce", 0.6)
			elseif tonumber(NowTune) == 86 then	
				vehSys:setVehicleData(CarID, "vSusForce", 0.7)
				setVehicleHandling(Mashin, "suspensionForceLevel", 0.7)
				setElementData(Mashin,"susforce", 0.7)
			elseif tonumber(NowTune) == 87 then	
				vehSys:setVehicleData(CarID, "vSusForce", 0.8)
				setVehicleHandling(Mashin, "suspensionForceLevel", 0.8)
				setElementData(Mashin,"susforce", 0.8)
			elseif tonumber(NowTune) == 88 then	
				vehSys:setVehicleData(CarID, "vSusForce", 0.9)
				setVehicleHandling(Mashin, "suspensionForceLevel", 0.9)
				setElementData(Mashin,"susforce", 0.9)
			elseif tonumber(NowTune) == 89 then	
				vehSys:setVehicleData(CarID, "vSusForce", 1)
				setVehicleHandling(Mashin, "suspensionForceLevel", 1)
				setElementData(Mashin,"susforce", 1)
			elseif tonumber(NowTune) == 90 then	
				vehSys:setVehicleData(CarID, "vSusForce", 1.2)
				setVehicleHandling(Mashin, "suspensionForceLevel", 1.2)
				setElementData(Mashin,"susforce", 1.2)
			elseif tonumber(NowTune) == 91 then	
				vehSys:setVehicleData(CarID, "vSusForce", 1.4)
				setVehicleHandling(Mashin, "suspensionForceLevel", 1.4)
				setElementData(Mashin,"susforce", 1.4)
			elseif tonumber(NowTune) == 92 then	
				vehSys:setVehicleData(CarID, "vSusForce", 1.6)
				setVehicleHandling(Mashin, "suspensionForceLevel", 1.6)
				setElementData(Mashin,"susforce", 1.6)
			elseif tonumber(NowTune) == 93 then	
				vehSys:setVehicleData(CarID, "vSusForce", 1.8)
				setVehicleHandling(Mashin, "suspensionForceLevel", 1.8)
				setElementData(Mashin,"susforce", 1.8)
			elseif tonumber(NowTune) == 94 then	
				vehSys:setVehicleData(CarID, "vSusForce", 2)
				setVehicleHandling(Mashin, "suspensionForceLevel", 2)
				setElementData(Mashin,"susforce", 2)
			elseif tonumber(NowTune) == 95 then	
				vehSys:setVehicleData(CarID, "vSusForce", 2.2)
				setVehicleHandling(Mashin, "suspensionForceLevel", 2.2)
				setElementData(Mashin,"susforce", 2.2)
			elseif tonumber(NowTune) == 96 then	
				vehSys:setVehicleData(CarID, "vSusForce", 2.4)
				setVehicleHandling(Mashin, "suspensionForceLevel", 2.4)
				setElementData(Mashin,"susforce", 2.4)
			elseif tonumber(NowTune) == 97 then	
				vehSys:setVehicleData(CarID, "vSusForce", 2.6)
				setVehicleHandling(Mashin, "suspensionForceLevel", 2.6)
				setElementData(Mashin,"susforce", 2.6)
			elseif tonumber(NowTune) == 98 then	
				vehSys:setVehicleData(CarID, "vSusForce", 2.8)
				setVehicleHandling(Mashin, "suspensionForceLevel", 2.8)
				setElementData(Mashin,"susforce", 2.8)
			elseif tonumber(NowTune) == 99 then	
				vehSys:setVehicleData(CarID, "vSusForce", 3)
				setVehicleHandling(Mashin, "suspensionForceLevel", 3)
				setElementData(Mashin,"susforce", 3)
		
			
				-- #Tune
			end
		end
	end
	
end

-- Teste Ejrai Ba Click (Ring, Hydraulics, Tarh)
function TuneCarTest(CarID, NowTuneTest)
	for index, Mashin in ipairs( getElementsByType("vehicle") ) do
		if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
			if tonumber(NowTuneTest) == 1 then addVehicleUpgrade ( Mashin, 1073 )-- Ring
			elseif tonumber(NowTuneTest) == 2 then addVehicleUpgrade ( Mashin, 1074 )-- Ring
			elseif tonumber(NowTuneTest) == 3 then addVehicleUpgrade ( Mashin, 1075 )-- Ring
			elseif tonumber(NowTuneTest) == 4 then addVehicleUpgrade ( Mashin, 1076 )-- Ring
			elseif tonumber(NowTuneTest) == 5 then addVehicleUpgrade ( Mashin, 1077 )-- Ring
			elseif tonumber(NowTuneTest) == 6 then addVehicleUpgrade ( Mashin, 1078 )-- Ring
			elseif tonumber(NowTuneTest) == 7 then addVehicleUpgrade ( Mashin, 1079 )-- Ring
			elseif tonumber(NowTuneTest) == 8 then addVehicleUpgrade ( Mashin, 1080 )-- Ring
			elseif tonumber(NowTuneTest) == 9 then addVehicleUpgrade ( Mashin, 1081 )-- Ring
			elseif tonumber(NowTuneTest) == 10 then addVehicleUpgrade ( Mashin, 1082 )-- Ring
			elseif tonumber(NowTuneTest) == 11 then addVehicleUpgrade ( Mashin, 1083 )-- Ring
			elseif tonumber(NowTuneTest) == 12 then addVehicleUpgrade ( Mashin, 1084 )-- Ring
			elseif tonumber(NowTuneTest) == 13 then addVehicleUpgrade ( Mashin, 1085 )-- Ring
			elseif tonumber(NowTuneTest) == 14 then addVehicleUpgrade ( Mashin, 1096 )-- Ring
			elseif tonumber(NowTuneTest) == 15 then addVehicleUpgrade ( Mashin, 1097 )-- Ring
			elseif tonumber(NowTuneTest) == 16 then addVehicleUpgrade ( Mashin, 1098 )-- Ring
			elseif tonumber(NowTuneTest) == 17 then addVehicleUpgrade ( Mashin, 1087 )-- Hydraulics
			elseif tonumber(NowTuneTest) == 18 then removeVehicleUpgrade ( Mashin, 1087 )-- Remove Hydraulics
			elseif tonumber(NowTuneTest) == 19 then setVehiclePaintjob (Mashin, 0) -- Tarh
			elseif tonumber(NowTuneTest) == 20 then setVehiclePaintjob (Mashin, 1) -- Tarh
			elseif tonumber(NowTuneTest) == 21 then setVehiclePaintjob (Mashin, 2) -- Tarh
			elseif tonumber(NowTuneTest) == 22 then setVehiclePaintjob (Mashin, 3) --Default Tarh
			
			elseif tonumber(NowTuneTest) == 23 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30) --Lower Limit
			elseif tonumber(NowTuneTest) == 24 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25) --Lower Limit
			elseif tonumber(NowTuneTest) == 25 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20) --Lower Limit
			elseif tonumber(NowTuneTest) == 26 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15) --Lower Limit
			elseif tonumber(NowTuneTest) == 27 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10) --Lower Limit
			elseif tonumber(NowTuneTest) == 28 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09) --Lower Limit
			elseif tonumber(NowTuneTest) == 29 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08) --Lower Limit
			elseif tonumber(NowTuneTest) == 30 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07) --Lower Limit
			elseif tonumber(NowTuneTest) == 31 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06) --Lower Limit
			elseif tonumber(NowTuneTest) == 32 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05) --Lower Limit
			elseif tonumber(NowTuneTest) == 33 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04) --Lower Limit
			elseif tonumber(NowTuneTest) == 34 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03) --Lower Limit
			elseif tonumber(NowTuneTest) == 35 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02) --Lower Limit
			elseif tonumber(NowTuneTest) == 36 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01) --Lower Limit
			
			elseif tonumber(NowTuneTest) == 37 then addVehicleUpgrade ( Mashin, 1000 )-- Spoiler
			elseif tonumber(NowTuneTest) == 38 then addVehicleUpgrade ( Mashin, 1001 )-- Spoiler
			elseif tonumber(NowTuneTest) == 39 then addVehicleUpgrade ( Mashin, 1002 )-- Spoiler
			elseif tonumber(NowTuneTest) == 40 then addVehicleUpgrade ( Mashin, 1003 )-- Spoiler
			elseif tonumber(NowTuneTest) == 41 then addVehicleUpgrade ( Mashin, 1014 )-- Spoiler
			elseif tonumber(NowTuneTest) == 42 then addVehicleUpgrade ( Mashin, 1015 )-- Spoiler
			elseif tonumber(NowTuneTest) == 43 then addVehicleUpgrade ( Mashin, 1016 )-- Spoiler
			elseif tonumber(NowTuneTest) == 44 then addVehicleUpgrade ( Mashin, 1023 )-- Spoiler
			elseif tonumber(NowTuneTest) == 45 then addVehicleUpgrade ( Mashin, 1049 )-- Spoiler
			elseif tonumber(NowTuneTest) == 46 then addVehicleUpgrade ( Mashin, 1050 )-- Spoiler
			elseif tonumber(NowTuneTest) == 47 then addVehicleUpgrade ( Mashin, 1058 )-- Spoiler
			elseif tonumber(NowTuneTest) == 48 then addVehicleUpgrade ( Mashin, 1060 )-- Spoiler
			elseif tonumber(NowTuneTest) == 49 then addVehicleUpgrade ( Mashin, 1138 )-- Spoiler
			elseif tonumber(NowTuneTest) == 50 then addVehicleUpgrade ( Mashin, 1139 )-- Spoiler
			elseif tonumber(NowTuneTest) == 51 then addVehicleUpgrade ( Mashin, 1146 )-- Spoiler
			elseif tonumber(NowTuneTest) == 52 then addVehicleUpgrade ( Mashin, 1147 )-- Spoiler
			elseif tonumber(NowTuneTest) == 53 then addVehicleUpgrade ( Mashin, 1158 )-- Spoiler
			elseif tonumber(NowTuneTest) == 54 then addVehicleUpgrade ( Mashin, 1162 )-- Spoiler
			elseif tonumber(NowTuneTest) == 55 then addVehicleUpgrade ( Mashin, 1163 )-- Spoiler
			elseif tonumber(NowTuneTest) == 56 then addVehicleUpgrade ( Mashin, 1164 )-- Spoiler
			
		
			
			
			end
			-- #Test1
		end
	end
end

function TestKon (thePlayer, Moshtari, CarID, NowTuneTest )
	local veh = getPedOccupiedVehicle(thePlayer)
	local id = getElementModel(veh)
	if id == 412 then 
		if tonumber(NowTuneTest) == 17 then exports["notf"]:addNotification(thePlayer, "In Mashin Hydraulic Ra Support Nemikonad!" , 'error') triggerClientEvent ( thePlayer, "PlayError", thePlayer) return false end
	end
	setElementData(thePlayer, "NowTuneTest", NowTuneTest)
	setElementData(thePlayer, "CarID", CarID)
	TuneCarTest(	getElementData(thePlayer,"CarID"),	getElementData(thePlayer,"NowTuneTest"))
end
addEvent("TestKon",true)
addEventHandler("TestKon", root, TestKon)


-- #Test2
function TestTimer(CarID, TimerTest) -- #VeCtoR
	for index, Mashin in ipairs( getElementsByType("vehicle") ) do
		if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
			if tonumber(TimerTest) == 1 then --Ultra
				local Soratesh = getElementData(Mashin,"maxspeed")
				local MaxSpeedBede = tonumber(Soratesh) + 80
				setVehicleHandling(Mashin, "maxVelocity", MaxSpeedBede)
			elseif tonumber(TimerTest) == 2 then
				if getElementModel(Mashin) == 494 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.4)
				 elseif getElementModel(Mashin) == 502 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.98)
				 elseif getElementModel(Mashin) == 527 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.15)
				 elseif getElementModel(Mashin) == 503 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.14)
				 elseif getElementModel(Mashin) == 602 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.15)
				elseif getElementModel(Mashin) == 400 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.34)
				elseif getElementModel(Mashin) == 535 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.8)
				elseif getElementModel(Mashin) == 429 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.3)
				elseif getElementModel(Mashin) == 475 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.16)
				elseif getElementModel(Mashin) == 480 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.1)
				elseif getElementModel(Mashin) == 436 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.95)
				elseif getElementModel(Mashin) == 415 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.24)
				elseif getElementModel(Mashin) == 558 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.08)
				elseif getElementModel(Mashin) == 529 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.08)
				elseif getElementModel(Mashin) == 506 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.97)
				elseif getElementModel(Mashin) == 567 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
				elseif getElementModel(Mashin) == 534 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.94)
				elseif getElementModel(Mashin) == 575 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.87)
				elseif getElementModel(Mashin) == 560 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.8)
				elseif getElementModel(Mashin) == 554 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.28)
				elseif getElementModel(Mashin) == 404 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.96)
					--- Mashin Hay Ke dar Pain Miad Test Nashode Dragesh **
				elseif getElementModel(Mashin) == 496 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.75)
				elseif getElementModel(Mashin) == 424 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1)
				elseif getElementModel(Mashin) == 536 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
				elseif getElementModel(Mashin) == 467 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.67)
				elseif getElementModel(Mashin) == 545 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.95)
				elseif getElementModel(Mashin) == 540 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.17)
				elseif getElementModel(Mashin) == 482 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.05)
				elseif getElementModel(Mashin) == 565 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.18)
				elseif getElementModel(Mashin) == 585 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.73)
				elseif getElementModel(Mashin) == 500 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.02)
				elseif getElementModel(Mashin) == 550 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.8)
				elseif getElementModel(Mashin) == 504 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
				elseif getElementModel(Mashin) == 555 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.38)
				elseif getElementModel(Mashin) == 477 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.2)
				elseif getElementModel(Mashin) == 412 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.17)
				elseif getElementModel(Mashin) == 580 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
				elseif getElementModel(Mashin) == 542 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.2)
				elseif getElementModel(Mashin) == 411 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.19)
				elseif getElementModel(Mashin) == 490 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.85)
				elseif getElementModel(Mashin) == 562 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.1)
				elseif getElementModel(Mashin) == 541 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.2)
				elseif getElementModel(Mashin) == 445 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.25)
				elseif getElementModel(Mashin) == 439 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1)
				elseif getElementModel(Mashin) == 526 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.15)
				elseif getElementModel(Mashin) == 587 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.45)
				elseif getElementModel(Mashin) == 589 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 0.9)
				elseif getElementModel(Mashin) == 422 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.3)
			    elseif getElementModel(Mashin) == 402 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.27)
				elseif getElementModel(Mashin) == 451 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.09)
				elseif getElementModel(Mashin) == 579 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.27)
				elseif getElementModel(Mashin) == 517 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.24)
			    elseif getElementModel(Mashin) == 426 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.12)
				elseif getElementModel(Mashin) == 551 then
					local Shetbahesh = getElementData(Mashin,"shetab")
					local ShetabBede = tonumber(Shetbahesh) + 2
					setVehicleHandling(Mashin, "engineAcceleration", ShetabBede)
					setVehicleHandling(Mashin, "dragCoeff", 1.34)
				
				end
			elseif tonumber(TimerTest) == 3 then setVehicleHandling(Mashin, "driveType", "awd")
			elseif tonumber(TimerTest) == 4 then setVehicleHandling(Mashin, "driveType", "fwd")
			
			elseif tonumber(TimerTest) == 5 then setVehicleHandling(Mashin, "brakeDeceleration", 15)
			elseif tonumber(TimerTest) == 6 then setVehicleHandling(Mashin, "brakeDeceleration", 30)
			elseif tonumber(TimerTest) == 7 then setVehicleHandling(Mashin, "brakeDeceleration", 45)
			
			elseif tonumber(TimerTest) == 28 then setVehicleHandling(Mashin, "tractionLoss", 1)
			elseif tonumber(TimerTest) == 29 then setVehicleHandling(Mashin, "tractionLoss", 1.1)
			elseif tonumber(TimerTest) == 30 then setVehicleHandling(Mashin, "tractionLoss", 1.2)
			elseif tonumber(TimerTest) == 31 then setVehicleHandling(Mashin, "tractionLoss", 1.3)
			elseif tonumber(TimerTest) == 32 then setVehicleHandling(Mashin, "tractionLoss", 1.4)
			elseif tonumber(TimerTest) == 33 then setVehicleHandling(Mashin, "tractionLoss", 1.5)
			elseif tonumber(TimerTest) == 34 then setVehicleHandling(Mashin, "tractionLoss", 1.6)
			elseif tonumber(TimerTest) == 35 then setVehicleHandling(Mashin, "tractionLoss", 1.7)
			
			elseif tonumber(TimerTest) == 36 then setVehicleHandling(Mashin, "tractionMultiplier", 1)
			elseif tonumber(TimerTest) == 37 then setVehicleHandling(Mashin, "tractionMultiplier", 1.1)
			elseif tonumber(TimerTest) == 38 then setVehicleHandling(Mashin, "tractionMultiplier", 1.2)
			elseif tonumber(TimerTest) == 39 then setVehicleHandling(Mashin, "tractionMultiplier", 1.3)
			elseif tonumber(TimerTest) == 40 then setVehicleHandling(Mashin, "tractionMultiplier", 1.4)
			elseif tonumber(TimerTest) == 41 then setVehicleHandling(Mashin, "tractionMultiplier", 1.5)
		
			elseif tonumber(TimerTest) == 42 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30)
			elseif tonumber(TimerTest) == 43 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25)
			elseif tonumber(TimerTest) == 44 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20)
			elseif tonumber(TimerTest) == 45 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15)
			elseif tonumber(TimerTest) == 46 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10)
			elseif tonumber(TimerTest) == 47 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09)
			elseif tonumber(TimerTest) == 48 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08)
			elseif tonumber(TimerTest) == 49 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07)
			elseif tonumber(TimerTest) == 50 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06)
			elseif tonumber(TimerTest) == 51 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05)
			elseif tonumber(TimerTest) == 52 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04)
			elseif tonumber(TimerTest) == 53 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03)
			elseif tonumber(TimerTest) == 54 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02)
			elseif tonumber(TimerTest) == 55 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01)
			
			elseif tonumber(TimerTest) == 56 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.3} )
			elseif tonumber(TimerTest) == 57 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.4} )
			elseif tonumber(TimerTest) == 58 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.5} )
			
			elseif tonumber(TimerTest) == 59 then setVehicleHandling(Mashin, "suspensionForceLevel", 0.5)
			elseif tonumber(TimerTest) == 60 then setVehicleHandling(Mashin, "suspensionForceLevel", 0.6)
			elseif tonumber(TimerTest) == 61 then setVehicleHandling(Mashin, "suspensionForceLevel", 0.7)
			elseif tonumber(TimerTest) == 62 then setVehicleHandling(Mashin, "suspensionForceLevel", 0.8)
			elseif tonumber(TimerTest) == 63 then setVehicleHandling(Mashin, "suspensionForceLevel", 0.9)
			elseif tonumber(TimerTest) == 64 then setVehicleHandling(Mashin, "suspensionForceLevel", 1)
			elseif tonumber(TimerTest) == 65 then setVehicleHandling(Mashin, "suspensionForceLevel", 1.2)
			elseif tonumber(TimerTest) == 66 then setVehicleHandling(Mashin, "suspensionForceLevel", 1.4)
			elseif tonumber(TimerTest) == 67 then setVehicleHandling(Mashin, "suspensionForceLevel", 1.6)
			elseif tonumber(TimerTest) == 68 then setVehicleHandling(Mashin, "suspensionForceLevel", 1.8)
			elseif tonumber(TimerTest) == 69 then setVehicleHandling(Mashin, "suspensionForceLevel", 2)
			elseif tonumber(TimerTest) == 70 then setVehicleHandling(Mashin, "suspensionForceLevel", 2.2)
			elseif tonumber(TimerTest) == 71 then setVehicleHandling(Mashin, "suspensionForceLevel", 2.4)
			elseif tonumber(TimerTest) == 72 then setVehicleHandling(Mashin, "suspensionForceLevel", 2.6)
			elseif tonumber(TimerTest) == 73 then setVehicleHandling(Mashin, "suspensionForceLevel", 2.8)
			elseif tonumber(TimerTest) == 74 then setVehicleHandling(Mashin, "suspensionForceLevel", 3)
			
			
			
			
			end
		end
	end
end



function TestKonTimer (thePlayer, Moshtari, CarID, TimerTest )
	local find = miscSys:findPlayer(Moshtari)
	if find then
		local x,y,z = getElementPosition(thePlayer)
		if tonumber(getDistanceBetweenPoints3D(x,y,z,1764.908203125 ,-1702.51171875 ,24.10000038147)) < 5 or tonumber(getDistanceBetweenPoints3D(x,y,z,1765.7021484375 ,-1687.5859375 ,24.10000038147)) < 5  or tonumber(getDistanceBetweenPoints3D(x,y,z,1765.5380859375 ,-1717.20703125 ,24.10000038147)) < 5 then
			if getElementData(thePlayer, "TestCarID") == CarID or getElementData(thePlayer, "TestCarID") == nil or getElementData(thePlayer, "TestCarID") == false then
				for index, Mashin in ipairs( getElementsByType("vehicle") ) do

				if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
					if tonumber(TimerTest) == 1 then
						if getElementData(Mashin,"engineultra") == 1 then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "In Mashin Engine Ultra Darad!" , 'error') return false end
					 elseif tonumber(TimerTest) == 2 then
						if getElementData(Mashin,"enginedrag") == 1 then  triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "In Mashin Engine Drag Darad!" , 'error') return false end
					 elseif tonumber(TimerTest) == 3 then
						if getElementData(Mashin,"drivetype") == "awd" then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "Differential In Mashin Dar Hal Hazer [awd] Ast!" , 'error') return false end
					 elseif tonumber(TimerTest) == 4 then
						if getElementData(Mashin,"drivetype") == "fwd" then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "Differential In Mashin Dar Hal Hazer [fwd] Ast!" , 'error') return false end	
					 elseif tonumber(TimerTest) == 5 then
						if getElementData(Mashin,"tormoz") == 15 then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "Tormoz In Mashin Dar Hal Hazer [Low] Mibashad!" , 'error') return false end
					 elseif tonumber(TimerTest) == 6 then
						if getElementData(Mashin,"tormoz") == 30 then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "Tormoz In Mashin Dar Hal Hazer [Medium] Mibashad!" , 'error') return false end
					 elseif tonumber(TimerTest) == 7 then
						if getElementData(Mashin,"tormoz") == 45 then triggerClientEvent ( thePlayer, "PlayError", thePlayer)
						exports["notf"]:addNotification(thePlayer, "Tormoz In Mashin Dar Hal Hazer [High] Mibashad!" , 'error') return false end
					end
				end
			end
			for index, Mashin in ipairs( getElementsByType("vehicle") ) do
				if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
				
					if tonumber(TimerTest) == 1 then
						if getElementData(Mashin, "NowTestTimerU") == 1 then
							exports["notf"]:addNotification(thePlayer, "Shoma Dar Hale Teste Engine Ultra Hastid!" , 'error')
							triggerClientEvent ( thePlayer, "PlayError", thePlayer)
							return false
						else
							setElementData(Mashin, "NowTestTimerU", 1)
						end
					end
				
					if tonumber(TimerTest) == 2 then
						if getElementData(Mashin, "NowTestTimerDrag") == 1 then
							exports["notf"]:addNotification(thePlayer, "Shoma Dar Hale Teste Engine Drag Hastid!" , 'error')
							triggerClientEvent ( thePlayer, "PlayError", thePlayer)
							return false
						else
							setElementData(Mashin, "NowTestTimerDrag", 1)
						end
					end
					
						
					if tonumber(TimerTest) >= 42 and tonumber(TimerTest) < 56 then
						setElementData(Mashin, "NowTestTimer", 15)
					else
						setElementData(Mashin, "NowTestTimer", 1)
					end

				

				end
			end
			

			
			
			exports["notf"]:addNotification(find, "Teste Ghete Tavasote Mechanic "..getPlayerName(thePlayer).." Baraye 5 Daghighe Roye Khodro Shoma Emal Shod!" , 'info')
			triggerClientEvent ( find, "Playinfo", find)
			exports["notf"]:addNotification(thePlayer, "Teste In Ghete Baraye 5 Daghighe Baraye In Khodro Emal Shod!" , 'success')
			triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
			setElementData(thePlayer, "NewTuneTestTime", TimerTest)
			--setElementData(thePlayer, "DarHaleTestTune", true)
			setElementData(thePlayer, "CarID", CarID)
			setElementData(thePlayer, "TestCarID", CarID)
			TestTimer(	getElementData(thePlayer,"CarID"),	getElementData(thePlayer,"NewTuneTestTime"))
			killTimer (TimereTestMC)
			TimereTestMC = setTimer( function () -- End She Time Test
				for index, Mashin in ipairs( getElementsByType("vehicle") ) do
					if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
						local Soratesh = getElementData(Mashin,"maxspeed") setVehicleHandling(Mashin, "maxVelocity", Soratesh)
						local Shetabeesh = getElementData(Mashin,"shetab") setVehicleHandling(Mashin, "engineAcceleration", Shetabeesh)
						local Dragesh = getElementData(Mashin,"drag") setVehicleHandling(Mashin, "dragCoeff", Dragesh )
						local DrviveTypesh = getElementData(Mashin,"drivetype") setVehicleHandling(Mashin, "driveType", DrviveTypesh )
						local Tormozesh = getElementData(Mashin,"tormoz") setVehicleHandling(Mashin, "brakeDeceleration", Tormozesh )
						local Farmonesh = getElementData(Mashin,"farmon") setVehicleHandling(Mashin, "tractionMultiplier", Farmonesh )
						local Farmonesh1 = getElementData(Mashin,"farmon1") setVehicleHandling(Mashin, "tractionLoss", Farmonesh1 )
						
						local lowerlimitesh = tonumber(getElementData(Mashin,"lowerlimit"))
						if lowerlimitesh == 0 then setVehicleHandling(Mashin, "suspensionLowerLimit", nil)
						 elseif lowerlimitesh == 14 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30)
						 elseif lowerlimitesh == 13 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25)
						 elseif lowerlimitesh == 12 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20)
						 elseif lowerlimitesh == 11 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15)
						 elseif lowerlimitesh == 10 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10)
						 elseif lowerlimitesh == 9 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09)
						 elseif lowerlimitesh == 8 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08)
						 elseif lowerlimitesh == 7 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07)
						 elseif lowerlimitesh == 6 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06)
						 elseif lowerlimitesh == 5 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05)
						 elseif lowerlimitesh == 4 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04)
						 elseif lowerlimitesh == 3 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03)
						 elseif lowerlimitesh == 2 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02)
						 elseif lowerlimitesh == 1 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01)
						end
						
						local centermassesh = tonumber(getElementData(Mashin,"centermass"))
						if centermassesh == 0 then setVehicleHandling(Mashin, "centerOfMass", nil)
						 elseif centermassesh == 1 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.3} )
						 elseif centermassesh == 2 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.4} )
						 elseif centermassesh == 3 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.5} )
						end
						
						local susforceshn = getElementData(Mashin,"susforce") 
						if tonumber(susforceshn) == nil then
							setVehicleHandling(Mashin, "suspensionForceLevel", nil )
						else
							setVehicleHandling(Mashin, "suspensionForceLevel", tonumber(susforceshn) )
						end
						
						setElementData(Mashin, "NowTestTimerDrag", 0)
						setElementData(Mashin, "NowTestTimerU", 0)
						setElementData(Mashin, "NowTestTimer", 0)
						
						--setElementData(thePlayer, "DarHaleTestTune", false)
					end
				end
				setElementData(thePlayer, "TestCarID", nil)
				exports["notf"]:addNotification(find, "Time Test Be Etmam Resid!" , 'info')
				triggerClientEvent ( find, "Playinfo", find)
				exports["notf"]:addNotification(thePlayer, "Time Test Be Etmam Resid!" , 'info')
				triggerClientEvent ( thePlayer, "Playinfo", thePlayer)
			end, 300000, 1)
		else
			exports["notf"]:addNotification(thePlayer, "Shoma Roye Mashin Digei Ghete Test Andakhteid Sabr Konid Tamom She Ya Laghv Test Konid!" , 'error')
			triggerClientEvent ( thePlayer, "PlayError", thePlayer)
		end
		end
	end
end
addEvent("TimerTestKon",true)
addEventHandler("TimerTestKon", root, TestKonTimer)


function KillTimerTune (thePlayer, Moshtari, CarID, TimerTest)
	local find = miscSys:findPlayer(Moshtari)
	if find then
		for index, Mashin in ipairs( getElementsByType("vehicle") ) do
			if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == CarID then
				if tonumber(getElementData(Mashin, "NowTestTimer")) == 1 or tonumber(getElementData(Mashin, "NowTestTimer")) == 15 then
					local Soratesh = getElementData(Mashin,"maxspeed") setVehicleHandling(Mashin, "maxVelocity", Soratesh)
						local Shetabeesh = getElementData(Mashin,"shetab") setVehicleHandling(Mashin, "engineAcceleration", Shetabeesh)
						local Dragesh = getElementData(Mashin,"drag") setVehicleHandling(Mashin, "dragCoeff", Dragesh )
						local DrviveTypesh = getElementData(Mashin,"drivetype") setVehicleHandling(Mashin, "driveType", DrviveTypesh )
						local Tormozesh = getElementData(Mashin,"tormoz") setVehicleHandling(Mashin, "brakeDeceleration", Tormozesh )
						local Farmonesh = getElementData(Mashin,"farmon") setVehicleHandling(Mashin, "tractionMultiplier", Farmonesh )
						local Farmonesh1 = getElementData(Mashin,"farmon1") setVehicleHandling(Mashin, "tractionLoss", Farmonesh1 )
						
						local lowerlimitesh = tonumber(getElementData(Mashin,"lowerlimit"))
						if lowerlimitesh == 0 then setVehicleHandling(Mashin, "suspensionLowerLimit", nil)
						 elseif lowerlimitesh == 14 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.30)
						 elseif lowerlimitesh == 13 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.25)
						 elseif lowerlimitesh == 12 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.20)
						 elseif lowerlimitesh == 11 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.15)
						 elseif lowerlimitesh == 10 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.10)
						 elseif lowerlimitesh == 9 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.09)
						 elseif lowerlimitesh == 8 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.08)
						 elseif lowerlimitesh == 7 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.07)
						 elseif lowerlimitesh == 6 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.06)
						 elseif lowerlimitesh == 5 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.05)
						 elseif lowerlimitesh == 4 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.04)
						 elseif lowerlimitesh == 3 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.03)
						 elseif lowerlimitesh == 2 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.02)
						 elseif lowerlimitesh == 1 then setVehicleHandling(Mashin, "suspensionLowerLimit", -0.01)
						end
						
						local centermassesh = tonumber(getElementData(Mashin,"centermass"))
						if centermassesh == 0 then setVehicleHandling(Mashin, "centerOfMass", nil)
						 elseif centermassesh == 1 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.3} )
						 elseif centermassesh == 2 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.4} )
						 elseif centermassesh == 3 then setVehicleHandling(Mashin, "centerOfMass", {0.0, 0.3, -0.5} )
						end
						
						local susforceshn = getElementData(Mashin,"susforce") 
						if tonumber(susforceshn) == nil then
							setVehicleHandling(Mashin, "suspensionForceLevel", nil )
						else
							setVehicleHandling(Mashin, "suspensionForceLevel", tonumber(susforceshn) )
						end
						killTimer (TimereTestMC)
						exports["notf"]:addNotification(thePlayer, "Teste Tune In Khodro Laghv Shod!" , 'info')
						exports["notf"]:addNotification(find, "Teste Tune In Khodro Tavasote Mechanic "..getPlayerName(thePlayer).." Laghv Shod!" , 'info')
						triggerClientEvent ( thePlayer, "Playinfo", thePlayer)
						triggerClientEvent ( find, "Playinfo", find)
						setElementData(Mashin, "NowTestTimer", 0)
						setElementData(Mashin, "NowTestTimerDrag", 0)
						setElementData(Mashin, "NowTestTimerU", 0)
						setElementData(thePlayer, "TestCarID", nil)
				else
					exports["notf"]:addNotification(thePlayer, "Shoma Ro In Mashin Ghetei Test Nakardid!" , 'error')
					triggerClientEvent ( thePlayer, "PlayError", thePlayer)
				end
			end
		end
	end
end
addEvent("KillTimerTune",true)
addEventHandler("KillTimerTune", root, KillTimerTune)

function EtelaatTuneSetKon (root)
	local theVehicle = getPedOccupiedVehicle ( root )
	local VaaziatDrag = tonumber(getElementData(theVehicle,"enginedrag"))
	local VaaziatUltra = tonumber(getElementData(theVehicle,"engineultra"))

	Trloc = tonumber(getElementData(theVehicle,"farmon1"))
	if Trloc > 0 and Trloc < 1 then  TractionLossesh = 1
	elseif Trloc > 0 and Trloc < 1.1 then  TractionLossesh = 1
	elseif Trloc > 1 and Trloc < 1.2 then  TractionLossesh = 1.1
	elseif Trloc > 1.1 and Trloc < 1.3 then  TractionLossesh = 1.2
	elseif Trloc > 1.2 and Trloc < 1.4 then  TractionLossesh = 1.3
	elseif Trloc > 1.3 and Trloc < 1.5 then  TractionLossesh = 1.4
	elseif Trloc > 1.4 and Trloc < 1.6 then  TractionLossesh = 1.5
	elseif Trloc > 1.5 and Trloc < 1.7 then  TractionLossesh = 1.6
	elseif Trloc > 1.6 and Trloc < 1.8 then  TractionLossesh = 1.7 end
	
	Trmult = tonumber(getElementData(theVehicle,"farmon"))
	if Trmult > 0 and Trmult < 1 then  TractionMultiplieresh = 1
	elseif Trmult > 0 and Trmult < 1.1 then  TractionMultiplieresh = 1
	elseif Trmult > 1 and Trmult < 1.2 then  TractionMultiplieresh = 1.1
	elseif Trmult > 1.1 and Trmult < 1.3 then  TractionMultiplieresh = 1.2
	elseif Trmult > 1.2 and Trmult < 1.4 then  TractionMultiplieresh = 1.3
	elseif Trmult > 1.3 and Trmult < 1.5 then  TractionMultiplieresh = 1.4
	elseif Trmult > 1.4 and Trmult < 1.6 then  TractionMultiplieresh = 1.5
	elseif Trmult > 1.5 and Trmult < 1.7 then  TractionMultiplieresh = 1.6
	elseif Trmult > 1.6 and Trmult < 1.8 then  TractionMultiplieresh = 1.7 end
	
	local Tormozesh = tonumber(getElementData(theVehicle,"tormoz"))
	local Ringesh = tonumber(getElementData(theVehicle,"ring"))
	local VaaziatHydraulicsh = tonumber(getElementData(theVehicle,"hydraulic"))
	local VaaziatNitrosh = tonumber(getElementData(theVehicle,"nitro"))
	local Differentialesh = getElementData(theVehicle,"drivetype")
	--[[
	SusFN = tonumber(getElementData(theVehicle,"susforce"))
	if SusFN >= 0.5 and  SusFN <= 3 then SusForceNumber = "Default" end
	if SusFN > 0.4 and SusFN < 0.6 then  SusForceNumber = 0.5
	elseif SusFN > 0.5 and SusFN < 0.7 then  SusForceNumber = 0.6
	elseif SusFN > 0.6 and SusFN < 0.8 then  SusForceNumber = 0.7
	elseif SusFN > 0.7 and SusFN < 0.9 then  SusForceNumber = 0.8
	elseif SusFN > 0.9 and SusFN < 1.1 then  SusForceNumber = 1
	elseif SusFN > 1.1 and SusFN < 1.3 then  SusForceNumber = 1.2
	elseif SusFN > 1.3 and SusFN < 1.5 then  SusForceNumber = 1.4
	elseif SusFN > 1.5 and SusFN < 1.7 then  SusForceNumber = 1.6
	elseif SusFN > 1.7 and SusFN < 1.9 then  SusForceNumber = 1.8
	elseif SusFN > 1.9 and SusFN < 2.1 then  SusForceNumber = 2
	elseif SusFN > 2.1 and SusFN < 2.3 then  SusForceNumber = 2.2
	elseif SusFN > 2.3 and SusFN < 2.5 then  SusForceNumber = 2.4
	elseif SusFN > 2.5 and SusFN < 2.7 then  SusForceNumber = 2.6
	elseif SusFN > 2.7 and SusFN < 2.9 then  SusForceNumber = 2.8
	elseif SusFN > 2.9 and SusFN < 3.1 then  SusForceNumber = 3 end
	--]]
	
	SusForceNumber2 = tonumber(getElementData(theVehicle,"susforce"))
	if SusForceNumber2 == nil then SusForceNumber = "Default" else SusForceNumber = tonumber(getElementData(theVehicle,"susforce")) end

	
	
	local LowerLimit2 = tonumber(getElementData(theVehicle,"lowerlimit"))
	if LowerLimit2 == 0 then LowerLimit = "Default"
	elseif LowerLimit2 == 14 then LowerLimit = "+3"
	elseif LowerLimit2 == 13 then LowerLimit = "+2"
	elseif LowerLimit2 == 12 then LowerLimit = "+1"
	elseif LowerLimit2 == 11 then LowerLimit = "1 (Normal)"
	elseif LowerLimit2 == 10 then LowerLimit = "-1"
	elseif LowerLimit2 == 9 then LowerLimit = "-2"
	elseif LowerLimit2 == 8 then LowerLimit = "-3"
	elseif LowerLimit2 == 7 then LowerLimit = "-4"
	elseif LowerLimit2 == 6 then LowerLimit = "-5"
	elseif LowerLimit2 == 5 then LowerLimit = "-6"
	elseif LowerLimit2 == 4 then LowerLimit = "-7"
	elseif LowerLimit2 == 3 then LowerLimit = "-8"
	elseif LowerLimit2 == 2 then LowerLimit = "-9"
	elseif LowerLimit2 == 1 then LowerLimit = "-10" end
	
	local Spoileresh11 = tonumber(getElementData(theVehicle,"spoiler"))
	if Spoileresh11 == 0 then Spoileresh1 = "Default"
	elseif Spoileresh11 == 1000 then Spoileresh1 = 1
	elseif Spoileresh11 == 1001 then Spoileresh1 = 2
	elseif Spoileresh11 == 1002 then Spoileresh1 = 3
	elseif Spoileresh11 == 1003 then Spoileresh1 = 4
	elseif Spoileresh11 == 1014 then Spoileresh1 = 5
	elseif Spoileresh11 == 1015 then Spoileresh1 = 6
	elseif Spoileresh11 == 1016 then Spoileresh1 = 7
	elseif Spoileresh11 == 1023 then Spoileresh1 = 8
	elseif Spoileresh11 == 1049 then Spoileresh1 = 9
	elseif Spoileresh11 == 1050 then Spoileresh1 = 10
	elseif Spoileresh11 == 1058 then Spoileresh1 = 11
	elseif Spoileresh11 == 1060 then Spoileresh1 = 12
	elseif Spoileresh11 == 1138 then Spoileresh1 = 13
	elseif Spoileresh11 == 1139 then Spoileresh1 = 14
	elseif Spoileresh11 == 1146 then Spoileresh1 = 15
	elseif Spoileresh11 == 1147 then Spoileresh1 = 16
	elseif Spoileresh11 == 1158 then Spoileresh1 = 17
	elseif Spoileresh11 == 1162 then Spoileresh1 = 18
	elseif Spoileresh11 == 1163 then Spoileresh1 = 19
	elseif Spoileresh11 == 1164 then Spoileresh1 = 20 end
	
	
	CMassDb2 = tonumber(getElementData(theVehicle,"centermass"))
	if CMassDb2 == 0 then CMassDb = "Default"
	elseif CMassDb2 == 1 then CMassDb = "-0.3 (Medium)"
	elseif CMassDb2 == 2 then CMassDb = "-0.4 (High)"
	elseif CMassDb2 == 3 then CMassDb = "-0.5 (Very High)" end
	
	
	if VaaziatDrag == 1 then
		Dragsh = "Active"
	else
		Dragsh = "inactive"
	end
	if VaaziatUltra == 1 then
		ultrash = "Active"
	else
		ultrash = "inactive"
	end
	
	if VaaziatHydraulicsh == 1 then
		Hydraulicsh = "Active"
	else
		Hydraulicsh = "inactive"
	end
	
	if VaaziatNitrosh == 1 then
		Nitrosh = "2x"
	elseif VaaziatNitrosh == 2 then
		Nitrosh = "5x"
	elseif VaaziatNitrosh == 3 then
	    Nitrosh = "10x"
	elseif VaaziatNitrosh == 0 then
	     Nitrosh = "inactive"
	end

	
	enginedrag = getElementData(theVehicle,"shetab")
	triggerClientEvent("UpstatTunePlayer", root, root, Dragsh, ultrash, TractionLossesh, TractionMultiplieresh, Tormozesh,Ringesh,Hydraulicsh,Nitrosh,Differentialesh, LowerLimit, CMassDb, Spoileresh1, SusForceNumber)
end
addEvent("UpdateSheTuneCarMechanic",true)
addEventHandler("UpdateSheTuneCarMechanic", root, EtelaatTuneSetKon)




MarkerKhorojGarage = createMarker(1795.357421875 ,-1687.7001953125 ,23,"cylinder",6,0,0,0,0)
local dbpTime = 1500
function CanselRing (thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
		local vehicleID = getElementData(theVehicle,"vehicleID")
		local pName = getPlayerName(thePlayer)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local vOwner = row['vOwner']
				if pName == vOwner then
					local vID = row['vID']
					if getElementData(theVehicle,"vehicleID") and getElementData(theVehicle,"vehicleID") == vID then
						local Ringesh = row['vWheels']
						if Ringesh ~= 0 then
							addVehicleUpgrade ( theVehicle, Ringesh )
						else
						removeVehicleUpgrade (theVehicle,1073) removeVehicleUpgrade (theVehicle,1074) removeVehicleUpgrade (theVehicle,1075) removeVehicleUpgrade (theVehicle,1076) removeVehicleUpgrade (theVehicle,1077) removeVehicleUpgrade (theVehicle,1078) removeVehicleUpgrade (theVehicle,1079) removeVehicleUpgrade (theVehicle,1080) removeVehicleUpgrade (theVehicle,1081) removeVehicleUpgrade (theVehicle,1082) removeVehicleUpgrade (theVehicle,1083) removeVehicleUpgrade (theVehicle,1084) removeVehicleUpgrade (theVehicle,1085) removeVehicleUpgrade (theVehicle,1096) removeVehicleUpgrade (theVehicle,1097) removeVehicleUpgrade (theVehicle,1098)
						end
						
						local Spoileresh = row['vSpoiler']
						if Spoileresh < 1 then
						removeVehicleUpgrade (theVehicle,1000) removeVehicleUpgrade (theVehicle,1001) removeVehicleUpgrade (theVehicle,1002) removeVehicleUpgrade (theVehicle,1003) removeVehicleUpgrade (theVehicle,1014) removeVehicleUpgrade (theVehicle,1015) removeVehicleUpgrade (theVehicle,1016) removeVehicleUpgrade (theVehicle,1023) removeVehicleUpgrade (theVehicle,1049) removeVehicleUpgrade (theVehicle,1050) removeVehicleUpgrade (theVehicle,1058) removeVehicleUpgrade (theVehicle,1060) removeVehicleUpgrade (theVehicle,1138) removeVehicleUpgrade (theVehicle,1139) removeVehicleUpgrade (theVehicle,1146) removeVehicleUpgrade (theVehicle,1147) removeVehicleUpgrade (theVehicle,1158) removeVehicleUpgrade (theVehicle,1162) removeVehicleUpgrade (theVehicle,1163) removeVehicleUpgrade (theVehicle,1164)
						else
							addVehicleUpgrade ( theVehicle, Spoileresh )
						end
						if getElementData(theVehicle, "NowTestTimer") ~= 15 then
							local vLLimit = row['vLowerLimit']
							if vLLimit == 0 then setVehicleHandling(theVehicle, "suspensionLowerLimit", nil)
								elseif vLLimit == 14 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.30)
								elseif vLLimit == 13 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.25)
								elseif vLLimit == 12 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.20)
								elseif vLLimit == 11 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.15)
								elseif vLLimit == 10 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.10)
								elseif vLLimit == 9 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.09)
								elseif vLLimit == 8 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.08)
								elseif vLLimit == 7 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.07)
								elseif vLLimit == 6 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.06)
								elseif vLLimit == 5 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.05)
								elseif vLLimit == 4 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.04)
								elseif vLLimit == 3 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.03)
								elseif vLLimit == 2 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.02)
								elseif vLLimit == 1 then setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.01)
							end
						end
	
						local Hydraulicsesh = row['vHydraulics']
						if Hydraulicsesh == 0 then removeVehicleUpgrade (theVehicle,1087) elseif Hydraulicsesh == 1 then addVehicleUpgrade ( theVehicle, 1087 ) end
						local Tarhesh = row['vPaintjob']
						if Tarhesh == 0 then setVehiclePaintjob (theVehicle, 3) elseif Tarhesh == 1 then setVehiclePaintjob (theVehicle, 0) elseif Tarhesh == 2 then setVehiclePaintjob (theVehicle, 1) elseif Tarhesh == 3 then setVehiclePaintjob (theVehicle, 2) end	
					end
				end
			end
		end
	end
end
end
addEventHandler("onMarkerLeave",MarkerKhorojGarage,CanselRing)