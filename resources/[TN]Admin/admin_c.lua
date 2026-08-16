-- PuB By @KhodeOxYGeM : )
local gunrv = nil

function gunRVFunction(_, _, _, _, _, _, car)
if gunrv then
	if car and getElementType(car) == "vehicle" then
		triggerServerEvent("gunrv:respawnVehicle", resourceRoot, car)
		outputChatBox("Khodro Respawn Shod!", 25,255,25)
	end
end
end
addEventHandler ("onClientPlayerWeaponFire", localPlayer, gunRVFunction)

addEvent("gunrv:enableOrDisable", true)
addEventHandler("gunrv:enableOrDisable", root,
function ()
    if gunrv == true then
        gunrv = false
		outputChatBox("#ff0000Gun Rv Qeyre Faal Shod!",255,255,0,true)
    else
        gunrv = true
		outputChatBox("#00ff00Gun Rv Faal Shod!",255,255,0,true)
    end
end
)

addEventHandler ( "onClientPlayerDamage",root,
function ()
    if getElementData(source,"godmode") then
        cancelEvent()
    end
end)
 
addEventHandler("onClientPlayerStealthKill",localPlayer,
function (targetPlayer)
    if getElementData(targetPlayer,"godmode") then
        cancelEvent()
    end
end)


addEvent("toggleDS",true)
addEventHandler("toggleDS",getLocalPlayer(),function(thePlayer,Bool,what2)
	if spam then
		return
	end
	guiSetVisible(dsgui["bg"],Bool)
	showCursor(Bool)
	
	if what2 and what2 == "all" then
		guiSetVisible(dsgui["bg"],false)
		guiSetVisible(surebg,false)
		guiSetVisible(alertbg,false)
		showCursor(false)
		setupSpamTimer()
	end
end)

-- For /unban #ExoPrim
local screenWidth3, screenHeight3 = guiGetScreenSize()
local windowWidth3, windowHeight3 = 370, 200
local left3 = screenWidth3/2 - windowWidth3/2
local top3 = screenHeight3/2 - windowHeight3/2
----------------------------------------------------------------------------------------
WindowChange3 = guiCreateWindow(left3,top3,windowWidth3,windowHeight3,"Unban Players ",false)
guiWindowSetSizable(WindowChange3,false)
set3 = guiCreateButton(29,110,310,40,"Unabn",false,WindowChange3)
guiSetProperty(set3, "HoverTextColour", "FF00FF00")
Close3 = guiCreateButton(29,160,310,34,"Cansel",false,WindowChange3)
guiSetProperty(Close3, "HoverTextColour", "FFFE0000")
-----------------------------------------------------------------------------------------									
EditHex3 = guiCreateEdit(138,40,170,28,"",false,WindowChange3)
guiEditSetReadOnly(EditHex3,false)
guiEditSetMaxLength(EditHex3,16)
guiSetVisible ( WindowChange3, false )
Hex3 = guiCreateLabel(49,42,90,17,"Player Name:",false,WindowChange3)
---------------------------------------------------------------------------------------------------------

function Click()
	-- Set
	if source == set3 then
		Hexs3 = tostring(guiGetText(EditHex3)) -- #ExoPrim
		triggerServerEvent("UnBanShePlayer", getRootElement(), getLocalPlayer(), Hexs3)
	-- Close
	elseif source == Close3 then
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
		guiSetVisible ( WindowChange3, false )
		showCursor(false)
		guiSetInputEnabled( false )
---------------------------------------------		
	elseif source == Ghcancelbtn then
		guiSetVisible(WindowChange3, true)
	    showCursor(true)
		sound = playSound("sound/error.mp3",false)
		setSoundVolume(sound,0.9)
--------------------------------------------
	end
end
addEventHandler("onClientGUIClick", root, Click)

addEvent("BiadPaneleUnban",true)
addEventHandler("BiadPaneleUnban",getLocalPlayer(),function()
	guiSetVisible ( WindowChange3, true )
	showCursor(true)
	guiSetInputEnabled( true )
end)








