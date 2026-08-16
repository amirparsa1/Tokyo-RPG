local isOpenGate = {}
local accSys = exports["Accounts-System"]
local gateSys = {}

function createGates()
	  local xml = xmlLoadFile("Gate1/Gates.xml")
      local xmlRoot = xmlFindChild (xml,"config",0)
        if (xmlRoot) then
            for i,v in ipairs (xmlNodeGetChildren(xmlRoot)) do
				local gActive = xmlNodeGetAttribute(v, "gActive")
	            if gActive == "yes" then
					local x,y,z = xmlNodeGetAttribute(v, "gX"),xmlNodeGetAttribute(v, "gY"),xmlNodeGetAttribute(v, "gZ")
					local left = xmlNodeGetAttribute(v, "gLeft")
					local owner = xmlNodeGetAttribute(v, "gOwner")
					local ramz = tostring(xmlNodeGetAttribute(v, "gKey"))
					local id = xmlNodeGetAttribute(v, "gID")
					local gatesh = xmlNodeGetAttribute(v, "gModel")
					
					local rz = xmlNodeGetAttribute(v, "gRotZ")
					local movesh = xmlNodeGetAttribute(v, "nOeMove")
					gateSys[i] = createObject(tonumber(gatesh),tonumber(x),tonumber(y),tonumber(z))
					setElementRotation(gateSys[i],0,0,rz,"default",true)
					setElementData(gateSys[i],"gateOwner",owner)
					setElementData(gateSys[i],"gateLeft",left)
					setElementData(gateSys[i],"NoeMove",movesh)
					setElementData(gateSys[i],"gateID",id)
					setElementData(gateSys[i],"customGate",true)
					setElementData(gateSys[i],"gatePw",ramz)
					setElementData(gateSys[i],"gateX",x)
					setElementData(gateSys[i],"gateY",y)
					setElementData(gateSys[i],"gateZ",z)
					isOpenGate[gateSys[i]] = false
					
					xmlSaveFile(xml)
					
					outputDebugString("Loaded "..i.." Gates")
				end
			end
		end

end

createGates()

function getNearestGate(player,distance)
	local tempTable = {}
	local lastMinDis = distance-0.0001
	local nearestVeh = false
	local px,py,pz = getElementPosition(player)
	local pint = getElementInterior(player)
	local pdim = getElementDimension(player)

	for _,v in pairs(getElementsByType("object")) do
		local vint,vdim = getElementInterior(v),getElementDimension(v)
		if vint == pint and vdim == pdim then
			local vx,vy,vz = getElementPosition(v)
			local dis = getDistanceBetweenPoints3D(px,py,pz,vx,vy,vz)
			if dis < distance then
				if dis < lastMinDis then 
					lastMinDis = dis
					nearestVeh = v
				end
			end
		end
	end
	return nearestVeh
end


addCommandHandler("openg",function(thePlayer,cmd,pw)
	if pw then
		local key = pw
		if key then
			for index,objs in ipairs(getElementsByType("object")) do
				if getElementData(objs,"customGate") == true then
					local ox,oy,oz = getElementPosition(objs)
					local x,y,z = getElementPosition(thePlayer)
					if getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) < 10 then
						if key == getElementData(objs,"gatePw") then
							if isOpenGate[objs] == false then
								local enqadrMirePayin = getElementData(objs,"gateLeft")
								if tonumber(getElementData(objs,"NoeMove")) == 0 then
									local nowZ = getElementData(objs,"gateZ")
									local finalLeft = nowZ - enqadrMirePayin
									moveObject(objs,3000,ox,oy,finalLeft)
								elseif tonumber(getElementData(objs,"NoeMove")) == 1 then
									local nowY = getElementData(objs,"gateY")
									local finalRIGHT = nowY - enqadrMirePayin
									moveObject(objs,3000,ox,finalRIGHT,oz)
								end
								outputChatBox("Gate ID "..getElementData(objs,"gateID").." Baz Shod!",thePlayer,0,255,0)
								
								
								isOpenGate[objs] = true
								
								setTimer(
									function()
										moveObject(objs,2000,ox,oy,oz)
								end,4000,1)
								
								setTimer(
									function()
										isOpenGate[objs] = false
								end,6000,1)
							end
						else
							outputChatBox("#ff0000[Error]: #ffffffRamz Vorud Eshtebah Mibashad!",thePlayer,255,255,255,true)
							return false
						end
					end
				end
			end
		else
			outputChatBox("#00ff00[Error]: #ffffffPassword Gate Ra Vared Konid!",thePlayer,255,255,255,true)
		end
	else
		outputChatBox("#C0C0C0Syntax: /openg <Password>",thePlayer,255,255,255,true)
	end
end)

