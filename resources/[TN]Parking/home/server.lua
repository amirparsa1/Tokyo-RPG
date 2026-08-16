local dbpTime = 500
home = {}
local notfSys = exports["notf"]
local accSys = exports["Accounts-System"]
home.spawnList = {
	--[[[id] = {
		id = int id,
		owner = text owner,
		enter = table enterPos,
		exit = table exitPos,ы
		price = int price,
		capacity = int capacity,
		interior = int interior,
		dimension = int dimension,

	}]]
	--[[{
		id=1,
		owner = nil,
		enter = {-30.902935028076,28.980436325073,3.1171875},
		exit = {-29.849405288696,17.842582702637,3.1171875},
		price = 1000,
		capacity = 3,
		interior = 0,
		dimension = 0,

	}]]
}
local mysqlhost1 = "127.0.0.1"
local mysqluser1 = "root"
local mysqlpassword1 = ""
local mysqldatabase1 = "thenightdb"

-- SECOND CONNECTION, OPTIONAL IF CONNECTION 1 DON'T WORK

local mysqlhost2 = "127.0.0.1"
local mysqluser2 = "root"
local mysqlpassword2 = ""
local mysqldatabase2 = "thenightdb"
addEventHandler("onResourceStart", getResourceRootElement(), function()
	handlerp2 = dbConnect("mysql", "dbname="..mysqldatabase1..";host="..mysqlhost1, mysqluser1, mysqlpassword1, "autoreconnect=1")

	-- If the Handler 1 dont work
	if not(handlerp2) then	
		outputServerLog("[GarageSystem]MySQL handler 1 not accepted! Trying secondary handler...")	
		handlerp2 = dbConnect("mysql", "dbname="..mysqldatabase2..";host="..mysqlhost2, mysqluser2, mysqlpassword2, "autoreconnect=1")
		if not(handlerp2) then
			outputServerLog("[GarageSystem]MySQL handler 2 not accepted! Shutting down...")
			cancelEvent()
		else
			outputServerLog("[GarageSystem]MySQL handler 2 accepted!")
			
		end
	else
		outputServerLog("[GarageSystem]MySQL handler 1 accepted!")
		
	end
end)

function setCarLimit(ply,value)
	setElementData(ply, '_carLimit', value)
end

function getCarLimit(ply)
	return (getElementData(ply, '_carLimit') or 1)
end


home.interiors = {
	--[capacity] = {}
	[1] = {
		pos = {409.3271484375 ,2548.0283203125 ,999.37066650391},
		interior = 10,
	},

	[2] = {
		pos = {409.3271484375 ,2548.0283203125 ,999.37066650391},
		interior = 10,
	},

	[3] = {
		pos = {409.3271484375 ,2548.0283203125 ,999.37066650391},
		interior = 10,
	},

	[4] = {
		pos = {409.3271484375 ,2548.0283203125 ,999.37066650391},
		interior = 10,
	},

	[5] = {
		pos = {409.3271484375 ,2548.0283203125 ,999.37066650391},
		interior = 10,
	},

}
warpBlocked = {
	--[userdata]
}

function addHome(id,owner,X,Y,Z,price,capacity)
	
	local tab = home.interiors[capacity]
	if not tab then
		interior = home.interiors[5].interior
		exit = home.interiors[5].pos
	else
		interior = home.interiors[capacity].interior
		exit = home.interiors[capacity].pos
	end
	local dimension = id

	local data = {
		id=tonumber(id),
		owner=owner,
		enterX=tonumber(X),
		enterY=tonumber(Y),
		enterZ=tonumber(Z),
		exit=exit,
		price=tonumber(price),
		capacity=tonumber(capacity),
		interior=tonumber(interior),
		dimension=tonumber(dimension),
	}
	home.spawnList[id] = data
	buildHome(data)
end
pickesh = {}

