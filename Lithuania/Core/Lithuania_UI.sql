-----------------------------------------------
-- PILIAKALNIS YIELDS
-----------------------------------------------

CREATE TABLE IF NOT EXISTS Rwb_AppealReference_UI
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 45)
INSERT OR REPLACE INTO Rwb_AppealReference_UI (Size) SELECT val FROM t;


-----------------------------------------------	
-- Types
-----------------------------------------------	


INSERT OR REPLACE INTO Types
            (Type,								            Kind)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		            'KIND_DISTRICT');

INSERT OR REPLACE INTO Types
(Type,								            Kind)
SELECT    'RWB_PILIAKALNIS_ADJ_FAITH_YIELD_'||Size,		'KIND_MODIFIER'
FROM Rwb_AppealReference_UI;

-----------------------------------------------	
-- Districts
-----------------------------------------------	

INSERT OR REPLACE INTO Districts
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

    'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS', -- TraitType
    'CIVIC_MYSTICISM', -- PrereqCivic

    '27', -- Cost
    'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', -- CostProgressionModel
    '40', -- CostProgressionParam1
    '0', -- Maintenance

    '0', -- HitPoints

    '1', -- Appeal
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

INSERT INTO MutuallyExclusiveDistricts
(District,						MutuallyExclusiveDistrict)
SELECT	'DISTRICT_RWB_PILIAKALNIS',			'DISTRICT_PRESERVE'
WHERE EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE') UNION
SELECT	'DISTRICT_RWB_PILIAKALNIS',			'DISTRICT_LEU_GARDEN'
WHERE EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_LEU_GARDEN') UNION
SELECT	'DISTRICT_PRESERVE',			'DISTRICT_RWB_PILIAKALNIS'
WHERE EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE') UNION
SELECT	'DISTRICT_LEU_GARDEN',			'DISTRICT_RWB_PILIAKALNIS'
WHERE EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_LEU_GARDEN');

UPDATE Districts 
SET Description = 'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION_PRESERVE'
WHERE DistrictType = 'DISTRICT_RWB_PILIAKALNIS'
AND EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE');

UPDATE Districts
SET Description = 'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION_GARDEN'
WHERE DistrictType = 'DISTRICT_RWB_PILIAKALNIS'
  AND EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_LEU_GARDEN');

UPDATE Districts
SET Description = 'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION_GARDEN_PLUS_PRESERVE'
WHERE DistrictType = 'DISTRICT_RWB_PILIAKALNIS'
  AND EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE') 
  AND EXISTS (SELECT DistrictType FROM Districts WHERE DistrictType = 'DISTRICT_LEU_GARDEN');

-----------------------------------------------	
-- District-made yields
-----------------------------------------------	

/*CREATE TABLE IF NOT EXISTS Rwb_DistrictAmountReference_UI
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 0 UNION ALL SELECT val + 1 FROM t LIMIT 6)
INSERT OR REPLACE INTO Rwb_DistrictAmountReference_UI (Size) SELECT val FROM t;

CREATE TABLE IF NOT EXISTS Rwb_EffectList
(
    YieldType1 TEXT,
    YieldType2 TEXT,
    YieldAmount1 TEXT,
    YieldAmount2 TEXT
);*/

INSERT OR REPLACE INTO Types
(Type, Kind)
VALUES  ('MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',			'KIND_MODIFIER'),
        ('MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',	'KIND_MODIFIER');

INSERT INTO	DynamicModifiers
          (ModifierType,								CollectionType,					    EffectType									)
VALUES	  ('MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',	    'COLLECTION_CITY_PLOT_YIELDS',		'EFFECT_ADJUST_PLOT_YIELD'),
          ('MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',	'COLLECTION_CITY_PLOT_YIELDS',		'EFFECT_ADJUST_PLOT_YIELD');


INSERT INTO	Modifiers
        (ModifierId,		                                                    ModifierType,				                    SubjectRequirementSetId						)
VALUES  ('MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1_ATTACH',	                'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',   	    'DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1',			                'MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',	            'PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1_ATTACH',              'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',   	    'DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1',		                'MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',     	'PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET'),
        
        ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1_ATTACH',	    'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',   	    'DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1',			    'MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',	            'PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1_ATTACH', 'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',   	    'DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1',	    'MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',     	'PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET'),
        
        ('MODIFIER_RWB_PILIAKALNIS_OWN_FOOD_ADJACENCY_1',	                    'MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',				'PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_OWN_PRODUCTION_ADJACENCY_1',                 'MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',     	'PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_FOOD_ADJACENCY_1',	        'MODTYPE_RWB_PILIAKALNIS_YIELD_FOOD',				'PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET'),
        ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_PRODUCTION_ADJACENCY_1',	'MODTYPE_RWB_PILIAKALNIS_YIELD_PRODUCTION',     	'PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET');
        
