local accSys = exports["Accounts-System"]-------family system by ExoPrim----
local miscSys = exports["misc"]
local notfSys = exports["notf"]
local admSys = exports["[TN]Admin"]
local HouseSys = exports["[TN]House"]
local disSys = exports["[TN]Logger"]
local grafSys = exports["[TN]Graffiti"]
local dbpTime = 500
local buildStartTick
local buildEndTick
local Spamer = {}
local AirDopBox = {}
local BlipAirDropBox = {
    ["player"] = false,
}
local nowevent = false

function CanUseItem ()
    if nowevent == true then
        return false
    else
        return true
    end
end
function insertSortingByIndex(array, e)
    if e == nil then
        e = 0 
    end
	local data = array
    e = tonumber(e)
	for i = 2, #data do
		local j = i - 1
		local ass = data[i]
		while j > 0 and data[j][e] > ass[e] do
			data[j + 1] = data[j]
			j = j - 1
		end
		data[j + 1] = ass
	end
	return data
end
function table.reverse(t) 
    local reversedTable = {} 
    local itemCount = #t  
    for k, v in ipairs(t) do 
        reversedTable[itemCount + 1 - k] = v  
    end 
    return reversedTable  
end 

function SendMassegeAll(masseg)
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl, "loggedIn") == true then
            outputChatBox(masseg,allpl,255,255,255,true) 
        end
    end
end


function convertTime ( ms ) 
    if ( ms and type ( ms ) == "number" ) then 
    local milliseconds = math.floor((ms % 1000) / 100)
    local seconds = math.floor((ms / 1000) % 60)
    local minutes = math.floor((ms / (1000 * 60)) % 60)
        if seconds < 10 then
            seconds = "0"..seconds
        end
        if minutes < 10 then
            minutes = "0"..minutes
        end
	    return minutes, seconds, milliseconds

    end 
end 
function Message(matn,player)
    outputChatBox("#778899(Family-System):#FFFFFF "..matn, player, 255, 255, 255, true)
end
function convertNumber( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end
function RGBToHex(red, green, blue, alpha)
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end
end

function timerantispam(root)
    Spamer[root] = 8
    if Spamer[root] then
        setTimer(function() 
            Spamer[root] = 7

        end,1000,1)
        setTimer(function() 
            Spamer[root] = 6

        end,2000,1)
        setTimer(function() 
            Spamer[root] = 5

        end,3000,1)
        setTimer(function() 
            Spamer[root] = 4

        end,4000,1)
        setTimer(function() 
            Spamer[root] = 3

        end,5000,1)
        setTimer(function() 
            Spamer[root] = 2

        end,6000,1)
        setTimer(function() 
            Spamer[root] = 1

        end,7000,1)
        setTimer(function() 
            Spamer[root] = false
        end,8000,1)
    end
end

visiablecremafiapanel = {}
function openpanel(root)
    if visiablecremafiapanel[getPlayerName(root)] == "true" then
        triggerClientEvent("closekonpanelro", root, root)
        visiablecremafiapanel[getPlayerName(root)] = "false"
    else
        visiablecremafiapanel[getPlayerName(root)] = "true"
        triggerClientEvent("openkonpanelro", root, root)
    end
end
addCommandHandler("createfamily",openpanel)

addEvent("openpanel",true)
addEventHandler("openpanel", root, openpanel)
local Natije = {}
local CanEditThisItem = {
    ["fTime"] = "fTime",
    ["fMemberSlot"] = "fMemberSlot",
    ["fVehSlot"] = "fVehSlot",
    ["fPgx"] = "fPgx",
    ["fPgy"] = "fPgy",
    ["fPgz"] = "fPgz",
    ["fGx"]= "fGx",
    ["fGy"]= "fGy",
    ["fGz"]= "fGz",
    ["fGrx"]= "fGrx",
    ["fGry"]= "fGry",
    ["fGrz"]= "fGrz",
    ["veh1"]= "veh1",
    ["veh2"]= "veh2",
    ["veh3"]= "veh3",
    ["veh4"]= "veh4",
    ["veh5"]= "veh5",
    ["veh6"]= "veh6",
    ["veh7"]= "veh7",
    ["veh8"]= "veh8",
    ["veh9"]= "veh9",
    ["veh10"]= "veh10",
    ["veh11"]= "veh11",
    ["veh12"]= "veh12",
    ["veh13"]= "veh13",
    ["veh14"]= "veh14",
    ["veh15"]= "veh15",
    ["veh16"]= "veh16",
    ["veh17"]= "veh17",
    ["veh18"]= "veh18",
    ["veh19"]= "veh19",
    ["veh20"]= "veh20",
    ["fScore"]= "fScore",
    ["fActive"] = "fActive",
}
function SetElementFamily(IDfamily,Type,Value)
    if CanEditThisItem[Type] then
        local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `"..Type.."` = ? WHERE fID = ?",Value,IDfamily)
        dbPoll(query3, 500)
        dbFree(query3)
    end
end

function FamilyInfo(fID,typesh)
    local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM familys WHERE fID = ?",fID)
    local result, numrows = dbPoll(AllFamilys, 500)
    if (result and numrows > 0) then
        for index, row in pairs(result) do
            
            if typesh == "name" then
                Natije = row['fName']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "cheack" then
                Natije = true
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "id" then
                Natije = row['fID']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "owner" then
                local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                local result2, numrows2 = dbPoll(query, 500)
                if (result2 and numrows2 > 0) then
                    -- FIX: iterated `result` (the OUTER query) instead of `result2`,
                    --      so "owner" returned the wrong row's pName / nil.
                    for index, row2 in pairs(result2) do
                        Natije = row2['pName']
                        dbFree(AllFamilys)
                        return Natije
                    end
                end
            elseif typesh == "ownerref" then
                Natije = row['fOwner']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "tag" then
                Natije = row['fTag']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "active" then
                Natije = row['fActive']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "R" then
                Natije = row['fR']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "G" then
                Natije = row['fG']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "B" then
                Natije = row['fB']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank10" then
                Natije = "Leader"
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank9" then
                Natije = "Co-Leader"
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank8" then
                Natije = row['fRank8']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank7" then
                Natije = row['fRank7']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank6" then
                Natije = row['fRank6']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank5" then
                Natije = row['fRank5']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank4" then
                Natije = row['fRank4']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank3" then
                Natije = row['fRank3']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank2" then
                Natije = row['fRank2']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank1" then
                Natije = row['fRank1']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "frank0" then
                Natije = "error"
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "logoid" then
                
                Natije = row['fLogo']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "shoar" then
                Natije = row['fShoar']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "vehslot" then
                Natije = row['fVehSlot']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "memberslot" then
                Natije = row['fMemberSlot']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "time" then
                Natije = row['fTime']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "score" then
                Natije = row['fScore']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "createdate" then
                Natije = row['fCreateDate']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "price" then
                Natije = row['fPrice']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "px" then
                Natije = row['fPgx']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "py" then
                Natije = row['fPgy']  
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "pz" then
                Natije = row['fPgz'] 
                dbFree(AllFamilys)
                return Natije 
            elseif typesh == "gx" then
                Natije = row['fGx']
                dbFree(AllFamilys)
                return Natije 
            elseif typesh == "gy" then
                Natije = row['fGy']
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "gz" then
                Natije = row['fGz'] 
                dbFree(AllFamilys)
                return Natije  
            elseif typesh == "rx" then
                Natije = row['fGrx'] 
                dbFree(AllFamilys)
                return Natije  
            elseif typesh == "ry" then
                Natije = row['fGry']  
                dbFree(AllFamilys)
                return Natije
            elseif typesh == "rz" then
                Natije = row['fGrz'] 
                dbFree(AllFamilys)
                return Natije
            end           
        end
    else
        dbFree(AllFamilys)
        return "Not Found"
    end
    dbFree(AllFamilys)
end


function createkonfam(root,tagfamily,namefamily,R,G,B,shoarefam,memberslot,vehslot,R8,R7,R6,R5,R4,R3,R2,R1,fprice,logoid)
    if tonumber(getElementData(accSys:getPlayerAcc(root), "pMember")) == 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(root), "pPunish")) == 0 then
            if tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) >= tonumber(fprice) then
                if tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")) == 0 then
                    local LastFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM familys;")
                    local result2, numrows2 = dbPoll(LastFamilys, 500)
                    if (result2 and numrows2 > 0) then
                        for index, row in pairs(result2) do
                            dbFree(LastFamilys)
                            if row['fName'] == namefamily then
                                notfSys:addNotification(root, "Family Ba In Name Ham Aknon Vojod Darad" , 'error')
                                return false
                            end
                            if row['fTag'] == tagfamily then
                                notfSys:addNotification(root, "Family Ba In Tag Ham Aknon Vojod Darad" , 'error')
                                return false
                            end
                            if row['fOnwer'] == tonumber(getElementData(accSys:getPlayerAcc(root), "pID")) then
                                notfSys:addNotification(root, "Shoma Az Ghabl Yek Family Create Kardid" , 'error')
                                return false
                            end

                            
                        end

                    end
                    setElementData(accSys:getPlayerAcc(root), "pGold", tonumber(getElementData(accSys:getPlayerAcc(root), "pGold")) -  tonumber(fprice))
                    notfSys:addNotification(root, "Family Shoma Sakhte Shod!" , 'success')
                    Message(" Doost Aziz Family Shoma Sakhte Shod , Lotfan Ta Zamane Taeid Family Tavasote Modiran Server Saboor Bashid , Zamane Taghribi #8080801 ~ 48 #FFFFFFSaat Mibashad, Ba Tashakor Az Sabt Va Shakibaei Shoma.",root)
                    admSys:AdminMessages("Family-System","Family Ba Name "..namefamily.." Tavasote Player "..getPlayerName(root).." Ba Shoare "..shoarefam.." Be Ghiamate "..fprice.." g Create Shod Baraye Didane List Family Haye Taeed Nashode Dastore /familys Ra Estefade Konid")
                    local qfamily = dbQuery(exports.mysql:getMySQLC(), "INSERT INTO `familys` SET `fName`= ?, `fOwner`= ?, `fShoar`= ?, `fMemberSlot`= ?, `fVehSlot`= ?, `fTag`= ?, `fLogo`= ?, `fR`= ?, `fG`= ?, `fB`= ?, `fRank8`= ?, `fRank7`= ?, `fRank6`= ?, `fRank5`= ?, `fRank4`= ?, `fRank3`= ?, `fRank2`= ?, `fRank1`= ?, `fGover`= ?, `fPrice`= ?, `fCreateDate`= NOW()",namefamily,tonumber(getElementData(accSys:getPlayerAcc(root), "pID")),shoarefam,memberslot,vehslot,tagfamily,logoid,R,G,B,R8,R7,R6,R5,R4,R3,R2,R1,"1",fprice)
                    dbFree(qfamily)
                    setElementData(accSys:getPlayerAcc(root), "pRank",10)
                    setPlayerNametagText(root,getPlayerName(root).." ("..tagfamily..") ["..getElementData(root,"TarafID").."]")
                    local LastFamily = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM familys;")
                    local result, numrows = dbPoll(LastFamily, 500)
                    if (result and numrows > 0) then
                        for index, row in pairs(result) do
                            dbFree(LastFamily)

                            setElementData(accSys:getPlayerAcc(root), "pFamiId",row['fID'])
                        end
                    else
                        setElementData(accSys:getPlayerAcc(root), "pFamiId","0")
                    end
                else
                    notfSys:addNotification(root, "Shoma Khodet Dakhel Family Hasti." , 'error')
                end
            else
                notfSys:addNotification(root, "Gold Shoma Kafi Nist" , 'error')
            end
        else
            notfSys:addNotification(root, "Shoma Faction Punish Darid" , 'error')
        end
    else
        notfSys:addNotification(root, "Shoma Dar Faction Hastid Va Nemitavanid Family Create Konid" , 'error')
    end

end
addEvent("createkonfam",true)
addEventHandler("createkonfam", root, createkonfam)


