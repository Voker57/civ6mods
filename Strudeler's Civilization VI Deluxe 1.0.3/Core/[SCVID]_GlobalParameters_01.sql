-- [SCVID]_GlobalParameters_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:39:32 AM
--------------------------------------------------------------
/*	EUREKA/INSPIRATION BOOST					*/
UPDATE Boosts SET Boost = 30;

/* ERA TURN COUNT								*/	
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_ANCIENT';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_CLASSICAL';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 74, GameEraMaximumTurns = 82	WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 64, GameEraMaximumTurns = 72	WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_MODERN';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_ATOMIC';
UPDATE Eras_XP1 SET GameEraMinimumTurns = 54, GameEraMaximumTurns = 62	WHERE EraType = 'ERA_INFORMATION';

/*	AGE THRESHOLD								*/
UPDATE GlobalParameters SET Value = 2 		WHERE Name = 'THRESHOLD_SHIFT_PER_CITY';

/*	ERA BONUS/PENALTIES							*/
UPDATE GlobalParameters SET Value = 50		WHERE Name = 'TECH_COST_PERCENT_CHANGE_AFTER_GAME_ERA';
UPDATE GlobalParameters SET Value = 0		WHERE Name = 'TECH_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';
UPDATE GlobalParameters SET Value = 50		WHERE Name = 'CIVIC_COST_PERCENT_CHANGE_AFTER_GAME_ERA';
UPDATE GlobalParameters SET Value = 0		WHERE Name = 'CIVIC_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';

/*	FRIENDSHIP AND BORDER PROVOCATION			*/
INSERT INTO RequirementSetRequirements
			(RequirementSetId,					RequirementId)
	VALUES	('PLAYER_NEAR_CULTURE_BORDER',		'STR_REQUIRES_PLAYER_NOT_FRIEND');
INSERT INTO Requirements
			(RequirementId,						RequirementType,				Inverse)
	VALUES	('STR_REQUIRES_PLAYER_NOT_FRIEND',	'REQUIREMENT_DECLARED_FRIEND',	1);

/*	GRIEVANCE DECAY								*/
UPDATE Eras_XP2				SET GrievanceDecayRate = 20 WHERE EraType = 'ERA_ANCIENT';
UPDATE Eras_XP2				SET GrievanceDecayRate = 18 WHERE EraType = 'ERA_CLASSICAL';
UPDATE Eras_XP2				SET GrievanceDecayRate = 16 WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Eras_XP2				SET GrievanceDecayRate = 14 WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Eras_XP2				SET GrievanceDecayRate = 12 WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Eras_XP2				SET GrievanceDecayRate = 10	WHERE EraType = 'ERA_MODERN';
UPDATE Eras_XP2				SET GrievanceDecayRate = 8	WHERE EraType = 'ERA_ATOMIC';
UPDATE Eras_XP2				SET GrievanceDecayRate = 4	WHERE EraType = 'ERA_INFORMATION';

/*	GRIEVANCES PERCENTAGE GAINED BY THIRD-PARTY	*/
UPDATE ModifierArguments	SET Value = 2				WHERE Name = 'PercentOfGrievancesDelta' AND ModifierId = 'STANDARD_DIPLOMATIC_THIRD_PARTY_WARMONGER';

/*	DISTANCE TO MAJOR CIVS						*/	
UPDATE GlobalParameters		SET Value = 20				WHERE Name = 'START_DISTANCE_MAJOR_CIVILIZATION';

/*	DISTANCE TO CITY-STATES						*/	
UPDATE GlobalParameters		SET Value = 5				WHERE Name = 'START_DISTANCE_MINOR_CIVILIZATION_START';
UPDATE GlobalParameters		SET Value = 6				WHERE Name = 'START_DISTANCE_MINOR_MAJOR_CIVILIZATION';

/*	DISTANCE TO NATURAL WONDERS					*/	
UPDATE GlobalParameters		SET Value = 1				WHERE Name = 'START_DISTANCE_MAJOR_NATURAL_WONDER';
UPDATE GlobalParameters		SET Value = 1				WHERE Name = 'START_DISTANCE_MINOR_NATURAL_WONDER';

/*	FREQUENCY OF GOODY HUTS						*/
UPDATE Improvements			SET TilesPerGoody	= 50	WHERE ImprovementType='IMPROVEMENT_GOODY_HUT';
UPDATE Improvements			SET GoodyRange		= 4		WHERE ImprovementType='IMPROVEMENT_GOODY_HUT';

/*	FLOODING									*/
INSERT OR REPLACE INTO GlobalParameters
			(Name,										Value)
	VALUES	('CLIMATE_CHANGE_PERCENT_COASTAL_LOWLANDS', 75);

/*	ICE TILES									*/
UPDATE GlobalParameters	SET Value = 10					WHERE Name='ICE_TILES_PERCENT';

/*	EMISSIONS									*/
UPDATE Resource_Consumption SET CO2perkWh		= 350	WHERE ResourceType	= 'RESOURCE_COAL';
UPDATE Resource_Consumption SET CO2perkWh		= 225	WHERE ResourceType	= 'RESOURCE_OIL';
UPDATE Resource_Consumption SET CO2perkWh		= 50	WHERE ResourceType	= 'RESOURCE_URANIUM';
INSERT OR REPLACE INTO	GlobalParameters
						(Name,								Value)
				VALUES	('CLIMATE_CO2_PERCENT_FROM_UNITS',	25);

/*	NUCLEAR DISASTER COOLDOWN					*/	
UPDATE RandomEvents			SET MinTurnAtRisk	= 14	WHERE RandomEventType='RANDOM_EVENT_NUCLEAR_ACCIDENT_MINOR';
UPDATE RandomEvents			SET MinTurnAtRisk	= 21	WHERE RandomEventType='RANDOM_EVENT_NUCLEAR_ACCIDENT_MAJOR';
UPDATE RandomEvents			SET MinTurnAtRisk	= 29	WHERE RandomEventType='RANDOM_EVENT_NUCLEAR_ACCIDENT_CATASTROPHIC';

/*	INDUSTRIAL ERA WORLD CONGRESS				*/	
UPDATE GlobalParameters		SET Value = 4				WHERE Name = 'WORLD_CONGRESS_INITIAL_ERA';