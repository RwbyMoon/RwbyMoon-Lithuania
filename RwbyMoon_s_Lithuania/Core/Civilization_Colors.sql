/*
	Civilization Badge Colours
	Authors: MC
*/

-----------------------------------------------
-- Colors

-- This configures four colour options for your custom civilization. All values are formatted as RGBA - with the A (Alpha) channel always set to 255.

-- In this file/section, all we are doing is defining the colours and giving them unique string 'names'. We'll assign them to our civilization (via our Leader) in a separate file (Leader_Colors.sql).
-----------------------------------------------

--======================================================================
--	COLORS
--======================================================================
--	Colors
-------------------------------------
INSERT OR REPLACE INTO Colors
		(Type,								Color)
VALUES
		("COLOR_PLAYER_RWB_VYTAUTAS_1",		"193,0,0,255"),	--#C10000
		("COLOR_PLAYER_RWB_VYTAUTAS_2",		"255,255,255,255"),	--#FFFFFF
		("COLOR_PLAYER_RWB_VYTAUTAS_3",		"126,5,0,255"),	--#7E0500
		("COLOR_PLAYER_RWB_VYTAUTAS_4",		"255,243,108,255"),	--#FFF36C
		("COLOR_PLAYER_RWB_VYTAUTAS_5",		"255,184,28,255"),	--#FFB81C
		("COLOR_PLAYER_RWB_VYTAUTAS_6",		"4,106,56,255");	--#046A38
--======================================================================
--======================================================================
