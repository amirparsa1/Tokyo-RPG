local accSys = exports["accounts-system"]
local miscSys = exports["misc"]

bikemarker = createMarker (-2032.86 ,-116.06254486084 ,1034.1 , "cylinder", 1.3,111,175,230,60 )
carmarker = createMarker (-2033.1 ,-117.9 ,1034.1 , "cylinder", 1.3,111,175,230,60 )
SkinMarker = createMarker (204.173828125 ,-159.78515625 ,1000.5234375 , "cylinder", 1.3,111,175,230,60 )


setElementInterior ( carmarker, 3 )
setElementInterior ( bikemarker, 3 )	




fasele = 6.5
addEventHandler("onMarkerHit",bikemarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pCarLicS")) < 20 then 
			triggerClientEvent("examShowEvent", hitElement, hitElement)
			setElementData(hitElement,"examtype",1)
		else
			triggerClientEvent ( hitElement, "PlayError", hitElement)
			exports["notf"]:addNotification(hitElement, "Shoma Khodeton Govahiname Darid!" , 'error')
		end
	end
end)

addEventHandler("onMarkerHit",carmarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pCarLic")) < 20 then 
			triggerClientEvent("examShowEvent", hitElement, hitElement)
			setElementData(hitElement,"examtype",2)
		else
			triggerClientEvent ( hitElement, "PlayError", hitElement)
			exports["notf"]:addNotification(hitElement, "Shoma Khodeton Govahiname Darid!" , 'error')
		end
	end
end)

local randompos = {
	[1] = {1723.185546875 ,-1890.6728515625 ,13.564561843872,0,0,359.81597900391},
	[2] = {1715.017578125 ,-1891.55859375 ,13.566555023193,0,0,359.81597900391},
	[3] = {1706.6103515625 ,-1890.7109375 ,13.568609237671,0,0,359.81597900391},
}





local mashin = {}

function carghabolshod(root)
	fadeCamera( root, false,0.5)
	setElementData(root,"examtype",nil,false)
	setElementData(root,"incarexam", true)
	outputChatBox("#FFFF00[Test Driving]: #ffffffShoma Ba Mofaghiat Azmone Ranandegi Mashin Ra Ghabol Shodid Baraye Teste Amali Savare Mashin Haye Amozeshgah Shavid!", root, 255, 255, 255, true)



	setTimer(function()
		local c = math.random(1,3)
		mashin = createVehicle( 518, randompos[c][1], randompos[c][2], randompos[c][3], randompos[c][4], randompos[c][5], randompos[c][6] )
		setElementID( mashin, "Amozesh Ranandegi Car" )
		warpPedIntoVehicle(root,mashin,0)
		setElementInterior(root,0)
		fadeCamera(root, true,0.5)
	end,1000,1)
end
addEvent("carghabolshod",true)
addEventHandler("carghabolshod", root, carghabolshod)

function bikeghabolshod(root)
	setElementData(root,"examtype",nil,false)
	setElementData(root,"inbikeexam", true)
	fadeCamera( root, false,0.5)


	setTimer(function()
		local c = math.random(1,3)
		motor = createVehicle( 522, randompos[c][1], randompos[c][2], randompos[c][3], randompos[c][4], randompos[c][5], randompos[c][6] )
		setElementID( motor, "Amozesh Ranandegi Car" )
		warpPedIntoVehicle(root,motor,0)
		setElementInterior(root,0)
		fadeCamera(root, true,0.5)
	end,1000,1)
	outputChatBox("#FFFF00[Test Driving]: #ffffffShoma Ba Mofaghiat Azmone Ranandegi Motor Ra Ghabol Shodid Baraye Teste Amali Savare Motor Haye Amozeshgah Shavid!", root, 255, 255, 255, true)
end
addEvent("bikeghabolshod",true)
addEventHandler("bikeghabolshod", root, bikeghabolshod)

