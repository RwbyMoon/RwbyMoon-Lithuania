--==========================================================================================================================
-- LOADING INFO
--==========================================================================================================================
-- LoadingInfo
-------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,				BackgroundImage,						ForegroundImage,						PlayDawnOfManAudio)
VALUES	('LEADER_RWB_VYTAUTAS',	'LEADER_HOJO_BACKGROUND',				'LEADER_MER_YAROSLAV_NEUTRAL',					1);	

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,												    Kind)
VALUES	('LEADER_RWB_VYTAUTAS',									'KIND_LEADER'),
		('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',			'KIND_TRAIT'),	
		('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',			        'KIND_TRAIT'),
        ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',                  'KIND_TRAIT'),
        ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',              'KIND_TRAIT'),
        ('TRAIT_LEADER_RWB_UNION_OF_HORODLO',                  'KIND_TRAIT'),
		('CIVILIZATION_RWB_LITHUANIA',					        'KIND_CIVILIZATION');
		
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT OR REPLACE INTO Traits				
		(TraitType,						Name,					Description)
VALUES	('TRAIT_LEADER_RWB_UNION_OF_HORODLO',					'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME',		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION'),
		('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',					'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_NAME',		'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_DESCRIPTION'),
        ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		            'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME',		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION'),
        ('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		        'LOC_UNIT_RWB_LANDOWNER_NAME',		'LOC_TRAIT_CIVILIZATION_UNIT_RWB_LANDOWNER_DESCRIPTION'),
		('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',			'LOC_TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS_NAME',		'LOC_TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION');

-------------------------------------
-- Civilizations
-------------------------------------	
INSERT INTO Civilizations	
		(CivilizationType,					Name,												Description,									Adjective,									StartingCivilizationLevelType,	RandomCityNameDepth)
VALUES	('CIVILIZATION_RWB_LITHUANIA',	'LOC_CIVILIZATION_RWB_LITHUANIA_NAME',			'LOC_CIVILIZATION_RWB_LITHUANIA_DESCRIPTION',		'LOC_CIVILIZATION_RWB_LITHUANIA_ADJECTIVE',	'CIVILIZATION_LEVEL_FULL_CIV',	'10'     			);	
-------------------------------------
-- StartBias
-------------------------------------	
INSERT INTO StartBiasFeatures
		(CivilizationType,						    FeatureType,							Tier)
VALUES	('CIVILIZATION_RWB_LITHUANIA',				'FEATURE_FOREST',						'1'	);
----------------------------------------------------------------------------------------------------------------------------			
-- CityNames			
----------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityNames	
		(CivilizationType,			    CityName)	
VALUES	('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_1'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_2'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_3'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_4'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_5'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_6'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_7'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_8'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_9'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_10'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_11'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_12'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_13'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_14'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_15'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_16'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_17'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_18'),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_19'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_20'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_21'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_22'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_23'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_24'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_25'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_26'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_27'),	
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_28'),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_29'),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITY_NAME_RWB_LITHUANIA_30');
----------------------------------------------------------------------------------------------------------------------------
-- CivilizationCitizenNames
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CivilizationCitizenNames	
		(CivilizationType,			CitizenName,								Female,		Modern)
VALUES	('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_1',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_2',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_3',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_4',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_5',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_6',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_7',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_8',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_9',				0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_10',			0,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_1',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_2',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_3',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_4',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_5',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_6',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_7',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_8',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_9',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_10',			1,			0),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_1',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_2',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_3',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_4',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_5',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_6',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_7',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_8',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_9',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_10',		0,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_1',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_2',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_3',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_4',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_5',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_6',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_7',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_8',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_9',	1,			1),
		('CIVILIZATION_RWB_LITHUANIA',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_10',	1,			1);	
-------------------------------------
-- Leaders
-------------------------------------	
INSERT INTO Leaders	
		(LeaderType,					Name,												InheritFrom,		SceneLayers)
VALUES	('LEADER_RWB_VYTAUTAS',		'LOC_LEADER_RWB_VYTAUTAS_NAME',									'LEADER_DEFAULT',	4);	
-------------------------------------
-- LeaderQuotes
-------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,					Quote)
VALUES	('LEADER_RWB_VYTAUTAS',			'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_QUOTE');	
-------------------------------------
-- LeaderTraits
-------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,					TraitType)
VALUES	('LEADER_RWB_VYTAUTAS',		'TRAIT_LEADER_RWB_UNION_OF_HORODLO');
-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(CivilizationType,					TraitType)
VALUES	('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI'),
		('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_UNIT_RWB_VYTIS'),
		('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS'),
        ('CIVILIZATION_RWB_LITHUANIA',      'TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER');
