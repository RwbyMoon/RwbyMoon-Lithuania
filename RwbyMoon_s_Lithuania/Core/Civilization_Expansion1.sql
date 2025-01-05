-----------------------------------------------
-- TEXT UPDATES FOR EXPANSIONS
-----------------------------------------------
UPDATE  Traits
SET         Description = 'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION_XP'
WHERE Description = 'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION';

-----------------------------------------------
-- Districts (excluding City-Centers) can be placed on any passable non-Wonder terrain Feature without destroying them.
-----------------------------------------------
INSERT OR IGNORE INTO	TraitModifiers
(TraitType,											                    ModifierId								)

SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1
;




INSERT OR IGNORE INTO Modifiers
(ModifierId,												               ModifierType,                                                            Permanent)

SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1
;




INSERT OR IGNORE INTO ModifierArguments
(ModifierId,												            Name,				Value)
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'DistrictType',		DistrictType
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1 UNION

SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'FeatureType',		'FEATURE_REEF'
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1
;


-----------------------------------------------
-- Owned Floodplains do not alter Appeal on adjacent tiles, and Reefs and Marshes instead generate +1 Appeal.
-----------------------------------------------                            
CREATE TABLE IF NOT EXISTS Rwb_AppealFeatures_Expansion_UA
(
    FeatureType TEXT,
    BurstValue INT
);

INSERT OR IGNORE INTO Rwb_AppealFeatures_Expansion_UA
(FeatureType,       BurstValue)
VALUES ('FEATURE_MARSH',    2) UNION
SELECT	    Features.FeatureType,1 FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%' UNION
SELECT 'FEATURE_REEF',     1;

-- 

INSERT OR IGNORE INTO Types
(Type,					                                 Kind)
SELECT	    'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,'KIND_MODIFIER'
FROM Rwb_AppealFeatures_Expansion_UA;

--

INSERT OR IGNORE INTO	TraitModifiers
(TraitType,									 ModifierId								)
SELECT      'TRAIT_LEADER_RWB_UNION_OF_HORODLO','MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType
FROM Rwb_AppealFeatures_Expansion_UA;


INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                   ModifierType)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,  'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER'
FROM Rwb_AppealFeatures_Expansion_UA;


INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                   Name,                       Value)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'FeatureType',        FeatureType      FROM Rwb_AppealFeatures_Expansion_UA     UNION
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'Amount',             BurstValue       FROM Rwb_AppealFeatures_Expansion_UA;






CREATE TABLE IF NOT EXISTS Rwb_AdjacencyDistrictList_Expansion_UA
(
    DistrictType TEXT,
    YieldType TEXT,
    YieldText TEXT
);

INSERT OR IGNORE INTO Rwb_AdjacencyDistrictList_Expansion_UA
(DistrictType, YieldType, YieldText)
--
SELECT 'DISTRICT_COMMERCIAL_HUB', b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType

FROM Adjacency_YieldChanges b
WHERE b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB') UNION
--
SELECT 'DISTRICT_THEATER', b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType

FROM Adjacency_YieldChanges b
WHERE b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_THEATER');
--


CREATE TABLE IF NOT EXISTS Rwb_AppealReference_Expansion_UA
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 2 FROM t LIMIT 23)
INSERT OR IGNORE INTO Rwb_AppealReference_Expansion_UA (Size) SELECT val FROM t;


CREATE TABLE IF NOT EXISTS Rwb_FaithPurchaseDistricts
(
    DistrictType TEXT
);

INSERT OR IGNORE INTO Rwb_FaithPurchaseDistricts
        (DistrictType)
VALUES  ('DISTRICT_ENCAMPMENT'),
        ('DISTRICT_DIPLOMATIC_QUARTER'),
        ('DISTRICT_GOVERNMENT');

--- Now I can Remove Adjacency for all specialty districts

INSERT OR IGNORE INTO ExcludedAdjacencies
(TraitType, YieldChangeId)
SELECT 'TRAIT_LEADER_RWB_UNION_OF_HORODLO', YieldChangeId
FROM District_Adjacencies WHERE DistrictType IN (SELECT DistrictType FROM Rwb_AdjacencyDistrictList_Expansion_UA);


-- Adjacency from Appeal on Districts MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL
-- 1 modifier = 1 quartier -> je me base sur le yieldchangeid District_something de DistrictAdjacencies

INSERT OR IGNORE  INTO Modifiers
(ModifierId,
 ModifierType,
 SubjectRequirementSetId)
SELECT	            'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,
                      'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',
                      'REQSET_LIMITS_APPEAL_'||a.Size
FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;

--- ModifierArguments, so effects

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                        Name,                            Value)
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldType'      ,b.YieldType              FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'RequiredAppeal' ,a.Size                   FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldChange'    ,'1'                FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'DistrictType'   ,b.DistrictType           FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'Description'    ,b.YieldText              FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType
;


INSERT OR IGNORE INTO RequirementSets
(RequirementSetId, RequirementSetType)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference_Expansion_UA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId, RequirementId)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIRES_EXACTLY_APPEAL_'||a.Size
FROM Rwb_AppealReference_Expansion_UA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO Requirements
(RequirementId, RequirementType)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
FROM Rwb_AppealReference_Expansion_UA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,                          Name,Value)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MinimumValue',a.Size FROM Rwb_AppealReference_Expansion_UA a WHERE a.Size > 0 UNION
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MaximumValue',a.Size FROM Rwb_AppealReference_Expansion_UA a WHERE a.Size > 0;

INSERT OR IGNORE  INTO TraitModifiers
(TraitType,
 ModifierId)
SELECT	            'TRAIT_LEADER_RWB_UNION_OF_HORODLO',
                      'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size
