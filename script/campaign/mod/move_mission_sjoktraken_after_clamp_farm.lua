PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_sjoktraken_after_clamp_farm"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {468.599, 485.13, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 694, 638, true) -- moving to the front of sjoktraken
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 4,
			{463.92, 492.46, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			cm:set_saved_value("pj_quests_clamp_farm_completed", true)
			mod.set_state(mod.states.in_sjok_after_clamp_farm)
			mod.disable_movement()
		end, 5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {502, 309},
	locs = {
		title="Return to Sjoktraken",
		desc="Return to Sjoktraken",
		mission_desc = "The shapeshifter's sway over these lands are no more. The farmhands can return and resume their duties. We should head back.  ",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}
