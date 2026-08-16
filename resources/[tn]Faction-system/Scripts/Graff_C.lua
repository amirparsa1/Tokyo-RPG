local screenW, screenH = guiGetScreenSize()
local InSprayCoolDown = false
local savedGraffitis = {}
local serverGraffitis = {}
local loadedGraffitiTextures = {}
local loadedGraffitis = {}
local streamedGraffitis = {}
local graffitisVisibleDistance = 100
local graffitiThread = false
local graffitiSize = 2
local localPlayer = getLocalPlayer()

local startedGraffiti = {
	isActive = false,
	actionDisabled = false,
	value = 0,
	texture = false,
	data = false
}

--Create Textures

local CreatedTexturesReady = {}

for i=12 , 21 do
	for h=1 , 3 do
		CreatedTexturesReady[""..i.."_"..h..""] = dxCreateTexture( "Data/"..i.."_"..h..".png" )
	end
end

--Create Graffities From The Server

addEvent("CreateGraffiti", true)
addEventHandler("CreateGraffiti", root, function( SvPlayer , Texture, Data )
	if loadedGraffitis[SvPlayer] then
		serverGraffitis[SvPlayer] = nil
		loadedGraffitis[SvPlayer] = nil
		loadedGraffitiTextures[SvPlayer] = nil
	end
	serverGraffitis[SvPlayer] = Data
	loadedGraffitis[SvPlayer] = Data
	loadedGraffitiTextures[SvPlayer] = dxCreateTexture( "Data/"..Texture..".png" )
end)

addEventHandler("onClientPreRender", getRootElement(),
function ()
	local playerInterior, playerDimension = getElementInterior(localPlayer), getElementDimension(localPlayer)
	for k in pairs(loadedGraffitis) do
		if loadedGraffitis[k] and loadedGraffitiTextures[k] then
			if loadedGraffitis[k].interior == playerInterior and loadedGraffitis[k].dimension == playerDimension then
				local x,y,z = getElementPosition(localPlayer)
				if getDistanceBetweenPoints3D(loadedGraffitis[k].x1, loadedGraffitis[k].y1, loadedGraffitis[k].z1, x,y,z) <= 50 then
					dxDrawMaterialLine3D(loadedGraffitis[k].x1, loadedGraffitis[k].y1, loadedGraffitis[k].z1, loadedGraffitis[k].x2, loadedGraffitis[k].y2, loadedGraffitis[k].z2, 	loadedGraffitiTextures[k], loadedGraffitis[k].size, tocolor(255, 255, 255, 255), loadedGraffitis[k].x3, loadedGraffitis[k].y3, loadedGraffitis[k].z3)
				end
			end
		end
	end
end)

addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(),
function (weapon, _, _, hitX, hitY, hitZ)
	if weapon ~= 41 then
		return
	end
	if not InSprayCoolDown then
		--triggerServerEvent( "CheckMyFacForSpray", getLocalPlayer(), getLocalPlayer(), hitX, hitY, hitZ )
		local elbowX, elbowY, elbowZ = getPedBonePosition(source, 23)
		hitX, hitY, hitZ = hitX - elbowX, hitY - elbowY, hitZ - elbowZ
		local hitDistance = 2 / math.sqrt(hitX * hitX + hitY * hitY + hitZ * hitZ)
		hitX, hitY, hitZ = hitX * hitDistance, hitY * hitDistance, hitZ * hitDistance
		local hit, x0, y0, z0, hitElement, normalX, normalY, normalZ = processLineOfSight(elbowX, elbowY, elbowZ, elbowX + hitX, elbowY + hitY, elbowZ + hitZ, true, false, false, true, false, false, false, false)
		if not hit then
			return
		end
		local xx, xy, xz, yx, yy, yz
		do
			local x1, y1, z1 = getWorldFromScreenPosition(screenW * 0.5, screenH * 0.5, 1)
			local x2, y2, z2 = getWorldFromScreenPosition(screenW * 0.5, 0, 1)
			x2, y2, z2 = x2 - x1, y2 - y1, z2 - z1
						
			xx, xy, xz = normalY * z2 - normalZ * y2, normalZ * x2 - normalX * z2, normalX * y2 - normalY * x2
			yx, yy, yz = xy * normalZ - xz * normalY, xz * normalX - xx * normalZ, xx * normalY - xy * normalX
		end
		local xLength = graffitiSize * 0.5 / math.sqrt(xx * xx + xy * xy + xz * xz)
		local yLength = graffitiSize * 0.5 / math.sqrt(yx * yx + yy * yy + yz * yz)
		xx, xy, xz = xx * xLength, xy * xLength, xz * xLength
		yx, yy, yz = yx * yLength, yy * yLength, yz * yLength
		local cx, cy, cz = x0 + normalX, y0 + normalY, z0 + normalZ
		local bx, by, bz = x0 - normalX * 0.01, y0 - normalY * 0.01, z0 - normalZ * 0.01
		local col, x, y, z, hit
		col, x, y, z, hit = processLineOfSight(cx, cy, cz, bx + xx + yx, by + xy + yy, bz + xz + yz, true, true, false, true, false, false, false, false) if not col or hit ~= hitElement then return end
		col, x, y, z, hit = processLineOfSight(cx, cy, cz, bx + xx - yx, by + xy - yy, bz + xz - yz, true, true, false, true, false, false, false, false) if not col or hit ~= hitElement then return end
		col, x, y, z, hit = processLineOfSight(cx, cy, cz, bx - xx + yx, by - xy + yy, bz - xz + yz, true, true, false, true, false, false, false, false) if not col or hit ~= hitElement then return end
		col, x, y, z, hit = processLineOfSight(cx, cy, cz, bx - xx - yx, by - xy - yy, bz - xz - yz, true, true, false, true, false, false, false, false) if not col or hit ~= hitElement then return end
		local fx, fy, fz = x0 + normalX * 0.01, y0 + normalY * 0.01, z0 + normalZ * 0.01
		if not isLineOfSightClear(cx, cy, cz, fx + xx + yx, fy + xy + yy, fz + xz + yz, true, true, false, true, false, true, false) then return end
		if not isLineOfSightClear(cx, cy, cz, fx + xx - yx, fy + xy - yy, fz + xz - yz, true, true, false, true, false, true, false) then return end
		if not isLineOfSightClear(cx, cy, cz, fx - xx + yx, fy - xy + yy, fz - xz + yz, true, true, false, true, false, true, false) then return end
		if not isLineOfSightClear(cx, cy, cz, fx - xx - yx, fy - xy - yy, fz - xz - yz, true, true, false, true, false, true, false) then return end
		local zLength = 1 / math.sqrt(normalX * normalX + normalY * normalY + normalZ * normalZ)
		normalX, normalY, normalZ = normalX * zLength, normalY * zLength, normalZ * zLength
		local x1, y1, z1 = x0 + normalX * 0.01 + yx, y0 + normalY * 0.01 + yy, z0 + normalZ * 0.01 + yz
		local x2, y2, z2 = x0 + normalX * 0.04 - yx, y0 + normalY * 0.04 - yy, z0 + normalZ * 0.04 - yz
		startedGraffiti = {x1, y1, z1, x2, y2, z2, x1 + normalX, y1 + normalY, z1 + normalZ, x0, y0, z0, graffitiSize + 2, getElementInterior(localPlayer), getElementDimension(localPlayer)}
		triggerServerEvent("CheckMyFacForSpray", localPlayer, localPlayer, {
			x1 = startedGraffiti[1],
			y1 = startedGraffiti[2],
			z1 = startedGraffiti[3],
			x2 = startedGraffiti[4],
			y2 = startedGraffiti[5],
			z2 = startedGraffiti[6],
			x3 = startedGraffiti[7],
			y3 = startedGraffiti[8],
			z3 = startedGraffiti[9],
			cx = startedGraffiti[10],
			cy = startedGraffiti[11],
			cz = startedGraffiti[12],
			size = startedGraffiti[13],
			interior = startedGraffiti[14],
			dimension = startedGraffiti[15],
		})
		InSprayCoolDown = true
		setTimer( function()
			InSprayCoolDown = false
		end, 30000, 1)
	end
end)