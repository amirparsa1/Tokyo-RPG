function chatbox()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Ertebat Ba #ff1010 Helper#00ffe6 Hay Server Az Cmd #ff1010[/Helpme] #00FFE6Estefade Konid.", client, 255, 255, 255, true)
	setTimer(chatbox1,400000,1)
end
function chatbox1()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Gozaresh Bug Az Cmd #ff1010[/Report] #00FFE6Estefade Konid Va Javayezi Daryaft Konid", client, 255, 255, 255, true)
	setTimer(chatbox2,400000,1)
end
function chatbox2()
	outputChatBox("#9A00FF[TheNight-MTA]  #00FFE6Baraye Didan List Job Haye Server Az CMD  #ff1010[/Jobs] #00FFE6Estefade Konid.", client, 255, 255, 255, true)
	setTimer(chatbox3,400000,1)
end
function chatbox3()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Kharid #E5DD00[Gold] #00FFE6Be Server Discord The Night MTA Moraje Konid", client, 255, 255, 255, true)
	setTimer(chatbox4,400000,1)
end
function chatbox4()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Tanzim Shekl Aim Khod Az CMD #ff1010[/Recoil] #00FFE6Estefade Konid..", client, 255, 255, 255, true)
	setTimer(chatbox5,400000,1)
end
function chatbox5()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Didn List Khodro Hay Khod Az CMD #ff1010[/Carinfo] #00FFE6Estefade Konid", client, 255, 255, 255, true)
	setTimer(chatbox6,400000,1)
end
function chatbox6()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Peida Krdn Khodro Khod Az CMD #ff1010[/Locatecar] #00FFE6Estefade Konid", client, 255, 255, 255, true)
	setTimer(chatbox7,400000,1)
end
function chatbox7()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Kharid #ff1010[House Maperi] #00FFE6Ba Gheymt Monaseb Be Server Discord The Night MTA Moraje Konid.", client, 255, 255, 255, true)
	setTimer(chatbox8,400000,1)
end
function chatbox8()
	outputChatBox("#9A00FF[TheNight-MTA] #00FFE6Baray Change Krdn #ff1010[Spawn] #00FFE6Khod Bar Roy [F1] Click Konid Va Be Bakhsh Setting Beravid.", client, 255, 255, 255, true)
	setTimer(chatbox,400000,1)
end
print("Chatbox by ExoPrim")
print("The Night MTA!")
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), chatbox)