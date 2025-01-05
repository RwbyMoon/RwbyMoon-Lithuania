/*
	Core Leader Configuration
	Authors: RwbyMoon
*/

-----------------------------------------------
-- Players (Base Game / Vanilla)

-- The below section instructs the game to make this leader available as a selection when running the base-game ruleset.

-- Every value inserted into the Players table is locally-defined in this mod - if working through 'in order' these should all be familiar by this stage.

-- Please note: this is commented-out, as this example is only compatible with Gathering Storm and above. I've left this in as an example.
-----------------------------------------------

INSERT OR IGNORE INTO Players (CivilizationType, CivilizationName, CivilizationIcon, CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon, LeaderType, LeaderName, LeaderIcon, LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon)
VALUES	(	
		-- Civilization
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LOC_CIVILIZATION_RWB_LITHUANIA_NAME', -- CivilizationName
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationAbilityIcon

        -- Leader
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'LOC_LEADER_RWB_VYTAUTAS_NAME', -- LeaderName
		'ICON_LEADER_RWB_VYTAUTAS', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_RWB_VYTAUTAS' -- LeaderAbilityIcon
		);

-----------------------------------------------
-- Players (Rise & Fall)

-- The below section instructs the game to make this leader available as a selection when running the Rise & Fall ruleset.

-- This is identical to the above, except for the additional Domain value - which instructs the game to which expansion this leader becomes available.

-- Please note: this is commented-out, as this example is only compatible with Gathering Storm and above. I've left this in as an example.
-----------------------------------------------

INSERT OR IGNORE INTO Players (Domain, CivilizationType, CivilizationName, CivilizationIcon, CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon, LeaderType, LeaderName, LeaderIcon, LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon)
VALUES	(
        -- Civilization
		'Players:Expansion1_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LOC_CIVILIZATION_RWB_LITHUANIA_NAME', -- CivilizationName
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION_XP', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationAbilityIcon

        -- Leader
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'LOC_LEADER_RWB_VYTAUTAS_NAME', -- LeaderName
		'ICON_LEADER_RWB_VYTAUTAS', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION_XP', -- LeaderAbilityDescription
		'ICON_LEADER_RWB_VYTAUTAS' -- LeaderAbilityIcon
		);

-----------------------------------------------
-- Players (Gathering Storm)

-- The below section instructs the game to make this leader available as a selection when running the Gathering Storm ruleset.

-- This is identical to the Rise & Fall entry, directly above - though in this case, the Domain is Players:Expansion2_Players, which refers to Gathering Storm.
-----------------------------------------------

INSERT OR IGNORE INTO Players (Domain, CivilizationType, CivilizationName, CivilizationIcon, CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon, LeaderType, LeaderName, LeaderIcon, LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon)
VALUES	(	
		-- Civilization
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LOC_CIVILIZATION_RWB_LITHUANIA_NAME', -- CivilizationName
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME', -- CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION_XP', -- CivilizationAbilityDescription
		'ICON_CIVILIZATION_RWB_LITHUANIA', -- CivilizationAbilityIcon
		
		-- Leader
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'LOC_LEADER_RWB_VYTAUTAS_NAME', -- LeaderName
		'ICON_LEADER_RWB_VYTAUTAS', -- LeaderIcon (Portrait)
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_RWB_UNION_OF_HORODLO_DESCRIPTION_XP', -- LeaderAbilityDescription
		'ICON_LEADER_RWB_VYTAUTAS' -- LeaderAbilityIcon
		);

-----------------------------------------------
-- PlayerItems (Base Game / Vanilla)

-- These sections associate the PlayerItems with the CivilizationType and LeaderType and also primarily drive the display on certain screens (Loading Screen & Diplomacy Screen).

-- As above, I have commented-out this section as this template requires the Gathering Storm expansion.
-----------------------------------------------

INSERT OR IGNORE INTO PlayerItems
		(CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex	)
VALUES	(
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'UNIT_RWB_VYTIS', -- Type
		'ICON_UNIT_RWB_VYTIS', -- Icon
		'LOC_UNIT_RWB_VYTIS_NAME', -- Name
		'LOC_UNIT_RWB_VYTIS_DESCRIPTION', -- Description
		10	-- SortIndex
		),

		(
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'DISTRICT_RWB_PILIAKALNIS', -- Type
		'ICON_DISTRICT_RWB_PILIAKALNIS', -- Icon
		'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
		'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description
		20 -- SortIndex
		);
		
-----------------------------------------------
-- PlayerItems (Rise & Fall)

-- These sections associate the PlayerItems with the CivilizationType and LeaderType and also primarily drive the display on certain screens (Loading Screen & Diplomacy Screen).

-- Identical to the base-game version, except for the added Domain property that indicates the ruleset of the active Expansion.

-- Again, this is commented-out as this template requires the Gathering Storm expansion.
-----------------------------------------------

INSERT OR IGNORE INTO PlayerItems
		(Domain, CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex	)
VALUES	(
		'Players:Expansion1_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'UNIT_RWB_VYTIS', -- Type
		'ICON_UNIT_RWB_VYTIS', -- Icon
		'LOC_UNIT_RWB_VYTIS_NAME', -- Name
		'LOC_UNIT_RWB_VYTIS_DESCRIPTION', -- Description
		10	-- SortIndex
		),

		(
		'Players:Expansion1_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'DISTRICT_RWB_PILIAKALNIS', -- Type
		'ICON_DISTRICT_RWB_PILIAKALNIS', -- Icon
		'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
		'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description
		20 -- SortIndex
		);

-----------------------------------------------
-- PlayerItems (Gathering Storm)

-- These sections associate the PlayerItems with the CivilizationType and LeaderType and also primarily drive the display on certain screens (Loading Screen & Diplomacy Screen).

-- Identical to the base-game version, except for the added Domain property that indicates the ruleset of the active Expansion.
-----------------------------------------------

INSERT OR IGNORE INTO PlayerItems
		(Domain, CivilizationType, LeaderType, Type, Icon, Name, Description, SortIndex	)
VALUES	(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'UNIT_RWB_VYTIS', -- Type
		'ICON_UNIT_RWB_VYTIS', -- Icon
		'LOC_UNIT_RWB_VYTIS_NAME', -- Name
		'LOC_UNIT_RWB_VYTIS_DESCRIPTION', -- Description
		10	-- SortIndex
		),
		
		(
		'Players:Expansion2_Players', -- Domain
		'CIVILIZATION_RWB_LITHUANIA', -- CivilizationType
		'LEADER_RWB_VYTAUTAS', -- LeaderType
		'DISTRICT_RWB_PILIAKALNIS', -- Type
		'ICON_DISTRICT_RWB_PILIAKALNIS', -- Icon
		'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
		'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description
		20 -- SortIndex
		);