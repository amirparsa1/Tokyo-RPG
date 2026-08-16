function outputGtaV(type, text)
	if (type(type) ~= "string" or type(text) ~= "string") then return false end
	triggerClientEvent(player, "outputGtaV", resourceRoot, type, text)
	return true
end