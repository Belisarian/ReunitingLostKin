PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_kraka_drak_chaos_warp"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {453.22, 510.21, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 676, 668, true) -- moving to the chaos warp
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 4,
			{453.22, 510.21, 5, d_to_r(120), 4},
			{451.88, 515.61, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.select_first_lord()
			mod.force_start_quest_battle("mission_kraka_drak_chaos_warp")
		end, 5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {433, 182},
	ui_pivot = "top",
	locs = {
		title="Inside the Warp",
		desc="Inside the Warp",
		mission_desc = "The reach of the Gods of Chaos over our lands will be no longer!! While the portal crumbles you decide to call upon your fellow warriors. Liberate our holds! Charge into the fading portal, purge the chaos gods from existence!",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_chaos_warp")
core:add_listener(
	"pj_quests_on_won_battle_chaos_warp",
	"pj_quests_won_battle_chaos_warp",
	true,
	function()
		mod.disable_movement()
		mod.set_state(mod.states.after_chaos_warp)
	end,
	true
)
