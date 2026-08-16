local texts = {}
local currentID = 1

-- Tanzimat

function texts3d()
		texts[1] = {"", "Mash BiBote", 1065.669921875 ,2079.98046875 ,10.820312}
		texts[2] = {"", "Akbar DastAndaz",  1809.87109375 ,-1690.4755859375 ,13.551843643188}
		texts[3] = {"", "Shahin Over",  312.0263671875 ,-167.763671875 ,999.59375}
		texts[4] = {"", "Teymur",  295.990 ,-40.2158203125 ,1001.800}
       sendTableToClients2()
end
addEventHandler ( "onResourceStart", getRootElement(), texts3d)

function sendTableToClients2()
    triggerClientEvent(getRootElement(), "sendTableToClients2", getRootElement(), texts)
end


addEvent("getTextsOnJoin2", true)
addEventHandler("getTextsOnJoin2", getRootElement(), function()
    triggerClientEvent(source, "sendTableToClients2", source, texts)
end)