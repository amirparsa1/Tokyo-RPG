local screenW, screenH = guiGetScreenSize()
local miniX, miniY = (screenW/1360), (screenH/768)

min, max, cos, sin, rad, deg, atan2 = math.min, math.max, math.cos, math.sin, math.rad, math.deg, math.atan2
sqrt, abs, floor, ceil, random = math.sqrt, math.abs, math.floor, math.ceil, math.random
gsub = string.gsub
screenW, screenH = guiGetScreenSize()
x , y = guiGetScreenSize()
reMap = function(value, low1, high1, low2, high2)
	return low2 + (value - low1) * (high2 - low2) / (high1 - low1)
end

responsiveMultiplier = math.min(1, reMap(screenW, 1024, 1920, 0.75, 1))

resp = function(value)
	return value * responsiveMultiplier
end

respc = function(value)
	return ceil(value * responsiveMultiplier)
end

deepcopy = function(original)
	local copy

	if type(original) == "table" then
		copy = {}

		for k, v in next, original, nil do
			copy[deepcopy(k)] = deepcopy(v)
		end

		setmetatable(copy, deepcopy(getmetatable(original)))
	else
		copy = original
	end

	return copy
end

local function rotateAround(angle, x, y)
	angle = math.rad(angle)
	local cosinus, sinus = math.cos(angle), math.sin(angle)
	return x * cosinus - y * sinus, x * sinus + y * cosinus
end



local mapTextureSize = 3072
local mapRatio = 6000 / mapTextureSize

local minimapPosX = 0
local minimapPosY = 0
local minimapWidth = respc(320)
local minimapHeight = respc(225)
local minimapCenterX = minimapPosX + minimapWidth / 2
local minimapCenterY = minimapPosY + minimapHeight / 2
local minimapRenderSize = 400
local minimapRenderHalfSize = minimapRenderSize * 0.5
local minimapRender = dxCreateRenderTarget(minimapRenderSize, minimapRenderSize)
local playerMinimapZoom = 0.4 --Default: 0.5
local minimapZoom = playerMinimapZoom
local minimapIsVisible = false

local bigmapPosX = 0
local bigmapPosY = 0
local bigmapWidth = screenW
local bigmapHeight = screenH
local bigmapCenterX = bigmapPosX + bigmapWidth / 2
local bigmapCenterY = bigmapPosY + bigmapHeight / 2
local bigmapZoom = 0.28
local bigmapIsVisible = false

local lastCursorPos = false
local mapDifferencePos = false
local mapMovedPos = false
local lastDifferencePos = false
local mapIsMoving = false
local lastMapPosX, lastMapPosY = 0, 0
local mapPlayerPosX, mapPlayerPosY = 0, 0

local zoneLineHeight = respc(30)
local screenSource = dxCreateScreenSource(screenW, screenH)

local gpsLineWidth = respc(60)
local gpsLineIconSize = respc(40)
local gpsLineIconHalfSize = gpsLineIconSize / 2
local createdTextures = {}

settingsStorage = {
	show3DBlips = true,
}

createdFonts = {}

createdBlips = {}




