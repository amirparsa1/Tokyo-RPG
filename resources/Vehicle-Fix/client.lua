local shaders1 = {}
local shaders2 = {}
addEventHandler("onClientResourceStart",resourceRoot,
function ()
	cheraqMashinLoadKon()
	bakeMashinLoadKon()

end)

function cheraqMashinLoadKon()
	local texture = dxCreateTexture("Data/Image/lights128.jpg","dxt3")
	local shader = dxCreateShader("Data/Shader/lights.fx")
	dxSetShaderValue(shader,"gTexture",texture)
	shaders1 = shader
	engineApplyShaderToWorldTexture(shaders1,"vehiclelights128",vehicle)
	engineApplyShaderToWorldTexture(shaders1,"vehiclelightson128",vehicle)
end

function bakeMashinLoadKon()
	local texture = dxCreateTexture("Data/Image/vehicledash32.png", "dxt3")
	local shader = dxCreateShader("Data/Shader/lights.fx")
	dxSetShaderValue(shader,"gTexture",texture)
	shaders2 = shader
	engineApplyShaderToWorldTexture(shaders2,"vehicledash32",vehicle)
	engineApplyShaderToWorldTexture(shaders2,"vehicledash32",vehicle)

end

function farmooneMashinLoadKon() --vehiclesteering128
	local texture = dxCreateTexture("Data/Image/vehiclesteering128.png", "dxt3")
	local shader = dxCreateShader("Data/Shader/lights.fx")
	dxSetShaderValue(shader,"gTexture",texture)
	shaders3 = shader
	engineApplyShaderToWorldTexture(shaders3,"vehiclesteering128",vehicle)
	engineApplyShaderToWorldTexture(shaders3,"vehiclesteering128",vehicle)
end

function isVehicleOccupied(vehicle)
	if vehicle then
		assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
		local _, occupant = next(getVehicleOccupants(vehicle))
		return occupant and true, occupant
	end
end

function mashinDarHalDamage()
	if not isVehicleOccupied(source) then
		cancelEvent()
	end
end
addEventHandler("onClientVehicleDamage", root, mashinDarHalDamage)




--[[
local effectNames = {
	"blood_heli","boat_prop","camflash","carwashspray","cement","cloudfast","coke_puff","coke_trail","cigarette_smoke",
	"explosion_barrel","explosion_crate","explosion_door","exhale","explosion_fuel_car","explosion_large","explosion_medium",
	"explosion_molotov","explosion_small","explosion_tiny","extinguisher","flame","fire","fire_med","fire_large","flamethrower",
	"fire_bike","fire_car","gunflash","gunsmoke","insects","heli_dust","jetpack","jetthrust","nitro","molotov_flame",
	"overheat_car","overheat_car_electric","prt_blood","prt_boatsplash","prt_bubble","prt_cardebris","prt_collisionsmoke",
	"prt_glass","prt_gunshell","prt_sand","prt_sand2","prt_smokeII_3_expand","prt_smoke_huge","prt_spark","prt_spark_2",
	"prt_splash","prt_wake","prt_watersplash","prt_wheeldirt","petrolcan","puke","riot_smoke","spraycan","smoke30lit","smoke30m",
	"smoke50lit","shootlight","smoke_flare","tank_fire","teargas","teargasAD","tree_hit_fir","tree_hit_palm","vent","vent2",
	"water_hydrant","water_ripples","water_speed","water_splash","water_splash_big","water_splsh_sml","water_swim","waterfall_end",
	"water_fnt_tme","water_fountain","wallbust","WS_factorysmoke"
	}
	
	addCommandHandler("ce", function(_, effectIndex)
	   effectIndex = tonumber(effectIndex)
	   if effectIndex and type(effectIndex) == "number" then
		  if effectIndex > 0 and effectIndex <= #effectNames then
			 createEffect(effectNames[effectIndex], Vector3( getElementPosition( getLocalPlayer() ) ), 0, 0, 0)
		  end
	   end
	end)
--]]