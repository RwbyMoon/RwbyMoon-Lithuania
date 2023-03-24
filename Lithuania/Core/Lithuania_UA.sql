-----------------------------------------------
-- YIELDS FROM POPULATION
-----------------------------------------------

INSERT INTO Types
            (Type,					                                        Kind)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',         'KIND_MODIFIER'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',          'KIND_MODIFIER'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',     'KIND_MODIFIER'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',      'KIND_MODIFIER');


INSERT INTO	TraitModifiers
            (TraitType,									                    ModifierId								)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',         'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_BASE'    ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_BASE'     ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',     'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION' );

INSERT INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId)

VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_NO_PLAYER_RELIGION'),
        
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_NO_PLAYER_RELIGION'),

            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION'),

            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION');

INSERT INTO ModifierArguments
            (ModifierId,                                                        Name,                   Value)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',             'Amount',               '0.5'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',             'YieldType',            'YIELD_FAITH'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',              'Amount',               '0.5'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',              'YieldType',            'YIELD_GOLD'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',         'Amount',               '0.5'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',         'YieldType',            'YIELD_FAITH'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',          'Amount',               '0.5'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',          'YieldType',            'YIELD_GOLD');

INSERT INTO RequirementSets
            (RequirementSetId,                                                      RequirementSetType) 
VALUES      ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_NO_PLAYER_RELIGION',                       'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION',  'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_NO_PLAYER_RELIGION',                        'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_NO_PLAYER_RELIGION',                        'RWB_DIEVDIRBIAI_RELIGION_IS_NOT_PLAYER_FOUNDED'),
            ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION',   'RWB_DIEVDIRBIAI_RELIGION_IS_NOT_PLAYER_FOUNDED'),
            ('REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION_AND_NO_PLAYER_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED');

INSERT INTO Requirements
            (RequirementId,                                     RequirementType,                            Inverse) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                  'REQUIREMENT_PLAYER_HAS_CIVIC',             0),
            ('RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED',       'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION',   1),
            ('RWB_DIEVDIRBIAI_RELIGION_IS_NOT_PLAYER_FOUNDED',  'REQUIREMENT_PLAYER_IS_RELIGION_FOUNDER',   1);

INSERT INTO RequirementArguments
            (RequirementId,                                     Name,               Value) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                  'CivicType',        'CIVIC_MYSTICISM');

-----------------------------------------------
-- LANDOWNER
-----------------------------------------------

INSERT INTO Types
(Type,					                Kind)
VALUES	      ('UNIT_RWB_LANDOWNER',	                'KIND_UNIT'),
                ('ABILITY_RWB_LANDOWNER',				'KIND_ABILITY'	),
                ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK',				'KIND_MODIFIER'	);

INSERT INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		'TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK'	);

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
                   'COST_PROGRESSION_GAME_PROGRESS',
                   '1000',
                   '0',
                   'YIELD_FAITH',
                   '1',
                   '0',
                   'ADVISOR_GENERIC',
                   'CIVIC_MYSTICISM',
                   'TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER');

INSERT INTO Modifiers
(ModifierId, ModifierType)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD');

INSERT INTO ModifierArguments
(ModifierId,Name,Value)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','UnitType','UNIT_RWB_LANDOWNER');

INSERT INTO Tags
(Tag,					Vocabulary)
VALUES	    ('CLASS_RWB_LANDOWNER',	'ABILITY_CLASS');

INSERT INTO TypeTags
(Type,                       Tag)

VALUES      ('UNIT_RWB_LANDOWNER',     'CLASS_LANDCIVILIAN'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_ALL_ERAS'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_RWB_LANDOWNER'),
            ('ABILITY_RWB_LANDOWNER',  'CLASS_RWB_LANDOWNER');

INSERT INTO UnitAiInfos
(UnitType, AiType)
VALUES      ('UNIT_RWB_LANDOWNER','UNITAI_BUILD'),
            ('UNIT_RWB_LANDOWNER','UNITTYPE_CIVILIAN');

INSERT INTO UnitCaptures
(CapturedUnitType, BecomesUnitType)
VALUES      ('UNIT_RWB_LANDOWNER','UNIT_BUILDER');

INSERT INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
SELECT      DistrictType,                  'UNIT_RWB_LANDOWNER',      '100'
FROM Districts WHERE Appeal >= 1;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT INTO Types
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
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);