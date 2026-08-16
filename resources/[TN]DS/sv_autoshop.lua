lastPosition = {}

function SetOutOfCarShop(player,dim,x,y,z)
   if getElementType(player) == "player" then
	   setElementDimension(player,dim)
      setElementPosition(player,x,y,z)
   end
end
addEvent("SetOutOfCarShop",true)
addEventHandler("SetOutOfCarShop",root,SetOutOfCarShop)





local accSys = exports["Accounts-System"]
local miscSys = exports["Misc"]
local vehSys = exports["[tn]DS"]

function Hala0ShePanel (thePlayer)
   
   setElementData(thePlayer, "openpanelds", false)
end
addEvent("PanelDsAmadeSheBiad",true)
addEventHandler("PanelDsAmadeSheBiad", root, Hala0ShePanel)

function getcars(taraf)
   if taraf then
      local getcarsnumberr = tonumber(getElementData(taraf,"carsnumber"))
      local defcarsnumber = tonumber(0)
      if getcarsnumberr == nil then
         return defcarsnumber
      end
      return getcarsnumberr
   end
end

local cars = {
   [494] = "Nissan Silvia",
   [502] = "FordMustang",
   [491] = "Ferari F430",
   [602] = "Skyline",
   [429] = "Buggati Chiron",
   [527] = "BMW I8",
   [506] = "Venom",
   [522] = "Kawasaki Ninja",
   [529] = "Pride",
   [503] = "Dodge Challenger",
   [415] = "Audi R8",
   [558] = "Fj Cruise",
   [436] = "Maserati",
   [480] = "Audi TT RS",
   [475] = "Porsche 718",
   [400] = "Porsche",
   [535] = "BMW Z4",
   [404] = "Range Rover",
   [565] = "Peugeot Pars",
   [458] = "Minivan 24V",
   [467] = "Lamborgini Veneno",
   [579] = "GMC YuKon",
   [477] = "PonTiaC",
   [555] = "Mercedes Benz Vision",
   [412] = "Batman Car",
   [504] = "Toyota Supra A90",
   [580] = "Lamborghini Urus",
   [542] = "Bentley",
   [411] = "Lykan HyperSport",
   [490] = "Chevrolet Suburban",
   [562] = "Nissan GTR",
   [541] = "Ford Gt",
   [445] = "Dena",
   [439] = "Formol 1",
   [587] = "Corvette",
   [526] = "Gt86",
   [589] = "Toyota Supra",
   [461] = "Hunda CG-125",
   [585] = "BMW x7",
   [540] = "Peykan",
   [554] = "Peykan Vanet",
   [422] = "Mazda Vanet",
   [451] = "VeilSide" ,
   [402] = "Agera",
   [551] = "405 GLX",
   [426] = "Samand",
   [517] = "McLaren",
}

function GetCarName(model)
   if model then
      if cars[model] then
         model = cars[model]
      else
         model = getVehicleNameFromModel(model)
         return model
      end
   end
end

function convertNumber( number )
   local formatted = number
   while true do
      formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )
      if ( k==0 ) then
         break
      end
   end
   return formatted
end

   --Creating Vehicle For Logged In

local dbpTime = 500

function CreateLoggedInVeh(arg)
   local pName = getPlayerName(arg)
   local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
   local result, numrows = dbPoll(query, dbpTime)
   if (result and numrows > 0) then
      for index, row in pairs(result) do
         local vOwner = row['vOwner']
         if pName == vOwner then
            local vModel = row['vModel']
            local vLocationX = row['vLocationX']
            local vLocationY = row['vLocationY']
            local vLocationZ = row['vLocationZ']
            local vRotationZ = row['vRotationZ']
            local vColor1R = row['vColor1R']
            local vColor1G = row['vColor1G']
            local vColor1B = row['vColor1B']
            local vColor2R = row['vColor2R']
            local vColor2G = row['vColor2G']
            local vColor2B = row['vColor2B']
            local vLightsR = row['vLightsR']
            local vLightsG = row['vLightsG']
            local vLightsB = row['vLightsB']
            local vPlate = row['vPlate']
            local vBime = row['vBime']
            local vTamir = row['vTamir']
            local vGolded = row['vGolded']
            local vEngine = row['vEngine']
            local vID = row['vID']
            local vSlot = row['vSlot']
            local vSorat = row['vSorat']
            local vShetab = row['vShetab']
            local vVazn = row['vVazn']
            local vVaznPich = row['vVaznPich']
            local vinteria = row['vinteria']
            local vTormoz = row['vTormoz']
            local vBrakebias = row['vBrakebias']
            local vDamage = row['vDamage']
            local vDrag = row['vDrag']
            local vDrivetype = row['vDrivetype']
            local vFarmon = row['vFarmon']
            local vFarmon1 = row['vFarmon1']
            local vEngineUltra = row['vEngineUltra']
            local vEngineDrag = row['vEngineDrag']
            local vHydraulics = row['vHydraulics']
            local vWheels = row['vWheels']
            local vNitro = row['vNitro']
            local vMove = row['vMove']
            local vPrice = row['vPrice']
            local vLowerLimit = row['vLowerLimit']
            local vCenterMass = row['vCenterMass']
            local vSpoiler = row['vSpoiler']
            local vSusForce = row['vSusForce']
            local vLocationdim = row['vLocationdim']
            local vLocationint = row['vLocationint']
            
            local selfVehicle = createVehicle ( tonumber(vModel), tonumber(vLocationX), tonumber(vLocationY), tonumber(vLocationZ))
            local dimspawn = setElementDimension(selfVehicle,tonumber(vLocationdim))
            local intspawn = setElementInterior(selfVehicle,tonumber(vLocationint))
            setElementRotation ( selfVehicle, 0, 0, tonumber(vRotationZ) )
            setVehicleRespawnPosition ( selfVehicle, tonumber(vLocationX), tonumber(vLocationY), tonumber(vLocationZ), 0, 0, tonumber(vRotationZ) )
            setElementData(selfVehicle,"vLocationint2",tonumber(vLocationint))
            setElementData(selfVehicle,"vLocationdim2",tonumber(vLocationdim))
            setVehicleColor( selfVehicle, vColor1R, vColor1G, vColor1B, vColor2R, vColor2G, vColor2B )
            setVehicleHeadLightColor ( selfVehicle, vLightsR, vLightsG, vLightsB )
            setVehicleLocked ( selfVehicle, true )
            setElementData(selfVehicle, "owner",vOwner)
            setElementData(selfVehicle, "vehicleID",vID)
            setElementData(selfVehicle, "vehicleSlot",vSlot)
            setElementData(selfVehicle, "bime",vBime)
            setElementData(selfVehicle, "golded",vGolded)
            setElementData(selfVehicle, "ultra",vEngine)
            setElementData(selfVehicle, "tamir",vTamir)
            setElementData(selfVehicle, "model",vModel)
            setElementData(selfVehicle,"maxspeed",vSorat)
            setElementData(selfVehicle,"shetab",vShetab)
            setElementData(selfVehicle,"vazn",vVazn)
            setElementData(selfVehicle,"vaznpich",vVaznPich)
            setElementData(selfVehicle,"interia",vinteria)
            setElementData(selfVehicle,"tormoz",vTormoz)
            setElementData(selfVehicle,"brakebais",vBrakebias)
            setElementData(selfVehicle,"damage",vDamage)
            setElementData(selfVehicle,"drag",vDrag)
            setElementData(selfVehicle,"drivetype",vDrivetype)
            setElementData(selfVehicle,"farmon",vFarmon)
            setElementData(selfVehicle,"farmon1",vFarmon1)
            setElementData(selfVehicle,"engineultra",vEngineUltra)
            setElementData(selfVehicle,"enginedrag",vEngineDrag)
            setElementData(selfVehicle,"nitro",vNitro)
            setElementData(selfVehicle,"ring",vWheels)
            setElementData(selfVehicle,"hydraulic",vHydraulics)
            setElementData(selfVehicle,"vMove",vMove)
            setElementData(selfVehicle,"vPrice",vPrice)
            setElementData(selfVehicle,"centermass",vCenterMass)
            setElementData(selfVehicle,"lowerlimit",vLowerLimit)
            setElementData(selfVehicle,"spoiler",vSpoiler)
            setElementData(selfVehicle,"susforce",vSusForce)
            setVehiclePlateText( selfVehicle, vPlate )
            --set Handling #VeCtoR
            local SoratCar = row['vSorat']
            setVehicleHandling(selfVehicle, "maxVelocity", tonumber(SoratCar))
            local ShetabCar = row['vShetab']
            setVehicleHandling(selfVehicle, "engineAcceleration", tonumber(ShetabCar) )
            local VazneCar = row['vVazn']
            setVehicleHandling (selfVehicle, "mass", tonumber(VazneCar))
            local VazneCarPich = row['vVaznPich']
            setVehicleHandling(selfVehicle, "turnMass", tonumber(VazneCarPich))
            local interiaCar = row['vinteria']
            setVehicleHandling(selfVehicle, "engineInertia", tonumber(interiaCar))
            local tormozCar = row['vTormoz']
            setVehicleHandling(selfVehicle, "brakeDeceleration", tonumber(tormozCar))
            local BrakebaisCar = row['vBrakebias']
            setVehicleHandling(selfVehicle, "brakeBias", tonumber(BrakebaisCar))
            local DamageCar = row['vDamage']
            setVehicleHandling(selfVehicle, "collisionDamageMultiplier", tonumber(DamageCar))
            local DragCar = row['vDrag']
            setVehicleHandling(selfVehicle, "dragCoeff", tonumber(DragCar) )
            local DriveTypeCar = row['vDrivetype']
            setVehicleHandling(selfVehicle, "driveType", DriveTypeCar)
            local FarmonCar = row['vFarmon']
            setVehicleHandling(selfVehicle, "tractionMultiplier", tonumber(FarmonCar))
            local FarmonCar1 = row['vFarmon1']
            setVehicleHandling(selfVehicle, "tractionLoss", tonumber(FarmonCar1))
            local SusForceCar = row['vSusForce']
            setVehicleHandling(selfVehicle, "suspensionForceLevel", tonumber(SusForceCar))
            local vCenterMass = row['vCenterMass']
            if vCenterMass ~= 0 then
               if vCenterMass == 1 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.3} )
            elseif vCenterMass == 2 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.4} )
            elseif vCenterMass == 3 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.5} )
            end
         end
         local vLLimit = row['vLowerLimit']
         if vLLimit ~= 0 then
         if vLLimit == 14 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.30)
         elseif vLLimit == 13 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.25)
         elseif vLLimit == 12 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.20)
         elseif vLLimit == 11 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.15)
         elseif vLLimit == 10 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.10)
         elseif vLLimit == 9 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.09)
         elseif vLLimit == 8 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.08)
         elseif vLLimit == 7 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.07)
         elseif vLLimit == 6 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.06)
         elseif vLLimit == 5 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.05)
         elseif vLLimit == 4 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.04)
         elseif vLLimit == 3 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.03)
         elseif vLLimit == 2 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.02)
         elseif vLLimit == 1 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.01)
         end
      end
      --Add Ring
      local Wheels = row['vWheels']
      if Wheels ~= 0 then
         addVehicleUpgrade ( selfVehicle, Wheels )
      end
      -- Add Tarh
      local Tarhesh = row['vPaintjob']
      if Tarhesh == 0 then
         setVehiclePaintjob (selfVehicle, 3)
      elseif Tarhesh == 1 then
         setVehiclePaintjob (selfVehicle, 0)
      elseif Tarhesh == 2 then
         setVehiclePaintjob (selfVehicle, 1)
      elseif Tarhesh == 3 then
         setVehiclePaintjob (selfVehicle, 2)
      end
      --local Ultrash = row['vEngine']
      --if Ultrash == 1 then
      --setElementData(selfVehicle, "ultra", 1)
      --else
      --setElementData(selfVehicle, "ultra", 0)
      --end
      --end
      --Add Hydraulic
      local Hydraulics = row['vHydraulics']
      if tonumber(Hydraulics) == 1 then
         addVehicleUpgrade ( selfVehicle, 1087 )
      end
      --Add Nitro
      local Nitro = row['vNitro']
      if Nitro == 1 then
         addVehicleUpgrade ( selfVehicle, 1009 )
      elseif Nitro == 2 then
         addVehicleUpgrade ( selfVehicle, 1008 )
      elseif Nitro == 3 then
         addVehicleUpgrade ( selfVehicle, 1010 )
      end
      local Spoileresh = row['vSpoiler']
      if Spoileresh ~= 0 then
         addVehicleUpgrade ( selfVehicle, Spoileresh )
      end
      --Add Fuel
      local Fuel = row['vFuel']
      setElementData(selfVehicle, "fuel",Fuel)
      --local vDrag = row['vDrag']
      --if tonumber(vDrag) == 1 then
      --setVehicleHandling(selfVehicle, "dragCoeff", 0)
      --end
      local plateText = getVehiclePlateText ( selfVehicle )
      for index, veh in ipairs(getElementsByType("vehicle")) do
         if plateText == getVehiclePlateText ( veh ) then
            if veh ~= selfVehicle then
               destroyElement( veh )
            end
            end
         end
      end
   end