local blipTooltips = {
	["blips/0.png"] = "چک پوینت",
	["blips/1.png"] = "چک پوینت",
	["blips/2.png"] = "مکان من",
	["blips/3.png"] = "خودتان",
	["blips/4.png"] = "رویداد ایردراپ",
	["blips/5.png"] = "فرودگاه",
	["blips/6.png"] = "اسلحه فروشی",
	["blips/7.png"] = "دادگستری",
	["blips/8.png"] = "فروشگاه قایق",
	["blips/9.png"] = "مواد فروشی",
	["blips/10.png"] = "مسجد",
	["blips/11.png"] = "رویداد کشتی",
	["blips/12.png"] = "میانر روم",
	["blips/13.png"] = "شهروند",
	["blips/14.png"] = "مکان اتش گرفته",
	["blips/15.png"] = "سی جی",
	["blips/16.png"] = "سیف باکس",
	["blips/17.png"] = "کلید",
	["blips/18.png"] = "اسحه فروشی",
	["blips/19.png"] = "پرچم",
	["blips/20.png"] = "حرکت به این سمت",
	["blips/21.png"] = "افزایش دهنده هیل",
	["blips/22.png"] = "بیمارستان",
	["blips/23.png"] = "خرید و فروش متریال",
	["blips/24.png"] = "اموزشگاه",
	["blips/25.png"] = "کریپتو فارم",
	["blips/26.png"] = "بنگاه معامله قایق",
	["blips/27.png"] = "مکانیکی آذری",
	["blips/28.png"] = "بنگاه فروش ماشین لوکس",
	["blips/29.png"] = "ازمایشگاه",
	["blips/30.png"] = "اداره پلیس",
	["blips/31.png"] = "نمد",
	["blips/32.png"] = "کریپتوفارم",
	["blips/33.png"] = "پینتبال",
	["blips/34.png"] = "رویداد کامپیون",
	["blips/35.png"] = "مکان خانه ی شما",
	["blips/36.png"] = "صرافی",
	["blips/37.png"] = "نامشخص",
	["blips/38.png"] = "تحویل شوتی",
	["blips/39.png"] = "اداره پلیس",
	["blips/40.png"] = "ابزار فروشی",
	["blips/41.png"] = "مکان مارک شده",
	["blips/42.png"] = "فروشگاه",
	["blips/43.png"] = "کوره سنگ پزی",
	["blips/44.png"] = "بنگاه دوچرخه و موتور",
	["blips/45.png"] = "اسکین شاپ",
	["blips/46.png"] = "بنگاه ماشین",
	["blips/47.png"] = "بنگاه ماشین",
	["blips/48.png"] = "سنجاق",
	["blips/49.png"] = "کلاب",
	["blips/50.png"] = "رستوران",
	["blips/51.png"] = "بیمارستان",
	["blips/52.png"] = "بانکداری دنایت",
	["blips/53.png"] = "تحویل شوتی",
	["blips/54.png"] = "فروش بالگرد",
	["blips/55.png"] = "بنگاه ماشین",
	["blips/56.png"] = "",
	["blips/57.png"] = "",
	["blips/58.png"] = "قصابی",
	["blips/59.png"] = "غواصی",
	["blips/60.png"] = "رویداد کیف پول",
	["blips/61.png"] = "رویداد کیف پول",
	["blips/62.png"] = "اموزشگاه",
	["blips/63.png"] = "اسپری",

}

local visibleBlipTooltip = false
local hoveredWaypointBlip = false

local farshowBlips = {}
local farshowBlipsData = {}

local gpsLines = {}
local gpsRouteImage = false
local gpsRouteImageData = {}


local playerCanSeePlayers = false

local getZoneNameEx = getZoneName
function getZoneName(x, y, z, citiesonly)
	local zoneName = getZoneNameEx(x, y, z, citiesonly)
	if zoneName == "Greenglass College" then
		return "Las Venturas City Hall"
	else
		return zoneName
	end
end

function getTexture(name)
	if createdTextures[name] then
		return createdTextures[name]
	end

	return false
end



local textura = dxCreateTexture("radar/files/map.png")

addEventHandler("onClientResourceStart", getResourceRootElement(),
	function ()
    createdTextures = {
			minimapMap = textura,
			bigmapMap = textura,
		}
		if getTexture("minimapMap") then
			dxSetTextureEdge(getTexture("minimapMap"), "border", BGcoloR)
		end

		if getTexture("bigmapMap") then
			dxSetTextureEdge(getTexture("bigmapMap"), "border",BGcoloR)
		end

		for k,v in ipairs(getElementsByType("blip")) do
			blipTooltips[v] = getElementData(v, "tooltipText")
			x,y,z = getElementPosition(v)
			if getElementData(v,"exclusiveBlip") == true then
				createCustomBlip(x,y,z,"blips/"..getBlipIcon( v )..".png",true)
			else
				createCustomBlip(x,y,z,"blips/"..getBlipIcon( v )..".png",false)
			end
		end


	end
)

local shouldRenderMinimap = true






function togglehud()

        renderTheBigmap()
    
    mapWidth = miniX*213
    mapHeight = miniY*141
    mapX = miniX*26
    mapY = miniY*604
    if shouldRenderMinimap then
        renderMinimap(mapX, mapY, mapWidth, mapHeight)
    end
end

addEventHandler("onClientRender", getRootElement(), togglehud)

function miniMapStatus(CMD, bool)
	if tostring(bool) == "true" then
		if not isEventHandlerAdded("onClientRender", getRootElement(), togglehud) then
			addEventHandler("onClientRender", getRootElement(), togglehud)
		end
	elseif tostring(bool) == "false" then
		if isEventHandlerAdded("onClientRender", getRootElement(), togglehud) then
			removeEventHandler("onClientRender", getRootElement(), togglehud)
		end
	end
end
addCommandHandler("minimap", miniMapStatus)

