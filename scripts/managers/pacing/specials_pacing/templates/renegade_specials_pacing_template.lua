local DEFAULT_FORESHADOW_STINGERS = {
	renegade_netgunner = "wwise/events/minions/play_minion_special_netgunner_spawn",
	chaos_hound = "wwise/events/minions/play_enemy_chaos_hound_spawn"
}
local DEFAULT_FORESHADOW_STINGER_TIMERS = {
	cultist_mutant = 5,
	chaos_hound = 5,
	renegade_netgunner = 4
}
local DEFAULT_SPAWN_STINGERS = {
	cultist_mutant = "wwise/events/minions/play_minion_special_mutant_charger_spawn",
	chaos_poxwalker_bomber = "wwise/events/minions/play_minion_special_poxwalker_bomber_spawn"
}
local DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION = {
	renegade_grenadier = "ahead",
	renegade_sniper = "ahead"
}
local DEFAULT_OPTIONAL_MAINPATH_OFFSET = {
	renegade_grenadier = 30,
	renegade_sniper = 40
}
local DEFAULT_BREEDS = {
	all = {
		"chaos_hound",
		"chaos_poxwalker_bomber",
		"cultist_flamer",
		"cultist_mutant",
		"renegade_grenadier",
		"renegade_netgunner",
		"renegade_sniper"
	},
	disablers = {
		"chaos_hound",
		"renegade_netgunner",
		"cultist_mutant"
	},
	scramblers = {
		"chaos_poxwalker_bomber",
		"cultist_flamer",
		"renegade_grenadier",
		"renegade_sniper"
	}
}
local DEFAULT_COORDINATED_STRIKE_BREEDS = {
	"chaos_hound",
	"chaos_poxwalker_bomber",
	"cultist_flamer",
	"cultist_mutant",
	"renegade_netgunner"
}
local DEFAULT_RUSH_PREVENTION_BREEDS = {
	"chaos_hound",
	"cultist_mutant"
}
local DEFAULT_MIN_DISTANCES_FROM_TARGET = {
	cultist_mutant = 25,
	chaos_hound = 25,
	renegade_grenadier = 20,
	chaos_poxwalker_bomber = 35,
	renegade_netgunner = 20,
	renegade_sniper = 30,
	cultist_flamer = 20
}
local DEFAULT_MIN_SPAWNERS_RANGES = {
	max = 40,
	min = 15
}
local specials_pacing_template = {
	name = "renegade_specials",
	resistance_templates = {
		{
			destroy_special_distance = 100,
			max_spawn_group_offset_range = 6,
			max_alive_specials = 2,
			first_spawn_timer_modifer = 0.75,
			rushing_distance = 80,
			skip_disablers_when_one_target_alive = true,
			spawn_failed_wait_time = 5,
			timer_range = {
				160,
				320
			},
			min_distances_from_target = DEFAULT_MIN_DISTANCES_FROM_TARGET,
			breeds = DEFAULT_BREEDS,
			foreshadow_stingers = DEFAULT_FORESHADOW_STINGERS,
			foreshadow_stinger_timers = DEFAULT_FORESHADOW_STINGER_TIMERS,
			optional_prefered_spawn_direction = DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION,
			optional_mainpath_offset = DEFAULT_OPTIONAL_MAINPATH_OFFSET,
			spawn_stingers = DEFAULT_SPAWN_STINGERS,
			spawners_min_range = DEFAULT_MIN_SPAWNERS_RANGES.min,
			spawners_max_range = DEFAULT_MIN_SPAWNERS_RANGES.max,
			rush_prevention_breeds = DEFAULT_RUSH_PREVENTION_BREEDS,
			rush_prevention_cooldown = {
				150,
				250
			},
			rush_prevention_failed_cooldown = {
				5,
				10
			}
		},
		{
			destroy_special_distance = 100,
			max_spawn_group_offset_range = 6,
			max_alive_specials = 3,
			chance_for_coordinated_strike = 0.1,
			first_spawn_timer_modifer = 0.5,
			rushing_distance = 60,
			skip_disablers_when_one_target_alive = true,
			spawn_failed_wait_time = 5,
			timer_range = {
				120,
				280
			},
			min_distances_from_target = DEFAULT_MIN_DISTANCES_FROM_TARGET,
			breeds = DEFAULT_BREEDS,
			foreshadow_stingers = DEFAULT_FORESHADOW_STINGERS,
			foreshadow_stinger_timers = DEFAULT_FORESHADOW_STINGER_TIMERS,
			optional_prefered_spawn_direction = DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION,
			optional_mainpath_offset = DEFAULT_OPTIONAL_MAINPATH_OFFSET,
			spawn_stingers = DEFAULT_SPAWN_STINGERS,
			spawners_min_range = DEFAULT_MIN_SPAWNERS_RANGES.min,
			spawners_max_range = DEFAULT_MIN_SPAWNERS_RANGES.max,
			coordinated_strike_timer_range = {
				100,
				120
			},
			coordinated_strike_breeds = DEFAULT_COORDINATED_STRIKE_BREEDS,
			rush_prevention_breeds = DEFAULT_RUSH_PREVENTION_BREEDS,
			rush_prevention_cooldown = {
				80,
				120
			},
			rush_prevention_failed_cooldown = {
				5,
				10
			}
		},
		{
			destroy_special_distance = 100,
			max_spawn_group_offset_range = 6,
			max_alive_specials = 4,
			chance_for_coordinated_strike = 0.15,
			first_spawn_timer_modifer = 0.5,
			rushing_distance = 60,
			skip_disablers_when_one_target_alive = true,
			spawn_failed_wait_time = 5,
			timer_range = {
				100,
				250
			},
			min_distances_from_target = DEFAULT_MIN_DISTANCES_FROM_TARGET,
			breeds = DEFAULT_BREEDS,
			foreshadow_stingers = DEFAULT_FORESHADOW_STINGERS,
			foreshadow_stinger_timers = DEFAULT_FORESHADOW_STINGER_TIMERS,
			optional_prefered_spawn_direction = DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION,
			optional_mainpath_offset = DEFAULT_OPTIONAL_MAINPATH_OFFSET,
			spawn_stingers = DEFAULT_SPAWN_STINGERS,
			spawners_min_range = DEFAULT_MIN_SPAWNERS_RANGES.min,
			spawners_max_range = DEFAULT_MIN_SPAWNERS_RANGES.max,
			coordinated_strike_timer_range = {
				80,
				100
			},
			coordinated_strike_breeds = DEFAULT_COORDINATED_STRIKE_BREEDS,
			rush_prevention_breeds = DEFAULT_RUSH_PREVENTION_BREEDS,
			rush_prevention_cooldown = {
				60,
				100
			},
			rush_prevention_failed_cooldown = {
				5,
				10
			}
		},
		{
			destroy_special_distance = 100,
			max_spawn_group_offset_range = 6,
			chance_for_coordinated_strike = 0.2,
			first_spawn_timer_modifer = 0.35,
			max_alive_specials = 4,
			rushing_distance = 60,
			spawn_failed_wait_time = 5,
			timer_range = {
				80,
				220
			},
			min_distances_from_target = DEFAULT_MIN_DISTANCES_FROM_TARGET,
			breeds = DEFAULT_BREEDS,
			foreshadow_stingers = DEFAULT_FORESHADOW_STINGERS,
			foreshadow_stinger_timers = DEFAULT_FORESHADOW_STINGER_TIMERS,
			optional_prefered_spawn_direction = DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION,
			optional_mainpath_offset = DEFAULT_OPTIONAL_MAINPATH_OFFSET,
			spawn_stingers = DEFAULT_SPAWN_STINGERS,
			spawners_min_range = DEFAULT_MIN_SPAWNERS_RANGES.min,
			spawners_max_range = DEFAULT_MIN_SPAWNERS_RANGES.max,
			coordinated_strike_timer_range = {
				80,
				100
			},
			coordinated_strike_breeds = DEFAULT_COORDINATED_STRIKE_BREEDS,
			rush_prevention_breeds = DEFAULT_RUSH_PREVENTION_BREEDS,
			rush_prevention_cooldown = {
				50,
				80
			},
			rush_prevention_failed_cooldown = {
				5,
				10
			}
		},
		{
			destroy_special_distance = 100,
			max_spawn_group_offset_range = 6,
			chance_for_coordinated_strike = 0.25,
			first_spawn_timer_modifer = 0.25,
			max_alive_specials = 5,
			rushing_distance = 60,
			spawn_failed_wait_time = 5,
			timer_range = {
				70,
				180
			},
			min_distances_from_target = DEFAULT_MIN_DISTANCES_FROM_TARGET,
			breeds = DEFAULT_BREEDS,
			foreshadow_stingers = DEFAULT_FORESHADOW_STINGERS,
			foreshadow_stinger_timers = DEFAULT_FORESHADOW_STINGER_TIMERS,
			optional_prefered_spawn_direction = DEFAULT_OPTIONAL_PREFERED_SPAWN_DIRECTION,
			optional_mainpath_offset = DEFAULT_OPTIONAL_MAINPATH_OFFSET,
			spawn_stingers = DEFAULT_SPAWN_STINGERS,
			spawners_min_range = DEFAULT_MIN_SPAWNERS_RANGES.min,
			spawners_max_range = DEFAULT_MIN_SPAWNERS_RANGES.max,
			coordinated_strike_timer_range = {
				60,
				100
			},
			coordinated_strike_breeds = DEFAULT_COORDINATED_STRIKE_BREEDS,
			rush_prevention_breeds = DEFAULT_RUSH_PREVENTION_BREEDS,
			rush_prevention_cooldown = {
				40,
				70
			},
			rush_prevention_failed_cooldown = {
				5,
				10
			}
		}
	}
}

return specials_pacing_template