end
dbFree(query)
end
local infoColors = "Color Ha: White, Blue, Green, Red, Yellow, Pink, Orange, Lightblue, Rasta, Ice Or False"
NeonColor = {
   [1] = {"wite","blue","green","red","yellow","pink","orange","lightblue","rasta","ice"}
}
   function CreateLoggedInVehRest(root)
      local pName = getPlayerName(root)
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
      local result, numrows = dbPoll(query, dbpTime)
      if (result and numrows > 0) then
         for index, row in pairs(result) do
            local vOwner = row['vOwner']
            if pName == vOwner then
               local vModel = row['vModel']
               local vLocationX = row['vLocationX']
               local vLocationY = row['vLocationY']
               local vLocationZ = row['vLocationZ']
               local vRotationZ = row['vRotationZ']
               local vColor1R = row['vColor1R']
               local vColor1G = row['vColor1G']
               local vColor1B = row['vColor1B']
               local vColor2R = row['vColor2R']
               local vColor2G = row['vColor2G']
               local vColor2B = row['vColor2B']
               local vLightsR = row['vLightsR']
               local vLightsG = row['vLightsG']
               local vLightsB = row['vLightsB']
               local vPlate = row['vPlate']
               local vBime = row['vBime']
               local vTamir = row['vTamir']
               local vGolded = row['vGolded']
               local vEngine = row['vEngine']
               local vID = row['vID']
               local vSlot = row['vSlot']
               local vSorat = row['vSorat']
               local vShetab = row['vShetab']
               local vVazn = row['vVazn']
               local vVaznPich = row['vVaznPich']
               local vinteria = row['vinteria']
               local vTormoz = row['vTormoz']
               local vBrakebias = row['vBrakebias']
               local vDamage = row['vDamage']
               local vDrag = row['vDrag']
               local vDrivetype = row['vDrivetype']
               local vFarmon = row['vFarmon']
               local vFarmon1 = row['vFarmon1']
               local vEngineUltra = row['vEngineUltra']
               local vEngineDrag = row['vEngineDrag']
               local vHydraulics = row['vHydraulics']
               local vWheels = row['vWheels']
               local vNitro = row['vNitro']
               local vMove = row['vMove']
               local vPrice = row['vPrice']
               local vLowerLimit = row['vLowerLimit']
               local vCenterMass = row['vCenterMass']
               local vSpoiler = row['vSpoiler']
               local vSusForce = row['vSusForce']
               local vLocationdim = row['vLocationdim']
               local vLocationint = row['vLocationint']
               local vNeon = tonumber(row['vNeon'])
               local selfVehicle = createVehicle ( tonumber(vModel), tonumber(vLocationX), tonumber(vLocationY), tonumber(vLocationZ))
               local dimspawn = setElementDimension(selfVehicle,tonumber(vLocationdim))
               local intspawn = setElementInterior(selfVehicle,tonumber(vLocationint))



               setElementData(selfVehicle,"vLocationint2",tonumber(vLocationint))
               setElementData(selfVehicle,"vLocationdim2",tonumber(vLocationdim))
               setElementRotation ( selfVehicle, 0, 0, tonumber(vRotationZ) )
               setVehicleRespawnPosition ( selfVehicle, tonumber(vLocationX), tonumber(vLocationY), tonumber(vLocationZ), 0, 0, tonumber(vRotationZ) )
               setVehicleColor( selfVehicle, vColor1R, vColor1G, vColor1B, vColor2R, vColor2G, vColor2B )
               setVehicleHeadLightColor ( selfVehicle, vLightsR, vLightsG, vLightsB )
               setVehicleLocked ( selfVehicle, true )
               setElementData(selfVehicle, "owner",vOwner)
               setElementData(selfVehicle, "vehicleID",vID)
               setElementData(selfVehicle, "vehicleSlot",vSlot)
               setElementData(selfVehicle, "bime",vBime)
               setElementData(selfVehicle, "golded",vGolded)
               setElementData(selfVehicle, "ultra",vEngine)
               setElementData(selfVehicle, "tamir",vTamir)
               setElementData(selfVehicle, "model",vModel)
               setElementData(selfVehicle,"maxspeed",vSorat)
               setElementData(selfVehicle,"shetab",vShetab)
               setElementData(selfVehicle,"vazn",vVazn)
               setElementData(selfVehicle,"vaznpich",vVaznPich)
               setElementData(selfVehicle,"interia",vinteria)
               setElementData(selfVehicle,"tormoz",vTormoz)
               setElementData(selfVehicle,"brakebais",vBrakebias)
               setElementData(selfVehicle,"damage",vDamage)
               setElementData(selfVehicle,"drag",vDrag)
               setElementData(selfVehicle,"drivetype",vDrivetype)
               setElementData(selfVehicle,"farmon",vFarmon)
               setElementData(selfVehicle,"farmon1",vFarmon1)
               setElementData(selfVehicle,"engineultra",vEngineUltra)
               setElementData(selfVehicle,"enginedrag",vEngineDrag)
               setElementData(selfVehicle,"nitro",vNitro)
               setElementData(selfVehicle,"ring",vWheels)
               setElementData(selfVehicle,"hydraulic",vHydraulics)
               setElementData(selfVehicle,"vMove",vMove)
               setElementData(selfVehicle,"vPrice",vPrice)
               setElementData(selfVehicle,"centermass",vCenterMass)
               setElementData(selfVehicle,"lowerlimit",vLowerLimit)
               setElementData(selfVehicle,"spoiler",vSpoiler)
               setElementData(selfVehicle,"susforce",vSusForce)
               setVehiclePlateText(selfVehicle,vPlate)
               if vNeon > 0 then
                  if NeonColor[1][vNeon] then
                     setElementData(selfVehicle, "tuning.neon", NeonColor[1][vNeon])
                     setElementData(selfVehicle, "vehicle.neon.active", false)
                  end 
               end
               --set Handling #VeCtoR
               local SoratCar = row['vSorat']
               setVehicleHandling(selfVehicle, "maxVelocity", tonumber(SoratCar))
               local ShetabCar = row['vShetab']
               setVehicleHandling(selfVehicle, "engineAcceleration", tonumber(ShetabCar) )
               local VazneCar = row['vVazn']
               setVehicleHandling (selfVehicle, "mass", tonumber(VazneCar))
               local VazneCarPich = row['vVaznPich']
               setVehicleHandling(selfVehicle, "turnMass", tonumber(VazneCarPich))
               local interiaCar = row['vinteria']
               setVehicleHandling(selfVehicle, "engineInertia", tonumber(interiaCar))
               local tormozCar = row['vTormoz']
               setVehicleHandling(selfVehicle, "brakeDeceleration", tonumber(tormozCar))
               local BrakebaisCar = row['vBrakebias']
               setVehicleHandling(selfVehicle, "brakeBias", tonumber(BrakebaisCar))
               local DamageCar = row['vDamage']
               setVehicleHandling(selfVehicle, "collisionDamageMultiplier", tonumber(DamageCar))
               local DragCar = row['vDrag']
               setVehicleHandling(selfVehicle, "dragCoeff", tonumber(DragCar) )
               local DriveTypeCar = row['vDrivetype']
               setVehicleHandling(selfVehicle, "driveType", DriveTypeCar)
               local FarmonCar = row['vFarmon']
               setVehicleHandling(selfVehicle, "tractionMultiplier", tonumber(FarmonCar))
               local FarmonCar1 = row['vFarmon1']
               setVehicleHandling(selfVehicle, "tractionLoss", tonumber(FarmonCar1))
               local SusForceCar = row['vSusForce']
               setVehicleHandling(selfVehicle, "suspensionForceLevel", tonumber(SusForceCar))
               local vCenterMass = row['vCenterMass']
               if vCenterMass ~= 0 then
                  if vCenterMass == 1 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.3} )
               elseif vCenterMass == 2 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.4} )
               elseif vCenterMass == 3 then setVehicleHandling(selfVehicle, "centerOfMass", {0.0, 0.3, -0.5} )
               end
            end
            local vLLimit = row['vLowerLimit']
            if vLLimit ~= 0 then
            if vLLimit == 14 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.30)
            elseif vLLimit == 13 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.25)
            elseif vLLimit == 12 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.20)
            elseif vLLimit == 11 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.15)
            elseif vLLimit == 10 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.10)
            elseif vLLimit == 9 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.09)
            elseif vLLimit == 8 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.08)
            elseif vLLimit == 7 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.07)
            elseif vLLimit == 6 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.06)
            elseif vLLimit == 5 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.05)
            elseif vLLimit == 4 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.04)
            elseif vLLimit == 3 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.03)
            elseif vLLimit == 2 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.02)
            elseif vLLimit == 1 then setVehicleHandling(selfVehicle, "suspensionLowerLimit", -0.01)
            end
         end
         --Add Ring
         local Wheels = row['vWheels']
         if Wheels ~= 0 then
            addVehicleUpgrade ( selfVehicle, Wheels )
         end
         -- Add Tarh
         local Tarhesh = row['vPaintjob']
         if Tarhesh == 0 then
            setVehiclePaintjob (selfVehicle, 3)
         elseif Tarhesh == 1 then
            setVehiclePaintjob (selfVehicle, 0)
         elseif Tarhesh == 2 then
            setVehiclePaintjob (selfVehicle, 1)
         elseif Tarhesh == 3 then
            setVehiclePaintjob (selfVehicle, 2)
         end
         --local Ultrash = row['vEngine']
         --if Ultrash == 1 then
         --setElementData(selfVehicle, "ultra", 1)
         --else
         --setElementData(selfVehicle, "ultra", 0)
         --end

         --end
         --Add Hydraulic
         local Hydraulics = row['vHydraulics']
         if tonumber(Hydraulics) == 1 then
            addVehicleUpgrade ( selfVehicle, 1087 )
         end
         --Add Nitro
         local Nitro = row['vNitro']
         if Nitro == 1 then
            addVehicleUpgrade ( selfVehicle, 1009 )
         elseif Nitro == 2 then
            addVehicleUpgrade ( selfVehicle, 1008 )
         elseif Nitro == 3 then
            addVehicleUpgrade ( selfVehicle, 1010 )
         end

         local Spoileresh = row['vSpoiler']
         if Spoileresh ~= 0 then
            addVehicleUpgrade ( selfVehicle, Spoileresh )
         end

         --Add Fuel
         local Fuel = row['vFuel']
         setElementData(selfVehicle, "fuel",Fuel)

         --local vDrag = row['vDrag']
         --if tonumber(vDrag) == 1 then
         --setVehicleHandling(selfVehicle, "dragCoeff", 0)
         --end
         local plateText = getVehiclePlateText ( selfVehicle )
         for index, veh in ipairs(getElementsByType("vehicle")) do
            if plateText == getVehiclePlateText ( veh ) then
               if veh ~= selfVehicle then
                  destroyElement( veh )
               end
            end
         end
      end
   end
end
dbFree(query)
end

function handle( thePlayer, cmd, VehID, Property)
if Property and VehID then
   local Value = GetHandlingProperty( tonumber(VehID), tostring(Property))
   if Value then
      outputChatBox ( "Handling Property: "..tostring(Property).." Handling Value: "..Value.."", thePlayer, 255, 0, 0 )
   end
end
end
addCommandHandler("handle",handle)


function GetHandlingProperty(VehID,Property)
for k,h in pairs(getModelHandling(tonumber(VehID))) do
   if tostring(k) == Property then
      return h
   end
end
end

function createOnResourceStart()
for k, hame_Playera	in ipairs (getElementsByType("player")) do
   if getElementData(hame_Playera, "loggedIn") == true then
      CreateLoggedInVehRest(hame_Playera)
   end
end
end
createOnResourceStart()

function setVehicleData(vehicleID, dataName, dataValue)
   if vehicleID and dataName and dataValue then
      local vehicleID , dataName , dataValue = tonumber(vehicleID), tostring(dataName), tostring(dataValue)
      local dataNames = {
         ["vID"] = true, ["vOwner"] = true, ["vLock"] = true, ["vSideskirt"] = true, ["vRearbumper"] = true,
         ["vModel"] = true, ["vColor1G"] = true, ["vFuel"] = true, ["vFrontbullbars"] = true, ["vMisc"] = true,
         ["vLocationX"] = true, ["vColor1B"] = true, ["vHealth"] = true, ["vRearbullbars"] = true, ["vSlot"] = true,
         ["vLocationY"] = true, ["vColor2R"] = true, ["vPaintjob"] = true, ["vRoof"] = true, ["vLocationZ"] = true,
         ["vColor2G"] = true, ["vNitro"] = true, ["vRotationX"] = true, ["vColor2B"] = true,
         ["vDoors"] = true, ["vHydraulics"] = true, ["vRotationY"] = true, ["vLightsR"] = true,
         ["vStereo"] = true, ["vRotationZ"] = true, ["vLightsG"] = true, ["vHood"] = true, ["vWheels"] = true,
         ["vPrice"] = true, ["vLightsB"] = true, ["vVent"] = true, ["vExhaust"] = true, ["vColor1R"] = true,
         ["vPlate"] = true, ["vBime"] = true, ["vSpoiler"] = true, ["vFrontbumper"] = true, ["vNeon"] = true,
         ["vOldOwner"] = true,["vTamir"] = true, ["vGolded"] = true, ["vLowerLimit"] = true,
         ["vSorat"] = true, ["vShetab"] = true, ["vVazn"] = true, ["vVaznPich"] = true, ["vinteria"] = true,
         ["vTormoz"] = true, ["vBrakebias"] = true, ["vDamage"] = true, ["vDrag"] = true, ["vDriveType"] = true,
         ["vFarmon"] = true, ["vFarmon1"] = true, ["vEngineDrag"] = true, ["vEngineUltra"] = true,
         ["vCenterMass"] = true, ["vLowerLimit"] = true, ["vMove"] = true, ["vSusForce"] = true,
         ["vLowerLimit"] = true,["vLocationint"] = true,["vLocationdim"] = true,
      }
      if dataNames[dataName] then
         local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `"..dataName.."` = '"..dataValue.."' WHERE `vID` = '"..vehicleID.."'")
         dbFree(myQH)
      end
   end
