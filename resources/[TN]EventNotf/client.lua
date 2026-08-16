local screenW, screenH = guiGetScreenSize()
tablegtaV = {}
function outputGtaV(type, text, time)
    local data = {
        type = type,
        text = text,
        endTime = time,
        startTime = getTickCount()
    }
    table.insert(tablegtaV, data)

    outputConsole("[".. type.."]: ".. text.."")
   
    showChat(false)
  
end
addEvent("outputGtaV", true)
addEventHandler("outputGtaV", root, outputGtaV)
local screenWidth,screenHeight = guiGetScreenSize()
function dx_drawGtaV()
    for i, v in ipairs(tablegtaV) do

        if v.type == "Error" or v.type == "error" then
            r, g, b = 255, 0, 0
        elseif v.type == "Info" or v.type == "info" then
            r, g, b = 0, 87, 255
        else
            r, g, b = 250, 143, 0
        end
		
		dxDrawImage ( -1000, -1000, 6000, 6000, 'kadr.png', angle, 0, -120 ) 
		dxDrawImage ( screenWidth/2.3, 55, 250, 210, 'event.png', angle, 0, -120 )
		
        dxDrawText(v.type, (screenW * 0.4280) - 1, (screenH * 0.3143) - 1, (screenW * 0.5720) - 1, (screenH * 0.3838) - 1, tocolor(0, 0, 0, 255), 3, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(v.type, (screenW * 0.4280) + 1, (screenH * 0.3143) - 1, (screenW * 0.5720) + 1, (screenH * 0.3838) - 1, tocolor(0, 0, 0, 255), 3, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(v.type, (screenW * 0.4280) - 1, (screenH * 0.3143) + 1, (screenW * 0.5720) - 1, (screenH * 0.3838) + 1, tocolor(0, 0, 0, 255), 3, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(v.type, (screenW * 0.4280) + 1, (screenH * 0.3143) + 1, (screenW * 0.5720) + 1, (screenH * 0.3838) + 1, tocolor(0, 0, 0, 255), 3, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(v.type, screenW * 0.4280, screenH * 0.3143, screenW * 0.5720, screenH * 0.3838, tocolor(r, g, b, 255), 3, "pricedown", "center", "center", false, false, false, false, false)
           
        dxDrawRectangle(screenW * 0.0000, screenH * 0.3933, screenW * 1.0000, screenH * 0.0076, tocolor(255, 255, 255, 255), false)
          
        dxDrawText(v.text, (screenW * 0.0000) - 1, (screenH * 0.4105) - 1, (screenW * 1.0000) - 1, (screenH * 0.6000) - 1, tocolor(16, 112, 209, 255), 5, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(v.text, (screenW * 0.0000) + 1, (screenH * 0.4105) - 1, (screenW * 1.0000) + 1, (screenH * 0.6000) - 1, tocolor(16, 112, 209, 255), 5, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(v.text, (screenW * 0.0000) - 1, (screenH * 0.4105) + 1, (screenW * 1.0000) - 1, (screenH * 0.6000) + 1, tocolor(16, 112, 209, 255), 5, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(v.text, (screenW * 0.0000) + 1, (screenH * 0.4105) + 1, (screenW * 1.0000) + 1, (screenH * 0.6000) + 1, tocolor(16, 112, 209, 255), 5, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(v.text, screenW * 0.0000, screenH * 0.4105, screenW * 1.0000, screenH * 0.6000, tocolor(16, 112, 209), 5, "sans", "center", "center", false, false, false, false, false)
            
        dxDrawRectangle(screenW * 0.0000, screenH * 0.6095, screenW * 1.0000, screenH * 0.0076, tocolor(255, 255, 255, 255), false)
		

        if getTickCount()-v.startTime > v.endTime then
            table.remove(tablegtaV, i)
      
            showChat(true)
    
        end
    end
end
addEventHandler("onClientRender", root, dx_drawGtaV)