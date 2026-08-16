local accSys = exports["Accounts-System"]
local vehSys = exports["[TN]DS"]


addCommandHandler("adminvc",
function ( thePlayer, command)
	if isPedInVehicle (thePlayer) then
		local x,y,z = getElementPosition(thePlayer)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 7 then
			local theVehicle = getPedOccupiedVehicle ( thePlayer )
			if getPlayerName(thePlayer) == getElementData(theVehicle, "owner") then
				triggerClientEvent ( thePlayer, "BiadCPickerForCar", thePlayer)
			else
				exports["notf"]:addNotification(thePlayer,"Inke Mashine Shoma Nist!", 'error')
				triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
			end
		else
			outputChatBox("#ff0000Baraye Inkar Bayad Admin Bashid!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#00ff00Baraye Inkar Bayad Savar Mashin Bashid!", thePlayer, 255, 255, 255, true)
	end
end)

function ResetCarColor(thePlayer, Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB)
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	setVehicleColor( theVehicle, Color1R, Color1G , Color1B , Color2R , Color2G , Color2B)
	setVehicleHeadLightColor ( theVehicle, LightR, LightG, LightB )
end
addEvent("ResetCarColor",true)
addEventHandler("ResetCarColor", root, ResetCarColor)

function UpdateCarColor(thePlayer, Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB , R, G, B , ColorID)
	if getElementData(thePlayer, "loggedIn") == true then
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
	if getElementData(thePlayer ,"VaziatCpickerForCar") == 1 then
		local dbpTime = 500
	 	local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
						local vColor1R = row['vColor1R']
						local vColor1G = row['vColor1G']
						local vColor1B = row['vColor1B']
						local vColor2R = row['vColor2R']
						local vColor2G = row['vColor2G']
						local vColor2B = row['vColor2B']
						local vLightsR = row['vLightsR']
						local vLightsG = row['vLightsG']
						local vLightsB = row['vLightsB']
						setVehicleColor( theVehicle, R , G , B , vColor2R , vColor2G , vColor2B)
						setVehicleHeadLightColor ( theVehicle, vLightsR, vLightsG, vLightsB )
					end
				end
			end
		end
		
		
		
	 elseif getElementData(thePlayer ,"VaziatCpickerForCar") == 2 then
		local dbpTime = 500
	 	local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
						local vColor1R = row['vColor1R']
						local vColor1G = row['vColor1G']
						local vColor1B = row['vColor1B']
						local vColor2R = row['vColor2R']
						local vColor2G = row['vColor2G']
						local vColor2B = row['vColor2B']
						local vLightsR = row['vLightsR']
						local vLightsG = row['vLightsG']
						local vLightsB = row['vLightsB']
						setVehicleColor( theVehicle, vColor1R, vColor1G , vColor1B , R , G , B)
						setVehicleHeadLightColor ( theVehicle, vLightsR, vLightsG, vLightsB )
					end
				end
			end
		end
		
		
		
		
	 elseif getElementData(thePlayer ,"VaziatCpickerForCar") == 3 then
		local dbpTime = 500
	 	local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
						local vColor1R = row['vColor1R']
						local vColor1G = row['vColor1G']
						local vColor1B = row['vColor1B']
						local vColor2R = row['vColor2R']
						local vColor2G = row['vColor2G']
						local vColor2B = row['vColor2B']
						local vLightsR = row['vLightsR']
						local vLightsG = row['vLightsG']
						local vLightsB = row['vLightsB']
						setVehicleColor( theVehicle, vColor1R, vColor1G , vColor1B , vColor2R , vColor2G , vColor2B)
						setVehicleHeadLightColor ( theVehicle, R, G, B )
					end
				end
			end
		end
	end
	end
end
end
addEvent("UpdateCarColor",true)
addEventHandler("UpdateCarColor", root, UpdateCarColor)

local dbpTime = 500
function CanselCarColor (thePlayer)
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
					local vColor1R = row['vColor1R']
					local vColor1G = row['vColor1G']
					local vColor1B = row['vColor1B']
					local vColor2R = row['vColor2R']
					local vColor2G = row['vColor2G']
					local vColor2B = row['vColor2B']
					local vLightsR = row['vLightsR']
					local vLightsG = row['vLightsG']
					local vLightsB = row['vLightsB']
					setVehicleColor( theVehicle, vColor1R, vColor1G, vColor1B, vColor2R, vColor2G, vColor2B )
					setVehicleHeadLightColor ( theVehicle, vLightsR, vLightsG, vLightsB )
				end
			end
		end
	end
	end
	end
end