end

--DS

function isVehicleOccupied(vehicle)
   assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
   local _, occupant = next(getVehicleOccupants(vehicle))
   return occupant and true, occupant
end

for index, mashinayeDs in ipairs(getElementsByType("vehicle")) do
local vehid = getElementID ( mashinayeDs )
if vehid == "dscar1" or vehid == "dscar2" or vehid == "dscar3" or vehid == "dscar4" or vehid == "dscar5" or vehid == "dscar6" or vehid == "dscar7" or vehid == "dscar8" or vehid == "dscar9" or vehid == "dscar10" or vehid == "dscar11" or vehid == "dscar12" or vehid == "dscar13" or vehid == "dscar14" or vehid == "dscar15" or vehid == "dscar16" or vehid == "dscar17" or vehid == "dscar18" or vehid == "dscar19" or vehid == "dscar20" or vehid == "dscar21" or vehid == "dscar22" or vehid == "dscar23" or vehid == "dscar24" or vehid == "dscar25" or vehid == "dscar26" or vehid == "dscar27" or vehid == "dscar28" or vehid == "dscar29" or vehid == "dscar30" or vehid == "dscar31" or vehid == "dscar32" or vehid == "dscar33" or vehid == "dscar34" or vehid == "dscar35" or vehid == "dscar36" or vehid == "dscar37" or vehid == "dscar38" or vehid == "dscar39" or vehid == "dscar40" or vehid == "dscar41" or vehid == "dscar42" or vehid == "dscar43" or vehid == "dscar44" or vehid == "dscar45" or vehid == "dscar46" or vehid == "dscar47" or vehid == "dscar48" or vehid == "dscar49" or vehid == "dscar50" or vehid == "dscar51" or vehid == "dscar52" or vehid == "dscar53" or vehid == "dscar54" or vehid == "dscar55" or vehid == "dscar56" or vehid == "dscar57" or vehid == "dscar58" or vehid == "dscar59" or vehid == "dscar60" or vehid == "dscar61"
or vehid == "dscar62" or vehid == "dscar63" or vehid == "dscar64"	then
   setElementFrozen ( mashinayeDs, true )
   setVehicleLocked ( mashinayeDs, true )
   setVehicleDamageProof( mashinayeDs,true)
end
end


for index, mashinayeDs in ipairs(getElementsByType("vehicle")) do
local vehid = getElementID ( mashinayeDs )
if vehid == "dscar1" or vehid == "dscar2" or vehid == "dscar3" or vehid == "dscar6" then
   setVehicleOverrideLights( mashinayeDs , 2)
end
end





-- Khardi Mashin Ba Pol --


function buy( root, gheymat, gheymatgold, shetab, sorat, vazn, idecar, carx, cary, carz, carrot, sellprice, ColorR, ColorG, ColorB,tormoz,vaznPich,farmon,farmon1,damage,drag,drivetype,brakebias,interia,vazn1 )

if getPlayerMoney(root) >= tonumber(gheymat) then
   if tonumber(getElementData(root,"premiumeYaNa")) ~= 5 then -- age Premium nabod natone car sport bakhre #VeCtoR
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
      local result, numrows = dbPoll(query, dbpTime)
      if (result and numrows > 0) then
         setElementData(root,"carsnumber",0)
         for index, row in pairs(result) do
            local owner = row['vOwner']
            local owner2 = row['vOldOwner']
            if owner == getPlayerName(root) then
               local chanta = getcars(root)
               local chantabadi = tonumber(chanta) + 1
               setElementData(root,"carsnumber",chantabadi)
            end
         end
         dbFree(query)
      end
      if tonumber(getcars(root)) < tonumber(getElementData(accSys:getPlayerAcc(root), "pSlot")) then
         outputChatBox("#00ff00[Tavajoh]: #ffffffMashine Jadide Shoma Dar Parkinge Namayeshgah Park Shode Ast!", root, 255, 255, 255, true)
         exports["notf"]:addNotification(root, "Tabrik, Shoma Ba Movafagiat In Mashin Ra Kharidid." , 'success')
         exports.Logs:newLog("BuyCar","Player "..getPlayerName(root).." Mashine ID "..idecar.." Ra Be Gheymate $"..gheymat.." Kharid")
         outputDebugString("Player "..getPlayerName(root).." Mashine ID "..idecar.." Ra Be Gheymate $"..gheymat.." Kharid")
         triggerClientEvent ( root, "PlayMovafagh", root)
         takePlayerMoney ( root, tonumber(gheymat) )
         local NewCar =  createVehicle ( idecar, carx, cary, carz, 0, 0, carrot )
         setVehicleRespawnPosition ( NewCar, carx, cary, carz, 0, 0, carrot )
         setVehicleColor( NewCar, ColorR,ColorG,ColorB)
         local dscolor = setVehicleHeadLightColor ( NewCar, 255, 255, 255 )
         local slot = getcars(root)
         setVehicleLocked ( NewCar, true )
         setElementData(NewCar, "owner",getPlayerName(root))
         setElementData(NewCar, "vehicleSlot",slot+1)
         local slot1 = tonumber(slot)+1
         local QueryMashinSazBaradarGhooleCheragheJado = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `vehicles` SET `vOwner` = ?, `vModel`= ?, `vLocationX` = ?, `vLocationY` = ?, `vLocationZ` = ?,`vRotationZ` = ? ,`vColor1R` = ? ,`vColor1G` = ? ,`vColor1B` = ? ,`vGolded` = ? , `vFuel` = ? , `vSorat` = ? , `vShetab` = ? , `vVazn` = ?, `vVaznPich` = ?, `vinteria` = ?, `vTormoz` = ? , `vBrakebias` = ?, `vDamage` = ?, `vDrag` = ?, `vDrivetype` = ?, `vFarmon` = ? , `vFarmon1` = ?,`vBime` = ?, `vPrice` = ?, `vSlot` ="..slot1.."", getPlayerName(root), idecar, carx, cary, carz, carrot,ColorR,ColorG,ColorB,0,100,sorat,shetab,vazn1,vaznPich,interia,tormoz,brakebias,damage,drag,drivetype,farmon,farmon1,2, sellprice, 0)
         dbFree(QueryMashinSazBaradarGhooleCheragheJado)
         local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
         local result, numrows = dbPoll(query, dbpTime)
         if (result and numrows > 0) then
            setElementData(root,"carsnumber",0)
            for index, row in pairs(result) do
               local owner = row['vOwner']
               local owner2 = row['vOldOwner']
               if owner == getPlayerName(root) then
                  local slot2 = row['vSlot']
                  if slot2 == slot1 then
                     local vID = row['vID']
                     createPlateStage1(vID)
                     setElementData(NewCar,"vehicleID",vID)
                     local vPlate = row['vPlate']
                     setVehiclePlateText( NewCar, vPlate )
                     local vBime = row['vBime']
                     setElementData(NewCar,"bime",vBime)
                     local vTamir = row['vTamir']
                     setElementData(NewCar,"tamir",vTamir)
                     local vModel = row['vModel']
                     setElementData(NewCar,"model",vModel)
                     local vGolded = row['vGolded']
                     setElementData(NewCar,"golded",vGolded)
                     local vEngine = row['vEngine']
                     setElementData(NewCar,"ultra",vEngine)
                     local vMove = row['vMove']
                     setElementData(NewCar,"vMove",vMove)
                     local vPrice = row['vPrice']
                     setElementData(NewCar,"vPrice",vPrice)

                     -- Set Data Scripti Handling
                     local vSorat = row['vSorat']
                     setElementData(NewCar,"maxspeed",vSorat)
                     local vShetab = row['vShetab']
                     setElementData(NewCar,"shetab",vShetab)
                     local vVazn = row['vVazn']
                     setElementData(NewCar,"vazn",vVazn)
                     local vVaznPich = row['vVaznPich']
                     setElementData(NewCar,"vaznpich",vVaznPich)
                     local vinteria = row['vinteria']
                     setElementData(NewCar,"interia",vinteria)
                     local vTormoz = row['vTormoz']
                     setElementData(NewCar,"tormoz",vTormoz)
                     local vBrakebias = row['vBrakebias']
                     setElementData(NewCar,"brakebais",vBrakebias)
                     local vDamage = row['vDamage']
                     setElementData(NewCar,"damage",vDamage)
                     local vDrag = row['vDrag']
                     setElementData(NewCar,"drag",vDrag)
                     local vDrivetype = row['vDrivetype']
                     setElementData(NewCar,"drivetype",vDrivetype)
                     local vFarmon = row['vFarmon']
                     setElementData(NewCar,"farmon",vFarmon)
                     local vFarmon1 = row['vFarmon1']
                     setElementData(NewCar,"farmon1",vFarmon1)
                     local vNitro = row['vNitro']
                     setElementData(NewCar,"nitro",vNitro)
                     local vWheels = row['vWheels']
                     setElementData(NewCar,"ring",vWheels)
                     local vHydraulics = row['vHydraulics']
                     setElementData(NewCar,"hydraulic",vHydraulics)
                     local vCenterMass = row['vCenterMass']
                     setElementData(NewCar,"centermass",vCenterMass)
                     local vLowerLimit = row['vLowerLimit']
                     setElementData(NewCar,"lowerlimit",vLowerLimit)
                     local vSpoiler = row['vSpoiler']
                     setElementData(NewCar,"spoiler",vSpoiler)
                     local vSusForce = row['vSusForce']
                     setElementData(NewCar,"susforce",vSusForce)
                     setVehicleHandling(NewCar, "mass", vazn1)
                     setVehicleHandling(NewCar, "turnMass", vaznPich)
                     setVehicleHandling(NewCar, "tractionMultiplier", farmon)
                     setVehicleHandling(NewCar, "tractionLoss", farmon1)
                     --setVehicleHandling(NewCar, "numberOfGears", 5)
                     setVehicleHandling(NewCar, "maxVelocity", sorat)
                     setVehicleHandling(NewCar, "engineAcceleration", shetab )
                     setVehicleHandling(NewCar, "collisionDamageMultiplier", damage)
                     setVehicleHandling(NewCar, "brakeDeceleration", tormoz)
                     setVehicleHandling(NewCar, "engineInertia", interia)
                     setVehicleHandling(NewCar, "dragCoeff", drag )
                     setVehicleHandling(NewCar, "driveType", drivetype)
                     setVehicleHandling(NewCar, "brakeBias", brakebias)


                  end
               end
            end
            dbFree(query)
         end
         setTimer( function()
         SortPlayerVehiclesID(thePlayer)
         end, 7000, 1)
      else
         triggerClientEvent ( root, "PlayError", root, "Hello World!" )
         exports["notf"]:addNotification(root, "Shoma Slote Kafi Nadarid." , 'error')
         setElementData(root,"carsnumber",nil)
      end
   else
      exports["notf"]:addNotification(root, "Baraye Kharid Mashin Haye Sporte Namayeshgah Bayad Gold Premium Bashid!" , 'error')
      triggerClientEvent ( root, "PlayError", root )
   end
else
   triggerClientEvent ( root, "PlayError", root )
   exports["notf"]:addNotification(root, "Shoma Pole Kafi Nadarid!" , 'error')
end
end
addEvent("buydscar",true)
addEventHandler("buydscar", root,buy)






-- Khardi Mashin Ba Gold --


