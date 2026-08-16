g_Root = getRootElement()
g_thisRes = getThisResource()
changeTable = {
	[400] = "Porsche Cayenne",
	[401] = "FJ Cruiser",
	[402] = "Agera R",
	[403] = "Linerunner",
	[404] = "Range Rover",
	[405] = "Audi",
	[406] = "Dumper",
	[407] = "Fire Truck",
	[408] = "Trashmaster",
	[409] = "Limousine",
	[410] = "Maserati Granturismo",
	[411] = "Lykan Hypersport",
	[412] = "Batmobil",
	[413] = "Pony(Van)",
	[414] = "Mule",
	[415] = "Audi R8",
	[416] = "Ambulance",
	[417] = "Leviathan",
	[418] = "Peugeot 206",
	[419] = "Mercedes-Benz Vision AVTR",
	[420] = "Taxi",
	[421] = "BMW 750li",
	[422] = "Bobcat",
	[423] = "Mr.Whoopee",
	[424] = "BF Injection",
	[425] = "Hunter",
	[426] = "Samand",
	[427] = "Enforcer",
	[428] = "Securicar",
	[429] = "Bugatti Chiron",
	[430] = "Predator",
	[431] = "Bus",
	[432] = "Rehino",
	[433] = "Barracks",
	[434] = "BMW i8 Crook",
	[435] = "Trailer 1",
	[436] = "Nissan zamyad",
	[437] = "Bus 2",
	[438] = "Cabbie",
	[439] = "Stallion",
	[440] = "Rumpo",
	[441] = "RC Bandit",
	[442] = "BMW Z4",
	[443] = "Packer",
	[444] = "Monster Teruck",
	[445] = "Dena",
	[446] = "Squalo",
	[447] = "Seasparrow",
	[448] = "Pizzaboy",
	[449] = "Trmn",
	[450] = "Trailer 1",
	[451] = "Mazda RX-7",
	[452] = "Speeder",
	[453] = "Reefer",
	[454] = "Tropic",
	[455] = "Flatbed",
	[456] = "Yankee",
	[457] = "Caddy",
	[458] = "Toyota Land Cruiser",
	[459] = "Berlley RC Van",
	[460] = "Skimmer",
	[461] = "Honda 125 Classic",
	[462] = "Vespa",
	[463] = "Freeway",
	[464] = "RC Baron",
	[465] = "RC Raider",
	[466] = "BMW X7",
	[467] = "Rolls-Royce Dawn",
	[468] = "T Rex",
	[469] = "Sparrow",
	[470] = "Mammoth Patriot",
	[471] = "Quadbike",
	[472] = "Coastguard",
	[473] = "Dinghy",
	[474] = "Hermes",
	[475] = "Porsche Boxter S",
	[476] = "Rustler",
	[477] = "Pontiac Fiero GT",
	[478] = "ZR-350",
	[479] = "Mercedes-Benz G-Class",
	[480] = "Lamborghini Aventador SVJ",
	[481] = "BMX",
	[482] = "Burrito",
	[483] = "Camper",
	[484] = "Boat Journey",
	[485] = "Baggage",
	[486] = "Dozer",
	[487] = "Maverick",
	[488] = "News Chopper",
	[489] = "Runcher",
	[490] = "Chevrolet Suburban",
	[491] = "Ferrari",
	[492] = "Pride 111 EX",
	[493] = "Jetmax",
	[494] = "Nissan Silvia S13",
	[495] = "Ford Raptor",
	[496] = "Golf GTI",
	[497] = "Police Maverick",
	[498] = "Boxville",
	[499] = "Benson",
	[500] = "Mesa",
	[501] = "RC Goblin",
	[502] = "Ford Mustang",
	[503] = "Dodge Challenger",
	[504] = "Bloodring Banger",
	[505] = "Runcher Lure",
	[506] = "Hennessey Venom F5",
	[507] = "Peugeot 207",
	[508] = "Journey",
	[509] = "Bike",
	[510] = "Mountain Bike",
	[511] = "Beagle",
	[512] = "Cropduster",
	[513] = "Stuntplane",
	[514] = "Tanker",
	[515] = "Rodtrin",
	[516] = "Benz AMG GT63",
	[517] = "McLaren P1",
	[518] = "Mercedes-Benz AMG GT",
	[519] = "Shamal",
	[520] = "Hydra",
	[521] = "Yamaha YZF R1",
	[522] = "NRG",
	[523] = "HPC1000",
	[524] = "Cement Truck",
	[525] = "Towtruck",
	[526] = "Toyota GT86",
	[527] = "BMW i8",
	[528] = "Insurgent",
	[529] = "Pride 131",
	[530] = "Forklift",
	[531] = "Tractor",
	[532] = "Combine Harvester",
	[533] = "Feltzer",
	[534] = "Remington",
	[535] = "Slamvan",
	[536] = "Blade",
	[537] = "Freight",
	[538] = "Streak",
	[539] = "Vortex",
	[540] = "Peykan",
	[541] = "Ford GT",
	[542] = "Bentley Mulliner Bacalar",
	[543] = "Sadler",
	[544] = "Fire Truck Ladder",
	[545] = "Hustler",
	[546] = "Xantia",
	[547] = "Peugeot Pars",
	[548] = "Cargobob",
	[549] = "Lamborghini Veneno Roadster",
	[550] = "Mercedes-Benz AMG CLS",
	[551] = "Peugeot 405",
	[552] = "Utility Van",
	[553] = "Nevada",
	[554] = "Yosemite",
	[555] = "Aston Martin",
	[556] = "Monster 2",
	[557] = "Monster 3",
	[558] = "Uranus",
	[559] = "Chevrolet Camaro ZL1",
	[560] = "BMW M5 F90 2021",
	[561] = "Lexus LX 570",
	[562] = "Nissan-GTR",
	[563] = "Raindance",
	[564] = "RC Tiger",
	[565] = "Flash",
	[566] = "Mercedes-Benz S500",
	[567] = "Mercedes-Benz Classic",
	[568] = "Mercedes-Benz AMG F1",
	[569] = "Freight Train Flatbed",
	[570] = "Streak Train Trailer",
	[571] = "Kart",
	[572] = "Mower",
	[573] = "Dune",
	[574] = "Sweeper",
	[575] = "Truffade Z-Type",
	[576] = "Tornado",
	[577] = "Airbus 737 IranAir",
	[578] = "DFT-30",
	[579] = "GMC",
	[580] = "Lamborghini Urus",
	[581] = "BF-400",
	[582] = "News Van",
	[583] = "Tug",
	[584] = "Trailer (Tanker Commando)",
	[585] = "BMW X7",
	[586] = "Wayfarer",
	[587] = "Chevrolet Corvette C8",
	[588] = "Dune",
	[589] = "Toyota Supra MK4",
	[590] = "Box Freight",
	[591] = "Trailer 3",
	[592] = "Andromada",
	[593] = "Dodo",
	[594] = "RC Cam",
	[595] = "Launch",
	[596] = "Dodge Charger Department Editation",
	[597] = "Dodge Charger Police Editation",
	[598] = "Dodge Charger Police Editation",
	[599] = "Police Ranger",
	[600] = "Picador",
	[601] = "S.W.A.T",
	[602] = "Nissan-GTR SKYLINE",
	[603] = "Lamborghini Huracan",
	[604] = "Savana",
	[605] = "Sadler Damaged",
	[606] = "Baggage Trailer (covered)",
	[607] = "Baggage Trailer (Uncovered)",
	[608] = "Trailer (Stairs)",
	[609] = "Boxville Mission",
	[610] = "Farm Trailer",
	[611] = "Street Clean Traile",


}