function buildHome(data)
	local id =  data.id

	local enterPosX = data.enterX
	local enterPosY = data.enterY
	local enterPosZ = data.enterZ
	local exitPos = data.exit

	local interior = data.interior
	local dimension = data.dimension
	marker_enter = {}
	if data.owner == "no-one" then
		
		marker_enter[id] = createColSphere(enterPosX,enterPosY,enterPosZ, 1.5)
		pickesh[id] = createPickup (enterPosX,enterPosY,enterPosZ, 3, 1855, 0 )
		
	else
		
		marker_enter[id] = createColSphere(enterPosX,enterPosY,enterPosZ, 1.5)
		pickesh[id] = createPickup ( enterPosX,enterPosY,enterPosZ, 3, 1859, 0 )
	end
	setElementData(marker_enter[id],'id',id)
	setElementData(marker_enter[id],'data',data)
	setElementData(pickesh[id],'id',id)
	setElementData(pickesh[id],'data',data)
	addEventHandler('onColShapeHit',marker_enter[id],function(element)
		local src = source
		
		if getElementType(element) ~= 'player' then return end

		local login = getPlayerName(element)
		if data.owner ~= "no-one" then
			if warpBlocked[element] then return end
			triggerClientEvent(element,'home:openHomeControl',src,data)
		else
			if data.owner == "no-one" then

				triggerClientEvent(element,'home:startHomeBuying',src)
			end
		end
	end)

	local marker_exit = createMarker(exitPos[1],exitPos[2],exitPos[3]-1, 'cylinder', 5, 255,255,0,140)
	setElementDimension(marker_exit, dimension)
	setElementInterior(marker_exit, interior)

	
	local objectparking = createObject( 1608, 427.287109375 ,2573.171875 ,1000,0, 0, 0 )
	setElementFrozen( objectparking, true )
	setElementInterior(objectparking,interior)
	setElementDimension( objectparking, dimension)

	setElementData(objectparking,'id',id)
	setElementData(objectparking,'data', data)

	setElementData(marker_exit,'id',id)
	setElementData(marker_exit,'data', data)

	setElementData(marker_enter[id],'parent',marker_exit)
	setElementData(marker_exit,'parent',marker_enter[id])
	addEventHandler('onMarkerHit',marker_exit,function(element)
		if warpBlocked[element] then return end
		if source ~= marker_exit then return end
		if getElementInterior(source) ~= getElementInterior(element) then return end
		if getElementDimension(source) ~= getElementDimension(element) then return end
		local id = getElementData(source,'id')
		local data = home.spawnList[id]
		local posx = data.enterX
		local posy = data.enterY
		local posz = data.enterZ

		setElementPosition(element, posx,posy,posz+0.4)
		setElementDimension(element, 0)
		setElementInterior(element, 0)

		warpBlocked[element] = true
		setTimer(function()
			warpBlocked[element] = nil
		end,1500,1)
	end)


end


addCommandHandler("dparking", function(thePlayer, cmd, id)
	
	local id = tonumber(id)
	local data = home.spawnList[id]
	if not(id) then return end
	if not(data.id) == id then
		outputChatBox("Khane'i Ba ID "..id.." Peyda Nashod!", thePlayer, 255, 0, 0)
		return
	end
	local query = dbQuery(handlerp2, "DELETE FROM parking WHERE id = '"..id.."';")
	local result = dbPoll(query, dbpTime)


	



	
	
	destroyElement(pickesh[id])
	destroyElement(marker_enter[id])
end)




