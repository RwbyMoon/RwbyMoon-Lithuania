-----------------------------------------------
-- IconTextureAtlases
-----------------------------------------------

INSERT OR IGNORE INTO IconTextureAtlases	
		(Name,									IconSize,	IconsPerRow,	IconsPerColumn,		Filename					)
VALUES	('ICON_ATLAS_RWB_LITHUANIA',					22,	 		1,				1,					'OlmecAtlas22.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					30,	 		1,				1,					'OlmecAtlas30.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					36,	 		1,				1,					'OlmecAtlas36.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					44,	 		1,				1,					'OlmecAtlas44.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					48,	 		1,				1,					'OlmecAtlas48.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					50,	 		1,				1,					'OlmecAtlas50.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					64,	 		1,				1,					'OlmecAtlas64.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					80,	 		1,				1,					'OlmecAtlas80.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					200, 		1,				1,					'OlmecAtlas200.dds'			),
		('ICON_ATLAS_RWB_LITHUANIA',					256, 		1,				1,					'OlmecAtlas256.dds'			),

		('ICON_ATLAS_RWB_VYTAUTAS',				32,	 		1,				1,					'PoNgbeIcon32.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				45,	 		1,				1,					'PoNgbeIcon45.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				48,	 		1,				1,					'PoNgbeIcon48.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				50,	 		1,				1,					'PoNgbeIcon50.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				55,	 		1,				1,					'PoNgbeIcon55.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				64,			1,				1,					'PoNgbeIcon64.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				80,	 		1,				1,					'PoNgbeIcon80.dds'			),
		('ICON_ATLAS_RWB_VYTAUTAS',				256,	 	1,				1,					'PoNgbeIcon256.dds'			),
		
		('ICON_ATLAS_RWB_VYTIS',			22,			2,				1,					'WerejaguarAtlas22.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			32,			2,				1,					'WerejaguarAtlas32.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			38,			2,				1,					'WerejaguarAtlas38.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			50,			2,				1,					'WerejaguarAtlas50.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			70,			2,				1,					'WerejaguarAtlas70.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			80,			2,				1,					'WerejaguarAtlas80.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			95,			2,				1,					'WerejaguarAtlas95.dds'		),
		('ICON_ATLAS_RWB_VYTIS',			200,		2,				1,					'WerejaguarAtlas200.dds'	),
		('ICON_ATLAS_RWB_VYTIS',			256,		2,				1,					'WerejaguarAtlas256.dds'	),
		
		('ICON_ATLAS_RWB_PILIAKALNIS',			38,			1,				1,					'ColossalHead38.dds'		),
		('ICON_ATLAS_RWB_PILIAKALNIS',			40,			1,				1,					'ColossalHead40.dds'		),
		('ICON_ATLAS_RWB_PILIAKALNIS',			50,			1,				1,					'ColossalHead50.dds'		),
		('ICON_ATLAS_RWB_PILIAKALNIS',			80,			1,				1,					'ColossalHead80.dds'		),
		('ICON_ATLAS_RWB_PILIAKALNIS',			200,		1,				1,					'ColossalHead200.dds'		),
		('ICON_ATLAS_RWB_PILIAKALNIS',			256,		1,				1,					'ColossalHead256.dds'		);

-----------------------------------------------
-- IconDefinitions
-----------------------------------------------

INSERT OR IGNORE INTO IconDefinitions
		(Name,										    Atlas,							'Index'				)
VALUES	('ICON_CIVILIZATION_RWB_LITHUANIA',				'ICON_ATLAS_RWB_LITHUANIA',		0					),
		('ICON_LEADER_RWB_VYTAUTAS',					'ICON_ATLAS_RWB_VYTAUTAS',		0					),
		('ICON_UNIT_RWB_VYTIS_PORTRAIT',		        'ICON_ATLAS_RWB_VYTIS',		    0					),
		('ICON_UNIT_RWB_VYTIS',					        'ICON_ATLAS_RWB_VYTIS',		    1					),
		('ICON_DISTRICT_RWB_PILIAKALNIS',				'ICON_ATLAS_RWB_PILIAKALNIS',	0					);