function setup( theRes )
	if theRes == g_thisRes then
		setPlayerHudComponentVisible( "vehicle_name", false)
		screenWidth, screenHeight = guiGetScreenSize ( )
	end
end
addEventHandler( "onClientResourceStart", g_Root, setup )

function finishup( theRes )
	if theRes == g_thisRes then
		setPlayerHudComponentVisible( "vehicle_name", true)
	end
end
addEventHandler( "onClientResourceStop", g_Root, finishup )

function textShow()
	local posX = screenWidth/2
	local posY = screenHeight*(2.8/3)
	for P=-4,4 do
	    for Q=-4,4 do
		
		dxDrawText(theVehName, posX+P, posY+Q, posX+P, posY+Q, tocolor(255,255,255,theAlpha), 1.5, "pricedown", "center")		
	    end
	end
	if tonumber(getElementData(getLocalPlayer(), "nowTheme")) == 0 then
	dxDrawText(theVehName, posX, posY, posX, posY, tocolor(6 , 56 , 255,theAlpha), 1.5, "pricedown", "center")
	elseif tonumber(getElementData(getLocalPlayer(), "nowTheme")) == 1 then
		dxDrawText(theVehName, posX, posY, posX, posY, tocolor(13 , 139 , 7,theAlpha), 1.5, "pricedown", "center")
		elseif tonumber(getElementData(getLocalPlayer(), "nowTheme")) == 2 then
		dxDrawText(theVehName, posX, posY, posX, posY, tocolor(210 , 199 , 4 ,theAlpha), 1.5, "pricedown", "center")
		elseif tonumber(getElementData(getLocalPlayer(), "nowTheme")) == 3 then
		dxDrawText(theVehName, posX, posY, posX, posY, tocolor(192 , 23 , 28 ,theAlpha), 1.5, "pricedown", "center")
