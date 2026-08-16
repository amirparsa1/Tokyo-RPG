
function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end

	for index, Free_Cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( Free_Cars )
		if vehid == "f1" or vehid == "f2" or vehid == "f3" or vehid == "f4" or vehid == "f5" or vehid == "f6" or vehid == "f7" or vehid == "f8" or vehid == "f9" or vehid == "f10"or vehid == "f11" or vehid == "f12" or vehid == "f13" or vehid == "f14" or vehid == "f15" or vehid == "f16" or vehid == "f17" or vehid == "f18" or vehid == "f19"or vehid == "f20" or vehid == "f21" or vehid == "f22" or vehid == "f23" or vehid == "f24" or vehid == "f25" or vehid == "f26" or vehid == "f27"or vehid == "f28" or vehid == "f29" or vehid == "f30" or vehid == "f31" or vehid == "f32" or vehid == "f33" or vehid == "f34" or vehid == "f35" or vehid == "f36"or vehid == "f37" or vehid == "f38" or vehid == "f39" or vehid == "f40" or vehid == "f41" or vehid == "f42" or vehid == "f43" or vehid == "f44" or vehid == "f45"or vehid == "f46" or vehid == "f47" or vehid == "f48" or vehid == "f49" or vehid == "f50" or vehid == "f51" or vehid == "f52" or vehid == "f53"or vehid == "f54" or vehid == "f55" or vehid == "f56" or vehid == "f57" or vehid == "f58" or vehid == "f59" or vehid == "f60" or vehid == "f61" or vehid == "f62"or vehid == "f63" or vehid == "f64" or vehid == "f65" or vehid == "f66" or vehid == "f67" or vehid == "f68" or vehid == "f69" or vehid == "f70" or vehid == "f71"or vehid == "f72" or vehid == "f73" or vehid == "f74" or vehid == "f75" or vehid == "f76" or vehid == "f77" or vehid == "f78" or vehid == "f79" or vehid == "f80"or vehid == "f81" or vehid == "f82" or vehid == "f83" or vehid == "f84" or vehid == "f85" or vehid == "f86" or vehid == "f87" or vehid == "f88" or vehid == "f89"or vehid == "f90" or vehid == "f91" or vehid == "f92" or vehid == "f93" or vehid == "f94" or vehid == "f95" or vehid == "f96" or vehid == "f97" or vehid == "f98"or vehid == "f99" or vehid == "f100" or vehid == "f101" or vehid == "f102" or vehid == "f103" or vehid == "f104" or vehid == "f105" or vehid == "f106" or vehid == "f107" or vehid == "f108" or vehid == "f109" or vehid == "f110" or vehid == "f111" or vehid == "f112" or vehid == "f113" or vehid == "f114" or vehid == "f115" or vehid == "f116" or vehid == "f117" then
			toggleVehicleRespawn ( Free_Cars, true )
			setVehicleIdleRespawnDelay ( Free_Cars, 1000000 ) --10Min--
		end
	end



function setbenzin (thePlayer, cmd)
	for index, Free_Cars in ipairs(getElementsByType("vehicle")) do 
		local vehid = getElementID ( Free_Cars )
		if vehid == "f1" or vehid == "f2" or vehid == "f3" or vehid == "f4" or vehid == "f5" or vehid == "f6" or vehid == "f7" or vehid == "f8" or vehid == "f9" or vehid == "f10"or vehid == "f11" or vehid == "f12" or vehid == "f13" or vehid == "f14" or vehid == "f15" or vehid == "f16" or vehid == "f17" or vehid == "f18" or vehid == "f19"or vehid == "f20" or vehid == "f21" or vehid == "f22" or vehid == "f23" or vehid == "f24" or vehid == "f25" or vehid == "f26" or vehid == "f27"or vehid == "f28" or vehid == "f29" or vehid == "f30" or vehid == "f31" or vehid == "f32" or vehid == "f33" or vehid == "f34" or vehid == "f35" or vehid == "f36"or vehid == "f37" or vehid == "f38" or vehid == "f39" or vehid == "f40" or vehid == "f41" or vehid == "f42" or vehid == "f43" or vehid == "f44" or vehid == "f45"or vehid == "f46" or vehid == "f47" or vehid == "f48" or vehid == "f49" or vehid == "f50" or vehid == "f51" or vehid == "f52" or vehid == "f53"or vehid == "f54" or vehid == "f55" or vehid == "f56" or vehid == "f57" or vehid == "f58" or vehid == "f59" or vehid == "f60" or vehid == "f61" or vehid == "f62"or vehid == "f63" or vehid == "f64" or vehid == "f65" or vehid == "f66" or vehid == "f67" or vehid == "f68" or vehid == "f69" or vehid == "f70" or vehid == "f71"or vehid == "f72" or vehid == "f73" or vehid == "f74" or vehid == "f75" or vehid == "f76" or vehid == "f77" or vehid == "f78" or vehid == "f79" or vehid == "f80"or vehid == "f81" or vehid == "f82" or vehid == "f83" or vehid == "f84" or vehid == "f85" or vehid == "f86" or vehid == "f87" or vehid == "f88" or vehid == "f89"or vehid == "f90" or vehid == "f91" or vehid == "f92" or vehid == "f93" or vehid == "f94" or vehid == "f95" or vehid == "f96" or vehid == "f97" or vehid == "f98"or vehid == "f99" or vehid == "f100" or vehid == "f101" or vehid == "f102" or vehid == "f103" or vehid == "f104" or vehid == "f105" or vehid == "f106" or vehid == "f107" or vehid == "f108" or vehid == "f109" or vehid == "f110" or vehid == "f111" or vehid == "f112" or vehid == "f113" or vehid == "f114" or vehid == "f115" or vehid == "f116" or vehid == "f117" then
			if not isVehicleOccupied(Free_Cars) then
			local engine = getVehicleEngineState(Free_Cars)
			if engine == false then
				setElementData( Free_Cars ,"fuel",110)
				--setVehicleOverrideLights( selol_Cars , 1)
			end
			end
		end
	end
end
setTimer ( setbenzin, 1000000, 0 ) --10Min--