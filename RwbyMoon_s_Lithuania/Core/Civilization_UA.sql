/*
	Civilization Unique Ability
	Authors: RwbyMoon
*/

-----------------------------------------------
-- Types

-- The game code cites the Civilization Ability as a 'Trait', hence we're using that term here (and throughout this section). 

-- This inserts the Unique Ability reference into the primary Data Types table as a recognised trait. This is mandatory, if configuring a custom trait for your civilization. The string listed under 'Type' must be used throughout the mod when referring to the TraitType.

-- The standard naming convention follows: TRAIT_CIVILIZATION_PREFIX_TRAITNAME

-- As with everywhere else, we're using our PREFIX to try and keep things unique. This also helps us differentiate the things we are creating and the things we are borrowing from the game.

-- Configuring a Unique Ability for your custom civilization is entirely optional, but it is typically considered appropriate for balance to configure one, such that your custom civilization matches those from the base games in terms of complexity, both for flavour and gameplay balance.
-----------------------------------------------
-- Traits

-- With the TraitType defined (above), the below then inserts it into the overall Traits table. This allows it to exist in its own right, alongside other TraitType elements and ties it to the locally-referenced Name and Description text strings that name and describe the trait, respectively.
-----------------------------------------------
-- CivilizationTraits

-- This defines the civilization to which the TraitType is applied (i.e. which civilization gets the Unique Ability). This is a simple matter of referencing the custom CivilizationType defined in Civilization_Config.sql and using the TraitType defined at the head of this document.
-----------------------------------------------

INSERT OR IGNORE INTO Types
		(Type,												Kind			)
VALUES	('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		        'KIND_TRAIT'	);

-----------------------------------------------

INSERT OR IGNORE INTO Traits	
		(TraitType,											Name,														Description														)
VALUES	('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		        'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME',		        'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION'	);
		
-----------------------------------------------

INSERT OR IGNORE INTO CivilizationTraits
		(CivilizationType,				    TraitType										)
VALUES	('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI'	);


-----------------------------------------------
-- Districts (excluding City-Centers) can be placed on any passable non-Wonder terrain Feature without destroying them.
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER');

INSERT OR IGNORE INTO TraitModifiers
(TraitType,											                    ModifierId								)

SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0
;

INSERT OR IGNORE INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT OR IGNORE INTO Modifiers
(ModifierId,												               ModifierType,                                                            Permanent)

SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,	'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0
;

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,												            Name,				Value)
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,					'DistrictType',		b.DistrictType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0 UNION

SELECT	'RWB_DIEVDIRBIAI_ALLOW_'||a.FeatureType||'_'||b.DistrictType,					'FeatureType',		a.FeatureType
FROM Features a, Districts b WHERE a.Quote IS null AND a.FeatureType IS NOT 'FEATURE_REEF' AND b.RequiresPlacement = 1 AND b.Coast = 0
;

-----------------------------------------------
-- -50%[ICON_Faith]Faith per turn. 
-- You gain bursts of Faith (scaling with era) when finishing Districts on Breathtaking tiles, doubled if built onto Floodplains or Marshes.
-----------------------------------------------

--- Preparation of tables to ease next things

CREATE TABLE IF NOT EXISTS Rwb_FaithReference_UA
(
    EraType TEXT,
    BurstValue INT
);

CREATE TABLE IF NOT EXISTS TempFaithTable
(
    BurstValue INT
);

WITH RECURSIVE t(val) AS (SELECT 13 UNION ALL SELECT val + 3 + val/12 FROM t LIMIT (SELECT COUNT(*) FROM Eras))
INSERT OR IGNORE INTO TempFaithTable (BurstValue) SELECT val FROM t;

INSERT OR IGNORE INTO Rwb_FaithReference_UA
(EraType,BurstValue)
SELECT
    e.EraType,
    f.BurstValue
FROM TempFaithTable f, Eras e
WHERE f.rowid = e.rowid;

DROP TABLE TempFaithTable;


--

CREATE TABLE IF NOT EXISTS Rwb_FaithBurstFeatures_UA
(
    FeatureType TEXT,
    BurstValue INT
);

INSERT OR IGNORE INTO Rwb_FaithBurstFeatures_UA
(FeatureType,       BurstValue)
VALUES ('FEATURE_MARSH',    2) UNION
SELECT	    Features.FeatureType,1 FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%';



------------------------


INSERT OR IGNORE INTO Types
            (Type,                                        Kind)
VALUES      ('MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'KIND_MODIFIER');

INSERT OR IGNORE INTO DynamicModifiers
(ModifierType,                                  CollectionType,                 EffectType)
VALUES      ('MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'COLLECTION_PLAYER_DISTRICTS',  'EFFECT_ATTACH_MODIFIER');

--

INSERT OR IGNORE INTO	TraitModifiers
            (TraitType,									    ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',   'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||EraType FROM Rwb_FaithReference_UA UNION
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',   'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||a.EraType||'_IF_'||b.FeatureType FROM Rwb_FaithReference_UA a, Rwb_FaithBurstFeatures_UA b UNION
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',   'RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS');



INSERT OR IGNORE INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId,
             OwnerRequirementSetId,
             RunOnce,
             NewOnly)

SELECT      'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||EraType,
            'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',
            'REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL',
            'REQSET_RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,
            0,
            0
FROM Rwb_FaithReference_UA UNION

SELECT      'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||a.EraType||'_IF_'||b.FeatureType,
            'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',
            'REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL_AND_'||FeatureType,
            'REQSET_RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,
            0,
            0
FROM Rwb_FaithReference_UA a, Rwb_FaithBurstFeatures_UA b UNION

SELECT      'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||EraType,
            'MODIFIER_PLAYER_GRANT_YIELD',
            null,
            null,
            1,
            0
FROM Rwb_FaithReference_UA UNION


VALUES     ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',
            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
            null,
            null,
            0,
            0);



INSERT OR IGNORE INTO ModifierArguments
            (ModifierId,                                                                                        Name,                Value)
SELECT      'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||EraType,                              'ModifierId',  'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||EraType FROM Rwb_FaithReference_UA UNION
SELECT      'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_'||a.EraType||'_IF_'||b.FeatureType,     'ModifierId',  'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||a.EraType FROM Rwb_FaithReference_UA a, Rwb_FaithBurstFeatures_UA b UNION

SELECT      'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||EraType,                                                'Amount',       BurstValue FROM Rwb_FaithReference_UA UNION
SELECT      'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||EraType,                                                'Scale',       '1' FROM Rwb_FaithReference_UA UNION
SELECT      'RWB_DIEVDIRBIAI_FAITH_BURSTS_'||EraType,                                                'YieldType',   'YIELD_FAITH' FROM Rwb_FaithReference_UA UNION

VALUES      ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                                                          'YieldType',         'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                                                          'Amount',            '-50');


INSERT OR IGNORE INTO RequirementSets
            (RequirementSetId,                                                                       RequirementSetType)
SELECT      'REQSET_RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,                            'REQUIREMENTSET_TEST_ALL' FROM Rwb_FaithReference_UA UNION
SELECT      'REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL_AND_'||FeatureType,       'REQUIREMENTSET_TEST_ALL' FROM Rwb_FaithBurstFeatures_UA UNION
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL',                                        'REQUIREMENTSET_TEST_ALL');


INSERT OR IGNORE INTO RequirementSetRequirements
            (RequirementSetId,                                                                     RequirementId)
SELECT      'REQSET_RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,                          'RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType      FROM Rwb_FaithReference_UA UNION
SELECT      'REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL_AND_'||FeatureType,     'RWB_DIEVDIRBIAI_PLACED_ON_'||Rwb_FaithBurstFeatures_UA.FeatureType      FROM Rwb_FaithBurstFeatures_UA UNION
SELECT      'REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL_AND_'||FeatureType,     'RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4'      FROM Rwb_FaithBurstFeatures_UA UNION
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_APPROPRIATE_APPEAL',                                      'RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4');


INSERT OR IGNORE INTO Requirements
            (RequirementId,                                                                              RequirementType)
SELECT      'RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,           'REQUIREMENT_PLAYER_ERA_AT_LEAST'        FROM Rwb_FaithReference_UA UNION
SELECT      'RWB_DIEVDIRBIAI_PLACED_ON_'||FeatureType,       'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'  FROM Rwb_FaithBurstFeatures_UA UNION
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                          'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');


INSERT OR IGNORE INTO RequirementArguments
            (RequirementId,                                                 Name,                       Value)
SELECT      'RWB_DIEVDIRBIAI_PLAYER_IN_'||EraType,            'EraType',            EraType FROM Rwb_FaithReference_UA UNION
SELECT      'RWB_DIEVDIRBIAI_PLACED_ON_'||FeatureType,        'FeatureType',        FeatureType FROM Rwb_FaithBurstFeatures_UA UNION
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                           'MinimumAppeal',            '4');

