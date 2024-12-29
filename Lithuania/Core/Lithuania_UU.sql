-----------------------------------------------	
-- Types
-----------------------------------------------	

INSERT OR REPLACE INTO Types
		(Type,								            Kind)
VALUES	('UNIT_RWB_VYTIS',						        'KIND_UNIT');

-----------------------------------------------	
-- Units
-----------------------------------------------	

INSERT OR REPLACE INTO Units (
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
        '38', -- CombatStrength
		'100', -- Cost
		'0', -- CanCapture
		'1', -- CanTrain
		'YIELD_GOLD', -- PurchaseYield
		'TECH_HORSEBACK_RIDING', -- PrereqTech
        'TECH_SYNTHETIC_MATERIALS', -- MandatoryObsoleteTech
		'5', -- Maintenance
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
             '20',
             'RESOURCE_HORSES');          

-----------------------------------------------	
-- UnitReplaces
-----------------------------------------------	

INSERT OR REPLACE INTO UnitReplaces
(CivUniqueUnitType,											ReplacesUnitType)
VALUES	('UNIT_RWB_VYTIS',						                    'UNIT_HORSEMAN');


-----------------------------------------------	
-- UnitUpgrades
-----------------------------------------------	

INSERT OR REPLACE INTO UnitUpgrades
        (Unit,										UpgradeUnit)
VALUES	('UNIT_RWB_VYTIS',						    'UNIT_CAVALRY');

-----------------------------------------------	
-- UnitAiInfos
-----------------------------------------------	

INSERT OR REPLACE INTO UnitAiInfos
        (UnitType,									AiType)
VALUES	('UNIT_RWB_VYTIS',						    'UNITAI_COMBAT'),
        ('UNIT_RWB_VYTIS',						    'UNITAI_EXPLORE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_CAVALRY'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_MELEE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_LAND_COMBAT');

-----------------------------------------------	
-- TypeTags
-----------------------------------------------	

INSERT OR REPLACE INTO TypeTags
        (Type,									    Tag)
VALUES	('UNIT_RWB_VYTIS',						    'CLASS_LIGHT_CAVALRY'),
        ('UNIT_RWB_VYTIS',						    'CLASS_RWB_VYTIS'),
        ('ABILITY_RWB_VYTIS_DEFIANCE',				'CLASS_RWB_VYTIS'),
        ('ABILITY_RWB_VYTIS_CUIRASS',				'CLASS_RWB_VYTIS');

INSERT OR REPLACE INTO Tags
(Tag,									            Vocabulary)
VALUES	('CLASS_RWB_VYTIS',						        'ABILITY_CLASS');

INSERT OR REPLACE INTO Types
        (Type,									            Kind)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						        'KIND_ABILITY'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						        'KIND_ABILITY');

-----------------------------------------------	
-- UnitAbilities
-----------------------------------------------	
    
INSERT OR REPLACE INTO UnitAbilities
        (UnitAbilityType,									 Name,                                   Description)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						        'LOC_ABILITY_RWB_VYTIS_DEFIANCE_NAME',          'LOC_ABILITY_RWB_VYTIS_DEFIANCE_DESCRIPTION'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						        'LOC_ABILITY_RWB_VYTIS_CUIRASS_NAME',          'LOC_ABILITY_RWB_VYTIS_CUIRASS_DESCRIPTION');


INSERT OR REPLACE INTO UnitAbilityModifiers
        (UnitAbilityType,								            ModifierId)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						                'RWB_VYTIS_DEFIANCE'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						                'RWB_VYTIS_CUIRASS');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

INSERT OR REPLACE INTO Modifiers
        (ModifierId,							ModifierType,                                SubjectRequirementSetId,						OwnerRequirementSetId)
VALUES	('RWB_VYTIS_DEFIANCE',				    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      'COMBAT_AGAINST_STRONGER_UNIT_REQUIREMENTS',	null),
        ('RWB_VYTIS_CUIRASS',				    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      null,											'PLAYER_HAS_CASTLES_TECHNOLOGY');

INSERT OR REPLACE INTO ModifierArguments
        (ModifierId,							Name,                                           Value)
VALUES	('RWB_VYTIS_DEFIANCE',					'Amount',                                        '7'),
        ('RWB_VYTIS_CUIRASS',					'Amount',                                        '4');


INSERT OR REPLACE INTO ModifierStrings
        (ModifierId,							Context,                                Text)
VALUES	('RWB_VYTIS_DEFIANCE',				    'Preview',                              'LOC_ABILITY_RWB_VYTIS_DEFIANCE_LONG_DESCRIPTION'),
        ('RWB_VYTIS_CUIRASS',				    'Preview',                              'LOC_ABILITY_RWB_VYTIS_CUIRASS_LONG_DESCRIPTION');