-------------------------------------
-- FavoredReligions
-------------------------------------	
INSERT INTO FavoredReligions	
		(LeaderType,				ReligionType)
VALUES	('LEADER_RWB_VYTAUTAS',			'RELIGION_CATHOLICISM');			
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================                                                                                                                                                                                                                                                                                                                                                                                                                                                          ()

-----------------------------------------------
-- FEATURES NOT SCRABOUILLED
-----------------------------------------------
    
INSERT INTO Types
(Type,														Kind)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'KIND_MODIFIER'); 

INSERT INTO	TraitModifiers
(TraitType,											                    ModifierId								) 
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType						FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType					FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	 'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType			FROM Districts WHERE RequiresPlacement = 1;

INSERT INTO DynamicModifiers
(ModifierType,												                    CollectionType,				    EffectType)
VALUES	('MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',		'COLLECTION_PLAYER_CITIES',	    'EFFECT_ADJUST_VALID_FEATURES_DISTRICTS');

INSERT INTO Modifiers
                (ModifierId,												               ModifierType,                                                            Permanent)
SELECT	'RWB_DIEVDIRBIAI_ALLOW_WOODS_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_MARSH_'||DistrictType,					'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_'||DistrictType,			'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0	    FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_'||DistrictType,	'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1 UNION
SELECT	'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_'||DistrictType,		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT',0		FROM Districts WHERE RequiresPlacement = 1;

INSERT INTO ModifierArguments
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
-- PILIAKALNIS YIELDS
-----------------------------------------------

INSERT INTO	TraitModifiers
(TraitType,											    ModifierId								)

VALUES	  ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD1'	),
          ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD3'	),
          ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_PILIAKALNIS_ADJ_FAITH_YIELD5'	);



/*INSERT OR REPLACE INTO Types
(Type,                                                  Kind)
VALUES    ('MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY',    'KIND_MODIFIER'),
          ('ABILITY_LEU_NO_BUILDER_OPERATIONS',                  'KIND_ABILITY');

INSERT OR REPLACE INTO DynamicModifiers
(ModifierType,                                          CollectionType,        EffectType)
VALUES    ('MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY',    'COLLECTION_OWNER',    'EFFECT_CHANGE_UNIT_OPERATION_AVAILABILITY');
-- Args: Available (Bool), OperationType

INSERT OR REPLACE INTO UnitAbilities
(UnitAbilityType)
VALUES    ('ABILITY_LEU_NO_BUILDER_OPERATIONS');

INSERT OR REPLACE INTO UnitAbilityModifiers
(UnitAbilityType,            ModifierId)
VALUES  ('ABILITY_LEU_NO_BUILDER_OPERATIONS',    'LEU_DISABLE_PLANT_FOREST'),
        ('ABILITY_LEU_NO_BUILDER_OPERATIONS',    'LEU_DISABLE_CLEAR_CONTAMINATION'),
        ('ABILITY_LEU_NO_BUILDER_OPERATIONS',    'LEU_DISABLE_HARVEST_RESOURCE'),
        ('ABILITY_LEU_NO_BUILDER_OPERATIONS',    'LEU_DISABLE_REMOVE_FEATURE');

INSERT OR REPLACE INTO Modifiers
(ModifierId,                         ModifierType)
VALUES  ('LEU_DISABLE_PLANT_FOREST',        'MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY'),
        ('LEU_DISABLE_CLEAR_CONTAMINATION', 'MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY'),
        ('LEU_DISABLE_HARVEST_RESOURCE',    'MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY'),
        ('LEU_DISABLE_REMOVE_FEATURE',      'MODIFIER_LEU_CHANGE_UNIT_OPERATION_AVAILABILITY');


INSERT INTO ModifierArguments
(ModifierId,                        Name,            Value)
VALUES  ('LEU_DISABLE_PLANT_FOREST',        'OperationType',    'UNITOPERATION_PLANT_FOREST'),
        ('LEU_DISABLE_PLANT_FOREST',        'Available',        0),
        --
        ('LEU_DISABLE_CLEAR_CONTAMINATION',  'OperationType',    'UNITOPERATION_CLEAR_CONTAMINATION'),
        ('LEU_DISABLE_CLEAR_CONTAMINATION',  'Available',        0),
        --
        ('LEU_DISABLE_HARVEST_RESOURCE',     'OperationType',    'UNITOPERATION_HARVEST_RESOURCE'),
        ('LEU_DISABLE_HARVEST_RESOURCE',     'Available',        0),
        --
        ('LEU_DISABLE_REMOVE_FEATURE',       'OperationType',    'UNITOPERATION_REMOVE_FEATURE'),
        ('LEU_DISABLE_REMOVE_FEATURE',       'Available',        0);*/