function infoFam(root)
    local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;" )
    local result, numrows = dbPoll(query, 500)
    if (result and numrows > 0) then
        for index, row in pairs(result) do
            local fname,fShoar,fTag,LogoId,mslot,fSlot,fActive = row['fName'],row['fShoar'],row['fTag'],row['fLogo'],row['fMemberSlot'],row['fVehSlot'],row['fActive']
            local R,G,B = row['fR'],row['fG'],row['fB']
            local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
            local result, numrows = dbPoll(query, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    triggerClientEvent("infoFamPanel", root, root,fname,R,G,B,row['pName'],fShoar,fTag,LogoId,mslot,fSlot,fActive,row['fID'])
                end
            end
            
        end
    end
	
end
addEvent("infoFam",true)
addEventHandler("infoFam", root,infoFam)

function ActiveFamilily(root,Familyname,FamilyOwners,fshoard)
    if not Spamer[root] then
        timerantispam(root)
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
        local result, numrows = dbPoll(query, 500)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                if row['fName'] == Familyname and row['fShoar'] == fshoard then
                    local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                    local result2, numrows2 = dbPoll(query2, 500)
                    if (result2 and numrows2 > 0) then
                        for index2, row2 in pairs(result2) do
                            if row['fOwner'] == row2['pID'] then
                                if row['fActive'] == 0 then
                                    local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fActive`='1' WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                                    dbPoll(query3, 500)
                                    notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Active Shod!" , 'success')
                                else
                                    notfSys:addNotification(root, "Family "..row['fName'].." Active Ast Va Nemitavan On Ra Mojadad Active Kard." , 'error')
                                end
                            end

                        end
                    end
                end            
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
    end
end
addEvent("ActiveFamilily",true)
addEventHandler("ActiveFamilily", root,ActiveFamilily)

function NoActiveFamilily(root,Familyname,FamilyOwners,fshoard)
    if not Spamer[root] then
        timerantispam(root)
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
        local result, numrows = dbPoll(query, 500)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                if row['fName'] == Familyname and row['fShoar'] == fshoard then
                    local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                    local result2, numrows2 = dbPoll(query2, 500)
                    if (result2 and numrows2 > 0) then
                        for index2, row2 in pairs(result2) do
                            if row['fOwner'] == row2['pID'] then
                                
                                if row['fActive'] == 1 then
                                    local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fActive`='0' WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                                    dbPoll(query3, 500)
                                    notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Off Shod!" , 'success')
                                else
                                    notfSys:addNotification(root, "Family "..row['fName'].." NotActive Va Nemitavan On Ra Mojadad NotActive Kard." , 'error')
                                end
                            end

                        end
                    end
                end            
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
    end
end
addEvent("NoActiveFamilily",true)
addEventHandler("NoActiveFamilily", root,NoActiveFamilily)



function BanFanily(root,Familyname,FamilyOwners,fshoard,bantime)
    if not Spamer[root] then
        timerantispam(root)
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
        local result, numrows = dbPoll(query, 500)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                if row['fName'] == Familyname and row['fShoar'] == fshoard then
                    local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                    local result2, numrows2 = dbPoll(query2, 500)
                    if (result2 and numrows2 > 0) then
                        for index2, row2 in pairs(result2) do
                            if row['fOwner'] == row2['pID'] then
                                if row['fPerBan'] == 0 then
                                    if row['fBan'] == 0 then
                                        if bantime == "" or bantime == false or bantime == nil or  bantime == 0 then
                                            local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fPerBan`= 1 , `fBanedBy`= ? WHERE `fName` = ? AND `fOwner` = ?",getPlayerName(root), tostring(Familyname),tonumber(row2['pID']))
                                            dbPoll(query3, 500)
                                            notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Permant Ban Shod!" , 'success')
                                            admSys:AllMessages("Family-System","#ff0000Family "..Familyname.." Tavasote Admin "..getPlayerName(root).." Be Sorate Daeem Az Tamamiye Event/War Family Mahroom Shod")
                                        else
                                            admSys:AllMessages("Family-System","#ff0000Family "..Familyname.." Tavasote Admin "..getPlayerName(root).." Be Modate "..bantime.." Saat Az Tamamiye Event/War Family Mahroom Shod")
                                            local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fBan`= ?,`fBanedBy`= ? WHERE `fName` = ? AND `fOwner` = ?",tonumber(bantime),getPlayerName(root), tostring(Familyname),tonumber(row2['pID']))
                                            dbPoll(query3, 500)
                                            notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat "..bantime.." Saat Ban Shod!" , 'success')
                                        end
                                    else
                                        notfSys:addNotification(root, "Family "..row['fName'].." Be Modate "..row['fBan'].." Va Nemitavan An Ra Mojadad Ban Kard." , 'error')
                                    end
                                else
                                    notfSys:addNotification(root, "Family "..row['fName'].." PerManet Bane Va Nemitavan An Ra Mojadad Ban Kard." , 'error')
                                end
                            end

                        end
                    end
                end            
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
    end
end
addEvent("BanFanily",true)
addEventHandler("BanFanily", root,BanFanily)


function UnBanFanily(root,Familyname,FamilyOwners,fshoard,bantime)
    if not Spamer[root] then
        timerantispam(root)
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
        local result, numrows = dbPoll(query, 500)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                if row['fName'] == Familyname and row['fShoar'] == fshoard then
                    local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                    local result2, numrows2 = dbPoll(query2, 500)
                    if (result2 and numrows2 > 0) then
                        for index2, row2 in pairs(result2) do
                            if row['fOwner'] == row2['pID'] then

                                if row['fPerBan'] ~= 0 or row['fBan'] ~= 0   then
                                    local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fPerBan`= 0 , `fBanedBy`= 0 , `fBan`= 0 WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                                    dbPoll(query3, 500)
                                    notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat UnBan Shod!" , 'success')
                                else
                                    notfSys:addNotification(root, "Family "..row['fName'].." Ban Nist." , 'error')
                                end
                            end

                        end
                    end
                end            
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
    end
end
addEvent("UnBanFanily",true)
addEventHandler("UnBanFanily", root,UnBanFanily)

function NoActiveFamilily(root,Familyname,FamilyOwners,fshoard)
    if not Spamer[root] then
        timerantispam(root)
        local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
        local result, numrows = dbPoll(query, 500)
        if (result and numrows > 0) then
            for index, row in pairs(result) do
                if row['fName'] == Familyname and row['fShoar'] == fshoard then
                    local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pID` = ?",row['fOwner'])
                    local result2, numrows2 = dbPoll(query2, 500)
                    if (result2 and numrows2 > 0) then
                        for index2, row2 in pairs(result2) do
                            if row['fOwner'] == row2['pID'] then
                                
                                if row['fActive'] == 1 then
                                    local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `familys` SET `fActive`='0' WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                                    dbPoll(query3, 500)
                                    notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Off Shod!" , 'success')
                                else
                                    notfSys:addNotification(root, "Family "..row['fName'].." NotActive Va Nemitavan On Ra Mojadad NotActive Kard." , 'error')
                                end
                            end

                        end
                    end
                end            
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
    end
end
addEvent("NoActiveFamilily",true)
addEventHandler("NoActiveFamilily", root,NoActiveFamilily)
function openFamilyManagePanel( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 9 then
            
			triggerClientEvent("toggleFamilyPanleManage", thePlayer, thePlayer)
		end
	end
end
addEvent("openFamilyManagePanel",true)
addEventHandler("openFamilyManagePanel", root,openFamilyManagePanel)

function EditFamilyForLeader(thePlayer,namefam,fShoar,fTag,fLogo,fR,fG,fB)
	if getElementData(thePlayer, "loggedIn") == true then
        if not Spamer[thePlayer] then
		    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 9 then
                local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                if tonumber(FamilyInfo(myfam,"active")) == 1 then
                    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold")) >= 500 then
                        local LastFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM familys;")
                        local result2, numrows2 = dbPoll(LastFamilys, 500)
                        if (result2 and numrows2 > 0) then
                            for index, row in pairs(result2) do
                                if row['fID'] ~= myfam then
                                    if row['fName'] == namefam then
                                        notfSys:addNotification(thePlayer, "Family Ba In Name Ham Aknon Vojod Darad" , 'error')
                                        return false
                                    end
                                    if row['fTag'] == fTag and row['fTag'] then
                                        notfSys:addNotification(thePlayer, "Family Ba In Tag Ham Aknon Vojod Darad" , 'error')
                                        return false
                                    end
                                end
                                dbFree(LastFamilys)
                            end
                        end

                        local LastFamilys = dbQuery(exports.mysql:getMySQLC(),"UPDATE `familys` SET `fName`=?,`fShoar`=?,`fTag`=?,`fLogo`=?,`fR`=?,`fG`=?,`fB`=?,`fActive` = 0 WHERE `fOwner` = ? AND `fID` = ?;",namefam,fShoar,fTag,fLogo,fR,fG,fB,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID")),myfam)
                        dbPoll(LastFamilys, 500)
                        dbFree(LastFamilys)
                        for _,p in ipairs (getElementsByType("vehicle")) do
                            local vehid = getElementID ( p )
                            if vehid == "Family" then 
                                if getElementData(p,"owner") == myfam then
                                    if getVehicleController( p ) then
                                    else
                                        setElementInterior(p,myfam)
                                        setElementDimension(p,myfam)
                                        respawnVehicle(p)
                                        setElementData(p,"fuel",100)
                                        setVehicleColor( p, FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"))
                                    end
                                end
                            end
                        end
                        for index,allPlayers in ipairs(getElementsByType("player")) do
                            if getElementData(allPlayers, "loggedIn") == true then
                                if tonumber(getElementData(accSys:getPlayerAcc(allPlayers), "pFamiId")) == myfam then
                                    setPlayerNametagText(allPlayers,getPlayerName(allPlayers).." ("..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(allPlayers), "pFamiId")),"tag")..") ["..getElementData(allPlayers,"TarafID").."]")
                                end
                            end
                        end
                        Message("Doost Aziz Family Shoma Edit Shod , Lotfan Ta Zamane Taeid Family Tavasote Modiran Server Saboor Bashid , Zamane Taghribi #8080801 ~ 48 #FFFFFFSaat Mibashad, Ba Tashakor Az Sabt Va Shakibaei Shoma.",thePlayer)
                        admSys:AdminMessages("Family-System","Family Ba Name "..namefam.." Tavasote Player "..getPlayerName(thePlayer).." Ba Shoare "..fShoar.." Edit Shod Baraye Didane List Family Haye Taeed Nashode Dastore /familys Ra Estefade Konid")
    
                    else
                        notfSys:addNotification(thePlayer, "Shoma Gold Kafi Nadarid." , 'error')
                    end
                end
            else
                notfSys:addNotification(thePlayer, "Shoma Leader Nistid." , 'error')
		    end
        else
            notfSys:addNotification(thePlayer, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
        end
	end
end
addEvent("EditFamilyForLeader",true)
addEventHandler("EditFamilyForLeader", root,EditFamilyForLeader)

local fasele = 1.5
function HowMuchPlayerInFamily(fid)
    allplayerinthisfam = 0
    local LastFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users` WHERE `pFamiId` = ?",fid)
    local result2, numrows2 = dbPoll(LastFamilys, 500)
    if (result2 and numrows2 > 0) then
        for index, row in pairs(result2) do
            allplayerinthisfam = allplayerinthisfam + 1
        end
    else
        return false
    end
    return allplayerinthisfam
end
addCommandHandler("finv",
function ( thePlayer, command, player )
	local rank = getElementData(accSys:getPlayerAcc(thePlayer), "pRank")
	if tonumber(rank) <= 8 then
		outputChatBox("#ff0000✖️ #ffffffBaraye Inkar Bayad Sub Leader Ya Leader Bashid!", thePlayer, 230, 0, 0, true)
		return false
	end
	if player then
        local find = miscSys:findPlayer ( player )
		if find then
			if find ~= thePlayer then
				local x, y, z = getElementPosition( thePlayer )
				local fx, fy, fz = getElementPosition( find )
				local myInt = getElementInterior(thePlayer)
				local myDim = getElementDimension(thePlayer)
				local yourInt = getElementInterior(find)
				local yourDim = getElementDimension(find)
				local de = getDistanceBetweenPoints3D(x,y,z,fx, fy, fz)
				if myInt == yourInt and myDim == yourDim and de < fasele then
					local playerMember = getElementData(accSys:getPlayerAcc(find), "pMember")
					if tonumber(playerMember) == 0  then
                        if tonumber(getElementData(accSys:getPlayerAcc(find), "pFamiId")) == 0 then
						    if getElementData(accSys:getPlayerAcc(find), "pPunish") == 0 then
                                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                                    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
                                        if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                                            allMemberInFamily = HowMuchPlayerInFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")))
                                            if allMemberInFamily < FamilyInfo(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"),"memberslot") then
                                                if getElementData(find, "FamilyReq") == 0 or getElementData(find, "FamilyReq") == false then
                                                    if getElementData(thePlayer, "HaveSendFamRequest") == 1 or getElementData(thePlayer, "HaveSendFamRequest") == false then
                                                        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 10 then
                                                            esmrankesh = "Leader"
                                                        elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) == 9 then
                                                            esmrankesh = "Co-Leader"
                                                        end
						    	                        outputChatBox("#00ff00☑️ #ffffffShoma #00ff00"..getPlayerName(find).." #ffffffRa Be Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name").." Davat Kardid.", thePlayer, 230, 0, 0, true)
						    	                        outputChatBox("#CCFFE5[Family-System] #ffffffShoma Tavasote #00ff00"..esmrankesh.." "..getPlayerName(thePlayer).." #ffffffBe Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name").." #ffffffDavat Shodi Baraye Ghabol Kardan #00ff00('/fjoin')#ffffff Va Barate Rad Kardan #ff0000('/frjoin')#ffffff.", find, 230, 0, 0, true)
						    	                        setElementData(find, "FamilyReq", thePlayer )
                                                        setElementData(thePlayer, "HaveSendFamRequest", find )
                                                        setTimer(
                                                            function()
                                                                if getElementData(find, "FamilyReq") ~= 0 then
                                                                    setElementData(find, "FamilyReq", 0, false)
                                                                    setElementData(thePlayer, "HaveSendFamRequest", 1 )
                                                                    outputChatBox("#CCFFE5[Family-System] #ffffffDarkhast Family Invite Shoma Be #00ff00"..getPlayerName(find).." #ffffffBad Az #ff000015 #ffffffSanie Laghv Shod", thePlayer, 230, 0, 0, true)
                                                                    outputChatBox("#CCFFE5[Family-System] #ffffffDarkhast Family Invite Dade Shode Be Shoma  Bad Az #ff000015 #ffffffSanie Laghv Shod", find, 230, 0, 0, true)
                                                                end
                                                            end
                                                        ,20000,1)
                                                    else
                                                        notfSys:addNotification(thePlayer, "Shoma yek Darkhast Ersal Shode Darid." , 'error')
                                                    end
                                                else
                                                    notfSys:addNotification(thePlayer, "In Player Yek Darkhast Bar'resi Nashode Darad." , 'error')
                                                end

                                            else
                                                notfSys:addNotification(thePlayer, "Family Shoma Slot Kafi Nadarad." , 'error')
                                            end
                                        else
                                            notfSys:addNotification(thePlayer, "Family Shoma Active Nis Va Nemitavanid Kesi Ra Invite Konid." , 'error')
                                        end
                                    else
                                        outputChatBox("#ff0000✖️ #ffffffShoma Khodeton Family Nadarid!", thePlayer, 230, 0, 0, true)
                                    end
                                else
                                    outputChatBox("#ff0000✖️ #ffffffTanha Leader/Co-Leader Mitavanad finv Bedahad!", thePlayer, 230, 0, 0, true)
                                end                                    
						    else
						    	outputChatBox("#ff0000✖️ #ffffffIn Player Faction Punish Darad!", thePlayer, 230, 0, 0, true)
						    end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Yek Family Ozv Mibashad Va Shoma Nmitavanid Vey Ra Invite Dahid", thePlayer, 230, 0, 0, true)
                        end
					else

						outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Yek Faction Ozv Mibashad Va Shoma Nmitavanid Vey Ra Invite Dahid", thePlayer, 230, 0, 0, true)
					end
				else
					outputChatBox("#ff0000[Error] In Fard Bayad Nazdik Shoma Bashad!", thePlayer, 0, 255, 0,true)
				end

			else
				outputChatBox("#ff0000✖️ #ffffffKhodet Ra Ke Nemitoni Be Faction Khodet Davat Koni!", thePlayer, 255, 22, 22, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 22, 22, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /finv <PartOfName/ID>", thePlayer, 255, 22, 22, true)
	end
end)

addCommandHandler("fleave",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) ~= 10 then
		    notfSys:addNotification(thePlayer, "Shoma Ba Movafaghiyat Az Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name").. " Kharej Shodid." , 'success')
            setElementData(accSys:getPlayerAcc(thePlayer), "pFamiId",0)
            setElementData(accSys:getPlayerAcc(thePlayer), "pRank",0)
            setElementData(accSys:getPlayerAcc(thePlayer), "pPunish", 23)
            setPlayerNametagText(thePlayer,getPlayerName(thePlayer).." ["..getElementData(thePlayer,"TarafID").."]")
        else
            notfSys:addNotification(thePlayer, "Shoma Leader Family Hastid Va Nemitavanid Leave Bedahid." , 'error')
        end
    else
        notfSys:addNotification(thePlayer, "Shoma Dar Family Nistid." , 'error')
	end
end)


addCommandHandler("fjoin",
function ( thePlayer, command)
	local member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
    local fam = getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")
    
    if getElementData(thePlayer, "FamilyReq") ~= 0 then
        local facreq = getElementData(thePlayer, "FamilyReq")
	    if tonumber(member) == 0 and tonumber(fam) == 0 then
	        if getElementData(accSys:getPlayerAcc(thePlayer), "pPunish") == 0 then


                allMemberInFamily = HowMuchPlayerInFamily(tonumber(getElementData(accSys:getPlayerAcc(facreq), "pFamiId")))

                if allMemberInFamily < FamilyInfo(getElementData(accSys:getPlayerAcc(facreq), "pFamiId"),"memberslot") then
	    	        setElementData(accSys:getPlayerAcc(thePlayer), "pFamiId",tonumber(getElementData(accSys:getPlayerAcc(facreq), "pFamiId")))
	    	        if tonumber(thePlayer) == 1 or tonumber(thePlayer) == 2 or tonumber(thePlayer) == 3 or tonumber(thePlayer) == 4 or tonumber(thePlayer) == 6 or tonumber(thePlayer) == 7 or tonumber(thePlayer) == 8 or tonumber(thePlayer) == 9 then
	    	        	local Refresh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pID"))
	    	        	dbExec(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJoinFaction` = NOW() WHERE `pID` = ?", Refresh)
	    	        end
	    	        setElementData(accSys:getPlayerAcc(thePlayer), "pRank", 1)
                    setElementData(accSys:getPlayerAcc(thePlayer), "pFamiId", tonumber(getElementData(accSys:getPlayerAcc(facreq), "pFamiId")))
                    setElementData(facreq, "HaveSendFamRequest", 1 )
	    	        outputChatBox("#00ff00☑️ #ffffffShoma Darkhast Ozviat Dar Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name").." #ffffffRa Paziroftid!", thePlayer, 230, 0, 0, true)
                    setPlayerNametagText(thePlayer,getPlayerName(thePlayer).." ("..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"tag")..") ["..getElementData(thePlayer,"TarafID").."]")
                    setElementData(thePlayer, "FamilyReq", 0, false)
                else
                    notfSys:addNotification(thePlayer, "Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(facreq), "pFamiId")),"name").." Slot Kafi Nadarad." , 'error')
                end
	    	else
	    		outputChatBox("#ff0000✖️ #ffffffShoma Fp Darid Va Nemitonid Be Faction Join Beshid!", thePlayer, 230, 0, 0, true)
                setElementData(facreq, "HaveSendFamRequest", 1 )
	    		setElementData(thePlayer, "FamilyReq", 0, false)
	    	end
	    else
            setElementData(facreq, "HaveSendFamRequest", 1 )
            setElementData(thePlayer, "FamilyReq", 0, false)
	    	outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Factioni/Family Ozv Hastid!", thePlayer, 230, 0, 0, true)
	    end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Darkhasti Baraye Ozviat Dar Family Nadarid!", thePlayer, 230, 0, 0, true)
    end

end)

addCommandHandler("frjoin",
	function ( thePlayer, command)
	local member = getElementData(accSys:getPlayerAcc(thePlayer), "pMember")
    local fam = getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")
	if tonumber(member) == 0 and tonumber(fam) == 0 then
		local facreq = getElementData(thePlayer, "FamilyReq")
		if facreq ~= 0 then

			outputChatBox("#ff0000✖️ #ffffffShoma Darkhast Ozviat Dar Family "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(facreq), "pFamiId")),"name").." Ra Rad Kardid!", thePlayer, 230, 0, 0, true)
            setElementData(facreq, "HaveSendFamRequest", 1 )
            setElementData(thePlayer, "FamilyReq", 0, false)
		else
			outputChatBox("#ff0000✖️ #ffffffShoma Darkhasti Baraye Ozviat Dar Family Nadarid!", thePlayer, 230, 0, 0, true)
		end
	else
		outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Hastid!", thePlayer, 230, 0, 0, true)
	end
end)
function reloadglistfamilymanagef(thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                local fName = FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name")
                local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;")
                local result, numrows = dbPoll(query, dbpTime)
                local myFac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                for index, row in pairs(result) do
                    local factioneyaru = row['pFamiId']
                    if tonumber(factioneyaru) == tonumber(myFac) then
                        local fmember = tostring(row['pName']) 
                        local familyrankname = FamilyInfo(myFac,"frank"..row['pRank'])
                        local fRankesh = "(R "..row['pRank']..") "..familyrankname
                        triggerClientEvent("infoFamilyPanelManageLeader", thePlayer, thePlayer, fmember, fRankesh)
                    end
                end

                
             end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addEvent("reloadglistfamilymanage",true)
addEventHandler("reloadglistfamilymanage", root,reloadglistfamilymanagef)
local OnlineFamilyMembers = {}

function DokmeAfzodaneSloteVeh( thePlayer,tedad )
	if getElementData(thePlayer, "loggedIn") == true then
        if tedad then
		    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
                if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                    --if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                        if tedad == 5 then
                            price = 1700
                        elseif tedad == 8 then
                            price = 2500
                        elseif tedad == 15 then
                            price = 10000
                        elseif tedad == 20 then
                            price = 21000
                        else
                            notfSys:addNotification(thePlayer, "Nakon Baraye Khodet Bad Mishe" , 'error')
                            return false
                        end
                        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold")) >= price then
                            setElementData(accSys:getPlayerAcc(thePlayer), "pGold",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))-price )
                            local myfamid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                            if FamilyInfo(myfamid,"vehslot") < tedad then
                                SetElementFamily(myfamid,"fVehSlot",tedad)
                                notfSys:addNotification(thePlayer, "Shoma Bamovafaghiat Family Slot x"..tedad.." Ra Kharidari Kardid" , 'success')
                            else
                                notfSys:addNotification(thePlayer, "Family Shoma Ham Aknon Haminghadr Slot Mashin Darad" , 'error')
                            end
                            
                        else
                            notfSys:addNotification(thePlayer, "Gold Shoma Barainkar Kafi Nemibashad." , 'error')
                        end
                    --else
                    --    notfSys:addNotification(thePlayer, "Shoma Nemitavanid Family Ra Update Konid!" , 'error')
                    --end

                end
            else
                outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		    end
        end
	end
end
addEvent("DokmeAfzodaneSloteVeh",true)
addEventHandler("DokmeAfzodaneSloteVeh", root,DokmeAfzodaneSloteVeh)

function DokmeAfzodaneSloteMember( thePlayer,tedad )
	if getElementData(thePlayer, "loggedIn") == true then
        if tedad then
		    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
                if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                    --if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                        if tedad == 5 then
                            price = 1700
                        elseif tedad == 10 then
                            price = 2500
                        elseif tedad == 15 then
                            price = 10000
                        elseif tedad == 25 then
                            price = 21000
                        else
                            notfSys:addNotification(thePlayer, "Nakon Baraye Khodet Bad Mishe" , 'error')
                        end
                        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold")) >= price then
                            setElementData(accSys:getPlayerAcc(thePlayer), "pGold",tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))-price )
                            local myfamid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                            if FamilyInfo(myfamid,"memberslot") < tedad then
                                SetElementFamily(myfamid,"fMemberSlot",tedad)
                                notfSys:addNotification(thePlayer, "Shoma Bamovafaghiat Family Slot x"..tedad.." Ra Kharidari Kardid" , 'success')
                            else
                                notfSys:addNotification(thePlayer, "Family Shoma Ham Aknon Haminghadr Slot Member Darad" , 'error')
                            end
                            
                        else
                            notfSys:addNotification(thePlayer, "Gold Shoma Barainkar Kafi Nemibashad." , 'error')
                        end
                    --else
                    --    notfSys:addNotification(thePlayer, "Shoma Nemitavanid Family Ra Update Konid!" , 'error')
                    --end

                end
            else
                outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		    end
        end
	end
end
addEvent("DokmeAfzodaneSloteMember",true)
addEventHandler("DokmeAfzodaneSloteMember", root,DokmeAfzodaneSloteMember)
function DokmeTamdidFam( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                    local myfamid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                    if FamilyInfo(myfamid,"time") < 71 then
    
                        SetElementFamily(myfamid,"fTime",FamilyInfo(myfamid,"time")+720)
                        notfSys:addNotification(thePlayer, "Shoma Bamovafaghiat Family Ra Tamdid Kardid +720h Time" , 'success')
                    else
                        notfSys:addNotification(thePlayer, "Family Shoma Time Darad Hadaghl Time On Bayad Be 70 Saat Beresad!" , 'error')
                    end
                else
                    notfSys:addNotification(thePlayer, "Shoma Nemitavanid Family Ra Tamdid Konid!" , 'error')
                end

            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addEvent("DokmeTamdidFam",true)
addEventHandler("DokmeTamdidFam", root,DokmeTamdidFam)

function PanelInfomationLoader(thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
                local fName = FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name")
                local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;")
                local result, numrows = dbPoll(query, dbpTime)
                local myFac = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                local AllVahFam = 0 
                ExpireTimeFamily = FamilyInfo(myFac,"time")
                if myFac > 0 then
                    for _,p in ipairs (getElementsByType("vehicle")) do
                        local vehid = getElementID ( p )
                        if vehid == "Family" then 
                            if getElementData(p,"owner") == myFac then
                                AllVahFam = AllVahFam + 1
                            end
                        end
                    end
                end
			    triggerClientEvent("PanelInfomationLoaderClient", thePlayer, thePlayer ,FamilyInfo(myFac,"R"),FamilyInfo(myFac,"G"),FamilyInfo(myFac,"B"), fName,FamilyInfo(myFac,"logoid"),FamilyInfo(myFac,"shoar"),FamilyInfo(myFac,"memberslot"),FamilyInfo(myFac,"vehslot"),ExpireTimeFamily,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")),FamilyInfo(myFac,"score"),FamilyInfo(myFac,"createdate"),FamilyInfo(myFac,"price"),AllVahFam,FamilyInfo(myFac,"tag")) 
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addEvent("PanelInfomationLoader",true)
addEventHandler("PanelInfomationLoader", root,PanelInfomationLoader)

function makeleaderforfamily(thePlayer,cmd,target,familyid)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 9 then
        if target and familyid then
            local taraf = miscSys:findPlayer ( target )
            if tonumber(familyid) > 0 then
                if FamilyInfo(tonumber(familyid),"cheack") == true then
                    setElementData(accSys:getPlayerAcc(taraf), "pFamiId",tonumber(familyid))
                    setElementData(accSys:getPlayerAcc(taraf), "pRank",10)
                    setElementData(accSys:getPlayerAcc(taraf), "pMember",0)
                    setPlayerNametagText(taraf,getPlayerName(taraf).." ("..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(taraf), "pFamiId")),"tag")..") ["..getElementData(taraf,"TarafID").."]")
                    Message("Shoma Ba Movafaghiat Leader Family "..FamilyInfo(tonumber(familyid),"name").." Shodid.",taraf)
                    disSys:SendDiscordLog("makefamilyleader",cmd,thePlayer,taraf,familyid)
                else
                    Message("Chenin Family Vojod Nadarad.",taraf)
                end
            elseif tonumber(familyid) == 0 then
                disSys:SendDiscordLog("makefamilyleader",cmd,thePlayer,taraf,familyid)
                setPlayerNametagText(taraf,getPlayerName(taraf).." ["..getElementData(taraf,"TarafID").."]")
                setElementData(accSys:getPlayerAcc(taraf), "pFamiId",0)
                setElementData(accSys:getPlayerAcc(taraf), "pRank",0)
                Message("Shoma Ba Movafaghiat Az Family Kharej Shodid.",taraf)
            end
        else
            outputChatBox("#C0C0C0Bezan: /<makefamilyleader/mfl> <PartOfName/ID> <FAMILY-ID>", thePlayer, 255, 22, 22, true)
        end
    else
        outputChatBox("#FF0000[ERROR]:Shoma Dastresi Be In CMD Nadarid.", thePlayer, 255, 22, 22, true)
    end
