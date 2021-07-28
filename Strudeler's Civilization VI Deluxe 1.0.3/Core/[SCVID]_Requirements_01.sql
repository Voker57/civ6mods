-- [SCVID]_Requirements_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:40:48 AM
--------------------------------------------------------------
/*	CIVILIAN BONUSES BEFORE THE CAPITAL REQUIREMENTS	*/
INSERT INTO RequirementSets 
			(RequirementSetId,					RequirementSetType) 
	VALUES	('STR_STARTING_CIVILIAN_REQSET',	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements 
			(RequirementSetId,					RequirementId) 
	VALUES	('STR_STARTING_CIVILIAN_REQSET',	'STR_REQUIRES_NO_PALACE');
INSERT INTO Requirements 
			(RequirementId,						RequirementType,										Inverse) 
	VALUES	('STR_REQUIRES_NO_PALACE',			'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUM_BUILDINGS',		1);
INSERT INTO RequirementArguments 
			(RequirementId,						Name,													Value) 
	VALUES	('STR_REQUIRES_NO_PALACE',			'BuildingType',											'BUILDING_PALACE'),
			('STR_REQUIRES_NO_PALACE',			'Amount',												1);

/*	BONUS LOYALTY FROM UNITS REQUIREMENTS				*/
--INSERT OR REPLACE INTO	RequirementSets
--						(RequirementSetId,					RequirementSetType)
--				VALUES	('STR_BONUS_LOYALTY_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
--INSERT OR REPLACE INTO	RequirementSetRequirements
--						(RequirementSetId,					RequirementId)
--				VALUES	('STR_BONUS_LOYALTY_REQUIREMENTS',	'AOE_REQUIRES_OWNER_ADJACENCY');