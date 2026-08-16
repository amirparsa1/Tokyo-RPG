
Partys = {}
for i,v in pairs(getElementsByType("player")) do 
    Partys[v] = nil
end
intParty = 0 
isRob = false
function RefreshParty(Player,Party)
    if Player == false then return end
    triggerClientEvent(Player,"Party:Refresh",Player,Player,Party)
end
function CloseParty(Player)
    if Player == false then return end
    triggerClientEvent(Player,"Party:Close",Player,Player)
end
addEventHandler("onMarkerHit",markerOfCreateParty,function(Hiter)
    if getElementType(Hiter) ~= "player" then return end
    triggerClientEvent(Hiter,"Rob:OpenCreatePartyPanel",Hiter,Hiter)
end)
addEventHandler("onPlayerWasted",root,function()
    triggerClientEvent(source,"Rob:CloseCreatePartyPanel",source,source)
end)
function JoinPlayerInTheRob(Player,Targhet)

    JoinPlayerInTheRobReturn = false
    if Partys[Player][2] == false then 
        Partys[Player][2] = Targhet
        setElementData(Targhet,"Party:Rank",tostring(Partys[Player][5][2][1]))
        JoinPlayerInTheRobReturn = true
    elseif Partys[Player][3] == false then 
        Partys[Player][3] = Targhet
        setElementData(Targhet,"Party:Rank",tostring(Partys[Player][5][3][1]))
        JoinPlayerInTheRobReturn = true
    elseif Partys[Player][4] == false then 
        Partys[Player][4] = Targhet
        setElementData(Targhet,"Party:Rank",tostring(Partys[Player][5][4][1]))
        JoinPlayerInTheRobReturn = true
    end
    return JoinPlayerInTheRobReturn
end
function LeavePlayerInPartyPlayer(Player,OPPlayer)
    LeavePlayerInPartyPlayerReturn = false
    if Partys[OPPlayer][2] == Player then 
        setElementData(Player,"Party:Rank",false)
        Partys[OPPlayer][2] = false 
        LeavePlayerInPartyPlayerReturn = true 
    elseif Partys[OPPlayer][3] == Player then
        setElementData(Player,"Party:Rank",false)
        Partys[OPPlayer][3] = false 
        LeavePlayerInPartyPlayerReturn = true
    elseif Partys[OPPlayer][4] == Player then
        setElementData(Player,"Party:Rank",false)
        Partys[OPPlayer][4] = false 
        LeavePlayerInPartyPlayerReturn = true 
    else 
        LeavePlayerInPartyPlayerReturn = false
    end
    return LeavePlayerInPartyPlayerReturn
end
function playSoundClient(Player,soundPath)
    triggerClientEvent(Player,"Rob:PlaySound:Rob",Player,Player,soundPath)
end
for i,v in pairs(getElementsByType("player")) do 
    if getElementData(v,"Inv:Reqside") ~= false then 
        setElementData(v,"Inv:Reqside",false)
    end
    if getElementData(v,"Party:Rank") ~= false then 
        setElementData(v,"Party:Rank",false)
    end
