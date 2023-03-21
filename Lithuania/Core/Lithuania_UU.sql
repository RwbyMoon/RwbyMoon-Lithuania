-----------------------------------------------	
-- Types
-----------------------------------------------	

INSERT INTO Types
		(Type,								            Kind)
VALUES	('UNIT_RWB_VYTIS',						        'KIND_UNIT');

-----------------------------------------------	
-- Units
-----------------------------------------------	

INSERT INTO Units (
		UnitType,
		Name,
		Description,
		BaseSightRange,
		BaseMoves,
		Domain,
		FormationClass,
        PromotionClass,
        Combat,
		Cost,
		CanCapture,
		CanTrain,
		PurchaseYield,
		PrereqTech,
        MandatoryObsoleteTech,
		Maintenance,
		ZoneOfControl,
		AdvisorType,
        StrategicResource,
        TraitType
		)
VALUES	('UNIT_RWB_VYTIS', -- UnitType
		'LOC_UNIT_RWB_VYTIS_NAME', -- Name
		'LOC_UNIT_RWB_VYTIS_DESCRIPTION', -- Description
		'2', -- BaseSightRange
		'4', -- Basemoves
		'DOMAIN_LAND', -- Domain
		'FORMATION_CLASS_LAND_COMBAT', -- FormationClass
        'PROMOTION_CLASS_LIGHT_CAVALRY', -- PromotionClass
        '40', -- CombatStrength
		'220', -- Cost
		'0', -- CanCapture
		'1', -- CanTrain
		'YIELD_GOLD', -- PurchaseYield
		'TECH_HORSEBACK_RIDING', -- PrereqTech
        'TECH_SYNTHETIC_MATERIALS', -- MandatoryObsoleteTech
		'3', -- Maintenance
		'1', -- ZoneOfControl
		'ADVISOR_CONQUEST', -- AdvisorType
        'RESOURCE_HORSES', -- StrategicResource
        'TRAIT_CIVILIZATION_UNIT_RWB_VYTIS' -- TraitType
		);

INSERT OR REPLACE INTO Units_XP2
            (UnitType,
             ResourceCost,
             ResourceMaintenanceType)
VALUES      ('UNIT_RWB_VYTIS',
             '10',
             'RESOURCE_HORSES');          

-----------------------------------------------	
-- UnitReplaces
-----------------------------------------------	

INSERT INTO UnitReplaces
(CivUniqueUnitType,											ReplacesUnitType)
VALUES	('UNIT_RWB_VYTIS',						                    'UNIT_HORSEMAN');


-----------------------------------------------	
-- UnitUpgrades
-----------------------------------------------	

INSERT INTO UnitUpgrades
        (Unit,										UpgradeUnit)
VALUES	('UNIT_RWB_VYTIS',						    'UNIT_CAVALRY');

-----------------------------------------------	
-- UnitAiInfos
-----------------------------------------------	

INSERT INTO UnitAiInfos
        (UnitType,									AiType)
VALUES	('UNIT_RWB_VYTIS',						    'UNITAI_COMBAT'),
        ('UNIT_RWB_VYTIS',						    'UNITAI_EXPLORE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_CAVALRY'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_MELEE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_LAND_COMBAT');

-----------------------------------------------	
-- TypeTags
-----------------------------------------------	

INSERT INTO TypeTags
        (Type,									    Tag)
VALUES	('UNIT_RWB_VYTIS',						    'CLASS_LIGHT_CAVALRY'),
        ('UNIT_RWB_VYTIS',						    'CLASS_RWB_LEITIS'),
        ('ABILITY_RWB_LEITIS',						'CLASS_RWB_LEITIS');

INSERT INTO Tags
(Tag,									            Vocabulary)
VALUES	('CLASS_RWB_LEITIS',						        'ABILITY_CLASS');

INSERT INTO Types
        (Type,									            Kind)
VALUES	('ABILITY_RWB_LEITIS',						        'KIND_ABILITY');

-----------------------------------------------	
-- UnitAbilities
-----------------------------------------------	

INSERT INTO UnitAbilities
        (UnitAbilityType,									 Name,                                   Description)
VALUES	('ABILITY_RWB_LEITIS',						        'LOC_ABILITY_RWB_LEITIS_NAME',          'LOC_ABILITY_RWB_LEITIS_DESCRIPTION');


INSERT INTO UnitAbilityModifiers
        (UnitAbilityType,								            ModifierId)
VALUES	('ABILITY_RWB_LEITIS',						                'RWB_LEITIS_NO_REDUCTION'),
        ('ABILITY_RWB_LEITIS',						                'RWB_LEITIS_STRENGTH');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

INSERT INTO Modifiers
        (ModifierId,							ModifierType,                                           SubjectRequirementSetId)
VALUES	('RWB_LEITIS_NO_REDUCTION',				'MODIFIER_PLAYER_UNIT_ADJUST_NO_REDUCTION_DAMAGE',      'UNIT_ADJACENT_TO_GREAT_GENERAL_REQUIREMENTS'),
        ('RWB_LEITIS_STRENGTH',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                 'COSSACK_PLOT_IS_OWNER_OR_ADJACENT_REQUIREMENTS');


INSERT INTO ModifierArguments
        (ModifierId,							Name,                                           Value)
VALUES	('RWB_LEITIS_NO_REDUCTION',				'NoReduction',                                  'True'),
        ('RWB_LEITIS_STRENGTH',					'Value',                                        '5');


INSERT INTO ModifierStrings
        (ModifierId,							Context,                                Text)
VALUES	('RWB_LEITIS_STRENGTH',				    'Preview',                              'LOC_ABILITY_RWB_LEITIS_DEFIANCE_DESCRIPTION'),
        ('RWB_LEITIS_NO_REDUCTION',				'Preview',                              'LOC_ABILITY_RWB_LEITIS_NO_REDUCTION_DESCRIPTION');

	