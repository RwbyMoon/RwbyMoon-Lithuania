-----------------------------------------------
-- NO ADJACENCY + ADJACENCY FROM APPEAL
-----------------------------------------------

--- Remove Adjacency for all specialty districts

/*INSERT OR REPLACE INTO ExcludedAdjacencies
(TraitType, YieldChangeId)
SELECT 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI', YieldChangeId
FROM District_Adjacencies WHERE DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL AND RequiresPopulation = 1);


-- Adjacency from Appeal on Districts MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL
-- 1 modifier = 1 quartier -> je me base sur le yieldchangeid District_something de DistrictAdjacencies

INSERT OR REPLACE INTO Types
            (Type,                                                          Kind)
SELECT      'TRAIT_CIVILIZATION_DIEVDIRBIAI_'||a.DistrictType||'_GOLD'||b.Size,     'KIND_MODIFIER' 
FROM Districts a, AppealReference b WHERE a.TraitType IS NULL AND a.RequiresPopulation = 1 AND b.Size > -10;


CREATE TABLE IF NOT EXISTS AppealReference
(
    Size INT
);
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val - 10 FROM t LIMIT 20)
INSERT INTO AppealReference (Size) SELECT val FROM t;

INSERT INTO Requirements
(RequirementId,									RequirementType)
SELECT	'RWB_REQUIRES_DISTRICT_HAS_'||Size||'_APPEAL',	'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN' FROM AppealReference WHERE Size > -10;

INSERT INTO RequirementArguments
(RequirementId,									Name,		Value)
SELECT	'RWB_REQUIRES_DISTRICT_HAS_'||Size||'_APPEAL',	    'Amount',	Size FROM AppealReference WHERE Size > -10;

INSERT INTO RequirementSets
(RequirementSetId,						RequirementSetType)
SELECT	'RWB_DISTRICT_HAS_'||Size||'_APPEAL',	'REQUIREMENTSET_TEST_ALL' FROM AppealReference WHERE Size > -10;

INSERT INTO RequirementSetRequirements
(RequirementSetId,						RequirementId)
SELECT	'RWB_DISTRICT_HAS_'||Size||'_APPEAL',	'RWB_REQUIRES_DISTRICT_HAS_'||Size||'_APPEAL' FROM AppealReference WHERE Size > -10;

INSERT INTO Modifiers
(ModifierId,									ModifierType,										SubjectRequirementSetId)
SELECT	'RWB_PRODUCTION_FROM_'||Size||'_APPEAL',	'P0K_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'RWB_DISTRICT_HAS_'||Size||'_APPEAL' 
FROM AppealReference WHERE Size > -10;


DROP TABLE AppealReference;*/

-----------------------------------------------
-- LANDOWNER
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,					                Kind)
VALUES	        ('UNIT_RWB_LANDOWNER',	                'KIND_UNIT'),
                ('ABILITY_RWB_LANDOWNER',				'KIND_ABILITY'	),
                ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK',				'KIND_MODIFIER'	);

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		'TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK'	);

INSERT OR REPLACE INTO Units
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
 PrereqCivic)


VALUES	        ('UNIT_RWB_LANDOWNER',
                   'LOC_UNIT_RWB_LANDOWNER_NAME',
                   'LOC_TRAIT_CIVILIZATION_UNIT_RWB_LANDOWNER_DESCRIPTION',
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
                   'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH',
                   '40',
                   '0',
                   'YIELD_FAITH',
                   '1',
                   '0',
                   'ADVISOR_GENERIC',
                   'CIVIC_MYSTICISM');

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,Name,Value)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','UnitType','UNIT_RWB_LANDOWNER');

INSERT OR REPLACE INTO Tags
(Tag,					Vocabulary)
VALUES	    ('CLASS_RWB_LANDOWNER',	'ABILITY_CLASS');

INSERT OR REPLACE INTO TypeTags
(Type,                       Tag)

VALUES      ('UNIT_RWB_LANDOWNER',     'CLASS_LANDCIVILIAN'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_ALL_ERAS'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_RWB_LANDOWNER'),
            ('ABILITY_RWB_LANDOWNER',  'CLASS_RWB_LANDOWNER');

INSERT OR REPLACE INTO UnitAiInfos
(UnitType, AiType)
VALUES      ('UNIT_RWB_LANDOWNER','UNITAI_BUILD'),
            ('UNIT_RWB_LANDOWNER','UNITTYPE_CIVILIAN');

INSERT OR REPLACE INTO UnitCaptures
(CapturedUnitType, BecomesUnitType)
VALUES      ('UNIT_RWB_LANDOWNER','UNIT_BUILDER');

INSERT OR REPLACE INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
SELECT      DistrictType,                  'UNIT_RWB_LANDOWNER',      '100'
FROM Districts WHERE Appeal >= 1;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,									  ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                                     Name,               Value)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE',   'BuildingType',       Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);