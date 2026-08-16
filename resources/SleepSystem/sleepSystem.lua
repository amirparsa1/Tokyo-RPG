local accSys = exports["Accounts-System"]
local facSys = exports["Faction-System"]

local dbpTime = 500


function bekhab( thePlayer, command )
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
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
			                else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
					elseif getElementData(accSys:getPlayerAcc(thePlayer), "pHotel") == 1 then
                        if getElementInterior(thePlayer) == 15 then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
			                else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent1 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
							else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent2 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
			                else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent3 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
			                else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent4 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end
							else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break
                    elseif rent5 == getPlayerName(thePlayer) then
                        local id = row['ID']
                        if getElementDimension(thePlayer) == id then
                            if getPlayerWantedLevel(thePlayer) == 0 then
							if isPedOnGround (thePlayer) then
                                if getElementData(thePlayer, "sleeptime") == false then
                                    if getElementData(thePlayer, "inSleep") == false then
                                        setElementData(thePlayer,"sleeptime",true)
                                        doSleep(thePlayer)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                    else
                                        setElementData(thePlayer,"sleeptime",true)
                                        setTimer(function()
                                            setElementData(thePlayer,"sleeptime",false)
                                        end , 10000, 1)
                                        doUnSleep(thePlayer)
                                    end
                                else
                                    outputChatBox("#ff0000[Error]: Spam Nakon!", thePlayer, 255, 99, 71,true)
                                end


							else
                                outputChatBox("#ff0000Baraye Inkar Bayad Rooye Zamin Bashid!", thePlayer, 255, 99, 71,true)
                            end
                            else
                                outputChatBox("#ff0000Ba Wanted Ke Nemitooni Sleep Koni!", thePlayer, 255, 99, 71,true)
                            end
                            
                        else
                            outputChatBox("#ff0000Baraye Inkar Bayad Dakhel Khane/Hotel Bashi!", thePlayer, 255, 99, 71,true)
                        end
                        break

                    end
                    
            end
        dbFree(query)
        end
    end
end
addCommandHandler("sleep",bekhab)


function doSleep(root)
    setElementData(root, "inSleep", true)
    setElementFrozen ( root, true )
    toggleAllControls ( root, false )
    toggleControl ( root, "chatbox", true )

    setPedAnimation ( root, "CRACK", "crckidle2")
    outputChatBox("#00ff00[Tavajoh] #ffffffCharacter'e Shoma Khabid TheNight mta , Good Night !", root, 255, 99, 71,true)
end

function doUnSleep(root)

    setElementData(root, "inSleep", false)
    setElementFrozen ( root, false )
    toggleAllControls ( root, true )
    setPedAnimation ( root, "attractors", "stepsit_out", -1,false, false, false, false)

	outputChatBox("#ff0000[Tavajoh] #ffffffCharacter'e Shoma Bidar Shod TheNight mta lahzat khoobi ra baray shoma arezoomand ast!, Have Fun !", root, 255, 99, 71,true)
end
addEvent("doUnSleep",true)
addEventHandler("doUnSleep",getRootElement(),doUnSleep)