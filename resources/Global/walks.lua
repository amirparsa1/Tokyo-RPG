function RockSport ( player, commandName, id )
	if player and id then
		local status = setPedWalkingStyle ( player, tonumber(id) )
		if not status then
		else
			outputChatBox ( "Walk Style Shoma Movafaghiat Taghir Yaft!", player, 0, 255, 0)
		end
	end
end
addCommandHandler ( "walkstyle",  RockSport)