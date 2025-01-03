-----------------------------------------------
-- NO ADJACENCY + ADJACENCY FROM APPEAL
-----------------------------------------------

--- Preparation of tables to ease next things

CREATE TABLE IF NOT EXISTS Rwb_AdjacencyDistrictList
(
    DistrictType TEXT,
    YieldType TEXT,
    YieldText TEXT
);

INSERT OR REPLACE INTO Rwb_AdjacencyDistrictList
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


CREATE TABLE IF NOT EXISTS Rwb_AppealReference_ULA
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 2 FROM t LIMIT 23)
INSERT OR REPLACE INTO Rwb_AppealReference_ULA (Size) SELECT val FROM t;


CREATE TABLE IF NOT EXISTS Rwb_FaithPurchaseDistricts
(
    DistrictType TEXT
);

INSERT OR REPLACE INTO Rwb_FaithPurchaseDistricts
(DistrictType)
VALUES ('DISTRICT_GOVERNMENT'),('DISTRICT_DIPLOMATIC_QUARTER'),('DISTRICT_ENCAMPMENT');

--- Now I can Remove Adjacency for all specialty districts

INSERT OR REPLACE INTO ExcludedAdjacencies
(TraitType, YieldChangeId)
SELECT 'TRAIT_LEADER_RWB_UNION_OF_HORODLO', YieldChangeId
FROM District_Adjacencies WHERE DistrictType IN (SELECT DistrictType FROM Rwb_AdjacencyDistrictList);
            

-- Adjacency from Appeal on Districts MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL
-- 1 modifier = 1 quartier -> je me base sur le yieldchangeid District_something de DistrictAdjacencies

INSERT OR REPLACE  INTO Modifiers
                         (ModifierId,
                         ModifierType,
                         SubjectRequirementSetId)
SELECT	            'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,
                      'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',
                    'REQSET_LIMITS_APPEAL_'||a.Size
FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;

--- ModifierArguments, so effects

INSERT OR REPLACE INTO ModifierArguments
       (ModifierId,                                                        Name,                            Value)
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldType'      ,b.YieldType              FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'RequiredAppeal' ,a.Size                   FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldChange'    ,'1'                FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'DistrictType'   ,b.DistrictType           FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'Description'    ,b.YieldText              FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType
;


INSERT OR REPLACE INTO RequirementSets
                        (RequirementSetId, RequirementSetType) 
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference_ULA a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO RequirementSetRequirements
                        (RequirementSetId, RequirementId)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIRES_EXACTLY_APPEAL_'||a.Size
FROM Rwb_AppealReference_ULA a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO Requirements
                        (RequirementId, RequirementType)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
FROM Rwb_AppealReference_ULA a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO RequirementArguments
                                    (RequirementId,                          Name,Value)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MinimumValue',a.Size FROM Rwb_AppealReference_ULA a WHERE a.Size > 0 UNION
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MaximumValue',a.Size FROM Rwb_AppealReference_ULA a WHERE a.Size > 0;

INSERT OR REPLACE  INTO TraitModifiers
(TraitType,
 ModifierId)
SELECT	            'TRAIT_LEADER_RWB_UNION_OF_HORODLO',
                      'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size
FROM Rwb_AppealReference_ULA a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;


DROP TABLE Rwb_AppealReference_ULA;
DROP TABLE Rwb_AdjacencyDistrictList;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT OR REPLACE INTO Types
                (Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR REPLACE INTO	TraitModifiers
                    (TraitType,									  ModifierId								)
SELECT      'TRAIT_LEADER_RWB_UNION_OF_HORODLO',Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR REPLACE INTO Modifiers
                    (ModifierId,                                                            ModifierType)
SELECT      Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE',  'MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);

INSERT OR REPLACE INTO ModifierArguments
                    (ModifierId,                                                        Name,                       Value)
SELECT      Buildings.BuildingType||'_RWB_UNION_OF_HORODLO_FAITH_PURCHASE',   'BuildingType',             Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Rwb_FaithPurchaseDistricts);


-----------------------------------------------
-- [PEACE] ALLIANCE POINTS MODIFIER GIVER
-----------------------------------------------

INSERT OR REPLACE INTO Types
            (Type,                                          Kind)
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'KIND_MODIFIER');

