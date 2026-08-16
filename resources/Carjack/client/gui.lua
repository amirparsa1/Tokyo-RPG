sx, sy = guiGetScreenSize ()
gui = {}

gui[1] = guiCreateWindow(sx / 2 - 200, sy / 2 - 100, 400, 200, "Hamle bar", false)
gui[2] = guiCreateLabel(20, 40, 360, 60, "Shoma Dar In Makan Ba Zadan Bar Roye Dokme Start Kar \nYek Mashin Hamel Mavad Mokhader Daryaft Mikonid ke Bayad\nAn Ra Dar Zaman Moshakhas Shode Be Maghsad Beresanid \n Va Dastmozd Khod Ra Daryaft Konid.", false, gui[1])
gui[3] = guiCreateButton(20, 130, 170, 50, "Start Kar", false, gui[1])
gui[4] = guiCreateButton(210, 130, 170, 50, "Cancel", false, gui[1])

guiSetVisible(gui[1], false)
guiLabelSetVerticalAlign(gui[2], "center")
guiLabelSetHorizontalAlign(gui[2], "center")

gui[5] = guiCreateWindow(sx / 2 - 200, sy / 2 - 100, 400, 200, "Hamle bar", false)
gui[6] = guiCreateLabel(20, 40, 360, 60, "---", false, gui[5])
gui[7] = guiCreateButton(115, 130, 170, 50, "Hale Boro Berim", false, gui[5])

guiSetVisible(gui[5], false)
guiLabelSetVerticalAlign(gui[6], "center")
guiLabelSetHorizontalAlign(gui[6], "center")

gui[8] = guiCreateWindow(sx / 2 - 150, sy / 2 - 85, 300, 230, "Hamle bar", false)
gui[18] = guiCreateLabel(20, 30, 180, 50, "Password Zir Ra Vared Konid:", false, gui[8])
gui[9] = guiCreateLabel(36, 70, 50, 50, "1", false, gui[8])
gui[10] = guiCreateLabel(106, 70, 50, 50, "2", false, gui[8])
gui[11] = guiCreateLabel(176, 70, 50, 50, "3", false, gui[8])
gui[12] = guiCreateLabel(246, 70, 50, 50, "4", false, gui[8])
gui[13] = guiCreateButton(20, 100, 50, 50, "0", false, gui[8])
gui[14] = guiCreateButton(90, 100, 50, 50, "0", false, gui[8])
gui[15] = guiCreateButton(160, 100, 50, 50, "0", false, gui[8])
gui[16] = guiCreateButton(230, 100, 50, 50, "0", false, gui[8])
gui[17] = guiCreateButton(100, 170, 100, 40, "ok", false, gui[8])
guiLabelSetColor(gui[9], 0 , 255 , 0)
guiLabelSetColor(gui[10], 0 , 255 , 0)
guiLabelSetColor(gui[11], 0 , 255 , 0)
guiLabelSetColor(gui[12], 0 , 255 , 0)

guiSetVisible(gui[8], false)
guiSetEnabled(gui[9], false)
guiSetEnabled(gui[10], false)
guiSetEnabled(gui[11], false)
guiSetEnabled(gui[12], false)

function render()
	if isTimer(theftTimer) then
		local remaining = getTimerDetails(theftTimer)
		local getTime = remaining / 1000
		if getTime > 59 then
			dxDrawText("Zaman Baghi Mande Ta Tahvil Bar: "..math.floor(getTime / 60).." Daghighe.", 0, 30, sx, sy, tocolor(255, 255, 255, 255), 1.5, "default-bold", "center")
		else
			dxDrawText("Zaman Baghi Mande Ta Tahvil Bar: "..math.ceil(getTime).." Sanie.", 0, 30, sx, sy, tocolor(255, 255, 255, 255), 1.5, "default-bold", "center")
		end
	end
end