--==========================================================================================================================
-- DELIVERATOR MOAR UNITS (8342b98d-80c7-4002-87bb-419646bd9b54)
-- DELIVERATOR MOAR UNITS (CORE ONLY) (860265f1-73df-47d9-b5dc-c9cdc6b1489a)
--==========================================================================================================================
--==========================================================================================================================
-- GEDEMON YNAEMP (36e88483-48fe-4545-b85f-bafc50dde315)
--==========================================================================================================================
-- StartPosition 
------------------------------------------------------------	

CREATE TABLE IF NOT EXISTS StartPosition (MapName TEXT, Civilization TEXT, Leader TEXT, X INT default 0, Y INT default 0);

INSERT INTO StartPosition
        (Civilization,                 Leader,                MapName,            X,        Y)
VALUES  ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'GiantEarth',        29,        75),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'FiraxisTSL',        43,        47),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'FiraxisTSL_Europe',        47,        30),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'GreatestEarthMap',    56,        57),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'PlayEuropeAgain',    61,        65),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'LargestEarthCustom',    37,        93),
        ('CIVILIZATION_RWB_LITHUANIA',    'LEADER_RWB_VYTAUTAS',        'LargeEurope',    47,        56);
