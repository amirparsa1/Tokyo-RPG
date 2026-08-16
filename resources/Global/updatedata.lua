function nickChangeHandler(oldNick, newNick)

    cancelEvent()
    setPlayerName(source, oldNick)

end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)