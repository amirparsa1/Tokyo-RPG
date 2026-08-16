--4206 abshar
--3985 park
local txd, dff, col
local pickup = "pickups/"

local modifications = {
	{pickup, "color_green.txd", "teleporter.dff", false, 1853,false}, -- Board with lifeline. (DYN_LIFE_P) -- Teleport Icon
	{pickup, "color_green.txd", "property_house.dff", false, 1273,false}, -- Green house. -- House ICON
	{pickup, "color_yellow.txd", "property_garage.dff", false, 1855,false}, -- GTA3 pickup -- Garage ICON
	{pickup, "color_blue_house.txd", "property_house.dff", false, 1272,false}, -- Multiplayer icon. -- Blue House ICON
	{pickup, "color_blue.txd", "property_business.dff", false, 1857,false}, -- Blue house icon. -- Aparteman ICON
	{pickup, "color_yellow_house.txd", "property_house.dff", false, 1858,false}, -- Yellow house. -- Yellow House ICON
	{pickup, "color_blue_garage.txd", "property_garage.dff", false, 1859,false}, -- GTA3 pickup -- Blue Garage ICON
	{pickup, "color_family_garage.txd", "property_garage.dff", false, 1860,false}, -- GTA3 pickup -- Blue Garage ICON
	{"Park/", "park.txd", "park.dff", "park.col", 3985,4000}, -- park
	{"cjail/", "cjail.txd", "cjail.dff", "cjail.col", 2045,40000}, -- cjail
	{"Park/", "rockstar.txd", "rockstar.dff", "rockstar.col", 4206,40000}, -- helopd
	{"vine/", "night.txd", "night.dff", "night.col", 13722,500}, -- vinewood
	{"Parking/", "garage.txd", "garage.dff", "garage.col", 1608,500}, -- Parking
	{"oilrig/", "oilrig.txd", "oilrig.dff", "oilrig.col", 2037,500}, -- Parking
	{"Keshti/", false, "nullkeshti.dff", "nullkeshti.col", 10140,500},

	--{pickup, "icon.txd", "icon.dff", false, 1927}, -- DS
}
addEventHandler('onClientResourceStart',resourceRoot,function () 

    ------------------------===================disco===============------------------------
    local txd = engineLoadTXD("Dico/Disco.txd")
    engineImportTXD(txd,1349)
    local dff = engineLoadDFF("Dico/Disco.dff",0)
    engineReplaceModel(dff,1349)
    local col = engineLoadCOL("Dico/Disco.col")
    engineReplaceCOL(col,1349)

	txd = engineLoadTXD( 'VipSkins/Zgamer/merit.txd' ) 
	engineImportTXD( txd, 545 ) 
	dff = engineLoadDFF('VipSkins/Zgamer/merit.dff', 545) 
	engineReplaceModel( dff, 545 )

	txd = engineLoadTXD( 'VipSkins/Zgamer/bmost.txd' ) 
	engineImportTXD( txd, 3 ) 
	dff = engineLoadDFF('VipSkins/Zgamer/bmost.dff', 3) 
	engineReplaceModel( dff, 3 )

	txd = engineLoadTXD( 'VipSkins/Zgamer/bfyst.txd' ) 
	engineImportTXD( txd, 4 ) 
	dff = engineLoadDFF('VipSkins/Zgamer/bfyst.dff', 4) 
	engineReplaceModel( dff, 4 )
end)



function replaceModels()
	for i, v in pairs(modifications) do
		if v[2] then
			txd = engineLoadTXD(v[1] .. v[2])
			engineImportTXD(txd, v[5])
		end
		if v[3] then
			dff = engineLoadDFF(v[1] .. v[3],v[6])
			engineReplaceModel(dff, v[5])
		end
		if v[4] then
			col = engineLoadCOL(v[1] .. v[4])
			engineReplaceCOL(col, v[5])
		end
		if v[4] then
			col = engineLoadCOL(v[1] .. v[4])
			engineReplaceCOL(col, v[5])
		end
		if v[6] then
			engineSetModelLODDistance(v[5], v[6])
		end
	end
	
end
addEventHandler("onClientResourceStart", resourceRoot, replaceModels)

local objectparking = createObject( 1608, 427.287109375 ,2573.171875 ,1000 )
setElementInterior(objectparking,10)
setElementDimension( objectparking, 51)



