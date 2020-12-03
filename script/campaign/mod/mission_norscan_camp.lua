PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_norscan_camp"

local payload = function(char)
	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {455.23, 504.43, 0.1, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 690, 657, true) -- moving to Kraka Drak
		end, 0.5)

		cm:scroll_camera_from_current(true, 3.5, {461.246, 507.129, 6, d_to_r(120), 4})

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			cm:callback(function()
				mod.select_first_lord()
				mod.force_start_quest_battle("mission_norscan_camp")
			end, 1)
		end, 4)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {480, 215},
	locs = {
		title="Norscan Camp",
		desc="Norscan Camp",
		mission_desc = "A smaller Norscan tribe have settled the area and are raiding nearby caravans. Purge their presence and paint the snow red. The frozen ground echoes, win or lose, the crows never goes hungry!\n\n Payment upon completion: 3000",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_norscan_camp")
core:add_listener(
	"pj_quests_on_won_battle_norscan_camp",
	"pj_quests_won_battle_norscan_camp",
	true,
	function()
		mod.set_state(mod.states.after_norscan_camp)
	end,
	true
)

-- for testing, starting camera and army map position state
-- local char = cm:get_faction(cm:get_local_faction_name(true)):faction_leader()
-- cm:scroll_camera_from_current(true, 0.1, {455.23, 504.43, 5, d_to_r(120), 4})
-- cm:teleport_to(cm:char_lookup_str(char), 681, 653, false)
-- cm:replenish_action_points(cm:char_lookup_str(char))