FROM Rwb_AppealReference_Expansion_UA a, Rwb_AdjacencyDistrictList_Expansion_UA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;



-----------------------------------------------	
-- This district and those adjacent to it generate 1 Food, an additional 1 when built on a Floodplain, a Reef or a Marsh, and an additional 1 if the tile is Breathtaking.
-----------------------------------------------	

INSERT OR IGNORE INTO Types
(Type,														                            Kind)
VALUES	    ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'KIND_MODIFIER'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'KIND_MODIFIER') UNION
SELECT      'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,		'KIND_MODIFIER' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT    	'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'KIND_MODIFIER' FROM Rwb_AppealFeatures_Expansion_UA;
;

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                                            ModifierType,                                                   SubjectRequirementSetId)
VALUES	    ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT',		                        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT',		                                            'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',                 null),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT',		                'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                'REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS'),
              ('MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING',		                                    'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',                 'REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING') UNION
SELECT      'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT    	'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_CHANGE',     'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType FROM Rwb_AppealFeatures_Expansion_UA;

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
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'YieldType',                'YIELD_FOOD' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType,	'Amount',                   '1' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'YieldType',                'YIELD_FOOD' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT     'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType,		                    'Amount',                   '1' FROM Rwb_AppealFeatures_Expansion_UA;

--

INSERT OR IGNORE INTO DistrictModifiers
(DistrictType,                                                  ModifierId)
VALUES      ('DISTRICT_RWB_PILIAKALNIS',                                    'MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT'),
            ('DISTRICT_RWB_PILIAKALNIS',                                    'MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING') UNION
SELECT      'DISTRICT_RWB_PILIAKALNIS',                         'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_'||FeatureType  FROM Rwb_AppealFeatures_Expansion_UA;

INSERT OR IGNORE INTO TraitModifiers
(TraitType,                                                     ModifierId)
VALUES      ('TRAIT_DISTRICT_RWB_PILIAKALNIS',                 'MODIFIER_RWB_PILIAKALNIS_FOOD_FLAT_ON_ADJACENT_DISTRICT'),
            ('TRAIT_DISTRICT_RWB_PILIAKALNIS',                 'MODIFIER_RWB_PILIAKALNIS_FOOD_BREATHTAKING_ON_ADJACENT_DISTRICT') UNION
SELECT      'TRAIT_DISTRICT_RWB_PILIAKALNIS',        'MODIFIER_RWB_PILIAKALNIS_FOOD_FEATURE_ON_ADJACENT_DISTRICT_'||FeatureType  FROM Rwb_AppealFeatures_Expansion_UA;

--

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,                                                                  RequirementSetType)
VALUES          ('REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS',                                  'REQUIREMENTSET_TEST_ALL'),
                ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'REQUIREMENTSET_TEST_ALL'),
                ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING',                                          'REQUIREMENTSET_TEST_ALL') UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'REQUIREMENTSET_TEST_ALL' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType,                           'REQUIREMENTSET_TEST_ALL' FROM Rwb_AppealFeatures_Expansion_UA;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                                                                  RequirementId)
VALUES          ('REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS',                                  'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS') UNION

VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS') UNION
VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_IS_NOT_PILIAKALNIS') UNION
VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING_ADJACENT_TO_PILIAKALNIS',                  'RWB_REQUIRES_IS_ON_BREATHTAKING') UNION

VALUES          ('REQSET_RWB_PILIAKALNIS_ON_BREATHTAKING',                                          'RWB_REQUIRES_IS_ON_BREATHTAKING') UNION

SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_IS_NOT_PILIAKALNIS' FROM Rwb_AppealFeatures_Expansion_UA UNION
SELECT          'REQSET_RWB_PILIAKALNIS_ADJACENT_TO_PILIAKALNIS_ON_'||FeatureType,   'RWB_REQUIRES_IS_ON_'||FeatureType FROM Rwb_AppealFeatures_Expansion_UA UNION

SELECT          'REQSET_RWB_PILIAKALNIS_ON_'||FeatureType,                           'RWB_REQUIRES_IS_ON_'||FeatureType FROM Rwb_AppealFeatures_Expansion_UA;

INSERT OR IGNORE INTO Requirements
(RequirementId,								            RequirementType,                                                Inverse)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',              '0'),
                  ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',		                'REQUIREMENT_DISTRICT_TYPE_MATCHES',                            '1'),
                  ('RWB_REQUIRES_IS_ON_BREATHTAKING',		                'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                           '0') UNION
SELECT          'RWB_REQUIRES_IS_ON_'||FeatureType,		'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',        '0' FROM Rwb_AppealFeatures_Expansion_UA;



INSERT OR IGNORE INTO RequirementArguments
(RequirementId,								             Name,                      Value)
VALUES	        ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
                  ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MinRange',                 '1'),
                  ('RWB_REQUIRES_PLOT_WITHIN_1_RANGE_OF_PILIAKALNIS',     'MaxRange',                 '1'),
                  ('RWB_REQUIRES_IS_NOT_PILIAKALNIS',                     'DistrictType',             'DISTRICT_RWB_PILIAKALNIS'),
                  ('RWB_REQUIRES_IS_ON_BREATHTAKING',                     'MinimumAppeal',            '4') UNION
SELECT          'RWB_REQUIRES_IS_ON_'||FeatureType,        'FeatureType',       FeatureType FROM Rwb_AppealFeatures_Expansion_UA
;




DROP TABLE Rwb_AppealReference_Expansion_UA;
DROP TABLE Rwb_AdjacencyDistrictList_Expansion_UA;
DROP TABLE Rwb_AppealFeatures_Expansion_UA;