end
addCommandHandler("makefamilyleader",makeleaderforfamily)
addCommandHandler("mfl",makeleaderforfamily)

function setfamilyleaders(thePlayer,cmd,target,familyid)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 10 then
        if target and familyid then
            local taraf = miscSys:findPlayer ( target )
            if tonumber(familyid) > 0 then
                if FamilyInfo(tonumber(familyid),"cheack") == true then
                    setElementData(accSys:getPlayerAcc(taraf), "pFamiId",tonumber(familyid))
                    setElementData(accSys:getPlayerAcc(taraf), "pRank",10)
                    setElementData(accSys:getPlayerAcc(taraf), "pMember",0)
                    local query = dbQuery(handler, "SELECT * FROM `houses` WHERE `Linked` = ?",tonumber(familyid) )
                    local result, numrows = dbPoll(query, dbpTime)
                    if (result and numrows > 0) then
                        for index, row in pairs(result) do
                            local owner = row['OWNER']
                            if(owner ~= getPlayerName(thePlayer)) then
                                outputChatBox("Shoma Nemitavanid In Khane Ra Unlink Konid!", thePlayer, 255, 0, 0)
                            else
                                local pID = tonumber(familyid)
                                if pID > 0 then
                                    local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys` WHERE `fID` = ?",pID )
                                    local result, numrows = dbPoll(query, 500)
                                    if (result and numrows > 0) then
                                        for index, row in pairs(result) do
                                            HouseSys:setHouseData(tonumber(familyid), "Linked", 0)
                                            if FamilyInfo(pID,"px") ~= "" and FamilyInfo(pID,"py") ~= "" and FamilyInfo(pID,"pz") ~= "" then
        
                                                
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgx",nil)
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgy",nil)
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgz",nil)
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGx",nil)
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGy",nil)
                                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGz",nil)
                                                if ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))] then
                                                    destroyElement(ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                                    destroyElement(Parking[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                                    destroyElement(ParkingOut[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                                end
                                                
                                                notfSys:addNotification(thePlayer, "House Shoma Ba Movafaghiat UnLink Shod." , 'error')
        
        
                                            end
                                            
                                            
                                        end
                                    end
                                else
                                    notfSys:addNotification(thePlayer, "Shoma Family Nadarid." , 'error')
                                end
                            end
                        end
                        dbFree(query)
                    end
                    setPlayerNametagText(taraf,getPlayerName(taraf).." ("..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(taraf), "pFamiId")),"tag")..") ["..getElementData(taraf,"TarafID").."]")
                    Message("Shoma Ba Movafaghiat Leader And Owner Family "..FamilyInfo(tonumber(familyid),"name").." Shodid.",taraf)
                    Message("Shoma Player "..getPlayerName(thePlayer).." Ba Movafaghiat Leader And Owner Family "..FamilyInfo(tonumber(familyid),"name").." Kardid.",thePlayer)
                else
                    Message("Chenin Family Vojod Nadarad.",taraf)
                end
            elseif tonumber(familyid) == 0 then
                setPlayerNametagText(taraf,getPlayerName(taraf).." ["..getElementData(taraf,"TarafID").."]")
                setElementData(accSys:getPlayerAcc(taraf), "pFamiId",0)
                setElementData(accSys:getPlayerAcc(taraf), "pRank",0)
                Message("Shoma Ba Movafaghiat Az Family Kharej Shodid.",taraf)
            end
        else
            outputChatBox("#C0C0C0Bezan: /<setfamilyleader/sfl> <PartOfName/ID> <FAMILY-ID>", thePlayer, 255, 22, 22, true)
        end
    else
        outputChatBox("#FF0000[ERROR]:Shoma Dastresi Be In CMD Nadarid.", thePlayer, 255, 22, 22, true)
    end
end
addCommandHandler("setfamilyleader",setfamilyleaders)
addCommandHandler("sfl",setfamilyleaders)

function makeleaderforfamily(thePlayer,cmd,target,familyid)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 7 then
        if target and familyid then
            local taraf = miscSys:findPlayer ( target )
            if familyid > 0 then
                if FamilyInfo(tonumber(familyid),"cheack") == true then
                    setElementData(accSys:getPlayerAcc(taraf), "pFamiId",tonumber(familyid))
                    setElementData(accSys:getPlayerAcc(taraf), "pRank",1)
                    setElementData(accSys:getPlayerAcc(taraf), "pMember",0)
                    Message("Shoma Ba Movafaghiat Member Family "..FamilyInfo(tonumber(familyid),"name").." Shodid.")
                else
                    Message("Chenin Family Vojod Nadarad.")
                end
            elseif familyid == 0 then
                setElementData(accSys:getPlayerAcc(taraf), "pFamiId",0)
                setElementData(accSys:getPlayerAcc(taraf), "pRank",0)
                Message("Shoma Ba Movafaghiat Az Family Kharej Shodid.")
            end
        else
            outputChatBox("#C0C0C0Bezan: /<makefamilymember/mml> <PartOfName/ID> <FAMILY-ID>", thePlayer, 255, 22, 22, true)
        end
    else
        outputChatBox("#FF0000[ERROR]:Shoma Dastresi Be In CMD Nadarid.", thePlayer, 255, 22, 22, true)
    end
end
addCommandHandler("makefamilymember",makeleaderforfamily)
addCommandHandler("mml",makeleaderforfamily)

function openFamilyManageLeaderPanel( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            if FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"active") == 1 then
			    triggerClientEvent("OpenPanelFamilyManage", thePlayer, thePlayer) 
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addEvent("OpenPanelFamilyManageServer",true)
addEventHandler("OpenPanelFamilyManageServer", root,openFamilyManageLeaderPanel)
------------------------------===================Eventaye Panel Manage Family==================-----------------------------------


function PoromotePlayerInFamily(player,taraf)
    if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > 8 then
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == taraf then
                    local tarafrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                    local taraffamilyid = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pFamiId"))
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) == 9 then
                                maxrank = 8
                            elseif tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) == 10 then
                                maxrank = 9
                            end
                            if tarafrank < 9 then
                                if tarafrank < maxrank then
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pRank",tarafrank+1 )
                                    local tarafnowrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                                    local esmnowrank = FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tarafnowrank)
                                    notfSys:addNotification(player, "Player "..getPlayerName(hame_Playera).." Ba Movafaghiat Be Rank "..esmnowrank.." Promot Shod!" , 'success')
                                    if hame_Playera ~= player then
                                        notfSys:addNotification(hame_Playera, "Shoma Tavasote "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tonumber(getElementData(accSys:getPlayerAcc(player), "pRank"))).." "..getPlayerName(player).." Ba Movafaghiat Be Rank "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tarafnowrank).." Poromot Yaftid!" , 'success')
                                    end
                                    return true
                                else
                                    notfSys:addNotification(player, "Max Ranki Ke Shoma Mitavanid Be In Fard Bedahid 8 Ast." , 'error')
                                    return true
                                end
                            else
                                notfSys:addNotification(player, "Rank Co-Leader Ra Nemishe Balatar Bord!" , 'error')
                                return true
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                            return true
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                        return true
                    end
                end
            end
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pName = ?",taraf)
            local result, numrows = dbPoll(AllFamilys, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local tarafrank = row['pRank']
                    local taraffamilyid = row['pFamiId']
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tarafrank < 9 then
                                local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pRank` = ? WHERE pName = ? AND pID = ?",tarafrank+1,taraf,row['pID'])
                                dbPoll(query3, 500)
                                notfSys:addNotification(player, "Player "..taraf.." Ba Movafaghiat Be Rank "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..row['pRank']+1).." Promot Shod!" , 'success')
                                dbFree(query3)
                                dbFree(AllFamilys)
                               
                            else
                                notfSys:addNotification(player, "Rank Co-Leader Ra Nemishe Balatar Bord!" , 'error')
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                    end
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Rank Kafi Baraye Anjam In Kar Ra Nadarid!", player, 230, 0, 0, true)
        end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", player, 230, 0, 0, true)
    end

end
addEvent("PoromotePlayerInFamily",true)
addEventHandler("PoromotePlayerInFamily", root, PoromotePlayerInFamily)

function DemotePlayerInFamily(player,taraf)
    if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > 8 then
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == taraf then
                    local tarafrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                    local taraffamilyid = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pFamiId"))
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tarafrank > 1 then
                                if tarafrank ~= 10 then
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pRank",tarafrank-1 )
                                    local tarafnowrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                                    local esmnowrank = FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tarafnowrank)

                                    notfSys:addNotification(player, "Player "..getPlayerName(hame_Playera).." Ba Movafaghiat Be Rank "..esmnowrank.." Demote Shod!" , 'warning')
                                    if hame_Playera ~= player then
                                        notfSys:addNotification(hame_Playera, "Shoma Tavasote "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tonumber(getElementData(accSys:getPlayerAcc(player), "pRank"))).." "..getPlayerName(player).." Be Rank "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tarafnowrank).." Demote Shodid!" , 'warning')
                                    end
                                    return true
                                else
                                    notfSys:addNotification(player, "Leader Ra Nemishe Demote Kard." , 'error')
                                    return true
                                end
                            else
                                notfSys:addNotification(player, "In Player Rankesh Yeke Va Nemishe Sefresh Krad(Baraye Ekhraj Az Gozine kick Estefade Konid)!" , 'error')
                                return true
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                            return true
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                        return true
                    end
                end
            end
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pName = ?",taraf)
            local result, numrows = dbPoll(AllFamilys, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local tarafrank = row['pRank']
                    local taraffamilyid = row['pFamiId']
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tarafrank > 1 then
                                local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pRank` = ? WHERE pName = ? AND pID = ?",tarafrank-1,taraf,row['pID'])
                                dbPoll(query3, 500)
                                notfSys:addNotification(player, "Player "..taraf.." Ba Movafaghiat Be Rank "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..row['pRank']+1).." Demote Shod!" , 'success')
                                dbFree(query3)
                                dbFree(AllFamilys)
                            else
                                notfSys:addNotification(player, "In Player Rankesh Yeke Va Nemishe Sefresh Krad(Baraye Ekhraj Az Gozine kick Estefade Konid)!" , 'error')
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                    end
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Rank Kafi Baraye Anjam In Kar Ra Nadarid!", player, 230, 0, 0, true)
        end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", player, 230, 0, 0, true)
    end

end
addEvent("DemotePlayerInFamily",true)
addEventHandler("DemotePlayerInFamily", root, DemotePlayerInFamily)

function KickPlayerInFamily(player,taraf)
    if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > 8 then
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true and getPlayerName(hame_Playera) == taraf then
                    local tarafrank = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRank"))
                    local taraffamilyid = tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pFamiId"))
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tarafrank < 10 or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref")  then
                                if tarafrank ~= 10 then
                                    

                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pRank",0 )
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pFamiId",0 )
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pTut",0 )
                                    setElementData(accSys:getPlayerAcc(hame_Playera), "pPunish",24 )
                                    notfSys:addNotification(player, "Player "..getPlayerName(hame_Playera).." Ba Movafaghiat Az Family Kick Shod Va 24 FP Daryaft Kard" , 'warning')
                                    if hame_Playera ~= player then
                                        notfSys:addNotification(hame_Playera, "Shoma Tavasote "..FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"frank"..tonumber(getElementData(accSys:getPlayerAcc(player), "pRank"))).." "..getPlayerName(player).." Az Family Kick Shodid! +24FP" , 'warning')
                                    end
                                    setPlayerNametagText(hame_Playera,getPlayerName(hame_Playera).." ["..getElementData(hame_Playera,"TarafID").."]")
                                    return true
                                else
                                    notfSys:addNotification(player, "Leader Ra Nemishe Kick Kard!" , 'error')
                                    return true
                                end
                            else
                                notfSys:addNotification(player, "Leader Ra Tanha Owner Family Mitavanad Kick Konad!" , 'error')
                                return true
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                            return true
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                        return true
                    end
                end
            end
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pName = ?",taraf)
            local result, numrows = dbPoll(AllFamilys, 500)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local tarafrank = row['pRank']
                    local taraffamilyid = row['pFamiId']
                    if tonumber(getElementData(accSys:getPlayerAcc(player), "pRank")) > tarafrank or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref") then
                        if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) == taraffamilyid then
                            if tarafrank < 10 or tonumber(getElementData(accSys:getPlayerAcc(player), "pID")) == FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")),"ownerref")  then
                                local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pRank` = 0 , `pFamiId` = 0 , `pTut` = 0 , `pPunish` = ? WHERE pName = ? AND pID = ?",row['pPunish']+24,taraf,row['pID'])
                                dbPoll(query3, 500)
                                notfSys:addNotification(player, "Player "..taraf.." Ba Movafaghiat Az Family Ba +24 FP Kick Shod!" , 'success')
                                dbFree(query3)
                                dbFree(AllFamilys)
                            else
                                notfSys:addNotification(player, "Leader Ra Tanha Owner Family Mitavanad Kick Konad!" , 'error')
                                
                            end
                        else
                            outputChatBox("#ff0000✖️ #ffffffIn Fard Dar Family Shoma Nist", player, 230, 0, 0, true)
                        end
                    else
                        outputChatBox("#ff0000✖️ #ffffffShoma Namitavanid Ham Rank Ya Rank Balatar Khod Ra Promot Konid. (#Tanha Owner Family Tavanye Anjam Chenin Kari Ra Darad!)", player, 230, 0, 0, true)
                    end
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Rank Kafi Baraye Anjam In Kar Ra Nadarid!", player, 230, 0, 0, true)
        end
    else
        outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", player, 230, 0, 0, true)
    end

end
addEvent("KickPlayerInFamily",true)
addEventHandler("KickPlayerInFamily", root, KickPlayerInFamily)

-----------------------------------------============================ParkingSystemFamily=================================------------------------------------------------
local mysqlhost1 = "127.0.0.1"
local mysqluser1 = "root"
local mysqlpassword1 = ""
local mysqldatabase1 = "thenightdb"

-- SECOND CONNECTION, OPTIONAL IF CONNECTION 1 DON'T WORK
local ParkingCar = {}
local mysqlhost2 = "127.0.0.1"
local mysqluser2 = "root"
local mysqlpassword2 = ""
local mysqldatabase2 = "thenightdb"
local dbpTime = 500 -- How many Miliseconds will use the dbPoll function for waiting for a result
local ParkingData = {}
local ParkingDataPickUp = {}
local ParkingOut = {}
local Parking = {}
local ParkingOutPickup = {}
local carposs = {
    [1] = {403.783203125 ,2600.5595703125 ,1497.1110839844, 0.472412109375 ,0 ,180.12084960938},
    [2] = {403.7861328125,2565.033203125,1496.8218994141,359.92858886719,0.1373291015625,0.32958984375},
    [3] = {413.626953125 ,2564.9228515625 ,1497.0914306641,0.50537109375 ,359.99450683594 ,357.08312988281},
    [4] = {423.3505859375 ,2565.015625 ,1496.814453125,359.92858886719 ,0.186767578125 ,1.34033203125},
    [5] = {433.1591796875 ,2565.0107421875 ,1496.8179931641 ,359.92858886719 ,0.1318359375 ,359.85168457031},
    [6] = {442.9375 ,2565.1025390625 ,1496.8157958984 ,359.92858886719 ,0.17578125 ,359.95056152344},
    [7] = {451.125 ,2564.984375 ,1496.7977294922 ,359.912109375 ,0.164794921875 ,0.15380859375},
    [8] = {459.12109375 ,2565.20703125 ,1496.7915039062 ,359.91760253906 ,0.164794921875 ,358.35754394531},
    [9] = {403.7001953125 ,2582.8486328125 ,1496.7176513672 ,0.0164794921875 ,0.0054931640625 ,0.9942626953125},
    [10] = {413.5478515625 ,2582.6650390625 ,1496.7183837891 ,0.0164794921875 ,359.98901367188 ,359.79675292969},
    [11] = {423.396484375 ,2582.87890625 ,1496.7244873047 ,0.0164794921875 ,359.98901367188 ,0.7525634765625},
    [12] = {433.08203125 ,2582.5185546875 ,1496.7121582031 ,0.02197265625 ,0.0054931640625 ,359.76928710938},
    [13] = {442.798828125 ,2582.375 ,1496.7092285156 ,0.032958984375 ,0.0439453125 ,359.33532714844},
    [14] = {451.1376953125 ,2582.701171875 ,1496.7911376953 ,359.91760253906 ,0.2142333984375 ,0.494384765625},
    [15] = {413.509765625 ,2600.6328125 ,1496.7911376953 ,359.91760253906 ,0.1702880859375 ,181.09313964844},
    [16] = {423.2265625 ,2600.44140625 ,1496.7985839844 ,359.91760253906 ,0.164794921875 ,180.59326171875},
    [17] = {433.009765625 ,2600.5419921875 ,1496.7918701172 ,359.912109375 ,0.1702880859375 ,180.20324707031},
    [18] = {442.8046875 ,2600.7265625 ,1496.7967529297 ,359.91760253906 ,0.120849609375 ,180.09887695312},
    [19] = {451.0712890625 ,2600.494140625 ,1496.7717285156 ,359.90112304688 ,0.1922607421875 ,181.04919433594},
    [20] = {459.150390625 ,2600.7080078125 ,1496.791015625 ,359.912109375 ,0.1702880859375 ,180.95031738281},
}
local function buildParkingFamily(pID,PX,PY,PZ)
	if (pID) and (PX) and (PY) and (PZ) then
        ParkingDataPickUp[pID] = {}
        ParkingData[pID] = {}
        Parking[pID] = {}
        ParkingCar[pID] = {}
        ParkingOut[pID] = {}
        ParkingOutPickup[pID] = {}
		ParkingDataPickUp[pID] = createPickup(PX,PY,tonumber(PZ), 3, 1860, 100)
        Parking[pID] = createColSphere(PX,PY,tonumber(PZ), 2)
        ParkingCar[pID] = createColSphere(PX,PY,tonumber(PZ), 6)
        ParkingData[pID]["X"] = PX
        ParkingData[pID]["Y"] = PY
        ParkingData[pID]["Z"] = PZ
        local objectparking = createObject( 1608, 427.287109375 ,2573.171875 ,1500,0, 0, 0 )
        setElementFrozen( objectparking, true )
        setElementInterior(objectparking,pID)
        setElementDimension( objectparking, pID)

        pickkhoroji = createPickup(409.326171875 ,2548.0380859375 ,1499.3707275391, 3, 1318, 100)
        setElementInterior(pickkhoroji, pID)
		setElementDimension(pickkhoroji, pID)

        ParkingOutPickup[pID] = createColSphere(409.326171875 ,2548.0380859375 ,1499.3707275391, 1.5)
		setElementInterior(ParkingOutPickup[pID], pID)
		setElementDimension(ParkingOutPickup[pID], pID)
        
        addEventHandler("onColShapeHit", ParkingCar[pID], function(hitElement)
            if(getElementType(hitElement) == "player") then
			    if getElementInterior(hitElement) == 0 then
                    if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) == pID then
                        if tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gx")) and tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gy")) and  tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gy"))  then
                            
                            if isPedInVehicle(hitElement) then
                                setElementData(hitElement, "LastParkingID", pID)
                            end
                        end
                    end
			    end
            end
		end)
        addEventHandler("onColShapeLeave",ParkingCar[pID],function(hitElement)
			setElementData(hitElement,"LastParkingID",false)
		end)
        addEventHandler("onColShapeHit", Parking[pID], function(hitElement)
            if(getElementType(hitElement) == "player") then
			    if getElementInterior(hitElement) == 0 then
                    if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) == pID then
                        if tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gx")) and tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gy")) and  tonumber(FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")),"gy"))  then
                            setElementData(hitElement, "LastParkingID", pID)
                            if isPedInVehicle(hitElement) then
                                local theVehicle = getPedOccupiedVehicle ( hitElement )
                                if getElementID(theVehicle) == "Family" then
                                    if getElementData(theVehicle,"owner") ==  pID then
                                        triggerClientEvent("OpenPanelInFamily", hitElement, hitElement)
                                    else
                                        return false
                                    end
                                else
                                    return false
                                end
                            else
			    	            
                                triggerClientEvent("OpenPanelInFamily", hitElement, hitElement)
                            end
                        else
                            Message( "Baraye Takmile Farayande Sakht Garage Family Savar Yek Mashin Shavid Va Ba CMD (/setgarage) Makan Khoroj Khodro Hara Az Parking Ra Moshakhas Konid",hitElement)
                        end
                    else
                        notfSys:addNotification(hitElement, "'"..FamilyInfo(pID,"name").."' Garage (Family ID: "..FamilyInfo(pID,"id")..")" , 'info')
                    end
			    end
            end
		end)

        addEventHandler("onColShapeLeave",Parking[pID],function(hitElement)
			setElementData(hitElement,"LastParkingID",false)
            triggerClientEvent("CloseInPanelGarageFam",hitElement,hitElement)
		end)

        
        ParkingOut[pID]= createColSphere( 410,2628 ,1500, 70)
        setElementInterior(ParkingOut[pID],pID)
        setElementDimension(ParkingOut[pID],pID)
        addEventHandler("onColShapeHit", ParkingOut[pID], function(hitElement)
            if(getElementType(hitElement) == "player") then
                if ParkingOut[getElementInterior(hitElement)] and getElementInterior(ParkingOut[pID]) == getElementInterior(hitElement) then 
                    if isPedInVehicle(hitElement) then
			            notfSys:addNotification(hitElement, "Baraye Khoroj Az CMD /tp Estefade Konid." , 'info')
                    end
			        setElementData(hitElement, "LastParkingIDINT", getElementInterior(hitElement))
                end
            end
		end)

        
        addEventHandler("onColShapeHit", ParkingOutPickup[pID], function(hitElement)
            if isPedInVehicle(hitElement) then
                notfSys:addNotification(hitElement, "Shoma Ejaze Vorode Be In Parking Ra Nadarid" , 'info')
            else
                if getElementData(hitElement,"LastParkingIDINT") and getElementDimension(hitElement) ~= 0 and getElementInterior(hitElement) ~= 0 then
                    triggerClientEvent("OpenPanelOUTFamily", hitElement, hitElement)
                end
            end
		end)

        addEventHandler("onColShapeLeave", ParkingOutPickup[pID], function(hitElement)
            if isPedInVehicle(hitElement) then
                notfSys:addNotification(hitElement, "Shoma Ejaze Vorode Be In Parking Ra Nadarid" , 'info')
            else
                if getElementData(hitElement,"LastParkingIDINT") and getElementDimension(hitElement) ~= 0 and getElementInterior(hitElement) ~= 0 then
                    triggerClientEvent("CloseOUTPanelGarageFam", hitElement, hitElement)
                    getElementData(hitElement,"LastParkingID",false)
                end
            end
		end)
	end	