end
addEvent("Rob:CreateParty",true)
addEventHandler("Rob:CreateParty",root,function(Player,RankTable)
    Partys[Player] = {Player,false,false,false,RankTable}
    setElementData(Player,"Party:Rank",tostring(Partys[Player][5][1][1]))
    RefreshParty(Player,Partys[Player])
end)
addCommandHandler("inv",function(Player,cmd,Targhet)
    if getElementData(Player,"Inv:Reqside") ~= false then PSOutPutChatBox("Shoma Yeki Dighe Ro Davat Kardid !",Player) return end
    if not Partys[Player] then PSOutPutChatBox("Shoma Leader Party Nemibashid !",Player) return end
    if not Targhet then PSOutPutChatBox("/"..cmd.." [PartOfName/ID]",Player) return end
    invFind = FindPlayer(tostring(Targhet))
    --if getElementData(Targhet,"Inv:Reqside") ~= false then PSOutPutChatBox("In Player Yek Darkhast Barresi Nashode Darad !",Player) return end
    if not invFind then PSOutPutChatBox("Chenin Playeri Peyda Nashod !",Player) return end
    if invFind == Player then PSOutPutChatBox("Khodeto Nemitoni Invite Bedi !",Player) return false end
    invPx,invPy,invPz = getElementPosition(Player)
    invFx,invFy,invFz = getElementPosition(invFind)
    if getDistanceBetweenPoints3D(invPx,invPy,invPz,invFx,invFy,invFz) > 4 then PSOutPutChatBox("Shoma Nazdik "..getPlayerName(invFind).." Nistid !",Player) return end
    --if getElementData(invFind,"Party:Rank") ~= false then PSOutPutChatBox("Ishan Dar Yek Party Dighar Hastand !",Player) return end
    setElementData(invFind,"Inv:Reqside",Player)
    setElementData(Player,"Inv:Reqside",invFind)
    PSOutPutChatBox("Darkhast Baraye Player "..getPlayerName(invFind).." Ferestade Shod !",Player)
    PSOutPutChatBox("Shoma Yek Darkhast Az Taraf Player "..getPlayerName(Player).." Darid !",invFind)
    PSOutPutChatBox("For Accept ((/ainv)) Or Reject ((/rinv))",invFind)
end)
addCommandHandler("ainv",function(Player,Cmd)
    if getElementData(Player,"Inv:Reqside") == false then PSOutPutChatBox("Shoma Az Kasi Darkhasti Nadarid !",Player) return end
    --if getElementData(Player,"Party:Rank") ~= false then PSOutPutChatBox("Shoma Dar Yek Party Dighar Hastid !",Player) setElementData(Player,"Inv:Reqside",false) return end
    if not isElement(getElementData(Player,"Inv:Reqside")) then PSOutPutChatBox("Player Dighar Dar Server Nist !",Player) setElementData(Player,"Inv:Reqside",false) return end
    if not Partys[getElementData(Player,"Inv:Reqside")] then PSOutPutChatBox("Player Dighar Leader Party Nist !",Player) setElementData(Player,"Inv:Reqside",false) return end
    JoinPlayerInTheRobJoinReturn = JoinPlayerInTheRob(getElementData(Player,"Inv:Reqside"),Player)
    if JoinPlayerInTheRobJoinReturn == false then PSOutPutChatBox("Slot Party Por Shode Ast !",Player) return end
    RefreshParty(Partys[getElementData(Player,"Inv:Reqside")][1],Partys[getElementData(Player,"Inv:Reqside")])
    RefreshParty(Partys[getElementData(Player,"Inv:Reqside")][2],Partys[getElementData(Player,"Inv:Reqside")])
    RefreshParty(Partys[getElementData(Player,"Inv:Reqside")][3],Partys[getElementData(Player,"Inv:Reqside")])
    RefreshParty(Partys[getElementData(Player,"Inv:Reqside")][4],Partys[getElementData(Player,"Inv:Reqside")])
    PSOutPutChatBox("Shoma Vared Party Shodid !",Player)
    PSOutPutChatBox("Player "..getPlayerName(Player).." Vared Party Shod !",getElementData(Player,"Inv:Reqside"))
    setElementData(getElementData(Player,"Inv:Reqside"),"Inv:Reqside",false)
    setElementData(Player,"Inv:Reqside",false)

end)
addCommandHandler("rinv",function(Player,cmd)
    if getElementData(Player,"Inv:Reqside") == false then PSOutPutChatBox("Shoma Az Kasi Darkhasti Nadarid !",Player) return end
    if getElementData(Player,"Party:Rank") ~= false then PSOutPutChatBox("Shoma Dar Yek Party Dighar Hastid !",Player) setElementData(Player,"Inv:Reqside",false) return end
    if not isElement(getElementData(Player,"Inv:Reqside")) then PSOutPutChatBox("Player Dighar Dar Server Nist !",Player) setElementData(Player,"Inv:Reqside",false) return end
    if not Partys[getElementData(Player,"Inv:Reqside")] then PSOutPutChatBox("Player Dighar Leader Party Nist !",Player) setElementData(Player,"Inv:Reqside",false) return end
    PSOutPutChatBox("DarKhast Az Taraf Player "..getPlayerName(Player).." Rad Shod !",getElementData(Player,"Inv:Reqside"))
    PSOutPutChatBox("Shoma Darkhast Invite Player "..getPlayerName(getElementData(Player,"Inv:Reqside")).." Ra Rad Kardid !",Player)
    setElementData(getElementData(Player,"Inv:Reqside"),"Inv:Reqside",false)
    setElementData(Player,"Inv:Reqside",false)
end)
addEventHandler("onPlayerQuit",root,function(qityeType)
    if getElementData(source,"Inv:Reqside") ~= false then 
        if isElement(getElementData(source,"Inv:Reqside")) then 
            setElementData(getElementData(source,"Inv:Reqside"),"Inv:Reqside",false)
            PSOutPutChatBox("Player "..getPlayerName(source).." Az Server Kharej Shod !#9c9c9c ("..qityeType..")",getElementData(source,"Inv:Reqside"),0,0,0,true)
        end
        setElementData(Player,"Inv:Reqside",false)
    end
    if getElementData(source,"Party:Rank") ~= false then 
        if Partys[source] ~= nil then 
            if Partys[source][2] ~= false then 
                CloseParty(Partys[source][2])
                PSOutPutChatBox("Leader Az Server Kharej Shod ! ("..qityeType..") !",Partys[source][2])
                LeavePlayerInPartyPlayer(Partys[source][2],source)
            end
            if Partys[source][3] ~= false then           
                PSOutPutChatBox("Leader Az Server Kharej Shod ! ("..qityeType..") !",Partys[source][3])
                CloseParty(Partys[source][3])
                LeavePlayerInPartyPlayer(Partys[source][3],source)
            end
            if Partys[source][4] ~= false then 
                PSOutPutChatBox("Leader Az Server Kharej Shod ! ("..qityeType..") !",Partys[source][4])
                CloseParty(Partys[source][4])
                LeavePlayerInPartyPlayer(Partys[source][4],source)
            end
            setElementData(source,"Party:Rank",false)
            Partys[source] = nil
        else 
            KdomPartyFindPlayerInParty = FindPlayerInParty(source)
            LeavePlayerInPartyPlayer(source,KdomPartyFindPlayerInParty) 
            RefreshParty(Partys[KdomPartyFindPlayerInParty][1],Partys[KdomPartyFindPlayerInParty])
            RefreshParty(Partys[KdomPartyFindPlayerInParty][2],Partys[KdomPartyFindPlayerInParty])
            RefreshParty(Partys[KdomPartyFindPlayerInParty][3],Partys[KdomPartyFindPlayerInParty])
            RefreshParty(Partys[KdomPartyFindPlayerInParty][4],Partys[KdomPartyFindPlayerInParty])
        end
    end
end)
addCommandHandler("leave",function(Player)
    if getElementData(Player,"Party:Rank") == false then PSOutPutChatBox("Shoma Dar Party Nistid !",Player) return end
    if getElementData(Player,"Rob:isRob") == true then PSOutPutChatBox("Rob Shoro Shode Ast !",Player) return end
    if Partys[Player] then 
        if Partys[Player][2] ~= false then 
            PSOutPutChatBox("Leader Az Party Leave Dad !",Partys[Player][2])
            CloseParty(Partys[Player][2])
            LeavePlayerInPartyPlayer(Partys[Player][2],Player)
        end
        if Partys[Player][3] ~= false then 
            PSOutPutChatBox("Leader Az Party Leave Dad !",Partys[Player][3])
            CloseParty(Partys[Player][3])
            LeavePlayerInPartyPlayer(Partys[Player][3],Player)
        end
        if Partys[Player][4] ~= false then 
            PSOutPutChatBox("Leader Az Party Leave Dad !",Partys[Player][4])
            CloseParty(Partys[Player][4])
            LeavePlayerInPartyPlayer(Partys[Player][4],Player)
        end
        setElementData(Player,"Party:Rank",false)
        CloseParty(Player)
        Partys[Player] = nil
        PSOutPutChatBox("Shoma Az Party Kharej SHodid !",Player)
    else 
        KdomPartyFindPlayerInParty = FindPlayerInParty(Player)
        LeavePlayerInPartyPlayer(Player,KdomPartyFindPlayerInParty) 
        PSOutPutChatBox("Shoma Az Party Kharej Shodid !",Player)
        CloseParty(Player)
        RefreshParty(Partys[KdomPartyFindPlayerInParty][1],Partys[KdomPartyFindPlayerInParty])
        RefreshParty(Partys[KdomPartyFindPlayerInParty][2],Partys[KdomPartyFindPlayerInParty])
        RefreshParty(Partys[KdomPartyFindPlayerInParty][3],Partys[KdomPartyFindPlayerInParty])
        RefreshParty(Partys[KdomPartyFindPlayerInParty][4],Partys[KdomPartyFindPlayerInParty])
    end
end)
function FindPlayerInParty(Player)
    FindPlayerInPartyReturn = false
    for i,v in pairs(Partys) do 
        if v[2] == Player then 
            FindPlayerInPartyReturn = i
        elseif v[3] == Player then 
            FindPlayerInPartyReturn = i
        elseif v[4] == Player then 
            FindPlayerInPartyReturn = i
        end
    end
    return FindPlayerInPartyReturn
