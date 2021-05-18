-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_kraka_drak_chaos_warp
-- Defender
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();

bm = battle_manager:new(empire_battle:new());
local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, "nil", "qb_final_position", 6000, false, true, false);

gb = generated_battle:new(
	true,                                     			-- screen starts black
	false,                                     			-- prevent deployment for player
	false,                                    			-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, 	-- intro cutscene function
	false                                      			-- debug mode
);

gb:set_cutscene_during_deployment(true);

-------------------------------------------------------------------------------------------------
---------------------------------------- INTRO VO & SUBS ----------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- player attacker 
ga_enemy = gb:get_army(gb:get_non_player_alliance_num(),"battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0");


--army--
ga_battle_chaos_warp_character_name_chs0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_chaos_warp_character_name_chs0"); -- char/army
ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0"); -- char/army
ga_battle_chaos_warp_army_chs0_unit_bloodletters = gb:get_army(gb:get_non_player_alliance_num(),"battle_chaos_warp_army_chs0_unit_bloodletters"); -- char/army
ga_battle_chaos_warp_army_chs0_unit_hellcannon_ror_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_chaos_warp_army_chs0_unit_hellcannon_ror_0"); -- char/army



ga_battle_chaos_warp_character_name_chs0:set_enabled(false);  -- instant on start invis
ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0:set_enabled(false);  -- instant on start invis
ga_battle_chaos_warp_army_chs0_unit_bloodletters:set_enabled(false);  -- instant on start invis
ga_battle_chaos_warp_army_chs0_unit_hellcannon_ror_0:set_enabled(false);  -- instant on start invis
-------------------------------------------------------------------------------------------------
----------------------------------------- ARMY TELEPORT -----------------------------------------
-------------------------------------------------------------------------------------------------
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_chaos_warp_character_name_chs0, v(16.91911315918, 70.098876953125)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0, v(16.91911315918, 70.098876953125)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_chaos_warp_army_chs0_unit_bloodletters, v(-133.0, 144.0)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_chaos_warp_army_chs0_unit_hellcannon_ror_0, v(-143.78991699219, -137.09931945801)) end);

ga_battle_chaos_warp_character_name_chs0:use_army_special_ability_on_message("send_demon_1", "wh_main_spell_chaos_do_demon_portal_dummy_01", v(-133.0, 144.0), d_to_r(0));
ga_battle_chaos_warp_character_name_chs0:use_army_special_ability_on_message("send_demon_1", "wh_main_spell_chaos_do_demon_portal_dummy_02", v(-153.95332336426, 77.676063537598), d_to_r(90));
ga_battle_chaos_warp_character_name_chs0:use_army_special_ability_on_message("send_demon_1", "wh_main_spell_chaos_do_demon_portal_dummy_03", v(-148.09051513672, 0.13470077514648), d_to_r(180));

