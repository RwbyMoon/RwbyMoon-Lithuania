INSERT OR IGNORE INTO LocalizedText
			(Language, Tag, Gender, Plurality, Text)
VALUES

-----------------------------------------------
-- Civilization
-----------------------------------------------

	('en_US',	'LOC_CIVILIZATION_RWB_LITHUANIA_NAME',			null,	null,			'Lithuania'										),
	('en_US',	'LOC_CIVILIZATION_RWB_LITHUANIA_DESCRIPTION',	null,	null,			'Lithuanian Empire'									),
	('en_US',	'LOC_CIVILIZATION_RWB_LITHUANIA_ADJECTIVE',  	null,	null,			'lithuanian'											),
	
	
	('fr_FR',	'LOC_CIVILIZATION_RWB_LITHUANIA_NAME',			'feminine',									null,	    'Lituanie'														),
	('fr_FR',	'LOC_CIVILIZATION_RWB_LITHUANIA_DESCRIPTION',	'masculine',								null,	    'Empire Lituanien'												),
	('fr_FR',	'LOC_CIVILIZATION_RWB_LITHUANIA_ADJECTIVE',  	'masculine|feminine|masculine|feminine',		1|1|2|2,	'lituanien|lituanienne|lituaniens|lituaniennes'				),
-----------------------------------------------
-- Civilization Unique Ability
-----------------------------------------------