function renderMinimap(x, y, w, h)
	toggleControl("radar", false)
	if bigmapIsVisible or not minimapIsVisible then
		return
	end
	if getElementInterior(getLocalPlayer()) ~= 0 then
		return
	end
	minimapWidth = w
	minimapHeight = h

	if (minimapWidth > respc(445) or minimapHeight > respc(400)) and minimapRenderSize < 800 then
		minimapRenderSize = 800
		minimapRenderHalfSize = minimapRenderSize * 0.5
		destroyElement(minimapRender)
		minimapRender = dxCreateRenderTarget(minimapRenderSize, minimapRenderSize)
	end
	if minimapWidth <= respc(445) and minimapHeight <= respc(400) and minimapRenderSize > 600 then
		minimapRenderSize = 600
		minimapRenderHalfSize = minimapRenderSize * 0.5
		destroyElement(minimapRender)
		minimapRender = dxCreateRenderTarget(minimapRenderSize, minimapRenderSize)
	end
	if (minimapWidth > respc(325) or minimapHeight > respc(235)) and minimapRenderSize < 600 then
		minimapRenderSize = 600
		minimapRenderHalfSize = minimapRenderSize * 0.5
		destroyElement(minimapRender)
		minimapRender = dxCreateRenderTarget(minimapRenderSize, minimapRenderSize)
	end
	if minimapWidth <= respc(325) and minimapHeight <= respc(235) and minimapRenderSize > 400 then
		minimapRenderSize = 400
		minimapRenderHalfSize = minimapRenderSize * 0.5
		destroyElement(minimapRender)
		minimapRender = dxCreateRenderTarget(minimapRenderSize, minimapRenderSize)
	end

	if minimapPosX ~= x or minimapPosY ~= y then
		minimapPosX = x
		minimapPosY = y
	end
	
	minimapCenterX = minimapPosX + minimapWidth / 2
	minimapCenterY = minimapPosY + minimapHeight / 2

	dxUpdateScreenSource(screenSource, true)
	local playerPosX, playerPosY, playerPosZ = getElementPosition(localPlayer)
	local playerDimension = getElementDimension(localPlayer)
	local cameraX, cameraY, _, faceTowardX, faceTowardY = getCameraMatrix()
	local cameraRotation = deg(atan2(faceTowardY - cameraY, faceTowardX - cameraX)) + 360 + 90

	local minimapRenderSizeOffset = respc(minimapRenderSize * 0.75)

	farshowBlips = {}
	farshowBlipsData = {}
	
	if playerDimension == 0 or playerDimension == 65000 or playerDimension == 33333 then
		local remapPlayerPosX, remapPlayerPosY = remapTheFirstWay(playerPosX), remapTheFirstWay(playerPosY)
		local farBlips = {}
		local farBlipsCount = 10000
		local manualBlipsCount = 1
		local defaultBlipsCount = 1

		dxSetRenderTarget(minimapRender)
		dxDrawImageSection(0, 0, minimapRenderSize, minimapRenderSize, remapTheSecondWay(playerPosX) - minimapRenderSize / minimapZoom / 2, remapTheFirstWay(playerPosY) - minimapRenderSize / minimapZoom / 2, minimapRenderSize / minimapZoom, minimapRenderSize / minimapZoom, getTexture("minimapMap"))

		if gpsRouteImage then
			dxDrawImage(minimapRenderSize / 2 + (remapTheFirstWay(playerPosX) - (gpsRouteImageData[1] + gpsRouteImageData[3] / 2)) * minimapZoom - gpsRouteImageData[3] * minimapZoom / 2, minimapRenderSize / 2 - (remapTheFirstWay(playerPosY) - (gpsRouteImageData[2] + gpsRouteImageData[4] / 2)) * minimapZoom + gpsRouteImageData[4] * minimapZoom / 2, gpsRouteImageData[3] * minimapZoom, -(gpsRouteImageData[4] * minimapZoom), gpsRouteImage, 180, 0, 0, tocolor(0,255,200))
		end

		for k,v in ipairs(getElementsByType("blip")) do
			x,y,z = getElementPosition(v)
			if getElementData(v,"exclusiveBlip") == true then
				renderBlip("blips/"..getBlipIcon( v )..".png", x,y, remapPlayerPosX, remapPlayerPosY, 27, 27, -1, cameraRotation,true, v)
			else
				renderBlip("blips/"..getBlipIcon( v )..".png", x,y, remapPlayerPosX, remapPlayerPosY, 27, 27, -1, cameraRotation,false, v)
			end
			manualBlipsCount = manualBlipsCount + 1
		end
		dxSetRenderTarget()
		dxDrawImage(minimapPosX - minimapRenderSize / 2 + minimapWidth / 2, minimapPosY - minimapRenderSize / 2 + minimapHeight / 2, minimapRenderSize, minimapRenderSize, minimapRender, cameraRotation - 180)

		for k in pairs(farshowBlips) do
			if createdBlips[k] then
				dxDrawImage(farshowBlipsData[k].posX, farshowBlipsData[k].posY, createdBlips[k].iconSize, createdBlips[k].iconSize, "radar/files/" .. createdBlips[k].icon, 0, 0, 0, farshowBlipsData[k].color)
			else
				table.insert(farBlips, k)
			end
		end

		for i = 1, #farBlips do
			if farshowBlipsData[farBlips[i]] then
				dxDrawImage(farshowBlipsData[farBlips[i]].posX, farshowBlipsData[farBlips[i]].posY, farshowBlipsData[farBlips[i]].iconWidth, farshowBlipsData[farBlips[i]].iconHeight, "radar/files/" .. farshowBlipsData[farBlips[i]].icon, 0, 0, 0, farshowBlipsData[farBlips[i]].color)
			end
		end
	end

	dxDrawImageSection(minimapPosX - minimapRenderSizeOffset, minimapPosY - minimapRenderSizeOffset, minimapWidth + minimapRenderSizeOffset * 2, minimapRenderSizeOffset, minimapPosX - minimapRenderSizeOffset, minimapPosY - minimapRenderSizeOffset, minimapWidth + minimapRenderSizeOffset * 2, minimapRenderSizeOffset, screenSource)
	dxDrawImageSection(minimapPosX - minimapRenderSizeOffset, minimapPosY + minimapHeight, minimapWidth + minimapRenderSizeOffset * 2, minimapRenderSizeOffset, minimapPosX - minimapRenderSizeOffset, minimapPosY + minimapHeight, minimapWidth + minimapRenderSizeOffset * 2, minimapRenderSizeOffset, screenSource)
	dxDrawImageSection(minimapPosX - minimapRenderSizeOffset, minimapPosY, minimapRenderSizeOffset, minimapHeight, minimapPosX - minimapRenderSizeOffset, minimapPosY, minimapRenderSizeOffset, minimapHeight, screenSource)
	dxDrawImageSection(minimapPosX + minimapWidth, minimapPosY, minimapRenderSizeOffset, minimapHeight, minimapPosX + minimapWidth, minimapPosY, minimapRenderSizeOffset, minimapHeight, screenSource)

	if playerDimension == 0 then
		local playerArrowSize = 60 / (4 - minimapZoom) + 3
		local playerArrowHalfSize = playerArrowSize / 2
		local _, _, playerRotation = getElementRotation(localPlayer)
        
		dxDrawImage(minimapCenterX - playerArrowHalfSize, minimapCenterY - playerArrowHalfSize, playerArrowSize, playerArrowSize, "radar/files/blips/2.png", abs(360 - playerRotation) + (cameraRotation - 180))

	else
		dxDrawRectangle(minimapPosX, minimapPosY, minimapWidth, minimapHeight, tocolor(0, 0, 0))

		if not lostSignalStartTick then
			lostSignalStartTick = getTickCount()
		end

		local fadeAlpha = 255
		if not lostSignalFadeIn then
			fadeAlpha = 255
		else
			fadeAlpha = 0
		end

		local lostSignalTick = (getTickCount() - lostSignalStartTick) / 1500
		if lostSignalTick > 1 then
			lostSignalStartTick = getTickCount()
			lostSignalFadeIn = not lostSignalFadeIn
		end

		dxDrawImage(minimapCenterX - 32, minimapCenterY - 32 - 16, 64, 64, "radar/files/gpslosticon.png", 0, 0, 0, tocolor(255, 255, 255, interpolateBetween(fadeAlpha, 0, 0, 255 - fadeAlpha, 0, 0, lostSignalTick, "Linear")))
		dxDrawImage(minimapCenterX - 128, minimapCenterY + 16 + 8, 256, 16, "radar/files/gpslosttext.png")
		dxDrawImage(minimapPosX + minimapWidth - 64, minimapPosY, 64, 16, "radar/files/nosignaltext.png")
	end