gb:add_listener("send_demon_2", function() spawn_demons(1, 1, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_2", function() spawn_demons(1, 2, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_2", function() spawn_demons(2, 3, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);

gb:add_listener("send_demon_3", function() spawn_demons(2, 1, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_3", function() spawn_demons(1, 2, ga_battle_chaos_warp_character_name_chs0) end);
gb:add_listener("send_demon_3", function() spawn_demons(3, 2, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_3", function() spawn_demons(3, 3, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);

ga_battle_chaos_warp_character_name_chs0:use_army_special_ability_on_message("send_demon_4", "wh_main_spell_chaos_do_demon_portal_dummy_04", v(16.91911315918, 70.098876953125), d_to_r(90));

gb:add_listener("send_demon_5", function() spawn_demons(4, 1, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_5", function() spawn_demons(4, 2, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_5", function() spawn_demons(5, 3, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_5", function() spawn_demons(5, 9, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_5", function() spawn_demons(6, 9, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_5", function() spawn_demons(6, 9, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);


gb:add_listener("send_demon_6", function() spawn_demons(7, 1, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_6", function() spawn_demons(8, 2, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_6", function() spawn_demons(9, 3, ga_battle_chaos_warp_army_chs0_unit_bloodletters) end);
gb:add_listener("send_demon_6", function() spawn_demons(7, 9, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_6", function() spawn_demons(8, 9, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);
gb:add_listener("send_demon_6", function() spawn_demons(9, 9, ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0) end);

gb:message_on_time_offset("send_demon_1",15000);
gb:message_on_time_offset("send_demon_2",21000);
gb:message_on_time_offset("send_demon_3",50000);
gb:message_on_time_offset("send_demon_4",80000);
gb:message_on_time_offset("send_demon_5",85000);
gb:message_on_time_offset("send_demon_6",120000);
gb:message_on_time_offset("send_demon_7",150000);
gb:message_on_time_offset("send_demon_8",180000);

-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------

--Test if there are any player units near
--Note: this function doesn't work in patrol_manager because of a bug in checking position
function proximity_test(current_sunit)
    local current_pos = current_sunit.unit:position();
	local closest_unit = get_closest_standing_unit(ga_player.sunits, current_pos);
	if closest_unit and closest_unit:position():distance(current_pos) < 75 then
		return true;
	end;
	return false;
end;

--Once in close quarters, just start attacking
function blind_attack(current_sunit, pm)
    pm:stop();
    current_sunit:release_control();
end;


function battle_start_teleport_units(unitgroup, coordinates)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit:set_invisible_to_all(true);
       current_sunit.uc:teleport_to_location(coordinates, 0, 27);
    end;
end;

---------------------------------------------

function spawn_demons(value, location, spawngroup)
    local player_armies = bm:alliances():item(gb:get_player_alliance_num()):armies();
    local current_sunit = spawngroup.sunits:item(value);
    -- local random_path = math.random(7);

	
    local pm = patrol_manager:new(current_sunit.name .. "demon_patrol", current_sunit, player_armies, 200);

    if location == 1 then
        current_sunit.uc:teleport_to_location(v(-133.0, 144.0), 0, 27);
        
    elseif location == 2 then
        current_sunit.uc:teleport_to_location(v(-153.95332336426, 77.676063537598), 0, 27);
        
    elseif location == 3 then
        current_sunit.uc:teleport_to_location(v(-148.09051513672, 0.13470077514648), 0, 27);
        
    elseif location == 4 then
        current_sunit.uc:teleport_to_location(v(-143.78991699219, -137.09931945801), 0, 27);
        
    elseif location == 5 then
        current_sunit.uc:teleport_to_location(v(-131.39469909668, -185.20616149902), 0, 27);
        
    elseif location == 6 then
        current_sunit.uc:teleport_to_location(v(-49.525814056396, -138.3871307373), 0, 27);
        
    elseif location == 7 then
        current_sunit.uc:teleport_to_location(v(31.229236602783, -139.46229553223), 0, 27);

    elseif location == 8 then
        current_sunit.uc:teleport_to_location(v(151.85749816895, -139.93229675293), 0, 27);

    elseif location == 9 then
        current_sunit.uc:teleport_to_location(v(16.91911315918, 70.098876953125), 0, 27);
       
    end;
    current_sunit:set_enabled(true);
    pm:add_waypoint(v(16.91911315918, 70.098876953125), true);
    pm:set_stop_on_rout(false);

    pm:loop(true);
    pm:set_stop_on_intercept(false);
    pm:set_stop_on_rout(false);
    pm:start();
    current_sunit:set_invisible_to_all(false);
    bm:watch(
        function()
            return proximity_test(current_sunit)
        end,
        0,
        function()
            blind_attack(current_sunit, pm)
        end,
        current_sunit.name .. "_new_patrol"
    );
end;



-------------------------------------------------------------------------------------------------
------------------------------------------- CUTSCENE --------------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ORDERS -------------------------------------------
-------------------------------------------------------------------------------------------------
ga_battle_chaos_warp_character_name_chs0:attack_on_message("deployment_started");
ga_battle_chaos_warp_army_chs0_unit_chaos_spawn_ror_0:attack_on_message("deployment_started");
ga_battle_chaos_warp_army_chs0_unit_bloodletters :attack_on_message("deployment_started");
ga_battle_chaos_warp_army_chs0_unit_hellcannon_ror_0:defend_on_message("deployment_started",-330,-10,5);
ga_battle_chaos_warp_character_name_chs0:set_invincible_on_message("deployment_started");


-------------------------------------------------------------------------------------------------
------------------------------------------- OBJECTIVES ------------------------------------------
-------------------------------------------------------------------------------------------------

gb:set_objective_on_message("deployment_started", "mission_kraka_drak_chaos_warp_objective_1_tooltip"); --Travel the vast Chaos Abyss
gb:set_objective_on_message("deployment_started", "mission_kraka_drak_chaos_warp_objective_2_tooltip"); -- Defeat the Deamons 

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_3_message", 8000, 500, 1000);
gb:queue_help_on_message("send_demon_1", "mission_kraka_drak_chaos_warp_objective_4_message", 4000, 500, 500);
gb:queue_help_on_message("send_demon_2", "mission_kraka_drak_chaos_warp_objective_5_message", 6000, 500, 500); 
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_6_message", 8000, 500, 60000);
gb:queue_help_on_message("send_demon_4", "mission_kraka_drak_chaos_warp_objective_7_message", 8000, 500, 8000); 
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_8_message", 8000, 500, 105000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_9_message", 8000, 500, 120000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_10_message", 8000, 500, 140000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_11_message", 8000, 500, 170000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_12_message", 8000, 500, 200000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_13_message", 8000, 500, 230000); 
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_14_message", 8000, 500, 260000);
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_15_message", 8000, 500, 300000); 
gb:queue_help_on_message("battle_started", "mission_kraka_drak_chaos_warp_objective_16_message", 8000, 500, 330000); 

-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_3_message	(Rune Lord) "Glory to the Ancestor Gods, Bring down the Ruinous Powers" 	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_4_message	(Nilss:) "What is this sorcery?"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_5_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_6_message	(Nilss:) "This is suicidal and in no way how to run a mercenary band"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_7_message	(Scared Dwarf:) "They coming from behind!!!"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_8_message	(Panicking Dwarf:) "They are everywhere."	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_9_message	(Bloodletter:) "DEATH AND DESPAIR!!! DIE MORTALS!!!"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_10_message	(Terrified dwarf:) "There is too many of them, save yourselves."	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_11_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_12_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_13_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_14_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_15_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE"	true
-- scripted_objectives_localised_text_mission_kraka_drak_chaos_warp_objective_16_message	(Bloodletter:) "BLOOD FOR THE BLOOD GOD, SKULLS FOR THE SKULL THRONE, MILK FOR THE KHORNE FLAKES"	true