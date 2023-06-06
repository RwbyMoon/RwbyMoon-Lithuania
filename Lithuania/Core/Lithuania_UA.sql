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
-- You gain bursts of 50 [ICON_Faith] Faith when finishing [ICON_District] Districts on Breathtaking tile or better. 
-- Founding a [ICON_Religion] religion halves the Faith gain through built District and grant +1 [ICON_Governor] Governor Title.
-----------------------------------------------

INSERT OR REPLACE INTO Types
            (Type, Kind) 
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'KIND_MODIFIER');

INSERT OR REPLACE INTO DynamicModifiers
            (ModifierType, CollectionType, EffectType) 
VALUES      ('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',   'COLLECTION_PLAYER_DISTRICTS',  'EFFECT_ATTACH_MODIFIER'); 


INSERT OR REPLACE INTO	TraitModifiers
            (TraitType,									                    ModifierId								)
VALUES      
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_RELIGION_FOUNDED'),

            /*('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_PLAYER_MODIFIER_GIVER'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_PLAYER_MODIFIER_GIVER_GIVER_RELIGION_FOUNDED'),*/

            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE'),

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
             'REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS',
             0),
            ('RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN',
             'MODIFIER_PLAYER_GRANT_YIELD',
             null,
             null,
             1),
    
    
            ('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_RELIGION_FOUNDED',
             'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',
             'REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',
             0),
            ('RWB_DIEVDIRBIAI_RELIGION_FAITH_GAIN',
             'MODIFIER_PLAYER_GRANT_YIELD',
             null,
             null,
             1),


            ('RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE',
             'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',
             'REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',
             null,
             1),


			 ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
             null,
             null,
             0);


INSERT OR REPLACE INTO ModifierArguments
            (ModifierId,                                                                                Name,                   Value)
VALUES      ('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER',                      'ModifierId',        'RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN'),
            
            ('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_MODIFIER_GIVER_RELIGION_FOUNDED',     'ModifierId',        'RWB_DIEVDIRBIAI_RELIGION_FAITH_GAIN'),

            ('RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN',                             'Amount',            '60'),
            ('RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN',                             'Scale',             '1'),
            ('RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN',                             'YieldType',         'YIELD_FAITH'),
            
            ('RWB_DIEVDIRBIAI_RELIGION_FAITH_GAIN',                             'Amount',            '30'),
            ('RWB_DIEVDIRBIAI_RELIGION_FAITH_GAIN',                             'Scale',             '1'),
            ('RWB_DIEVDIRBIAI_RELIGION_FAITH_GAIN',                             'YieldType',         'YIELD_FAITH'),
            
            ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                              'YieldType',         'YIELD_FAITH'),
            ('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS',                              'Amount',            '-50'),
            
            ('RWB_DIEVDIRBIAI_GIVE_GOVERNOR_TITLE',                                 'Delta',             '1');

INSERT OR REPLACE INTO RequirementSets
            (RequirementSetId,                                                                          RequirementSetType) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS_AND_IS_LITHUANIA',                             'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',                                            'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS',                                            'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',                                            'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE_AND_IS_LITHUANIA',                           'REQUIREMENTSET_TEST_ALL');



INSERT OR REPLACE INTO RequirementSetRequirements
            (RequirementSetId,                                                                              RequirementId) 
VALUES      ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS_AND_IS_LITHUANIA',         'RWB_DIEVDIRBIAI_REQUIRES_PLAYER_HAS_GREATPROPHET'),
            ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS_AND_IS_LITHUANIA',         'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_NOT_FOUNDED'),
            ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS_AND_IS_LITHUANIA',         'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS'),

            ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS',                          'RWB_DIEVDIRBIAI_REQUIRES_PLAYER_HAS_GREATPROPHET'),
            ('REQSET_RWB_DIEVDIRBIAI_GREATPROPHET_EXISTS',                          'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_NOT_FOUNDED'),
            
            ('REQSET_RWB_DIEVDIRBIAI_HAS_BREATHTAKING_TILE',                        'RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4'),
			
			('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',       'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
			
			('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE_AND_IS_LITHUANIA',       'RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED'),
			('REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE_AND_IS_LITHUANIA',       'RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS');


INSERT OR REPLACE INTO Requirements
            (RequirementId,                                                         RequirementType,                                         Inverse) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_PLAYER_HAS_GREATPROPHET',                    'REQUIREMENT_PLAYER_HAS_GREAT_PERSON_CLASS',  0),
            ('RWB_DIEVDIRBIAI_REQUIRES_RELIGION_NOT_FOUNDED',                       'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION',                0),
            ('RWB_DIEVDIRBIAI_REQUIRES_RELIGION_FOUNDED',                           'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION',                1),
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',          'REQUIREMENT_PLAYER_TYPE_MATCHES',                0),
            ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                                   'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',                0);


INSERT OR REPLACE INTO RequirementArguments
            (RequirementId,                                                 Name,                       Value) 
VALUES      ('RWB_DIEVDIRBIAI_REQUIRES_PLAYER_HAS_GREATPROPHET',            'GreatPersonClass',         'GREAT_PERSON_CLASS_PROPHET'),
            ('RWB_DIEVDIRBIAI_REQUIRES_IS_LITHUANIAN_RWB_LEADER_VYTAUTAS',  'CivilizationType',         'CIVILIZATION_RWB_LITHUANIA'),
            ('RWB_DIEVDIRBIAI_REQUIRES_APPEAL_4',                           'MinimumAppeal',            '4');


--- Leadertype LEADER_RWB_VYTAUTAS

--- REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES
            --('RWB_DIEVDIRBIAI_REQUIRES_HAS_BELIEF_',          'CITY_FOLLOWS_RELIGION_REQUIREMENTS',                0);
			
            /*('RWB_DIEVDIRBIAI_DISTRICTS_FAITH_SCALING_MODIFIER_GIVER',              'ModifierId',        'RWB_DIEVDIRBIAI_GREATPROPHET_FAITH_GAIN'),*/
                                                                                                                                             
            /*('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_DISTRICTS_GROWTH_MODIFIER_GIVER'),
			('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_BASE'     ),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_APPEAL_BONUS_RELIGION'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS_RELIGION'),
            ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',          'RWB_DIEVDIRBIAI_FAITH_PURCHASE_MALUS_RWB_LEADER_VYTAUTAS_MODIFIER')*/
			
			
			
			                                                                              
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



/*('RWB_DIEVDIRBIAI_FAITH_GENERATION_MALUS_RELIGION',
             'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
             'REQSET_RWB_DIEVDIRBIAI_FOUNDED_RELIGION_ONCE',
             0),*/

--- REQSET_RWB_DIEVDIRBIAI_MALUS_PER_HABITANT

---MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION
--- MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION 
--- CITY_FOLLOWS_RELIGION_REQUIREMENTS