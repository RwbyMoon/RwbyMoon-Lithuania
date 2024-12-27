-----------------------------------------------
-- FEATURES NOT SCRABOUILLED
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER');

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											                    ModifierId								)

SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0 UNION

SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1
;

INSERT OR REPLACE INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT OR REPLACE INTO Modifiers
(ModifierId,												               ModifierType,                                                            Permanent)

SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,	'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0 UNION

SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1 
;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,												            Name,				Value)
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,					'DistrictType',		b.DistrictType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0 UNION
                                                         
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,					'FeatureType',		a.FeatureType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'DistrictType',		DistrictType					
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1 UNION
                                                         
SELECT	'RWB_DIEVDIRBIAI_ALLOW_REEF_'||DistrictType,					'FeatureType',		'FEATURE_REEF'					
FROM Districts WHERE RequiresPlacement = 1 AND Coast = 1
;

-----------------------------------------------
-- -50%[ICON_Faith]Faith per turn. 
-- You gain bursts of Faith (scaling with era) when finishing Districts on Breathtaking tiles, doubled if built onto Floodplains or Marshes.
-----------------------------------------------

--- Preparation of tables to ease next things

CREATE TABLE IF NOT EXISTS Rwb_FaithReference_UA
(
    EraType TEXT,
    Value INT
);

CREATE TABLE IF NOT EXISTS TempFaithTable
(
    Value INT
);

WITH RECURSIVE t(val) AS (SELECT 13 UNION ALL SELECT val + 4 + val/3 FROM t LIMIT (SELECT COUNT(*) FROM Eras))
INSERT OR REPLACE INTO TempFaithTable (Value) SELECT val FROM t;

INSERT OR REPLACE INTO Rwb_FaithReference_UA
(EraType,Value)
SELECT
    e.EraType,
    f.Value
FROM TempFaithTable f, Eras e
WHERE f.rowid = e.rowid;

DROP TABLE TempFaithTable;

------------------------

INSERT OR REPLACE INTO Types
            (Type,                                        Kind) 
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'KIND_MODIFIER');

INSERT OR REPLACE INTO DynamicModifiers
            (ModifierType,                                  CollectionType,                 EffectType) 
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'COLLECTION_PLAYER_DISTRICTS',  'EFFECT_ATTACH_MODIFIER'); 


INSERT OR REPLACE INTO	TraitModifiers
            (TraitType,									    ModifierId								)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER'),

            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS');


			
INSERT OR REPLACE INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId,
             OwnerRequirementSetId,
             RunOnce)

VALUES      ('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER',
             'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',
             null,
             0),
    
    
            ('RWB_DIEVDIRBIAI_FAITH_BURSTS',
             'MODIFIER_PLAYER_GRANT_YIELD',
             null,
             null,
             1),


			 ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
             null,
             null,
             0);


INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                                                Name,                   Value)
VALUES      ('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER',                      'ModifierId',        'RWB_DIEVDIRBIAI_FAITH_BURSTS'),

            ('RWB_DIEVDIRBIAI_FAITH_BURSTS',                             'Amount',            '60'),
            ('RWB_DIEVDIRBIAI_FAITH_BURSTS',                             'Scale',             '1'),
            ('RWB_DIEVDIRBIAI_FAITH_BURSTS',                             'YieldType',         'YIELD_FAITH'),
            
            ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                              'YieldType',         'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                              'Amount',            '-50');


INSERT OR REPLACE INTO RequirementSets
            (RequirementSetId,                                                                          RequirementSetType) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',                                            'REQUIREMENTSET_TEST_ALL');


INSERT OR REPLACE INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',                        'RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4');


INSERT OR REPLACE INTO Requirements
            (RequirementId,                                                         RequirementType,                                         Inverse) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                                   'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                0);


INSERT OR REPLACE INTO RequirementArguments
            (RequirementId,                                                 Name,                       Value) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                           'MinimumAppeal',            '4');

-----------------------------------------------
-- Owned Floodplains do not alter Appeal on adjacent tiles, and Reefs and Marshes instead generate +1 Appeal.
-----------------------------------------------

CREATE TABLE IF NOT EXISTS Rwb_FaithBurstFeatures
(
    FeatureType TEXT,
    BurstValue INT
);

INSERT OR REPLACE INTO Rwb_FaithBurstFeatures
        (FeatureType,       BurstValue)
VALUES ('FEATURE_REEF',     1),('FEATURE_MARSH',    2) UNION
SELECT	    Features.FeatureType,1 FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%';                                           


-- 

INSERT OR REPLACE INTO Types
            (Type,					                                 Kind)
SELECT	    'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,'KIND_MODIFIER'
FROM Rwb_FaithBurstFeatures;

--

INSERT OR REPLACE INTO	TraitModifiers
            (TraitType,									 ModifierId								)
SELECT      'TRAIT_LEADER_RWB_UNION_OF_HORODLO','MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType
FROM Rwb_FaithBurstFeatures;


INSERT OR REPLACE INTO Modifiers
            (ModifierId,                                                   ModifierType)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,  'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER'
FROM Rwb_FaithBurstFeatures;


INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                   Name,                       Value)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'FeatureType',        FeatureType      FROM Rwb_FaithBurstFeatures     UNION
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'Amount',             BurstValue       FROM Rwb_FaithBurstFeatures;


DROP TABLE Rwb_FaithBurstFeatures;

-- MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER