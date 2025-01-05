/*
	Leader Colours
	Authors: RwbyMoon
*/

-----------------------------------------------
-- PlayerColors

-- This assigns the civilization's colours to the leader - when selecting the leader, this will control the order in which the colour-combinations appear (with PrimaryColor and SecondaryColor representing the default values).

-- These eight colour references are locally-defined values, taken straight from the code section above. Again, as we only have one leader, we simply match the order.
-----------------------------------------------

-------------------------------------
--	PlayerColors
-------------------------------------
INSERT OR IGNORE INTO PlayerColors
    (
        Type,
        Usage,
    
        PrimaryColor,
        SecondaryColor,
    
        Alt1PrimaryColor,
        Alt1SecondaryColor,
    
        Alt2PrimaryColor,
        Alt2SecondaryColor,
    
        Alt3PrimaryColor,
        Alt3SecondaryColor
    )
VALUES
    (
        "LEADER_RWB_VYTAUTAS",
        "Unique",

        "COLOR_PLAYER_RWB_VYTAUTAS_1",
        "COLOR_PLAYER_RWB_VYTAUTAS_2",

        "COLOR_PLAYER_RWB_VYTAUTAS_3",
        "COLOR_PLAYER_RWB_VYTAUTAS_4",

        "COLOR_PLAYER_RWB_VYTAUTAS_6",
        "COLOR_PLAYER_RWB_VYTAUTAS_5",

        "COLOR_PLAYER_RWB_VYTAUTAS_5",
        "COLOR_PLAYER_RWB_VYTAUTAS_6"
    );