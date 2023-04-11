-----------------------------------------------
-- FEATURES NOT SCRABOUILLED
-----------------------------------------------

INSERT OR REPLACE INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER');

INSERT OR REPLACE INTO	TraitModifiers
(TraitType,											                    ModifierId								)
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType					FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType			FROM Districts WHERE RequiresPlacement = 1;

INSERT OR REPLACE INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT OR REPLACE INTO Modifiers
(ModifierId,												               ModifierType,                                                            Permanent)
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType,			'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0	    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType,	'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType,		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,												                    Name,				        Value)
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType,					'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType,					'FeatureType',		'FEATURE_FOREST'					FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType,					'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType,					'FeatureType',		'FEATURE_JUNGLE'					FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType,					'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType,					'FeatureType',		'FEATURE_MARSH'					FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType,			'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType,			'FeatureType',		'FEATURE_FLOODPLAINS'				FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType,	'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType,	'FeatureType',		'FEATURE_FLOODPLAINS_GRASSLAND'	FROM Districts WHERE RequiresPlacement = 1 UNION
--
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType,		'DistrictType',		DistrictType						    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType,		'FeatureType',		'FEATURE_FLOODPLAINS_PLAINS'		FROM Districts WHERE RequiresPlacement = 1;


-----------------------------------------------
-- YIELDS FROM POPULATION AND APPEAL
-----------------------------------------------

/*INSERT OR REPLACE INTO Types
            (Type,					                                            Kind)
VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',                                'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',                                 'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION',                            'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_RELIGION',                             'KIND_MODIFIER'),

            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',                 'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',                  'KIND_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',         'KIND_MODIFIER');*/

/*INSERT OR REPLACE INTO Types
(Type,					                                        Kind)
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_FAITH_BONUS_MALUS_'||LeaderType ,     'KIND_MODIFIER'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION
                                                                                                                                          
SELECT            'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_GOLD_BONUS_MALUS_'||LeaderType ,      'KIND_MODIFIER'
FROM LeaderTraits WHERE LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

INSERT OR REPLACE INTO	TraitModifiers
            (TraitType,									                    ModifierId								)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_BONUS_BASE'    ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_GOLD_BONUS_BASE'     ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION');

INSERT OR REPLACE INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId)

VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC'),
    
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC'),
    
            ('RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION'),
            /*('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),   */         
    
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT'),                  
    
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT'),            
--- PLAYER_FOUNDED_RELIGION_REQUIREMENTS
--- REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),           
    
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),

            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED'),

            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED'),            

            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED');
--- REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT

---MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION
--- MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION 
--- CITY_FOLLOWS_RELIGION_REQUIREMENTS

INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                                                Name,                   Value)
VALUES      ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',                                     'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_FAITH_BONUS_BASE',                                     'YieldType',            'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',                                      'Amount',               '0.5'),
            ('RWB_DIEVDIRBIAI_GOLD_BONUS_BASE',                                      'YieldType',            'YIELD_GOLD'),
            ('RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION',                                 'Amount',               '1'),
    
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS',                'ModifierId',           'RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS',                 'ModifierId',           'RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS',                 'ModifierId',           'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',                'ModifierId',           'RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',                 'ModifierId',           'RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS'),
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',                 'ModifierId',           'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS'),
            
            
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',       'Amount',               '-0.5'),
            ('RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',       'YieldType',            'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'Amount',               '-0.5'),
            ('RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'YieldType',            'YIELD_GOLD'),
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'Amount',               '-2');

			
/*INSERT OR REPLACE INTO BeliefModifiers
(BeliefType, ModifierID)
VALUES          ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS'),
                ('BELIEF_FEED_THE_WORLD','RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS');*/

INSERT OR REPLACE INTO BeliefModifiers
            (BeliefType, ModifierID)
SELECT      BeliefType,'RWB_DIEVDIRBIAI_FAITH_MALUS_RWB_LEADER_VYTAUTAS'
FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER' UNION
                                                             
SELECT      BeliefType,'RWB_DIEVDIRBIAI_GOLD_MALUS_RWB_LEADER_VYTAUTAS'
FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER' UNION
                                                       
SELECT      BeliefType,'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS'
FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER';

/*INSERT OR REPLACE INTO BeliefModifiers
(BeliefType, ModifierID)
SELECT      a.BeliefType,'RWB_DIEVDIRBIAI_FAITH_MALUS_'||b.LeaderType
FROM Beliefs a, LeaderTraits b WHERE a.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
                                 AND b.LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA') UNION

SELECT      a.BeliefType,'RWB_DIEVDIRBIAI_GOLD_MALUS_'||b.LeaderType
FROM Beliefs a, LeaderTraits b WHERE a.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
                                 AND b.LeaderType IN (SELECT LeaderType FROM CivilizationLeaders WHERE CivilizationType IS 'CIVILIZATION_RWB_LITHUANIA');*/

INSERT OR REPLACE INTO RequirementSets
            (RequirementSetId,                                                                          RequirementSetType) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC',                                                        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',                                   'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED',                            'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',                                               'REQUIREMENTSET_TEST_ALL');



INSERT OR REPLACE INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC',                        'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
            
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'REQUIRES_PLAYER_FOUNDED_RELIGION'),
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',               'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED',               'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS');


INSERT OR REPLACE INTO Requirements
            (RequirementId,                                                         RequirementType,                                         Inverse) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                                      'REQUIREMENT_PLAYER_HAS_CIVIC',                          0),
            ('RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED',                           'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION',                1),
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',          'REQUIREMENT_PLAYER_TYPE_MATCHES',                0)/*,
--- REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES
            ('RWB_DIEVDIRBIAI_REQUIRES_HAS_BELIEF_',          'CITY_FOLLOWS_RELIGION_REQUIREMENTS',                0)*/;



INSERT OR REPLACE INTO RequirementArguments
            (RequirementId,                                                 Name,                       Value) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_CIVIC',                              'CivicType',                'CIVIC_MYSTICISM'),
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',  'CivilizationType',         'CIVILIZATION_RWB_LITHUANIA');

--- Leadertype LEADER_RWB_VYTAUTAS
