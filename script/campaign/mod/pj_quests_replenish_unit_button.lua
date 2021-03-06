PJ_QUESTS_REPLENISH_UNIT_BUTTON = PJ_QUESTS_REPLENISH_UNIT_BUTTON or {}
local mod = PJ_QUESTS_REPLENISH_UNIT_BUTTON

--- Return if table t contains a value val.
local function table_contains(t, val)
	for _, v in ipairs(t) do
		if v == val then
			return true
		end
	end
	return false
end

-- useful to have this during dev, safely ignore
local dout = _G.dout or function(...) end

-- useful to have this during dev, safely ignore
cm:remove_callback("pj_quests_replenish_unit_button_callback_id_1")

--- Multiply the unit cost with this to get the upgrade cost.
mod.upgrade_cost_multiplier = 0.33

--- Keep track of number of unit cards selected, since we can't upgrade more than 1 unit at a time.
mod.num_unit_cards_selected = 0

--- Hide all the retrain buttons in the UI.
mod.hide_retrain_buttons = function()
	local button_group = find_uicomponent(
		core:get_ui_root(),
		"units_panel",
		"main_units_panel",
		"button_group_unit"
	)
	if button_group then
		local index = 1
		while(true) do
			local retrain_button_id = "pj_replenish_unit_button_"..tostring(index)
			local retrain_button_addr = button_group:Find(retrain_button_id)
			if not retrain_button_addr then
				break
			end

			local retrain = UIComponent(retrain_button_addr)
			retrain:SetVisible(false)
			index = index + 1
		end
	end
end

--- Create or just show a retrain button
--- Index is an argument since we can have multiple retrain buttons in the UI.
--- Returns the button.
mod.add_retrain_button = function(index)
	local retrain = find_uicomponent(
		core:get_ui_root(),
		"units_panel",
		"main_units_panel",
		"button_group_unit",
		"button_retrain"
	)
	if retrain then
		local retrain_button_id = "pj_replenish_unit_button_"..tostring(index)
		local existing_retrain_address = UIComponent(retrain:Parent()):Find(retrain_button_id)
		local retrain_button
		if not existing_retrain_address then
			retrain_button = UIComponent(retrain:CopyComponent(retrain_button_id))
			retrain_button:SetState("active")
		else
			retrain_button = UIComponent(existing_retrain_address)
		end
		retrain_button:SetImagePath("ui/icon_replenish_gold.png")
		retrain_button:SetVisible(true)

		return retrain_button
	end
end

local digForComponent = nil
digForComponent = function(startingComponent, componentName)
	local childCount = startingComponent:ChildCount()
	for i=0, childCount-1  do
			local child = UIComponent(startingComponent:Find(i))
			if child:Id() == componentName then
					return child
			else
					local dugComponent = digForComponent(child, componentName)
					if dugComponent then
							return dugComponent
					end
			end
	end
	return nil
end

--- Refresh the whole army UI.
--- We close the whole campaign UI and simulate selecting the commander.
mod.refresh_army_UI = function()
	-- find and open the lords dropdown
	local tab_units = find_uicomponent(
		core:get_ui_root(),
		"layout","bar_small_top", "TabGroup", "tab_units"
	)

	if tab_units:CurrentState() ~= "selected" then
		tab_units:SimulateLClick()
	end

	local units_dropdown = digForComponent(core:get_ui_root(), "units_dropdown")
	---@type CA_UIC
	local list_clip = digForComponent(units_dropdown, "list_clip")
	for i=0, list_clip:ChildCount()-1 do
		local comp = UIComponent(list_clip:Find(i))
		if comp:Id() == "list_box" then
			for j=0, comp:ChildCount()-1 do
				local char_row = UIComponent(comp:Find(j))
				local char_name_label = digForComponent(char_row, "dy_character_name")
				local char_name = char_name_label and char_name_label:GetStateText()
				if char_name == mod.commander_name then
					CampaignUI.ClearSelection()
					char_row:SimulateLClick()
					return
				end
			end
		end
	end
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

