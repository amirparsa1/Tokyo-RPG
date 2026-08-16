local textsFromServer = {}

-- Tanzimat
local chandMetri = 23 -- Agar Fasele Kamtar Az 20Metr Bashe Mitooni Text Ro Bbini..

addEventHandler("onClientRender", getRootElement(), function()
	for id, v in pairs(textsFromServer) do
        local x,y,z = getElementPosition(localPlayer)
            
        if getDistanceBetweenPoints3D(v[3],v[4],v[5], x,y,z) <= chandMetri then
            local sx, sy = getScreenFromWorldPosition(v[3],v[4],v[5])
            if sx and sy then
                dxDrawText(v[1]..""..v[2], sx+1, sy+1, sx+1, sy+1, tocolor(0,0,0,120), 1.5, "default-bold", "center", "center", false, false, false, true)
                dxDrawText(v[1]..""..v[2], sx, sy, sx, sy, tocolor(242,241,181,180), 1.5, "default-bold", "center", "center", false, false, false, true)
            end
		end
	end
end)


addEvent("sendTableToClients2", true)
addEventHandler("sendTableToClients2", getRootElement(), function(tableFromServer)
    textsFromServer = tableFromServer
end)


triggerServerEvent("getTextsOnJoin2", localPlayer) 















---- Peds ----

ped11 = createPed(128, -939.64453125 ,-513.7939453125 ,25.9609375, 307.64801025391) -- Dast Rast
ped22 = createPed(122, -914.6376953125 ,-521.015625 , 25.953638076782, 17.998626708984) -- Negahban 1
ped33 = createPed(122, -908.2509765625 ,-502.287109375 ,25.9609375, 60.796508789063) -- Negahban 2
ped44 = createPed(200, -939.958984375 ,-496.44921875 ,25.9609375, 208.75715637207) -- Motad

setElementFrozen(ped11, true)
setElementFrozen(ped22, true)
setElementFrozen(ped33, true)
setElementFrozen(ped44, true)


function pedsnpc()
	setTimer ( function()
		 setPedAnimation(ped11,"DEALER","DEALER_IDLE",1,true,false)
	 	 setPedAnimation(ped22,"ped","IDLE_HBHB",1,true,false)
		 setPedAnimation(ped33,"ped","IDLE_HBHB",1,true,false)
		 setPedAnimation(ped44,"CRACK","crckidle1",1,true,false)
		
	end, 1000, 0 )
end
pedsnpc()


function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", ped11, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", ped22, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", ped33, cancelPedDamage)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", ped44, cancelPedDamage)