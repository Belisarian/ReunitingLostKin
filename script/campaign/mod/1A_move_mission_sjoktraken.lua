PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

mod.move_mission_sjoktraken_payload = function(char)
	-- add snow attrition immunity and add movement range
	local ceb = cm:create_new_custom_effect_bundle("rlk_ll_hidden_bundle")
	ceb:add_effect("wh2_main_effect_army_movement_up", "force_to_force_own_lords_army", 500)
	ceb:add_effect("wh_main_effect_force_army_campaign_attrition_all_immunity", "faction_to_force_own", 1)
	ceb:set_duration(-1)
	cm:apply_custom_effect_bundle_to_characters_force(ceb, char)
	cm:replenish_action_points(cm:char_lookup_str(char))

	cm:callback(function()
		CampaignUI.ToggleCinematicBorders(true)
		cm:stop_user_input(true)
		cm:scroll_camera_from_current(true, 0.01, {473.84, 480.21, 3, d_to_r(0), 3})
		cm:callback(function()
				cm:scroll_camera_from_current(true, 5, {474.84, 481.21, 5, d_to_r(120), 4})
		end, 0.5)
		cm:callback(function()
				cm:move_to(cm:char_lookup_str(char), 696,635, true) -- move_mission_sjoktraken
				cm:scroll_camera_from_current(true, 3, {465.25, 490.14, 5, d_to_r(120), 4})
				cm:callback(function()
						CampaignUI.ToggleCinematicBorders(false)
						cm:stop_user_input(false)
						mod.set_state(mod.states.in_sjok)
						cm:replenish_action_points(cm:char_lookup_str(char))
				end, 4)
		end, 6.5)
	end, 1)
end

mod.move_mission_sjoktraken = {
	key = "move_mission_sjoktraken",
	ui_offsets = {502, 309},
	locs = {
		title="Move to Sjoktraken",
		desc="Move to Sjoktraken",
		mission_desc = "The band of prospectors have joined up with the mining company, they will stay out here in the abandoned mines of the Goromadny mountains for the coming season.   They might find something of value or a small vein of precious metals, but something else will find them before summer comes and the Sjoktraken mining company will fund a new expedition for they safe return...",
	},
	icon = "ui/small_city_schem_frame_major.png",
	payload = mod.move_mission_sjoktraken_payload,
}
