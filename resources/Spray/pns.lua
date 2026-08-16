

local sprays = {
	--{x, y, z},
    {2072.849609375 ,-1831.3896484375 ,13.546875},
	{488.5751953125 ,-1733.4287109375 ,11.190086364746},
	{1024.9609375 ,-1030.6259765625 ,32.037353515625},
	{720.0986328125 ,-464.0146484375 ,16.3359375},
	{-1904.5458984375 ,276.3837890625 ,41.046875},
	{-2425.7001953125 ,1029.181640625 ,50.390625},
	{-1420.3515625 ,2592.3818359375 ,55.80057144165},
	{-2110.9619140625 ,-2250.0107421875 ,30.625},
	{-2611.85546875 ,2267.5234375 ,8.2109375},
	{1515.115234375 ,1033.6552734375 ,10.8203125},
	{-2095.0751953125 ,-31.3896484375 ,35.310203552246},
	{-99.9462890625 ,1110.0078125 ,19.7421875},
	{1967.271484375 ,2162.1826171875 ,10.8203125}
}



local S1 = createPickup ( 2072.849609375 ,-1831.3896484375 ,13.546875 , 3, 1239, 0)

local S2 = createPickup ( 488.5751953125 ,-1733.4287109375 ,11.190086364746 , 3, 1239, 0)

local S3 = createPickup ( 1024.9609375 ,-1030.6259765625 ,32.037353515625 , 3, 1239, 0)

local S4 = createPickup ( 720.0986328125 ,-464.0146484375 ,16.3359375 , 3, 1239, 0)


local S5 = createPickup ( -1904.5458984375 ,276.3837890625 ,41.046875 , 3, 1239, 0)

local S6 = createPickup ( -2425.7001953125 ,1029.181640625 ,50.390625 , 3, 1239, 0)

local S7 = createPickup ( -1420.3515625 ,2592.3818359375 ,55.80057144165 , 3, 1239, 0)

local S8 = createPickup ( -2110.9619140625 ,-2250.0107421875 ,30.625 , 3, 1239, 0)


local S9 = createPickup ( 1515.115234375 ,1033.6552734375 ,10.8203125 , 3, 1239, 0)

local S10 = createPickup ( -2095.0751953125 ,-31.3896484375 ,35.310203552246 , 3, 1239, 0)

local S11 = createPickup ( -99.9462890625 ,1110.0078125 ,19.7421875 , 3, 1239, 0)

local S12 = createPickup ( 1967.271484375 ,2162.1826171875 ,10.8203125 , 3, 1239, 0)



function RaftToPic( player )
  
	exports["notf"]:addNotification(player, "Baraye Tamir Khodro Az /spray Estefade Konid.", 'info')
	playSoundFrontEnd ( player, 1 )
end
addEventHandler( "onPickupHit", S1, RaftToPic )
addEventHandler( "onPickupHit", S2, RaftToPic )
addEventHandler( "onPickupHit", S3, RaftToPic )
addEventHandler( "onPickupHit", S4, RaftToPic )
addEventHandler( "onPickupHit", S5, RaftToPic )
addEventHandler( "onPickupHit", S6, RaftToPic )
addEventHandler( "onPickupHit", S7, RaftToPic )
addEventHandler( "onPickupHit", S8, RaftToPic )
addEventHandler( "onPickupHit", S9, RaftToPic )
addEventHandler( "onPickupHit", S10, RaftToPic )
addEventHandler( "onPickupHit", S11, RaftToPic )
addEventHandler( "onPickupHit", S12, RaftToPic )



addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
function ()
    for i,v in ipairs ( sprays ) do
	    local blip = createBlip(v[1], v[2], v[3], 63)
		setElementData(blip, 'blipName', 'Spray')
	end
end
)

--[[
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()),
function ()
    for i,v in ipairs ( getElementsByType("player") ) do
	    setElementData(v, "inaspray", nil)
	end
end
)

addEventHandler("onPickupHit",root,
function (hitter)
    if getElementData(source, "paynspray") == true then
	    if getPedOccupiedVehicle(hitter) then
	        setElementData(hitter, "inaspray", true)
			exports["notf"]:addNotification(hitter, "Baraye Tamir Khodro Az /spray Estefade Konid.", 'info')
			playSoundFrontEnd ( hitter, 1 )
			
		end
	end
end
)

addEventHandler("onPickupLeave",root,
function (leaver)
    if getElementData(source, "paynspray") == true then
	    if getPedOccupiedVehicle(leaver) then
	        setElementData(leaver, "inaspray", false)
		end
	end
end
)
--]]


