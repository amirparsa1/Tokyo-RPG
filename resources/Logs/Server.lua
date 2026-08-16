function newLog(LogTitle,LogText)
	if LogTitle and LogText then
		local time = getRealTime()
		local Hour = time.hour
		local Minute = time.minute
		local Second = time.second
        local Day = time.monthday
		local Month = time.month +1
		local Year = time.year + 1900
		local Logs = xmlLoadFile("Log.xml")
		xmlNodeSetValue (xmlCreateChild(Logs, ""..LogTitle..""), ""..LogText.." | ("..Hour..":"..Minute..":"..Second..") - ("..Year.."/"..Month.."/"..Day..") " )
		xmlSaveFile(Logs)
		xmlUnloadFile(Logs)
	end
end

function newLogSpam (LogTitle,LogText)
	if LogTitle and LogText then
		local time = getRealTime()
		local Hour = time.hour
		local Minute = time.minute
		local Second = time.second
        local Day = time.monthday
		local Month = time.month +1
		local Year = time.year + 1900
		local Logs = xmlLoadFile("LogSpam.xml")
		xmlNodeSetValue (xmlCreateChild(Logs, ""..LogTitle..""), ""..LogText.." | ("..Hour..":"..Minute..":"..Second..") - ("..Year.."/"..Month.."/"..Day..") " )
		xmlSaveFile(Logs)
		xmlUnloadFile(Logs)
	end
end