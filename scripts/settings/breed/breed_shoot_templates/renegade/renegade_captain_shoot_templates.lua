local DamageSettings = require("scripts/settings/damage/damage_settings")
local EffectTemplates = require("scripts/settings/fx/effect_templates")
local HitScanTemplates = require("scripts/settings/projectile/hit_scan_templates")
local LineEffects = require("scripts/settings/effects/line_effects")
local damage_types = DamageSettings.damage_types
local renegade_captain_hellgun_default = {
	shoot_vfx_name = "content/fx/particles/weapons/rifles/lasgun/lasgun_muzzle_3rd",
	scope_reflection_vfx_name = "content/fx/particles/enemies/riflemen_scope_flash",
	collision_filter = "filter_minion_shooting",
	scope_reflection_timing = 0.4,
	scope_reflection_distance = 3,
	hit_scan_template = HitScanTemplates.gunner_bullet_sweep,
	spread = math.degrees_to_radians(1.5),
	effect_template = EffectTemplates.renegade_captain_hellgun,
	damage_type = damage_types.minion_laser,
	line_effect = LineEffects.renegade_gunner_lasbeam
}
local renegade_captain_hellgun_spray_and_pray = table.clone(renegade_captain_hellgun_default)
renegade_captain_hellgun_spray_and_pray.effect_template = EffectTemplates.renegade_captain_hellgun_spray_and_pray
local renegade_captain_bolt_pistol = table.clone(renegade_captain_hellgun_default)
renegade_captain_bolt_pistol.hit_scan_template = HitScanTemplates.renegade_captain_bolt_pistol_boltshell
renegade_captain_bolt_pistol.spread = math.degrees_to_radians(0.2)
renegade_captain_bolt_pistol.effect_template = nil
renegade_captain_bolt_pistol.shoot_sound_event = "wwise/events/weapon/play_minion_laspistol"
renegade_captain_bolt_pistol.shoot_vfx_name = "content/fx/particles/weapons/rifles/bolter/bolter_muzzle"
renegade_captain_bolt_pistol.damage_type = damage_types.boltshell
renegade_captain_bolt_pistol.line_effect = LineEffects.renegade_captain_boltshell
local renegade_captain_plasma_pistol = table.clone(renegade_captain_hellgun_default)
renegade_captain_plasma_pistol.hit_scan_template = HitScanTemplates.renegade_captain_plasma_pistol_plasma
renegade_captain_plasma_pistol.spread = math.degrees_to_radians(0.1)
renegade_captain_plasma_pistol.effect_template = nil
renegade_captain_plasma_pistol.shoot_sound_event = "wwise/events/weapon/play_minion_plasmapistol"
renegade_captain_plasma_pistol.shoot_vfx_name = "content/fx/particles/weapons/rifles/plasma_gun/plasma_muzzle_ks"
renegade_captain_plasma_pistol.damage_type = damage_types.minion_plasma
renegade_captain_plasma_pistol.scope_reflection_timing = nil
renegade_captain_plasma_pistol.scope_reflection_vfx_name = nil
renegade_captain_plasma_pistol.scope_reflection_distance = nil
renegade_captain_plasma_pistol.line_effect = LineEffects.renegade_captain_plasma_beam
local shoot_templates = {
	renegade_captain_plasma_pistol = renegade_captain_plasma_pistol,
	renegade_captain_bolt_pistol = renegade_captain_bolt_pistol,
	renegade_captain_hellgun_default = renegade_captain_hellgun_default,
	renegade_captain_hellgun_spray_and_pray = renegade_captain_hellgun_spray_and_pray
}

return shoot_templates