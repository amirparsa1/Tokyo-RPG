

col_floors = engineLoadCOL ( "Data/Model/rbank.col" )
engineReplaceCOL ( col_floors, objacktIDForImport )
txd_floors = engineLoadTXD ( "Data/Model/rbank.txd" )
engineImportTXD ( txd_floors, objacktIDForImport )
dff_floors = engineLoadDFF ( "Data/Model/rbank.dff")
engineReplaceModel ( dff_floors, objacktIDForImport )
col_floors_2 = engineLoadCOL ( "Data/Model/rdoor.col" )
engineReplaceCOL ( col_floors_2, objacktIDForDor )
txd_floors_2 = engineLoadTXD ( "Data/Model/rbank.txd" )
engineImportTXD ( txd_floors_2, objacktIDForDor )
dff_floors_2 = engineLoadDFF ( "Data/Model/rdoor.dff")
engineReplaceModel ( dff_floors_2, objacktIDForDor )
BankObjackt = createObject(objacktIDForImport,0,0,500,0,0,90)
setElementDoubleSided(BankObjackt,true)
GateForClickJosh = createObject(3095,-7.9, 0.27786, 498.74219,90,0,90)
setElementAlpha(GateForClickJosh,0)
PartyGUI = {
    Img = {},
    Lable = {},
    Font = {},
    Show = false,
}
screenW,screenH = guiGetScreenSize()
PartyGUI.Font["FontRank"] = guiCreateFont("Data/Font/Font2.otf", screenW/1920*18)
PartyGUI.Img["BackGrand"] = guiCreateStaticImage(0.84765625,0.23166666924953,0.125,0.6,"Data/Img/Party.png",true)
guiSetProperty(PartyGUI.Img["BackGrand"],"Visible","False")
PartyGUI.Lable["Player1"] = guiCreateLabel(0,0.2,1,1,"\n",true,PartyGUI.Img["BackGrand"])
guiSetFont(PartyGUI.Lable["Player1"],PartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(PartyGUI.Lable["Player1"],"center")
PartyGUI.Lable["Player2"] = guiCreateLabel(0,0.43,1,1,"\n",true,PartyGUI.Img["BackGrand"])
guiSetFont(PartyGUI.Lable["Player2"],PartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(PartyGUI.Lable["Player2"],"center")
PartyGUI.Lable["Player3"] = guiCreateLabel(0,0.43+0.23,1,1,"\n",true,PartyGUI.Img["BackGrand"])
guiSetFont(PartyGUI.Lable["Player3"],PartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(PartyGUI.Lable["Player3"],"center")
PartyGUI.Lable["Player4"] = guiCreateLabel(0,0.43+0.23+0.22,1,1,"\n",true,PartyGUI.Img["BackGrand"])
guiSetFont(PartyGUI.Lable["Player4"],PartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(PartyGUI.Lable["Player4"],"center")
addEvent("Party:Refresh",true)
addEventHandler("Party:Refresh",root,function(Player,Party)
    guiSetProperty(PartyGUI.Img["BackGrand"],"Visible","True")
    guiSetText(PartyGUI.Lable["Player1"],getPlayerName(Party[1]).."\n"..Party[5][1][1])
    if Party[2] ~= false then 
        guiSetText(PartyGUI.Lable["Player2"],getPlayerName(Party[2]).."\n"..Party[5][2][1])
    end
    if Party[3] ~= false then
        guiSetText(PartyGUI.Lable["Player3"],getPlayerName(Party[3]).."\n"..Party[5][3][1])
    end 
    if Party[4] ~= false then
        guiSetText(PartyGUI.Lable["Player4"],getPlayerName(Party[4]).."\n"..Party[5][4][1])
    end
end)
addEvent("Party:Close",true)
addEventHandler("Party:Close",root,function(Player,Party)
    guiSetText(PartyGUI.Lable["Player1"],"\n")
    guiSetText(PartyGUI.Lable["Player2"],"\n")
    guiSetText(PartyGUI.Lable["Player3"],"\n")
    guiSetText(PartyGUI.Lable["Player4"],"\n")
    guiSetProperty(PartyGUI.Img["BackGrand"],"Visible","False")
end)
--Create Party
CreatePartyGUI = {
    Img = {},
    Lable = {},
    Font = {},
    Button = {},
    Show = false,
    Ranks = {
        {"Hacker",1,"Hacker"},
        {"Joshkar",2,"Joshkar"},
        {"Kharabkar",3,"Kharabkar"},
        {"Ranande",4,"Ranande"},
    }
}
CreatePartyGUI.Font["FontRank"] = guiCreateFont("Data/Font/Font2.otf", screenW/1920*18)
CreatePartyGUI.Img["BackGrand"] = guiCreateStaticImage(0.20156249403954,0.15999999642372,0.6,0.7,"Data/Img/CParty.png",true)
CreatePartyGUI.Button["Close"] = guiCreateButton(0.92447918653488,0.026190476492047,0.05,0.1,"X",true,CreatePartyGUI.Img["BackGrand"])
guiSetAlpha(CreatePartyGUI.Button["Close"],0)
CreatePartyGUI.Button["CreateParty"] = guiCreateButton(0.35807290673256,0.86666667461395,0.25,0.1,"Create Party",true,CreatePartyGUI.Img["BackGrand"])
guiSetAlpha(CreatePartyGUI.Button["CreateParty"],0)
CreatePartyGUI.Lable["Rank1"] = guiCreateLabel(0.13020832836628,0.68571430444717,0.2,0.1,CreatePartyGUI.Ranks[1][1],true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Lable["Rank1"],CreatePartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(CreatePartyGUI.Lable["Rank1"],"center")
CreatePartyGUI.Lable["Rank2"] = guiCreateLabel(0.13020832836628+0.1675,0.68571430444717,0.2,0.1,CreatePartyGUI.Ranks[2][1],true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Lable["Rank2"],CreatePartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(CreatePartyGUI.Lable["Rank2"],"center")
CreatePartyGUI.Lable["Rank3"] = guiCreateLabel(0.13020832836628+0.1675+0.1675,0.68571430444717,0.2,0.1,CreatePartyGUI.Ranks[3][1],true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Lable["Rank3"],CreatePartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(CreatePartyGUI.Lable["Rank3"],"center")
CreatePartyGUI.Lable["Rank4"] = guiCreateLabel(0.13020832836628+0.1675+0.1675+0.1675,0.68571430444717,0.2,0.1,CreatePartyGUI.Ranks[4][1],true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Lable["Rank4"],CreatePartyGUI.Font["FontRank"])
guiLabelSetHorizontalAlign(CreatePartyGUI.Lable["Rank4"],"center")
CreatePartyGUI.Button["ChangeRank1"] = guiCreateButton(0.179098957836628,0.76428574323654,0.1,0.075,"Change",true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Button["ChangeRank1"],CreatePartyGUI.Font["FontRank"])
guiSetProperty(CreatePartyGUI.Button["ChangeRank1"],"NormalTextColour","FF00FF00")
CreatePartyGUI.Button["ChangeRank2"] = guiCreateButton(0.179098957836628+0.1675,0.76428574323654,0.1,0.075,"Change",true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Button["ChangeRank2"],CreatePartyGUI.Font["FontRank"])
guiSetProperty(CreatePartyGUI.Button["ChangeRank2"],"NormalTextColour","FF00FF00")
CreatePartyGUI.Button["ChangeRank3"] = guiCreateButton(0.179098957836628+0.1675+0.1675,0.76428574323654,0.1,0.075,"Change",true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Button["ChangeRank3"],CreatePartyGUI.Font["FontRank"])
guiSetProperty(CreatePartyGUI.Button["ChangeRank3"],"NormalTextColour","FF00FF00")
CreatePartyGUI.Button["ChangeRank4"] = guiCreateButton(0.179098957836628+0.1675+0.1675+0.1675,0.76428574323654,0.1,0.075,"Change",true,CreatePartyGUI.Img["BackGrand"])
guiSetFont(CreatePartyGUI.Button["ChangeRank4"],CreatePartyGUI.Font["FontRank"])
guiSetProperty(CreatePartyGUI.Button["ChangeRank4"],"NormalTextColour","FF00FF00")
guiSetProperty(CreatePartyGUI.Img["BackGrand"],"Visible","False")
function OpenClosePanelCParty(Stat)
    if Stat == "Show" then 
        showCursor(true)
        guiSetProperty(CreatePartyGUI.Img["BackGrand"],"Visible","True")
        CreatePartyGUI.Show = true 
    elseif Stat == "Hide" then 
        showCursor(false)
        CreatePartyGUI.Show = false 
        guiSetProperty(CreatePartyGUI.Img["BackGrand"],"Visible","False")
    end
end
function RankesOked()
    ReturnExported = false
    for i=1,#CreatePartyGUI.Ranks do 
        if CreatePartyGUI.Ranks[i][1] == CreatePartyGUI.Ranks[1][1] then 
            if i ~= 1 then
                ReturnExported = true 
            end
        elseif CreatePartyGUI.Ranks[i][1] == CreatePartyGUI.Ranks[2][1] then 
            if i ~= 2 then
                ReturnExported = true 
            end
        elseif CreatePartyGUI.Ranks[i][1] == CreatePartyGUI.Ranks[3][1] then 
            if i ~= 3 then
                ReturnExported = true 
            end
        elseif CreatePartyGUI.Ranks[i][1] == CreatePartyGUI.Ranks[4][1] then 
            if i ~= 4 then
                ReturnExported = true 
            end
        end
        if ReturnExported == true then 
            break 
        end
    end
    return ReturnExported
end
addEventHandler("onClientGUIClick",root,function()
    if source == CreatePartyGUI.Button["ChangeRank1"] then 
        if CreatePartyGUI.Ranks[1][2] == 4 then 
            CreatePartyGUI.Ranks[1][2] = 1
        else 
            CreatePartyGUI.Ranks[1][2] = CreatePartyGUI.Ranks[1][2]+1
        end
        guiSetText(CreatePartyGUI.Lable["Rank1"],CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[1][2]][3])
        CreatePartyGUI.Ranks[1][1] = CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[1][2]][3]
    elseif source == CreatePartyGUI.Button["ChangeRank2"] then 
        if CreatePartyGUI.Ranks[2][2] == 4 then 
            CreatePartyGUI.Ranks[2][2] = 1 
        else 
            CreatePartyGUI.Ranks[2][2] = CreatePartyGUI.Ranks[2][2]+1
        end
        guiSetText(CreatePartyGUI.Lable["Rank2"],CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[2][2]][3])
        CreatePartyGUI.Ranks[2][1] = CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[2][2]][3]
    elseif source == CreatePartyGUI.Button["ChangeRank3"] then 
        if CreatePartyGUI.Ranks[3][2] == 4 then 
            CreatePartyGUI.Ranks[3][2] = 1 
        else 
            CreatePartyGUI.Ranks[3][2] = CreatePartyGUI.Ranks[3][2]+1
        end
        guiSetText(CreatePartyGUI.Lable["Rank3"],CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[3][2]][3])
        CreatePartyGUI.Ranks[3][1] = CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[3][2]][3]
    elseif source == CreatePartyGUI.Button["ChangeRank4"] then 
        if CreatePartyGUI.Ranks[4][2] == 4 then 
            CreatePartyGUI.Ranks[4][2] = 1 
        else 
            CreatePartyGUI.Ranks[4][2] = CreatePartyGUI.Ranks[4][2]+1
        end
        guiSetText(CreatePartyGUI.Lable["Rank4"],CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[4][2]][3])
        CreatePartyGUI.Ranks[4][1] = CreatePartyGUI.Ranks[CreatePartyGUI.Ranks[4][2]][3]
    elseif source == CreatePartyGUI.Button["CreateParty"] then 
        if RankesOked() == true then outputChatBox("Lotfan Naghshe Afrad Ra Dorost Vared Kondi !",255,0,0,true) return end
        OpenClosePanelCParty("Hide")
        triggerServerEvent("Rob:CreateParty",getLocalPlayer(),getLocalPlayer(),CreatePartyGUI.Ranks)
    elseif source == CreatePartyGUI.Button["Close"] then 
        OpenClosePanelCParty("Hide")
    end
end)
addEvent("Rob:OpenCreatePartyPanel",true)
addEventHandler("Rob:OpenCreatePartyPanel",root,function(Player)
    if Player == getLocalPlayer() then 
        OpenClosePanelCParty("Show")
    end
end)
addEvent("Rob:CloseCreatePartyPanel",true)
addEventHandler("Rob:CloseCreatePartyPanel",root,function(Player)
    if Player == getLocalPlayer() then 
        OpenClosePanelCParty("Hide")
    end
end)
-- More 
PlaySounds = {}
addEvent("Rob:PlaySound:Rob",true)
addEventHandler("Rob:PlaySound:Rob",root,function(Player,soundPath)
    if Player == getLocalPlayer() then 
        PlaySounds[soundPath] = playSound("Data/Sound/"..soundPath)
    end
end)
addEvent("Rob:StopSound:Rob",true)
addEventHandler("Rob:StopSound:Rob",root,function(Player,soundPath)
    if Player == getLocalPlayer() then 
        stopSound(PlaySounds[soundPath])
    end
end)
--Leaser
cx , cy = ColSheperPOSITIONX, ColSheperPOSITIONY
lx , ly = cx , cy+ColSheperSIZEX
function Leasers()
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ-0.5, lx, ly, ColSheperPOSITIONZ-0.5, tocolor ( 255, 0, 0, 230 ), 6)
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ+1.5, lx, ly, ColSheperPOSITIONZ+1.5, tocolor ( 255, 0, 0, 230 ), 6)
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ+1.5+1.5, lx, ly, ColSheperPOSITIONZ+1.5+1.5, tocolor ( 255, 0, 0, 230 ), 6)
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ+1.5+1.5+1.5, lx, ly, ColSheperPOSITIONZ+1.5+1.5+1.5, tocolor ( 255, 0, 0, 230 ), 6)
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ+1.5+1.5+1.5+1.5, lx, ly, ColSheperPOSITIONZ+1.5+1.5+1.5+1.5, tocolor ( 255, 0, 0, 230 ), 6)
    dxDrawLine3D ( cx, cy, ColSheperPOSITIONZ+1.5+1.5+1.5+1.5+1.5, lx, ly, ColSheperPOSITIONZ+1.5+1.5+1.5+1.5+1.5, tocolor ( 255, 0, 0, 230 ), 6)
