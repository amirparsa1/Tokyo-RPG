local accSys = exports["Accounts-System"]
local famSys = exports["[TN]Family"]
SprayCol = {}
GangSprays = {
    [1] = {955.7121,-1230.7963,18.463379,955.70245,-1230.7662,16.463402,955.7121,-1229.7963,18.463379},
    [2] = {2835.2324,-1565.1748,13.025237,2835.2292,-1565.2048,11.025239,2835.229,-1566.1748,13.025237},
    [3] = {2687.5603,-1097.8948,71.12953899999999,2687.5303,-1097.886,69.129555,2686.5603,-1097.8948,71.12953899999999},
    [4] = {653.20734,-1494.2198,16.782536,653.20673,-1494.2499,14.782537,653.20734,-1495.2198,16.782536},
    [5] = {1383.8179,-1131.0808,25.304417,1383.7983,-1131.1108,23.304512,1383.8179,-1132.0808,25.304417},
    [6] = {978.96613,-1589.0063,15.173487,978.99609,-1589.0056,13.173487,979.96613,-1589.0063,15.173487},
    [7] = {2429.9517,-1680.9509,15.806046,2429.9653,-1680.9209,13.806094,2429.9524,-1679.9509, 15.806046},
    [8] = {1160.7836,-1415.8862,15.77336,1160.8944,-1415.8562,13.776429,1160.7836,-1414.8862,15.77336},
    [9] = {1343.4731,-996.77539,29.897055,1343.5032,-996.7865,27.897085,1344.4731,-996.77539,29.897055},
    [10] = {2269.7046,-1030.4066,54.101154,2269.6714,-1030.4832,52.102673,2270.4175,-1031.1079,54.101154},
}

for i=1,#GangSprays do
    SprayCol[i] = createColSphere(GangSprays[i][1], GangSprays[i][2], GangSprays[i][3]-0.5, 2.5)
    setElementData(SprayCol[i],"ForWhosFamily?:Graffiti",0)
    setElementData(SprayCol[i],"ForWhosFamilyID?:Graffiti",0)
    setElementData(SprayCol[i],"IDCOOL:Graffiti",i)
    setElementData(SprayCol[i],"Garffiti:ForFam?",true)
    addEventHandler("onColShapeHit", SprayCol[i], function(hitElement)
        if getElementType( hitElement ) == "player" then
            if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) > 0 then
                setElementData(hitElement,"InWhatSpray???",i)
                local mYFam = tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId"))
                setElementData(hitElement,"MyFamilyId",mYFam)
                triggerClientEvent("S0SanyeForClient", hitElement, hitElement)
                triggerClientEvent("RaftToeyeCol", hitElement, hitElement,"RaftTo")
                
            end
        end
    end)
    addEventHandler("onColShapeLeave", SprayCol[i], function(hitElement)
        if getElementType( hitElement ) == "player" then
            setElementData(hitElement,"InWhatSpray???",false)
            triggerClientEvent("S0SanyeForClient", hitElement, hitElement)
            triggerClientEvent("RaftToeyeCol", hitElement, hitElement,"NaRaftTo")
        end
    end)
end


function SendRequestCheangeGraffiti(thePlayer,IdSh)
    triggerClientEvent("SetGrafityAfterSpray",thePlayer,IdSh,tonumber(famSys:FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"logoid")))
    setElementData(SprayCol[IdSh],"ForWhosFamily?:Graffiti",tonumber(famSys:FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"logoid")))
    setElementData(SprayCol[IdSh],"ForWhosFamilyID?:Graffiti",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")))
end
addEvent("SendRequestCheangeGraffiti",true)
addEventHandler("SendRequestCheangeGraffiti", root,SendRequestCheangeGraffiti)

function greetPlayer ( )
    for i = 1 ,#GangSprays do
        triggerClientEvent("SetSprayForClient", source,source, i,getElementData(SprayCol[i],"ForWhosFamily?:Graffiti"))
    end
end
addEventHandler ( "onPlayerJoin", root, greetPlayer )

function getSomeGraffiti(id)
    local mygraffitis = 0
    for i=1,#SprayCol do
        if getElementData(SprayCol[i],"ForWhosFamilyID?:Graffiti") == tonumber(id) then
            mygraffitis = mygraffitis + 1
        end
    end
    return mygraffitis
end