-------- ===== ADM Zombie Server ======= ----------






local isMinimuze = false;
local cursorEnable = false;
local sw,sh = guiGetScreenSize()
local marker;


-- CFG
local keyToggle = "2" -- actived script
local keyApply =  "mouse1" -- teleport 
local keyOnCar = "mouse1" -- сonfirmation for teleporting to the car
local sizePickup = 1.5

function isPauseMenuActive()
	return isMTAWindowActive() or isMinimuze or isConsoleActive() or false 
end


function click()
	if cursorEnable and not isCursorShowing() then
		showCursor(true)
	end
	if isPauseMenuActive() then
		if cursorEnable and isCursorShowing() then
			showCursor(false)
		end 
	end 
	

	if cursorEnable and not isPauseMenuActive() then
		local sx, sy, posX, posY, posZ = getCursorPosition()
		if sx >= 0 and sy >= 0 and sx < sw and sy < sh then
			local camera = {getCameraMatrix()}
			local result, x,y,z,object,normalX, normalY, normalZ,material,lighting,piece = processLineOfSight(camera[1], camera[2], camera[3], posX, posY, posZ, true, true, false, true, false, false, false)
			if result then
				local curX, curY, curZ = getElementPosition(getLocalPlayer())
				local normal = {normalX, normalY, normalZ};
				local hitCord = {x,y,z}
				local car_info;
				local pos = Vector3(hitCord[1], hitCord[2], hitCord[3]) - (Vector3(normal[1], normal[2], normal[3]) * 0.1)
				local zOffset = 8000
				if normal[3] >= 0.5 then zOffset = 1 end
				local result, x,y,z = processLineOfSight(pos:getX(), pos:getY() , pos:getZ() + zOffset, pos:getX(), pos:getY() , pos:getZ() - 0.3,  true, true, false, true, false, false, false)
				
				-- corrector Z
				if result then
					pos = Vector3(x,y,z + 1)
				end
				
				-- delete last marker and create new marker
				if isElement(marker) then
					destroyElement(marker)
				end
				marker = createMarker(pos:getX(), pos:getY() , pos:getZ() + 0.5,"arrow", sizePickup, 255,255,255)
				
				-- Car info
				if object and getElementType(object) == "vehicle" and not getPedOccupiedVehicle(localPlayer) then
					local idCar = getElementModel(object);
					local name = getVehicleName(object);
					car_info = object;
					dxDrawText(string.format("Hold right mouse to teleport to the Vehicle: %s[%d]", name,idCar), sw * sx + 40  , sh * sy - 20 )
				end
				-- dist to point
				local dist = getDistanceBetweenPoints3D(curX, curY, curZ, pos)
				dxDrawText(string.format("Distance: %0.2fm ", dist), sw * sx + 40  , sh * sy )
				
				if getKeyState(keyApply) then
					local car = isInAnyCar(car_info) 
					if car then
					    	-- If the player is already in the car
						if getPedOccupiedVehicle(localPlayer) then
							teleport(car,pos)
						elseif getKeyState(keyOnCar) then -- if press mouse2 and mouse 1 > Teleport to the car
							if CarSeat(object) then -- We get the number of the free passenger seat
								triggerServerEvent("ClickWarp[Teleport]", resourceRoot, object, CarSeat(object))
							else -- If there are no seats available
								teleport(false,pos)
							end
						end
					else -- teleport from your feet
						teleport(false,pos)
					end
					removeMark()
				end 
			end 
		end
	end
end


function teleport(vehicle,pos)
	if getPedOccupiedVehicle(localPlayer) then
		setElementVelocity(vehicle,0,0,0)  -- Stop the car
	end
	setElementPosition (vehicle and vehicle or localPlayer, pos)
end


function isInAnyCar(veh)
	return veh or getPedOccupiedVehicle(localPlayer)
end

function CarSeat(veh)
	for i = 0, getVehicleMaxPassengers(veh) do
		if not getVehicleOccupants(veh)[i] then return i end
	end
	return false 
