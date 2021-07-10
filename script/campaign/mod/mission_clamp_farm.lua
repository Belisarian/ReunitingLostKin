PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_clamp_farm"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {464.58, 495.16, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 700, 627, true)
		end, 0.5)

		cm:scroll_camera_from_current(true, 3.5, {468.599, 485.13, 5, d_to_r(120), 4})

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.select_first_lord()
			mod.force_start_quest_battle("mission_clamp_farm")
		end, 4.5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {556, 372},
	locs = {
		title="The Clamp Farm",
		desc="The Clamp Farm",
		mission_desc = "The Merchant Lords of Sjoktraken have requested our presence at one of they Clamp farms, where workers had gone missing and those left are reluctant to resume their duty.\n\n Payment upon completion: 3000",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
	condition = function() return not cm:get_saved_value("pj_quests_clamp_farm_completed") end,
}

core:remove_listener("pj_quests_on_won_battle_clamp_farm")
core:add_listener(
	"pj_quests_on_won_battle_clamp_farm",
	"pj_quests_won_battle_clamp_farm",
	true,
	function()
		mod.disable_movement()
		mod.set_state(mod.states.after_clamp_farm)
	end,
	true
)
