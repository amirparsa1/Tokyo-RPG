local sW,sH = guiGetScreenSize()
local screenW,screenH = guiGetScreenSize()

local font1 = guiCreateFont("IRANSans.ttf",25)
BackBreak = guiCreateStaticImage((screenW - 700) / 2 , (screenH - 450) / 2, 700, 500,"BackGround.png",false)
--

BreakText = guiCreateLabel(0.4, 0.0001, 0.9, 0.9,"Prison Break",true,BackBreak)
guiSetFont(BreakText,font1)
guiSetProperty(BackBreak,"Visible","False")

--guiCreateWindow(0.26, 0.27, 0.48, 0.47, "Break", true)
-- guiWindowSetMovable(BackBreak, false)
-- guiWindowSetSizable(BackBreak, false)

breakBtn = guiCreateButton(0.89, 0.60, 0.06, 0.08, "C", true, BackBreak)
guiSetFont(breakBtn, "default-bold-small")
guiSetProperty(breakBtn, "NormalTextColour", "FF2a4bf6")

--breakLine = guiCreateStaticImage(0.40, 0.47, 0.24, 0.01, "Line.png", true, BackBreak)
breakBtn2 = guiCreateButton(0.82, 0.60, 0.06, 0.08, "C", true, BackBreak)
guiSetEnabled(breakBtn2 ,false)
guiSetFont(breakBtn2, "default-bold-small")
guiSetProperty(breakBtn2, "NormalTextColour", "FFFF0000")


breakBtn3 = guiCreateButton(0.75, 0.60, 0.06, 0.08, "C", true, BackBreak)
guiSetEnabled(breakBtn3 ,false)
guiSetFont(breakBtn3, "default-bold-small")
guiSetProperty(breakBtn3, "NormalTextColour", "FFFF00FF")
local sW, sH = guiGetScreenSize()

local clickkarde = false

--- shekastan mile ---
local dafee1 = false 
local dafee2 = false 
local dafee3 = false 
local dafee4 = false 
local dafee5 = false 

local usekardanmile = false

addEvent("IsUseMile",true)
addEventHandler("IsUseMile",getLocalPlayer(),function(player)
	exports["notf"]:addNotification("Baraye Shekastan Ghofl Dar Zendan Az (( /break )) Estefade Konid!", 'info')
	usekardanmile = true
	dafee1 = false 
    dafee2 = false 
    dafee3 = false 
    dafee4 = false 
	dafee5 = false 
	
end)
addEvent("TakeMile",true)
addEventHandler("TakeMile",getLocalPlayer(),function()
	usekardanmile = false
	dafee1 = false 
    dafee2 = false 
    dafee3 = false 
    dafee4 = false 
	dafee5 = false 
end)

local tomarkerhastsh = false 

local marker1 = false
local marker2 = false
local marker3 = false
local marker4 = false
local marker5 = false
local marker6 = false
local marker7 = false
local marker8 = false
local marker9 = false
local marker10 = false
local marker11 = false
local marker12 = false
local marker13 = false
local marker14 = false
local marker15 = false

--[[("ss",function()
	if dafee1 == true then 
		outputChatBox("Dafea 1 True")
	end
	if dafee2 == true then 
		outputChatBox("dafe 2 true")
	end 
	if dafee3 == true then 
		outputChatBox("dafe 3 true")
	end 
	if dafee4 == true then 
		outputChatBox("dafe 4 true")
	end 
	if dafee5 == true then 
		outputChatBox("dafe 5 true")
	else 
		outputChatBox("Sik")
	end 

	
end)]]


addEvent("cm1hiter",true)
addEventHandler("cm1hiter",getLocalPlayer(),function()

	marker1 = true 
	tomarkerhastsh = true 
end)

