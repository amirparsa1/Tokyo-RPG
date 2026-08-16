local hostname = "localhost"
local username = "root"
local password = ""
local database = "thenightdb"
local port = 3306

local gMySQLCon = nil

function connectToDatabase(res)
	gMySQLCon = dbConnect("mysql", "dbname=" .. database .. ";host=" .. hostname, username, password)
	if (not gMySQLCon) then
		cancelEvent(true, "[Error]: Database Connect Nashod!")
		return
	end
	outputServerLog("[Done]: Database Ba Movafaqiat Connect Shod!")
end
addEventHandler("onResourceStart", getResourceRootElement(), connectToDatabase, false)

function getMySQLC()
	return gMySQLCon
end