end
addEventHandler("onClientRender",root,Leasers)
--Kharabkar 
local ButtonsOfTask = {3 , 1 , 10 , 8 , 6 , 5 , 2 , 9 , 7 , 4}
local ButtonsForTask = {}
local TaskIsNow = false
TaskBG = guiCreateStaticImage(0.33,0.375,0.4-0.05,0.25,"Data/Img/Task1.png",true)
guiSetProperty(TaskBG,"Visible","False")
function DesotryButtonsOfNames()
    for i=1 , #ButtonsForTask do 
        if isElement(ButtonsForTask[i]) then destroyElement(ButtonsForTask[i]) end 
    end
end
function CreateButtonsOfNames ()
    DesotryButtonsOfNames()
    xTask , yTask = 0.058035712689161,0.21999999880791
    for i=1,#ButtonsOfTask do 
        ButtonsForTask[i] = guiCreateButton(xTask , yTask,0.175,0.35,tostring(ButtonsOfTask[i]),true,TaskBG)
        guiSetAlpha(ButtonsForTask[i],0)
        if i % 5 ~= 0 then 
            xTask = xTask + 0.175
        else 
            xTask = 0.058035712689161 
            yTask = yTask+0.35
        end
    end
end
CreateButtonsOfNames()
local AkharinNum = 0 
addEventHandler("onClientGUIClick",root,function()
    if TaskIsNow == false then return end
    for i=1,#ButtonsForTask do 
        if source == ButtonsForTask[i] then 
            numOfButton = guiGetText(ButtonsForTask[i])
            if tonumber(AkharinNum) + 1 == tonumber(numOfButton) then 
                AkharinNum = tonumber(numOfButton) 
                if AkharinNum == 10 then 
                    triggerServerEvent("Rob:Kharabkar|Return",getLocalPlayer(),getLocalPlayer())
                    guiSetProperty(TaskBG,"Visible","False")
                    showCursor(false)
                    TaskIsNow = false
                    AkharinNum = 0
                end
            else 
                outputChatBox("#9c9c9c[Rob-System]:#ffffff Shoma Natavenestid Dar Ra Baz Konid !",0,0,0,true)
                guiSetProperty(TaskBG,"Visible","False")
                showCursor(false)
                TaskIsNow = false
                AkharinNum = 0
            end
        end
    end
end)
function CreteTask()
    guiSetProperty(TaskBG,"Visible","True")
    showCursor(true)
    TaskIsNow = true