function spray(thePlayer, command, seat)
	local seat = getPedOccupiedVehicleSeat(thePlayer)
    if getElementType(thePlayer) == "player" then
        
		
		local x,y,z = getElementPosition(thePlayer)
		local bx,by,bz = getElementPosition(S1)
		local de = getDistanceBetweenPoints3D(x,y,z,bx,by,bz)
		
		local nx,ny,nz = getElementPosition(S2)
		local de2 = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
		
		local vx,vy,vz = getElementPosition(S3)
		local de3 = getDistanceBetweenPoints3D(x,y,z,vx,vy,vz)
		
		local mx,my,mz = getElementPosition(S4)
		local de4 = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
		
		local ax,ay,az = getElementPosition(S5)
		local de5 = getDistanceBetweenPoints3D(x,y,z,ax,ay,az)
		
		local sx,sy,sz = getElementPosition(S6)
		local de6 = getDistanceBetweenPoints3D(x,y,z,sx,sy,sz)
		
		local dx,dy,dz = getElementPosition(S7)
		local de7 = getDistanceBetweenPoints3D(x,y,z,dx,dy,dz)
		
		local fx,fy,fz = getElementPosition(S8)
		local de8 = getDistanceBetweenPoints3D(x,y,z,fx,fy,fz)
		
		local gx,gy,gz = getElementPosition(S9)
		local de9 = getDistanceBetweenPoints3D(x,y,z,gx,gy,gz)
		
		local hx,hy,hz = getElementPosition(S10)
		local de10 = getDistanceBetweenPoints3D(x,y,z,hx,hy,hz)
		
		local jx,jy,jz = getElementPosition(S11)
		local de11 = getDistanceBetweenPoints3D(x,y,z,jx,jy,jz)
		
		local ix,iy,iz = getElementPosition(S12)
		local de12 = getDistanceBetweenPoints3D(x,y,z,ix,iy,iz)
		
		if de < 4 or de2 < 4 or de3 < 4 or de4 < 4 or de5 < 4 or de6 < 4 or de7 < 4 or de8 < 4 or de9 < 4 or de10 < 4 or de11 < 4 or de12 < 4 then	
		
            if isPedInVehicle(thePlayer) then
			  if seat == 0 then
			    if (getPlayerMoney(thePlayer)>= 100) then
			        --if not (getElementHealth(getPedOccupiedVehicle(thePlayer))>= 1000) then
					
					 toggleControl ( thePlayer, "vehicle_left", false )
						 toggleControl ( thePlayer, "vehicle_right", false )
					setTimer(
                        function()
			             toggleControl ( thePlayer, "vehicle_left", true )
						 toggleControl ( thePlayer, "vehicle_right", true )
		                end, 1000, 1)
				
						takePlayerMoney(thePlayer, 100)
						fixVehicle(getPedOccupiedVehicle(thePlayer))
						
						setElementAlpha(getPedOccupiedVehicle(thePlayer),100)
						playSoundFrontEnd ( thePlayer, 46 )
						setTimer(setElementAlpha,1000,1,getPedOccupiedVehicle(thePlayer),255,1)
						setTimer(setElementFrozen,1000,1,getPedOccupiedVehicle(thePlayer),false,1)
						exports["notf"]:addNotification(thePlayer, "Khodroye Shoma Ba Hazine $100 Tamir Shod." , 'success')
						
						
				   --else
                   --   exports["notf"]:addNotification(thePlayer, "Khodroye Shoma Niaz Be Tamir Nadarad!" , 'info')
					--  triggerClientEvent ( thePlayer, "Playinfo", thePlayer)
                   --end
			     else
                    exports["notf"]:addNotification(thePlayer, "Baraye Tamir khodro Be $100 Niaz Darid!" , 'error')
						triggerClientEvent ( thePlayer, "PlayError", thePlayer)
                end
			  else
                   outputChatBox("#ff0000✖️ #ffffffShoma Ranande In Khodro Nistid!",thePlayer,255,255,255,true)
              end
           else
               outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dakhel Khodro Bashid!",thePlayer,255,255,255,true)
           end
        else
            outputChatBox("#ff0000✖️ #ffffffinja Nemishe Spray Kard!",thePlayer,255,255,255,true)
        end
    end
end
addCommandHandler("spray",spray)





function showLocalHealth(thePlayer)
	-- get the player's vehicle: if he is in one, output its health as well
	local playerVehicle = getPedOccupiedVehicle ( thePlayer )
	if playerVehicle then
		local vehicleHealth = getElementHealth ( playerVehicle )  -- Divide this by 10, as default the denominator is 1000
		--outputChatBox ( "Your vehicle's health: " .. vehicleHealth )
		playSoundFrontEnd ( thePlayer, 1 )
		 exports["notf"]:addNotification(thePlayer, "Health Mashin Shoma: " .. vehicleHealth.."" , 'info')
	end
end
addCommandHandler ( "get", showLocalHealth )