addCommandHandler("addcar",function(thePlayer,CMD,player,idecar,shetab,sorat,sellprice,farmon1,drivetype)
   if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 9 then
      if player and idecar and shetab and sorat and sellprice and farmon1 and drivetype then
         local find=miscSys:findPlayer(player)
         if find then
            local x,y,z = getElementPosition(thePlayer)
            local rx,ry,rz = getElementRotation(thePlayer)
            buyG(find, 0, 0, shetab, sorat, 2600, idecar, x, y, z+0.1, rx,ry,rz, sellprice, 255, 255, 255, 20,2600,45,farmon1,1,1,drivetype,0.3,10,2600 )
            
         else
            exports["notf"]:addNotification(thePlayer, "Player Peyda Nashod" , 'success')
         end
      else
         outputChatBox("#FF0000[Error]: /addcar <NAMEPLAYER/ID> <IDCAR> <SHETAB> <MAXSPEED> <SELLPRICE> <FARMON1> <drivetype>", thePlayer, 255, 255, 255, true)
      end
   end
end)
function buyG( root, gheymat, gheymatgold, shetab, sorat, vazn, idecar, carx, cary, carz, carrot, sellprice, ColorR, ColorG, ColorB, tormoz,vaznPich,farmon,farmon1,damage,drag,drivetype,brakebias,interia,vazn1 )
Goldp = getElementData(accSys:getPlayerAcc(root), "pGold")
if Goldp >= tonumber(gheymatgold) then
   if tonumber(getElementData(root,"premiumeYaNa")) ~= 5 then -- age Premium nabod natone car sport bakhre #VeCtoR
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
      local result, numrows = dbPoll(query, dbpTime)
      if (result and numrows > 0) then
         setElementData(root,"carsnumber",0)
         for index, row in pairs(result) do
            local owner = row['vOwner']
            if owner == getPlayerName(root) then
               local chanta = getcars(root)
               local chantabadi = tonumber(chanta) + 1
               setElementData(root,"carsnumber",chantabadi)
            end
         end
         dbFree(query)
      end
      if tonumber(getcars(root)) < tonumber(getElementData(accSys:getPlayerAcc(root), "pSlot")) then
         outputChatBox("#00ff00[Tavajoh]: #ffffffMashine Jadide Shoma Dar Parkinge Namayeshgah Park Shode Ast!", root, 255, 255, 255, true)
         exports["notf"]:addNotification(root, "Tabrik, Shoma Ba Movafagiat In Mashin Ra Kharidid." , 'success')
         exports.Logs:newLog("BuyCar","Player "..getPlayerName(root).." Mashine ID "..idecar.." Ra Be Gheymate "..gheymatgold.." Gold Kharid")
         outputDebugString("Player "..getPlayerName(root).." Mashine ID "..idecar.." Ra Be Gheymate "..gheymatgold.." Gold Kharid")
         triggerClientEvent ( root, "PlayMovafagh", root, "Hello World!" )
         setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(Goldp) - gheymatgold)
         local NewCar =  createVehicle ( idecar, carx, cary, carz, 0, 0, carrot )
         setVehicleColor( NewCar, ColorR,ColorG,ColorB)
         local dscolor = setVehicleHeadLightColor ( NewCar, 255, 255, 255 )
         local slot = getcars(root)
         setVehicleLocked ( NewCar, true )
         setElementData(NewCar, "owner",getPlayerName(root))
         setElementData(NewCar, "vehicleSlot",slot+1)
         local slot1 = tonumber(slot)+1
         local QueryMashinSazBaradarGhooleCheragheJado = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `vehicles` SET `vOwner` = ?, `vModel`= ?, `vLocationX` = ?, `vLocationY` = ?, `vLocationZ` = ?,`vRotationZ` = ? ,`vColor1R` = ? ,`vColor1G` = ? ,`vColor1B` = ? ,`vGolded` = ? , `vFuel` = ? , `vSorat` = ? , `vShetab` = ? , `vVazn` = ?, `vVaznPich` = ?, `vinteria` = ?, `vTormoz` = ? , `vBrakebias` = ?, `vDamage` = ?, `vDrag` = ?, `vDrivetype` = ?, `vFarmon` = ? , `vFarmon1` = ?,`vBime` = ?, `vPrice` = ?, `vSlot` ="..slot1.."", getPlayerName(root), idecar, carx, cary, carz, carrot,ColorR,ColorG,ColorB,1,100,sorat,shetab,vazn1,vaznPich,interia,tormoz,brakebias,damage,drag,drivetype,farmon,farmon1,2, sellprice, 0)
         dbFree(QueryMashinSazBaradarGhooleCheragheJado)
         local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
         local result, numrows = dbPoll(query, dbpTime)
         if (result and numrows > 0) then
            setElementData(root,"carsnumber",0)
            for index, row in pairs(result) do
               local owner = row['vOwner']
               if owner == getPlayerName(root) then
                  local slot2 = row['vSlot']
                  if slot2 == slot1 then
                     local vID = row['vID']
                     createPlateStage1(vID)
                     setElementData(NewCar,"vehicleID",vID)
                     local vPlate = row['vPlate']
                     setVehiclePlateText( NewCar, vPlate )
                     local vBime = row['vBime']
                     setElementData(NewCar,"bime",vBime)
                     local vTamir = row['vTamir']
                     setElementData(NewCar,"tamir",vTamir)
                     local vModel = row['vModel']
                     setElementData(NewCar,"model",vModel)
                     local vGolded = row['vGolded']
                     setElementData(NewCar,"golded",vGolded)
                     local vEngine = row['vEngine']
                     setElementData(NewCar,"ultra",vEngine)
                     local vMove = row['vMove']
                     setElementData(NewCar,"vMove",vMove)
                     local vPrice = row['vPrice']
                     setElementData(NewCar,"vPrice",vPrice)

                     -- Set Data Scripti Handling
                     local vSorat = row['vSorat']
                     setElementData(NewCar,"maxspeed",vSorat)
                     local vShetab = row['vShetab']
                     setElementData(NewCar,"shetab",vShetab)
                     local vVazn = row['vVazn']
                     setElementData(NewCar,"vazn",vVazn)
                     local vVaznPich = row['vVaznPich']
                     setElementData(NewCar,"vaznpich",vVaznPich)
                     local vinteria = row['vinteria']
                     setElementData(NewCar,"interia",vinteria)
                     local vTormoz = row['vTormoz']
                     setElementData(NewCar,"tormoz",vTormoz)
                     local vBrakebias = row['vBrakebias']
                     setElementData(NewCar,"brakebais",vBrakebias)
                     local vDamage = row['vDamage']
                     setElementData(NewCar,"damage",vDamage)
                     local vDrag = row['vDrag']
                     setElementData(NewCar,"drag",vDrag)
                     local vDrivetype = row['vDrivetype']
                     setElementData(NewCar,"drivetype",vDrivetype)
                     local vFarmon = row['vFarmon']
                     setElementData(NewCar,"farmon",vFarmon)
                     local vFarmon1 = row['vFarmon1']
                     setElementData(NewCar,"farmon1",vFarmon1)
                     local vEngineUltra = row['vEngineUltra']
                     setElementData(NewCar,"engineultra",vEngineUltra)
                     local vEngineDrag = row['vEngineDrag']
                     setElementData(NewCar,"enginedrag",vEngineDrag)
                     local vNitro = row['vNitro']
                     setElementData(NewCar,"nitro",vNitro)
                     local vWheels = row['vWheels']
                     setElementData(NewCar,"ring",vWheels)
                     local vHydraulics = row['vHydraulics']
                     setElementData(NewCar,"hydraulic",vHydraulics)
                     local vCenterMass = row['vCenterMass']
                     setElementData(NewCar,"centermass",vCenterMass)
                     local vLowerLimit = row['vLowerLimit']
                     setElementData(NewCar,"lowerlimit",vLowerLimit)
                     local vSpoiler = row['vSpoiler']
                     setElementData(NewCar,"spoiler",vSpoiler)
                     local vSusForce = row['vSusForce']
                     setElementData(NewCar,"susforce",vSusForce)



                     setVehicleHandling(NewCar, "mass", vazn1)
                     setVehicleHandling(NewCar, "turnMass", vaznPich)
                     setVehicleHandling(NewCar, "tractionMultiplier", farmon)
                     setVehicleHandling(NewCar, "tractionLoss", farmon1)
                     --setVehicleHandling(NewCar, "numberOfGears", 5)
                     setVehicleHandling(NewCar, "maxVelocity", sorat)
                     setVehicleHandling(NewCar, "engineAcceleration", shetab )
                     setVehicleHandling(NewCar, "collisionDamageMultiplier", damage)
                     setVehicleHandling(NewCar, "brakeDeceleration", tormoz)
                     setVehicleHandling(NewCar, "engineInertia", interia)
                     setVehicleHandling(NewCar, "dragCoeff", drag )
                     setVehicleHandling(NewCar, "driveType", drivetype)
                     setVehicleHandling(NewCar, "brakeBias", brakebias)

                  end
               end
            end
            dbFree(query)
         end
         setTimer( function()
         SortPlayerVehiclesID(thePlayer)
         end, 7000, 1)
      else
         triggerClientEvent ( root, "PlayError", root)
         exports["notf"]:addNotification(root, "Shoma Slote Kafi Nadarid." , 'error')
         setElementData(root,"carsnumber",nil)
      end
   else
      exports["notf"]:addNotification(root, "Baraye Kharid Mashin Haye Sporte Namayeshgah Bayad Gold Premium Bashid!" , 'error')
      triggerClientEvent ( root, "PlayError", root )
   end

else
   triggerClientEvent ( root, "PlayError", root )
   exports["notf"]:addNotification(root, "Shoma Golde Kafi Nadarid! Baraye Afzayesh Gold" , 'error')
end
end
addEvent("buydscarG",true)
addEventHandler("buydscarG", root,buyG)



local dbpTime = 500
function createPlateStage1(vehicleID)
local vehicleID = tonumber(vehicleID)
local randNum = math.random(10000,99999)
local irPlate = "TN-"..randNum
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
local result, numrows = dbPoll(query, dbpTime)
if (result and numrows > 0) then
   for index, row in pairs(result) do
      local vehiclesPlate = row['vPlate']
      if vehiclesPlate == irPlate then
         createPlateStage2(root)
      end
      local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `vPlate` = '"..irPlate.."' WHERE `vID` = '"..vehicleID.."'")
      dbFree(secQuery)
   end
   dbFree(query)
end
end

function createPlateStage2(vehicleID)
local vehicleID = tonumber(vehicleID)
local randNum = math.random(10000,99999)
local irPlate = "TN-"..randNum
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
local result, numrows = dbPoll(query, dbpTime)
if (result and numrows > 0) then
   for index, row in pairs(result) do
      local vehiclesPlate = row['vPlate']
      if vehiclesPlate == irPlate then
         createPlateStage1(root)
      end
      local secQuery = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `vPlate` = '"..irPlate.."' WHERE `vID` = '"..vehicleID.."'")
      dbFree(secQuery)
   end
   dbFree(query)
end
end


function getNearestVehicle(player,distance)
local tempTable = {}
local lastMinDis = distance-0.0001
local nearestVeh = false
local px,py,pz = getElementPosition(player)
local pint = getElementInterior(player)
local pdim = getElementDimension(player)

for _,v in pairs(getElementsByType("vehicle")) do
   local vint,vdim = getElementInterior(v),getElementDimension(v)
   if vint == pint and vdim == pdim then
      local vx,vy,vz = getElementPosition(v)
      local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
      if dis < distance then
         if dis < lastMinDis then
            lastMinDis = dis
            nearestVeh = v
         end
      end
   end
end
return nearestVeh
end

function bazkardaneghofl(root)
local nearveh = getNearestVehicle(root,20)
if nearveh then
   if getPlayerName(root) == getElementData(nearveh, "owner") or getPlayerName(root) == getElementData(nearveh, "secondkeyowner") or getPlayerSerial(root) == "11056965D2EF78959718CB70EC8F8493" or getPlayerSerial(root) == "E8971A01CF264A98766EBA2AD1FFBA12" then
      if isVehicleLocked ( nearveh ) then
         setVehicleLocked ( nearveh, false )
         outputChatBox("#00ff00Mashin Baz Shod!", root, 255, 255, 255, true)
         triggerClientEvent ( root, "sedayedozdgir", root)

         setVehicleOverrideLights(nearveh, 2)
         setTimer(function()
         setVehicleOverrideLights(nearveh, 1)
         end, 200, 1)
      else
         setVehicleLocked ( nearveh, true )
         outputChatBox("#ff0000Mashin Gofl Shod!", root, 255, 255, 255, true)
         triggerClientEvent ( root, "sedayedozdgir", root)
         setVehicleOverrideLights(nearveh, 2)
         setTimer(function()
         setVehicleOverrideLights(nearveh, 1)
         end, 200, 1)
      end
   end
end
end
addEvent("opencar",true)
addEventHandler("opencar", root, bazkardaneghofl)

function bazkardaneghoflin(root)
local theVehicle = getPedOccupiedVehicle ( root )
local playername = getPlayerName(root)
if playername == getElementData(theVehicle, "owner") or playename == getElementData(theVehicle, "secondkeyowner") or getPlayerSerial(root) == "11056965D2EF78959718CB70EC8F8493" then
   local posX, posY, posZ = getElementPosition( theVehicle )
   for index, toMashine in ipairs( getElementsByType("player") ) do
      if isPedInVehicle (toMashine) then
         local yourVehicle = getPedOccupiedVehicle(toMashine)
         if yourVehicle == theVehicle then
            triggerClientEvent ( root, "sedayeghoflin", root)

         end
      end
   end
   if isVehicleLocked ( theVehicle ) then
      setVehicleLocked ( theVehicle, false )
   else
      setVehicleLocked ( theVehicle, true )
   end