end
addEvent("Rob:Kharabkar",true)
addEventHandler("Rob:Kharabkar",root,function(Player)
    if Player == getLocalPlayer() then 
        CreteTask()
    end
end)
--Hacker 
isNow = false
ButtonNamesRand = {}
Buttons = {}
ChaharAdadRand = {0,0,0,0}
Font = guiCreateFont("Data/Font/Font.ttf",14)
RobSystemBG = guiCreateStaticImage(0.23749999701977,0.15999999642372,0.5,0.7,"Data/Img/BG.png",true)
ttle = guiCreateLabel(0,0.015,1,1,"Hack PC",true,RobSystemBG)
guiSetFont(ttle,Font)
guiLabelSetHorizontalAlign(ttle,"center")
Rand1 = guiCreateLabel(0.29062500596046,0.14047619700432,0.07,0.1,"",true,RobSystemBG)
guiSetFont(Rand1,Font)
Rand2 = guiCreateLabel(0.29062500596046+0.1,0.14047619700432,0.07,0.1,"",true,RobSystemBG)
guiSetFont(Rand2,Font)
Rand3 = guiCreateLabel(0.29062500596046+0.1+0.1,0.14047619700432,0.07,0.1,"",true,RobSystemBG)
guiSetFont(Rand3,Font)
Rand4 = guiCreateLabel(0.29062500596046+0.1+0.1+0.1,0.14047619700432,0.07,0.1,"",true,RobSystemBG)
guiSetFont(Rand4,Font)
guiSetProperty(RobSystemBG,"Visible","False")
function DestoryButtons()
    for i=1,#Buttons do 
        if isElement(Buttons[i]) then destroyElement(Buttons[i]) end 
    end
