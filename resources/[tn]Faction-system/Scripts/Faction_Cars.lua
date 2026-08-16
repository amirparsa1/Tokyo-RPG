-- FIX (bugfix pass 2): several guards below were written as
--     if not getElementData(x, "factionVeh") == true then
--   Lua parses that as (not getElementData(...)) == true, i.e. it is only
--   true when the data is false/nil -- the inverse of the intent. The
--   "is this a faction vehicle" check therefore never rejected anything.
--   Rewritten as ~= true.
local accSys = exports["Accounts-system"]
local dbpTime = 500
function CreateFactionCars()
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM factionvehicles;" )
local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local ID = row['ID']
			local faction = row['factionID']
			local Model = row['Model']
			local FactionName = row['FactionName']
			local x = row['parkX']
			local y = row['parkY']
			local z = row['parkZ']
			local rX = row['parkRotX']
			local rY = row['parkRotY']
			local rZ = row['parkRotZ']
			local plate = row['plate']
			local r = row['r']
			local g = row['g']
			local b = row['b']
			local factionVehicle = createVehicle ( tonumber(Model), tonumber(x), tonumber(y), tonumber(z), tonumber(rX), tonumber(rY), tonumber(rZ))
			setElementData( factionVehicle, "factionVeh", true)
			setElementData( factionVehicle, "FactionID", tonumber(faction))
			setElementData( factionVehicle, "FactionName", FactionName)
			setElementData( factionVehicle, "plate", plate)
			setVehicleColor( factionVehicle, r, g, b)
		end
	end
dbFree(query)
end
CreateFactionCars()


addEventHandler ( "onVehicleStartEnter", getRootElement(),
function ( player, seat, jacked ) 
	if seat == 0 then
		if getElementData(source, "factionVeh") ~= true then return false end
		local vehid = getElementID ( source )
		if tonumber(getElementData(accSys:getPlayerAcc(player), "pMember")) ~= tonumber(getElementData(source, "FactionID")) then
			cancelEvent()
			outputChatBox ( "#ff0000Error: #ffffffBaraye Inkar Bayad Ozve "..getElementData(source, "FactionName").." #ffffffBashid! [ "..getElementData(source, "FactionID").." ]", player, 230,0,0 ,true) 
			exports["notf"]:addNotification(player, "In Mashin Faction Shoma Nist" , 'error')
		end		
	end
end)


