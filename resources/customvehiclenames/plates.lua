local accSys = exports["accounts-system"]
function getpelak( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            local pelak = getVehiclePlateText ( source )
            if fasele < 4 then
				triggerClientEvent ( player, "BiadPelaks", player)
				setElementData(accSys:getPlayerAcc(player), "pPlateVeh", (pelak))
				--outputChatBox( "#00ff00Pelak In Veh: #ffffff"..pelak.." #00ff00Mibashad!", player, 0, 255, 0,true ) 
            end
        end
    end
end
addEventHandler( "onElementClicked", getRootElement( ), getpelak )

function BiadPlate (player)
	local pelak = getElementData(accSys:getPlayerAcc(player), "pPlateVeh")
	outputChatBox( "#00ff00Pelak In Veh: #ffffff"..pelak.." #00ff00Mibashad!", player, 0, 255, 0,true ) 
end
addEvent("biadchatboxplak",true)
addEventHandler("biadchatboxplak", root, BiadPlate)


--[[function getid( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 10 then
				if getElementData(player,"ingetidmode") == true then
					local id = getElementModel ( source )
					outputChatBox("#ff0000[Get-Car-ID]: #ffffff ID In Veh #ff0000"..id.." #ffffff Mibashad! ", player, 255, 255, 255, true)
				end
            end
        end
    end
end
addEventHandler( "onElementClicked", root, getid )]]


addCommandHandler("getcarid",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
	if getElementData(thePlayer,"ingetidmode") == true then
		setElementData(thePlayer,"ingetidmode",nil)
		outputChatBox("#ff0000[Get Car ID]:#00ff00☑️ #ffffffShoma Ba Movafaghiat Halate GetCarID Ro Off Kardid!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer,"ingetidmode",true)
		outputChatBox("#00ff00[Get Car ID]: #00ff00☑️ #ffffffShoma Ba Movafaghiat Halate GetCarID Ro On Kardid!", thePlayer, 255, 255, 255, true)
	end
 end
end)

function DestroyCar( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "vehicle" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if distance < 10 then
				if getElementData(player,"indestroycarmode") == true then
					destroyElement( source )
				end
            end
        end
    end
end
addEventHandler( "onElementClicked", root, DestroyCar )


addCommandHandler("destroycar",
function ( thePlayer, command )
 if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 4 then
	if getElementData(thePlayer,"indestroycarmode") == true then
		setElementData(thePlayer,"indestroycarmode",nil)
		outputChatBox("#ff0000[Destroy Car]:#00ff00☑️ #ffffffShoma Ba Movafaghiat Halate Destroy Car Ro Off Kardid!", thePlayer, 255, 255, 255, true)
	else
		setElementData(thePlayer,"indestroycarmode",true)
		outputChatBox("#00ff00[Destroy Car]: #00ff00☑️ #ffffffShoma Ba Movafaghiat Halate Destroy Car Ro On Kardid!", thePlayer, 255, 255, 255, true)
	end
 end
end)