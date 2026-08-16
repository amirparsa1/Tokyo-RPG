local isSpeaker = false
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
function print ( player, message, r, g, b )
	outputChatBox ( message, player, r, g, b,true )
end

speakerBox = { }
addCommandHandler ( "radio", function ( thePlayer  )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSspeaker")) > 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSspeakerLife")) > 0 then
		if ( isElement ( speakerBox [ thePlayer] ) ) then isSpeaker = true end
		triggerClientEvent ( thePlayer, "onPlayerViewSpeakerManagment", thePlayer, isSpeaker )
	end

end )

addEvent ( "onPlayerPlaceSpeakerBox", true )
addEventHandler ( "onPlayerPlaceSpeakerBox", root, function ( url, isCar ) 
	if ( url ) then
		if ( isElement ( speakerBox [ source ] ) ) then
			local x, y, z = getElementPosition ( speakerBox [ source ] ) 
			print ( source, "#047a18[radio] #ff0a0a حذف شد", 255, 0, 0 )
			destroyElement ( speakerBox [ source ] )
			removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
		end
		local x, y, z = getElementPosition ( source )
		local rx, ry, rz = getElementRotation ( source )
		local dimension,interior = getElementDimension(source),getElementInterior(source)
		speakerBox [ source ] = createObject ( 2229, x-0.5, y+0.5, z - 1, 0, 0, rx )
		setElementDimension(speakerBox [ source ],dimension)
		setElementInterior(speakerBox [ source ],interior)
		print ( source, "#047a18[radio] #ffb90aایجاد شده", 0, 255, 0 )
		addEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
		triggerClientEvent ( root, "onPlayerStartSpeakerBoxSound", root, source, url, isCar,dimension )
		if ( isCar ) then
			local car = getPedOccupiedVehicle ( source )
			attachElements ( speakerBox [ source ], car, -0.7, -1.5, -0.5, 0, 90, 0 )
		end
	end
end )

addEvent ( "onPlayerDestroySpeakerBox", true )
addEventHandler ( "onPlayerDestroySpeakerBox", root, function ( )
	if ( isElement ( speakerBox [ source ] ) ) then
		destroyElement ( speakerBox [ source ] )
		triggerClientEvent ( root, "onPlayerDestroySpeakerBox", root, source )
		removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
		print ( source, "#047a18[radio] #ff0a0a  حذف شد", 255, 0, 0 )
	else
		print ( source, "#047a18[radio] #ff0a0a قبلا برداشته شده", 255, 255, 0 )
	end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolume", true ) 
addEventHandler ( "onPlayerChangeSpeakerBoxVolume", root, function ( to )
	triggerClientEvent ( root, "onPlayerChangeSpeakerBoxVolumeC", root, source, to )
end )

function destroySpeakersOnPlayerQuit ( )
	if ( isElement ( speakerBox [ source ] ) ) then
		destroyElement ( speakerBox [ source ] )
		triggerClientEvent ( root, "onPlayerDestroySpeakerBox", root, source )
	end
end