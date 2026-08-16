NockTimer = {}
local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1600), (screenH/900)
local font1 = dxCreateFont("Files/font.ttf", (x+y)*17)
local font2 = dxCreateFont("Files/font.ttf", (x+y)*12)
addEventHandler("onClientRender", root,function()
    if tonumber(getElementData(getLocalPlayer(),"pNockTime")) > 0 then
        dxDrawImage(x*480, y*750, x*732, y*95, "Files/Box.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Shoma Ta #fa8072"..tonumber(getElementData(getLocalPlayer(),"pNockTime")).." Saniye#ffffff Digar ReSpawn Mishavid",x*1220, y*1050, x*500, y*500 ,tocolor( 255, 255, 255, 255 ),x*0.6,font1, "center", "center", false, false, false, true, true)
        dxDrawText("( Hamchenin Etelate Marg Shoma Baraye Medi Ersal Shod )",x*1230, y*1130, x*500, y*500 ,tocolor( 255, 255, 255, 255 ),x*0.6,font2, "center", "center", false, false, false, false, true)
       

    end
end)

setTimer(function()
    if tonumber(getElementData(getLocalPlayer(),"pNockTime")) > 0 then 
        setElementData(getLocalPlayer(),"pNockTime",tonumber(getElementData(getLocalPlayer(),"pNockTime"))-1)
    end
end,1000,0)