end
addCommandHandler("pkick",function(Player,cmd,Targhet)
    if not Partys[Player] then PSOutPutChatBox("Shoma Leader Party Nemibashid !",Player) return end
    if not Targhet then PSOutPutChatBox("/"..cmd.." [PartOfName/ID]",Player) return end
    if tostring(Targhet) == getPlayerName(Player) then PSOutPutChatBox("Khodetono Nemitonid Kick Konid !",Player) return end
    pkickFind = FindPlayer(tostring(Targhet))
    if not pkickFind then PSOutPutChatBox("Chenin Playeri Peyda Nashod !",Player) return end
    if getElementData(pkickFind,"Party:Rank") == false then PSOutPutChatBox("Player Dar Party Nemibashad !",Player) return end
    LeavePlayerInPartyPlayerExported = LeavePlayerInPartyPlayer(pkickFind,Player)
    if LeavePlayerInPartyPlayerExported == false then PSOutPutChatBox("Player Dar Party Shoma Nemibashad !",Player) return end
    PSOutPutChatBox("Player Az Party Kick Shod !",Player)
    PSOutPutChatBox("Shoma Az Party Kick Shodid !",pkickFind)
    CloseParty(pkickFind)
    RefreshParty(Partys[Player][1],Partys[Player])
    RefreshParty(Partys[Player][2],Partys[Player])
    RefreshParty(Partys[Player][3],Partys[Player])
    RefreshParty(Partys[Player][4],Partys[Player])
end)
addEventHandler("onMarkerHit",root,function(hiter)
    if source == markerOfStartRob then 
        RSOutPutChatBox("Baraye Start Rob Az Cmd #FF0000(( /rob )) #FFFFFFEstefade Konid !",hiter)
    elseif source == markerOfStartKharabkar then
        if getElementData(hiter,"Party:Rank") == "Kharabkar" then 
            RSOutPutChatBox("Baraye Baz Kardan Dar Az CMD #FF0000(( /hackd )) #FFFFFFEstefade Konid !",hiter)
        end
    elseif source == markerOfStartHacker then 
        if getElementData(hiter,"Party:Rank") == "Hacker" then 
            RSOutPutChatBox("Baraye Hack Kardan System Az Cmd #FF0000(( /hackp )) #FFFFFFEstefade Konid !",hiter)
        end
    elseif source == markerOfStartJoshakr then 
        if getElementData(hiter,"Party:Rank") == "Joshkar" then 
            RSOutPutChatBox("Baraye Hack Kardan System Az Cmd #FF0000(( /rjo )) #FFFFFFEstefade Konid !",hiter)
        end
    end
end)
addCommandHandler("rob",function(Player,cmd)
    RobCMDPositionPlayer = {getElementPosition(Player)}
    if getDistanceBetweenPoints3D(RobCMDPositionPlayer[1],RobCMDPositionPlayer[2],RobCMDPositionPlayer[3],PositionOfStartRob[1],PositionOfStartRob[2],PositionOfStartRob[3]) > 4 then RSOutPutChatBox("Fasele Shoma Ba Mahale Shoro'e Rob Ziad Ast",Player) return end
    if isRob == true then PSOutPutChatBox("Taze Rob Zadan !",Player) return end
    if not Partys[Player] then PSOutPutChatBox("Baraye In Kar Bayad Leader Yek Party Bashid !",Player) return end
    if Partys[Player][2] == false or Partys[Player][3] == false or Partys[Player][4] == false then RSOutPutChatBox("Tedad Ozv'e Party Bayad Kamel Bashad !",Player) return end
    --if canPlayerStartRob(Partys[Player][2]) == false or canPlayerStartRob(Partys[Player][3]) == false or canPlayerStartRob(Partys[Player][4]) == false then RSOutPutChatBox("Yeki Az Member Haye Party Wanted Ya Rp Kami Darad !",Player) return end
    

    setElementData(Player,"Rob:isRob",true)
    setElementData(Partys[Player][2],"Rob:isRob",true)
    setElementData(Partys[Player][3],"Rob:isRob",true)
    setElementData(Partys[Player][4],"Rob:isRob",true)

    isRob = true
    CreateBilpAndMore()
    
    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"Rob:isRob") == true then 
            setElementPosition(v,SpawnPlayerInRobMap())
            playSoundClient(v,"Wanted.mp3")
            playSoundClient(v,"PartTwo.m4a")
            setPlayerWantedLevel(v,6)
            RSOutPutChatBox("Rob Start Shod !",v)
            setElementDimension(v,0)
            setElementInterior(v,0)
            KamKonRpRo(v)
        end
    end
