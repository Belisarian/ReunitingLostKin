PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "move_mission_to_ravnsvake_after_ambush"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {441.88, 507.61, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 655, 637, true) -- moving to krak ravn
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 7.5,
			{435.1758, 504.4275, 7, d_to_r(120), 4},
			{437.8497, 492.077, 8, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)

			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							mod.select_first_lord()
							mod.force_start_quest_battle("mission_ravnsvake")
						end, 0.1)
						cm:remove_callback("pj_quests_check_ravnsvake_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_ravnsvake_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/lzd/lzd_win") -- 4196510.wem
		end, 8)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {308, 351},
	locs = {
		title="March to Kraka Ravnsvake",
		desc="March to Kraka Ravnsvake",
		mission_desc = "The Ratmen have turned tails - for now. We should not linger far from freindly keeps - Lets make haste and march towards Kraka Ravnsvake.",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_ravnsvake")
core:add_listener(
	"pj_quests_on_won_battle_ravnsvake",
	"pj_quests_won_battle_ravnsvake",
	true,
	function()
		mod.set_state(mod.states.in_kraka_ravn)
		mod.disable_movement()
	end,
	true
)


-- this is the starting char and camera position
-- local char = cm:get_faction(cm:get_local_faction_name(true)):faction_leader()
-- cm:scroll_camera_from_current(true, 0.1, {441.88, 507.61, 4, d_to_r(120), 4})
-- cm:teleport_to(cm:char_lookup_str(char), 660, 658, false)