function radshod(root)
	setElementData(root,"examtype",nil,false)
	outputChatBox("#ff0000[Test Driving]: #ffffffShoma Azmon Ra Rad Shodid, Dobare Emtehan Konid!", root, 255, 255, 255, true)
end
addEvent("radshod",true)
addEventHandler("radshod", root, radshod)
local rootElement = getRootElement()
local ExamMarker = createMarker(1819,-1889.5999755859 ,13.39999961853 , "checkpoint", 5.0,112,1,255,266)
setElementDimension ( ExamMarker, 100 )
local ExamLocations = {
{1819.1435546875 ,-1899.677734375 ,13.393351554871},
{1886.7236328125 ,-1934.92578125 ,13.3828125},
{1988.1572265625 ,-1934.8447265625 ,13.3828125},
{2084.19140625 ,-1876.580078125 ,13.325573921204},
{2102.01953125 ,-1730.072265625 ,13.393775939941},
{2115.0517578125 ,-1586.3828125 ,25.856763839722},
{2099.548828125 ,-1459.7587890625 ,23.828125},
{1989.8369140625 ,-1453.099609375 ,13.394361495972},
{1978.580078125 ,-1338.4501953125 ,23.8203125},
{1852.994140625 ,-1329.876953125 ,13.395603179932},
{1839.2119140625 ,-1258.2353515625 ,13.435207366943},
{1698.65234375 ,-1297.2763671875 ,13.47841835022},
{1603.5380859375 ,-1310.638671875 ,17.28125},
{1593.1103515625 ,-1438.3779296875 ,13.390607833862},
{1452.3583984375 ,-1448.2275390625 ,13.374925613403},
{1427.1083984375 ,-1610.4765625 ,13.3828125},
{1421.4345703125 ,-1729.796875 ,13.3828125},
{1386.7763671875 ,-1739.6494140625 ,13.3828125},
{1394.1533203125 ,-1874.7509765625 ,13.3828125},
{1591.6494140625 ,-1874.716796875 ,13.3828125},
{1690.662109375 ,-1849.701171875 ,13.3828125},
{1702.6474609375 ,-1814.8583984375 ,13.366886138916},
{1752.9443359375 ,-1852.1982421875 ,13.4140625},
{1722.919921875 ,-1903.8828125 ,13.564625740051}
}

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end


function mashin ( player, seat, jacked ) 
    local govahinamecar = getElementData(accSys:getPlayerAcc(player), "pCarLic")
if jacked then
	local theVehicle = getPedOccupiedVehicle (jacked)
	local id = getElementModel(theVehicle)
	local vehid = getElementID ( theVehicle )
		if seat == 0 then
		if vehid == "Amozesh Ranandegi Motor" then
		        if getElementData(player,"inbikeexam") ~= true then
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Dar Hale Azmon Bashid!", player, 230,0,0 ,true) --:D
		end
		--Bike
		elseif id == 581 or id == 462 or id == 521 or id == 463 or id == 522 or id == 461 or id == 448 or id == 468 or id == 586 or id == 523 then
		    local govahinamemotor = getElementData(accSys:getPlayerAcc(player), "pCarLicS")
			if tonumber(govahinamemotor) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname MotorSavari Dashte Bashid!", player, 230,0,0 ,true) --:D
			end
		--Fly
		elseif id == 548 or id == 425 or id == 417 or id == 487 or id == 488 or id == 497 or id == 563 or id == 447 or id == 469 or id == 592 
        or id == 577 or id == 511 or id == 512 or id == 593 or id == 520 or id == 553 or id == 476 or id == 519 or id == 460 or id == 513 then
		  local govahinameparvaz = getElementData(accSys:getPlayerAcc(player), "pFlyLic")
		    if tonumber(govahinameparvaz) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Parvaz Dashte Bashid!", player, 230,0,0 ,true) --:D
			end
		--Boat
	    elseif id == 472 or id == 473 or id == 493 or id == 595 or id == 484 or id == 430 or id == 453 or id == 452 or id == 446 or id == 454 then
		  local govahinameghayegh = getElementData(accSys:getPlayerAcc(player), "pBoatLic")
		    if tonumber(govahinameghayegh) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Ghayegh Savari Dashte Bashid!", player, 230,0,0 ,true) --:D

		    end
		--Bike
		elseif id == 481 or id == 509 or id == 510 then
				--outputChatBox ( "#ff0000(!): Hichi :|", player, 230,0,0 ,true) --:D
		elseif vehid == "Amozesh Ranandegi Car" then
		        if getElementData(player,"incarexam") ~= true then
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Dar Hale Azmon Bashid!", player, 230,0,0 ,true) --:D
				end
		else
		  local govahinameMashin = getElementData(accSys:getPlayerAcc(player), "pCarLic")
		    if tonumber(govahinameMashin) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Mashin Savari Dashte Bashid!", player, 230,0,0 ,true) --:D
		    end
		end