--- Repeat this to update the UI tooltips.
mod.update_UI = function()
	if not mod.commander_cqi then
		return
	end

	local commander = cm:get_character_by_cqi(mod.commander_cqi)
	if not commander or commander:is_null_interface() then
		return
	end

	local in_foreign_territory = false
	local is_near_settlement = false

	if commander:region():is_null_interface() then
		in_foreign_territory = false
		is_near_settlement = true
	else
		if commander:region():owning_faction():name() ~= commander:faction():name() then
			in_foreign_territory = true
		end

		local settlement = commander:region():settlement()
		local x,y = settlement:logical_position_x(), settlement:logical_position_y()
		local dist_sqr = distance_squared(x,y , commander:logical_position_x(), commander:logical_position_y())
		if dist_sqr <= 25 then
			is_near_settlement = true
		end
	end

	local is_horde = string.find(commander:military_force():force_type():key(), "HORDE")
	if is_horde then
		in_foreign_territory = false
		is_near_settlement = true
	end

	if not mod.unit_index then
		return
	end

	local unit_list = commander:military_force():unit_list()
	local num_agents = mod.get_num_agents()

	if unit_list:num_items() <= mod.unit_index+num_agents then
		return
	end

	---@type CA_UNIT
	local unit_to_upgrade = unit_list:item_at(mod.unit_index+num_agents)
	if not unit_to_upgrade or unit_to_upgrade:is_null_interface() then
		return
	end

	local unit_cost = unit_to_upgrade:get_unit_custom_battle_cost()
	local replenish_cost = unit_cost/10

	local retrain_button = nil

	local are_prerequisites_valid = true

	if are_prerequisites_valid then
		retrain_button = mod.add_retrain_button(1)
	end

	if retrain_button then
		local new_tooltip_text = "Replenish unit.\nCosts [[img:icon_money]][[/img]]"..replenish_cost.."."
		retrain_button:SetTooltipText(new_tooltip_text, true)
		retrain_button:SetState("active")
	end

	local local_faction = cm:get_faction(cm:get_local_faction_name(true))
	if unit_to_upgrade:percentage_proportion_of_full_strength() == 100 or local_faction:treasury() < replenish_cost then
		retrain_button:SetState("inactive")
	end

	-- remember the unit disband button so we can click it through code
	local disband = find_uicomponent(core:get_ui_root(),
		"units_panel",
		"main_units_panel",
		"button_group_unit",
		"button_disband"
	)
	if disband then
		mod.disband = disband
	end
end

--- Get number of agents in an army by scraping the UI.
mod.get_num_agents = function()
	local index = 0
	while(true) do
		local agent = find_uicomponent(
			core:get_ui_root(),
			"units_panel",
			"main_units_panel",
			"units",
			"Agent "..tostring(index)
		)
		if not agent then
			return index
		end
		index = index + 1
		if index > 30 then
			return 0
		end
	end
	return 0
end

--- Parse the rank tooltip in non-english localized games.
--- Returns rank as a number, defaults to 0.
mod.get_rank_from_non_english_tooltip = function(foreign_tooltip)
	local unit_rank = 0
	local rank_start_index = nil
	for i=9, 0, -1 do
		rank_start_index = rank_start_index or foreign_tooltip:find(tostring(i))
	end
	if rank_start_index then
		local rank_substring = foreign_tooltip:sub(rank_start_index, rank_start_index)
		unit_rank = tonumber(rank_substring)
	end
	return unit_rank or 0
end


mod.add_to_mercs = function()
	-- get the current hp of the unit we're gonna upgrade, save it for later
	---@type CA_UNIT
	local unit_to_upgrade
	local commander = cm:get_character_by_cqi(mod.commander_cqi)
	if commander and not commander:is_null_interface() then
		unit_to_upgrade = commander:military_force():unit_list():item_at(mod.unit_index+mod.get_num_agents())
	end

	if not unit_to_upgrade then
		dout("no unit_to_upgrade")
		return
	end

	local hp = unit_to_upgrade:percentage_proportion_of_full_strength()
	local new_hp = hp/100 + cm:random_number(15,5)/100
	cm:set_unit_hp_to_unary_of_maximum(unit_to_upgrade, new_hp)

	local unit_cost = unit_to_upgrade:get_unit_custom_battle_cost()
	local replenish_cost = unit_cost/10
	cm:treasury_mod(cm:get_local_faction_name(true), -replenish_cost)

	cm:callback(function()
		mod.refresh_army_UI()
	end, 0.1)
end