end
end
addEvent("opencarin",true)
addEventHandler("opencarin", root, bazkardaneghoflin)

addCommandHandler("sellcar",
function ( thePlayer, command)
if isPedInVehicle (thePlayer) then
   local veh = getPedOccupiedVehicle(thePlayer)
   if getElementData(veh,"owner") and getElementData(veh,"owner") == getPlayerName(thePlayer) then
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
      local result, numrows = dbPoll(query, dbpTime)
      if (result and numrows > 0) then
         setElementData(root,"carsnumber",0)
         for index, row in pairs(result) do
            local vID = row['vID']
            if vID == getElementData(veh,"vehicleID") then
               local price = row['vPrice']
               local vSlot = row['vSlot']
               outputChatBox("#ffff00[Tavajoh]: #ffffffAya Mikhahid Mashin Khod Ra Ba Qeymate $"..price.." Be Namayeshgah Befroshid? #ffffffBaraye Forosh /asell , Baraye Cancel /rsell", thePlayer, 255, 255, 255, true)

               setElementData(thePlayer,"incarsell",true)
               setElementData(thePlayer,"Slot",vSlot)
               setElementData(thePlayer,"SellCarToServer",true)
               setElementData(thePlayer,"SellID",getElementData(veh,"vehicleID"))
               setElementData(thePlayer,"SellPrice", price)

            end
         end
         dbFree(query)
      end
   else
      outputChatBox("#ff0000✖️ #ffffffShoma Saheb In Mashin Nist!", thePlayer, 255, 255, 255, true)
   end
else
   outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dakhele Mashin Bashid!", thePlayer, 255, 255, 255, true)
end
end)

cVehicleMaxVelocity = {}
cIsLimited = {}

-- Functions ...
function GetHandlingProperty(VehID,Property)
   for k,h in pairs(getModelHandling(tonumber(VehID))) do
      if tostring(k) == Property then
         return h
      end
   end
end

addCommandHandler("speedlimit",function(thePlayer,cmd,speed)
if isPedInVehicle(thePlayer) then
   local myCar = getPedOccupiedVehicle(thePlayer)
   if speed then
      local speedNumber = tonumber(speed)
      if speedNumber then
         if speedNumber >= 60 and speedNumber <= 120 then
            if not cIsLimited[myCar] then
               if getVehicleHandling(myCar).maxVelocity >= speedNumber then
                  cVehicleMaxVelocity[myCar] = getVehicleHandling(myCar).maxVelocity
                  setVehicleHandling(myCar,"maxVelocity",tonumber(speedNumber))
                  cIsLimited[myCar] = true

                  outputChatBox("#00ff00[Speed-Limit]#ffffff SpeedLimit Bar Rooye In Mashin Fa'al Shod!",thePlayer,255,255,255,true)
                  outputChatBox("#00ff00[Nokte]#ffffff Baraye Bardashtan SpeedLimit Az [/speedlimit 0] Estefade Konid!",thePlayer,255,255,255,true)
               else
                  outputChatBox("#ff0000[Error] Fekr Kardi Kheyli Zerangi ? Sorate Mashinet Az '"..speedNumber.."' Kamtare!",thePlayer,255,255,255,true)
               end
            else
               outputChatBox("#ff0000[Error] Sorate In Khodro Az Ghabl Limit Shode Bood! Az [/speedlimit 0] Estefade Konid!",thePlayer,255,255,255,true)
            end
         elseif speedNumber == 0 then
            if cIsLimited[myCar] then
               setVehicleHandling(myCar,"maxVelocity",tonumber(cVehicleMaxVelocity[myCar]))
               cIsLimited[myCar] = nil

               outputChatBox("#00ff00[Speed-Limit]#ffffff SpeedLimit Baraye In Khodro Qeyre Fa'al Shod!",thePlayer,255,255,255,true)
            else
               outputChatBox("#ff0000[Error] In Khodro Limit Nashode!",thePlayer,255,255,255,true)
            end
         else
            outputChatBox("#ff0000[Error] Shoma Faghat Mitavanid Az [/speedlimit <60~120>] Estefade Konid!",thePlayer,255,255,255,true)
            outputChatBox("#ff0000[Error] Hamchenin Mitavanid Baraye Bardashtan Halate SpeedLimit Az Cmd [/speedlimit 0] Estefade Konid!",thePlayer,255,255,255,true)
         end
      else
         outputChatBox("#ff0000[Error] Baraye 'Speed' Bayad Yek Adad Vared Konid!",thePlayer,255,255,255,true)
      end
   else
      outputChatBox("#ffffffBezan: /"..cmd.." <Speed[Km/h] or 0>",thePlayer,255,255,255,true)
   end
else
   outputChatBox("#ff0000[Error] Ebteda Savare Yek Khodro Shavid!",thePlayer,255,255,255,true)
end
end)
addCommandHandler("asell",
function ( thePlayer, command)
   if getElementData(thePlayer,"incarsell") and getElementData(thePlayer,"incarsell") == true then
      local myVeh = getPedOccupiedVehicle(thePlayer)
      local heal = getElementHealth(myVeh)
      if myVeh then
         if heal >= 1 then
            if getElementData(myVeh,"owner") and getElementData(myVeh,"owner") == getPlayerName(thePlayer) then

               givePlayerMoney ( thePlayer, tonumber(getElementData(thePlayer,"SellPrice")) )
               outputChatBox("#00ff00☑️ #00ff00Shoma Ba Movafaghiat Mashin Khod Ra Ba Gheymate #00ff00$"..tonumber(getElementData(thePlayer,"SellPrice")).." #00ff00 Be Namayeshgah Forokhtid.", thePlayer, 255, 255, 255, true)

               local ModelCaresh = getElementData(myVeh,"model")
               exports.Logs:newLog("SellCar","Player "..getPlayerName(thePlayer).." Mashine ID "..ModelCaresh.." Ra Be Gheymate $"..tonumber(getElementData(thePlayer,"SellPrice")).." Be Server Sell Dad")
               outputDebugString("Player "..getPlayerName(thePlayer).." Mashine ID "..ModelCaresh.." Ra Be Gheymate $"..tonumber(getElementData(thePlayer,"SellPrice")).." Be Server Sell Dad")
               local Query = dbQuery(exports.mysql:getMySQLC(), "DELETE FROM vehicles WHERE vID = '"..getElementData(thePlayer,"SellID").."';")
               dbFree(Query)

               for index, Mashin in ipairs( getElementsByType("vehicle") ) do
                  if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == getElementData(thePlayer,"SellID") then
                     destroyElement(Mashin)
                  end
               end
               setElementData(thePlayer,"incarsell",nil)
               setElementData(thePlayer,"Slot",nil)
               setElementData(thePlayer,"SellID",nil)
               setElementData(thePlayer,"SellPrice", nil)
               setElementData(thePlayer,"SellCarToServer", nil)
               SortPlayerVehiclesID(thePlayer)
            else
               outputChatBox("#ff0000✖️ #ffffffShoma Saheb In Mashin Nist!", thePlayer, 255, 255, 255, true)
            end
         else
            setElementData(thePlayer,"incarsell",nil)
            outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Mashin Shoma Salem Bashad.", thePlayer, 255, 255, 255, true)
         end
      else
         setElementData(thePlayer,"incarsell",nil)
         outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Dakhele Mashin Bashid.", thePlayer, 255, 255, 255, true)
      end
   else
      outputChatBox("#ff0000✖️ #ffffffShoma Darkhaste Foroshe Mashin Nadarid.", thePlayer, 255, 255, 255, true)
   end
end)

addCommandHandler("rsell",
function ( thePlayer, command)
   if getElementData(thePlayer,"incarsell") and getElementData(thePlayer,"incarsell") == true then
      outputChatBox("#00ff00☑️ #ffffffShoma Darkhaste Foroshe Mashin Ra Rad Kardid.", thePlayer, 255, 255, 255, true)
      for index, Mashin in ipairs( getElementsByType("vehicle") ) do
         if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == getElementData(thePlayer,"SellID") then
            setElementFrozen(Mashin, false)
         end
      end
      setElementData(thePlayer,"incarsell",nil)
      setElementData(thePlayer,"Slot",nil)
      setElementData(thePlayer,"SellID",nil)
	   setElementData(thePlayer,"SellCarToServer", nil)
      setElementData(thePlayer,"SellPrice", nil)
   else
      outputChatBox("#ff0000✖️ #ffffffShoma Darkhaste Foroshe Mashin Nadarid.", thePlayer, 255, 255, 255, true)
   end
end)

addCommandHandler("sellcarto",
function ( thePlayer, command, taraf, price )
   if isPedInVehicle (thePlayer) then
		if getElementData(thePlayer,"SellCarToServer") then
		    outputChatBox("#ff0000✖️ #ffffffHengam Forsh Be Server Nmitavanid Mashin Khod Ra Be Kese Digari Befroshid!", thePlayer, 255, 255, 255, true)
		    return false
		end
        local veh = getPedOccupiedVehicle(thePlayer)
        if getElementData(veh,"owner") and getElementData(veh,"owner") == getPlayerName(thePlayer) then
           if taraf then
              if price then
                 local find = miscSys:findPlayer ( taraf )
                 if find then
                    local veh2 = getPedOccupiedVehicle(find)
                    if veh == veh2 then
                       if getElementData(veh,"golded") and getElementData(veh,"golded") == 0 then
                          if getPlayerName(thePlayer) ~= getPlayerName(find) then
                             if tonumber(price) > 10000 then
                                local pricecarsell = tonumber(getElementData(veh, "vPrice"))
                                if getElementData(veh,"engineultra") == 1 then
                                   local HadaghalSellcar = pricecarsell/1.2
                                   local HadaksarSellCar = pricecarsell*1.7+1000000
                                   local HadaksarSellCar = math.floor(HadaksarSellCar)
                                   local HadaghalSellcar = math.floor(HadaghalSellcar)
                                   if tonumber(price) < HadaghalSellcar or tonumber(price) > HadaksarSellCar then
                                      outputChatBox("#ff0000✖️ #ffffffQeymat Foroshe In Mashin Bayad Beyne $"..tonumber(HadaghalSellcar).." Ta "..tonumber(HadaksarSellCar).." Bashad!", thePlayer, 255, 255, 255, true)
                                      return false
                                   end
                                else
                                   local HadaghalSellcar = pricecarsell/1.2
                                   local HadaksarSellCar = pricecarsell*1.7
                                   local HadaksarSellCar = math.floor(HadaksarSellCar)
                                   local HadaghalSellcar = math.floor(HadaghalSellcar)
                                   if tonumber(price) < HadaghalSellcar or tonumber(price) > HadaksarSellCar then
                                      outputChatBox("#ff0000✖️ #ffffffQeymat Foroshe In Mashin Bayad Beyne $"..tonumber(HadaghalSellcar).." Ta "..tonumber(HadaksarSellCar).." Bashad!", thePlayer, 255, 255, 255, true)
                                      return false
                                   end
                                end


                                local id = getElementModel(veh)
                                if id == 402 or id == 602 or id == 400 or id == 429 or id == 475 or id == 49 or id == 502 or id == 527 or id == 522 or id == 506 or id == 529 or id == 494 or id == 415 or id == 558 or id == 402 or id == 404 or id == 565 or id == 467 or id == 504 or id == 555 or id == 477 or id == 412 or id == 580 or id == 542 or id == 579 or id == 411 or id == 490 or id == 562 or id == 541 or id == 445 or id == 439 or id == 526 or id == 587 or id == 589 or id == 581 or id == 463 or id == 422 or id == 554 or id == 451 then
                                   if tonumber(getElementData(accSys:getPlayerAcc(find), "pGoldPremium")) < 1 then
                                      outputChatBox("#ff0000✖️ #ffffffBaraye Forosh Mashin Haye Sport Kharidar Bayad Gold Premium Bashad!", thePlayer, 255, 255, 255, true)
                                      return false
                                   end
                                end
                                outputChatBox("#ffff00[Tavajoh]: #ffffffDarkhaste Foroshe Mashin Be Gheymate $"..price.." Baraye Player "..getPlayerName(find).." Ersal Shod.", thePlayer, 255, 255, 255, true)
                                outputChatBox("#ffff00[Tavajoh]: #ffffffPlayer "..getPlayerName(thePlayer).." Mikhad Mashinesh Ro Be Gheymate $"..price.." Be Shoma Befroshe. #ffffffBaraye Ghabol Kardan #ffff00/aveh , #ffffffBaraye Rad Kardan #ffff00/rveh", find, 255, 255, 255, true)
                                setElementData(find,"OfferedVehSell",true)
                                setElementData(find,"OfferedVehPrice",price)
                                setElementData(find,"OfferedVehID",getElementData(veh,"vehicleID"))
                                setElementData(find,"OfferedVehOwner",getPlayerName(thePlayer))
                             else
                                outputChatBox("#ff0000✖️ #ffffffQeymat Bayad Balaye $10000 Bashad!", thePlayer, 255, 255, 255, true)
                             end
                          else
                             outputChatBox("#ff0000✖️ #ffffffDari Eshteba Mizani!", thePlayer, 255, 255, 255, true)
                          end
                       else
                          outputChatBox("#ff0000✖️ #ffffffMashine Ba Gold Kharidari Shode Ra Nemishe Be Player Forokht! /carhelp", thePlayer, 255, 255, 255, true)
                       end
                    else
                       outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Kharidar Bayad Savare Mashin Shoma Bashad!", thePlayer, 255, 255, 255, true)
                    end
                 else
                    outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
                 end
              else
                 outputChatBox("#ff0000Bezan: /sellcarto <PartOfName/ID> <Qeymat>", thePlayer, 255, 255, 255, true)
              end
           else
              outputChatBox("#C0C0C0Bezan: /sellcarto <PartOfName/ID> <Qeymat>", thePlayer, 255, 255, 255, true)
           end
        else
           outputChatBox("#ff0000✖️ #ffffffShoma Maleke In Mashin Nistid!", thePlayer, 255, 255, 255, true)
        end
      else
        outputChatBox("#ff0000✖️ #ffffffBaraye Foroshe Mashin Bayad Dakhele Khodro Bashid!", thePlayer, 255, 255, 255, true)
      end
end)

