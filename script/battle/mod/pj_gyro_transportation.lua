PJ_GYRO = PJ_GYRO or {}
local mod = PJ_GYRO

mod.latest = mod.latest or nil
mod.latest_id = mod.latest_id or nil
mod.selected = mod.selected or {}
mod.transported = mod.transported or {}

local alliance_armies = bm:alliances():item(bm:get_player_alliance_num()):armies()
for j=1, alliance_armies:count() do
	local army = alliance_armies:item(j)
	local player_units = army:units();

	for i = 1, player_units:count() do
		local current_unit = player_units:item(i);
		if current_unit then
			bm:unregister_unit_selection_callback(current_unit)
			bm:register_unit_selection_callback(current_unit, function(context)
				if context:type() == "cr_dwf_veh_gyrotransport" then
					for ii = 1, player_units:count() do
						local current_unit = player_units:item(ii);
						if current_unit and current_unit:type() == "cr_dwf_veh_gyrotransport" then
							local unit_id = context:unique_ui_id()
							local unit_card = find_uicomponent(core:get_ui_root(), "layout", "battle_orders", "battle_orders_pane", "card_panel_docker", "cards_panel", "review_DY", tostring(unit_id))
							if unit_card then
								local unit_card_state = unit_card:CurrentState()
								mod.selected[unit_id] = unit_card_state == "selected" or unit_card_state == "selected_hover"
								-- out(tostring(unit_id).." IS NOW "..tostring(mod.selected[unit_id]))
							end
						end
					end
					local unit_id = context:unique_ui_id()
					if mod.selected[unit_id] then
						mod.latest = context
						mod.latest_id = unit_id
					end
				end
			end)
		end
	end
end

local alliances = bm:alliances()
local player_alliance = alliances:item(bm:local_alliance())
local player_army = player_alliance:armies():item(bm:local_army())

local function get_closest_unit(start_unit)
	local player_units = player_army:units()

	local closest = nil
	local smallest_dist = nil
	for i = 1, player_units:count() do
		local current_unit = player_units:item(i);
		if current_unit
			and current_unit ~= start_unit
			and current_unit:is_infantry()
			and current_unit:type() ~= "cr_dwf_veh_gyrotransport"
			and not string.find(current_unit:type(), "_art_")
			and not string.find(current_unit:type(), "_veh_")
			and not string.find(current_unit:type(), "_ogr_")
		then
			local dist = current_unit:unit_distance(start_unit)
			if not closest or dist < smallest_dist then
				closest = script_unit:new(player_army, i)
				smallest_dist = dist
			end
		end
	end

	return closest, smallest_dist
end

local function get_unit_from_unit_id(unit_id)
	local player_units = player_army:units()

	local closest = nil
	local smallest_dist = nil
	for i = 1, player_units:count() do
		local current_unit = player_units:item(i);
		if current_unit and current_unit:unique_ui_id() == unit_id then
			return current_unit
		end
	end
end

local function pj_gyro_transportation_on_special_ability(event)
	local ability_key = event:get_string1()
	if mod.latest then
		if ability_key == "pj_gyro_unload" and mod.transported[mod.latest_id] then
			for unit_id, is_selected in pairs(mod.selected) do
				if is_selected then
					local sunit = mod.transported[unit_id]
					local gyro_unit = get_unit_from_unit_id(unit_id)
					bm:callback(
						function()
							sunit:teleport_to_location(gyro_unit:position(), sunit.unit:bearing(), sunit.unit:ordered_width())
							sunit:set_enabled(true)
							sunit:release_control()
							mod.transported[unit_id] = false
						end,
						3000,
						"pj_gyro_transportation_unload_delay"
					)
				end
			end
		elseif ability_key == "pj_gyro_load" then
			for unit_id, is_selected in pairs(mod.selected) do
				if is_selected then
					bm:callback(
						function()
							local gyro_unit = get_unit_from_unit_id(unit_id)
							local sunit, smallest_dist = get_closest_unit(gyro_unit)
							if sunit and smallest_dist <= 1.5 then
								mod.transported[unit_id] = sunit
								sunit:set_enabled(false)
							end
						end,
						3000,
						"pj_gyro_transportation_load_delay"
					)
				end
			end
		end
	end
