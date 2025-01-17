local TerrorEventQueries = require("scripts/managers/terror_event/utilities/terror_event_queries")
local template = {
	random_events = {
		cm_raid_wave_1 = {
			"event_obscura_den_top_floor_a",
			1,
			"event_obscura_den_top_floor_b",
			1,
			"event_obscura_den_top_floor_c",
			1
		},
		cm_raid_wave_2 = {
			"event_obscura_den_stairs_left_a",
			1,
			"event_obscura_den_stairs_left_b",
			1
		},
		cm_raid_wave_3 = {
			"event_obscura_den_stairs_right_a",
			1,
			"event_obscura_den_stairs_right_b",
			1
		},
		cm_raid_wave_4 = {
			"event_obscura_den_bottom_floor_a",
			1,
			"event_obscura_den_bottom_floor_b",
			1,
			"event_obscura_den_bottom_floor_c",
			1,
			"event_obscura_den_bottom_floor_d",
			1
		},
		cm_raid_endevent_floor_1 = {
			"event_drug_lab_first_floor_a",
			1,
			"event_drug_lab_first_floor_b",
			1,
			"event_drug_lab_first_floor_c",
			1
		},
		cm_raid_endevent_floor_2 = {
			"event_drug_lab_second_floor_a",
			1,
			"event_drug_lab_second_floor_b",
			1,
			"event_drug_lab_second_floor_c",
			1
		},
		cm_raid_endevent_floor_2_02 = {
			"event_drug_lab_second_floor_d",
			1,
			"event_drug_lab_second_floor_e",
			1
		},
		cm_raid_endevent_floor_3 = {
			"event_drug_lab_third_floor_a",
			1,
			"event_drug_lab_third_floor_b",
			1,
			"event_drug_lab_third_floor_c",
			1,
			"event_drug_lab_third_floor_d",
			1
		}
	},
	events = {
		event_pacing_off = {
			{
				"control_pacing_spawns",
				enabled = false,
				spawn_types = {
					"hordes",
					"roamers",
					"trickle_hordes"
				}
			}
		},
		event_pacing_on = {
			{
				"stop_terror_trickle"
			},
			{
				"control_pacing_spawns",
				enabled = true,
				spawn_types = {
					"hordes",
					"roamers",
					"trickle_hordes"
				}
			}
		},
		event_hordes_off = {
			{
				"control_pacing_spawns",
				enabled = false,
				spawn_types = {
					"hordes"
				}
			}
		},
		event_hordes_on = {
			{
				"control_pacing_spawns",
				enabled = true,
				spawn_types = {
					"hordes"
				}
			}
		},
		event_specials_off = {
			{
				"control_pacing_spawns",
				enabled = false,
				spawn_types = {
					"specials"
				}
			}
		},
		event_specials_on = {
			{
				"control_pacing_spawns",
				enabled = true,
				spawn_types = {
					"specials"
				}
			}
		},
		event_only_specials_enabled = {
			{
				"control_pacing_spawns",
				enabled = false,
				spawn_types = {
					"hordes",
					"roamers",
					"trickle_hordes"
				}
			}
		},
		event_pacing_on_stop_trickle = {
			{
				"set_pacing_enabled",
				enabled = true
			},
			{
				"stop_terror_trickle"
			}
		},
		event_raid_obscura_den_guards_left = {
			{
				"spawn_by_points",
				passive = true,
				max_breed_amount = 8,
				spawner_group = "spawner_raid_obscura_den_guards_left",
				limit_spawners = 8,
				points = 24,
				breed_tags = {
					{
						"roamer"
					}
				}
			},
			{
				"spawn_by_points",
				passive = true,
				max_breed_amount = 4,
				spawner_group = "spawner_raid_obscura_den_elite_left",
				limit_spawners = 4,
				points = 24,
				breed_tags = {
					{
						"elite"
					}
				}
			}
		},
		event_raid_obscura_den_guards_right = {
			{
				"spawn_by_points",
				passive = true,
				max_breed_amount = 8,
				spawner_group = "spawner_raid_obscura_den_guards_right",
				limit_spawners = 8,
				points = 24,
				breed_tags = {
					{
						"roamer"
					}
				}
			},
			{
				"spawn_by_points",
				passive = true,
				max_breed_amount = 4,
				spawner_group = "spawner_raid_obscura_den_elite_right",
				limit_spawners = 4,
				points = 24,
				breed_tags = {
					{
						"elite"
					}
				}
			}
		},
		event_obscura_den_top_floor_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				max_breed_amount = 3,
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 6,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"spawn_by_breed_name",
				breed_amount = 1,
				breed_name = "chaos_ogryn_bulwark",
				limit_spawners = 1,
				spawner_group = "spawner_obscura_den_top_floor"
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_breed_name",
				breed_amount = 1,
				breed_name = "renegade_flamer",
				limit_spawners = 1,
				spawner_group = "spawner_obscura_den_top_floor"
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_1"
			}
		},
		event_obscura_den_top_floor_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				max_breed_amount = 3,
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 10,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_breed_name",
				breed_amount = 1,
				breed_name = "renegade_flamer",
				limit_spawners = 1,
				spawner_group = "spawner_obscura_den_top_floor"
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_1"
			}
		},
		event_obscura_den_top_floor_c = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				max_breed_amount = 3,
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 6,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"spawn_by_breed_name",
				breed_amount = 1,
				breed_name = "chaos_ogryn_bulwark",
				limit_spawners = 1,
				spawner_group = "spawner_obscura_den_top_floor"
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_top_floor",
				limit_spawners = 5,
				points = 20,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_breed_name",
				breed_amount = 1,
				breed_name = "renegade_flamer",
				limit_spawners = 1,
				spawner_group = "spawner_obscura_den_top_floor"
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_1"
			}
		},
		event_obscura_den_stairs_left_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_stairs_left",
				limit_spawners = 5,
				points = 12,
				breed_tags = {
					{
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_stairs_left",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_stairs_left",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 4
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_2"
			}
		},
		event_obscura_den_stairs_left_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_stairs_left",
				limit_spawners = 5,
				points = 10,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_stairs_left",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_stairs_left",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 4
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_2"
			}
		},
		event_obscura_den_stairs_right_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_stairs_right",
				limit_spawners = 5,
				points = 10,
				breed_tags = {
					{
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_stairs_right",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_stairs_right",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 4
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_3"
			}
		},
		event_obscura_den_stairs_right_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_stairs_right",
				limit_spawners = 5,
				points = 10,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_stairs_right",
				limit_spawners = 5,
				points = 14,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_stairs_right",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 3
				end
			},
			{
				"delay",
				duration = 4
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_wave_3"
			}
		},
		event_obscura_den_bottom_floor_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 16,
				breed_tags = {
					{
						"melee",
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 6
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 12
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 2
				end
			}
		},
		event_obscura_den_bottom_floor_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 14,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 6
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 12
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 2
				end
			}
		},
		event_obscura_den_bottom_floor_c = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				limit_spawners = 6,
				points = 16,
				breed_tags = {
					{
						"melee",
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 12
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 2
				end
			}
		},
		event_obscura_den_bottom_floor_d = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				limit_spawners = 6,
				points = 14,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"delay",
				duration = 6
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_right",
				limit_spawners = 6,
				points = 8,
				breed_tags = {
					{
						"melee",
						"elite"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 12
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_obscura_den_bottom_floor_left",
				limit_spawners = 6,
				points = 6,
				breed_tags = {
					{
						"melee",
						"roamer"
					}
				}
			},
			{
				"continue_when",
				duration = 80,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 2
				end
			}
		},
		event_raid_endevent_guards_first_floor = {
			{
				"spawn_by_points",
				passive = true,
				max_breed_amount = 12,
				spawner_group = "spawner_raid_endevent_guards_first_floor",
				limit_spawners = 12,
				points = 24,
				breed_tags = {
					{
						"roamer"
					}
				}
			}
		},
		event_drug_lab_first_floor_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_1_02",
				limit_spawners = 3,
				points = 10,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_1_02",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_1_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_1_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_1"
			}
		},
		event_drug_lab_first_floor_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_1_02",
				limit_spawners = 3,
				points = 14,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_1_02",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_1_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_1_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_1"
			}
		},
		event_drug_lab_first_floor_c = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_1_01",
				limit_spawners = 3,
				points = 10,
				breed_tags = {
					{
						"melee"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_1_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_1_special_02",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"sniper"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_1_01",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_1"
			}
		},
		event_stair_guidance = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_stair_01",
				limit_spawners = 3,
				points = 10,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_stair_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"melee"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"start_terror_trickle",
				delay = 1,
				spawner_group = "spawner_stair_01",
				template_name = "standard_melee"
			}
		},
		event_drug_lab_second_floor_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"melee",
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_2_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"sniper"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_2_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_2"
			}
		},
		event_drug_lab_second_floor_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 10,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_2_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_2_01",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_2"
			}
		},
		event_drug_lab_second_floor_c = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_2_02",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_2_02",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_2_special_02",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_2_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_2"
			}
		},
		event_drug_lab_second_floor_d = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_2_03",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_2_03",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_2_special_02",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_2_03",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_2_02"
			}
		},
		event_drug_lab_second_floor_e = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"melee"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_2_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_2_special_03",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_2_01",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 8
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_2_02"
			}
		},
		event_drug_lab_third_floor_a = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_3_01",
				limit_spawners = 3,
				points = 8,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_01",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_3_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_3_01",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_3"
			}
		},
		event_drug_lab_third_floor_b = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_3_01",
				limit_spawners = 3,
				points = 16,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_01",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_3_special_01",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_3_01",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_3"
			}
		},
		event_drug_lab_third_floor_c = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_3_02",
				limit_spawners = 3,
				points = 8,
				breed_tags = {
					{
						"far"
					}
				}
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_02",
				limit_spawners = 3,
				points = 12,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_02",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_3_special_02",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"disabler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_3_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_3"
			}
		},
		event_drug_lab_third_floor_d = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_drug_lab_floor_3_02",
				limit_spawners = 3,
				points = 16,
				breed_tags = {
					{
						"melee"
					}
				}
			},
			{
				"delay",
				duration = 4
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_drug_lab_floor_3_02",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"elite"
					}
				}
			},
			{
				"try_inject_special_minion",
				spawner_group = "spawner_drug_lab_floor_3_special_02",
				max_breed_amount = 1,
				points = 12,
				breed_tags = {
					{
						"special",
						"scrambler"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 8,
				spawner_group = "spawner_drug_lab_floor_3_02",
				template_name = "standard_melee"
			},
			{
				"delay",
				duration = 20
			},
			{
				"continue_when",
				duration = 25,
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 6
				end
			},
			{
				"continue_when",
				condition = function ()
					return TerrorEventQueries.num_alive_minions() < 4
				end
			},
			{
				"delay",
				duration = 6
			},
			{
				"start_random_terror_event",
				start_event_name = "cm_raid_endevent_floor_3"
			}
		},
		event_escape_guidance = {
			{
				"spawn_by_points",
				sound_event_name = "wwise/events/minions/play_terror_event_alarm",
				spawner_group = "spawner_elevator_end",
				limit_spawners = 3,
				points = 10,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 2
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_elevator_end",
				limit_spawners = 3,
				points = 6,
				breed_tags = {
					{
						"melee"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_elevator_end",
				limit_spawners = 3,
				points = 8,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"delay",
				duration = 8
			},
			{
				"spawn_by_points",
				spawner_group = "spawner_elevator_end",
				limit_spawners = 3,
				points = 8,
				breed_tags = {
					{
						"horde"
					}
				}
			},
			{
				"start_terror_trickle",
				delay = 1,
				spawner_group = "spawner_elevator_end",
				template_name = "standard_melee"
			}
		}
	}
}

return template
