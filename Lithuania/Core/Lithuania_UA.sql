-----------------------------------------------
-- DIEVDIRBYS
-----------------------------------------------

INSERT INTO Types
(Type,					                Kind)
VALUES	    ('UNIT_RWB_DIEVDIRBYS',	                'KIND_UNIT'),
            ('ABILITY_RWB_DIEVDIRBYS',				'KIND_ABILITY'	),
            ('TRAIT_CIVILIZATION_DIEVDIRBYS_UNIQUE_UNIT_UNLOCK',				'KIND_MODIFIER'	);

INSERT INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_UNIT_DIEVDIRBYS',		'TRAIT_CIVILIZATION_DIEVDIRBYS_UNIQUE_UNIT_UNLOCK'	);

INSERT INTO Units
(UnitType,
 Name,
 Description,
 BaseSightRange,
 BaseMoves,
 Combat,
 RangedCombat,
 Range,
 Bombard,
 Domain,
 FormationClass,
 Cost,
 BuildCharges,
 CanCapture,
 CanRetreatWhenCaptured,
 CostProgressionModel,
 CostProgressionParam1,
 CanTrain,
 PurchaseYield,
 MustPurchase,
 Maintenance,
 AdvisorType,
 PrereqCivic,
 TraitType)


VALUES	   ('UNIT_RWB_DIEVDIRBYS',
              'LOC_UNIT_RWB_DIEVDIRBYS_NAME',
              'LOC_TRAIT_CIVILIZATION_UNIT_RWB_DIEVDIRBYS_DESCRIPTION',
              '3',
              '4',
              '0',
              '0',
              '0',
              '0',
              'DOMAIN_LAND',
              'FORMATION_CLASS_CIVILIAN',
              '54',
              '1',
              '0',
              '0',
              'COST_PROGRESSION_GAME_PROGRESS',
              '1000',
              '0',
              'YIELD_FAITH',
              '1',
              '0',
              'ADVISOR_GENERIC',
              'CIVIC_MYSTICISM',
              'TRAIT_CIVILIZATION_RWB_UNIT_DIEVDIRBYS');

INSERT INTO Modifiers
(ModifierId, ModifierType)
VALUES      ('TRAIT_CIVILIZATION_DIEVDIRBYS_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD');

INSERT INTO ModifierArguments
(ModifierId,Name,Value)
VALUES      ('TRAIT_CIVILIZATION_DIEVDIRBYS_UNIQUE_UNIT_UNLOCK','UnitType','UNIT_RWB_DIEVDIRBYS');

INSERT INTO Tags
(Tag,					Vocabulary)
VALUES	    ('CLASS_RWB_DIEVDIRBYS',	'ABILITY_CLASS');

INSERT INTO TypeTags
(Type,                       Tag)

VALUES      ('UNIT_RWB_DIEVDIRBYS',     'CLASS_LANDCIVILIAN'),
            ('UNIT_RWB_DIEVDIRBYS',     'CLASS_ALL_ERAS'),
            ('UNIT_RWB_DIEVDIRBYS',     'CLASS_RWB_DIEVDIRBYS'),
            ('ABILITY_RWB_DIEVDIRBYS',  'CLASS_RWB_DIEVDIRBYS');

INSERT INTO UnitAiInfos
(UnitType, AiType)
VALUES      ('UNIT_RWB_DIEVDIRBYS','UNITAI_BUILD'),
            ('UNIT_RWB_DIEVDIRBYS','UNITTYPE_CIVILIAN');

INSERT INTO UnitCaptures
(CapturedUnitType, BecomesUnitType)
VALUES      ('UNIT_RWB_DIEVDIRBYS','UNIT_BUILDER');

INSERT INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
SELECT      DistrictType,                  'UNIT_RWB_DIEVDIRBYS',      100
FROM Districts WHERE Appeal >= 1;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

/*INSERT INTO Types
                (Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO	TraitModifiers
                    (TraitType,									  ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO Modifiers
(ModifierId, ModifierType)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO ModifierArguments
(ModifierId,                                                                     Name,               Value) 
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE',   'BuildingType',       Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);*/

INSERT INTO Types
(Type,					                                        Kind)
SELECT	    Districts.DistrictType||'_FAITH_PURCHASE_ALLOW','KIND_MODIFIER'
FROM Districts WHERE Appeal >= 1 UNION

SELECT	    Districts.DistrictType||'FAITH_PURCHASE_MODIFIER','KIND_MODIFIER'
FROM Districts WHERE Appeal >= 1;

INSERT INTO	TraitModifiers
(TraitType,									  ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',Districts.DistrictType||'_FAITH_PURCHASE_ALLOW'
FROM Districts WHERE Appeal >= 1;

INSERT INTO Modifiers
(ModifierId, ModifierType)
SELECT      Districts.DistrictType||'_FAITH_PURCHASE_ALLOW','MODIFIER_ALL_CITIES_ATTACH_MODIFIER'
FROM Districts WHERE Appeal >= 1;

INSERT INTO ModifierArguments
(ModifierId,                                                                     Name,               Value)
SELECT      Districts.DistrictType||'_FAITH_PURCHASE_ALLOW',      'ModifierId',       Districts.DistrictType||'_FAITH_PURCHASE_MODIFIER'
FROM Districts WHERE Appeal >= 1;

INSERT INTO Modifiers
(ModifierId, ModifierType)
SELECT      Districts.DistrictType||'FAITH_PURCHASE_MODIFIER','MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE'
FROM Districts WHERE Appeal >= 1;

INSERT INTO ModifierArguments
(ModifierId,                                                                     Name,               Value)
SELECT      Districts.DistrictType||'FAITH_PURCHASE_MODIFIER',      'DistrictType',       Districts.DistrictType
FROM Districts WHERE Appeal >= 1;