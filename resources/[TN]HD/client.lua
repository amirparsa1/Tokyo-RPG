
local screenW,screenH = guiGetScreenSize()
addCommandHandler("hd",function(thePlayer)
    if guiGetVisible(Background) == false then
        --IsVisit = true
        showCursor(true)
        Background = guiCreateStaticImage( (screenW - 700) / 2 , (screenH - 650) / 2, 700, 700, "Data/Background.png", false)

        --Hd Off
        RoadOff = guiCreateStaticImage( 50, 80, 260, 260, "Data/World_0.png", false,Background)
        WeaponOff = guiCreateStaticImage( 380, 80, 260, 260, "Data/Weapon_0.png", false,Background)
        SkyOff = guiCreateStaticImage( 50, 360, 260, 260, "Data/Sky_0.png", false,Background)
        WaterOff = guiCreateStaticImage( 380, 360, 260, 260, "Data/Water_0.png", false,Background)
        SaveButton = guiCreateStaticImage( 150, 625, 380, 75, "Data/CloseButton.png", false,Background)

        --Hd On 
        RoadOn = guiCreateStaticImage( 50, 80, 260, 260, "Data/World_1.png", false,Background)
        WeaponOn = guiCreateStaticImage( 380, 80, 260, 260, "Data/Weapon_1.png", false,Background)
        SkyOn = guiCreateStaticImage( 50, 360, 260, 260, "Data/Sky_1.png", false,Background)
        WaterOn = guiCreateStaticImage( 380, 360, 260, 260, "Data/Water_1.png", false,Background)
        guiSetVisible( RoadOn, false )
        guiSetVisible( WeaponOn, false )
        guiSetVisible( SkyOn, false )
        guiSetVisible( WaterOn, false )

        local xml = xmlLoadFile ("HD.xml")
	    --if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
	    local HD1 = xmlFindChild (xml, "HD1", 0)
	    local HD2 = xmlFindChild (xml, "HD2", 0)
	    local HD3 = xmlFindChild (xml, "HD3", 0)
	    local HD4 = xmlFindChild (xml, "HD4", 0)
	    
	    if xmlNodeGetValue(HD1) == "1" then 
		    guiSetVisible( RoadOn, true )
	    end
	    if xmlNodeGetValue(HD2) == "1" then 
		    guiSetVisible( WaterOn, true )
	    end
	    if xmlNodeGetValue(HD3) == "1" then 
            guiSetVisible( SkyOn, true )
	    end
	    if xmlNodeGetValue(HD4) == "1" then 
		    guiSetVisible( WeaponOn, true )
	    end
        xmlSaveFile(xml)
        xmlUnloadFile(xml)

        end
    
end)

addEventHandler("onClientGUIClick",getRootElement(),function()
    if source == RoadOff then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( RoadOff, false )
            guiSetVisible( RoadOn, true )
            hdroad(true)
            xmlNodeSetValue(HD1,"1")
            xmlSaveFile(xml)
        end,2500,1 )
        
    elseif source == RoadOn then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( RoadOn, false )
            guiSetVisible( RoadOff, true )
            hdroad(false)
            xmlNodeSetValue(HD1,"")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == WaterOff then
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( WaterOn, true )
            guiSetVisible( WaterOff, false )
            hdwater(true)
            xmlNodeSetValue(HD2,"1")
            xmlSaveFile(xml)
        end,2500,1 ) 
    elseif source == WaterOn then
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( WaterOff, true )
            guiSetVisible( WaterOn, false )
            hdwater(false)
            xmlNodeSetValue(HD2,"")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == SkyOff then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( SkyOn, true )
            guiSetVisible( SkyOff, false )
            startDynamicSky()
            xmlNodeSetValue(HD3,"1")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == SkyOn then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( SkyOn, false )
            guiSetVisible( SkyOff, true )
            stopDynamicSky()
            xmlNodeSetValue(HD3,"")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == WeaponOff then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( WeaponOn, true )
            guiSetVisible( WeaponOff, false )
            hdGun(true)
            xmlNodeSetValue(HD4,"1")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == WeaponOn then 
        setTimer( function()
            local xml = xmlLoadFile ("HD.xml")
            if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
            local HD1 = xmlFindChild (xml, "HD1", 0)
            local HD2 = xmlFindChild (xml, "HD2", 0)
            local HD3 = xmlFindChild (xml, "HD3", 0)
            local HD4 = xmlFindChild (xml, "HD4", 0)
            if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
            if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
            if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
            if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
            guiSetVisible( WeaponOn, false )
            guiSetVisible( WeaponOff, true )
            hdGun(true)
            xmlNodeSetValue(HD4,"")
            xmlSaveFile(xml)
        end,2500,1 )
    elseif source == SaveButton then 
        
        guiSetVisible( Background, false )
        InVisit = false
        showCursor(false)
    end
end)



function LoadRoadF()
    hdroad(true)
end
addEvent("LoadRoad",true)
addEventHandler("LoadRoad",getRootElement(),LoadRoadF)

function LoadWaterF()
    hdwater(true)
end
addEvent("LoadWater",true)
addEventHandler("LoadWater",getRootElement(),LoadWaterF)

function LoadSkyF()
    startDynamicSky()
end
addEvent("LoadSky",true)
addEventHandler("LoadSky",getRootElement(),LoadSkyF)

function LoadWeaponF()
    hdGun(true)
end
addEvent("LoadWeapon",true)
addEventHandler("LoadWeapon",getRootElement(),LoadWeaponF)
function LoadHD()
	local xml = xmlLoadFile ("HD.xml")
	if not xml then xml = xmlCreateFile("HD.xml", "HDSys") end
	local HD1 = xmlFindChild (xml, "HD1", 0)
	local HD2 = xmlFindChild (xml, "HD2", 0)
	local HD3 = xmlFindChild (xml, "HD3", 0)
	local HD4 = xmlFindChild (xml, "HD4", 0)
	if not HD1 then HD1 = xmlCreateChild(xml, "HD1") end
	if not HD2 then HD2 = xmlCreateChild(xml, "HD2") end	
	if not HD3 then HD3 = xmlCreateChild(xml, "HD3") end
	if not HD4 then HD4 = xmlCreateChild(xml, "HD4") end
	if xmlNodeGetValue(HD1) == "1" then 
        setTimer(function()
		    hdroad(true)
        end,5000,1)
	end
	if xmlNodeGetValue(HD2) == "1" then 
        setTimer(function()
		    hdwater(true)
        end,5000,1)
	end
	if xmlNodeGetValue(HD3) == "1" then 
        setTimer(function()
            startDynamicSky(true)
        end,5000,1)
	end
	if xmlNodeGetValue(HD4) == "1" then 
        setTimer(function()
		    hdGun(true)
        end,5000,1)
	end
    xmlSaveFile(xml)
    xmlUnloadFile(xml)
end
LoadHD()