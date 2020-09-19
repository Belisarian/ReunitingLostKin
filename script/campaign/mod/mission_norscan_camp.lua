PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_norscan_camp"

local payload = function(char)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {236, 434},
	locs = {
		title="Norscan Camp",
		desc="Norscan Camp",
		mission_desc = "The frozen ground echos, win or lose the crows will never go hungry.",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
}