end

		
function removeMark()
	start()
	if isElement(marker) then
		destroyElement(marker)
	end
end


--

function start()
    local markeradmin = getElementData(localPlayer,"isMarkerAdmin")
    if markeradmin == true then
        cursorEnable = not cursorEnable
        showCursor(cursorEnable)
        if not cursorEnable then 
            removeEventHandler("onClientRender", root, click)
            if isElement(marker) then
                destroyElement(marker)
            end
        else
            addEventHandler("onClientRender", root, click)
        end
    else
        removeEventHandler("onClientRender", root, click)
        if isElement(marker) then
            destroyElement(marker)
            showCursor(false)
        end
    end
end


function resourceInit()
	--outputChatBox("[clickwarp] press "..keyToggle.." to activate")
	bindKey(keyToggle, "down", start)
end

addEventHandler("onClientResourceStart", resourceRoot, resourceInit)


function onClientMinimize()
    isMinimuze = true
end
addEventHandler( "onClientMinimize", root , onClientMinimize )

function onClientRestore()
    isMinimuze = false 
end
addEventHandler("onClientRestore", root ,onClientRestore)


--// noclip by chris1384

--// editable

local speed = {horizontal = 1, vertical = 1}

--//

local activated = false
local pos = {0, 0, 0}

--[[addCommandHandler("fly", function()
	local markeradmin = getElementData(localPlayer,"isMarkerAdmin")
    if markeradmin == true then
		if activated then
			activated = false
			removeEventHandler("onClientPreRender", root, noclipRender)
			outputChatBox("noclip OFF")
		else
			activated = true
			pos = {getElementPosition(localPlayer)}
			addEventHandler("onClientPreRender", root, noclipRender)
			outputChatBox("noclip ON")
		end
	end
end)]]

