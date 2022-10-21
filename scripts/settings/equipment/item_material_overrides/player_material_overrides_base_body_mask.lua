local material_overrides = {
	mask_torso_keep_collar = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.8
			}
		}
	},
	mask_arms_keep_forearms = {
		property_overrides = {
			mask_top_bottom = {
				0.25,
				0.4
			}
		}
	},
	mask_arms_keep_forearms_and_hands = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.4
			}
		}
	},
	mask_arms_keep_hands = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.8
			}
		}
	},
	mask_arms_keep_fingers = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.9
			}
		}
	},
	mask_arms_shoulders_01 = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.05
			}
		}
	},
	mask_arms_shoulders_02 = {
		property_overrides = {
			mask_top_bottom = {
				0,
				0.1
			}
		}
	},
	mask_legs_keep_knees = {
		property_overrides = {
			mask_top_bottom = {
				1,
				0.1
			}
		}
	}
}

return material_overrides