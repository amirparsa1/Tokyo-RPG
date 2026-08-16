 
function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
	if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
		if isElement(ped) then
		if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
		for i = 1,3 do
		triggerClientEvent ( root, "setPedFortniteAnimation", root, ped,animation,tiempo,repetir,mover,interrumpible )
		if tiempo > 1 then
		setTimer(setPedAnimation,tiempo,1,ped,false)
		setTimer(setPedAnimation,tiempo+100,1,ped,false)
		end
		end
		end
	end

end

function setPedParkourAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "BckHndSpingBTuck" or animation == "BckHndSping" or animation == "CartWheel" or animation == "FrntHndSpring" or animation == "HandPlant" then
			for i = 1,3 do
				triggerClientEvent ( root, "setPedParkourAnimation", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

function setPedVarzeshAnimation1 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "derazneshast" then
			for i = 1,3 do
				triggerClientEvent ( root, "setPedVarzeshAnimation1", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

function setPedVarzeshAnimation2 (ped,animation,tiempo,repetir,mover,interrumpible)
	
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then  return false end
	if isElement(ped) then
		if animation == "shena" then
			
			for i = 1,3 do
				
				triggerClientEvent ( root, "setPedVarzeshAnimation2", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

function setPedBDAnimation1 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "bd_1" or animation == "bd_2" or animation == "bd_3" then
			for i = 1,3 do
				triggerClientEvent ( root, "setPedBDAnimation1", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

function setPedBDAnimation2 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "break_D" then
			for i = 1,3 do
				triggerClientEvent ( root, "setPedBDAnimation2", root, ped,animation,tiempo,repetir,mover,interrumpible )
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end