INSERT OR REPLACE INTO	TraitModifiers
(TraitType,														ModifierId								)
VALUES    ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1_ATTACH'),
		  ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1_ATTACH'),
		  ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1_ATTACH'),
		  ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1_ATTACH');

INSERT OR REPLACE INTO	DistrictModifiers
(DistrictType,							    ModifierId								)
VALUES    ('DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_OWN_FOOD_ADJACENCY_1'),
          ('DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_OWN_PRODUCTION_ADJACENCY_1'),
          ('DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_FOOD_ADJACENCY_1'),
          ('DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_PRODUCTION_ADJACENCY_1');

INSERT INTO ModifierArguments
(ModifierId,Name,Value)
VALUES  	('MODIFIER_RWB_PILIAKALNIS_OWN_FOOD_ADJACENCY_1',		                    'YieldType',				'YIELD_FOOD'),
            ('MODIFIER_RWB_PILIAKALNIS_OWN_FOOD_ADJACENCY_1',		                    'Amount',				    '1'),
            ('MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1_ATTACH',		                'ModifierId',				'MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1'),
            ('MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1',			                    'YieldType',				'YIELD_FOOD'),
            ('MODIFIER_RWB_PILIAKALNIS_FOOD_ADJACENCY_1',			                    'Amount',					'1'),
            
            ('MODIFIER_RWB_PILIAKALNIS_OWN_PRODUCTION_ADJACENCY_1',		                'YieldType',				'YIELD_PRODUCTION'),
            ('MODIFIER_RWB_PILIAKALNIS_OWN_PRODUCTION_ADJACENCY_1',		                'Amount',				    '1'),
            ('MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1_ATTACH',	                'ModifierId',				'MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1'),
            ('MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1',			                'YieldType',				'YIELD_PRODUCTION'),
            ('MODIFIER_RWB_PILIAKALNIS_PRODUCTION_ADJACENCY_1',			                'Amount',					'2'),

            ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_FOOD_ADJACENCY_1',		        'YieldType',				'YIELD_FOOD'),
            ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_FOOD_ADJACENCY_1',		        'Amount',				    '1'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1_ATTACH',		    'ModifierId',				'MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1',			        'YieldType',				'YIELD_FOOD'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_FOOD_ADJACENCY_1',			        'Amount',					'1'),

            ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_PRODUCTION_ADJACENCY_1',		'YieldType',				'YIELD_PRODUCTION'),
            ('MODIFIER_RWB_PILIAKALNIS_OWN_BREATHTAKING_PRODUCTION_ADJACENCY_1',		'Amount',				    '1'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1_ATTACH',	    'ModifierId',				'MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1',			'YieldType',				'YIELD_PRODUCTION'),
            ('MODIFIER_RWB_PILIAKALNIS_BREATHTAKING_PRODUCTION_ADJACENCY_1',			'Amount',					'2');



INSERT INTO RequirementSets
(RequirementSetId,							                                RequirementSetType)
VALUES	('PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET',	'REQUIREMENTSET_TEST_ALL'),
        ('PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET',	            'REQUIREMENTSET_TEST_ALL'),
        ('DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET',	                    'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
(RequirementSetId,								                            RequirementId)
VALUES	('PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET',	            'PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ'),
        ('PLOT_IS_UNIMPROVED_ADJACENT_TO_PILIAKALNIS_REQSET',               'PLOT_HAS_NO_IMPROVEMENT_REQ'),
        ('PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET',   'PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ'),
        ('PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET',   'PLOT_HAS_NO_IMPROVEMENT_REQ'),
        ('PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET',   'PLOT_IS_NOT_COAST_REQ'),
        ('PLOT_IS_UNIMPROVED_HIGH_APPEAL_ADJACENT_TO_PILIAKALNIS_REQSET',   'RWB_REQUIRES_APPEAL_4_OR_MORE_REQ'),
        ('DISTRICT_IS_ADJACENT_TO_PILIAKALNIS_REQSET',                      'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS');

INSERT INTO Requirements
(RequirementId,									                            RequirementType,								        Inverse )
VALUES	('PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ',		                        'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	    '0'	),
        ('RWB_REQUIRES_APPEAL_4_OR_MORE_REQ',	                            'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                   '0'),
        ('PLOT_IS_NOT_COAST_REQ',	                                        'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',                '0'),
        ('PLOT_HAS_NO_IMPROVEMENT_REQ',	                                    'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',                 '1');

INSERT INTO RequirementArguments
(RequirementId,									                            Name,					Value)
VALUES	  ('PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ',				            'DistrictType',			'DISTRICT_RWB_PILIAKALNIS'),
          ('RWB_REQUIRES_APPEAL_4_OR_MORE_REQ',		                        'MinimumAppeal',        '4'),
          ('PLOT_IS_NOT_COAST_REQ',				                            'TerrainType',			'TERRAIN_COAST'),
          ('PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ',				            'MinRange',				'1'),
          ('PLOT_IS_ADJACENT_TO_PILIAKALNIS_REQ',				            'MaxRange',				'1');


/*INSERT OR REPLACE INTO Types
(Type, Kind) 
SELECT 'RWB_DUMMY_PROXIMITYBUILDING_'||Size,'KIND_BUILDING'
FROM Rwb_DistrictAmountReference_UI;


INSERT OR REPLACE INTO Buildings
(BuildingType, Name, Description, PrereqDistrict, ObsoleteEra, Cost)
SELECT 'RWB_DUMMY_PROXIMITYBUILDING_'||Size,'LOC_DISTRICT_RWB_DUMMY_PROXIMITYBUILDING_NAME'||Size,'LOC_DISTRICT_RWB_DUMMY_PROXIMITYBUILDING_DESCRIPTION'||Size,'DISTRICT_RWB_PILIAKALNIS', 'ERA_ANCIENT','1'
FROM Rwb_DistrictAmountReference_UI;


INSERT OR REPLACE INTO Rwb_DummyBuildingList
(BuildingType, YieldType1, YieldType2, YieldAmount1, YieldAmount2, RequiredAppeal)

SELECT 'RWB_DUMMY_PROXIMITYBUILDING_'||Size,'YIELD_FOOD','YIELD_PRODUCTION',Size,Size*2,Size
FROM Rwb_DistrictAmountReference_UI;*/
/*INSERT OR REPLACE INTO Adjacent_AppealYieldChanges
(DistrictType,
 YieldType,
 MaximumValue,
 BuildingType,
 MinimumValue,
 YieldChange,
 Description,
 Unimproved)

SELECT 'DISTRICT_RWB_PILIAKALNIS', 
       'YIELD_FOOD',              
       '100',        
       BuildingType,        
       MinimumValue,        
       YieldChange,        
       Description,        
       Unimproved
FROM ;*/



-----------------------------------------------	
-- District_TradeRouteYields
-----------------------------------------------	

INSERT OR REPLACE INTO District_TradeRouteYields
            (DistrictType,							
             YieldType,           
             YieldChangeAsOrigin,        
             YieldChangeAsDomesticDestination,      
             YieldChangeAsInternationalDestination)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',							
            YieldType,           
            YieldChangeAsOrigin,        
            YieldChangeAsDomesticDestination,      
            YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- Adjacency_YieldChanges
-----------------------------------------------	

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	

-----------------------------------------------	
-- TraitModifiers cuz sometimes, fuck.
-----------------------------------------------	

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

--Appeal Yields
INSERT OR REPLACE INTO Modifiers
(ModifierId,						ModifierType,                                           		  SubjectRequirementSetId                )
SELECT    'RWB_PILIAKALNIS_ADJ_FAITH_YIELD_'||Size,	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS_'||Size
FROM Rwb_AppealReference_UI UNION
SELECT    'RWB_PILIAKALNIS_OWN_FAITH_YIELD_'||Size,	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS_'||Size
FROM Rwb_AppealReference_UI
                         ;

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											    ModifierId								)
SELECT    'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD_'||Size	
FROM Rwb_AppealReference_UI;

-----------------------------------------------	   
-- DistrictModifiers
-----------------------------------------------	

INSERT OR REPLACE INTO DistrictModifiers
                (DistrictType,						ModifierId)
SELECT          'DISTRICT_RWB_PILIAKALNIS',              'RWB_PILIAKALNIS_OWN_FAITH_YIELD_'||Size
FROM Rwb_AppealReference_UI
                ;


-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	

INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,					            Name,                           Value)
SELECT    'RWB_PILIAKALNIS_ADJ_FAITH_YIELD_'||Size,	'YieldType',           'YIELD_FAITH'
FROM Rwb_AppealReference_UI UNION
SELECT    'RWB_PILIAKALNIS_ADJ_FAITH_YIELD_'||Size,	'Amount',              '1'
FROM Rwb_AppealReference_UI UNION
SELECT    'RWB_PILIAKALNIS_OWN_FAITH_YIELD_'||Size,	'YieldType',           'YIELD_FAITH'
FROM Rwb_AppealReference_UI UNION
SELECT    'RWB_PILIAKALNIS_OWN_FAITH_YIELD_'||Size,	'Amount',              '1'
FROM Rwb_AppealReference_UI
;


-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	

INSERT OR REPLACE INTO RequirementSets
            (RequirementSetId,                                      RequirementSetType)

SELECT          'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS_'||Size,              'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference_UI UNION
SELECT          'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS_'||Size,                   'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference_UI
			;

-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	

INSERT OR REPLACE INTO RequirementSetRequirements
                (RequirementSetId,								                        RequirementId)

SELECT    'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS_'||Size,	                         'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS'
FROM Rwb_AppealReference_UI UNION
SELECT    'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS_'||Size,	                         'RWB_REQUIRES_APPEAL_'||Size||'_OR_MORE'
FROM Rwb_AppealReference_UI UNION
SELECT    'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS_'||Size,	                         'RWB_REQUIRES_IS_NOT_PILIAKALNIS'
FROM Rwb_AppealReference_UI UNION
SELECT    'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS_'||Size,	                             'RWB_REQUIRES_APPEAL_'||Size||'_OR_MORE'
FROM Rwb_AppealReference_UI UNION 
SELECT    'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS_'||Size,	                             'RWB_REQUIRES_IS_PILIAKALNIS'
FROM Rwb_AppealReference_UI
;
-----------------------------------------------	
-- Requirements
-----------------------------------------------	

INSERT OR REPLACE INTO Requirements
                (RequirementId,								            RequirementType,                                       Inverse)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',     '0'),
                ('RWB_REQUIRES_IS_PILIAKALNIS',		                    'REQUIREMENT_DISTRICT_TYPE_MATCHES',                   '0'),
                ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',		                'REQUIREMENT_DISTRICT_TYPE_MATCHES',                   '1');

INSERT OR REPLACE INTO Requirements
(RequirementId,								                RequirementType,                                       Inverse)
SELECT    'RWB_REQUIRES_APPEAL_'||Size||'_OR_MORE',	        'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',              '0'
FROM Rwb_AppealReference_UI;

-----------------------------------------------	
-- RequirementArguments
-----------------------------------------------	

INSERT OR REPLACE INTO RequirementArguments
                (RequirementId,								             Name,                      Value)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
				('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MinRange',                 '1'),
				('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MaxRange',                 '1'),
				('RWB_REQUIRES_IS_PILIAKALNIS',                         'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
				('RWB_REQUIRES_IS_NOT_PILIAKALNIS',                     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
				('RWB_REQUIRES_APPEAL_1_OR_MORE',		                'MinimumAppeal',            '1'),
                ('RWB_REQUIRES_APPEAL_3_OR_MORE',		                'MinimumAppeal',            '3'),
                ('RWB_REQUIRES_APPEAL_5_OR_MORE',		                'MinimumAppeal',            '5'),
                ('RWB_REQUIRES_APPEAL_7_OR_MORE',		                'MinimumAppeal',            '7'),
                ('RWB_REQUIRES_APPEAL_9_OR_MORE',		                'MinimumAppeal',            '9')
                ;

INSERT OR REPLACE INTO RequirementArguments
(RequirementId,								                Name,                                       Value)
SELECT    'RWB_REQUIRES_APPEAL_'||Size||'_OR_MORE',	        'MinimumAppeal',							Size
FROM Rwb_AppealReference_UI;

DROP TABLE Rwb_AppealReference_UI;
-----------------------------------------------	
-- For CivAbility of placable on features
-----------------------------------------------	

INSERT OR REPLACE INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER')
;


INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											                    ModifierId								)
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_RWB_PILIAKALNIS'
FROM Features a WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF'
;


INSERT OR REPLACE INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS')
;


INSERT OR REPLACE INTO Modifiers
(ModifierId,												               ModifierType,                                                            Permanent)
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_RWB_PILIAKALNIS',	'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0
FROM Features a WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF'
;


INSERT OR REPLACE INTO ModifierArguments
(ModifierId,												            Name,				Value)
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_RWB_PILIAKALNIS',					'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'
FROM Features a WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_RWB_PILIAKALNIS',					'FeatureType',		a.FeatureType
FROM Features a WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' 
;


-----------------------------------------------	
-- Strength Aura for Combat & Religious units in a 4-tile range from the UD.
-----------------------------------------------	

INSERT OR REPLACE INTO Modifiers
(ModifierId,                                                            ModifierType,                               SubjectRequirementSetId)
VALUES      ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER',         'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',      'REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS'),
            ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER',      'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',      'REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                            Name,                   Value)
VALUES      ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER',    'AbilityType',          'ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH'),
            ('TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER', 'AbilityType',          'ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH');

INSERT OR REPLACE INTO TraitModifiers
(TraitType, ModifierId)
VALUES      ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS', 'TRAIT_CIVILIZATION_RWB_PILIAKALNIS_COMBAT_STRENGTH_GIVE_MODIFIER') ,
            ('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS', 'TRAIT_CIVILIZATION_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_GIVE_MODIFIER') ;

INSERT OR REPLACE INTO Types
(Type, Kind)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',       'KIND_ABILITY'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',    'KIND_ABILITY');

INSERT OR REPLACE INTO TypeTags
(Type, Tag)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',       'CLASS_ALL_COMBAT_UNITS'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',    'CLASS_RELIGIOUS_ALL');