--==========================================================================================================================
-- AGENDAS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,									            Kind)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'KIND_TRAIT');			
-------------------------------------			
-- Agendas			
-------------------------------------				
INSERT INTO Agendas				
		(AgendaType,							Name,									Description)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',			'LOC_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NAME',	'LOC_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_DESCRIPTION');
-------------------------------------
-- HistoricalAgendas
-------------------------------------	
INSERT INTO HistoricalAgendas
(LeaderType,				AgendaType)
VALUES	('LEADER_RWB_VYTAUTAS',			'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,								Name,					Description)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');	
-------------------------------------			
-- AgendaTraits			
-------------------------------------				
INSERT INTO AgendaTraits				
		(AgendaType,							TraitType)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',			'TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS');	
-------------------------------------		
-- TraitModifiers		
-------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,								ModifierId)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,										SubjectRequirementSetId)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_MANY_ALLIANCES'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_HIGH_INCOME'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES','MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	    'PLAYER_HAS_FEW_ALLIANCES'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_LOW_INCOME');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------  
INSERT INTO ModifierArguments
		(ModifierId,							Name,							Value,													Extra,				Type)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		'InitialValue',					6,														null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		'StatementKey',					'LOC_DIPLO_KUDOS_LEADER_RWB_VYTAUTAS_REASON_ALLIANCES',	null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		'InitialValue',					-6,														null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		'StatementKey',					'LOC_DIPLO_WARNING_LEADER_RWB_VYTAUTAS_REASON_NO_ALLIANCES',	null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',		'InitialValue',					4,														null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',		'StatementKey',					'LOC_DIPLO_KUDOS_LEADER_RWB_VYTAUTAS_REASON_HIGH_INCOME',	null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',		null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',		'InitialValue',					-4,														null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',		'StatementKey',					'LOC_DIPLO_WARNING_LEADER_RWB_VYTAUTAS_REASON_LOW_INCOME',	null,				'ARGTYPE_IDENTITY'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',		null,				'ARGTYPE_IDENTITY');
-------------------------------------		
-- ModifierStrings		
-------------------------------------			
INSERT INTO ModifierStrings			
		(ModifierId,											Context,	Text)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- CivilizationLeaders
-------------------------------------	
INSERT INTO CivilizationLeaders 
        (CivilizationType,			LeaderType,		CapitalName)
VALUES  ('CIVILIZATION_RWB_LITHUANIA',	'LEADER_RWB_VYTAUTAS',	'LOC_CITY_NAME_RWB_LITHUANIA_1');
--==========================================================================================================================
--==========================================================================================================================
