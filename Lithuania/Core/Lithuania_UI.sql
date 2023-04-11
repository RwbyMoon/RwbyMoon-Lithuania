-----------------------------------------------
-- PILIAKALNIS YIELDS
-----------------------------------------------

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD1'	),
          ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD3'	),
          ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD5'	),
          ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD7'	);

-----------------------------------------------	
-- Types
-----------------------------------------------	


INSERT OR REPLACE INTO Types
            (Type,								            Kind)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		            'KIND_DISTRICT'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD1',		'KIND_MODIFIER'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD3',		'KIND_MODIFIER'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD5',		'KIND_MODIFIER'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD7',		'KIND_MODIFIER');

-----------------------------------------------	
-- Districts
-----------------------------------------------	

INSERT OR REPLACE INTO Districts
(
    DistrictType,
    Name,
    Description,

    TraitType,
    PrereqTech,
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

    Aqueduct,
    NoAdjacentCity,
    InternalOnly,
    ZOC,
    MilitaryDomain
)
SELECT
    'DISTRICT_RWB_PILIAKALNIS', -- DistrictType
    'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
    'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description

    'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS', -- TraitType
    PrereqTech, -- PrereqTech
    PrereqCivic, -- PrereqCivic

    Cost/'2', -- Cost
    'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', -- CostProgressionModel
    '40', -- CostProgressionParam1
    Maintenance, -- Maintenance

    HitPoints, -- HitPoints

    '1', -- Appeal
    CityStrengthModifier, -- CityStrengthModifier

    PlunderType, -- PlunderType
    PlunderAmount, -- PlunderAmount
    CaptureRemovesDistrict, -- CaptureRemovesDistrict
    CaptureRemovesBuildings, -- CaptureRemovesBuildings
    CaptureRemovesCityDefenses, -- CaptureRemovesCityDefenses

    AdvisorType, -- AdvisorType

    RequiresPlacement, -- RequiresPlacement
    RequiresPopulation, -- RequiresPopulation

    Aqueduct, -- Aqueduct
    NoAdjacentCity, -- NoAdjacentCity
    InternalOnly, -- InternalOnly
    ZOC, -- ZOC
    MilitaryDomain -- MilitaryDomain
FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- DistrictReplaces
-----------------------------------------------	

INSERT OR REPLACE INTO DistrictReplaces
			(CivUniqueDistrictType,								ReplacesDistrictType)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		                'DISTRICT_PRESERVE');

-- Preserve Buildings require the replacement to be added in Adjacent_AppealYieldChanges for their tile bonuses to work

INSERT OR REPLACE INTO Adjacent_AppealYieldChanges
			(DistrictType, 
			 YieldType, 
			 MaximumValue, 
			 BuildingType, 
			 MinimumValue, 
			 YieldChange, 
			 Description, 
			 Unimproved)

SELECT	    'DISTRICT_RWB_PILIAKALNIS', 
             YieldType, 
             MaximumValue, 
             BuildingType, 
             MinimumValue, 
             YieldChange, 
             Description, 
             Unimproved
FROM Adjacent_AppealYieldChanges WHERE DistrictType = 'DISTRICT_PRESERVE';



-----------------------------------------------	
-- District_Adjacencies
-----------------------------------------------	

INSERT OR REPLACE INTO District_Adjacencies
            (DistrictType,
            YieldChangeId)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',
            YieldChangeId
FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- District_GreatPersonPoints
-----------------------------------------------	

INSERT OR REPLACE INTO District_GreatPersonPoints
            (DistrictType,
            GreatPersonClassType,
            PointsPerTurn)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',
              GreatPersonClassType,
              PointsPerTurn
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_PRESERVE';

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
VALUES	    ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD7',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS7'),

            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD1',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD3',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD5',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD7',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS7')
            ;



-----------------------------------------------	   
-- DistrictModifiers
-----------------------------------------------	

INSERT OR REPLACE INTO DistrictModifiers
                (DistrictType,						ModifierId)
VALUES          ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD1'),
                ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD3'),
                ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD5'),
                ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD7')
                ;


-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	

INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,					            Name,                           Value)
VALUES	    ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD7',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD7',	        'Amount',                       '1'),

			('RWB_PILIAKALNIS_OWN_FAITH_YIELD1',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD1',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD3',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD3',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD5',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD5',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD7',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD7',	        'Amount',                       '1')
            ;

-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	

INSERT OR REPLACE INTO RequirementSets
            (RequirementSetId,                                      RequirementSetType)
VALUES	    ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS7',        'REQUIREMENTSET_TEST_ALL'),

            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1',           'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3',           'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5',           'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS7',           'REQUIREMENTSET_TEST_ALL')
			;

-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	

INSERT OR REPLACE INTO RequirementSetRequirements
                (RequirementSetId,								                        RequirementId)
VALUES	        ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',		                'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',		                'RWB_REQUIRES_APPEAL_1_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',		                'RWB_REQUIRES_IS_NOT_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1',		                    'RWB_REQUIRES_APPEAL_1_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1',		                    'RWB_REQUIRES_IS_PILIAKALNIS'),

                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',		                'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',		                'RWB_REQUIRES_APPEAL_3_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',		                'RWB_REQUIRES_IS_NOT_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3',		                    'RWB_REQUIRES_APPEAL_3_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3',		                    'RWB_REQUIRES_IS_PILIAKALNIS'),
                
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',		                'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',		                'RWB_REQUIRES_APPEAL_5_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',		                'RWB_REQUIRES_IS_NOT_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5',		                    'RWB_REQUIRES_APPEAL_5_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5',		                    'RWB_REQUIRES_IS_PILIAKALNIS'),

                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS7',		                'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS7',		                'RWB_REQUIRES_APPEAL_7_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS7',		                'RWB_REQUIRES_IS_NOT_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS7',		                    'RWB_REQUIRES_APPEAL_7_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS7',		                    'RWB_REQUIRES_IS_PILIAKALNIS')
                ;
	
-----------------------------------------------	
-- Requirements
-----------------------------------------------	

INSERT OR REPLACE INTO Requirements
                (RequirementId,								            RequirementType,                                       Inverse)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',     '0'),
                ('RWB_REQUIRES_IS_PILIAKALNIS',		                    'REQUIREMENT_DISTRICT_TYPE_MATCHES',                   '0'),
                ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',		                'REQUIREMENT_DISTRICT_TYPE_MATCHES',                   '1'),
                ('RWB_REQUIRES_APPEAL_1_OR_MORE',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                  '0'),
                ('RWB_REQUIRES_APPEAL_3_OR_MORE',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                  '0'),
                ('RWB_REQUIRES_APPEAL_5_OR_MORE',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                  '0'),
                ('RWB_REQUIRES_APPEAL_7_OR_MORE',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                  '0')
                ;

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
                ('RWB_REQUIRES_APPEAL_7_OR_MORE',		                'MinimumAppeal',            '7')
                ;

-----------------------------------------------	
-- For CivAbility of placable on features
-----------------------------------------------	

INSERT OR REPLACE INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER');

INSERT OR REPLACE INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											ModifierId								)
VALUES	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS'				),
           ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS'			),
           ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS'				),
           ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS'			),
           ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS'),
           ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS'	);

INSERT OR REPLACE INTO Modifiers
(ModifierId,												                            ModifierType)
VALUES	   ('RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS',		                'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
             ('RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS',		            'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
             ('RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS',		                'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
             ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS',		        'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
             ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
             ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,												                    Name,				        Value)
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS',					'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'			UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS',					'FeatureType',		'FEATURE_FOREST'					FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS',					'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'		UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS',					'FeatureType',		'FEATURE_JUNGLE'				FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS',					'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'		    UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS',					'FeatureType',		'FEATURE_MARSH'					    FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS',			'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'			UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS',			'FeatureType',		'FEATURE_FLOODPLAINS'				FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS',	'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'		    UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS',	'FeatureType',		'FEATURE_FLOODPLAINS_GRASSLAND'	    FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS',		'DistrictType',		'DISTRICT_RWB_PILIAKALNIS'		UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS',		'FeatureType',		'FEATURE_FLOODPLAINS_PLAINS'	FROM Districts WHERE RequiresPlacement = 1;


-----------------------------------------------	
-- Strength Aura
-----------------------------------------------	

--- TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS

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