end

function renderTheBigmap()
	if not bigmapIsVisible then
		return
	end

	if hoveredWaypointBlip then
		hoveredWaypointBlip = false
	end

	if hover3DBlipCb then
		hover3DBlipCb = false
	end

	if getElementDimension(localPlayer) == 0 then
		local playerPosX, playerPosY, playerPosZ = getElementPosition(localPlayer)

		cursorX, cursorY = getHudCursorPos()
		if cursorX and cursorY then
			cursorX, cursorY = cursorX * screenW, cursorY * screenH
		end

		dxDrawImageSection(bigmapPosX, bigmapPosY, bigmapWidth, bigmapHeight, remapTheSecondWay(mapPlayerPosX) - bigmapWidth / bigmapZoom / 2, remapTheFirstWay(mapPlayerPosY) - bigmapHeight / bigmapZoom / 2, bigmapWidth / bigmapZoom, bigmapHeight / bigmapZoom, getTexture("bigmapMap"))

		local radarareas = getElementsByType("radararea")
		if #radarareas > 0 then
			local zoneTick = abs(getTickCount() % 1000 - 500)
			local aFactor = zoneTick / 500
	
			for k, v in ipairs(radarareas) do
				local x, y = getElementPosition(v)
				local sx, sy = getRadarAreaSize(v)
				local r, g, b, a = getRadarAreaColor(v)
				local flashing = isRadarAreaFlashing(v)
				if flashing then
					a = a * aFactor
				end
	
				drawZone(x, y, sx, sy, r, g, b, a, mapPlayerPosX, mapPlayerPosY)
			end
		end

		for k,v in ipairs(getElementsByType("blip")) do
			blipTooltips[v] = getElementData(v, "tooltipText")
			x,y,z = getElementPosition(v)
			renderBigBlip("blips/"..getBlipIcon( v )..".png", x,y, mapPlayerPosX, mapPlayerPosY, 9999, 22, 22, -1, false, v, playerRotation)
		end
		
		for i = 1, #createdBlips do
			if createdBlips[i] then
				

			end
		end


		renderBigBlip("blips/2.png", playerPosX, playerPosY, mapPlayerPosX, mapPlayerPosY, false, 20, 20)

		if cursorX and cursorY then
			if visibleBlipTooltip then
				dxDrawRoundedRectangle(cursorX + respc(12.5), cursorY, dxGetTextWidth(visibleBlipTooltip, 0.75, theFont) + respc(10), respc(25), tocolor(50, 50, 50, 255), false, false, 3)
				dxDrawText(visibleBlipTooltip, cursorX + respc(12.5), cursorY, cursorX + (dxGetTextWidth(visibleBlipTooltip, 0.75, theFont) + respc(10)) + respc(12.5), cursorY + respc(25), 0xFFFFFFFF, 0.75, theFont, "center", "center")
			end
		end

		if visibleBlipTooltip then
			visibleBlipTooltip = false
		end
	else
		dxDrawRectangle(bigmapPosX, bigmapPosY, bigmapWidth, bigmapHeight, tocolor(0, 0, 0))
		dxDrawImage(bigmapCenterX - 32, bigmapCenterY - 32 - 16, 64, 64, "radar/files/gpslosticon.png")
		dxDrawImage(bigmapCenterX - 128, bigmapCenterY + 16 + 8, 256, 16, "radar/files/gpslosttext.png")
		dxDrawImage(bigmapPosX + bigmapWidth - 64, bigmapPosY, 64, 16, "radar/files/nosignaltext.png")
	end
