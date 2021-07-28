-- [SCVID]_Civics_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:33:48 AM
--------------------------------------------------------------
/*  CIVICS COST						*/	
UPDATE Civics		SET Cost = Cost*.8	WHERE EraType = 'ERA_ANCIENT';
UPDATE Civics		SET Cost = Cost*1.2	WHERE EraType = 'ERA_CLASSICAL';
UPDATE Civics		SET Cost = Cost*2.8	WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Civics		SET Cost = Cost*2.8	WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Civics		SET Cost = Cost*2.8	WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Civics		SET Cost = Cost*2.6	WHERE EraType = 'ERA_MODERN';
UPDATE Civics		SET Cost = Cost*2.3	WHERE EraType = 'ERA_ATOMIC';
UPDATE Civics		SET Cost = Cost*2.3	WHERE EraType = 'ERA_INFORMATION';
UPDATE Civics		SET Cost = Cost*5	WHERE EraType = 'ERA_FUTURE';

/*	RANDOM FUTURE/SHUFFLE COST				*/
UPDATE CivicRandomCosts			SET Cost = Cost*2.5;