--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
-------------------------------------	
INSERT OR REPLACE INTO Colors
		(Type,										Color)
VALUES	("COLOR_PLAYER_RWB_VYTAUTAS_SECONDARY",		"229,224,168,255"),	--#E5E0A8
		("COLOR_PLAYER_RWB_VYTAUTAS_PRIMARY",		"113,13,13,255");	--#710D0D
-------------------------------------
-- PlayerColors
-------------------------------------	
INSERT INTO PlayerColors
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
			'LEADER_RWB_VYTAUTAS',
			'Unique',

			'COLOR_STANDARD_BLUE_DK',
			'COLOR_PLAYER_RWB_VYTAUTAS_SECONDARY',

			'COLOR_STANDARD_YELLOW_LT',
			'COLOR_STANDARD_BLUE_DK',

			'COLOR_PLAYER_RWB_VYTAUTAS_PRIMARY',
			'COLOR_STANDARD_BLUE_LT',

			'COLOR_STANDARD_BLUE_MD',
			'COLOR_STANDARD_ORANGE_LT'
		);
--==========================================================================================================================
--==========================================================================================================================