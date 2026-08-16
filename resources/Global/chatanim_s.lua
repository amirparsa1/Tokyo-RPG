function playerChatting()
	setPedAnimation(source, "ped", "IDLE_chat")
end
addEvent("playerChatting", true )
addEventHandler("playerChatting", getRootElement(), playerChatting)

function playerNotChatting()
	setPedAnimation(source)
end
addEvent("playerNotChatting", true )
addEventHandler("playerNotChatting", getRootElement(), playerNotChatting)

addEventHandler ("onPlayerQuit", getRootElement(), playerNotChatting )