--------- VERSION FOR GATHERING STORM AND RISE & FALL
	('en_US',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME',  	    null,	null,   'Dievdirbiai'),
	('en_US',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION_XP',  	null,	null,   'Districts can be placed on any passable terrain [ICON_Terrain] features without destroying them. +1 Appeal to tiles adjacent to Floodplains and Reefs, +2 for Marshes[NEWLINE]Your cities generate -50% [ICON_Faith] Faith per turn. You gain bursts of Faith (scaling with era) when finishing [ICON_District] Districts on Breathtaking tiles, doubled if built onto Floodplains or Marshes.'	),

	('fr_FR',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_NAME',  	    null,	null,   'Dievdirbiai'),
	('fr_FR',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION_XP',  	null,	null,   'Les Quartiers peuvent être placés sur les [ICON_Terrain] caractéristiques de terrain sans les détruire. +1 Attrait aux cases adjacentes aux Plaines Inondables et Récifs que vous possédez, +2 pour les Marais.[NEWLINE]Vos villes génèrent -50% [ICON_Faith] Foi par tour. Finir un [ICON_District] Quartier sur une case Époustouflante ou mieux génère de la [ICON_Faith] Foi (augmentant au fil des ères), doublé si construit sur un Marais ou une Plaine Inondable.'),

--------- VERSION FOR STANDARD RULESET
    ('en_US',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION',  	null,	null,   'Districts can be placed on any passable terrain [ICON_Terrain] features without destroying them. +1 Appeal to tiles adjacent to Floodplains, +2 for Marshes[NEWLINE]Your cities generate -50% [ICON_Faith] Faith per turn. You gain bursts of Faith (scaling with era) when finishing [ICON_District] Districts on Breathtaking tiles, doubled if built onto Floodplains or Marshes.'	),
    
    ('fr_FR',	'LOC_TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI_DESCRIPTION',  	null,	null,   'Les Quartiers peuvent être placés sur les [ICON_Terrain] caractéristiques de terrain sans les détruire. +1 Attrait aux cases adjacentes aux Plaines Inondables que vous possédez, +2 pour les Marais.[NEWLINE]Vos villes génèrent -50% [ICON_Faith] Foi par tour. Finir un [ICON_District] Quartier sur une case Époustouflante ou mieux génère de la [ICON_Faith] Foi (augmentant au fil des ères), doublé si construit sur un Marais ou une Plaine Inondable.'),

-----------------------------------------------
-- Civilization Unique Infrastructure
-----------------------------------------------

	('en_US',	'LOC_DISTRICT_RWB_PILIAKALNIS_NAME',  	                    null,	    null,   'Piliakalnis'),
	('en_US',	'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION',  	                null,	    null,   'Lithuanian unique standalone District for city growth and protection  scaling with Appeal and other districts.[NEWLINE][NEWLINE]• This district and those adjacent to it generate 1 [ICON_Food] Food, an additional 1 when built on a Floodplain, a Reef or a Marsh, and an additional 1 if the tile is Breathtaking.[NEWLINE]• Within 4 tiles of a Piliakalnis, military units gain +3 [ICON_Strength] Combat Strength and religious units gain +8 [ICON_Religion] Religious Strength. [NEWLINE]• +2 Appeal on adjacent tiles[NEWLINE]• Zone of Control on adjacent enemy units.'),
    
    ('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_NAME',  	            null,	    null,   'Leičiai Patrol'),
	('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_DESCRIPTION',  	    null,	    null,   '+3 [ICON_Strength] Combat Strength when within 4 tiles of a Piliakalnis.'),
	('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_BONUS_DESCRIPTION',  	null,	    null,   '+3 [ICON_Strength] from a Piliakalnis.'),
        
    ('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_NAME',  	        null,	    null,   'Leičiai Patrol'),
	('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_DESCRIPTION',  	    null,	    null,   '+8 [ICON_Religion] Religious Strength when within 4 tiles of a Piliakalnis.'),
	('en_US',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_BONUS_DESCRIPTION', null,	    null,   '+8 [ICON_Religion] from Piliakalnis'),


    ('fr_FR',	'LOC_DISTRICT_RWB_PILIAKALNIS_NAME',  	                    'masculine',	    null,   'Piliakalnis'),
    ('fr_FR',	'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION',  	                null,	    null,   'Quartier unique Lituanien dédié à la croissance et protection de la ville, évoluant avec l''Attrait et la proximité d''autres Quartiers.[NEWLINE][NEWLINE]• Ce quartier et ceux adjacents génèrent 1 [ICON_Food] Nourriture, 1 additionnel lorsque construit sur une Plaine Inondable, un Récif ou un Marais, et 1 additionnel si sa case est Époustouflante.[NEWLINE]• Jusqu''à 4 cases d''un Piliakalnis, les unités militaires gagnent +3 [ICON_Strength] Puissance de Combat et les unités religieuses gagnent +8 [ICON_Religion] Puissance Religieuse.[NEWLINE]• +2 Attrait sur les cases adjacentes.[NEWLINE]• Zone de Contrôle sur les unités ennemies adjacentes.'),
    
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_NAME',  	            null,	    null,   'Patrouille de Leičiai'),
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_DESCRIPTION',  	    null,	    null,   '+3 [ICON_Strength] Puissance de Combat lorsqu''à 4 cases ou moins d''un Piliakalnis.'),
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_COMBAT_STRENGTH_BONUS_DESCRIPTION',  	null,	    null,   '+3 [ICON_Strength] grâce à un Piliakalnis.'),
    
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_NAME',  	        null,	    null,   'Patrouille de Leičiai'),
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_DESCRIPTION',  	    null,	    null,   '+8 [ICON_Religion] Puissance Religieuse lorsqu''à 4 cases ou moins d''un Piliakalnis.'),
    ('fr_FR',	'LOC_ABILITY_RWB_PILIAKALNIS_RELIGIOUS_STRENGTH_BONUS_DESCRIPTION', null,	    null,   '+8 [ICON_Religion] grâce à un Piliakalnis'),

    
-----------------------------------------------
-- Civilization Unique Unit
-----------------------------------------------

	('en_US',	'LOC_UNIT_RWB_VYTIS_NAME',                              null,	    null,   'Vytis'),
	('en_US',	'LOC_UNIT_RWB_VYTIS_DESCRIPTION',                       null,	    null,   'Unique Lithuanian Light Cavalry unit, stronger than the Horseman it replaces. More expensive than the Horseman it replaces, it has an higher [ICON_Gold] Gold upkeep and can only upgrade into Cavalry.[NEWLINE][NEWLINE]• Gains +7 [ICON_Strength]Combat Strength against units with stronger base strength.[NEWLINE]• Once the technology "Castles" has been researched, it gains +4 [ICON_Strength]Combat Strength.'),
	
	('en_US',	'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_NAME',           null,	    null,   'Vytis'),
	('en_US',	'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_DESCRIPTION',    null,	    null,   'A unique land unit'),
	
	('en_US',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_NAME',                  null,	    null,   'Defiance'),
	('en_US',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_DESCRIPTION',           null,	    null,   '+7 [ICON_Strength] from Defiance.'),
	('en_US',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_LONG_DESCRIPTION',      null,	    null,   '+7 [ICON_Strength] Combat Strength against a unit with higher [ICON_Strength] Base Combat Strength.'),
    
	('en_US',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_NAME',                   null,	    null,   'Cuirass'),
	('en_US',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_DESCRIPTION',            null,	    null,   '+4 [ICON_Strength] from Cuirass.'),
	('en_US',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_LONG_DESCRIPTION',       null,	    null,   '+4 [ICON_Strength] Combat Strength after "Castles" has been researched.'),



    ('fr_FR',	'LOC_UNIT_RWB_VYTIS_NAME',                              null,	    null,   'Vytis'),
    ('fr_FR',	'LOC_UNIT_RWB_VYTIS_DESCRIPTION',                       null,	    null,   'Unité unique lituanienne de Cavalerie Légère plus puissante que le Cavalier qu''il remplace. Plus cher que le Cavalier qu''il remplace, son entretien en [ICON_Gold] Or est plus haut comparé à celui-ci et ne peut être amélioré qu''en Cavalerie.[NEWLINE][NEWLINE]Gagne +7 [ICON_Strength] Puissance de Combat contre des unités avec une [ICON_Strength] Puissance de Combat plus haute.[NEWLINE]Après avoir recherché la technologie des "Châteaux", gagne +4 [ICON_Strength] Puissance de Combat.'),
    
    ('fr_FR',	'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_NAME',           'masculine',	null,   'Vytis'),
    ('fr_FR',	'LOC_TRAIT_CIVILIZATION_UNIT_RWB_VYTIS_DESCRIPTION',    null,	    null,   'Une unité terrestre unique'),
    
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_NAME',                  null,	    null,   'Défiance'),
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_DESCRIPTION',           null,	    null,   '+7 [ICON_Strength] de Défiance.'),
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_DEFIANCE_LONG_DESCRIPTION',      null,	    null,   '+7 [ICON_Strength] Puissance de Combat contre des unités avec une [ICON_Strength] Puissance de Combat plus haute.'),
    
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_NAME',                   null,	    null,   'Cuirasse'),
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_DESCRIPTION',            null,	    null,   '+4 [ICON_Strength] de Cuirasse.'),
    ('fr_FR',	'LOC_ABILITY_RWB_VYTIS_CUIRASS_LONG_DESCRIPTION',       null,	    null,   '+4 [ICON_Strength] Puissance de Combat après avoir recherché "Châteaux".'),

-----------------------------------------------
-- Mountains
-----------------------------------------------

	('en_US',	'LOC_NAMED_MOUNTAIN_KRYZIU_KALNAS',     	    null,	    null,   'Kryžiu Kalnas'         ),
	('en_US',	'LOC_NAMED_MOUNTAIN_AUKSTOJO_KALNO',        	null,	    null,   'Aukštojo Kalno'        ),
	('en_US',	'LOC_NAMED_MOUNTAIN_MEDININKU_AUKSTUMOS',       null,	    null,   'Medininku Aukštumos'   ),
	('en_US',	'LOC_NAMED_MOUNTAIN_JUOZAPINES_KALNAS',     	null,	    null,   'Juozapines Kalnas'     ),
	('en_US',	'LOC_NAMED_MOUNTAIN_KEPALUSKALINS_KALNAS',      null,	    null,   'Kepaluškalins Kalnas'  ),
	('en_US',	'LOC_NAMED_MOUNTAIN_ZYBARTONIO_KALNAS',     	null,	    null,   'Žybartonio Kalnas'     ),
	('en_US',	'LOC_NAMED_MOUNTAIN_RAMBYNAS_KALNAS',       	null,	    null,   'Rambynas Kalnas'       ),
	('en_US',	'LOC_NAMED_MOUNTAIN_OLANDO_KEPURE',     	    null,	    null,   'Olando Kepure'         ),
	('en_US',	'LOC_NAMED_MOUNTAIN_PLIKASIS_KALNAS',       	null,	    null,   'Plikasis Kalnas'       ),
	('en_US',	'LOC_NAMED_MOUNTAIN_SATRIJA_KALNAS',        	null,	    null,   'Šatrija Kalnas'        ),


-----------------------------------------------
-- Rivers
-----------------------------------------------

	('en_US',	'LOC_NAMED_RIVER_NEMUNO_UPE',       null,	    null,   'Nemuno Upe'       	),
	('en_US',	'LOC_NAMED_RIVER_DUBYSA',           null,	    null,   'Dubysa '          	),
	('en_US',	'LOC_NAMED_RIVER_NERIES_UPE',       null,	    null,   'Neries Upe'       	),
	('en_US',	'LOC_NAMED_RIVER_VENTA_UPE',        null,	    null,   'Venta Upe'        	),
	('en_US',	'LOC_NAMED_RIVER_SESUPE_UPE',       null,	    null,   'Šešupe Upe'       	),
	('en_US',	'LOC_NAMED_RIVER_SVENTOJI_UPE',     null,	    null,   'Šventoji Upe'     	),
	('en_US',	'LOC_NAMED_RIVER_NEVEZIS_UPE',      null,	    null,   'Nevežis Upe'      	),
	('en_US',	'LOC_NAMED_RIVER_MERKYS_UPE',       null,	    null,   'Merkys Upe'       	),
	('en_US',	'LOC_NAMED_RIVER_MINIJA_UPE',       null,	    null,   'Minija Upe'       	),
	('en_US',	'LOC_NAMED_RIVER_NEMUNELIS_UPE',    null,	    null,   'Nemunelis Upe'    	),
	('en_US',	'LOC_NAMED_RIVER_DYSNA_UPE',        null,	    null,   'Dysna Upe'        	),



	
-----------------------------------------------
-- Lakes
-----------------------------------------------

	('en_US',	'LOC_NAMED_LAKE_DRUKSIU_EZERAS',            null,	    null,   'Drūkšiu Ežeras'            ),
	('en_US',	'LOC_NAMED_LAKE_TAURAGNAS_EZERAS',          null,	    null,   'Tauragnas Ežeras'          ),
	('en_US',	'LOC_NAMED_LAKE_ASVEJA_EZERAS',             null,	    null,   'Asveja Ežeras'             ),
	('en_US',	'LOC_NAMED_LAKE_VISTYCIO_EZERAS',           null,	    null,   'Vištyčio Ežeras'           ),
	('en_US',	'LOC_NAMED_LAKE_PLATELIY_EZERAS',           null,	    null,   'Platelių Ežeras'           ),
	('en_US',	'LOC_NAMED_LAKE_DYSNU_EZERAS',              null,	    null,   'Dysnu Ežeras'              ),
	('en_US',	'LOC_NAMED_LAKE_DUSIOS_EZERAS',             null,	    null,   'Dusios Ežeras'             ),
	('en_US',	'LOC_NAMED_LAKE_SARTU_EZERAS',              null,	    null,   'Sartu Ežeras'              ),
	('en_US',	'LOC_NAMED_LAKE_LUODZIO_EZERAS',            null,	    null,   'Luodžio Ežeras'            ),
	('en_US',	'LOC_NAMED_LAKE_METELIO_EZERAS',            null,	    null,   'Metelio Ežeras'            ),
	('en_US',	'LOC_NAMED_LAKE_AVILIO_EZERAS',             null,	    null,   'Avilio Ežeras'             ),
	('en_US',	'LOC_NAMED_LAKE_PLATELIU_EZERAS',           null,	    null,   'Plateliu Ežeras'           ),
	('en_US',	'LOC_NAMED_LAKE_REKYVOS_EZERAS',            null,	    null,   'Rekyvos Ežeras'            ),


-----------------------------------------------
-- Seas
-----------------------------------------------
    
    ('en_US',	'LOC_NAMED_SEAS_BALTIJOS_JURA',             null,	    null,   'Baltijos Jūra'            ),

-----------------------------------------------
-- Deserts
-----------------------------------------------

-----------------------------------------------
-- Volcanoes
-----------------------------------------------

-----------------------------------------------
-- Cities
-----------------------------------------------

    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_1',                              null,	    null,   'Trakai'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_2',                              null,	    null,   'Kernave'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_3',                              null,	    null,   'Vilnius'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_4',                              null,	    null,   'Voruta'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_5',                              null,	    null,   'Varniai'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_6',                              null,	    null,   'Brest-Litovsk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_7',                              null,	    null,   'Klaipėda'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_8',                              null,	    null,   'Gardinas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_9',                              null,	    null,   'Polatsk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_10',                             null,	    null,   'Kaunas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_11',                             null,	    null,   'Šiauliai'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_12',                             null,	    null,   'Orsha'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_13',                             null,	    null,   'Jurbarkas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_14',                             null,	    null,   'Visaginas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_15',                             null,	    null,   'Pskov'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_16',                             null,	    null,   'Polotsk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_17',                             null,	    null,   'Grunwald'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_18',                             null,	    null,   'Lutsk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_19',                             null,	    null,   'Minskas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_20',                             null,	    null,   'Mstislavlis'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_21',                             null,	    null,   'Naugardukas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_22',                             null,	    null,   'Raseiniai'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_23',                             null,	    null,   'Vitebsk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_24',                             null,	    null,   'Skirsnemunė'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_25',                             null,	    null,   'Astravas'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_26',                             null,	    null,   'Marijampolė'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_27',                             null,	    null,   'Smolensk'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_28',                             null,	    null,   'Daugavpils'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_29',                             null,	    null,   'Pilėnai'),
    ('en_US',	'LOC_CITY_NAME_RWB_LITHUANIA_30',                             null,	    null,   'Alytus'),


    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_1',                              'feminine',	null,   'Trakai'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_2',                              'feminine',	null,   'Kernavė'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_3',                              'feminine',	null,   'Vilnius'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_4',                              'feminine',	null,   'Voruta'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_5',                              'feminine',	null,   'Varniai'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_6',                              'feminine',	null,   'Brest-Litovsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_7',                              'feminine',	null,   'Klaipėda'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_8',                              'feminine',	null,   'Gardinas'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_9',                              'feminine',	null,   'Polatsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_10',                             'feminine',	null,   'Kaunas'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_11',                             'feminine',	null,   'Šiauliai'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_12',                             'feminine',	null,   'Orcha'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_13',                             'feminine',	null,   'Jurbarkas'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_14',                             'feminine',	null,   'Visaginas'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_15',                             'feminine',	null,   'Pskov'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_16',                             'feminine',	null,   'Polotsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_17',                             'feminine',	null,   'Grunwald'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_18',                             'feminine',	null,   'Loutsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_19',                             'feminine',	null,   'Minsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_20',                             'feminine',	null,   'Mstislav'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_21',                             'feminine',	null,   'Navahroudak'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_22',                             'feminine',	null,   'Raseiniai'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_23',                             'feminine',	null,   'Vitebsk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_24',                             'feminine',	null,   'Skirsnemunė'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_25',                             'feminine',	null,   'Astravas'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_26',                             'feminine',	null,   'Mariampolé'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_27',                             'feminine',	null,   'Smolensk'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_28',                             'feminine',	null,   'Daugavpils'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_29',                             'feminine',	null,   'Pilėnai'),
    ('fr_FR',	'LOC_CITY_NAME_RWB_LITHUANIA_30',                             'feminine',	null,   'Olita'),
    
-----------------------------------------------
-- Citizens
-----------------------------------------------
	
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_1',                    'masculine',	    null,   'János'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_2',                    'masculine',	    null,   'László'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_3',                    'masculine',	    null,   'Miklós'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_4',                    'masculine',	    null,   'Péter'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_5',                    'masculine',	    null,   'István'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_6',                    'masculine',	    null,   'György'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_7',                    'masculine',	    null,   'Jakab'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_8',                    'masculine',	    null,   'András'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_9',                    'masculine',	    null,   'Mihály'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MALE_10',                   'masculine',	    null,   'Žydrūnas'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_1',             'masculine',	    null,   'Filip'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_2',             'masculine',	    null,   'Jurgis'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_3',             'masculine',	    null,   'Ramunas'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_4',             'masculine',	    null,   'Matis'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_5',             'masculine',	    null,   'Simas'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_6',             'masculine',	    null,   'Moze'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_7',             'masculine',	    null,   'Nojus'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_8',             'masculine',	    null,   'Ramus'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_9',             'masculine',	    null,   'Péter'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_MALE_10',            'masculine',	    null,   'Domantas'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_1',                  'feminine',	    null,   'Anna'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_2',                  'feminine',	    null,   'Katalin'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_3',                  'feminine',	    null,   'Borbála'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_4',                  'feminine',	    null,   'Erzsébet'),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_5',                  'feminine',	    null,   'Margaréta'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_6',                  'feminine',	    null,   'Zsófia'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_7',                  'feminine',	    null,   'Józsa'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_8',                  'feminine',	    null,   'Ilona'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_9',                  'feminine',	    null,   'Dorottya'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_FEMALE_10',                 'feminine',	    null,   'Orsolya'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_1',           'feminine',	    null,   'Klára'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_2',           'feminine',	    null,   'Sára'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_3',           'feminine',	    null,   'Heléna'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_4',           'feminine',	    null,   'Agáta'),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_5',           'feminine',	    null,   'Krisztina'		),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_6',           'feminine',	    null,   'Zsuzsanna'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_7',           'feminine',	    null,   'Janina'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_8',           'feminine',	    null,   'Katherina'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_9',           'feminine',	    null,   'Barbara'	),
	('en_US',	'LOC_CITIZEN_RWB_LITHUANIA_MODERN_FEMALE_10',          'feminine',	    null,   'Ade'	),
	
-----------------------------------------------
-- Info
-----------------------------------------------

	('en_US',	'LOC_CIVINFO_RWB_LITHUANIA_LOCATION',                         null,	    null,   'Northeastern Europe'		),
	('en_US',	'LOC_CIVINFO_RWB_LITHUANIA_SIZE',                             null,	    null,   '930,000 km² at its largest'	),
	('en_US',	'LOC_CIVINFO_RWB_LITHUANIA_POPULATION',                       null,	    null,   'c. 2.5 million under the Grand Duchy at its highest'		),
	('en_US',	'LOC_CIVINFO_RWB_LITHUANIA_CAPITAL',                          null,	    null,   '3 key ones: Kernave, Trakai and currently Vilnius'		),

	('fr_FR',	'LOC_CIVINFO_RWB_LITHUANIA_LOCATION',                         null,	    null,   'Europe du Nord-Est'		),
	('fr_FR',	'LOC_CIVINFO_RWB_LITHUANIA_SIZE',                             null,	    null,   '930,000 km² à son plus large'	),
	('fr_FR',	'LOC_CIVINFO_RWB_LITHUANIA_POPULATION',                       null,	    null,   'Env. 2.5 millions sous le Grand-Duché à son apogée'		),
	('fr_FR',	'LOC_CIVINFO_RWB_LITHUANIA_CAPITAL',                          null,	    null,   '3 principales : Kernavė, Trakai et actuellement Vilnius'		),

-----------------------------------------------
-- Civilopedia
-----------------------------------------------

	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'Founded in the 13th century amidst the vast floodplains and dense forests of Eastern Europe, the Grand Duchy of Lithuania arose as a haven of resilience and cultural synthesis. Emerging from a coalition of Baltic tribes, the Grand Duchy was forged under the leadership of Mindaugas, who unified disparate groups into a cohesive polity and became its first and only crowned king in 1253. Despite his assassination a decade later, Lithuania''s foundations as a powerful pagan state were firmly laid.'),	
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_2',                             null,	    null,   'Strategically located on lands rich in rivers and wetlands, Lithuania’s heartland functioned much like a vast floodplain, offering both sustenance and defense. These lands nurtured an agrarian society steeped in the traditions of the dievdirbiai (literally "god-carvers"), skilled artisans who shaped wooden idols and religious artifacts. Their work reflected the spiritual duality of a realm at the crossroads of paganism and Christianity. Paganism, deeply rooted in nature worship and ancestral reverence, clashed with the encroaching influence of Catholic Europe, setting the stage for centuries of religious and cultural conflict.'),	
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_3',                             null,	    null,   'The Catholic-Pagan divide defined much of Lithuania’s early history. While neighboring Poland and the Teutonic Order pressed for the Christianization of the Grand Duchy, Lithuania remained a bastion of pagan traditions until the Union of Krewo (1385), when Grand Duke Jogaila accepted baptism and married Queen Jadwiga of Poland, uniting the two realms into a personal union. This act led to the formation of the Polish-Lithuanian Commonwealth in 1569, a dual state that would become one of Europe’s most powerful and culturally diverse entities.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_4',                             null,	    null,   'The expansionist ambitions of Lithuania brought it to its zenith in the 15th century under Vytautas the Great, who led campaigns that stretched the Grand Duchy’s borders from the Baltic to the Black Sea. This vast dominion, encompassing modern-day Belarus, Ukraine, parts of Poland, and Russia, was home to an astonishing mosaic of peoples: Lithuanians, Ruthenians, Poles, Tatars, and Jews, among others. Despite these successes, the Grand Duchy was constantly besieged by powerful neighbors—the Mongols from the east, the Teutonic Order from the west, and the burgeoning powers of Muscovy.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_5',                             null,	    null,   'Diplomacy often proved as vital as the sword. The Grand Duchy maintained a delicate balance of autonomy and collaboration within the Commonwealth, where its nobility wielded considerable influence. Yet, this autonomy was not without friction, as the Lithuanian elite resisted Polonization efforts while adopting elements of Western European governance and culture.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_6',                             null,	    null,   'Within its borders, Lithuania nurtured a unique legal and cultural identity. The Statutes of Lithuania, codified in the 16th century, were among the most progressive legal codes of their time, blending customary law with innovations inspired by European legal traditions. At the same time, the floodplains that defined much of Lithuania’s geography supported vast agricultural enterprises and trade networks along its rivers, such as the Nemunas and the Dnieper.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_7',                             null,	    null,   'Religious tolerance marked another defining feature of the Grand Duchy, especially under the Commonwealth. Although Catholicism became the dominant religion, Lithuania allowed significant freedom to its Orthodox, Protestant, and Jewish communities, making cities like Vilnius thriving hubs of multicultural exchange. However, this pluralism occasionally ignited tensions, particularly during the Counter-Reformation and the rise of the Russian Orthodox influence.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_8',                             null,	    null,   'The Grand Duchy’s decline began in the late 17th century, as internal strife and external pressures eroded its power. The Commonwealth suffered partitioning by neighboring powers—Prussia, Austria, and Russia—until the Grand Duchy was subsumed into the Russian Empire in 1795, marking the end of its independence. Yet, the spirit of Lithuania endured through its language, folklore, and a persistent yearning for sovereignty, which would eventually be realized in the 20th century.'),
	('en_US',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_9',                             null,	    null,   'Today, the Grand Duchy of Lithuania is remembered as a realm of remarkable adaptability and cultural fusion, whose legacy shaped not only the Baltic states but the broader history of Eastern Europe. Its blend of pagan and Christian traditions, diplomatic ingenuity, and legal innovation ensured its place as a unique and enduring civilization.'),


	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'Fondé au XIIIe siècle au cœur des vastes plaines inondables et des denses forêts d’Europe de l’Est, le Grand-Duché de Lituanie s’est affirmé comme un havre de résilience et de synthèse culturelle. Issu d’une coalition de tribus baltes, le Grand-Duché fut forgé sous la direction de Mindaugas, qui unifia des groupes disparates en une entité politique cohérente et devint son premier et unique roi couronné en 1253. Bien qu’assassiné une décennie plus tard, les bases d’un puissant État païen furent solidement établies.'),	
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_2',                             null,	    null,   'Situé stratégiquement sur des terres riches en rivières et en zones humides, le cœur de la Lituanie fonctionnait comme une vaste plaine inondable, offrant à la fois subsistance et défense. Ces terres nourrissaient une société agraire imprégnée des traditions des dievdirbiai (littéralement « sculpteurs de dieux »), artisans talentueux qui créaient des idoles en bois et des artefacts religieux. Leur travail reflétait la dualité spirituelle d’un royaume à la croisée du paganisme et du christianisme. Le paganisme, profondément enraciné dans le culte de la nature et la vénération des ancêtres, entrait en conflit avec l’influence croissante de l’Europe catholique, préparant le terrain pour des siècles de conflits religieux et culturels.'),	
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_3',                             null,	    null,   'La division catholique-païenne marqua une grande partie de l’histoire précoce de la Lituanie. Alors que la Pologne voisine et l’Ordre Teutonique faisaient pression pour la christianisation du Grand-Duché, la Lituanie resta un bastion des traditions païennes jusqu’à l’Union de Krewo (1385), lorsque le grand-duc Jogaila accepta le baptême et épousa la reine Jadwiga de Pologne, unissant les deux royaumes par une union personnelle. Cet acte aboutit à la formation de la République des Deux Nations en 1569, un État dual qui devint l’une des entités les plus puissantes et culturellement diversifiées d’Europe.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_4',                             null,	    null,   'Les ambitions expansionnistes de la Lituanie atteignirent leur apogée au XVe siècle sous Vytautas le Grand, qui mena des campagnes étendant les frontières du Grand-Duché de la Baltique à la mer Noire. Ce vaste territoire, englobant les territoires actuels de la Biélorussie, de l’Ukraine, ainsi que des parties de la Pologne et de la Russie, abritait une mosaïque étonnante de peuples : Lituaniens, Ruthènes, Polonais, Tatars et Juifs, entre autres. Malgré ces succès, le Grand-Duché fut constamment assiégé par de puissants voisins : les Mongols à l’est, l’Ordre Teutonique à l’ouest, et les puissances montantes de Moscou.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_5',                             null,	    null,   'La diplomatie se révéla souvent aussi vitale que l’épée. Le Grand-Duché maintint un équilibre délicat entre autonomie et collaboration au sein de la République des Deux Nations, où sa noblesse exerçait une influence considérable. Pourtant, cette autonomie n’était pas sans tensions, alors que l’élite lituanienne résistait aux tentatives de polonisation tout en adoptant certains éléments de la gouvernance et de la culture de l’Europe occidentale.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_6',                             null,	    null,   'La tolérance religieuse était une autre caractéristique marquante du Grand-Duché, notamment sous la République. Bien que le catholicisme soit devenu la religion dominante, la Lituanie accorda une liberté significative à ses communautés orthodoxes, protestantes et juives, faisant de villes comme Vilnius des centres florissants d’échange multiculturel. Cependant, ce pluralisme provoqua parfois des tensions, en particulier durant la Contre-Réforme et avec l’essor de l’influence orthodoxe russe.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_7',                             null,	    null,   'À l’intérieur de ses frontières, la Lituanie développa une identité juridique et culturelle unique. Les Statuts de Lituanie, codifiés au XVIe siècle, comptaient parmi les codes juridiques les plus progressistes de leur époque, mêlant droit coutumier et innovations inspirées des traditions juridiques européennes. Parallèlement, les plaines inondables qui caractérisaient une grande partie de la géographie lituanienne soutenaient d’importantes entreprises agricoles et des réseaux commerciaux le long de ses rivières, comme le Niémen et le Dniepr.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_8',                             null,	    null,   'Le déclin du Grand-Duché commença à la fin du XVIIe siècle, alors que les conflits internes et les pressions externes érodèrent son pouvoir. La République subit les partages orchestrés par des puissances voisines — la Prusse, l’Autriche et la Russie — jusqu’à ce que le Grand-Duché soit absorbé par l’Empire russe en 1795, marquant la fin de son indépendance. Pourtant, l’esprit de la Lituanie survécut à travers sa langue, son folklore et un désir persistant de souveraineté, qui fut finalement réalisé au XXe siècle.'),
	('fr_FR',	'LOC_PEDIA_CIVILIZATIONS_PAGE_CIVILIZATION_RWB_LITHUANIA_CHAPTER_HISTORY_PARA_9',                             null,	    null,   'Aujourd’hui, le Grand-Duché de Lituanie est rappelé comme un royaume d’une remarquable adaptabilité et fusion culturelle, dont l’héritage a façonné non seulement les États baltes, mais aussi l’histoire plus large de l’Europe de l’Est. Son mélange de traditions païennes et chrétiennes, son ingéniosité diplomatique et son innovation juridique ont assuré sa place comme une civilisation unique et durable.'),

	-----------------------------------------------
-- Unique Unit Civilopedia Entry
-----------------------------------------------

	('en_US',	'LOC_PEDIA_UNITS_PAGE_UNIT_RWB_VYTIS_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'The Vytis, named after the iconic knight symbol of Lithuania, embodied the ideals of protection, resilience, and unity that defined the Grand Duchy’s rise. Mounted on swift warhorses and clad in armor, these soldiers patrolled the vast plains and dense forests, safeguarding trade routes and defending settlements from invaders such as the Teutonic Knights. Their presence brought security to the land, making it appealing for communities to settle and thrive. Beyond their martial prowess, Vytis soldiers symbolized the courage and determination of a people uniting under a shared banner, their victories ensuring not only the survival but the flourishing of Lithuanian culture and society.'	),

	('fr_FR',	'LOC_PEDIA_UNITS_PAGE_UNIT_RWB_VYTIS_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'Les Vytis, nommés d''après l''emblématique chevalier symbole de la Lituanie, incarnaient les idéaux de protection, de résilience et d''unité qui ont marqué l''essor du Grand-Duché. Montés sur des chevaux rapides et vêtus d''armures, ces soldats parcouraient les vastes plaines et les denses forêts, protégeant les routes commerciales et défendant les villages contre des envahisseurs tels que les chevaliers teutoniques. Leur présence apportait une sécurité précieuse au territoire, rendant celui-ci attrayant pour les communautés en quête de stabilité et de prospérité. Au-delà de leur prouesse martiale, les Vytis symbolisaient le courage et la détermination d''un peuple uni sous une bannière commune, leurs victoires garantissant non seulement la survie mais également l’épanouissement de la culture et de la société lituaniennes.'	),



	('en_US',	'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_RWB_PILIAKALNIS_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'The Piliakalniai, or hillforts, were fortified strongholds that shaped the land into havens of both protection and prosperity for Baltic tribes. Strategically positioned on elevated terrain near fertile floodplains and abundant rivers, these sites safeguarded their inhabitants from raiders while fostering agriculture and food security. The surrounding lands, enriched by the proximity to the hillforts, became appealing for settlement, with granaries storing harvests and communal feasts celebrating the bounty of the earth. By offering safety, sustenance, and a sense of belonging, piliakalniai transformed wild landscapes into thriving centers of life, attracting and protecting populations.'	),

	('fr_FR',	'LOC_PEDIA_DISTRICTS_PAGE_DISTRICT_RWB_PILIAKALNIS_CHAPTER_HISTORY_PARA_1',                             null,	    null,   'Les Piliakalniai, ou collines fortifiées, étaient des bastions fortifiés qui transformaient le territoire en refuges de protection et de prospérité pour les tribus baltes. Stratégiquement situés sur des terrains élevés à proximité de plaines fertiles et de rivières abondantes, ces sites protégeaient leurs habitants des pillards tout en favorisant l’agriculture et la sécurité alimentaire. Les terres environnantes, enrichies par la proximité de ces collines, devenaient attrayantes pour l’établissement de nouvelles communautés, avec des greniers à grains préservant les récoltes et des festins communautaires célébrant l''abondance de la nature. En offrant sécurité, subsistance et un sentiment d’appartenance, les piliakalniai transformaient les paysages sauvages en centres de vie florissants, attirant et protégeant les populations.'	);