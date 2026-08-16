function MakePlayerHeadshot( attacker, weapon, bodypart, loss )
	if attacker then
		if getElementType ( attacker ) == "player" then
			if bodypart == 9 and getElementData(source,"godmode") ~= true then
				triggerEvent( "onPlayerHeadshot", source, attacker, weapon, loss )
				setPedHeadless ( source, true )
				killPed( source, attacker, weapon, bodypart )
				setTimer( BackUp, 900, 1, source )
			end
		end
	end
end

function MakeHeadshot( source, attacker, weapon, loss )
	triggerEvent( "onPlayerHeadshot", source, attacker, weapon, loss )
	killPed( source, attacker, weapon, 9 )
	setPedHeadless ( source, true )
	setTimer( BackUp, 900, 1, source )
end

function BackUp( source )	
	if getElementType ( source ) == "player" then
		setPedHeadless ( source, false )
	end
end
addEvent ( "onServerHeadshot", true )
addEventHandler( "onPlayerDamage", getRootElement(), MakePlayerHeadshot )
addEventHandler( "onServerHeadshot", getRootElement(), MakeHeadshot )
