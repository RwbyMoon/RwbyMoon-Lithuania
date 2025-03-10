/*
PILIAKALNIS
Lithuanian unique district dedicated to growing the city and protecting, significantly influencing Appeal. Cannot be placed adjacent to City-Center.
- This district and those adjacent to it generate 1 Food, an additional 1 when built on a Floodplain, a Reef or a Marsh, and an additional 1 if the tile is Breathtaking.
- Within 4 tiles of a Piliakalnis, military units gain +3 Combat Strength and religious units gain +8 Religious Strength.
- +2 Appeal on adjacent tiles
- Causes Zone of Control on enemy units.
*/


-----------------------------------------------
-- Setup
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,												Kind			)
VALUES	('TRAIT_DISTRICT_RWB_PILIAKALNIS',		        'KIND_TRAIT'	);

-----------------------------------------------

INSERT OR IGNORE INTO Traits
(TraitType,											Name,														Description														)
VALUES	('TRAIT_DISTRICT_RWB_PILIAKALNIS',		        'LOC_DISTRICT_RWB_PILIAKALNIS_NAME',		        'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION'	);

-----------------------------------------------

INSERT OR IGNORE INTO CivilizationTraits
(CivilizationType,				    TraitType										)
VALUES	('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_DISTRICT_RWB_PILIAKALNIS'	);

-----------------------------------------------	
-- Types
-----------------------------------------------	


INSERT OR IGNORE INTO Types
(Type,								            Kind)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		            'KIND_DISTRICT');

-----------------------------------------------	
-- Districts
-----------------------------------------------	

INSERT OR IGNORE INTO Districts
(
    DistrictType,
    Name,
    Description,

    TraitType,
    PrereqCivic,

    Cost,
    CostProgressionModel,
    CostProgressionParam1,
    Maintenance,

    HitPoints,

    Appeal,
    CityStrengthModifier,

    PlunderType,
    PlunderAmount,
    CaptureRemovesDistrict,
    CaptureRemovesBuildings,
    CaptureRemovesCityDefenses,

    AdvisorType,

    RequiresPlacement,
    RequiresPopulation,
    OnePerCity,

    Aqueduct,
    NoAdjacentCity,
    InternalOnly,
    ZOC,
    MilitaryDomain
)
VALUES
    ('DISTRICT_RWB_PILIAKALNIS', -- DistrictType
     'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
     'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description

     'TRAIT_DISTRICT_RWB_PILIAKALNIS', -- TraitType
     'CIVIC_STATE_WORKFORCE', -- PrereqCivic

     '27', -- Cost
     'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', -- CostProgressionModel
     '40', -- CostProgressionParam1
     '3', -- Maintenance

     '0', -- HitPoints

     '2', -- Appeal
     '2', -- CityStrengthModifier

     'PLUNDER_GOLD', -- PlunderType
     '50', -- PlunderAmount
     '1', -- CaptureRemovesDistrict
     '0', -- CaptureRemovesBuildings
     '0', -- CaptureRemovesCityDefenses

     'ADVISOR_GENERIC', -- AdvisorType

     '1', -- RequiresPlacement
     '1', -- RequiresPopulation
     '1', -- OnePerCity

     '0', -- Aqueduct
     '1', -- NoAdjacentCity
     '0', -- InternalOnly
     '1', -- ZOC
     'NO_DOMAIN'); -- MilitaryDomain

-----------------------------------------------	
-- District_TradeRouteYields
-----------------------------------------------	

INSERT OR IGNORE INTO District_TradeRouteYields
(DistrictType,
 YieldType,
 YieldChangeAsDomesticDestination,
 YieldChangeAsInternationalDestination)
VALUES	    (  'DISTRICT_RWB_PILIAKALNIS',
                 'YIELD_FOOD',
                 '1',
                 '0'),
              (  'DISTRICT_RWB_PILIAKALNIS',
                 'YIELD_CULTURE',
                 '0',
                 '1');

-----------------------------------------------	
-- This district and those adjacent to it generate 1 Food, an additional 1 when built on a Floodplain, a Reef or a Marsh, and an additional 1 if the tile is Breathtaking.
-----------------------------------------------	

CREATE TABLE IF NOT EXISTS Rwb_PiliakalnisFeatures_UI
(
    FeatureType TEXT
);

INSERT OR IGNORE INTO Rwb_PiliakalnisFeatures_UI
(FeatureType)
VALUES ('FEATURE_MARSH') UNION
SELECT	    Features.FeatureType FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%' UNION
SELECT 'FEATURE_REEF' WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');


-----


INSERT OR IGNORE INTO Types
(Type,														                            Kind)
VALUES	    ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'KIND_MODIFIER') UNION
SELECT      'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,		'KIND_MODIFIER' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT    	'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'KIND_MODIFIER' FROM Rwb_PiliakalnisFeatures_UI;
;

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                                            ModifierType,                                                   SubjectRequirementSetId)
VALUES	    ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',                 null),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                'REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',                 'REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING') UNION
SELECT      'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT    	'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',     'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType FROM Rwb_PiliakalnisFeatures_UI;

INSERT OR IGNORE INTO ModifierArguments
            (ModifierId,                                                                            Name,                               Value)
VALUES	    ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'YieldType',                        'YIELD_FOOD'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'Amount',                           '1'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'YieldType',                        'YIELD_FOOD'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'Amount',                           '1'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'YieldType',                        'YIELD_FOOD'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'Amount',                           '1'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'YieldType',                        'YIELD_FOOD'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'Amount',                           '1') UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'YieldType',                'YIELD_FOOD' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'Amount',                   '1' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'YieldType',                'YIELD_FOOD' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'Amount',                   '1' FROM Rwb_PiliakalnisFeatures_UI;