DROP TABLE Rwb_FaithBurstFeatures_UA;
DROP TABLE Rwb_FaithReference_UA;

-----------------------------------------------
-- Owned Floodplains do not alter Appeal on adjacent tiles, and Reefs and Marshes instead generate +1 Appeal.
-----------------------------------------------                            
CREATE TABLE IF NOT EXISTS Rwb_AppealFeatures_StandardRuleset_UA
(
    FeatureType TEXT,
    BurstValue INT
);

INSERT OR IGNORE INTO Rwb_AppealFeatures_StandardRuleset_UA
(FeatureType,       BurstValue)
VALUES ('FEATURE_MARSH',    2) UNION
SELECT	    Features.FeatureType,1 FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%';

-- 

INSERT OR IGNORE INTO Types
            (Type,					                                 Kind)
SELECT	    'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,'KIND_MODIFIER'
FROM Rwb_AppealFeatures_StandardRuleset_UA;

--

INSERT OR IGNORE INTO	TraitModifiers
            (TraitType,									 ModifierId								)
SELECT      'TRAIT_LEADER_RWB_UNION_OF_HORODLO','MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType
FROM Rwb_AppealFeatures_StandardRuleset_UA;


INSERT OR IGNORE INTO Modifiers
            (ModifierId,                                                   ModifierType)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,  'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER'
FROM Rwb_AppealFeatures_StandardRuleset_UA;


INSERT OR IGNORE INTO ModifierArguments
            (ModifierId,                                                   Name,                       Value)
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'FeatureType',        FeatureType      FROM Rwb_AppealFeatures_StandardRuleset_UA     UNION
SELECT      'MODIFIER_RWB_DIEVDIRBIAI_APPEAL_ON_'||FeatureType,   'Amount',             BurstValue       FROM Rwb_AppealFeatures_StandardRuleset_UA;


DROP TABLE Rwb_AppealFeatures_StandardRuleset_UA;