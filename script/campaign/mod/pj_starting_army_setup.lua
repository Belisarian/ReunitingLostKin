PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

---@return CA_UIC
local function find_ui_component_str(starting_comp, str)
	local has_starting_comp = str ~= nil
	if not has_starting_comp then
		str = starting_comp
	end
	local fields = {}
	local pattern = string.format("([^%s]+)", " > ")
	string.gsub(str, pattern, function(c)
		if c ~= "root" then
			fields[#fields+1] = c
		end
	end)
	return find_uicomponent(has_starting_comp and starting_comp or core:get_ui_root(), unpack(fields))
end

local function binding_iter(binding)
	local pos = 0
	local num_items = binding:num_items()
	return function()
			if pos < num_items then
					local item = binding:item_at(pos)
					pos = pos + 1
					return item
			end
			return
	end
end

local function start_hiding_empty_dilemma_tooltips()
	core:remove_listener("pj_rlk_hide_empty_dilemma_tooltip_cb")
	core:add_listener(
			"pj_rlk_hide_empty_dilemma_tooltip_cb",
			"RealTimeTrigger",
			function(context)
					return context.string == "pj_rlk_hide_empty_dilemma_tooltip"
			end,
			function()
				local horde_growth_panel = find_ui_component_str("root > layout > info_panel_holder > primary_info_panel_holder > info_panel_background > CharacterInfoPopup > horde_growth")
				if horde_growth_panel then
					horde_growth_panel:SetVisible(false)
				end

				local event_dilemma_active = find_ui_component_str("root > events > event_dilemma_active")
				if event_dilemma_active or effect.is_any_movie_playing() then
					local existingFrame = Util.getComponentWithName("Quests")
					if existingFrame then
						mod.selected_quest = nil
						existingFrame:Delete()
					end
				end

				local diplomacy_dropdown = find_ui_component_str("root > diplomacy_dropdown")
				if diplomacy_dropdown then
					local add_offer_button = find_ui_component_str("root > diplomacy_dropdown > offers_panel > offers_list_panel > add_offer_button")
					add_offer_button:SetVisible(false)
				end

				local tooltip = find_ui_component_str("root > Tooltip")
				if not tooltip then return end
				local tooltip_text = find_ui_component_str(tooltip, "expanded_text")
				if not tooltip_text then return end

				local dets = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder > details_holder > dy_details_text")
				if not dets then return end

				if tooltip_text:GetStateText() == "" then
					tooltip:SetVisible(false)
				end
			end,
			true
	)

	real_timer.unregister("pj_rlk_hide_empty_dilemma_tooltip")
	real_timer.register_repeating("pj_rlk_hide_empty_dilemma_tooltip", 0)
end

local function switch_audio()
	core:remove_listener("rlk_switch_audio_real_time_trigger5_cb")
	core:add_listener(
		"rlk_switch_audio_real_time_trigger5_cb",
		"RealTimeTrigger",
		function(context)
			return context.string == "rlk_switch_audio_real_time_trigger5"
		end,
		function(context)
			local bm = find_ui_component_str("root > esc_menu_campaign > menu_1 > button_resume")
			bm:SimulateLClick()
		end,
		true
	)

	core:remove_listener("rlk_switch_audio_real_time_trigger4_cb")
	core:add_listener(
		"rlk_switch_audio_real_time_trigger4_cb",
		"RealTimeTrigger",
		function(context)
			return context.string == "rlk_switch_audio_real_time_trigger4"
		end,
		function(context)
			local bm = find_ui_component_str("root > options_main > menu_options > button_back")
			bm:SimulateLClick()
			real_timer.register_singleshot("rlk_switch_audio_real_time_trigger5", 50)
		end,
		true
	)

	core:remove_listener("rlk_switch_audio_real_time_trigger3_cb")
	core:add_listener(
		"rlk_switch_audio_real_time_trigger3_cb",
		"RealTimeTrigger",
		function(context)
			return context.string == "rlk_switch_audio_real_time_trigger3"
		end,
		function(context)
			local bm = find_ui_component_str("root > options_audio > basic_options > ok_cancel_buttongroup > button_ok")
			bm:SimulateLClick()
			real_timer.register_singleshot("rlk_switch_audio_real_time_trigger4", 50)
		end,
		true
	)

	core:remove_listener("rlk_switch_audio_real_time_trigger2_cb")
	core:add_listener(
		"rlk_switch_audio_real_time_trigger2_cb",
		"RealTimeTrigger",
		function(context)
			return context.string == "rlk_switch_audio_real_time_trigger2"
		end,
		function(context)
			local bm = find_ui_component_str("root > options_audio > basic_options > sound_system_panel > dropdown_system > popup_menu > popup_list > option3")
			bm:SimulateLClick()

			local subtitles = find_ui_component_str("root > options_audio > basic_options > sound_system_panel > subtitles_panel > checkbox_subtitles")
			if subtitles:CurrentState() == "active" then
				subtitles:SimulateLClick()
			end

			real_timer.register_singleshot("rlk_switch_audio_real_time_trigger3", 50)
		end,
		true
	)

	core:remove_listener("rlk_switch_audio_real_time_trigger_cb")
	core:add_listener(
		"rlk_switch_audio_real_time_trigger_cb",
		"RealTimeTrigger",
		function(context)
			return context.string == "rlk_switch_audio_real_time_trigger"
		end,
		function(context)
			local bm = find_ui_component_str("root > options_main > menu_options > button_audio")
			bm:SimulateLClick()
			real_timer.register_singleshot("rlk_switch_audio_real_time_trigger2", 50)
		end,
		true
	)

	core:remove_listener("rlk_switch_audio")
	core:add_listener(
		"rlk_switch_audio",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "esc_menu_campaign"
		end,
		function()
			local bm = find_ui_component_str("root > esc_menu_campaign > menu_1 > button_options")
			bm:SimulateLClick()
			real_timer.register_singleshot("rlk_switch_audio_real_time_trigger", 50)
		end,
		false
	)

	local bm = find_ui_component_str("root > menu_bar > buttongroup > button_menu")
	bm:SimulateLClick()
end

cm:add_first_tick_callback(function()
	if not cm:is_new_game() then
		return
	end

	cm:fade_scene(0, 0)

	-- cm:disable_event_feed_events(true, "all", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_character", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_conquest", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_faction", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_provinces", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_world", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_military", "", "")
	cm:disable_event_feed_events(true, "wh_event_category_agent", "", "")
	cm:disable_event_feed_events(true, "", "wh_event_subcategory_character_deaths", "")
	cm:disable_event_feed_events(true, "", "", "character_trait_lost")
	cm:disable_event_feed_events(true, "", "", "character_ancillary_lost")
	cm:disable_event_feed_events(true, "", "", "character_wounded")
	cm:disable_event_feed_events(true, "", "", "character_dies_in_action")
	cm:disable_event_feed_events(true, "", "", "diplomacy_faction_destroyed")
	cm:disable_event_feed_events(true, "", "", "diplomacy_trespassing")
	cm:disable_event_feed_events(true, "", "", "faction_resource_lost")
	cm:disable_event_feed_events(true, "", "", "faction_resource_gained")
	cm:disable_event_feed_events(true, "", "", "conquest_province_secured")

	cm:callback(function()
		local local_faction = cm:get_faction(cm:get_local_faction_name(true))
		local faction_leader = local_faction:faction_leader()
		cm:set_character_immortality(cm:char_lookup_str(faction_leader), false)
		cm:kill_character(faction_leader:cqi(), true, false)
		cm:create_force_with_general(
			local_faction:name(),
			"dwf_norse_hammerers,dwf_norse_longbeards,dwf_norse_rangers,dwf_norse_warrior,dwf_norse_quarrellers",
			"wh_main_blood_river_valley_varenka_hills",
			710,
			624,
			"general",
			"dwf_norse_lord",
			"names_name_7884153401",
			"",
			"names_name_7884153402",
			"",
			true,
			function(cqi)
			end
		)

		for region in binding_iter(local_faction:region_list()) do
			cm:set_region_abandoned(region:name())
		end

		cm:force_alliance(cm:get_local_faction_name(true), "wh_main_dwf_kraka_drak", true)

		cm:callback(function()
			-- cm:disable_event_feed_events(false, "all", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_character", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_conquest", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_faction", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_provinces", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_world", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_military", "", "")
			cm:disable_event_feed_events(false, "wh_event_category_agent", "", "")
			cm:disable_event_feed_events(false, "", "wh_event_subcategory_character_deaths", "")
			cm:disable_event_feed_events(false, "", "", "character_trait_lost")
			cm:disable_event_feed_events(false, "", "", "character_ancillary_lost")
			cm:disable_event_feed_events(false, "", "", "character_wounded")
			cm:disable_event_feed_events(false, "", "", "character_dies_in_action")
			cm:disable_event_feed_events(false, "", "", "diplomacy_faction_destroyed")
			cm:disable_event_feed_events(false, "", "", "diplomacy_trespassing")
			cm:disable_event_feed_events(false, "", "", "faction_resource_lost")
			cm:disable_event_feed_events(false, "", "", "faction_resource_gained")
			cm:disable_event_feed_events(false, "", "", "conquest_province_secured")

			mod.disable_movement()

			local faction_buttons_docker = find_ui_component_str("root > layout > faction_buttons_docker")
			local end_turn_docker = find_ui_component_str(faction_buttons_docker, "end_turn_docker > button_end_turn")
			local rlk_quests_button = find_uicomponent(end_turn_docker, "rlk_quests_button")

			if rlk_quests_button then
				pulse_uicomponent(rlk_quests_button, true, 5, false, "active")
			end
		end, 5)

		cm:callback(function()
			local char = cm:get_faction(cm:get_local_faction_name(true)):faction_leader()
			cm:teleport_to(cm:char_lookup_str(char), 710, 624, false) -- start position
			cm:callback(function()
				cm:move_to(cm:char_lookup_str(char), 709, 624, false)
			end, 0.5)

			cm:scroll_camera_from_current(true, 0.01, {473.84, 480.21, 3, d_to_r(0), 3})
			cm:fade_scene(1, 5)

			local skip = find_ui_component_str("root > layout > faction_buttons_docker > end_turn_docker > notification_frame > button_skip")
			if skip:CurrentState() == "active" then
				skip:SimulateLClick()
				skip:SetVisible(false)
			end
			cm:callback(function()
				core:add_listener(
					"rlk_switch_audio_dilemma",
					"DilemmaChoiceMadeEvent",
					true,
					function(context)
						if context:dilemma() == "intro" then
							switch_audio()
						end
					end,
					false
				)

				cm:trigger_dilemma(cm:get_local_faction_name(), "intro")
			end, 1)
		end, 0.1)
	end, 5)
end)

local apply_ll_bundle = function(mov)
	local char = cm:get_local_faction():faction_leader()
	local ceb = cm:create_new_custom_effect_bundle("rlk_ll_hidden_bundle")
	ceb:add_effect("wh2_main_effect_army_movement_up", "force_to_force_own_lords_army", mov)
	ceb:add_effect("wh_main_effect_force_army_campaign_attrition_all_immunity", "faction_to_force_own", 1)
	ceb:set_duration(-1)
	cm:apply_custom_effect_bundle_to_characters_force(ceb, char)
	cm:replenish_action_points(cm:char_lookup_str(char))
end

mod.disable_movement = function()
	apply_ll_bundle(-500)
end

mod.enable_movement = function()
	apply_ll_bundle(500)
end

cm:add_first_tick_callback(function()
	local ui_root = core:get_ui_root()

	for _, button_id in ipairs({"button_diplomacy", "button_missions", "button_technology", "button_mortuary_cult"}) do
		local button = find_uicomponent(ui_root, "layout", "faction_buttons_docker", "button_group_management", button_id)
		if button then
			button:SetVisible(false)
		end
	end

	local button_grudges = find_uicomponent(ui_root, "layout", "faction_buttons_docker", "button_group_management", "button_grudges")
	if button_grudges then
		button_grudges:SetTooltipText("Recruitment Ledger", true)
	end

	local button_end_turn = find_uicomponent(ui_root, "layout", "faction_buttons_docker", "end_turn_docker", "button_end_turn")
	if button_end_turn then
		button_end_turn:SetDisabled(true)
	end

	start_hiding_empty_dilemma_tooltips()

	cm:force_diplomacy("faction:" .. cm:get_local_faction_name(true), "faction:wh_main_dwf_kraka_drak", "war", false, false, true);
end)
