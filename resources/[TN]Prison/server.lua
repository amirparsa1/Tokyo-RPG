local accSys = exports["accounts-system"]       -- @SvMTA
function gateHaRoBesaz()
  gateA = createObject(2930, 99.4171875 ,190.2685546875 ,1000.35357666016, 0, 0, 180)

  
  gateOut = createObject(2930, 115.81211-0.8,196.304+0.5,985.353+1.7, 0, 0, 90)

  gateVoroodi = createObject(1566, 131.9281311-0.7,187.89308166504+0.8,985.26477050781+0.5, 0, 0, 0)
  gatatabaqe1 = createObject(1566, 130.89999,178.2,987.45001, 0, 0, 0)
  gatatabaqe3 = createObject(2930, 128.40039, 180.09961, 1000.5, 0, 0, 179.995)
  gatatabaqe4 = createObject(2930, 128.40039, 180, 1006.3, 0, 0, 179.995)
  enferadi1 = createObject(2930, 117.2002, 200.7998, 1000.4, 0, 0, 90.247)
  enferadi2 = createObject(2930, 109.21039, 200.7998, 1000.4, 0, 0, 90.247)
  incel1 = createObject(988, 103.7002, 181.90039, 998.09998, 0, 0, 90)
  incel2 = createObject(988, 103.7002, 194.2998, 998.09998, 0, 0, 90)
  vip3 = createObject(988, 113.7998, 196.59961, 997.5, 0, 0, 180)
  vip4 = createObject(988, 117.7998, 196.59961, 997.5, 0, 0, 180)
  vip1 = createObject(988, 118, 179.7998, 997.5, 0, 0, 0)
  vip2 = createObject(988, 114, 179.7998, 997.5, 0, 0, 0)
  seloole1 = createObject(2930, 89.59981, 180.09961, 1000.3, 0, 0, 270)
  seloole2 = createObject(2930, 93.89961, 180.09961, 1000.3, 0, 0, 270)
  seloole3 = createObject(2930, 98.20039, 180.09961, 1000.3, 0, 0, 270)
  seloole4 = createObject(2930, 96.2002, 196.40039, 1000.3, 0, 0, 90)
  seloole5 = createObject(2930, 91.90039, 196.40039, 1000.3, 0, 0, 90)
  seloole6 = createObject(2930, 87.7002, 196.40039, 1000.3, 0, 0, 90)
  setElementFrozen(incel1,true)
  setElementFrozen(incel2,true)
  setElementFrozen(vip3,true)
  setElementFrozen(vip4,true)
  setElementFrozen(vip1,true)
  setElementFrozen(vip2,true)
  
  setElementFrozen(gateA,true)

  setElementFrozen(gateOut,true)
  setElementFrozen(gateVoroodi,true)
  setElementFrozen(gatatabaqe1,true)
  setElementFrozen(gatatabaqe3,true)
  setElementInterior (gateA ,3);
  setElementInterior ( gateVoroodi, 3);
  setElementInterior ( gatatabaqe3, 3);
  setElementInterior ( gatatabaqe1, 3);
  setElementInterior ( gatatabaqe4, 3);
  setElementInterior ( gateVoroodi, 3); 
  setElementInterior ( enferadi1, 3);
  setElementInterior ( enferadi2, 3);
  setElementInterior ( incel1, 3);
  setElementInterior ( incel2, 3);
  setElementInterior ( vip1, 3);
  setElementInterior ( vip2, 3);
  setElementInterior ( vip3, 3);
  setElementInterior ( vip4, 3);
  setElementInterior ( seloole1, 3);
  setElementInterior ( seloole2, 3);
  setElementInterior ( seloole3, 3);
  setElementInterior ( seloole4, 3);
  setElementInterior ( seloole5, 3);
  setElementInterior ( seloole6, 3);
 
  
  setElementDimension (gateA ,0);
  setElementInterior (gateOut ,3);
  setElementDimension ( gateVoroodi, 0 );
  setElementDimension ( gatatabaqe1, 0 );
  setElementDimension ( gatatabaqe3, 0 );
  setElementDimension ( gatatabaqe4, 0 );
  setElementDimension ( enferadi1, 0 );
  setElementDimension ( enferadi2, 0 );
  setElementDimension ( incel1, 0 );
  setElementDimension ( incel2, 0 );
  setElementDimension ( vip1, 0 );
  setElementDimension ( vip2, 0 );
  setElementDimension ( vip3, 0 );
  setElementDimension ( vip4, 0 );
  setElementDimension ( seloole1, 0 );
  setElementDimension ( seloole2, 0 );
  setElementDimension ( seloole3, 0 );
  setElementDimension ( seloole4, 0 );
  setElementDimension ( seloole5, 0 );
  setElementDimension ( seloole6, 0 );
  
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), gateHaRoBesaz)

