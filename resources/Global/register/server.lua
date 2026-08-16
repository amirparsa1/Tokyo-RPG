local dbpTime = 500
local accSys = exports["Accounts-System"]

--> Age Jensiat Dokhtar Bod Cskin Dokhtar Set She #ExoPrim <--
function CskinFemale (root)
	setElementData(accSys:getPlayerAcc(root), "cSkin", 12)
	setElementModel( root, 12 )
end
addEvent("CskinRegisterFemaleSetShe",true)
addEventHandler("CskinRegisterFemaleSetShe", root, CskinFemale)

--> Age Jensiat Pesar Bod Cskin Pesar Set She #ExoPrim <--
function CskinMale (root)
	setElementData(accSys:getPlayerAcc(root), "cSkin", 7)
	setElementModel( root, 7)
end
addEvent("CskinRegisterMaleSetShe",true)
addEventHandler("CskinRegisterMaleSetShe", root, CskinMale)

function registerUpdateKon(root, whatsGender, hisNameEdit, hisAgeEdit)
    local whatsGender = tostring(whatsGender)
    local hisNameEdit = tostring(hisNameEdit)
    local hisAgeEdit = tonumber(hisAgeEdit)
    if whatsGender == "Male" then
        whatsGender = 1
    elseif whatsGender == "Female" then
        whatsGender = 2
    end

    setElementData(accSys:getPlayerAcc(root), "pSex", tonumber(whatsGender))
    setElementData(accSys:getPlayerAcc(root), "pReal", tostring(hisNameEdit))
    setElementData(accSys:getPlayerAcc(root), "pAge", tonumber(hisAgeEdit))
    setElementData(accSys:getPlayerAcc(root), "pReg", 1)
    --exports["notf"]:addNotification(root, "Etela'ate Shoma Ba Movafaqiat Sabt Shod!" , 'success')
	triggerClientEvent ( root, "PlayClick", root)
end
addEvent("regUpDB",true)
addEventHandler("regUpDB", root,registerUpdateKon)

function referralUpdateKon(root, hisRefEdit)
    if hisRefEdit == false or hisRefEdit == nil or hisRefEdit == 0 then
        hisRefEdit = 0
    end
    local hisRefEdit = tonumber(hisRefEdit)
    if hisRefEdit ~= tonumber(getElementData(accSys:getPlayerAcc(root), "pID")) then
        setElementData(accSys:getPlayerAcc(root), "pReferral", hisRefEdit)
        setElementData(accSys:getPlayerAcc(root), "pReg", 2)
        triggerClientEvent("finishRegister", root, root)
        exports["notf"]:addNotification(root, "Etelaate Shoma Ba Movafaqiat Sabt Shod, Khosh Amadid!" , 'success')
		triggerClientEvent ( root, "PlayMovafagh", root, "Hello World!" )
		triggerClientEvent ( root, "PlayClick", root, "Hello World!" )
    else
        exports["notf"]:addNotification(root, "Referrale Khodeto Nemitoni Bezani!" , 'error')
		triggerClientEvent ( root, "PlayError", root )
    end
end
addEvent("refUpDB",true)
addEventHandler("refUpDB", root,referralUpdateKon)

function openPanels(root)
    if tonumber(getElementData(accSys:getPlayerAcc(root), "pReg")) == 0 then
        triggerClientEvent("startRegister", root, root)
    elseif tonumber(getElementData(accSys:getPlayerAcc(root), "pReg")) == 1 then
        triggerClientEvent("startReferral", root, root)
    end
end