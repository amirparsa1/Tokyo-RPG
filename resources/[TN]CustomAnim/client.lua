local customIfp = nil 

function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
			for i = 1,3 do
				setPedAnimation(ped, "Fortnite_"..i.."", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedFortniteAnimation",true)
addEventHandler("setPedFortniteAnimation",getRootElement(),setPedFortniteAnimation)

function setPedParkourAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "BckHndSpingBTuck" or animation == "BckHndSping" or animation == "CartWheel" or animation == "FrntHndSpring" or animation == "HandPlant" then
			for i = 1,3 do
				setPedAnimation(ped, "Parkour", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedParkourAnimation",true)
addEventHandler("setPedParkourAnimation",getRootElement(),setPedParkourAnimation)

function setPedVarzeshAnimation1 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "derazneshast" then
			for i = 1,3 do
				setPedAnimation(ped, "Derazneshast", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedVarzeshAnimation1",true)
addEventHandler("setPedVarzeshAnimation1",getRootElement(),setPedVarzeshAnimation1)

function setPedVarzeshAnimation2 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "shena" then
			for i = 1,3 do
				
				setPedAnimation(ped, "Shena", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedVarzeshAnimation2",true)
addEventHandler("setPedVarzeshAnimation2",getRootElement(),setPedVarzeshAnimation2)

function setPedBDAnimation1 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "bd_1" or animation == "bd_2" or animation == "bd_3" then
			for i = 1,3 do
				setPedAnimation(ped, "BD1", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedBDAnimation1",true)
addEventHandler("setPedBDAnimation1",getRootElement(),setPedBDAnimation1)

function setPedBDAnimation2 (ped,animation,tiempo,repetir,mover,interrumpible)
if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
	if isElement(ped) then
		if animation == "break_D" then
			for i = 1,3 do
				setPedAnimation(ped, "BD2", animation, tiempo, true, false, false) 
				if tiempo > 1 then
					setTimer(setPedAnimation,tiempo,1,ped,false)
					setTimer(setPedAnimation,tiempo+100,1,ped,false)
				end
			end
		end
	end
end
addEvent("setPedBDAnimation2",true)
addEventHandler("setPedBDAnimation2",getRootElement(),setPedBDAnimation2)

addEventHandler("onClientResourceStart", resourceRoot,
function ( startedRes )
    customIfp = engineLoadIFP ("Data/Fortnitept1.ifp", "Fortnite_1")
    customIfp2 = engineLoadIFP ("Data/Fortnitept2.ifp", "Fortnite_2")
    customIfp3 = engineLoadIFP ("Data/Fortnitept3.ifp", "Fortnite_3")
	parkourIfp = engineLoadIFP ("Data/Parkour.ifp", "Parkour")
	DerazneshastIfp = engineLoadIFP ("Data/Derazneshast.ifp", "Derazneshast")
	ShenaIfp = engineLoadIFP ("Data/Shena.ifp", "Shena")
	BD1Ifp = engineLoadIFP ("Data/BD1.ifp", "BD1")
	BD2Ifp = engineLoadIFP ("Data/BD2.ifp", "BD2")
end)