fasele = 2.5

addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(gateA)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gateA, 1500, 99.4171875 ,190.2685546875 + 1.5 ,1000.3535, 0, 0, 0)
			local gate = gateA
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gateA, 1500, 99.4171875 ,190.2685546875 ,1000.3535, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)


----gateout
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local xx,yy,zz = getElementPosition(gateOut)
	local de = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gateOut, 1500, 115.81211-0.8-3,196.304+0.5,985.353+1.7, 0, 0, 0)
			local gate = gateOut
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gateOut, 1500, 115.81211-0.8,196.304+0.5,985.353+1.7, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ax,ay,az = getElementPosition(gateVoroodi)
	local de = getDistanceBetweenPoints3D(x,y,z,ax,ay,az)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gateVoroodi, 1500, 131.9281311-0.7,187.89308166504+0.8,985.26477050781-3, 0, 0, 0)
			local gate = gateVoroodi
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gateVoroodi, 1500, 131.9281311-0.7,187.89308166504+0.8,985.26477050781+0.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local bx,by,bz = getElementPosition(gatatabaqe1)
	local de = getDistanceBetweenPoints3D(x,y,z,bx,by,bz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001-3, 0, 0, 0)
			local gate = gatatabaqe1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--tabaqe 3
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local cx,cy,cz = getElementPosition(gatatabaqe3)
	local de = getDistanceBetweenPoints3D(x,y,z,cx,cy,cz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gatatabaqe3, 1500, 128.40039, 182.09961, 1000.5, 0, 0, 0)
			local gate = gatatabaqe3
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gatatabaqe3, 1500, 128.40039, 180.09961, 1000.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--tabaqe4 
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local dx,dy,dz = getElementPosition(gatatabaqe4)
	local de = getDistanceBetweenPoints3D(x,y,z,dx,dy,dz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(gatatabaqe4, 1500, 128.40039, 182, 1006.3, 0, 0, 0)
			local gate = gatatabaqe4
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(gatatabaqe4, 1500, 128.40039, 180, 1006.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--enferadi1 
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ex,ey,ez = getElementPosition(enferadi1)
	local de = getDistanceBetweenPoints3D(x,y,z,ex,ey,ez)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(enferadi1, 1500, 115.2002, 200.7998, 1000.4, 0, 0, 0)
			local gate = enferadi1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(enferadi1, 1500, 117.2002, 200.7998, 1000.4, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--enferadi2
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local fx,fy,fz = getElementPosition(enferadi2)
	local de = getDistanceBetweenPoints3D(x,y,z,fx,fy,fz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(enferadi2, 1500, 110.90039, 200.7998, 1000.4, 0, 0, 0)
			local gate = enferadi2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(enferadi2, 1500, 109.21039, 200.7998, 1000.4, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--incel1
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local gx,gy,gz = getElementPosition(incel1)
	local de = getDistanceBetweenPoints3D(x,y,z,gx,gy,gz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(incel1, 2000, 103.7002, 177.1, 998.09998, 0, 0, 0)
			local gate = incel1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(incel1, 2000, 103.7002, 181.90039, 998.09998, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--incel2
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local hx,hy,hz = getElementPosition(incel2)
	local de = getDistanceBetweenPoints3D(x,y,z,hx,hy,hz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(incel2, 2000, 103.7002, 189.1, 998.09998, 0, 0, 0)
			local gate = incel2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(incel2, 2000, 103.7002, 194.2998, 998.09998, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--vip3
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local ix,iy,iz = getElementPosition(vip3)
	local de = getDistanceBetweenPoints3D(x,y,z,ix,iy,iz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(vip3, 2000, 113.7998, 196.59961, 993.78, 0, 0, 0)
			local gate = vip3
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(vip3, 2000, 113.7998, 196.59961, 997.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--vip4
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local jx,jy,jz = getElementPosition(vip4)
	local de = getDistanceBetweenPoints3D(x,y,z,jx,jy,jz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(vip4, 2000, 117.7998, 196.59961, 993.78, 0, 0, 0)
			local gate = vip4
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(vip4, 2000, 117.7998, 196.59961, 997.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--vip1
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local kx,ky,kz = getElementPosition(vip1)
	local de = getDistanceBetweenPoints3D(x,y,z,kx,ky,kz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(vip1, 2000, 118, 179.7998, 993.78, 0, 0, 0)
			local gate = vip1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(vip1, 2000, 118, 179.7998, 997.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--vip2
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local lx,ly,lz = getElementPosition(vip2)
	local de = getDistanceBetweenPoints3D(x,y,z,lx,ly,lz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(vip2, 2000, 114, 179.7998, 993.78, 0, 0, 0)
			local gate = vip2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(vip2, 2000, 114, 179.7998, 997.5, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole1
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole1)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole1, 1500, 87.59981, 180.09961, 1000.3, 0, 0, 0)
			local gate = seloole1
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole1, 1500, 89.59981, 180.09961, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole2
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole2)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole2, 1500, 92.29961, 180.09961, 1000.3, 0, 0, 0)
			local gate = seloole2
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole2, 1500, 93.89961, 180.09961, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole3
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole3)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole3, 1500, 96.40039, 180.09961, 1000.3, 0, 0, 0)
			local gate = seloole3
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole3, 1500, 98.20039, 180.09961, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole4
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole4)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole4, 1500, 94.5002, 196.40039, 1000.3, 0, 0, 0)
			local gate = seloole4
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole4, 1500, 96.2002, 196.40039, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole5
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole5)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole5, 1500, 90.20039, 196.40039, 1000.3, 0, 0, 0)
			local gate = seloole5
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole5, 1500, 91.90039, 196.40039, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
--seloole6
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole6)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole6, 1500, 86.0002, 196.40039, 1000.3, 0, 0, 0)
			local gate = seloole6
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole6, 1500, 87.7002, 196.40039, 1000.3, 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)
seloole7 = createObject(2930, 119.0126953110 ,210 ,987, 0, 0, 90)
setElementInterior ( seloole7, 3);
addCommandHandler("og",
function(thePlayer, cmd)
	local x,y,z = getElementPosition(thePlayer)
	local nx,ny,nz = getElementPosition(seloole7)
	local de = getDistanceBetweenPoints3D(x,y,z,nx,ny,nz)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember")) == 3 then
		if de < fasele then
			moveObject(seloole7, 2000, 123.0986328125 ,210.111 ,987, 0, 0, 0)
			local gate = seloole7
			triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
			setTimer(
				function()
					moveObject(seloole7, 2000, 119.0986328125 ,210.111 ,987 , 0, 0, 0)
				end, 7000, 1)
		end
	end
end
)

pick = 1.2

function TheUseMile(thePlayer)
	triggerClientEvent("IsUseMile",thePlayer,thePlayer)
    
end


--Marker /break
Marker1 = createMarker(88.636726379395, 180.623046875, 998.85931396484 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker1 ,3)

Marker2 = createMarker(92.9892578125, 180.517578125, 998.85931396484 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker2 ,3)

Marker3 = createMarker(97.3134765625, 180.525390625, 998.86010742188 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker3 ,3)

Marker4 = createMarker(97.064453125, 195.9775390625, 998.85357666016 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker4 ,3)

Marker5 = createMarker(92.9013671875, 195.8994140625, 998.85357666016 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker5 ,3)

Marker6 = createMarker(88.6533203125, 195.85684204102, 998.85931396484 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker6 ,3)

Marker7 = createMarker(103.8037109375, 181.6904296875, 998.85357666016 -1, "cylinder", 2.5,255,255,255,0)
setElementInterior(Marker7,3)

Marker8 = createMarker(103.625, 194.1953125, 998.85357666016 -1, "cylinder", 2.5,255,255,255,0)
setElementInterior(Marker8 ,3)

Marker9 = createMarker(131.6376953125, 184.3701171875, 987.23278808594 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker9 ,3)

Marker10 = createMarker(128.8251953125, 180.8291015625, 998.85522460938 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker10 ,3)

Marker11 = createMarker(131.994140625,188.28515625,985.26544189453 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker11 ,3)

Marker12 = createMarker(3145.4584960938, -1999.9162597656, 11.070329666138 -1, "cylinder", 2,255,255,255,0)

Marker13 = createMarker(115.9453125,197.1689453125,985.26593017578 -1, "cylinder", 2,255,255,255,0)

Marker14 = createMarker(99.3896484375 ,190.8935546875 ,998.85357666016 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker14 ,3)

Marker15 = createMarker(131.73046875,177.720703125,987.25366210938 -1, "cylinder", 2,255,255,255,0)
setElementInterior(Marker15 ,3)



Marker17 = createMarker(115.81211-0.8,196.304+0.5,985.353+1.7, "cylinder", 2,255,255,255,0)
setElementInterior(Marker17 ,3)

--Event And Function (OpenGate)
function BazKonDaroF(thePlayer)
	moveObject(seloole1 ,1500, 87.59981, 180.09961, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
    
    setTimer(
        function()
            moveObject(seloole1 ,1500, 89.59981, 180.09961, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate",true)
addEventHandler("OpenGate", root,BazKonDaroF)

function BazKonDaroF2(thePlayer)
	moveObject(seloole2, 1500, 92.29961, 180.09961, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
    
    setTimer(
        function()
            moveObject(seloole2, 1500, 93.89961, 180.09961, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate2",true)
addEventHandler("OpenGate2", root,BazKonDaroF2)

function BazKonDaroF3(thePlayer)
	moveObject(seloole3, 1500, 96.40039, 180.09961, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
    
    setTimer(
        function()
            moveObject(seloole3, 1500, 98.20039, 180.09961, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate3",true)
addEventHandler("OpenGate3", root,BazKonDaroF3)

function BazKonDaroF4(thePlayer)
	moveObject(seloole4, 1500, 94.5002, 196.40039, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
	triggerClientEvent("playPrisonGateOpen", resourceRoot, gate)
    
    setTimer(
        function()
			moveObject(seloole4, 1500, 96.2002, 196.40039, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate4",true)
addEventHandler("OpenGate4", root,BazKonDaroF4)

function BazKonDaroF5(thePlayer)
	moveObject(seloole5, 1500, 90.20039, 196.40039, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(seloole5, 1500, 91.90039, 196.40039, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate5",true)
addEventHandler("OpenGate5", root,BazKonDaroF5)

function BazKonDaroF6(thePlayer)
	moveObject(seloole6 ,1500, 86.0002, 196.40039, 1000.3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(seloole6, 1500, 87.7002, 196.40039, 1000.3, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate6",true)
addEventHandler("OpenGate6", root,BazKonDaroF6)

function BazKonDaroF7(thePlayer)
	moveObject(incel1, 2000, 103.7002, 177.1, 998.09998, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(incel1, 2000, 103.7002, 181.90039, 998.09998, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate7",true)
addEventHandler("OpenGate7", root,BazKonDaroF7)



function BazKonDaroF8(thePlayer)
	moveObject(incel2, 2000, 103.7002, 189.1, 998.09998, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(incel2, 2000, 103.7002, 194.2998, 998.09998, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate8",true)
addEventHandler("OpenGate8", root,BazKonDaroF8)


function BazKonDaroF9(thePlayer)
	moveObject(gatatabaqe1, 1500, 132.7002, 184.8, 988.90002, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gatatabaqe1, 1500, 130.7002, 184.8, 988.79999, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate9",true)
addEventHandler("OpenGate9", root,BazKonDaroF9)


function BazKonDaroF10(thePlayer)
	moveObject(gatatabaqe3, 1500, 128.40039, 182.09961, 1000.5, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gatatabaqe3, 1500, 128.40039, 180.09961, 1000.5, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate10",true)
addEventHandler("OpenGate10", root,BazKonDaroF10)


function BazKonDaroF11(thePlayer)
	moveObject(gateVoroodi, 1500, 124.9, 185, 988.90002, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gateVoroodi, 1500, 126.7, 185, 988.90002, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate11",true)
addEventHandler("OpenGate11", root,BazKonDaroF11)



function BazKonDaroF13(thePlayer)
	moveObject(gateOut, 1500, 115.81211-0.8-3,196.304+0.5,985.353+1.7, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gateOut, 1500, 115.81211-0.8,196.304+0.5,985.353+1.7, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate13",true)
addEventHandler("OpenGate13", root,BazKonDaroF13)

function BazKonDaroF14(thePlayer)
	moveObject(gateA, 1500, 99.4171875 ,190.2685546875 + 1.5 ,1000.3535, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gateA, 1500, 99.4171875 ,190.2685546875 ,1000.3535, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate14",true)
addEventHandler("OpenGate14", root,BazKonDaroF14)

function BazKonDaroF15(thePlayer)
	moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001-3, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate15",true)
addEventHandler("OpenGate15", root,BazKonDaroF15)



function BazKonDaroF17(thePlayer)
	moveObject(gateOut, 1500, 115.81211-0.8-3,196.304+0.5,985.353+1.7, 0, 0, 0)
    outputChatBox("#00ff00Success", thePlayer, 255, 255, 255, true)
    
    setTimer(
        function()
            moveObject(gateOut, 1500, 115.81211-0.8,196.304+0.5,985.353+1.7, 0, 0, 0)
    end ,30000,1)
end
addEvent("OpenGate17",true)
addEventHandler("OpenGate17", root,BazKonDaroF17)


--Markers
addEventHandler("onMarkerHit",Marker1,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm1hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker1,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm1leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker2,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm2hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker2,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm2leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker3,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm3hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker3,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm3leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker4,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm4hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker4,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm4leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker5,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm5hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker5,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm5leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker6,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm6hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker6,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm6leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker7,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm7hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker7,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm7leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker8,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm8hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker8,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm8leaver", hitElement, hitElement)
		
	end


end)



addEventHandler("onMarkerHit",Marker9,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm9hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker9,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm9leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker10,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm10hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker10,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm10leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker11,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm11hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker11,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm11leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker12,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm12hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker12,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm12leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker13,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm13hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker13,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm13leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker14,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm14hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker14,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm14leaver", hitElement, hitElement)
		
	end


end)

addEventHandler("onMarkerHit",Marker15,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm15hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker15,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm15leaver", hitElement, hitElement)
		
	end


end)


addEventHandler("onMarkerHit",Marker17,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm17hiter", hitElement, hitElement)
		
	end
end)
addEventHandler("onMarkerLeave",Marker17,
function(hitElement,matchingDimension)
    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		
		triggerClientEvent("cm17leaver", hitElement, hitElement)
		
	end


end)

function Milee(thePlayer)
	triggerClientEvent("milerousekardtrig",thePlayer,thePlayer)
    
end





--PC

PCMarker = createMarker(95.5 ,185.16 ,997.95931396484, "cylinder", 1,255,255,0,255)
setElementInterior (PCMarker ,3)
addEventHandler("onMarkerHit",PCMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		if (not isPedInVehicle(hitElement)) then
			triggerClientEvent("ShowPCPanel:8549", hitElement, hitElement)
		end
	end
end)

addEventHandler("onMarkerLeave",PCMarker,
function(hitElement,matchingDimension)
	if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
		triggerClientEvent("closePCPanel:8549", hitElement, hitElement)
	end
end)






addEvent("OpenAllGateJail", true)
addEventHandler("OpenAllGateJail" ,root ,
function(thePlayer)
	outputChatBox("#00ff00[Khatar]:#ffffff Tamam Dar Haye Zendan Baraye 1 Daghighe Baz Shod!", thePlayer, 230, 0, 0, true)
	moveObject(gateA, 1500, 99.4171875 ,190.2685546875 + 1.5 ,1000.3535, 0, 0, 0)
	
	moveObject(seloole1, 1500, 87.59981, 180.09961, 1000.3, 0, 0, 0) 
	
	moveObject(seloole2, 1500, 92.29961, 180.09961, 1000.3, 0, 0, 0)
	
	moveObject(seloole3, 1500, 96.40039, 180.09961, 1000.3, 0, 0, 0)
	
	moveObject(seloole4, 1500, 94.5002, 196.40039, 1000.3, 0, 0, 0)
	
	moveObject(seloole5, 1500, 90.20039, 196.40039, 1000.3, 0, 0, 0)
	
	moveObject(seloole6, 1500, 86.0002, 196.40039, 1000.3, 0, 0, 0)
	

	
	moveObject(gateOut, 1500, 115.81211-0.8-3,196.304+0.5,985.353+1.7, 0, 0, 0)
	
	moveObject(gateVoroodi, 1500, 131.9281311-0.7,187.89308166504+0.8,985.26477050781-3, 0, 0, 0)
	
	moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001-3, 0, 0, 0)
	
	moveObject(gatatabaqe3, 1500, 128.40039, 182.09961, 1000.5, 0, 0, 0)
	
	moveObject(gatatabaqe4, 1500, 128.40039, 182, 1006.3, 0, 0, 0)
	
	
	
	moveObject(incel1, 2000, 103.7002, 177.1, 998.09998, 0, 0, 0)
	
	moveObject(incel2, 2000, 103.7002, 189.1, 998.09998, 0, 0, 0)
	
	moveObject(vip3, 2000, 113.7998, 196.59961, 993.78, 0, 0, 0)
	
	moveObject(vip4, 2000, 117.7998, 196.59961, 993.78, 0, 0, 0)

	moveObject(vip1, 2000, 118, 179.7998, 993.78, 0, 0, 0)
	
	moveObject(vip2, 2000, 114, 179.7998, 993.78, 0, 0, 0)
	
	for k, v in ipairs (getElementsByType("player")) do
		if getElementData(v, "loggedIn") == true then 
			local hisFac = tonumber(getElementData(accSys:getPlayerAcc(v), "pMember"))
			if hisFac > 0 and hisFac < 4 then
				outputChatBox(" #ff0000[Khatar] #ffffffBe Computer Zendan Markazi Nofoz Shod!", v, 255, 255, 255, true)
			end
		end	
	end
			
	
	
	setTimer(
		function()
			moveObject(gateA, 1500, 99.4171875 ,190.2685546875 ,1000.3535, 0, 0, 0)
			moveObject(seloole1, 1500, 89.59981, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole2, 1500, 93.89961, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole3, 1500, 98.20039, 180.09961, 1000.3, 0, 0, 0)
			moveObject(seloole4, 1500, 96.2002, 196.40039, 1000.3, 0, 0, 0)
			moveObject(seloole5, 1500, 91.90039, 196.40039, 1000.3, 0, 0, 0)
			moveObject(seloole6, 1500, 87.7002, 196.40039, 1000.3, 0, 0, 0)

			moveObject(gateOut, 1500, 115.81211-0.8,196.304+0.5,985.353+1.7, 0, 0, 0)
			moveObject(gateVoroodi, 1500, 131.9281311-0.7,187.89308166504+0.8,985.26477050781+0.5, 0, 0, 0)
			moveObject(gatatabaqe1, 1500, 130.89999,178.2,987.45001, 0, 0, 0)
			moveObject(gatatabaqe3, 1500, 128.40039, 180.09961, 1000.5, 0, 0, 0)
			moveObject(gatatabaqe4, 1500, 128.40039, 180, 1006.3, 0, 0, 0)
			
			moveObject(incel1, 2000, 103.7002, 181.90039, 998.09998, 0, 0, 0)
			moveObject(incel2, 2000, 103.7002, 194.2998, 998.09998, 0, 0, 0)
			moveObject(vip3, 2000, 113.7998, 196.59961, 997.5, 0, 0, 0)
			moveObject(vip4, 2000, 117.7998, 196.59961, 997.5, 0, 0, 0)
			moveObject(vip1, 2000, 118, 179.7998, 997.5, 0, 0, 0)
			moveObject(vip2, 2000, 114, 179.7998, 997.5, 0, 0, 0)
	end, 60000, 1)
end)


cmfarar = createColRectangle(171.9970703125 ,-2748.236328125 ,250,180)
unJailTImer = {}
addEventHandler("onPlayerWasted",root,function()
	if isTimer(unJailTImer[source]) then killTimer(unJailTImer[source]) end
end)
function UnjailSho(thePlayer)
	
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pJailTime")) > 5 then
		unJailTImer[thePlayer] = setTimer(function()
			if getElementInterior( thePlayer ) == 0 then
				setElementData(thePlayer,"pJailTime",0)
				triggerClientEvent("TakeMile", thePlayer, thePlayer)
				setElementData(accSys:getPlayerAcc(thePlayer), "pJailTime", 0)
				outputChatBox("#00ff00Shoma Ba Movafaghiat Az Jail Farar Kardid!",thePlayer,255,255,255,true)

				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMember"))  >= 1 then
					setElementModel(thePlayer,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "fSkin")))
				else
					setElementModel(thePlayer,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")))
				end
			end
		end,1000,1)
	end
end
addEventHandler("onColShapeLeave",cmfarar, UnjailSho)

addEventHandler("onPlayerWasted",root,function()

	if isTimer(timerfarar) then 
		killTimer(timerfarar)
	end

end)
------------------------