end
else
	local theVehicle = getPedOccupiedVehicle (player)
	local id = getElementModel(theVehicle)
	local vehid = getElementID ( theVehicle )
		if seat == 0 then
		if vehid == "Amozesh Ranandegi Motor" then
		        if getElementData(player,"inbikeexam") ~= true then
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Dar Hale Azmon Bashid!", player, 230,0,0 ,true) --:D
		end
		--Bike
		elseif id == 581 or id == 462 or id == 521 or id == 463 or id == 522 or id == 461 or id == 448 or id == 468 or id == 586 or id == 523 then
		    local govahinamemotor = getElementData(accSys:getPlayerAcc(player), "pCarLicS")
			if tonumber(govahinamemotor) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname MotorSavari Dashte Bashid!", player, 230,0,0 ,true) --:D
			end
		--Fly
		elseif id == 548 or id == 425 or id == 417 or id == 487 or id == 488 or id == 497 or id == 563 or id == 447 or id == 469 or id == 592 
        or id == 577 or id == 511 or id == 512 or id == 593 or id == 520 or id == 553 or id == 476 or id == 519 or id == 460 or id == 513 then
		  local govahinameparvaz = getElementData(accSys:getPlayerAcc(player), "pFlyLic")
		    if tonumber(govahinameparvaz) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Parvaz Dashte Bashid!", player, 230,0,0 ,true) --:D
			end
		--Boat
	    elseif id == 472 or id == 473 or id == 493 or id == 595 or id == 484 or id == 430 or id == 453 or id == 452 or id == 446 or id == 454 then
		  local govahinameghayegh = getElementData(accSys:getPlayerAcc(player), "pBoatLic")
		    if tonumber(govahinameghayegh) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Ghayegh Savari Dashte Bashid!", player, 230,0,0 ,true) --:D

		    end
		--Bike
		elseif id == 481 or id == 509 or id == 510 then
				--outputChatBox ( "#ff0000(!): Hichi :|", player, 230,0,0 ,true) --:D
		elseif vehid == "Amozesh Ranandegi Car" then
		        if getElementData(player,"incarexam") ~= true then
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Dar Hale Azmon Bashid!", player, 230,0,0 ,true) --:D
				end
		else
		  local govahinameMashin = getElementData(accSys:getPlayerAcc(player), "pCarLic")
		    if tonumber(govahinameMashin) == 0 then 
				cancelEvent()
				outputChatBox ( "#ff0000✖ #ffffffBaraye Inkar Bayad Govahiname Mashin Savari Dashte Bashid!", player, 230,0,0 ,true) --:D
		    end
		end
end
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), mashin )

