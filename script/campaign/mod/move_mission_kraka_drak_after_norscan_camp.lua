PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_kraka_drak_after_norscan_camp"

local payload = function(char)
	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {461.246, 507.129, 6, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 681, 653, true) -- moving to Kraka Drak
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 3.5,
			{455.23, 504.43, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.set_state(mod.states.in_drak_after_norscan_camp)
		end, 4)
	end, 0.1)
end

local mission = {
	key = mission_key,
	ui_offsets = {422, 226},
	locs = {
		title="Return to Kraka Drak",
		desc="Return to Kraka Drak",
		mission_desc = "BLAH BLAH BLAH",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}

mod[mission_key] = mission
