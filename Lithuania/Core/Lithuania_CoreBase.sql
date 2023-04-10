--==========================================================================================================================
-- LOADING INFO
--==========================================================================================================================
-- LoadingInfo
-------------------------------------	
INSERT OR REPLACE INTO LoadingInfo	
		(LeaderType,				BackgroundImage,						ForegroundImage,						PlayDawnOfManAudio)
VALUES	('LEADER_RWB_VYTAUTAS',	'LEADER_HOJO_BACKGROUND',				'LEADER_RWB_VYTAUTAS_NEUTRAL',					1);	

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT OR REPLACE INTO Types	
		(Type,												    Kind)
VALUES	('LEADER_RWB_VYTAUTAS',									'KIND_LEADER'),
		('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',			'KIND_TRAIT'),	
		('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',			        'KIND_TRAIT'),
        ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',                  'KIND_TRAIT'),
        /*('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',               'KIND_TRAIT'),*/
        ('TRAIT_LEADER_RWB_UNION_OF_HORODLO',                   'KIND_TRAIT'),
		('CIVILIZATION_RWB_LITHUANIA',					        'KIND_CIVILIZATION');
		
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT OR REPLACE INTO Traits				
		(TraitType,						Name,					Description)
VALUES	('TRAIT_LEADER_RWB_UNION_OF_HORODLO',					'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME',				'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION'),
		('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',					'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_NAME',				'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_DESCRIPTION'),
        ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		            'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME',				'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION'),
        /*('TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER',		        'LOC_UNIT_RWB_LANDOWNER_NAME',								'LOC_TRAIT_CIVILIZATION_UNIT_RWB_LANDOWNER_DESCRIPTION'),*/
		('TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',			'LOC_TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS_NAME',		'LOC_TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION');

-------------------------------------
-- Civilizations
-------------------------------------	
INSERT OR REPLACE INTO Civilizations	
		(CivilizationType,					Name,												Description,									Adjective,									StartingCivilizationLevelType,	RandomCityNameDepth)
VALUES	('CIVILIZATION_RWB_LITHUANIA',	'LOC_CIVILIZATION_RWB_LITHUANIA_NAME',			'LOC_CIVILIZATION_RWB_LITHUANIA_DESCRIPTION',		'LOC_CIVILIZATION_RWB_LITHUANIA_ADJECTIVE',	'CIVILIZATION_LEVEL_FULL_CIV',	'10'     			);	
-------------------------------------
-- StartBias
-------------------------------------	
INSERT OR REPLACE INTO StartBiasFeatures
		(CivilizationType,						    FeatureType,							Tier)
VALUES	('CIVILIZATION_RWB_LITHUANIA',				'FEATURE_FOREST',						'1'	);
----------------------------------------------------------------------------------------------------------------------------			
-- CityNames			
----------------------------------------------------------------------------------------------------------------------------		
INSERT OR REPLACE INTO CityNames	
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
INSERT OR REPLACE INTO CivilizationCitizenNames	
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
INSERT OR REPLACE INTO Leaders	
		(LeaderType,					Name,												InheritFrom,		SceneLayers)
VALUES	('LEADER_RWB_VYTAUTAS',		'LOC_LEADER_RWB_VYTAUTAS_NAME',							'LEADER_DEFAULT',	4);	
-------------------------------------
-- LeaderQuotes
-------------------------------------	
INSERT OR REPLACE INTO LeaderQuotes	
		(LeaderType,					Quote)
VALUES	('LEADER_RWB_VYTAUTAS',			'LOC_PEDIA_LEADERS_PAGE_LEADER_RWB_VYTAUTAS_QUOTE');	
-------------------------------------
-- LeaderTraits
-------------------------------------	
INSERT OR REPLACE INTO LeaderTraits	
		(LeaderType,					TraitType)
VALUES	('LEADER_RWB_VYTAUTAS',		'TRAIT_LEADER_RWB_UNION_OF_HORODLO')/*,
        ('LEADER_RWB_VYTAUTAS',      'TRAIT_CIVILIZATION_RWB_UNIT_LANDOWNER')*/;
-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT OR REPLACE INTO CivilizationTraits	
		(CivilizationType,					TraitType)
VALUES	('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI'),
		('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_UNIT_RWB_VYTIS'),
		('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS');
-------------------------------------
-- FavoredReligions
-------------------------------------	
INSERT OR REPLACE INTO FavoredReligions	
		(LeaderType,				ReligionType)
VALUES	('LEADER_RWB_VYTAUTAS',			'RELIGION_CATHOLICISM');			
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================                                                                                                                                                                                                                                                                                                                                                                                                                                                          ()




--==========================================================================================================================
-- AGENDAS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT OR REPLACE INTO Types	
		(Type,									            Kind)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'KIND_TRAIT');			
-------------------------------------			
-- Agendas			
-------------------------------------				
INSERT OR REPLACE INTO Agendas				
		(AgendaType,							Name,									Description)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',			'LOC_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NAME',	'LOC_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_DESCRIPTION');
-------------------------------------
-- HistoricalAgendas
-------------------------------------	
INSERT OR REPLACE INTO HistoricalAgendas
(LeaderType,				AgendaType)
VALUES	('LEADER_RWB_VYTAUTAS',			'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT OR REPLACE INTO Traits				
		(TraitType,								Name,					Description)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');	
-------------------------------------			
-- AgendaTraits			
-------------------------------------				
INSERT OR REPLACE INTO AgendaTraits				
		(AgendaType,							TraitType)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',			'TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS');	
-------------------------------------		
-- TraitModifiers		
-------------------------------------			
INSERT OR REPLACE INTO TraitModifiers			
		(TraitType,								ModifierId)
VALUES	('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME'),
		('TRAIT_AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS',		'AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType,										SubjectRequirementSetId)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_MANY_ALLIANCES'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_HIGH_INCOME',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_HIGH_INCOME'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES','MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	    'PLAYER_HAS_FEW_ALLIANCES'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_LOW_INCOME',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_LOW_INCOME');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------  
INSERT OR REPLACE INTO ModifierArguments
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
INSERT OR REPLACE INTO ModifierStrings			
		(ModifierId,											Context,	Text)
VALUES	('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_ALLIANCES',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_RWB_LITHUANIAN_CONSCIOUSNESS_NO_ALLIANCES',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');	
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- CivilizationLeaders
-------------------------------------	
INSERT OR REPLACE INTO CivilizationLeaders 
        (CivilizationType,			LeaderType,		CapitalName)
VALUES  ('CIVILIZATION_RWB_LITHUANIA',	'LEADER_RWB_VYTAUTAS',	'LOC_CITY_NAME_RWB_LITHUANIA_1');
--==========================================================================================================================
--==========================================================================================================================