end

function showTotalMap()


		if isEventHandlerAdded("onClientRender", getRootElement(), togglehud) then
			bigmapIsVisible = not bigmapIsVisible
			setElementData(localPlayer, "bigmapIsVisible", bigmapIsVisible, false)
			if bigmapIsVisible then
				playSound("radar/files/f11radaropen.mp3")
				executeCommandHandler("toghud")
				showChat(false)
				showCursor(true)
			--	hideHUD()
				setElementData(localPlayer, "enableall", false)

			else
				playSound("radar/files/f11radarclose.mp3")
				--showHUD()
				executeCommandHandler("toghud")
				showChat(true)
				showCursor(false)
				setElementData(localPlayer, "enableall", true)
			
			end
		end
		cancelEvent()
	
end
bindKey ( "f11", "up", showTotalMap)


addEventHandler("onClientClick", getRootElement(),
	function (button, state, cursorX, cursorY)

			if not bigmapIsVisible then
				return
			end
			if button == "left" then
				local gpsRouteProcess = false
				if not gpsRouteProcess then
					if state == "up" then
						if hoveredWaypointBlip then
							table.remove(createdBlips, hoveredWaypointBlip)
						else
							if markblip then
								destroyElement(markblip)
								markblip = nil
							else
								local blipPosX = reMap((cursorX - bigmapPosX) / bigmapZoom + (remapTheSecondWay(mapPlayerPosX) - bigmapWidth / bigmapZoom / 2), 0, mapTextureSize, -3000, 3000)
								local blipPosY = reMap((cursorY - bigmapPosY) / bigmapZoom + (remapTheFirstWay(mapPlayerPosY) - bigmapHeight / bigmapZoom / 2), 0, mapTextureSize, 3000, -3000)
								local blipPosZ = getGroundPosition(blipPosX, blipPosY, 400) + 3

								markblip = createBlip(blipPosX, blipPosY, blipPosZ,41)
								setElementData(markblip, "exclusiveBlip", true)
							end
						end
					end
				end
			end
		
	end
)

