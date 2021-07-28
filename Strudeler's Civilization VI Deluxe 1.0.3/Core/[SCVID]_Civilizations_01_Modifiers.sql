-- [SCVID]_Civilizations_01_Modifiers
-- Author: Strudeler
-- DateCreated: 4/3/2021 11:30:38 AM
--------------------------------------------------------------
/*	RUSSIA TRAIT			*/
DELETE FROM TraitModifiers			WHERE ModifierId = 'TRAIT_INCREASED_TUNDRA_PRODUCTION';
DELETE FROM TraitModifiers			WHERE ModifierId = 'TRAIT_INCREASED_TUNDRA_HILLS_PRODUCTION';

/*	GRAN COLOMBIA TRAIT		*/
DELETE FROM TraitModifiers			WHERE ModifierId = 'TRAIT_EJERCITO_PATRIOTA_EXTRA_MOVEMENT';

/*	BYZANTIUM TRAIT			*/
DELETE FROM TraitModifiers			WHERE ModifierId = 'BYZANTIUM_GREATPROPHETPOINTS';