end
function CreateButtons()
    DestoryButtons()
    X , Y = 0.075 , 0.25
    for i=1,30 do 
        Buttons[i] = guiCreateButton(X,Y,0.1,0.1,"0",true,RobSystemBG)
        guiSetFont(Buttons[i],Font)
        if i % 6 ~= 0 then
            X = X + 0.15
        else
            X = 0.075
            Y = Y + 0.15
        end
    end
end
function chekOfTheClosePanel()
    ColourOFRand1R,ColourOFRand1G,ColourOFRand1B = guiLabelGetColor(Rand1) 
    ColourOFRand2R,ColourOFRand2G,ColourOFRand2B = guiLabelGetColor(Rand2)
    ColourOFRand3R,ColourOFRand3G,ColourOFRand3B = guiLabelGetColor(Rand3)
    ColourOFRand4R,ColourOFRand4G,ColourOFRand4B = guiLabelGetColor(Rand4)
    if ColourOFRand1R == 255 and ColourOFRand1G == 0 and ColourOFRand1B == 0 and ColourOFRand2R == 255 and ColourOFRand2G == 0 and ColourOFRand2B == 0 and ColourOFRand3R == 255 and ColourOFRand3G == 0 and ColourOFRand3B == 0 and ColourOFRand4R == 255 and ColourOFRand4G == 0 and ColourOFRand4B == 0 then 
        DestoryPanelHackRob("Gate")
    end
