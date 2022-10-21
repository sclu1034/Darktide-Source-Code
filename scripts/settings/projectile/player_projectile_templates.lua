local ArmorSettings = require("scripts/settings/damage/armor_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local ExplosionTemplates = require("scripts/settings/damage/explosion_templates")
local LiquidAreaTemplates = require("scripts/settings/liquid_area/liquid_area_templates")
local ProjectileLocomotionTemplates = require("scripts/settings/projectile_locomotion/projectile_locomotion_templates")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local damage_types = DamageSettings.damage_types
local armor_types = ArmorSettings.types
local projectile_templates = {
	ogryn_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.grenade,
		damage = {
			fuse = {
				min_lifetime = 0.6,
				fuse_time = 1.75,
				explosion_template = ExplosionTemplates.ogryn_grenade
			},
			impact = {
				explosion_template = ExplosionTemplates.ogryn_grenade,
				damage_profile = DamageProfileTemplates.ogryn_grenade_impact,
				damage_type = damage_types.frag
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	ogryn_gauntlet_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.ogryn_gauntlet_grenade,
		damage = {
			fuse = {
				fuse_time = 0.75,
				explosion_template = ExplosionTemplates.default_gauntlet_grenade
			},
			impact = {
				damage_profile = DamageProfileTemplates.default_gauntlet_bfg,
				damage_type = damage_types.frag,
				explosion_template = ExplosionTemplates.default_gauntlet_grenade
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	ogryn_thumper_grenade_hip_fire = {
		locomotion_template = ProjectileLocomotionTemplates.ogryn_thumper_grenade,
		sticks_to_breeds = {
			chaos_plague_ogryn = true
		},
		damage = {
			fuse = {
				min_lifetime = 0.5,
				fuse_time = 1.5,
				impact_triggered = true,
				explosion_template = ExplosionTemplates.ogryn_thumper_grenade
			},
			impact = {
				first_impact_activated = true,
				damage_profile = DamageProfileTemplates.thumper_grenade_impact,
				damage_type = damage_types.ogryn_bullet_bounce,
				explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant,
				speed_to_charge_settings = {
					charge_min = 0,
					max_speed = 60,
					charge_max = 1
				}
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "stop",
					link = true,
					particle_name = "content/fx/particles/weapons/rifles/ogryn_thumper/ogryn_thumper_projectile_smoke_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	ogryn_thumper_grenade_aim = {
		locomotion_template = ProjectileLocomotionTemplates.ogryn_thumper_grenade_aimed,
		damage = {
			fuse = {
				min_lifetime = 0.5,
				fuse_time = 1.5,
				impact_triggered = true,
				explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant
			},
			impact = {
				first_impact_activated = true,
				damage_profile = DamageProfileTemplates.thumper_grenade_impact,
				damage_type = damage_types.ogryn_bullet_bounce,
				explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "stop",
					link = true,
					particle_name = "content/fx/particles/weapons/rifles/ogryn_thumper/ogryn_thumper_projectile_smoke_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	frag_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.grenade,
		damage = {
			fuse = {
				fuse_time = 2.2,
				explosion_template = ExplosionTemplates.frag_grenade
			},
			impact = {
				damage_profile = DamageProfileTemplates.frag_grenade_impact,
				damage_type = damage_types.frag
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	fire_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.grenade,
		damage = {
			fuse = {
				fuse_time = 1.7,
				explosion_template = ExplosionTemplates.fire_grenade,
				liquid_area_template = LiquidAreaTemplates.fire_grenade
			},
			impact = {
				damage_profile = DamageProfileTemplates.fire_grenade_impact,
				damage_type = damage_types.fire
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	krak_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.krak_grenade,
		sticks_to_armor_types = {
			[armor_types.resistant] = true,
			[armor_types.armored] = true,
			[armor_types.super_armor] = true
		},
		damage = {
			fuse = {
				fuse_time = 2,
				sticky_fuse_time = 2,
				explosion_template = ExplosionTemplates.krak_grenade,
				default_explosion_normal = Vector3Box(0, 0, -1)
			},
			impact = {
				damage_profile = DamageProfileTemplates.krak_grenade_impact,
				damage_type = damage_types.krak
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/krak_grenade/krak_grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			},
			target_aquired = {
				sfx = {
					event_name = "wwise/events/weapon/play_krak_detected"
				},
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/krak_grenade/krak_grenade_prime"
				}
			},
			stick = {
				sfx = {
					event_name = "wwise/events/weapon/play_krak_stuck"
				}
			},
			build_up_start = {
				sfx = {
					event_name = "wwise/events/weapon/play_krak_build_up",
					stop_build_up_event_name = "wwise/events/weapon/stop_krak_build_up"
				}
			},
			build_up_stop = {
				sfx = {
					event_name = "wwise/events/weapon/stop_krak_build_up"
				}
			}
		}
	},
	shock_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.grenade,
		damage = {
			fuse = {
				fuse_time = 2.2,
				explosion_template = ExplosionTemplates.shock_grenade
			},
			impact = {
				damage_profile = DamageProfileTemplates.frag_grenade_impact,
				damage_type = damage_types.frag
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	},
	psyker_smite_light = {
		locomotion_template = ProjectileLocomotionTemplates.smite_projectile_light,
		sticks_to_armor_types = {},
		damage = {
			impact = {
				delete_on_impact = true,
				damage_profile = DamageProfileTemplates.psyker_smite_light,
				damage_type = damage_types.force_staff_single_target
			},
			fuse = {
				fuse_time = 5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/abilities/psyker_magic_missile_01",
					set_group_invisible = "main"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	psyker_smite_light_target = {
		locomotion_template = ProjectileLocomotionTemplates.smite_projectile_light_target,
		sticks_to_armor_types = {},
		damage = {
			impact = {
				delete_on_impact = true,
				damage_profile = DamageProfileTemplates.psyker_smite_light,
				damage_type = damage_types.force_staff_single_target
			},
			fuse = {
				fuse_time = 5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					set_group_invisible = "main",
					particle_name = "content/fx/particles/abilities/psyker_magic_missile_01",
					link = true
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	psyker_smite_heavy = {
		locomotion_template = ProjectileLocomotionTemplates.smite_projectile_heavy,
		sticks_to_armor_types = {},
		damage = {
			impact = {
				delete_on_impact = true,
				damage_profile = DamageProfileTemplates.psyker_smite_heavy,
				damage_type = damage_types.force_staff_single_target
			},
			fuse = {
				fuse_time = 1.4
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					set_group_invisible = "main",
					particle_name = "content/fx/particles/abilities/psyker_smite_projectile_01",
					link = true
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	psyker_smite_heavy_target = {
		locomotion_template = ProjectileLocomotionTemplates.smite_projectile_heavy_target,
		sticks_to_armor_types = {},
		damage = {
			impact = {
				delete_on_impact = true,
				damage_profile = DamageProfileTemplates.psyker_smite_heavy,
				damage_type = damage_types.force_staff_single_target
			},
			fuse = {
				fuse_time = 5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					set_group_invisible = "main",
					particle_name = "content/fx/particles/abilities/psyker_smite_projectile_01",
					link = true
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	psyker_biomancer_soul = {
		locomotion_template = ProjectileLocomotionTemplates.smite_projectile_light,
		sticks_to_armor_types = {},
		damage = {
			impact = {
				delete_on_impact = true,
				damage_profile = DamageProfileTemplates.psyker_biomancer_soul,
				damage_type = damage_types.biomancer_soul
			},
			fuse = {
				fuse_time = 5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					set_group_invisible = "main",
					particle_name = "content/fx/particles/abilities/psyker_magic_missile_01",
					link = true
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	psyker_gunslinger_throwing_knives = {
		locomotion_template = ProjectileLocomotionTemplates.throwing_knife_projectile_true_flight,
		sticks_to_armor_types = {},
		damage = {
			use_suppresion = true,
			impact = {
				delete_on_hit_mass = true,
				damage_profile = DamageProfileTemplates.psyker_gunslinger_smite,
				damage_type = damage_types.throwing_knife,
				suppresion_settings = {
					suppression_falloff = true,
					instant_aggro = true,
					distance = 5,
					suppression_value = 5
				}
			},
			fuse = {
				fuse_time = 1.5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/abilities/psyker_throwing_knife_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_throw_knife_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_throw_knife_loop"
				}
			}
		},
		unit_rotation_offset = QuaternionBox(0.5, 0, 0, -0.5)
	},
	force_staff_ball = {
		always_hidden = true,
		locomotion_template = ProjectileLocomotionTemplates.force_staff_ball,
		sticks_to_armor_types = {},
		damage = {
			use_suppresion = true,
			impact = {
				delete_on_impact = true,
				delete_on_hit_mass = true,
				damage_profile = DamageProfileTemplates.force_staff_ball,
				damage_type = damage_types.force_staff_single_target,
				suppresion_settings = {
					suppression_falloff = true,
					instant_aggro = true,
					distance = 5,
					suppression_value = 5
				}
			},
			fuse = {
				fuse_time = 5
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					set_group_invisible = "main",
					particle_name = "content/fx/particles/abilities/psyker_smite_projectile_01",
					link = true
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
					looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
				}
			}
		}
	},
	luggable = {
		locomotion_template = ProjectileLocomotionTemplates.luggable_battery,
		damage = {
			impact = {
				damage_profile = DamageProfileTemplates.luggable_battery
			}
		}
	}
}

return projectile_templates