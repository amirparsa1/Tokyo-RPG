-- Original script by G&T Mapping (c) 12.Dec.2014
-- Feel free to edit and redistribute this script.                                                                       --

femaleSkins = {11,12,13,38,246, 41, 53, 215,131,91, 88, 93, 191,76,198, 195,38, 90, 148, 150, 152, 169, 190, 237}

maleSkins = {2, 0, 7, 14, 15, 18, 19, 21, 251, 23, 24, 25, 26, 28, 29, 30, 32, 34, 36, 37, 43, 44, 45, 47, 48, 49, 60, 61, 62, 67, 84, 96, 99, 100, 101, 103, 105, 120, 127, 128, 132, 133, 134, 135, 146, 153, 162, 168, 170, 176, 180, 183, 184, 186, 202, 206,  223, 248, 269, 270, 271,292, 293, 294,79}


addEvent("errorskin",true)
addEventHandler("errorskin",getLocalPlayer(),function(player)
		sound = playSound("sound/errorp.mp3",false)
		setSoundVolume(sound,4)
end)
addEvent("Playinfo",true)
addEventHandler("Playinfo",getLocalPlayer(),function(player)
		sound3 = playSound("sound/info.mp3",false)
		setSoundVolume(sound,20)
end)
--------**--------
-------//\\-------
------//  \\------
-----//	   \\-----
----//		\\----
---//		 \\---
--//		  \\--
--\\ Settings //--
local defaultSex = "male" -- Set the default sex (Can be "male" or "female")
-- Please note that any of the timers below are in milliseconds (ms)
local skinCamTimer = 100 -- Timer to switch the camera to the selected skin (Change to a higher value if the camera doesn't switch to the Ped Selection Screen)
local playerCamTimer = 100 -- Timer to switch the camera back to the player (Change to a higher value if the camera doesn't switch back to the player)
local setSkinTimer = 50 -- Timer to override any skin change done by other scripts (Change to a higher value if the player's skin doesn't change)
-- Scroll settings
local autoScrollStart = 200 -- Set the time it takes in ms to enable auto scroll when holding down your arrow keys (cannot be lower than 50)
local autoScrollSpeed = 80 -- Set the time it takes in ms to switch between skins when holding down your arrow keys (cannot be lower than 50)
--//		  \\--
--\\		  //--
---\\        //---
----\\      //----
-----\\    //-----
------\\  //------
-------\\//-------
--------**--------

local sWidth,sHeight = guiGetScreenSize()
local origWidth,origHeight = 1280,960
local isScreenVisible = false
local skinRequested = false
local font0_font = guiCreateFont("font/Times.ttf", 19)

function text(text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI)
	dxDrawText(text, x/origWidth*sWidth+1.5, y/origHeight*sHeight+1.5, w/origWidth*sWidth+1.5, h/origHeight*sHeight+1.5, tocolor(0,0,0,255), scale/origWidth*sWidth, font, alignX, alignY, clip, wordBreak, postGUI)
	dxDrawText(text, x/origWidth*sWidth, y/origHeight*sHeight, w/origWidth*sWidth, h/origHeight*sHeight, color, scale/origWidth*sWidth, font, alignX, alignY, clip, wordBreak, postGUI)
end

function image(x, y, w, h, image, rotation, rotationCenterOffsetX, rotationCenterOffsetY, color, postGUI)
	dxDrawImage(x/origWidth*sWidth, y/origHeight*sHeight, w/origWidth*sWidth, h/origHeight*sHeight, image, rotation, rotationCenterOffsetX, rotationCenterOffsetY, color, postGUI)
end

function mainScreen()
	dxDrawImage(0,0,sWidth,sHeight,"img/bg.png",0,0,0,tocolor(255,255,255,255),true)
	text("Entekhabe Shakhsiat", 127, 29, 610, 136, tocolor(255, 255,255, 255), 3.00, "bankgothic", "left", "top", false, false, true, false, false)
	text("Skin: "..selectedSkin.."/"..totalSkins, 340, 190, 440, 249, tocolor(133 , 145 , 161, 250), 2.50, "default", "left", "top", false, false, true, false, false)	
	text("Ba Felesh Haye Chap & Rast Skin Entekhab Konid. Ba Dokme [Enter] Skin Khod Ra Set Konid.\n Baraye Bastan Az Dokme [Space] Estefade Konid.", 250, 837, 1042, 875, tocolor(255, 255, 255, 255), 2.00, "clear", "center", "center", false, false, true, false, false)
	image(473, 419, 96, 140, "img/arrow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	image(767.75, 419, 96, 140, "img/arrow.png", 180, 0, 0, tocolor(255, 255, 255, 255), true)
	image(90, 207, 145, 155, "img/male.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	image(90, 450, 145, 155, "img/female.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end


function prevArrowBlink()
	image(473, 419, 96, 140, "img/arrow-blink.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end
function nextArrowBlink()
	image(767.75, 419, 96, 140, "img/arrow-blink.png", 180, 0, 0, tocolor(255, 255, 255, 255), true)
end
function maleActivated()
	image(90, 207, 145, 155, "img/male-active.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

function femaleActivated()
	image(90, 450, 145, 155, "img/female-active.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end


--> Set Timer Baraye Text Error <--
addEvent("pbashid",true)
addEventHandler("pbashid",getLocalPlayer(),
function ( source )
	guiSetVisible ( premiumeror, false )
	premiumeror = guiCreateLabel(565, 360, 410, 100, "Need Gold Premium", false)
	guiSetFont(premiumeror, font0_font)
	guiLabelSetColor(premiumeror, 255, 0, 0)
	setTimer ( CountdownEnd, 2500, 1 )
end)
function CountdownEnd ( source )
	guiSetVisible ( premiumeror, false )
end

local prevButtonClickable = guiCreateStaticImage(0.36, 0.44, 0.08, 0.15, "img/transparent.png", true)
local nextButtonClickable = guiCreateStaticImage(0.62, 0.44, 0.07, 0.15, "img/transparent.png", true)
local maleButtonClickable = guiCreateStaticImage(0.06, 0.21, 0.11, 0.14, "img/transparent.png", true)
local femaleButtonClickable = guiCreateStaticImage(0.06, 0.50, 0.10, 0.14, "img/transparent.png", true)
function showClickables(isScreenVisible)
	guiSetVisible(prevButtonClickable,isScreenVisible)
	guiSetVisible(nextButtonClickable,isScreenVisible)
	guiSetVisible(maleButtonClickable,isScreenVisible)
	guiSetVisible(femaleButtonClickable,isScreenVisible)
end
showClickables(isScreenVisible)

function toggleScreen()
	if isScreenVisible then
		closeScreen()
	else
		addEventHandler("onClientRender",root,mainScreen)
		if defaultSex == "male" then
			addEventHandler("onClientRender",root,maleActivated)
		elseif defaultSex == "female" then
			addEventHandler("onClientRender",root,femaleActivated)
		end

		isScreenVisible = true
		showClickables(isScreenVisible)
		showCursor(true)
		setTimer(function()showChat(false)end,200,1)
		--showPlayerHudComponent ( "radar", false )
		bindKey("enter","down",changePlayerSkin)
	end
end

function closeScreen()
	firstTime = false
	setTimer(function()setCameraTarget(localPlayer)end,playerCamTimer,1)
	triggerServerEvent("setElemDimen",localPlayer,localPlayer,0)
	removeEventHandler("onClientRender",root,mainScreen)
	removeEventHandler("onClientRender",root,femaleActivated)
	removeEventHandler("onClientRender",root,maleActivated)
	isScreenVisible = false
	triggerServerEvent("setElemFrozen",localPlayer,localPlayer,false)
	showClickables(isScreenVisible)
	showCursor(false)
	setTimer(function()showChat(true)end,200,1)
	--showPlayerHudComponent ( "radar", false )
	unbindKey("enter","down",changePlayerSkin)
	unbindKey('B', 'down', closeScreen)
	unbindKey('Space', 'down', closeScreen)
	stopSound( sound2 )
	guiSetVisible ( premiumeror, false )
	
end
addEvent("BasteShePanelSkin",true)
addEventHandler("BasteShePanelSkin", getRootElement(), closeScreen)


function onSpawn(firstTime)
	if skinRequested == true or firstTime == true then
		toggleScreen()
		triggerServerEvent("setElemDimen",localPlayer,localPlayer,2)
		triggerServerEvent("setElemInterior",localPlayer,localPlayer,14)
		triggerServerEvent("setElemFrozen",localPlayer,localPlayer,true)
		setTimer(function()setCameraMatrix(208.380859375 ,-154.7802734375 ,1000.5234375, 218.5 ,-156.3779296875 ,1000.5)end,skinCamTimer,1)
	elseif firstTime == true then
		addEventHandler("onClientPlayerSpawn",localPlayer,onSpawn)
	end
	firstTime = false
	bindKey('B', 'down', closeScreen)
	bindKey('Space', 'down', closeScreen)
	sound2 = playSound("sound/start.mp3")
	setSoundVolume(sound2,0.5)
end
addEvent("onJoin",true)
addEventHandler("onJoin",root,onSpawn)


function requestSkinChange()
	if skinRequested == false then
		skinRequested = true
	end
end
addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), requestSkinChange )

function changePlayerSkin()
	local ID = getSelectedSkinID()
	--toggleScreen()
	setPlayerTheirSkin()
	skinChosen = true
	triggerServerEvent("setElemFrozen",localPlayer,localPlayer,false)
	removeEventHandler("onClientPlayerSpawn",localPlayer,onSpawn)
end

function BasteShe()
	toggleScreen()
end
addEvent("BasteShe",true)
addEventHandler("BasteShe",root,BasteShe)


function setChosenSkinOnSpawn()
	if skinChosen == true then
		setTimer(function()setPlayerTheirSkin()end,50,1)
	end
end
--addEventHandler("onClientPlayerSpawn",localPlayer,setChosenSkinOnSpawn)

local ped = createPed(0,213.53125 ,-156.037109375 ,1000.5234375,50.0041198)



setElementDimension(ped,2)
setElementInterior(ped,14)
local tune = playSFX3D("radio","Ambience",11,960.05999755859, -1265.2800292969, 21.440000534058,true)
setSoundVolume(tune,1)
setSoundMaxDistance(tune,50)
setElementDimension(tune,2)
setElementInterior(tune,14)
function getSelectedSkinID()
	local ID = skinTable[selectedSkin]
	return ID
end

function setMenuPedSkin()
	local ID = getSelectedSkinID()
	setElementModel(ped,ID)
end

function changeSex(sex)
	if source == maleButtonClickable or sex == "male" then
		defaultSex = "male"
		setPedAnimation(ped,"DANCING","dnce_M_c",_,_,false,false,_)
		skinTable = maleSkins
		totalSkins = #skinTable
		selectedSkin = 1
		setMenuPedSkin()
		if isScreenVisible then
			removeEventHandler("onClientRender",root,femaleActivated)
			addEventHandler("onClientRender",root,maleActivated)
		end
	elseif source == femaleButtonClickable or sex == "female" then
		defaultSex = "female"
		setPedAnimation(ped,"DANCING","dnce_M_d",_,_,false,false,_)
		skinTable = femaleSkins
		totalSkins = #skinTable
		selectedSkin = 1
		setMenuPedSkin()
		if isScreenVisible then
			removeEventHandler("onClientRender",root,maleActivated)
			addEventHandler("onClientRender",root,femaleActivated)
		end
	end
end
addEventHandler("onClientGUIClick",resourceRoot,changeSex)
changeSex(defaultSex)

function selectNextSkin()
	if selectedSkin == totalSkins then
		selectedSkin = 1
	else
		selectedSkin = selectedSkin+1
	end
end

function selectPrevSkin()
	if selectedSkin == 1 then
		selectedSkin = totalSkins
	else
		selectedSkin = selectedSkin-1
	end
end

function setPlayerTheirSkin()
	local ID = getSelectedSkinID()
	setTimer(function()triggerServerEvent("changePlayerSkin",localPlayer,ID,selectedSkin)end,setSkinTimer,1)
end

-- Button prev <
local renderprev = true
function prevPedButton()
	if isScreenVisible then
		sound = playSound("sound/scroll.mp3")
		setSoundVolume(sound,0.4)
		if renderprev == true then addEventHandler("onClientRender",root,prevArrowBlink) renderprev = false end
		setTimer(function()removeEventHandler("onClientRender",root,prevArrowBlink) renderprev = true end,50,1)
		selectPrevSkin()
		setMenuPedSkin()
	end
end
addEventHandler("onClientGUIClick",prevButtonClickable,prevPedButton,false)
bindKey("arrow_l","down",prevPedButton)

-- Button next >
local rendernext = true
function nextPedButton()
	if isScreenVisible then
		sound = playSound("scroll.mp3")
		setSoundVolume(sound,0.4)
		if rendernext == true then addEventHandler("onClientRender",root,nextArrowBlink) rendernext = false end
		setTimer(function()removeEventHandler("onClientRender",root,nextArrowBlink) rendernext = true end,50,1)
		selectNextSkin()
		setMenuPedSkin()
	end
end
addEventHandler("onClientGUIClick",nextButtonClickable,nextPedButton,false)
bindKey("arrow_r","down",nextPedButton)

-- Scroll functions
function nextPed_scroll()
	timernext = setTimer(
		function()
			timernext2 = setTimer(
				function()
					nextPedButton()
				end
			,autoScrollSpeed,0)
		end
	,autoScrollStart,1)
end
bindKey("arrow_r","down",nextPed_scroll)

function prevPed_scroll()
	timerprev = setTimer(
		function()
			timerprev2 = setTimer(
				function()
					prevPedButton()
				end
			,autoScrollSpeed,0)
		end
	,autoScrollStart,1)
end
bindKey("arrow_l","down",prevPed_scroll)

function killAutoScroll_next()
	if isTimer(timerprev) then
		killTimer(timerprev)
	elseif isTimer(timerprev2) then
		killTimer(timerprev2)
	end
end
bindKey("arrow_l","up",killAutoScroll_next)

function killAutoScroll_prev()
	if isTimer(timernext) then
		killTimer(timernext)
	elseif isTimer(timernext2) then
		killTimer(timernext2)
	end
end
bindKey("arrow_r","up",killAutoScroll_prev)


--> Ped <--

skinshopped = createPed( 233, 204.2060546875 ,-157.66 ,1000.5)
setElementRotation ( skinshopped, 0 ,0 ,179.5166015625 )
setElementInterior ( skinshopped, 14 )
setElementFrozen(skinshopped, true)


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", skinshopped, cancelPedDamage)


function gunnpc()
	setTimer ( function()
		setPedAnimation(skinshopped,"BAR","Barserve_loop",1,true,false)
		
	end, 1000, 0 )
end
gunnpc()



createBlip ( 461.69921875 ,-1500.77734375 ,31.045585632324, 45 )