end

bm:unregister_command_handler_callback("Special Ability", "pj_gyro_transportation")
bm:register_command_handler_callback(
	"Special Ability",
	pj_gyro_transportation_on_special_ability,
	"pj_gyro_transportation"
)

local function get_cooldown_component(button_ability)
	local cooldown_blocked = find_uicomponent(button_ability, "pj_cooldown_blocked")
	if not cooldown_blocked then
		cooldown_blocked = UIComponent(find_uicomponent(button_ability, "cooldown_blocked"):CopyComponent("pj_cooldown_blocked"))
	end

	return cooldown_blocked
end

local function update()
	local button_ability1 = find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot1", "button_ability1")
	if not button_ability1 or not button_ability1:Visible() then
		return
	end

	local ability1_image_path = button_ability1:GetImagePath(0)
	if ability1_image_path ~= "data/ui/Battle UI/ability_icons/pj_gyro_transportation_helping_hand.png" then
		get_cooldown_component(button_ability1):SetVisible(false)
		button_ability1:SetInteractive(true)

		local button_ability2 = find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot2", "button_ability2")
		if button_ability2 and button_ability2:Visible() then
			get_cooldown_component(button_ability2):SetVisible(false)
			button_ability2:SetInteractive(true)
		end
		return
	end

	local sunit, smallest_dist = get_closest_unit(mod.latest)
	if mod.transported[mod.latest_id] then
		local button_ability2 = find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot2", "button_ability2")
		if button_ability2 then
			button_ability2:SetInteractive(true)
			local cooldown_blocked = get_cooldown_component(button_ability2)
			cooldown_blocked:SetVisible(false)
		end
	else
		local button_ability2 = find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot2", "button_ability2")
		if button_ability2 then
			button_ability2:SetInteractive(false)
			local cooldown_blocked = get_cooldown_component(button_ability2)
			cooldown_blocked:SetVisible(true)
		end
	end
	if not mod.transported[mod.latest_id] and sunit and smallest_dist <= 22 then
		local button_ability1 = find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot1", "button_ability1")
		if button_ability1 then
			button_ability1:SetInteractive(true)
			local cooldown_blocked = get_cooldown_component(button_ability1)
			cooldown_blocked:SetVisible(false)
		end
	else
		local button_ability1 =find_uicomponent(core:get_ui_root(), "layout", "porthole_parent", "ability_parent", "button_slot1", "button_ability1")
		if button_ability1 then
			button_ability1:SetInteractive(false)
			local cooldown_blocked = get_cooldown_component(button_ability1)
			cooldown_blocked:SetVisible(true)
		end
	end
end

core:remove_listener("pj_gyro_transportation_update_real_time_trigger_cb")
core:add_listener(
	"pj_gyro_transportation_update_real_time_trigger_cb",
	"RealTimeTrigger",
	function(context)
		return context.string == "pj_gyro_transportation_update_real_time_trigger"
	end,
	function(context)
		update()
		real_timer.register_singleshot("pj_gyro_transportation_update_real_time_trigger", 50)
	end,
	true
)

bm:remove_process("pj_gyro_transportation_delay_update_cb")
bm:callback(function()
	update()
	real_timer.register_singleshot("pj_gyro_transportation_update_real_time_trigger", 50)
end, 100, "pj_gyro_transportation_delay_update_cb")

-- out("MOD.TRANSPORTED")
-- for x,y in pairs(mod.transported) do
-- 	out(tostring(x))
-- 	out(tostring(y))
-- end

-- out("MOD.SELECTED")
-- for x,y in pairs(mod.selected) do
-- 	out(tostring(x))
-- 	out(tostring(y))
-- end

-- out("MOD.LATEST")
-- out(tostring(mod.latest))
