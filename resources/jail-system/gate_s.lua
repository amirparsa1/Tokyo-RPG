local accSys = exports["Accounts-System"]




-------------------------------------------------------
--Badane Haye Keshti
 BadaneAsli = createObject(10771, 3075.7002, -756.2002, 3.8, 0, 0, 89.072,true )
BadaneBala = createObject(10770, 3083.29, -753.09961, 37.08, 0, 0, 89.094,true )
 setObjectScale ( BadaneBala, 1.002)
 Anten = createObject(11237, 3083.2998, -753.09961, 37, 0, 0, 89.083,true )
 int1 = createObject(11145, 3074.1094, -819.01953, 2.68, 0, 0, 88.792,true )
 int2 = createObject(11146, 3075, -765.12988, 10.647, 0, 0, 89.072,true )
 setObjectScale ( int2, 1.002)
 Jade = createObject(16357, 2983, -792.5, 12.5, 0, 357.99, 359.797,true )
 BadaeJade = createObject(3381, 2943.1006, -800.40039, 21.1, 357.995, 0, 89.599,true )
 BadaeJade1 = createObject(3381, 3023.2002, -800.90039, 23.9, 357.99, 0, 89.594,true )
 Soton = createObject(3330, 2983.6006, -792.2998, 1.2, 0, 0, 270.533,true )

-------------------------------------------------------


function gateHaRoBesaz()
  GateHavaKhoir = createObject(2930, 3064.8, -716.20001, 19.5, 0, 0, 86.333)
  setObjectScale ( GateHavaKhoir, 1.5)
  ------
  GateHeli = createObject(2930, 3062.71, -844, 19.5, 0, 0, 88.131)
  setObjectScale ( GateHeli, 1.5)
  ------
  Gate1 = createObject(2930, 3080, -739.09998, 11.35, 0, 0, 269.544)
  -------
  Gate2 = createObject(2930, 3076.05, -742.90002441406,11.35000038147, 0, 0, 358.85632324219)
  -------
  Gate3 = createObject(2930, 3076.8999, -760.15002,11.37, 0, 0, 88.426)
  -------
  Gate4Paiin = createObject(2930, 3079.1499, -785.54999,3.24, 0, 0, 88.486)
  -------
  Selol1 = createObject(2930, 3066.6001, -696.02002,11, 0, 0, 268.949)
  setObjectScale ( Selol1, 0.93000001)
  -------
  Selol2 = createObject(2930, 3070.6001, -696.09998,11, 0, 0, 268.945)
  setObjectScale ( Selol2, 0.93000001)
  -------
  Selol3 = createObject(2930, 3074.6001, -696.20001,11, 0, 0, 268.945)
  setObjectScale ( Selol3, 0.93000001)
  -------
  Selol4 = createObject(2930, 3078.6001, -696.29999,11, 0, 0, 268.945)
  setObjectScale ( Selol4, 0.93000001)
  -------
  Selol5 = createObject(2930, 3082.6001, -696.40002,11, 0, 0, 268.945)
  setObjectScale ( Selol5, 0.93000001)
  -------
  SelolAjail = createObject(2930, 3088.2998, -696.2002,11.28, 0, 0, 269.545)
  -------
  
  GateVorod = createObject(980, 3062, -792.95001, 17.9, 0, 0, 89.19)
  ------
  
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), gateHaRoBesaz)

fasele = 4
faselee = 2.5
faseleee = 3

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local mx,my,mz = getElementPosition(GateHavaKhoir)
	local de = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(GateHavaKhoir, 1500, 3066.8, -716.20001, 19.5, 0, 0, 0)
			local gate = GateHavaKhoir
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(GateHavaKhoir, 1500, 3064.8, -716.20001, 19.5, 0, 0, 0)
				end, 5000, 1)
		end
	else

	end
end
)

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local xx,yy,zz = getElementPosition(GateHeli)
	local de = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(GateHeli, 1500, 3064.71, -844, 19.5, 0, 0, 0)
			local gate = GateHeli
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(GateHeli, 1500, 3062.71, -844, 19.5, 0, 0, 0)
				end, 5000, 1)
		end
	end