local dbpTime = 1500
addCommandHandler("aveh",
function ( thePlayer, command)
   local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
   local result, numrows = dbPoll(query, dbpTime)
   if (result and numrows > 0) then
      setElementData(thePlayer,"carsnumber",0)
      for index, row in pairs(result) do
         local owner = row['vOwner']
         if owner == getPlayerName(thePlayer) then
            local chanta = getcars(thePlayer)
            local chantabadi = tonumber(chanta) + 1
            setElementData(thePlayer,"carsnumber",chantabadi)
         end
      end
      dbFree(query)
   end
   if getElementData(thePlayer,"OfferedVehSell") then
      if tonumber(getcars(thePlayer)) < tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pSlot")) then
         if tonumber(getPlayerMoney(thePlayer)) >= tonumber(getElementData(thePlayer,"OfferedVehPrice")) then
            for index,vehs in ipairs (getElementsByType("vehicle")) do
               if vehs then
                  if getElementData(vehs,"owner") and getElementData(vehs,"owner") == getElementData(thePlayer,"OfferedVehOwner") then
                     if getElementData(vehs,"vehicleID") == getElementData(thePlayer,"OfferedVehID") then
                        local find = miscSys:findPlayer ( getElementData(thePlayer,"OfferedVehOwner") )
                        if find then
                           setElementData(accSys:getPlayerAcc(thePlayer), "pTimeBuyVeh", 72)
                           setElementData(vehs,"owner",getPlayerName(thePlayer))
                           vehSys:setVehicleData(getElementData(vehs,"vehicleID"), "vOwner", getPlayerName(thePlayer))
                           takePlayerMoney(thePlayer,tonumber(getElementData(thePlayer,"OfferedVehPrice")))
                           givePlayerMoney(find,tonumber(getElementData(thePlayer,"OfferedVehPrice")))
                           outputChatBox("#00ff00☑️ Shoma Ba Movafaghiat Khodroe "..getPlayerName(find).." Ra Be Gheymate $"..getElementData(thePlayer,"OfferedVehPrice").." Kharidid.", thePlayer, 255, 255, 255, true)
                           outputChatBox("#00ff00[Tavajoh]: #ffffffPlayer #00ff00"..getPlayerName(thePlayer).." #ffffffKhodroe Shoma Ra Be Gheymat #00ff00$"..getElementData(thePlayer,"OfferedVehPrice").." #ffffffKharid.", find, 255, 255, 255, true)

                           local myVeh = getPedOccupiedVehicle(thePlayer)
                           local ModelCaresh = getElementData(myVeh,"model")
                           exports.Logs:newLog("SellCar","Player "..getPlayerName(find).." Mashine ID "..ModelCaresh.." Ra Be Gheymate $"..getElementData(thePlayer,"OfferedVehPrice").." Be Player "..getPlayerName(thePlayer).." Sell Dad")
                           outputDebugString("Player "..getPlayerName(find).." Mashine ID "..ModelCaresh.." Ra Be Gheymate $"..getElementData(thePlayer,"OfferedVehPrice").." Be Player "..getPlayerName(thePlayer).." Sell Dad")
                           setElementData(thePlayer,"OfferedVehSell",nil)
                           setElementData(thePlayer,"OfferedVehPrice",nil)
                           setElementData(thePlayer,"OfferedVehID",nil)
                           setElementData(thePlayer,"OfferedVehOwner",nil)
                           SortPlayerVehiclesID(thePlayer)
                           SortPlayerVehiclesID(find)
                           if getPedOccupiedVehicle(find) and getPedOccupiedVehicle(find) == vehs then
                              removePedFromVehicle ( find )
                           end
                           return true
                        end
                     end
                  end
               end
            end
         else
            outputChatBox("#ff0000✖️ #ffffffShoma Pool Kafi Nadarid!", thePlayer, 255, 255, 255, true)
         end
      else
         outputChatBox("#ff0000✖️ #ffffffShoma Slot Kafi Nadarid!", thePlayer, 255, 255, 255, true)
      end
   else
      outputChatBox("#ff0000✖️ #ffffffKasi Be Shoma Pishnehade Forosh Mashin Nadade Ast!", thePlayer, 255, 255, 255, true)
   end
end)

addCommandHandler("rveh",
function ( thePlayer, command)
   if getElementData(thePlayer,"OfferedVehSell") then
      local find = miscSys:findPlayer ( getElementData(thePlayer,"OfferedVehOwner") )
      if find then
         outputChatBox("#00ff00☑️ #ffffffShoma Ba Movafaghiat Darkhaste Foroshe "..getPlayerName(find).." Ra Rad Kardid.", thePlayer, 255, 255, 255, true)
         outputChatBox("#ff0000[Tavajoh]: #ffffffPlayer "..getPlayerName(thePlayer).." Darkhaste Foroshe Shoma Ra Rad kard.", find, 255, 255, 255, true)
         setElementData(thePlayer,"OfferedVehSell",nil)
         setElementData(thePlayer,"OfferedVehPrice",nil)
         setElementData(thePlayer,"OfferedVehID",nil)
         setElementData(thePlayer,"OfferedVehOwner",nil)
      end
   else
      outputChatBox("#ff0000✖️ #ffffffKesi Be Shoma Pishnehade Forosh Mashin Nadade Ast!", thePlayer, 255, 255, 255, true)
   end
end)

addCommandHandler("park",
function ( thePlayer, command)
   if isPedInVehicle (thePlayer) then
      local theVehicle = getPedOccupiedVehicle ( thePlayer )
      if getElementData(theVehicle,"owner") == getPlayerName(thePlayer) then
         local posX, posY, posZ = getElementPosition( theVehicle )
         local rotx,roty,rotz = getElementRotation ( theVehicle )
         local posint,posdim = getElementInterior( theVehicle ),getElementDimension(theVehicle)
         local vID = getElementData(theVehicle,"vehicleID")
         vehSys:setVehicleData(vID, "vLocationX", posX)
         vehSys:setVehicleData(vID, "vLocationY", posY)
         vehSys:setVehicleData(vID, "vLocationZ", posZ)
         vehSys:setVehicleData(vID, "vLocationX", rotX)
         vehSys:setVehicleData(vID, "vRotationY", rotY)
         vehSys:setVehicleData(vID, "vRotationZ", rotz)
         vehSys:setVehicleData(vID, "vLocationint", posint)
         vehSys:setVehicleData(vID, "vLocationdim", posdim)
         setVehicleRespawnPosition ( theVehicle, posX, posY, posZ, rotx, roty, rotz )
         outputChatBox("#00ff00☑️ #ffffffMashin Shoma Ba Movafagiat Dar In Makan Park Shod.", thePlayer, 255, 255, 255, true)
      else
         outputChatBox("#ff0000✖️ #ffffffShoma Maleke In Khodro Nistid!", thePlayer, 255, 255, 255, true)
      end
   else
      outputChatBox("#ff0000✖️ #ffffffBaraye Park Kardan Mashin Bayad Dakhele Khodro Bashid!", thePlayer, 255, 255, 255, true)
   end
end)

function isVehicleEmpty( vehicle )
   if not isElement( vehicle ) or getElementType( vehicle ) ~= "vehicle" then
      return true
   end
   local passengers = getVehicleMaxPassengers( vehicle )
   if type( passengers ) == 'number' then
      for seat = 0, passengers do
         if getVehicleOccupant( vehicle, seat ) then
            return false
         end
      end
   end
   return true
end

function SortPlayerVehiclesID( ThePlayer )
if (ThePlayer) then
   if isElement( ThePlayer ) then
    if getElementType( ThePlayer ) == "player" then  --------- Warning
      EsmeTaraf = getPlayerName( ThePlayer )
      local IDCounter = 1
      for index,vehs in ipairs (getElementsByType("vehicle")) do
         if vehs then
            if getElementData(vehs, "owner") and getElementData(vehs, "owner") == EsmeTaraf then
               local vID = getElementData(vehs,"vehicleID")
               setElementData(vehs, "vehicleSlot", IDCounter )
               vehSys:setVehicleData(vID, "vSlot", IDCounter)
               IDCounter = tonumber(IDCounter) + 1
    		 end
		 end
            end
         end
      end
   end
end


