local accSys = exports["Accounts-System"]
local facSys = exports["Faction-System"]
local dbpTime = 500
addCommandHandler("sleep",
function ( thePlayer, command )
    if getElementData(thePlayer, "loggedIn") == true then 
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses;" )
        local result, numrows = dbPoll(query, dbpTime)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                local owner = row['OWNER']
                local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
                    if owner == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent1 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent2 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent3 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent4 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent5 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
                                if getElementData(thePlayer, "inSleep") == false then
                                    doSleep(thePlayer)
                                else
                                    doUnSleep(thePlayer)
                                end
                            else
                                outputChatBox("#ff0000[Sleep System]: #ffffffBa Wanted Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000[Sleep System]: #ffffffBaraye Inkar Bayad Dakhel Khoonat Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break

                    end
                    
            end
        dbFree(query)
        end
    end
end)
    


function doSleep(root)
    setElementData(root, "inSleep", true)
    setElementFrozen ( root, true )
    toggleAllControls ( root, false )
    toggleControl ( root, "chatbox", true )
    setPlayerNametagColor ( root, 109,92,65 )
    setPedAnimation ( root, "CRACK", "crckidle2")
    outputChatBox("#00ff00[Tavajoh] #ffffffCharacter'e Shoma Khabid, Good Night !", root, 255, 99, 71,true)
end

function doUnSleep(root)
    local myFaction = getElementData(accSys:getPlayerAcc(root), "pMember")
    setElementData(root, "inSleep", false)
    setElementFrozen ( root, false )
    toggleAllControls ( root, true )
    setPedAnimation(root,false)
    facSys:changeFactionColor(root, tonumber(myFaction))
	outputChatBox("#ff0000[Tavajoh] #ffffffCharacter'e Shoma Bidar Shod.", root, 255, 99, 71,true)
end

function sleepAnimTimer()
    setTimer ( function()
        for k, sleepzzz	in ipairs (getElementsByType("player")) do	
            if getElementData(sleepzzz , "loggedIn") == true then
                if getElementData(sleepzzz, "inSleep") == true then
                        setPedAnimation ( sleepzzz, "CRACK", "crckidle2")
                end
            end
        end
    end, 1000, 0 )
end
sleepAnimTimer()