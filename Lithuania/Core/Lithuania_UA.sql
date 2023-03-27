-----------------------------------------------
-- YIELDS FROM POPULATION
-----------------------------------------------

INSERT INTO Types
            (Type,					                                        Kind)
VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',         'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',          'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',     'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',      'KIND_MODIFIER'),

            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',                 'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',                  'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',         'KIND_MODIFIER');

/*INSERT INTO Types
(Type,					                                        Kind)
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||LeaderType ,     'KIND_MODIFIER'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                                                                                                          
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||LeaderType ,      'KIND_MODIFIER'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

INSERT INTO	TraitModifiers
            (TraitType,									                    ModifierId								)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_BONUS_BASE'    ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_GOLD_BONUS_BASE'     ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION' );

INSERT INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId)

VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC'),
        
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC'),

            ('RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION'),

            ('RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION'),

            /*('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),   */         
    
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),            
    
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',
             NULL),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',
             NULL);
--- PLAYER_FOUNDED_RELIGION_REQUIREMENTS
--- REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT

---MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION
--- MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION

INSERT INTO ModifierArguments
            (ModifierId,                                                                                Name,                   Value)
VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',                                     'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',                                     'YieldType',            'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',                                      'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',                                      'YieldType',            'YIELD_GOLD'),
            ('RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',                                 'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_FAITH_BONUS_RELIGION',                                 'YieldType',            'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',                                  'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',                                  'YieldType',            'YIELD_GOLD'),
    
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',                'ModifierId',           'RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',                 'ModifierId',           'RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',                'ModifierId',           'RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',                 'ModifierId',           'RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS'),
            
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',       'Amount',               '99'),
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',       'YieldType',            'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'Amount',               '99'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'YieldType',            'YIELD_GOLD');

			
INSERT INTO BeliefModifiers
(BeliefType, ModifierID)
VALUES          ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS')/*,
                ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER')*/,
                ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS')/*,
                ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER')*/;

INSERT INTO RequirementSets
            (RequirementSetId,                                                                          RequirementSetType) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC',                                                        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',                                   'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',                                               'REQUIREMENTSET_TEST_ALL');



INSERT INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC',                        'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
            
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'REQUIRES_PLAYER_FOUNDED_RELIGION')/*,
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS'),
                        
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'REQUIRES_CITY_FOLLOWS_RELIGION')*/;


INSERT INTO Requirements
            (RequirementId,                                                         RequirementType,                                         Inverse) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                                      'REQUIREMENT_PLAYER_HAS_CIVIC',                          0),
            ('RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED',                           'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION',                1)/*,
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',          'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',                0),

            ('RWB_DIEVDIRBIAI_REQUIRES_HAS_BELIEF_',          'CITY_FOLLOWS_RELIGION_REQUIREMENTS',                0)*/;



INSERT INTO RequirementArguments
            (RequirementId,                                                 Name,               Value) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                              'CivicType',        'CIVIC_MYSTICISM')/*,
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',  'LeaderType',       'RWB_LEADER_VYTAUTAS'),
            ('RWB_DIEVDIRBIAI_REQUIRES_HAS_BELIEF_',                        'BeliefType',       'BELIEF_FEED_THE_WORLD')*/;

