local item_dependencies = {
	player_items = {
		["content/items/characters/player/human/gear_hands/npc_vin_morrow_gloves"] = 2,
		["content/items/characters/player/human/gear_head/colonel_cap_a"] = 7,
		["content/items/characters/player/ogryn/attachment_base/male_legs"] = 10,
		["content/items/characters/player/human/gear_torso/npc_upperbody_a"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_b_fullbeard"] = 1,
		["content/items/characters/player/human/attachment_base/female_arms"] = 26,
		["content/items/characters/player/human/gear_arms/prisoner_male_upperbody_arms_01"] = 10,
		["content/items/characters/player/human/face_hair/facial_hair_b_mustache"] = 2,
		["content/items/characters/player/human/gear_arms/npc_gillia_masozi_arms"] = 1,
		["content/items/characters/player/human/faces/face_vin_morrow"] = 1,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f_01"] = 2,
		["content/items/characters/player/human/gear_head/rebreather_01_c"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_c_eyebrows"] = 4,
		["content/items/characters/player/human/gear_torso/imperial_guard_upperbody_01"] = 17,
		["content/items/characters/player/human/faces/npc_hadron_seven_three_face"] = 3,
		["content/items/characters/player/human/gear_arms/npc_upperbody_k_arms"] = 6,
		["content/items/characters/player/human/gear_torso/npc_hadron_seven_three_upperbody"] = 3,
		["content/items/characters/player/human/gear_arms/frateris_militia_upperbody_career_01_arms"] = 2,
		["content/items/characters/player/human/gear_feet/astra_shoes_f"] = 3,
		["content/items/characters/player/human/gear_arms/welder_servitor_arms_01"] = 1,
		["content/items/characters/player/ogryn/face_tattoo/face_tattoo_ogryn_01"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_b_eyebrows"] = 1,
		["content/items/characters/player/ogryn/gear_legs/ogryn_pants_e"] = 1,
		["content/items/characters/player/human/gear_legs/imperial_guard_pants_c"] = 12,
		["content/items/characters/player/human/gear_head/servitor_head_01"] = 1,
		["content/items/characters/player/ogryn/gear_hands/ogryn_gloves_f"] = 1,
		["content/items/characters/player/human/gear_legs/frateris_militia_pants_a"] = 2,
		["content/items/characters/player/human/gear_legs/npc_gillia_masozi_pants"] = 1,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f_02"] = 2,
		["content/items/characters/player/human/faces/male_caucasian_face_01"] = 19,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_f"] = 5,
		["content/items/characters/player/human/hair/hair_short_modular_b"] = 1,
		["content/items/characters/player/human/hair/hair_short_e"] = 1,
		["content/items/characters/player/human/gear_attachments/npc_hadron_seven_three_backpack_arm"] = 3,
		["content/items/characters/player/human/faces/female_african_face_04"] = 2,
		["content/items/characters/player/human/gear_arms/imperial_guard_upperbody_arms_01"] = 6,
		["content/items/characters/player/human/faces/female_asian_face_01"] = 2,
		["content/items/characters/player/human/gear_head/welder_servitor_helmet_01"] = 1,
		["content/items/characters/player/human/faces/male_african_face_01"] = 3,
		["content/items/characters/player/human/backpacks/backpack_welder_servitor_01"] = 1,
		["content/items/characters/player/ogryn/gear_attachments/ogryn_upperbody_career_01_attach_lvl_05"] = 1,
		["content/items/characters/player/human/hair/hair_short_modular_a"] = 1,
		["content/items/characters/player/human/hair/hair_short_modular_a_01"] = 1,
		["content/items/characters/player/human/gear_legs/militarum_lowerbody_b_pants"] = 5,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_b"] = 2,
		["content/items/characters/player/human/gear_arms/npc_hadron_seven_three_arms"] = 3,
		["content/items/characters/player/human/gear_arms/npc_upperbody_j_arms"] = 11,
		["content/items/characters/player/human/gear_head/npc_gillia_masozi_goggles"] = 1,
		["content/items/characters/player/human/face_hair/female_facial_hair_d"] = 2,
		["content/items/characters/player/ogryn/attachment_base/male_torso"] = 4,
		["content/items/characters/player/human/hair/hair_long_tiedback_a"] = 1,
		["content/items/characters/player/human/gear_head/imperial_guard_helmet_01"] = 10,
		["content/items/characters/player/human/gear_torso/prisoner_male_upperbody_01"] = 10,
		["content/items/characters/player/human/face_hair/facial_hair_c_mustache"] = 1,
		["content/items/characters/player/human/faces/male_african_face_02"] = 2,
		["content/items/characters/player/human/gear_legs/prisoner_male_lowerbody_01"] = 10,
		["content/items/characters/player/human/gear_feet/astra_shoes_e"] = 20,
		["content/items/characters/player/human/faces/male_middle_eastern_face_02"] = 1,
		["content/items/characters/player/human/gear_arms/npc_vin_morrow_arms"] = 2,
		["content/items/characters/player/human/gear_head/servitor_head_02"] = 1,
		["content/items/characters/player/human/gear_hands/hmn_gloves_f"] = 2,
		["content/items/characters/player/human/face_implants/bioniceye_b"] = 3,
		["content/items/characters/player/human/gear_torso/servitor_upperbody_01"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_fullbeard"] = 1,
		["content/items/characters/player/human/gear_head/cadian_command_02_b"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_fullgoatee_a"] = 6,
		["content/items/characters/player/human/hair/hair_short_mohawk_a"] = 1,
		["content/items/characters/player/human/gear_attachments/prisoner_male_belt_01"] = 10,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_01"] = 5,
		["content/items/characters/player/human/gear_arms/npc_hadron_seven_three_hand_left"] = 3,
		["content/items/characters/player/human/cine_props/servo_skull_01"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_mustache"] = 2,
		["content/items/characters/player/human/face_hair/female_facial_hair_e"] = 7,
		["content/items/characters/player/hair_colors/hair_color_black_01"] = 2,
		["content/items/characters/player/human/gear_head/cadian_command_02_c"] = 1,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_d"] = 9,
		["content/items/characters/player/human/face_implants/bioniceye_g"] = 1,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f"] = 3,
		["content/items/characters/player/human/faces/male_indian_face_01"] = 1,
		["content/items/characters/player/human/gear_head/safety_goggles_a"] = 1,
		["content/items/characters/player/human/gear_torso/imperial_guard_upperbody_01_attachment"] = 1,
		["content/items/characters/player/human/face_hair/female_facial_hair_a"] = 1,
		["content/items/characters/player/human/gear_arms/npc_upperbody_f_arms"] = 3,
		["content/items/characters/player/human/faces/female_caucasian_face_02"] = 1,
		["content/items/characters/player/human/gear_attachments/npc_iven_rannick_accessories"] = 1,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_e"] = 3,
		["content/items/characters/player/human/gear_attachments/servitor_arm_attachment_01"] = 1,
		["content/items/characters/player/human/gear_head/rebreather_01_b"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_mustache_sideburns"] = 2,
		["content/items/characters/player/human/gear_head/inquisition_rebreather_01_b_var_01"] = 1,
		["content/items/characters/player/human/gear_feet/frateris_militia_shoes_d"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_c_fullbeard"] = 1,
		["content/items/characters/player/human/faces/female_asian_face_02"] = 1,
		["content/items/characters/player/ogryn/hair/ogryn_hair_short_buzzcut_c"] = 1,
		["content/items/characters/player/human/attachment_base/female_torso"] = 2,
		["content/items/characters/player/human/hair/hair_short_shira_a"] = 1,
		["content/items/characters/player/human/faces/female_asian_face_04"] = 3,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_e"] = 5,
		["content/items/characters/player/human/gear_legs/npc_hadron_seven_three_lowerbody"] = 3,
		["content/items/characters/player/human/gear_head/cadian_command_02_a"] = 9,
		["content/items/characters/player/human/gear_head/inquisition_rebreather_01_b_var_02"] = 1,
		["content/items/characters/player/human/attachment_base/male_torso"] = 7,
		["content/items/characters/player/human/faces/male_caucasian_face_03"] = 2,
		["content/items/characters/player/human/hair/hair_short_c_02"] = 5,
		["content/items/characters/player/human/face_hair/female_facial_hair_g"] = 1,
		["content/items/characters/player/human/faces/female_african_face_01"] = 1,
		["content/items/characters/player/human/gear_torso/npc_upperbody_k"] = 6,
		["content/items/characters/player/ogryn/attachment_base/male_face_caucasian_02"] = 1,
		["content/items/characters/player/ogryn/gear_torso/ogryn_imperial_guard_upperbody_a"] = 1,
		["content/items/characters/player/human/faces/female_middle_eastern_face_02_cine_dummy"] = 1,
		["content/items/characters/player/human/gear_feet/militarum_lowerbody_b_boots"] = 4,
		["content/items/characters/player/human/gear_torso/npc_upperbody_j"] = 11,
		["content/items/characters/player/human/gear_torso/npc_vin_morrow_upperbody"] = 2,
		["content/items/characters/player/human/hair/hair_short_buzzcut_c"] = 1,
		["content/items/characters/player/human/gear_torso/npc_iven_rannick_upperbody"] = 1,
		["content/items/characters/minions/chaos_ogryn/attachments_base/arms_a"] = 1,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_b"] = 5,
		["content/items/characters/player/human/gear_feet/npc_gillia_masozi_boots"] = 1,
		["content/items/characters/player/ogryn/gear_torso/ogryn_prisoner_upperbody_a"] = 17,
		["content/items/characters/player/ogryn/attachment_base/male_face_caucasian"] = 11,
		["content/items/characters/player/human/face_hair/female_facial_hair_b"] = 2,
		["content/items/characters/player/human/faces/face_iven_rannick"] = 1,
		["content/items/characters/player/human/gear_torso/servitor_torso_01"] = 2,
		["content/items/characters/player/ogryn/gear_legs/ogryn_prisoner_lowerbody_a"] = 10,
		["content/items/characters/player/human/gear_legs/servitor_lowerbody_01"] = 2,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_shoulderpad_01"] = 10,
		["content/items/characters/player/human/face_scars/scar_face_02"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_eyebrows"] = 4,
		["content/items/characters/player/human/faces/male_asian_face_02"] = 3,
		["content/items/characters/player/human/gear_arms/npc_iven_rannick_arms"] = 1,
		["content/items/characters/player/human/gear_feet/npc_iven_rannick_boots"] = 1,
		["content/items/characters/player/human/gear_torso/npc_gillia_masozi_upperbody"] = 1,
		["content/items/characters/player/human/gear_hands/astra_gloves_d"] = 3,
		["content/items/characters/player/human/faces/male_asian_face_01"] = 4,
		["content/items/characters/player/human/gear_hands/npc_iven_rannick_gloves"] = 1,
		["content/items/characters/player/human/gear_legs/imperial_guard_lowerbody_01"] = 10,
		["content/items/characters/player/human/gear_legs/militarum_lowerbody_a_pants"] = 1,
		["content/items/characters/player/human/hair/hair_short_buzzcut_a"] = 1,
		["content/items/characters/player/human/gear_torso/frateris_militia_upperbody_career_01_lvl_03"] = 2,
		["content/items/characters/player/eye_colors/eye_color_blue_01"] = 2,
		["content/items/characters/player/human/attachment_base/male_arms"] = 10,
		["content/items/characters/player/human/hair/hair_short_c"] = 1,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_shoulderpad_01_b"] = 7,
		["content/items/characters/player/ogryn/body_tattoo/body_tattoo_ogryn_03"] = 1,
		["content/items/characters/player/hair_colors/hair_color_red_04"] = 2,
		["content/items/characters/player/human/faces/face_vin_morrow_cine_dummy"] = 1,
		["content/items/characters/player/human/gear_legs/npc_vin_morrow_lowerbody"] = 2,
		["content/items/characters/player/ogryn/gear_feet/ogryn_boots_c"] = 1,
		["content/items/weapons/player/ranged/lasgun_p1_m1"] = 14,
		["content/items/characters/player/human/gear_arms/imperial_guard_upperbody_a_01_arms"] = 16,
		["content/items/characters/player/human/gear_arms/servitor_arms_01"] = 1,
		["content/items/characters/player/human/gear_legs/npc_iven_rannick_pants"] = 1,
		["content/items/characters/player/ogryn/face_hair/ogryn_facial_hair_a_eyebrows"] = 1,
		["content/items/characters/player/human/gear_hands/hmn_gloves_a"] = 3,
		["content/items/characters/player/human/faces/male_caucasian_face_05"] = 1,
		["content/items/characters/player/human/face_scars/scar_face_07"] = 1,
		["content/items/characters/player/human/hair/hair_short_modular_a_03"] = 2,
		["content/items/characters/player/ogryn/attachment_base/male_arms"] = 10,
		["content/items/characters/player/human/gear_legs/astra_pants_a"] = 11,
		["content/items/characters/player/human/hair/hair_medium_dapper_a"] = 2,
		["content/items/characters/player/human/faces/female_middle_eastern_face_01"] = 3,
		["content/items/characters/player/human/hair/hair_medium_undercut_a"] = 7,
		["content/items/characters/player/human/gear_attachments/atoma_prime_decals_01"] = 2,
		["content/items/characters/player/human/faces/male_caucasian_face_09"] = 2,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_belt_01_a"] = 1,
		["content/items/characters/player/human/faces/female_middle_eastern_face_02"] = 1,
		["content/items/characters/player/human/face_tattoo/face_tattoo_traitor"] = 2
	},
	minion_items = {},
	weapon_items = {}
}

return item_dependencies
