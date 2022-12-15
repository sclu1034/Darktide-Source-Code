local mission_vo_hm_complex_tech_priest_a = {
	mission_complex_elevator_access = {
		randomize_indexes_n = 0,
		sound_events_n = 4,
		sound_events = {
			"loc_tech_priest_a__access_elevator_01",
			"loc_tech_priest_a__access_elevator_02",
			"loc_tech_priest_a__access_elevator_03",
			"loc_tech_priest_a__access_elevator_04"
		},
		sound_events_duration = {
			6.430708,
			5.906125,
			6.012833,
			8.483645
		},
		sound_event_weights = {
			0.25,
			0.25,
			0.25,
			0.25
		},
		randomize_indexes = {}
	}
}

return settings("mission_vo_hm_complex_tech_priest_a", mission_vo_hm_complex_tech_priest_a)
