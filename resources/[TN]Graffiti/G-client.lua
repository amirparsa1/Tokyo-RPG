local screenW, screenH = guiGetScreenSize()
local progressbarWidth, progressbarHeight = 350, 25
local progressbarPosX, progressbarPosY = (screenW - progressbarWidth) / 2, screenH - progressbarHeight * 2 
local mainFont = dxCreateFont(":[TN]Family/Fonts/font.ttf", 14, false, "antialiased")
local mainFontHeight = dxGetFontHeight(1, mainFont)
local DirLogo = ":[TN]Family/Logo"
function reMap(value, low1, high1, low2, high2)
	return low2 + (value - low1) * (high2 - low2) / (high1 - low1)
end
function S0SanyeForClient(player)
    if getLocalPlayer() == player then
        darsad = 0
    end
end
addEvent("S0SanyeForClient",true)
addEventHandler("S0SanyeForClient", root,S0SanyeForClient)
redcircle = {}
SprayCol = {}
InWhoSpray = {}
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


for c = 1 , #GangSprays do
    redcircle[c] = dxCreateTexture(DirLogo.."/0.dds", "dxt3")
    setElementInterior(redcircle[c],0)
    setElementDimension(redcircle[c],0)
end
toyespray = {}

fasele = 2
size = 1
darsad = 0

addEventHandler("onClientRender", getRootElement(),function()
    for x = 1 , #GangSprays do
        if getElementInterior(getLocalPlayer()) == 0 and getElementDimension(getLocalPlayer()) == 0 then
            dxDrawMaterialLine3D(GangSprays[x][1], GangSprays[x][2], GangSprays[x][3], GangSprays[x][4],GangSprays[x][5],GangSprays[x][6], redcircle[x], size*2,-1, false, GangSprays[x][7],GangSprays[x][8],GangSprays[x][9])
        end
    end
    if toyespray[getLocalPlayer()] == true then

        if tonumber(getElementData( getLocalPlayer(), "InWhatSpray???" )) > 0 then
            if getPedWeapon ( getLocalPlayer() ) == 41 then
                for index, col in pairs(getElementsByType("colshape")) do
                    idcol = getElementData(col,"IDCOOL:Graffiti") or false
                    if idcol == tonumber(getElementData( getLocalPlayer(), "InWhatSpray???" ))  then
                        if getElementData(getLocalPlayer(),"MyFamilyId") == getElementData(col,"ForWhosFamilyID?:Graffiti") and getElementData(getLocalPlayer(),"MyFamilyId") ~= 0 then
                            return false
                        end
                    end
                end
                dxDrawRectangle(progressbarPosX - 2, progressbarPosY - 2, progressbarWidth + 4, progressbarHeight + 4, tocolor(0, 0, 0, 160))
                dxDrawRectangle(progressbarPosX, progressbarPosY, reMap(darsad, 0, 100, 0, progressbarWidth), progressbarHeight, tocolor(50, 239, 125, 220))
                dxDrawText("Spraying:", progressbarPosX, progressbarPosY - progressbarHeight - 20, progressbarPosX + progressbarWidth, progressbarPosY + progressbarHeight, tocolor(255, 255, 255), 0.75, mainFont, "left", "center")
                dxDrawText(math.floor(darsad) .. "%", progressbarPosX, progressbarPosY, progressbarPosX + math.max(40, (progressbarWidth - 10) * darsad / 100), progressbarPosY + progressbarHeight, tocolor(255, 255, 255), 0.75, mainFont, "right", "center")
            end
        end
    end
end)








addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(),
function (weapon, _, _, hitX, hitY, hitZ)
    if weapon == 41 then
        Idish = tonumber(getElementData( getLocalPlayer(), "InWhatSpray???" ))
        for index, col in pairs(getElementsByType("colshape")) do
            idcol = getElementData(col,"IDCOOL:Graffiti") or false
            if idcol == Idish  then
                if getElementData(getLocalPlayer(),"MyFamilyId") == getElementData(col,"ForWhosFamilyID?:Graffiti") and getElementData(getLocalPlayer(),"MyFamilyId") ~= 0 then
                    return false
                end
            end
        end
        if Idish ~= false then
            if Idish > -1 then
                local myInt = getElementInterior(getLocalPlayer())
                local myDim = getElementDimension(getLocalPlayer())
                local de = getDistanceBetweenPoints3D(hitX, hitY, hitZ,GangSprays[Idish][1],GangSprays[Idish][2],GangSprays[Idish][3])
                if myInt == 0 and myDim == 0 and de < fasele then
                    darsad = darsad + 0.5
                    if isElement(redcircle[Idish]) and darsad == 100 then

                        triggerServerEvent("SendRequestCheangeGraffiti", getLocalPlayer(),getLocalPlayer(),Idish)
                        darsad = 0
                    end
                end
            end
        end
        
    end
end)


function SetGrafityAfterSpray(Idish,IdiLogo)
    if isElement(redcircle[Idish]) then
        destroyElement(redcircle[Idish])
        redcircle[Idish] = dxCreateTexture(DirLogo.."/"..IdiLogo..".dds", "dxt3")
        darsad = 0
    end
end
addEvent("SetGrafityAfterSpray",true)
addEventHandler("SetGrafityAfterSpray", root,SetGrafityAfterSpray)



function SetSprayForClient(player,i,Value)
    if player == getLocalPlayer() then
        if isElement(redcircle[i]) then
            destroyElement(redcircle[i])
            redcircle[i] = dxCreateTexture(DirLogo.."/"..Value..".dds", "dxt3")
        else
            redcircle[i] = dxCreateTexture(DirLogo.."/"..Value..".dds", "dxt3")
        end
    end
end
addEvent("SetSprayForClient",true)
addEventHandler("SetSprayForClient", root,SetSprayForClient)


function RaftToeyeCol(player,element)
    if player == getLocalPlayer() then
        if element == "RaftTo" then
            toyespray[getLocalPlayer()] = true
        else
            toyespray[getLocalPlayer()] = false
        end
    end
end
addEvent("RaftToeyeCol",true)
addEventHandler("RaftToeyeCol", root,RaftToeyeCol)
