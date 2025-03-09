-----------------------------------------------
-- TEXT UPDATES FOR EXPANSIONS
-----------------------------------------------
UPDATE  Traits
SET         Description = 'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION_XP'
WHERE Description = 'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION';

-----------------------------------------------
-- Leader AI
-----------------------------------------------                 
-- BUILDINGS & DISTRICTS
INSERT OR IGNORE INTO AiFavoredItems
(ListType,							    Favored,	Item)
SELECT       'RWB_VYTAUTAS_Buildings',	    1,			'BUILDING_GOV_FAITH'            UNION   -- Civilization
SELECT       'RWB_VYTAUTAS_Buildings',	    1,			'DISTRICT_GOVERNMENT'           UNION   -- Leader
SELECT       'RWB_VYTAUTAS_Buildings',	    1,			'DISTRICT_DIPLOMATIC_QUARTER'           -- Leader
;


-- PLOT EVALUATIONS
INSERT OR IGNORE INTO AiFavoredItems
(ListType,							    Favored,	Item,                           Value,          StringVal, TooltipString)

SELECT       'RWB_VYTAUTAS_Buildings',	    0,'Specific Feature',		'1',	'FEATURE_REEF', 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES' UNION  -- Civilization
SELECT       'RWB_VYTAUTAS_Buildings',	    0,'Specific Feature',		'2',	Features.FeatureType, 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES' -- Civilization                
FROM Features WHERE FeatureType LIKE '%FLOODPLAIN%';


-- WONDERS
INSERT OR IGNORE INTO AiFavoredItems
(ListType,							    Favored,	Item)
SELECT       'RWB_VYTAUTAS_Buildings',	    1,			'BUILDING_GREAT_BATH'               -- Leader
;

-- DIPLO ACTIONS
INSERT OR IGNORE INTO AiFavoredItems
(ListType,							    Favored,	Item)
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_RESEARCH'             UNION    -- Leader
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_RELIGIOUS'            UNION    -- Leader
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_MILITARY'             UNION    -- Leader
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_ECONOMIC'             UNION    -- Leader
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_CULTURAL'             UNION    -- Leader
SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_DECLARE_TERRITORIAL_WAR'       UNION    -- Leader

SELECT       'RWB_VYTAUTAS_Diplomacy',	    1,			'DIPLOACTION_ALLIANCE_TEAMUP'                        -- Leader
;





-----------------------------------------------
-- [PEACE] ALLIANCE POINTS MODIFIER GIVER
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,                                          Kind)
SELECT      'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'KIND_MODIFIER';

INSERT OR IGNORE INTO DynamicModifiers
(ModifierType,                                  CollectionType,                 EffectType)
SELECT      'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'COLLECTION_PLAYER_DISTRICTS',  'EFFECT_ATTACH_MODIFIER';

INSERT OR IGNORE INTO	TraitModifiers
(TraitType,									        ModifierId)
SELECT  'TRAIT_LEADER_RWB_UNION_OF_HORODLO',        Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER'
FROM Rwb_FaithPurchaseDistricts;

---

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                                                               ModifierType,                                          SubjectRequirementSetId)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER', 'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER',   'ModifierId',             Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;


---
INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,                                                                                    RequirementSetType)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'REQUIREMENTSET_TEST_ALL'
FROM Rwb_FaithPurchaseDistricts;


INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                                                                   RequirementId)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                                                                   RequirementId)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4'
FROM Rwb_FaithPurchaseDistricts;

------

INSERT OR IGNORE INTO Requirements
(RequirementId,                                                         RequirementType)
SELECT  'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'REQUIREMENT_DISTRICT_TYPE_MATCHES'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO Requirements
(RequirementId,                                                         RequirementType)
SELECT      'RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4',                                   'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN';

---

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,                                                                                   Name,             Value)
SELECT  'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'DistrictType',   Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,                                                 Name,                       Value)
SELECT      'RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4',                           'MinimumAppeal',            '4';

---

-----------------------------------------------
-- [PEACE] ALLIANCE POINTS PER DISTRICT
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,					                                                               Kind)
SELECT	    Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS','KIND_MODIFIER'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                                                 ModifierType)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS',  'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS',   'Amount',             1
FROM Rwb_FaithPurchaseDistricts;

-----------------------------------------------
-- [WAR] ALLIANCE POINTS MODIFIER GIVER
-----------------------------------------------

INSERT OR IGNORE INTO	TraitModifiers
(TraitType,									        ModifierId)
SELECT  'TRAIT_LEADER_RWB_UNION_OF_HORODLO',        Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR'
FROM Rwb_FaithPurchaseDistricts;

---

INSERT OR IGNORE INTO Modifiers
(ModifierId,
 ModifierType,
 SubjectRequirementSetId,
 OwnerRequirementSetId)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR',
            'MODIFIER_RWB_PLAYER_DISTRICTS_ATTACH_MODIFIER',
            'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,
            'REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR',   'ModifierId',             Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;


INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,                                                                                    RequirementSetType)
SELECT      'REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR',   'REQUIREMENTSET_TEST_ALL';

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,                                                                                   RequirementId)
SELECT      'REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR',   'REQUIRES_PLAYER_IS_AT_WAR';

INSERT OR IGNORE INTO Requirements
(RequirementId,                         RequirementType)
SELECT      'REQUIRES_PLAYER_IS_AT_WAR',           'REQUIREMENT_PLAYER_IS_AT_WAR';

-----------------------------------------------
-- [WAR] ALLIANCE POINTS PER DISTRICT
-----------------------------------------------

INSERT OR IGNORE INTO Types
(Type,					                                                               Kind)
SELECT	    Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR','KIND_MODIFIER'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO Modifiers
(ModifierId,                                                                                 ModifierType)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR',  'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR IGNORE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR',   'Amount',             1
FROM Rwb_FaithPurchaseDistricts;