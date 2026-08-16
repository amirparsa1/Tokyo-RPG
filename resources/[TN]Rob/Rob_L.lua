accSys = exports["Accounts-System"]
ColSheperPOSITIONX,ColSheperPOSITIONY,ColSheperPOSITIONZ = 0, -15, 498.74219
ColSheperSIZEX,ColSheperSIZEY = 30,30
objacktIDForDor = 1918
PartySystemThem = {
    outputChatBoxThem = {"#FF9000"}
}
function PSOutPutChatBox(MSG,Player)
    outputChatBox(PartySystemThem.outputChatBoxThem[1].."[Party-System]#ffffff : "..MSG,Player,0,0,0,true)
end
function RSOutPutChatBox(MSG,Player)
    outputChatBox(PartySystemThem.outputChatBoxThem[1].."[Rob-System]#ffffff : "..MSG,Player,0,0,0,true)
end
function FindPlayer(PlayerName)
    if not tostring(PlayerName) then return false end
    return exports["misc"]:findPlayer( tostring(PlayerName))
end
function canPlayerStartRob(Player)
    if tonumber(getElementData(accSys:getPlayerAcc(Player), "pRob")) >= 20 and getPlayerWantedLevel(Player) == 0 then 
        return true 
    else 
        return false
    end
end
function KamKonRpRo(player)
    if tonumber(getElementData(accSys:getPlayerAcc(player), "pGoldPremium")) > 0 then
        setElementData(accSys:getPlayerAcc(player), "pRob",tonumber(getElementData(accSys:getPlayerAcc(player), "pRob")) - 10)
    else
        setElementData(accSys:getPlayerAcc(player), "pRob",tonumber(getElementData(accSys:getPlayerAcc(player), "pRob")) - 20)
    end
end
markerOfStartJoshakr = createMarker(-5.90204, 0.23196, 498.74219-1,"cylinder",1.5,80,0,255,75,getRootElement())
markerOfStartHacker = createMarker(5.02276, 0.26789, 498.74219-1,"cylinder",1.5,80,0,255,75,getRootElement())
markerOfStartKharabkar = createMarker(16.80344, 0.16889, 498.74219-1,"cylinder",1.5,80,0,255,75,getRootElement())
markerOfCreateParty = createMarker(330.80078125 ,183.7041015625 ,1095.6328125-1,"cylinder",1.5,80,0,255,75,getRootElement())
markerOfStartRob = createMarker(327.0205078125 ,168.697265625 ,1095.6328125-1,"cylinder",1.5,80,0,0,0,getRootElement())

setElementInterior(markerOfCreateParty,3)
setElementInterior(markerOfStartRob,3)
PositionOfStartRob = {getElementPosition(markerOfStartRob)}
local pcrob = createPickup(PositionOfStartRob[1],PositionOfStartRob[2],PositionOfStartRob[3]+1, 3, 1314, 0)
setElementInterior ( pcrob, 3 )
SpawmToRobPosition = {
    {16.78693, 0.17944, 498.74219},
    {16.81275, 3.11079, 498.74219},
    {18.78030, 3.11093, 498.74219},
    {19.09355, 0.63853, 498.74219},
}
RobSandoghPositions = {
    {-11.13937, -5.48531, 498.74945},
    {-14.14164, -5.49567, 498.74945},
    {-18.08129, -5.49254, 498.74945},
    {-22.02142, -5.48941, 498.74945},
}
SandoghMarkers = {}
for i=1,#RobSandoghPositions do 
    SandoghMarkers[i] = createMarker(RobSandoghPositions[i][1],RobSandoghPositions[i][2],RobSandoghPositions[i][3]-1,"cylinder",1.5,74, 255, 0,75,getRootElement())
    addEventHandler('onMarkerHit',root,function(Hiter)
        if source == SandoghMarkers[i] then 
            if getElementData(Hiter,"Rob:isRob") ~= true then RSOutPutChatBox("Baraye Inkar Bayad Rob Bezanid !",Hiter) return end
            if getElementData(Hiter,"Rob:KifePool") == true then RSOutPutChatBox("Shoma Yek Kif'e Pool Darid !",Hiter) return end
            if getElementAlpha(source) == 0 then return end
            setElementAlpha(source,0)
            setElementData(Hiter,"Rob:KifePool",true) 
            if getElementData(Hiter,"Party:Rank") == "Ranande" then 
                warpPedIntoVehicle(Hiter,RobVehicle,0)
            else 
                if getElementData(Hiter,"Party:Rank") == "Hacker" then 
                    warpPedIntoVehicle(Hiter,RobVehicle,1)
                elseif getElementData(Hiter,"Party:Rank") == "Joshkar" then
                    warpPedIntoVehicle(Hiter,RobVehicle,2) 
                elseif getElementData(Hiter,"Party:Rank") == "Kharabkar" then 
                    warpPedIntoVehicle(Hiter,RobVehicle,3)
                end
            end
        end
    end)
