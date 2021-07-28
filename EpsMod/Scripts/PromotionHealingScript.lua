
local epsModPromoHealHash = 0;
local epsModPromoHealLastPlayer = -1;
local epsModPromoHealLastUnit = -1;
local epsModPromoHealAmount = 20;

if (GameInfo.UnitCommands["UNITCOMMAND_PROMOTE"] ~= nil) then
	epsModPromoHealHash = GameInfo.UnitCommands["UNITCOMMAND_PROMOTE"].Hash
end

---------------------------------------------------------------------------------------------------------

function EpsMod_OnUnitCommandStarted(iPlayer, iUnit, iCommandHash, iCommandParameter)

	if (iCommandHash ~= epsModPromoHealHash) then return end
	epsModPromoHealLastPlayer = iPlayer
	epsModPromoHealLastUnit = iUnit
	
	local unit = UnitManager.GetUnit(iPlayer, iUnit)
	if ((unit:GetMovesRemaining() <= 0) and (unit:GetMaxMoves() > 0)) then
		unit:ChangeMovesRemaining(1)
	end
end

---------------------------------------------------------------------------------------------------------

function EpsMod_OnUnitDamageChanged(iPlayer, iUnit, iCurrentDamage, iPreviousDamage)

	if ((epsModPromoHealLastPlayer ~= iPlayer) or (epsModPromoHealLastUnit ~= iUnit)) then return end
	epsModPromoHealLastPlayer = -1
	epsModPromoHealLastUnit = -1

	if (iPreviousDamage - iCurrentDamage > epsModPromoHealAmount) then
		local newDamage = iPreviousDamage - epsModPromoHealAmount
		if (newDamage < 0) then newDamage = 0 end
		UnitManager.GetUnit(iPlayer, iUnit):SetDamage(newDamage)
	end
end

---------------------------------------------------------------------------------------------------------

Events.UnitCommandStarted.Add(EpsMod_OnUnitCommandStarted)
Events.UnitDamageChanged.Add(EpsMod_OnUnitDamageChanged)
print("loaded")