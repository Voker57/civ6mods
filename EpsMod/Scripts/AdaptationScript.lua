
function EpsModAdaptation_LeaderHasTrait(leaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == leaderType and row.TraitType == traitType) then return true end
	end
	return false
end

function EpsModAdaptation_CivHasTrait(civType, traitType)
	for row in GameInfo.CivilizationTraits() do
		if (row.CivilizationType == civType and row.TraitType == traitType) then return true end
	end
	return false
end

--------------------------------------------------------------

function EpsModAdaptation_OnCityAddedToMap(playerIndex, cityIndex, x, y)
	
	local player = Players[playerIndex]
	if (not player:IsMajor() or (player:GetCities():GetCount() ~= 1)) then return end
	local city = CityManager.GetCity(playerIndex, cityIndex)
	if (city == nil) then return end


	local terrainType = 0
	local tundraCount = 0
	local desertCount = 0
	local mountainCount = 0
	local tundraIndex = GameInfo.Terrains["TERRAIN_TUNDRA"].Index
	local tundraHillsIndex = GameInfo.Terrains["TERRAIN_TUNDRA_HILLS"].Index
	local snowIndex = GameInfo.Terrains["TERRAIN_SNOW"].Index
	local snowHillsIndex = GameInfo.Terrains["TERRAIN_SNOW_HILLS"].Index
	local desertIndex = GameInfo.Terrains["TERRAIN_DESERT"].Index
	local desertHillsIndex = GameInfo.Terrains["TERRAIN_DESERT_HILLS"].Index
	local mountain1Index = GameInfo.Terrains["TERRAIN_GRASS_MOUNTAIN"].Index
	local mountain2Index = GameInfo.Terrains["TERRAIN_PLAINS_MOUNTAIN"].Index
	local mountain3Index = GameInfo.Terrains["TERRAIN_DESERT_MOUNTAIN"].Index
	local mountain4Index = GameInfo.Terrains["TERRAIN_TUNDRA_MOUNTAIN"].Index
	local mountain5Index = GameInfo.Terrains["TERRAIN_SNOW_MOUNTAIN"].Index

	local plots = Map.GetNeighborPlots(x, y, 2);
	for i, plot in ipairs(plots) do
		terrainType = plot:GetTerrainType()

		if ((terrainType == tundraIndex) or (terrainType == tundraHillsIndex) or (terrainType == snowIndex) or (terrainType == snowHillsIndex)) then 
			tundraCount = tundraCount + 1
		end
		if ((terrainType == desertIndex) or (terrainType == desertHillsIndex)) then 
			desertCount = desertCount + 1
		end
		if ((terrainType == mountain1Index) or (terrainType == mountain2Index) or (terrainType == mountain3Index) or (terrainType == mountain4Index) or (terrainType == mountain5Index)) then 
			mountainCount = mountainCount + 1
		end
	end
	

	local adaptation = false
	local message = Locale.Lookup("EPSMOD_ADAPT_MESSAGE_INTRO", city:GetName());

	if ((tundraCount > 6) and not EpsModAdaptation_LeaderHasTrait(PlayerConfigurations[playerIndex]:GetLeaderTypeName(), "TRAIT_LEADER_LAST_BEST_WEST")) then
		adaptation = true

		player:AttachModifierByID("EPSMOD_TUNDRA_FARMS")
		player:AttachModifierByID("EPSMOD_TUNDRA_HILLS_FARMS")
		message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_TUNDRA_FARMS")
		
		if (not EpsModAdaptation_CivHasTrait(PlayerConfigurations[playerIndex]:GetCivilizationTypeName(), "TRAIT_CIVILIZATION_MOTHER_RUSSIA")) then
			player:AttachModifierByID("EPSMOD_TUNDRA_FARM_PRODUCTION")
			player:AttachModifierByID("EPSMOD_TUNDRA_HILLS_FARM_PRODUCTION")
			message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_TUNDRA_FARMS_PRODUCTION")
		end
	end


	if (desertCount > 6) then
		adaptation = true

		player:AttachModifierByID("EPSMOD_DESERT_FARMS")
		player:AttachModifierByID("EPSMOD_DESERT_HILLS_FARMS")
		message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_DESERT_FARMS")

		player:AttachModifierByID("EPSMOD_DESERT_FARM_PRODUCTION")
		player:AttachModifierByID("EPSMOD_DESERT_HILLS_FARM_PRODUCTION")
		message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_DESERT_FARMS_PRODUCTION")

		if (not EpsModAdaptation_CivHasTrait(PlayerConfigurations[playerIndex]:GetCivilizationTypeName(), "TRAIT_CIVILIZATION_MALI_GOLD_DESERT")) then
			player:AttachModifierByID("EPSMOD_DESERT_FARM_FAITH")
			player:AttachModifierByID("EPSMOD_DESERT_HILLS_FARM_FAITH")
			message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_DESERT_FARMS_FAITH")
		end
	end


	if (mountainCount > 4) then
		adaptation = true

		if (not EpsModAdaptation_CivHasTrait(PlayerConfigurations[playerIndex]:GetCivilizationTypeName(), "TRAIT_CIVILIZATION_GREAT_MOUNTAINS")) then
			player:AttachModifierByID("EPSMOD_WORK_GRASS_MOUNTAIN")
			player:AttachModifierByID("EPSMOD_WORK_PLAINS_MOUNTAIN")
			player:AttachModifierByID("EPSMOD_WORK_DESERT_MOUNTAIN")
			player:AttachModifierByID("EPSMOD_WORK_TUNDRA_MOUNTAIN")
			player:AttachModifierByID("EPSMOD_WORK_SNOW_MOUNTAIN")
			message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_MOUNTAINS_WORK")

			player:AttachModifierByID("EPSMOD_PRODUCTION_MOUNTAIN")
			message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_MOUNTAINS_PRODUCTION")
		end

		player:AttachModifierByID("EPSMOD_FAITH_MOUNTAIN")
		message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_MOUNTAINS_FAITH")
				
		player:AttachModifierByID("EPSMOD_FARM_GRASS_MOUNTAIN")
		player:AttachModifierByID("EPSMOD_FARM_PLAINS_MOUNTAIN")
		player:AttachModifierByID("EPSMOD_FARM_DESERT_MOUNTAIN")
		player:AttachModifierByID("EPSMOD_FARM_TUNDRA_MOUNTAIN")
		player:AttachModifierByID("EPSMOD_FARM_SNOW_MOUNTAIN")
		message = message .. "[NEWLINE]" .. Locale.Lookup("EPSMOD_ADAPT_TO_MOUNTAINS_FOOD")
	end
	

	if (adaptation) then
		NotificationManager.SendNotification(playerIndex, NotificationTypes.USER_DEFINED_4, Locale.Lookup("EPSMOD_ADAPT_MESSAGE_NAME"), message, x, y)
	end
end

GameEvents.CityBuilt.Add(EpsModAdaptation_OnCityAddedToMap)
print("loaded")