addCommandHandler("makeveh",
function (thePlayer, cmd, factionID, Model, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
if factionID == nil then exports["notf"]:addNotification(thePlayer, "/makeveh [FactionID] [Model] [FactionName]" , 'error') return false end
if Model < "400" or Model == nil  then exports["notf"]:addNotification(thePlayer, "Model Mashin Bayad Bishtar Az 400 Bashad!" , 'error') return false end
local FactionName = table.concat ( { ... }, " " )
if FactionName == nil then exports["notf"]:addNotification(thePlayer, "/makeveh [FactionID] [Model] [FactionName]" , 'error') return false end
local x,y,z = getElementPosition(thePlayer)
local plate = math.random(1,9999999)
local createSQL = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `factionvehicles` SET `factionID` = ?, `Model` = ?, `FactionName` = ?, `parkX` = ?, `parkY` = ?, `parkZ` = ?,`parkRotX` = ?, `parkRotY` = ?, `parkRotZ` = ?, `plate` = ? ",factionID, Model, FactionName, x, y, z,0,0,0, plate )			
local factionVehicle = createVehicle ( tonumber(Model), tonumber(x+1), tonumber(y+1), tonumber(z))
setElementData( factionVehicle, "factionVeh", true)
setElementData( factionVehicle, "FactionID", tonumber(factionID))
setElementData( factionVehicle, "FactionName", FactionName)
setElementData( factionVehicle, "plate", plate)
exports["notf"]:addNotification(thePlayer, "(Faction-System) Shoma Yek Mashin Baraye Faction ["..factionID.."] Create Kardid." , 'success')
dbFree(createSQL)
end)

addCommandHandler("delveh",
function (thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
local inCar = getPedOccupiedVehicle(thePlayer)
	if inCar then
	if getElementData(inCar, "factionVeh") ~= true then exports["notf"]:addNotification(thePlayer, "(Faction-System) In Vehicle Motalegh Be Faction Nist!" , 'error') return false end
		local plate = getElementData(inCar, "plate")
		local Query = dbQuery(exports.mysql:getMySQLC(), "DELETE FROM factionvehicles WHERE plate = '"..plate.."';")
		dbFree(Query)
		destroyElement(inCar)
	else
		exports["notf"]:addNotification(thePlayer, "(Faction-System) Baraye Inkar Bayad Dakhel Mashin Bashid!" , 'error')
	end
end)

addCommandHandler("parkveh",
function (thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
local inCar = getPedOccupiedVehicle(thePlayer)
	if inCar then
	if getElementData(inCar, "factionVeh") ~= true then exports["notf"]:addNotification(thePlayer, "(Faction-System) In Vehicle Motalegh Be Faction Nist!" , 'error') return false end
		local plate = getElementData(inCar, "plate")
		local x,y,z = getElementPosition(thePlayer)
		local rotX,rotY,rotZ = getElementRotation(thePlayer)
		local Query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factionvehicles` SET `parkX` = '"..x.."', `parkY` = '"..y.."', `parkZ` = '"..z.."', `parkRotX` = '"..rotX.."', `parkRotY` = '"..rotY.."', `parkRotZ` = '"..rotZ.."' WHERE `plate` = '"..plate.."'")
		dbFree(Query)
		exports["notf"]:addNotification(thePlayer, "(Faction-System) Location Park Change Shod!" , 'success')
	else
		exports["notf"]:addNotification(thePlayer, "(Faction-System) Baraye Inkar Bayad Dakhel Mashin Bashid!" , 'error')
	end
end)

addCommandHandler("colorveh",
function (thePlayer, cmd, r, g, b)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
local inCar = getPedOccupiedVehicle(thePlayer)
	if inCar then
	if getElementData(inCar, "factionVeh") ~= true then exports["notf"]:addNotification(thePlayer, "(Faction-System) In Vehicle Motalegh Be Faction Nist!" , 'error') return false end
		if r == nil then exports["notf"]:addNotification(thePlayer, "/colorveh [R (0-255)] [G (0-255)] [B (0-255)]!" , 'error') return false end
		if r > "255" then exports["notf"]:addNotification(thePlayer, "(Faction-System) Color [ R ] Bayad Beyn [0-255] Bashad!" , 'error') return false end
		if g == nil or g > "255" then exports["notf"]:addNotification(thePlayer, "(Faction-System) Color [ G ] Bayad Beyn [0-255] Bashad!" , 'error') return false end
		if b == nil or b > "255" then exports["notf"]:addNotification(thePlayer, "(Faction-System) Color [ R ] Bayad Beyn [0-255] Bashad!" , 'error') return false end
		local plate = getElementData(inCar, "plate")
		local Query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `factionvehicles` SET `r` = '"..tonumber(r).."', `g` = '"..tonumber(g).."', `b` = '"..tonumber(b).."' WHERE `plate` = '"..plate.."'")
		dbFree(Query)
		setVehicleColor( inCar, r, g, b)
		exports["notf"]:addNotification(thePlayer, "(Faction-System) Color Vehicle Change Shod!" , 'success')
	else
		exports["notf"]:addNotification(thePlayer, "(Faction-System) Baraye Inkar Bayad Dakhel Mashin Bashid!" , 'error')
	end
end)



addCommandHandler("rv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) > 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 5 then 
		MyFactionID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))
		for index, FactionMembers in ipairs(getElementsByType("player")) do 
			if getElementData(FactionMembers, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(FactionMembers), "pMember")) == MyFactionID then
					outputChatBox("#ff0000[Faction-Warn]: #FFFFFFTamami Mashin Haye Faction Tavasot #ff0000"..getPlayerName(thePlayer).." #ffffffRespawn Shodand!", FactionMembers, 255, 255, 255, true)
				end
			end
		end
		for index, AllCars in ipairs(getElementsByType("vehicle")) do 
				if tonumber(getElementData(AllCars, "FactionID")) == MyFactionID then
						if not isVehicleOccupied(AllCars) then
							respawnVehicle(AllCars)
						end
				end
		end
	else
		outputChatBox ( "#ff0000Error: Shoma Co-Leader/Leader Factioni Nistid!", thePlayer, 230,0,0 ,true) 
	end
end
)