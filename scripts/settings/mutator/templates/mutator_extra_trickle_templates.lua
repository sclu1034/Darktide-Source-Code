local HordeCompositions = require("scripts/managers/pacing/horde_pacing/horde_compositions")
local mutator_templates = {
	mutator_chaos_hounds = {
		class = "scripts/managers/mutator/mutators/mutator_extra_trickle_hordes",
		description = {
			"loc_mutator_minion_nurgle_blessing_description_1",
			"loc_mutator_minion_nurgle_blessing_description_2",
			"loc_mutator_minion_nurgle_blessing_description_3"
		},
		trickle_horde_templates = {
			{
				stinger_duration = 8,
				num_trickle_hordes_active_for_cooldown = 20,
				not_during_terror_events = true,
				min_players_alive = 2,
				optional_num_tries = 6,
				optional_main_path_offset = 50,
				stinger = "wwise/events/minions/play_chaos_hound_spawn_stinger_circumstance",
				ignore_disallowance = true,
				horde_compositions = {
					trickle_horde = {
						renegade = {
							none = {
								HordeCompositions.mutator_chaos_hounds
							},
							low = {
								HordeCompositions.mutator_chaos_hounds
							},
							high = {
								HordeCompositions.mutator_chaos_hounds
							},
							poxwalkers = {
								HordeCompositions.mutator_chaos_hounds
							}
						},
						cultist = {
							none = {
								HordeCompositions.mutator_chaos_hounds
							},
							low = {
								HordeCompositions.mutator_chaos_hounds
							},
							high = {
								HordeCompositions.mutator_chaos_hounds
							},
							poxwalkers = {
								HordeCompositions.mutator_chaos_hounds
							}
						}
					}
				},
				trickle_horde_travel_distance_range = {
					110,
					260
				},
				trickle_horde_cooldown = {
					40,
					45
				},
				pause_pacing_on_spawn = {
					roamers = 20,
					hordes = 40,
					trickle_hordes = 40,
					specials = 50
				},
				num_trickle_waves = {
					3,
					5
				},
				time_between_waves = {
					7,
					10
				},
				group_sound_event_names = {
					stop = "wwise/events/minions/stop_chaos_hound_group_sound",
					start = "wwise/events/minions/play_chaos_hound_group_sound"
				}
			}
		}
	},
	mutator_snipers = {
		class = "scripts/managers/mutator/mutators/mutator_extra_trickle_hordes",
		description = {
			"loc_mutator_minion_nurgle_blessing_description_1",
			"loc_mutator_minion_nurgle_blessing_description_2",
			"loc_mutator_minion_nurgle_blessing_description_3"
		},
		trickle_horde_templates = {
			{
				stinger_duration = 8,
				num_trickle_hordes_active_for_cooldown = 20,
				not_during_terror_events = true,
				optional_num_tries = 6,
				optional_main_path_offset = 50,
				stinger = "wwise/events/minions/play_chaos_hound_spawn_stinger_circumstance",
				ignore_disallowance = true,
				horde_compositions = {
					trickle_horde = {
						renegade = {
							none = {
								HordeCompositions.mutator_snipers
							},
							low = {
								HordeCompositions.mutator_snipers
							},
							high = {
								HordeCompositions.mutator_snipers
							},
							poxwalkers = {
								HordeCompositions.mutator_snipers
							}
						},
						cultist = {
							none = {
								HordeCompositions.mutator_snipers
							},
							low = {
								HordeCompositions.mutator_snipers
							},
							high = {
								HordeCompositions.mutator_snipers
							},
							poxwalkers = {
								HordeCompositions.mutator_snipers
							}
						}
					}
				},
				trickle_horde_travel_distance_range = {
					110,
					230
				},
				trickle_horde_cooldown = {
					40,
					45
				},
				pause_pacing_on_spawn = {
					roamers = 20,
					hordes = 40,
					trickle_hordes = 40,
					specials = 50
				},
				num_trickle_waves = {
					2,
					3
				},
				time_between_waves = {
					7,
					10
				}
			}
		}
	},
	mutator_poxwalker_bombers = {
		class = "scripts/managers/mutator/mutators/mutator_extra_trickle_hordes",
		description = {
			"loc_mutator_minion_nurgle_blessing_description_1",
			"loc_mutator_minion_nurgle_blessing_description_2",
			"loc_mutator_minion_nurgle_blessing_description_3"
		},
		trickle_horde_templates = {
			{
				num_trickle_hordes_active_for_cooldown = 20,
				not_during_terror_events = true,
				spawn_max_health_modifier = 0.9,
				optional_num_tries = 6,
				ignore_disallowance = true,
				horde_compositions = {
					trickle_horde = {
						renegade = {
							none = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							low = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							high = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							poxwalkers = {
								HordeCompositions.mutator_poxwalker_bombers
							}
						},
						cultist = {
							none = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							low = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							high = {
								HordeCompositions.mutator_poxwalker_bombers
							},
							poxwalkers = {
								HordeCompositions.mutator_poxwalker_bombers
							}
						}
					}
				},
				trickle_horde_travel_distance_range = {
					60,
					180
				},
				trickle_horde_cooldown = {
					40,
					45
				},
				pause_pacing_on_spawn = {
					roamers = 10,
					hordes = 30,
					trickle_hordes = 20,
					specials = 30
				},
				optional_main_path_offset = {
					-60,
					60
				},
				num_trickle_waves = {
					6,
					14
				},
				time_between_waves = {
					1,
					4
				}
			}
		}
	},
	mutator_mutants = {
		class = "scripts/managers/mutator/mutators/mutator_extra_trickle_hordes",
		description = {
			"loc_mutator_minion_nurgle_blessing_description_1",
			"loc_mutator_minion_nurgle_blessing_description_2",
			"loc_mutator_minion_nurgle_blessing_description_3"
		},
		trickle_horde_templates = {
			{
				stinger_duration = 8,
				num_trickle_hordes_active_for_cooldown = 20,
				not_during_terror_events = true,
				spawn_max_health_modifier = 0.8,
				optional_num_tries = 6,
				optional_main_path_offset = 50,
				stinger = "wwise/events/minions/play_chaos_hound_spawn_stinger_circumstance",
				ignore_disallowance = true,
				horde_compositions = {
					trickle_horde = {
						renegade = {
							none = {
								HordeCompositions.mutator_mutants
							},
							low = {
								HordeCompositions.mutator_mutants
							},
							high = {
								HordeCompositions.mutator_mutants
							},
							poxwalkers = {
								HordeCompositions.mutator_mutants
							}
						},
						cultist = {
							none = {
								HordeCompositions.mutator_mutants
							},
							low = {
								HordeCompositions.mutator_mutants
							},
							high = {
								HordeCompositions.mutator_mutants
							},
							poxwalkers = {
								HordeCompositions.mutator_mutants
							}
						}
					}
				},
				trickle_horde_travel_distance_range = {
					110,
					230
				},
				trickle_horde_cooldown = {
					40,
					45
				},
				pause_pacing_on_spawn = {
					roamers = 20,
					hordes = 40,
					trickle_hordes = 40,
					specials = 50
				},
				num_trickle_waves = {
					3,
					4
				},
				time_between_waves = {
					7,
					10
				}
			}
		}
	},
	mutator_riflemen = {
		class = "scripts/managers/mutator/mutators/mutator_extra_trickle_hordes",
		description = {
			"loc_mutator_minion_nurgle_blessing_description_1",
			"loc_mutator_minion_nurgle_blessing_description_2",
			"loc_mutator_minion_nurgle_blessing_description_3"
		},
		trickle_horde_templates = {
			{
				stinger_duration = 8,
				num_trickle_hordes_active_for_cooldown = 20,
				not_during_terror_events = true,
				optional_num_tries = 6,
				optional_main_path_offset = 50,
				stinger = "wwise/events/minions/play_chaos_hound_spawn_stinger_circumstance",
				ignore_disallowance = true,
				horde_compositions = {
					trickle_horde = {
						renegade = {
							none = {
								HordeCompositions.mutator_riflemen
							},
							low = {
								HordeCompositions.mutator_riflemen
							},
							high = {
								HordeCompositions.mutator_riflemen
							},
							poxwalkers = {
								HordeCompositions.mutator_riflemen
							}
						},
						cultist = {
							none = {
								HordeCompositions.mutator_riflemen
							},
							low = {
								HordeCompositions.mutator_riflemen
							},
							high = {
								HordeCompositions.mutator_riflemen
							},
							poxwalkers = {
								HordeCompositions.mutator_riflemen
							}
						}
					}
				},
				trickle_horde_travel_distance_range = {
					110,
					230
				},
				trickle_horde_cooldown = {
					40,
					45
				},
				pause_pacing_on_spawn = {
					roamers = 20,
					hordes = 40,
					trickle_hordes = 40,
					specials = 50
				}
			}
		}
	}
}

return mutator_templates
