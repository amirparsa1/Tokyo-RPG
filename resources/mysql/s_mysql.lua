hostname = "127.0.0.1"
username = "root"
password = ""
database = "thenightdb"
port = 3306

function getMySQLUsername()
	return username
end

function getMySQLPassword()
	return password
end

function getMySQLDBName()
	return db
end

function getMySQLHost()
	return host
end

function getMySQLPort()
	return port
end
