-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_ravnsvake
-- Attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();

bm = battle_manager:new(empire_battle:new());
local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)

gb = generated_battle:new(
	true,                                      		-- screen starts black
	false,                                     		-- prevent deployment for player
	false,                                      	-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, -- intro cutscene function
	false                                      		-- debug mode
);

-- gb:set_cutscene_during_deployment(true);

-------------------------------------------------------------------------------------------------
---------------------------------------- INTRO VO & SUBS ----------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- player attacker
battle_ravnsvake_army_enemy = gb:get_army(gb:get_non_player_alliance_num(),"battle_ravnsvake_army_enemy"); -- char/army
-- gb:message_on_time_offset("drop_rocks",20000);
-- [320.78317260742, 113.35470581055, 336.00955200195]
battle_ravnsvake_army_enemy:use_army_special_ability_on_message("drop_rocks", "wh_main_spell_rock_block_big", v(320.7, 113.3, 336.0), d_to_r(210));


-------------------------------------------------------------------------------------------------
----------------------------------------- ARMY TELEPORT -----------------------------------------
-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------
------------------------------------------- CUTSCENE --------------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ORDERS -------------------------------------------
-------------------------------------------------------------------------------------------------

gb:message_on_time_offset("Wait_5_sec",30000);

ga_battle_ravnsvake_army_enemy_reinf_ogres = gb:get_army(gb:get_non_player_alliance_num(),"battle_ravnsvake_army_enemy_reinf_ogres"); -- Reinforcement enemy army
ga_battle_ravnsvake_army_enemy_reinf_ogres:reinforce_on_message("Wait_5_sec",5000);

--ga_battle_ravnsvake_army_enemy_reinf_ogres:deploy_at_random_intervals_on_message("Wait_5_sec",1,1,1000,1000); -- enemy reinforcements
--battle_ravnsvake_army_enemy_clan_rats = gb:get_army(gb:get_non_player_alliance_num(),"battle_ravnsvake_army_enemy_clan_rats"); -- Reinforcement enemy army
--battle_ravnsvake_army_enemy_clan_rats:deploy_at_random_intervals_on_message("Wait_5_sec",1,1,30000,30000); -- enemy reinforcements


-------------------------------------------------------------------------------------------------
------------------------------------------- OBJECTIVES ------------------------------------------
-------------------------------------------------------------------------------------------------

gb:set_objective_on_message("deployment_started", "mission_ravnsvake_reach_keep_objective")
gb:queue_help_on_message("battle_started", "mission_ravnsvake_intro_msg", 8000, 1000)

	gb:queue_help_on_message("drop_rocks", "mission_ravnsvake_rockslide_msg", 8000, 1000)
	gb:queue_help_on_message("drop_rocks", "mission_ravnsvake_warn_keep_msg", 8000, 6000)
	gb:set_objective_on_message("drop_rocks", "mission_ravnsvake_warn_keep_objective", 6000)
	gb:complete_objective_on_message("blew_horn", "mission_ravnsvake_warn_keep_objective")
	gb:queue_help_on_message("blew_horn", "mission_ravnsvake_blew_horn_msg", 8000, 500)
	gb:queue_help_on_message("blew_horn", "mission_ravnsvake_airforce_appears_msg", 8000, 4500)
	gb:queue_help_on_message("blew_horn", "mission_ravnsvake_transport_army_msg", 8000, 6500)

	gb:set_objective_on_message("blew_horn", "mission_ravnsvake_transport_army_objective", 6500)

	local rocks_v = v(320.7, 113.3, 336.0)
	ga_player:message_on_proximity_to_position("drop_rocks", rocks_v, 150)

	local function pj_ravn_blew_horn_on_special_ability(event)
		local ability_key = event:get_string1()
		out(ability_key)
		if ability_key == "unit_active_horn_ice_valor" then
 			gb.sm:trigger_message("blew_horn")
		end
	end

	bm:unregister_command_handler_callback("Special Ability", "pj_ravn_blew_horn")
	bm:register_command_handler_callback(
		"Special Ability",
		pj_ravn_blew_horn_on_special_ability,
		"pj_ravn_blew_horn"
	)



local alliances = bm:alliances()
local player_alliance = alliances:item(bm:local_alliance())
local player_army = player_alliance:armies():item(bm:local_army())
local player_units = player_army:units()

for i = 1, player_units:count() do
	local current_unit = player_units:item(i);
	if current_unit then
		local unit_type = current_unit:type()
		local sunit = script_unit:new(player_army, i)
		if string.find(unit_type, "gyro") or unit_type == "wh_main_dwf_cha_lord_0" then
			sunit:set_enabled(false)
		end
	end
end

gb:add_ping_icon_on_message("mission_ravnsvake_transport_army_msg", v(270.7, 93.3, 336.0), 11, 500, 5000);

gb:complete_objective_on_message("all_units_transported", "mission_ravnsvake_transport_army_objective")
gb:queue_help_on_message("all_units_transported", "mission_ravnsvake_to_keep_after_rocks_msg", 8000, 500)

local gyro_dropoff_point = v(250.7, 73.3, 336.0)

local function update()
	local alliances = bm:alliances()
	local player_alliance = alliances:item(bm:local_alliance())
	local player_army = player_alliance:armies():item(bm:local_army())

	local are_all_units_transported = true

	local player_units = player_army:units()
	for i = 1, player_units:count() do
		local current_unit = player_units:item(i);
		local position = current_unit:position()
		local distance = position:distance_xz(gyro_dropoff_point)
		if not string.find(current_unit:type(), "gyro") and not current_unit:is_shattered() then
			are_all_units_transported = are_all_units_transported and distance <= 70
		end
		-- out(tostring(current_unit:type()))
		-- out(tostring(distance))
	end

	if are_all_units_transported then
		gb.sm:trigger_message("all_units_transported");
	end
end

core:remove_listener("rlk_ravnsvake_update_real_time_trigger_cb")
core:add_listener(
	"rlk_ravnsvake_update_real_time_trigger_cb",
	"RealTimeTrigger",
	function(context)
		return context.string == "rlk_ravnsvake_update_real_time_trigger"
	end,
	function(context)
		update()
		real_timer.register_singleshot("rlk_ravnsvake_update_real_time_trigger", 50)
	end,
	true
)

bm:remove_process("rlk_ravnsvake_delay_update_cb")
bm:callback(function()
	update()
	real_timer.register_singleshot("rlk_ravnsvake_update_real_time_trigger", 50)
end, 100, "rlk_ravnsvake_delay_update_cb")

gb:add_listener(
	"blew_horn",
	function()
		bm:callback(
			function()
				local alliances = bm:alliances()
				local player_alliance = alliances:item(bm:local_alliance())
				local player_army = player_alliance:armies():item(bm:local_army())
				local player_units = player_army:units()
				for i = 1, player_units:count() do
					local current_unit = player_units:item(i);
					local su = script_unit:new(player_army, i)
					if string.find(current_unit:type(), "gyro") then
						su:teleport_to_location(v(50.7, 103.3, 666.0), su.unit:bearing(), su.unit:ordered_width())
						su:set_enabled(true)
						su:release_control()
					end
				end
			end,
			6500
		)
	end,
	false
)
-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------
