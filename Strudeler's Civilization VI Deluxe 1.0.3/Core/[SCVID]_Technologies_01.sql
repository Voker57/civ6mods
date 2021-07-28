-- [SCVID]_Technologies_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:33:14 AM
--------------------------------------------------------------
/*  TECHNOLOGIES COST				*/	
UPDATE Technologies	SET Cost = Cost*.8	WHERE EraType = 'ERA_ANCIENT';
UPDATE Technologies	SET Cost = Cost*1.2	WHERE EraType = 'ERA_CLASSICAL';
UPDATE Technologies	SET Cost = Cost*2.8	WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Technologies	SET Cost = Cost*2.8	WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Technologies	SET Cost = Cost*2.8	WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Technologies	SET Cost = Cost*2.6	WHERE EraType = 'ERA_MODERN';
UPDATE Technologies	SET Cost = Cost*2.3	WHERE EraType = 'ERA_ATOMIC';
UPDATE Technologies	SET Cost = Cost*2.3	WHERE EraType = 'ERA_INFORMATION';
UPDATE Technologies	SET Cost = Cost*5	WHERE EraType = 'ERA_FUTURE';

/*	RANDOM FUTURE/SHUFFLE COST				*/
UPDATE TechnologyRandomCosts	SET Cost = Cost*2.5;