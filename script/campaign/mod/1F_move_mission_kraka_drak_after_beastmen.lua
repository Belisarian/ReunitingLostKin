PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_kraka_drak_after_beastmen"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {453.22, 510.21, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 681, 653, true) -- moving to Kraka Drak
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 4,
			{457.9, 508.28, 5, d_to_r(120), 4},
			{455.23, 504.43, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.set_state(mod.states.in_drak_after_beastmen)
			mod.disable_movement()
		end, 5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {422, 226},
	locs = {
		title="Return to Kraka Drak",
		desc="Return to Kraka Drak",
		mission_desc = "The Beastmen are no more and the portal with them. Kraka Drak endures and prevails - such is the iron faith of our people! We should return to the capital, a celebration awaits!",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}
