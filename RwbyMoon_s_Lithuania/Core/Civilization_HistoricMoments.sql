-----------------------------------------------
-- Moment Illustrations
-----------------------------------------------
CREATE TABLE IF NOT EXISTS MomentIllustrations
(
    MomentIllustrationType TEXT,
    MomentDataType TEXT,
    GameDataType TEXT,
    Texture TEXT
);

INSERT OR IGNORE INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,							GameDataType,					Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',						'UNIT_RWB_VYTIS',				'VytisHistoricMoment.dds'),
		('MOMENT_ILLUSTRATION_UNIQUE_DISTRICT',		'MOMENT_DATA_DISTRICT',					'DISTRICT_RWB_PILIAKALNIS',		'PiliakalnisHistoricMoment.dds');