end


function BildParking(fID,VehID,Slot)
    if fID and VehID > 0 and Slot then
        veh = createVehicle( VehID,carposs[Slot][1],carposs[Slot][2],carposs[Slot][3],carposs[Slot][4],carposs[Slot][5],carposs[Slot][6])
        setVehicleRespawnPosition( veh, carposs[Slot][1],carposs[Slot][2],carposs[Slot][3],carposs[Slot][4],carposs[Slot][5],carposs[Slot][6])
        setElementID( veh, "Family")
        setElementData( veh, "owner", fID )
        setVehicleColor( veh, FamilyInfo(fID,"R"), FamilyInfo(fID,"G"), FamilyInfo(fID,"B"))
        setElementInterior(veh,fID)
        setElementDimension( veh, fID)

    end
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
    if vehid == "Family" then 
        if getElementData(source,"owner") ~= tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
		    cancelEvent()
            local myfam = tonumber(getElementData(source,"owner"))
		    Message( "#ffffffIn Khodro Motalegh Be Family ("..RGBToHex(FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"))..""..FamilyInfo(myfam,"name").."#ffffff) Ast Va Shoma Nmitavanid Savar An Shavid!", thePlayer, 230,0,0 ,true)
        end
	end
end)
addEventHandler("onVehicleExplode", getRootElement(),
function ()
	local vehid = getElementID ( source )
    if vehid == "Family" then 
        setTimer(function()
            setElementData(source,"fuel",100)
            setElementDimension(source,getElementData(source,"owner"))
            setElementInterior(source,getElementData(source,"owner"))
        end,500,1)
	end
end)
--کصمادرش که از سورسا کپی برداری یا اصکی بره یا بدزدشون یا بکاپ بگیره
function VorodeBeParkingGarageFam(hitElement)
    if getElementData(hitElement,"LastParkingID") and getElementInterior(hitElement) == 0 and getElementDimension(hitElement) == 0 then
        local pID = getElementData(hitElement,"LastParkingID")
        if isPedInVehicle(hitElement) then
            local theVehicle = getPedOccupiedVehicle ( hitElement )
            for index,allPlayers in ipairs(getElementsByType("player")) do
                if getElementData(allPlayers, "loggedIn") == true then
                    if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == theVehicle then
                        setElementPosition(allPlayers, 394.1064453125 ,2553.2568359375 ,1497.9700927734 )
                        setElementInterior(allPlayers,pID)
                        setElementDimension(allPlayers,pID)
                        setElementPosition(theVehicle, 394.1064453125 ,2553.2568359375 ,1497.9700927734 )
                        setElementInterior(theVehicle,pID)
                        setElementDimension(theVehicle,pID)
                        setElementData(allPlayers, "LastParkingID", false)
                        triggerClientEvent("CloseInPanelGarageFam", allPlayers, allPlayers)
                    end
                end
            end
        else
            setElementPosition(hitElement, 394.1064453125 ,2553.2568359375 ,1497.9700927734 )
            setElementInterior(hitElement,pID)
            setElementDimension(hitElement,pID)
            setElementData(hitElement, "LastParkingID", false)
            triggerClientEvent("CloseInPanelGarageFam", hitElement, hitElement)
        end
    end
end
addEvent("VorodeBeParkingGarageFam",true)
addEventHandler("VorodeBeParkingGarageFam", root,VorodeBeParkingGarageFam)


function KhorojeBeParkingGarageFam(hitElement)
    if getElementData(hitElement,"LastParkingIDINT") and getElementDimension(hitElement) ~= 0 and getElementInterior(hitElement) ~= 0 then
        local pID = getElementData(hitElement,"LastParkingID")
        if getElementInterior(hitElement) ~= 0 then
            if isPedInVehicle(hitElement) then
                return false
            end
            triggerClientEvent("CloseOUTPanelGarageFam", hitElement, hitElement)
            setElementPosition(hitElement, ParkingData[tonumber(getElementData(hitElement,"LastParkingIDINT"))]["X"],ParkingData[tonumber(getElementData(hitElement,"LastParkingIDINT"))]["Y"],ParkingData[tonumber(getElementData(hitElement,"LastParkingIDINT"))]["Z"])
            setElementInterior(hitElement,0)
            setElementDimension(hitElement,0)
        end
    end
end
addEvent("KhorojeBeParkingGarageFam",true)
addEventHandler("KhorojeBeParkingGarageFam", root,KhorojeBeParkingGarageFam)

addCommandHandler("tp",function(hitElement)
    if getElementData(hitElement,"LastParkingIDINT") then
        if getElementInterior(hitElement) ~= 0 then
            if isPedInVehicle(hitElement) then
                local famid = tonumber(getElementData(hitElement,"LastParkingIDINT"))
                local theVehicle = getPedOccupiedVehicle ( hitElement )
                setElementPosition(theVehicle, FamilyInfo(famid,"gx"),FamilyInfo(famid,"gy"),FamilyInfo(famid,"gz") )
                setElementRotation(theVehicle, FamilyInfo(famid,"rx"),FamilyInfo(famid,"ry"),FamilyInfo(famid,"rz"))
                setElementInterior(theVehicle,0)
                setElementDimension(theVehicle,0)
                for index,allPlayers in ipairs(getElementsByType("player")) do
                    if getElementData(allPlayers, "loggedIn") == true then
                        if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == theVehicle then
                            setElementPosition(allPlayers, FamilyInfo(famid,"gx"),FamilyInfo(famid,"gy"),FamilyInfo(famid,"gz") )
                            setElementInterior(allPlayers,0)
                            setElementDimension(allPlayers,0)      
                            setElementData(allPlayers, "LastParkingID", false)
                            setElementData(allPlayers, "LastParkingIDINT", false) 
                        end
                    end
                end
            else
                notfSys:addNotification(hitElement, "Baraye Inkar Bayad Savar Bar Mashin Family Bashid" , 'info')
            end
        end
    end
end)

function housesys_startup()
	if(created == true) then
		error("Parking Family Allready created!")
		return
	end
	buildStartTick = getTickCount()
	local query = dbQuery(handler, "SELECT * FROM familys;" )
	local result, numrows = dbPoll(query, dbpTime)
	if (result and numrows > 0) then
		for index, row in pairs(result) do
            if row['fPgx'] ~= "" and row['fPgy'] ~= "" and row['fPgz'] ~= "" then
			    buildParkingFamily(row['fID'],row['fPgx'],row['fPgy'],row['fPgz'])
                for i=1,20 do
                    if row['veh'..i] then
                        BildParking(row['fID'],row['veh'..i],i)
                    end
                end	
            end
		end
		dbFree(query)
	else
		error("Family Table not Found/empty!")
	end
	created = true

end


-- /link --
addCommandHandler("unlink", function(thePlayer)
	if(getElementData(thePlayer, "house:lastvisit")) and (getElementData(thePlayer, "house:lastvisit") ~= false)  then
		local house = getElementData(thePlayer, "house:lastvisit")
		if(house) then
			local id = house
            local query = dbQuery(handler, "SELECT * FROM `houses` WHERE `ID` = ?",house )
            local result, numrows = dbPoll(query, dbpTime)
            if (result and numrows > 0) then
                for index, row in pairs(result) do
                    local owner = row['OWNER']

			        if(owner ~= getPlayerName(thePlayer)) then
			        	outputChatBox("Shoma Nemitavanid In Khane Ra Unlink Konid!", thePlayer, 255, 0, 0)
			        else
                        local pID = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
			        	if pID > 0 then
			        		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys` WHERE `fID` = ?",pID )
			        		local result, numrows = dbPoll(query, 500)
			        		if (result and numrows > 0) then
			        			for index, row in pairs(result) do
                                    HouseSys:setHouseData(id, "Linked", 0)
			        				if FamilyInfo(pID,"px") ~= "" and FamilyInfo(pID,"py") ~= "" and FamilyInfo(pID,"pz") ~= "" then

			        					
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgx",nil)
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgy",nil)
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgz",nil)
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGx",nil)
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGy",nil)
                                        SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGz",nil)
                                        if ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))] then
                                            destroyElement(ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                            destroyElement(Parking[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                            destroyElement(ParkingOut[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                        end
                                        
			        					notfSys:addNotification(thePlayer, "House Shoma Ba Movafaghiat UnLink Shod." , 'error')


			        				end
                                    
                                    
			        			end
			        		end
			        	else
			        		notfSys:addNotification(thePlayer, "Shoma Family Nadarid." , 'error')
			        	end
			        end
                end
            end
		end
	end
end)


addEventHandler("onResourceStart", getResourceRootElement(), function()
	handler = dbConnect("mysql", "dbname="..mysqldatabase1..";host="..mysqlhost1, mysqluser1, mysqlpassword1, "autoreconnect=1")
	-- If the Handler 1 dont work
	if not(handler) then	
		outputServerLog("[FamilySystem]MySQL handler 1 not accepted! Trying secondary handler...")	
		handler = dbConnect("mysql", "dbname="..mysqldatabase2..";host="..mysqlhost2, mysqluser2, mysqlpassword2, "autoreconnect=1")
		if not(handler) then
			outputServerLog("[FamilySystem]MySQL handler 2 not accepted! Shutting down...")
			cancelEvent()
		else
			outputServerLog("[FamilySystem]MySQL handler 2 accepted!")
			housesys_startup()
		end
	else
		outputServerLog("[FamilySystem]MySQL handler 1 accepted!")
		housesys_startup()
	end
end)



function DelFamily(root,Familyname,FamilyOwners,fshoard)
    local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
    local result, numrows = dbPoll(query, 500)
    if (result and numrows > 0) then
        for index, row in pairs(result) do
            if row['fName'] == Familyname and row['fShoar'] == fshoard then
                local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users`")
                local result2, numrows2 = dbPoll(query2, 500)
                if (result2 and numrows2 > 0) then
                    for index2, row2 in pairs(result2) do
                        if row['fOwner'] == row2['pID'] then
                            for index,allpl in ipairs(getElementsByType("player")) do
                                if getElementData(allpl, "loggedIn") == true then
                                    if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId"))  == row['fID'] then
                                        setElementData(accSys:getPlayerAcc(allpl), "pFamiId",0)
                                        setElementData(accSys:getPlayerAcc(allpl), "pRank",0)
                                        setPlayerNametagText(allpl,getPlayerName(allpl).." ["..getElementData(allpl,"TarafID").."]")
                                        notfSys:addNotification(allpl, "Family "..row['fName'].." Delete Shod Va Shoma Az Family Kick Shodid!" , 'error')
                                    end
                                end
                            end
                            local query5 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `houses` WHERE `Linked` = ?",row['fID'] )
                            local result5, numrows5 = dbPoll(query5, 500)
                            if (result5 and numrows5 > 0) then
                                for index5, row5 in pairs(result5) do
                                    HouseSys:setHouseData(row5['ID'], "Linked", 0)
                                    local pID = tonumber(row['fID'])
                                    if FamilyInfo(pID,"px") ~= "" and FamilyInfo(pID,"py") ~= "" and FamilyInfo(pID,"pz") ~= "" then
                                        SetElementFamily(row['fID'],"fPgx",nil)
                                        SetElementFamily(row['fID'],"fPgy",nil)
                                        SetElementFamily(row['fID'],"fPgz",nil)
                                        SetElementFamily(row['fID'],"fGx",nil)
                                        SetElementFamily(row['fID'],"fGy",nil)
                                        SetElementFamily(row['fID'],"fGz",nil)   
                                        destroyElement(ParkingDataPickUp[pID])
                                        destroyElement(Parking[row['fID']])
                                        destroyElement(ParkingOut[row['fID']])
                                        notfSys:addNotification(thePlayer, "House Shoma Ba Movafaghiat UnLink Shod." , 'error')
                                    end
                                end
                            end
                            local query4 = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET `pFamiId`=0,`pRank`= 0 WHERE `pFamiId` = ?",row['fID'])
                            dbPoll(query4, 500)
                            local query3 = dbQuery(exports.mysql:getMySQLC(), "DELETE FROM `familys` WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                            dbPoll(query3, 500)
                            if isElement(root) then
                                notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Delete Shod!" , 'success')
                            end
                        end
                    end
                end
            end            
        end
    end
end
function DokmeCheangeLocaGarage( thePlayer )
	if getElementData(thePlayer, "loggedIn") == true then
        local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
		if myfam > 0 then
            if FamilyInfo(myfam,"active") == 1 then
                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                    local Allhouses = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `houses` WHERE `Linked` = ?",myfam)
                    local result, numrows = dbPoll(Allhouses, 500)
                    if (result and numrows > 0) then
                        for index, row in pairs(result) do
                            local x,y,z = getElementPosition(thePlayer)
                            if tonumber(getDistanceBetweenPoints3D(x,y,z,row['X'],row['Y'],row['Z'])) < 32 and getElementDimension(thePlayer) == 0 and getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 then

                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgx",nil)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgy",nil)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fPgz",nil)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGx",nil)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGy",nil)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGz",nil)
                                if isElement(ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))]) then
                                    destroyElement(ParkingDataPickUp[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                end
                                if isElement(ParkingOut[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))]) then
                                    destroyElement(ParkingOut[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                end
                                if isElement(Parking[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))]) then
                                    destroyElement(Parking[tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))])
                                end
                                if isPedOnGround(thePlayer) then
                                    Message( "Shoma Ba Movafaghiat Makan Parking Fam Ra Moshakhas Kardid. Hal Savar Yek Mashin Shavid Va Ba CMD (/setgarage) Makan Khoroj Khodro Hara Az Parking Ra Moshakhas Konid",thePlayer)
                                    SetElementFamily(myfam,"fPgx",x)
                                    SetElementFamily(myfam,"fPgy",y)
                                    SetElementFamily(myfam,"fPgz",z)
                                    buildParkingFamily(myfam,x,y,z)
                                    return true
                                else
                                    Message("#ff0000[Error]:#FFFFFF Bayad Rooye Zamin Bashid!",thePlayer)
                                end

                            else
                                notfSys:addNotification(thePlayer, "Baraye Inkar Bayad DarFasele 32 Metri Khane Family Bashid" , 'error')
                                return true
                            end
                        end

                    else
                        notfSys:addNotification(thePlayer, "Baraye Inkar Ebteda Family Khodra Link Konid." , 'error')
                    end
                else
                    notfSys:addNotification(thePlayer, "Inkar Tanha Az Dast Leader Va Co-Leader Bar Miayad!" , 'error')
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addEvent("DokmeCheangeLocaGarage",true)
addEventHandler("DokmeCheangeLocaGarage", root,DokmeCheangeLocaGarage)
addEvent("DelFamily",true)
addEventHandler("DelFamily", root,DelFamily)
function SendFamMassege(id,text)
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl, "loggedIn") == true then
            local myfam = tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId"))
            if tonumber(id) == myfam then
                outputChatBox(RGBToHex(FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B")).."("..FamilyInfo(myfam,"name").."): #FFFFFF"..text,allpl,255,255,255,true)
            end
        end
    end
end

function RespawnCarFamilys(root)
    if not Spamer[root] then
        local myfam = tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId"))
		if myfam > 0 then
            if tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")) > 6 then
                for _,p in ipairs (getElementsByType("vehicle")) do
                    local vehid = getElementID ( p )
                    if vehid == "Family" then 
                        if getElementData(p,"owner") == myfam then
                            if getVehicleController( p ) then
                            else
                                setElementInterior(p,myfam)
                                setElementDimension(p,myfam)
                                respawnVehicle(p)
                                setElementData(p,"fuel",100)
                            end
                        end
                    end
                end
                SendFamMassege(myfam,"Tamami Khodro Haye Family Tavasot #808080"..getPlayerName(root).." #FFFFFFRespawn Shodand!")
            end
        end
    else
        notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Konid." , 'error')
    end
end
addEvent("RespawnCarFamilys",true)
addEventHandler("RespawnCarFamilys", root,RespawnCarFamilys)
addCommandHandler("frv",RespawnCarFamilys)


function BuyCarForFamily(thePlayer,IdVeh,price,name)
    if (thePlayer) and (IdVeh) then
        if not Spamer[thePlayer] then
            local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
            if myfam > 0 then
                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 6 then
                    AllVehInFam = 0
                    for _,p in ipairs (getElementsByType("vehicle")) do
                        local vehid = getElementID ( p )
                        if vehid == "Family" then 
                            if getElementData(p,"owner") == myfam then
                                AllVehInFam = AllVehInFam + 1
                            end
                        end
                    end
                    if AllVehInFam < FamilyInfo(myfam,"vehslot") then
                        if getPlayerMoney(thePlayer) >= tonumber(price) then
                            SetElementFamily(myfam,"veh"..AllVehInFam+1,IdVeh)
                            veh = createVehicle( IdVeh,carposs[AllVehInFam+ 1][1],carposs[AllVehInFam+ 1][2],carposs[AllVehInFam+ 1][3],carposs[AllVehInFam+ 1][4],carposs[AllVehInFam+ 1][5],carposs[AllVehInFam+ 1][6])
                            setVehicleRespawnPosition( veh, carposs[AllVehInFam+ 1][1],carposs[AllVehInFam+ 1][2],carposs[AllVehInFam+ 1][3],carposs[AllVehInFam+ 1][4],carposs[AllVehInFam+ 1][5],carposs[AllVehInFam+ 1][6])
                            setElementID( veh, "Family")
                            setElementData( veh, "owner", myfam )
                            setVehicleColor( veh, FamilyInfo(myfam,"R"), FamilyInfo(myfam,"G"), FamilyInfo(myfam,"B"))
                            setElementInterior(veh,myfam)
                            setElementDimension( veh, myfam)
                            takePlayerMoney(thePlayer,tonumber(price))
                            SendFamMassege(myfam,"#00ff00Player #808080("..getPlayerName(thePlayer)..") #00ff00Yek Dastgah Khodro #808080"..name.." #00ff00Baray Family Kharidari Kard.")
                        else
                            notfSys:addNotification(thePlayer, "Shoma Pool Kafi Nadarid." , 'error')
                        end
                    else
                        notfSys:addNotification(thePlayer, "Shoma Slot Veh Kafi Nadarid." , 'error')
                    end

                end
            end
        else
            notfSys:addNotification(thePlayer, "Lotfan "..Spamer[thePlayer].." Sanye Digar Emtehan Konid." , 'error')
        end
    end
end
addEvent("BuyCarForFamily",true)
addEventHandler("BuyCarForFamily", root,BuyCarForFamily)


function setlocaoutcar(thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
        local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
		if myfam > 0 then
            if FamilyInfo(myfam,"active") == 1 then
                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pRank")) > 8 then
                    if FamilyInfo(myfam,"px") and FamilyInfo(myfam,"py") and FamilyInfo(myfam,"pz") then
                        if isPedInVehicle(thePlayer) then
                            local veh = getPedOccupiedVehicle (thePlayer)
                            local x,y,z = getElementPosition( veh )
                            local rotx,roty,rotz = getElementRotation ( veh )
                            if tonumber(getDistanceBetweenPoints3D(x,y,z,tonumber(FamilyInfo(myfam,"px")),tonumber(FamilyInfo(myfam,"py")),tonumber(FamilyInfo(myfam,"pz")))) < 10 and getElementDimension(thePlayer) == 0 and getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 then
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGx",x)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGy",y)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGz",z)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGrx",rotx)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGry",roty)
                                SetElementFamily(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"fGrz",rotz)
                                notfSys:addNotification(thePlayer, "Posation Khoroj Mashin Az Garage Family Ba Movafaghiat Set Shod" , 'success')
                            else
                                notfSys:addNotification(thePlayer, "Baraye Inkar Bayad DarFasele 10 Metri Parking Family Bashid" , 'error')
                                return true
                            end
                        else
                            notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Savar Mashin Bashi" , 'error')
                        end
                    else
                        notfSys:addNotification(thePlayer, "Ebteda Parking Ra Besazid" , 'error')
                    end
                else
                    notfSys:addNotification(thePlayer, "Inkar Tanha Az Dast Leader Va Co-Leader Bar Miayad!" , 'error')
                end
            end
        else
            outputChatBox("#ff0000✖️ #ffffffShoma Dar Hal Hazer Dar Family Ozv Nistid!", thePlayer, 230, 0, 0, true)
		end
	end
end
addCommandHandler("setgarage",setlocaoutcar)
---------------------------=============Event Kamion Material==============---------------------------


local LV = {
    [1] = {1326.1015625,1325.125,10.637783050537,359.45617675781,359.85717773438,0.208740234375}, 
    [2] = {2305.552734375,1516.7802734375,36.281089782715,359.46716308594,359.87365722656,179.85168457031}, 
    [3] = {2404.4013671875,2552.171875,21.733816146851,359.46716308594,359.87365722656,270.01098632812}, 
    [4] = {645.26953125,2836.1171875,25.600261688232,2.7630615234375,5.174560546875,272.77404785156}, 
    [5] = {-536.140625,2594.0615234375,53.274169921875,359.45617675781,359.85717773438,269.92309570312}, 
    [6] = {-1908.431640625,2580.8818359375,44.973968505859,3.790283203125,348.81591796875,300.37170410156}, 
    [7] = {683.859375,894.337890625,-39.860328674316,355.66040039062,0.9722900390625,92.466430664062}, 
    [8] = {909.7353515625,-6.306640625,91.277198791504,359.67041015625,6.0919189453125,44.967041015625}, 
    [9] = {150.7822265625,1375.447265625,10.444727897644,359.46716308594,359.87365722656,358.9013671875}, 
    [10] = {-793.0703125,1437.6806640625,13.649025917053,359.48364257812,359.80773925781,92.741088867188}, 
}
local SF = {
    [1] = {-2547.1875,643.0810546875,14.315101623535,359.46716308594,359.6923828125,90.126342773438}, 
    [2] = {-1338.279296875,-141.4130859375,5.8594884872437,359.46716308594,359.87365722656,90.406494140625}, 
    [3] = {-2984.876953125,470.521484375,4.7732338905334,359.46716308594,359.87365722656,270.03845214844}, 
    [4] = {-2984.876953125,470.521484375,4.7732338905334,359.46716308594,359.87365722656,270.03845214844}, 
    [5] = {-1980.4912109375,-833.126953125,25.577379226685,359.46716308594,359.87365722656,359.37927246094}, 
    [6] = {-2679.4365234375,1476.587890625,7.045223236084,359.46166992188,359.87365722656,270.00549316406}, 
    [7] = {-1812.7724609375,1301.5224609375,59.592922210693,359.46166992188,359.87365722656,276.8994140625}, 
    [8] = {-2142.00390625,-829.5517578125,31.882946014404,359.46716308594,358.86291503906}, 
    [9] = {-2194.6865234375,989.98046875,79.860359191895,359.46716308594,359.87365722656,0.4229736328125}, 
    [10] = {-1630.302734375,276.767578125,7.046856880188,359.46716308594,359.87365722656,267.78076171875}, 
}
local LS = {
    [1] = {2583.912109375,-2174.298828125,-0.31376215815544,359.47265625,359.89013671875,359.99450683594}, 
    [2] = {2804.009765625,-1447.697265625,16.091724395752,359.384765625,359.74731445312,177.94555664062}, 
    [3] = {2377.171875,-650.8740234375,127.32769012451,359.54406738281,358.59924316406,265.78125}, 
    [4] = {1920.826171875,-1410.0810546875,13.429601669312,359.46716308594,359.87365722656,88.39599609375}, 
    [5] = {1801.3486328125,-2326.0927734375,-2.8203394412994,359.36279296875,359.99450683594,90.263671875}, 
    [6] = {2510.376953125,-2624.5107421875,13.50431728363,359.49462890625,359.87365722656,89.939575195312}, 
    [7] = {755.478515625,-1259.771484375,13.421946525574,359.48364257812,359.88464355469,89.35729980468}, 
    [8] = {-65.560546875,-1400.890625,1.9201704263687,358.14331054688,2.3785400390625,37.650146484375}, 
    [9] = {639.302734375,-500.470703125,16.19489669799,359.46716308594,359.87365722656,359.77478027344}, 
    [10] = {1032.87890625,-300.4111328125,73.8517303466,359.46166992188,359.88464355469,179.39575195312}, 
}
function TeghsimBeynAzayeFam(famid)
    local tedad = 0
    for index,allPlayers in ipairs(getElementsByType("player")) do
        if getElementData(allPlayers, "loggedIn") == true then
            if tonumber(getElementData(accSys:getPlayerAcc(allPlayers), "pFamiId")) == famid then
                tedad = tedad + 1
            end
        end
    end
    return tedad
end
local Kamions = {}
local BlipKamion = {}
local timer = 300000

addEventHandler ( "onVehicleStartEnter", getRootElement(), 
function ( thePlayer, seat, jacked ) 
	local vehid = getElementID ( source )
    if vehid == "KamionMat" then 
        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) == 0 then
            outputChatBox("#FF1010[Error]#FFFFFF: Shoma Ozv Family Nistid!",thePlayer,255,255,255,true)
		    cancelEvent()
        end
	end
end)

