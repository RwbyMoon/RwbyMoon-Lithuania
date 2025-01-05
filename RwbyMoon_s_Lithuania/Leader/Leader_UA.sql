/*
	Leader Unique Ability
	Authors: RwbyMoon
*/

-----------------------------------------------
-- Types

-- This inserts the Unique Ability reference into the primary Data Types table as a recognised trait. This is mandatory, if configuring a custom trait for your leader. The string listed under 'Type' must be used throughout the mod when referring to the TraitType.

-- The standard naming convention follows: TRAIT_LEADER_PREFIX_TRAITNAME

-- Configuring a Unique Ability for your custom leader is entirely optional, but it is typically considered appropriate for balance to configure one, such that your custom leader matches those from the base games in terms of complexity, both for flavour and gameplay balance.

-- In this example, we also define a new ability, which this particular Unique Ability will leverage. You'll note this is denoted under KIND_ABILITY, which ensures the game is acknowledging this item in the right way.
-----------------------------------------------
-- Traits

-- With the TraitType defined (above), the below then inserts it into the overall Traits table. This allows it to exist in its own right, alongside other TraitType elements and ties it to the locally-referenced Name and Description text strings that name and describe the trait, respectively.
-----------------------------------------------
-- LeaderTraits

-- This defines the leader to which the TraitType is applied (i.e. which leader gets the Unique Ability). This is a simple matter of referencing the custom LeaderType defined in Leader_Config.sql and using the TraitType defined at the head of this document.
-----------------------------------------------

INSERT OR IGNORE INTO Types
		(Type,												Kind			)
VALUES	('TRAIT_LEADER_RWB_UNION_OF_HORODLO',			'KIND_TRAIT'	);


INSERT OR IGNORE INTO Traits
		(TraitType,									Name,												Description												)
VALUES	('TRAIT_LEADER_RWB_UNION_OF_HORODLO',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME',	'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION'	);

INSERT OR IGNORE INTO LeaderTraits
		(LeaderType,			TraitType								)
VALUES	('LEADER_RWB_VYTAUTAS',	'TRAIT_LEADER_RWB_UNION_OF_HORODLO'	);

-----------------------------------------------
-- Modifiers

-- In this section, we apply the Ability we defined earlier via the use of another Modifier. In this case, our ModifierId is defined and it is defined with the ModifierType that allows us to grant an ability. We set it as Permanent, as we want this application of the Ability to happen once (at the very start of the game when our custom leader is in-play).
-----------------------------------------------
-----------------------------------------------
-- NO ADJACENCY + ADJACENCY FROM APPEAL
-----------------------------------------------

--- Preparation of tables to ease next things

CREATE TABLE IF NOT EXISTS Rwb_AdjacencyDistrictList_StandardRuleset_ULA
(
    DistrictType TEXT,
    YieldType TEXT,
    YieldText TEXT
);

INSERT OR IGNORE INTO Rwb_AdjacencyDistrictList_StandardRuleset_ULA
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


CREATE TABLE IF NOT EXISTS Rwb_AppealReference_StandardRuleset_ULA
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 2 FROM t LIMIT 23)
INSERT OR IGNORE INTO Rwb_AppealReference_StandardRuleset_ULA (Size) SELECT val FROM t;


CREATE TABLE IF NOT EXISTS Rwb_FaithPurchaseDistricts
(
    DistrictType TEXT
);

INSERT OR IGNORE INTO Rwb_FaithPurchaseDistricts
(DistrictType)
VALUES ('DISTRICT_ENCAMPMENT');

--- Now I can Remove Adjacency for all specialty districts

INSERT OR IGNORE INTO ExcludedAdjacencies
(TraitType, YieldChangeId)
SELECT 'TRAIT_LEADER_RWB_UNION_OF_HORODLO', YieldChangeId
FROM District_Adjacencies WHERE DistrictType IN (SELECT DistrictType FROM Rwb_AdjacencyDistrictList_StandardRuleset_ULA);


-- Adjacency from Appeal on Districts MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL
-- 1 modifier = 1 quartier -> je me base sur le yieldchangeid District_something de DistrictAdjacencies

INSERT OR IGNORE INTO Modifiers
(ModifierId,
 ModifierType,
 SubjectRequirementSetId)
SELECT	            'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,
                      'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',
                      'REQSET_LIMITS_APPEAL_'||a.Size
FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;

--- ModifierArguments, so effects

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                        Name,                            Value)
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldType'      ,b.YieldType              FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'RequiredAppeal' ,a.Size                   FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldChange'    ,'1'                FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'DistrictType'   ,b.DistrictType           FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'Description'    ,b.YieldText              FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType
;


INSERT OR IGNORE INTO RequirementSets
(RequirementSetId, RequirementSetType)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference_StandardRuleset_ULA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId, RequirementId)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIRES_EXACTLY_APPEAL_'||a.Size
FROM Rwb_AppealReference_StandardRuleset_ULA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO Requirements
(RequirementId, RequirementType)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
FROM Rwb_AppealReference_StandardRuleset_ULA a WHERE a.Size > 0 ;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,                          Name,Value)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MinimumValue',a.Size FROM Rwb_AppealReference_StandardRuleset_ULA a WHERE a.Size > 0 UNION
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MaximumValue',a.Size FROM Rwb_AppealReference_StandardRuleset_ULA a WHERE a.Size > 0;

INSERT OR IGNORE INTO TraitModifiers
(TraitType,
 ModifierId)
SELECT	            'TRAIT_LEADER_RWB_UNION_OF_HORODLO',
                      'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size
FROM Rwb_AppealReference_StandardRuleset_ULA a, Rwb_AdjacencyDistrictList_StandardRuleset_ULA b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;


DROP TABLE Rwb_AppealReference_StandardRuleset_ULA;
DROP TABLE Rwb_AdjacencyDistrictList_StandardRuleset_ULA;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR IGNORE INTO TraitModifiers
(TraitType,									  ModifierId								)
SELECT      'TRAIT_LEADER_RWB_UNION_OF_HORODLO',Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                            ModifierType)
SELECT      Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE',  'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                        Name,                       Value)
SELECT      Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE',   'BuildingType',             Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);