INSERT OR REPLACE INTO DynamicModifiers
            (ModifierType,                                  CollectionType,                 EffectType)
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'COLLECTION_PLAYER_DISTRICTS',  'EFFECT_ATTACH_MODIFIER');

INSERT OR REPLACE INTO	TraitModifiers
        (TraitType,									        ModifierId)
SELECT  'TRAIT_LEADER_RWB_UNION_OF_HORODLO',        Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER'
FROM Rwb_FaithPurchaseDistricts;

---

INSERT OR REPLACE INTO Modifiers
            (ModifierId,                                                                                               ModifierType,                                          SubjectRequirementSetId)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER', 'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER',   'ModifierId',             Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;


---
INSERT OR REPLACE INTO RequirementSets
        (RequirementSetId,                                                                                    RequirementSetType)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'REQUIREMENTSET_TEST_ALL'
FROM Rwb_FaithPurchaseDistricts;


INSERT OR REPLACE INTO RequirementSetRequirements
        (RequirementSetId,                                                                                   RequirementId)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;
INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,                                                                                   RequirementId)
SELECT  'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4'
FROM Rwb_FaithPurchaseDistricts;

------

INSERT OR REPLACE INTO Requirements
        (RequirementId,                                                         RequirementType)
SELECT  'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'REQUIREMENT_DISTRICT_TYPE_MATCHES'
FROM Rwb_FaithPurchaseDistricts;
INSERT OR REPLACE INTO Requirements
(RequirementId,                                                         RequirementType)
VALUES      ('RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4',                                   'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');

---

INSERT OR REPLACE INTO RequirementArguments
        (RequirementId,                                                                                   Name,             Value)
SELECT  'RWB_UNION_OF_HORODLO_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType,   'DistrictType',   Rwb_FaithPurchaseDistricts.DistrictType
FROM Rwb_FaithPurchaseDistricts;
INSERT OR REPLACE INTO RequirementArguments
(RequirementId,                                                 Name,                       Value)
VALUES      ('RWB_UNION_OF_HORODLO_REQUIRES_APPEAL_4',                           'MinimumAppeal',            '4');

---

-----------------------------------------------
-- [PEACE] ALLIANCE POINTS PER DISTRICT
-----------------------------------------------

INSERT OR REPLACE INTO Types
            (Type,					                                                               Kind)
SELECT	    Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS','KIND_MODIFIER'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO Modifiers
            (ModifierId,                                                                                 ModifierType)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS',  'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS',   'Amount',             1
FROM Rwb_FaithPurchaseDistricts;

-----------------------------------------------
-- [WAR] ALLIANCE POINTS MODIFIER GIVER
-----------------------------------------------

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,									        ModifierId)
SELECT  'TRAIT_LEADER_RWB_UNION_OF_HORODLO',        Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR'
FROM Rwb_FaithPurchaseDistricts;

---

INSERT OR REPLACE INTO Modifiers
           (ModifierId,                                                                                               
            ModifierType,                                          
            SubjectRequirementSetId,  
            OwnerRequirementSetId)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR', 
            'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 
            'REQSET_RWB_UNION_OF_HORODLO_BREATHTAKING_TILE_AND_DISTRICT_IS_'||Rwb_FaithPurchaseDistricts.DistrictType, 
            'REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_MODIFIER_GIVER_WAR',   'ModifierId',             Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;


INSERT OR REPLACE INTO RequirementSets
(RequirementSetId,                                                                                    RequirementSetType)
VALUES      ('REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR',   'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,                                                                                   RequirementId)
VALUES      ('REQSET_RWB_UNION_OF_HORODLO_WHILE_AT_WAR',   'REQUIRES_PLAYER_IS_AT_WAR');

-----------------------------------------------
-- [WAR] ALLIANCE POINTS PER DISTRICT
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,					                                                               Kind)
SELECT	    Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR','KIND_MODIFIER'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO Modifiers
(ModifierId,                                                                                 ModifierType)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR',  'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS'
FROM Rwb_FaithPurchaseDistricts;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                                                  Name,                       Value)
SELECT      Rwb_FaithPurchaseDistricts.DistrictType||'_RWB_UNION_OF_HORODLO_ALLIANCE_POINTS_WAR',   'Amount',             1
FROM Rwb_FaithPurchaseDistricts;