addEventHandler ( "onVehicleEnter", getRootElement(), 
function ( thePlayer, seat, jacked )
	local vehid = getElementID ( source )
    if vehid == "KamionMat" then 
        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) >= 0 then
            local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
            setVehicleColor(source,FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"),FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"))
            setVehicleDamageProof(source, true)

        end
	end
end)

function endeventkamion()
    if BlipKamion[1] then
        if isElement(BlipKamion[1]) then
            destroyElement(BlipKamion[1])
        end
    end
    if BlipKamion[2] then
        if isElement(BlipKamion[2]) then
            destroyElement(BlipKamion[2])
        end
    end
    if BlipKamion[3] then 
        if isElement(BlipKamion[3]) then
            destroyElement(BlipKamion[3])
        end
    end
    for _,theVeh in ipairs (getElementsByType("vehicle")) do
        if getElementID(theVeh) == "KamionMat" then
            destroyElement(theVeh)
        end
    end
    nowevent = false
end

function createKamion(x,y,z,rx,ry,rz,id)
    setTimer(function()
        veh = createVehicle(573,x,y,z,rx,ry,rz)
        setVehicleColor(veh,255,255,255,255,255,255)
        setElementID(veh,"KamionMat")
        setElementData(veh,"id",id)
        destroyElement(BlipKamion[id])
    end,300000,1)
