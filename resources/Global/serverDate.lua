local dbpTime = 500
local bLastHour = 0

--[[addEventHandler("onResourceStart", getResourceRootElement(), function (rs)
	bLastHour = getRealTime().hour
end)

addEventHandler("OnGlobalTimer", root, function ()
	if (getRealTime().hour ~= bLastHour) then
		bLastHour = getRealTime().hour
		if bLastHour == 0 then
			setServerDate()
		end
	end
end)]]

function setServerDate()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM server;" )
    local result, numrows = dbPoll(query, dbpTime)
    if (result and numrows > 0) then
		for index, row in pairs(result) do
			local Date = row['sDate']
			local nextDate = tonumber(Date) + 1
			if Date == 7 then
				local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `server` SET `sDate` = '1'")
				dbFree(myQH)
			else
				local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `server` SET `sDate` = '"..nextDate.."'")
				dbFree(myQH)
			end
		end
		dbFree(query)
	end
end

addCommandHandler("nextdate",
function (thePlayer, command)
	setServerDate()
end)