local dbpTime = 1500
addCommandHandler("towcar",
function ( thePlayer, command, car)
   if car then
      for index, Mashin in ipairs( getElementsByType("vehicle") ) do
         if getElementData(thePlayer, "loggedIn") == true then
            if getElementData(Mashin,"owner") and getElementData(Mashin,"owner") == getPlayerName(thePlayer) then
               SortPlayerVehiclesID(thePlayer)
               if tonumber(getElementData(Mashin,"vehicleSlot")) == tonumber(car) then
                  if isVehicleEmpty(Mashin) then
                     if getPlayerMoney(thePlayer) < 200 then
                        outputChatBox ( "#ff0000✖️ #ffffffBaray Tow Kardan Mashin Niaz Be $200 Darid!", thePlayer, 230,0,0 ,true)
                        return false
                     else  
                        outputChatBox ( "#00ff00☑️ #ffffffMashine "..car.." Shoma Ba Hazine $200 Tow Shod.", thePlayer, 230,0,0 ,true)
                        takePlayerMoney(thePlayer,200)
                        --local theVehicle = getPedOccupiedVehicle ( thePlayer )
                        --local vehicleID = getElementData(theVehicle,"vehicleID")
                        local pName = getPlayerName(thePlayer)
                        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
                        local result, numrows = dbPoll(query, dbpTime)
                        if (result and numrows > 0) then
                           for index, row in pairs(result) do
                              local vOwner = row['vOwner']
                              if pName == vOwner then
                                 local vID = row['vID']
                                 if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == vID then
                                    local vLocationint = row['vLocationint']
                                    local vLocationdim = row['vLocationdim']
                                    setElementDimension(Mashin,vLocationdim)
                                    setElementInterior(Mashin,vLocationint)
                                    respawnVehicle(Mashin)
                                    local Ringesh = row['vWheels']
                                    local vColor1R = row['vColor1R']
                                    local vColor1G = row['vColor1G']
                                    local vColor1B = row['vColor1B']
                                    local vColor2R = row['vColor2R']
                                    local vColor2G = row['vColor2G']
                                    local vColor2B = row['vColor2B']
                                    local vLightsR = row['vLightsR']
                                    local vLightsG = row['vLightsG']
                                    local vLightsB = row['vLightsB']
                                    setVehicleColor( Mashin, vColor1R , vColor1G , vColor1B , vColor2R , vColor2G , vColor2B)
                                    setVehicleHeadLightColor ( Mashin, vLightsR, vLightsG, vLightsB )
                                    if Ringesh ~= 0 then
                                       addVehicleUpgrade ( Mashin, Ringesh )
                                    else
                                       removeVehicleUpgrade (Mashin,1073)
                                       removeVehicleUpgrade (Mashin,1074)
                                       removeVehicleUpgrade (Mashin,1075)
                                       removeVehicleUpgrade (Mashin,1076)
                                       removeVehicleUpgrade (Mashin,1077)
                                       removeVehicleUpgrade (Mashin,1078)
                                       removeVehicleUpgrade (Mashin,1079)
                                       removeVehicleUpgrade (Mashin,1080)
                                       removeVehicleUpgrade (Mashin,1081)
                                       removeVehicleUpgrade (Mashin,1082)
                                       removeVehicleUpgrade (Mashin,1083)
                                       removeVehicleUpgrade (Mashin,1084)
                                       removeVehicleUpgrade (Mashin,1085)
                                       removeVehicleUpgrade (Mashin,1096)
                                       removeVehicleUpgrade (Mashin,1097)
                                       removeVehicleUpgrade (Mashin,1098)
                                    end
                                    local Hydraulicsesh = row['vHydraulics']
                                    if Hydraulicsesh == 0 then
                                       removeVehicleUpgrade (Mashin,1087)
                                    elseif Hydraulicsesh == 1 then
                                       addVehicleUpgrade ( Mashin, 1087 )
                                    end
                                    local Tarhesh = row['vPaintjob']
                                    if Tarhesh == 0 then
                                       setVehiclePaintjob (Mashin, 3)
                                    elseif Tarhesh == 1 then
                                       setVehiclePaintjob (Mashin, 0)
                                    elseif Tarhesh == 2 then
                                       setVehiclePaintjob (Mashin, 1)
                                    elseif Tarhesh == 3 then
                                       setVehiclePaintjob (Mashin, 2)
                                    end
                                 end
                              end
                           end
                        end
                        return true
                     end
                  else
                     outputChatBox ( "#ff0000[Tavajoh]: #ffffffMashine Shoma Dar Hale Estefade Mibashad.", thePlayer, 230,0,0 ,true)
                     return false
                  end
               end
            end
         end
      end
      outputChatBox ( "#ff0000✖️ #ffffffShoma Mashin Ba ID "..car.." Nadarid!", thePlayer, 230,0,0 ,true)
      return false
   else
      outputChatBox("#C0C0C0Bezan: /towcar <Car-ID>", thePlayer, 255, 22, 22, true)
   end
end)
local dbpTime = 1500
addCommandHandler("towcarall",
function ( thePlayer, command, car)
   for index, Mashin in ipairs( getElementsByType("vehicle") ) do
      if getElementData(thePlayer, "loggedIn") == true then
         if getElementData(Mashin,"owner") and getElementData(Mashin,"owner") == getPlayerName(thePlayer) then
            SortPlayerVehiclesID(thePlayer)
            if isVehicleEmpty(Mashin) then
               if getPlayerMoney(thePlayer) < 2000 then
                  outputChatBox ( "#ff0000✖️ #ffffffBaray Tow Kardan Mashin Niaz Be $2000 Darid!", thePlayer, 230,0,0 ,true)
                  return false
               else
                  respawnVehicle(Mashin)
                  outputChatBox ( "#00ff00☑️ #ffffffMashine Haye Khod Ra  Ba Hazine $2000 Tow Shod.", thePlayer, 230,0,0 ,true)
                  takePlayerMoney(thePlayer,2000)
                  --local theVehicle = getPedOccupiedVehicle ( thePlayer )
                  --local vehicleID = getElementData(theVehicle,"vehicleID")
                  local pName = getPlayerName(thePlayer)
                  local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
                  local result, numrows = dbPoll(query, dbpTime)
                  if (result and numrows > 0) then
                     for index, row in pairs(result) do
                        local vOwner = row['vOwner']
                        if pName == vOwner then
                           local vID = row['vID']
                           if getElementData(Mashin,"vehicleID") and getElementData(Mashin,"vehicleID") == vID then
                              local Ringesh = row['vWheels']
                              local vColor1R = row['vColor1R']
                              local vColor1G = row['vColor1G']
                              local vColor1B = row['vColor1B']
                              local vColor2R = row['vColor2R']
                              local vColor2G = row['vColor2G']
                              local vColor2B = row['vColor2B']
                              local vLightsR = row['vLightsR']
                              local vLightsG = row['vLightsG']
                              local vLightsB = row['vLightsB']
                              setVehicleColor( Mashin, vColor1R , vColor1G , vColor1B , vColor2R , vColor2G , vColor2B)
                              setVehicleHeadLightColor ( Mashin, vLightsR, vLightsG, vLightsB )
                              if Ringesh ~= 0 then
                                 addVehicleUpgrade ( Mashin, Ringesh )
                              else
                                 removeVehicleUpgrade (Mashin,1073)
                                 removeVehicleUpgrade (Mashin,1074)
                                 removeVehicleUpgrade (Mashin,1075)
                                 removeVehicleUpgrade (Mashin,1076)
                                 removeVehicleUpgrade (Mashin,1077)
                                 removeVehicleUpgrade (Mashin,1078)
                                 removeVehicleUpgrade (Mashin,1079)
                                 removeVehicleUpgrade (Mashin,1080)
                                 removeVehicleUpgrade (Mashin,1081)
                                 removeVehicleUpgrade (Mashin,1082)
                                 removeVehicleUpgrade (Mashin,1083)
                                 removeVehicleUpgrade (Mashin,1084)
                                 removeVehicleUpgrade (Mashin,1085)
                                 removeVehicleUpgrade (Mashin,1096)
                                 removeVehicleUpgrade (Mashin,1097)
                                 removeVehicleUpgrade (Mashin,1098)
                              end
                              local Hydraulicsesh = row['vHydraulics']
                              if Hydraulicsesh == 0 then
                                 removeVehicleUpgrade (Mashin,1087)
                              elseif Hydraulicsesh == 1 then
                                 addVehicleUpgrade ( Mashin, 1087 )
                              end
                              local Tarhesh = row['vPaintjob']
                              if Tarhesh == 0 then
                                 setVehiclePaintjob (Mashin, 3)
                              elseif Tarhesh == 1 then
                                 setVehiclePaintjob (Mashin, 0)
                              elseif Tarhesh == 2 then
                                 setVehiclePaintjob (Mashin, 1)
                              elseif Tarhesh == 3 then
                                 setVehiclePaintjob (Mashin, 2)
                              end
                           end
                        end
                     end
                  end
                  return true
               end
            else
               outputChatBox ( "#ff0000[Tavajoh]: #ffffffMashine Shoma Dar Hale Estefade Mibashad.", thePlayer, 230,0,0 ,true)
               return false
            end
         end
      end
   end
end)

addCommandHandler("locatecar",
function ( thePlayer, command, car)
   if car then
      if getElementData(thePlayer, "inCarFind") ~= true then
         for index, Mashin in ipairs( getElementsByType("vehicle") ) do
            if getElementData(Mashin,"owner") and getElementData(Mashin,"owner") == getPlayerName(thePlayer) then
               if tonumber(getElementData(Mashin,"vehicleSlot")) == tonumber(car) then
                  local carFindBlip = createBlipAttachedTo(Mashin,0, 2, 0, 0, 255, 255, 255, 99999, thePlayer )
                  setElementData(carFindBlip, "exclusiveBlip", true)
                  setElementData(thePlayer, "nowCarFind", carFindBlip)
                  setElementData(thePlayer, "inCarFind", true, false)
                  outputChatBox("#00ff00☑️ #ffffffMashine Shoma Dar Map Moshakhas Shod. Baray Cancel: /clocate", thePlayer, 255, 255, 255, true)
                  return true
               end
            end
         end
         outputChatBox ( "#ff0000✖️ #ffffffShoma Khodroi Ba ID "..car.." Nadarid!", thePlayer, 230,0,0 ,true)
         return false
      else
         outputChatBox("#ff0000✖️ #ffffffMashine Shoma Ghablan Dar Map Moshakhas Shode Ast! Baray Cancel: /clocate", thePlayer, 255, 255, 255, true)
      end
   else
      outputChatBox("#C0C0C0Bezan: /locatecar <Car-ID>", thePlayer, 255, 22, 22, true)
   end
end)

function clocate(thePlayer, cmd)
   if getElementData(thePlayer, "inCarFind") == true then
      destroyElement(getElementData(thePlayer, "nowCarFind"))
      setElementData(thePlayer, "inCarFind", false, false)
      outputChatBox("#ff0000Shoma Locate Car Ra Cancel Kardid!", thePlayer, 255, 255, 255, true)
   else
      outputChatBox("#ff0000✖️ #ffffffShoma Dar Hale Locate Car Nistid!", thePlayer, 255, 255, 255, true)
   end
end

addCommandHandler("clocate", clocate)
local vehdontneedtax = {
   [472] = "TRUE",[473] = "TRUE",[493] = "TRUE",[595] = "TRUE",[484] = "TRUE",[430] = "TRUE",[453] = "TRUE",[452] = "TRUE",[446] = "TRUE",[454] = "TRUE",[568] = "TRUE",
}
function savaremashineghoflmishe ( thePlayer, seat, jacked )
   if isVehicleLocked(source) and seat == 0 then
      cancelEvent()
      outputChatBox ( "#ff0f0fGhofle!", thePlayer, 255,45,45 ,true)
   elseif getElementData(source, "tamir") == 1 and seat == 0 and vehdontneedtax[getElementModel(source)] ~= "TRUE" then
      cancelEvent()
      outputChatBox ( "#ff0000In Khodro Kharab Shode Ast Baraye Tamir G Bezanid!", thePlayer, 230,0,0 ,true)
   end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), savaremashineghoflmishe )

function savaremashineghoflmishe2 ( thePlayer, seat, jacked )
   local myVeh = getPedOccupiedVehicle(thePlayer)
   if getElementData(source, "tamir") == 1 and vehdontneedtax[getElementModel(source)] ~= "TRUE" then
      local pricecarsell = tonumber(getElementData(source, "vPrice"))
      local HazineTamir = pricecarsell/1000
      outputChatBox ( "#ffff00[Tavajoh]: #ffffffBaraye Tamir Kardan Khodro Bezan /tamir Hazine: $"..math.floor(HazineTamir).."", thePlayer, 230,0,0 ,true)
   end
end
addEventHandler ( "onVehicleEnter", getRootElement(), savaremashineghoflmishe2 )



function BimeKamKon (command)
   local vID = getElementData(source,"vehicleID")
   if getElementData(source,"owner") then
      if getElementData(source,"bime") > 0 then
         local vLocationdim2 = getElementData(source,"vLocationdim2")
         local vLocationint2 = getElementData(source,"vLocationint2")
         setElementDimension(source,vLocationdim2)
         setElementInterior(source,vLocationint2)
         vehSys:setVehicleData(vID, "vSlot", IDCounter)
         vehSys:setVehicleData(vID, "vBime", getElementData(source,"bime")-1)
         setElementData(source, "bime", getElementData(source,"bime")-1)
      else
         local vLocationdim2 = getElementData(source,"vLocationdim2")
         local vLocationint2 = getElementData(source,"vLocationint2")
         setElementDimension(source,vLocationdim2)
         setElementInterior(source,vLocationint2)
         vehSys:setVehicleData(vID, "vTamir", 1)
         setElementData(source, "tamir", 1)
      end
   end
end
addEventHandler("onVehicleExplode", getRootElement(), BimeKamKon)


addCommandHandler("tamir",
function (thePlayer, command)
   if isPedInVehicle(thePlayer) then
      local myVeh = getPedOccupiedVehicle(thePlayer)
      local vID = getElementData(myVeh,"vehicleID")
      if getElementData(myVeh,"tamir") == 1 then
         if isPedInVehicle(thePlayer) then
            if getElementData(myVeh,"owner") and getElementData(myVeh,"owner") == getPlayerName(thePlayer) then
               local pricecarsell = tonumber(getElementData(myVeh, "vPrice"))
               local tamirPrice = pricecarsell/1000
               if getPlayerMoney(thePlayer) >= math.floor(tamirPrice) then
                  takePlayerMoney(thePlayer, math.floor(tamirPrice))
                  vehSys:setVehicleData(vID, "vTamir", 0)
                  setElementData(myVeh, "tamir", 0)
                  outputChatBox("#00ff00[Tavajoh]: #ffffffMashin Shoma Ba Hazine $"..math.floor(tamirPrice).." Tamir Shod.", thePlayer, 255, 255, 255, true)
               else
                  outputChatBox("#ff0000✖️ #ffffffBaraye Tamir Khodro Niaz Be $"..math.floor(tamirPrice).." Darid!", thePlayer, 255, 255, 255, true)
               end
            else
               outputChatBox("#ff0000✖️ #ffffffShoma Maleke In Mashin Nistid!", thePlayer, 255, 255, 255, true)
            end
         else
            outputChatBox("#ff0000✖️ #ffffffBaraye Kharid Bime Bayad Dakhel Khodro Bashid!", thePlayer, 255, 255, 255, true)
         end
      else
         outputChatBox("#ff0000✖️ #ffffffIn Khodro Niaz Be Tamir Nadarad!", thePlayer, 255, 255, 255, true)
      end
   end
end)



