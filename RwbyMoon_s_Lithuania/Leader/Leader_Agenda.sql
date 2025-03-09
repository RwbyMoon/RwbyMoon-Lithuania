-----------------------------------------------
-- Types
-----------------------------------------------

INSERT OR IGNORE INTO Types
			(Type,							Kind			)
VALUES		('TRAIT_AGENDA_RWB_VYTAUTAS',		'KIND_TRAIT'	);


INSERT OR IGNORE INTO Agendas
			(AgendaType,			Name,							Description								)
VALUES 		('AGENDA_RWB_VYTAUTAS',	'LOC_AGENDA_RWB_VYTAUTAS_NAME',	'LOC_AGENDA_RWB_VYTAUTAS_DESCRIPTION'		);


INSERT OR IGNORE INTO Traits				
			(TraitType,						Name,							Description								)
VALUES		('TRAIT_AGENDA_RWB_VYTAUTAS',		'LOC_AGENDA_RWB_VYTAUTAS_NAME',	'LOC_AGENDA_RWB_VYTAUTAS_DESCRIPTION'		);

-----------------------------------------------
-- AgendaTraits
-----------------------------------------------

INSERT OR IGNORE INTO AgendaTraits
			(AgendaType,			TraitType					)
VALUES 		('AGENDA_RWB_VYTAUTAS',	'TRAIT_AGENDA_RWB_VYTAUTAS'	);

-----------------------------------------------
-- HistoricalAgendas
-----------------------------------------------

INSERT OR IGNORE INTO HistoricalAgendas
			(LeaderType,			AgendaType				)
VALUES 		('LEADER_RWB_VYTAUTAS',	'AGENDA_RWB_VYTAUTAS'		);

-----------------------------------------------
-- ExclusiveAgendas
-----------------------------------------------

INSERT OR IGNORE INTO ExclusiveAgendas
			(AgendaOne,				AgendaTwo					)
VALUES 		('AGENDA_RWB_VYTAUTAS',	'AGENDA_INDUSTRIALIST'		);

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------

INSERT OR IGNORE INTO TraitModifiers
			(TraitType,						ModifierId								)
VALUES		('TRAIT_AGENDA_RWB_VYTAUTAS',		'AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY'	),
			('TRAIT_AGENDA_RWB_VYTAUTAS',		'AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY'		);
		
-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT OR IGNORE INTO Modifiers	
			(ModifierId,								ModifierType,									SubjectRequirementSetId			)
VALUES		('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_RWB_VYTAUTAS_UNHAPPY'		),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_RWB_VYTAUTAS_HAPPY'		);

-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT OR IGNORE INTO ModifierStrings
			(ModifierId,								Context,	Text								)
VALUES		('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',		'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------

INSERT OR IGNORE INTO ModifierArguments
			(ModifierId,							Name,							Value												)
VALUES		('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'InitialValue',					-5													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'IncrementValue',				-1													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'IncrementTurns',				-10													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'MaxValue',						-25													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'StatementKey',					'LOC_DIPLO_WARNING_LEADER_RWB_VYTAUTAS_REASON_ANY'	),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_UNHAPPY',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_UNHAPPY'				),
	
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'InitialValue',					5													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'IncrementValue',				1													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'IncrementTurns',				10													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'MaxValue',						12													),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'StatementKey',					'LOC_DIPLO_KUDO_LEADER_RWB_VYTAUTAS_REASON_ANY'		),
			('AGENDA_MODIFIER_RWB_VYTAUTAS_HAPPY',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_RWB_VYTAUTAS_HAPPY'				);
			
-----------------------------------------------
-- RequirementSets
-----------------------------------------------

INSERT OR IGNORE INTO RequirementSets
			(RequirementSetId,				    RequirementSetType			)
VALUES		('REQSET_RWB_VYTAUTAS_UNHAPPY',	    'REQUIREMENTSET_TEST_ALL'	),
			('REQSET_RWB_VYTAUTAS_HAPPY',		'REQUIREMENTSET_TEST_ALL'	);

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------

INSERT OR IGNORE INTO RequirementSetRequirements
			(RequirementSetId,				    RequirementId						)
VALUES		('REQSET_RWB_VYTAUTAS_UNHAPPY',	    'REQUIRES_MAJOR_CIV_OPPONENT'		),
			('REQSET_RWB_VYTAUTAS_UNHAPPY',	    'REQUIRES_MET_10_TURNS_AGO'			),
			('REQSET_RWB_VYTAUTAS_UNHAPPY',	    'REQUIRES_HAS_LOW_FAITH'			),
			('REQSET_RWB_VYTAUTAS_HAPPY',		'REQUIRES_MAJOR_CIV_OPPONENT'		),
			('REQSET_RWB_VYTAUTAS_HAPPY',		'REQUIRES_MET_10_TURNS_AGO'			),
			('REQSET_RWB_VYTAUTAS_HAPPY',		'REQUIRES_HAS_HIGH_CULTURE'			),
			('REQSET_RWB_VYTAUTAS_HAPPY',		'REQUIRES_HAS_HIGH_SCIENCE'			);
