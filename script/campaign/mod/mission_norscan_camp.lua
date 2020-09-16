PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_norscan_camp"

local payload = function(char)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {236, 434},
	locs = {
		title="mission_clamp_farm",
		desc="mission_clamp_farm",
		mission_desc = "mission_clamp_farm",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}
