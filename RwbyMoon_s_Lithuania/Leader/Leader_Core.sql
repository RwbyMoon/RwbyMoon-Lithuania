-----------------------------------------------
-- Types
-----------------------------------------------

INSERT OR IGNORE INTO Types
			(Type,					Kind			)
VALUES		('LEADER_RWB_VYTAUTAS',	'KIND_LEADER'	);
		
-----------------------------------------------
-- Leaders
-----------------------------------------------

INSERT OR IGNORE INTO Leaders
			(LeaderType,			Name,							InheritFrom,		SceneLayers		)
VALUES		('LEADER_RWB_VYTAUTAS',	'LOC_LEADER_RWB_VYTAUTAS_NAME',	'LEADER_DEFAULT', 	4				);

-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------

INSERT OR IGNORE INTO CivilizationLeaders
			(CivilizationType,				    LeaderType,				CapitalName					)
VALUES		('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	'LOC_CITY_NAME_RWB_LITHUANIA_1'	);
		
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------

INSERT OR IGNORE INTO LeaderQuotes
			(LeaderType,			Quote										)
VALUES		('LEADER_RWB_VYTAUTAS',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_QUOTE'	);

-----------------------------------------------
-- CityNames
-----------------------------------------------

INSERT OR IGNORE INTO CityNames
			(CivilizationType,				LeaderType,				SortIndex,	CityName						)
VALUES		('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_1'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_2'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_3'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_4'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_5'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_6'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_7'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_8'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_9'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_10'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_11'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_12'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_13'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_14'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_15'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_16'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_17'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_18'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_19'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_20'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_21'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_22'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_23'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_24'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_25'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_26'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_27'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_28'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_29'		),
			('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	-1,			'LOC_CITY_NAME_RWB_LITHUANIA_30'		);



-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT OR IGNORE INTO AiListTypes
            (ListType)
VALUES	    ('RWB_VYTAUTAS_Civics'),
            ('RWB_VYTAUTAS_Techs'),
            ('RWB_VYTAUTAS_Buildings'),
            ('RWB_VYTAUTAS_Districts'),
            ('RWB_VYTAUTAS_PlotEvaluations'),
            ('RWB_VYTAUTAS_PseudoYields'),
            ('RWB_VYTAUTAS_Yields'),
            ('RWB_VYTAUTAS_Units'),
            ('RWB_VYTAUTAS_FavorDominationVictory'),
            ('RWB_VYTAUTAS_Diplomacy'),
            ('RWB_VYTAUTAS_PlotEvaluation');

-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT OR IGNORE INTO AiLists
            (ListType,								                AgendaType,							System)
VALUES	    ('RWB_VYTAUTAS_Civics',					                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Civics'),
            ('RWB_VYTAUTAS_Techs',					                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Technologies'),
            ('RWB_VYTAUTAS_Buildings',				                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Buildings'),
            ('RWB_VYTAUTAS_Districts',				                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Districts'),
            ('RWB_VYTAUTAS_PlotEvaluations',				        'TRAIT_AGENDA_RWB_VYTAUTAS',		'PlotEvaluations'),
            ('RWB_VYTAUTAS_PseudoYields',			                'TRAIT_AGENDA_RWB_VYTAUTAS',		'PseudoYields'),
            ('RWB_VYTAUTAS_Yields',					                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Yields'),
            ('RWB_VYTAUTAS_Units',					                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Units'),
            ('RWB_VYTAUTAS_FavorDominationVictory',	                'TRAIT_AGENDA_RWB_VYTAUTAS',		'Strategies'),
            ('RWB_VYTAUTAS_Diplomacy',				                'TRAIT_AGENDA_RWB_VYTAUTAS',		'DiplomaticActions');
-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
-- YIELDS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,							    Favored,	    Item,                               Value)
VALUES	    ('RWB_VYTAUTAS_Yields',				    1,			    'YIELD_FOOD',                       20),-- Civilization
            ('RWB_VYTAUTAS_Yields',				    1,			    'YIELD_PRODUCTION',                 30),-- Leader
            ('RWB_VYTAUTAS_Yields',				    1,			    'YIELD_GOLD',                       10),-- Leader
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_GPP_GENERAL',          20),-- Leader
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_GPP_PROPHET',          -50),-- Leader
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_ENVIRONMENT',          15),-- Civilization
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_UNIT_COMBAT',          30),-- Leader
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_CITY_POPULATION',      25),-- Civilization
            ('RWB_VYTAUTAS_PseudoYields',		    1,			    'PSEUDOYIELD_DISTRICT',             50);-- Civilization

-- UNIT PROMOTION CLASSES

-- UNITS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,							    Favored,	    Item,                               Value)
VALUES	    ('RWB_VYTAUTAS_Units',				    1,			    'UNIT_MILITARY_ENGINEER',           1),	        -- Leader
            ('RWB_VYTAUTAS_Units',				    1,			    'UNIT_RWB_VYTIS',                   1);			-- Civilization

-- BUILDINGS & DISTRICTS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,							    Favored,	    Item)
VALUES	    ('RWB_VYTAUTAS_Buildings',			    1,			    'BUILDING_STABLE'),			                -- Civilization
            ('RWB_VYTAUTAS_Buildings',			    1,			    'BUILDING_ARMORY'),			                -- Civilization
            ('RWB_VYTAUTAS_Buildings',			    1,			    'BUILDING_MILITARY_ACADEMY'),			    -- Civilization
            ('RWB_VYTAUTAS_Districts',			    1,			    'DISTRICT_RWB_PILIAKALNIS'),			    -- Civilization
            ('RWB_VYTAUTAS_Districts',			    1,			    'DISTRICT_COMMERCIAL_HUB'),	                -- Leader
            ('RWB_VYTAUTAS_Districts',			    1,			    'DISTRICT_THEATER_SQUARE'),	                -- Leader
            ('RWB_VYTAUTAS_Districts',			    1,			    'DISTRICT_ENCAMPMENT');			            -- Leader

-- PLOT EVALUATIONS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,					    Favored,Item,               Value,  StringVal,            TooltipString)
VALUES	    ('RWB_VYTAUTAS_PlotEvaluations',0,		'Specific Feature', '3',    'FEATURE_FOREST',     'LOC_SETTLEMENT_RECOMMENDATION_FEATURES'),-- Civilization
            ('RWB_VYTAUTAS_PlotEvaluations',0,		'Specific Feature', '3',    'FEATURE_MARSH',      'LOC_SETTLEMENT_RECOMMENDATION_FEATURES');-- Civilization


-- WONDERS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,							    Favored,	Item)
VALUES	    ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_ALHAMBRA'),	                    -- Leader
            ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_RUHR_VALLEY'),			        -- Leader
            ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_TERRACOTTA_ARMY'),			    -- Leader
            ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_COLOSSEUM'),	                    -- Civilization
            ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_ETEMANANKI'),			            -- Civilization
            ('RWB_VYTAUTAS_Buildings',			    1,			'BUILDING_HANGING_GARDENS');			    -- Civilization


-- CIVICS & TECHS
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,						        Favored,Item							    )
VALUES	    ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_STATE_WORKFORCE'		        ),          -- Civilization
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_POLITICAL_PHILOSOPHY'	    ),              -- Civilization
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_CIVIL_ENGINEERING'		        ),      -- Civilization
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_CONSERVATION'	        ),                  -- Civilization
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_DRAMA_AND_POETRY'	        ),              -- Leader
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_CIVIL_SERVICE'		),                  -- Leader
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_DIPLOMATIC_SERVICE'	        ),          -- Leader
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_DIVINE_RIGHT'		    ),                  -- Leader
            ('RWB_VYTAUTAS_Civics',			        1, 'CIVIC_THEOLOGY'	        ),                      -- Leader
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_CURRENCY'            ),                    -- Leader
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_MATHEMATICS'	            ),              -- Leader
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_MILITARY_ENGINEERING'	            ),      -- Leader
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_INDUSTRIALIZATION'	            ),          -- Leader
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_APPRENTICESHIP'	            ),          -- Civilization
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_WRITING'		    ),                      -- Civilization
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_BRONZE_WORKING'               ),           -- Civilization
            ('RWB_VYTAUTAS_Techs',			        1, 'TECH_HORSEBACK_RIDING'            );            -- Civilization

-- VICTORIES
INSERT OR IGNORE INTO AiFavoredItems
            (ListType,							    Item,									Value)
VALUES	    ('RWB_VYTAUTAS_FavorDominationVictory', 'VICTORY_STRATEGY_MILITARY_VICTORY',	    -2);

INSERT OR IGNORE INTO LeaderTraits
            (LeaderType,            TraitType) 
VALUES      ('LEADER_RWB_VYTAUTAS', 'TRAIT_LEADER_AGGRESSIVE_MILITARY');