mod.first_tick_cb = function()
	--- When we click the unit upgrade button.
	core:remove_listener('pj_quests_replenish_unit_button_on_clicked_retrain_button')
	core:add_listener(
	'pj_quests_replenish_unit_button_on_clicked_retrain_button',
	'ComponentLClickUp',
	function(context)
		return context.string:starts_with("pj_replenish_unit_button_") and cm:whose_turn_is_it() == cm:get_local_faction_name(true)
	end,
	function(context)
		if not mod.commander_cqi then
			return
		end

		local retrain_button_index = context.string:gsub("pj_replenish_unit_button_", "")
		retrain_button_index = tonumber(retrain_button_index)
		if not retrain_button_index then
			dout("no retrain_button_index")
			return
		end

		mod.add_to_mercs()

	end,
	true
	)

	--- Stop the repeating UI update when we unselect the army.
	core:remove_listener('pj_quests_replenish_unit_button_on_closed_units_panel')
	core:add_listener(
		'pj_quests_replenish_unit_button_on_closed_units_panel',
		'PanelClosedCampaign',
		function(context)
			return context.string == "units_panel"
		end,
		function()
			cm:remove_callback("pj_quests_replenish_unit_button_callback_id_1")
			cm:remove_callback("pj_quests_replenish_unit_button_repeat_disband_unit_confirmation")
		end,
		true
	)

	core:remove_listener('pj_quests_replenish_unit_button_on_mouse_over_LandUnit')
	core:add_listener(
		'pj_quests_replenish_unit_button_on_mouse_over_LandUnit',
		'ComponentMouseOn',
		function(context)
			if not mod.commander_cqi or context.string:starts_with("Agent ") then
				mod.hide_retrain_buttons()
				mod.unit_index = nil
				return false
			end

			local is_land_unit = context.string:starts_with("LandUnit ")
			return is_land_unit
		end,
		function(context)
			local unit_index_str = context.string:gsub("LandUnit ", "")
			local unit_index = tonumber(unit_index_str)
			mod.unit_index = unit_index
			mod.unit_rank = 0

			mod.hide_retrain_buttons()

			local exp = find_uicomponent(core:get_ui_root(),
			"units_panel",
			"main_units_panel",
			"units",
			"LandUnit "..tostring(unit_index),
			"experience"
			)
			if exp then
				local exp_text = exp:GetTooltipText()
				if exp_text then
					if exp_text ~= "" then
						local unit_rank_str = exp_text:gsub("Unit rank ", "")
						mod.unit_rank = tonumber(unit_rank_str)
						if not mod.unit_rank then
							mod.unit_rank = mod.get_rank_from_non_english_tooltip(exp_text)
						end
						if not mod.unit_rank then
							mod.unit_rank = 0
						end
					end
				end
			end

			mod.update_UI()
			cm:remove_callback("pj_quests_replenish_unit_button_callback_id_1")
			cm:repeat_callback(function() mod.update_UI() end, 0.1, "pj_quests_replenish_unit_button_callback_id_1")
		end,
		true
	)

	core:remove_listener('pj_quests_replenish_unit_button_on_character_selected')
	core:add_listener(
		'pj_quests_replenish_unit_button_on_character_selected',
		'CharacterSelected',
		function()
			return true
		end,
		function(context)
			---@type CA_CHAR
			local char = context:character()

			local is_player_char = char:faction():name() == cm:get_local_faction_name(true)
				and cm:whose_turn_is_it() == cm:get_local_faction_name(true)
			if not is_player_char then
				mod.hide_retrain_buttons()
				mod.commander_cqi = nil
				return
			end

			mod.commander_cqi = char:cqi()

			cm:callback(function()
				local army_name_label = find_uicomponent(
					core:get_ui_root(),
					"units_panel",
					"main_units_panel",
					"header",
					"button_focus",
					"dy_txt"
				)
				mod.commander_name = army_name_label and army_name_label:GetStateText()
			end, 0.5)
		end,
		true
	)
end

mod.delayed_first_tick_cb = function()
	cm:callback(mod.first_tick_cb, 4.5)
end

cm:add_first_tick_callback(mod.delayed_first_tick_cb)

--- We'll call first_tick_cb directly if hot-reloading during dev.
--- We're checking for presence of execute external lua file in the traceback.
if debug.traceback():find('pj_loadfile') then
	mod.first_tick_cb()
end
