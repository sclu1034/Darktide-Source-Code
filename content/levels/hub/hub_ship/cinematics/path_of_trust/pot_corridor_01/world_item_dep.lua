local item_dependencies = {
	player_items = {
		["content/items/characters/player/human/faces/female_asian_face_01"] = 2,
		["content/items/characters/player/human/faces/male_african_face_01"] = 5,
		["content/items/characters/player/human/gear_arms/npc_upperbody_k_arms"] = 2,
		["content/items/characters/player/human/gear_torso/npc_upperbody_a"] = 1,
		["content/items/weapons/player/melee/ogryn_combatblade_p1_m1"] = 1,
		["content/items/characters/player/human/attachment_base/female_arms"] = 11,
		["content/items/characters/player/human/gear_arms/prisoner_male_upperbody_arms_01"] = 2,
		["content/items/weapons/player/ranged/lasgun_p1_m1"] = 3,
		["content/items/characters/player/ogryn/face_hair/ogryn_facial_hair_a_goattee_mustache"] = 1,
		["content/items/characters/player/eye_colors/eye_color_purple_01"] = 2,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f_01"] = 2,
		["content/items/characters/player/human/gear_head/rebreather_01_c"] = 1,
		["content/items/characters/player/human/attachment_base/female_legs"] = 1,
		["content/items/characters/player/ogryn/gear_feet/ogryn_boots_e"] = 2,
		["content/items/characters/player/human/gear_attachments/atoma_prime_decals_01"] = 2,
		["content/items/characters/player/human/gear_torso/imperial_guard_upperbody_01"] = 8,
		["content/items/characters/player/human/gear_torso/imperial_guard_upperbody_01_attachment"] = 1,
		["content/items/characters/player/ogryn/attachment_base/male_arms"] = 5,
		["content/items/characters/player/human/attachment_base/female_torso"] = 5,
		["content/items/characters/player/human/face_hair/female_facial_hair_e"] = 5,
		["content/items/characters/player/ogryn/body_tattoo/body_tattoo_ogryn_01"] = 1,
		["content/items/characters/player/human/face_hair/female_facial_hair_d"] = 1,
		["content/items/characters/player/human/faces/female_asian_face_02"] = 1,
		["content/items/characters/player/human/gear_legs/imperial_guard_pants_c"] = 9,
		["content/items/characters/player/ogryn/attachment_base/male_torso"] = 4,
		["content/items/characters/player/human/attachment_base/male_legs"] = 1,
		["content/items/characters/player/human/face_implants/bioniceye_b"] = 1,
		["content/items/characters/player/human/gear_torso/npc_iven_rannick_upperbody"] = 2,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f_02"] = 2,
		["content/items/characters/player/human/gear_upperbody/psyker_upperbody_career_01_lvl_05_set_01"] = 1,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_f"] = 2,
		["content/items/characters/player/human/hair/hair_short_modular_b"] = 1,
		["content/items/characters/player/human/gear_arms/imperial_guard_upperbody_arms_01"] = 3,
		["content/items/characters/player/human/gear_feet/militarum_lowerbody_b_boots"] = 2,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_c"] = 2,
		["content/items/characters/player/human/gear_legs/militarum_lowerbody_a_pants"] = 2,
		["content/items/characters/player/ogryn/attachment_base/male_legs"] = 1,
		["content/items/characters/player/ogryn/face_hair/ogryn_facial_hair_b_fullbeard"] = 1,
		["content/items/characters/player/hair_colors/hair_color_brown_01"] = 3,
		["content/items/characters/player/human/gear_hands/hmn_gloves_f"] = 1,
		["content/items/characters/player/human/hair/hair_short_c"] = 2,
		["content/items/characters/player/human/hair/hair_short_modular_a"] = 1,
		["content/items/characters/player/human/hair/hair_short_modular_a_01"] = 1,
		["content/items/characters/player/human/hair/hair_short_d"] = 1,
		["content/items/characters/player/eye_colors/eye_color_blue_01"] = 2,
		["content/items/characters/player/ogryn/face_hair/ogryn_facial_hair_c_fullbeard"] = 1,
		["content/items/characters/player/hair_colors/hair_color_black_01"] = 2,
		["content/items/characters/player/human/gear_legs/imperial_guard_lowerbody_01"] = 4,
		["content/items/characters/player/human/gear_feet/frateris_militia_shoes_d"] = 2,
		["content/items/characters/player/human/gear_lowerbody/psyker_lowerbody_career_01_lvl_04_set_01"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_a_mustache_sideburns"] = 1,
		["content/items/characters/player/human/gear_head/imperial_guard_helmet_01"] = 4,
		["content/items/characters/player/human/gear_head/psyker_career_01_lvl_04_headgear_set_01"] = 1,
		["content/items/characters/player/human/face_hair/facial_hair_b_mustache"] = 1,
		["content/items/characters/player/human/gear_hands/frateris_militia_gloves_b"] = 1,
		["content/items/characters/player/human/gear_lowerbody/zealot_lowerbody_career_01_lvl_05_set_01"] = 1,
		["content/items/characters/player/human/gear_feet/astra_shoes_e"] = 4,
		["content/items/characters/player/human/gear_arms/npc_upperbody_f_arms"] = 3,
		["content/items/characters/player/human/gear_lowerbody/psyker_lowerbody_career_01_lvl_05_set_01"] = 1,
		["content/items/characters/player/human/gear_head/rebreather_01_b"] = 1,
		["content/items/characters/player/human/gear_attachments/npc_iven_rannick_accessories"] = 2,
		["content/items/characters/player/human/gear_feet/frateris_militia_shoes_a"] = 1,
		["content/items/characters/player/human/face_hair/female_facial_hair_base"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_fullbeard"] = 2,
		["content/items/characters/player/human/gear_head/cadian_command_02_b"] = 1,
		["content/items/characters/player/human/gear_legs/prisoner_male_lowerbody_01"] = 2,
		["content/items/characters/player/human/hair/hair_short_mohawk_a"] = 1,
		["content/items/characters/player/human/gear_attachments/prisoner_male_belt_01"] = 2,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_01"] = 5,
		["content/items/characters/player/human/gear_upperbody/psyker_upperbody_career_01_lvl_04_set_01"] = 1,
		["content/items/characters/player/ogryn/hair/ogryn_hair_short_mohawk_a"] = 1,
		["content/items/characters/player/eye_colors/eye_color_psyker_01"] = 1,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_d"] = 4,
		["content/items/characters/player/human/gear_torso/npc_upperbody_f"] = 3,
		["content/items/characters/player/human/gear_head/safety_goggles_a"] = 1,
		["content/items/characters/player/human/faces/female_caucasian_face_02"] = 4,
		["content/items/characters/player/ogryn/face_tattoo/face_tattoo_ogryn_02"] = 1,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_e"] = 1,
		["content/items/characters/player/human/gear_attachments/frateris_militia_upperbody_career_01_attach_lvl_03"] = 1,
		["content/items/characters/player/ogryn/gear_lowerbody/ogryn_lowerbody_career_01_lvl_04_set_01"] = 1,
		["content/items/characters/player/human/gear_head/inquisition_rebreather_01_b_var_01"] = 2,
		["content/items/characters/player/ogryn/face_scars/ogryn_scar_face_01"] = 1,
		["content/items/characters/player/human/hair/hair_short_shira_a"] = 1,
		["content/items/characters/player/human/faces/female_asian_face_04"] = 3,
		["content/items/characters/player/human/gear_upperbody/zealot_upperbody_career_01_lvl_05_set_01"] = 1,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_e"] = 2,
		["content/items/characters/player/human/gear_head/cadian_command_02_a"] = 3,
		["content/items/characters/player/human/gear_head/inquisition_rebreather_01_b_var_02"] = 1,
		["content/items/characters/player/human/attachment_base/male_torso"] = 7,
		["content/items/characters/player/human/faces/male_caucasian_face_03"] = 1,
		["content/items/characters/player/human/hair/hair_short_c_02"] = 1,
		["content/items/characters/player/human/faces/male_caucasian_face_01"] = 6,
		["content/items/characters/player/human/gear_torso/npc_upperbody_k"] = 2,
		["content/items/characters/player/ogryn/gear_hands/ogryn_gloves_b"] = 2,
		["content/items/characters/player/ogryn/hair/ogryn_hair_short_modular_b_02"] = 2,
		["content/items/characters/player/human/gear_feet/militarum_lowerbody_a_boots"] = 1,
		["content/items/characters/player/human/gear_torso/npc_upperbody_j"] = 2,
		["content/items/characters/player/human/gear_hands/imperial_guard_gloves_b"] = 2,
		["content/items/characters/player/human/gear_legs/frateris_militia_pants_a"] = 2,
		["content/items/characters/player/human/hair/hair_long_tiedback_a"] = 1,
		["content/items/characters/player/human/gear_feet/imperial_guard_shoes_b"] = 3,
		["content/items/characters/player/ogryn/gear_torso/ogryn_prisoner_upperbody_a"] = 1,
		["content/items/characters/player/ogryn/attachment_base/male_face_caucasian"] = 2,
		["content/items/characters/player/human/faces/face_iven_rannick"] = 2,
		["content/items/characters/player/human/gear_arms/frateris_militia_upperbody_career_01_arms"] = 2,
		["content/items/characters/player/ogryn/gear_legs/ogryn_prisoner_lowerbody_a"] = 1,
		["content/items/characters/player/human/gear_legs/imperial_guard_pants_b"] = 1,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_shoulderpad_01"] = 3,
		["content/items/characters/player/human/face_scars/scar_face_02"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_a_eyebrows"] = 3,
		["content/items/characters/player/human/gear_arms/npc_iven_rannick_arms"] = 2,
		["content/items/characters/player/human/gear_feet/npc_iven_rannick_boots"] = 2,
		["content/items/characters/player/ogryn/gear_torso/ogryn_upperbody_career_01_lvl_05"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_fullgoatee_a"] = 1,
		["content/items/characters/player/human/gear_hands/astra_gloves_d"] = 1,
		["content/items/characters/player/human/gear_torso/frateris_militia_upperbody_career_01"] = 1,
		["content/items/characters/player/human/faces/male_asian_face_01"] = 2,
		["content/items/weapons/player/ranged/autogun_p1_m1"] = 2,
		["content/items/characters/player/human/gear_hands/npc_iven_rannick_gloves"] = 2,
		["content/items/characters/player/human/gear_torso/prisoner_male_upperbody_01"] = 2,
		["content/items/characters/player/human/gear_legs/militarum_lowerbody_b_pants"] = 2,
		["content/items/characters/player/human/gear_arms/npc_upperbody_j_arms"] = 2,
		["content/items/characters/player/human/gear_torso/frateris_militia_upperbody_career_01_lvl_03"] = 1,
		["content/items/weapons/player/melee/powersword_2h_p1_m1"] = 2,
		["content/items/characters/player/human/attachment_base/male_arms"] = 9,
		["content/items/characters/player/ogryn/gear_upperbody/ogryn_upperbody_career_01_lvl_04_set_01"] = 1,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_shoulderpad_01_b"] = 4,
		["content/items/characters/player/hair_colors/hair_color_red_04"] = 2,
		["content/items/characters/player/ogryn/gear_legs/ogryn_pants_c"] = 2,
		["content/items/weapons/player/ranged/flamer_p1_m1"] = 1,
		["content/items/characters/player/human/gear_arms/imperial_guard_upperbody_a_01_arms"] = 6,
		["content/items/characters/player/human/face_hair/female_facial_hair_a"] = 1,
		["content/items/characters/player/ogryn/attachment_base/male_face_caucasian_03"] = 2,
		["content/items/characters/player/human/gear_legs/npc_iven_rannick_pants"] = 2,
		["content/items/characters/player/human/gear_head/psyker_career_01_lvl_05_headgear_set_01"] = 1,
		["content/items/characters/player/human/gear_hands/hmn_gloves_a"] = 2,
		["content/items/characters/player/human/hair/hair_short_bobcut_a"] = 1,
		["content/items/characters/player/human/gear_hands/hmn_gloves_c"] = 1,
		["content/items/characters/player/human/face_scars/scar_face_07"] = 1,
		["content/items/characters/player/human/hair/hair_short_modular_a_03"] = 2,
		["content/items/characters/player/human/face_hair/facial_hair_c_fullbeard"] = 1,
		["content/items/characters/player/human/hair/hair_short_reverse_mohawk_a"] = 1,
		["content/items/characters/player/human/faces/female_middle_eastern_face_01"] = 1,
		["content/items/characters/player/human/hair/hair_medium_undercut_a"] = 3,
		["content/items/weapons/player/ranged/ogryn_thumper_p1_m1"] = 2,
		["content/items/characters/player/human/faces/male_caucasian_face_09"] = 1,
		["content/items/characters/player/human/gear_attachments/imperial_guard_attachment_belt_01_a"] = 2,
		["content/items/characters/player/human/faces/female_middle_eastern_face_02"] = 2,
		["content/items/characters/player/human/face_tattoo/face_tattoo_traitor"] = 2
	},
	minion_items = {},
	weapon_items = {}
}

return item_dependencies