addEventHandler("onClientRestore", getRootElement(),
	function ()
		if gpsRoute then
			processGPSLines()
		end
	end
)

function renderBlip(icon, blipX, blipY, playerPosX, playerPosY, blipWidth, blipHeight, blipColor, cameraRotation, farShow, blipTableId)
	local blipPosX = minimapRenderHalfSize + (playerPosX - remapTheFirstWay(blipX)) * minimapZoom
	local blipPosY = minimapRenderHalfSize - (playerPosY - remapTheFirstWay(blipY)) * minimapZoom

	if not farShow and (blipPosX > minimapRenderSize or 0 > blipPosX or blipPosY > minimapRenderSize or 0 > blipPosY) then
		return
	end

	local blipIsVisible = true
	if farShow then
		if blipPosX > minimapRenderSize then
			blipPosX = minimapRenderSize
		end
		if blipPosX < 0 then
			blipPosX = 0
		end
		if blipPosY > minimapRenderSize then
			blipPosY = minimapRenderSize
		end
		if blipPosY < 0 then
			blipPosY = 0
		end

		local angle = rad((cameraRotation - 270) + 90)
		local cosinus, sinus = cos(angle), sin(angle)

		local blipScreenPosX = minimapPosX - minimapRenderHalfSize + minimapWidth / 2 + (minimapRenderHalfSize + cosinus * (blipPosX - minimapRenderHalfSize) - sinus * (blipPosY - minimapRenderHalfSize) - blipWidth / 2)
		local blipScreenPosY = minimapPosY - minimapRenderHalfSize + minimapHeight / 2 + (minimapRenderHalfSize + sinus * (blipPosX - minimapRenderHalfSize) + cosinus * (blipPosY - minimapRenderHalfSize) - blipHeight / 2)

		farshowBlips[blipTableId] = nil

		if blipScreenPosX < minimapPosX or blipScreenPosX > minimapPosX + minimapWidth - blipWidth then
			farshowBlips[blipTableId] = true
			blipIsVisible = false
		end

		if blipScreenPosY < minimapPosY or blipScreenPosY > minimapPosY + minimapHeight - blipHeight then
			farshowBlips[blipTableId] = true
			blipIsVisible = false
		end

		if farshowBlips[blipTableId] then
			farshowBlipsData[blipTableId] = {
				posX = max(minimapPosX, min(minimapPosX + minimapWidth - blipWidth, blipScreenPosX)),
				posY = max(minimapPosY, min(minimapPosY + minimapHeight - blipHeight, blipScreenPosY)),
				icon = icon,
				iconWidth = blipWidth,
				iconHeight = blipHeight,
				color = blipColor
			}
		end
	end

	if blipIsVisible then
		dxDrawImage(blipPosX - blipWidth / 2, blipPosY - blipHeight / 2, blipWidth, blipHeight, "radar/files/" .. icon, 180 - cameraRotation, 0, 0, blipColor)
	end
end


function renderBigBlip(icon, blipX, blipY, playerPosX, playerPosY, renderDistance, blipWidth, blipHeight, blipColor, blipElement, blipId)
	if renderDistance and getDistanceBetweenPoints2D(playerPosX, playerPosY, blipX, blipY) > renderDistance then
		return
	end

	blipWidth = (blipWidth / (4 - bigmapZoom) + 3) * 2.25
	blipHeight = (blipHeight / (4 - bigmapZoom) + 3) * 2.25

	local blipHalfWidth = blipWidth / 2
	local blipHalfHeight = blipHeight / 2

	blipX = max(bigmapPosX + blipHalfWidth, min(bigmapPosX + bigmapWidth - blipHalfWidth, bigmapCenterX + (remapTheFirstWay(playerPosX) - remapTheFirstWay(blipX)) * bigmapZoom))
	blipY = max(bigmapPosY + blipHalfHeight, min(bigmapPosY + bigmapHeight - blipHalfHeight - zoneLineHeight, bigmapCenterY - (remapTheFirstWay(playerPosY) - remapTheFirstWay(blipY)) * bigmapZoom))

	if icon == "arrow.png" then
		local _, _, playerRotation = getElementRotation(localPlayer)
		dxDrawImage(blipX - blipHalfWidth, blipY - blipHalfHeight, blipWidth, blipHeight, "radar/files/" .. icon, abs(360 - playerRotation))
	else
		dxDrawImage(blipX - blipHalfWidth, blipY - blipHalfHeight, blipWidth, blipHeight, "radar/files/" .. icon, 0, 0, 0, blipColor)
	end

	if cursorX and cursorY then
		if isElement(blipElement) then
			if isCursorWithinArea(cursorX, cursorY, blipX - blipHalfWidth, blipY - blipHalfHeight, blipWidth, blipHeight) then
				if blipTooltips[blipElement] then
					visibleBlipTooltip = blipTooltips[blipElement]
				elseif getElementType(blipElement) == "player" and playerCanSeePlayers then
					visibleBlipTooltip = string.gsub(string.gsub(getElementData(blipElement, "visibleName") or getPlayerName(blipElement), "#%x%x%x%x%x%x", ""), "_", " ") .. " (" .. getElementData(blipElement, "playerID") .. ")"
				end
			end
		else
			if blipTooltips[icon] and isCursorWithinArea(cursorX, cursorY, blipX - blipHalfWidth, blipY - blipHalfHeight, blipWidth, blipHeight) then
				visibleBlipTooltip = blipTooltips[icon]

				if icon == "blips/41.png" then
					hoveredWaypointBlip = blipId
				end
			end
		end
	end
