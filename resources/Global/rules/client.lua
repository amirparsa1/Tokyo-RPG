local screenW, screenH = guiGetScreenSize()
Back = guiCreateWindow((screenW - 913) / 2, (screenH - 594) / 2, 913, 594, "Welcome Back!", false)
guiWindowSetSizable(Back, false)
guiSetAlpha(Back, 1.00)
guiSetProperty(Back, "CaptionColour", "FFFEFEFE")

Soal = guiCreateStaticImage(10, 5, 313, 344, "rules/Data/alamatSoal.png", false, Back)
Matn = guiCreateLabel(328, 29, 559, 531, "** In Nokat Ro Hatman Bekhunid **\n\n\nMode Server RPG Mibashad va Non-RP Mojaz Nist Dar Surate\n Moshahede Mahrumiat Az Server Ro Dar Pey Dare!\n\nFahashi Va Tabliq Dar Chat Haye Server Mojaz Nemibashad!\n\nDarsurate Dashtan Soal Az Tarigh Dastur /helpme\n Soal Khod Ra Beporsid!\n\nKharid Va Forush Ba Pule Real Mojaz Nemibashad!\n\nOmidvaram Behetun Khosh Begzare!", false, Back)
local font0_font = guiCreateFont("rules/Data/font.ttf", 19)
guiSetFont(Matn, font0_font)
guiLabelSetColor(Matn, 254, 254, 254)
guiLabelSetHorizontalAlign(Matn, "center", false)
Close = guiCreateButton(41, 513, 232, 47, "[Close]", false, Back)
local font1_font = guiCreateFont("rules/Data/font.ttf", 24)
guiSetFont(Close, font1_font)
guiSetProperty(Close, "NormalTextColour", "FFFF0000")
guiSetProperty(Back,"Visible","False")

addCommandHandler("rules",
function ()
	guiSetProperty(Back,"Visible","True")
	showCursor(true)
end)

addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == Close then
		guiSetProperty(Back,"Visible","False")
		showCursor(false)
	end
end)