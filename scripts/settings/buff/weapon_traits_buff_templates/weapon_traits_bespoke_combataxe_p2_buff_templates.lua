local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local templates = {
	weapon_trait_bespoke_combataxe_p2_increase_power_on_hit_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_hit_parent)
}
templates.weapon_trait_bespoke_combataxe_p2_increase_power_on_hit_parent.child_buff_template = "weapon_trait_bespoke_combataxe_p2_increase_power_on_hit_child"
templates.weapon_trait_bespoke_combataxe_p2_increase_power_on_hit_child = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_hit_child)
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_power_parent = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_power_parent)
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_power_parent.child_buff_template = "weapon_trait_bespoke_combataxe_p2_chained_hits_increases_power_child"
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_power_child = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_power_child)
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_crit_chance_parent = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_crit_chance_parent)
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_crit_chance_parent.child_buff_template = "weapon_trait_bespoke_combataxe_p2_chained_hits_increases_crit_chance_child"
templates.weapon_trait_bespoke_combataxe_p2_chained_hits_increases_crit_chance_child = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_crit_chance_child)
templates.weapon_trait_bespoke_combataxe_p2_infinite_melee_cleave_on_weakspot_kill = table.clone(BaseWeaponTraitBuffTemplates.infinite_melee_cleave_on_weakspot_kill)

return templates
