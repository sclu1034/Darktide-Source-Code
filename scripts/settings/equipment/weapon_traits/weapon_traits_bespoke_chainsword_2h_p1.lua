local BuffSettings = require("scripts/settings/buff/buff_settings")
local templates = {}
local stat_buffs = BuffSettings.stat_buffs
templates.weapon_trait_bespoke_chainsword_2h_p1_guaranteed_melee_crit_on_activated_kill = {
	weapon_trait_bespoke_chainsword_2h_p1_guaranteed_melee_crit_on_activated_kill = {
		{}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_bleed_on_activated_hit = {
	weapon_trait_bespoke_chainsword_2h_p1_bleed_on_activated_hit = {
		{
			target_buff_data = {
				num_stacks_on_proc = 3
			}
		},
		{
			target_buff_data = {
				num_stacks_on_proc = 4
			}
		},
		{
			target_buff_data = {
				num_stacks_on_proc = 5
			}
		},
		{
			target_buff_data = {
				num_stacks_on_proc = 6
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_movement_speed_on_activation = {
	weapon_trait_bespoke_chainsword_2h_p1_movement_speed_on_activation = {
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.movement_speed] = 0.17
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.movement_speed] = 0.18
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.movement_speed] = 0.19
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.movement_speed] = 0.2
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_toughness_recovery_on_multiple_hits = {
	weapon_trait_bespoke_chainsword_2h_p1_toughness_recovery_on_multiple_hits = {
		{
			buff_data = {
				replenish_percentage = 0.12,
				required_num_hits = 3
			}
		},
		{
			buff_data = {
				replenish_percentage = 0.13,
				required_num_hits = 3
			}
		},
		{
			buff_data = {
				replenish_percentage = 0.13,
				required_num_hits = 3
			}
		},
		{
			buff_data = {
				replenish_percentage = 0.15,
				required_num_hits = 3
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_increased_melee_damage_on_multiple_hits = {
	weapon_trait_bespoke_chainsword_2h_p1_increased_melee_damage_on_multiple_hits = {
		{
			active_duration = 3.5,
			stat_buffs = {
				[stat_buffs.melee_power_level_modifier] = 0.24
			}
		},
		{
			active_duration = 3.5,
			stat_buffs = {
				[stat_buffs.melee_power_level_modifier] = 0.28
			}
		},
		{
			active_duration = 3.5,
			stat_buffs = {
				[stat_buffs.melee_power_level_modifier] = 0.32
			}
		},
		{
			active_duration = 3.5,
			stat_buffs = {
				[stat_buffs.melee_power_level_modifier] = 0.36
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_increased_attack_cleave_on_multiple_hits = {
	weapon_trait_bespoke_chainsword_2h_p1_increased_attack_cleave_on_multiple_hits = {
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 1.4
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 1.6
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 1.8
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 2
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_chained_hits_increases_melee_cleave = {
	weapon_trait_bespoke_chainsword_2h_p1_chained_hits_increases_melee_cleave_parent = {
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 0.25
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 0.3
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 0.35
			}
		},
		{
			stat_buffs = {
				[stat_buffs.max_hit_mass_attack_modifier] = 0.4
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_chained_hits_increases_crit_chance = {
	weapon_trait_bespoke_chainsword_2h_p1_chained_hits_increases_crit_chance_parent = {
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.025
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.03
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.035
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.04
			}
		}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_pass_past_armor_on_crit = {
	weapon_trait_bespoke_chainsword_2h_p1_pass_past_armor_on_crit = {
		{}
	}
}
templates.weapon_trait_bespoke_chainsword_2h_p1_rending_vs_staggered = {
	weapon_trait_bespoke_chainsword_2h_p1_rending_vs_staggered = {
		{
			conditional_stat_buffs = {
				[stat_buffs.rending_vs_staggered_multiplier] = 0.1
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.rending_vs_staggered_multiplier] = 0.15
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.rending_vs_staggered_multiplier] = 0.2
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.rending_vs_staggered_multiplier] = 0.25
			}
		}
	}
}

return templates