end
)

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ax,ay,az = getElementPosition(Gate1)
	local de = getDistanceBetweenPoints3D(x,y,z,ax,ay,az)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faseleee then
			moveObject(Gate1, 1500, 3082, -739.09998, 11.35, 0, 0, 0)
			local gate = Gate1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Gate1, 1500, 3080, -739.09998, 11.35, 0, 0, 0)
				end, 5000, 1)
		end
	end
end
)

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local bx,by,bz = getElementPosition(Gate2)
	local de = getDistanceBetweenPoints3D(x,y,z,bx,by,bz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faseleee then
			moveObject(Gate2, 1500, 3076.07, -741.50002441406,11.35000038147, 0, 0, 0)
			local gate = Gate2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Gate2, 1500, 3076.05, -742.90002441406,11.35000038147, 0, 0, 0)
				end, 5000, 1)
		end
	end
end
)
--Gate3
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local cx,cy,cz = getElementPosition(Gate3)
	local de = getDistanceBetweenPoints3D(x,y,z,cx,cy,cz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faseleee then
			moveObject(Gate3, 1500, 3078.2, -760.19002,11.37, 0, 0, 0)
			local gate = Gate3
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Gate3, 1500, 3076.8999, -760.15002,11.37, 0, 0, 0)
				end, 5000, 1)
		end
	end
end
)
--Gate4Paiin 
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local dx,dy,dz = getElementPosition(Gate4Paiin)
	local de = getDistanceBetweenPoints3D(x,y,z,dx,dy,dz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faseleee then
			moveObject(Gate4Paiin, 1500, 3080.3499, -785.6,3.24, 0, 0, 0)
			local gate = Gate4Paiin
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Gate4Paiin, 1500, 3079.1499, -785.54999,3.24, 0, 0, 0)
				end, 5000, 1)
		end
	end
end
)
--Selol1 

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ex,ey,ez = getElementPosition(Selol1)
	local de = getDistanceBetweenPoints3D(x,y,z,ex,ey,ez)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(Selol1, 1500, 3065.2001, -696.02002,11, 0, 0, 0)
			local gate = Selol1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Selol1, 1500, 3066.6001, -696.02002,11, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)
--Selol2
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local fx,fy,fz = getElementPosition(Selol2)
	local de = getDistanceBetweenPoints3D(x,y,z,fx,fy,fz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(Selol2, 1500, 3069.2001, -696.09998,11, 0, 0, 0)
			local gate = Selol2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Selol2, 1500, 3070.6001, -696.09998,11, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)
--Selol3
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local gx,gy,gz = getElementPosition(Selol3)
	local de = getDistanceBetweenPoints3D(x,y,z,gx,gy,gz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(Selol3, 2000, 3073.2001, -696.20001,11, 0, 0, 0)
			local gate = Selol3
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Selol3, 2000, 3074.6001, -696.20001,11, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)
--Selol4
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local hx,hy,hz = getElementPosition(Selol4)
	local de = getDistanceBetweenPoints3D(x,y,z,hx,hy,hz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(Selol4, 2000, 3077.2001, -696.29999,11, 0, 0, 0)
			local gate = Selol4
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Selol4, 2000, 3078.6001, -696.29999,11, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)
--Selol5
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ix,iy,iz = getElementPosition(Selol5)
	local de = getDistanceBetweenPoints3D(x,y,z,ix,iy,iz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(Selol5, 2000, 3081.2001, -696.40002,11, 0, 0, 0)
			local gate = Selol5
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(Selol5, 2000, 3082.6001, -696.40002,11, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)
--Ajail
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local jx,jy,jz = getElementPosition(SelolAjail)
	local de = getDistanceBetweenPoints3D(x,y,z,jx,jy,jz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < faselee then
			moveObject(SelolAjail, 2000, 3086.9, -696.2002,11.28, 0, 0, 0)
			local gate = SelolAjail
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(SelolAjail, 2000, 3088.2998, -696.2002,11.28, 0, 0, 0)
				end, 4500, 1)
		end
	end
end
)