INSERT OR REPLACE INTO UnitAbilities
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

INSERT OR REPLACE INTO Modifiers
(ModifierId,                                                        ModifierType)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                Name,                   Value)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',       'Amount',               '3'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',    'Amount',               '3');

INSERT OR REPLACE INTO UnitAbilityModifiers
(UnitAbilityType,                                                   ModifierId)
VALUES      ('ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH',            'RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH'),
            ('ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH',         'RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH');

INSERT OR REPLACE INTO ModifierStrings
(ModifierId,                                       Context,           Text)
VALUES      ('RWB_MODIFIER_PILIAKALNIS_COMBAT_STRENGTH',       'Preview',          'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_BONUS_DESCRIPTION'),
            ('RWB_MODIFIER_PILIAKALNIS_RELIGIOUS_STRENGTH',    'Preview',          'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_BONUS_DESCRIPTION');

INSERT OR REPLACE INTO RequirementSets
(RequirementSetId,                                                   RequirementSetType)
VALUES      ('REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',          'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,                                             RequirementId)
VALUES      ('REQSET_RWB_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',    'RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS');

INSERT OR REPLACE INTO Requirements
(RequirementId,                                                         RequirementType)
VALUES      ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',    'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');

INSERT OR REPLACE INTO RequirementArguments
(RequirementId,                                    Name,               Value)
VALUES      ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'DistrictType',     'DISTRICT_RWB_PILIAKALNIS'),
            ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'MinRange',         '0'),
            ('RWB_REQUIRES_PLOT_WITHIN_RANGE_OF_PILIAKALNIS',  'MaxRange',         '4');


-----------------------------------------------	
-- For CivAbility of placable on features
-----------------------------------------------	

INSERT OR REPLACE INTO District_BuildChargeProductions
(DistrictType,                                          UnitType,                               PercentProductionPerCharge)
VALUES      ('DISTRICT_RWB_PILIAKALNIS',                  'UNIT_RWB_LANDOWNER',                 100);
-----------------------------------------------	
-- Great Work Slots
-----------------------------------------------	

/*INSERT OR REPLACE INTO Types
(Type,      Kind) 
VALUES  ('MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS','KIND_MODIFIER');

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											ModifierId								)
VALUES	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS');

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType)
VALUES ('MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS','MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS');

INSERT OR REPLACE INTO ModifierArguments
        (ModifierId,                                                    Name,               Value)
VALUES  ('MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS',        'BuildingType',     'BUILDING_GROVE'),
        ('MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS',        'GreatWorkSlotType','GREATWORKSLOT_PALACE'),
        ('MODIFIER_RWB_PILIAKALNIS_GROVE_GREAT_WORK_SLOTS',        'Amount',           '2');*/
