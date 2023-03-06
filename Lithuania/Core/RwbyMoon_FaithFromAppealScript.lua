-----------------------------------------------
-- UTILITIES
-----------------------------------------------

function GetPlayersWithTrait(sTrait)
    local tValid = {}
    iLength = 0

    for _, iPlayer in pairs(PlayerManager.GetWasEverAliveIDs()) do
        local leaderType = PlayerConfigurations[iPlayer]:GetLeaderTypeName()
        for trait in GameInfo.LeaderTraits() do
            if trait.LeaderType == leaderType and trait.TraitType == sTrait then
                tValid[iPlayer] = Players[iPlayer]
                iLength = iLength + 1
            end
        end
        if not tValid[iPlayer] then
            local civType = PlayerConfigurations[iPlayer]:GetCivilizationTypeName()
            for trait in GameInfo.CivilizationTraits() do
                if trait.CivilizationType == civType and trait.TraitType == sTrait then
                    tValid[iPlayer] = Players[iPlayer]
                    iLength = iLength + 1
                end
            end
        end
    end
    return tValid, iLength
end

-----------------------------------------------
-- VARIABLES
-----------------------------------------------

local sTraitLithuania = "TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS"
local tLithuanianPlayers, iLithuanianPlayers = GetPlayersWithTrait(sTraitLithuania)

tPiliakalniai = {}
tPiliakalniai.DISTRICT_RWB_PILIAKALNIS		= 'RWB_PILIAKALNIS_FAITH_YIELD1'

-----------------------------------------------
-- OBJECTIVE

-- Generate Faith equal to 50% of the Appeal of tiles on which the Piliakalnis (Unique District) and all of its adjacent districts are.

-----------------------------------------------

function FaithAdjacencyFromNearbyAppeal(playerID ,districtID,cityID,x,y,districtIndex,percentComplete)

    local sDistrict = GameInfo.Districts[districtID].DistrictType
    print(sDistrict)
    if not tPiliakalniai[sDistrict] then return end

    sDistrict:SetProperty("RWB_PILIAKALNIS_FAITH_YIELD1", 5)
    print(sDistrict:GetProperty("RWB_PILIAKALNIS_FAITH_YIELD1")," Faith on this Piliakalnis")

end

    --function FaithAdjacencyFromNearbyAppeal(playerID, cityID)
    --[[local LithuaniaCivilization = false
    local localPlayerID:number = playerID
    print("FaithAdjacencyFromNearbyAppeal Checkloaded")
    print(tTraitPlayers[localPlayerID])
    if not tTraitPlayers[localPlayerID] then return end
    
    if tTraitPlayers[localPlayerID] then
        LithuaniaCivilization = true
    end

    
    if LithuaniaCivilization == true then

        local faithFactor = 0.5
        local faithValue = 0
        
        local LithuaniaPlayer = Players[localPlayerID]
    
        local pCity = LithuaniaPlayer:GetCities():FindID( cityID );
        print("CityID :",pCity)   
        if pCity ~= nil then
            local tLithuaniaDistricts = pCity:GetDistricts();
            print("Districts :",tLithuaniaDistricts)
    
            if tLithuaniaDistricts ~= nil then
                    local tPiliakalnisDistricts = tLithuaniaDistricts:GetDistrictByType(DISTRICT_RWB_PILIAKALNIS)
            end
        end
    

        if tLithuaniaDistricts ~= nil then
            for a, v in tLithuaniaDistricts:Members() do
                print("Lithuania - Districts :",a,v)
            end
        end
        if tPiliakalnisDistricts ~= nil then
            for j, _District in tPiliakalnisDistricts:Members() do
                print("Lithuania - Piliakalnis :",j, _District)
                local _DistrictPlot = Map.GetPlot(_District)
                print("Lithuania - Number : ",j," District Type : ",pDistrict.DistrictType)
                local _DistrictX, _DistrictY = _DistrictPlot:GetX(), _DistrictPlot:GetY()
                print("Lithuania - Piliakalnis Position : ",_DistrictX, _DistrictY)
                local adjPlots = Map.GetAdjacentPlots(_DistrictX,_DistrictY)
            
                local piliaAppealValue = _District:GetAppeal()
                faithValue = faithValue + (piliaAppealValue * faithFactor)
            
                for k, _DistrictAdjPlot in ipairs(adjPlots) do
                    if _DistrictAdjPlot.GetDistrictType ~= nil then
                        local appealValue = _DistrictAdjPlot:GetAppeal()
                        faithValue = faithValue + (appealValue * faithFactor) 
                    end
                end
            end
        end
    end 
                if faithValue ~= nil then
                    print("Lithuania - Amount of Faith of Piliakalnis anticipated : ", faithValue)
                    _District:SetProperty("RWB_PILIAKALNIS_FAITH_YIELD1", faithValue)
                end
    
    
end]]

--[[NO // for i, pDistrict in pairs(LithuaniaDistricts) do
            if pDistrict.DistrictType == "DISTRICT_RWB_PILIAKALNIS" then
                print(i,pDistrict)
                table.insert(pDistrict.DistrictType,tPiliakalniai)
        
            end
        end]]


if iLithuanianPlayers > 0 then
    print("Lithuanian Player in-game")
    Events.DistrictAddedToMap.Add(FaithAdjacencyFromNearbyAppeal)
    Events.DistrictPillaged.Add(FaithAdjacencyFromNearbyAppeal)
    Events.DistrictRemovedFromMap.Add(FaithAdjacencyFromNearbyAppeal)
end