function loadHomes()
	
	local query = dbQuery(handlerp2, "SELECT * FROM parking;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
			local id = row['id']
			local x, y, z = row['X'], row['Y'], row['Z']

			local capacity = row['capacity']
			local price = row['price']
			local owner = row['owner']

			addHome(id,owner,x,y,z,price,capacity)
			
		end
	else
		error("Houses Table not Found/empty!")
	end
	dbFree(query)


end
addEventHandler('onResourceStart',getResourceRootElement(getThisResource()),loadHomes)

function buyHome(data,marker)
	local ply = source
	local login = getPlayerName( ply )
	local x,y,z = getElementPosition(marker)







	if tonumber(getElementData(accSys:getPlayerAcc(ply), "pGold")) >= tonumber(data.price) then
		home.spawnList[data.id].owner = login
		setCarLimit(ply,getCarLimit(ply)+data.capacity)
		destroyElement(pickesh[data.id])
		pickesh[data.id] = createPickup ( x,y,z, 3, 1859, 0 )
		local goldPlayer = getElementData(accSys:getPlayerAcc(ply), "pGold")
		setElementData(accSys:getPlayerAcc(ply), "pGold", tonumber(goldPlayer) - tonumber(data.price))
		local query = dbQuery(handlerp2, "UPDATE parking SET owner = '"..login.."' WHERE ID = '"..data.id.."';" )
		local result = dbPoll(query, dbpTime)
		if(result) then
			dbFree(query)
		end

		outputChatBox('#7CFC00[Parking-System]: #FFFFFFShoma Ba Movafaghiat Parking Ba ID: #7CFC00'..data.id..' #FFFFFFRa Kharidari Kardid.', ply, 0, 255 , 0, true)
	else
	end
end
addEvent('home:buyHome',true)
addEventHandler('home:buyHome',getRootElement(),buyHome)

function sellHome(player,cmd)
	local ply = player
	local login = getPlayerName( ply )
	local x,y,z = getElementPosition(marker)
	
	givePlayerMoney(ply,data.price*0.75)

	home.spawnList[data.id].owner = 'no-one'
	setCarLimit(ply,getCarLimit(ply)-data.capacity)
	destroyElement(pickesh[data.id])
	pickesh[data.id] = createPickup ( x,y,z, 3, 1855, 0 )

	local query = dbQuery(handlerp2, "UPDATE parking SET owner = 'no-one' WHERE ID = '"..data.id.."';" )
	local result = dbPoll(query, dbpTime)
	if(result) then
		dbFree(query)

	end

	outputChatBox('#7CFC00[Parking-System]: #FFFFFFShoma Ba Movafaghiat Garage Ba ID: #7CFC00'..data.id..' #FFFFFFForokhtid.', ply, 0, 255 , 0, true)
end
addCommandHandler("sellp",sellHome)
addEvent('home:sellHome',true)
addEventHandler('home:sellHome',getRootElement(),sellHome)

function addNewHome(ply,cmd,price,capacity)

	if tonumber(getElementData(accSys:getPlayerAcc(ply), "pAdmin")) > 10 then
		if not price or not tonumber(price) then
			outputChatBox('/createparking [Price] [capacity]',ply,255,255,255)
			return
		end
		if not capacity or not tonumber(capacity) then
			outputChatBox('/createparking [Price] [capacity]',ply,255,255,255)
			return
		end
		local x,y,z = getElementPosition(ply)
		local query2 = dbQuery(handlerp2, "SELECT * FROM parking;" )
		local result2, numrows2 = dbPoll(query2, dbpTime)
		local query = dbQuery(handlerp2, "INSERT INTO `parking`( `owner`,`X`, `Y`, `Z`, `price`, `capacity`) VALUES ('no-one','"..x.."','"..y.."','"..z.."','"..price.."','"..capacity.."');")
		local result, numrows = dbPoll(query, dbpTime)
		addHome(numrows2,'no-one',x,y,z,price,capacity)
		outputChatBox('Parking Ba Movafaghiat Sakhte Shod.',ply,212,200,35)
	
	
	end
	
end
addCommandHandler('createparking',addNewHome)

local locationout = {}
function warpToHome(marker,owner)

	local ply = source
	warpBlocked[ply] = true
	local parent = getElementData(marker,'parent')
	local x,y,z = getElementPosition(parent)

	if owner == getPlayerName(ply) then
		local theVehicle = getPedOccupiedVehicle ( source )
		if isPedInVehicle (source) then
			setElementPosition ( theVehicle, x-10,y,z )
			setElementInterior( theVehicle, getElementInterior(parent))
			setElementDimension( theVehicle, getElementDimension(parent))
			setElementPosition(ply, x,y,z)
			setElementInterior(ply, getElementInterior(parent))
			setElementDimension(ply, getElementDimension(parent))

		else
			setElementPosition(ply, x,y,z)
			setElementInterior(ply, getElementInterior(parent))
			setElementDimension(ply, getElementDimension(parent))
		end
	else
		notfSys:addNotification(source,"Parking Ghofle!.., Kilidesho Faghat Sahebesh Dare","info")
	end
	--____________________________________
	setTimer(function()
		warpBlocked[ply] = nil
	end,1500,1)

end
addEvent('home:warpToHome',true)
addEventHandler('home:warpToHome',getRootElement(),warpToHome)

homeOffers = {}

function sendHomeSellInvite(nick,data,price)
	local ply = getPlayerFromName(nick)
	if not ply then
		outputChatBox('#D00000[Ошибка]: #FFFFFFИгрок не на сервере', source, 255, 0, 0, true)
		return
	end
	homeOffers[ply] = {
		data = data,
		sender = source,
		price = price
	}
	outputChatBox('#7CFC00[Продажа]: #FFFFFFИгрок "'..getPlayerName(source)..'" предложил вам купить свой гараж', ply, 38, 122, 216, true)
	outputChatBox('#FFFFFFЦена: #7CFC00'..price..'$.#FFFFFF Вместимость: #FFE600'..data.capacity, ply, 38, 122, 216, true)
	outputChatBox('#FFFFFFЧтобы принять #00FF00/ok #FFFFFFЧтобы отклонить #FF0000/net', ply, 38, 122, 216, true)
end
addEvent('home:sendHomeSellInvite',true)
addEventHandler('home:sendHomeSellInvite',root,sendHomeSellInvite)


function acceptHomeBuyOffer(ply)
	if not homeOffers[ply] then return end
	local htab = homeOffers[ply]
	if getPlayerMoney(ply) < htab.price then
		outputChatBox('#D00000[Покупка]: #FFFFFFНе хватает денег для покупки', ply, 255, 0, 0, true)
		return
	end
	if not isElement(htab.sender) then
		outputChatBox('#D00000[Ошибка]: #FFFFFFПродавец не онлайн', ply, 255, 0, 0, true)
		return
	end

	outputChatBox('#7CFC00[Покупка]: #FFFFFFИгрок "'..getPlayerName(ply)..'"  Принял ваше предложение. #7CFC00+'..htab.price..'$', htab.sender, 0, 255 , 0, true)
	takePlayerMoney(ply, htab.price)
	givePlayerMoney(htab.sender, htab.price)

	setCarLimit(htab.sender,getCarLimit(htab.sender)+htab.data.capacity)

	local homeID = htab.data.id
	local login = getAccountName(getPlayerAccount(ply))

	dbQuery(handlerp2,"UPDATE homes SET owner=? WHERE id=?",{login, homeID})
	home.spawnList[homeID].owner = login

	setCarLimit(ply,getCarLimit(ply)+htab.data.capacity)
	homeOffers[ply] = nil
end
addCommandHandler('ok',acceptHomeBuyOffer)

function rejectHomeBuyOffer(ply)
	if not homeOffers[ply] then return end
	local htab = homeOffers[ply]
	outputChatBox('#D00000[Продажа]: #FFFFFFИгрок "'..getPlayerName(ply)..'" Отклонил ваше предложение о покупке гаража', htab.sender, 255 ,0 ,0, true)
	homeOffers[ply] = nil
end
addCommandHandler('net',rejectHomeBuyOffer)


function onLogin()
	local ply = source
	setCarLimit(ply, 1)
	local login = getAccountName(getPlayerAccount(ply))

	dbQuery(handlerp2,'SELECT * FROM homes WHERE owner=?',{login},function(result)
		for i=1,#result do
			local data = result[i]
			setCarLimit(ply, getCarLimit(ply)+data['capacity'])
		end
	end)
end
addEventHandler('onPlayerLogin',root,onLogin)