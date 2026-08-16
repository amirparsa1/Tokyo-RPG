local dbpTime = 500
local accSys = exports["Accounts-System"]
function spawningPlayerForAcc(root)
	if tonumber(getElementData(accSys:getPlayerAcc(root), "pJailTime")) == 0 then
		if tonumber(getElementData(accSys:getPlayerAcc(root), "pTut")) == 0 then --civilian
			--local spawnX, spawnY, spawnZ = 1553.9111328125, -1790.5200195313, 13.546875
			local spawnX, spawnY, spawnZ = 1742.9033203125 ,-1862.322265625 ,13.57643699646
			spawnPlayer(root, spawnX, spawnY, spawnZ, 270)
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
			else
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
			end
			

------------------------------------------------------------------------------

		elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pTut")) == 1 then --house
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local owner = row['OWNER']
					local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
					if owner == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					elseif rent1 == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					elseif rent2 == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					elseif rent3 == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					elseif rent4 == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					elseif rent5 == getPlayerName(root) then
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )
					end
				end
				dbFree(query)
				if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
				else
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
				end
			else
				spawnPlayer(root,1173.00390625 ,-1323.328125 ,15.39771270752,270)
			
			end

------------------------------------------------------------------------------

		elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pTut")) == 2 then --faction
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")) > 0 then
				local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM houses WHERE Linked = ? ",getElementData(accSys:getPlayerAcc(root), "pFamiId")  )
				local result, numrows = dbPoll(query, dbpTime)
				if (result and numrows > 0) then
					for index, row in pairs(result) do
						local rent1, rent2, rent3, rent4, rent5 = row['RENT1'],row['RENT2'], row['RENT3'], row['RENT4'], row['RENT5']
						local id = row['ID']
						local int, x, y, z = row['INTERIOR'], row['INTX'], row['INTY'], row['INTZ']
						spawnPlayer(root, x, y, z)
						setElementInterior ( root, int )
						setElementDimension ( root, id )


					end
				else
					spawnPlayer(root, 0, 0, 3)
					setElementInterior ( root, 0 )
					setElementDimension ( root, 0 )
				end
				if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
				else
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
				end
			else
				if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
					local spawnX, spawnY, spawnZ = 1742.9033203125 ,-1862.322265625 ,13.57643699646
					spawnPlayer(root, spawnX, spawnY, spawnZ, 90)
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 1 then --Edare Police
					spawnPlayer(root, 254.3876953125 ,76.8623046875 ,1003.640625)
					setElementInterior ( root, 6 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 2 then --Police Federal
					spawnPlayer(root, 246.6171875 ,115.0224609375 ,1003.21875)
					setElementInterior ( root, 10 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 3 then --Gard Melli
					spawnPlayer(root, 288.8798828125 ,176.85546875 ,1007.1794433594)
					setElementRotation( root, 0 ,0 ,182.0160369873, "default", true)
					setElementInterior ( root, 3 )
					setElementDimension ( root, 0 )

				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 4 then --Pezeshk
					spawnPlayer(root, 238.2978515625 ,147.775390625 ,1020.8515625)
					setElementInterior ( root, 3 )
					setElementDimension ( root, 0 )
					setElementRotation( root, 0 ,0 ,180, "default", true)
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 5 then --ICA
					spawnPlayer(root, 173.19602966309 ,1422.8918457031 ,-15.89218711853)
					setElementInterior ( root, 8 )
					setElementDimension ( root, 10 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 6 then --CIA
					spawnPlayer(root, 245.9921875 ,111.7265625 ,1003.21875)
					setElementRotation( root, 0 ,0 ,3, "default", true)
					setElementInterior ( root, 10 )
					setElementDimension ( root, 1 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 7 then --Khabar Negar
					spawnPlayer(root, 2325.3898925781 ,-1144.3298339844 ,1067.4210205078)
					setElementRotation( root, 0 ,0 ,180.95056152344, "default", true)
					setElementInterior ( root, 12 )
					setElementDimension ( root, 0 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 8 then --Shahrdar
					spawnPlayer(root, 369.146484375 ,173.7060546875 ,1008.3893432617)
					setElementRotation( root, 0 ,0 ,272, "default", true)
					setElementInterior ( root, 3 )
					setElementDimension ( root, 0 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 9 then --Sherkat Khadamat Khodro
					spawnPlayer(root, -42.806251525879 ,1409.0451660156 ,1094)
					setElementRotation( root, 0 ,0 ,180, "default", true)
					setElementInterior ( root, 8 )
					setElementDimension ( root, 10 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 10 then --Edare Taxirani
					spawnPlayer(root, 1495.969726, 1307.056152, 1093.289062)
					setElementInterior ( root, 3 )
					setElementDimension ( root, 9090 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 11 then --Ballas Family
					spawnPlayer(root, 140.42578125 ,1379.7900390625 ,1088.3671875)
					setElementInterior ( root, 5 )
					setElementDimension ( root, 200 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 12 then --Red Dragons Family
					spawnPlayer(root, 2808.212890625 ,-1169.390625 ,1025.570312)
					setElementInterior ( root, 8 )
					setElementDimension ( root, 0 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 13 then --Los Aztecs Family
					spawnPlayer(root, 140.173828125 ,1379.0234375 ,1088.3671875)
					setElementInterior ( root, 5 )
					setElementDimension ( root, 0 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 14 then --Grove Street Family
					spawnPlayer(root, 2543.158203125 ,-1318.1748046875 ,1031.42187)
					setElementInterior ( root, 2 )
					setElementDimension ( root, 0 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 15 then --Vagos Family
					spawnPlayer(root, 140.4931640625 ,1379.9404296875 ,1088.367187)
					setElementInterior ( root, 5 )
					setElementDimension ( root, 100 )
				elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 16 then --Hackers
					spawnPlayer(root, 958.451171875, 2109.30859375, 1011.0234375)
					setElementInterior ( root, 1 )
					setElementDimension ( root, 23 )
				end
				if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
				else
					setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
				end
			end
		
		-----------------------------------------------------------------------------------
		elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pTut")) == 3 then
			local x = tonumber(getElementData(accSys:getPlayerAcc(root), "pLastx"))
			local y = tonumber(getElementData(accSys:getPlayerAcc(root), "pLasty"))
			local z = tonumber(getElementData(accSys:getPlayerAcc(root), "pLastz"))
			spawnPlayer(root, x ,y ,z + 0.8)
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
				
			else
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
				
			end
		end
	else

------------------------------------------------------------------------------

		spawnPlayer(root, 0 ,0 ,0)
		if getElementData(accSys:getPlayerAcc(root), "pAJailed") == 1 then
		local skintaraf = getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")
        setElementModel(thePlayer, skintaraf)
			local selol = math.random(1,3)
			if selol == 1 then
				setElementPosition (root, 264.3505859375 ,77.869140625 ,1001.0390625)
				setElementInterior ( root, 6 )
			elseif selol == 2 then
				setElementPosition (root, 264.2314453125 ,82.1806640625 ,1001.0390625)
				setElementInterior ( root, 6 )
			elseif selol == 3 then
				setElementPosition (root, 264.0888671875 ,86.701171875 ,1001.0390625)
				setElementInterior ( root, 6 )
			end
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
			else
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
			end

------------------------------------------------------------------------------


		elseif getElementData(accSys:getPlayerAcc(root), "pAJailed") == 2 then
		local skintaraf = getElementData(accSys:getPlayerAcc(thePlayer), "cSkin")
        setElementModel(thePlayer, skintaraf)
			local selolefbi = math.random(1,3)
			if selolefbi == 1 then
				setElementPosition (root, 215.068359375 ,108.33203125 ,999.015625)
				setElementInterior ( root, 10 )
			elseif selolefbi == 2 then
				setElementPosition (root, 219.076171875 ,108.4873046875 ,999.015625)
				setElementInterior ( root, 10 )
			elseif selolefbi == 3 then
				setElementPosition (root, 222.9990234375 ,108.6025390625 ,999.015625)
				setElementInterior ( root, 10 )
			end
			if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "cSkin")))
			else
				setElementModel(root, tonumber(getElementData(accSys:getPlayerAcc(root), "fSkin")))
			end

------------------------------------------------------------------------------

	elseif getElementData(accSys:getPlayerAcc(root), "pAJailed") == 3 then
		local seloleng = math.random(1,6)
		if seloleng == 1 then
		   setElementPosition (root, 88.356452941895 ,182.06640625 ,998.85931396484)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   
	   elseif seloleng == 2 then
		   setElementPosition (root, 92.9267578125 ,181.76171875 ,998.85931396484)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   elseif seloleng == 3 then
		   setElementPosition (root, 97.23828125 ,181.984375 ,998.86010742188)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   elseif seloleng == 4 then
		   setElementPosition (root, 97.203125 ,193.8095703125 ,998.8535766601)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   elseif seloleng == 5 then
		   setElementPosition (root, 93.3974609375 ,193.8056640625 ,998.85357666016)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   elseif seloleng == 6 then
		   setElementPosition (root, 89.064453125 ,193.76211547852 ,998.85931396484)
		   setElementDimension(root,0)
		   setElementInterior(root,3)
	   end
	
        local Skinfemale = getElementData(accSys:getPlayerAcc(root), "pSex")
		local skinesh = math.random(1,3)
		
		if Skinfemale == 2 then
			setElementModel(root, 304)
		else
			if skinesh == 1 then
				setElementModel(root, 210)
			 elseif skinesh == 2 then
				setElementModel(root, 297)
			 elseif skinesh == 3 then
				setElementModel(root, 291)
			end
		end
			
------------------------------------------------------------------------			
		elseif getElementData(accSys:getPlayerAcc(root), "pAJailed") == 4 then
			local seloleajail = math.random(1,2)
 			if seloleajail == 1 then
	        	setElementPosition (root, 116.9462890625 ,204.6943359375 ,998.86138916016)
				setElementDimension(root, 0)
				setElementInterior(root, 3)
			elseif seloleajail == 2 then
				setElementPosition (root, 110.26171875 ,204.6357421875 ,998.86138916016)
				setElementDimension(root, 0)
				setElementInterior(root, 3)
			end
			
            local Skinfemale = getElementData(accSys:getPlayerAcc(root), "pSex")
			local skinesh = math.random(1,3)
			if Skinfemale == 2 then
				setElementModel(root, 304)
		    else
				if skinesh == 1 then
						setElementModel(root, 210)
				 	elseif skinesh == 2 then
						setElementModel(root, 297)
				 	elseif skinesh == 3 then
						setElementModel(root, 291)
				end
			end
		end
	end
end
