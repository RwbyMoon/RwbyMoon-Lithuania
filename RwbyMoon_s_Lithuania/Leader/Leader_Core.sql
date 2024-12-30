/*
	Core Leader Definition
	Author: MC
*/

-----------------------------------------------
-- Types

-- This inserts the leader reference into the primary Data Types table as a playable Leader. This is mandatory. The string listed under 'Type' must be used throughout the mod when referring to the LeaderType.

-- It is customary for this to take the following format: LEADER_PREFIX_LEADERNAME

-- PREFIX: A 'unique', brief string of characters - often derived from the modder's initials, name or other alias (e.g. MC, MATT or MYALIAS). This is used to differentiate from other mods, primarily.
-- LEADERNAME: The name of the leader themselves (e.g. CLEOPATRA, GANDHI or VICTORIA).
-----------------------------------------------

INSERT INTO	Types
			(Type,					Kind			)
VALUES		('LEADER_RWB_VYTAUTAS',	'KIND_LEADER'	);
		
-----------------------------------------------
-- Leaders

-- This defines the LeaderType itself, such that the leader exists as an entity alongside the other leaders.

-- LeaderType: Must match the string defined above for Type.
-- Name: This locally-defined value appears in Leader_Localisation.sql and will be used as the display string for the leader's name.
-- InheritFrom: All base-game leaders have this value set. You can leave this unchanged.
-- SceneLayers: Similar to the above, this matches the other base-game leaders. This can be left unchanged.
-----------------------------------------------

INSERT INTO	Leaders
			(LeaderType,			Name,							InheritFrom,		SceneLayers		)
VALUES		('LEADER_RWB_VYTAUTAS',	'LOC_LEADER_RWB_VYTAUTAS_NAME',	'LEADER_DEFAULT', 	4				);

-----------------------------------------------
-- CivilizationLeaders

-- This ties the LeaderType (defined above) to the CivilizationType (defined in Civilization_Config.sql). In this example, we're using our new, custom civilization - but any valid civilization is accepted here.

-- The CapitalName field can have a different value - but typically for the first leader you are creating (alongside your custom civilization), you can reference the first CityName reference, defined in Civilization_Config.sql (specifically, the CityNames table).
-----------------------------------------------

INSERT INTO	CivilizationLeaders
			(CivilizationType,				    LeaderType,				CapitalName					)
VALUES		('CIVILIZATION_RWB_LITHUANIA',		'LEADER_RWB_VYTAUTAS',	'LOC_CITY_NAME_RWB_LITHUANIA_1'	);
		
-----------------------------------------------
-- LeaderQuotes

-- This 'flavour' item ties the Quote - which appears in the Civilopedia on the Leader page - to the custom leader. As with all text entries, the LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_QUOTE string is defined in Leader_Localisation.sql.
-----------------------------------------------

INSERT INTO	LeaderQuotes
			(LeaderType,			Quote										)
VALUES		('LEADER_RWB_VYTAUTAS',	'LOC_PEDIA_LEADERS_PAGE_RWB_VYTAUTAS_QUOTE'	);

-----------------------------------------------
-- CityNames

-- The below section associates our locally-defined custom civilization's CityNames to the specific leader we are configuring.

-- If this will be the only leader of this civilization, this isn't strictly necessary - as it will inherit from the list configured in Civilization_Config.sql.

-- However, I have left this here to illustrate how variations can be achieved on a per-leader basis within a civilization.
-----------------------------------------------

INSERT INTO	CityNames
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
