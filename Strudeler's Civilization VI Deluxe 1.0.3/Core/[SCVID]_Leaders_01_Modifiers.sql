-- [SCVID]_Leaders_01_Modifiers
-- Author: Strudeler
-- DateCreated: 4/4/2021 4:06:32 PM
--------------------------------------------------------------
/*	GANDHI				*/
UPDATE		ModifierArguments	SET Value	=	10	WHERE ModifierId = 'TRAIT_FAITH_PEACEFUL_FOUNDERS'	AND Name	=	'Amount';

/*	MVEMBA A NZINGA		*/
DELETE FROM	ExcludedDistricts	WHERE TraitType	=	'TRAIT_LEADER_RELIGIOUS_CONVERT'	AND DistrictType = 'DISTRICT_HOLY_SITE';

/*	SEONDEOK			*/
DELETE FROM TraitModifiers		WHERE ModifierId	=	'TRAIT_ADJUST_CITY_CULTURE_PER_GOVERNOR_TITLE_MODIFIER';
DELETE FROM TraitModifiers		WHERE ModifierId	=	'TRAIT_ADJUST_CITY_SCIENCE_PER_GOVERNOR_TITLE_MODIFIER';

/*	MATTHIAS CORVINUS	*/
UPDATE		ModifierArguments	SET Value = 1	WHERE ModifierId	=	'LEVY_MILITARY_TWO_FREE_ENVOYS'	AND Name	=	'Amount';

/*	LADY SIX SKY	*/
DELETE FROM TraitModifiers		WHERE ModifierId	=	'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';
DELETE FROM TraitModifiers		WHERE ModifierId	=	'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS';