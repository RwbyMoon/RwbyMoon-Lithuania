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
SELECT 'DISTRICT_HOLY_SITE', b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType 

FROM Adjacency_YieldChanges b
WHERE b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_HOLY_SITE') UNION
--
SELECT 'DISTRICT_INDUSTRIAL_ZONE', b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType

FROM Adjacency_YieldChanges b
WHERE b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_INDUSTRIAL_ZONE') UNION
--
SELECT 'DISTRICT_THEATER', b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType

FROM Adjacency_YieldChanges b
WHERE b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_THEATER');
--

-- only holy site & theatre ? vs commercial hub, IZ, harbor, campus (lui c'sur que non)

/*INSERT OR REPLACE INTO Rwb_AdjacencyDistrictList
(DistrictType, YieldType, YieldText)
--
SELECT a.DistrictType, b.YieldType, 'LOC_RWB_APPEAL_'||b.YieldType
--
FROM District_Adjacencies a, Adjacency_YieldChanges b

WHERE a.DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL AND RequiresPopulation = 1) AND a.YieldChangeId LIKE 'District_%'
  AND b.ID = (SELECT YieldChangeId FROM District_Adjacencies WHERE DistrictType = a.DistrictType);*/



CREATE TABLE IF NOT EXISTS Rwb_AppealReference
(
    Size INT
);

WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 45)
INSERT OR REPLACE INTO Rwb_AppealReference (Size) SELECT val FROM t;


--- Now I can Remove Adjacency for all specialty districts

INSERT OR REPLACE INTO ExcludedAdjacencies
(TraitType, YieldChangeId)
SELECT 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI', YieldChangeId
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
FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;

--- Sooo.... The requirement just doesn't work ?

INSERT OR REPLACE INTO RequirementSets
                        (RequirementSetId, RequirementSetType) 
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIREMENTSET_TEST_ALL'
FROM Rwb_AppealReference a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO RequirementSetRequirements
                        (RequirementSetId, RequirementId)
SELECT                  'REQSET_LIMITS_APPEAL_'||a.Size,'REQUIRES_EXACTLY_APPEAL_'||a.Size
FROM Rwb_AppealReference a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO Requirements
                        (RequirementId, RequirementType)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'
FROM Rwb_AppealReference a WHERE a.Size > 0 ;

INSERT OR REPLACE INTO RequirementArguments
                                    (RequirementId,                          Name,Value)
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MinimumValue',a.Size FROM Rwb_AppealReference a WHERE a.Size > 0 UNION
SELECT                  'REQUIRES_EXACTLY_APPEAL_'||a.Size,'MaximumValue',a.Size FROM Rwb_AppealReference a WHERE a.Size > 0;


INSERT OR REPLACE INTO ModifierArguments
       (ModifierId,                                                        Name,                            Value)
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldType'      ,b.YieldType              FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'RequiredAppeal' ,a.Size                   FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'YieldChange'    ,'1'                     FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'DistrictType'   ,b.DistrictType           FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType UNION
SELECT 'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size,   'Description'    ,b.YieldText              FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType
;

INSERT OR REPLACE  INTO TraitModifiers
(TraitType,
 ModifierId)
SELECT	            'TRAIT_LEADER_RWB_UNION_OF_HORODLO',
                      'RWB'||b.DistrictType||'_'||b.YieldType||'_FROM_APPEAL'||a.Size
FROM Rwb_AppealReference a, Rwb_AdjacencyDistrictList b WHERE a.Size > 0 AND b.DistrictType = b.DistrictType ;


DROP TABLE Rwb_AppealReference;
DROP TABLE Rwb_AdjacencyDistrictList;

-----------------------------------------------
-- LANDOWNER
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,					                Kind)
VALUES	        ('UNIT_RWB_LANDOWNER',	                'KIND_UNIT'),
                ('ABILITY_RWB_LANDOWNER',				'KIND_ABILITY'	),
                ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK',				'KIND_MODIFIER'	);

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											    ModifierId								)

/*VALUES	  ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		'TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK'	);*/
VALUES	  ('TRAIT_LEADER_RWB_UNION_OF_HORODLO',		'TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK'	);

INSERT OR REPLACE INTO Units
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
 PrereqCivic)


VALUES	        ('UNIT_RWB_LANDOWNER',
                   'LOC_UNIT_RWB_LANDOWNER_NAME',
                   'LOC_UNIT_RWB_LANDOWNER_DESCRIPTION',
                   '3',
                   '3',
                   '0',
                   '0',
                   '0',
                   '0',
                   'DOMAIN_LAND',
                   'FORMATION_CLASS_CIVILIAN',
                   '108',
                   '1',
                   '0',
                   '0',
                   'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH',
                   '40',
                   '0',
                   'YIELD_FAITH',
                   '1',
                   '0',
                   'ADVISOR_GENERIC',
                   'CIVIC_POLITICAL_PHILOSOPHY');

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,Name,Value)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','UnitType','UNIT_RWB_LANDOWNER');

/*INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType, SubjectRequirementSetId)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD','REQSET_CITY_IS_CAPITAL_OR_NOT_FOUNDED_CITY');*/

/*INSERT OR REPLACE INTO RequirementSets
(RequirementSetId, RequirementSetType) 
VALUES ('REQSET_CITY_IS_CAPITAL_OR_NOT_FOUNDED_CITY','REQUIREMENTSET_TEST_ANY');

INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId, RequirementId) 
VALUES          ('REQSET_CITY_IS_CAPITAL_OR_NOT_FOUNDED_CITY','REQUIRES_CITY_HAS_PALACE'),
                ('REQSET_CITY_IS_CAPITAL_OR_NOT_FOUNDED_CITY','REQUIRES_CITY_WAS_NOT_FOUNDED');*/

--- 

INSERT OR REPLACE INTO Tags
(Tag,					Vocabulary)
VALUES	    ('CLASS_RWB_LANDOWNER',	'ABILITY_CLASS');

INSERT OR REPLACE INTO TypeTags
(Type,                       Tag)

VALUES      ('UNIT_RWB_LANDOWNER',     'CLASS_LANDCIVILIAN'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_ALL_ERAS'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_RWB_LANDOWNER'),
            ('ABILITY_RWB_LANDOWNER',  'CLASS_RWB_LANDOWNER');

INSERT OR REPLACE INTO UnitAiInfos
(UnitType, AiType)
VALUES      ('UNIT_RWB_LANDOWNER','UNITAI_BUILD'),
            ('UNIT_RWB_LANDOWNER','UNITTYPE_CIVILIAN');

INSERT OR REPLACE INTO UnitCaptures
(CapturedUnitType, BecomesUnitType)
VALUES      ('UNIT_RWB_LANDOWNER','UNIT_BUILDER');

INSERT OR REPLACE INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
SELECT      DistrictType,                  'UNIT_RWB_LANDOWNER',      '100'
FROM Districts WHERE Appeal >= 1;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,									  ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,                                                                     Name,               Value)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE',   'BuildingType',       Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);