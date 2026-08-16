
local screenW, screenH = guiGetScreenSize()
MafiaBG = guiCreateStaticImage((screenW - 456) / 2, (screenH - 616) / 2, 456, 616, "Data/Mafia.png", false)
Exit = guiCreateStaticImage(146, 565, 164, 51, "Data/Exit.png", false, MafiaBG)
TakeBaj = guiCreateStaticImage(25, 456, 78, 23, "Data/Take.png", false, MafiaBG)
PutBaj = guiCreateStaticImage(25, 427, 78, 23, "Data/Put.png", false, MafiaBG)
EditBaj = guiCreateEdit(25, 394, 81, 28, "", false, MafiaBG)
EditDrug = guiCreateEdit(184, 394, 81, 28, "", false, MafiaBG)
PutDrug = guiCreateStaticImage(184, 427, 78, 23, "Data/Put.png", false, MafiaBG)
TakeDrug = guiCreateStaticImage(184, 456, 78, 23, "Data/Take.png", false, MafiaBG)
EditMat = guiCreateEdit(344, 394, 81, 28, "", false, MafiaBG)
PutMat = guiCreateStaticImage(344, 427, 78, 23, "Data/Put.png", false, MafiaBG)
TakeMat = guiCreateStaticImage(344, 456, 78, 23, "Data/Take.png", false, MafiaBG)
TaxLabel = guiCreateLabel(6, 373, 121, 21, "Taxes: ", false, MafiaBG)
Font1 = guiCreateFont("Data/Font.ttf", 10)
guiSetFont(TaxLabel, Font1)
guiLabelSetHorizontalAlign(TaxLabel, "center", false)
guiLabelSetVerticalAlign(TaxLabel, "center")
DrugsLabel = guiCreateLabel(166, 373, 121, 21, "Drugs: ", false, MafiaBG)
guiSetFont(DrugsLabel, Font1)
guiLabelSetHorizontalAlign(DrugsLabel, "center", false)
guiLabelSetVerticalAlign(DrugsLabel, "center")
MaterialsLabel = guiCreateLabel(309, 373, 137, 21, "Materials: ", false, MafiaBG)
guiSetFont(MaterialsLabel, Font1)
guiLabelSetHorizontalAlign(MaterialsLabel, "center", false)
guiLabelSetVerticalAlign(MaterialsLabel, "center")
ScoreLabel = guiCreateLabel(166, 214, 121, 21, "Score: ", false, MafiaBG)
Font2 = guiCreateFont("Data/Font.ttf", 11)
guiSetFont(ScoreLabel, Font2)
guiLabelSetColor(ScoreLabel, 0, 0, 0)
guiLabelSetHorizontalAlign(ScoreLabel, "center", false)
guiLabelSetVerticalAlign(ScoreLabel, "center")
guiSetVisible(MafiaBG, false)
--GUIEditor.staticimage[9] = guiCreateStaticImage(150, 23, 154, 174, ":guiedit/client/colorpicker/palette.png", false, MafiaBG)    

function updateMafia(root, mat, drug, tax)
    mymat = tostring(mat)
    guiSetText ( MaterialsLabel, "Mats: "..mymat )
    mydrug = tostring(drug)
    guiSetText ( DrugsLabel, "Drugs: "..mydrug )
    mytax = tostring(tax)
    guiSetText ( TaxLabel, "Taxes: "..mytax )
    guiSetText ( EditMat, " ")
    guiSetText ( EditDrug, " ")
    guiSetText ( EditBaj, " ")
end
addEvent("upmafia",true)
addEventHandler("upmafia", getRootElement(), updateMafia)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == PutMat then
		local hismat = guiGetText(EditMat)
        if tonumber(hismat) > 0 then
            triggerServerEvent("PutMat", getLocalPlayer(), getLocalPlayer() , hismat)
        end
	elseif source == TakeMat then
		local hismat = guiGetText(EditMat)
	    if tonumber(hismat) > 0 then
            triggerServerEvent("TakeMat", getLocalPlayer(), getLocalPlayer() , hismat)
        end
	elseif source == PutDrug then
		local hisdrug = guiGetText(EditDrug)
	    if tonumber(hisdrug) > 0 then
            triggerServerEvent("PutDrug", getLocalPlayer(), getLocalPlayer() , hisdrug)
        end
	elseif source == TakeDrug then
		local hisdrug = guiGetText(EditDrug)
	    if tonumber(hisdrug) > 0 then
            triggerServerEvent("TakeDrug", getLocalPlayer(), getLocalPlayer() , hisdrug)
        end
	elseif source == PutBaj then
		local HisBaj = guiGetText(EditBaj)
	    if tonumber(HisBaj) > 0 then
            triggerServerEvent("PutBaj", getLocalPlayer(), getLocalPlayer() , HisBaj)
        end
	elseif source == TakeBaj then
		local hisbaj = guiGetText(EditBaj)
	    if tonumber(hisbaj) > 0 then
            triggerServerEvent("TakeBaj", getLocalPlayer(), getLocalPlayer() , hisbaj)
        end
	elseif source == Exit then
		guiSetProperty(MafiaBG, "Visible", "False")
		showCursor(false)
    end
end)
bindKey ("F7", "down",
function()
    triggerServerEvent("OpenMafiaPanel", getLocalPlayer(), getLocalPlayer() )
end)

function toggleMafia(root)
	if root == getLocalPlayer() then
		if getElementData(root, "loggedIn") == true then
			local windowState = guiGetProperty(MafiaBG, "Visible")
			if windowState == "False" then
                guiSetProperty(MafiaBG, "Visible", "True")
                triggerServerEvent("MafiaRefresh", getLocalPlayer(), getLocalPlayer() )
				showCursor(true)
			else
				guiSetProperty(MafiaBG, "Visible", "False")
				showCursor(false)
			end
		end
	end
end
addEvent("Mafia",true)
addEventHandler("Mafia", root, toggleMafia)