local ArmorSettings = require("scripts/settings/damage/armor_settings")
local AttackSettings = require("scripts/settings/damage/attack_settings")
local DamageProfileSettings = require("scripts/settings/damage/damage_profile_settings")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local GibbingSettings = require("scripts/settings/gibbing/gibbing_settings")
local PowerLevelSettings = require("scripts/settings/damage/power_level_settings")
local WoundsTemplates = require("scripts/settings/damage/wounds_templates")
local GibbingPower = GibbingSettings.gibbing_power
local GibbingTypes = GibbingSettings.gibbing_types
local armor_types = ArmorSettings.types
local damage_types = DamageSettings.damage_types
local damage_templates = {}
local overrides = {}

table.make_unique(damage_templates)
table.make_unique(overrides)

local melee_attack_strengths = AttackSettings.melee_attack_strength
local crit_armor_mod = DamageProfileSettings.crit_armor_mod
local crit_impact_armor_mod = DamageProfileSettings.crit_impact_armor_mod
local damage_lerp_values = DamageProfileSettings.damage_lerp_values
local default_armor_mod = DamageProfileSettings.default_armor_mod
local flat_one_armor_mod = DamageProfileSettings.flat_one_armor_mod
local single_cleave = DamageProfileSettings.single_cleave
local double_cleave = DamageProfileSettings.double_cleave
damage_templates.force_staff_ball = {
	stagger_override = "medium",
	suppression_attack_delay = 0.6,
	ragdoll_push_force = 0,
	ignore_stagger_reduction = true,
	stagger_category = "melee",
	armor_damage_modifier = {
		attack = {
			[armor_types.unarmored] = damage_lerp_values.lerp_1,
			[armor_types.armored] = damage_lerp_values.lerp_1,
			[armor_types.resistant] = damage_lerp_values.lerp_0_6,
			[armor_types.player] = damage_lerp_values.lerp_1,
			[armor_types.berserker] = damage_lerp_values.lerp_1,
			[armor_types.super_armor] = damage_lerp_values.lerp_0_1,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_1,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_6,
			[armor_types.prop_armor] = damage_lerp_values.lerp_1
		},
		impact = {
			[armor_types.unarmored] = damage_lerp_values.lerp_1,
			[armor_types.armored] = damage_lerp_values.lerp_1,
			[armor_types.resistant] = damage_lerp_values.lerp_0_6,
			[armor_types.player] = damage_lerp_values.lerp_1,
			[armor_types.berserker] = damage_lerp_values.lerp_0_5,
			[armor_types.super_armor] = damage_lerp_values.no_damage,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_8,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_8,
			[armor_types.prop_armor] = damage_lerp_values.lerp_0_6
		}
	},
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	power_distribution = {
		attack = {
			80,
			160
		},
		impact = {
			4,
			8
		}
	},
	damage_type = damage_types.warp,
	gibbing_power = GibbingPower.medium,
	gibbing_type = GibbingTypes.warp,
	wounds_template = WoundsTemplates.psyker_ball,
	suppression_value = {
		10,
		15
	},
	on_kill_area_suppression = {
		distance = 3,
		suppression_value = 5
	},
	targets = {
		default_target = {
			boost_curve_multiplier_finesse = 1.2,
			boost_curve = PowerLevelSettings.boost_curves.default,
			finesse_boost = {
				[armor_types.unarmored] = 0.75
			}
		}
	}
}
damage_templates.default_force_staff_bfg = {
	ragdoll_push_force = 350,
	ignore_shield = true,
	ragdoll_only = true,
	stagger_category = "melee",
	cleave_distribution = single_cleave,
	gibbing_power = GibbingPower.heavy,
	gibbing_type = GibbingTypes.warp,
	damage_type = damage_types.warp,
	targets = {
		default_target = {
			boost_curve_multiplier_finesse = 0.25,
			armor_damage_modifier = {
				attack = {
					[armor_types.unarmored] = damage_lerp_values.lerp_1,
					[armor_types.armored] = damage_lerp_values.lerp_1,
					[armor_types.resistant] = damage_lerp_values.lerp_2_35,
					[armor_types.player] = damage_lerp_values.lerp_1,
					[armor_types.berserker] = damage_lerp_values.lerp_0_5,
					[armor_types.super_armor] = damage_lerp_values.lerp_1,
					[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_5,
					[armor_types.void_shield] = damage_lerp_values.lerp_2_35,
					[armor_types.prop_armor] = damage_lerp_values.lerp_1
				},
				impact = {
					[armor_types.unarmored] = damage_lerp_values.lerp_1,
					[armor_types.armored] = damage_lerp_values.lerp_1,
					[armor_types.resistant] = damage_lerp_values.lerp_1,
					[armor_types.player] = damage_lerp_values.lerp_1,
					[armor_types.berserker] = damage_lerp_values.lerp_0_5,
					[armor_types.super_armor] = damage_lerp_values.lerp_1,
					[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_1,
					[armor_types.void_shield] = damage_lerp_values.lerp_2_35,
					[armor_types.prop_armor] = damage_lerp_values.lerp_1
				}
			},
			power_distribution = {
				attack = {
					150,
					200
				},
				impact = {
					40,
					50
				}
			},
			boost_curve = PowerLevelSettings.boost_curves.default,
			finesse_boost = {
				[armor_types.unarmored] = 0.5,
				[armor_types.armored] = 0.5,
				[armor_types.resistant] = 0.5,
				[armor_types.player] = 0.5,
				[armor_types.berserker] = 0.5,
				[armor_types.super_armor] = 0.5,
				[armor_types.disgustingly_resilient] = 0.5,
				[armor_types.void_shield] = 0.5,
				[armor_types.prop_armor] = 0.5
			}
		}
	},
	on_kill_area_suppression = {
		distance = 8,
		suppression_value = 12
	}
}
damage_templates.default_force_staff_demolition = {
	suppression_value = 10,
	ragdoll_push_force = 200,
	ignore_stagger_reduction = true,
	stagger_category = "melee",
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	ranges = {
		max = 50,
		min = 40
	},
	armor_damage_modifier = {
		attack = {
			[armor_types.unarmored] = damage_lerp_values.lerp_1,
			[armor_types.armored] = damage_lerp_values.lerp_1,
			[armor_types.resistant] = damage_lerp_values.lerp_1,
			[armor_types.player] = damage_lerp_values.lerp_1,
			[armor_types.berserker] = damage_lerp_values.lerp_1,
			[armor_types.super_armor] = damage_lerp_values.lerp_1,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
			[armor_types.prop_armor] = damage_lerp_values.lerp_1
		},
		impact = {
			[armor_types.unarmored] = damage_lerp_values.lerp_2,
			[armor_types.armored] = damage_lerp_values.lerp_2,
			[armor_types.resistant] = damage_lerp_values.lerp_2,
			[armor_types.player] = damage_lerp_values.lerp_2,
			[armor_types.berserker] = damage_lerp_values.lerp_2,
			[armor_types.super_armor] = damage_lerp_values.lerp_2,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_2,
			[armor_types.void_shield] = damage_lerp_values.lerp_2,
			[armor_types.prop_armor] = damage_lerp_values.lerp_2
		}
	},
	power_distribution = {
		attack = 25,
		impact = 15
	},
	targets = {
		default_target = {
			boost_curve = PowerLevelSettings.boost_curves.default
		}
	},
	gibbing_type = GibbingTypes.warp,
	gibbing_power = GibbingPower.heavy,
	damage_type = damage_types.warp
}
damage_templates.close_force_staff_demolition = {
	suppression_value = 10,
	ragdoll_push_force = 600,
	ignore_stagger_reduction = true,
	stagger_category = "melee",
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	ranges = {
		max = 3,
		min = 0.25
	},
	armor_damage_modifier = {
		attack = {
			[armor_types.unarmored] = damage_lerp_values.lerp_1,
			[armor_types.armored] = damage_lerp_values.lerp_1,
			[armor_types.resistant] = damage_lerp_values.lerp_1,
			[armor_types.player] = damage_lerp_values.lerp_1,
			[armor_types.berserker] = damage_lerp_values.lerp_1,
			[armor_types.super_armor] = damage_lerp_values.lerp_1,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
			[armor_types.prop_armor] = damage_lerp_values.lerp_1
		},
		impact = {
			[armor_types.unarmored] = damage_lerp_values.lerp_2,
			[armor_types.armored] = damage_lerp_values.lerp_2,
			[armor_types.resistant] = damage_lerp_values.lerp_2,
			[armor_types.player] = damage_lerp_values.lerp_2,
			[armor_types.berserker] = damage_lerp_values.lerp_2,
			[armor_types.super_armor] = damage_lerp_values.lerp_2,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_2,
			[armor_types.void_shield] = damage_lerp_values.lerp_2,
			[armor_types.prop_armor] = damage_lerp_values.lerp_2
		}
	},
	power_distribution = {
		attack = 350,
		impact = 100
	},
	targets = {
		default_target = {
			boost_curve = PowerLevelSettings.boost_curves.default
		}
	},
	gibbing_type = GibbingTypes.warp,
	gibbing_power = GibbingPower.heavy,
	damage_type = damage_types.warp
}
damage_templates.force_staff_bash = {
	ragdoll_push_force = 200,
	ragdoll_only = true,
	stagger_category = "melee",
	cleave_distribution = {
		attack = 0.01,
		impact = 0.01
	},
	gibbing_power = GibbingPower.light,
	gibbing_type = GibbingTypes.default,
	melee_attack_strength = melee_attack_strengths.light,
	damage_type = damage_types.bash,
	armor_damage_modifier = {
		attack = {
			[armor_types.unarmored] = damage_lerp_values.lerp_0_25,
			[armor_types.armored] = damage_lerp_values.lerp_0_5,
			[armor_types.resistant] = damage_lerp_values.lerp_1,
			[armor_types.player] = damage_lerp_values.no_damage,
			[armor_types.berserker] = damage_lerp_values.lerp_0_5,
			[armor_types.super_armor] = damage_lerp_values.no_damage,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
			[armor_types.prop_armor] = damage_lerp_values.lerp_0_5
		},
		impact = {
			[armor_types.unarmored] = damage_lerp_values.lerp_0_25,
			[armor_types.armored] = damage_lerp_values.lerp_1,
			[armor_types.resistant] = damage_lerp_values.lerp_1,
			[armor_types.player] = damage_lerp_values.no_damage,
			[armor_types.berserker] = damage_lerp_values.lerp_0_5,
			[armor_types.super_armor] = damage_lerp_values.lerp_0_3,
			[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
			[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
			[armor_types.prop_armor] = damage_lerp_values.lerp_1
		}
	},
	stagger_duration_modifier = {
		0.1,
		0.5
	},
	targets = {
		{
			boost_curve_multiplier_finesse = 0.25,
			armor_damage_modifier = {
				attack = {
					[armor_types.unarmored] = damage_lerp_values.lerp_0_25,
					[armor_types.armored] = damage_lerp_values.lerp_0_5,
					[armor_types.resistant] = damage_lerp_values.lerp_1,
					[armor_types.player] = damage_lerp_values.no_damage,
					[armor_types.berserker] = damage_lerp_values.lerp_0_5,
					[armor_types.super_armor] = damage_lerp_values.lerp_0_01,
					[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
					[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
					[armor_types.prop_armor] = damage_lerp_values.lerp_0_5
				},
				impact = {
					[armor_types.unarmored] = damage_lerp_values.lerp_0_25,
					[armor_types.armored] = damage_lerp_values.lerp_0_75,
					[armor_types.resistant] = damage_lerp_values.lerp_1,
					[armor_types.player] = damage_lerp_values.no_damage,
					[armor_types.berserker] = damage_lerp_values.lerp_0_5,
					[armor_types.super_armor] = damage_lerp_values.lerp_0_4,
					[armor_types.disgustingly_resilient] = damage_lerp_values.lerp_0_75,
					[armor_types.void_shield] = damage_lerp_values.lerp_0_75,
					[armor_types.prop_armor] = damage_lerp_values.lerp_0_75
				}
			},
			power_distribution = {
				attack = {
					30,
					60
				},
				impact = {
					5,
					8
				}
			},
			finesse_boost = {
				[armor_types.unarmored] = 0.1,
				[armor_types.armored] = 0.5,
				[armor_types.resistant] = 0.1,
				[armor_types.player] = 0.1,
				[armor_types.berserker] = 0.1,
				[armor_types.super_armor] = 0.1,
				[armor_types.disgustingly_resilient] = 0.25,
				[armor_types.void_shield] = 0.25,
				[armor_types.prop_armor] = 0.25
			}
		},
		{
			boost_curve_multiplier_finesse = 0.25,
			power_distribution = {
				attack = {
					15,
					25
				},
				impact = {
					4,
					8
				}
			}
		},
		default_target = {
			boost_curve_multiplier_finesse = 0.25,
			power_distribution = {
				attack = {
					8,
					12
				},
				impact = {
					3,
					6
				}
			},
			boost_curve = PowerLevelSettings.boost_curves.default,
			finesse_boost = {
				[armor_types.unarmored] = 0.05,
				[armor_types.armored] = 0.5,
				[armor_types.resistant] = 0.1,
				[armor_types.player] = 0.1,
				[armor_types.berserker] = 0.1,
				[armor_types.super_armor] = 0.1,
				[armor_types.disgustingly_resilient] = 0.5,
				[armor_types.void_shield] = 0.5,
				[armor_types.prop_armor] = 0.5
			}
		}
	}
}

return {
	base_templates = damage_templates,
	overrides = overrides
}