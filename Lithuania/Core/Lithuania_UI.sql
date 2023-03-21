-----------------------------------------------	
-- Types
-----------------------------------------------	


INSERT INTO Types
            (Type,								            Kind)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		            'KIND_DISTRICT'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD1',		'KIND_MODIFIER'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD3',		'KIND_MODIFIER'),
            ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD5',		'KIND_MODIFIER');

-----------------------------------------------	
-- Districts
-----------------------------------------------	

INSERT INTO Districts
(
    DistrictType,
    Name,
    Description,

    TraitType,
    PrereqTech,
    PrereqCivic,

    Cost,
    CostProgressionModel,
    CostProgressionParam1,
    Maintenance,

    HitPoints,

    Appeal,
    CityStrengthModifier,

    PlunderType,
    PlunderAmount,
    CaptureRemovesDistrict,
    CaptureRemovesBuildings,
    CaptureRemovesCityDefenses,

    AdvisorType,

    RequiresPlacement,
    RequiresPopulation,

    Aqueduct,
    NoAdjacentCity,
    InternalOnly,
    ZOC,
    MilitaryDomain
)
SELECT
    'DISTRICT_RWB_PILIAKALNIS', -- DistrictType
    'LOC_DISTRICT_RWB_PILIAKALNIS_NAME', -- Name
    'LOC_DISTRICT_RWB_PILIAKALNIS_DESCRIPTION', -- Description

    'TRAIT_CIVILIZATION_DISTRICT_RWB_PILIAKALNIS', -- TraitType
    PrereqTech, -- PrereqTech
    PrereqCivic, -- PrereqCivic

    Cost/'2', -- Cost
    CostProgressionModel, -- CostProgressionModel
    CostProgressionParam1, -- CostProgressionParam1
    Maintenance, -- Maintenance

    HitPoints, -- HitPoints

    '1', -- Appeal
    CityStrengthModifier, -- CityStrengthModifier

    PlunderType, -- PlunderType
    PlunderAmount, -- PlunderAmount
    CaptureRemovesDistrict, -- CaptureRemovesDistrict
    CaptureRemovesBuildings, -- CaptureRemovesBuildings
    CaptureRemovesCityDefenses, -- CaptureRemovesCityDefenses

    AdvisorType, -- AdvisorType

    RequiresPlacement, -- RequiresPlacement
    RequiresPopulation, -- RequiresPopulation

    Aqueduct, -- Aqueduct
    NoAdjacentCity, -- NoAdjacentCity
    InternalOnly, -- InternalOnly
    ZOC, -- ZOC
    MilitaryDomain -- MilitaryDomain
FROM Districts WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- DistrictReplaces
-----------------------------------------------	

INSERT INTO DistrictReplaces
			(CivUniqueDistrictType,								ReplacesDistrictType)
VALUES	    ('DISTRICT_RWB_PILIAKALNIS',		                'DISTRICT_PRESERVE');

-- Preserve Buildings require the replacement to be added in Adjacent_AppealYieldChanges for their tile bonuses to work

INSERT INTO Adjacent_AppealYieldChanges
			(DistrictType, 
			 YieldType, 
			 MaximumValue, 
			 BuildingType, 
			 MinimumValue, 
			 YieldChange, 
			 Description, 
			 Unimproved)

SELECT	    'DISTRICT_RWB_PILIAKALNIS', 
             YieldType, 
             MaximumValue, 
             BuildingType, 
             MinimumValue, 
             YieldChange, 
             Description, 
             Unimproved
FROM Adjacent_AppealYieldChanges WHERE DistrictType = 'DISTRICT_PRESERVE';



-----------------------------------------------	
-- District_Adjacencies
-----------------------------------------------	

INSERT INTO District_Adjacencies
            (DistrictType,
            YieldChangeId)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',
            YieldChangeId
FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- District_GreatPersonPoints
-----------------------------------------------	

INSERT INTO District_GreatPersonPoints
            (DistrictType,
            GreatPersonClassType,
            PointsPerTurn)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',
              GreatPersonClassType,
              PointsPerTurn
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- District_TradeRouteYields
-----------------------------------------------	

INSERT INTO District_TradeRouteYields
            (DistrictType,							
             YieldType,           
             YieldChangeAsOrigin,        
             YieldChangeAsDomesticDestination,      
             YieldChangeAsInternationalDestination)
SELECT	    'DISTRICT_RWB_PILIAKALNIS',							
            YieldType,           
            YieldChangeAsOrigin,        
            YieldChangeAsDomesticDestination,      
            YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_PRESERVE';

-----------------------------------------------	
-- Adjacency_YieldChanges
-----------------------------------------------	

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	

/*INSERT INTO DynamicModifiers    
    (ModifierType,                                CollectionType,                   EffectType                              )    VALUES
    ('MODIFIER_RWB_PILIAKALNIS_FAITH_YIELD',    'COLLECTION_PLAYER_DISTRICTS',    'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE'    );*/

-----------------------------------------------	
-- TraitModifiers cuz sometimes, fuck.
-----------------------------------------------	

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