function noclipRender()

	--if isPedDead(localPlayer) or getCameraTarget() ~= localPlayer or getPedOccupiedVehicle(localPlayer) then --// safety measure
	--	activated = false
	--	removeEventHandler("onClientPreRender", root, noclipRender)
	--	outputChatBox("forced noclip OFF")
	--	return
	--end
	
	local _, _, camera_rotation = getElementRotation(getCamera())
	
	if not isMTAWindowActive() and not isCursorShowing() then --// prevents moving when cursor is visible
		if getKeyState("w") then
			setElementPosition(localPlayer, 
				pos[1]+math.sin(math.rad((getKeyState("d") and 45-camera_rotation) or (getKeyState("a") and -45-camera_rotation) or -camera_rotation))*speed.horizontal,
				pos[2]+math.cos(math.rad((getKeyState("d") and 45-camera_rotation) or (getKeyState("a") and -45-camera_rotation) or -camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("s") then
			setElementPosition(localPlayer, 
				pos[1]-math.sin(math.rad((getKeyState("d") and -45-camera_rotation) or (getKeyState("a") and 45-camera_rotation) or -camera_rotation))*speed.horizontal,
				pos[2]-math.cos(math.rad((getKeyState("d") and -45-camera_rotation) or (getKeyState("a") and 45-camera_rotation) or -camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("d") then
			setElementPosition(localPlayer, 
				pos[1]+math.sin(math.rad(90-camera_rotation))*speed.horizontal,
				pos[2]+math.cos(math.rad(90-camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("a") then
			setElementPosition(localPlayer, 
				pos[1]-math.sin(math.rad(90-camera_rotation))*speed.horizontal,
				pos[2]-math.cos(math.rad(90-camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("space") then
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]+speed.vertical)
			
		elseif getKeyState("lshift") then
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]-speed.vertical)
		else
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]) --// not to mess with gravity
		end
	else
		setElementPosition(localPlayer, pos[1], pos[2], pos[3]) --// not to mess with gravity
	end
	setElementRotation(localPlayer, 0, 0, -camera_rotation)
	
	pos = {getElementPosition(localPlayer)} --// important
end





--// noclip by chris1384 (client-side)

--// editable

local speed = {horizontal = 3, vertical = 1.5}

--//

local activated = false

local pos = {0, 0, 0}

addEvent("command:noclip", true)
addEventHandler("command:noclip", root, function()

	if source == localPlayer then -- useless condition, since the server trigger is always pointing to the player who entered the command
	
		if isPedDead(localPlayer) or getCameraTarget() ~= localPlayer or getPedOccupiedVehicle(localPlayer) then return outputChatBox("noclip could not be activated") end --// safety measure
	
		if activated then
			activated = false
			removeEventHandler("onClientPreRender", root, noclipRender2)
			exports["notf"]:addNotification("Shoma Ba Movafaghiat 'noclip' Ra Off Kardid" , 'success')
		else
			activated = true
			pos = {getElementPosition(localPlayer)}
			addEventHandler("onClientPreRender", root, noclipRender2)
			exports["notf"]:addNotification("Shoma Ba Movafaghiat 'noclip' Ra On Kardid" , 'success')
		end
		
	end
	
end)



function noclipRender2()

	if isPedDead(localPlayer) or getCameraTarget() ~= localPlayer or getPedOccupiedVehicle(localPlayer) then --// safety measure
		activated = false
		removeEventHandler("onClientPreRender", root, noclipRender2)
		outputChatBox("forced noclip OFF")
		return
	end
	
	local _, _, camera_rotation = getElementRotation(getCamera())
	
	if not isMTAWindowActive() and not isCursorShowing() then --// prevents moving when cursor is visible
		if getKeyState("w") then
			setElementPosition(localPlayer, 
				pos[1]+math.sin(math.rad((getKeyState("d") and 45-camera_rotation) or (getKeyState("a") and -45-camera_rotation) or -camera_rotation))*speed.horizontal,
				pos[2]+math.cos(math.rad((getKeyState("d") and 45-camera_rotation) or (getKeyState("a") and -45-camera_rotation) or -camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("s") then
			setElementPosition(localPlayer, 
				pos[1]-math.sin(math.rad((getKeyState("d") and -45-camera_rotation) or (getKeyState("a") and 45-camera_rotation) or -camera_rotation))*speed.horizontal,
				pos[2]-math.cos(math.rad((getKeyState("d") and -45-camera_rotation) or (getKeyState("a") and 45-camera_rotation) or -camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("d") then
			setElementPosition(localPlayer, 
				pos[1]+math.sin(math.rad(90-camera_rotation))*speed.horizontal,
				pos[2]+math.cos(math.rad(90-camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("a") then
			setElementPosition(localPlayer, 
				pos[1]-math.sin(math.rad(90-camera_rotation))*speed.horizontal,
				pos[2]-math.cos(math.rad(90-camera_rotation))*speed.horizontal,
				(getKeyState("space") and pos[3]+speed.vertical) or (getKeyState("lshift") and pos[3]-speed.vertical) or pos[3]
			)
			
		elseif getKeyState("space") then
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]+speed.vertical)
			
		elseif getKeyState("lshift") then
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]-speed.vertical)
		else
			setElementPosition(localPlayer, pos[1], pos[2], pos[3]) --// not to mess with gravity
		end
	else
		setElementPosition(localPlayer, pos[1], pos[2], pos[3]) --// not to mess with gravity
	end
	setElementRotation(localPlayer, 0, 0, -camera_rotation)
	
	pos = {getElementPosition(localPlayer)} --// important
end
----------------=============================--------------------


function getElementMarkPos()
	for k,blips in ipairs(getElementsByType("blip")) do
		if tonumber(getBlipIcon( blips )) == 41 then 
			xmark , ymark , zmark = getElementPosition(blips)
			triggerServerEvent("ADMSYS:GotoMark", getLocalPlayer(), getLocalPlayer(),xmark , ymark , zmark)
		end
	end
end
addCommandHandler("gotomark",getElementMarkPos)

