-- [SCVID]_Terrain_01
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:44:53 AM
--------------------------------------------------------------
/*	FLAT GRASSLAND YIELD	*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_GRASS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_GRASS',			'YIELD_FOOD',		3);

/*	HILL GRASSLAND YIELD	*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_GRASS_HILLS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_GRASS_HILLS',		'YIELD_FOOD',		1),
			('TERRAIN_GRASS_HILLS',		'YIELD_PRODUCTION',	1),
			('TERRAIN_GRASS_HILLS',		'YIELD_GOLD',		1);

/*	FLAT PLAINS YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_PLAINS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_PLAINS',			'YIELD_FOOD',		2),
			('TERRAIN_PLAINS',			'YIELD_PRODUCTION',	1);

/*	HILL PLAINS YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_PLAINS_HILLS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_PLAINS_HILLS',	'YIELD_PRODUCTION',	2),
			('TERRAIN_PLAINS_HILLS',	'YIELD_GOLD',		1);

/*	FLAT DESERT YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_DESERT';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_DESERT',			'YIELD_FAITH',		1);

/*	HILL DESERT YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_DESERT_HILLS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_DESERT_HILLS',	'YIELD_FAITH',		1),
			('TERRAIN_DESERT_HILLS',	'YIELD_PRODUCTION',	2);

/*	COAST/LAKE YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_COAST';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_COAST',			'YIELD_FOOD',		2),
			('TERRAIN_COAST',			'YIELD_GOLD',		1);

/*	OCEAN YIELD				*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_OCEAN';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_OCEAN',			'YIELD_FOOD',		1),
			('TERRAIN_OCEAN',			'YIELD_CULTURE',	1);

/*	FLAT TUNDRA YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_TUNDRA';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_TUNDRA',			'YIELD_FOOD',		1),
			('TERRAIN_TUNDRA',			'YIELD_PRODUCTION',	1);

/*	HILL TUNDRA YIELD		*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_TUNDRA_HILLS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_TUNDRA_HILLS',	'YIELD_PRODUCTION',	2),
			('TERRAIN_TUNDRA_HILLS',	'YIELD_GOLD',		1);

/*	FLAT SNOW YIELD			*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_SNOW';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_SNOW',			'YIELD_SCIENCE',	1);

/*	HILL SNOW YIELD			*/
DELETE FROM Terrain_YieldChanges WHERE TerrainType = 'TERRAIN_SNOW_HILLS';
INSERT OR REPLACE INTO Terrain_YieldChanges
			(TerrainType,				YieldType,			YieldChange)
	VALUES	('TERRAIN_SNOW_HILLS',		'YIELD_SCIENCE',	1),
			('TERRAIN_SNOW_HILLS',		'YIELD_PRODUCTION',	2);