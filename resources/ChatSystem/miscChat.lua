function sendNearByChat(message, distance, x, y, z, r, g, b, colorCoded)
    if distance < 1.0 then return end
    for _, player in ipairs(getElementsByType("player")) do
        local px, py, pz = getElementPosition(player)
        if getDistanceBetweenPoints3D(px, py, pz, x, y, z) <= distance then
            outputChatBox(message, player, r, g, b, colorCoded)
        end
    end
end

function sendDoChat(message, distance, x, y, z)
    sendNearByChat(message, distance, x, y, z, 255, 255, 255, true)
end
