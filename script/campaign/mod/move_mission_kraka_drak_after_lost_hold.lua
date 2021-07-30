PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_kraka_drak_after_lost_hold"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {444.2, 517.777, 6, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 681, 653, true) -- moving to Kraka Drak
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 5.5,
			{455.23, 504.43, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.set_state(mod.states.in_drak_after_lost_hold)
			mod.disable_movement()
		end, 6.5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {422, 226},
	locs = {
		title="Return to Kraka Drak",
		desc="Return to Kraka Drak",
		mission_desc = "The Royal air-fleet has taken off. Another hold overrun, another day to grieve. No horn will sound or banners raised as we return to Kraka Drak. For those brethren saved, a shadow will be cast over their existence.",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}