addEvent("cm1leaver",true)
addEventHandler("cm1leaver",getLocalPlayer(),function()

	marker1 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm2hiter",true)
addEventHandler("cm2hiter",getLocalPlayer(),function()

	marker2 = true 
	tomarkerhastsh = true 

end)

addEvent("cm2leaver",true)
addEventHandler("cm2leaver",getLocalPlayer(),function()

	marker2 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm3hiter",true)
addEventHandler("cm3hiter",getLocalPlayer(),function()

	marker3 = true 
	tomarkerhastsh = true 

end)

addEvent("cm3leaver",true)
addEventHandler("cm3leaver",getLocalPlayer(),function()

	marker3 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm4hiter",true)
addEventHandler("cm4hiter",getLocalPlayer(),function()

	marker4 = true 
	tomarkerhastsh = true 

end)

addEvent("cm4leaver",true)
addEventHandler("cm4leaver",getLocalPlayer(),function()

	marker4 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm5hiter",true)
addEventHandler("cm5hiter",getLocalPlayer(),function()

	marker5 = true 
	tomarkerhastsh = true 

end)

addEvent("cm5leaver",true)
addEventHandler("cm5leaver",getLocalPlayer(),function()

	marker5 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm6hiter",true)
addEventHandler("cm6hiter",getLocalPlayer(),function()

	marker6 = true
	tomarkerhastsh = true  

end)

addEvent("cm6leaver",true)
addEventHandler("cm6leaver",getLocalPlayer(),function()

	marker6 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm7hiter",true)
addEventHandler("cm7hiter",getLocalPlayer(),function()

	marker7 = true 
	tomarkerhastsh = true 

end)

addEvent("cm7leaver",true)
addEventHandler("cm7leaver",getLocalPlayer(),function()

	marker7 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm8hiter",true)
addEventHandler("cm8hiter",getLocalPlayer(),function()

	marker8 = true 
	tomarkerhastsh = true 

end)

addEvent("cm8leaver",true)
addEventHandler("cm8leaver",getLocalPlayer(),function()

	marker8 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm9hiter",true)
addEventHandler("cm9hiter",getLocalPlayer(),function()

	marker9 = true 
	tomarkerhastsh = true 

end)

addEvent("cm9leaver",true)
addEventHandler("cm9leaver",getLocalPlayer(),function()

	marker9 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm10hiter",true)
addEventHandler("cm10hiter",getLocalPlayer(),function()

	marker10 = true 
	tomarkerhastsh = true 

end)

addEvent("cm10leaver",true)
addEventHandler("cm10leaver",getLocalPlayer(),function()

	marker10 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm11hiter",true)
addEventHandler("cm11hiter",getLocalPlayer(),function()

	marker11 = true 
	tomarkerhastsh = true 

end)

addEvent("cm11leaver",true)
addEventHandler("cm11leaver",getLocalPlayer(),function()

	marker11 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm12hiter",true)
addEventHandler("cm12hiter",getLocalPlayer(),function()

	marker12 = true 
	tomarkerhastsh = true 

end)

addEvent("cm12leaver",true)
addEventHandler("cm12leaver",getLocalPlayer(),function()

	marker12 = false
	tomarkerhastsh = false  

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------

---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm13hiter",true)
addEventHandler("cm13hiter",getLocalPlayer(),function()

	marker13 = true 
	tomarkerhastsh = true 

end)

addEvent("cm13leaver",true)
addEventHandler("cm13leaver",getLocalPlayer(),function()

	marker13 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm14hiter",true)
addEventHandler("cm14hiter",getLocalPlayer(),function()

	marker14 = true 
	tomarkerhastsh = true 

end)

addEvent("cm14leaver",true)
addEventHandler("cm14leaver",getLocalPlayer(),function()

	marker14 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm15hiter",true)
addEventHandler("cm15hiter",getLocalPlayer(),function()

	marker15 = true 
	tomarkerhastsh = true 

end)

addEvent("cm15leaver",true)
addEventHandler("cm15leaver",getLocalPlayer(),function()

	marker15 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm17hiter",true)
addEventHandler("cm17hiter",getLocalPlayer(),function()

	marker17 = true 
	tomarkerhastsh = true 

end)

addEvent("cm17leaver",true)
addEventHandler("cm17leaver",getLocalPlayer(),function()

	marker17 = false 
	tomarkerhastsh = false 

end)
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
addEvent("cm16hiter",true)
addEventHandler("cm16hiter",getLocalPlayer(),function()

	marker16 = true 
	tomarkerhastsh = true 

end)

addEvent("cm16leaver",true)
addEventHandler("cm16leaver",getLocalPlayer(),function()

	marker16 = false 
	tomarkerhastsh = false 

end)






nowRotation = 50
nowPosition = 0.46140000000002

addEventHandler("onClientRender", root,function()
	if breaking then
		
		dxDrawImage(sW * nowPosition, sH * 0.499, 160,5, "Line.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		--dxDrawImage(sW * 0.48, sH * 0.499, sW * 0.1176, sH * 0.0065, "Line.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage((screenW - 667+90) / 2 , (screenH - 300) / 2,330, 330, "Circle.png", nowRotation, 0, 0, tocolor(255, 255, 255, 255),true)
		dxDrawImage((screenW - 480+90) / 2 , (screenH - 110) / 2,140, 140, "Circle2.png", nowRotation2, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage((screenW - 580+90) / 2 , (screenH - 210) / 2,240, 240, "Circle3.png", nowRotation3, 0, 0, tocolor(255, 255, 255, 255), true)
		
		if digeTamoome == false then
			if isMoving == true then
				nowRotation = nowRotation + 0.7
			
				
			
				
			
				if nowRotation >= 360 then
					nowRotation = 0
				end
				
				 
			end
			if isMovingD2 == true then 
				nowRotation3 = nowRotation3 + 0.6
				if nowRotation3 >= 360 then
					nowRotation3 = 0
				end
			end
			if isMovingD3 == true then 
				nowRotation2 = nowRotation2 + 0.5
				if nowRotation2 >= 360 then
					nowRotation2 = 0
				end
			end
			if isMoving2 == true then
				nowPosition = nowPosition - 0.001
				if Ghaboole == true then
					if nowPosition <= 0.50000000000002 then
						nowPosition = 0.50000000000002
						isMoving2 = false
						guiSetEnabled(breakBtn2 ,true)
						guiSetEnabled(breakBtn, false)
						checking = false
					end
				else
					if nowPosition <= 0.52040000000002 then
						nowPosition = 0.52040000000002
						isMoving2 = false
						playSoundForPlayer = playSound("failed.mp3",false)
						setSoundVolume(playSoundForPlayer,1.00)
						
						digeTamoome = true
						setTimer(function()
							breaking = false
							guiSetVisible(BackBreak,false)
							showCursor(false)
							isMoving = false
							checking = false
							NowID = 0
							digeTamoome = false
						end,2500,1)
						
						if dafee1 == false then 
							dafee1 = true 
							return 
						end
						if dafee1 == true and dafee2 == false then 
							dafee2 = true 
							return 
						end
						if dafee1 == true and dafee2 == true and dafee3 == false then 
							dafee3 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == false then 
							dafee4 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == true and dafee5 == false then 
						   dafee5 = true 
						   exports["[GG]Notification"]:addNotification( "Mile Shoma Shekast!", 'error')
						   return 
						end
						
					end
				end
			end
				--
			
				
			if isMoving3 == true then
				nowPosition = nowPosition - 0.001
				if Ghaboole2 == true then
					if nowPosition <= 0.47000000000002 then
						nowPosition = 0.47000000000002
						isMoving3 = false
						guiSetEnabled(breakBtn3 ,true)
						guiSetEnabled(breakBtn2, false)
						checking = false
					end
				else
					if nowPosition <= 0.48000000000002 then
						nowPosition = 0.48000000000002
						isMoving3 = false
						playSoundForPlayer = playSound("failed.mp3",false)
						setSoundVolume(playSoundForPlayer,1.00)
						
						digeTamoome = true
						setTimer(function()
							breaking = false
							guiSetVisible(BackBreak,false)
							showCursor(false)
							isMoving = false
							checking = false
							NowID = 0
							digeTamoome = false
							end,2000,1)

						guiSetEnabled(breakBtn2 ,false)
						guiSetEnabled(breakBtn, true)	
						if dafee1 == false then 
							dafee1 = true 
							return 
						end
						if dafee1 == true and dafee2 == false then 
							dafee2 = true 
							return 
						end
						if dafee1 == true and dafee2 == true and dafee3 == false then 
							dafee3 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == false then 
							dafee4 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == true and dafee5 == false then 
						   dafee5 = true 
						   exports["[GG]Notification"]:addNotification( "Mile Shoma Shekast!", 'error')
						   return 
						end
						
					end
				end
			end


			if isMoving4 == true then
				nowPosition = nowPosition - 0.001
				if Ghaboole3 == true then
					if nowPosition <= 0.42000000000002 then
						nowPosition = 0.42000000000002
						isMoving4 = false
						guiSetEnabled(breakBtn2 ,false)
						guiSetEnabled(breakBtn3 ,false)
						guiSetEnabled(breakBtn, true)
						guiSetVisible(BackBreak,false)
						checking = false
						breaking = false
						--isMoving = false
						digeTamoome = true


						if marker1 == true then 
							triggerServerEvent("OpenGate", root,localPlayer)
						elseif marker2 == true then 
							triggerServerEvent("OpenGate2", root,localPlayer)
						elseif marker3 == true then 
							triggerServerEvent("OpenGate3", root,localPlayer)
						elseif marker4 == true then 
							triggerServerEvent("OpenGate4", root,localPlayer)
						elseif marker5 == true then 
							triggerServerEvent("OpenGate5", root,localPlayer)
						elseif marker6 == true then 
							triggerServerEvent("OpenGate6", root,localPlayer)
						elseif marker7 == true then 
							triggerServerEvent("OpenGate7", root,localPlayer)
						elseif marker8 == true then 
							triggerServerEvent("OpenGate8", root,localPlayer)
						elseif marker9 == true then 
							triggerServerEvent("OpenGate9", root,localPlayer)
						elseif marker10 == true then 
							triggerServerEvent("OpenGate10", root,localPlayer)
						elseif marker11 == true then 
							exports["[GG]Notification"]:addNotification( "Be In Dar Nemishe Nofoz Kard!", 'error')
							--triggerServerEvent("OpenGate11", root,localPlayer)
						elseif marker12 == true then 
							triggerServerEvent("OpenGate12", root,localPlayer)
						elseif marker13 == true then 
							triggerServerEvent("OpenGate13", root,localPlayer)
						elseif marker14 == true then 
							triggerServerEvent("OpenGate14", root,localPlayer)
						elseif marker15 == true then 
							triggerServerEvent("OpenGate15", root,localPlayer)
						elseif marker16 == true then 
							triggerServerEvent("OpenGate16", root,localPlayer)
						elseif marker17 == true then 
							triggerServerEvent("OpenGate17", root,localPlayer)
						end
						showCursor(false)
						digeTamoome = true
						setTimer(function()
							breaking = false
							guiSetVisible(BackBreak,false)
							showCursor(false)
							isMoving = false
							checking = false
							NowID = 0
							digeTamoome = false
							end,2000,1)
						isMoving4 = false

					end
				else
					if nowPosition <= 0.46040000000002 then
						nowPosition = 0.46040000000002
						isMoving4 = false
						playSoundForPlayer = playSound("failed.mp3",false)
						setSoundVolume(playSoundForPlayer,1.00)
						
						digeTamoome = true
						setTimer(function()
							breaking = false
							guiSetVisible(BackBreak,false)
							showCursor(false)
							isMoving = false
							checking = false
							NowID = 0
							digeTamoome = false
							end,2000,1)

						guiSetEnabled(breakBtn3 ,false)
						guiSetEnabled(breakBtn, true)		
						if dafee1 == false then 
							dafee1 = true 
							return 
						end
						
						if dafee1 == false then 
							dafee1 = true 
							return 
						end
						if dafee1 == true and dafee2 == false then 
							dafee2 = true 
							return 
						end
						if dafee1 == true and dafee2 == true and dafee3 == false then 
							dafee3 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == false then 
							dafee4 = true 
							return 
						end 
						if dafee1 == true and dafee2 == true and dafee3 == true and dafee4 == true and dafee5 == false then 
						   dafee5 = true 
						   exports["[GG]Notification"]:addNotification( "Mile Shoma Shekast!", 'error')
						   return 
						end	
					end
				end
			end			
		end
	end
end)


breaking = false
guiSetVisible(BackBreak,false)
isMoving = false
isMovingD2 = false 
isMovingD3 = false
checking = false
isMoving2 = false
Ghaboole = false
Ghaboole2 = false
Ghaboole3 = false



digeTamoome = false


addCommandHandler("break",function()
	if tomarkerhastsh == true then 
		if dafee5 == false then 
			if usekardanmile == true then
				if guiSetVisible(BackBreak) == false then
					nowRotation = 50
					nowPosition = 0.6
					nowRotation3 = 50
					nowRotation2 = 50
					breaking = true
					guiSetVisible(BackBreak,true)
					guiSetVisible(BreakText,true)
					showCursor(true)
					isMoving = true
					isMovingD2 = true 
					isMovingD3 = true
					checking = false
		
					digeTamoome = false
				end 
			else
				outputChatBox("#ff0000Ebteda Bayad Mile Khod Ra Use Konid!",255,255,255,true) 
			end 
		else 
			outputChatBox("#ff0000Mile Shoma Shekast Lotfan Yek Mile Jadid Use Konid!",255,255,255,true)
		end 
	else 
		outputChatBox("#ff0000Baraye Inkar Bayad Nazdik Dar Jail Bashid!",255,255,255,true)
	end

end)


function soundegate(gate)
	local sound = playSound3D("Data/buzz.wav", 0, 0, 0, false)
	attachElements(sound, gate)
	setSoundMaxDistance(sound, 10)
end
addEvent("playPrisonGateOpen",true)
addEventHandler("playPrisonGateOpen", getRootElement(), soundegate)


addEvent("showHouseBreakPage",true)
addEventHandler("showHouseBreakPage",getLocalPlayer(),function()
	if guiGetVisible(BackBreak) == false then
		nowRotation = 50
		nowPosition = 0.6
		nowRotation3 = 50
		nowRotation2 = 50
		breaking = true
		guiSetVisible(BackBreak,true)
		showCursor(true)
		isMoving = true
		isMovingD2 = true 
		isMovingD3 = true
		checking = false
		
		digeTamoome = false
	end
end)


addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == breakBtn then
		if checking == false then
			checking = true
			isMoving = false
			isMoving2 = true
			if nowRotation >= 350.1 or nowRotation <= 3.5 then
				Ghaboole = true
			else
				Ghaboole = false
			end
		end
	elseif source == breakBtn2 then 
		if checking == false then
			checking = true
			isMoving3 = true
			isMovingD2 = false
			if nowRotation3 >= 350.1 or nowRotation3 <= 3.5 then
				Ghaboole2 = true
			else
				Ghaboole2 = false
			end
		end
	elseif source == breakBtn3 then 

		if checking == false then
			checking = true
			isMoving4 = true
			isMovingD3 = false
			if nowRotation2 >= 348.1 or nowRotation2 <= 3.5 then -- Value == 3.5
				Ghaboole3 = true
			else
				Ghaboole3 = false
			end
		end
	
	end
end)

addEvent("unlockSoundSync",true)
addEventHandler("unlockSoundSync",getLocalPlayer(),function(thePlayer)
	if digeTamoome == false then
		playSoundForPlayer = playSound("unlock.mp3",false)
		setSoundVolume(playSoundForPlayer,1.00)
		digeTamoome = true
		setTimer(function()
			breaking = false
			guiSetVisible(BackBreak,false)
			showCursor(false)
			isMoving = false
			checking = false
			NowID = 0
			digeTamoome = false
		end,2000,1)
	end
end)


addEvent("failSoundSync",true)
addEventHandler("failSoundSync",getLocalPlayer(),function(thePlayer)
	playSoundForPlayer = playSound("failed.mp3",false)
	setSoundVolume(playSoundForPlayer,1.00)
end)
-----------
addEvent("BebandPanelFararo",true)
addEventHandler("BebandPanelFararo",getLocalPlayer(),function()
breaking = false
guiSetVisible(BackBreak,false)
guiSetVisible(BreakText,false)	bazbodanpanelrochek = false
tomarkerhastsh = false 
marker1 = false
marker2 = false
marker3 = false
marker4 = false
marker5 = false
marker6 = false
marker7 = false
marker8 = false
marker9 = false
marker10 = false
marker11 = false
marker12 = false
marker13 = false
marker14 = false
marker15 = false
	showCursor(false)
end)