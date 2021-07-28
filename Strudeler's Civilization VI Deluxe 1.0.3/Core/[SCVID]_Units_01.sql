-- [SCVID]_Units_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 12:20:09 PM
--------------------------------------------------------------
/*	UNIT RENAME								*/
--UPDATE GlobalParameters		SET Value = 0				WHERE Name = 'UNIT_EXPERIENCE_LEVEL_FOR_CUSTOM_NAME';

/*	INCREASED UNIT MOVEMENT					*/		
UPDATE	Units	SET	BaseMoves = BaseMoves +1;

/*	INCREASED UNIT SIGHT					*/
--UPDATE Units SET BaseSightRange = BaseSightRange +1;

/*	INCREASED UNIT MAINTENANCE				*/
UPDATE	Units	SET Maintenance = Maintenance +1;

/*	UNIT TAGS								*/
INSERT INTO Tags
			(Tag,							Vocabulary)
	VALUES	('CLASS_STR_SAKA_HORSE_ARCHER',	'ABILITY_CLASS');