end)
-- Leaser 
LeaserStat = true
LeaserCol = createColRectangle(ColSheperPOSITIONX-ColSheperSIZEX,ColSheperPOSITIONY,ColSheperSIZEX,ColSheperSIZEY)
addEventHandler("onColShapeHit",root,function(hiter)
    if source == LeaserCol then 
        if LeaserStat == false then return end
        if getElementData(hiter,"Rob:isRob") ~= true then return end
        RSOutPutChatBox("Nabayad Vared Inja Mishodid ! Leaseraro Nemibini  :(",hiter)
        setElementHealth(hiter,0)
    end
end)
--Kharabkar 
KharabkarDorObj = createObject(objacktIDForDor,15.4, 1.1, 497.6,0,0,90)
addCommandHandler("hackd",function(Player)
    if getElementData(Player,"Rob:isRob") ~= true then RSOutPutChatBox("Shoma Dar Rob Nistid !",Player) return end 
    if getElementAlpha(markerOfStartKharabkar) == 0 then return end
    KharabkarPosition = {getElementPosition(Player)}
    if getDistanceBetweenPoints3D(KharabkarPosition[1],KharabkarPosition[2],KharabkarPosition[3],16.80344, 0.16889, 498.74219) > 3 then return end
    if getElementData(Player,"Party:Rank") == "Kharabkar" then
        RSOutPutChatBox("Panel Baraye Shoma Baz Shod !",Player)
        triggerClientEvent(Player,"Rob:Kharabkar",Player,Player)
        playSoundClient(Player,"Done.mp3")
    end
end)
addEvent("Rob:Kharabkar|Return",true)
addEventHandler("Rob:Kharabkar|Return",root,function(Player)
    RSOutPutChatBox("Shoma Dar Ra Ba Moafaqit Baz Kardid !",Player)
    moveObject(KharabkarDorObj,6000,15.4, 1.1, 497.6,0,0,-100)
    setElementAlpha(markerOfStartKharabkar,0)
    playSoundClient(Player,"Done.mp3")
end)
--Hacker 
addCommandHandler("hackp",function(Player) 
    if getElementData(Player,"Rob:isRob") ~= true then RSOutPutChatBox("Shoma Dar Rob Nistid !",Player) return end 
    if getElementAlpha(markerOfStartHacker) == 0 then return end
    HackerPosition = {getElementPosition(Player)}
    if getDistanceBetweenPoints3D(HackerPosition[1],HackerPosition[2],HackerPosition[3],5.02276, 0.26789, 498.74219) > 3 then return end
    if getElementData(Player,"Party:Rank") == "Hacker" then
        RSOutPutChatBox("Panel Baraye Shoma Baz Shod !",Player)
        playSoundClient(Player,"Hack.mp3")
        triggerClientEvent(Player,"Rob:Hacker",Player,Player)
    end
end)
addEvent("Rob:Hacker|Return",true)
addEventHandler("Rob:Hacker|Return",root,function(Player)
    RSOutPutChatBox("Leaser Ha Off Shodand !",Player)
    LeaserStat = false
    setElementAlpha(markerOfStartHacker,0)
    playSoundClient(Player,"Shutdown.mp3")
    for i,v in ipairs(getElementsByType("player")) do 
        if getElementData(v,"Rob:isRob") == true then 
            triggerClientEvent(v,"Rob:OffLesaer",v,v)
        end
    end
end)
--Joshkar 
JoshkarGate = createObject(3095,-8, 0.27786, 498.74219,90,0,90)
addCommandHandler("rjo",function(Player) 
    if getElementData(Player,"Rob:isRob") ~= true then RSOutPutChatBox("Shoma Dar Rob Nistid !",Player) return end 
    if getElementAlpha(markerOfStartJoshakr) == 0 then return end
    JoshkarPosition = {getElementPosition(Player)}
    if getDistanceBetweenPoints3D(JoshkarPosition[1],JoshkarPosition[2],JoshkarPosition[3],-5.90204, 0.23196, 498.74219) > 3 then return end
    if getElementData(Player,"Party:Rank") == "Joshkar" then
        RSOutPutChatBox("Panel Baraye Shoma Baz Shod !",Player)
        playSoundClient(Player,"Done.mp3")
        triggerClientEvent(Player,"Rob:Joshkar",Player,Player)
    end
end)
addEvent("Rob:Joshkar|Return",true)
addEventHandler("Rob:Joshkar|Return",root,function(Player)
    RSOutPutChatBox("Gate Baz Shod !",Player)
    playSoundClient(Player,"Done.mp3")
    moveObject(JoshkarGate,6000,-8, 0.27786, 498.74219-10)
    setElementAlpha(markerOfStartJoshakr,0)
    for i,v in ipairs(getElementsByType("player")) do 
        if getElementData(v,"Rob:isRob") == true then 
            triggerClientEvent(v,"Rob:JoshkarColision",v,v)
        end
    end
end)
addEventHandler("onPlayerWasted",root,function(atacker)
    if getElementData(source,"Rob:isRob") == true then 
        setElementData(source,"Rob:isRob",false)
        if getElementData(source,"Rob:KifePool") ~= false then 
            setElementData(source,"Rob:KifePool",false)
        end
        for i,v in pairs(getElementsByType("player")) do 
            if getElementData(v,"Rob:isRob") == true then
                outputChatBox("Player "..getPlayerName(source).." Koshte Shod !",v,255,0,0,true)
            end
        end
        outputChatBox("Shoma Dar Hal Rob Bodid !",source,255,0,0,true)
        triggerClientEvent(source,"Rob:StopSound:Rob",source,source,"PartTwo.m4a")
    end
end)
addEventHandler("onPlayerQuit",root,function(quitType)
    if getElementData(source,"Rob:isRob") == true then 
        setElementData(source,"Rob:isRob",false)
        for i,v in pairs(getElementsByType("player")) do 
            if getElementData(v,"Rob:isRob") == true then
                outputChatBox("Player "..getPlayerName(source).." Az Server Kharej Shod ! ("..quitType..")",v,255,0,0,true)
            end
        end
    end
end)