end
end

function textFade()
	theAlpha=theAlpha-10
	if theAlpha<0 then
                theAlpha=255
		removeEventHandler( "onClientRender", g_Root, textShow )
	end
end

function startTextFade()
    setTimer( textFade, 50, 60)
end

function nameToggle()
    local theVeh   = getPedOccupiedVehicle(localPlayer)
    local theVehID = getElementModel(theVeh)
    theVehName = changeTable[theVehID]
    if not theVehName then theVehName = getVehicleName(theVeh) end
    theAlpha = 255
    addEventHandler( "onClientRender", g_Root, textShow )
    setTimer( startTextFade, 1000, 1)
end
addCommandHandler("name",nameToggle)

function textStart(thePlayer)
    if thePlayer==localPlayer then
        local theVehID = getElementModel(source)
        theVehName = changeTable[theVehID]
        if not theVehName then theVehName = getVehicleName(source) end
        theAlpha = 255
        addEventHandler ( "onClientRender", g_Root, textShow )
        setTimer( startTextFade, 1000, 1)
    end
end
addEventHandler("onClientVehicleEnter", getRootElement(),textStart)







local screenW, screenH = guiGetScreenSize()

window = guiCreateStaticImage((screenW - 60) / 1.5, (screenH - 50) / 1.1, 60, 50, "File/Kadr.png", false)
guiWindowSetSizable(window, false)



cancelbtn = guiCreateButton(0, 0, 50, 40, "Pelak", false, window)
guiSetFont(cancelbtn, "clear-normal")
guiSetProperty(cancelbtn, "HoverTextColour", "FFFE0000" )

guiSetVisible(window, false)



addEventHandler ( "onClientGUIClick", cancelbtn, function() 
guiSetVisible(window, false)
showCursor(false)
triggerServerEvent("biadchatboxplak", getLocalPlayer(), getLocalPlayer() )
end, false )

addEvent("BiadPelaks",true)
addEventHandler("BiadPelaks",getLocalPlayer(),
function ()
guiSetVisible(window, true)
--showCursor(true)
end )

addEvent("BiadPelak",true)
addEventHandler("BiadPelak",getLocalPlayer(),
function()
guiSetVisible(window, true)
--showCursor(true)
end )