--Appeal Yields
INSERT INTO Modifiers
            (ModifierId,						ModifierType,                                           		  SubjectRequirementSetId                )
VALUES	    ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5'),

            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD1',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD3',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3'),
            ('RWB_PILIAKALNIS_OWN_FAITH_YIELD5',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',              'REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5')
            ;

-----------------------------------------------	   
-- DistrictModifiers
-----------------------------------------------	

INSERT INTO DistrictModifiers
                (DistrictType,                  ModifierId)
VALUES          ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD1'),
                ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD3'),
                ('DISTRICT_RWB_PILIAKALNIS',      'RWB_PILIAKALNIS_OWN_FAITH_YIELD5')
                ;


-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	

INSERT INTO ModifierArguments
            (ModifierId,					            Name,                           Value)
VALUES	    ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD1',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD3',	        'Amount',                       '1'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	        'YieldType',                    'YIELD_FAITH'),
            ('RWB_PILIAKALNIS_ADJ_FAITH_YIELD5',	        'Amount',                       '1')
            ;

-----------------------------------------------	
-- For CivAbility of placable on features
-----------------------------------------------	

INSERT INTO	TraitModifiers
(TraitType,											ModifierId								)
VALUES	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS'				),
    	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS'			),
    	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS'				),
    	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS'			),
    	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS'),
    	 ('TRAIT_CIVILIZATION_RWB_DIEVDIRBIAI',		'RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS'	);

INSERT INTO Modifiers
(ModifierId,												                            ModifierType)
VALUES	   ('RWB_DIEVDIRBIAI_ALLOW_WOODS_DISTRICT_RWB_PILIAKALNIS',		                'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
           ('RWB_DIEVDIRBIAI_ALLOW_JUNGLE_DISTRICT_RWB_PILIAKALNIS',		            'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
           ('RWB_DIEVDIRBIAI_ALLOW_MARSH_DISTRICT_RWB_PILIAKALNIS',		                'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
           ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_DISTRICT_RWB_PILIAKALNIS',		        'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
           ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_GRASSLAND_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT'),
           ('RWB_DIEVDIRBIAI_ALLOW_FLOODPLAINS_PLAINS_DISTRICT_RWB_PILIAKALNIS',		'MODIFIER_RWB_DIEVDIRBIAI_CITY_ADJUST_VALID_FEATURES_DISTRICT');


INSERT INTO District_BuildChargeProductions
(DistrictType,                          UnitType,                                       PercentProductionPerCharge)
VALUES      ('DISTRICT_RWB_PILIAKALNIS',                  'UNIT_RWB_DIEVDIRBYS',      100);
-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	

INSERT INTO RequirementSets
            (RequirementSetId,                                      RequirementSetType)
VALUES	    ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',        'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',        'REQUIREMENTSET_TEST_ALL'),

            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1',           'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3',           'REQUIREMENTSET_TEST_ALL'),
            ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5',           'REQUIREMENTSET_TEST_ALL')
			;

-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	

INSERT INTO RequirementSetRequirements
                (RequirementSetId,								             RequirementId)
VALUES	        ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_PLOT_ADJACENT_TO_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS1',		                'RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS1',		                    'RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE'),

                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',		                'RWB_VYTAUTAS_REQUIRES_PLOT_ADJACENT_TO_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS3',		                'RWB_VYTAUTAS_REQUIRES_APPEAL_3_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS3',		                    'RWB_VYTAUTAS_REQUIRES_APPEAL_3_OR_MORE'),
                
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',		                'RWB_VYTAUTAS_REQUIRES_PLOT_ADJACENT_TO_PILIAKALNIS'),
                ('REQSET_SUB_RWB_LITHUANIA_ADJ_TO_PILIAKALNIS5',		                'RWB_VYTAUTAS_REQUIRES_APPEAL_5_OR_MORE'),
                ('REQSET_SUB_RWB_LITHUANIA_IS_PILIAKALNIS5',		                    'RWB_VYTAUTAS_REQUIRES_APPEAL_5_OR_MORE')
                ;
	
-----------------------------------------------	
-- Requirements
-----------------------------------------------	

INSERT INTO Requirements
                (RequirementId,								             RequirementType)
VALUES	        ('RWB_VYTAUTAS_REQUIRES_PLOT_ADJACENT_TO_PILIAKALNIS',	 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE',		         'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_3_OR_MORE',		         'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_5_OR_MORE',		         'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN')
                ;

-----------------------------------------------	
-- RequirementArguments
-----------------------------------------------	

INSERT INTO RequirementArguments
                (RequirementId,								             Name,                                  Value)
VALUES	        ('RWB_VYTAUTAS_REQUIRES_PLOT_ADJACENT_TO_PILIAKALNIS',	 'DistrictType',                        'DISTRICT_RWB_PILIAKALNIS'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_1_OR_MORE',		         'MinimumAppeal',                       '1'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_3_OR_MORE',		         'MinimumAppeal',                       '3'),
                ('RWB_VYTAUTAS_REQUIRES_APPEAL_5_OR_MORE',		         'MinimumAppeal',                       '5')
                ;