end
addEventHandler("onClientGUIClick",root,function()
    if isNow == true then 
        for i=1,#Buttons do 
            if source == Buttons[i] then 
                if tonumber(guiGetText(Buttons[i])) == ChaharAdadRand[1] then 
                    guiLabelSetColor(Rand1,255,0,0)
                    chekOfTheClosePanel()
                end
                if tonumber(guiGetText(Buttons[i])) == ChaharAdadRand[2] then 
                    guiLabelSetColor(Rand2,255,0,0)
                    chekOfTheClosePanel()
                end
                if tonumber(guiGetText(Buttons[i])) == ChaharAdadRand[3] then
                    guiLabelSetColor(Rand3,255,0,0)
                    chekOfTheClosePanel()
                end
                if tonumber(guiGetText(Buttons[i])) == ChaharAdadRand[4] then 
                    guiLabelSetColor(Rand4,255,0,0)
                    chekOfTheClosePanel()
                end
            end 
        end
    end
end)
function CreatePanelHackRob()
    DestoryPanelHackRob()
    showCursor(true)
    guiSetProperty(RobSystemBG,"Visible","True")
    isNow = true
    CreateButtons()
    for i=1,4 do 
        ChaharAdadRand[i] = math.random(1,100)
    end
    guiSetText(Rand1,ChaharAdadRand[1])
    guiSetText(Rand2,ChaharAdadRand[2])
    guiSetText(Rand3,ChaharAdadRand[3])
    guiSetText(Rand4,ChaharAdadRand[4])
    ChangeTextOfRandNumber()
    PanelHackTimer = setTimer(function()
        ChangeTextOfRandNumber()
    end,tonumber(timeOfRestartNumbers),0)
