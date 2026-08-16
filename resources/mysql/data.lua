function changeMoney( dataName, oldValue )
	if getElementType(source) == "account" then
		if not(getElementData(source, "bDontUpdate")) and dataName ~= "ePlayerElement" and dataName ~= "bDontUpdate" then
			dbExec(getMySQLC(), "UPDATE `users` SET `" .. dataName .. "`= ? WHERE pID = ?", getElementData(source, dataName), getElementData(source, "pID"))
		end
	end
end
addEventHandler("onElementDataChange", getRootElement(), changeMoney)
