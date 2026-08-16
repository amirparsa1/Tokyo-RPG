local accSys = exports["Accounts-System"]
local notfSys = exports["notf"]
local pick = createPickup ( 2479.1909179688 ,-1608.0220947266 ,-52.990623474121 , 3, 1274, 0)
setElementInterior(pick, 167 )
setElementDimension(pick, 195 )


addEventHandler( "onPickupHit", pick,function(hitElement)
    local goldesh = getElementData(accSys:getPlayerAcc(hitElement), "pGold")
    triggerClientEvent("openpanelsarafi",hitElement,hitElement,goldesh)
end)
addEventHandler( "onPickupLeave", pick,function(hitElement)
    triggerClientEvent("closepanelsarafi",hitElement,hitElement)
end)


function excheangeroanjambede(root,tedadgoold,poledaryafti)

    if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) >= tonumber(tedadgoold) then
        setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(getElementData(accSys:getPlayerAcc(root), "pGold"))-tonumber(tedadgoold))
        givePlayerMoney( root, tonumber(tedadgoold)*500 )
        notfSys:addNotification(root, "Succe" , 'info')
    else

        notfSys:addNotification(root, "Khata, Tedad Goold Shoma Kafi Nist. Shoma Be "..tostring(tedadgoold-tonumber(getElementData(accSys:getPlayerAcc(root), "pGold"))).."g Gold Digar Baraye Daryaft Pool "..tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")*500).." Niaz Darid" , 'error')
    end

end
addEvent("excheangeroanjambede",true)
addEventHandler("excheangeroanjambede",root,excheangeroanjambede)
local sarafiblip = createBlip( 1396.91015625 ,-1569.73828125 ,12, 36)
setElementData( sarafiblip, 'blipName',"Sarafi")