end

function drawZone(x, y, sx, sy, r, g, b, a, mapPlayerPosX, mapPlayerPosY)
    local startX = (remapTheSecondWay(x) - remapTheSecondWay(mapPlayerPosX)) * bigmapZoom + bigmapWidth / 2
    local startY = (remapTheFirstWay(y) - remapTheFirstWay(mapPlayerPosY)) * bigmapZoom + bigmapHeight / 2
    local endX = (remapTheSecondWay(x + sx) - remapTheSecondWay(mapPlayerPosX)) * bigmapZoom + bigmapWidth / 2
    local endY = (remapTheFirstWay(y + sy) - remapTheFirstWay(mapPlayerPosY)) * bigmapZoom + bigmapHeight / 2
    dxDrawRectangle(startX, startY, endX - startX, endY - startY, tocolor(r, g, b, a))
end


function createCustomBlip(x, y, z, icon, farShow, visibleDistance, size, color, blipName)
	table.insert(createdBlips, {
		posX = x,
		posY = y,
		posZ = z,
		icon = icon,
		farShow = farShow,
		renderDistance = visibleDistance or 9999,
		iconSize = size or 22,
		color = color or tocolor(255, 255, 255),
		BlipName = blipName
	})
end

function deleteCustomBlip(count)
	if type(count) == "number" then
		table.remove(createdBlips, count)
	elseif type(count) == "string" then
		for i = #createdBlips, 1, -1 do
			if createdBlips[i].BlipName == count then
				table.remove(createdBlips, i)
			end
		end
	end
end

function remapTheFirstWay(coord)
	return (-coord + 3000) / mapRatio
end

function remapTheSecondWay(coord)
	return (coord + 3000) / mapRatio
end
function addGPSLine(x, y)
	table.insert(gpsLines, {remapTheFirstWay(x), remapTheFirstWay(y)})
end

function processGPSLines()
	local routeStartPosX, routeStartPosY = 99999, 99999
	local routeEndPosX, routeEndPosY = -99999, -99999

	for i = 1, #gpsLines do
		if gpsLines[i][1] < routeStartPosX then
			routeStartPosX = gpsLines[i][1]
		end

		if gpsLines[i][2] < routeStartPosY then
			routeStartPosY = gpsLines[i][2]
		end

		if gpsLines[i][1] > routeEndPosX then
			routeEndPosX = gpsLines[i][1]
		end

		if gpsLines[i][2] > routeEndPosY then
			routeEndPosY = gpsLines[i][2]
		end
	end

	local routeWidth = (routeEndPosX - routeStartPosX) + 16
	local routeHeight = (routeEndPosY - routeStartPosY) + 16

	if isElement(gpsRouteImage) then
		destroyElement(gpsRouteImage)
	end

	gpsRouteImage = dxCreateRenderTarget(routeWidth, routeHeight, true)
	gpsRouteImageData = {routeStartPosX - 8, routeStartPosY - 8, routeWidth, routeHeight}

	dxSetRenderTarget(gpsRouteImage)
	dxSetBlendMode("modulate_add")

	dxDrawImage(gpsLines[1][1] - routeStartPosX + 8 - 4, gpsLines[1][2] - routeStartPosY + 8 - 4, 8, 8, "radar/gps/images/dot.png")

	for i = 2, #gpsLines do
		if gpsLines[i - 1] then
			local startX = gpsLines[i][1] - routeStartPosX + 8
			local startY = gpsLines[i][2] - routeStartPosY + 8
			local endX = gpsLines[i - 1][1] - routeStartPosX + 8
			local endY = gpsLines[i - 1][2] - routeStartPosY + 8

			dxDrawImage(startX - 4, startY - 4, 8, 8, "radar/gps/images/dot.png")
			dxDrawLine(startX, startY, endX, endY, tocolor(255, 255, 255), 9)
		end
	end

	dxSetBlendMode("blend")
	dxSetRenderTarget()
