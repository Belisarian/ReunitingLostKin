PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local mission_key = "mission_kraka_drak_beastmen_camp"

local payload = function(char)
	mod.enable_movement()

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.1, {455.23, 504.43, 5, d_to_r(120), 4})

		cm:callback(function()
			cm:move_to(cm:char_lookup_str(char), 678, 661, true) -- moving to the beastmen camp battle
		end, 0.5)

		cm:scroll_camera_from_current(
			true, 4,
			{457.9, 508.28, 5, d_to_r(120), 4},
			{453.22, 510.21, 5, d_to_r(120), 4}
		)

		cm:callback(function()
			CampaignUI.ToggleCinematicBorders(false)
			cm:stop_user_input(false)
			mod.select_first_lord()
			mod.force_start_quest_battle("mission_kraka_drak_beastmen_camp")
		end, 5)
	end, 0.1)
end

mod[mission_key] = {
	key = mission_key,
	ui_offsets = {400, 202},
	locs = {
		title="The Beastmen Camp",
		desc="The Beastmen Camp",
		mission_desc = "The Watchmen of Kraka Drak have been overwhelmed with beastmen activity. Consultations with the High Rune Priest indicate that a small rift between the chaos realm and this world must have opened near the beastmen encampment to the east. We are to lead a sneak assualt against the rift. The High King's commander has placed a Rune Lord with his personal bodyguards at our disposal.\n\n Payment upon completion: 7000",
	},
	icon = "ui/small_icon_quest_battle.png",
	payload = payload,
}

core:remove_listener("pj_quests_on_won_battle_beastmen_camp")
core:add_listener(
	"pj_quests_on_won_battle_beastmen_camp",
	"pj_quests_won_battle_beastmen_camp",
	true,
	function()
		mod.disable_movement()
		mod.set_state(mod.states.after_beastmen_camp)
	end,
	true
)
