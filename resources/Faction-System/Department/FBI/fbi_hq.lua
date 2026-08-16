local accSys = exports["Accounts-System"]

	fbiGate = createObject ( 971, 364.89999, -1469.7, 31.3, 0, 0, 38 )
	fbiGate2 = createObject ( 971, 310.89999, -1555, 31.3, 0, 0, 141.996 )
	colFbiGate = createColCircle ( 364.89999, -1469.7, 8 )
	colFbiGate2 = createColCircle ( 310.89999, -1555, 6 )

function enterfbiVehicle ( player, seat, jacked ) 
if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) == 0 or tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) > 3 then
	if seat == 0 then
		if jacked then
			local theVehicle = getPedOccupiedVehicle (jacked)
			local vehid = getElementID ( theVehicle )
			if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4"  then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #2f64e1FBI #ffffffAst Va Shoma Nmitavanid Savar An Shavid", player, 230,0,0 ,true)
			end
		else
			local theVehicle = getPedOccupiedVehicle (player)
			local vehid = getElementID ( theVehicle )
			if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4"  then
			cancelEvent()
			outputChatBox ( "#ff0000[Error]:#ffffffIn Mashin Motalegh Be Faction #2f64e1FBI #ffffffAst Va Shoma Nmitavanid Savar An Shavid", player, 230,0,0 ,true)
		end
	end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), enterfbiVehicle ) 


addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		for index, fbi_cars in ipairs(getElementsByType("vehicle")) do 
			local vehid = getElementID ( fbi_cars )
			if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4"  then
				if not isVehicleOccupied(fbi_cars) then
					respawnVehicle(fbi_cars)
					setElementData( fbi_cars ,"fuel",105)
				end
			end
		end
		for index, fbi_members in ipairs(getElementsByType("player")) do 
			if getElementData(fbi_members, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(fbi_members), "pMember")) == 2 then
					outputChatBox("#2f64e1(FBI):#ffffffTamamie Khodro Haye Faction Tavasote #2f64e1"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", fbi_members, 255, 255, 255, true)
				end
			end
		end
	end
end
)
---------------------------------
-------**Script By zezaw**-------
---------------------------------
	for index, fbi_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( fbi_cars )
			if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4"  then
			toggleVehicleRespawn ( fbi_cars, true )
			setVehicleIdleRespawnDelay ( fbi_cars, 1200000 ) --5Min--
			setElementData( fbi_cars ,"fuel",105)
		end
	end



function setbenzin (thePlayer, cmd)
	for index, fbi_cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( fbi_cars )
			if vehid == "carfbi1" or vehid == "carfbi2" or vehid == "carfbi3" or vehid == "carfbi4" or vehid == "carfbi5" or vehid == "carfbi6" or vehid == "carfbi7" or vehid == "carfbi8" or vehid == "carfbi9" 
			or vehid == "carfbi10" or vehid == "carfbi11" or vehid == "carfbi12" or vehid == "carfbi13" or vehid == "carfbi14" or vehid == "motofbi1" or vehid == "motofbi2" or vehid == "motofbi3" or vehid == "motofbi4"
			or vehid == "motofbi5" or vehid == "motofbi6" or vehid == "motofbi7" or vehid == "motofbi8"or vehid == "motofbi9" or vehid == "motofbi10" or vehid == "helifbi1" or vehid == "helifbi2" or vehid == "helifbi3"
			or vehid == "helifbi4"  then
			if not isVehicleOccupied(fbi_cars) then
			local engine = getVehicleEngineState(fbi_cars)
			if engine == false then
			setElementData( fbi_cars ,"fuel",105)
		end
		end
	end
	end
end
setTimer ( setbenzin, 1200000, 0 ) --5Min--
---------------------------------


function openFbiGate(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		moveObject(fbiGate,3000,364.89999, -1469.7, 11.5)
		setTimer(
		function()
			moveObject(fbiGate,3000,364.89999, -1469.7, 31.3)
		end, 30000, 1)
	end
	end
end
addEventHandler( "onColShapeHit", colFbiGate, openFbiGate )

function closeFbiGate(thePlayer)
	moveObject(fbiGate,3000,364.89999, -1469.7, 31.3)
end
addEventHandler( "onColShapeLeave", colFbiGate, closeFbiGate )

function openFbiGate2(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		moveObject(fbiGate2,3000,310.89999, -1555, 11.5)
		setTimer(
		function()
			moveObject(fbiGate2,3000,310.89999, -1555, 31.3)
		end, 30000, 1)
	end
	end
end
addEventHandler( "onColShapeHit", colFbiGate2, openFbiGate2 )

function closeFbiGate2(thePlayer)
	moveObject(fbiGate2,3000,310.89999, -1555, 31.3)
end
addEventHandler( "onColShapeLeave", colFbiGate2, closeFbiGate2 )











function vhandling ( )
   for _,v in pairs(getElementsByType("vehicle")) do
      if getElementModel(v) == 528 then -------------- vehicle Id
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 0.8)
        --setVehicleHandling(v, "turnMass", 12000)
        setVehicleHandling(v, "maxVelocity", 210.0)
        setVehicleHandling(v, "engineAcceleration", 13.0 )
		setVehicleHandling(v, "brakeDeceleration", 10.0)
        setVehicleHandling(v, "tractionMultiplier", 0.8)
        setVehicleHandling(v, "tractionLoss", 1)
		setVehicleHandling(v, "driveType", "fwd")
		setVehicleHandling(v, "dragCoeff", 1.47 )

        
      end
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), vhandling )