end
for i,v in pairs(getElementsByType("player")) do 
    setElementData(v,"Rob:KifePool",false) 
end
endOFRobElementsAndData = {
    Element = {
        Marker = {},
        Bilp = {},
    },
    Positions = {
        {-1280.25293, 2722.84229, 50.06250},
        {-2206.93921, 700.34210, 49.43750},
        {-2241.38037, -2308.53662, 30.22405},
        {2403.20654, 2798.77344, 10.82031},
    },
}
function CreateBilpAndMore()
    RandomPosiitonOfEndRobS = math.random(1,#endOFRobElementsAndData.Positions)
    endOFRobElementsAndData.Element.Bilp = createBlip(endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][1],endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][2],endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][3])
    endOFRobElementsAndData.Element.Marker = createMarker(endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][1],endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][2],endOFRobElementsAndData.Positions[RandomPosiitonOfEndRobS][3])
    for i,v in ipairs(getElementsByType("player")) do 
        if getElementData(v,"Rob:isRob") == true then 
            setElementVisibleTo(endOFRobElementsAndData.Element.Marker,v,true)
            setElementVisibleTo(endOFRobElementsAndData.Element.Bilp,v,true)
        else 
            setElementVisibleTo(endOFRobElementsAndData.Element.Marker,v,false)
            setElementVisibleTo(endOFRobElementsAndData.Element.Bilp,v,false)
        end
    end
    addEventHandler("onMarkerHit",root,function(Player)
        if source == endOFRobElementsAndData.Element.Marker then 
            if getElementData(Player,"Rob:isRob") == true then 
                if getElementData(Player,"Rob:KifePool") == true then 
                    RandomMoneyxx2 = math.random(500000,600000)
                    if givePlayerMoney(Player,RandomMoneyxx2) then
                        RSOutPutChatBox("Shoma Meghdar "..tonumber(RandomMoneyxx2).." Pool Kaseb Shodid !",Player)
                        setElementVisibleTo(endOFRobElementsAndData.Element.Marker,Player,false)
                        setElementVisibleTo(endOFRobElementsAndData.Element.Bilp,Player,false) 
                        setElementData(Player,"Rob:isRob",false)
                        setElementData(Player,"Rob:KifePool",false)
                        triggerClientEvent(Player,"Rob:StopSound:Rob",Player,Player,"PartTwo.m4a")
                        setTimer(function()
                            restartResource(getThisResource())
                        end,1800000,1)
                    end
                end
            end
        end
    end)
end
function SpawnPlayerInRobMap()
    return SpawmToRobPosition[math.random(1,4)][1],SpawmToRobPosition[math.random(1,4)][2],SpawmToRobPosition[math.random(1,4)][3]
end
RobVehicle = createVehicle(580,1426.96643, -1057.78174, 22.79224)
setVehicleColor(RobVehicle,0,0,0)
addEventHandler("onVehicleStartEnter",root,function(Player,Seat)
    if source == RobVehicle then 
        if Seat >= 0 then 
            if getElementData(Player,"Rob:isRob") ~= true then 
                if cancelEvent() then RSOutPutChatBox("In Mashin Makhsose Kasani Hast Ke Rob Zadand !",Player) end
            end
            if Seat == 0 then 
                if getElementData(Player,"Party:Rank") ~= "Ranande" then
                    if cancelEvent() then RSOutPutChatBox("Fqt Rannade Mitone Savar She !",Player) end
                end 
            end
        end
    end
end)