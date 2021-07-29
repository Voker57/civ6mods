
function SetObjectValue(object, valueName, value)
	if (object.SetProperty ~= nil) then
		object:SetProperty(valueName, value)
	end
end

function GetObjectValue(object, valueName, defaultValue)
	local value = object:GetProperty(valueName)
	if (value == nil) then return defaultValue end
	return value
end

local epsStartingSettlerHash = GameInfo.Units["UNIT_SETTLER"].Hash;

---------------------------------------------------------------------------------------------------------

function EpsModGov_OnPlayerTurnStartComplete(playerIndex)

	local player = Players[playerIndex]

	if player:IsMajor() and (Game.GetCurrentGameTurn() == 1) then
		for i, unit in player:GetUnits():Members() do
			if (unit:GetTypeHash() == epsStartingSettlerHash) then
				EpsStartingSettler_Supercharge(playerIndex, unit);
				break
			end
		end
	end
	
	if (player:IsHuman()) then
		local culture = player:GetCulture()

		if (culture:CivicCompletedThisTurn()) then
			SetObjectValue(player, "EpsModGovLastCivic", culture:GetCivicCompletedThisTurn())
			SetObjectValue(player, "EpsModGovOnCooldown", false)
		else
			local civicIndex = GetObjectValue(player, "EpsModGovLastCivic", -1)
			local onCooldown = GetObjectValue(player, "EpsModGovOnCooldown", false)
			if (civicIndex >= 0) and (not onCooldown) then
				culture:SetCivicCompletedThisTurn(civicIndex)
			end
		end
	end
end

function EpsModGov_OnGovernmentPolicyChanged(playerIndex, policyIndex)
	local player = Players[playerIndex]
	if (player:IsHuman()) then
		SetObjectValue(player, "EpsModGovOnCooldown", true)
	end
end

function EpsStartingSettler_Supercharge(playerIndex, unit)

	unit:ChangeMovesRemaining(6 - unit:GetMovesRemaining());
				
	local playerVis = PlayersVisibility[playerIndex];
	local plots = Map.GetNeighborPlots(unit:GetX(), unit:GetY(), 6);
	for i, plot in ipairs(plots) do
		if (not playerVis:IsRevealed(plot:GetX(), plot:GetY())) then
			playerVis:ChangeVisibilityCount(plot:GetIndex(), 1);
			playerVis:ChangeVisibilityCount(plot:GetIndex(), -1);
		end
	end
end

---------------------------------------------------------------------------------------------------------
 
GameEvents.PlayerTurnStartComplete.Add(EpsModGov_OnPlayerTurnStartComplete)
Events.GovernmentPolicyChanged.Add(EpsModGov_OnGovernmentPolicyChanged)
print("Loaded")