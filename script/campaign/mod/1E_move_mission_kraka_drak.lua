PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

mod.move_mission_kraka_drak_payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)

		cm:scroll_camera_from_current(true, 0.1, {464.588, 495.165, 5, d_to_r(120), 4})
		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 681, 653, true)
			cm:scroll_camera_from_current(
				true, 5,
				{463.25, 505.97, 5, d_to_r(120), 4},
				{455.23, 504.43, 5, d_to_r(120), 4}
			)
			cm:callback(function()
				CampaignUI.ToggleCinematicBorders(false)
				cm:stop_user_input(false)
				mod.set_state(mod.states.in_kraka_drak)
				mod.disable_movement()
				cm:set_saved_value("pj_quests_has_left_sjoktraken_area", true)
			end, 6)
		end, 0.5)
	end, 1)
end

mod.move_mission_kraka_drak = {
	key = "move_mission_kraka_drak",
	ui_offsets = {422, 226},
	locs = {
		title="March to Kraka Drak",
		desc="March to Kraka Drak",
		mission_desc = "By royal request by the High Armourer and Captain of the Royal Guard, we are to march to Kraka Drak. We'll take the fastest way, the western inland route!",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = mod.move_mission_kraka_drak_payload,
}

-- for testing:
-- local char = cm:get_faction(cm:get_local_faction_name()):faction_leader()
-- cm:teleport_to(cm:char_lookup_str(char), 695, 641, false) -- start position at sjok before going to Kraka Drak
