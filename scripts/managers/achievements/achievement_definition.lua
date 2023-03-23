local AchievementTypes = require("scripts/settings/achievements/achievement_types")
local AchievementUITypes = require("scripts/settings/achievements/achievement_ui_types")
local AchievementLocKeys = require("scripts/settings/achievements/achievement_loc_keys")
local AchievementDefinition = class("AchievementDefinition")

AchievementDefinition.init = function (self, id, ui_type, icon, category, trigger_component, visibility_component, optional_description_id, optional_description_table, optional_previous_ids, optional_label_table)
	self._id = id
	self._label_table = optional_label_table or {}
	self._category = category
	self._trigger_component = trigger_component
	self._visibility_component = visibility_component
	self._ui_type = ui_type
	self._description_id = optional_description_id or id
	self._description_table = optional_description_table or {}
	self._previous_ids = optional_previous_ids
	self._icon = icon
	local target = self._description_table.target or self:get_target()
	self._description_table.target = target
	self._description_table.x = self._description_table.x or target
	self._score = 0
	self._rewards = nil
	self._allow_solo = false
end

AchievementDefinition.destroy = function (self)
	self._trigger_component:destroy()
	self._visibility_component:destroy()
end

AchievementDefinition.id = function (self)
	return self._id
end

AchievementDefinition.category = function (self)
	return self._category
end

AchievementDefinition.ui_type = function (self)
	return self._ui_type
end

AchievementDefinition.set_score = function (self, score)
	self._score = score
end

AchievementDefinition.score = function (self)
	return self._score
end

AchievementDefinition.get_rewards = function (self)
	return self._rewards
end

AchievementDefinition.set_rewards = function (self, rewards)
	self._rewards = rewards or {}
end

AchievementDefinition.label = function (self, unlocalized)
	local label = AchievementLocKeys.labels[self._id]

	if not unlocalized then
		label = Localize(label, true, self._label_table)
	end

	return label
end

AchievementDefinition.description = function (self, unlocalized)
	local description = AchievementLocKeys.descriptions[self._description_id]

	if not unlocalized then
		description = Localize(description, true, self._description_table)
	end

	return description
end

AchievementDefinition.icon = function (self)
	return self._icon
end

AchievementDefinition.get_related_achievements = function (self)
	local _, triggers = self._trigger_component:get_triggers()

	if self._ui_type == AchievementUITypes.meta then
		return triggers
	end

	return self._previous_ids
end

AchievementDefinition.is_visible = function (self, constant_achievement_data)
	return self._visibility_component:is_visible(constant_achievement_data)
end

AchievementDefinition.is_completed = function (self, constant_achievement_data)
	return constant_achievement_data.completed[self._id] ~= nil
end

AchievementDefinition.completed_time = function (self, constant_achievement_data)
	local completed = constant_achievement_data.completed[self._id]

	if type(completed) == "string" then
		return completed
	end

	return nil
end

AchievementDefinition.trigger = function (self, constant_achievement_data, trigger_type, ...)
	if self:is_completed(constant_achievement_data) then
		return false
	end

	return self._trigger_component:trigger(constant_achievement_data, trigger_type, ...)
end

AchievementDefinition.get_triggers = function (self)
	return self._trigger_component:get_triggers()
end

AchievementDefinition.get_target = function (self)
	return self._trigger_component:get_target()
end

AchievementDefinition.get_progress = function (self, constant_achievement_data)
	if self:is_completed(constant_achievement_data) then
		return self:get_target()
	end

	return self._trigger_component:get_progress(constant_achievement_data)
end

return AchievementDefinition
