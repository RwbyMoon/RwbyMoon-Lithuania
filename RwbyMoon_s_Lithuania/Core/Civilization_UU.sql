/*
	Civilization Unique Unit

	Please note: the unique unit configured here replaces an existing unit in the 'food-chain' - which is the case for the majority of unique units that are included in the base game.

	It is, however, not required that a unique unit replaces an existing unit.
	
	Authors: RwbyMoon
*/

-----------------------------------------------
-- Types

-- This inserts the Unique Unit reference into the primary Data Types table as a recognised trait. This is mandatory, if configuring a custom trait for your civilization. The string listed under 'Type' must be used throughout the mod when referring to the TraitType. In addition, we are inserting the Unit itself (UNIT_MC_WEREJAGUAR) and defining the UnitAbility (ABILITY_WEREJAGUAR), which is then tied to this unit (and no others).

-- The standard naming convention follows: TRAIT_CIVILIZATION_UNIQUEUNITNAME

-- Configuring a Unique Unit for your custom civilization is entirely optional, but it is typically considered appropriate for balance to configure at least one, such that your custom civilization matches those from the base games in terms of complexity, both for flavour and gameplay balance (in my opinion).
-----------------------------------------------	
	
INSERT OR IGNORE INTO Types
		(Type,									Kind			)
VALUES	('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',	'KIND_TRAIT'	),
		('UNIT_RWB_VYTIS',					'KIND_UNIT'		);

INSERT OR IGNORE INTO Traits
        (TraitType,								Name,								Description								)
VALUES	('TRAIT_CIVILIZATION_UNIT_RWB_VYTIS',	'LOC_UNIT_RWB_VYTIS_NAME',		'LOC_UNIT_RWB_VYTIS_DESCRIPTION'	);

INSERT OR IGNORE INTO CivilizationTraits
        (CivilizationType,				TraitType								)
VALUES	('CIVILIZATION_RWB_LITHUANIA',		'TRAIT_CIVILIZATION_UNIT_RWB_VYTIS'		);

-----------------------------------------------	
-- Units
-----------------------------------------------	

INSERT OR IGNORE INTO Units (
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

CREATE TABLE IF NOT EXISTS Units_XP2
            (
                UnitType TEXT,
                ResourceCost INTEGER,
                ResourceMaintenanceType TEXT
            );

INSERT OR IGNORE INTO Units_XP2
            (UnitType,
             ResourceCost,
             ResourceMaintenanceType)
VALUES      ('UNIT_RWB_VYTIS',
             '20',
             'RESOURCE_HORSES');

-----------------------------------------------	
-- UnitReplaces
-----------------------------------------------	

INSERT OR IGNORE INTO UnitReplaces
        (CivUniqueUnitType,											ReplacesUnitType)
VALUES	('UNIT_RWB_VYTIS',						                    'UNIT_HORSEMAN');


-----------------------------------------------	
-- UnitUpgrades
-----------------------------------------------	

INSERT OR IGNORE INTO UnitUpgrades
        (Unit,										UpgradeUnit)
VALUES	('UNIT_RWB_VYTIS',						    'UNIT_CAVALRY');

-----------------------------------------------	
-- UnitAiInfos
-----------------------------------------------	

INSERT OR IGNORE INTO UnitAiInfos
        (UnitType,									AiType)
VALUES	('UNIT_RWB_VYTIS',						    'UNITAI_COMBAT'),
        ('UNIT_RWB_VYTIS',						    'UNITAI_EXPLORE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_CAVALRY'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_MELEE'),
        ('UNIT_RWB_VYTIS',						    'UNITTYPE_LAND_COMBAT');

-----------------------------------------------	
-- TypeTags
-----------------------------------------------	

INSERT OR IGNORE INTO TypeTags
        (Type,									    Tag)
VALUES	('UNIT_RWB_VYTIS',						    'CLASS_LIGHT_CAVALRY'),
        ('UNIT_RWB_VYTIS',						'CLASS_RWB_VYTIS'),
        ('ABILITY_RWB_VYTIS_DEFIANCE',			'CLASS_RWB_VYTIS'),
        ('ABILITY_RWB_VYTIS_CUIRASS',				'CLASS_RWB_VYTIS');

INSERT OR IGNORE INTO Tags
        (Tag,									            Vocabulary)
VALUES	('CLASS_RWB_VYTIS',						        'ABILITY_CLASS');

INSERT OR IGNORE INTO Types
        (Type,									            Kind)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						        'KIND_ABILITY'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						        'KIND_ABILITY');

-----------------------------------------------	
-- UnitAbilities
-----------------------------------------------	

INSERT OR IGNORE INTO UnitAbilities
        (UnitAbilityType,									 Name,                                   Description)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						        'LOC_ABILITY_RWB_VYTIS_DEFIANCE_NAME',          'LOC_ABILITY_RWB_VYTIS_DEFIANCE_DESCRIPTION'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						        'LOC_ABILITY_RWB_VYTIS_CUIRASS_NAME',          'LOC_ABILITY_RWB_VYTIS_CUIRASS_DESCRIPTION');


INSERT OR IGNORE INTO UnitAbilityModifiers
        (UnitAbilityType,								            ModifierId)
VALUES	('ABILITY_RWB_VYTIS_DEFIANCE',						                'RWB_VYTIS_DEFIANCE'),
        ('ABILITY_RWB_VYTIS_CUIRASS',						                'RWB_VYTIS_CUIRASS');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	

INSERT OR IGNORE INTO Modifiers
        (ModifierId,							ModifierType,                                SubjectRequirementSetId,						OwnerRequirementSetId)
VALUES	('RWB_VYTIS_DEFIANCE',				    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      'COMBAT_AGAINST_STRONGER_UNIT_REQUIREMENTS',	null),
        ('RWB_VYTIS_CUIRASS',				    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',      null,											'PLAYER_HAS_CASTLES_TECHNOLOGY');

INSERT OR IGNORE INTO ModifierArguments
        (ModifierId,							Name,                                           Value)
VALUES	('RWB_VYTIS_DEFIANCE',					'Amount',                                        '7'),
        ('RWB_VYTIS_CUIRASS',					'Amount',                                        '4');


INSERT OR IGNORE INTO ModifierStrings
        (ModifierId,							Context,                                Text)
VALUES	('RWB_VYTIS_DEFIANCE',				    'Preview',                              'LOC_ABILITY_RWB_VYTIS_DEFIANCE_LONG_DESCRIPTION'),
        ('RWB_VYTIS_CUIRASS',				    'Preview',                              'LOC_ABILITY_RWB_VYTIS_CUIRASS_LONG_DESCRIPTION');

INSERT OR IGNORE INTO RequirementSets
        (RequirementSetId,                              RequirementSetType) 
VALUES  ('COMBAT_AGAINST_STRONGER_UNIT_REQUIREMENTS',   'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements
        (RequirementSetId, RequirementId) 
VALUES ('COMBAT_AGAINST_STRONGER_UNIT_REQUIREMENTS',    'REQUIRES_COMBAT_AGAINST_STRONGER_UNIT');

INSERT OR IGNORE INTO Requirements
        (RequirementId,                             RequirementType) 
VALUES ('REQUIRES_COMBAT_AGAINST_STRONGER_UNIT',    'REQUIREMENT_OPPONENT_IS_STRONGER');