end
function DestoryPanelHackRob(type)
    if type == "Gate" then 
        triggerServerEvent("Rob:Hacker|Return",getLocalPlayer(),getLocalPlayer())
        DestoryPanelHackRob("Delet")
    elseif type == "Delet" then 
        guiSetProperty(RobSystemBG,"Visible","False")
        isNow = false
        if isTimer(PanelHackTimer) then killTimer(PanelHackTimer) end
        showCursor(false)
        ChaharAdadRand = {}
        guiSetText(Rand1,"")
        guiSetText(Rand2,"")
        guiSetText(Rand3,"")
        guiSetText(Rand4,"")
        guiLabelSetColor(Rand1,255,255,255)
        guiLabelSetColor(Rand2,255,255,255)
        guiLabelSetColor(Rand3,255,255,255)
        guiLabelSetColor(Rand4,255,255,255)
    end
end
function ChangeTextOfRandNumber()
    local sended4Rand = 1
    math__1 = math.random(1,30)
    math__2 = math.random(1,30)
    math__3 = math.random(1,30)
    math__4 = math.random(1,30)
    for i=1,#Buttons do 
        if i == math__1 then 
            guiSetText(Buttons[i],ChaharAdadRand[sended4Rand])
            sended4Rand = sended4Rand+1
        elseif i == math__2 then 
            guiSetText(Buttons[i],ChaharAdadRand[sended4Rand])
            sended4Rand = sended4Rand+1
        elseif i == math__3 then 
            guiSetText(Buttons[i],ChaharAdadRand[sended4Rand])
            sended4Rand = sended4Rand+1
        elseif i == math__4 then 
            guiSetText(Buttons[i],ChaharAdadRand[sended4Rand])
            sended4Rand = sended4Rand+1
        else 
            guiSetText(Buttons[i],tostring(math.random(1,100)))
        end
    end
end
addEvent("Rob:Hacker",true)
addEventHandler("Rob:Hacker",root,function(player)
    if player == getLocalPlayer() then 
        CreatePanelHackRob()
    end
end)
--Joshkar 
JoshKarDataCicked = 0
isPlayerJoshkar = false
ScreanX,ScreanY = guiGetScreenSize()
XY = {guiGetScreenSize()}
function Joshkar()
    if isPlayerJoshkar == false then return end
    dxDrawImage(ScreanX-130,ScreanY-150,130,150,"Data/Img/Dastgah.png")
    if not isCursorShowing() then return end
    cursorX, cursorY = getCursorPosition()
    cursorXs, cursorYs = cursorX*XY[1], cursorY*XY[2]
    if getKeyState("mouse1") then 
        dxDrawImage(cursorXs, cursorYs,110,150,"Data/Img/jON.png")
    else 
        dxDrawImage(cursorXs, cursorYs,110,150,"Data/Img/jOFF.png")
    end
    dxDrawLine(cursorXs+50, cursorYs+150,ScreanX-100,ScreanY-30,tocolor(5, 149, 252,255),12)
end
function addLabelOnClick ( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
    if isPlayerJoshkar == false then return end
    if clickedElement == GateForClickJosh then 
        playSound("Data/Sound/Wiz.m4a")
        if JoshKarDataCicked == 10 then 
            CreateJoshkarPanel("False")
            triggerServerEvent("Rob:Joshkar|Return",getLocalPlayer(),getLocalPlayer())
            return 
        end
        JoshKarDataCicked = JoshKarDataCicked+1
    end
end
function CreateJoshkarPanel(Stat)
    if Stat == "Show" then 
        addEventHandler("onClientRender",root,Joshkar)
        addEventHandler ( "onClientClick",root, addLabelOnClick )
        isPlayerJoshkar = true
        showCursor(true)
        setElementCollisionsEnabled(GateForClickJosh,true)
    elseif Stat == "False" then 
        removeEventHandler("onClientRender",root,Joshkar)
        removeEventHandler ( "onClientClick",root, addLabelOnClick )
        JoshKarDataCicked = 0
        isPlayerJoshkar = false
        showCursor(false)
        setElementCollisionsEnabled(GateForClickJosh,false)
    end
end
addEvent("Rob:Joshkar",true)
addEventHandler("Rob:Joshkar",root,function(Player)
    if Player == getLocalPlayer() then 
        CreateJoshkarPanel("Show")
    end
end)
addEvent("Rob:JoshkarColision",true)
addEventHandler("Rob:JoshkarColision",root,function(Player)
    if Player == getLocalPlayer() then 
        setElementCollisionsEnabled(GateForClickJosh,false)
    end
end)
addEvent("Rob:OffLesaer",true)
addEventHandler("Rob:OffLesaer",root,function(Player)
    if Player == getLocalPlayer() then 
        removeEventHandler("onClientRender",root,Leasers)
    end
end)