end

function clearGPSRoute()
	gpsLines = {}

	if isElement(gpsRouteImage) then
		destroyElement(gpsRouteImage)
	end
	gpsRouteImage = false
end


function dxDrawInnerBorder(x, y, w, h, borderSize, borderColor, postGUI)
	borderSize = borderSize or 2
	borderColor = borderColor or tocolor(0, 0, 0, 255)

	dxDrawRectangle(x, y, w, borderSize, borderColor, postGUI)
	dxDrawRectangle(x, y + h - borderSize, w, borderSize, borderColor, postGUI)
	dxDrawRectangle(x, y + borderSize, borderSize, h - (borderSize * 2), borderColor, postGUI)
	dxDrawRectangle(x + w - borderSize, y + borderSize, borderSize, h - (borderSize * 2), borderColor, postGUI)
end

function dxDrawBorderedImageSection(x, y, w, h, ux, uy, uw, uh, path, rx, ry, rz, color, postGUI)
	dxDrawImageSection(x - 1, y - 1, w, h, ux, uy, uw, uh, path, rx, ry, rz, tocolor(0, 0, 0, 200), postGUI)
	dxDrawImageSection(x - 1, y + 1, w, h, ux, uy, uw, uh, path, rx, ry, rz, tocolor(0, 0, 0, 200), postGUI)
	dxDrawImageSection(x + 1, y - 1, w, h, ux, uy, uw, uh, path, rx, ry, rz, tocolor(0, 0, 0, 200), postGUI)
	dxDrawImageSection(x + 1, y + 1, w, h, ux, uy, uw, uh, path, rx, ry, rz, tocolor(0, 0, 0, 200), postGUI)
	dxDrawImageSection(x, y, w, h, ux, uy, uw, uh, path, rx, ry, rz, color, postGUI)
end

function dxDrawBorderedText(text, x, y, w, h, color, ...)
	local textWithoutHEX = gsub(text, "#%x%x%x%x%x%x", "")
	dxDrawText(textWithoutHEX, x - 1, y - 1, w - 1, h - 1, tocolor(0, 0, 0, 255), ...)
	dxDrawText(textWithoutHEX, x - 1, y + 1, w - 1, h + 1, tocolor(0, 0, 0, 255), ...)
	dxDrawText(textWithoutHEX, x + 1, y - 1, w + 1, h - 1, tocolor(0, 0, 0, 255), ...)
	dxDrawText(textWithoutHEX, x + 1, y + 1, w + 1, h + 1, tocolor(0, 0, 0, 255), ...)
	dxDrawText(text, x, y, w, h, color, ...)
end

function dxDrawRoundedRectangle(x, y, w, h, borderColor, bgColor, postGUI, radius)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(124, 0, 0, 200);
		end
		
		if (not bgColor) then
			bgColor = borderColor;
		end
		
		--> Border
		dxDrawRectangle(x+radius, y+radius, w-(radius*2), h-(radius*2), borderColor, postGUI)
		dxDrawCircle(x+radius, y+radius, radius, 180, 270, borderColor, borderColor, 16, 1, postGUI)
		dxDrawCircle(x+radius, (y+h)-radius, radius, 90, 180, borderColor, borderColor, 16, 1, postGUI)
		dxDrawCircle((x+w)-radius, (y+h)-radius, radius, 0, 90, borderColor, borderColor, 16, 1, postGUI)
		dxDrawCircle((x+w)-radius, y+radius, radius, 270, 360, borderColor, borderColor, 16, 1, postGUI)
		dxDrawRectangle(x, y+radius, radius, h-(radius*2), borderColor, postGUI, subPixelPositioning)
		dxDrawRectangle(x+radius, y+h-radius, w-(radius*2), radius, borderColor, postGUI)
		dxDrawRectangle(x+w-radius, y+radius, radius, h-(radius*2), borderColor, postGUI)
		dxDrawRectangle(x+radius, y, w-(radius*2), radius, borderColor, postGUI)
	end
end

function getHudCursorPos()
	if isCursorShowing() then
		return getCursorPosition()
	end
	return false
end
theFont = dxCreateFont("theFont.ttf", 13)

function isCursorWithinArea(cx, cy, x, y, w, h)
	if isCursorShowing() then
		if cx >= x and cx <= x + w and cy >= y and cy <= y + h then
			return true
		end
	end

	return false
end

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1266,778
local x,y =  (screenW/resW), (screenH/resH)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end