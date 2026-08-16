addCommandHandler("showinfo",
function (thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(thePlayer, "nowInfo") == true then
			setElementData(thePlayer, "nowInfo", false)
		else
			setElementData(thePlayer, "nowInfo", true)
		end
	end
end)

addCommandHandler("showspeedo",
function (thePlayer, command)
	if getElementData(thePlayer, "loggedIn") == true then
		if getElementData(thePlayer, "nowSpeedo") == true then
			setElementData(thePlayer, "nowSpeedo", false)
		else
			setElementData(thePlayer, "nowSpeedo", true)
		end
	end
end)

days ={
	[ 1 ] = 'Saturday',
	[ 2 ] = 'Sunday',
	[ 3 ] = 'Monday',
	[ 4 ] = 'Tuesday',
	[ 5 ] = 'Wednesday',
	[ 6 ] = 'Thursday',
	[ 7 ] = 'Friday',
	}
local rooz = 0
local dbpTime = 500

function getServerDate()
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM server;" )
    local result, numrows = dbPoll(query, dbpTime)
    if (result and numrows > 0) then
		for index, row in pairs(result) do
			local Date = row['sDate']
			rooz = (days [Date] )
		end
		dbFree(query)
	end
end

addCommandHandler("gettime",
function (thePlayer, command)
	getServerDate()
	local time = getRealTime()
	local hours = time.hour
	if hours < 10 then
		hours = "0"..hours
	end
	local minutes = time.minute
	if minutes < 10 then
		minutes = "0"..minutes
	end
	local date = getRealTime()
	local year = date.year + 1900
	local month = date.month + 1
	if month < 10 then
		month = "0"..date.month + 1
	end
	local day = date.monthday 
	if day < 10 then
		day = "0"..date.monthday
	end
	outputChatBox("[Server-Time]: "..hours..":"..minutes, thePlayer, 230, 230, 230, true)
	outputChatBox("[Server-Date]: "..year.."/"..month.."/"..day, thePlayer, 230, 230, 230, true)
end)