--seloole5
--addCommandHandler("og",
--function(thePlayer, cmd)
	--local x,y,z = getElementPosition(thePlayer)
	--local nx,ny,nz = getElementPosition(seloole5)
	--local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	--if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		--if de < fasele then
		--	moveObject(seloole5, 1500, 90.20039, 196.40039, 1000.3, 0, 0, 0)
		--	local gate = seloole5
		--	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
		--	setTimer(
			--	function()
			--		moveObject(seloole5, 1500, 91.90039, 196.40039, 1000.3, 0, 0, 0)
			--	end, 7000, 1)
	--	end
	--end
--end
--)
--seloole6
--addCommandHandler("og",
--function(thePlayer, cmd)
	--local x,y,z = getElementPosition(thePlayer)
	--local nx,ny,nz = getElementPosition(seloole6)
	--local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	--if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
	--	if de < fasele then
		--	moveObject(seloole6, 1500, 86.0002, 196.40039, 1000.3, 0, 0, 0)
		--	local gate = seloole6
		--	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
		--	setTimer(
			--	function()
		--			moveObject(seloole6, 1500, 87.7002, 196.40039, 1000.3, 0, 0, 0)
				--end, 7000, 1)
		--end
	--end
--end
--)


pick = 1.2
--open all 
addCommandHandler("oa",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(pickup)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < pick then
			outputChatBox("#00ff00Dare Kolie Gate Ha Be Modat 15 Min Baz Shod!", thePlayer, 230, 0, 0, true)
			moveObject(Selol1, 1500, 3065.2001, -696.02002,11, 0, 0, 0)
			moveObject(Selol2, 1500, 3069.2001, -696.09998,11, 0, 0, 0)
			moveObject(Selol3, 1500, 3073.2001, -696.20001,11, 0, 0, 0)
			moveObject(Selol4, 1500, 3077.2001, -696.29999,11, 0, 0, 0)
			moveObject(Selol5, 1500, 3081.2001, -696.40002,11, 0, 0, 0)
	
			setTimer(
				function()
					moveObject(Selol1, 1500, 3066.6001, -696.02002,11, 0, 0, 0)
					moveObject(Selol2, 1500, 3070.6001, -696.09998,11, 0, 0, 0)
					moveObject(Selol3, 1500, 3074.6001, -696.20001,11, 0, 0, 0)
					moveObject(Selol4, 1500, 3078.6001, -696.29999,11, 0, 0, 0)
					moveObject(Selol5, 1500, 3082.6001, -696.40002,11, 0, 0, 0)
					
				end, 900000, 1)
		else
			outputChatBox("#ff0000Error]: Baraye Anjam Inkar Bayad Rooye Alamat (i) Beistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
)
--close all
addCommandHandler("ca",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(pickup)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < pick then
			outputChatBox("#ff0000Dare Kolie Gate Ha Baste Shod!", thePlayer, 230, 0, 0, true)
			moveObject(seloole1, 1500, 89.59981, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole2, 1500, 93.89961, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole3, 1500, 98.20039, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole4, 1500, 96.2002, 196.40039, 1000.3, 0, 0, 0)
			moveObject(seloole5, 1500, 91.90039, 196.40039, 1000.3, 0, 0, 0)
			moveObject(seloole6, 1500, 87.7002, 196.40039, 1000.3, 0, 0, 0)
		else
			outputChatBox("#ff0000Error: Baraye Anjam Inkar Bayad Rooye Alamat (i) Beistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
)



MarkerJaileGate = createColCircle ( 3061.455078125 ,-789.8759765625 ,9 )

function openJaileGate(thePlayer)
if getElementData(thePlayer, "loggedIn") == true then
   	 	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 1 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 2 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		moveObject(GateVorod,2000,3062, -792.95001, 11.6)
		setTimer(
		function()
			moveObject(GateVorod,2000,3062, -792.95001, 17.9)
		end, 30000, 1)
	end
	end
end
addEventHandler( "onColShapeHit", MarkerJaileGate, openJaileGate )

function closeJaileGate(thePlayer)
	moveObject(GateVorod,2000,3062, -792.95001, 17.9)
end
addEventHandler( "onColShapeLeave", MarkerJaileGate, closeJaileGate )