end
TimerKamion = {}
function StartEventKamionMat()
    local id = 0
    if TimerKamion[1] then
        killTimer(TimerKamion[1])
    end
    if TimerKamion[2] then
        killTimer(TimerKamion[2])
    end
    if TimerKamion[2] then
        if isTimer( TimerKamion[2] ) then
            killTimer(TimerKamion[2])

        end
    end
    endeventkamion()

    nowevent = true
    for index,allpl in ipairs(getElementsByType("player")) do
        outputChatBox("#808080(( Tavajoh! Makan #FFFFFFx3 #808080Kamion Mahmoole [Material] Bar Roye Map Moshakhas Shod Va Ta #FF00005 Daghighe #808080Digar Spawn Mishavand ))",allpl,255,255,255,true) 
    end
    for i=1,1 do
        Kamions[i] = {}
        c = math.random(#LS)
        id = id + 1
        BlipKamion[id] = createBlip(LS[c][1],LS[c][2],LS[c][3],34 )
        setElementData(BlipKamion[id], "exclusiveBlip", true)
        createKamion(LS[c][1],LS[c][2],LS[c][3],LS[c][4],LS[c][5],LS[c][6],id)
        id = id + 1
        LVR = math.random(#LV)
        BlipKamion[id] = createBlip(LV[LVR][1],LV[LVR][2],LV[LVR][3],34 )
        setElementData(BlipKamion[id], "exclusiveBlip", true)
        createKamion(LV[LVR][1],LV[LVR][2],LV[LVR][3],LV[LVR][4],LV[LVR][5],LV[LVR][6],id)
        id = id + 1
        SFR = math.random(#SF)
        BlipKamion[id] = createBlip(SF[SFR][1],SF[SFR][2],SF[SFR][3],34 )
        setElementData(BlipKamion[id], "exclusiveBlip", true)
        createKamion(SF[SFR][1],SF[SFR][2],SF[SFR][3],SF[SFR][4],SF[SFR][5],SF[SFR][6],id)
    end
    TimerKamion[1] = setTimer(function()
        for index,allpl in ipairs(getElementsByType("player")) do
            outputChatBox("#808080(( Tavajoh! #FFFFFFx3 #808080Kamion Mahmoole [Material] #00FF00Spawn #808080Shod ))",allpl,255,255,255,true) 
            if getElementData(allpl, "loggedIn") == true then
                notfSys:addWarning(allpl,"(( Kamion Haml Matrial Spawn Shod ))","warning")
            end
        end
    end,300000,1)
    TimerKamion[2] = setTimer(function() endeventkamion() nowevent = false end,2400000,1)
    TimerKamion[2] = nil
    TimerKamion[1] = nil
end

function putkamion (thePlayer)
    if (getElementType(thePlayer) == "player") then
        if isPedInVehicle(thePlayer) then
            if getPedOccupiedVehicle ( thePlayer ) then
                local theVehicle = getPedOccupiedVehicle ( thePlayer )
                if getElementID(theVehicle) == "KamionMat" then
                    if getElementData(thePlayer,"LastParkingID") then
                        if getElementData(thePlayer,"LastParkingID") == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
                            destroyElement(theVehicle)
                            local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                            local meterial = 45000/TeghsimBeynAzayeFam(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")))
                            local money = 5000000/TeghsimBeynAzayeFam(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")))
                            for index,allpl in ipairs(getElementsByType("player")) do
                                outputChatBox("#808080(( Kamione Hamle Mahmoole Tavasote Player '"..getPlayerName(thePlayer).."' Az Family "..RGBToHex(FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"))..""..FamilyInfo(myfam,"name").." #808080Tahvil Dade Shod ))",allpl,255,255,255,true) 
                            end
                            for index,allpl in ipairs(getElementsByType("player")) do
                                if getElementData(allpl, "loggedIn") == true then
                                    if myfam == tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId")) then
                                        setElementData(accSys:getPlayerAcc(allpl), "pMats", tonumber(meterial) + tonumber(getElementData(accSys:getPlayerAcc(allpl), "pMats")))
                                        givePlayerMoney( allpl, money )
                                    end
                                end
                            end
                            SetElementFamily(myfam,"fScore",FamilyInfo(myfam,"score")+10)
                            SendFamMassege(myfam,"Kamion Tahvil Dade Shod #00FF00+10 Family Score")
                            SendFamMassege(myfam,"Tamamiye Azaye Family #404040"..meterial.." Material #FFFFFFDaryaft Kardand")
                            SendFamMassege(myfam,"Tamamiye Azaye Family #404040"..money.." Money #FFFFFFDaryaft Kardand")
                        end
                    end
                end
            end
        end
    end
end
addCommandHandler("putkamion",putkamion)
addEventHandler("OnGlobalTimer", root, function()
    for _,theVeh in ipairs (getElementsByType("vehicle")) do
        if isElementInWater(theVeh) then
            if getElementID(theVeh) == "KamionMat" then
                if getElementData(theVeh,"id") == 1 or getElementData(theVeh,"id") == 4 or getElementData(theVeh,"id") == 7 then
                    c = math.random(#LS)
                    BlipKamion[getElementData(theVeh,"id")] = createBlip(LS[c][1],LS[c][2],LS[c][3],34 )
                    setElementData(BlipKamion[getElementData(theVeh,"id")], "exclusiveBlip", true)
                    createKamion(LS[c][1],LS[c][2],LS[c][3],LS[c][4],LS[c][5],LS[c][6],getElementData(theVeh,"id"))
                elseif getElementData(theVeh,"id") == 2 or getElementData(theVeh,"id") == 5 or getElementData(theVeh,"id") == 8 then
                    LVR = math.random(#LV)
                    BlipKamion[getElementData(theVeh,"id")] = createBlip(LV[LVR][1],LV[LVR][2],LV[LVR][3],34 )
                    setElementData(BlipKamion[getElementData(theVeh,"id")], "exclusiveBlip", true)
                    createKamion(LV[LVR][1],LV[LVR][2],LV[LVR][3],LV[LVR][4],LV[LVR][5],LV[LVR][6],getElementData(theVeh,"id"))
                elseif getElementData(theVeh,"id") == 3 or getElementData(theVeh,"id") == 6 or getElementData(theVeh,"id") == 9 then
                    SFR = math.random(#SF)
                    BlipKamion[getElementData(theVeh,"id")] = createBlip(SF[SFR][1],SF[SFR][2],SF[SFR][3],34 )
                    setElementData(BlipKamion[getElementData(theVeh,"id")], "exclusiveBlip", true)
                    createKamion(SF[SFR][1],SF[SFR][2],SF[SFR][3],SF[SFR][4],SF[SFR][5],SF[SFR][6],getElementData(theVeh,"id"))
                end
                for index,allpl in ipairs(getElementsByType("player")) do
                    outputChatBox("#808080 (( Tvajoh! Kamion Shomare #FFFFFF["..getElementData(theVeh,"id").."] #808080Dar Ab Oftad Va Bad Az 5 Daghighe Dobare #00FF00Spawn #808080Mishavad ))",allpl,255,255,255,true) 
                end
                destroyElement(theVeh)
            end
        end
    end
end)

-----------------------------------=====================End Kamion System=====================-----------------------------------
-----------------------------------=====================Start JetWar System===================-----------------------------------
--[[function spawnjetwar()
    local hillArea = createColRectangle (111.50390625 ,1336.0039062, 176, 149 )
    function hill_Enter ( thePlayer, matchingDimension )
        if (getElementType(thePlayer) == "player") then

            setElementDimension(thePlayer,70)
            takeAllWeapons(thePlayer)
            if (doesPedHaveJetPack(thePlayer) ) then
                removePedJetPack(thePlayer)  
                givePedJetPack( thePlayer )
                giveWeapon( thePlayer, 32,10000 )
                setPedWeaponSlot( thePlayer, 4 )
            end

            if isPedInVehicle(thePlayer) then
                local x,y,z = getElementPosition(thePlayer)

                removePedFromVehicle( thePlayer )
                setTimer(function()givePedJetPack(thePlayer)giveWeapon(thePlayer,32,10000)setPedWeaponSlot(thePlayer,4)end, 800,1 )

            else
                givePedJetPack( thePlayer )
                giveWeapon( thePlayer, 32,10000 )
                setPedWeaponSlot( thePlayer, 4 )
            end
            notfSys:addNotification(thePlayer, "*Shoma Vared Mantaghe JetWar Shodid*" , 'warning')

        end
    end
    addEventHandler ( "onColShapeHit", hillArea, hill_Enter )
    function hill_Leave ( thePlayer, matchingDimension )
        if (getElementType(thePlayer) == "player") then
            if getElementDimension(thePlayer) == 70 and getElementInterior(thePlayer) == 0 then 
                if isPedInVehicle(thePlayer) then
                    destroyElement(getPedOccupiedVehicle ( thePlayer ))
                else
                    notfSys:addNotification(thePlayer, "*Shoma Az Mantaghe JetWar Kharej Shodid*" , 'warning')
                    takeAllWeapons(thePlayer)
                    if ( doesPedHaveJetPack(thePlayer) ) then
                        removePedJetPack(thePlayer)
                    end

                    if getElementDimension(thePlayer) == 70 and getElementInterior(thePlayer) == 0 then
                        setElementDimension(thePlayer,0)
                    end
                    setElementData(thePlayer,"inJetWar",false)
                end
            end
        end
    end
    addEventHandler ( "onColShapeLeave", hillArea, hill_Leave )

end
spawnjetwar()]]
-----------------------------------=====================End JetWar System=====================-----------------------------------
-----------------------------------=====================Start Keshti System=====================-----------------------------------
local tedadkeshtiforspawn = 1


local Bombers={}
local StartMarker = {}
local DoorBoomb = {}
local DoorHack = {}
local NeonsDoor = {}
local BoxMat1 = {}
local BoxMat2 = {}
local BoxMat3 = {}
local BoxMat4 = {}
local BoxMat5 = {}
local BoxMat6 = {}
local BoxMat7 = {}
local BoxMat8 = {}
local BoxMat9 = {}
local BoxMat10 = {}
local BoxMat11 = {}
local keyscid = {}
local gateforhackid = {}
local KeshtiObjec = {}
local blipkeshti = {}



function destroyobjectkeshtimat ()
    for i=1,tedadkeshtiforspawn do
        if StartMarker[i] then
            if isElement(StartMarker[i]) then
                destroyElement(StartMarker[i])
            end
        end
        if DoorBoomb[i] then
            if isElement(DoorBoomb[i]) then
                destroyElement(DoorBoomb[i])
            end
        end
        if DoorHack[i] then
            if isElement(DoorHack[i]) then
                destroyElement(DoorHack[i])
            end
        end
        if NeonsDoor[i][1] then
            if isElement(NeonsDoor[i][1]) then
                destroyElement(NeonsDoor[i][1])
            end
        end
        if NeonsDoor[i][2] then
            if isElement(NeonsDoor[i][2]) then
                destroyElement(NeonsDoor[i][2])
            end
        end
        if NeonsDoor[i][3] then
            if isElement(NeonsDoor[i][3]) then
                destroyElement(NeonsDoor[i][3])
            end
        end
        if NeonsDoor[i][4] then
            if isElement(NeonsDoor[i][4]) then
                destroyElement(NeonsDoor[i][4])
            end
        end
        if BoxMat1[i] then
            if isElement(BoxMat1[i]) then
                destroyElement(BoxMat1[i])
            end
        end
        if BoxMat2[i] then
            if isElement(BoxMat2[i]) then
                destroyElement(BoxMat2[i])
            end
        end
        if BoxMat3[i] then
            if isElement(BoxMat3[i]) then
                destroyElement(BoxMat3[i])
            end
        end
        if BoxMat4[i] then
            if isElement(BoxMat4[i]) then
                destroyElement(BoxMat4[i])
            end
        end
        if BoxMat5[i] then
            if isElement(BoxMat5[i]) then
                destroyElement(BoxMat5[i])
            end
        end
        if BoxMat6[i] then
            if isElement(BoxMat6[i]) then
                destroyElement(BoxMat6[i])
            end
        end
        if BoxMat7[i] then
            if isElement(BoxMat7[i]) then
                destroyElement(BoxMat7[i])
            end
        end
        if BoxMat8[i] then
            if isElement(BoxMat8[i]) then
                destroyElement(BoxMat8[i])
            end
        end
        if BoxMat9[i] then
            if isElement(BoxMat9[i]) then
                destroyElement(BoxMat9[i])
            end
        end
        if BoxMat10[i] then
            destroyElement(BoxMat10[i])
        end
        if BoxMat11[i] then
            if isElement(BoxMat11[i]) then
                destroyElement(BoxMat11[i])
            end
        end
        if keyscid[i] then
            if isElement(keyscid[i]) then
                destroyElement(keyscid[i])
            end
        end
        if gateforhackid[i] then
            if isElement(gateforhackid[i]) then
                destroyElement(gateforhackid[i])
            end
        end
        if KeshtiObjec[i][1] then
            if isElement(KeshtiObjec[i][1]) then
                destroyElement(KeshtiObjec[i][1])
            end
        end
        if KeshtiObjec[i][2] then
            if isElement(KeshtiObjec[i][2]) then
                destroyElement(KeshtiObjec[i][2])
            end
        end
        if KeshtiObjec[i][3] then
            if isElement(KeshtiObjec[i][3]) then
                destroyElement(KeshtiObjec[i][3])
            end
        end
        if KeshtiObjec[i][4] then
            if isElement(KeshtiObjec[i][4]) then
                destroyElement(KeshtiObjec[i][4])
            end
        end
        if blipkeshti[i] then
            if isElement(blipkeshti[i]) then
                destroyElement(blipkeshti[i])
            end
        end
        nowevent = false
    end
end




local keshtipos = {
    --<< MODEL,X,Y,Z,RX,RY,RZ, ModelDoormBoomb X,Y,Z, RX,RY,RZ >>--
    [1] = {10230,31.4,384.60001,7.7,0,0,0 , 2634,78.517456054688 ,385.13592529297 ,11.921062469482,0,0,270},
}
local KantinerKeshti = {
    [1] = {10140,46.12,383.54999,7.85,0,0,0},
}
local DakhelKeshti = {
    --<Dakhel Sehti>--<DoorHack>--
    [1] = {10231,30.5,383.10001,9.1,0,0,0 , 2634,70.386596679688 ,385.10760498047 ,9.6312503814697,0,0,270},
}
local DakhelKeshti2 = {
    [1] = {10229,31.2,383.20001,6.5,0,0,0,69.629760742188 ,383.96014404297},
}
local neons = {
    [1] = {18215,71.595581054688 ,385.09979248047,10 ,71.595581054688 ,385.09979248047,10.8,71.595581054688 ,385.09979248047,11.6,0,0,0},
}
local  pickups = {
    [1] = {76.328002929688 ,387.18084716797 ,11.92812538147},
}
local boxs = {
    [1] = {19.184452056885,388.14080810547,2 , 19.184452056885,378.62322998047, 2 ,23.184452056885,388.14080810547, 2 ,23.184452056885,378.62322998047, 2 ,27.184452056885,388.14080810547, 2 ,27.184452056885,378.62322998047, 2 ,31.184452056885,388.14080810547, 2 ,31.184452056885,378.62322998047, 2,35.184452056885,388.14080810547, 2 ,35.184452056885,378.62322998047, 2 },
}
local compyter = {
    [1] = {},
}
local gateforhack = {
    [1] = {74.406127929688 ,387.91326904297 ,3.2,0,0,-90},
}
local keysc = {
    [1] = {79 ,388.69061279297 ,2,0,0,-90},
}
function spawnkeshti()
    for i=1,tedadkeshtiforspawn do
        setTimer(function() destroyobjectkeshtimat() nowevent = false  end, 3000000,1)

        NeonsDoor[i] = {}
        nowevent = true 
        RANDOMKAMIONPOS = math.random(#keshtipos)
        blipkeshti[i] = createBlip(keshtipos[RANDOMKAMIONPOS][2],keshtipos[RANDOMKAMIONPOS][3],keshtipos[RANDOMKAMIONPOS][4],11)
        setElementData(blipkeshti[i], "exclusiveBlip", true)
        NeonsDoor[i][1] = createObject(neons[RANDOMKAMIONPOS][1],neons[RANDOMKAMIONPOS][2],neons[RANDOMKAMIONPOS][3],neons[RANDOMKAMIONPOS][4],neons[RANDOMKAMIONPOS][11],neons[RANDOMKAMIONPOS][12],neons[RANDOMKAMIONPOS][13])
        NeonsDoor[i][2] = createObject(neons[RANDOMKAMIONPOS][1],neons[RANDOMKAMIONPOS][5],neons[RANDOMKAMIONPOS][6],neons[RANDOMKAMIONPOS][7],neons[RANDOMKAMIONPOS][11],neons[RANDOMKAMIONPOS][12],neons[RANDOMKAMIONPOS][13])
        NeonsDoor[i][3] = createObject(neons[RANDOMKAMIONPOS][1],neons[RANDOMKAMIONPOS][8],neons[RANDOMKAMIONPOS][9],neons[RANDOMKAMIONPOS][10],neons[RANDOMKAMIONPOS][11],neons[RANDOMKAMIONPOS][12],neons[RANDOMKAMIONPOS][13])
        NeonsDoor[i][4] = createColRectangle(DakhelKeshti2[RANDOMKAMIONPOS][8],DakhelKeshti2[RANDOMKAMIONPOS][9],2,2.5)
        BoxMat1[i] = createObject(1271,boxs[RANDOMKAMIONPOS][1],boxs[RANDOMKAMIONPOS][2],boxs[RANDOMKAMIONPOS][3])
        BoxMat2[i] = createObject(1271,boxs[RANDOMKAMIONPOS][4],boxs[RANDOMKAMIONPOS][5],boxs[RANDOMKAMIONPOS][6])
        BoxMat3[i] = createObject(1271,boxs[RANDOMKAMIONPOS][7],boxs[RANDOMKAMIONPOS][8],boxs[RANDOMKAMIONPOS][9])
        BoxMat4[i] = createObject(1271,boxs[RANDOMKAMIONPOS][10],boxs[RANDOMKAMIONPOS][11],boxs[RANDOMKAMIONPOS][12])
        BoxMat5[i] = createObject(1271,boxs[RANDOMKAMIONPOS][13],boxs[RANDOMKAMIONPOS][14],boxs[RANDOMKAMIONPOS][15])
        BoxMat6[i] = createObject(1271,boxs[RANDOMKAMIONPOS][16],boxs[RANDOMKAMIONPOS][17],boxs[RANDOMKAMIONPOS][18])
        BoxMat7[i] = createObject(1271,boxs[RANDOMKAMIONPOS][19],boxs[RANDOMKAMIONPOS][20],boxs[RANDOMKAMIONPOS][21])
        BoxMat8[i] = createObject(1271,boxs[RANDOMKAMIONPOS][22],boxs[RANDOMKAMIONPOS][23],boxs[RANDOMKAMIONPOS][24])
        BoxMat9[i] = createObject(1271,boxs[RANDOMKAMIONPOS][13],boxs[RANDOMKAMIONPOS][14],boxs[RANDOMKAMIONPOS][15])
        BoxMat10[i] = createObject(1271,boxs[RANDOMKAMIONPOS][25],boxs[RANDOMKAMIONPOS][26],boxs[RANDOMKAMIONPOS][27])
        BoxMat11[i] = createObject(1271,boxs[RANDOMKAMIONPOS][28],boxs[RANDOMKAMIONPOS][29],boxs[RANDOMKAMIONPOS][30])
        gateforhackid[i] = createObject(2634,gateforhack[RANDOMKAMIONPOS][1],gateforhack[RANDOMKAMIONPOS][2],gateforhack[RANDOMKAMIONPOS][3],gateforhack[RANDOMKAMIONPOS][4],gateforhack[RANDOMKAMIONPOS][5],gateforhack[RANDOMKAMIONPOS][6])
        addEventHandler("onColShapeHit",root,function(hiter)
            if source == NeonsDoor[i][4] then
                local x,y,z = getElementPosition(hiter)
                if getDistanceBetweenPoints3D(x,y,z,neons[RANDOMKAMIONPOS][2],neons[RANDOMKAMIONPOS][3],neons[RANDOMKAMIONPOS][4]) > 3 then return end
                notfSys:addNotification(hiter, "Tavasote Lasera Koshte Shodi. Dafe Badi Havaseto Jam Kon." , 'warning')
                setElementHealth(hiter,0)
            end
        end)
        NeonsDoor[i][5] = createPickup (pickups[RANDOMKAMIONPOS][1],pickups[RANDOMKAMIONPOS][2],pickups[RANDOMKAMIONPOS][3], 3, 1239, 0)
        addEventHandler("onPickupHit",NeonsDoor[i][5],function(hitElement)
            if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) > 0 then
                setElementData(hitElement,"KeshtiHack",i)
                notfSys:addNotification(hitElement, "Baraye Khamosh Kardan Layser Haye Amniyati /hack Bezan." , 'info')
            end
        end)
        addEventHandler("onPickupLeave",NeonsDoor[i][5],function(hitElement)
            
            setElementData(hitElement,"KeshtiHack",0)
            triggerClientEvent("ClosePanelHackKeshti", hitElement, hitElement)
            
        end)
        addEventHandler("onElementClicked",getRootElement(),function(button, state, player)
            if button == "left" and state == "down" and isElement(source) then
                if getElementType( source ) == "object" then
                    
                    local x, y, z = getElementPosition( player )
                    local x1, y1, z1 = getElementPosition( source ) 
                    local fasele22 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
                    if getElementInterior(player) == 0 and getElementDimension(player) == 0 then
                        if fasele22 < 5.2 then
                            if getElementData(player,"pMatForPut") == false then
                                setElementData(player,"pMatForPut",0)
                            end
                            if source == BoxMat1[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat1[i])
                                        BoxMat1[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end
                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat2[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat2[i])
                                        BoxMat2[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat3[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat3[i])
                                        BoxMat3[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end
                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat4[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat4[i])
                                        BoxMat4[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat5[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat5[i])
                                        BoxMat5[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end
                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat6[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat6[i])
                                        BoxMat6[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat7[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat7[i])
                                        BoxMat7[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat8[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat8[i])
                                        BoxMat8[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat9[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat9[i])
                                        BoxMat9[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end
                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat10[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut")+45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat10[i])
                                        BoxMat10[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            elseif source == BoxMat11[i] then
                                if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                    if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 45000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+45000)
                                        destroyElement(BoxMat11[i])
                                        BoxMat11[i] = false
                                    else
                                        notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                    end

                                else
                                    notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                                end
                            end
                        end
                    end
                end
            end
        end)
        KeshtiObjec[i] = {}
        KeshtiObjec[i][1] = createObject(keshtipos[RANDOMKAMIONPOS][1],keshtipos[RANDOMKAMIONPOS][2],keshtipos[RANDOMKAMIONPOS][3],keshtipos[RANDOMKAMIONPOS][4],keshtipos[RANDOMKAMIONPOS][5],keshtipos[RANDOMKAMIONPOS][6],keshtipos[RANDOMKAMIONPOS][7] )
        KeshtiObjec[i][2] = createObject(DakhelKeshti2[RANDOMKAMIONPOS][1],DakhelKeshti2[RANDOMKAMIONPOS][2],DakhelKeshti2[RANDOMKAMIONPOS][3],DakhelKeshti2[RANDOMKAMIONPOS][4],DakhelKeshti2[RANDOMKAMIONPOS][5],DakhelKeshti2[RANDOMKAMIONPOS][6],DakhelKeshti2[RANDOMKAMIONPOS][7] )
        KeshtiObjec[i][3] = createObject(KantinerKeshti[RANDOMKAMIONPOS][1],KantinerKeshti[RANDOMKAMIONPOS][2],KantinerKeshti[RANDOMKAMIONPOS][3],KantinerKeshti[RANDOMKAMIONPOS][4],KantinerKeshti[RANDOMKAMIONPOS][5],KantinerKeshti[RANDOMKAMIONPOS][6],KantinerKeshti[RANDOMKAMIONPOS][7] )
        KeshtiObjec[i][4] = createObject(DakhelKeshti[RANDOMKAMIONPOS][1],DakhelKeshti[RANDOMKAMIONPOS][2],DakhelKeshti[RANDOMKAMIONPOS][3],DakhelKeshti[RANDOMKAMIONPOS][4],DakhelKeshti[RANDOMKAMIONPOS][5],DakhelKeshti[RANDOMKAMIONPOS][6],DakhelKeshti[RANDOMKAMIONPOS][7] )
        DoorHack[i] = createObject(DakhelKeshti[RANDOMKAMIONPOS][8],DakhelKeshti[RANDOMKAMIONPOS][9] ,DakhelKeshti[RANDOMKAMIONPOS][10] ,DakhelKeshti[RANDOMKAMIONPOS][11]+0.1, DakhelKeshti[RANDOMKAMIONPOS][12], DakhelKeshti[RANDOMKAMIONPOS][13], DakhelKeshti[RANDOMKAMIONPOS][14])
        DoorBoomb[i] = createObject(keshtipos[RANDOMKAMIONPOS][8],keshtipos[RANDOMKAMIONPOS][9] ,keshtipos[RANDOMKAMIONPOS][10] ,keshtipos[RANDOMKAMIONPOS][11]+0.1, keshtipos[RANDOMKAMIONPOS][12], keshtipos[RANDOMKAMIONPOS][13], keshtipos[RANDOMKAMIONPOS][14])
        StartMarker[i] = createMarker (keshtipos[RANDOMKAMIONPOS][9] ,keshtipos[RANDOMKAMIONPOS][10] ,keshtipos[RANDOMKAMIONPOS][11], "cylinder", 0.8,111,175,230,0 )
        addEventHandler("onMarkerHit",StartMarker[i],function(hitElement)
	    if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) and getElementDimension(hitElement) == 0 and getElementInterior(hitElement) == 0 then
            if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) > 0 then
	    	    notfSys:addNotification(hitElement, "Baraye Shoro /c4 Bezanid" , 'info')
                setElementData(hitElement,"KeshtiDoor",i)
            else
                notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
            end
        end end)
        addEventHandler("onMarkerLeave",StartMarker[i],function(hitElement)
        if (hitElement and getElementType(hitElement) == "player" and not isPedInVehicle(hitElement)) then
            setElementData(hitElement,"KeshtiDoor",0)
        end end)
        keyscid[i] = createObject (1285,keysc[RANDOMKAMIONPOS][1],keysc[RANDOMKAMIONPOS][2],keysc[RANDOMKAMIONPOS][3],keysc[RANDOMKAMIONPOS][4],keysc[RANDOMKAMIONPOS][5],keysc[RANDOMKAMIONPOS][6] ) 
        setElementData(keyscid[i],"PasswordEnterForGateFamily",true)
        setElementData(keyscid[i],"GateID",i)
        --setTimer(destroyobjectkeshtimat(),3600000,1)
        setTimer(function()
            destroyobjectkeshtimat()
        end,3600000,1)
    end
    for index,allpl in ipairs(getElementsByType("player")) do
        outputChatBox("#808080(( Keshti Hamel Mahmole [Material] DeadSec Spawn Shod Family Haye Aziz Be Mahal Moshakhas Shode Bar Roye Map Beravid ))",allpl,255,255,255,true) 
    end
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl, "loggedIn") == true then
            notfSys:addWarning(allpl,"(( Keshti Hamel Mahmole [Material] DeadSec Spawn Shod ))","warning")
        end
    end
end

addCommandHandler("c4",function(thePlayer)
    local TheDoor = getElementData(thePlayer,"KeshtiDoor") or 0
    if TheDoor ~= 0 then
        local x,y,z = getElementPosition(thePlayer)
        local de = getDistanceBetweenPoints3D(x,y,z,keshtipos[TheDoor][9] ,keshtipos[TheDoor][10] ,keshtipos[TheDoor][11])

        if StartMarker[TheDoor] ~= false and DoorBoomb[TheDoor] and de < 5 then
            notfSys:addNotification(thePlayer, "Boomb Kar Gozashte Shod Farar Kon" , 'warning')
            destroyElement(StartMarker[TheDoor])
            StartMarker[TheDoor] = false
            setTimer(function()
                createExplosion(keshtipos[TheDoor][9] ,keshtipos[TheDoor][10] ,keshtipos[TheDoor][11], 3)
                destroyElement(DoorBoomb[TheDoor])
                setElementData(thePlayer,"KeshtiDoor",0)
            end,5000,1)
        end
    end
end)

addCommandHandler("hack",function(thePlayer)
    if getElementData(thePlayer,"KeshtiHack") then
        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            local TheDoor = getElementData(thePlayer,"KeshtiHack")
            if TheDoor ~= 0 and TheDoor ~= false and getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 and TheDoor  then
                triggerClientEvent("OpenPanelHack", thePlayer, thePlayer)
            end
        else
            notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
        end
    end
end)

function bazkondarekeshtio(thePlayer)
    if getElementData(thePlayer,"KeshtiHack") then
        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
            local TheDoor = getElementData(thePlayer,"KeshtiHack")
            if TheDoor ~= 0 and TheDoor ~= false and getElementInterior(thePlayer) == 0 and getElementDimension(thePlayer) == 0 and TheDoor  then
                destroyElement(NeonsDoor[TheDoor][1])
                destroyElement(NeonsDoor[TheDoor][2])
                destroyElement(NeonsDoor[TheDoor][3])
                destroyElement(NeonsDoor[TheDoor][4])
                destroyElement(NeonsDoor[TheDoor][5])
                local dx,dy,dz = getElementPosition(DoorHack[TheDoor])
                local drx,dry,dyz = getElementRotation(DoorHack[TheDoor])
                moveObject( DoorHack[TheDoor], 1000, dx,dy,dz-5,drx,dry,dyz )
                setElementData(thePlayer,"KeshtiHack",0)
            end
        else
            notfSys:addNotification(thePlayer, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
        end
    end
end
addEvent("bazkondarekeshtio",true)
addEventHandler("bazkondarekeshtio", root, bazkondarekeshtio)

function moveObjectDoorAfterBreakSec(idgateforbrak)
    if idgateforbrak then
        local x,y,z = getElementPosition(gateforhackid[idgateforbrak])
        local rx,ry,rz = getElementPosition(gateforhackid[idgateforbrak])
        moveObject( gateforhackid[idgateforbrak], 1000, x,y,z-4 )
        destroyElement(keyscid[idgateforbrak])
    end
end
addEvent("moveObjectDoorAfterBreakSec",true)
addEventHandler("moveObjectDoorAfterBreakSec", root, moveObjectDoorAfterBreakSec)

function putmaterialforkeshti(thePlayer)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then
        if getElementInterior(thePlayer) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) and getElementDimension(thePlayer) == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then 
            if tonumber(getElementData(thePlayer,"pMatForPut")) > 1 then
                local myfam = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
                local meterial = tonumber(getElementData(thePlayer,"pMatForPut"))/TeghsimBeynAzayeFam(myfam)
                local money = meterial*5
                for index,allpl in ipairs(getElementsByType("player")) do
                    if getElementData(allpl, "loggedIn") == true then
                        if myfam == tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId")) then
                            setElementData(accSys:getPlayerAcc(allpl), "pMats", tonumber(meterial) + tonumber(getElementData(accSys:getPlayerAcc(allpl), "pMats")))
                            givePlayerMoney(allpl,money)
                        end
                    end
                end
                
                if BlipAirDropBox["player"] == thePlayer then
                    destroyElement(BlipAirDropBox[thePlayer])
                    for index,allpl in ipairs(getElementsByType("player")) do
                        outputChatBox("#808080(( Mahmole Air Drop Tavasote Player '"..getPlayerName(thePlayer).."' Az Family "..RGBToHex(FamilyInfo(myfam,"R"),FamilyInfo(myfam,"G"),FamilyInfo(myfam,"B"))..""..FamilyInfo(myfam,"name").." #808080Tahvil Dade Shod.))",allpl,255,255,255,true) 
                    end
                end
                BlipAirDropBox["player"] = false
                setElementData(thePlayer,"pMatForPut",0)
                SetElementFamily(myfam,"fScore",FamilyInfo(myfam,"score")+5)
                SendFamMassege(myfam,"Baste Material Put Shod #00FF00+5 Family Score")
                SendFamMassege(myfam,"Material Daryafti: #404040+"..convertNumber(meterial).." g #FFFFFFMoney Daryafti: #00FF00+"..convertNumber(money).." $")
            else
                notfSys:addNotification(thePlayer, "Shoma Hich Materiali Nadarid." , 'error')
            end
        end
    end
end
addCommandHandler("put",putmaterialforkeshti)

addCommandHandler("fdelete",function(root,cmd)
    if tonumber(getElementData(accSys:getPlayerAcc(root), "pFamiId")) > 0 then
        if tonumber(getElementData(accSys:getPlayerAcc(root), "pRank")) > 9 then
            if not Spamer[root] then
                timerantispam(root)
                local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`;")
                local result, numrows = dbPoll(query, 500)
                if (result and numrows > 0) then
                    for index, row in pairs(result) do
                        if row['fName'] == Familyname and row['fShoar'] == fshoard then
                            local query2 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `users`")
                            local result2, numrows2 = dbPoll(query2, 500)
                            if (result2 and numrows2 > 0) then
                                for index2, row2 in pairs(result2) do
                                    if row['fOwner'] == row2['pID'] then
                                        for index,allpl in ipairs(getElementsByType("player")) do
                                            if getElementData(allpl, "loggedIn") == true then
                                                if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId"))  == row['fID'] then
                                                    setElementData(accSys:getPlayerAcc(allpl), "pFamiId",0)
                                                    setElementData(accSys:getPlayerAcc(allpl), "pRank",0)
                                                    setPlayerNametagText(allpl,getPlayerName(allpl).." ["..getElementData(allpl,"TarafID").."]")
                                                    notfSys:addNotification(allpl, "Family "..row['fName'].." Delete Shod Va Shoma Az Family Kick Shodid!" , 'error')
                                                end
                                            end
                                        end
                                        local query5 = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `houses` WHERE `Linked` = ?",row['fID'] )
                                        local result5, numrows5 = dbPoll(query5, 500)
                                        if (result5 and numrows5 > 0) then
                                            for index5, row5 in pairs(result5) do
                                                HouseSys:setHouseData(row5['ID'], "Linked", 0)
                                                local pID = tonumber(row['fID'])
                                                if FamilyInfo(pID,"px") ~= "" and FamilyInfo(pID,"py") ~= "" and FamilyInfo(pID,"pz") ~= "" then
                                                    SetElementFamily(row['fID'],"fPgx",nil)
                                                    SetElementFamily(row['fID'],"fPgy",nil)
                                                    SetElementFamily(row['fID'],"fPgz",nil)
                                                    SetElementFamily(row['fID'],"fGx",nil)
                                                    SetElementFamily(row['fID'],"fGy",nil)
                                                    SetElementFamily(row['fID'],"fGz",nil)   
                                                    destroyElement(ParkingDataPickUp[pID])
                                                    destroyElement(Parking[row['fID']])
                                                    destroyElement(ParkingOut[row['fID']])
                                                    notfSys:addNotification(thePlayer, "House Shoma Ba Movafaghiat UnLink Shod." , 'error')
                                                end
                                            end
                                        end
                                        local query4 = dbQuery(exports.mysql:getMySQLC(),"UPDATE `users` SET `pFamiId`=0,`pRank`= 0 WHERE `pFamiId` = ?",row['fID'])
                                        dbPoll(query4, 500)
                                        local query3 = dbQuery(exports.mysql:getMySQLC(), "DELETE FROM `familys` WHERE `fName` = ? AND `fOwner` = ?", tostring(Familyname),tonumber(row2['pID']))
                                        dbPoll(query3, 500)
                                        notfSys:addNotification(root, "Family "..row['fName'].." Ba Movafaghiat Delete Shod!" , 'success')
                                    end
                                end
                            end
                        end            
                    end
                end
            else
                notfSys:addNotification(root, "Lotfan "..Spamer[root].." Sanye Digar Emtehan Kon." , 'error')
            end
        else
            notfSys:addNotification(root, "Shoma Owner Family Nistid." , 'error')
        end
    else
        notfSys:addNotification(root, "Shoma Ozv Family Nistid." , 'error')
    end
end)

addCommandHandler("mymatforput",function(player)
    outputChatBox(tonumber(getElementData(player,"pMatForPut")),player,255,255,255,true)
end)
local pickupmaterial = {}
local pricepickupmaterial = {}
function whenPlayerDeath()
    if tonumber(getElementData(source,"pMatForPut")) > 0 then
        local x,y,z = getElementPosition(source)
        pickupmaterial[source] = createPickup (x,y,z, 3, 1575, 0)
        setElementInterior(pickupmaterial[source],getElementInterior(source))
        setElementDimension(pickupmaterial[source],getElementDimension(source))
        local forairdrop = false
        if BlipAirDropBox["player"] == source then
            destroyElement(BlipAirDropBox[source])
            forairdrop = true
            BlipAirDropBox[1] = createBlipAttachedTo( pickupmaterial[source], 4 )
            setElementData(BlipAirDropBox[1] , "exclusiveBlip", true)
        end

        pricepickupmaterial[pickupmaterial[source]] = tonumber(getElementData(source,"pMatForPut"))
        setElementData(source,"pMatForPut",0)
        addEventHandler("onPickupHit",pickupmaterial[source],function(hitElement)
            if tonumber(getElementData(accSys:getPlayerAcc(hitElement), "pFamiId")) > 0 then
                if getElementData(hitElement,"pMatForPut") == false then
                    setElementData(hitElement,"pMatForPut",0)
                end
                if (tonumber(getElementData(hitElement,"pMatForPut")) + tonumber(pricepickupmaterial[source])) <= 90000 then
                    destroyElement(BlipAirDropBox[1])
                    destroyElement(source)
                    if forairdrop == true then
                        BlipAirDropBox[hitElement] = createBlipAttachedTo(hitElement, 4 )
                        setElementData(BlipAirDropBox[hitElement] , "exclusiveBlip", true)
                        BlipAirDropBox["player"] = hitElement
                    end
                    outputChatBox("*Shoma Pack Material Ra Az Roye Zamin Bardashtid +"..pricepickupmaterial[source].." Mat*",hitElement,255,255,255,true)
                    setElementData(hitElement,"pMatForPut",pricepickupmaterial[source])
                else
                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                end
            end
        end)
    end
end
addEventHandler("onPlayerWasted", root, whenPlayerDeath)
addEventHandler("onPlayerQuit", getRootElement(), whenPlayerDeath)


-----------------------------------=====================End Keshti System=======================-----------------------------------
-----------------------------------=====================Start Drop System=======================-----------------------------------

function SpawnDropFamily()
    destroyeventairdrop()

    nowevent = true
    local SOLZONEDROP = createColCuboid (-75.8,-395.9,0,93.5,127,500)
    local DROPRADARAREA = createRadarArea (-75.869140625,-396.163085937,93.5,127,255,0,0,170)
    
    setRadarAreaFlashing ( DROPRADARAREA, true )
    setTimer(function()
        nowevent = false
        destroyeventairdrop()
        if SOLZONEDROP then
            if isElement(SOLZONEDROP) then
                destroyElement(SOLZONEDROP)
            end
        end
        if DROPRADARAREA then
            if isElement(DROPRADARAREA) then
                destroyElement(DROPRADARAREA)
            end
        end
    end,3000000,1)
    function DROOPZONEIN ( thePlayer, matchingDimension )
        if (getElementType(thePlayer) == "player") then
            notfSys:addNotification(thePlayer, "*Shoma Varede Mantaghe Havaie Shodid*" , 'warning')
            if isPedInVehicle(thePlayer) then
                local theplayervehicleplayer = getPedOccupiedVehicle ( thePlayer )
                for index,allPlayers in ipairs(getElementsByType("player")) do
                    if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == thePlayer then
                        removePedFromVehicle( allPlayers )
                        notfSys:addNotification(allPlayers, "*Khodro Shoma Respawn Shod*" , 'error')
                    end
                end
                respawnVehicle(thePlayer)
            end

        elseif (getElementType(thePlayer) == "vehicle") then
            for index,allPlayers in ipairs(getElementsByType("player")) do
                if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == thePlayer then
                    removePedFromVehicle( allPlayers )
                    notfSys:addNotification(allPlayers, "*Khodro Shoma Respawn Shod*" , 'error')
                end
            end
            respawnVehicle(thePlayer)
        end
    end
    addEventHandler ("onColShapeHit", SOLZONEDROP, DROOPZONEIN )
    function DROOPZONELEAVE ( thePlayer, matchingDimension )
        if (getElementType(thePlayer) == "player") then
            notfSys:addNotification(thePlayer, "*Shoma Az Mantaghe Havaie Kharej Shodid*" , 'warning')
        end
    end
    addEventHandler ( "onColShapeLeave", SOLZONEDROP, DROOPZONELEAVE )

    for index,allpl in ipairs(getElementsByType("player")) do
        outputChatBox("#808080((ICA Director : Havapeyma Mahmole [Material] Mi6 Tavasote Agent Haye ICA Robode Shod Va Material Haye Mojod Dar Havapeyma Dar Mantaghe Moshakhas Shode Drop Shodand))",allpl,255,255,255,true) 
    end
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl, "loggedIn") == true then
            notfSys:addWarning(allpl,"(( Mantaghe Drop [Material] Mi6 Spawn Shod ))","warning")
        end
    end
    setTimer(function()
        destroyairdrops()
        local kifedrop1 = createObject( 2903, -4.0009765625 ,-305.005859375 ,271.4296875, 0,0,0 )
        setElementFrozen( kifedrop1, true )
        moveObject( kifedrop1, 10000, -4.0009765625 ,-305.005859375 ,7,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop1, 2919 )
            moveObject( kifedrop1, 500, -4.0009765625 ,-305.005859375 ,5,0,0,0 )
        end,10000, 1 )
        local kifedrop2 = createObject( 2903, -48.3359375 ,-387.744140625 ,271.4296875, 0,0,0 )
        setElementFrozen( kifedrop2, true )
        moveObject( kifedrop2, 10000, -48.3359375 ,-387.744140625 ,7.5,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop2, 2919 )
            moveObject( kifedrop2, 500, -48.3359375 ,-387.744140625 ,6,0,0,0 )
        end,10000, 1 )
        local kifedrop3 = createObject( 2903, -63.9833984375 ,-340.01953125 ,271.4296875, 0,0,0 )
        setElementFrozen( kifedrop3, true )
        moveObject( kifedrop3, 10000, -63.9833984375 ,-340.01953125 ,7,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop3, 2919 )
            moveObject( kifedrop3, 500, -63.9833984375 ,-340.01953125 ,5,0,0,0 )
        end,10000, 1 )
        local kifedrop4 = createObject( 2903, -73.06640625 ,-334.482421875 ,271.4296875, 0,0,0 )
        setElementFrozen( kifedrop4, true )
        moveObject( kifedrop4, 10000, -73.06640625 ,-334.482421875 ,7.5,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop4, 2919 )
            moveObject( kifedrop4, 500, -73.06640625 ,-334.482421875 ,6,0,0,0 )
        end,10000, 1 )
        local kifedrop6 = createObject( 2903, -49.896484375 ,-272.63671875 ,271.642024993896, 0,0,0 )
        setElementFrozen( kifedrop6, true )
        moveObject( kifedrop6, 10000, -49.896484375 ,-272.63671875 ,14,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop6, 2919 )
            moveObject( kifedrop6, 500, -49.896484375 ,-272.63671875 ,12,0,0,0 )
        end,10000, 1 )
        local kifedrop7 = createObject( 2903, -49.896484375 ,-272.63671875 ,271.642024993896, 0,0,0 )
        setElementFrozen( kifedrop7, true )
        moveObject( kifedrop7, 10000, -49.896484375 ,-272.63671875 ,14,0,0,0 )
        setTimer(function()
            setElementModel( kifedrop7, 2919 )
            moveObject( kifedrop7, 500, -49.896484375 ,-272.63671875 ,12,0,0,0 )
        end,10000, 1 )
        addEventHandler("onElementClicked",getRootElement(),function(button, state, player)
            if button == "left" and state == "down" and isElement(source) then
                if isElement(source) and source then
                else
                    return
                end
                if getElementType( source ) == "object" then
                    local x, y, z = getElementPosition( player )
                    local x1, y1, z1 = getElementPosition( source ) 
                    local fasele22 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
                    if fasele22 < 5.2 then
                        if getElementData(player,"pMatForPut") == false then
                            setElementData(player,"pMatForPut",0)
                        end
                        if source == kifedrop1 then
    
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+4500)
                                    destroyElement(kifedrop1)
                                    kifedrop1 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        elseif source == kifedrop2 then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+4500)
                                    destroyElement(kifedrop2)
                                    kifedrop2 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        elseif source == kifedrop3 then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+4500)
                                    destroyElement(kifedrop3)
                                    kifedrop3 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        elseif source == kifedrop4 then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+4500)
                                    destroyElement(kifedrop4)
                                    kifedrop4 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        elseif source == kifedrop5 then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",45000)
                                    destroyElement(kifedrop5)
                                    kifedrop5 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        elseif source == kifedrop6 then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") + 45000 <= 90000 then
                                    outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In In Mahmole 4500 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                    setElementData(player,"pMatForPut",tonumber(getElementData(player,"pMatForPut"))+4500)
                                    destroyElement(kifedrop6)
                                    kifedrop6 = false
                                else
                                    notfSys:addNotification(hitElement, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            end
                        end
                    end
                end
            end
        end)
    end,300000,6) 
end
function destroyeventairdrop()
    if kifedrop1 == true then
        if isElement(kifedrop1) then
            destroyElement(kifedrop1)
        end
    elseif kifedrop2 == true then
        if isElement(kifedrop2) then
            destroyElement(kifedrop2)
        end
    elseif kifedrop3 == true then
        if isElement(kifedrop3) then
            destroyElement(kifedrop3)
        end
    elseif kifedrop4 == true then
        if isElement(kifedrop4) then
            destroyElement(kifedrop4)
        end
    elseif kifedrop5 == true then
        if isElement(kifedrop5) then
            destroyElement(kifedrop5)
        end
    elseif SOLZONEDROP == true then
        if isElement(SOLZONEDROP) then
            destroyElement(SOLZONEDROP)
        end
    elseif DROPRADARAREA == true then
        if isElement(DROPRADARAREA) then
            destroyElement(DROPRADARAREA)
        end
    end
    nowevent = false
end
function destroyairdrops()
    if kifedrop1 == true then
        if isElement(kifedrop1) then
            destroyElement(kifedrop1)
        end
    elseif kifedrop2 == true then
        if isElement(kifedrop2) then
            destroyElement(kifedrop2)
        end
    elseif kifedrop3 == true then
        if isElement(kifedrop3) then
            destroyElement(kifedrop3)
        end
    elseif kifedrop4 == true then
        if isElement(kifedrop4) then
            destroyElement(kifedrop4)
        end
    elseif kifedrop5 == true then
        if isElement(kifedrop5) then
            destroyElement(kifedrop5)
        end
    end
    nowevent = false 
end
-----------------------------------=====================End Drop System=======================-----------------------------------
-----------------------------------=======Familys For PlayerPanel=====================---------------------------
local famidihsdjoasjdo = {}
local OnlinePlayerForPanelFamily = {}
local FamilyIdForPanelSortByScore = {}
function PanelRaghabatFamily(player)
    local allplayersjoininfamilyforpanel = 0
    local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys` WHERE `fActive` = 1 ORDER BY `familys`.`fScore` DESC;" )
    local result, numrows = dbPoll(query, 500)
    famidihsdjoasjdo[player] = 0
    FamilyIdForPanelSortByScore[player] = 0
    if (result and numrows > 0) then
        for index, row in pairs(result) do
            FamilyIdForPanelSortByScore[player] = FamilyIdForPanelSortByScore[player] + 1
            OnlinePlayerForPanelFamily[player] = 0
            famidihsdjoasjdo[player] = famidihsdjoasjdo[player] + 1
            for k, hame_Playera	in ipairs (getElementsByType("player")) do	
                if getElementData(hame_Playera, "loggedIn") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pFamiId")) == row['fID'] then
                        OnlinePlayerForPanelFamily[player] = OnlinePlayerForPanelFamily[player] + 1 
                    end
                end
            end 
            local AllFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users",tonumber(row['fOwner']))
            local result2, numrows2 = dbPoll(AllFamilys, 500)
            if (result2 and numrows2 > 0) then
                for index2, row2 in pairs(result2) do
                    if tonumber(row['fOwner']) == tonumber(row2['pID']) then
                        leadernameforpanel = row2['pName']
                    end
                    if row['fID'] == row2['pFamiId'] then
                        allplayersjoininfamilyforpanel = allplayersjoininfamilyforpanel + 1
                    end
                end
            else
                allplayersjoininfamilyforpanel = 0
                leadernameforpanel = "Not Found"
            end
            triggerClientEvent("infofamilypanelforreghabat", player , player , FamilyIdForPanelSortByScore[player] , OnlinePlayerForPanelFamily[player], tonumber(row['fScore']) , tostring(row['fName']) ,tonumber(row['fLogo']),leadernameforpanel, row['fShoar'],row['fMemberSlot'] , allplayersjoininfamilyforpanel , row['fCreateDate'],row['fR'],row['fG'],row['fB'] )
            allplayersjoininfamilyforpanel = 0
            leadernameforpanel = "Not Found"
        end
    end
end
addEvent("PanelRaghabatFamily",true)
addEventHandler("PanelRaghabatFamily", root,PanelRaghabatFamily)
---------------------------------============== Start Event AirDrop ==============---------------------------------
local randomairdroppos = {
    [1] = {740.6005859375 ,-1245.9150390625 ,13.113376617432},
    [2] = {213.3779296875 ,-1436.955078125 ,13.594497680664},
    [3] = {309.80078125 ,-1365.3076171875 ,14.094497680664},
    [4] = {336.279296875 ,-1343.453125 ,14.5078125},
    [5] = {533.333984375 ,-1278.5908203125 ,17.2421875},
    [6] = {857.71875 ,-1211.1015625 ,16.9765625},
    [7] = {957.599609375 ,-1191.0380859375 ,16.9453125},
    [8] = {1183.3974609375 ,-1228.05078125 ,18.5546875},
    [9] = {1098.404296875 ,-1244.146484375 ,15.8203125},
    [10] = {1366.61328125 ,-1580.5546875 ,8.6554279327393},
    [11] = {2063.4638671875 ,-1951.1083984375 ,7.984375},
    [12] = {2802.8466796875 ,-1459.064453125 ,40.034610748291},
    [13] = {2706.521484375 ,-1078.2099609375 ,69.400764465332},
    [14] = {2555.9794921875 ,-1127.62109375 ,63.873413085938},
    [15] = {2340.9228515625 ,-689.7548828125 ,132.9411315918},
    [16] = {2059.3583984375 ,-592.81640625 ,68.366981506348},
    [17] = {1912.0185546875 ,-533.728515625 ,19.815521240234},
    [18] = {1499.40234375 ,-701.4609375 ,94.75},
    [19] = {1290.89453125 ,-787.8486328125 ,96.455444335938},
    [20] = {1047.8583984375 ,-902.953125 ,42.719085693359},
}
function EndEventAirDrop()
    if AirDopBox[1] then
        if isElement(AirDopBox[1]) then
            destroyElement(AirDopBox[1])
        end
    end
    if BlipAirDropBox[1] then
        if isElement(BlipAirDropBox[1]) then
            destroyElement(BlipAirDropBox[1])
        end
    end
    nowevent = false
end
function spawneventairdrop()
    local RANDOMPOSAIRDROP = math.random(#randomairdroppos)
    if RANDOMPOSAIRDROP then
        EndEventAirDrop()
        AirDopBox[1] = true
        nowevent = true
        setTimer(EndEventAirDrop(),1800000,1)
        AirDopBox[1] = createObject(1685,randomairdroppos[RANDOMPOSAIRDROP][1],randomairdroppos[RANDOMPOSAIRDROP][2],randomairdroppos[RANDOMPOSAIRDROP][3]+70)
        setElementFrozen(AirDopBox[1],true)
        moveObject(AirDopBox[1],180000,randomairdroppos[RANDOMPOSAIRDROP][1],randomairdroppos[RANDOMPOSAIRDROP][2],randomairdroppos[RANDOMPOSAIRDROP][3])
        BlipAirDropBox[1] = createBlipAttachedTo(AirDopBox[1],4)
        setElementData(BlipAirDropBox[1] , "exclusiveBlip", true)
        for index,allpl in ipairs(getElementsByType("player")) do
            outputChatBox("#808080((ICA Director : Havapeyma Mahmole [Material] Mi6 Tavasote Agent Haye ICA Robode Shod Va #00FF00AirDrop #808080Az Havapeyma Be Zamin Ferstade Shod))",allpl,255,255,255,true) 
        end
        for index,allpl in ipairs(getElementsByType("player")) do
            if getElementData(allpl, "loggedIn") == true then
                notfSys:addWarning(allpl,"(( Mahmole Boozorg Material Dar Hal Forod Amadan Ast ))","warning")
            end
        end
        addEventHandler("onElementClicked",getRootElement(),function(button, state, player)
            if button == "left" and state == "down" and isElement(source) then
                if getElementType( source ) == "object" then
                    local x,y,z=getElementPosition( player )
                    local x1,y1,z1=getElementPosition( source ) 
                    local fasele22 = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
                    if fasele22 < 5.2 then
                        if source == AirDopBox[1] then
                            if tonumber(getElementData(accSys:getPlayerAcc(player), "pFamiId")) > 0 then
                                if getElementData(player,"pMatForPut") == 0 then
                                    if isPedInVehicle(player) then
                                        notfSys:addNotification(player, "Savar Khodro Nemishe Mahmole Ro Bardasht." , 'error')
                                    else
                                        destroyElement(BlipAirDropBox[1])
                                        outputChatBox("#ffff00[Tavajoh]: #ffffff Shoma Az In Jabe 90000 Geram Material Daryaft Kardid", player, 255, 255, 255, true)
                                        setElementData(player,"pMatForPut",90000)
                                        destroyElement(AirDopBox[1])
                                        AirDopBox[1] = false
                                        BlipAirDropBox["player"] = player
                                        BlipAirDropBox[player] = createBlipAttachedTo(player,4)
                                        setElementData(BlipAirDropBox[player] , "exclusiveBlip", true)
                                    end
                                else
                                    notfSys:addNotification(player, "Shoma Jib Khod Ra Az Material Poor Kradid Va Nemitavanid Bishtar Bardarid." , 'error')
                                end
                            else
                                notfSys:addNotification(player, "Baraye Inkar Bayad Ozv Family Bashid." , 'error')
                            end
                        end
                    end
                end
            end
        end)
    end
end

-------------------------------------=========FFA Events=========-------------------------------
local FamilyScore = {}
function refreshClient()
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl, "loggedIn") == true then
            for i=1,#FamilyScore  do
                triggerClientEvent("ChangeScoreFamily",allpl,allpl,i,FamilyScore[i][1],FamilyScore[i][2],FamilyScore[i][3])
            end
            triggerClientEvent("RefreshPanelFFA",allpl,allpl)
        end
    end
end

local SortAndReversArry = {}
local Reversed = {}
function CheackFFA(thePlayer)
    famid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
    if famid > 0 then
        for i = 1,#FamilyScore  do
            if FamilyScore[i][1] == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
                refreshClient()
                return true
            end
        end
        FamilyScore[#FamilyScore+1]={famid,FamilyInfo(famid,"name"),0}
        refreshClient()
    end
    
end
ffatimespawn = 300000
timerFFA = 1800000
function FFAEVENTSTART()
    local FFAZone = createColCuboid (2373.9755859375 ,-2696.828125 , 0 , 152.5 ,190,500)
    local FFAZoneArea = createRadarArea(2373.9755859375 ,-2696.828125 , 152.5 , 190,255,0,0,170)
    setRadarAreaFlashing ( FFAZoneArea, true )
    for index,allpl in ipairs(getElementsByType("player")) do
        outputChatBox("#808080(( Tavajoh! Makan Mantaghe Khonin Bar Roye Map Moshakhas Shod Va Ta 5 Daghighe Digar Spawn Mishavand ))",allpl,255,255,255,true) 
    end
    nowevent = true
    setTimer(function()
        
        ffatimer = setTimer (
        function ( )
            timerFFA = timerFFA - 1000
            minutes, seconds, milliseconds = convertTime(timerFFA)
            thetimetext = "Zaman BaghiMande (( "..minutes..":"..seconds.." ))"
            if timerFFA < 1000 then
                nowevent = false
                EndFFA()
                timerFFA = 1800000
                i = 0
                if FFAZone then
                    if isElement(FFAZone) then
                        destroyElement(FFAZone)
                    end
                end
                if FFAZoneArea then
                    if isElement(FFAZoneArea) then
                        destroyElement(FFAZoneArea)
                    end
                end
                for index,allpl in ipairs(getElementsByType("player")) do
                    if getElementData(allpl, "loggedIn") == true then
                        triggerClientEvent("ClosePanelFFA",allpl,allpl)
                    end
                end

                local SortedTestArray2 = insertSortingByIndex(FamilyScore, 3)
                for k, v in pairs(SortedTestArray2) do
                    i = i + 1
                    SortAndReversArry[i] = {v[1],v[2],v[3]}
                end
                i = 0
                local SortedTestArray2 = table.reverse(SortAndReversArry) 
                for k, v in pairs(SortedTestArray2) do
                    i=i+1
                    Reversed[i] = {v[1],v[2],v[3]}
                end
                if Reversed[1] then
                    nafaraval = Reversed[1][1]
                end
                if Reversed[2] then
                    nafardovom = Reversed[2][1]
                end
                if Reversed[3] then
                    nafarsevom = Reversed[3][1]
                end
                giveJayezeEndEventFFA(nafaraval,nafardovom,nafarsevom)
                for i = 1,#FamilyScore  do
                    FamilyScore[i] = {}
                end
                for i = 1,#SortAndReversArry  do
                    SortAndReversArry[i] = {}
                end
                for i = 1,#SortedTestArray2  do
                    SortedTestArray2[i] = {}
                end
                for i = 1,#Reversed  do
                    Reversed[i] = nil
                end
                killTimer(ffatimer)
            end
        end,1000,0)
        for index,allpl in ipairs(getElementsByType("player")) do
            if getElementData(allpl, "loggedIn") == true then
                notfSys:addWarning(allpl,"(( Event Mantaghe Khonin Spawn Shod ))","warning")
            end
        end
        function FFaCloshipHit ( thePlayer, matchingDimension )
            if (getElementType(thePlayer) == "player") then
                if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) > 0 then 
                    triggerClientEvent("OmadToyeFFATurf", thePlayer, thePlayer,timerFFA,tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),FamilyInfo(tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")),"name"))
                    CheackFFA(thePlayer)
                    if isPedInVehicle(thePlayer) then
                        local theplayervehicleplayer = getPedOccupiedVehicle ( thePlayer )
                        for index,allPlayers in ipairs(getElementsByType("player")) do
                            if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == theplayervehicleplayer then
                                removePedFromVehicle( allPlayers )
                                notfSys:addNotification(allPlayers, "*Khodro Shoma Respawn Shod*" , 'error')
                                setElementDimension(allPlayers,8)
                            end
                        end
                        respawnVehicle(theplayervehicleplayer)
                        notfSys:addNotification(thePlayer, "*Shoma Varede Mantaghe Khonin Shodid*" , 'warning')
                        setElementDimension(thePlayer,8)
                        setElementData(thePlayer,"pInFFAZone",true)
                    else
                        notfSys:addNotification(thePlayer, "*Shoma Varede Mantaghe Khonin Shodid*" , 'warning')
                        setElementDimension(thePlayer,8)
                        setElementData(thePlayer,"pInFFAZone",true)
                    end
                else
                    setElementHealth(thePlayer,0)
                end
            elseif (getElementType(thePlayer) == "vehicle") then
                for index,allPlayers in ipairs(getElementsByType("player")) do
                    if isPedInVehicle(allPlayers) and getPedOccupiedVehicle(allPlayers) == thePlayer then
                        removePedFromVehicle( allPlayers )
                        notfSys:addNotification(allPlayers, "*Khodro Shoma Respawn Shod*" , 'error')
                        notfSys:addNotification(allPlayers, "*Shoma Varede Mantaghe Khonin Shodid*" , 'warning')
                        setElementDimension(allPlayers,8)
                        setElementData(allPlayers,"pInFFAZone",true)
                    end
                end
                respawnVehicle(thePlayer)
            end


        end
        addEventHandler ("onColShapeHit", FFAZone, FFaCloshipHit )
        function FFALeave ( thePlayer, matchingDimension )
            if (getElementType(thePlayer) == "player") then
        
                triggerClientEvent("ClosePanelFFA",thePlayer,thePlayer)
                WastedCheacker(thePlayer)
                
                if getElementDimension(thePlayer) == 8 and getElementInterior(thePlayer) == 0 then
                    setElementDimension(thePlayer,0)
                    setElementData(thePlayer,"pInFFAZone",false)
                end
                notfSys:addNotification(thePlayer, "*Shoma Az Mantaghe Khonin Kharej Shodid*" , 'warning')
            end
        end
        addEventHandler ( "onColShapeLeave", FFAZone, FFALeave )
    end,ffatimespawn,1)
end
function EndFFA()
    if FFAZone then
        if isElement(FFAZone) then
            destroyElement(FFAZone)
        end
    end
    if FFAZoneArea then
        if isElement(FFAZoneArea) then
            destroyElement(FFAZoneArea)
        end
    end
    for index,allpl in ipairs(getElementsByType("player")) do
        if getElementData(allpl,"pInFFAZone") == true then
            setElementDimension(allpl,0)
        end
    end
    nowevent = false
end

function giveJayezeEndEventFFA(value,value2,value3)
    SendMassegeAll("#ffffff▬▬▬▬▬▬▬▬▬▬▬▬▬(#808080 FFA Is Over #ffffff)▬▬▬▬▬▬▬▬▬▬▬▬▬")
    if value then
        if tonumber(value) > 0 then
            local money = 2500000/tonumber(TeghsimBeynAzayeFam(value))
            
            for index,allpl in ipairs(getElementsByType("player")) do
                if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId")) == value then
                    if money > 0 then
                        givePlayerMoney(allpl,money)
                    else
                        givePlayerMoney(allpl,2500000)
                    end
                end
            end
            
            SetElementFamily(tonumber(value),"fScore",FamilyInfo(tonumber(value),"score")+100)
            SendMassegeAll("#808080(( #808080Family(#FFFF00 #1 #808080) "..RGBToHex(FamilyInfo(value,"R"),FamilyInfo(value,"G"),FamilyInfo(value,"B"))..""..FamilyInfo(value,"name").." #808080. +100 Score , #00FF00+2,500,000$ #808080))")
            
        end
    end
    if value2 then
        if tonumber(value2) > 0 then
            local money = 1000000/tonumber(TeghsimBeynAzayeFam(value2))
            for index,allpl in ipairs(getElementsByType("player")) do
                if getElementData(allpl, "loggedIn") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId")) == value2 then
                        if money > 0 then
                            givePlayerMoney(allpl,money)
                        else
                            givePlayerMoney(allpl,1000000)
                        end
                    end
                end
            end

            SetElementFamily(tonumber(value2),"fScore",FamilyInfo(tonumber(value2),"score")+50)
            SendMassegeAll("#808080(( #808080Family(#FFFF00 #2 #808080) "..RGBToHex(FamilyInfo(value2,"R"),FamilyInfo(value2,"G"),FamilyInfo(value2,"B"))..""..FamilyInfo(value2,"name").." #808080. +50 Score , #00FF00+1,000,000$ #808080))")
        end
    end
    if value3 then
        if tonumber(value3) > 0 then
            local money = 250000/tonumber(TeghsimBeynAzayeFam(value3))
            for index,allpl in ipairs(getElementsByType("player")) do
                if getElementData(allpl, "loggedIn") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId")) == value3 then
                        if money > 0 then
                            givePlayerMoney(allpl,money)
                        else
                            givePlayerMoney(allpl,250000)
                        end
                    end
                end
            end
            SetElementFamily(value3,"fScore",FamilyInfo(value3,"score")+15)
            SendMassegeAll("#808080(( #808080Family(#FFFF00 #3 #808080) "..RGBToHex(FamilyInfo(value3,"R"),FamilyInfo(value3,"G"),FamilyInfo(value3,"B"))..""..FamilyInfo(value3,"name").." #808080. +15 Score , #00FF00+250,000$ #808080))")
        end
    end
    SendMassegeAll("#FFFFFF▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬")
    nafarsevom = nil
    nafardovom = nil
    nafaraval = nil
end
addEvent("giveJayezeEndEventFFA",true)
addEventHandler("giveJayezeEndEventFFA",getRootElement(),giveJayezeEndEventFFA)

function WastedCheacker(thePlayer)
    famid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
    if famid > 0 then
        for i = 1,#FamilyScore  do
            if FamilyScore[i][1] == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
                FamilyScore[i][3] = tonumber(FamilyScore[i][3]) - 1
                refreshClient()
                return true
            end
        end
        FamilyScore[#FamilyScore+1]={famid,FamilyInfo(famid,"name"),-1}
        refreshClient()
    end
    
end

function KillerCheack(thePlayer)
    famid = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId"))
    if famid > 0 then
        for i = 1,#FamilyScore  do
            if FamilyScore[i][1] == tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pFamiId")) then
                FamilyScore[i][3] = tonumber(FamilyScore[i][3]) + 2
                refreshClient()
                return true
            end
        end
        FamilyScore[#FamilyScore+1]={famid,FamilyInfo(famid,"name"),2}
        refreshClient()
    end
    
end
function KillFamilys ( ammo, attacker, weapon, bodypart )
    if getElementData(source,"pInFFAZone") == true then
        if tonumber(getElementData(accSys:getPlayerAcc(source), "pFamiId")) > 0 then
            if attacker then
                if getElementData(attacker,"pInFFAZone") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(source), "pFamiId")) ~= tonumber(getElementData(accSys:getPlayerAcc(attacker), "pFamiId")) then
                        KillerCheack(attacker)
                    end
                end
            end
        end
    end
end
addEventHandler ( "onPlayerWasted", getRootElement(), KillFamilys )
------------------------====================================-------------------------------------
addCommandHandler("spawn",function(player,cmd,id)
    if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) >= 4 then
        if id then
            if id == "airdrop" then
                spawneventairdrop()
            elseif id == "kamion" then
                StartEventKamionMat()
            elseif id == "keshti" then
                spawnkeshti()
            elseif id == "mahmole" then
                SpawnDropFamily()
            elseif id == "ffa" then
                FFAEVENTSTART( )
            else
                outputChatBox("#FF0000[ERROR]:#FFFFFF <SPAWM> <airdrop / kamion / keshti / mahmole / ffa>", player, 255, 255, 255, true) 
            end
        else
            outputChatBox("#FF0000[ERROR]:#FFFFFF <SPAWM> <airdrop / kamion / keshti / mahmole / ffa>", player, 255, 255, 255, true) 
        end
    end
end)
-------------------------------------------=================================-----------------------------------------
local TimeKamion = 14
local TimeKamion2 = 18
local TimeKeshti = 17
local TimeMantagheHavaei = 20
local AirDropTime = 19
local FreeForAll = 22
addEventHandler("OnGlobalTimer", root, function()
    if getRealTime().hour == TimeKamion and getRealTime().minute == 0 and getRealTime().second == 0 then
        StartEventKamionMat()
    end
    if getRealTime().hour == TimeKamion2 and getRealTime().minute == 0 and getRealTime().second == 0 then
        StartEventKamionMat()
    end
    if getRealTime().hour == TimeKeshti and getRealTime().minute == 0 and getRealTime().second == 0 then
        spawnkeshti()
    end
    if getRealTime().hour == TimeMantagheHavaei and getRealTime().minute == 0 and getRealTime().second == 0 then
        SpawnDropFamily()
    end
    if getRealTime().hour == AirDropTime and getRealTime().minute == 0 and getRealTime().second == 0 then
        spawneventairdrop()
    end
    if getRealTime().hour == FreeForAll and getRealTime().minute == 0 and getRealTime().second == 0 then
        FFAEVENTSTART()
    end
end)

function paycheckfamilys()
    local LastFamilys = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM `familys`")
    local result2, numrows2 = dbPoll(LastFamilys, 500)
    if (result2 and numrows2 > 0) then
        for index, row in pairs(result2) do
            SetElementFamily(row['fID'],"fTime",FamilyInfo(row['fID'],"time")-1)
            if FamilyInfo(row['fID'],"time") < -23 then
                for _,p in ipairs (getElementsByType("vehicle")) do
                    local vehid = getElementID ( p )
                    if vehid == "Family" then 
                        if getElementData(p,"owner") == row['fID'] then
                            if getVehicleController( p ) then
                            else
                                setElementInterior(p,row['fID'])
                                setElementDimension(p,row['fID'])
                                respawnVehicle(p)
                                setElementData(p,"fuel",100)
                            end
                        end
                    end
                end
                DelFamily("",row['fName'],row['fOwner'],row['fShoar'])
            end
            SetElementFamily(row['fID'],"fScore",FamilyInfo(tonumber(row['fID']),"score")+tonumber(grafSys:getSomeGraffiti(row['fID'])*2))
            for index,allpl in ipairs(getElementsByType("player")) do
                if getElementData(allpl, "loggedIn") == true then
                    if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pFamiId"))  == row['fID'] then
                        if FamilyInfo(row['fID'],"time") > 0 then
                            outputChatBox("#FF3399 ╔═════════════◤ Family ◥═════════════╗", allpl, 255, 255, 255, true)
                            outputChatBox("Tedad Graffiti Haye Gerfte Shode: "..grafSys:getSomeGraffiti(row['fID']), allpl, 255, 255, 255, true)
                            local monishgraff = tonumber((grafSys:getSomeGraffiti(row['fID'])*100)/TeghsimBeynAzayeFam(row['fID']))
                            outputChatBox("Score Babate Graffiti Haye Shoma: "..(grafSys:getSomeGraffiti(row['fID'])*2).." Money Daryafti Babate Graffiti Haye: $"..(grafSys:getSomeGraffiti(row['fID'])*100).." Sahm Shoma($"..monishgraff..")", allpl, 255, 255, 255, true)
                            givePlayerMoney(allpl,monishgraff)
                            local monish = (tonumber(FamilyInfo(row['fID'],"score"))*9)*TeghsimBeynAzayeFam(row['fID'])
                            outputChatBox("Money Daryafti: "..monish.." (Sahm Shoma: "..monish/TeghsimBeynAzayeFam(row['fID']).." )", allpl, 255, 255, 255, true)
                            local matesh = tonumber(FamilyInfo(row['fID'],"score"))*2
                            outputChatBox("Material Daryafti: "..matesh.." (Sahm Shoma: "..matesh/TeghsimBeynAzayeFam(row['fID']).." )", allpl, 255, 255, 255, true)
                            outputChatBox("Score Family Shoma: "..FamilyInfo(row['fID'],"score").." (+2 Score Be Ezaye Online Bodan Shoma)", allpl, 255, 255, 255, true)
                            givePlayerMoney(allpl,monish)
                            SetElementFamily(row['fID'],"fScore",FamilyInfo(row['fID'],"score")+2)
                            setElementData(accSys:getPlayerAcc(allpl), "pMats", tonumber(matesh/TeghsimBeynAzayeFam(row['fID'])) + tonumber(getElementData(accSys:getPlayerAcc(allpl), "pMats")))
                            outputChatBox("#FF3399 ╚══════════════◣        ◢═════════════╝", allpl, 255, 255, 255, true)
                        end
                        if FamilyInfo(row['fID'],"time") < 70 and FamilyInfo(row['fID'],"time") ~= 0 then
                            Message("Az Zaman Tamdide Family Shoma Tanha "..FamilyInfo(row['fID'],"time").." Saat Baghi Mande Ast. Lotfan Az Tarighe Panel Manage Family(F10) Family Khod Ra Tamdid Konid!",allpl)
                        elseif FamilyInfo(row['fID'],"time") == 0 then
                            Message("Family Shoma Monghazi Shod!",allpl)
                        elseif FamilyInfo(row['fID'],"time") < 0 and FamilyInfo(row['fID'],"time") ~= -24 then
                            Message("Family Shoma Tanha Ta #FF0000"..(tonumber(FamilyInfo(row['fID'],"time"))+24).." #FFFFFFPa Bar Jast. Pas Az Etmam Time Family Shoma Delete Mishavad!!!! In Farayand Ghabel Bazgasht Nist",allpl)

                        end
                    end
                end
            end
        end
    end
end