--[[addCommandHandler("givelic",
function ( thePlayer, command, player, licid)
local licid = tonumber(licid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) ~= 6 then
		outputChatBox("#ff0000✖ #ffffffBaraye Inkar Lazem Ast Ozv Faction School Bashid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local find = miscSys:findPlayer ( player )
		--if find ~= thePlayer then --niazmand add kardan fasele dar inja 
		if licid then
		if tonumber(licid) > 0 and tonumber(licid) < 5 then
			local targetPlayer = getPlayerName ( find )
			if getElementData(find, "licreq") ~= tostring(getPlayerName(thePlayer)) then
				local Moalem = getPlayerName(thePlayer)
				setElementData(find, "licreq", tostring(Moalem))
				if licid == 1 then
				setElementData(find, "licid", tonumber(licid))
				outputChatBox("#ffff00[School]:#ffffffMoalem #ffff00"..getPlayerName(thePlayer).." #ffffffMikhahad Be Shoma Govahiname Parvaz Ba Gheymat 10,000$ Bedahad!", find, 0, 255, 0,true)
				outputChatBox("#ffff00[School]:#ffffff Baraye Ghabol Kardan Dar Khast /alic Bezanid!", find, 0, 255, 0,true)
				outputChatBox("#00ff00[School]:#ffffffDarkhast License Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
				elseif licid == 2 then
				setElementData(find, "licid", tonumber(licid))
				outputChatBox("#ffff00[School]:#ffffffMoalem #ffff00"..getPlayerName(thePlayer).." #ffffffMikhahad Be Shoma Govahiname Ghayegh Savari Ba Gheymat 10,000$ Bedahad!", find, 0, 255, 0,true)
				outputChatBox("#ffff00[School]:#ffffff Baraye Ghabol Kardan Dar Khast /alic Bezanid!", find, 0, 255, 0,true)
				outputChatBox("#00ff00[School]:#ffffffDarkhast License Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
				elseif licid == 3 then
				setElementData(find, "licid", tonumber(licid))
				outputChatBox("#ffff00[School]:#ffffffMoalem #ffff00"..getPlayerName(thePlayer).." #ffffffMikhahad Be Shoma Mojavez Hamle Mat Ba Gheymat 10,000$ Bedahad!", find, 0, 255, 0,true)
				outputChatBox("#ffff00[School]:#ffffff Baraye Ghabol Kardan Dar Khast /alic Bezanid!", find, 0, 255, 0,true)
				outputChatBox("#00ff00[School]:#ffffffDarkhast License Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
				elseif licid == 4 then
				setElementData(find, "licid", tonumber(licid))
				outputChatBox("#ffff00[School]:#ffffffMoalem #ffff00"..getPlayerName(thePlayer).." #ffffffMikhahad Be Shoma Mojavez Hamle Gun Ba Gheymat 10,000$ Bedahad!", find, 0, 255, 0,true)
				outputChatBox("#ffff00[School]:#ffffff Baraye Ghabol Kardan Dar Khast /alic Bezanid!", find, 0, 255, 0,true)
				outputChatBox("#00ff00[School]:#ffffffDarkhast License Baraye #00ff00"..getPlayerName(find).." #ffffffFerestade Shod!", thePlayer, 0, 255, 0,true)
				end
				setTimer(
				function()
					if getElementData(find, "licreq") ~= nil then
						setElementData(find, "licreq", nil)
						setElementData(find, "licid", nil)
					end
				end , 15000, 1)
			else
				outputChatBox("#ffff00[School]:#ffffffDarkhast Shoma Baraye In Player Ferestade Shode Ast, Montazer Bemanid Ta Accept Konad!", thePlayer, 0, 255, 0,true)
			end
			else
			outputChatBox("#ffff00[School]:#ffffff Id License Vared Shode Sahih Nemibashad!", thePlayer, 0, 255, 0,true)
			outputChatBox("#ffff00[LicID-Help]:#ffffff1: #ffff00Fly | #ffffff2: #ffff00Boat | #ffffff3: #ffffffGun | #ffffff4: #ffff00Mat", thePlayer, 0, 255, 0,true)
			end
			end
		--else
			--outputChatBox("#ff0000[Error]:#ffffffInkar Anjam Nashod!", thePlayer, 0, 255, 0,true)
		--end
end
)

addCommandHandler("alic",
function(thePlayer, cmd)
	if getElementData(thePlayer, "licreq") == nil then
		outputChatBox("#ff00000[School]: #ffffffMoalemi Be Shoma Darkhast Nadade!", thePlayer, 255, 255, 255, true)
		return false
	end
	local money = getPlayerMoney (thePlayer)
	if tonumber(money) > 10000 then
		takePlayerMoney(thePlayer, 10000)
		local licid = getElementData(thePlayer,"licid")
		if tonumber(licid) == 1 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pFlyLic", 200)
		outputChatBox("#00ff00[School]: #ffffffShoma Darkhaste License Fly Ra Paziroftid! (-10,000$ Babat License Fly)", thePlayer, 255, 255, 255, true)
		elseif tonumber(licid) == 2 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pBoatLic", 200)
		outputChatBox("#00ff00[School]: #ffffffShoma Darkhaste License Boat Ra Paziroftid! (-10,000$ Babat License Boat)", thePlayer, 255, 255, 255, true)
		elseif tonumber(licid) == 3 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pMatsLic", 200)
		outputChatBox("#00ff00[School]: #ffffffShoma Darkhaste License Materials Ra Paziroftid! (-10,000$ Babat License Materials)", thePlayer, 255, 255, 255, true)
		elseif tonumber(licid) == 4 then
        setElementData(accSys:getPlayerAcc(thePlayer), "pGunLic", 200)
		outputChatBox("#00ff00[School]: #ffffffShoma Darkhaste License Gun Ra Paziroftid! (-10,000$ Babat License Gun)", thePlayer, 255, 255, 255, true)
		end
		for index, yaru in ipairs(getElementsByType("player")) do 
			if getElementData(thePlayer, "licreq") == getPlayerName(yaru) then
				outputChatBox("#00ff00[School]: #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffDarkhast Shoma Ra Qabool Kard!", yaru, 255, 255, 255, true)
				local pool = getPlayerMoney (yaru)
				givePlayerMoney (yaru , 10000)
				setTimer(function()
					setElementData(thePlayer, "licid", nil)
					setElementData(thePlayer, "licreq", nil)
				end , 100, 1)
			end
		end
	else
		outputChatBox("#ff0000[School]: #ffffffShoma Pool Lazem Baraye Gereftan License Ra Nadarid! (Meqdar Pool Lazem 10,000$)", thePlayer, 255, 255, 255, true)
	end
end
)]]--

function savarexamshod ( thePlayer, seat, jacked ) 
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	local vehid = getElementID ( theVehicle )
	if vehid == "Amozesh Ranandegi Motor" or vehid == "Amozesh Ranandegi Car" then
		if seat == 0 then
			triggerClientEvent("knock", thePlayer, thePlayer)
			outputChatBox("#FFFF00[Test draving]: #ffffffBaraye Takmil Shodan Azmone Ranandegi Marker Ha Ra Donbal Konid!", thePlayer, 255, 255, 0,true)
			resetExam(thePlayer)
			checkExam(thePlayer)
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), savarexamshod ) 

function resetExam(thePlayer)
	if not getElementData(thePlayer, "ExamCheckPoint") then
		setElementData(thePlayer, "ExamCheckPoint", 0)
	else
		setElementData(thePlayer, "ExamCheckPoint", 0)
	end
end

local ExamMarker = {}
local ExamBlip = {}
local ExamMarkerElse = {}
local ExamBlipElse = {}

function checkExam(thePlayer)
	if not getElementData(thePlayer, "ExamCheckPoint") then
		setElementData(thePlayer, "ExamCheckPoint", 0)
		if getElementData(thePlayer, "ExamCheckPoint") == 0 then
			setElementData(thePlayer, "ExamCheckPoint", getElementData(thePlayer, "ExamCheckPoint") + 1)
		elseif getElementData(thePlayer, "ExamCheckPoint") == 14 then
		    givelic(thePlayer)
			setElementData(thePlayer, "ExamCheckPoint", 1)
		else
			local tedadExamCheck = tonumber(getElementData(thePlayer, "ExamCheckPoint"))
			setElementData(thePlayer, "ExamCheckPoint", 0)
			setElementData(thePlayer, "ExamCheckPoint", getElementData(thePlayer, "ExamCheckPoint") + 1)
		end
		local tedadExamCheck = tonumber(getElementData(thePlayer, "ExamCheckPoint"))
		ExamMarker[thePlayer] = createMarker(ExamLocations[tedadExamCheck][1],ExamLocations[tedadExamCheck][2],ExamLocations[tedadExamCheck][3],"checkpoint",3,255,143,30,30, resourceRoot)
		ExamBlip[thePlayer] = createBlipAttachedTo(ExamMarker[thePlayer],0)	
		setElementData(ExamBlip[thePlayer],"blipname","Driving Training Point")
		setElementVisibleTo(ExamBlip[thePlayer],getRootElement(),false)
		setElementVisibleTo(ExamMarker[thePlayer],thePlayer,true)
		setElementVisibleTo(ExamBlip[thePlayer],thePlayer,true)
		setElementData(thePlayer, "onExamMarkerMake", ExamMarker[thePlayer])
		setElementData(thePlayer, "onExamBlipMake", ExamBlip[thePlayer])
		setElementData(ExamMarker[thePlayer], "sahebExamMarker", getPlayerName(thePlayer))
		addEventHandler("onMarkerHit", ExamMarker[thePlayer], hitExamMarker)
	else
		if getElementData(thePlayer, "ExamCheckPoint") == 0 then
			setElementData(thePlayer, "ExamCheckPoint", getElementData(thePlayer, "ExamCheckPoint") + 1)
		elseif getElementData(thePlayer, "ExamCheckPoint") == 24 then
			setElementData(thePlayer, "ExamCheckPoint", 1)
			givelic(thePlayer)
		else
			local tedadExamCheck = tonumber(getElementData(thePlayer, "ExamCheckPoint"))
			setElementData(thePlayer, "ExamCheckPoint", getElementData(thePlayer, "ExamCheckPoint") + 1)
		end
		local tedadExamCheck = tonumber(getElementData(thePlayer, "ExamCheckPoint"))
		ExamMarkerElse[thePlayer] = createMarker(ExamLocations[tedadExamCheck][1],ExamLocations[tedadExamCheck][2],ExamLocations[tedadExamCheck][3],"checkpoint",3,255,143,30,30, resourceRoot)
		ExamBlipElse[thePlayer] = createBlipAttachedTo(ExamMarkerElse[thePlayer],0)
		setElementData(ExamBlipElse[thePlayer], 'blipName', 'Driving Training Point')

		setElementVisibleTo(ExamBlipElse[thePlayer],getRootElement(),false)
		setElementVisibleTo(ExamMarkerElse[thePlayer],thePlayer,true)
		setElementVisibleTo(ExamBlipElse[thePlayer],thePlayer,true)
		setElementData(thePlayer, "onExamMarkerMake", ExamMarkerElse[thePlayer])
		setElementData(thePlayer, "onExamBlipMake", ExamBlipElse[thePlayer])
		setElementData(ExamMarkerElse[thePlayer], "sahebExamMarker", getPlayerName(thePlayer))
		addEventHandler("onMarkerHit", ExamMarkerElse[thePlayer], hitExamMarker)
	end
end

function hitExamMarker(hitElement,matchingDimension)
	if (getElementType(hitElement) == "player" and isPedInVehicle(hitElement))  then
		if getElementData(source, "sahebExamMarker") == getPlayerName(hitElement) then
			local vehicle = getPedOccupiedVehicle(hitElement)
			if getElementData(hitElement, "onExamMarkerMake") then
				destroyElement(getElementData(hitElement, "onExamMarkerMake"))
				destroyElement(getElementData(hitElement, "onExamBlipMake"))
			end
			checkExam(hitElement)
		end
	end
end

function khoroojAzExam(thePlayer, seat, jacked)
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	local vehid = getElementID ( theVehicle )
	if vehid == "Amozesh Ranandegi Motor" or vehid == "Amozesh Ranandegi Car" then
		if seat == 0 then
			if getElementData(thePlayer, "onExamMarkerMake") then
				destroyElement(getElementData(thePlayer, "onExamMarkerMake"))
				destroyElement(getElementData(thePlayer, "onExamBlipMake"))
				outputChatBox("#ff0000[Test Driving]: #ffffffShoma Piade Shodid Va Emtehan Ra Rad Shodid!", thePlayer, 255, 255, 0,true)
				setElementData(thePlayer,"incarexam",nil)
				setElementData(thePlayer,"inbikeexam",nil)
				resetExam(thePlayer)
				

				triggerClientEvent("knock", thePlayer, thePlayer)
				setTimer(destroyElement(theVehicle),2000,1)
				
			end 
		end
	end
end
addEventHandler("onVehicleStartExit", rootElement, khoroojAzExam)
--addEventHandler("onPlayerQuit", rootElement, khoroojAzExam)


-------------------------

-------------------------
function givelic(thePlayer)
	local theVehicle = getPedOccupiedVehicle (thePlayer)
	local vehid = getElementID ( theVehicle )
	if vehid == "Amozesh Ranandegi Motor" or vehid == "Amozesh Ranandegi Car" then
		if getElementData(thePlayer, "onExamMarkerMake") then
			destroyElement(getElementData(thePlayer, "onExamMarkerMake"))
			destroyElement(getElementData(thePlayer, "onExamBlipMake"))
			if getElementData(thePlayer,"incarexam") == true then
				outputChatBox("#00FF00[Test Driving]: #ffffffShoma Ba Movafaghiat Emtehan Ranandegi Mashin Ro Ghabol Shodid! Govahiname Ranadegi Mashin Shoma Baraye 200 Saat Tamdid Shod!", thePlayer, 255, 255, 0,true)
				setElementData(accSys:getPlayerAcc(thePlayer), "pCarLic", 200)
				setElementData(thePlayer,"incarexam",nil)
			elseif getElementData(thePlayer,"inbikeexam") == true then
				outputChatBox("#00FF00[Test Driving]: #ffffffShoma Ba Movafaghiat Emtehan Motor Savari Ro Ghabol Shodid! Govahiname Motor Savari Shoma Baraye 200 Saat Tamdid Shod!", thePlayer, 255, 255, 0,true)
				setElementData(accSys:getPlayerAcc(thePlayer), "pCarLicS", 200)
				setElementData(thePlayer,"inbikeexam",nil)
				setVehicleOverrideLights(theVehicle, 1)
			end
			removePedFromVehicle ( thePlayer )
			triggerClientEvent("knock", thePlayer, thePlayer)
			resetExam(thePlayer)
			setVehicleEngineState(theVehicle, false)
			setTimer(destroyElement(theVehicle),2000,1)
			
		end 
	end
end

--function rvcar (thePlayer)
	--local theVehicle = getElementID ( theVehicle )
	--if theVehicle == "exambike1" or theVehicle == "exambike2" or theVehicle == "exambike3" or theVehicle == "exambike4" or theVehicle == "exambike5" or theVehicle == "exambike6" or theVehicle == "exambike7" or theVehicle == "exambike8" or theVehicle == "exambike9" or theVehicle == "exambike10" or theVehicle == "exambike11"
		--or theVehicle == "examcar1" or theVehicle == "examcar2" or theVehicle == "examcar3" or theVehicle == "examcar4" or theVehicle == "examcar5" or theVehicle == "examcar6" or theVehicle == "examcar7" then
		--if ( theVehicle ) then
			--toggleVehicleRespawn ( theVehicle, true ) -- enable vehicle respawn as it is necessary for the idle respawn to function
			--setVehicleIdleRespawnDelay ( theVehicle, 10000 ) -- tell the server to respawn the vehicle 20 seconds after it's been left.
		--end
	--end
--end
--addCommandHandler ("rvcc", rvcar)