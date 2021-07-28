-- [SCVID]_PersonaPacks_02_TheodoreBullMooseRoughRider
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:21:28 AM
--------------------------------------------------------------
/*	TEDDY PERSONA RELIGION	*/
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_T_ROOSEVELT_ROUGHRIDER';

INSERT OR REPLACE INTO	FavoredReligions
						(LeaderType,						ReligionType)
				SELECT	('LEADER_T_ROOSEVELT_ROUGHRIDER'),	('RELIGION_STR_CHRIST_TRINITARIAN_EVANGELICAL')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_T_ROOSEVELT_ROUGHRIDER');