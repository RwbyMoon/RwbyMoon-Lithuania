-----------------------------------------------	
-- Types
-----------------------------------------------	

INSERT INTO Types
            (Type,								Kind)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		'KIND_DISTRICT');

-----------------------------------------------	
-- Districts
-----------------------------------------------	

INSERT INTO Districts
            (DistrictType,
             Name,
             Description,
             PrereqCivic,
             PlunderType,
             PlunderAmount,
             AdvisorType,
             Cost,
             CostProgressionModel,
             CostProgressionParam1,
             Maintenance,
             RequiresPlacement,
             RequiresPopulation,
             Aqueduct,
             NoAdjacentCity,
             InternalOnly,
             ZOC,
             CaptureRemovesBuildings,
             CaptureRemovesCityDefenses,
             CaptureRemovesDistrict,
             MilitaryDomain,
             CityStrengthModifier,
             TraitType,
             MaxPerPlayer)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',
             'LOC_DISTRICT_RWB_PILIAKALNIS_NAME',
             'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION',
             'CIVIC_MYSTICISM',
             'PLUNDER_GOLD',
             '50',
             'ADVISOR_RELIGIOUS',
             '27',
             'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH',
             '25',
             '1',
             'true',
             'true',
             'false',
             'true',
             'false',
             'false',
             'false',
             'false',
             'true',
             'NO_DOMAIN',
             '2',
             'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS',
             '-1');

-----------------------------------------------	
-- DistrictReplaces
-----------------------------------------------	

INSERT INTO DistrictReplaces
(CivUniqueDistrictType,								ReplacesDistrictType)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		                'DISTRICT_PRESERVE');


-----------------------------------------------	
-- District_Adjacencies
-----------------------------------------------	

/*INSERT INTO District_Adjacencies
            (DistrictType,								        YieldChangeId)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		                'DISTRICT_PRESERVE');*/

-----------------------------------------------	
-- District_GreatPersonPoints
-----------------------------------------------	

/*INSERT INTO District_GreatPersonPoints
            (DistrictType,								        GreatPersonClassType,           PointsPerTurn)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		                'GREAT_PERSON_CLASS_MERCHANT',  1);*/

-----------------------------------------------	
-- District_TradeRouteYields
-----------------------------------------------	

INSERT INTO District_TradeRouteYields
            (DistrictType,							YieldType,           YieldChangeAsOrigin,        YieldChangeAsDomesticDestination,      YieldChangeAsInternationalDestination)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		    'YIELD_FOOD',        '0',                          '1',                                 '0'),
            ('DISTRICT_RWB_PILIAKALNIS',		    'YIELD_FAITH',       '0',                          '0',                                 '1');

-----------------------------------------------	
-- Adjacency_YieldChanges
-----------------------------------------------	

/*INSERT INTO Adjacency_YieldChanges
            (ID,							Description,                            YieldType,          YieldChange,      TilesRequired,   AdjacentDistrict)
VALUES	    ('Veche_Faith',		            'LOC_DISTRICT_GOVERNMENT_FAITH',        'YIELD_FAITH',      '2',               '1',            'DISTRICT_RWB_PILIAKALNIS'),
            ('Veche_Gold',		            'LOC_DISTRICT_GOVERNMENT_GOLD',         'YIELD_GOLD',       '2',               '1',            'DISTRICT_RWB_PILIAKALNIS'),
            ('Veche_Production',		    'LOC_DISTRICT_GOVERNMENT_PRODUCTION',   'YIELD_PRODUCTION', '1',               '1',            'DISTRICT_RWB_PILIAKALNIS'),
            ('Veche_Science',		        'LOC_DISTRICT_GOVERNMENT_SCIENCE',      'YIELD_SCIENCE',    '1',               '1',            'DISTRICT_RWB_PILIAKALNIS'),;*/

-----------------------------------------------	
-- DistrictModifiers
-----------------------------------------------	

/*INSERT INTO DistrictModifiers
                (DistrictType,								        ModifierId)
VALUES	        ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD1'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD3'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD5'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD7'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD9'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD11'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD13'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD15'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD17'),
                ('DISTRICT_RWB_PILIAKALNIS',		                'RWB_PILIAKALNIS_FAITH_YIELD19');

INSERT INTO DistrictModifiers
SELECT a.DistrictType, b.ModifierId FROM Districts a, DistrictModifiers b
WHERE a.TraitType IS NULL AND b.DistrictType = 'DISTRICT_RWB_PILIAKALNIS';*/
  


INSERT INTO DistrictModifiers 
                    (DistrictType,                  ModifierId)
VALUES              ('DISTRICT_RWB_PILIAKALNIS',  'RWB_PILIAKALNIS_FAITH_YIELD1');



/*SELECT DISTINCT DistrictType FROM DistrictModifiers*/

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

INSERT INTO Modifiers
            (ModifierId,						ModifierType,                                           Permanent,			    SubjectRequirementSetId)
VALUES	    ('RWB_PILIAKALNIS_FAITH_YIELD1',	'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',    'false',                'REQSET_RWB_VYTAUTAS_PILIAKALNIS1');

-----------------------------------------------	
-- GameModifiers
-----------------------------------------------	

INSERT INTO GameModifiers
            (ModifierId)
VALUES	    ('MER_VECHE_GRANT_PLAYER_GOVERNOR_POINTS');

-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	

INSERT INTO ModifierArguments
            (ModifierId,					            Name,                           Value)
VALUES	    ('RWB_PILIAKALNIS_FAITH_YIELD1',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_FAITH_YIELD1',	        'Amount',                       '1');

-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	

INSERT INTO RequirementSets
            (RequirementSetId,                          RequirementSetType)
VALUES	    ('REQSET_RWB_VYTAUTAS_PILIAKALNIS1',        'REQUIREMENTSET_TEST_ALL');


-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	

INSERT INTO RequirementSetRequirements
                (RequirementSetId,								             RequirementId)
VALUES	        ('REQSET_RWB_VYTAUTAS_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_ADJ_TO_OWNER'),
                ('REQSET_RWB_VYTAUTAS_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_IS_PILIAKALNIS'),
                ('REQSET_RWB_VYTAUTAS_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_VYTAUTAS_PLAYER'),
                ('REQSET_RWB_VYTAUTAS_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE');
	
-----------------------------------------------	
-- Requirements
-----------------------------------------------	

INSERT INTO Requirements
                (RequirementId,								             RequirementType)
VALUES	        ('RWB_VYTAUTAS_REQUIRES_IS_PILIAKALNIS',		         'REQUIREMENT_DISTRICT_TYPE_MATCHES'),
                ('RWB_VYTAUTAS_REQUIRES_ADJ_TO_OWNER',		             'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'),
                ('RWB_VYTAUTAS_REQUIRES_VYTAUTAS_PLAYER',		         'REQUIREMENT_PLAYER_OWNS_OBJECT'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE',		         'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN');

-----------------------------------------------	
-- RequirementArguments
-----------------------------------------------	

INSERT INTO RequirementArguments
                (RequirementId,								             Name,                                  Value)
VALUES	        ('RWB_VYTAUTAS_REQUIRES_IS_PILIAKALNIS',		         'DistrictType',                        'DISTRICT_RWB_PILIAKALNIS'),
                ('RWB_VYTAUTAS_REQUIRES_ADJ_TO_OWNER',		             'MinDistance',                         '0'),
                ('RWB_VYTAUTAS_REQUIRES_ADJ_TO_OWNER',		             'MaxDistance',                         '1'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE',		         'MinimumAppeal',                       '1');