--

INSERT OR IGNORE INTO DistrictModifiers
            (DistrictType,                                                  ModifierId)
VALUES      ('DISTRICT_RWB_PILIAKALNIS',                                    'MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT'),
            ('DISTRICT_RWB_PILIAKALNIS',                                    'MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING') UNION
SELECT      'DISTRICT_RWB_PILIAKALNIS',                         'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType  FROM Rwb_PiliakalnisFeatures_UI;

INSERT OR IGNORE INTO TraitModifiers
            (TraitType,                                                     ModifierId)
VALUES      ('TRAIT_DISTRICT_RWB_PILIAKALNIS',                 'MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT'),
            ('TRAIT_DISTRICT_RWB_PILIAKALNIS',                 'MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT') UNION
SELECT      'TRAIT_DISTRICT_RWB_PILIAKALNIS',        'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType  FROM Rwb_PiliakalnisFeatures_UI;

--

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,                                                                  RequirementSetType)
VALUES          ('REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS',                                  'REQUIREMENTSET_TEST_ALL'),
                ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'REQUIREMENTSET_TEST_ALL'),
                ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING',                                          'REQUIREMENTSET_TEST_ALL') UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'REQUIREMENTSET_TEST_ALL' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType,                           'REQUIREMENTSET_TEST_ALL' FROM Rwb_PiliakalnisFeatures_UI;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                                                                  RequirementId)
VALUES          ('REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS',                                  'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS') UNION

VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS') UNION
VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_IS_NOT_PILIAKALNIS') UNION
VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_IS_ON_BREATHTAKING') UNION

VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING',                                          'RWB_REQUIRES_IS_ON_BREATHTAKING') UNION

SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_IS_NOT_PILIAKALNIS' FROM Rwb_PiliakalnisFeatures_UI UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_IS_ON_'||FeatureType FROM Rwb_PiliakalnisFeatures_UI UNION

SELECT          'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType,                           'RWB_REQUIRES_IS_ON_'||FeatureType FROM Rwb_PiliakalnisFeatures_UI;

INSERT OR IGNORE INTO Requirements
(RequirementId,								            RequirementType,                                                Inverse)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',              '0'),
                  ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',		                'REQUIREMENT_DISTRICT_TYPE_MATCHES',                            '1'),
                  ('RWB_REQUIRES_IS_ON_BREATHTAKING',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                           '0') UNION
SELECT          'RWB_REQUIRES_IS_ON_'||FeatureType,		'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',        '0' FROM Rwb_PiliakalnisFeatures_UI;



INSERT OR IGNORE INTO RequirementArguments
(RequirementId,								             Name,                      Value)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
                  ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MinRange',                 '1'),
                  ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MaxRange',                 '1'),
                  ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',                     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
                  ('RWB_REQUIRES_IS_ON_BREATHTAKING',                     'MinimumAppeal',            '4') UNION
SELECT          'RWB_REQUIRES_IS_ON_'||FeatureType,        'FeatureType',       FeatureType FROM Rwb_PiliakalnisFeatures_UI
;

-----------------------------------------------	
-- Strength Aura for Combat & Religious units in a 4-tile range from the UD.
-----------------------------------------------	

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                            ModifierType,                               SubjectRequirementSetId)
VALUES      ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER',         'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',      'REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS'),
            ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER',      'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',      'REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS');

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                            Name,                   Value)
VALUES      ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER',    'AbilityType',          'ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH'),
            ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER', 'AbilityType',          'ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH');

INSERT OR IGNORE INTO TraitModifiers
(TraitType, ModifierId)
VALUES      ('TRAIT_DISTRICT_RWB_PILIAKALNIS', 'TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER') ,
            ('TRAIT_DISTRICT_RWB_PILIAKALNIS', 'TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER') ;

INSERT OR IGNORE INTO Types
(Type, Kind)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',       'KIND_ABILITY'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',    'KIND_ABILITY');

INSERT OR IGNORE INTO TypeTags
(Type, Tag)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',       'CLASS_ALL_COMBAT_UNITS'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',    'CLASS_RELIGIOUS_ALL');

INSERT OR IGNORE INTO UnitAbilities
(UnitAbilityType,
 Name,
 Description,
 Inactive)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',
             'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_NAME',
             'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_DESCRIPTION',
             '1'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',
             'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_NAME',
             'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_DESCRIPTION',
             '1');

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                        ModifierType)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                Name,                   Value)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',       'Amount',               '3'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',    'Amount',               '8');

INSERT OR IGNORE INTO UnitAbilityModifiers
(UnitAbilityType,                                                   ModifierId)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',            'RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',         'RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH');

INSERT OR IGNORE INTO ModifierStrings
(ModifierId,                                       Context,           Text)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',       'Preview',          'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_BONUS_DESCRIPTION'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',    'Preview',          'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_BONUS_DESCRIPTION');

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,                                                   RequirementSetType)
VALUES      ('REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',          'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                             RequirementId)
VALUES      ('REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',    'RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS');

INSERT OR IGNORE INTO Requirements
(RequirementId,                                                         RequirementType)
VALUES      ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',    'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,                                    Name,               Value)
VALUES      ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'DistrictType',     'DISTRICT_RWB_PILIAKALNIS'),
            ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'MinRange',         '0'),
            ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'MaxRange',         '4');