/*INSERT INTO BeliefModifiers
            (BeliefType, ModifierID)
SELECT      a.BeliefType,'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||b.LeaderType 
FROM Beliefs a, LeaderTraits b WHERE a.BeliefClassType = 'BELIEF_CLASS_FOLLOWER' 
                 AND b.LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                       
SELECT      a.BeliefType,'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||b.LeaderType
FROM Beliefs a, LeaderTraits b WHERE a.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
                                 AND b.LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/



/*INSERT INTO Modifiers
                           (ModifierId,
                            ModifierType,
                            SubjectRequirementSetId)
    
SELECT						'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||LeaderType,
                            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
							'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION

SELECT                      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||LeaderType,
                            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
                            'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

/*INSERT INTO ModifierArguments
(ModifierId,                                                        Name,                   Value)

SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||LeaderType,            'Amount',               '-1'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                                                                                                          
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||LeaderType,            'YieldType',            'YIELD_FAITH'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                                                                                                          
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||LeaderType,             'Amount',               '-1'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                                                                                                          
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||LeaderType,             'YieldType',            'YIELD_GOLD'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

/*INSERT INTO RequirementSets
(RequirementSetId,                                                      RequirementSetType)
SELECT      'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType,       'REQUIREMENTSET_TEST_ALL'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

/*INSERT INTO RequirementSetRequirements
(RequirementSetId,                                                                              RequirementId)
SELECT      'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType,       'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
SELECT      'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType,       'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
SELECT      'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType,       'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_'||LeaderType
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
SELECT      'REQSET_CIVILIZATION_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_IS_SPREAD_'||LeaderType,       'REQUIRES_PLAYER_FOUNDED_RELIGION'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

/*INSERT INTO Requirements
(RequirementId,                                         RequirementType,                                         Inverse)
SELECT      'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_'||LeaderType,              'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',   0
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

/*INSERT INTO RequirementArguments
                        (RequirementId,                                     Name,               Value)
SELECT      'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_'||LeaderType,          'LeaderType',   LeaderType
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

-----------------------------------------------
-- LANDOWNER
-----------------------------------------------

INSERT INTO Types
(Type,					                Kind)
VALUES	        ('UNIT_RWB_LANDOWNER',	                'KIND_UNIT'),
                ('ABILITY_RWB_LANDOWNER',				'KIND_ABILITY'	),
                ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK',				'KIND_MODIFIER'	);

INSERT INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		'TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK'	);

INSERT INTO Units
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
 PrereqCivic,
 TraitType)


VALUES	        ('UNIT_RWB_LANDOWNER',
                   'LOC_UNIT_RWB_LANDOWNER_NAME',
                   'LOC_TRAIT_CIVILIZATION_UNIT_RWB_LANDOWNER_DESCRIPTION',
                   '3',
                   '4',
                   '0',
                   '0',
                   '0',
                   '0',
                   'DOMAIN_LAND',
                   'FORMATION_CLASS_CIVILIAN',
                   '54',
                   '1',
                   '0',
                   '0',
                   'COST_PROGRESSION_GAME_PROGRESS',
                   '1000',
                   '0',
                   'YIELD_FAITH',
                   '1',
                   '0',
                   'ADVISOR_GENERIC',
                   'CIVIC_MYSTICISM',
                   'TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER');

INSERT INTO Modifiers
(ModifierId, ModifierType)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','MODIFIER_PLAYER_ADJUST_VALID_UNIT_BUILD');

INSERT INTO ModifierArguments
(ModifierId,Name,Value)
VALUES      ('TRAIT_CIVILIZATION_LANDOWNER_UNIQUE_UNIT_UNLOCK','UnitType','UNIT_RWB_LANDOWNER');

INSERT INTO Tags
(Tag,					Vocabulary)
VALUES	    ('CLASS_RWB_LANDOWNER',	'ABILITY_CLASS');

INSERT INTO TypeTags
(Type,                       Tag)

VALUES      ('UNIT_RWB_LANDOWNER',     'CLASS_LANDCIVILIAN'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_ALL_ERAS'),
            ('UNIT_RWB_LANDOWNER',     'CLASS_RWB_LANDOWNER'),
            ('ABILITY_RWB_LANDOWNER',  'CLASS_RWB_LANDOWNER');

INSERT INTO UnitAiInfos
(UnitType, AiType)
VALUES      ('UNIT_RWB_LANDOWNER','UNITAI_BUILD'),
            ('UNIT_RWB_LANDOWNER','UNITTYPE_CIVILIAN');

INSERT INTO UnitCaptures
(CapturedUnitType, BecomesUnitType)
VALUES      ('UNIT_RWB_LANDOWNER','UNIT_BUILDER');

INSERT INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
SELECT      DistrictType,                  'UNIT_RWB_LANDOWNER',      '100'
FROM Districts WHERE Appeal >= 1;

-----------------------------------------------
-- BUILDING FAITH BUYING
-----------------------------------------------

INSERT INTO Types
(Type,					                                        Kind)
SELECT	    Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','KIND_MODIFIER'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO	TraitModifiers
(TraitType,									  ModifierId								)
SELECT      'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO Modifiers
(ModifierId, ModifierType)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE','MODIFIER_PLAYER_CITIES_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);

INSERT INTO ModifierArguments
(ModifierId,                                                                     Name,               Value)
SELECT      Buildings.BuildingType||'_RWB_DIEVDIRBIAI_FAITH_PURCHASE',   'BuildingType',       Buildings.BuildingType
FROM Buildings WHERE PrereqDistrict IN (SELECT DistrictType FROM Districts WHERE Appeal >= 1);