addCommandHandler("cog",function(thePlayer,cmd,pw)
	if pw then
		local key = tostring(pw)
		if key then
			for _,objs in ipairs(getElementsByType("object")) do
				if getElementData(objs,"customGate") == true then	
					local ox,oy,oz = getElementPosition(objs)
					local x,y,z = getElementPosition(thePlayer)
					if getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) < 10 then
						local myXMl = xmlLoadFile("Gate1/Gates.xml")
						local xmlRootss = xmlFindChild (myXMl,"config",0)
						if (xmlRootss) then
							for i,v in ipairs (xmlNodeGetChildren(xmlRootss)) do
								local ownereshe = xmlNodeGetAttribute(v,"gOwner")
								if ownereshe == getPlayerName(thePlayer) then
									xmlNodeSetAttribute(v,"gKey",key)
									setElementData(objs,"gatePw",tostring(key))
									outputChatBox("#00ff00[Success]:#ffffff Password Gate ID #00ff00"..xmlNodeGetAttribute(v, "gID").." #ffffffBa Movafaghiat Be #00ff00"..key.." #ffffffTaghir Yaft!",thePlayer,255,255,255,true)
								else
									outputChatBox("#ff0000Shoma Saheb In Gate Nistid!",thePlayer,255,255,255,true)
									return false
								end
								xmlSaveFile(myXMl)
							end
						end
					end
				end
			end
		else
			outputChatBox("#C0C0C0Syntax: /cog <New-Password>",thePlayer,255,255,255,true)
		end
	else
		outputChatBox("#C0C0C0Syntax: /cog <New-Password>",thePlayer,255,255,255,true)
	end
end)


addCommandHandler("gateinfo",function(thePlayer,cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		for _,objs in ipairs(getElementsByType("object")) do
			if getElementData(objs,"customGate") == true then	
				local ox,oy,oz = getElementPosition(objs)
				local x,y,z = getElementPosition(thePlayer)
				if getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) < 10 and getElementInterior(objs) == getElementInterior(thePlayer) and getElementDimension(objs) == getElementDimension(thePlayer) then
					local myXMl = xmlLoadFile("Gate1/Gates.xml")
					local xmlRootss = xmlFindChild (myXMl,"config",0)
					if (xmlRootss) then
						for i,v in ipairs (xmlNodeGetChildren(xmlRootss)) do
							local ownereshe = xmlNodeGetAttribute(v,"gOwner")
							if ownereshe == getPlayerName(thePlayer) then
								xmlNodeSetAttribute(v,"gKey",key)
								setElementData(objs,"gatePw",tostring(key))
								outputChatBox("#00ff00[Success]:#ffffff Password Gate ID #00ff00"..xmlNodeGetAttribute(v, "gID").." #ffffffBa Movafaghiat Be #00ff00"..key.." #ffffffTaghir Yaft!",thePlayer,255,255,255,true)
							else
								outputChatBox("#ff0000Shoma Saheb In Gate Nistid!",thePlayer,255,255,255,true)
								return false
							end
							xmlSaveFile(myXMl)
						end
					end
				end
			end
		end
	end
end)


addCommandHandler("gatepass",function(thePlayer,cmd,pw)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 0 then
		if pw then
			local key = tostring(pw)
			if key then
				for _,objs in ipairs(getElementsByType("object")) do
					if getElementData(objs,"customGate") == true then	
						local ox,oy,oz = getElementPosition(objs)
						local x,y,z = getElementPosition(thePlayer)
						if getDistanceBetweenPoints3D(ox,oy,oz,x,y,z) < 10 and getElementInterior(objs) == getElementInterior(thePlayer) and getElementDimension(objs) == getElementDimension(thePlayer) then
							local myXMl = xmlLoadFile("Gate1/Gates.xml")
							local xmlRootss = xmlFindChild (myXMl,"config",0)
							if (xmlRootss) then
								for i,v in ipairs (xmlNodeGetChildren(xmlRootss)) do
									if getDistanceBetweenPoints3D(xmlNodeGetAttribute(v, "gX"),xmlNodeGetAttribute(v, "gY"),xmlNodeGetAttribute(v, "gZ"),x,y,z) < 10 and 0 == getElementInterior(thePlayer) and 0 == getElementDimension(thePlayer) then
										local ownereshe = xmlNodeGetAttribute(v,"gOwner")
										xmlNodeSetAttribute(v,"gKey",key)
										setElementData(objs,"gatePw",tostring(key))
										outputChatBox("#00ff00[Success]:#ffffff Password Gate ID #00ff00"..xmlNodeGetAttribute(v, "gID").." #ffffffBa Movafaghiat Be #00ff00"..key.." #ffffffTaghir Yaft!",thePlayer,255,255,255,true)

										xmlSaveFile(myXMl)
									end
								end
							end
						end
					end
				end
			else
				outputChatBox("#C0C0C0Syntax: /gatepass <New-Password>",thePlayer,255,255,255,true)
			end
		else
			outputChatBox("#C0C0C0Syntax: /gatepass <New-Password>",thePlayer,255,255,255,true)
		end
	end
end)