function SetCarColor(thePlayer, Color1R, Color1G, Color1B, Color2R, Color2G, Color2B, Color3R, Color3G, Color3B, Color4R, Color4G, Color4B, LightR, LightG, LightB , R, G, B , ColorID)
if getElementData(thePlayer, "loggedIn") == true then
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
	local vehicleID = getElementData(theVehicle,"vehicleID")
	if getElementData(thePlayer ,"VaziatCpickerForCar") == 1 then
		if getPlayerMoney( thePlayer ) >= 10000 then
			local dbpTime = 500
			local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
							local vColor1R = row['vColor1R']
							local vColor1G = row['vColor1G']
							local vColor1B = row['vColor1B']
							local vColor2R = row['vColor2R']
							local vColor2G = row['vColor2G']
							local vColor2B = row['vColor2B']
							local vLightsR = row['vLightsR']
							local vLightsG = row['vLightsG']
							local vLightsB = row['vLightsB']
							setVehicleColor( theVehicle, R , G , B , vColor2R , vColor2G , vColor2B)
							setVehicleHeadLightColor ( theVehicle, vLightsR, vLightsG, vLightsB )
						end
					end
				end
			end
			vehSys:setVehicleData(vehicleID, "vColor1R", R)
			vehSys:setVehicleData(vehicleID, "vColor1G", G)
			vehSys:setVehicleData(vehicleID, "vColor1B", B)
			exports["notf"]:addNotification(thePlayer, "Range Mashin Shoma Ba Hazine $10,000 Avaz Shod." , 'success')
			playSoundFrontEnd ( thePlayer, 46 )
			takePlayerMoney ( thePlayer, 10000 )
		else
			exports["notf"]:addNotification(thePlayer, "Shoma Baraye Avaz Kardan Range Mashin Be $10,000 Niaz Darid!" , 'error')
			triggerClientEvent ( thePlayer, "PlayError", thePlayer)
		end
	 elseif getElementData(thePlayer ,"VaziatCpickerForCar") == 2 then
			if getPlayerMoney( thePlayer ) >= 6000 then
				local dbpTime = 500
				local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
								local vColor1R = row['vColor1R']
								local vColor1G = row['vColor1G']
								local vColor1B = row['vColor1B']
								local vColor2R = row['vColor2R']
								local vColor2G = row['vColor2G']
								local vColor2B = row['vColor2B']
								local vLightsR = row['vLightsR']
								local vLightsG = row['vLightsG']
								local vLightsB = row['vLightsB']
								setVehicleColor( theVehicle, vColor1R, vColor1G , vColor1B , R , G , B)
								setVehicleHeadLightColor ( theVehicle, vLightsR, vLightsG, vLightsB )
							end
						end
					end
				end
				vehSys:setVehicleData(vehicleID, "vColor2R", R)
				vehSys:setVehicleData(vehicleID, "vColor2G", G)
				vehSys:setVehicleData(vehicleID, "vColor2B", B)
				exports["notf"]:addNotification(thePlayer, "Range 2 Mashin Shoma Ba Hazine $6,000 Avaz Shod." , 'success')
				playSoundFrontEnd ( thePlayer, 46 )
				takePlayerMoney ( thePlayer, 6000 )
			else
				exports["notf"]:addNotification(thePlayer, "Shoma Baraye Avaz Kardan Range 2 Be $6,000 Niaz Darid!" , 'error')
				triggerClientEvent ( thePlayer, "PlayError", thePlayer)
			end
		 elseif getElementData(thePlayer,"VaziatCpickerForCar") == 3 then -- Age Ghesmate Ceragh Set Kard Rang Baghie Ghesmat Ha Ke Az Ghabl Vase Test Dide Bod meshki Nashe Va Range Asli She
		if getPlayerMoney( thePlayer ) >= 4000 then
			local dbpTime = 500
			local theVehicle = getPedOccupiedVehicle ( thePlayer )
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
							local vColor1R = row['vColor1R']
							local vColor1G = row['vColor1G']
							local vColor1B = row['vColor1B']
							local vColor2R = row['vColor2R']
							local vColor2G = row['vColor2G']
							local vColor2B = row['vColor2B']
							local vLightsR = row['vLightsR']
							local vLightsG = row['vLightsG']
							local vLightsB = row['vLightsB']
							setVehicleColor( theVehicle, vColor1R, vColor1G , vColor1B , vColor2R , vColor2G , vColor2B)
							setVehicleHeadLightColor ( theVehicle, R, G, B )
						end
					end
				end
			end
			vehSys:setVehicleData(vehicleID, "vLightsR", R)
			vehSys:setVehicleData(vehicleID, "vLightsG", G)
			vehSys:setVehicleData(vehicleID, "vLightsB", B)
			exports["notf"]:addNotification(thePlayer, "Range Cheragh Mashin Shoma Ba Hazine $4,000 Avaz Shod." , 'success')
			playSoundFrontEnd ( thePlayer, 46 )
			takePlayerMoney ( thePlayer, 4000 )
		else
			exports["notf"]:addNotification(thePlayer, "Shoma Baraye Avaz Kardan Range Cheragh Be $4,000 Niaz Darid!" , 'error')
			triggerClientEvent ( thePlayer, "PlayError", thePlayer)
		end
		end
		end
	end
end
addEvent("SetCarColor",true)
addEventHandler("SetCarColor", root, SetCarColor)