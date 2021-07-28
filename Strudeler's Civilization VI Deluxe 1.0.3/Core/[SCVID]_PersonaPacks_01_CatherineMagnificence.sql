-- [SCVID]_PersonaPacks_01_CatherineMagnificence
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:20:26 AM
--------------------------------------------------------------
/*	CATHERINE PERSONA RELIGION	*/
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CATHERINE_DE_MEDICI_ALT';

INSERT OR REPLACE INTO	FavoredReligions
						(LeaderType,						ReligionType)
				SELECT	('LEADER_CATHERINE_DE_MEDICI_ALT'),	('RELIGION_STR_CHRIST_TRINITARIAN_CATHOLIC')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CATHERINE_DE_MEDICI_ALT');

