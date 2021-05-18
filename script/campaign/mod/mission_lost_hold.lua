PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_lost_hold"

local payload = function(char)
	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {455.23, 504.43, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 667, 669, true)
		end, 0.5)

		cm:scroll_camera_from_current(true, 5.5, {444.2, 517.777, 6, d_to_r(120), 4})

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)

			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							mod.select_first_lord()
							mod.force_start_quest_battle("mission_lost_hold")
						end, 0.1)
						cm:remove_callback("pj_quests_check_lost_hold_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_lost_hold_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/twilight/twilight_intro")
		end, 6.5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {310, 162},
	locs = {
		title="The Lost Hold",
		desc="The Lost Hold",
		mission_desc = "The lord to the hold Grung Dobekzhuf and the patriarch of clan Bergfort have for months been besieges by norscan marauders. The council of Lords, have on behalf of the high king of Kraka Drak assembled a smaller force, with the sole purpose to evacuate the remaining inhabitants. By means of the royal air-fleet, we are to dock the mountain peak and lift the survivors off the mountain.\n\n Payment upon completion: 7000",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_lost_hold")
core:add_listener(
	"pj_quests_on_won_battle_lost_hold",
	"pj_quests_won_battle_lost_hold",
	true,
	function()
		mod.set_state(mod.states.after_lost_hold)
	end,
	true
)

-- this are the starting char coordinates:
-- cm:teleport_to(cm:char_lookup_str(char), 681, 653, false)
