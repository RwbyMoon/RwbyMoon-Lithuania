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
-- APPEAL AND FAITH BUYING MALUSES FROM RELIGION FOUNDING
-----------------------------------------------


INSERT OR REPLACE INTO	TraitModifiers
            (TraitType,									                    ModifierId								)
VALUES      ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_BASE'     ),
            /*('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION'),*/
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE')/*,
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER')*/;

INSERT OR REPLACE INTO Modifiers
            (ModifierId,
             ModifierType,
             SubjectRequirementSetId,
             RunOnce)

VALUES      ('RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',
             'REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',
             0),

            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_BASE',
             'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',
             null,
             0),

            ('RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE',
             'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',
             'REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',
             1),
    
    
    
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',
             'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',
             0),            
    
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS',
             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',
             'CITY_FOLLOWS_RELIGION_REQUIREMENTS',
             0),          
    
    
    
            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',
             'PLAYER_FOUNDED_RELIGION_REQUIREMENTS',
             0), 

            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',
             'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',
             'REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT_INDIVIDUALCITYNEED',
             0);

--- REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT

---MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION
--- MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION 
--- CITY_FOLLOWS_RELIGION_REQUIREMENTS

INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                                                Name,                   Value)
VALUES      ('RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION',                                'Amount',               '1'),
            
            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_BASE',                            'BonusType',            'GOVERNMENTBONUS_FAITH_PURCHASES'),
            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_BASE',                            'Amount',               '-20'),
            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',    'BonusType',            'GOVERNMENTBONUS_FAITH_PURCHASES'),
            ('RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',    'Amount',               '-20'),
            
            ('RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE',                            'Delta',               '1'),
            
            
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS',                    'ModifierId',           'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER'),
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_FOUNDER_MODIFIER',   'ModifierId',           'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS'),
            
            ('RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER',        'Amount',               '-2');

			
/*INSERT OR REPLACE INTO BeliefModifiers
            (BeliefType, ModifierID)

SELECT      BeliefType,'RWB_DIEVDIRBIAI_APPEAL_MALUS_RWB_LEADER_VYTAUTAS'
FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER';*/

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
            ('REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT',                                               'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',                                            'REQUIREMENTSET_TEST_ALL');



INSERT OR REPLACE INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC',                        'RWB_DIEVDIRBIAI_REQUIRES_CIVIC'),
            
            ('REQSET_RWB_DIEVDIRBIAI_HAS_CIVIC_AND_FOUNDED_RELIGION',   'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
            
            ('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',            'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
            
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
