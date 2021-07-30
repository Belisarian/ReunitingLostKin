PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_to_kislev"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {437.8497, 492.077, 8, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 638, 625, true)
		end, 0.5)

		cm:scroll_camera_from_current(true, 4, {428.92, 479.697, 7.58, d_to_r(120), 4})

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.select_first_lord()
			mod.force_start_quest_battle("mission_kislev_wilderness")
		end, 4.7)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {236, 434},
	locs = {
		title="Into the land of Kislev",
		desc="Into the land of Kislev",
		mission_desc = "The border with Kislev was in days gone agreed to be where the shadow of the last mountain range reaches the open tundra. But no border is needed now, as neither man nor dwarf inhabits these plains now. We should move along the abandoned road - let's hope the men of Kislev still command these lands!",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_kislev_wilderness")
core:add_listener(
	"pj_quests_on_won_battle_kislev_wilderness",
	"pj_quests_won_battle_kislev_wilderness",
	true,
	function()
		mod.disable_movement()
		mod.set_state(mod.states.game_end)
	end,
	true
)

-- starting values
-- local char = cm:get_local_faction():faction_leader()
-- cm:teleport_to(cm:char_lookup_str(char), 655, 637, false)
-- cm:scroll_camera_from_current(true, 0.1, {437.8497, 492.077, 8, d_to_r(120), 4})
