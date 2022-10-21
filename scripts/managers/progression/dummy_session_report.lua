local DummySessionReport = {
	fetch_session_report = function (account_id)
		local session_report = {
			sessionId = "7aef2764-1c91-5aee-92bc-82285fa9653a",
			mission = {
				passedXpLimit = true,
				startTime = "1618834762768",
				playTimeSeconds = 274.189002990723,
				win = false,
				resistance = 1,
				appliedEvent = "",
				challenge = 1,
				missionName = "the-mission-name",
				sideMissions = {}
			},
			serverDetails = {
				type = "local",
				properties = {
					serverId = "4141e272-249f-428a-836a-1f5152097b86",
					ipAddress = "127.0.0.1"
				}
			},
			team = {
				sessionStatistics = {
					{
						typePath = "stat/minion_kills",
						sessionValue = 26
					},
					{
						typePath = "stat/player_deaths",
						sessionValue = 4
					}
				},
				participants = {
					{
						characterId = "3fae375d-1345-4145-a5a9-e06da58a94c3",
						progression = {
							{
								currentXp = 5158,
								currentXpInLevel = 5158,
								id = "3fae375d-1345-4145-a5a9-e06da58a94c3",
								type = "character",
								currentLevel = 4,
								neededXpForNextLevel = 0,
								startXp = 4553,
								eligibleForLevel = true
							},
							{
								currentXp = 5158,
								currentXpInLevel = 5158,
								id = "ef46ae26-d846-4544-9dea-be337ad12445",
								type = "account",
								currentLevel = 1,
								neededXpForNextLevel = 14842,
								startXp = 4553,
								eligibleForLevel = false
							},
							{
								currentXp = 5158,
								currentXpInLevel = 5158,
								id = "default-zealot-slot_primary",
								type = "weapon",
								currentLevel = 1,
								neededXpForNextLevel = 0,
								startXp = 4553,
								eligibleForLevel = true
							},
							{
								currentXp = 5158,
								currentXpInLevel = 5158,
								id = "default-zealot-slot_secondary",
								type = "weapon",
								currentLevel = 1,
								neededXpForNextLevel = 0,
								startXp = 4553,
								eligibleForLevel = true
							}
						},
						accountId = account_id,
						rewardCards = {
							{
								kind = "xp",
								rewards = {
									{
										source = "salary",
										rewardType = "xp",
										amount = 1337,
										details = {
											fromTotalBonus = 100,
											fromSideMissionBonus = 250,
											total = 1337,
											fromCircumstance = 735,
											fromSideMission = 50
										}
									}
								}
							},
							{
								kind = "levelUp",
								target = "character",
								level = 4,
								rewards = {
									{
										gearId = "ef2ae1dc-09ca-49e4-9722-1899c15ab326",
										masterId = "content/items/characters/player/human/gear_head/astra_upperbody_a_01_helmet",
										rewardType = "item"
									},
									{
										gearId = "ef2ae1dd-09ca-49e4-9722-1899c15ab326",
										masterId = "content/items/characters/player/human/gear_head/astra_upperbody_a_02_helmet",
										rewardType = "item"
									}
								}
							},
							{
								kind = "levelUp",
								target = "character",
								level = 5,
								rewards = {
									{
										gearId = "ef2ae1df-09ca-49e4-9722-1899c15ab326",
										masterId = "content/items/characters/player/human/gear_head/astra_upperbody_a_04_helmet",
										rewardType = "item"
									}
								}
							},
							{
								kind = "levelUp",
								target = "character",
								level = 8,
								rewards = {
									{
										gearId = "eed3b4df-ac17-4cb4-8858-94b4cf1c450e",
										masterId = "content/items/2d/insignias/sigil_01",
										rewardType = "gear"
									}
								}
							},
							{
								kind = "levelUp",
								target = "character",
								level = 10,
								rewards = {}
							},
							{
								kind = "salary",
								rewards = {
									{
										rewardType = "currency",
										currency = "credits",
										source = "salary",
										amount = 5513,
										details = {
											fromTotalBonus = 0,
											fromSideMissionBonus = 0,
											total = 5513,
											fromCircumstance = 1103,
											fromSideMission = 0
										}
									},
									{
										rewardType = "currency",
										currency = "plasteel",
										source = "missionPickup",
										amount = 10,
										details = {
											total = 10
										}
									},
									{
										rewardType = "currency",
										currency = "diamantine",
										source = "missionPickup",
										amount = 0,
										details = {
											total = 5
										}
									}
								}
							},
							{
								kind = "weaponDrop",
								rewards = {
									{
										masterId = "content/items/weapons/player/melee/chainsword_p1_m1",
										rewardType = "gear",
										gearId = "80157266-b9c3-4668-8460-5e679adacb30",
										source = "weaponDrop",
										overrides = {}
									}
								}
							}
						},
						characterDetails = {
							selected_voice = "veteran_male_a",
							skin_color = "skin_dark_02",
							gender = "male",
							hair_color = "hair_green_03",
							class = "zealot",
							id = "3fae375d-1345-4145-a5a9-e06da58a94c3",
							breed = "human",
							lore = {
								backstory = {}
							},
							abilities = {
								combat_ability = "zealot_dash",
								grenade_ability = "fire_grenade"
							},
							inventory = {
								slot_body_legs = "cosmetic-3fae375d-1345-4145-a5a9-e06da58a94c3-slot_body_legs",
								slot_secondary = "default-zealot-slot_secondary",
								slot_gear_shoes = "default-zealot-slot_gear_shoes",
								slot_body_arms = "cosmetic-3fae375d-1345-4145-a5a9-e06da58a94c3-slot_body_arms",
								slot_gear_arms = "default-zealot-slot_gear_arms",
								slot_gear_legs = "default-zealot-slot_gear_legs",
								slot_body_face = "cosmetic-3fae375d-1345-4145-a5a9-e06da58a94c3-slot_body_face",
								slot_body_torso = "cosmetic-3fae375d-1345-4145-a5a9-e06da58a94c3-slot_body_torso",
								slot_primary = "default-zealot-slot_primary",
								slot_gear_head = "default-zealot-slot_gear_head",
								slot_gear_gloves = "default-zealot-slot_gear_gloves",
								slot_gear_torso = "default-zealot-slot_gear_torso",
								slot_body_hair = "cosmetic-3fae375d-1345-4145-a5a9-e06da58a94c3-slot_body_hair"
							}
						}
					}
				}
			}
		}

		return session_report
	end
}
local xp_tables = {
	character = {
		0,
		500,
		1085,
		1755,
		2510,
		3350,
		4275,
		5285,
		6380,
		7560
	},
	account = {
		0,
		20000,
		41500,
		64500,
		89000
	},
	weapon = {
		0,
		750,
		2375,
		5000,
		8750,
		13750,
		20125
	}
}

DummySessionReport.fetch_xp_table = function (entity_type)
	local xp_table = xp_tables[entity_type]

	return xp_table
end

DummySessionReport.fetch_inventory = function (session_report)
	local inventory = session_report.team.participants[1].characterDetails.inventory

	return inventory
end

return DummySessionReport