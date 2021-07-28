-- [SCVID]_Units_Abilities_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 12:20:34 PM
--------------------------------------------------------------
/*	BERSERKER ABILITY			*/
--DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'UNIT_STRONG_WHEN_ATTACKING';
--DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'UNIT_WEAK_WHEN_DEFENDING';

/*	EAGLE WARRIOR ABILITY		*/
UPDATE		ModifierArguments	SET Value = 'UNIT_STR_THRALL_WORKER'	WHERE ModifierId	=	'CAPTURE_COMBAT_UNITS_AS_WORKERS'	AND	Name	=	'UnitType';

/*	HETAIROI ABILITY			*/
DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'HETAIROI_GREAT_GENERAL_COMBAT_BONUS';

/*	AMBIORIX					*/
UPDATE		ModifierArguments	SET	Value = 1	WHERE ModifierId	=	'AMBIORIX_NEIGHBOR_COMBAT'		AND	Name	=	'Amount';

/*	BYZANTINE SPREAD RELIGION	*/
DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'BYZANTIUM_PRESSURE_KILLS';

/*	DROMON ABILITY				*/
--DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'DROMON_COMBAT_STRENGTH_AGAINST_UNITS';

/*	TAGMA ABILITY				*/
DELETE FROM UnitAbilityModifiers	WHERE ModifierId = 'TAGMA_COMBAT_STRENGTH';