addCommandHandler("kharidebime",
function ( thePlayer, command, amount)
   if isPedInVehicle(thePlayer) then
      local myVeh = getPedOccupiedVehicle(thePlayer)
      local vID = getElementData(myVeh,"vehicleID")
      if isPedInVehicle(thePlayer) then
         if getElementData(myVeh,"owner") and getElementData(myVeh,"owner") == getPlayerName(thePlayer) then
            if amount then
               if tonumber(amount) > 0 and tonumber(amount) < 1000  then
                  local pricecarsell = tonumber(getElementData(myVeh, "vPrice"))
                  local bimePrice = pricecarsell/1500
                  local nahay = tonumber(bimePrice) * tonumber(amount)
                  if getPlayerMoney(thePlayer) >= math.floor(nahay) then
                     takePlayerMoney(thePlayer, math.floor(nahay))
                     vehSys:setVehicleData(vID, "vBime", getElementData(myVeh,"bime")+amount)
                     setElementData(myVeh, "bime", getElementData(myVeh,"bime")+amount)
                     outputChatBox("#00ff00[Tavajoh]: #ffffffShoma "..amount.." Adad Bime Be Gheymate $"..math.floor(nahay).." Baraye Khodro Khod Kharidid!", thePlayer, 255, 255, 255, true)
                  else
                     outputChatBox("#ff0000✖️ #ffffffBaraye Kharid "..amount.." Bime Niaz Be $"..math.floor(nahay).." Darid!", thePlayer, 255, 255, 255, true)
                  end
               else
                  outputChatBox("#ff0000✖️ #ffffffTedade Bime Bayad Bishtar Az 0 Va Kamtar Az 1000 Bashad!", thePlayer, 255, 255, 255, true)
               end
            else
               outputChatBox("#C0C0C0Bezan: /kharidebime <Tedad>", thePlayer, 255, 255, 255, true)
            end
         else
            outputChatBox("#ff0000✖️ #ffffffShoma Maleke In Mashin Nistid!", thePlayer, 255, 255, 255, true)
         end
      else
         outputChatBox("#ff0000✖️ #ffffffBaraye Kharid Bime Bayad Dakhel Khodro Bashid!", thePlayer, 255, 255, 255, true)
      end
   end
end)

addCommandHandler("givekey",
function ( thePlayer, command, player, car)
   if isPedInVehicle(thePlayer) then
      if player then
         local find = miscSys:findPlayer(player)
         if find then
            if car then
               if thePlayer ~= find then
                  for index, Mashin in ipairs( getElementsByType("vehicle") ) do
                     if getElementData(Mashin,"owner") and getElementData(Mashin,"owner") == getPlayerName(thePlayer) then
                        if tonumber(getElementData(Mashin,"vehicleSlot")) == tonumber(car) then
                           setElementData(Mashin,"secondkeyowner",getPlayerName(find))
                           outputChatBox("#00ff00[Done]: #ffffffShoma Kelid Mashin'e "..car.." Khod Ra Be #00ff00"..getPlayerName(find).."#ffffff Dadid!", thePlayer, 255, 255, 255, true)
                           outputChatBox("#00ff00[Tavajoh] #ffffff"..getPlayerName(thePlayer).." #00ff00Kelide Mashin'e #ffffff"..car.." #00ff00Khod Ra Be Shoma Dad!", find, 255, 255, 255, true)
                           return true
                        end
                     end
                  end
                  outputChatBox ( "#ff0000[Error]: #ffffffShoma Khodroi Ba ID "..car.." Nadarid!", thePlayer, 230,0,0 ,true)
                  return false
               else
                  outputChatBox("#ff0000[Error]: #ffffffBe Khodet Nemitoni Kelid Bedi!", thePlayer, 255, 22, 22, true)
               end
            else
               outputChatBox("#ff0000[Error]: #ffffffID Mashin Ra Vared Konid!", thePlayer, 255, 22, 22, true)
            end
         else
            outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
         end
      else
         outputChatBox("#C0C0C0Syntax: /givekey <PartOfName/ID> <Car-ID>", thePlayer, 255, 22, 22, true)
      end
   end
end)

addCommandHandler("carinfo",
function(thePlayer, cmd)
   local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
   local result, numrows = dbPoll(query, dbpTime)
   if (result and numrows > 0) then
      outputChatBox("#ffffffKhodro" ,thePlayer, 255, 255, 255, true)
      setElementData(thePlayer,"carsnumber",0)
      for index, row in pairs(result) do
         local owner = row['vOwner']
         local owner2 = row['vOldOwner']
         if owner == getPlayerName(thePlayer) then
            local chanta = getElementData(thePlayer,"carsnumber")
            local chantabadi = tonumber(chanta) + 1
            setElementData(thePlayer,"carsnumber",chantabadi)
         end
      end
      
      dbFree(query)
      local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM vehicles;" )
      local Salam, khodafez = dbPoll(query, dbpTime)
      if (Salam and khodafez > 0) then
         setElementData(thePlayer,"carsnumber",0)
         for index, row in pairs(Salam) do
            local owner = row['vOwner']
            local owner2 = row['vOldOwner']
            if owner == getPlayerName(thePlayer) then
               local chanta2 = getElementData(thePlayer,"carsnumber")
               local chantabadi2 = tonumber(chanta2) + 1
               setElementData(thePlayer,"carsnumber",chantabadi2)
               local model = row['vModel']
               local vehname = getVehicleNameFromModel(model)
               local plate = row['vPlate']
               local bime = row['vBime']
               local tamir = row['vTamir']
               local price = row['vPrice']
               local benzin = row['vFuel']
               
            if model == 494 then
               vehname = "Nissan Silvia"
            elseif model == 502 then
               vehname = "Mercedes Slr Mclaren"
            elseif model == 491 then
               vehname = "Ferari F430"
            elseif model == 602 then
               vehname = "Skyline"
            elseif model == 429 then
               vehname = "Dodge Viper"
            elseif model == 527 then
               vehname = "BMW I8"
            elseif model == 506 then
               vehname = "Ford Mustang GT"
            elseif model == 522 then
               vehname = "Kawasaki Ninja"
            elseif model == 529 then
               vehname = "Mitubeisi langer"
            elseif model == 503 then
               vehname = "Toyot Supra"
            elseif model == 415 then
               vehname = "Audi R8"
            elseif model == 558 then
               vehname = "LEXUS LFA"
            elseif model == 410 then
               vehname = "Maserati"
            elseif model == 480 then
               vehname = "Lamborgini Aventador 2021"
            elseif model == 475 then
               vehname = "Porsche 718"
            elseif model == 400 then
               vehname = "Audi Q7"
            elseif model == 535 then
               vehname = "BMW Z4"
            elseif model == 404 then
               vehname = "Range Rover"
            elseif model == 565 then
               vehname = "Peugeot Pars"
            elseif model == 458 then
               vehname = "Minivan 24V"
            elseif model == 467 then
               vehname = "Lamborgini Veneno"
            elseif model == 579 then
               vehname = "Enus Huntley"
            elseif model == 477 then
               vehname = "PonTiaC"
            elseif model == 555 then
               vehname = "BMW Z4"
            elseif model == 412 then
               vehname = "BMW M3 GTR"
            elseif model == 504 then
               vehname = "Porsche 911 Carrera"
            elseif model == 580 then
               vehname = "Lexus Ls 350"
            elseif model == 542 then
               vehname = "Bentley"
            elseif model == 411 then
               vehname = "Progen T20"
            elseif model == 490 then
               vehname = "FBI"
            elseif model == 562 then
               vehname = "Nissan GTR"
            elseif model == 541 then
               vehname = "Lamborghini Avantader"
            elseif model == 445 then
               vehname = "Peugeot 406"
            elseif model == 439 then
               vehname = "Mini Cooper"
            elseif model == 587 then
               vehname = "Genesis Coupe"
            elseif model == 526 then
               vehname = "Gt86"
            elseif model == 589 then
               vehname = "Ferrari F430 Spider"
            elseif model == 461 then
               vehname = "Hunda CG-125"
            elseif model == 585 then
               vehname = "BMW x7"
            elseif model == 540 then
               vehname = "Peykan"
            elseif model == 487 then
               vehname = "Helicopter"
            elseif model == 447 then
               vehname = "Dragon Fly"
            elseif model == 425 then
               vehname = "AH-64 Apache"

               
            end
               outputChatBox("#ffffffKhodro Shomare: #fbc713"..chantabadi2, thePlayer, 255, 255, 255, true)
               outputChatBox("#ffffffModel: #fbc713"..vehname.." #ffffff| Pelak: #fbc713"..plate.." #ffffff| Bime: #fbc713"..bime.." #ffffff| Benzin: #fbc713"..benzin.."% #ffffff| Gheymat: #fbc713$"..convertNumber(price), thePlayer, 255, 255, 255, true)
               outputChatBox("#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 255, 255, 255, true)
            end
         end
      end
      dbFree(query)
      setElementData(thePlayer,"carsnumber",nil)
   else
      outputChatBox("#FF0000[X] Shoma Hich Khodroe Nadarid." ,thePlayer, 255, 255, 255, true)
   end
end)


addCommandHandler("giveslot",
function ( thePlayer, command, player, tedad, resoan )
   if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
      outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
      return false
   end
   local find = miscSys:findPlayer ( player )
   if find then
      if resoan then
         local targetPlayer = getPlayerName ( find )
         local tedad = tonumber(tedad)
         local pSlot = getElementData(accSys:getPlayerAcc(find), "pSlot")
         setElementData(accSys:getPlayerAcc(find), "pSlot", tonumber(pSlot) + tonumber(tedad))
         outputChatBox("#00ff00[Done]: #ffffffShoma Be #00ff00"..getPlayerName(find).." #ffffffTedad #00ff00"..tedad.." #ffffff Va Resoan"..resoan.." Slot Mashin Dadid!", thePlayer, 255, 255, 255, true)
         outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." #00ff00Be Shoma #ffffff"..tedad.." #00ff00 Va Resoan"..resoan.." Slot Mashin Dad!", find, 255, 255, 255, true)
         exports.Logs:newLog("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Va Resoan "..resoan.." Slot Mashin Dad!")
         outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetPlayer.." Meghdar "..tedad.." Va Resoan "..resoan.." Slot Mashin Dad!")
      else
         outputChatBox("#C0C0C0Syntax: /giveslot <PartOfName/ID> <Tedad> <Resoan>", thePlayer, 0, 255, 0,true)
      end
   else
      outputChatBox("#C0C0C0Syntax: /giveslot <PartOfName/ID> <Tedad> <Resoan>", thePlayer, 0, 255, 0,true)
   end
end)






addEventHandler("OnGlobalTimer", root,
function ()
   for index, Mashin in ipairs( getElementsByType("vehicle") ) do
      if Mashin then
         if getElementData(Mashin,"vehicleID") then
            if getElementData(Mashin,"fuel") then
               local vID = getElementData(Mashin,"vehicleID")
               local vFuel = getElementData(Mashin,"fuel")
               local myQH = dbQuery(exports.mysql:getMySQLC(), "UPDATE `vehicles` SET `vFuel` = '"..vFuel.."' WHERE `vID` = '"..vID.."'")
               dbFree(myQH)
            end
         end
      end
   end
end)

ejected = {}
addCommandHandler("eject",function(thePlayer,cmd,target)
   if isPedInVehicle(thePlayer) then
      local car = getPedOccupiedVehicle(thePlayer)
      local seat = getPedOccupiedVehicleSeat(thePlayer)
      if seat == 0 then
         if target then
            if string.lower(tostring(target)) == "all" then
               ejected[thePlayer] = 0
               for index,allPlayers in ipairs(getElementsByType("player")) do
                  if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == car then
                     if allPlayers ~= thePlayer then
                        triggerClientEvent("ejectPlayerFromVeh",allPlayers,allPlayers)
                        outputChatBox("#FF0000* Shoma "..getPlayerName(allPlayers).." ra Az Khodro Biroon Andakhtid!", thePlayer, 0, 255, 0,true)
                        outputChatBox("#FF0000* Player "..getPlayerName(thePlayer).." Shoma ra Az Khodro Biroon Andakht!", allPlayers, 0, 255, 0,true)
                        ejected[thePlayer] = ejected[thePlayer] + 1
                     end
                  end
               end
               if ejected[thePlayer] == 0 then
                  outputChatBox("#fc3800[Error]:#FFFFFFHichki Dar Khodro'e Shoma Nist!", thePlayer, 0, 255, 0,true)

               end
            else

               local taraf = miscSys:findPlayer(target)
               if taraf then
                  if taraf ~= thePlayer then
                     if isPedInVehicle(taraf) and getPedOccupiedVehicle(taraf) == car then
                        triggerClientEvent("ejectPlayerFromVeh",taraf,taraf)
                        outputChatBox("#FF0000* Shoma "..getPlayerName(taraf).." ra Az Khodro Biroon Andakhtid!", thePlayer, 0, 255, 0,true)
                        outputChatBox("#FF0000* Player "..getPlayerName(thePlayer).." Shoma ra Az Khodro Biroon Andakht!", taraf, 0, 255, 0,true)

                        
                     else
                        outputChatBox("#fc3800[Error]:#FFFFFFIn Player Dar Khodroe Shoma Nist!", thePlayer, 0, 255, 0,true)

                     end
                  else
                     outputChatBox("#fc3800[Error]:#FFFFFFKhodeto Nemitooni Eject Koni!", thePlayer, 0, 255, 0,true)

                  end
               end
            end
         else
            outputChatBox("#cdcdcdSyntax: /eject <PartofName/ID (or) all>",thePlayer, 0, 255, 0,true)
         end
      else
         outputChatBox("#fc3800[Error]:#FFFFFFShoma Ranandeye Khodro Nistid!",thePlayer, 0, 255, 0,true)
      end
   else
      outputChatBox("#fc3800[Error]:#FFFFFFShoma Savare Khodro Nistid!",thePlayer, 0, 255, 0,true)
   end
end)